Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FE12EE8F8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:43:40 +0100 (CET)
Received: from localhost ([::1]:56300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxe0J-0002JB-6O
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdij-0000qw-DV
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:31 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:55676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdih-0005TX-Nk
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:29 -0500
Received: by mail-wm1-x32b.google.com with SMTP id c124so6332008wma.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Md8yMDtPFL047sc9GnACrU93Gm/4UH0JKJe4iaxMljk=;
 b=X4nwephvCpgQ7l/2883pUwoLMNiDzUE1j1rfFaJVmSKy4o29ohYBVuxWnjIBfD3Eiq
 XgIbI1Oz5zyYVFgWt2gI1ANeQ3yYpWQT3AmrSnOoj9lp+q4g+VR6ISX4BexFkPVACS0v
 21pBZEbtyrYqgT4Ea6MoCeUx2N9F8lARCyaToUTZ9X73k03/O6zBHQhr157eHOqIIz9E
 MoBC6QayCgUCLAEZQe4vnl8FyFfTvzIXbey3n2C3r1q3I+yQrH5MVVR55MtapRjlLOAT
 104sNE59nM9TfgrrcQafz4lpk4hUlZEntTCeUuKXMT5cIV+XAhrkRvdh4G7cxPOiSrU5
 bAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Md8yMDtPFL047sc9GnACrU93Gm/4UH0JKJe4iaxMljk=;
 b=IoF7vuDOxM2rfXnOPJb2WQwX54QDE6tz+DjFYA720jXcW1FVHw/kC3SJ5ewCOj3Pua
 hMy0KQsg5QyM2etnZkYLmMLTRaflbhU3F5Yxp63wKVbp9QlKno/keC22HnUegZcndYSS
 J710IZWUvdqj77lzluog0wHAkDP96gmnHKxCSkytx4AuLvO2V4slGWVDNyi/OCiDj30X
 4DJL/nlaHy4ZLTwapAsCcq2IoW74/cnZAEuWLxj+WPvU41hOTHwbPq02okvDaYQO+zeu
 BY8ZCdyFLUrqac67bUZTx+yBmatuJIbFUy6Dk2GWa50dk/ApsBhX36QqOAJPxcMY8aDS
 Nmeg==
X-Gm-Message-State: AOAM532nNV0f6m0wu9s3ce6asg9Xqtkonjg5qZs5LR3mWFa6ypCNAPhx
 kdkGrtF5gC+nt1IOKnG3Wleg/crySD0=
X-Google-Smtp-Source: ABdhPJx/wlXEytr69sTyc89ncUwNXATKyBRfUcaBAbtdnUC6Nhbkylim6JvAaQ2HSmkJNXRQw6PVOQ==
X-Received: by 2002:a7b:c7d3:: with SMTP id z19mr521782wmk.31.1610058326194;
 Thu, 07 Jan 2021 14:25:26 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id w21sm9110700wmi.45.2021.01.07.14.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:25:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/66] target/mips/translate: Add declarations for generic code
Date: Thu,  7 Jan 2021 23:22:16 +0100
Message-Id: <20210107222253.20382-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201207235539.4070364-3-f4bug@amsat.org>
---
 target/mips/translate.h | 38 ++++++++++++++++++++++++++++++++++
 target/mips/translate.c | 45 ++++++++++-------------------------------
 2 files changed, 49 insertions(+), 34 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index fcda1a99001..d9d4d3943af 100644
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
+void generate_exception(DisasContext *ctx, int excp);
+void generate_exception_err(DisasContext *ctx, int excp, int err);
+void generate_exception_end(DisasContext *ctx, int excp);
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
index 9e824e12d44..5889d24eb65 100644
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
@@ -3013,7 +2991,7 @@ static inline void check_dsp_r3(DisasContext *ctx)
  * This code generates a "reserved instruction" exception if the
  * CPU does not support the instruction set corresponding to flags.
  */
-static inline void check_insn(DisasContext *ctx, uint64_t flags)
+void check_insn(DisasContext *ctx, uint64_t flags)
 {
     if (unlikely(!(ctx->insn_flags & flags))) {
         generate_exception_end(ctx, EXCP_RI);
@@ -3064,7 +3042,7 @@ static inline void check_ps(DisasContext *ctx)
  * This code generates a "reserved instruction" exception if 64-bit
  * instructions are not enabled.
  */
-static inline void check_mips_64(DisasContext *ctx)
+void check_mips_64(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_64))) {
         generate_exception_end(ctx, EXCP_RI);
@@ -3390,8 +3368,7 @@ OP_LD_ATOMIC(lld, ld64);
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


