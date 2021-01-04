Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6742E9FDD
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 23:16:02 +0100 (CET)
Received: from localhost ([::1]:53978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwY8v-00016S-MY
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 17:16:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5z-0007nZ-8m
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:59 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5x-00082u-9y
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:59 -0500
Received: by mail-wr1-x432.google.com with SMTP id c5so33628331wrp.6
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 14:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U1becq45UPDqSn7+EhIiJXXnxLnIRFVYNM6dDyz1HXk=;
 b=N81PYBGArNHD5Ww8H1IK709UhOVM22hQ9Zq3TcQ9GrO+St+/0GNeffhEz9ECEdSnHL
 3GFk+gq972pjmjBrC6lelpet2uWLvKefhy9zK/hFrbTmzH3RHtr1YYlfpCaYLM/dCWmX
 Me8aMTWfo1T8FaSz/j6Xr3cztewOHTHbfSQFRYNnwSkbkWOuYwAl81BVsGYzysE5+V8E
 zXM5tI8hdx5XzPsHCwD+LMqV6HB1DJaUQX7W+RNSv+ltHXNoEUVkBlXJ+UK1zFDcRPpQ
 z01pQeRw3ZSTz3bq1hCnNVgopNox+KeOl5VXAonGffI5KQotoxoxvR8QP2V8vMtj52fn
 DxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U1becq45UPDqSn7+EhIiJXXnxLnIRFVYNM6dDyz1HXk=;
 b=X++IDz95XnXMekusV15CRn15HQohNxGbz941NgfP5+3r5oFmLQOhl0Uq/BjrxClrq/
 jc7Q/XdqpcoDzuoR4oh5D/qQBL04G7I7ykjVq8lrEcyTXf0o5HOzfam55oXiWIlDGN1S
 273KDo/EdcyRuD/XCe6PAgo8vkgxDZFt6ofrJiyl/6kJg3Ws/FOhqIbZ5at4Fq18HAWd
 6DIvZ9wHkCVDCZ6P0gExCs3Mt+CphnGL0dQzwOilEuuNxt5He89mhMpb4jU3Uv5M5P5S
 /OVhvvR7TD6GC1OmmvAJea9Nz2cqCHUdiYIMSt9tD2boD9Hy5rOevNvZww5ouVrdvXSu
 Abnw==
X-Gm-Message-State: AOAM532ximHfu2IVsJlGUw2CFpa1jTZiE79dNciB288I+LTXonzSyCok
 rhvk9/ajp5IMc/uAXmqEyBvBA42RWBI=
X-Google-Smtp-Source: ABdhPJxssliuFblttFZcZ1LyHjUr08MTAA0x1KCO8A+uMBg9o29JRPrwv45T67axcXQriWg2QqPQcA==
X-Received: by 2002:adf:dc10:: with SMTP id t16mr77561595wri.345.1609798375624; 
 Mon, 04 Jan 2021 14:12:55 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id r15sm91888771wrq.1.2021.01.04.14.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 14:12:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/15] target/mips/mips-defs: Rename ISA_MIPS32 as
 ISA_MIPS_R1
Date: Mon,  4 Jan 2021 23:11:50 +0100
Message-Id: <20210104221154.3127610-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104221154.3127610-1-f4bug@amsat.org>
References: <20210104221154.3127610-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MIPS ISA release '1' is common to 32/64-bit CPUs.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h  |  2 +-
 target/mips/mips-defs.h |  4 +--
 target/mips/translate.c | 54 ++++++++++++++++++++---------------------
 3 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 3466725b761..94910f75a61 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -411,7 +411,7 @@ static inline void compute_hflags(CPUMIPSState *env)
         if (env->active_fpu.fcr0 & (1 << FCR0_F64)) {
             env->hflags |= MIPS_HFLAG_COP1X;
         }
-    } else if (env->insn_flags & ISA_MIPS32) {
+    } else if (env->insn_flags & ISA_MIPS_R1) {
         if (env->hflags & MIPS_HFLAG_64) {
             env->hflags |= MIPS_HFLAG_COP1X;
         }
diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index fea547508f0..a7048ffaffe 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -16,7 +16,7 @@
 #define ISA_MIPS3         0x0000000000000004ULL /* 64-bit */
 #define ISA_MIPS4         0x0000000000000008ULL
 #define ISA_MIPS5         0x0000000000000010ULL
-#define ISA_MIPS32        0x0000000000000020ULL
+#define ISA_MIPS_R1       0x0000000000000020ULL
 #define ISA_MIPS32R2      0x0000000000000040ULL
 #define ISA_MIPS32R3      0x0000000000000200ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
@@ -69,7 +69,7 @@
 #define CPU_MIPS64      (ISA_MIPS3)
 
 /* MIPS Technologies "Release 1" */
-#define CPU_MIPS32R1    (CPU_MIPS2 | ISA_MIPS32)
+#define CPU_MIPS32R1    (CPU_MIPS2 | ISA_MIPS_R1)
 #define CPU_MIPS64R1    (CPU_MIPS5 | CPU_MIPS32R1)
 
 /* MIPS Technologies "Release 2" */
diff --git a/target/mips/translate.c b/target/mips/translate.c
index fc93b9da8eb..a59fbd94bac 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7411,7 +7411,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     const char *register_name = "invalid";
 
     if (sel != 0) {
-        check_insn(ctx, ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS_R1);
     }
 
     switch (reg) {
@@ -8179,7 +8179,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     const char *register_name = "invalid";
 
     if (sel != 0) {
-        check_insn(ctx, ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS_R1);
     }
 
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
@@ -8943,7 +8943,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     const char *register_name = "invalid";
 
     if (sel != 0) {
-        check_insn(ctx, ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS_R1);
     }
 
     switch (reg) {
@@ -9669,7 +9669,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     const char *register_name = "invalid";
 
     if (sel != 0) {
-        check_insn(ctx, ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS_R1);
     }
 
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
@@ -11006,7 +11006,7 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
         break;
     case OPC_DERET:
         opn = "deret";
-        check_insn(ctx, ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS_R1);
         if ((ctx->insn_flags & ISA_MIPS32R6) &&
             (ctx->hflags & MIPS_HFLAG_BMASK)) {
             goto die;
@@ -11021,7 +11021,7 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
         break;
     case OPC_WAIT:
         opn = "wait";
-        check_insn(ctx, ISA_MIPS3 | ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS3 | ISA_MIPS_R1);
         if ((ctx->insn_flags & ISA_MIPS32R6) &&
             (ctx->hflags & MIPS_HFLAG_BMASK)) {
             goto die;
@@ -11056,7 +11056,7 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
     }
 
     if (cc != 0) {
-        check_insn(ctx, ISA_MIPS4 | ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R1);
     }
 
     btarget = ctx->base.pc_next + 4 + offset;
@@ -14425,7 +14425,7 @@ static int decode_extended_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_arith_imm(ctx, OPC_ADDIU, 29, 29, imm);
             break;
         case I8_SVRS:
-            check_insn(ctx, ISA_MIPS32);
+            check_insn(ctx, ISA_MIPS_R1);
             {
                 int xsregs = (ctx->opcode >> 24) & 0x7;
                 int aregs = (ctx->opcode >> 16) & 0xf;
@@ -14675,7 +14675,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                               ((int8_t)ctx->opcode) << 3);
                 break;
             case I8_SVRS:
-                check_insn(ctx, ISA_MIPS32);
+                check_insn(ctx, ISA_MIPS_R1);
                 {
                     int do_ra = ctx->opcode & (1 << 6);
                     int do_s0 = ctx->opcode & (1 << 5);
@@ -14819,7 +14819,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                 int ra = (ctx->opcode >> 5) & 0x1;
 
                 if (nd) {
-                    check_insn(ctx, ISA_MIPS32);
+                    check_insn(ctx, ISA_MIPS_R1);
                 }
 
                 if (link) {
@@ -14840,7 +14840,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                  * XXX: not clear which exception should be raised
                  *      when in debug mode...
                  */
-                check_insn(ctx, ISA_MIPS32);
+                check_insn(ctx, ISA_MIPS_R1);
                 generate_exception_end(ctx, EXCP_DBp);
             }
             break;
@@ -14891,7 +14891,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_HILO(ctx, OPC_MFHI, 0, rx);
             break;
         case RR_CNVT:
-            check_insn(ctx, ISA_MIPS32);
+            check_insn(ctx, ISA_MIPS_R1);
             switch (cnvt_op) {
             case RR_RY_CNVT_ZEB:
                 tcg_gen_ext8u_tl(cpu_gpr[rx], cpu_gpr[rx]);
@@ -14907,12 +14907,12 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                 break;
 #if defined(TARGET_MIPS64)
             case RR_RY_CNVT_ZEW:
-                check_insn(ctx, ISA_MIPS32);
+                check_insn(ctx, ISA_MIPS_R1);
                 check_mips_64(ctx);
                 tcg_gen_ext32u_tl(cpu_gpr[rx], cpu_gpr[rx]);
                 break;
             case RR_RY_CNVT_SEW:
-                check_insn(ctx, ISA_MIPS32);
+                check_insn(ctx, ISA_MIPS_R1);
                 check_mips_64(ctx);
                 tcg_gen_ext32s_tl(cpu_gpr[rx], cpu_gpr[rx]);
                 break;
@@ -15831,7 +15831,7 @@ static void gen_pool16c_insn(DisasContext *ctx)
              * XXX: not clear which exception should be raised
              *      when in debug mode...
              */
-            check_insn(ctx, ISA_MIPS32);
+            check_insn(ctx, ISA_MIPS_R1);
             generate_exception_end(ctx, EXCP_DBp);
         }
         break;
@@ -16175,7 +16175,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
         case CLZ:
             mips32_op = OPC_CLZ;
         do_cl:
-            check_insn(ctx, ISA_MIPS32);
+            check_insn(ctx, ISA_MIPS_R1);
             gen_cl(ctx, mips32_op, rt, rs);
             break;
         case RDHWR:
@@ -16202,7 +16202,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
             mips32_op = OPC_DIVU;
             goto do_div;
         do_div:
-            check_insn(ctx, ISA_MIPS32);
+            check_insn(ctx, ISA_MIPS_R1);
             gen_muldiv(ctx, mips32_op, 0, rs, rt);
             break;
         case MADD:
@@ -16221,7 +16221,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
             check_insn_opc_removed(ctx, ISA_MIPS32R6);
             mips32_op = OPC_MSUBU;
         do_mul:
-            check_insn(ctx, ISA_MIPS32);
+            check_insn(ctx, ISA_MIPS_R1);
             gen_muldiv(ctx, mips32_op, 0, rs, rt);
             break;
         default:
@@ -16369,7 +16369,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
             if (is_uhi(extract32(ctx->opcode, 16, 10))) {
                 gen_helper_do_semihosting(cpu_env);
             } else {
-                check_insn(ctx, ISA_MIPS32);
+                check_insn(ctx, ISA_MIPS_R1);
                 if (ctx->hflags & MIPS_HFLAG_SBRI) {
                     generate_exception_end(ctx, EXCP_RI);
                 } else {
@@ -24889,7 +24889,7 @@ static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
     switch (op1) {
     case OPC_MOVN:         /* Conditional move */
     case OPC_MOVZ:
-        check_insn(ctx, ISA_MIPS4 | ISA_MIPS32 |
+        check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R1 |
                    INSN_LOONGSON2E | INSN_LOONGSON2F);
         gen_cond_move(ctx, op1, rd, rs, rt);
         break;
@@ -24902,7 +24902,7 @@ static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
         gen_HILO(ctx, op1, rd & 3, rs);
         break;
     case OPC_MOVCI:
-        check_insn(ctx, ISA_MIPS4 | ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R1);
         if (env->CP0_Config1 & (1 << CP0C1_FP)) {
             check_cp1_enabled(ctx);
             gen_movci(ctx, rd, rs, (ctx->opcode >> 18) & 0x7,
@@ -27577,7 +27577,7 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MADDU:
     case OPC_MSUB:
     case OPC_MSUBU:
-        check_insn(ctx, ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS_R1);
         gen_muldiv(ctx, op1, rd & 3, rs, rt);
         break;
     case OPC_MUL:
@@ -27594,7 +27594,7 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
         break;
     case OPC_CLO:
     case OPC_CLZ:
-        check_insn(ctx, ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS_R1);
         gen_cl(ctx, op1, rd, rs);
         break;
     case OPC_SDBBP:
@@ -27605,14 +27605,14 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
              * XXX: not clear which exception should be raised
              *      when in debug mode...
              */
-            check_insn(ctx, ISA_MIPS32);
+            check_insn(ctx, ISA_MIPS_R1);
             generate_exception_end(ctx, EXCP_DBp);
         }
         break;
 #if defined(TARGET_MIPS64)
     case OPC_DCLO:
     case OPC_DCLZ:
-        check_insn(ctx, ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS_R1);
         check_mips_64(ctx);
         gen_cl(ctx, op1, rd, rs);
         break;
@@ -31025,7 +31025,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     case OPC_CACHE:
         check_insn_opc_removed(ctx, ISA_MIPS32R6);
         check_cp0_enabled(ctx);
-        check_insn(ctx, ISA_MIPS3 | ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS3 | ISA_MIPS_R1);
         if (ctx->hflags & MIPS_HFLAG_ITC_CACHE) {
             gen_cache_operation(ctx, rt, rs, imm);
         }
@@ -31036,7 +31036,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         if (ctx->insn_flags & INSN_R5900) {
             /* Treat as NOP. */
         } else {
-            check_insn(ctx, ISA_MIPS4 | ISA_MIPS32);
+            check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R1);
             /* Treat as NOP. */
         }
         break;
-- 
2.26.2


