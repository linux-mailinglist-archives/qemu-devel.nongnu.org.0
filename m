Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747DC64378E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 23:00:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2JUB-0000Th-Lf; Mon, 05 Dec 2022 16:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2JU9-0000TZ-Gt
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 16:58:49 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2JU4-0008SR-HM
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 16:58:49 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so12953509wmb.2
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 13:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vfIRmBc5Ik6uWBHi+MFwW8ihAZnRqd//V0jkN7OI/DI=;
 b=E9mQtXn8USxfsG+cWCocj0LKiCuXq6zdU207YIgcHnMt8HaI9WhxgPqgJuclEZbWmu
 UbVwg1bZoPwra38a/UxBBaaFwB11DSBeTAd0aDjid+UxC/zvioekJMqS3llnfdi6yfit
 qvm2XH6JjLrh6XjQLdnJ5jq8GSGH5jWmhi02EFas832h6cVa5dd8MhJLrdx/FIKXbj7p
 AtML2yj+7rZe9o4xOoV2f+ms1wAIc9r7VgEM7ObWnZfChmsN3+i2vNC48YjUpKLlcUx7
 lH59paJM6rvfNmIzEcFmSFcPlYn6QZXXZ7JdjoaVtO5/GmLZp51f2z3BekuYhjrrPRav
 +2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vfIRmBc5Ik6uWBHi+MFwW8ihAZnRqd//V0jkN7OI/DI=;
 b=U7BgJwkgLjdPOG70Kw13uWYAlT1e0via+zJPQanrKrXUa8I+0dI6fKZQnxyIJ7usQp
 0a8eYQua1q5+djRvXSBvJC/ekJNUhEtUnOixu73SYfFbbW+KYWVTLLfQ8XRUhmcVQa2J
 qspzF4R/e3HA5eZv8CmfDJBlpC25nChunnvl3qn1wK7t3x4hhjF5Zvz8ujEKYEeatsb5
 Rvom0/4vPe8Qa+Jz+9abKRk8gI9zeFO76DXMmy98aq3Bgi/yC0UeR3jiDbhgyN4dAZqq
 tYM5yxjEQT3eKE+CHPL1PthqERhUV5BwNok1utHEb2E2NZeyDmp56KTNMD+IIxsf/BEj
 VWZg==
X-Gm-Message-State: ANoB5pk/+DWP4hB2MgtVmYUbUHyj8JGDlg+16AZZCqJg6hROQJRgsPOo
 NSIo6v63OvFuyjdu8A955l582g==
X-Google-Smtp-Source: AA0mqf7BYWYvgYeSzNk8WVdzCJS4MeYE9MHMRyVsQKo53G1y3+R5ZPDlTOekpJqzmj8LYDK/BKAUrQ==
X-Received: by 2002:a05:600c:384f:b0:3cf:9377:c76f with SMTP id
 s15-20020a05600c384f00b003cf9377c76fmr49011403wmr.189.1670277522469; 
 Mon, 05 Dec 2022 13:58:42 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a056000004a00b002365730eae8sm15216522wrx.55.2022.12.05.13.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 13:58:42 -0800 (PST)
Message-ID: <68be4619-50a1-83a9-290d-05618002b47d@linaro.org>
Date: Mon, 5 Dec 2022 22:58:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 03/21] i386/kvm: handle Xen HVM cpuid leaves
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
References: <20221205173137.607044-1-dwmw2@infradead.org>
 <20221205173137.607044-4-dwmw2@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221205173137.607044-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi David,

On 5/12/22 18:31, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Introduce support for emulating CPUID for Xen HVM guests via
> xen, xen_vapic as changeable params.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Obtain xen_version from machine property]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/cpu.c     |  2 ++
>   target/i386/cpu.h     |  3 ++
>   target/i386/kvm/kvm.c | 72 +++++++++++++++++++++++++++++++++++++++++++
>   target/i386/xen.h     |  8 +++++
>   4 files changed, 85 insertions(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 22b681ca37..45aa9e40a5 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -7069,6 +7069,8 @@ static Property x86_cpu_properties[] = {
>        * own cache information (see x86_cpu_load_def()).
>        */
>       DEFINE_PROP_BOOL("legacy-cache", X86CPU, legacy_cache, true),
> +    DEFINE_PROP_BOOL("xen", X86CPU, xen, false),

Maybe name it 'xen-hvm'?

> +    DEFINE_PROP_BOOL("xen-vapic", X86CPU, xen_vapic, false),

What happens if we use -cpu host,-kvm,+xen,-xen-vapic ?

Is -cpu host,-kvm,-xen,+xen-vapic meaningful? Otherwise we need to error
out (eventually displaying some hint).

>   
>       /*
>        * From "Requirements for Implementing the Microsoft
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index d4bc19577a..5ddd14467e 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1964,6 +1964,9 @@ struct ArchCPU {
>       int32_t thread_id;
>   
>       int32_t hv_max_vps;
> +
> +    bool xen;
> +    bool xen_vapic;
>   };


