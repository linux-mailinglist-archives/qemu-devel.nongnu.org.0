Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3B45385EC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:10:47 +0200 (CEST)
Received: from localhost ([::1]:44904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvhyg-0006Ba-Av
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvN-0002e6-6X
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:21 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvK-0007An-HL
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:20 -0400
Received: by mail-wr1-x430.google.com with SMTP id h5so7195481wrb.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AnL2hapY+NZhJ7mggxRcg8oo4xHVA4awAFFe84llHYQ=;
 b=qWY49MbhyECw+6OLw0acu+Y26AOTRVFWWH6LeM4SPdf5uc+gGzdluSpLNj/z/UFxN1
 qKnzoCxvAKr0zKCpToZEVagmq2WRSQelwbxh0T4ttOYPPGlBDa76xf9OcQfkxbLnh4li
 C6tSTXsCqls0IfakjI4mZKncyWtLqcFEUrh+6B09vLRQHwRKAsoR9mTHz+gsR9rw9PwU
 2aok0k72r0KaJrRHjphcqF7Led37/7otEo8nVzxpU+osSzDp9eo+QRoIY0ULfFwig9m0
 KvS3gv5HrfoEqxEOorpC74YLBkHqjV6cV1vW22VjcSXGlkY+ECI38GasQCBpKV4aktiU
 Pt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AnL2hapY+NZhJ7mggxRcg8oo4xHVA4awAFFe84llHYQ=;
 b=wfQazbxehhwyVNSj5tuNvGUJMevBiv47/kjH0jUT4br8Y8mM3WcIp0fJLSK6u4pXcL
 4B4wdkDr9O5ooUlb/06JdC5vETq/ARpC/qc3QBFwwZaIz1gmC7EZ43Dg5B0/wOMLl5Rp
 8M/9W9Z76Tn0t6acqBgNgmvOBKxdp3ZRo/5PY8mGQFXx5JFlMDTmOpSWczlneicD/aXE
 kzfYSomtaq34ZMxswFUYcqQC1mfAd0Je8bTrnQ7Flu1fEwQMv374lvs/LnA1dT2viGr7
 fHCK5jt6w/H5UeEaLH4VczTPUvQkynKBA36npFkDDevCc3R4o1tt1xtW9jVWAia6fURY
 3tng==
X-Gm-Message-State: AOAM533P4klOYYfYv19fmJDncJKGywCaTbEoyT6Jst1ioB/zQspTURE1
 +ZLdslJTLzPhas4yTT/2bCGr03D3KlJH/Q==
X-Google-Smtp-Source: ABdhPJy5Rs6PmLqoT6aC8GVqOJjaq4aBZ+nr7Ots/TJMHdYTE2gpRv2n/U3c4HEbH7s+lP3Z5kX6TQ==
X-Received: by 2002:adf:f252:0:b0:210:2a67:2d9 with SMTP id
 b18-20020adff252000000b002102a6702d9mr8756033wrp.17.1653926834167; 
 Mon, 30 May 2022 09:07:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 005/117] target/arm: Move null function and sve check into
 gen_gvec_ool_zz
Date: Mon, 30 May 2022 17:05:16 +0100
Message-Id: <20220530160708.726466-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Message-id: 20220527181907.189259-3-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index dd4a5b23ab6..903514cb6a8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -137,13 +137,19 @@ static int pred_gvec_reg_size(DisasContext *s)
 }
 
 /* Invoke an out-of-line helper on 2 Zregs. */
-static void gen_gvec_ool_zz(DisasContext *s, gen_helper_gvec_2 *fn,
+static bool gen_gvec_ool_zz(DisasContext *s, gen_helper_gvec_2 *fn,
                             int rd, int rn, int data)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    tcg_gen_gvec_2_ool(vec_full_reg_offset(s, rd),
-                       vec_full_reg_offset(s, rn),
-                       vsz, vsz, data, fn);
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_2_ool(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vsz, vsz, data, fn);
+    }
+    return true;
 }
 
 /* Invoke an out-of-line helper on 3 Zregs. */
@@ -1377,13 +1383,7 @@ static bool trans_FEXPA(DisasContext *s, arg_rr_esz *a)
         gen_helper_sve_fexpa_s,
         gen_helper_sve_fexpa_d,
     };
-    if (a->esz == 0) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
-    }
-    return true;
+    return gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
 }
 
 static bool trans_FTSSEL(DisasContext *s, arg_rrr_esz *a)
@@ -2424,11 +2424,7 @@ static bool trans_REV_v(DisasContext *s, arg_rr_esz *a)
         gen_helper_sve_rev_b, gen_helper_sve_rev_h,
         gen_helper_sve_rev_s, gen_helper_sve_rev_d
     };
-
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
-    }
-    return true;
+    return gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
 }
 
 static bool trans_TBL(DisasContext *s, arg_rrr_esz *a)
@@ -8385,10 +8381,8 @@ static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
     if (!dc_isar_feature(aa64_sve2_aes, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zz(s, gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt);
-    }
-    return true;
+    return gen_gvec_ool_zz(s, gen_helper_crypto_aesmc,
+                           a->rd, a->rd, a->decrypt);
 }
 
 static bool do_aese(DisasContext *s, arg_rrr_esz *a, bool decrypt)
-- 
2.25.1


