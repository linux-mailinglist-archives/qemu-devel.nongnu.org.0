Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830B8538647
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:43:42 +0200 (CEST)
Received: from localhost ([::1]:57250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviUX-0003lc-KI
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvc-00036x-DF
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:36 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvZ-0007BN-Kw
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:35 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t6so15296903wra.4
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WmScn6J55PqHshyd6EK1XzZi7oxAl9RtRW83tljGoNA=;
 b=TnL/7kafEOGLEbmU8OJJw65DKCYFJVmjuu8M8EFKSyUuzE0n4n0AxKLpVMQKFthJYQ
 StAvgysLUKc0kZ3MRDhRWjf2EPcS9ArM3gGaM5pFxGbOtiqtjY8sM0BmDxgBRykG36wL
 H8Y3weAFmM+nQTOIxI5TLOaUDt+ZdhD2Wottxu1AQM/Ox8kFqzdGFyhQkpfJVIP9Duht
 7XPo3sFdOM7+e80Dax/BytRFPa9zGpmFVez4Naz0d1V9sC/Q1n+jPwVus7a7RDLUwIqF
 vBN7U8b/VbIJwlHF4GjZxx17ZuP0b7b6aaAMtkFDef+TA/cWR59Tk4qWdtKDpsdWFqHP
 A7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WmScn6J55PqHshyd6EK1XzZi7oxAl9RtRW83tljGoNA=;
 b=BqNGI7PZR0Y9mlgY4cVg851Maf1sYGA+45P/pvyIC3THPWG5PYpVPVeHuV7cDGv9nU
 zCOmCmHvbqOSon17+6Zus6rMGWTG9jkMurD9ZrI4qSS6k7G6dPumc4geAi7PWpYUSy97
 5ocWILPB/XQsvm4LIrHbW0AbQhTNk/oLNIbaj3Qb0xHOYS0Tmert6q1JJnwMUq/5YsMW
 XdVjKvmVz3ncgP3EZx/g1FB3UU2j1YHMsozGvFv5Hg0Flgx0r07De2EcQp7FbVFe7Tzv
 A+CuT1OfnlVU7TvW7OmekPYeisoBd0iqUysMkmtpZhcEyNNZLhifnXifOxFKNBixFHgQ
 Z1Jw==
X-Gm-Message-State: AOAM531QjzS9h/rDNVPXpLlv8dInH6BIIBBWdb56wd5C15IeZ5UNYx9+
 8diqR++UtKND+vkK2K+ukMNN6yQb8dT/QQ==
X-Google-Smtp-Source: ABdhPJyoXIO4EozSLqz724MG8lQfJcKaDeUefcN3+QWCMqAQGbWf4OJLzc8E6ESJLXVm4v7GkabmSw==
X-Received: by 2002:a5d:6c66:0:b0:20f:86f3:ea05 with SMTP id
 r6-20020a5d6c66000000b0020f86f3ea05mr40692033wrz.154.1653926852739; 
 Mon, 30 May 2022 09:07:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 028/117] target/arm: Move null function and sve check into
 gen_gvec_ool_zzzp
Date: Mon, 30 May 2022 17:05:39 +0100
Message-Id: <20220530160708.726466-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Message-id: 20220527181907.189259-26-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 42 ++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 10614bf9151..fea7164d729 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -235,15 +235,21 @@ static bool gen_gvec_ool_arg_zpzi(DisasContext *s, gen_helper_gvec_3 *fn,
 }
 
 /* Invoke an out-of-line helper on 3 Zregs and a predicate. */
-static void gen_gvec_ool_zzzp(DisasContext *s, gen_helper_gvec_4 *fn,
+static bool gen_gvec_ool_zzzp(DisasContext *s, gen_helper_gvec_4 *fn,
                               int rd, int rn, int rm, int pg, int data)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
-                       vec_full_reg_offset(s, rn),
-                       vec_full_reg_offset(s, rm),
-                       pred_full_reg_offset(s, pg),
-                       vsz, vsz, data, fn);
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           pred_full_reg_offset(s, pg),
+                           vsz, vsz, data, fn);
+    }
+    return true;
 }
 
 /* Invoke a vector expander on two Zregs.  */
@@ -733,13 +739,7 @@ static bool trans_UQSUB_zzz(DisasContext *s, arg_rrr_esz *a)
 
 static bool do_zpzz_ool(DisasContext *s, arg_rprr_esz *a, gen_helper_gvec_4 *fn)
 {
-    if (fn == NULL) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, 0);
 }
 
 /* Select active elememnts from Zn and inactive elements from Zm,
@@ -2950,11 +2950,8 @@ TRANS_FEAT(REVW, aa64_sve, gen_gvec_ool_arg_zpz,
 
 static bool trans_SPLICE(DisasContext *s, arg_rprr_esz *a)
 {
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
-                          a->rd, a->rn, a->rm, a->pg, a->esz);
-    }
-    return true;
+    return gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
+                             a->rd, a->rn, a->rm, a->pg, a->esz);
 }
 
 static bool trans_SPLICE_sve2(DisasContext *s, arg_rpr_esz *a)
@@ -2962,11 +2959,8 @@ static bool trans_SPLICE_sve2(DisasContext *s, arg_rpr_esz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
-                          a->rd, a->rn, (a->rn + 1) % 32, a->pg, a->esz);
-    }
-    return true;
+    return gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
+                             a->rd, a->rn, (a->rn + 1) % 32, a->pg, a->esz);
 }
 
 /*
-- 
2.25.1


