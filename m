Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C182DC2B9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:08:26 +0100 (CET)
Received: from localhost ([::1]:51228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYPh-0003CW-Np
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:08:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpYNv-0001tY-6m
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:06:35 -0500
Received: from relay2.mymailcheap.com ([217.182.66.162]:39201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpYNs-0000SK-KJ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:06:34 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay2.mymailcheap.com (Postfix) with ESMTPS id 3CDD93EDFC;
 Wed, 16 Dec 2020 16:06:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 714DD2A374;
 Wed, 16 Dec 2020 10:06:29 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608131189;
 bh=iVCKJns64oneWVP7L46dcKQ/vNLB2Pn0s03vWIy/P7U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BIz827/4BIOCCwxtb0nb/DTwryxew131oH2exp0eOiQ+lsuvIaSdnWWe3hPdx5rQQ
 ier9FehK9vNoeZ1Qva2TA4wcHmu8l/xTFkKF6U/KJj2Dc7h+6ELyY9c1AGbSMQVMIE
 8so4jDday+aHHyYvt/k+EzBa22oeLDS5Y+G3IAEM=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d-cP0fgerlge; Wed, 16 Dec 2020 10:06:28 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Wed, 16 Dec 2020 10:06:27 -0500 (EST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 4C6E142EFE;
 Wed, 16 Dec 2020 15:06:25 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="PUxwGK5m"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [192.168.43.15] (unknown [114.85.170.252])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 0300942F15;
 Wed, 16 Dec 2020 15:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608131177;
 bh=iVCKJns64oneWVP7L46dcKQ/vNLB2Pn0s03vWIy/P7U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PUxwGK5mgW/Maa5VwxjPFgHWAOzzLtbakTrZZl+HTJB3tLcyH+c/azgq17GSGqX3r
 LPoo7trH984uNurKOH0iZ/StRvXrI7DpDdFwEesRORjwy3J5M/M/o3/mrgMeYkjnlG
 tOYo1tZloSa5ttk+74oI8SJCPePZs3JKmKeZSgrY=
Subject: Re: [PATCH 02/11] target/mips/mips-defs: Use ISA_MIPS3 for ISA_MIPS64
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201216134328.851840-1-f4bug@amsat.org>
 <20201216134328.851840-3-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <ccdc8892-c97b-593f-8d53-28ac97100438@flygoat.com>
Date: Wed, 16 Dec 2020 23:06:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201216134328.851840-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [-0.10 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 RECEIVED_SPAMHAUS_PBL(0.00)[114.85.170.252:received];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 R_SPF_SOFTFAIL(0.00)[~all]; ML_SERVERS(-3.10)[213.133.102.83];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 RCPT_COUNT_SEVEN(0.00)[7];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: 4C6E142EFE
Received-SPF: pass client-ip=217.182.66.162;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay2.mymailcheap.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2020/12/16 21:43, Philippe Mathieu-Daudé 写道:
> MIPS 64-bit ISA is introduced with MIPS3.
> No need for another bit/definition to check for 64-bit.
>
> Simplify CPU_MIPS64 definition as CPU_MIPS5 contains
> CPU_MIPS4 which contains CPU_MIPS3 which contains ISA_MIPS3.

Oops, I shall amend my reviewed by tag, just found a issue.

>
> Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/mips/mips-defs.h |  5 ++---
>   hw/mips/boston.c        |  2 +-
>   target/mips/translate.c | 10 +++++-----
>   3 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
> index f4d76e562d1..2756e72a9d6 100644
> --- a/target/mips/mips-defs.h
> +++ b/target/mips/mips-defs.h
> @@ -19,12 +19,11 @@
>    */
>   #define ISA_MIPS1         0x0000000000000001ULL
>   #define ISA_MIPS2         0x0000000000000002ULL
> -#define ISA_MIPS3         0x0000000000000004ULL
> +#define ISA_MIPS3         0x0000000000000004ULL /* 64-bit */
>   #define ISA_MIPS4         0x0000000000000008ULL
>   #define ISA_MIPS5         0x0000000000000010ULL
>   #define ISA_MIPS32        0x0000000000000020ULL
>   #define ISA_MIPS32R2      0x0000000000000040ULL
> -#define ISA_MIPS64        0x0000000000000080ULL
>   #define ISA_MIPS64R2      0x0000000000000100ULL
>   #define ISA_MIPS32R3      0x0000000000000200ULL
>   #define ISA_MIPS64R3      0x0000000000000400ULL
> @@ -78,7 +77,7 @@
>   
>   /* MIPS Technologies "Release 1" */
>   #define CPU_MIPS32      (CPU_MIPS2 | ISA_MIPS32)
> -#define CPU_MIPS64      (CPU_MIPS5 | CPU_MIPS32 | ISA_MIPS64)
> +#define CPU_MIPS64      (CPU_MIPS5 | CPU_MIPS32)
>   
>   /* MIPS Technologies "Release 2" */
>   #define CPU_MIPS32R2    (CPU_MIPS32 | ISA_MIPS32R2)
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index c3b94c68e1b..f44f681fab5 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -463,7 +463,7 @@ static void boston_mach_init(MachineState *machine)
>           exit(1);
>       }
>   
> -    is_64b = cpu_type_supports_isa(machine->cpu_type, ISA_MIPS64);
> +    is_64b = cpu_type_supports_isa(machine->cpu_type, ISA_MIPS3);
>   
>       object_initialize_child(OBJECT(machine), "cps", &s->cps, TYPE_MIPS_CPS);
>       object_property_set_str(OBJECT(&s->cps), "cpu-type", machine->cpu_type,
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index 15265485f76..8c0ecfa17e1 100644
> --- a/target/mips/translate.c
> +++ b/target/mips/translate.c
> @@ -8538,7 +8538,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
>       const char *register_name = "invalid";
>   
>       if (sel != 0) {
> -        check_insn(ctx, ISA_MIPS64);
> +        check_insn(ctx, ISA_MIPS3);
>       }

I think these ISA_MIPS64 should mean ISA_MIPS_R1?

>   
>       switch (reg) {
> @@ -9264,7 +9264,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
>       const char *register_name = "invalid";
>   
>       if (sel != 0) {
> -        check_insn(ctx, ISA_MIPS64);
> +        check_insn(ctx, ISA_MIPS3);

and so

>       }
>   
>       if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> @@ -14502,12 +14502,12 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
>                   break;
>   #if defined(TARGET_MIPS64)
>               case RR_RY_CNVT_ZEW:
> -                check_insn(ctx, ISA_MIPS64);
> +                check_insn(ctx, ISA_MIPS3);

and so

>                   check_mips_64(ctx);
>                   tcg_gen_ext32u_tl(cpu_gpr[rx], cpu_gpr[rx]);
>                   break;
>               case RR_RY_CNVT_SEW:
> -                check_insn(ctx, ISA_MIPS64);
> +                check_insn(ctx, ISA_MIPS3);

and so....

>                   check_mips_64(ctx);
>                   tcg_gen_ext32s_tl(cpu_gpr[rx], cpu_gpr[rx]);
>                   break;
> @@ -27203,7 +27203,7 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
>   #if defined(TARGET_MIPS64)
>       case OPC_DCLO:
>       case OPC_DCLZ:
> -        check_insn(ctx, ISA_MIPS64);
> +        check_insn(ctx, ISA_MIPS3);

and so...

>           check_mips_64(ctx);
>           gen_cl(ctx, op1, rd, rs);
>           break;

