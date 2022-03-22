Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F74E44D0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 18:14:30 +0100 (CET)
Received: from localhost ([::1]:49374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWi5V-0006YL-0y
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 13:14:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWi3u-0004xG-NA
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:12:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWi3s-00050K-Dj
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647969166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=suzVEHh852gcSLEAfwPXNVYJjB8hmQJagK6I7da3wFQ=;
 b=MxVMYn6hbPCBzYBZadLrRdbf1DBAGFLNvfr7/TwuYwGO5Jdwrj0+OivkyfKGov0cqR2SgK
 7nzFmvRyw2w2LS431gYdYNdcabkdJMaXFbgTWXYgFyy6aN6MqtZ2yfBjVjBaROjnRsXgzd
 KTBJiAD2pMQsk7SAErYx0JKSWUF1MK4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-0IifRPtNPMKidWT3dEsgxA-1; Tue, 22 Mar 2022 13:12:45 -0400
X-MC-Unique: 0IifRPtNPMKidWT3dEsgxA-1
Received: by mail-ej1-f69.google.com with SMTP id
 13-20020a170906328d00b006982d0888a4so8977190ejw.9
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 10:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=suzVEHh852gcSLEAfwPXNVYJjB8hmQJagK6I7da3wFQ=;
 b=ALYccvOnBSQFH43JXZAWADRGpM0J/THJtQXvT6yucz3QUsK1p8RCXx1D9gyJblHvK5
 L63EgwYQQc/Y+NemvOrPcwQPnFRbK8BivEUQSbq+avav27f+L0vtUeHvpPm15227VLWb
 VeEoyMQgNdR39qmcR0ie9Qgjdq6t6jtX8uzDh26O/I48Lk9e0+DijlglnuMgrItw4Syw
 SpnZ+zNbVa7K3nDQSzof62fkSo8fHw6ynJ/IF90Fh2rF3bStnZpHdPmgUWhzCDzpSIjV
 xEx5+tXC+mtTIinZZmGhYQC0fF3xEfAC22acGt97u9poyI+RZmklsjKBi6yDsMFbO1Ng
 KGog==
X-Gm-Message-State: AOAM532Er8Cxh5SrGEgYeWjtWIf8XiGkeePXxh5K51r2wW9dGF3dMqhF
 TnzZCqj2nYRGg2JnjIHZexOJ3TlJgnivaZ2/xCkcbtB74dwYVzB8PumiCuyq3EgXL+OuCBamvHO
 JWvTsZQ8zvfPgi/8=
X-Received: by 2002:a05:6402:90c:b0:415:d340:4ae2 with SMTP id
 g12-20020a056402090c00b00415d3404ae2mr29803551edz.331.1647969164144; 
 Tue, 22 Mar 2022 10:12:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRo49UlcUTt5+P6RB+D/lgVOnkOr0qq3aAIMjpFgbZxW+hBBYZPExk/xIxeLwBBfMRD4cf8A==
X-Received: by 2002:a05:6402:90c:b0:415:d340:4ae2 with SMTP id
 g12-20020a056402090c00b00415d3404ae2mr29803522edz.331.1647969163880; 
 Tue, 22 Mar 2022 10:12:43 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a056402238b00b00419181bb171sm5794151eda.38.2022.03.22.10.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 10:12:43 -0700 (PDT)
Message-ID: <ec0c04b1-9964-991c-a49b-29ce9119c410@redhat.com>
Date: Tue, 22 Mar 2022 18:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/15] iotests/040: Don't check image pattern on
 zero-length image
To: John Snow <jsnow@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-5-jsnow@redhat.com>
 <df38293e-2b72-7678-e684-398514fce655@redhat.com>
 <CAFn=p-Z-JADwHe9oV9s8eg=9gPHVejYCUw=3=x3PkpxJBTxs+w@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-Z-JADwHe9oV9s8eg=9gPHVejYCUw=3=x3PkpxJBTxs+w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.03.22 17:19, John Snow wrote:
>
>
> On Tue, Mar 22, 2022, 10:22 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
>     On 18.03.22 21:36, John Snow wrote:
>     > qemu-io fails on read/write with zero-length raw images, so skip
>     these
>     > when running the zero-length image tests.
>     >
>     > Signed-off-by: John Snow <jsnow@redhat.com>
>     > ---
>     >   tests/qemu-iotests/040 | 14 ++++++++++++--
>     >   1 file changed, 12 insertions(+), 2 deletions(-)
>
>     Doesn’t look specific to zero-length images, but the fact that we
>     do I/O
>     beyond the image size, i.e. any image below 1 MB would be affected.
>
>     Anyway, the zero-length image is the only one tested with a size
>     of less
>     than 1 MB, so this works.
>
>     Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
>
> (Check the cover letter, too - this patch is still good, but iotest 
> 040 still fails and I'm not 100% clear as to why.)

Sure, but I didn’t see anything wrong with the patch, so...

 From a glance, I believe the problem to be that the commit job changed 
one image’s backing file string to contain a JSON description of a block 
graph including a throttle node.  The accompanying throttle group of 
course doesn’t exist outside of qemu, so qemu-io complains.

We never noticed because we just checked for “pattern verification 
failed”, which isn’t in the error message, so this was a pass.  I’ll 
take a closer look.

Hanna


