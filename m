Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14B439C124
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:18:39 +0200 (CEST)
Received: from localhost ([::1]:40038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGH8-0003jF-OU
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB2-0005pP-EG
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:20 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB0-0005LH-9H
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:20 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 d5-20020a17090ab305b02901675357c371so7742459pjr.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 13:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+sAN0meenMh4DAuS0nymFIAbCzzpfLEfqhPYhd4qWa8=;
 b=zSmZSk3+VlU2xz87ET02h8atbN2acT1Mzrztn0kQhaRfIlpHmNrMhbBajMfilXbbzr
 xRa0Cyp7B/PRCwvHfhjaaZVvcKh9Bbe1k2hWkeCeeNG0i6QKEy4evXiSJYunicGY3f7o
 pZJFsDlIuB3eMK8KwUEWHjkRm4Jucp41Q9f4TxCbeVUl7Cyrzo5O8VEDVlN4QXMBJPUj
 JzklFxBmPpAV0piO5h7giwGV0RZN+jTe8Z5EUtlkqyXqWSLDIQTguoqc/BpDzjtELaS/
 Rd28CNW7BmBJ7ZyVZ2L7IYaM9Yf5jZQeOAindMvbVbNDgSADuxUxP7GITRqpnViNA0R3
 geGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+sAN0meenMh4DAuS0nymFIAbCzzpfLEfqhPYhd4qWa8=;
 b=f8ixETvh7Lrxv98V0Vw9pi66ZqU6WWJ4eXXT2YEHJB6vwbpYbxNY5Ysq4AMxKvbIDg
 QiOiAn/gVfNRaVIhwUT2c+g5JsB01Vc9PHFbeRLzolOgNe8OupLHb34bbOyiYQXGVPDQ
 wgFIzJGGeYtfwhUOKWiZ7PrsiRzfETMMJgTETP0mxUGbk2nh5VCjqxxCGGY+vEJTnznt
 e7HftqNSxTMZb7TE8+0Ppk63aW2ackP8ShxGo5ICLVYmV/oEKWfPI34ON6fXTlRWr3O3
 L8PKqC1hoNzegJs0cE1e04uhEHjRBqcrGrH/BEUowMN21zghuJ3qLMkPv3BSbj5/mvFv
 UCag==
X-Gm-Message-State: AOAM531z+Ozaz6hX0o3+UQfZ3bDAyJ/RB8ZOSxTrUgZr9q0t0YOLHIKw
 rwLRNHzRpHi2w4DsmJG6W7DZrrA4+LfLMQ==
X-Google-Smtp-Source: ABdhPJz+dDGouJFWJs7qw2abmMxrY3NbYsU0S2F8tXeTiGWSSIx3ZFwxcBxkbAFZ2AUepgaIdlFKhQ==
X-Received: by 2002:a17:902:da8a:b029:f1:f2a1:cfe4 with SMTP id
 j10-20020a170902da8ab02900f1f2a1cfe4mr6015864plx.46.1622837536981; 
 Fri, 04 Jun 2021 13:12:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id a129sm2422599pfa.118.2021.06.04.13.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:12:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/15] tcg/arm: Implement TCG_TARGET_HAS_sat_vec
Date: Fri,  4 Jun 2021 13:12:05 -0700
Message-Id: <20210604201210.920136-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604201210.920136-1-richard.henderson@linaro.org>
References: <20210604201210.920136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is saturating add and subtract, signed and unsigned.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h     |  2 +-
 tcg/arm/tcg-target.c.inc | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 94d768f249..71621f28e9 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -167,7 +167,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_shs_vec          0
 #define TCG_TARGET_HAS_shv_vec          0
 #define TCG_TARGET_HAS_mul_vec          1
-#define TCG_TARGET_HAS_sat_vec          0
+#define TCG_TARGET_HAS_sat_vec          1
 #define TCG_TARGET_HAS_minmax_vec       0
 #define TCG_TARGET_HAS_bitsel_vec       0
 #define TCG_TARGET_HAS_cmpsel_vec       0
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index b94e6ed0f3..f0cfed7700 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -184,6 +184,10 @@ typedef enum {
     INSN_VORR      = 0xf2200110,
     INSN_VSUB      = 0xf3000800,
     INSN_VMUL      = 0xf2000910,
+    INSN_VQADD     = 0xf2000010,
+    INSN_VQADD_U   = 0xf3000010,
+    INSN_VQSUB     = 0xf2000210,
+    INSN_VQSUB_U   = 0xf3000210,
 
     INSN_VABS      = 0xf3b10300,
     INSN_VMVN      = 0xf3b00580,
@@ -2396,7 +2400,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_dup2_vec:
     case INDEX_op_add_vec:
     case INDEX_op_mul_vec:
+    case INDEX_op_ssadd_vec:
+    case INDEX_op_sssub_vec:
     case INDEX_op_sub_vec:
+    case INDEX_op_usadd_vec:
+    case INDEX_op_ussub_vec:
     case INDEX_op_xor_vec:
         return C_O1_I2(w, w, w);
     case INDEX_op_or_vec:
@@ -2763,6 +2771,18 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_sub_vec:
         tcg_out_vreg3(s, INSN_VSUB, q, vece, a0, a1, a2);
         return;
+    case INDEX_op_ssadd_vec:
+        tcg_out_vreg3(s, INSN_VQADD, q, vece, a0, a1, a2);
+        return;
+    case INDEX_op_sssub_vec:
+        tcg_out_vreg3(s, INSN_VQSUB, q, vece, a0, a1, a2);
+        return;
+    case INDEX_op_usadd_vec:
+        tcg_out_vreg3(s, INSN_VQADD_U, q, vece, a0, a1, a2);
+        return;
+    case INDEX_op_ussub_vec:
+        tcg_out_vreg3(s, INSN_VQSUB_U, q, vece, a0, a1, a2);
+        return;
     case INDEX_op_xor_vec:
         tcg_out_vreg3(s, INSN_VEOR, q, 0, a0, a1, a2);
         return;
@@ -2873,6 +2893,10 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
     case INDEX_op_sari_vec:
+    case INDEX_op_ssadd_vec:
+    case INDEX_op_sssub_vec:
+    case INDEX_op_usadd_vec:
+    case INDEX_op_ussub_vec:
         return 1;
     case INDEX_op_abs_vec:
     case INDEX_op_cmp_vec:
-- 
2.25.1


