Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C657E412BBE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 04:28:04 +0200 (CEST)
Received: from localhost ([::1]:35240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSVVr-0008HC-QF
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 22:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTa-0005X4-9Q
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:42 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTY-0006FF-5s
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:42 -0400
Received: by mail-pj1-x102f.google.com with SMTP id t20so13341406pju.5
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 19:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5xOsJ/q61bGEcfr8bVryci8I2a76P5P5Z/hHe2uiGQU=;
 b=p/AG+c7eXuezBYP8hx8i5eozEiymVa34qCIcfSRcV/m59Vg1PIYej37Sshdeu0Wdy/
 JflZMbe7a56KlPEymTxLY4OJDttZCUKOzafkQcRSwLE/MRGFLfmEEJ3gS94j8zJmg/tQ
 O3hLLnmvFq23YR0pbcvpanx9fhKfSUrXjBg2N90NZvUSylcmsF5Ay8N/5ZSVfEtkbYce
 PDuyP9+QjSjcANHL2cEHVnfmVumk/69tZjb/qO626oFFn56ai6p+LjgoNo31N7VKZa68
 o3kyrQYq8iauEZzXVULWbCdW4r/rwNGwn/9ENdPQUQa75Do7P4QSFp6MCFDEne2epoMZ
 0spw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5xOsJ/q61bGEcfr8bVryci8I2a76P5P5Z/hHe2uiGQU=;
 b=NQoQjzXpxmnEPDHi6F0Jiy+R5V8WFWMWzBGU9F3CvQUG9kEIpkIsHH1BftT58fwDtb
 wjJvus6rnuDfGY+fKdr5uChatKSSr8M8KSAZXGWWnUdoqa7lrqOkv+SwdeXKrTwz/jC4
 SOieppsCnPiKZ9LoF+A2BKQ2WBXd3twadN20DDTC2p/6e56Z3KlQP5E3mippHhpG7Qa/
 5SPx7r2IR/WhR7cvW9As93O537UFVtphg+ITJkqUxW/+01GzX8oBejsxDiG/VYVN5gGa
 FdtbRpcPUkhl7+khixtJrJ6Cu4uoD4GS9hbCPeF3Ns7x/vO58iE5DkLw3Eo+/QzwciCS
 So3w==
X-Gm-Message-State: AOAM533CyEFaSJ2FUZCIq76EJydkrwCM4bJTk4FRc9bmR7GkI69L45uT
 yflUL9Umcf33xk4AN9V0RKcZk9FfFGNASA==
X-Google-Smtp-Source: ABdhPJzXgEy3BUjewumXUW8Or7blqiYvuZlehPlBN0dEwOp0IwdRQbtyg5o/4s0XtpQ5ek21xFSM6w==
X-Received: by 2002:a17:90a:1904:: with SMTP id
 4mr2372037pjg.191.1632191138528; 
 Mon, 20 Sep 2021 19:25:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n9sm15297621pff.37.2021.09.20.19.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 19:25:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/10] tcg/mips: Drop inline markers
Date: Mon, 20 Sep 2021 19:25:27 -0700
Message-Id: <20210921022534.365291-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921022534.365291-1-richard.henderson@linaro.org>
References: <20210921022534.365291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let the compiler decide about inlining.
Remove tcg_out_ext8s and tcg_out_ext16s as unused.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 76 ++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 49 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index bf0eb84e2d..320795a637 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -187,7 +187,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #endif
 
 
-static inline bool is_p2m1(tcg_target_long val)
+static bool is_p2m1(tcg_target_long val)
 {
     return val && ((val + 1) & val) == 0;
 }
@@ -361,8 +361,8 @@ typedef enum {
 /*
  * Type reg
  */
-static inline void tcg_out_opc_reg(TCGContext *s, MIPSInsn opc,
-                                   TCGReg rd, TCGReg rs, TCGReg rt)
+static void tcg_out_opc_reg(TCGContext *s, MIPSInsn opc,
+                            TCGReg rd, TCGReg rs, TCGReg rt)
 {
     int32_t inst;
 
@@ -376,8 +376,8 @@ static inline void tcg_out_opc_reg(TCGContext *s, MIPSInsn opc,
 /*
  * Type immediate
  */
-static inline void tcg_out_opc_imm(TCGContext *s, MIPSInsn opc,
-                                   TCGReg rt, TCGReg rs, TCGArg imm)
+static void tcg_out_opc_imm(TCGContext *s, MIPSInsn opc,
+                            TCGReg rt, TCGReg rs, TCGArg imm)
 {
     int32_t inst;
 
@@ -391,8 +391,8 @@ static inline void tcg_out_opc_imm(TCGContext *s, MIPSInsn opc,
 /*
  * Type bitfield
  */
-static inline void tcg_out_opc_bf(TCGContext *s, MIPSInsn opc, TCGReg rt,
-                                  TCGReg rs, int msb, int lsb)
+static void tcg_out_opc_bf(TCGContext *s, MIPSInsn opc, TCGReg rt,
+                           TCGReg rs, int msb, int lsb)
 {
     int32_t inst;
 
@@ -404,8 +404,8 @@ static inline void tcg_out_opc_bf(TCGContext *s, MIPSInsn opc, TCGReg rt,
     tcg_out32(s, inst);
 }
 
-static inline void tcg_out_opc_bf64(TCGContext *s, MIPSInsn opc, MIPSInsn opm,
-                                    MIPSInsn oph, TCGReg rt, TCGReg rs,
+static void tcg_out_opc_bf64(TCGContext *s, MIPSInsn opc, MIPSInsn opm,
+                             MIPSInsn oph, TCGReg rt, TCGReg rs,
                                     int msb, int lsb)
 {
     if (lsb >= 32) {
@@ -422,8 +422,7 @@ static inline void tcg_out_opc_bf64(TCGContext *s, MIPSInsn opc, MIPSInsn opm,
 /*
  * Type branch
  */
-static inline void tcg_out_opc_br(TCGContext *s, MIPSInsn opc,
-                                  TCGReg rt, TCGReg rs)
+static void tcg_out_opc_br(TCGContext *s, MIPSInsn opc, TCGReg rt, TCGReg rs)
 {
     tcg_out_opc_imm(s, opc, rt, rs, 0);
 }
@@ -431,8 +430,8 @@ static inline void tcg_out_opc_br(TCGContext *s, MIPSInsn opc,
 /*
  * Type sa
  */
-static inline void tcg_out_opc_sa(TCGContext *s, MIPSInsn opc,
-                                  TCGReg rd, TCGReg rt, TCGArg sa)
+static void tcg_out_opc_sa(TCGContext *s, MIPSInsn opc,
+                           TCGReg rd, TCGReg rt, TCGArg sa)
 {
     int32_t inst;
 
@@ -479,28 +478,27 @@ static bool tcg_out_opc_jmp(TCGContext *s, MIPSInsn opc, const void *target)
     return true;
 }
 
-static inline void tcg_out_nop(TCGContext *s)
+static void tcg_out_nop(TCGContext *s)
 {
     tcg_out32(s, 0);
 }
 
-static inline void tcg_out_dsll(TCGContext *s, TCGReg rd, TCGReg rt, TCGArg sa)
+static void tcg_out_dsll(TCGContext *s, TCGReg rd, TCGReg rt, TCGArg sa)
 {
     tcg_out_opc_sa64(s, OPC_DSLL, OPC_DSLL32, rd, rt, sa);
 }
 
-static inline void tcg_out_dsrl(TCGContext *s, TCGReg rd, TCGReg rt, TCGArg sa)
+static void tcg_out_dsrl(TCGContext *s, TCGReg rd, TCGReg rt, TCGArg sa)
 {
     tcg_out_opc_sa64(s, OPC_DSRL, OPC_DSRL32, rd, rt, sa);
 }
 
-static inline void tcg_out_dsra(TCGContext *s, TCGReg rd, TCGReg rt, TCGArg sa)
+static void tcg_out_dsra(TCGContext *s, TCGReg rd, TCGReg rt, TCGArg sa)
 {
     tcg_out_opc_sa64(s, OPC_DSRA, OPC_DSRA32, rd, rt, sa);
 }
 
-static inline bool tcg_out_mov(TCGContext *s, TCGType type,
-                               TCGReg ret, TCGReg arg)
+static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
     /* Simple reg-reg move, optimising out the 'do nothing' case */
     if (ret != arg) {
@@ -612,27 +610,7 @@ static void tcg_out_bswap64(TCGContext *s, TCGReg ret, TCGReg arg)
     }
 }
 
-static inline void tcg_out_ext8s(TCGContext *s, TCGReg ret, TCGReg arg)
-{
-    if (use_mips32r2_instructions) {
-        tcg_out_opc_reg(s, OPC_SEB, ret, 0, arg);
-    } else {
-        tcg_out_opc_sa(s, OPC_SLL, ret, arg, 24);
-        tcg_out_opc_sa(s, OPC_SRA, ret, ret, 24);
-    }
-}
-
-static inline void tcg_out_ext16s(TCGContext *s, TCGReg ret, TCGReg arg)
-{
-    if (use_mips32r2_instructions) {
-        tcg_out_opc_reg(s, OPC_SEH, ret, 0, arg);
-    } else {
-        tcg_out_opc_sa(s, OPC_SLL, ret, arg, 16);
-        tcg_out_opc_sa(s, OPC_SRA, ret, ret, 16);
-    }
-}
-
-static inline void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg)
+static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg)
 {
     if (use_mips32r2_instructions) {
         tcg_out_opc_bf(s, OPC_DEXT, ret, arg, 31, 0);
@@ -656,8 +634,8 @@ static void tcg_out_ldst(TCGContext *s, MIPSInsn opc, TCGReg data,
     tcg_out_opc_imm(s, opc, data, addr, lo);
 }
 
-static inline void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
-                              TCGReg arg1, intptr_t arg2)
+static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
 {
     MIPSInsn opc = OPC_LD;
     if (TCG_TARGET_REG_BITS == 32 || type == TCG_TYPE_I32) {
@@ -666,8 +644,8 @@ static inline void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
     tcg_out_ldst(s, opc, arg, arg1, arg2);
 }
 
-static inline void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
-                              TCGReg arg1, intptr_t arg2)
+static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
 {
     MIPSInsn opc = OPC_SD;
     if (TCG_TARGET_REG_BITS == 32 || type == TCG_TYPE_I32) {
@@ -676,8 +654,8 @@ static inline void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
     tcg_out_ldst(s, opc, arg, arg1, arg2);
 }
 
-static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
-                               TCGReg base, intptr_t ofs)
+static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
+                        TCGReg base, intptr_t ofs)
 {
     if (val == 0) {
         tcg_out_st(s, type, TCG_REG_ZERO, base, ofs);
@@ -1637,9 +1615,9 @@ static void tcg_out_clz(TCGContext *s, MIPSInsn opcv2, MIPSInsn opcv6,
     }
 }
 
-static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
-                              const TCGArg args[TCG_MAX_OP_ARGS],
-                              const int const_args[TCG_MAX_OP_ARGS])
+static void tcg_out_op(TCGContext *s, TCGOpcode opc,
+                       const TCGArg args[TCG_MAX_OP_ARGS],
+                       const int const_args[TCG_MAX_OP_ARGS])
 {
     MIPSInsn i1, i2;
     TCGArg a0, a1, a2;
-- 
2.25.1


