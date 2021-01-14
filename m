Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683772F65F7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:30:43 +0100 (CET)
Received: from localhost ([::1]:34594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05WE-0002et-De
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:30:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05MN-0003Te-5A
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:20:31 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05ML-0000IC-7g
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:20:30 -0500
Received: by mail-wm1-x32a.google.com with SMTP id g10so5202432wmh.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qKpP1ngTnTm1oCpGVbPgwRFR2uGYjvZbTadWh9mW2Mw=;
 b=gy4ESAPNJCsxd9p1zZGDz8+Z0iOZx5SxcxpGmHyjaVgD0BnKkae/bpd716RV3Er2/+
 rXdaG9a64E7Iuc9Xn3QKojXVGGn3939OvIlrz0FVEgQG79PLKdZjyO/CIq4RlrWDpzQ/
 uy40qDXkfZQELuKTD8u/uDaMeLpyUf8tKq90I9dnueV8CKj2YpGsgzVGI3S+SXivUGHM
 clato2mDT1SAcNHmP8F5D9o5WlV6R+sfrEFQdp1hInObvsWV6moVoxYHeMmPM2fkbV1R
 n8LBncsmztV2N+k/abQsUk3PiWGemXHTlCcAJ2w6hd4cir0nbGsOoIdPVRehlozR9WqI
 HKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qKpP1ngTnTm1oCpGVbPgwRFR2uGYjvZbTadWh9mW2Mw=;
 b=CILvt5D0x/RSzkXGXr3ClAC20Afxf+M8rATo9u4u+gULSgtJYsvBbf1RBwSpI0AR1m
 7XpO8ZxS7EcTC1DUvoJ7r+0xZt7eI27uhrgWbOmKNM9wLG4LiV7mIpwShYq55XqbYMw9
 5Hrn26KCMmYSE6tNn/TdTxWtrfxAWAFg5BdW4JwADQiB1+8bFm+oLGtD3k9Z3NA56ojs
 W1uGy/AQtcjuguRyTsWkZ0878sxrTwPMnuXbbCk+F5XDZmTLRCgJ295B9AybPZncwK4m
 Z+rjB9pn4Y7yoZl2NfxLfJ5f9W3idszsZKeJyPLLYtZ/wDCGOHLuVYNo4Dh4ukILpHLV
 A9mw==
X-Gm-Message-State: AOAM531TG7WRnZWyOpnOdGMmV5BCfa1r5Z82jih4hotLYe6HU5NEx8Zw
 tGKdHn2DPAux4khAcxUMFztCXjc6CqU=
X-Google-Smtp-Source: ABdhPJxRGZ33lAZ+sWDSifm5lQrVldCLBdS0TbpNFuckSC/bmSPsuREKGILmoLwQlCZccrXB74yM+g==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr4594763wmr.179.1610641225302; 
 Thu, 14 Jan 2021 08:20:25 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s1sm11272025wrv.97.2021.01.14.08.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:20:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Subject: [PULL v2 29/69] target/mips/translate: Add declarations for generic
 code
Date: Thu, 14 Jan 2021 17:20:00 +0100
Message-Id: <20210114162016.2901557-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114162016.2901557-1-f4bug@amsat.org>
References: <20210114162016.2901557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some CPU translation functions / registers / macros and
definitions can be used by ISA / ASE / extensions out of
the big translate.c file. Declare them in "translate.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201207235539.4070364-3-f4bug@amsat.org>
---
 target/mips/translate.h | 43 ++++++++++++++++++++++++++++++++++
 target/mips/translate.c | 52 +++++++++++------------------------------
 2 files changed, 57 insertions(+), 38 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index fcda1a99001..3d640912f12 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -10,6 +10,8 @@
 
 #include "exec/translator.h"
 
+#define MIPS_DEBUG_DISAS 0
+
 typedef struct DisasContext {
     DisasContextBase base;
     target_ulong saved_pc;
@@ -47,4 +49,45 @@ typedef struct DisasContext {
     int gi;
 } DisasContext;
 
+/* MIPS major opcodes */
+#define MASK_OP_MAJOR(op)   (op & (0x3F << 26))
+
+void generate_exception(DisasContext *ctx, int excp);
+void generate_exception_err(DisasContext *ctx, int excp, int err);
+void generate_exception_end(DisasContext *ctx, int excp);
+
+void check_insn(DisasContext *ctx, uint64_t flags);
+#ifdef TARGET_MIPS64
+void check_mips_64(DisasContext *ctx);
+#endif
+
+void gen_base_offset_addr(DisasContext *ctx, TCGv addr, int base, int offset);
+void gen_move_low32(TCGv ret, TCGv_i64 arg);
+void gen_move_high32(TCGv ret, TCGv_i64 arg);
+void gen_load_gpr(TCGv t, int reg);
+void gen_store_gpr(TCGv t, int reg);
+
+void gen_op_addr_add(DisasContext *ctx, TCGv ret, TCGv arg0, TCGv arg1);
+
+extern TCGv cpu_gpr[32], cpu_PC;
+extern TCGv bcond;
+
+#define LOG_DISAS(...)                                                        \
+    do {                                                                      \
+        if (MIPS_DEBUG_DISAS) {                                               \
+            qemu_log_mask(CPU_LOG_TB_IN_ASM, ## __VA_ARGS__);                 \
+        }                                                                     \
+    } while (0)
+
+#define MIPS_INVAL(op)                                                        \
+    do {                                                                      \
+        if (MIPS_DEBUG_DISAS) {                                               \
+            qemu_log_mask(CPU_LOG_TB_IN_ASM,                                  \
+                          TARGET_FMT_lx ": %08x Invalid %s %03x %03x %03x\n", \
+                          ctx->base.pc_next, ctx->opcode, op,                 \
+                          ctx->opcode >> 26, ctx->opcode & 0x3F,              \
+                          ((ctx->opcode >> 16) & 0x1F));                      \
+        }                                                                     \
+    } while (0)
+
 #endif
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 9e824e12d44..72cbf604ac3 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -38,11 +38,6 @@
 #include "fpu_helper.h"
 #include "translate.h"
 
-#define MIPS_DEBUG_DISAS 0
-
-/* MIPS major opcodes */
-#define MASK_OP_MAJOR(op)       (op & (0x3F << 26))
-
 enum {
     /* indirect opcode tables */
     OPC_SPECIAL  = (0x00 << 26),
@@ -2491,9 +2486,10 @@ enum {
 };
 
 /* global register indices */
-static TCGv cpu_gpr[32], cpu_PC;
+TCGv cpu_gpr[32], cpu_PC;
 static TCGv cpu_HI[MIPS_DSP_ACC], cpu_LO[MIPS_DSP_ACC];
-static TCGv cpu_dspctrl, btarget, bcond;
+static TCGv cpu_dspctrl, btarget;
+TCGv bcond;
 static TCGv cpu_lladdr, cpu_llval;
 static TCGv_i32 hflags;
 static TCGv_i32 fpu_fcr0, fpu_fcr31;
@@ -2606,26 +2602,8 @@ static const char * const mxuregnames[] = {
 };
 #endif
 
-#define LOG_DISAS(...)                                                        \
-    do {                                                                      \
-        if (MIPS_DEBUG_DISAS) {                                               \
-            qemu_log_mask(CPU_LOG_TB_IN_ASM, ## __VA_ARGS__);                 \
-        }                                                                     \
-    } while (0)
-
-#define MIPS_INVAL(op)                                                        \
-    do {                                                                      \
-        if (MIPS_DEBUG_DISAS) {                                               \
-            qemu_log_mask(CPU_LOG_TB_IN_ASM,                                  \
-                          TARGET_FMT_lx ": %08x Invalid %s %03x %03x %03x\n", \
-                          ctx->base.pc_next, ctx->opcode, op,                 \
-                          ctx->opcode >> 26, ctx->opcode & 0x3F,              \
-                          ((ctx->opcode >> 16) & 0x1F));                      \
-        }                                                                     \
-    } while (0)
-
 /* General purpose registers moves. */
-static inline void gen_load_gpr(TCGv t, int reg)
+void gen_load_gpr(TCGv t, int reg)
 {
     if (reg == 0) {
         tcg_gen_movi_tl(t, 0);
@@ -2634,7 +2612,7 @@ static inline void gen_load_gpr(TCGv t, int reg)
     }
 }
 
-static inline void gen_store_gpr(TCGv t, int reg)
+void gen_store_gpr(TCGv t, int reg)
 {
     if (reg != 0) {
         tcg_gen_mov_tl(cpu_gpr[reg], t);
@@ -2763,7 +2741,7 @@ static inline void restore_cpu_state(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-static inline void generate_exception_err(DisasContext *ctx, int excp, int err)
+void generate_exception_err(DisasContext *ctx, int excp, int err)
 {
     TCGv_i32 texcp = tcg_const_i32(excp);
     TCGv_i32 terr = tcg_const_i32(err);
@@ -2774,12 +2752,12 @@ static inline void generate_exception_err(DisasContext *ctx, int excp, int err)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-static inline void generate_exception(DisasContext *ctx, int excp)
+void generate_exception(DisasContext *ctx, int excp)
 {
     gen_helper_0e0i(raise_exception, excp);
 }
 
-static inline void generate_exception_end(DisasContext *ctx, int excp)
+void generate_exception_end(DisasContext *ctx, int excp)
 {
     generate_exception_err(ctx, excp, 0);
 }
@@ -2859,8 +2837,7 @@ static inline int get_fp_bit(int cc)
 }
 
 /* Addresses computation */
-static inline void gen_op_addr_add(DisasContext *ctx, TCGv ret, TCGv arg0,
-                                   TCGv arg1)
+void gen_op_addr_add(DisasContext *ctx, TCGv ret, TCGv arg0, TCGv arg1)
 {
     tcg_gen_add_tl(ret, arg0, arg1);
 
@@ -2898,7 +2875,7 @@ static target_long addr_add(DisasContext *ctx, target_long base,
 }
 
 /* Sign-extract the low 32-bits to a target_long.  */
-static inline void gen_move_low32(TCGv ret, TCGv_i64 arg)
+void gen_move_low32(TCGv ret, TCGv_i64 arg)
 {
 #if defined(TARGET_MIPS64)
     tcg_gen_ext32s_i64(ret, arg);
@@ -2908,7 +2885,7 @@ static inline void gen_move_low32(TCGv ret, TCGv_i64 arg)
 }
 
 /* Sign-extract the high 32-bits to a target_long.  */
-static inline void gen_move_high32(TCGv ret, TCGv_i64 arg)
+void gen_move_high32(TCGv ret, TCGv_i64 arg)
 {
 #if defined(TARGET_MIPS64)
     tcg_gen_sari_i64(ret, arg, 32);
@@ -3013,7 +2990,7 @@ static inline void check_dsp_r3(DisasContext *ctx)
  * This code generates a "reserved instruction" exception if the
  * CPU does not support the instruction set corresponding to flags.
  */
-static inline void check_insn(DisasContext *ctx, uint64_t flags)
+void check_insn(DisasContext *ctx, uint64_t flags)
 {
     if (unlikely(!(ctx->insn_flags & flags))) {
         generate_exception_end(ctx, EXCP_RI);
@@ -3064,7 +3041,7 @@ static inline void check_ps(DisasContext *ctx)
  * This code generates a "reserved instruction" exception if 64-bit
  * instructions are not enabled.
  */
-static inline void check_mips_64(DisasContext *ctx)
+void check_mips_64(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_64))) {
         generate_exception_end(ctx, EXCP_RI);
@@ -3390,8 +3367,7 @@ OP_LD_ATOMIC(lld, ld64);
 #endif
 #undef OP_LD_ATOMIC
 
-static void gen_base_offset_addr(DisasContext *ctx, TCGv addr,
-                                 int base, int offset)
+void gen_base_offset_addr(DisasContext *ctx, TCGv addr, int base, int offset)
 {
     if (base == 0) {
         tcg_gen_movi_tl(addr, offset);
-- 
2.26.2


