Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D648D2D9F9D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:53:43 +0100 (CET)
Received: from localhost ([::1]:47828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kosyc-0004SA-Qd
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koskJ-0000Kf-DW
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:55 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koskG-0007UV-Pd
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:54 -0500
Received: by mail-wm1-x343.google.com with SMTP id c133so2673467wme.4
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sGSxHagedQ+yelQida/tJJ2/RA7bkSvNOfSJ4MvCHXk=;
 b=PdSHiahu3St5VPIxw5aGKQa7K7soukaPOYYVdf/QPSoLLOBPUeVCn0gowQsQAr7YYE
 NLJhufzfKz0zIQTMtTCQ+ocR6odMrWjCl5njCq8vxlTqVrRn7MLPY/bj13uxoVZks4kZ
 lI+YMmJ87KZKix9XH12FDURZPfZooNyoIpqMNq9ZxMbdsm+QEKq+CJDzIkxxELwFrKdc
 2E0yD6cHl61TCXsXrz+BOta+Rv8tB4cV1GGBwt2tggbizC7hTjEKeXgtgwreqtgmi4hx
 a7fLRTp+OcP0pDMU7cfusvzEfSGdMGQ34/dd+RypzUSU5dvpgFmrqMNDzVV8svgQVGkM
 wKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sGSxHagedQ+yelQida/tJJ2/RA7bkSvNOfSJ4MvCHXk=;
 b=A14tT8p8AiUdfc3Hp8mooBvxYYNdcm0EHI/p7C93ANlKXsIztNsTLdVWZM2vRn3E5C
 RJgzUC7P0WveECgExUXEXnkqIZAYGUfODKrDpB4TKD53R+jNyBm/HRXuMIJnOG4hW/Pk
 /vGyZ8QG2mG4WVsJNH5/64ZwidUOzJAIQaaAmZfk/dc9L3tJYxbUNgf3qeQbyXhLmQA2
 /3yWVj+Z8+he6TpzY8GzNRAmbVraW8lONR3/ZxwYRY1KKLe7n4XY0kKdHmVWruV47U1y
 Y9/tExqFT39M/NMafkaA8OZLAxZv8sCvUymThNqb3gDLFWlJkuEN9RsP1gSG/fMrHczJ
 Pnuw==
X-Gm-Message-State: AOAM530uMkLvmKmdf+q8Mn+M5fwa06DYHfutH42ghvlZ4vC+bglelj8O
 B5cd+U6ACjQOoLte/19hvDkVBRDZzGE=
X-Google-Smtp-Source: ABdhPJwlWmaCfmRQI8uZTvnZeWtXOWcn1UpyDEcuDiHJq+ZLXK9T69n/wJpn/e+Xd/au+GiANqM0BA==
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr29697641wmm.122.1607971128564; 
 Mon, 14 Dec 2020 10:38:48 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id q1sm31550246wrj.8.2020.12.14.10.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 10:38:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/16] target/mips/translate: Add declarations for generic
 code
Date: Mon, 14 Dec 2020 19:37:36 +0100
Message-Id: <20201214183739.500368-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214183739.500368-1-f4bug@amsat.org>
References: <20201214183739.500368-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some CPU translation functions / registers / macros and
definitions can be used by ISA / ASE / extensions out of
the big translate.c file. Declare them in "translate.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201207235539.4070364-3-f4bug@amsat.org>
---
 target/mips/translate.h | 38 ++++++++++++++++++++++++++++++++
 target/mips/translate.c | 48 +++++++++++++----------------------------
 2 files changed, 53 insertions(+), 33 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index fcda1a99001..989d6c43207 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -10,6 +10,8 @@
 
 #include "exec/translator.h"
 
+#define MIPS_DEBUG_DISAS 0
+
 typedef struct DisasContext {
     DisasContextBase base;
     target_ulong saved_pc;
@@ -47,4 +49,40 @@ typedef struct DisasContext {
     int gi;
 } DisasContext;
 
+/* MIPS major opcodes */
+#define MASK_OP_MAJOR(op)   (op & (0x3F << 26))
+
+void generate_exception_err(DisasContext *ctx, int excp, int err);
+void generate_exception_end(DisasContext *ctx, int excp);
+void gen_reserved_instruction(DisasContext *ctx);
+void check_insn(DisasContext *ctx, uint64_t flags);
+#ifdef TARGET_MIPS64
+void check_mips_64(DisasContext *ctx);
+#endif
+
+void gen_base_offset_addr(DisasContext *ctx, TCGv addr, int base, int offset);
+void gen_load_gpr(TCGv t, int reg);
+void gen_store_gpr(TCGv t, int reg);
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
index 0db0fce3789..318642cbcfe 100644
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
@@ -2779,11 +2757,16 @@ static inline void generate_exception(DisasContext *ctx, int excp)
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
@@ -3013,7 +2996,7 @@ static inline void check_dsp_r3(DisasContext *ctx)
  * This code generates a "reserved instruction" exception if the
  * CPU does not support the instruction set corresponding to flags.
  */
-static inline void check_insn(DisasContext *ctx, uint64_t flags)
+void check_insn(DisasContext *ctx, uint64_t flags)
 {
     if (unlikely(!(ctx->insn_flags & flags))) {
         gen_reserved_instruction(ctx);
@@ -3064,7 +3047,7 @@ static inline void check_ps(DisasContext *ctx)
  * This code generates a "reserved instruction" exception if 64-bit
  * instructions are not enabled.
  */
-static inline void check_mips_64(DisasContext *ctx)
+void check_mips_64(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_64))) {
         gen_reserved_instruction(ctx);
@@ -3390,8 +3373,7 @@ OP_LD_ATOMIC(lld, ld64);
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


