Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6ED62DE15
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 15:29:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovfsJ-00023P-1u; Thu, 17 Nov 2022 09:28:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovfs5-00022r-J2; Thu, 17 Nov 2022 09:28:07 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovfs3-0003ZU-ON; Thu, 17 Nov 2022 09:28:05 -0500
Received: by mail-oi1-x234.google.com with SMTP id q83so2001040oib.10;
 Thu, 17 Nov 2022 06:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AQzSZWDK6EIuNW/7xsxaVVYkKt/fw6PerIxrd9PGlVU=;
 b=TYfDigcl6SS5y9eX0dZeKMV1IX10z0l+sWrt33GEDDVGDxwj0i1Fpc4OhxYa+nSslF
 hSt6MSkZtgM7VgOShRvcbdPrNwIXjsFgJfadKkjigiFh1zbhM8bixA6l3/hiiBSWDqs/
 oYweNz2iegRwRjn4slsGnScGhJEfzeEcCZX1rvB6cPp+/uYFVLjXYMk+U/A5OAZfS4xt
 bSfsy+2y8kU7jcXEc+kI4x9DmuQnaPJ35Pn9EXTGH3+xQDOxW7rs/zeQbKUeTuKMp1q5
 IIWPPkNvOYmBs1t4cTKCHmRqrjiJQpjJf7FM/skHnx0lXiYxf4xP0KjggLpqtg2J0Vdx
 Ud8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AQzSZWDK6EIuNW/7xsxaVVYkKt/fw6PerIxrd9PGlVU=;
 b=p+7jBnSAj5mY8gax4k+vtEa9wYnFymqWST8VK6eEnkLU+K71zji74yJuwKmtKmR/ov
 q8q+0WN4n620GjH31z0bra2LJv05J+M2smGqfPmkoFJ1TrMbaCOOqIVOLAWC+ZYeBIxZ
 VISprb6uJrUj65JIVIgyurhOiPQev1SqsjJNMIzoD7FKOiimnADWIoedQwVvtzbGot+l
 Q5wZjkfYPlrzjYN0AMPgDds82WGpxDMtUYwGF89lNyNL5rheZBj8iAaFIf/V2iZx4dy2
 v9GXIl6TEw/sXOPdKFZzvWcvBGrPIhXxaiMrqvNh6FVpdBKy5/1pEWOMQlwuVJoRNYt+
 UZ5w==
X-Gm-Message-State: ANoB5pk3iQykyKqeEM2ajn0Kqb5RwcwWf05FlfxlznyndFFIJDjWIjfI
 QP/DutSPOYRBRTlKVoG6BoA=
X-Google-Smtp-Source: AA0mqf5Ge67PD4RUhQs+8TNWwXWPOI1xxHCwdGioWgJfzcQzTuUpEBKq+EBNqZELhpBxVxkTY4a5eg==
X-Received: by 2002:a05:6808:57:b0:344:e634:14c5 with SMTP id
 v23-20020a056808005700b00344e63414c5mr1263556oic.252.1668695282080; 
 Thu, 17 Nov 2022 06:28:02 -0800 (PST)
Received: from [192.168.10.102] ([177.139.31.146])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a9d4782000000b0066193df8edasm367294otf.34.2022.11.17.06.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 06:28:01 -0800 (PST)
Message-ID: <2f4c6e2c-9915-6aba-66c7-f28eee9e52ea@gmail.com>
Date: Thu, 17 Nov 2022 11:27:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] target/ppc: Fix build warnings when building with
 'disable-tcg'
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 Kowshik Jois B S <kowsjois@linux.ibm.com>
References: <20221116131743.658708-1-vaibhav@linux.ibm.com>
 <9b92deef-e0ef-101d-8f7e-2b4634bde6de@gmail.com>
 <20221117115005.4b23a318@bahia>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221117115005.4b23a318@bahia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
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



On 11/17/22 07:50, Greg Kurz wrote:
> On Thu, 17 Nov 2022 07:11:51 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> Queued in gitlab.com/danielhb/qemu/tree/ppc-next with the following tags:
>>
> 
> You are planning a PR before 7.2-rc2, right ?

I'll send it today.

> 
>>
>>       Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>>       Fixes: 61bd1d2942 ("target/ppc: Convert to tcg_ops restore_state_to_opc")
>>       Fixes: 670f1da374 ("target/ppc: Implement hashst and hashchk")
> 
> The guard macro also covers the following two, introduced by yet another commit.
> 
>    HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
>    HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
> 
> Fixes: 53ae2aeb9407 ("target/ppc: Implement hashstp and hashchkp")


Added this tag in-tree as well:


     Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
     Fixes: 61bd1d2942 ("target/ppc: Convert to tcg_ops restore_state_to_opc")
     Fixes: 670f1da374 ("target/ppc: Implement hashst and hashchk")
     Fixes: 53ae2aeb94 ("target/ppc: Implement hashstp and hashchkp")
     Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1319
     Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
     Reviewed-by: Greg Kurz <groug@kaod.org>
     Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
     Tested-by: Kowshik Jois B S <kowsjois@linux.vnet.ibm.com>


Daniel

> 
>>       Resolves: https://gitlab.com/qemu-project/qemu/-/issues/377
> 
> Err... I don't see any relation with this issue.
> 
> Cedric ?
> 
> But this resolves the issue created by Vaibhav for 7.2 :
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1319
> 
>>       Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>>       Reviewed-by: Greg Kurz <groug@kaod.org>
>>       Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>       Tested-by: Kowshik Jois B S <kowsjois@linux.vnet.ibm.com>
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>> On 11/16/22 10:17, Vaibhav Jain wrote:
>>> Kowshik reported that building qemu with GCC 12.2.1 for 'ppc64-softmmu'
>>> target is failing due to following build warnings:
>>>
>>> <snip>
>>>    ../target/ppc/cpu_init.c:7018:13: error: 'ppc_restore_state_to_opc' defined but not used [-Werror=unused-function]
>>>    7018 | static void ppc_restore_state_to_opc(CPUState *cs,
>>> <snip>
>>>
>>> Fix this by wrapping these function definitions in 'ifdef CONFIG_TCG' so that
>>> they are only defined if qemu is compiled with '--enable-tcg'
>>>
>>> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>>> ---
>>>    target/ppc/cpu_init.c    | 2 ++
>>>    target/ppc/excp_helper.c | 2 ++
>>>    2 files changed, 4 insertions(+)
>>>
>>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>>> index 32e94153d1..cbf0081374 100644
>>> --- a/target/ppc/cpu_init.c
>>> +++ b/target/ppc/cpu_init.c
>>> @@ -7015,6 +7015,7 @@ static vaddr ppc_cpu_get_pc(CPUState *cs)
>>>        return cpu->env.nip;
>>>    }
>>>    
>>> +#ifdef CONFIG_TCG
>>>    static void ppc_restore_state_to_opc(CPUState *cs,
>>>                                         const TranslationBlock *tb,
>>>                                         const uint64_t *data)
>>> @@ -7023,6 +7024,7 @@ static void ppc_restore_state_to_opc(CPUState *cs,
>>>    
>>>        cpu->env.nip = data[0];
>>>    }
>>> +#endif /* CONFIG_TCG */
>>>    
>>>    static bool ppc_cpu_has_work(CPUState *cs)
>>>    {
>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>>> index a05a2ed595..94adcb766b 100644
>>> --- a/target/ppc/excp_helper.c
>>> +++ b/target/ppc/excp_helper.c
>>> @@ -2842,6 +2842,7 @@ void helper_td(CPUPPCState *env, target_ulong arg1, target_ulong arg2,
>>>    #endif
>>>    #endif
>>>    
>>> +#ifdef CONFIG_TCG
>>>    static uint32_t helper_SIMON_LIKE_32_64(uint32_t x, uint64_t key, uint32_t lane)
>>>    {
>>>        const uint16_t c = 0xfffc;
>>> @@ -2924,6 +2925,7 @@ HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
>>>    HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
>>>    HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
>>>    HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
>>> +#endif /* CONFIG_TCG */
>>>    
>>>    #if !defined(CONFIG_USER_ONLY)
>>>    
> 

