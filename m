Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABF13F0D7B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:38:54 +0200 (CEST)
Received: from localhost ([::1]:34520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTGv-0003st-4O
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7o-000667-V0
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:28 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:41814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7m-0005np-8G
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:28 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 fa24-20020a17090af0d8b0290178bfa69d97so3396365pjb.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jV+G7p9ouJb31HAFw2iToImKMbvLL+XKO9L5VZWCgWg=;
 b=iiDF2/yiowVdlnUSgE8kbP6E4aYYxcfpm8piOjtK51OdXrLwcDp0LWCOoBDrMlWDkW
 2m2786ueqzxTx3rJLRd/hhFyUVk64kkH+AT+DC1I2H23ORpajnxuGPrNQvZVHj8XG61W
 ILlSS1b0acZXWDnuh+HfmIHI2+vHDza8H3JqeqXgxdW9zC9o+mSXpOiaxtA1sUBQYnlf
 6xhssfpdc9a1PF7EA2ym6JeFVmRawZJb+15ZALpdTiJrAaYmibEwzZHsiuefXBxf9zpD
 +pg7FpN0TGBjOR3iqnLpfkLoMOnhooN3cx4Wi8ADttuukHDSgSsktXRukS8zZjqvwPod
 33+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jV+G7p9ouJb31HAFw2iToImKMbvLL+XKO9L5VZWCgWg=;
 b=WkZ/fGD8XOtohf1SH0DFwjoVHJ1ElmdTgKEDaseUdMReVLz2+rLObnFa8mWq5r8tWl
 pPQGBbck5JlfM0XcKQQCu13jhEs9aPfET1vzDaxNip2Z1kh43thPJfupG+9z+X/xuQwN
 eeAnk0swLh7ij8D/LIO/CmuU4Dp84S4gixvqYTwMCiuL/ZdZajIg3sJ1AsfacrtJawRW
 +NNmWVF8dtnj6xMGmVuLmZ4NMLAnFKDA7WX14D/m7DzHX4by5kxLNlK7nLmaU4/z3cUS
 BcbXLNm4HhbuNnijkkez8uGJ24p8PXN69T3Ge3bGXJRhdzQ0w19DH+1kaYr8biSN1G2/
 cEzg==
X-Gm-Message-State: AOAM5320n9Dvk2bUOIb+ZmgasETKEcUkPLYct+jLOY1f5CjNpj7Y2ira
 liTsE/Vn3wnPeNRAP7LtznZ9twZ5yxB1Nw==
X-Google-Smtp-Source: ABdhPJxos3NCC62SZaQepc2rGRevC3YfCy/KEgI0JSj61q5p7IvkE31yxeV6z3+6tgpYm7ctpbtDvQ==
X-Received: by 2002:a17:90a:7d02:: with SMTP id
 g2mr11238909pjl.168.1629322164789; 
 Wed, 18 Aug 2021 14:29:24 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id y19sm751965pfe.71.2021.08.18.14.29.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:29:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/14] tcg/arm: Give enum arm_cond_code_e a typedef and use
 it
Date: Wed, 18 Aug 2021 11:29:08 -1000
Message-Id: <20210818212912.396794-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818212912.396794-1-richard.henderson@linaro.org>
References: <20210818212912.396794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 136 +++++++++++++++++++--------------------
 1 file changed, 68 insertions(+), 68 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 327032f0df..b20c313615 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -85,7 +85,7 @@ static const int tcg_target_call_oarg_regs[2] = {
 #define TCG_REG_TMP  TCG_REG_R12
 #define TCG_VEC_TMP  TCG_REG_Q15
 
-enum arm_cond_code_e {
+typedef enum {
     COND_EQ = 0x0,
     COND_NE = 0x1,
     COND_CS = 0x2,	/* Unsigned greater or equal */
@@ -101,7 +101,7 @@ enum arm_cond_code_e {
     COND_GT = 0xc,
     COND_LE = 0xd,
     COND_AL = 0xe,
-};
+} ARMCond;
 
 #define TO_CPSR (1 << 20)
 
@@ -540,19 +540,19 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
     return 0;
 }
 
-static void tcg_out_b_imm(TCGContext *s, int cond, int32_t offset)
+static void tcg_out_b_imm(TCGContext *s, ARMCond cond, int32_t offset)
 {
     tcg_out32(s, (cond << 28) | 0x0a000000 |
                     (((offset - 8) >> 2) & 0x00ffffff));
 }
 
-static void tcg_out_bl_imm(TCGContext *s, int cond, int32_t offset)
+static void tcg_out_bl_imm(TCGContext *s, ARMCond cond, int32_t offset)
 {
     tcg_out32(s, (cond << 28) | 0x0b000000 |
                     (((offset - 8) >> 2) & 0x00ffffff));
 }
 
-static void tcg_out_blx_reg(TCGContext *s, int cond, int rn)
+static void tcg_out_blx_reg(TCGContext *s, ARMCond cond, int rn)
 {
     tcg_out32(s, (cond << 28) | 0x012fff30 | rn);
 }
@@ -563,14 +563,14 @@ static void tcg_out_blx_imm(TCGContext *s, int32_t offset)
                 (((offset - 8) >> 2) & 0x00ffffff));
 }
 
-static void tcg_out_dat_reg(TCGContext *s,
-                int cond, int opc, int rd, int rn, int rm, int shift)
+static void tcg_out_dat_reg(TCGContext *s, ARMCond cond, int opc, int rd,
+                            int rn, int rm, int shift)
 {
     tcg_out32(s, (cond << 28) | (0 << 25) | opc |
                     (rn << 16) | (rd << 12) | shift | rm);
 }
 
-static void tcg_out_mov_reg(TCGContext *s, int cond, int rd, int rm)
+static void tcg_out_mov_reg(TCGContext *s, ARMCond cond, int rd, int rm)
 {
     /* Simple reg-reg move, optimising out the 'do nothing' case */
     if (rd != rm) {
@@ -578,12 +578,12 @@ static void tcg_out_mov_reg(TCGContext *s, int cond, int rd, int rm)
     }
 }
 
-static void tcg_out_bx_reg(TCGContext *s, int cond, TCGReg rn)
+static void tcg_out_bx_reg(TCGContext *s, ARMCond cond, TCGReg rn)
 {
     tcg_out32(s, (cond << 28) | 0x012fff10 | rn);
 }
 
-static void tcg_out_b_reg(TCGContext *s, int cond, TCGReg rn)
+static void tcg_out_b_reg(TCGContext *s, ARMCond cond, TCGReg rn)
 {
     /*
      * Unless the C portion of QEMU is compiled as thumb, we don't need
@@ -596,14 +596,14 @@ static void tcg_out_b_reg(TCGContext *s, int cond, TCGReg rn)
     }
 }
 
-static void tcg_out_dat_imm(TCGContext *s, int cond, int opc,
+static void tcg_out_dat_imm(TCGContext *s, ARMCond cond, int opc,
                             int rd, int rn, int im)
 {
     tcg_out32(s, (cond << 28) | (1 << 25) | opc |
                     (rn << 16) | (rd << 12) | im);
 }
 
-static void tcg_out_ldstm(TCGContext *s, int cond, int opc,
+static void tcg_out_ldstm(TCGContext *s, ARMCond cond, int opc,
                           TCGReg rn, uint16_t mask)
 {
     tcg_out32(s, (cond << 28) | opc | (rn << 16) | mask);
@@ -611,14 +611,14 @@ static void tcg_out_ldstm(TCGContext *s, int cond, int opc,
 
 /* Note that this routine is used for both LDR and LDRH formats, so we do
    not wish to include an immediate shift at this point.  */
-static void tcg_out_memop_r(TCGContext *s, int cond, ARMInsn opc, TCGReg rt,
+static void tcg_out_memop_r(TCGContext *s, ARMCond cond, ARMInsn opc, TCGReg rt,
                             TCGReg rn, TCGReg rm, bool u, bool p, bool w)
 {
     tcg_out32(s, (cond << 28) | opc | (u << 23) | (p << 24)
               | (w << 21) | (rn << 16) | (rt << 12) | rm);
 }
 
-static void tcg_out_memop_8(TCGContext *s, int cond, ARMInsn opc, TCGReg rt,
+static void tcg_out_memop_8(TCGContext *s, ARMCond cond, ARMInsn opc, TCGReg rt,
                             TCGReg rn, int imm8, bool p, bool w)
 {
     bool u = 1;
@@ -630,7 +630,7 @@ static void tcg_out_memop_8(TCGContext *s, int cond, ARMInsn opc, TCGReg rt,
               (rn << 16) | (rt << 12) | ((imm8 & 0xf0) << 4) | (imm8 & 0xf));
 }
 
-static void tcg_out_memop_12(TCGContext *s, int cond, ARMInsn opc, TCGReg rt,
+static void tcg_out_memop_12(TCGContext *s, ARMCond cond, ARMInsn opc, TCGReg rt,
                              TCGReg rn, int imm12, bool p, bool w)
 {
     bool u = 1;
@@ -642,152 +642,152 @@ static void tcg_out_memop_12(TCGContext *s, int cond, ARMInsn opc, TCGReg rt,
               (rn << 16) | (rt << 12) | imm12);
 }
 
-static void tcg_out_ld32_12(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld32_12(TCGContext *s, ARMCond cond, TCGReg rt,
                             TCGReg rn, int imm12)
 {
     tcg_out_memop_12(s, cond, INSN_LDR_IMM, rt, rn, imm12, 1, 0);
 }
 
-static void tcg_out_st32_12(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_st32_12(TCGContext *s, ARMCond cond, TCGReg rt,
                             TCGReg rn, int imm12)
 {
     tcg_out_memop_12(s, cond, INSN_STR_IMM, rt, rn, imm12, 1, 0);
 }
 
-static void tcg_out_ld32_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld32_r(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDR_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static void tcg_out_st32_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_st32_r(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_STR_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static void tcg_out_ldrd_8(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ldrd_8(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_LDRD_IMM, rt, rn, imm8, 1, 0);
 }
 
-static void tcg_out_ldrd_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ldrd_r(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRD_REG, rt, rn, rm, 1, 1, 0);
 }
 
 static void __attribute__((unused))
-tcg_out_ldrd_rwb(TCGContext *s, int cond, TCGReg rt, TCGReg rn, TCGReg rm)
+tcg_out_ldrd_rwb(TCGContext *s, ARMCond cond, TCGReg rt, TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRD_REG, rt, rn, rm, 1, 1, 1);
 }
 
-static void tcg_out_strd_8(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_strd_8(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_STRD_IMM, rt, rn, imm8, 1, 0);
 }
 
-static void tcg_out_strd_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_strd_r(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_STRD_REG, rt, rn, rm, 1, 1, 0);
 }
 
 /* Register pre-increment with base writeback.  */
-static void tcg_out_ld32_rwb(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld32_rwb(TCGContext *s, ARMCond cond, TCGReg rt,
                              TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDR_REG, rt, rn, rm, 1, 1, 1);
 }
 
-static void tcg_out_st32_rwb(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_st32_rwb(TCGContext *s, ARMCond cond, TCGReg rt,
                              TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_STR_REG, rt, rn, rm, 1, 1, 1);
 }
 
-static void tcg_out_ld16u_8(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld16u_8(TCGContext *s, ARMCond cond, TCGReg rt,
                             TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_LDRH_IMM, rt, rn, imm8, 1, 0);
 }
 
-static void tcg_out_st16_8(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_st16_8(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_STRH_IMM, rt, rn, imm8, 1, 0);
 }
 
-static void tcg_out_ld16u_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld16u_r(TCGContext *s, ARMCond cond, TCGReg rt,
                             TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRH_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static void tcg_out_st16_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_st16_r(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_STRH_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static void tcg_out_ld16s_8(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld16s_8(TCGContext *s, ARMCond cond, TCGReg rt,
                             TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_LDRSH_IMM, rt, rn, imm8, 1, 0);
 }
 
-static void tcg_out_ld16s_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld16s_r(TCGContext *s, ARMCond cond, TCGReg rt,
                             TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRSH_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static void tcg_out_ld8_12(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld8_12(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, int imm12)
 {
     tcg_out_memop_12(s, cond, INSN_LDRB_IMM, rt, rn, imm12, 1, 0);
 }
 
-static void tcg_out_st8_12(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_st8_12(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, int imm12)
 {
     tcg_out_memop_12(s, cond, INSN_STRB_IMM, rt, rn, imm12, 1, 0);
 }
 
-static void tcg_out_ld8_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld8_r(TCGContext *s, ARMCond cond, TCGReg rt,
                           TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRB_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static void tcg_out_st8_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_st8_r(TCGContext *s, ARMCond cond, TCGReg rt,
                           TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_STRB_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static void tcg_out_ld8s_8(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld8s_8(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, int imm8)
 {
     tcg_out_memop_8(s, cond, INSN_LDRSB_IMM, rt, rn, imm8, 1, 0);
 }
 
-static void tcg_out_ld8s_r(TCGContext *s, int cond, TCGReg rt,
+static void tcg_out_ld8s_r(TCGContext *s, ARMCond cond, TCGReg rt,
                            TCGReg rn, TCGReg rm)
 {
     tcg_out_memop_r(s, cond, INSN_LDRSB_REG, rt, rn, rm, 1, 1, 0);
 }
 
-static void tcg_out_movi_pool(TCGContext *s, int cond, int rd, uint32_t arg)
+static void tcg_out_movi_pool(TCGContext *s, ARMCond cond, int rd, uint32_t arg)
 {
     new_pool_label(s, arg, R_ARM_PC13, s->code_ptr, 0);
     tcg_out_ld32_12(s, cond, rd, TCG_REG_PC, 0);
 }
 
-static void tcg_out_movi32(TCGContext *s, int cond, int rd, uint32_t arg)
+static void tcg_out_movi32(TCGContext *s, ARMCond cond, int rd, uint32_t arg)
 {
     int imm12, diff, opc, sh1, sh2;
     uint32_t tt0, tt1, tt2;
@@ -866,7 +866,7 @@ static void tcg_out_movi32(TCGContext *s, int cond, int rd, uint32_t arg)
  * Emit either the reg,imm or reg,reg form of a data-processing insn.
  * rhs must satisfy the "rI" constraint.
  */
-static void tcg_out_dat_rI(TCGContext *s, int cond, int opc, TCGArg dst,
+static void tcg_out_dat_rI(TCGContext *s, ARMCond cond, int opc, TCGArg dst,
                            TCGArg lhs, TCGArg rhs, int rhs_is_const)
 {
     if (rhs_is_const) {
@@ -880,7 +880,7 @@ static void tcg_out_dat_rI(TCGContext *s, int cond, int opc, TCGArg dst,
  * Emit either the reg,imm or reg,reg form of a data-processing insn.
  * rhs must satisfy the "rIK" constraint.
  */
-static void tcg_out_dat_rIK(TCGContext *s, int cond, int opc, int opinv,
+static void tcg_out_dat_rIK(TCGContext *s, ARMCond cond, int opc, int opinv,
                             TCGReg dst, TCGReg lhs, TCGArg rhs,
                             bool rhs_is_const)
 {
@@ -896,7 +896,7 @@ static void tcg_out_dat_rIK(TCGContext *s, int cond, int opc, int opinv,
     }
 }
 
-static void tcg_out_dat_rIN(TCGContext *s, int cond, int opc, int opneg,
+static void tcg_out_dat_rIN(TCGContext *s, ARMCond cond, int opc, int opneg,
                             TCGArg dst, TCGArg lhs, TCGArg rhs,
                             bool rhs_is_const)
 {
@@ -915,7 +915,7 @@ static void tcg_out_dat_rIN(TCGContext *s, int cond, int opc, int opneg,
     }
 }
 
-static void tcg_out_mul32(TCGContext *s, int cond, TCGReg rd,
+static void tcg_out_mul32(TCGContext *s, ARMCond cond, TCGReg rd,
                           TCGReg rn, TCGReg rm)
 {
     /* if ArchVersion() < 6 && d == n then UNPREDICTABLE;  */
@@ -933,7 +933,7 @@ static void tcg_out_mul32(TCGContext *s, int cond, TCGReg rd,
     tcg_out32(s, (cond << 28) | 0x90 | (rd << 16) | (rm << 8) | rn);
 }
 
-static void tcg_out_umull32(TCGContext *s, int cond, TCGReg rd0,
+static void tcg_out_umull32(TCGContext *s, ARMCond cond, TCGReg rd0,
                             TCGReg rd1, TCGReg rn, TCGReg rm)
 {
     /* if ArchVersion() < 6 && (dHi == n || dLo == n) then UNPREDICTABLE;  */
@@ -952,7 +952,7 @@ static void tcg_out_umull32(TCGContext *s, int cond, TCGReg rd0,
               (rd1 << 16) | (rd0 << 12) | (rm << 8) | rn);
 }
 
-static void tcg_out_smull32(TCGContext *s, int cond, TCGReg rd0,
+static void tcg_out_smull32(TCGContext *s, ARMCond cond, TCGReg rd0,
                             TCGReg rd1, TCGReg rn, TCGReg rm)
 {
     /* if ArchVersion() < 6 && (dHi == n || dLo == n) then UNPREDICTABLE;  */
@@ -971,17 +971,17 @@ static void tcg_out_smull32(TCGContext *s, int cond, TCGReg rd0,
               (rd1 << 16) | (rd0 << 12) | (rm << 8) | rn);
 }
 
-static void tcg_out_sdiv(TCGContext *s, int cond, int rd, int rn, int rm)
+static void tcg_out_sdiv(TCGContext *s, ARMCond cond, int rd, int rn, int rm)
 {
     tcg_out32(s, 0x0710f010 | (cond << 28) | (rd << 16) | rn | (rm << 8));
 }
 
-static void tcg_out_udiv(TCGContext *s, int cond, int rd, int rn, int rm)
+static void tcg_out_udiv(TCGContext *s, ARMCond cond, int rd, int rn, int rm)
 {
     tcg_out32(s, 0x0730f010 | (cond << 28) | (rd << 16) | rn | (rm << 8));
 }
 
-static void tcg_out_ext8s(TCGContext *s, int cond, int rd, int rn)
+static void tcg_out_ext8s(TCGContext *s, ARMCond cond, int rd, int rn)
 {
     if (use_armv6_instructions) {
         /* sxtb */
@@ -995,12 +995,12 @@ static void tcg_out_ext8s(TCGContext *s, int cond, int rd, int rn)
 }
 
 static void __attribute__((unused))
-tcg_out_ext8u(TCGContext *s, int cond, int rd, int rn)
+tcg_out_ext8u(TCGContext *s, ARMCond cond, int rd, int rn)
 {
     tcg_out_dat_imm(s, cond, ARITH_AND, rd, rn, 0xff);
 }
 
-static void tcg_out_ext16s(TCGContext *s, int cond, int rd, int rn)
+static void tcg_out_ext16s(TCGContext *s, ARMCond cond, int rd, int rn)
 {
     if (use_armv6_instructions) {
         /* sxth */
@@ -1013,7 +1013,7 @@ static void tcg_out_ext16s(TCGContext *s, int cond, int rd, int rn)
     }
 }
 
-static void tcg_out_ext16u(TCGContext *s, int cond, int rd, int rn)
+static void tcg_out_ext16u(TCGContext *s, ARMCond cond, int rd, int rn)
 {
     if (use_armv6_instructions) {
         /* uxth */
@@ -1026,7 +1026,7 @@ static void tcg_out_ext16u(TCGContext *s, int cond, int rd, int rn)
     }
 }
 
-static void tcg_out_bswap16(TCGContext *s, int cond, int rd, int rn, int flags)
+static void tcg_out_bswap16(TCGContext *s, ARMCond cond, int rd, int rn, int flags)
 {
     if (use_armv6_instructions) {
         if (flags & TCG_BSWAP_OS) {
@@ -1093,7 +1093,7 @@ static void tcg_out_bswap16(TCGContext *s, int cond, int rd, int rn, int flags)
                      ? SHIFT_IMM_ASR(8) : SHIFT_IMM_LSR(8)));
 }
 
-static void tcg_out_bswap32(TCGContext *s, int cond, int rd, int rn)
+static void tcg_out_bswap32(TCGContext *s, ARMCond cond, int rd, int rn)
 {
     if (use_armv6_instructions) {
         /* rev */
@@ -1110,7 +1110,7 @@ static void tcg_out_bswap32(TCGContext *s, int cond, int rd, int rn)
     }
 }
 
-static void tcg_out_deposit(TCGContext *s, int cond, TCGReg rd,
+static void tcg_out_deposit(TCGContext *s, ARMCond cond, TCGReg rd,
                             TCGArg a1, int ofs, int len, bool const_a1)
 {
     if (const_a1) {
@@ -1122,7 +1122,7 @@ static void tcg_out_deposit(TCGContext *s, int cond, TCGReg rd,
               | (ofs << 7) | ((ofs + len - 1) << 16));
 }
 
-static void tcg_out_extract(TCGContext *s, int cond, TCGReg rd,
+static void tcg_out_extract(TCGContext *s, ARMCond cond, TCGReg rd,
                             TCGArg a1, int ofs, int len)
 {
     /* ubfx */
@@ -1130,7 +1130,7 @@ static void tcg_out_extract(TCGContext *s, int cond, TCGReg rd,
               | (ofs << 7) | ((len - 1) << 16));
 }
 
-static void tcg_out_sextract(TCGContext *s, int cond, TCGReg rd,
+static void tcg_out_sextract(TCGContext *s, ARMCond cond, TCGReg rd,
                              TCGArg a1, int ofs, int len)
 {
     /* sbfx */
@@ -1138,7 +1138,7 @@ static void tcg_out_sextract(TCGContext *s, int cond, TCGReg rd,
               | (ofs << 7) | ((len - 1) << 16));
 }
 
-static void tcg_out_ld32u(TCGContext *s, int cond,
+static void tcg_out_ld32u(TCGContext *s, ARMCond cond,
                           int rd, int rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
@@ -1148,7 +1148,7 @@ static void tcg_out_ld32u(TCGContext *s, int cond,
         tcg_out_ld32_12(s, cond, rd, rn, offset);
 }
 
-static void tcg_out_st32(TCGContext *s, int cond,
+static void tcg_out_st32(TCGContext *s, ARMCond cond,
                          int rd, int rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
@@ -1158,7 +1158,7 @@ static void tcg_out_st32(TCGContext *s, int cond,
         tcg_out_st32_12(s, cond, rd, rn, offset);
 }
 
-static void tcg_out_ld16u(TCGContext *s, int cond,
+static void tcg_out_ld16u(TCGContext *s, ARMCond cond,
                           int rd, int rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
@@ -1168,7 +1168,7 @@ static void tcg_out_ld16u(TCGContext *s, int cond,
         tcg_out_ld16u_8(s, cond, rd, rn, offset);
 }
 
-static void tcg_out_ld16s(TCGContext *s, int cond,
+static void tcg_out_ld16s(TCGContext *s, ARMCond cond,
                           int rd, int rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
@@ -1178,7 +1178,7 @@ static void tcg_out_ld16s(TCGContext *s, int cond,
         tcg_out_ld16s_8(s, cond, rd, rn, offset);
 }
 
-static void tcg_out_st16(TCGContext *s, int cond,
+static void tcg_out_st16(TCGContext *s, ARMCond cond,
                          int rd, int rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
@@ -1188,7 +1188,7 @@ static void tcg_out_st16(TCGContext *s, int cond,
         tcg_out_st16_8(s, cond, rd, rn, offset);
 }
 
-static void tcg_out_ld8u(TCGContext *s, int cond,
+static void tcg_out_ld8u(TCGContext *s, ARMCond cond,
                          int rd, int rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
@@ -1198,7 +1198,7 @@ static void tcg_out_ld8u(TCGContext *s, int cond,
         tcg_out_ld8_12(s, cond, rd, rn, offset);
 }
 
-static void tcg_out_ld8s(TCGContext *s, int cond,
+static void tcg_out_ld8s(TCGContext *s, ARMCond cond,
                          int rd, int rn, int32_t offset)
 {
     if (offset > 0xff || offset < -0xff) {
@@ -1208,7 +1208,7 @@ static void tcg_out_ld8s(TCGContext *s, int cond,
         tcg_out_ld8s_8(s, cond, rd, rn, offset);
 }
 
-static void tcg_out_st8(TCGContext *s, int cond,
+static void tcg_out_st8(TCGContext *s, ARMCond cond,
                         int rd, int rn, int32_t offset)
 {
     if (offset > 0xfff || offset < -0xfff) {
@@ -1223,7 +1223,7 @@ static void tcg_out_st8(TCGContext *s, int cond,
  * with the code buffer limited to 16MB we wouldn't need the long case.
  * But we also use it for the tail-call to the qemu_ld/st helpers, which does.
  */
-static void tcg_out_goto(TCGContext *s, int cond, const tcg_insn_unit *addr)
+static void tcg_out_goto(TCGContext *s, ARMCond cond, const tcg_insn_unit *addr)
 {
     intptr_t addri = (intptr_t)addr;
     ptrdiff_t disp = tcg_pcrel_diff(s, addr);
@@ -1280,7 +1280,7 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *addr)
     }
 }
 
-static void tcg_out_goto_label(TCGContext *s, int cond, TCGLabel *l)
+static void tcg_out_goto_label(TCGContext *s, ARMCond cond, TCGLabel *l)
 {
     if (l->has_value) {
         tcg_out_goto(s, cond, l->u.value_ptr);
@@ -1884,7 +1884,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 #endif
 }
 
-static void tcg_out_qemu_st_index(TCGContext *s, int cond, MemOp opc,
+static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
                                   TCGReg datalo, TCGReg datahi,
                                   TCGReg addrlo, TCGReg addend)
 {
-- 
2.25.1


