Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE72538633
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:37:43 +0200 (CEST)
Received: from localhost ([::1]:45466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviOk-0003xY-Ev
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvY-0002xE-QZ
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:32 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvW-0007Aw-FC
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:32 -0400
Received: by mail-wr1-x436.google.com with SMTP id q7so4314885wrg.5
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=41lJnygvy+J/py2l6M2rkfObr0Gi8yPksczak9lmeMw=;
 b=lkfsT3CfcwQf/nyl8EMORSTvVVxMHk5qL6CHH1GOPX/dtGcGngC6WPwa7oGPunp8Ix
 YrM4o+DE9KuFQlFwZWZmRnMOKMTKzGvkwcBXBfz6AQHchlmIZNHXf9J77PQ5pfzFT555
 ZcpIwdbxDER5rYdFLYqJaow/PbZy4oVlWPJde3ynffKCu7okL4vMWjPDYrkGMniXnF3x
 bO6V8KsHbdVisbD/VIL+u6ykxo3ac79Ob2Yp1IkwLJ2PpkeBxUj3hTGxYylpM+lQQ97w
 81GkIOgAIYvaKsB2mbs1Ba6Y9z80a3evsf6uFqYZDReE+pSUPcqxm4mB0zW/dvc6cUSn
 9ajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=41lJnygvy+J/py2l6M2rkfObr0Gi8yPksczak9lmeMw=;
 b=8FWk6cCH1nX+rrBz21hBcxsDuU9ZWkaVPrLcol2xppvyNWQpcaOVcWWeyajgbysVNQ
 /aExklrNXyzwxxM47x5Gn+YUbpPvZUKMblngMCmZSBaXQO0KVDsQlyfOBYYAcuEVEDJi
 wt5gevrZZKJlWZpT3uG0j2ZxADClhSzA2gqtF3N2OODK8zmyl/VJW2QAgOSkwt3Kehp1
 OQ0+0itb/fmCxY0t0z9D1mhyrhz38juAMqXcmhwLLw9vhVeUqToHrj9z8Xpr9odduViQ
 /OzpoY3Qz3Nzq+8XXiqG3s+wIvu/LWxMyq9S7l7N+oEkRrJjb9TrqJGmIWfCzaKSrQdf
 o14A==
X-Gm-Message-State: AOAM533MAe6QXuiIOjJPbrMimL3q6Cc9L8ybunijGadcHd/h/zXqH1m2
 NuJ2myoGJw/dJpaJynIZ/WfP7+DtJ4dRQA==
X-Google-Smtp-Source: ABdhPJz5irNOy+ArSWO5Yjiyja6DxjD3ZPycQHB1DP4g0UK3c5xPypAvItb3XytlHYlHgV1r3VzIdw==
X-Received: by 2002:a5d:47a1:0:b0:20f:ecc4:7f6c with SMTP id
 1-20020a5d47a1000000b0020fecc47f6cmr28370340wrb.236.1653926848881; 
 Mon, 30 May 2022 09:07:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 023/117] target/arm: Introduce gen_gvec_ool_arg_zpz
Date: Mon, 30 May 2022 17:05:34 +0100
Message-Id: <20220530160708.726466-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Use gen_gvec_ool_arg_zpz instead of gen_gvec_ool_zzp
when the arguments come from arg_rpr_esz.
Replaces do_zpz_ool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-21-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 45 +++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e81c2de37f0..be426db6a93 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -222,6 +222,13 @@ static bool gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
     return true;
 }
 
+static bool gen_gvec_ool_arg_zpz(DisasContext *s, gen_helper_gvec_3 *fn,
+                                 arg_rpr_esz *a, int data)
+{
+    return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, data);
+}
+
+
 /* Invoke an out-of-line helper on 3 Zregs and a predicate. */
 static void gen_gvec_ool_zzzp(DisasContext *s, gen_helper_gvec_4 *fn,
                               int rd, int rn, int rm, int pg, int data)
@@ -805,11 +812,6 @@ static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a)
  *** SVE Integer Arithmetic - Unary Predicated Group
  */
 
-static bool do_zpz_ool(DisasContext *s, arg_rpr_esz *a, gen_helper_gvec_3 *fn)
-{
-    return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, 0);
-}
-
 #define DO_ZPZ(NAME, name) \
 static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a)           \
 {                                                                   \
@@ -817,7 +819,7 @@ static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a)           \
         gen_helper_sve_##name##_b, gen_helper_sve_##name##_h,       \
         gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,       \
     };                                                              \
-    return do_zpz_ool(s, a, fns[a->esz]);                           \
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);              \
 }
 
 DO_ZPZ(CLS, cls)
@@ -836,7 +838,7 @@ static bool trans_FABS(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_fabs_s,
         gen_helper_sve_fabs_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_FNEG(DisasContext *s, arg_rpr_esz *a)
@@ -847,7 +849,7 @@ static bool trans_FNEG(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_fneg_s,
         gen_helper_sve_fneg_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_SXTB(DisasContext *s, arg_rpr_esz *a)
@@ -858,7 +860,7 @@ static bool trans_SXTB(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_sxtb_s,
         gen_helper_sve_sxtb_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_UXTB(DisasContext *s, arg_rpr_esz *a)
@@ -869,7 +871,7 @@ static bool trans_UXTB(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_uxtb_s,
         gen_helper_sve_uxtb_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_SXTH(DisasContext *s, arg_rpr_esz *a)
@@ -879,7 +881,7 @@ static bool trans_SXTH(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_sxth_s,
         gen_helper_sve_sxth_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_UXTH(DisasContext *s, arg_rpr_esz *a)
@@ -889,17 +891,19 @@ static bool trans_UXTH(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_uxth_s,
         gen_helper_sve_uxth_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_SXTW(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_zpz_ool(s, a, a->esz == 3 ? gen_helper_sve_sxtw_d : NULL);
+    return gen_gvec_ool_arg_zpz(s, a->esz == 3 ? gen_helper_sve_sxtw_d
+                                : NULL, a, 0);
 }
 
 static bool trans_UXTW(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_zpz_ool(s, a, a->esz == 3 ? gen_helper_sve_uxtw_d : NULL);
+    return gen_gvec_ool_arg_zpz(s, a->esz == 3 ? gen_helper_sve_uxtw_d
+                                : NULL, a, 0);
 }
 
 #undef DO_ZPZ
@@ -2659,7 +2663,7 @@ static bool trans_COMPACT(DisasContext *s, arg_rpr_esz *a)
     static gen_helper_gvec_3 * const fns[4] = {
         NULL, NULL, gen_helper_sve_compact_s, gen_helper_sve_compact_d
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 /* Call the helper that computes the ARM LastActiveElement pseudocode
@@ -3008,7 +3012,7 @@ static bool trans_REVB(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_revb_s,
         gen_helper_sve_revb_d,
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_REVH(DisasContext *s, arg_rpr_esz *a)
@@ -3019,12 +3023,13 @@ static bool trans_REVH(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_revh_s,
         gen_helper_sve_revh_d,
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_REVW(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_zpz_ool(s, a, a->esz == 3 ? gen_helper_sve_revw_d : NULL);
+    return gen_gvec_ool_arg_zpz(s, a->esz == 3 ? gen_helper_sve_revw_d
+                                : NULL, a, 0);
 }
 
 static bool trans_RBIT(DisasContext *s, arg_rpr_esz *a)
@@ -3035,7 +3040,7 @@ static bool trans_RBIT(DisasContext *s, arg_rpr_esz *a)
         gen_helper_sve_rbit_s,
         gen_helper_sve_rbit_d,
     };
-    return do_zpz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_SPLICE(DisasContext *s, arg_rprr_esz *a)
@@ -6624,7 +6629,7 @@ static bool do_sve2_zpz_ool(DisasContext *s, arg_rpr_esz *a,
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zpz_ool(s, a, fn);
+    return gen_gvec_ool_arg_zpz(s, fn, a, 0);
 }
 
 static bool trans_URECPE(DisasContext *s, arg_rpr_esz *a)
-- 
2.25.1


