Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEBB5366E4
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:23:47 +0200 (CEST)
Received: from localhost ([::1]:53960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nueck-0002E2-HC
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYO-0006Ca-EO
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:16 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:46946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYK-0003V2-HP
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:16 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so5009543pjf.5
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z/J8KIBd8FwwQ9GCtKuGXF2/fLJclKixu9nNnrnC2i4=;
 b=TTOLyHLzdBe+m//0qpy69wpnOMHGCdUDahS+iBfIrrIsn/ptO0mVxZunS2fSYRVU2D
 Cx4IivtuBMLCvXO6xpLXxrzsHSyGYG802jakbudXxh5eS3jm+QLcQAfjk1KF0MVNBUcW
 YoqS/AqhpCkor2pMM+rfonCT7HzYIrNULgcShzw7GyfCKBnrNTh0oXYDmIZCiXk5dXRB
 Uxy/L8dQJlYuCetWwaVQTEKSX+HlT4H/2PqsRgQYH7iYCrtJuDTCiVuyhdXGAj+U0VrI
 /rTVV4a2T7TDpd0QDAWGwo4HVUO/BiLQ5qWr/cp1C6Ny1LWHAPrb63I9J9ZmF98hbeOl
 wU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z/J8KIBd8FwwQ9GCtKuGXF2/fLJclKixu9nNnrnC2i4=;
 b=0g6rBtlUPRD32IzWCpTDUkhcFSP8swGFKCG5pesTS+EU4k8KoYJe743euFW9GyYTRi
 4PejNulpzbZABJd1daGRi9bz4oUfeJViYdYdpyKX+MHBnpIxsTvSgKgLWhRL8+qKLxL1
 715dIewkH5MxrjFwhSPdcv0/TMf1cBBNnOgKreAJqAiRg3o0psX4OpR/BCwOZX74pA11
 eh8rYj9AlGqOUbyXGjUGWAK50XUt0bm45guI9o4nIj9NHJw/vh5xRWF/lib4GPgWMyaH
 GOCk4mC0L2w/rWtJIHIFtditPIp9B2awitgTE/l0tum4Af5CGCSB87TshKPnxLXnkKWN
 11LA==
X-Gm-Message-State: AOAM533b7tnShzmPF9sO8/jWx1g3YQi2+65umO26n2zXKMjVP4ZQigvY
 cdfLKrsVytGlFs5GOAygovwN3cai//dbzg==
X-Google-Smtp-Source: ABdhPJxzO4XGMLZWcExtkdTUcCZD8CCqS6I1jobc3m2hxN1Vs4+EgwYCPhK3HJRIHiON5SGOIZAY4A==
X-Received: by 2002:a17:90b:38d2:b0:1df:51e5:9a0b with SMTP id
 nn18-20020a17090b38d200b001df51e59a0bmr9675468pjb.101.1653675551163; 
 Fri, 27 May 2022 11:19:11 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 002/114] target/arm: Move null function and sve check into
 gen_gvec_ool_zz
Date: Fri, 27 May 2022 11:17:15 -0700
Message-Id: <20220527181907.189259-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index dd4a5b23ab..903514cb6a 100644
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
2.34.1


