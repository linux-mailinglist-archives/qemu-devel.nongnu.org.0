Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A212E1C18F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 06:51:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQPPc-0007oY-TH
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 00:51:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hQPOX-0007Iy-38
	for qemu-devel@nongnu.org; Tue, 14 May 2019 00:50:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hQPOV-0008Tz-U4
	for qemu-devel@nongnu.org; Tue, 14 May 2019 00:50:29 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:39924)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hQKxN-0003LM-K6
	for qemu-devel@nongnu.org; Mon, 13 May 2019 20:06:11 -0400
Received: by mail-pl1-x62d.google.com with SMTP id g9so7274548plm.6
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 17:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=93CQ9XehlOdvJ/OVRm1mqOp7YJkFqeVa1wbPr4921cI=;
	b=wI6SYVDvCXNJJxY+GhUxE+1+xSJL25oPfNQYJVtbEpVvFinK4pFzsrrDQzzwAlLCep
	CDY7PNDcrTWrevvfiD9ELK0TCAx6YFcULdu9BIoUs+xpi46Wda0HCpXgJSTFwL9TAyoV
	d28IzoneLFNdyClWXvGAeeRzDyh0XAOzYEKIILFvFEwyGRAOb1bLWV+D0cn0CtPq0pMK
	zZLTN0BbvRPMAXHKkjCpPLug+UbWXyWkEXhYAq5tXHFlvEzAXDYeS3kFuFKcQpYMCT+I
	VdYTFESeTVH7CzEPxnNanJa7MoSVki8I9ASyY4xcpQ1N2sofinW1fA969GndU7ucyhXo
	upLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=93CQ9XehlOdvJ/OVRm1mqOp7YJkFqeVa1wbPr4921cI=;
	b=fRmGV5LFrE3w69hXrm291xlf8H76NUf0KNnsNzAybawsqUES8PL4mDvMU3u7p8JSrc
	M9pRQmQ4ik+ukLPNX3g2pT2SbRuZb83Q8r7vn7zW1N0JA8UlorIm/DDxSsNbpRImEsM5
	aj8s74P/oEzMFoFHOcaXW6bNopzwOyBD6xv3I7+a7LLNQ/TFetQa9czgsESOJaBWzg8N
	yRcVOEG4LImKcLYiqlpe5PDATv8GyIQdgexKX30ILT/e/5w5fJgNgSXVk2CgzgT9wUHA
	LuEoGUbIK3lOzEMwORbgYRUu3P63kXM7Pz4Z3OY1dtGtV+EoLuTjAdWfS3N66bGCQGq/
	eM0g==
X-Gm-Message-State: APjAAAXsgKLCW3+9FSzm9ouwePqdCd+JLguO4V3DMid2IGCEkSTFX8Zb
	+GMa3hFiNVnzsC9GeXP8mdWKW5PAnFM=
X-Google-Smtp-Source: APXvYqyts3fiPgkupFA7sHdqyD6nGEmrEm82/z2Jl2mJb9uvtuegsa0has1HBBsH/WcovZ0+cAqvVw==
X-Received: by 2002:a17:902:7002:: with SMTP id
	y2mr35063939plk.75.1557792366055; 
	Mon, 13 May 2019 17:06:06 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231])
	by smtp.gmail.com with ESMTPSA id u3sm238151pfn.29.2019.05.13.17.06.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 17:06:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 17:05:26 -0700
Message-Id: <20190514000540.4313-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514000540.4313-1-richard.henderson@linaro.org>
References: <20190514000540.4313-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62d
Subject: [Qemu-devel] [PULL 17/31] tcg/aarch64: Support vector variable
 shift opcodes
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
Cc: peter.maydell@linux.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  2 +-
 tcg/aarch64/tcg-target.opc.h |  2 ++
 tcg/aarch64/tcg-target.inc.c | 42 ++++++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index ce2bb1f90b..f5640a229b 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -134,7 +134,7 @@ typedef enum {
 #define TCG_TARGET_HAS_neg_vec          1
 #define TCG_TARGET_HAS_shi_vec          1
 #define TCG_TARGET_HAS_shs_vec          0
-#define TCG_TARGET_HAS_shv_vec          0
+#define TCG_TARGET_HAS_shv_vec          1
 #define TCG_TARGET_HAS_cmp_vec          1
 #define TCG_TARGET_HAS_mul_vec          1
 #define TCG_TARGET_HAS_sat_vec          1
diff --git a/tcg/aarch64/tcg-target.opc.h b/tcg/aarch64/tcg-target.opc.h
index 4816a6c3d4..59e1d3f7f7 100644
--- a/tcg/aarch64/tcg-target.opc.h
+++ b/tcg/aarch64/tcg-target.opc.h
@@ -1,3 +1,5 @@
 /* Target-specific opcodes for host vector expansion.  These will be
    emitted by tcg_expand_vec_op.  For those familiar with GCC internals,
    consider these to be UNSPEC with names.  */
+
+DEF(aa64_sshl_vec, 1, 2, 0, IMPLVEC)
diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index 3dda66e777..df123c07f1 100644
--- a/tcg/aarch64/tcg-target.inc.c
+++ b/tcg/aarch64/tcg-target.inc.c
@@ -536,12 +536,14 @@ typedef enum {
     I3616_CMEQ      = 0x2e208c00,
     I3616_SMAX      = 0x0e206400,
     I3616_SMIN      = 0x0e206c00,
+    I3616_SSHL      = 0x0e204400,
     I3616_SQADD     = 0x0e200c00,
     I3616_SQSUB     = 0x0e202c00,
     I3616_UMAX      = 0x2e206400,
     I3616_UMIN      = 0x2e206c00,
     I3616_UQADD     = 0x2e200c00,
     I3616_UQSUB     = 0x2e202c00,
+    I3616_USHL      = 0x2e204400,
 
     /* AdvSIMD two-reg misc.  */
     I3617_CMGT0     = 0x0e208800,
@@ -2257,6 +2259,12 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_sari_vec:
         tcg_out_insn(s, 3614, SSHR, is_q, a0, a1, (16 << vece) - a2);
         break;
+    case INDEX_op_shlv_vec:
+        tcg_out_insn(s, 3616, USHL, is_q, vece, a0, a1, a2);
+        break;
+    case INDEX_op_aa64_sshl_vec:
+        tcg_out_insn(s, 3616, SSHL, is_q, vece, a0, a1, a2);
+        break;
     case INDEX_op_cmp_vec:
         {
             TCGCond cond = args[3];
@@ -2324,7 +2332,11 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_smin_vec:
     case INDEX_op_umax_vec:
     case INDEX_op_umin_vec:
+    case INDEX_op_shlv_vec:
         return 1;
+    case INDEX_op_shrv_vec:
+    case INDEX_op_sarv_vec:
+        return -1;
     case INDEX_op_mul_vec:
         return vece < MO_64;
 
@@ -2336,6 +2348,32 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
 void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
+    va_list va;
+    TCGv_vec v0, v1, v2, t1;
+
+    va_start(va, a0);
+    v0 = temp_tcgv_vec(arg_temp(a0));
+    v1 = temp_tcgv_vec(arg_temp(va_arg(va, TCGArg)));
+    v2 = temp_tcgv_vec(arg_temp(va_arg(va, TCGArg)));
+
+    switch (opc) {
+    case INDEX_op_shrv_vec:
+    case INDEX_op_sarv_vec:
+        /* Right shifts are negative left shifts for AArch64.  */
+        t1 = tcg_temp_new_vec(type);
+        tcg_gen_neg_vec(vece, t1, v2);
+        opc = (opc == INDEX_op_shrv_vec
+               ? INDEX_op_shlv_vec : INDEX_op_aa64_sshl_vec);
+        vec_gen_3(opc, type, vece, tcgv_vec_arg(v0),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(t1));
+        tcg_temp_free_vec(t1);
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+
+    va_end(va);
 }
 
 static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
@@ -2517,6 +2555,10 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_smin_vec:
     case INDEX_op_umax_vec:
     case INDEX_op_umin_vec:
+    case INDEX_op_shlv_vec:
+    case INDEX_op_shrv_vec:
+    case INDEX_op_sarv_vec:
+    case INDEX_op_aa64_sshl_vec:
         return &w_w_w;
     case INDEX_op_not_vec:
     case INDEX_op_neg_vec:
-- 
2.17.1


