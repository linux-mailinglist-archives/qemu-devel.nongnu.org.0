Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217D36064D9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:43:22 +0200 (CEST)
Received: from localhost ([::1]:53040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXhS-0007er-00
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:43:17 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXek-00012U-4J
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU87-0005Xo-Em
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:42 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7r-0000vQ-35
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:29 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so3203070pjq.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=94oYi6qSBfqA1oazWrkf/ulLAerLJ7dpQkS9HhuG7xA=;
 b=xUAVWnkyeulLiKor+AUJDIIJ63zodwPv+90Z4CXUFUL5izLOLt4pxXhh6vFAeXXtR/
 kRmeKE0Txds2jPhkim2ybNKjWrx3Ecl56IkrBzHGAshBROwvdRSG3Lswb3ZbnabEpk5T
 F6g2hOeN/cBZN7Pz3+WXnH+RDaxaop0cpM2/ZAqdb27nXWJKC0KtxxkfPDFxQzyeskPB
 Hp3toxbTo0Uhjt8zgnS/e/PDEkQIq7YH7x/QJOyYLLCTfzCRS0X5i0cT1EpD7opG/7rA
 0b4WK4JBejZp+qSzWKZkcY2vRnBSe3fAF1wJkUt0v47oHqJV0LKJjiqe5eglVqHOd0xu
 Ze3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=94oYi6qSBfqA1oazWrkf/ulLAerLJ7dpQkS9HhuG7xA=;
 b=3YpUIb4FMo8jSV3VeukK4jGnykH11myF2HLnuLAhZWo8DYp4gYWNUoRBXQqD8f6sos
 0T0Ar9q3E5SrQd/DyhzEZGhbgJTjeLhIKKgLHcq6arfF8In6ptQEF98yyriPM6kH718V
 HfxuzQqS10CG8M9S8TZOi6NI4pDLf105CJK0UkYLcTu/rZlzUVrwqFj+uLNm1Wp0jYlx
 7GCRD63m08O413MuHgw1/suNajyBgPMYqWuyuIXJ07sRA5RbvDtfAmKSWf0++5y8RZqf
 hJRYP6o0dKGEdL/VtaBczGdXw/cnznW3K0VxbcZ2HO5AP7IwmPOzvvGYsq35lNYKSGCg
 Nv4g==
X-Gm-Message-State: ACrzQf2KPZwbs32N12dLh++AU5vUbqE+/GN/GD2AMyyXpUsXISm2JN//
 fwqVx2Chl36CdQbhfWiAfhlESzG4Ng8d7R0T
X-Google-Smtp-Source: AMsMyM45fcp3eO0dWcj+lj//G7cYQqrsoPURZYvSkeC5ZoQ6lbkQjb7KiCBWU0xdVMj+bbAcQU2K1Q==
X-Received: by 2002:a17:902:7c8a:b0:17b:6eaa:5da3 with SMTP id
 y10-20020a1709027c8a00b0017b6eaa5da3mr13320252pll.33.1666266854242; 
 Thu, 20 Oct 2022 04:54:14 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.54.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:54:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/31] tcg: Add TCGHelperInfo argument to tcg_out_call
Date: Thu, 20 Oct 2022 21:52:31 +1000
Message-Id: <20221020115242.2301066-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This eliminates an ifdef for TCI, and will be required for
expanding the call for TCGv_i128.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        | 12 ++----------
 tcg/aarch64/tcg-target.c.inc     | 19 ++++++++++---------
 tcg/arm/tcg-target.c.inc         | 10 ++++++++--
 tcg/i386/tcg-target.c.inc        |  5 +++--
 tcg/loongarch64/tcg-target.c.inc |  7 ++++---
 tcg/mips/tcg-target.c.inc        |  3 ++-
 tcg/ppc/tcg-target.c.inc         |  7 ++++---
 tcg/riscv/tcg-target.c.inc       |  7 ++++---
 tcg/s390x/tcg-target.c.inc       | 12 +++++++++---
 tcg/sparc64/tcg-target.c.inc     |  3 ++-
 tcg/tci/tcg-target.c.inc         |  3 ++-
 11 files changed, 50 insertions(+), 38 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 1602ee78d3..b0f5eb0505 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -145,12 +145,8 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg, TCGReg arg1,
                        intptr_t arg2);
 static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
                         TCGReg base, intptr_t ofs);
-#ifdef CONFIG_TCG_INTERPRETER
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target,
-                         ffi_cif *cif);
-#else
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target);
-#endif
+                         const TCGHelperInfo *info);
 static bool tcg_target_const_match(int64_t val, TCGType type, int ct);
 #ifdef TCG_TARGET_NEED_LDST_LABELS
 static int tcg_out_ldst_finalize(TCGContext *s);
@@ -4402,11 +4398,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         save_globals(s, allocated_regs);
     }
 
-#ifdef CONFIG_TCG_INTERPRETER
-    tcg_out_call(s, tcg_call_func(op), info->cif);
-#else
-    tcg_out_call(s, tcg_call_func(op));
-#endif
+    tcg_out_call(s, tcg_call_func(op), info);
 
     /* Assign output registers and emit moves if needed.  */
     switch (info->out_kind) {
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index d997f7922a..e8184fe001 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1336,22 +1336,23 @@ static void tcg_out_goto_long(TCGContext *s, const tcg_insn_unit *target)
     }
 }
 
-static inline void tcg_out_callr(TCGContext *s, TCGReg reg)
-{
-    tcg_out_insn(s, 3207, BLR, reg);
-}
-
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
+static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *target)
 {
     ptrdiff_t offset = tcg_pcrel_diff(s, target) >> 2;
     if (offset == sextract64(offset, 0, 26)) {
         tcg_out_insn(s, 3206, BL, offset);
     } else {
         tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, (intptr_t)target);
-        tcg_out_callr(s, TCG_REG_TMP);
+        tcg_out_insn(s, 3207, BLR, reg);
     }
 }
 
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target,
+                         const TCGHelperInfo *info)
+{
+    tcg_out_call_int(s, target);
+}
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
                               uintptr_t jmp_rw, uintptr_t addr)
 {
@@ -1599,7 +1600,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_mov(s, TARGET_LONG_BITS == 64, TCG_REG_X1, lb->addrlo_reg);
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_X2, oi);
     tcg_out_adr(s, TCG_REG_X3, lb->raddr);
-    tcg_out_call(s, qemu_ld_helpers[opc & MO_SIZE]);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE]);
     if (opc & MO_SIGN) {
         tcg_out_sxt(s, lb->type, size, lb->datalo_reg, TCG_REG_X0);
     } else {
@@ -1625,7 +1626,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_mov(s, size == MO_64, TCG_REG_X2, lb->datalo_reg);
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_X3, oi);
     tcg_out_adr(s, TCG_REG_X4, lb->raddr);
-    tcg_out_call(s, qemu_st_helpers[opc & MO_SIZE]);
+    tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE]);
     tcg_out_goto(s, lb->raddr);
     return true;
 }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index aa3a888fed..e82749a602 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1131,7 +1131,7 @@ static void tcg_out_goto(TCGContext *s, ARMCond cond, const tcg_insn_unit *addr)
  * The call case is mostly used for helpers - so it's not unreasonable
  * for them to be beyond branch range.
  */
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *addr)
+static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *addr)
 {
     intptr_t addri = (intptr_t)addr;
     ptrdiff_t disp = tcg_pcrel_diff(s, addr);
@@ -1150,6 +1150,12 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *addr)
     tcg_out_blx_reg(s, COND_AL, TCG_REG_TMP);
 }
 
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *addr,
+                         const TCGHelperInfo *info)
+{
+    tcg_out_call_int(s, addr);
+}
+
 static void tcg_out_goto_label(TCGContext *s, ARMCond cond, TCGLabel *l)
 {
     if (l->has_value) {
@@ -1515,7 +1521,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     argreg = tcg_out_arg_reg32(s, argreg, TCG_REG_R14);
 
     /* Use the canonical unsigned helpers and minimize icache usage. */
-    tcg_out_call(s, qemu_ld_helpers[opc & MO_SIZE]);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE]);
 
     datalo = lb->datalo_reg;
     datahi = lb->datahi_reg;
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index cb04e4b3ad..58bd5873f5 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1661,7 +1661,8 @@ static void tcg_out_branch(TCGContext *s, int call, const tcg_insn_unit *dest)
     }
 }
 
-static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest,
+                         const TCGHelperInfo *info)
 {
     tcg_out_branch(s, 1, dest);
 }
@@ -1885,7 +1886,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
                      (uintptr_t)l->raddr);
     }
 
-    tcg_out_call(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_branch(s, 1, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     data_reg = l->datalo_reg;
     switch (opc & MO_SSIZE) {
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index a3debf6da7..98da264f16 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -567,7 +567,8 @@ static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
     }
 }
 
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg,
+                         const TCGHelperInfo *info)
 {
     tcg_out_call_int(s, arg, false);
 }
@@ -760,7 +761,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A2, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, (tcg_target_long)l->raddr);
 
-    tcg_out_call(s, qemu_ld_helpers[size]);
+    tcg_out_call_int(s, qemu_ld_helpers[size], false);
 
     switch (opc & MO_SSIZE) {
     case MO_SB:
@@ -821,7 +822,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A4, (tcg_target_long)l->raddr);
 
-    tcg_out_call(s, qemu_st_helpers[size]);
+    tcg_out_call_int(s, qemu_st_helpers[size], false);
 
     return tcg_out_goto(s, l->raddr);
 }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index bd76f0c97f..292e490b5c 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1020,7 +1020,8 @@ static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
     }
 }
 
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg,
+                         const TCGHelperInfo *info)
 {
     tcg_out_call_int(s, arg, false);
     tcg_out_nop(s);
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 500b75a03a..f561a3492f 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2002,7 +2002,8 @@ static void tcg_out_call_int(TCGContext *s, int lk,
 #endif
 }
 
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target,
+                         const TCGHelperInfo *info)
 {
     tcg_out_call_int(s, LK, target);
 }
@@ -2221,7 +2222,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
     tcg_out32(s, MFSPR | RT(arg) | LR);
 
-    tcg_out_call(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_call_int(s, LK, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     lo = lb->datalo_reg;
     hi = lb->datahi_reg;
@@ -2290,7 +2291,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
     tcg_out32(s, MFSPR | RT(arg) | LR);
 
-    tcg_out_call(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_call_int(s, LK, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     tcg_out_b(s, 0, lb->raddr);
     return true;
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 81a83e45b1..aa017d665a 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -819,7 +819,8 @@ static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
     }
 }
 
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg,
+                         const TCGHelperInfo *info)
 {
     tcg_out_call_int(s, arg, false);
 }
@@ -1002,7 +1003,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_movi(s, TCG_TYPE_PTR, a2, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, a3, (tcg_target_long)l->raddr);
 
-    tcg_out_call(s, qemu_ld_helpers[opc & MO_SSIZE]);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SSIZE], false);
     tcg_out_mov(s, (opc & MO_SIZE) == MO_64, l->datalo_reg, a0);
 
     tcg_out_goto(s, l->raddr);
@@ -1047,7 +1048,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_movi(s, TCG_TYPE_PTR, a3, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, a4, (tcg_target_long)l->raddr);
 
-    tcg_out_call(s, qemu_st_helpers[opc & MO_SIZE]);
+    tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
 
     tcg_out_goto(s, l->raddr);
     return true;
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 47aaba7667..c3c0bcc3eb 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1691,7 +1691,7 @@ static void tgen_brcond(TCGContext *s, TCGType type, TCGCond c,
     tgen_branch(s, cc, l);
 }
 
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest)
+static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *dest)
 {
     ptrdiff_t off = tcg_pcrel_diff(s, dest) >> 1;
     if (off == (int32_t)off) {
@@ -1702,6 +1702,12 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest)
     }
 }
 
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest,
+                         const TCGHelperInfo *info)
+{
+    tcg_out_call_int(s, dest);
+}
+
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
                                    TCGReg base, TCGReg index, int disp)
 {
@@ -1897,7 +1903,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     }
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R4, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R5, (uintptr_t)lb->raddr);
-    tcg_out_call(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)]);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)]);
     tcg_out_mov(s, TCG_TYPE_I64, data_reg, TCG_REG_R2);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
@@ -1938,7 +1944,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     }
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R5, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R6, (uintptr_t)lb->raddr);
-    tcg_out_call(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
     return true;
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index cb9453efdd..eb913f33c8 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -859,7 +859,8 @@ static void tcg_out_call_nodelay(TCGContext *s, const tcg_insn_unit *dest,
     }
 }
 
-static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest)
+static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest,
+                         const TCGHelperInfo *info)
 {
     tcg_out_call_nodelay(s, dest, false);
     tcg_out_nop(s);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f3d7441e06..b07b30b9fc 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -562,8 +562,9 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
 }
 
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *func,
-                         ffi_cif *cif)
+                         const TCGHelperInfo *info)
 {
+    ffi_cif *cif = info->cif;
     tcg_insn_unit insn = 0;
     uint8_t which;
 
-- 
2.34.1


