Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4232DC335
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:36:40 +0100 (CET)
Received: from localhost ([::1]:37218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYr1-00059x-9E
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpYYS-000231-6q
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:17:28 -0500
Received: from relay3.mymailcheap.com ([217.182.66.161]:34147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpYYK-0004CW-L6
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:17:26 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id 2453F3F208;
 Wed, 16 Dec 2020 16:17:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id 0460C2A524;
 Wed, 16 Dec 2020 16:17:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608131834;
 bh=XXuPoeWn50BGNuljcq7mkqeWHt0CyB06dYlIVHP85UE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nVzoFCPBDSk9BsrIDWpr1RJB4tmcfeLJkQhZHGbSConuHzvtfM//tw7CZrPR99HeN
 iGIqcjoV2zgwJEOX5IzWX5A5Echs5IPsDvZod3roVSIjEImi9j6iny2uTzFMnjX9mB
 0cofgBVT7AJQFJRoegxyziGRzyG+pA9FF8tlFiME=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z1C0c-eM3urk; Wed, 16 Dec 2020 16:17:11 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Wed, 16 Dec 2020 16:17:11 +0100 (CET)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id A2B0842F7C;
 Wed, 16 Dec 2020 15:17:09 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="jNiLIgc8"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [192.168.43.15] (unknown [114.85.170.252])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 7B05542EFE;
 Wed, 16 Dec 2020 15:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608131810;
 bh=XXuPoeWn50BGNuljcq7mkqeWHt0CyB06dYlIVHP85UE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jNiLIgc81hXXxR52xSwYNVlLRF744jTK2Oods32X3EiKkp2Ebzxdc5eVi7bx84NU1
 mBXH+8dNDQIPt3dgQGg4ggwwfhwTMSu50e/lfBhmhTJxfCfWrc9pplGfQvoVcty80G
 THJ3rbKYS6ozguoVCI1cuDbicChJ02/HUxtFmPnQ=
Subject: Re: [PATCH 03/11] target/mips/mips-defs: Use ISA_MIPS32R2 definition
 to check Release 2
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201216134328.851840-1-f4bug@amsat.org>
 <20201216134328.851840-4-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <a1f2e2a9-6b41-5289-7332-8a4400faf0a4@flygoat.com>
Date: Wed, 16 Dec 2020 23:16:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201216134328.851840-4-f4bug@amsat.org>
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
X-Rspamd-Queue-Id: A2B0842F7C
Received-SPF: pass client-ip=217.182.66.161;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay3.mymailcheap.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> Use the single ISA_MIPS32R2 definition to check if the Release 2
> ISA is supported, whether the CPU support 32/64-bit.
>
> For now we keep '32' in the definition name, we will rename it
> as ISA_MIPS_R2 in few commits.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/mips/mips-defs.h    | 3 +--
>   linux-user/mips/cpu_loop.c | 1 -
>   target/mips/translate.c    | 4 ++--
>   3 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
> index 2756e72a9d6..9cfa4c346bf 100644
> --- a/target/mips/mips-defs.h
> +++ b/target/mips/mips-defs.h
> @@ -24,7 +24,6 @@
>   #define ISA_MIPS5         0x0000000000000010ULL
>   #define ISA_MIPS32        0x0000000000000020ULL
>   #define ISA_MIPS32R2      0x0000000000000040ULL
> -#define ISA_MIPS64R2      0x0000000000000100ULL
>   #define ISA_MIPS32R3      0x0000000000000200ULL
>   #define ISA_MIPS64R3      0x0000000000000400ULL
>   #define ISA_MIPS32R5      0x0000000000000800ULL
> @@ -81,7 +80,7 @@
>   
>   /* MIPS Technologies "Release 2" */
>   #define CPU_MIPS32R2    (CPU_MIPS32 | ISA_MIPS32R2)
> -#define CPU_MIPS64R2    (CPU_MIPS64 | CPU_MIPS32R2 | ISA_MIPS64R2)
> +#define CPU_MIPS64R2    (CPU_MIPS64 | ISA_MIPS32R2)
>   
>   /* MIPS Technologies "Release 3" */
>   #define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS32R3)
> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
> index b58dbeb83d1..a2aa8167210 100644
> --- a/linux-user/mips/cpu_loop.c
> +++ b/linux-user/mips/cpu_loop.c
> @@ -386,7 +386,6 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
>       prog_req.fre &= interp_req.fre;
>   
>       bool cpu_has_mips_r2_r6 = env->insn_flags & ISA_MIPS32R2 ||
> -                              env->insn_flags & ISA_MIPS64R2 ||
>                                 env->insn_flags & ISA_MIPS32R6 ||
>                                 env->insn_flags & ISA_MIPS64R6;
>   
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index 8c0ecfa17e1..0923dfdf451 100644
> --- a/target/mips/translate.c
> +++ b/target/mips/translate.c
> @@ -28212,7 +28212,7 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
>       case OPC_DINSM:
>       case OPC_DINSU:
>       case OPC_DINS:
> -        check_insn(ctx, ISA_MIPS64R2);
> +        check_insn(ctx, ISA_MIPS32R2);
>           check_mips_64(ctx);

After this change, 32-bit CPUs emulated with TARGET_MIPS64
and got CP0.Status.KX and CP0.Status.UX accidentally set won't
emit RI exception.

Probably we need to check ISA_MIPS64 when calculating
MIPS_HFLAG_64 and setting ksux in cpu_mips_store_status?

Thanks.

- Jiaxun

>           gen_bitops(ctx, op1, rt, rs, sa, rd);
>           break;
> @@ -28232,7 +28232,7 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
>               decode_opc_special3_r6(env, ctx);
>               break;
>           default:
> -            check_insn(ctx, ISA_MIPS64R2);
> +            check_insn(ctx, ISA_MIPS32R2);
>               check_mips_64(ctx);
>               op2 = MASK_DBSHFL(ctx->opcode);
>               gen_bshfl(ctx, op2, rt, rd);

