Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16E9607189
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:58:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmvf-0008QC-HO
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:58:57 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmHn-0003MK-FO
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHa-0003G9-7K
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:31 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHX-0005pW-91
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:29 -0400
Received: by mail-pj1-x102e.google.com with SMTP id pb15so1654802pjb.5
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRraYrN7VevkThzpI1pDQIipRClwjcnorE3BJjtqVhA=;
 b=qDX1AyU8FeLwtfCdvSjG6BOEMUAs67A0UenYkVx8S0+n7vX/0/wiBQzIRxrDLWEdve
 z7juLICsf6vi1clqaLFPOjR9zE6a8Wtik7tHAdgLH43pAYB0J3iDIKea/tshXdq73QZL
 rmI/5XUJdBz2o76cy2U5srpY/rz3arM3ZQpkgC2g/NE8KgJ3Xsdx1yJqbHrPktY6G6mr
 G2hN5Dbonx/OgBdJH/NfboYSohH+C06l/UEEGjn18sXb29JCIui122s4BStas4U4sE0G
 x8F6I8fgJpY0OkEHNJoKw/oM8pxfgGJf4IasodASFWczhHT8XBhaEUlH7r+EpC8UrHZd
 iFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jRraYrN7VevkThzpI1pDQIipRClwjcnorE3BJjtqVhA=;
 b=Ap24Zz4COgSeTxRYwDuaP3Kn3YozPPq1e1p51qsVfvLRw3joUgUa5iPU6s2Haj/ZgN
 Y0pK0OAsAsn+HsLa2lEJzv8IuEsy86p1/qHbrSfolXnQbhiNOi1mfHGaMyqT1PV7I9Qv
 n7nmt02nf8a5l0ORGvAmisFBo22xLlpNVqrgdZrmsfWIodMGmcwBFCo8I9BeA592RYi1
 5RF9nvj25HtT6g0Wvl9yRtqT7hPErQxacg3AUuXMh6anNJv/4DIJaDxAjdhOUZjFSuX+
 tzD+r3V0Fxoe6cqF/FeRl3vi7ILcO8Qhapydvj5+4/eqem4NixgfvVQ/+x5FrKmrkCGo
 pong==
X-Gm-Message-State: ACrzQf1k9YMo9hj6TRTgP4Zcx+EOCWCsQ+07xSx69z1/1G0wiwJg5zXq
 5Ws7fckRAPfAW0fit5dukW0o/3uxjJ2HGWwe
X-Google-Smtp-Source: AMsMyM6aU2kgmHGGw0qSX+UU2xNRJMZW9vm65d9K11F9L5wU73SOGG5yAGLqG9Vck5KkDYL+CWiK8Q==
X-Received: by 2002:a17:902:e804:b0:186:5736:2b70 with SMTP id
 u4-20020a170902e80400b0018657362b70mr11939648plg.127.1666336645871; 
 Fri, 21 Oct 2022 00:17:25 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 22/36] tcg: Add TCGHelperInfo argument to tcg_out_call
Date: Fri, 21 Oct 2022 17:15:35 +1000
Message-Id: <20221021071549.2398137-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
index a3a6968f76..082482341b 100644
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
@@ -4404,11 +4400,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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


