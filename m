Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE48418754
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 10:22:24 +0200 (CEST)
Received: from localhost ([::1]:43310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUPQV-000843-2D
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 04:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUPOG-00064B-8t
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 04:20:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUPOB-000605-V5
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 04:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632644397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AEJGRu8mx5QBmAi+TP8wIvj37sqC9NUtFKeB8LXehU0=;
 b=WLCJnED7gQA/YtQGh/7nl0tZ3HAHvNZk3pkbPdAVGS3V/0AFTMlsV8SknFb1giCSeCg1GS
 PXR6+7Wrdrlk6qbMMC8fNutbf06iMHSReERKUgZVmNIcHas2la0OCb7L07TidVVG9pJAAF
 0e9vHUcjHABYH/cOHoLPzCbUmIBft3Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-8dsqv_XgPpGF-JCZfP49Vw-1; Sun, 26 Sep 2021 04:19:55 -0400
X-MC-Unique: 8dsqv_XgPpGF-JCZfP49Vw-1
Received: by mail-wr1-f70.google.com with SMTP id
 c15-20020a5d4ccf000000b0015dff622f39so11771401wrt.21
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 01:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=AEJGRu8mx5QBmAi+TP8wIvj37sqC9NUtFKeB8LXehU0=;
 b=1OZ4DeFIJhL81cUy3FUk06PD16gnADDrkFhDgbNuJymvKrh1XTSx7fO61r+Wd6P2bj
 RBVCNaJKhAFpCru0c/zkhifYewCjQwHEbeR1JCR1k8nlS9VTAtF0zG7ob9FeGyGLgmUI
 5PArnqB1weAZQ2Ql9hZRuI4L8GL4AdevFdk+GMU2u8UnwSRCLnBobujSue+B09Wwtz8r
 CpBYGCZ/FeF2PN/H+qC2rXfoByRLZh59kg+Bu0t7UgxX0NEFxRVl4gfyq+jzQXnOiH/m
 JjIiRp4xi75HmU1x7bJQq7nEBK6Vw4c3J+vse29zP6BL9SWV/+QTXP+kJDctwbq89gHE
 TttA==
X-Gm-Message-State: AOAM531sbqVdBmdSpZs6u9nGPUWs+7peVEjFmN/YP/AsVp4HIG0lKGIs
 ZeuXOCUNN7RIBD00U/bRQKoyNsbq9w773mYuRJUdloZGxicPzGYZqIpdF2gA0eNWVJAZNed19mp
 q0g/34z8qWt8+iTM=
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr10648118wmh.140.1632644394747; 
 Sun, 26 Sep 2021 01:19:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFp13QRF7FN9nU+yfYfRtnmBkX18jEZr1B3Gs//WCj6LVpj80O7cqvodsig9543UU0QXT9ZA==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr10648102wmh.140.1632644394537; 
 Sun, 26 Sep 2021 01:19:54 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id m4sm17731167wml.28.2021.09.26.01.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 01:19:54 -0700 (PDT)
Message-ID: <967aac35-e202-1fae-6e5a-e3b781a62c17@redhat.com>
Date: Sun, 26 Sep 2021 10:19:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] configure: Loosen GCC requirement from 7.5.0 to 7.4.0
To: nia <nia@NetBSD.org>, qemu-devel@nongnu.org
References: <YVAfpt8k8BHsN2Ln@homeworld.netbsd.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YVAfpt8k8BHsN2Ln@homeworld.netbsd.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.482,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Daniel & Thomas.

On 9/26/21 09:22, nia wrote:
> As discussed in issue 614, we're shipping GCC 7.4.0 as the
> system compiler in NetBSD 9, the most recent stable branch,
> and are still actively interested in QEMU on this platform.
> 
> The differences between GCC 7.5.0 and 7.4.0 are trivial.
> 
> Signed-off-by: Nia Alarie <nia@NetBSD.org>
> ---
>  configure | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 1043ccce4f..f918ad67a1 100755
> --- a/configure
> +++ b/configure
> @@ -2094,8 +2094,8 @@ cat > $TMPC << EOF
>  #  endif
>  # endif
>  #elif defined(__GNUC__) && defined(__GNUC_MINOR__)
> -# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 5)
> -#  error You need at least GCC v7.5.0 to compile QEMU
> +# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 4)
> +#  error You need at least GCC v7.4.0 to compile QEMU
>  # endif
>  #else
>  # error You either need GCC or Clang to compiler QEMU
> 


