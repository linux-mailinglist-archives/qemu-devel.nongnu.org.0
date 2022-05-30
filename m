Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A97538608
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:22:34 +0200 (CEST)
Received: from localhost ([::1]:37378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviA5-0003fG-HB
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvN-0002f5-N6
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:21 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvK-0007Aa-HK
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:21 -0400
Received: by mail-wr1-x430.google.com with SMTP id p10so15256837wrg.12
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sOUheYAQJ8+bQRv31tELNanExF9i4j1PcXkMCL/gELU=;
 b=e9jFaVAb3fctOemzcYoM/kUeH8iqJuzeeHwyAxYgx5lvSfrZl1N9L/dOu9i3SBGPWA
 Qe2yOi/gXgXns0bC6iR6DZ8X9egS+yD/ZrNo2CFxhZw125xeEf+D4ZXHmBfWZT7igC+6
 k/Od9gm35SsMnXvOhre8IulxDQT26Ocm8cNbS41sIzaSawjNGCuk7kLv211CfF/migva
 jwpvQhDuV+JDkjrcVK+hs8Q1jp9u4T0dhcqN0DPC0I29nP8cOQ8r2Zej/kooDF1inxDo
 NGNPdo43u5O3stu8JMKA8Ohgvc2qqp5/KjyGaJYgioGLVYUmA3ud4d3m87CJ00vEeoDM
 O5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sOUheYAQJ8+bQRv31tELNanExF9i4j1PcXkMCL/gELU=;
 b=eSCMnMJB7dbzoZOzqqliBhlJiQigu82k0OELIziALI4CwbDlvm2AqMmA8TrIezZ+mE
 9vftxcOVRnA7p/D8hoUf3przEyPSJhbBAsMzLfFt6BJNW/ScgZSb7npGZpaAmdm2Fuif
 XMXc22D4bzHBIOOUJ5oCqdKVpmhlLjGQzOQ/HmyTDpgog3mGSaLZuFF8n1SP9weL5rmv
 0NBhPJC9MdqGgNXeC1uDtcGIzk5AyYjEdSkQGYQBaBW2gIo4uE04v17+2COkFmfBkARs
 JiXlKDGWRgBzCQ1AqNULumsJRG2Ejx/NhwqbiTM8TdTeDxzIYzUB7XjsQc80x4TfNnLc
 MUtw==
X-Gm-Message-State: AOAM532wXFN3aHZ03j35DRsQWq/vqceabm9UBPMfZwmX7miXnobbs0ro
 3PK1vuU1TJAn4CBDJQSxEU6UX+F0V3hL8g==
X-Google-Smtp-Source: ABdhPJzl1TJMnUc3IHia7px4G4Sy+mAnePki/0IOIBdmFIdKeKO5NLFbjNwDdzg+0lDcPYFYZst/FA==
X-Received: by 2002:a5d:64ab:0:b0:20f:ef37:a9d1 with SMTP id
 m11-20020a5d64ab000000b0020fef37a9d1mr26043381wrp.197.1653926835775; 
 Mon, 30 May 2022 09:07:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 007/117] target/arm: Move null function and sve check into
 gen_gvec_ool_zzz
Date: Mon, 30 May 2022 17:05:18 +0100
Message-Id: <20220530160708.726466-8-peter.maydell@linaro.org>
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
Message-id: 20220527181907.189259-5-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 74 ++++++++++++--------------------------
 1 file changed, 23 insertions(+), 51 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f7e7a569b7a..fd1d749c0ea 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -153,14 +153,20 @@ static bool gen_gvec_ool_zz(DisasContext *s, gen_helper_gvec_2 *fn,
 }
 
 /* Invoke an out-of-line helper on 3 Zregs. */
-static void gen_gvec_ool_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
+static bool gen_gvec_ool_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int rm, int data)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
-                       vec_full_reg_offset(s, rn),
-                       vec_full_reg_offset(s, rm),
-                       vsz, vsz, data, fn);
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           vsz, vsz, data, fn);
+    }
+    return true;
 }
 
 /* Invoke an out-of-line helper on 4 Zregs. */
@@ -1173,13 +1179,7 @@ static bool trans_LSL_zzi(DisasContext *s, arg_rri_esz *a)
 
 static bool do_zzw_ool(DisasContext *s, arg_rrr_esz *a, gen_helper_gvec_3 *fn)
 {
-    if (fn == NULL) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
 }
 
 #define DO_ZZW(NAME, name) \
@@ -1345,10 +1345,7 @@ static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
 
 static bool do_adr(DisasContext *s, arg_rrri *a, gen_helper_gvec_3 *fn)
 {
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, a->imm);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, a->imm);
 }
 
 static bool trans_ADR_p32(DisasContext *s, arg_rrri *a)
@@ -1390,13 +1387,7 @@ static bool trans_FTSSEL(DisasContext *s, arg_rrr_esz *a)
         gen_helper_sve_ftssel_s,
         gen_helper_sve_ftssel_d,
     };
-    if (a->esz == 0) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
 }
 
 /*
@@ -2426,11 +2417,7 @@ static bool trans_TBL(DisasContext *s, arg_rrr_esz *a)
         gen_helper_sve_tbl_b, gen_helper_sve_tbl_h,
         gen_helper_sve_tbl_s, gen_helper_sve_tbl_d
     };
-
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
 }
 
 static bool trans_TBL_sve2(DisasContext *s, arg_rrr_esz *a)
@@ -2460,10 +2447,7 @@ static bool trans_TBX(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
 }
 
 static bool trans_UNPK(DisasContext *s, arg_UNPK *a)
@@ -2618,10 +2602,7 @@ static bool do_zip(DisasContext *s, arg_rrr_esz *a, bool high)
 static bool do_zzz_data_ool(DisasContext *s, arg_rrr_esz *a, int data,
                             gen_helper_gvec_3 *fn)
 {
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, data);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, data);
 }
 
 static bool trans_ZIP1_z(DisasContext *s, arg_rrr_esz *a)
@@ -6693,13 +6674,10 @@ static bool trans_MUL_zzz(DisasContext *s, arg_rrr_esz *a)
 static bool do_sve2_zzz_ool(DisasContext *s, arg_rrr_esz *a,
                             gen_helper_gvec_3 *fn)
 {
-    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+    if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
 }
 
 static bool trans_SMULH_zzz(DisasContext *s, arg_rrr_esz *a)
@@ -8377,11 +8355,8 @@ static bool do_aese(DisasContext *s, arg_rrr_esz *a, bool decrypt)
     if (!dc_isar_feature(aa64_sve2_aes, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, gen_helper_crypto_aese,
-                         a->rd, a->rn, a->rm, decrypt);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, gen_helper_crypto_aese,
+                            a->rd, a->rn, a->rm, decrypt);
 }
 
 static bool trans_AESE(DisasContext *s, arg_rrr_esz *a)
@@ -8399,10 +8374,7 @@ static bool do_sm4(DisasContext *s, arg_rrr_esz *a, gen_helper_gvec_3 *fn)
     if (!dc_isar_feature(aa64_sve2_sm4, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
 }
 
 static bool trans_SM4E(DisasContext *s, arg_rrr_esz *a)
-- 
2.25.1


