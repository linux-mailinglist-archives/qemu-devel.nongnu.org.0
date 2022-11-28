Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4219E63B358
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 21:36:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozkrJ-0008Fl-34; Mon, 28 Nov 2022 15:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ozkr7-0008FE-B5; Mon, 28 Nov 2022 15:36:01 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ozkr5-0003iv-Iu; Mon, 28 Nov 2022 15:35:57 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-142612a5454so14524694fac.2; 
 Mon, 28 Nov 2022 12:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+Bh4YGv3HVp9cmE15NmTekU65/Dd+CJmE+9jEztWD94=;
 b=pq4ZpwXlJcdNxyfBortykaZH0T2V/FuiKcA5FVMdTT3PEUcHBm+mV3Nqkqsu+QNdnc
 dmc5EH/2y2VaN7hiipB4VcJjuaJoHENJmlFc548ts0RWb9P8xKTKmyGyVepF4GWsO3sS
 ZoRW4Nexs7Zz6hZRHojDSZAGAPw+f1WiAIVdug6G8c/njNRyKs2ZHFr1HjCr259y9rY3
 uObd8AgbUzrJreXzn1dDn+58q23V1pY4qPpEkuIcFiplJby5ICz0kQd8mhTEliQhn04l
 YX+iSaqJHh+DRp7uVr/B2VunJnD/i1Xq+Fkleo7ASPqQj3qArx1nI4FN9VhnsRbsQrL9
 zfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Bh4YGv3HVp9cmE15NmTekU65/Dd+CJmE+9jEztWD94=;
 b=dp+tiSgrqGoK9KFxofRrs0/+gyO31zpn5mFxxYiyCsoWnI+2A9jdAyp0PWpIwmvG26
 LvuEi5sZ+ESDzSjf5R9mrsP5qcaqrhWZNErB8ifbDDCUHhl44+Y9YxrRvqU8VOtTUh4m
 n/sORDvvxMgoEGlgTHuKn4/2zO3oIDn/QzkO6iAPNAL9XO6dIOij6QjlHSM3sSVo6Tc2
 jFUZTKxns8t67ab4coWGD/DAWREJr7prr6JhlTGnrZNtvvAs4yI9ZELPt1wF+e1J/FQ9
 Bw5Gamg6HyaQYnz6kWoSs3ObGSy6Mz1hoZjloEQQDbH8japdanX4O6uMQjFd0mcYcNjs
 9iJw==
X-Gm-Message-State: ANoB5pnBBueCqd4YQi7+S5OoW39Q7wNTHQNy5Lw4jKcDqwkbAcemssc+
 NVKmlSxCjoa81vee14SKkZw=
X-Google-Smtp-Source: AA0mqf5owXWhqEj12MvHX/TrOY1oUi+PW0d1FFQaV+p47rB5+0LasxrwJJRl3vh5uzHvtF8D0Me+pQ==
X-Received: by 2002:a05:6870:2186:b0:143:733e:84e3 with SMTP id
 l6-20020a056870218600b00143733e84e3mr10222262oae.95.1669667753849; 
 Mon, 28 Nov 2022 12:35:53 -0800 (PST)
Received: from [192.168.10.102] (189-68-154-53.dsl.telesp.net.br.
 [189.68.154.53]) by smtp.gmail.com with ESMTPSA id
 c26-20020aca1c1a000000b0035ba52d0efasm2438195oic.52.2022.11.28.12.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 12:35:53 -0800 (PST)
Message-ID: <bd0febd5-2ee5-e0af-77f4-85fe1bb4699f@gmail.com>
Date: Mon, 28 Nov 2022 17:35:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] target/ppc: Check DEXCR on hash{st, chk} instructions
Content-Language: en-US
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 groug@kaod.org, victor.colombo@eldorado.org.br
References: <20221124055143.752601-1-nicholas@linux.ibm.com>
 <20221124055143.752601-3-nicholas@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221124055143.752601-3-nicholas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.257,
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



On 11/24/22 02:51, Nicholas Miehlbradt wrote:
> Adds checks to the hashst and hashchk instructions to only execute if
> enabled by the relevant aspect in the DEXCR and HDEXCR.
> 
> This behaviour is guarded behind TARGET_PPC64 since Power10 is
> currently the only implementation which has the DEXCR.
> 
> Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
> ---

LGTM

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/excp_helper.c | 58 +++++++++++++++++++++++++++++-----------
>   1 file changed, 43 insertions(+), 15 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 94adcb766b..add4d54ae7 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -2902,29 +2902,57 @@ static uint64_t hash_digest(uint64_t ra, uint64_t rb, uint64_t key)
>       return stage1_h ^ stage1_l;
>   }
>   
> +static void do_hash(CPUPPCState *env, target_ulong ea, target_ulong ra,
> +                    target_ulong rb, uint64_t key, bool store)
> +{
> +    uint64_t calculated_hash = hash_digest(ra, rb, key), loaded_hash;
> +
> +    if (store) {
> +        cpu_stq_data_ra(env, ea, calculated_hash, GETPC());
> +    } else {
> +        loaded_hash = cpu_ldq_data_ra(env, ea, GETPC());
> +        if (loaded_hash != calculated_hash) {
> +            raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
> +                POWERPC_EXCP_TRAP, GETPC());
> +        }
> +    }
> +}
> +
>   #include "qemu/guest-random.h"
>   
> -#define HELPER_HASH(op, key, store)                                           \
> +#ifdef TARGET_PPC64
> +#define HELPER_HASH(op, key, store, dexcr_aspect)                             \
>   void helper_##op(CPUPPCState *env, target_ulong ea, target_ulong ra,          \
>                    target_ulong rb)                                             \
>   {                                                                             \
> -    uint64_t calculated_hash = hash_digest(ra, rb, key), loaded_hash;         \
> -                                                                              \
> -    if (store) {                                                              \
> -        cpu_stq_data_ra(env, ea, calculated_hash, GETPC());                   \
> -    } else {                                                                  \
> -        loaded_hash = cpu_ldq_data_ra(env, ea, GETPC());                      \
> -        if (loaded_hash != calculated_hash) {                                 \
> -            raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,                 \
> -                POWERPC_EXCP_TRAP, GETPC());                                  \
> -        }                                                                     \
> +    if (env->msr & R_MSR_PR_MASK) {                                           \
> +        if (!(env->spr[SPR_DEXCR] & R_DEXCR_PRO_##dexcr_aspect##_MASK ||      \
> +            env->spr[SPR_HDEXCR] & R_HDEXCR_ENF_##dexcr_aspect##_MASK))       \
> +            return;                                                           \
> +    } else if (!(env->msr & R_MSR_HV_MASK)) {                                 \
> +        if (!(env->spr[SPR_DEXCR] & R_DEXCR_PNH_##dexcr_aspect##_MASK ||      \
> +            env->spr[SPR_HDEXCR] & R_HDEXCR_ENF_##dexcr_aspect##_MASK))       \
> +            return;                                                           \
> +    } else if (!(env->msr & R_MSR_S_MASK)) {                                  \
> +        if (!(env->spr[SPR_HDEXCR] & R_HDEXCR_HNU_##dexcr_aspect##_MASK))     \
> +            return;                                                           \
>       }                                                                         \
> +                                                                              \
> +    do_hash(env, ea, ra, rb, key, store);                                     \
> +}
> +#else
> +#define HELPER_HASH(op, key, store, dexcr_aspect)                             \
> +void helper_##op(CPUPPCState *env, target_ulong ea, target_ulong ra,          \
> +                 target_ulong rb)                                             \
> +{                                                                             \
> +    do_hash(env, ea, ra, rb, key, store);                                     \
>   }
> +#endif /* TARGET_PPC64 */
>   
> -HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
> -HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
> -HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
> -HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
> +HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true, NPHIE)
> +HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false, NPHIE)
> +HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true, PHIE)
> +HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false, PHIE)
>   #endif /* CONFIG_TCG */
>   
>   #if !defined(CONFIG_USER_ONLY)

