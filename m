Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6A42DC475
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:41:49 +0100 (CET)
Received: from localhost ([::1]:39578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZs4-0000e4-H1
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZfL-0005OF-IY
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:28:39 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZfF-0007nM-UT
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:28:37 -0500
Received: by mail-wr1-x433.google.com with SMTP id d13so5527826wrc.13
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2HTzABOznD8kr8emRoKsPtNBr8ioZfjwwzi5XJEH8cw=;
 b=udzc0XPuRUjXz1i5kn9qi6K2SWBB6UKMQv8JB+5B8sRp0rFw76qBoYrJIMmLpXUiZg
 G9Id42jfH0oiQWqOq9fq4A/9VZvat+0uTDl1Lz+vr3P9GkIEpJYFFqoogUgJiE5IdDaq
 h6R1fjTKXGoNgo0EXIsg+Skl1KcyTmNkypIhrDIBwdPKdRxZ9P6pZoPPbx00mMMgg8Ou
 RFqlg2tsHTqL/LQwaLNIHFwjUsev+fliQY3BsGKJzLCdXxsOZPmSkt+4Ojc2PQXEPrzT
 jOcthJ117ilMF5Pmmjlqx9+M0h9ji2Cmo9pQJmUKJZhSzFQxTr6+q3WjliFqzQbRs6A0
 UD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2HTzABOznD8kr8emRoKsPtNBr8ioZfjwwzi5XJEH8cw=;
 b=C1Svy0DV14cjCuyqShM1imgwNSRhfpb6TNOpoaxIB9Y5BKDC5Srqovbs3lViU6Zimq
 f4ZkVZZPsrj7V86FTAJlYbVckYbEmls8uP0AcHchnP+lDu+0zMED3gO350vhk6QAuizL
 MDRn7h19OWyEafOb8j0gV6Gpj7CeM9D+krmkR7lh6ENTLHna3asaGUDH8LJ/YJwVCfv7
 xZH411ty/AqWuyTrENJYVUcEvLw6UulyyFBu2zNX7bziMFF7rr9u215SmfR2sn6VUobI
 OP8Y/k19MPdDKlokOTWCr/rfzNKPYpVx8fytAi6LP3GBE13XDMb1oiQKV0PjCgMYqF9k
 VLqg==
X-Gm-Message-State: AOAM530V1jvfTgRIHzl/vHsciHc2DSxVTa1lTQodZZhSD7jJcU6dwc0f
 uv4QvHQ8mwGFCM8yBAC319+qIBPRPbk=
X-Google-Smtp-Source: ABdhPJxkVzE+O3X8RZEXDDvpj3Ghw6li9WJgHLguaNE5piWhhv4eJ5WM6lh/bje/QUmorJbnhEOwKQ==
X-Received: by 2002:adf:f6cc:: with SMTP id y12mr11498736wrp.35.1608136112133; 
 Wed, 16 Dec 2020 08:28:32 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id w4sm3425026wmc.13.2020.12.16.08.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:28:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/12] target/mips/mips-defs: Rename ISA_MIPS32R2 as
 ISA_MIPS_R2
Date: Wed, 16 Dec 2020 17:27:41 +0100
Message-Id: <20201216162744.895920-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216162744.895920-1-f4bug@amsat.org>
References: <20201216162744.895920-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

The MIPS ISA release 2 is common to 32/64-bit CPUs.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h     |   2 +-
 target/mips/mips-defs.h    |   6 +-
 linux-user/mips/cpu_loop.c |   2 +-
 target/mips/cp0_timer.c    |   4 +-
 target/mips/cpu.c          |   2 +-
 target/mips/translate.c    | 138 ++++++++++++++++++-------------------
 6 files changed, 77 insertions(+), 77 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index f71c617a1fe..b14671a9a51 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -361,7 +361,7 @@ static inline void compute_hflags(CPUMIPSState *env)
         }
 
     }
-    if (env->insn_flags & ISA_MIPS32R2) {
+    if (env->insn_flags & ISA_MIPS_R2) {
         if (env->active_fpu.fcr0 & (1 << FCR0_F64)) {
             env->hflags |= MIPS_HFLAG_COP1X;
         }
diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 31c02cc20ef..9ef3f517aaa 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -23,7 +23,7 @@
 #define ISA_MIPS4         0x0000000000000008ULL
 #define ISA_MIPS5         0x0000000000000010ULL
 #define ISA_MIPS_R1       0x0000000000000020ULL
-#define ISA_MIPS32R2      0x0000000000000040ULL
+#define ISA_MIPS_R2       0x0000000000000040ULL
 #define ISA_MIPS32R3      0x0000000000000200ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
 #define ISA_MIPS32R6      0x0000000000002000ULL
@@ -76,8 +76,8 @@
 #define CPU_MIPS64      (CPU_MIPS5 | CPU_MIPS32)
 
 /* MIPS Technologies "Release 2" */
-#define CPU_MIPS32R2    (CPU_MIPS32 | ISA_MIPS32R2)
-#define CPU_MIPS64R2    (CPU_MIPS64 | ISA_MIPS32R2)
+#define CPU_MIPS32R2    (CPU_MIPS32 | ISA_MIPS_R2)
+#define CPU_MIPS64R2    (CPU_MIPS64 | ISA_MIPS_R2)
 
 /* MIPS Technologies "Release 3" */
 #define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS32R3)
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 1e4acf3d6e3..fc5446ade37 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -385,7 +385,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     prog_req.frdefault &= interp_req.frdefault;
     prog_req.fre &= interp_req.fre;
 
-    bool cpu_has_mips_r2_r6 = env->insn_flags & ISA_MIPS32R2 ||
+    bool cpu_has_mips_r2_r6 = env->insn_flags & ISA_MIPS_R2 ||
                               env->insn_flags & ISA_MIPS32R6;
 
     if (prog_req.fre && !prog_req.frdefault && !prog_req.fr1) {
diff --git a/target/mips/cp0_timer.c b/target/mips/cp0_timer.c
index 5ec0d6249e9..70de95d338f 100644
--- a/target/mips/cp0_timer.c
+++ b/target/mips/cp0_timer.c
@@ -44,7 +44,7 @@ static void cpu_mips_timer_update(CPUMIPSState *env)
 static void cpu_mips_timer_expire(CPUMIPSState *env)
 {
     cpu_mips_timer_update(env);
-    if (env->insn_flags & ISA_MIPS32R2) {
+    if (env->insn_flags & ISA_MIPS_R2) {
         env->CP0_Cause |= 1 << CP0Ca_TI;
     }
     qemu_irq_raise(env->irq[(env->CP0_IntCtl >> CP0IntCtl_IPTI) & 0x7]);
@@ -93,7 +93,7 @@ void cpu_mips_store_compare(CPUMIPSState *env, uint32_t value)
     if (!(env->CP0_Cause & (1 << CP0Ca_DC))) {
         cpu_mips_timer_update(env);
     }
-    if (env->insn_flags & ISA_MIPS32R2) {
+    if (env->insn_flags & ISA_MIPS_R2) {
         env->CP0_Cause &= ~(1 << CP0Ca_TI);
     }
     qemu_irq_lower(env->irq[(env->CP0_IntCtl >> CP0IntCtl_IPTI) & 0x7]);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 112eb0d9f47..5c571434134 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -111,7 +111,7 @@ void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val)
     uint32_t old = env->CP0_Cause;
     int i;
 
-    if (env->insn_flags & ISA_MIPS32R2) {
+    if (env->insn_flags & ISA_MIPS_R2) {
         mask |= 1 << CP0Ca_DC;
     }
     if (env->insn_flags & ISA_MIPS32R6) {
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 62825dba2fd..34bc083c813 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7207,7 +7207,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             register_name = "PageMask";
             break;
         case CP0_REG05__PAGEGRAIN:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_PageGrain));
             register_name = "PageGrain";
             break;
@@ -7255,27 +7255,27 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             register_name = "Wired";
             break;
         case CP0_REG06__SRSCONF0:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf0));
             register_name = "SRSConf0";
             break;
         case CP0_REG06__SRSCONF1:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf1));
             register_name = "SRSConf1";
             break;
         case CP0_REG06__SRSCONF2:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf2));
             register_name = "SRSConf2";
             break;
         case CP0_REG06__SRSCONF3:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf3));
             register_name = "SRSConf3";
             break;
         case CP0_REG06__SRSCONF4:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf4));
             register_name = "SRSConf4";
             break;
@@ -7291,7 +7291,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     case CP0_REGISTER_07:
         switch (sel) {
         case CP0_REG07__HWRENA:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_HWREna));
             register_name = "HWREna";
             break;
@@ -7386,17 +7386,17 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             register_name = "Status";
             break;
         case CP0_REG12__INTCTL:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_IntCtl));
             register_name = "IntCtl";
             break;
         case CP0_REG12__SRSCTL:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSCtl));
             register_name = "SRSCtl";
             break;
         case CP0_REG12__SRSMAP:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSMap));
             register_name = "SRSMap";
             break;
@@ -7432,13 +7432,13 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             register_name = "PRid";
             break;
         case CP0_REG15__EBASE:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EBase));
             tcg_gen_ext32s_tl(arg, arg);
             register_name = "EBase";
             break;
         case CP0_REG15__CMGCRBASE:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             CP0_CHECK(ctx->cmgcr);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_CMGCRBase));
             tcg_gen_ext32s_tl(arg, arg);
@@ -7952,7 +7952,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             register_name = "PageMask";
             break;
         case CP0_REG05__PAGEGRAIN:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_pagegrain(cpu_env, arg);
             register_name = "PageGrain";
             ctx->base.is_jmp = DISAS_STOP;
@@ -7998,27 +7998,27 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             register_name = "Wired";
             break;
         case CP0_REG06__SRSCONF0:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_srsconf0(cpu_env, arg);
             register_name = "SRSConf0";
             break;
         case CP0_REG06__SRSCONF1:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_srsconf1(cpu_env, arg);
             register_name = "SRSConf1";
             break;
         case CP0_REG06__SRSCONF2:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_srsconf2(cpu_env, arg);
             register_name = "SRSConf2";
             break;
         case CP0_REG06__SRSCONF3:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_srsconf3(cpu_env, arg);
             register_name = "SRSConf3";
             break;
         case CP0_REG06__SRSCONF4:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_srsconf4(cpu_env, arg);
             register_name = "SRSConf4";
             break;
@@ -8034,7 +8034,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     case CP0_REGISTER_07:
         switch (sel) {
         case CP0_REG07__HWRENA:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_hwrena(cpu_env, arg);
             ctx->base.is_jmp = DISAS_STOP;
             register_name = "HWREna";
@@ -8117,21 +8117,21 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             register_name = "Status";
             break;
         case CP0_REG12__INTCTL:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_intctl(cpu_env, arg);
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             register_name = "IntCtl";
             break;
         case CP0_REG12__SRSCTL:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_srsctl(cpu_env, arg);
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             register_name = "SRSCtl";
             break;
         case CP0_REG12__SRSMAP:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mtc0_store32(arg, offsetof(CPUMIPSState, CP0_SRSMap));
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
@@ -8176,7 +8176,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             register_name = "PRid";
             break;
         case CP0_REG15__EBASE:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_ebase(cpu_env, arg);
             register_name = "EBase";
             break;
@@ -8715,7 +8715,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             register_name = "PageMask";
             break;
         case CP0_REG05__PAGEGRAIN:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_PageGrain));
             register_name = "PageGrain";
             break;
@@ -8760,27 +8760,27 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             register_name = "Wired";
             break;
         case CP0_REG06__SRSCONF0:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf0));
             register_name = "SRSConf0";
             break;
         case CP0_REG06__SRSCONF1:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf1));
             register_name = "SRSConf1";
             break;
         case CP0_REG06__SRSCONF2:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf2));
             register_name = "SRSConf2";
             break;
         case CP0_REG06__SRSCONF3:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf3));
             register_name = "SRSConf3";
             break;
         case CP0_REG06__SRSCONF4:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSConf4));
             register_name = "SRSConf4";
             break;
@@ -8796,7 +8796,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     case CP0_REGISTER_07:
         switch (sel) {
         case CP0_REG07__HWRENA:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_HWREna));
             register_name = "HWREna";
             break;
@@ -8889,17 +8889,17 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             register_name = "Status";
             break;
         case CP0_REG12__INTCTL:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_IntCtl));
             register_name = "IntCtl";
             break;
         case CP0_REG12__SRSCTL:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSCtl));
             register_name = "SRSCtl";
             break;
         case CP0_REG12__SRSMAP:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mfc0_load32(arg, offsetof(CPUMIPSState, CP0_SRSMap));
             register_name = "SRSMap";
             break;
@@ -8934,12 +8934,12 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             register_name = "PRid";
             break;
         case CP0_REG15__EBASE:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_EBase));
             register_name = "EBase";
             break;
         case CP0_REG15__CMGCRBASE:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             CP0_CHECK(ctx->cmgcr);
             tcg_gen_ld_tl(arg, cpu_env, offsetof(CPUMIPSState, CP0_CMGCRBase));
             register_name = "CMGCRBase";
@@ -9442,7 +9442,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             register_name = "PageMask";
             break;
         case CP0_REG05__PAGEGRAIN:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_pagegrain(cpu_env, arg);
             register_name = "PageGrain";
             break;
@@ -9487,27 +9487,27 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             register_name = "Wired";
             break;
         case CP0_REG06__SRSCONF0:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_srsconf0(cpu_env, arg);
             register_name = "SRSConf0";
             break;
         case CP0_REG06__SRSCONF1:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_srsconf1(cpu_env, arg);
             register_name = "SRSConf1";
             break;
         case CP0_REG06__SRSCONF2:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_srsconf2(cpu_env, arg);
             register_name = "SRSConf2";
             break;
         case CP0_REG06__SRSCONF3:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_srsconf3(cpu_env, arg);
             register_name = "SRSConf3";
             break;
         case CP0_REG06__SRSCONF4:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_srsconf4(cpu_env, arg);
             register_name = "SRSConf4";
             break;
@@ -9523,7 +9523,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     case CP0_REGISTER_07:
         switch (sel) {
         case CP0_REG07__HWRENA:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_hwrena(cpu_env, arg);
             ctx->base.is_jmp = DISAS_STOP;
             register_name = "HWREna";
@@ -9610,21 +9610,21 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             register_name = "Status";
             break;
         case CP0_REG12__INTCTL:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_intctl(cpu_env, arg);
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             register_name = "IntCtl";
             break;
         case CP0_REG12__SRSCTL:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_srsctl(cpu_env, arg);
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
             register_name = "SRSCtl";
             break;
         case CP0_REG12__SRSMAP:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_mtc0_store32(arg, offsetof(CPUMIPSState, CP0_SRSMap));
             /* Stop translation as we may have switched the execution mode */
             ctx->base.is_jmp = DISAS_STOP;
@@ -9669,7 +9669,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             register_name = "PRid";
             break;
         case CP0_REG15__EBASE:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_helper_mtc0_ebase(cpu_env, arg);
             register_name = "EBase";
             break;
@@ -13048,7 +13048,7 @@ static void gen_rdhwr(DisasContext *ctx, int rt, int rd, int sel)
      * The Linux kernel will emulate rdhwr if it's not supported natively.
      * Therefore only check the ISA in system mode.
      */
-    check_insn(ctx, ISA_MIPS32R2);
+    check_insn(ctx, ISA_MIPS_R2);
 #endif
     t0 = tcg_temp_new();
 
@@ -15864,12 +15864,12 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
         switch (minor) {
         case RDPGPR:
             check_cp0_enabled(ctx);
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_load_srsgpr(rs, rt);
             break;
         case WRPGPR:
             check_cp0_enabled(ctx);
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_store_srsgpr(rs, rt);
             break;
         default:
@@ -24577,7 +24577,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         switch ((ctx->opcode >> 21) & 0x1f) {
         case 1:
             /* rotr is decoded as srl on non-R2 CPUs */
-            if (ctx->insn_flags & ISA_MIPS32R2) {
+            if (ctx->insn_flags & ISA_MIPS_R2) {
                 op1 = OPC_ROTR;
             }
             /* Fallthrough */
@@ -24603,7 +24603,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         switch ((ctx->opcode >> 6) & 0x1f) {
         case 1:
             /* rotrv is decoded as srlv on non-R2 CPUs */
-            if (ctx->insn_flags & ISA_MIPS32R2) {
+            if (ctx->insn_flags & ISA_MIPS_R2) {
                 op1 = OPC_ROTRV;
             }
             /* Fallthrough */
@@ -24675,7 +24675,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         switch ((ctx->opcode >> 21) & 0x1f) {
         case 1:
             /* drotr is decoded as dsrl on non-R2 CPUs */
-            if (ctx->insn_flags & ISA_MIPS32R2) {
+            if (ctx->insn_flags & ISA_MIPS_R2) {
                 op1 = OPC_DROTR;
             }
             /* Fallthrough */
@@ -24693,7 +24693,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         switch ((ctx->opcode >> 21) & 0x1f) {
         case 1:
             /* drotr32 is decoded as dsrl32 on non-R2 CPUs */
-            if (ctx->insn_flags & ISA_MIPS32R2) {
+            if (ctx->insn_flags & ISA_MIPS_R2) {
                 op1 = OPC_DROTR32;
             }
             /* Fallthrough */
@@ -24725,7 +24725,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
         switch ((ctx->opcode >> 6) & 0x1f) {
         case 1:
             /* drotrv is decoded as dsrlv on non-R2 CPUs */
-            if (ctx->insn_flags & ISA_MIPS32R2) {
+            if (ctx->insn_flags & ISA_MIPS_R2) {
                 op1 = OPC_DROTRV;
             }
             /* Fallthrough */
@@ -28185,7 +28185,7 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
     switch (op1) {
     case OPC_EXT:
     case OPC_INS:
-        check_insn(ctx, ISA_MIPS32R2);
+        check_insn(ctx, ISA_MIPS_R2);
         gen_bitops(ctx, op1, rt, rs, sa, rd);
         break;
     case OPC_BSHFL:
@@ -28200,7 +28200,7 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
             decode_opc_special3_r6(env, ctx);
             break;
         default:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_bshfl(ctx, op2, rt, rd);
             break;
         }
@@ -28212,7 +28212,7 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
     case OPC_DINSM:
     case OPC_DINSU:
     case OPC_DINS:
-        check_insn(ctx, ISA_MIPS32R2);
+        check_insn(ctx, ISA_MIPS_R2);
         check_mips_64(ctx);
         gen_bitops(ctx, op1, rt, rs, sa, rd);
         break;
@@ -28232,7 +28232,7 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
             decode_opc_special3_r6(env, ctx);
             break;
         default:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             check_mips_64(ctx);
             op2 = MASK_DBSHFL(ctx->opcode);
             gen_bshfl(ctx, op2, rt, rd);
@@ -28359,7 +28359,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
             gen_reserved_instruction(ctx);
             break;
         case OPC_SYNCI:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             /*
              * Break the TB to be able to sync copied instructions
              * immediately.
@@ -28476,7 +28476,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
                     }
                     break;
                 case OPC_DI:
-                    check_insn(ctx, ISA_MIPS32R2);
+                    check_insn(ctx, ISA_MIPS_R2);
                     save_cpu_state(ctx, 1);
                     gen_helper_di(t0, cpu_env);
                     gen_store_gpr(t0, rt);
@@ -28487,7 +28487,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
                     ctx->base.is_jmp = DISAS_STOP;
                     break;
                 case OPC_EI:
-                    check_insn(ctx, ISA_MIPS32R2);
+                    check_insn(ctx, ISA_MIPS_R2);
                     save_cpu_state(ctx, 1);
                     gen_helper_ei(t0, cpu_env);
                     gen_store_gpr(t0, rt);
@@ -28508,11 +28508,11 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
 #endif /* !CONFIG_USER_ONLY */
             break;
         case OPC_RDPGPR:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_load_srsgpr(rt, rd);
             break;
         case OPC_WRPGPR:
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             gen_store_srsgpr(rt, rd);
             break;
         default:
@@ -28674,7 +28674,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         case OPC_MFHC1:
         case OPC_MTHC1:
             check_cp1_enabled(ctx);
-            check_insn(ctx, ISA_MIPS32R2);
+            check_insn(ctx, ISA_MIPS_R2);
             /* fall through */
         case OPC_MFC1:
         case OPC_CFC1:
@@ -28855,21 +28855,21 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
             switch (op1) {
             case OPC_LUXC1:
             case OPC_SUXC1:
-                check_insn(ctx, ISA_MIPS5 | ISA_MIPS32R2);
+                check_insn(ctx, ISA_MIPS5 | ISA_MIPS_R2);
                 /* Fallthrough */
             case OPC_LWXC1:
             case OPC_LDXC1:
             case OPC_SWXC1:
             case OPC_SDXC1:
-                check_insn(ctx, ISA_MIPS4 | ISA_MIPS32R2);
+                check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R2);
                 gen_flt3_ldst(ctx, op1, sa, rd, rs, rt);
                 break;
             case OPC_PREFX:
-                check_insn(ctx, ISA_MIPS4 | ISA_MIPS32R2);
+                check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R2);
                 /* Treat as NOP. */
                 break;
             case OPC_ALNV_PS:
-                check_insn(ctx, ISA_MIPS5 | ISA_MIPS32R2);
+                check_insn(ctx, ISA_MIPS5 | ISA_MIPS_R2);
                 /* Fallthrough */
             case OPC_MADD_S:
             case OPC_MADD_D:
@@ -28883,7 +28883,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
             case OPC_NMSUB_S:
             case OPC_NMSUB_D:
             case OPC_NMSUB_PS:
-                check_insn(ctx, ISA_MIPS4 | ISA_MIPS32R2);
+                check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R2);
                 gen_flt3_arith(ctx, op1, sa, rs, rd, rt);
                 break;
             default:
-- 
2.26.2


