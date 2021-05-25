Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30F03903E1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:27:15 +0200 (CEST)
Received: from localhost ([::1]:60820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llY1a-0002Nb-BC
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llY0b-0001Ub-75
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:26:13 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:45578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llY0X-0006fU-VB
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:26:12 -0400
Received: by mail-pg1-x52e.google.com with SMTP id q15so22862895pgg.12
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 07:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D4gEn732/upUSnSjI507uumca/XF+d9QlYR30sJQbRU=;
 b=e24VsKk+RYwmnXNKhrpewDHy1QQVPIo9AaS5JFVgHCqB8YGxVYG8h0+w3U8rLIqAvx
 9L2kPfXQQ63xZT22T3c87pGXxsF1WNmZKTd8hWvZPZw3E61GLxDsDxyrOEagMa1vWbzN
 bXVakKKnOKqg8aWlurh47p7q5EjQlMBvxytF+2crrChrwxJErchoYMvgx0ktYpRIa66S
 WvqHGj953Kpi1zg+CP6SbFFr15zq3x9fv9/lI9uGxJri9zCgWqly0ogwkI5ZwIwOsAdE
 PT2AUVSfPhE9wAQwPI4xiH1Wgo5P9E5I9sh4p77a0ZbOonJVl+kgKuN64KQbz8J+RCXV
 Pfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D4gEn732/upUSnSjI507uumca/XF+d9QlYR30sJQbRU=;
 b=pkhfhh6LOaFvej6lgOZzHgHi4FXL6XWQ2gKf/3qUwpCAOwa6Svbnn0SLxgNzeEiRxz
 dypdHbmybHBhTYbSIujS+bgVv3RWq1Qd2In7SbltvSZXdKmQMnY1Sc59fUPAfyZpMpjb
 yliixwq3wHs3nxJX5twq5JCLhJNTkMUNoVKgNdUQC8vGyKOGsvZISLYqpIbG9Jq7fWgo
 GKr51aSWY9+J/XzhDfomca2jSNJj5e9EvB3j3nM8UzojJwBEPCa1OO+DyLSgQquDjAdW
 vP1CfORvbbs0Tmo8agzwTAfcwKDWgvmNKFDhx+W6ja3AzutlvwfwmLfuCFE9x2HNe8tC
 XWNw==
X-Gm-Message-State: AOAM531SCoPHulWJcEP/UDrhMH0WRcZr9a6Itk8JEFMR1kIb5jlePmEK
 qvJqEVBahjNqBdCNYh7r76yGUw==
X-Google-Smtp-Source: ABdhPJz77BOld3lfgIH88DIjXM2dUoDgmfUFmezdG8qVaMK2eH5tA7+NPBBbFuwMzavh+u6isdz5Rg==
X-Received: by 2002:a05:6a00:134b:b029:2bf:2c30:ebbd with SMTP id
 k11-20020a056a00134bb02902bf2c30ebbdmr30509790pfu.74.1621952768415; 
 Tue, 25 May 2021 07:26:08 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k9sm14510552pgq.27.2021.05.25.07.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 07:26:07 -0700 (PDT)
Subject: Re: [PATCHv2] target/arm: make pointer authentication a switchable
 feature
To: Jamie Iles <jamie@nuviainc.com>, qemu-arm@nongnu.org
References: <c1bf2744-0448-51c4-551a-779f00af5a2e@linaro.org>
 <20210525090104.1761645-1-jamie@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f0f46eb5-409b-9f27-621b-b23d55848279@linaro.org>
Date: Tue, 25 May 2021 07:26:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525090104.1761645-1-jamie@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, leif@nuviainc.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 2:01 AM, Jamie Iles wrote:
> Rather than having pointer authentication properties be specific to the
> max CPU type, turn this into a generic feature that can be set for each
> CPU model.  This means that for future CPU types the feature can be set
> without having the ID_AA64ISAR1 bits clobbered in
> arm_cpu_pauth_finalize.  This also makes it possible for real CPU models
> to use the impdef algorithm for improved performance by setting
> pauth-impdef=on on the command line.
> 
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Jamie Iles <jamie@nuviainc.com>
> ---
> 
> Following Richard's suggestion to make impdef selectable for all CPUs
> where pointer auth is supported, I've moved this up to a full feature
> and then any future CPUs supporting pointer auth can just set
> ARM_FEATURE_PAUTH.

New patches should not be in-reply-to another thread.
They get lost that way.

>       bool prop_pauth;
>       bool prop_pauth_impdef;
> +    bool has_pauth;

What's this for?  It doesn't even seem to be used in this patch.

> @@ -2115,6 +2116,7 @@ enum arm_features {
>       ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
>       ARM_FEATURE_M_MAIN, /* M profile Main Extension */
>       ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
> +    ARM_FEATURE_PAUTH, /* has pointer authentication support */
>   };
>   
>   static inline int arm_feature(CPUARMState *env, int feature)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index f42803ecaf1d..5a4386ce9218 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -760,10 +760,7 @@ static void aarch64_max_initfn(Object *obj)
>           cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
>           cpu->dcz_blocksize = 7; /*  512 bytes */
>   #endif
> -
> -        /* Default to PAUTH on, with the architected algorithm. */
> -        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
> -        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
> +        set_feature(&cpu->env, ARM_FEATURE_PAUTH);

I would rather you split out a function akin to aarch64_add_sve_properties, 
e.g. aarch64_add_pauth_properties.  We would call this function in any 
cpufoo_initfn that enables pauth.  It is hard to say more without the patch 
that adds the cpufoo_initfn which you are interested in.


> +    /* Default to PAUTH on, with the architected algorithm. */
> +    if (arm_feature(&cpu->env, ARM_FEATURE_PAUTH)) {

FWIW, this test is

     cpu_isar_feature(aa64_pauth, cpu)

without having to add ARM_FEATURE_PAUTH.


r~

