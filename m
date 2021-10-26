Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D66743B081
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:51:06 +0200 (CEST)
Received: from localhost ([::1]:44966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfK2r-0006rX-6L
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfJk8-0006ur-NG
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfJk6-00053f-Q5
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635244302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i3/BscpYI2n8tFeE0mLcWLjMN2uUfipj4/IiuCmMWNo=;
 b=jWeEgxOkq8k1ESoUSEVH+gmGPPeg4fuVoFLgLABiPWCA3tN7086uZJRdBD+8WkA4Kxou96
 VCIV9U5Ax0KsTZOjuovq93O6Al8xQdWZAD8zJOF4mlYNEU+MhIbKHfj1H1UcV8cgTBrakV
 gBSl/Cbl6KyOGRIclcRJUB0AtrTGSwY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-jUSnVk0KNQGaSRKUiPiciQ-1; Tue, 26 Oct 2021 06:31:41 -0400
X-MC-Unique: jUSnVk0KNQGaSRKUiPiciQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 u14-20020a05600c19ce00b0030d8549d49aso517309wmq.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i3/BscpYI2n8tFeE0mLcWLjMN2uUfipj4/IiuCmMWNo=;
 b=7JTAdwLH23G7M/muNmlJlJoN8HeqZyJ6r3AYoNI3UlTfFKgNHd+peGsVXxwrGFQMK7
 Rlp2fnictC2Zp0qaSvYlIe2cPv4dF1y4racPiFvH3z9ORXy3A/z4rWBBYQbfqQldePok
 V/ecQHR9ZWrWBDkPXY8fyEjrU9mosyZRLXXnaDfwOHR1K4pNTroD2DNwBCqtdIKKzQ0u
 Vhwt3jdlNDZ8e+LiDFx5VJTl17mY3w4/YJy/ezIlAaUNH6H+cZtJ+pKqsARV4NHd1qE5
 fBGpiXNGOgVMwgJhIjpOerq1x0SxhTK7ocsEQh4DPfQ8HXmip/NOfY9AZid50XTGc3cN
 Ekpw==
X-Gm-Message-State: AOAM533WAdmW5jkFC4dIbK/17/Zi3CbzP0939mTf/IMexYGgRJyn4tE5
 aR8jFLjGCwoJIpuGlRwcxPcGM8sjekMFHbntu26OuAvVMPCBikKW1Toy+HMgFZkoA+dRGpUKscF
 Xch3KwJPsvwmU8gQ=
X-Received: by 2002:a1c:98d2:: with SMTP id
 a201mr22272068wme.113.1635244299651; 
 Tue, 26 Oct 2021 03:31:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRz7s3dULpsAJdnFj/NrKv6IvUVa/N849TKjv+WSBtMtHLX9AFslYj9qcmvwXa0l7gVLnlZA==
X-Received: by 2002:a1c:98d2:: with SMTP id
 a201mr22272058wme.113.1635244299501; 
 Tue, 26 Oct 2021 03:31:39 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id q123sm205212wma.20.2021.10.26.03.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 03:31:39 -0700 (PDT)
Message-ID: <b1eec644-cf47-258e-5a4c-171f998aaea9@redhat.com>
Date: Tue, 26 Oct 2021 12:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] block-backend: Silence clang -m32 compiler warning
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211026090745.30800-1-hreitz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211026090745.30800-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 11:07, Hanna Reitz wrote:
> Similarly to e7e588d432d31ecebc26358e47201dd108db964c, there is a
> warning in block/block-backend.c that qiov->size <= INT64_MAX is always
> true on machines where size_t is narrower than a uint64_t.  In said
> commit, we silenced this warning by casting to uint64_t.
> 
> The commit introducing this warning here
> (a93d81c84afa717b0a1a6947524d8d1fbfd6bbf5) anticipated it and so tried
> to address it the same way.  However, it only did so in one of two
> places where this comparison occurs, and so we still need to fix up the
> other one.
> 
> Fixes: a93d81c84afa717b0a1a6947524d8d1fbfd6bbf5
>        ("block-backend: convert blk_aio_ functions to int64_t bytes
>        paramter")
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  block/block-backend.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


