Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB28538641
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:41:24 +0200 (CEST)
Received: from localhost ([::1]:53868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviSE-0001Nx-9n
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvY-0002wA-FH
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:32 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvW-0007DP-FN
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:32 -0400
Received: by mail-wr1-x432.google.com with SMTP id e25so4650957wra.11
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GEuut8RGJ90gY/DGoHG5nlaxN0h7NG7w8e8WiIbpp7U=;
 b=OMoMajYmRvc4203kR1fGiJS3qwnBYmkqni1jCIbYAMNGD9TOrovirDhpXDF5VaPPMi
 bsXCWP7dS1lc1243QDUlOPkWbrl492uIPcNhqXDtDXizCqFl4OHGIizsuMzMrSRO9zs/
 JCDjqsSL3KDPC82a91XjEm1zcWN7gCUgSNPmNrNB6kR8zn16IF993XZssDsYpTso3zkB
 xIKaJONM/0lP9uhCkbIdCUqZfjfOKemFYcMXW4mHpXAjB2CHjGdGPzWhX1jf/OSrenKG
 X/Vse7//1f7AWWwPs9b2IGCV4uxq4vI06nm8dix5Z9vSvPwaudhqtIR9CsMVqmXgz79+
 JoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GEuut8RGJ90gY/DGoHG5nlaxN0h7NG7w8e8WiIbpp7U=;
 b=od4S2fzBf8pTiv3YPLdIRHoJfu0u23NbYn5nhR/v1bH7nEyb+FpOcQyADy4NTSi4gz
 ounRykni5O3eZK7lkRWuyWXUBjanFtfubHMUN82ce8tIYO8cJn1IV5eYVbQCaHO9/Vxu
 K8gzFRKxaOpCKBxWE0GZItDnikguYuMMmcVDjRE9oMXcmB2nogyRgGYKI1YHvykUGxew
 qrnJYPX+3Mai+iH4iKBBrNVoT/XGLEChYgFH47n0T53CQ2WHQYz051JCRvQ22yzLNb5m
 Y8c5TaUgzwYAUdD+4WNnVnkEPp5QVrKkKDsnFPpg+CuzoEMfI7GV9tRqS/G0/GIaJZFk
 vo6g==
X-Gm-Message-State: AOAM5335RPO/SsL18Qxfze+i+Al8Jzr5t1g/t4AbTU3FoayuEjdg1XhX
 +4HxuCBFK97B44SP6RDqcbzcSfD0IkrzPg==
X-Google-Smtp-Source: ABdhPJxQ/8L1cgEx6ijIweVqkljE8ckIYTD/HeLufVOrsnLAh9wqIn/fEC8bZWv3GK6zGaNwdpsiGA==
X-Received: by 2002:a5d:47c5:0:b0:20e:73a0:79a0 with SMTP id
 o5-20020a5d47c5000000b0020e73a079a0mr43523196wrc.632.1653926848060; 
 Mon, 30 May 2022 09:07:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 022/117] target/arm: Move null function and sve check into
 gen_gvec_ool_zzp
Date: Mon, 30 May 2022 17:05:33 +0100
Message-Id: <20220530160708.726466-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Message-id: 20220527181907.189259-20-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b4307f062c3..e81c2de37f0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -206,14 +206,20 @@ static bool gen_gvec_ool_arg_zzxz(DisasContext *s, gen_helper_gvec_4 *fn,
 }
 
 /* Invoke an out-of-line helper on 2 Zregs and a predicate. */
-static void gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
+static bool gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int pg, int data)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
-                       vec_full_reg_offset(s, rn),
-                       pred_full_reg_offset(s, pg),
-                       vsz, vsz, data, fn);
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           pred_full_reg_offset(s, pg),
+                           vsz, vsz, data, fn);
+    }
+    return true;
 }
 
 /* Invoke an out-of-line helper on 3 Zregs and a predicate. */
@@ -801,13 +807,7 @@ static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a)
 
 static bool do_zpz_ool(DisasContext *s, arg_rpr_esz *a, gen_helper_gvec_3 *fn)
 {
-    if (fn == NULL) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, 0);
 }
 
 #define DO_ZPZ(NAME, name) \
@@ -986,20 +986,13 @@ static bool do_movz_zpz(DisasContext *s, int rd, int rn, int pg,
         gen_helper_sve_movz_b, gen_helper_sve_movz_h,
         gen_helper_sve_movz_s, gen_helper_sve_movz_d,
     };
-
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzp(s, fns[esz], rd, rn, pg, invert);
-    }
-    return true;
+    return gen_gvec_ool_zzp(s, fns[esz], rd, rn, pg, invert);
 }
 
 static bool do_zpzi_ool(DisasContext *s, arg_rpri_esz *a,
                         gen_helper_gvec_3 *fn)
 {
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, a->imm);
-    }
-    return true;
+    return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, a->imm);
 }
 
 static bool trans_ASR_zpzi(DisasContext *s, arg_rpri_esz *a)
-- 
2.25.1


