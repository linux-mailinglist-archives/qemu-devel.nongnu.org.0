Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38F42D1EB2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 00:57:55 +0100 (CET)
Received: from localhost ([::1]:48308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmQOA-0005bk-Qh
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 18:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmQMG-00040c-F1
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:55:56 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:40511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmQMD-00047O-Re
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:55:56 -0500
Received: by mail-ej1-x644.google.com with SMTP id x16so22045840ejj.7
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 15:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=id6OmDgw7iWNDI7dt45hX8qgU9Twf4yyUu+1zQG1NFY=;
 b=aHsv2dYNJ008+x9hkHPl4FOfen0SZ1OFwpinszYcZJUz+aP9aeyUN1ZcOLNMeTPR50
 lI/ejL8HdgXAZsiY57Jl0QAHgMmoysWwCL0l1Tu3q5n2BHqwGYzDOVivI3p5jFxkcnCE
 ABPkRxp4fIbSxeoVy1JEPiu9fcIy99yx87VuzMAlAZ26vmcwgEAQs3XhzyV1awnZO4QV
 MaxrHcvUbDk+RaQY0ffo5n19JOVoRUoLIepHvym3qPUjzBLRH/o/K/+R/vt26JDro9Rd
 l+pAm0HYemD2BOkeugi7F/xLOSs7N4iGMsaxc5wXGRescT5+e0Owb8p+i42BUISEP28K
 0tDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=id6OmDgw7iWNDI7dt45hX8qgU9Twf4yyUu+1zQG1NFY=;
 b=FXC/cHUnPSP5ovr8EVwxgrH/F24c0YZvcXlHP7JTnP74nbIv79RwNEEYW201p2i+2O
 Mx4t0PTOM4s46WOxmZUuUy4iMwF2eR7+3rBhG2tbFU2FNdRBIqMHuFlqDdsOw/Z0v8uL
 344DN//Mg/yH+Jdt1aB3d0RQixuhT6ulav2kVT3MygYpeIHd22ZnNJhbvfL9tDkvIahx
 9EsoeagSKy1qErCImiDSSWe7JTty0eQpZQrb3+cwZ1/sM4S2EeyRhX4JoUxi1GoYbkdd
 6p3dNzphtCZW20FX5LHOxk0qAq/RHMSeT66I1teo64dBmn177jKyb5dJ5x7mP/rsE1HU
 wcHA==
X-Gm-Message-State: AOAM5338q6yNfRVu75V9JNaYL+urY8xdEOKDCFHUD+yRpVLYOalJZi2c
 XrWZFY9NlJeKF1LbwC4sVVqjzaHVTb8=
X-Google-Smtp-Source: ABdhPJxc/ZEpdrjqB80I8uVnrTgzwjQBANtrdvqXUbG5/8NG8ImZsDEWaQuhsSszKycsr6gLE2fCTA==
X-Received: by 2002:a17:906:229a:: with SMTP id
 p26mr21204396eja.291.1607385352216; 
 Mon, 07 Dec 2020 15:55:52 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id be6sm15474616edb.29.2020.12.07.15.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 15:55:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] target/mips/translate: Add declarations for generic code
Date: Tue,  8 Dec 2020 00:55:34 +0100
Message-Id: <20201207235539.4070364-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207235539.4070364-1-f4bug@amsat.org>
References: <20201207235539.4070364-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x644.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some CPU translation functions / registers / macros and
definitions can be used by ISA / ASE / extensions out of
the big translate.c file. Declare them in "translate.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h | 33 ++++++++++++++++++++++++++++++++
 target/mips/translate.c | 42 ++++++++++++-----------------------------
 2 files changed, 45 insertions(+), 30 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index fcda1a99001..dbf7df7ba6d 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -10,6 +10,8 @@
 
 #include "exec/translator.h"
 
+#define MIPS_DEBUG_DISAS 0
+
 typedef struct DisasContext {
     DisasContextBase base;
     target_ulong saved_pc;
@@ -47,4 +49,35 @@ typedef struct DisasContext {
     int gi;
 } DisasContext;
 
+/* MIPS major opcodes */
+#define MASK_OP_MAJOR(op)   (op & (0x3F << 26))
+
+void generate_exception_end(DisasContext *ctx, int excp);
+void gen_reserved_instruction(DisasContext *ctx);
+void check_insn(DisasContext *ctx, uint64_t flags);
+void gen_base_offset_addr(DisasContext *ctx, TCGv addr, int base, int offset);
+
+void gen_load_gpr(TCGv t, int reg);
+void gen_store_gpr(TCGv t, int reg);
+
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
index d7f5a1e8d84..46aab26b868 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -41,11 +41,6 @@
 #include "qemu/qemu-print.h"
 #include "translate.h"
 
-#define MIPS_DEBUG_DISAS 0
-
-/* MIPS major opcodes */
-#define MASK_OP_MAJOR(op)       (op & (0x3F << 26))
-
 enum {
     /* indirect opcode tables */
     OPC_SPECIAL  = (0x00 << 26),
@@ -2496,7 +2491,8 @@ enum {
 /* global register indices */
 static TCGv cpu_gpr[32], cpu_PC;
 static TCGv cpu_HI[MIPS_DSP_ACC], cpu_LO[MIPS_DSP_ACC];
-static TCGv cpu_dspctrl, btarget, bcond;
+static TCGv cpu_dspctrl, btarget;
+TCGv bcond;
 static TCGv cpu_lladdr, cpu_llval;
 static TCGv_i32 hflags;
 static TCGv_i32 fpu_fcr0, fpu_fcr31;
@@ -2609,26 +2605,8 @@ static const char * const mxuregnames[] = {
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
@@ -2637,7 +2615,7 @@ static inline void gen_load_gpr(TCGv t, int reg)
     }
 }
 
-static inline void gen_store_gpr(TCGv t, int reg)
+void gen_store_gpr(TCGv t, int reg)
 {
     if (reg != 0) {
         tcg_gen_mov_tl(cpu_gpr[reg], t);
@@ -2782,11 +2760,16 @@ static inline void generate_exception(DisasContext *ctx, int excp)
     gen_helper_0e0i(raise_exception, excp);
 }
 
-static inline void generate_exception_end(DisasContext *ctx, int excp)
+void generate_exception_end(DisasContext *ctx, int excp)
 {
     generate_exception_err(ctx, excp, 0);
 }
 
+void gen_reserved_instruction(DisasContext *ctx)
+{
+    generate_exception_end(ctx, EXCP_RI);
+}
+
 /* Floating point register moves. */
 static void gen_load_fpr32(DisasContext *ctx, TCGv_i32 t, int reg)
 {
@@ -3016,7 +2999,7 @@ static inline void check_dsp_r3(DisasContext *ctx)
  * This code generates a "reserved instruction" exception if the
  * CPU does not support the instruction set corresponding to flags.
  */
-static inline void check_insn(DisasContext *ctx, uint64_t flags)
+void check_insn(DisasContext *ctx, uint64_t flags)
 {
     if (unlikely(!(ctx->insn_flags & flags))) {
         generate_exception_end(ctx, EXCP_RI);
@@ -3393,8 +3376,7 @@ OP_LD_ATOMIC(lld, ld64);
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


