Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CC2574F57
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 15:38:39 +0200 (CEST)
Received: from localhost ([::1]:34522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBz38-0005yV-Sg
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 09:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oByzv-0000SG-OV; Thu, 14 Jul 2022 09:35:27 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:38410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oByzs-0003IK-Nq; Thu, 14 Jul 2022 09:35:18 -0400
Received: by mail-oi1-x22a.google.com with SMTP id s204so2363155oif.5;
 Thu, 14 Jul 2022 06:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bghPZ3GzIf0IHHD9WRPoJDbveA889I79Tl787usdvTs=;
 b=QklYMd+azy4RuOepJ2nA6PzRWb+7LpE7WexVVUiu8yjP+/jaLt+/C+MlAhZGQnbDNH
 uWOnVGQqBovq7onzgl7RjTZiZ5JacZG/8y8lvgQCVNC5D/+2/LvkOhItceQuWef6jvqF
 b+TxwSOqEUqJI0jPnzYqhyVkj7u8Xm3gfTFhPGIWi3H5Icl93q++WFt/7z+sft174m88
 bsrUuE2WQ7iwEO2WmIDXIrgTw+dYb/qLdv8aSjoc2JnMF5jtlTdhKjzQw9ezed9bLrIX
 Bt5TofUR1puvfdbsUFBWt5wF0yRZSfIPuGR8b1sJS/mNNzwJFVGnEBC1nDqKp5WUyiZX
 X/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bghPZ3GzIf0IHHD9WRPoJDbveA889I79Tl787usdvTs=;
 b=zjt3pw4eCr9Tw9ofUCiqwzJxDug+sLbzyyvvYwTW/W03AQfeOq87OpYYgKwY8xqZOD
 iUaif2gdXF/0QwNqFXLW51OXSZti8rH2PNfVPMJvecEYJZdTVQsQ37ll5HUx9Ju2KvxS
 Y64oMk1SlZvU7yqW3H+xOSBTTXzP5faZToBR99SF/t3Uf67J1rIK00gifmEbGWJg8svE
 jjS6izr5ncitftji/P+YWD0hUtymaUszOvbKYIKfAV2RBpvVrv6ot9C7MkeJDu9s9SqA
 /cxtqBYR7ohk0hXponPzRECLkijd2ZyggNMjo4kNc/rs96PsiKjT00QrvG9xa+NkPJ79
 rkMw==
X-Gm-Message-State: AJIora+rHvtZ1Z+zL20Ppf5GKYzluSauTnszCAqblLWxdvfNu1VHaKNA
 K690wKMDambgfPZ/SdXc/+LQEzYzRiI=
X-Google-Smtp-Source: AGRyM1vX7yP/bI1Ofj37lw5XFgjrLOzI5T+cGB4uEjq/pXfv+d6KSGb8IsOnQBXafXUSqYdyTpiZLA==
X-Received: by 2002:a05:6808:2003:b0:339:efb2:aac8 with SMTP id
 q3-20020a056808200300b00339efb2aac8mr7266746oiw.85.1657805712323; 
 Thu, 14 Jul 2022 06:35:12 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 u30-20020a9d721e000000b0061b2a1208cesm638476otj.73.2022.07.14.06.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 06:35:12 -0700 (PDT)
Message-ID: <07a90f40-6ece-57aa-cbe7-15b9e8c37203@gmail.com>
Date: Thu, 14 Jul 2022 10:35:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] target/ppc: check tb_env != 0 before printing
 TBU/TBL/DECR
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org
References: <20220713183847.41797-1-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220713183847.41797-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/13/22 15:38, Matheus Ferst wrote:
> When using "-machine none", env->tb_env is not allocated, causing the
> segmentation fault reported in issue #85 (launchpad bug #811683). To
> avoid this problem, check if the pointer != NULL before calling the
> methods to print TBU/TBL/DECR.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/85
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> v2:
>   - Added checks in monitor_get_decr, monitor_get_tbu, and monitor_get_tbl.
>   - Link to v1: https://lists.gnu.org/archive/html/qemu-ppc/2022-07/msg00173.html
> ---
>   target/ppc/cpu_init.c | 16 ++++++++--------
>   target/ppc/monitor.c  |  9 +++++++++
>   2 files changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 86ad28466a..7e96baac9f 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7476,18 +7476,18 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>                    "%08x iidx %d didx %d\n",
>                    env->msr, env->spr[SPR_HID0], env->hflags,
>                    cpu_mmu_index(env, true), cpu_mmu_index(env, false));
> -#if !defined(NO_TIMER_DUMP)

Why did you remove the NO_TIMER_DUMP check? Is it redundant with the env->tb_env
check?

> -    qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
> +    if (env->tb_env) {
> +        qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
>   #if !defined(CONFIG_USER_ONLY)
> -                 " DECR " TARGET_FMT_lu
> +                     " DECR " TARGET_FMT_lu
>   #endif
> -                 "\n",
> -                 cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
> +                     "\n",
> +                     cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
>   #if !defined(CONFIG_USER_ONLY)
> -                 , cpu_ppc_load_decr(env)
> -#endif
> -        );
> +                     , cpu_ppc_load_decr(env)
>   #endif
> +            );
> +    }

Not really a problem with your patch, but since you're changing this code, can
you please cleanse it from evil? I mean, look at this:


     if (env->tb_env) {
         qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
#if !defined(CONFIG_USER_ONLY)
                      " DECR " TARGET_FMT_lu
#endif
                      "\n",
                      cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
#if !defined(CONFIG_USER_ONLY)
                      , cpu_ppc_load_decr(env)
#endif
             );
     }


2 ifdef macros in the middle of qemu_fprintf() params? With one line starting
with a ', '?  Why are we trading sanity for 3 lines of code repetition?

We can --at least-- do something like this:

     if (env->tb_env) {
#if !defined(CONFIG_USER_ONLY)
         qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
                      " DECR " TARGET_FMT_lu
                      "\n",
                      cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env),
                      cpu_ppc_load_decr(env));
#else
         qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
                      "\n",
                      cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env));
#endif
     }


Thanks,


Daniel


>       for (i = 0; i < 32; i++) {
>           if ((i & (RGPL - 1)) == 0) {
>               qemu_fprintf(f, "GPR%02d", i);
> diff --git a/target/ppc/monitor.c b/target/ppc/monitor.c
> index 0b805ef6e9..8250b1304e 100644
> --- a/target/ppc/monitor.c
> +++ b/target/ppc/monitor.c
> @@ -55,6 +55,9 @@ static target_long monitor_get_decr(Monitor *mon, const struct MonitorDef *md,
>                                       int val)
>   {
>       CPUArchState *env = mon_get_cpu_env(mon);
> +    if (!env->tb_env) {
> +        return 0;
> +    }
>       return cpu_ppc_load_decr(env);
>   }
>   
> @@ -62,6 +65,9 @@ static target_long monitor_get_tbu(Monitor *mon, const struct MonitorDef *md,
>                                      int val)
>   {
>       CPUArchState *env = mon_get_cpu_env(mon);
> +    if (!env->tb_env) {
> +        return 0;
> +    }
>       return cpu_ppc_load_tbu(env);
>   }
>   
> @@ -69,6 +75,9 @@ static target_long monitor_get_tbl(Monitor *mon, const struct MonitorDef *md,
>                                      int val)
>   {
>       CPUArchState *env = mon_get_cpu_env(mon);
> +    if (!env->tb_env) {
> +        return 0;
> +    }
>       return cpu_ppc_load_tbl(env);
>   }
>   

