Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486A562C27D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 16:28:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovKKd-0004Gc-3N; Wed, 16 Nov 2022 10:28:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovKKa-0004En-Ca
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 10:28:04 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovKKY-0004Iv-F2
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 10:28:03 -0500
Received: by mail-ej1-x62c.google.com with SMTP id gv23so12209955ejb.3
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 07:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hp9lt90trerpDanMLb9S4g2mYjMqUVh8HeQ5OoJ6uCQ=;
 b=KfSbQeSE/NRu2qCoKzbg2fA5yERhuhPjHjacfAqg9sogaUn+VZtC9gLhtJVyb/9+Ni
 57lhaowmUo7dBTlknSY8jLuJkQAA0Eq3VeDxV1Hb69ENrP9H2ACJ5+rgZ6ImxD2VOeMI
 DfEZyl4e4jg3oKbGCDn7rCRJgiWmT2yk7QsYWq768uUtCj4GpWJKQo+uPLpf9b7jZ3j1
 NoqzcF+ud8Oau+R/JrfzBNnQWuTWw8f2YKfBSMf/W8hGG5MJ0iMm5wNHGNXhclKgvPGW
 ohZMQxDI127xq3CGSKveaVCnAMC6XHlgX0TnoWQ/c7b+3AUfJMg70lBqYkxIahLKmIl+
 B0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hp9lt90trerpDanMLb9S4g2mYjMqUVh8HeQ5OoJ6uCQ=;
 b=bmiZcU2OkFD6udurUPlPoVR+O6B5n780aVRQOPY8r5zlRjmLUc6dI1JiXNMKxM36Kd
 AUe6nAwIlpOaA/LtEho2Bnc6QVLk6kJlxYVs5RoSsJb6v8RgY/rmPZWYVbSDMbAW8XUb
 kQX+gd2jryK2WL7x4QHdt2EWdsTOpygVZytV2fs057YYGNPgtN5fHkvdInLJ3sHXQgJK
 uMNxumEBWypgkMpBTf2JB9FJj9RPTrMO4S33Y66s1sWe0agZp86z2Xm4zjZLfewF6WKa
 UpZEzwckjUvYyRXUjvbkUuOMjUli7JA4wChd8q7NdeeI+tklt+iwh7QxhYn95R9/93J0
 7KAQ==
X-Gm-Message-State: ANoB5pm9m4J3S3Lzxaew5mpd25UEZJPYmDaN9zwFxUwbZpHbOmFayEzF
 3d2awjv5NYs5JUKvenxpCr1Caw==
X-Google-Smtp-Source: AA0mqf5bFo/7n4ozSAmA1mNvveDSbe5UgHa/pizlOvRa3LTRWAaRvyza22/et7J+vLK2AYaCmotIvg==
X-Received: by 2002:a17:906:74cb:b0:78d:acf7:86a1 with SMTP id
 z11-20020a17090674cb00b0078dacf786a1mr18642451ejl.21.1668612481090; 
 Wed, 16 Nov 2022 07:28:01 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906218200b007aed2057ea1sm6397172eju.167.2022.11.16.07.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 07:28:00 -0800 (PST)
Message-ID: <ac030320-2c3f-dd7d-8786-b845ce21f1f8@linaro.org>
Date: Wed, 16 Nov 2022 16:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH-for-7.2] target/ppc: Fix build warnings when building with
 'disable-tcg'
Content-Language: en-US
To: Vaibhav Jain <vaibhav@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: david@gibson.dropbear.id.au, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, groug@kaod.org,
 Kowshik Jois B S <kowsjois@linux.ibm.com>
References: <20221116131743.658708-1-vaibhav@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221116131743.658708-1-vaibhav@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 16/11/22 14:17, Vaibhav Jain wrote:
> Kowshik reported that building qemu with GCC 12.2.1 for 'ppc64-softmmu'
> target is failing due to following build warnings:
> 
> <snip>
>   ../target/ppc/cpu_init.c:7018:13: error: 'ppc_restore_state_to_opc' defined but not used [-Werror=unused-function]
>   7018 | static void ppc_restore_state_to_opc(CPUState *cs,
> <snip>
> 
> Fix this by wrapping these function definitions in 'ifdef CONFIG_TCG' so that
> they are only defined if qemu is compiled with '--enable-tcg'
> 
> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>   target/ppc/cpu_init.c    | 2 ++
>   target/ppc/excp_helper.c | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 32e94153d1..cbf0081374 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7015,6 +7015,7 @@ static vaddr ppc_cpu_get_pc(CPUState *cs)
>       return cpu->env.nip;
>   }
>   
> +#ifdef CONFIG_TCG
>   static void ppc_restore_state_to_opc(CPUState *cs,
>                                        const TranslationBlock *tb,
>                                        const uint64_t *data)
> @@ -7023,6 +7024,7 @@ static void ppc_restore_state_to_opc(CPUState *cs,
>   
>       cpu->env.nip = data[0];
>   }
> +#endif /* CONFIG_TCG */

Oops sorry.

Fixes: 61bd1d2942 ("target/ppc: Convert to tcg_ops restore_state_to_opc")

> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index a05a2ed595..94adcb766b 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -2842,6 +2842,7 @@ void helper_td(CPUPPCState *env, target_ulong arg1, target_ulong arg2,
>   #endif
>   #endif
>   
> +#ifdef CONFIG_TCG
>   static uint32_t helper_SIMON_LIKE_32_64(uint32_t x, uint64_t key, uint32_t lane)
>   {
>       const uint16_t c = 0xfffc;
> @@ -2924,6 +2925,7 @@ HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
>   HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
>   HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
>   HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
> +#endif /* CONFIG_TCG */

Fixes: 670f1da374 ("target/ppc: Implement hashst and hashchk")

Hmm this is another fix... You could split your patch in 2,
but not a big deal. Regardless:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


