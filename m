Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB722DC464
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:38:03 +0100 (CET)
Received: from localhost ([::1]:59046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZoQ-000582-RJ
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:38:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZes-0004fI-N3
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:28:10 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZer-0007jF-5b
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:28:10 -0500
Received: by mail-wm1-x336.google.com with SMTP id x22so2930986wmc.5
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=56BrI+3ByfNWDrlnZrGuWZgk38BOwa5mF2TsZj5KPRY=;
 b=A9W7gsxa6xahDxGpG9/CAC1cEYH9alNoLLDSRYjLes8LW2VircTK2d5fHL/Dtucis3
 vqkOD8AlPJBvfZmwXoMmWg3Tua7TjT0eV7vOnCC2Per260Njf3L4cAU8sR8VnK4anZ5P
 w/d2OxhQ+yBcmm54C0aK33S11Kr5pkZPICQV3Bk/HcSTJ/bDuAPkff90j5RnRhtVLSg1
 ptOCnAWzkQI/TMlhG1xzhBja4mJiEukhGfr+5fahs8nflUNlilqw7Sg6R4dB3hdW+A37
 o+FAYGTTHtCmsGeHHTO4CRqmooXbXaVltabygedDMtMmGz43DfqkpIAZPA8sqG5p5VgR
 Tb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=56BrI+3ByfNWDrlnZrGuWZgk38BOwa5mF2TsZj5KPRY=;
 b=huGx/y/Ppl7t4RERCGmk7Z/HsfyV3Yo2HFkty15GmNKLdDBeoIq4mH3g/u2C9/erXy
 JVgyauYPUWLjDag2cWxsKs+sxBjgQhx8c+JRIUMy3l8WQweWwAIjql8Xv9XDUW4k1c8D
 AzqtT0UT9IeVebraHnuVZ+qUmSXRh1KOJ9X4UM+E7oMyPCNT//5hFEn5wfjgOEPj+Hoj
 mYbsuiR2LuAZ+Y0+mfMMl7Y9CmqeGCXjmE2PoQP9yxnqslL6dFpalAJnBsY3I+2r35tL
 RjvKcaNyBq2nFnlQWhVlaUtSttSdSqCEBwg9FZCkg2dNNhozlJW67HIP1pi6JJDbPC7F
 dnMA==
X-Gm-Message-State: AOAM532Yg4mHNn3u+lQ6C49Z84gEDXuI1+myUQuWvgu1umIXwygGaal3
 UlhHtjucioXpTfZavuuq7xIWbia2Oxc=
X-Google-Smtp-Source: ABdhPJzlq9MoEhzlFo90C6XaJNQcKKBcyV4eKOelJwjBURGZPHIYAymv9NmLnK9gAvX6pmAUSmzaDA==
X-Received: by 2002:a1c:2783:: with SMTP id n125mr4152605wmn.74.1608136087227; 
 Wed, 16 Dec 2020 08:28:07 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id 189sm3625351wma.22.2020.12.16.08.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:28:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/12] target/mips/mips-defs: Use ISA_MIPS32R2 definition
 to check Release 2
Date: Wed, 16 Dec 2020 17:27:36 +0100
Message-Id: <20201216162744.895920-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216162744.895920-1-f4bug@amsat.org>
References: <20201216162744.895920-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the single ISA_MIPS32R2 definition to check if the Release 2
ISA is supported, whether the CPU support 32/64-bit.

For now we keep '32' in the definition name, we will rename it
as ISA_MIPS_R2 in few commits.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h    | 3 +--
 linux-user/mips/cpu_loop.c | 1 -
 target/mips/translate.c    | 4 ++--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 2756e72a9d6..9cfa4c346bf 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -24,7 +24,6 @@
 #define ISA_MIPS5         0x0000000000000010ULL
 #define ISA_MIPS32        0x0000000000000020ULL
 #define ISA_MIPS32R2      0x0000000000000040ULL
-#define ISA_MIPS64R2      0x0000000000000100ULL
 #define ISA_MIPS32R3      0x0000000000000200ULL
 #define ISA_MIPS64R3      0x0000000000000400ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
@@ -81,7 +80,7 @@
 
 /* MIPS Technologies "Release 2" */
 #define CPU_MIPS32R2    (CPU_MIPS32 | ISA_MIPS32R2)
-#define CPU_MIPS64R2    (CPU_MIPS64 | CPU_MIPS32R2 | ISA_MIPS64R2)
+#define CPU_MIPS64R2    (CPU_MIPS64 | ISA_MIPS32R2)
 
 /* MIPS Technologies "Release 3" */
 #define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS32R3)
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index b58dbeb83d1..a2aa8167210 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -386,7 +386,6 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     prog_req.fre &= interp_req.fre;
 
     bool cpu_has_mips_r2_r6 = env->insn_flags & ISA_MIPS32R2 ||
-                              env->insn_flags & ISA_MIPS64R2 ||
                               env->insn_flags & ISA_MIPS32R6 ||
                               env->insn_flags & ISA_MIPS64R6;
 
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 12b01d4c35d..de3a6b5ed65 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28212,7 +28212,7 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
     case OPC_DINSM:
     case OPC_DINSU:
     case OPC_DINS:
-        check_insn(ctx, ISA_MIPS64R2);
+        check_insn(ctx, ISA_MIPS32R2);
         check_mips_64(ctx);
         gen_bitops(ctx, op1, rt, rs, sa, rd);
         break;
@@ -28232,7 +28232,7 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
             decode_opc_special3_r6(env, ctx);
             break;
         default:
-            check_insn(ctx, ISA_MIPS64R2);
+            check_insn(ctx, ISA_MIPS32R2);
             check_mips_64(ctx);
             op2 = MASK_DBSHFL(ctx->opcode);
             gen_bshfl(ctx, op2, rt, rd);
-- 
2.26.2


