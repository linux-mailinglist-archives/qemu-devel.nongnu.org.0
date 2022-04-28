Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862E85137C1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:07:40 +0200 (CEST)
Received: from localhost ([::1]:46846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5k3-0008HW-9S
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jf-0005Lw-Oa
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:24 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:56027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Je-0006IG-05
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:23 -0400
Received: by mail-wm1-x32a.google.com with SMTP id m62so3062830wme.5
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AbD8T7mojSOYo+XIlmEltIIoiZDaB+qxPmq37wiNe1k=;
 b=CMaGVlDO6X1zJa8X4JkxzUXbb2ynXZgDznkZZQTioSMhj9CPx7HMfxeEHzG2uKMOab
 o4g0109BowqtdKvSvXoJAv6Kg7rEultOOjmmuaB4BT7Hm+6OlItjwQEBx2l7Y/b0PmEr
 ve0ExvuJnD5v6SSeYWg3BoyZRUmFUKjGDpy8IRoQnyNZoik/XhTfvQg2rnMSTR3CmGV+
 f9V+IoRoiWB2uXnkGVthWYkMRD55W1is/xmMA1GYJ34Biecj9X8nKe5CP9Oy4jZVeJXG
 XfoIwVP+2gwjoFTWufQ8ZB2Nn+x9hTlA2cOxxAvTEkC86YoEL9fOM/96JknBggUpgPW2
 5DGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AbD8T7mojSOYo+XIlmEltIIoiZDaB+qxPmq37wiNe1k=;
 b=lJCSlYVAlbsQC5jSN+aC5qQYJ7b0bLgfHExgvQ96rJuzV+x+dQLZA3cGmVRZasVPs0
 oVv0WY3EKzU9Dfjs22L5h/kHxM7JBFDD9lyhgF+Oignwo05VerhFrb7FpL2VE9OJ3x7e
 yhhhn5srL1+7X6Shg34Qe1w28RmtQMldLVJ9GMQkXXd0Dc2eUkG3C+Oy2kOE669W3SwT
 spL5df12TkuSmdywkIy2mL3IUPoP8QZkulGeU7I9ZQPSi8Ef0jUwgfoTu6rCEsbDYX/X
 YakBaXM3T/N8zgUONCxPzBkrTOBSgvqhAkTtcsAlqGsSnsH8jXBsdeQ8ysyXCktLPxCZ
 SrhA==
X-Gm-Message-State: AOAM533y0d7cp1KSbFYTcBlGXueCbzF1nOo7mCapEsJ5abi7ymehTHXY
 9AxTxmbk/H9sEe67aDaObksyTxRXRzkaKg==
X-Google-Smtp-Source: ABdhPJyuwJsOG/4fFG38vqdGS634TYQYJhRAtBJlnHFMKbxBilFIEaCqGlFNAp1FZFB+SK3ZH7a4UA==
X-Received: by 2002:a7b:c84f:0:b0:393:e729:e670 with SMTP id
 c15-20020a7bc84f000000b00393e729e670mr22828780wml.153.1651156820615; 
 Thu, 28 Apr 2022 07:40:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/54] target/arm: Use tcg_constant in simd fp/int conversion
Date: Thu, 28 Apr 2022 15:39:23 +0100
Message-Id: <20220428143958.2451229-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-20-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 815320d2e35..cae0444e2db 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -8728,7 +8728,7 @@ static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
     int pass;
 
     if (fracbits || size == MO_64) {
-        tcg_shift = tcg_const_i32(fracbits);
+        tcg_shift = tcg_constant_i32(fracbits);
     }
 
     if (size == MO_64) {
@@ -8813,9 +8813,6 @@ static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
     }
 
     tcg_temp_free_ptr(tcg_fpst);
-    if (tcg_shift) {
-        tcg_temp_free_i32(tcg_shift);
-    }
 
     clear_vec_high(s, elements << size == 16, rd);
 }
@@ -8905,7 +8902,7 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
     tcg_fpstatus = fpstatus_ptr(size == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
     fracbits = (16 << size) - immhb;
-    tcg_shift = tcg_const_i32(fracbits);
+    tcg_shift = tcg_constant_i32(fracbits);
 
     if (size == MO_64) {
         int maxpass = is_scalar ? 1 : 2;
@@ -8963,7 +8960,6 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
         }
     }
 
-    tcg_temp_free_i32(tcg_shift);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
     tcg_temp_free_ptr(tcg_fpstatus);
     tcg_temp_free_i32(tcg_rmode);
@@ -9835,23 +9831,15 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
     case 0x1c: /* FCVTAS */
     case 0x3a: /* FCVTPS */
     case 0x3b: /* FCVTZS */
-    {
-        TCGv_i32 tcg_shift = tcg_const_i32(0);
-        gen_helper_vfp_tosqd(tcg_rd, tcg_rn, tcg_shift, tcg_fpstatus);
-        tcg_temp_free_i32(tcg_shift);
+        gen_helper_vfp_tosqd(tcg_rd, tcg_rn, tcg_constant_i32(0), tcg_fpstatus);
         break;
-    }
     case 0x5a: /* FCVTNU */
     case 0x5b: /* FCVTMU */
     case 0x5c: /* FCVTAU */
     case 0x7a: /* FCVTPU */
     case 0x7b: /* FCVTZU */
-    {
-        TCGv_i32 tcg_shift = tcg_const_i32(0);
-        gen_helper_vfp_touqd(tcg_rd, tcg_rn, tcg_shift, tcg_fpstatus);
-        tcg_temp_free_i32(tcg_shift);
+        gen_helper_vfp_touqd(tcg_rd, tcg_rn, tcg_constant_i32(0), tcg_fpstatus);
         break;
-    }
     case 0x18: /* FRINTN */
     case 0x19: /* FRINTM */
     case 0x38: /* FRINTP */
@@ -9891,7 +9879,7 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
 
     if (is_double) {
         TCGv_i64 tcg_op = tcg_temp_new_i64();
-        TCGv_i64 tcg_zero = tcg_const_i64(0);
+        TCGv_i64 tcg_zero = tcg_constant_i64(0);
         TCGv_i64 tcg_res = tcg_temp_new_i64();
         NeonGenTwoDoubleOpFn *genfn;
         bool swap = false;
@@ -9927,13 +9915,12 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
             write_vec_element(s, tcg_res, rd, pass, MO_64);
         }
         tcg_temp_free_i64(tcg_res);
-        tcg_temp_free_i64(tcg_zero);
         tcg_temp_free_i64(tcg_op);
 
         clear_vec_high(s, !is_scalar, rd);
     } else {
         TCGv_i32 tcg_op = tcg_temp_new_i32();
-        TCGv_i32 tcg_zero = tcg_const_i32(0);
+        TCGv_i32 tcg_zero = tcg_constant_i32(0);
         TCGv_i32 tcg_res = tcg_temp_new_i32();
         NeonGenTwoSingleOpFn *genfn;
         bool swap = false;
@@ -10002,7 +9989,6 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
             }
         }
         tcg_temp_free_i32(tcg_res);
-        tcg_temp_free_i32(tcg_zero);
         tcg_temp_free_i32(tcg_op);
         if (!is_scalar) {
             clear_vec_high(s, is_q, rd);
-- 
2.25.1


