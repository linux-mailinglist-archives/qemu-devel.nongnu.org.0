Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CB453862E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:36:14 +0200 (CEST)
Received: from localhost ([::1]:42610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviNJ-0001ul-JT
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhva-000311-D5
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:34 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvY-0007FZ-KI
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:34 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s24so7955976wrb.10
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OvlhncWfyUe1412V5tz1P2lfzLWRV6R/S+GAWEJJo2c=;
 b=ztMA4B2tLUSqgMMKemj4zeTJLmfVbJIUFjZNbowjw4EXo86c2SZnv6iER05vX2w7oj
 oM6QaRIuv6K7w5oO5wHg+HztIDTBOt0JM6hySXZiQaqZnJcG5no2kSHRqV+yQYEzElIn
 kzLhTVY6f1iuyRgCLJ+RjgKUdEQWTs2YdYDGrGB626tvkcGD6JobED9kgsszsdRtzm25
 eaxXhEDPXmKVTAjJyEDzvLITQaTrL/E1Z41RFAVE/ElSbavcNFGjtDSDTACIK7kaqbqh
 K4R4PD4Jv7xF5d/PEjGKkJ0fUBegeQXAsLo1+7BNKM7oBz62e52Je87ArnmW7sxrpCdP
 0gSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OvlhncWfyUe1412V5tz1P2lfzLWRV6R/S+GAWEJJo2c=;
 b=tMLB8lffZ2mw7b6ft/q47o797k5DrvRjLCp20sgPgQBF3WOMKdhd51Yb+TvP4aJ95E
 FB320xT5teXGHaKFl6YdQPRZgB2ndwCD88qH/96mwN3Bvse+MxKfG3sT9jSM6W88zfiI
 H4Ozx6fd7CiAZcmqBiuizFbIguQ5R8T2UWYd6wQj2/jVoaFZBjfTvbp0KvX7rDtP7xad
 oh17nm2+h6Nr6yidcvHX/NeA7m25K9LgJ4eVK2DSdXAsTUjqiZ67UaBJnDu2IGodJMAb
 srv68escRv99HMpbI0g3JR6rS2xX3B2NIJahpuDEk3nV7RPYmuYaga+DZzVVxgDQJMSr
 z3Pw==
X-Gm-Message-State: AOAM5315IHHTkZSppnQCqAGw7Efu4+T6CAanRaG2FYlI4wRrlfV+ovuT
 7D3OQABMSHlbDlAtjHcGb5NWugpySDbcfQ==
X-Google-Smtp-Source: ABdhPJwmraTVzayHUUIHmO1fatSSSSikYNSok83I1QT88RgXzxV0gv7ZqCVCK6U3kHV+sApf1YhStQ==
X-Received: by 2002:adf:f80a:0:b0:210:32ed:35bf with SMTP id
 s10-20020adff80a000000b0021032ed35bfmr5342247wrp.51.1653926851251; 
 Mon, 30 May 2022 09:07:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 026/117] target/arm: Rename do_zpzi_ool to gen_gvec_ool_arg_zpzi
Date: Mon, 30 May 2022 17:05:37 +0100
Message-Id: <20220530160708.726466-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

Rename the function to match gen_gvec_ool_arg_zpz,
and move to be adjacent.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-24-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fe11cfed6bb..86e87a20782 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -228,6 +228,11 @@ static bool gen_gvec_ool_arg_zpz(DisasContext *s, gen_helper_gvec_3 *fn,
     return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, data);
 }
 
+static bool gen_gvec_ool_arg_zpzi(DisasContext *s, gen_helper_gvec_3 *fn,
+                                  arg_rpri_esz *a)
+{
+    return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, a->imm);
+}
 
 /* Invoke an out-of-line helper on 3 Zregs and a predicate. */
 static void gen_gvec_ool_zzzp(DisasContext *s, gen_helper_gvec_4 *fn,
@@ -952,12 +957,6 @@ static bool do_movz_zpz(DisasContext *s, int rd, int rn, int pg,
     return gen_gvec_ool_zzp(s, fns[esz], rd, rn, pg, invert);
 }
 
-static bool do_zpzi_ool(DisasContext *s, arg_rpri_esz *a,
-                        gen_helper_gvec_3 *fn)
-{
-    return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, a->imm);
-}
-
 static bool trans_ASR_zpzi(DisasContext *s, arg_rpri_esz *a)
 {
     static gen_helper_gvec_3 * const fns[4] = {
@@ -971,7 +970,7 @@ static bool trans_ASR_zpzi(DisasContext *s, arg_rpri_esz *a)
     /* Shift by element size is architecturally valid.  For
        arithmetic right-shift, it's the same as by one less. */
     a->imm = MIN(a->imm, (8 << a->esz) - 1);
-    return do_zpzi_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
 }
 
 static bool trans_LSR_zpzi(DisasContext *s, arg_rpri_esz *a)
@@ -988,7 +987,7 @@ static bool trans_LSR_zpzi(DisasContext *s, arg_rpri_esz *a)
     if (a->imm >= (8 << a->esz)) {
         return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
     } else {
-        return do_zpzi_ool(s, a, fns[a->esz]);
+        return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
     }
 }
 
@@ -1006,7 +1005,7 @@ static bool trans_LSL_zpzi(DisasContext *s, arg_rpri_esz *a)
     if (a->imm >= (8 << a->esz)) {
         return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
     } else {
-        return do_zpzi_ool(s, a, fns[a->esz]);
+        return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
     }
 }
 
@@ -1024,7 +1023,7 @@ static bool trans_ASRD(DisasContext *s, arg_rpri_esz *a)
     if (a->imm >= (8 << a->esz)) {
         return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
     } else {
-        return do_zpzi_ool(s, a, fns[a->esz]);
+        return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
     }
 }
 
@@ -1037,7 +1036,7 @@ static bool trans_SQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
     if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zpzi_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
 }
 
 static bool trans_UQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
@@ -1049,7 +1048,7 @@ static bool trans_UQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
     if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zpzi_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
 }
 
 static bool trans_SRSHR(DisasContext *s, arg_rpri_esz *a)
@@ -1061,7 +1060,7 @@ static bool trans_SRSHR(DisasContext *s, arg_rpri_esz *a)
     if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zpzi_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
 }
 
 static bool trans_URSHR(DisasContext *s, arg_rpri_esz *a)
@@ -1073,7 +1072,7 @@ static bool trans_URSHR(DisasContext *s, arg_rpri_esz *a)
     if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zpzi_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
 }
 
 static bool trans_SQSHLU(DisasContext *s, arg_rpri_esz *a)
@@ -1085,7 +1084,7 @@ static bool trans_SQSHLU(DisasContext *s, arg_rpri_esz *a)
     if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zpzi_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
 }
 
 /*
-- 
2.25.1


