Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA7F2DC45E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:36:49 +0100 (CET)
Received: from localhost ([::1]:55924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZnE-0003gS-8t
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZfE-0005L7-4R
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:28:33 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZfA-0007mh-Qw
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:28:30 -0500
Received: by mail-wr1-x433.google.com with SMTP id 91so23770111wrj.7
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qN7CTgScsw9dE+yAsjz79vuuM7MiYVm5Hm+COo7pFZM=;
 b=k6nMyNMwTTIv1edKkvBC+ENYUirkoIEt4DHnbebGBg0b59z6PQgnwA4WWhwD/dIlh3
 w08tJSpqUaRu+EGofLusn1cYN5Cr7OqU6MZ4wFaHkwQR6cZrbZfH2G/4rr/15tK+GjW3
 pRCw3u5eXnIEQCsyvtXFRGM6sv7zHiQrNeuAkUWdB8eahynlWVOApUpi/vW2CJvUXEvJ
 flNTTKTd5ReucjlEr4D4imGkRN+pHAYlvZn1eHslKviisshytQAkIdT5x4jOD0tUfFUK
 PojYs8YJkIwejMYux0B97qE5mcRgciHSyXXreTb3NsclYH7h3ZDd6HMUwkw2Zo2d2GdL
 M//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qN7CTgScsw9dE+yAsjz79vuuM7MiYVm5Hm+COo7pFZM=;
 b=EmOSODG2l+KsF0B66/+P6sku2TXv2lmbkIU7n9tPkrNz/XDL4AEjCp0do+imjb7Ism
 QutdzIhvzHh+WIAACu/NFzp7AY0Q94HJEo3Fkz5tPQhXMeBTwFw4ckFBjhpvrEz2rDEb
 Qw+bX/Pj2SOmwjxkYoIDp14wos8BRXXU08QZAZJuIN5ppXANyXg8GJDE5oWeDG76hcic
 /zE/mUXALIwV4IV1vE936ga93puQXCXrGo+lpHQU/twAoHpapB+t1P8TlOGa8p0NPuEa
 AneViGCqCNgSJxsF6HTZQ0p9qX7payB8eUFajy2uBDmjtbX+henzSXXvtzrswd2c/SgT
 O6OA==
X-Gm-Message-State: AOAM530IYBY0jbxjmQDSdA5RhZbsmjM0PV52uf7K+dlTrIjyonn3pcE+
 FK3UMNIzdtXt7K+2COvsxARKtb+nwxY=
X-Google-Smtp-Source: ABdhPJxs5e70LYcTrZ3DyJBsmrw10W25I/WZOP5HdWLaHv+FUh33wYHGxHgNl2W+EJn5dqlIMT5yyw==
X-Received: by 2002:adf:8143:: with SMTP id 61mr38235728wrm.318.1608136107076; 
 Wed, 16 Dec 2020 08:28:27 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id x25sm3312251wmc.3.2020.12.16.08.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:28:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/12] target/mips/mips-defs: Rename ISA_MIPS32 as
 ISA_MIPS_R1
Date: Wed, 16 Dec 2020 17:27:40 +0100
Message-Id: <20201216162744.895920-9-f4bug@amsat.org>
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

The MIPS ISA release '1' is common to 32/64-bit CPUs.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h  |  2 +-
 target/mips/mips-defs.h |  4 +--
 target/mips/translate.c | 54 ++++++++++++++++++++---------------------
 3 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 97899dbd3c8..f71c617a1fe 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -365,7 +365,7 @@ static inline void compute_hflags(CPUMIPSState *env)
         if (env->active_fpu.fcr0 & (1 << FCR0_F64)) {
             env->hflags |= MIPS_HFLAG_COP1X;
         }
-    } else if (env->insn_flags & ISA_MIPS32) {
+    } else if (env->insn_flags & ISA_MIPS_R1) {
         if (env->hflags & MIPS_HFLAG_64) {
             env->hflags |= MIPS_HFLAG_COP1X;
         }
diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index df2ffae5718..31c02cc20ef 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -22,7 +22,7 @@
 #define ISA_MIPS3         0x0000000000000004ULL /* 64-bit */
 #define ISA_MIPS4         0x0000000000000008ULL
 #define ISA_MIPS5         0x0000000000000010ULL
-#define ISA_MIPS32        0x0000000000000020ULL
+#define ISA_MIPS_R1       0x0000000000000020ULL
 #define ISA_MIPS32R2      0x0000000000000040ULL
 #define ISA_MIPS32R3      0x0000000000000200ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
@@ -72,7 +72,7 @@
 #define CPU_LOONGSON2F  (CPU_MIPS3 | INSN_LOONGSON2F | ASE_LMMI)
 
 /* MIPS Technologies "Release 1" */
-#define CPU_MIPS32      (CPU_MIPS2 | ISA_MIPS32)
+#define CPU_MIPS32      (CPU_MIPS2 | ISA_MIPS_R1)
 #define CPU_MIPS64      (CPU_MIPS5 | CPU_MIPS32)
 
 /* MIPS Technologies "Release 2" */
diff --git a/target/mips/translate.c b/target/mips/translate.c
index f32b5ebdd7e..62825dba2fd 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -7006,7 +7006,7 @@ static void gen_mfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     const char *register_name = "invalid";
 
     if (sel != 0) {
-        check_insn(ctx, ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS_R1);
     }
 
     switch (reg) {
@@ -7774,7 +7774,7 @@ static void gen_mtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     const char *register_name = "invalid";
 
     if (sel != 0) {
-        check_insn(ctx, ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS_R1);
     }
 
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
@@ -8538,7 +8538,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     const char *register_name = "invalid";
 
     if (sel != 0) {
-        check_insn(ctx, ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS_R1);
     }
 
     switch (reg) {
@@ -9264,7 +9264,7 @@ static void gen_dmtc0(DisasContext *ctx, TCGv arg, int reg, int sel)
     const char *register_name = "invalid";
 
     if (sel != 0) {
-        check_insn(ctx, ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS_R1);
     }
 
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
@@ -10601,7 +10601,7 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
         break;
     case OPC_DERET:
         opn = "deret";
-        check_insn(ctx, ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS_R1);
         if ((ctx->insn_flags & ISA_MIPS32R6) &&
             (ctx->hflags & MIPS_HFLAG_BMASK)) {
             goto die;
@@ -10616,7 +10616,7 @@ static void gen_cp0(CPUMIPSState *env, DisasContext *ctx, uint32_t opc,
         break;
     case OPC_WAIT:
         opn = "wait";
-        check_insn(ctx, ISA_MIPS3 | ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS3 | ISA_MIPS_R1);
         if ((ctx->insn_flags & ISA_MIPS32R6) &&
             (ctx->hflags & MIPS_HFLAG_BMASK)) {
             goto die;
@@ -10651,7 +10651,7 @@ static void gen_compute_branch1(DisasContext *ctx, uint32_t op,
     }
 
     if (cc != 0) {
-        check_insn(ctx, ISA_MIPS4 | ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R1);
     }
 
     btarget = ctx->base.pc_next + 4 + offset;
@@ -14020,7 +14020,7 @@ static int decode_extended_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_arith_imm(ctx, OPC_ADDIU, 29, 29, imm);
             break;
         case I8_SVRS:
-            check_insn(ctx, ISA_MIPS32);
+            check_insn(ctx, ISA_MIPS_R1);
             {
                 int xsregs = (ctx->opcode >> 24) & 0x7;
                 int aregs = (ctx->opcode >> 16) & 0xf;
@@ -14270,7 +14270,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                               ((int8_t)ctx->opcode) << 3);
                 break;
             case I8_SVRS:
-                check_insn(ctx, ISA_MIPS32);
+                check_insn(ctx, ISA_MIPS_R1);
                 {
                     int do_ra = ctx->opcode & (1 << 6);
                     int do_s0 = ctx->opcode & (1 << 5);
@@ -14414,7 +14414,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                 int ra = (ctx->opcode >> 5) & 0x1;
 
                 if (nd) {
-                    check_insn(ctx, ISA_MIPS32);
+                    check_insn(ctx, ISA_MIPS_R1);
                 }
 
                 if (link) {
@@ -14435,7 +14435,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
                  * XXX: not clear which exception should be raised
                  *      when in debug mode...
                  */
-                check_insn(ctx, ISA_MIPS32);
+                check_insn(ctx, ISA_MIPS_R1);
                 generate_exception_end(ctx, EXCP_DBp);
             }
             break;
@@ -14486,7 +14486,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
             gen_HILO(ctx, OPC_MFHI, 0, rx);
             break;
         case RR_CNVT:
-            check_insn(ctx, ISA_MIPS32);
+            check_insn(ctx, ISA_MIPS_R1);
             switch (cnvt_op) {
             case RR_RY_CNVT_ZEB:
                 tcg_gen_ext8u_tl(cpu_gpr[rx], cpu_gpr[rx]);
@@ -14502,12 +14502,12 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
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
@@ -15426,7 +15426,7 @@ static void gen_pool16c_insn(DisasContext *ctx)
              * XXX: not clear which exception should be raised
              *      when in debug mode...
              */
-            check_insn(ctx, ISA_MIPS32);
+            check_insn(ctx, ISA_MIPS_R1);
             generate_exception_end(ctx, EXCP_DBp);
         }
         break;
@@ -15770,7 +15770,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
         case CLZ:
             mips32_op = OPC_CLZ;
         do_cl:
-            check_insn(ctx, ISA_MIPS32);
+            check_insn(ctx, ISA_MIPS_R1);
             gen_cl(ctx, mips32_op, rt, rs);
             break;
         case RDHWR:
@@ -15797,7 +15797,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
             mips32_op = OPC_DIVU;
             goto do_div;
         do_div:
-            check_insn(ctx, ISA_MIPS32);
+            check_insn(ctx, ISA_MIPS_R1);
             gen_muldiv(ctx, mips32_op, 0, rs, rt);
             break;
         case MADD:
@@ -15816,7 +15816,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
             check_insn_opc_removed(ctx, ISA_MIPS32R6);
             mips32_op = OPC_MSUBU;
         do_mul:
-            check_insn(ctx, ISA_MIPS32);
+            check_insn(ctx, ISA_MIPS_R1);
             gen_muldiv(ctx, mips32_op, 0, rs, rt);
             break;
         default:
@@ -15964,7 +15964,7 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
             if (is_uhi(extract32(ctx->opcode, 16, 10))) {
                 gen_helper_do_semihosting(cpu_env);
             } else {
-                check_insn(ctx, ISA_MIPS32);
+                check_insn(ctx, ISA_MIPS_R1);
                 if (ctx->hflags & MIPS_HFLAG_SBRI) {
                     gen_reserved_instruction(ctx);
                 } else {
@@ -24482,7 +24482,7 @@ static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
     switch (op1) {
     case OPC_MOVN:         /* Conditional move */
     case OPC_MOVZ:
-        check_insn(ctx, ISA_MIPS4 | ISA_MIPS32 |
+        check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R1 |
                    INSN_LOONGSON2E | INSN_LOONGSON2F);
         gen_cond_move(ctx, op1, rd, rs, rt);
         break;
@@ -24495,7 +24495,7 @@ static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
         gen_HILO(ctx, op1, rd & 3, rs);
         break;
     case OPC_MOVCI:
-        check_insn(ctx, ISA_MIPS4 | ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R1);
         if (env->CP0_Config1 & (1 << CP0C1_FP)) {
             check_cp1_enabled(ctx);
             gen_movci(ctx, rd, rs, (ctx->opcode >> 18) & 0x7,
@@ -27168,7 +27168,7 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MADDU:
     case OPC_MSUB:
     case OPC_MSUBU:
-        check_insn(ctx, ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS_R1);
         gen_muldiv(ctx, op1, rd & 3, rs, rt);
         break;
     case OPC_MUL:
@@ -27185,7 +27185,7 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
         break;
     case OPC_CLO:
     case OPC_CLZ:
-        check_insn(ctx, ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS_R1);
         gen_cl(ctx, op1, rd, rs);
         break;
     case OPC_SDBBP:
@@ -27196,14 +27196,14 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
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
@@ -28643,7 +28643,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
     case OPC_CACHE:
         check_insn_opc_removed(ctx, ISA_MIPS32R6);
         check_cp0_enabled(ctx);
-        check_insn(ctx, ISA_MIPS3 | ISA_MIPS32);
+        check_insn(ctx, ISA_MIPS3 | ISA_MIPS_R1);
         if (ctx->hflags & MIPS_HFLAG_ITC_CACHE) {
             gen_cache_operation(ctx, rt, rs, imm);
         }
@@ -28654,7 +28654,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
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


