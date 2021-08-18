Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388483F0CF9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:50:39 +0200 (CEST)
Received: from localhost ([::1]:57858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSWE-0000h6-9b
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGSRu-0000I4-D7
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:46:10 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:38623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGSRr-00085C-U9
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:46:10 -0400
Received: by mail-pf1-x436.google.com with SMTP id a21so3407950pfh.5
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=J6pcCxhBe14sRLuVb3W2OppzqwbB0uz8Jyn3ZdOGqBU=;
 b=hmy1yERNgduTY28hP4C4tkxEJfib/JwH3xbia+oJE0wIqUmcV2ysDd/tW6zcKHeXWz
 khN2Sk8UkR29Mmv30aITf9vS0NgC6rGw+J4hI1hL9Ln7bX50iIsHZn43ggXjlhTI+nkl
 fbDii0YlvaTIa9tfhS06MmKni9g0xf9PMf16V7pCd7HoMyGvYDBrKQqjbja+uwM5lX42
 ZRKl4669YFzxD41awPFa5y+IapuuLpDgJ+WiZvPBcSj3ZNjYA6a4Kmw1Yd3txZl00ZuO
 94m++c3teKUyUB2NPZhiQVCcLa9QjScKZ++QU2P2MWTIpTCt6msUI3awh48eS7GGB4Er
 fJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J6pcCxhBe14sRLuVb3W2OppzqwbB0uz8Jyn3ZdOGqBU=;
 b=b5Z1wZcQ3xIrxFMsu8u+hr09+JyhtQAQ3Da/WWLiH10bO3Gr8J91M/qmz47E+76goA
 WatOInGLbHxgB4ltLI44qMIp3SiYuVqYNCeXFtMYZKpjeoA8VWGLktDhaiXiekkC8kGi
 p2AwH9/oKmw/DYSlR9QGXQjJKn3PthC5DY6/KaNWEzMpOCEa1NjuxRNL+jR5eNGET+0w
 FUi00miDB8XBJysbw3QUmGFjF6YZd28LL8EbJ8Yyk4R5eAVXkg6RLnz2CT/7w0y/ao6v
 9yvtbwbWMcwf3rSTjVl1RRMOBMGX5dFhG6GRBGunMHePvFHo6hNq5QJ+X4eXz9MQGgU7
 zYgA==
X-Gm-Message-State: AOAM532oAUc2zEdAkrvatVIhelebz3UpKdR+47CLYtjnL4PKdQj4F4ad
 49JRYkpBl4ZNNgzs97FTb4vC1MdwjkGb0Q==
X-Google-Smtp-Source: ABdhPJyoSwrpQ+IIqHWWO4okuToUh/ba0cZ6HvWz+i0zVlPM9ZcRqw3R2kP86W2HpW314IQtypp2Pw==
X-Received: by 2002:a65:468c:: with SMTP id h12mr10881253pgr.423.1629319566217; 
 Wed, 18 Aug 2021 13:46:06 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id 143sm739815pfz.13.2021.08.18.13.46.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:46:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] tcg/sparc: Drop inline markers
Date: Wed, 18 Aug 2021 10:45:56 -1000
Message-Id: <20210818204602.394771-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818204602.394771-1-richard.henderson@linaro.org>
References: <20210818204602.394771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Let the compiler decide about inlining.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 45 +++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 0e3f460584..f2bd213449 100644
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


