Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5193412BC5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 04:32:37 +0200 (CEST)
Received: from localhost ([::1]:51268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSVaG-0002Eg-OZ
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 22:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTi-0005jY-71
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:50 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:40855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTc-0006HO-63
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:49 -0400
Received: by mail-pl1-x630.google.com with SMTP id n18so12351861plp.7
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 19:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ls0KyBh45JfBQfAk7i0S5ef1RFy/+/wZAVM/jQsZv0w=;
 b=BzKTvXxrwJ3u+ipdf6Ho1oceOzFUcoyWf8gKaxt0v4h4DbWzmlyZtDuv6iKprDRZOw
 8EaulVvfPH0bqUy625k7d0ImUDG29SMECM5qpLMJp9//2bp2h9ZnaIqCFM0yahryYkI3
 YIGX1awOIBTQxkRZyHOBA1GDlv+pfUxgUVqHoUs4XK7jxGoKY7Qw5fBsY3i4BZKeBlzT
 mKpXPiJ0OnSDiYTeJoDp9U3t4S8wbh5xetbOUXJ4+ZvYENBuzikMcSb31hrjzHiomPKc
 8r8UfqAjBCQpD54ZASGu4fI6A1yav9rMODRgEPrbNfC2T3mpp8BzLH8ehp9KlB1h74gr
 S8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ls0KyBh45JfBQfAk7i0S5ef1RFy/+/wZAVM/jQsZv0w=;
 b=am4FYBPLB1D8j6CauKxUVySb5JDfVk7/2PNQ/bTa4SB5xG7T4vKFhhFgPjqUe+Komj
 RlknSBihald5I+lDyqeweYOcHxRozAw3jFy7Be54qlieijq/TypRBHKQnDQR86P1f+PB
 WacfsLtHFKiFHENy6nf1bK8rcWvDzvhw8dKGMb2Rq4CDAF5HuyELsZxmgzw94XSQentB
 t3JQ/EziBpsupubpCRgwGAFGWxUBs497lUEvJhqEyOKEGsR/crYxiSIvmEHIIY64rwbZ
 pT56NF/nlGAJR+7KprbpNoddttY1FdQG+toX0Sgl6BFeiAD35axN194GfFJ3AYXpmCkV
 0wcg==
X-Gm-Message-State: AOAM533E9PXLtCsvz9OKnsOMHRROrlnA4nYBr9kb4sjHx8R3U7+ePZnA
 mqM5E826tnyfx28/qZHLtjNGbU2X+HpjRw==
X-Google-Smtp-Source: ABdhPJyUJnzuPcxEFB0sUT5wvN0UT3VTYwF6Lznu8yiKiAVBSUWlVnVCncwERE7b2Kz2Z06bm+ovUA==
X-Received: by 2002:a17:90b:80a:: with SMTP id
 bk10mr2378971pjb.127.1632191141391; 
 Mon, 20 Sep 2021 19:25:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n9sm15297621pff.37.2021.09.20.19.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 19:25:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/10] tcg/sparc: Drop inline markers
Date: Mon, 20 Sep 2021 19:25:31 -0700
Message-Id: <20210921022534.365291-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921022534.365291-1-richard.henderson@linaro.org>
References: <20210921022534.365291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let the compiler decide about inlining.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 45 +++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 688827968b..1763253edd 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -294,12 +294,12 @@ static const int tcg_target_call_oarg_regs[] = {
 bool use_vis3_instructions;
 #endif
 
-static inline int check_fit_i64(int64_t val, unsigned int bits)
+static bool check_fit_i64(int64_t val, unsigned int bits)
 {
     return val == sextract64(val, 0, bits);
 }
 
-static inline int check_fit_i32(int32_t val, unsigned int bits)
+static bool check_fit_i32(int32_t val, unsigned int bits)
 {
     return val == sextract32(val, 0, bits);
 }
@@ -362,14 +362,14 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
     }
 }
 
-static inline void tcg_out_arith(TCGContext *s, TCGReg rd, TCGReg rs1,
-                                 TCGReg rs2, int op)
+static void tcg_out_arith(TCGContext *s, TCGReg rd, TCGReg rs1,
+                          TCGReg rs2, int op)
 {
     tcg_out32(s, op | INSN_RD(rd) | INSN_RS1(rs1) | INSN_RS2(rs2));
 }
 
-static inline void tcg_out_arithi(TCGContext *s, TCGReg rd, TCGReg rs1,
-                                  int32_t offset, int op)
+static void tcg_out_arithi(TCGContext *s, TCGReg rd, TCGReg rs1,
+                           int32_t offset, int op)
 {
     tcg_out32(s, op | INSN_RD(rd) | INSN_RS1(rs1) | INSN_IMM13(offset));
 }
@@ -381,8 +381,7 @@ static void tcg_out_arithc(TCGContext *s, TCGReg rd, TCGReg rs1,
               | (val2const ? INSN_IMM13(val2) : INSN_RS2(val2)));
 }
 
-static inline bool tcg_out_mov(TCGContext *s, TCGType type,
-                               TCGReg ret, TCGReg arg)
+static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
     if (ret != arg) {
         tcg_out_arith(s, ret, arg, TCG_REG_G0, ARITH_OR);
@@ -390,12 +389,12 @@ static inline bool tcg_out_mov(TCGContext *s, TCGType type,
     return true;
 }
 
-static inline void tcg_out_sethi(TCGContext *s, TCGReg ret, uint32_t arg)
+static void tcg_out_sethi(TCGContext *s, TCGReg ret, uint32_t arg)
 {
     tcg_out32(s, SETHI | INSN_RD(ret) | ((arg & 0xfffffc00) >> 10));
 }
 
-static inline void tcg_out_movi_imm13(TCGContext *s, TCGReg ret, int32_t arg)
+static void tcg_out_movi_imm13(TCGContext *s, TCGReg ret, int32_t arg)
 {
     tcg_out_arithi(s, ret, TCG_REG_G0, arg, ARITH_OR);
 }
@@ -470,14 +469,14 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     }
 }
 
-static inline void tcg_out_movi(TCGContext *s, TCGType type,
-                                TCGReg ret, tcg_target_long arg)
+static void tcg_out_movi(TCGContext *s, TCGType type,
+                         TCGReg ret, tcg_target_long arg)
 {
     tcg_out_movi_int(s, type, ret, arg, false);
 }
 
-static inline void tcg_out_ldst_rr(TCGContext *s, TCGReg data, TCGReg a1,
-                                   TCGReg a2, int op)
+static void tcg_out_ldst_rr(TCGContext *s, TCGReg data, TCGReg a1,
+                            TCGReg a2, int op)
 {
     tcg_out32(s, op | INSN_RD(data) | INSN_RS1(a1) | INSN_RS2(a2));
 }
@@ -494,20 +493,20 @@ static void tcg_out_ldst(TCGContext *s, TCGReg ret, TCGReg addr,
     }
 }
 
-static inline void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret,
-                              TCGReg arg1, intptr_t arg2)
+static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret,
+                       TCGReg arg1, intptr_t arg2)
 {
     tcg_out_ldst(s, ret, arg1, arg2, (type == TCG_TYPE_I32 ? LDUW : LDX));
 }
 
-static inline void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
-                              TCGReg arg1, intptr_t arg2)
+static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
 {
     tcg_out_ldst(s, arg, arg1, arg2, (type == TCG_TYPE_I32 ? STW : STX));
 }
 
-static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
-                               TCGReg base, intptr_t ofs)
+static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
+                        TCGReg base, intptr_t ofs)
 {
     if (val == 0) {
         tcg_out_st(s, type, TCG_REG_G0, base, ofs);
@@ -527,12 +526,12 @@ static void tcg_out_ld_ptr(TCGContext *s, TCGReg ret, const void *arg)
     tcg_out_ld(s, TCG_TYPE_PTR, ret, ret, (uintptr_t)arg & 0x3ff);
 }
 
-static inline void tcg_out_sety(TCGContext *s, TCGReg rs)
+static void tcg_out_sety(TCGContext *s, TCGReg rs)
 {
     tcg_out32(s, WRY | INSN_RS1(TCG_REG_G0) | INSN_RS2(rs));
 }
 
-static inline void tcg_out_rdy(TCGContext *s, TCGReg rd)
+static void tcg_out_rdy(TCGContext *s, TCGReg rd)
 {
     tcg_out32(s, RDY | INSN_RD(rd));
 }
@@ -552,7 +551,7 @@ static void tcg_out_div32(TCGContext *s, TCGReg rd, TCGReg rs1,
                    uns ? ARITH_UDIV : ARITH_SDIV);
 }
 
-static inline void tcg_out_nop(TCGContext *s)
+static void tcg_out_nop(TCGContext *s)
 {
     tcg_out32(s, NOP);
 }
-- 
2.25.1


