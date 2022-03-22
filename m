Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394014E3C0F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:59:17 +0100 (CET)
Received: from localhost ([::1]:45288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbIJ-0005Qv-SK
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:59:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWbFP-0003G9-1t
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:56:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWbFN-0003Jb-G2
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647942972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UJ1bP2LjyDhM8XgBEvEzvrFGJIrpUZ6VX4gLFKZfprg=;
 b=DHdevGOcSEdsGrlHmsGrZrBk94vP5atLqAmmMJglZl8NJg9kwyajeAOiHeTcu+V/P9uiNl
 6J4RLbywXQ5aRGu0b8TvXDUc3WOny/j0hM/9SO6jcVv7WbXIwMvF7aEXEBg/EB3k95n+kt
 pVvtMB/hVyO608hPRVuguC9WjUXHAoU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-CjFn7fuUPdmf7HxhnAD0eQ-1; Tue, 22 Mar 2022 05:56:11 -0400
X-MC-Unique: CjFn7fuUPdmf7HxhnAD0eQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 q185-20020a1c43c2000000b0038c9d85915bso2478856wma.0
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 02:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UJ1bP2LjyDhM8XgBEvEzvrFGJIrpUZ6VX4gLFKZfprg=;
 b=1j5Rv9A+UQiBIE2JixS0rHenLVaW/KQO9bz94aJODTjmX/dAi6ceojXhwcWjuT7+gu
 aOonbjMGseRmkQv/9RTnkgMQrGotDN1fQoOnC/B/VpFe1t8IWhyUHNawjCWRY/IgX4eR
 kVzpVPq/CrJzMnRWIi3cQPPt5TfLnIpG8Rek7mBb1gTdQqx4+617bMoT3M2UJGjkWF1q
 e83pSgdc13udOgnWE69I3UAtZOY93kpJhdLwA67emJ40h/aVCFdkFM6QQUZB99KdXdlj
 FutSGNEhUV0+Qw/ad7VDU2ScdXNFEmtZlksTmOEsv0rtPtLpy6uIxNn7l4EuzvpLruVg
 YWEQ==
X-Gm-Message-State: AOAM530mOep2K/YPazBgsyugRAMEHT6c1PGZlH0Rx/1wvdLtcLcwb6Gk
 kXxI0Vo4qDsT5qRB1A5BYK3VahQC/NAoR0iVYTNLZDp7jH74FehzxcSYxT9W76E8VGkgnzzAsXy
 /Ea4SCFJZyP9NY4o=
X-Received: by 2002:a1c:f315:0:b0:381:1f6d:6ca6 with SMTP id
 q21-20020a1cf315000000b003811f6d6ca6mr2992044wmq.25.1647942970122; 
 Tue, 22 Mar 2022 02:56:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx08gtwPCr0iXncjGWI49bvbHm+3lC3CEcxREt9nIdkP0f+E8BDcYdjOtXOFHg0CiDLjbsZ6w==
X-Received: by 2002:a1c:f315:0:b0:381:1f6d:6ca6 with SMTP id
 q21-20020a1cf315000000b003811f6d6ca6mr2992021wmq.25.1647942969846; 
 Tue, 22 Mar 2022 02:56:09 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm12204439wru.99.2022.03.22.02.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 02:56:09 -0700 (PDT)
Message-ID: <378c40f1-abe9-e982-e64e-3d155db0016d@redhat.com>
Date: Tue, 22 Mar 2022 10:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 0/3] iotests: Check for zstd support
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220302124540.45083-1-hreitz@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220302124540.45083-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/03/2022 13.45, Hanna Reitz wrote:
> Hi,
> 
> v1 cover letter:
> 
> https://lists.nongnu.org/archive/html/qemu-devel/2022-02/msg04592.html
> 
> We have two tests (as far as I know) that use compression_type=zstd for
> qcow2 but do not check whether that is actually supported.  Thomas
> reported this for 065, but it’s also the case for 303.
> 
> This series makes 303 be skipped when zstd is not compiled in, and has
> 065 use zlib for each of its test cases then (it was made to use zstd
> just to improve on coverage, so using zlib as a fallback is perfectly
> fine).
> 
> v2:
> - Add the first patch so that 065 and 303 can use these new iotests.py
>    functions to check for zstd support instead of checking for their own
>    qemu-img create’s output
> - Have 065 fall back to zlib instead of skipping zstd test cases
> 
> 
> Hanna Reitz (3):
>    iotests.py: Add supports_qcow2_zstd_compression()
>    iotests/065: Check for zstd support
>    iotests/303: Check for zstd support
> 
>   tests/qemu-iotests/065        | 24 ++++++++++++++++++------
>   tests/qemu-iotests/303        |  4 +++-
>   tests/qemu-iotests/iotests.py | 21 +++++++++++++++++++++
>   3 files changed, 42 insertions(+), 7 deletions(-)

Thanks, this fixes the failures of 065 and 303 on my system!

Series
Tested-by: Thomas Huth <thuth@redhat.com>


