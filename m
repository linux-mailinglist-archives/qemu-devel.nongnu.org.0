Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6DF2809C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 17:11:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38533 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTpN3-0000Wd-Ar
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 11:11:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTpKG-0007QA-P2
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:08:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTpKF-0001qQ-Ax
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:08:12 -0400
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44]:39535)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hTpKF-0001q4-63
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:08:11 -0400
Received: by mail-vs1-xe44.google.com with SMTP id m1so3790870vsr.6
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 08:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rcYn60MuwZW/klSWJb9WN17Hz/i/f31K3Wc/Hup4xgM=;
	b=Hcz47/5Jt+YLzizlrsq/9CkwctgIgU1UOwXtCZZLJ78c9qlYRRt9nfvFZAI/5lWFfE
	HmRyvw+nT4jl+xAbElwqalw9PO8ulEa5Y3NTlE6r3AVGLmM7w99f8uccdilzPIOR7Itv
	BvfSoXTluMGMBNpN6qtUX9ZM0z8A58mZ7ezdhjMssBiaF7NP9cIlvP6eOaVKUuLVhehW
	L01q3w5wSiX/kt9KPrvAq0r4bKR89+VfgjS4qnW2z/FoWqA+x/eEsihJvUN1DwPEM30V
	FunEO6xYFK6UuVR742WVTx+299mbnGS8VHPrKjHQWAIgETCIorEFxnQB5jONWcULL/+d
	/24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rcYn60MuwZW/klSWJb9WN17Hz/i/f31K3Wc/Hup4xgM=;
	b=GLh57BIO47EzeIcYSrhEEqiC+uLmrpIGvpyZH8bsP83JjS5xUwu1sCZdK8gUovicfX
	HhBcNSH3aGNBhCxU1w+RbmXR8X7q1HmgvmyrtQ4T+Plb772iXB2hrdk+yTwueXjNBXeC
	Wi7Ok3mFi2qGcVT+gj0b9HEB9db2lrcsRluprHtPsNhCQTG2L2gdz578Pl5VQ097XmpN
	sxl+ZJb/APfGB308vzqGwb2HVd/AqZB1PH3t4CHYPsCaUCGp2YFZLBCniWtUufsxaW3g
	TRB7FMtqJDYhxE4TA7CFcBITRbzH8VaSpbGx6h+lhEOiCpklB9hbZTA/RK8IT3jf9NbF
	aBRA==
X-Gm-Message-State: APjAAAXSc+5bmurmGQwyt0H6rsTL2XYHqfKqR4qK+9SKhmfdta3a3hTP
	nhP6wti/wQ8kxY8IvMqiSgP8D6gDtU0=
X-Google-Smtp-Source: APXvYqzDWRcyj4gGv6G/QF1k0doO5chP00In9ZbgZpOs0EES0dSVqtuEDagWDVGiPCRJNrKUw9lQJg==
X-Received: by 2002:a67:e2c4:: with SMTP id i4mr37152024vsm.185.1558624089617; 
	Thu, 23 May 2019 08:08:09 -0700 (PDT)
Received: from localhost.localdomain (ip-173-130-215-183.orldfl.spcsdns.net.
	[173.130.215.183]) by smtp.gmail.com with ESMTPSA id
	p70sm4227462vsd.25.2019.05.23.08.08.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 08:08:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 23 May 2019 11:07:59 -0400
Message-Id: <20190523150803.31504-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190523150803.31504-1-richard.henderson@linaro.org>
References: <20190523150803.31504-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::e44
Subject: [Qemu-devel] [PATCH 2/6] target/rx: Replace operand with prt_ldmi
 in disassembler
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ysato@users.sourceforge.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This has consistency with prt_ri().  It loads all data before
beginning output.  It uses exactly one call to prt() to emit
the full instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/disas.c | 77 +++++++++++++++++------------------------------
 1 file changed, 27 insertions(+), 50 deletions(-)

diff --git a/target/rx/disas.c b/target/rx/disas.c
index 64342537ee..515b365528 100644
--- a/target/rx/disas.c
+++ b/target/rx/disas.c
@@ -135,18 +135,18 @@ static void rx_index_addr(DisasContext *ctx, char out[8], int ld, int mi)
     sprintf(out, "%u", dsp << (mi < 3 ? mi : 4 - mi));
 }
 
-static void operand(DisasContext *ctx, int ld, int mi, int rs, int rd)
+static void prt_ldmi(DisasContext *ctx, const char *insn,
+                     int ld, int mi, int rs, int rd)
 {
     static const char sizes[][4] = {".b", ".w", ".l", ".uw", ".ub"};
     char dsp[8];
 
     if (ld < 3) {
         rx_index_addr(ctx, dsp, ld, mi);
-        prt("%s[r%d]%s", dsp, rs, sizes[mi]);
+        prt("%s\t%s[r%d]%s, r%d", insn, dsp, rs, sizes[mi], rd);
     } else {
-        prt("r%d", rs);
+        prt("%s\tr%d, r%d", insn, rs, rd);
     }
-    prt(", r%d", rd);
 }
 
 static void prt_ir(DisasContext *ctx, const char *insn, int imm, int rd)
@@ -416,8 +416,7 @@ static bool trans_AND_ir(DisasContext *ctx, arg_AND_ir *a)
 /* and rs,rd */
 static bool trans_AND_mr(DisasContext *ctx, arg_AND_mr *a)
 {
-    prt("and\t");
-    operand(ctx, a->ld, a->mi, a->rs, a->rd);
+    prt_ldmi(ctx, "and", a->ld, a->mi, a->rs, a->rd);
     return true;
 }
 
@@ -440,8 +439,7 @@ static bool trans_OR_ir(DisasContext *ctx, arg_OR_ir *a)
 /* or rs,rd */
 static bool trans_OR_mr(DisasContext *ctx, arg_OR_mr *a)
 {
-    prt("or\t");
-    operand(ctx, a->ld, a->mi, a->rs, a->rd);
+    prt_ldmi(ctx, "or", a->ld, a->mi, a->rs, a->rd);
     return true;
 }
 
@@ -463,8 +461,7 @@ static bool trans_XOR_ir(DisasContext *ctx, arg_XOR_ir *a)
 /* xor rs,rd */
 static bool trans_XOR_mr(DisasContext *ctx, arg_XOR_mr *a)
 {
-    prt("xor\t");
-    operand(ctx, a->ld, a->mi, a->rs, a->rd);
+    prt_ldmi(ctx, "xor", a->ld, a->mi, a->rs, a->rd);
     return true;
 }
 
@@ -479,8 +476,7 @@ static bool trans_TST_ir(DisasContext *ctx, arg_TST_ir *a)
 /* tst rs, rd */
 static bool trans_TST_mr(DisasContext *ctx, arg_TST_mr *a)
 {
-    prt("tst\t");
-    operand(ctx, a->ld, a->mi, a->rs, a->rd);
+    prt_ldmi(ctx, "tst", a->ld, a->mi, a->rs, a->rd);
     return true;
 }
 
@@ -548,8 +544,7 @@ static bool trans_ADD_irr(DisasContext *ctx, arg_ADD_irr *a)
 /* add dsp[rs], rd */
 static bool trans_ADD_mr(DisasContext *ctx, arg_ADD_mr *a)
 {
-    prt("add\t");
-    operand(ctx, a->ld, a->mi, a->rs, a->rd);
+    prt_ldmi(ctx, "add", a->ld, a->mi, a->rs, a->rd);
     return true;
 }
 
@@ -573,8 +568,7 @@ static bool trans_CMP_ir(DisasContext *ctx, arg_CMP_ir *a)
 /* cmp dsp[rs], rs2 */
 static bool trans_CMP_mr(DisasContext *ctx, arg_CMP_mr *a)
 {
-    prt("cmp\t");
-    operand(ctx, a->ld, a->mi, a->rs, a->rd);
+    prt_ldmi(ctx, "cmp", a->ld, a->mi, a->rs, a->rd);
     return true;
 }
 
@@ -589,8 +583,7 @@ static bool trans_SUB_ir(DisasContext *ctx, arg_SUB_ir *a)
 /* sub dsp[rs], rd */
 static bool trans_SUB_mr(DisasContext *ctx, arg_SUB_mr *a)
 {
-    prt("sub\t");
-    operand(ctx, a->ld, a->mi, a->rs, a->rd);
+    prt_ldmi(ctx, "sub", a->ld, a->mi, a->rs, a->rd);
     return true;
 }
 
@@ -611,8 +604,7 @@ static bool trans_SBB_rr(DisasContext *ctx, arg_SBB_rr *a)
 /* sbb dsp[rs], rd */
 static bool trans_SBB_mr(DisasContext *ctx, arg_SBB_mr *a)
 {
-    prt("sbb\t");
-    operand(ctx, a->ld, RX_IM_LONG, a->rs, a->rd);
+    prt_ldmi(ctx, "sbb", a->ld, RX_IM_LONG, a->rs, a->rd);
     return true;
 }
 
@@ -640,8 +632,7 @@ static bool trans_MAX_ir(DisasContext *ctx, arg_MAX_ir *a)
 /* max dsp[rs], rd */
 static bool trans_MAX_mr(DisasContext *ctx, arg_MAX_mr *a)
 {
-    prt("max\t");
-    operand(ctx, a->ld, a->mi, a->rs, a->rd);
+    prt_ldmi(ctx, "max", a->ld, a->mi, a->rs, a->rd);
     return true;
 }
 
@@ -656,8 +647,7 @@ static bool trans_MIN_ir(DisasContext *ctx, arg_MIN_ir *a)
 /* min dsp[rs], rd */
 static bool trans_MIN_mr(DisasContext *ctx, arg_MIN_mr *a)
 {
-    prt("max\t");
-    operand(ctx, a->ld, a->mi, a->rs, a->rd);
+    prt_ldmi(ctx, "min", a->ld, a->mi, a->rs, a->rd);
     return true;
 }
 
@@ -673,8 +663,7 @@ static bool trans_MUL_ir(DisasContext *ctx, arg_MUL_ir *a)
 /* mul dsp[rs], rd */
 static bool trans_MUL_mr(DisasContext *ctx, arg_MUL_mr *a)
 {
-    prt("mul\t");
-    operand(ctx, a->ld, a->mi, a->rs, a->rd);
+    prt_ldmi(ctx, "mul", a->ld, a->mi, a->rs, a->rd);
     return true;
 }
 
@@ -696,8 +685,7 @@ static bool trans_EMUL_ir(DisasContext *ctx, arg_EMUL_ir *a)
 /* emul dsp[rs], rd */
 static bool trans_EMUL_mr(DisasContext *ctx, arg_EMUL_mr *a)
 {
-    prt("emul\t");
-    operand(ctx, a->ld, a->mi, a->rs, a->rd);
+    prt_ldmi(ctx, "emul", a->ld, a->mi, a->rs, a->rd);
     return true;
 }
 
@@ -712,8 +700,7 @@ static bool trans_EMULU_ir(DisasContext *ctx, arg_EMULU_ir *a)
 /* emulu dsp[rs], rd */
 static bool trans_EMULU_mr(DisasContext *ctx, arg_EMULU_mr *a)
 {
-    prt("emulu\t");
-    operand(ctx, a->ld, a->mi, a->rs, a->rd);
+    prt_ldmi(ctx, "emulu", a->ld, a->mi, a->rs, a->rd);
     return true;
 }
 
@@ -728,8 +715,7 @@ static bool trans_DIV_ir(DisasContext *ctx, arg_DIV_ir *a)
 /* div dsp[rs], rd */
 static bool trans_DIV_mr(DisasContext *ctx, arg_DIV_mr *a)
 {
-    prt("div\t");
-    operand(ctx, a->ld, a->mi, a->rs, a->rd);
+    prt_ldmi(ctx, "div", a->ld, a->mi, a->rs, a->rd);
     return true;
 }
 
@@ -744,8 +730,7 @@ static bool trans_DIVU_ir(DisasContext *ctx, arg_DIVU_ir *a)
 /* divu dsp[rs], rd */
 static bool trans_DIVU_mr(DisasContext *ctx, arg_DIVU_mr *a)
 {
-    prt("divu\t");
-    operand(ctx, a->ld, a->mi, a->rs, a->rd);
+    prt_ldmi(ctx, "divu", a->ld, a->mi, a->rs, a->rd);
     return true;
 }
 
@@ -1089,8 +1074,7 @@ static bool trans_FADD_ir(DisasContext *ctx, arg_FADD_ir *a)
 /* fadd rs, rd */
 static bool trans_FADD_mr(DisasContext *ctx, arg_FADD_mr *a)
 {
-    prt("fadd\t");
-    operand(ctx, a->ld, RX_IM_LONG, a->rs, a->rd);
+    prt_ldmi(ctx, "fadd", a->ld, RX_IM_LONG, a->rs, a->rd);
     return true;
 }
 
@@ -1105,8 +1089,7 @@ static bool trans_FCMP_ir(DisasContext *ctx, arg_FCMP_ir *a)
 /* fcmp rs, rd */
 static bool trans_FCMP_mr(DisasContext *ctx, arg_FCMP_mr *a)
 {
-    prt("fcmp\t");
-    operand(ctx, a->ld, RX_IM_LONG, a->rs, a->rd);
+    prt_ldmi(ctx, "fcmp", a->ld, RX_IM_LONG, a->rs, a->rd);
     return true;
 }
 
@@ -1121,8 +1104,7 @@ static bool trans_FSUB_ir(DisasContext *ctx, arg_FSUB_ir *a)
 /* fsub rs, rd */
 static bool trans_FSUB_mr(DisasContext *ctx, arg_FSUB_mr *a)
 {
-    prt("fsub\t");
-    operand(ctx, a->ld, RX_IM_LONG, a->rs, a->rd);
+    prt_ldmi(ctx, "fsub", a->ld, RX_IM_LONG, a->rs, a->rd);
     return true;
 }
 
@@ -1130,8 +1112,7 @@ static bool trans_FSUB_mr(DisasContext *ctx, arg_FSUB_mr *a)
 /* ftoi rs, rd */
 static bool trans_FTOI(DisasContext *ctx, arg_FTOI *a)
 {
-    prt("ftoi\t");
-    operand(ctx, a->ld, RX_IM_LONG, a->rs, a->rd);
+    prt_ldmi(ctx, "ftoi", a->ld, RX_IM_LONG, a->rs, a->rd);
     return true;
 }
 
@@ -1146,8 +1127,7 @@ static bool trans_FMUL_ir(DisasContext *ctx, arg_FMUL_ir *a)
 /* fmul rs, rd */
 static bool trans_FMUL_mr(DisasContext *ctx, arg_FMUL_mr *a)
 {
-    prt("fmul\t");
-    operand(ctx, a->ld, RX_IM_LONG, a->rs, a->rd);
+    prt_ldmi(ctx, "fmul", a->ld, RX_IM_LONG, a->rs, a->rd);
     return true;
 }
 
@@ -1162,8 +1142,7 @@ static bool trans_FDIV_ir(DisasContext *ctx, arg_FDIV_ir *a)
 /* fdiv rs, rd */
 static bool trans_FDIV_mr(DisasContext *ctx, arg_FDIV_mr *a)
 {
-    prt("fdiv\t");
-    operand(ctx, a->ld, RX_IM_LONG, a->rs, a->rd);
+    prt_ldmi(ctx, "fdiv", a->ld, RX_IM_LONG, a->rs, a->rd);
     return true;
 }
 
@@ -1171,8 +1150,7 @@ static bool trans_FDIV_mr(DisasContext *ctx, arg_FDIV_mr *a)
 /* round rs, rd */
 static bool trans_ROUND(DisasContext *ctx, arg_ROUND *a)
 {
-    prt("round\t");
-    operand(ctx, a->ld, RX_IM_LONG, a->rs, a->rd);
+    prt_ldmi(ctx, "round", a->ld, RX_IM_LONG, a->rs, a->rd);
     return true;
 }
 
@@ -1180,8 +1158,7 @@ static bool trans_ROUND(DisasContext *ctx, arg_ROUND *a)
 /* itof dsp[rs], rd */
 static bool trans_ITOF(DisasContext *ctx, arg_ITOF *a)
 {
-    prt("itof\t");
-    operand(ctx, a->ld, RX_IM_LONG, a->rs, a->rd);
+    prt_ldmi(ctx, "itof", a->ld, RX_IM_LONG, a->rs, a->rd);
     return true;
 }
 
-- 
2.17.1


