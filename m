Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2927057569B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 22:51:15 +0200 (CEST)
Received: from localhost ([::1]:36372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC5nl-0001Ow-Sa
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 16:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oC5lV-0006ar-Cn; Thu, 14 Jul 2022 16:48:53 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:36438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oC5lT-0004tS-Im; Thu, 14 Jul 2022 16:48:53 -0400
Received: by mail-oi1-x236.google.com with SMTP id u76so3656009oie.3;
 Thu, 14 Jul 2022 13:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zhkiDzBB40ehtmPinXiDgApWm0v1AbaHKSKFD+9Vo9g=;
 b=btjLhQk5a3/fuO1qkPdpABL0UcfPkETesCGLVAGCl165iDz1epu5GdAQORP/0ZJngj
 VztAayI+fck46WKsoGLiy7plsKauGMsuyo/UJ+6E69/iAm1S9HaGo35RvjBQDUlKilBi
 pg/nP7prSq1LQE4+87CABR3fw2gLmNGDSLd1Md1Za9H6Jh/efv79gPPTJS0E3fepdBzb
 +oEyQUN4g32Jm/TCIy+KbsqMmpD5HehKfFSRTaKB4EcLS7fkKvvkEk+ZFukPetJ1mfwj
 c2+3kmLIe7mL0tR9Yr+qqyP+GLgAJhnRNDJA7NlifNwGg1YzZ8VFo6cDT55/IDHVzSbz
 G07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zhkiDzBB40ehtmPinXiDgApWm0v1AbaHKSKFD+9Vo9g=;
 b=3JyFIZi9YNY0qcwe4zUNrLMD5L5JtXag94UmNzG9GXk3owfnoLoVS14j/2F0mbujUz
 p9CeLMtSPifKRBzsJAIEu9W+EQeNQitSrfxi8QmOdS9gN1h/xuGTw2fYqLOFC+5rxsTG
 16gmlz0fAY97gnfr8WhP3cdfzDuaOIhRekAqwikalMev3/aVvX4/SaYSAFkiZ5PYM0UY
 RDrrg0/MntVuqlx7YFOtPLbne4GA4/vl1iUc8AuFP1Pjl+976TeifIIkPuJ5WhXPl/ws
 euimf0AUhSPY7s7SNvBCyU2nUtNtYuyEgYU5vAtAU5l5zlndIE0CVy/VdniLSufW+ApF
 o82A==
X-Gm-Message-State: AJIora8C90bkGRsKiItmJw5y1Vnc8mQBBzSp+nYA+pODXIgaWUMrw6qi
 cMQepor2GGKjds4Qt68pZyU=
X-Google-Smtp-Source: AGRyM1vP1uuUlcfQKVCcogXkygk7Baxi6CarT0u5KzSkgy+RhX706y4XU4hCp0A/XoQKsjWjtwF93g==
X-Received: by 2002:a05:6808:10d4:b0:339:f690:1ac4 with SMTP id
 s20-20020a05680810d400b00339f6901ac4mr5339422ois.210.1657831730012; 
 Thu, 14 Jul 2022 13:48:50 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 e14-20020a056870c34e00b00101bc3380a5sm1357283oak.12.2022.07.14.13.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 13:48:49 -0700 (PDT)
Message-ID: <323fa299-dfd0-357d-12e0-61ca31f52d4d@gmail.com>
Date: Thu, 14 Jul 2022 17:48:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] target/ppc: check tb_env != 0 before printing
 TBU/TBL/DECR
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org
References: <20220714172343.80539-1-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220714172343.80539-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
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



On 7/14/22 14:23, Matheus Ferst wrote:
> When using "-machine none", env->tb_env is not allocated, causing the
> segmentation fault reported in issue #85 (launchpad bug #811683). To
> avoid this problem, check if the pointer != NULL before calling the
> methods to print TBU/TBL/DECR.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/85
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> v3:
>    - Only check env->tb_env in softmmu, linux-user get timebase from
>      elsewhere. Also, try to make the qemu_fprintf call more readable.
>    - Link to v2: https://lists.gnu.org/archive/html/qemu-ppc/2022-07/msg00193.html
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


And queued.


Daniel

>   target/ppc/cpu_init.c | 18 ++++++++----------
>   target/ppc/monitor.c  |  9 +++++++++
>   2 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 86ad28466a..313c8bb300 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7476,17 +7476,15 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>                    "%08x iidx %d didx %d\n",
>                    env->msr, env->spr[SPR_HID0], env->hflags,
>                    cpu_mmu_index(env, true), cpu_mmu_index(env, false));
> -#if !defined(NO_TIMER_DUMP)
> -    qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
>   #if !defined(CONFIG_USER_ONLY)
> -                 " DECR " TARGET_FMT_lu
> -#endif
> -                 "\n",
> -                 cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
> -#if !defined(CONFIG_USER_ONLY)
> -                 , cpu_ppc_load_decr(env)
> -#endif
> -        );
> +    if (env->tb_env) {
> +        qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
> +                     " DECR " TARGET_FMT_lu "\n", cpu_ppc_load_tbu(env),
> +                     cpu_ppc_load_tbl(env), cpu_ppc_load_decr(env));
> +    }
> +#else
> +    qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64 "\n", cpu_ppc_load_tbu(env),
> +                 cpu_ppc_load_tbl(env));
>   #endif
>       for (i = 0; i < 32; i++) {
>           if ((i & (RGPL - 1)) == 0) {
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

