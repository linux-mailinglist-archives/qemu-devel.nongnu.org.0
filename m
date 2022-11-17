Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14E262D7C2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 11:13:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovbsJ-0005QL-8L; Thu, 17 Nov 2022 05:12:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovbsG-0005No-IO; Thu, 17 Nov 2022 05:12:00 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovbsE-0006zq-L2; Thu, 17 Nov 2022 05:12:00 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-13bef14ea06so1622579fac.3; 
 Thu, 17 Nov 2022 02:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tvryLrzQ2pkctkHZW4WED4GTgjw4deE5OCArmHTX1Ho=;
 b=g31jxyym+oOJcRNNiouVpkXN3n6nDo3KtxWZeu4jzb3yK5g5+JsntJswnZk32MtIzO
 mw4KFfrPfAHji2NyK3l7ZGP4whyhSOoJvAL/rbSRQQwM6wmB5QvaoTQYtsbDh4AOuUze
 QUJnBB4lUkFhtG4zDLMmvoNwClAoy5ZmaviO+LDtrVP541MoaSXAFT+uW8ScIP8Kibfr
 0jVhkFF7GsEeqjBV+YF0kPAwiMXkkHi/YLYaPrTv+0ZZ/GewR4q0ejYkYf+dp+oxSflh
 NfJhZVIhKjStxciuSagKXaexBMGXsB7Ypc0UG+GVBma1fiejh7nh8gP6lkXepSHMbHi/
 P9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tvryLrzQ2pkctkHZW4WED4GTgjw4deE5OCArmHTX1Ho=;
 b=xGtvUPStuOSD/L6JnUhL92JvK3gxABKx5xif5JZcxuLfxfZmPh3UukyGGH5eEmxhSY
 0Yqmz0pHir9BQs8cnJ5yrwtHZY1foxAurrMbk19v2oTHg8W3r+MeNbDON9PUjy9p5nRX
 dk00OxkWQ+gtS2sQEycIKDHOauh0L09ja5fhYeHmSVt23IqCFjTyt9FYb+/GQwSR07sh
 v/lYJHdUmzbo1Md+xfFF3VzFrbjg2fXgt5eK2pqq1xOmL77M9HAbizMCSnItmYhQNQYq
 8UC7cLBlS6Q/ejsu5WFdB9IB45ja3W+9XvI7R5iw5Rs5EaPQj2Y2XtNM27ZXXS4/Wlcb
 VaGQ==
X-Gm-Message-State: ANoB5pl6RJXKyqtkf7+p83va3smQA5Rvhk3hX63yv4FO7lboZirsZDQt
 uiI+g4yMfjf4Wv5oYugN+pk=
X-Google-Smtp-Source: AA0mqf6PfOg/Hhq6LA0bCkcdiG39pXc9zw7t9ERqTAMzWA/MsGhqsj8lFArcXG5WvOskngYuBL+rBg==
X-Received: by 2002:a05:6870:b94:b0:131:842a:110c with SMTP id
 lg20-20020a0568700b9400b00131842a110cmr3901868oab.201.1668679916759; 
 Thu, 17 Nov 2022 02:11:56 -0800 (PST)
Received: from [192.168.10.102] ([177.139.31.146])
 by smtp.gmail.com with ESMTPSA id
 b2-20020aca2202000000b0034d9042758fsm127065oic.24.2022.11.17.02.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 02:11:56 -0800 (PST)
Message-ID: <9b92deef-e0ef-101d-8f7e-2b4634bde6de@gmail.com>
Date: Thu, 17 Nov 2022 07:11:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] target/ppc: Fix build warnings when building with
 'disable-tcg'
Content-Language: en-US
To: Vaibhav Jain <vaibhav@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: david@gibson.dropbear.id.au, clg@kaod.org, groug@kaod.org,
 Kowshik Jois B S <kowsjois@linux.ibm.com>
References: <20221116131743.658708-1-vaibhav@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221116131743.658708-1-vaibhav@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next with the following tags:


     Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
     Fixes: 61bd1d2942 ("target/ppc: Convert to tcg_ops restore_state_to_opc")
     Fixes: 670f1da374 ("target/ppc: Implement hashst and hashchk")
     Resolves: https://gitlab.com/qemu-project/qemu/-/issues/377
     Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
     Reviewed-by: Greg Kurz <groug@kaod.org>
     Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
     Tested-by: Kowshik Jois B S <kowsjois@linux.vnet.ibm.com>


Thanks,


Daniel

On 11/16/22 10:17, Vaibhav Jain wrote:
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
>   
>   static bool ppc_cpu_has_work(CPUState *cs)
>   {
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
>   
>   #if !defined(CONFIG_USER_ONLY)
>   

