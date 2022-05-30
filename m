Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD2B53861A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:25:51 +0200 (CEST)
Received: from localhost ([::1]:48420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviDG-0002jW-AB
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvR-0002nt-MY
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:25 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvP-0007DP-4x
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:25 -0400
Received: by mail-wr1-x432.google.com with SMTP id e25so4650957wra.11
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=O3L/9QMpX61DzYXZh2zSuMODu8njIKKHvrLP8VuXitE=;
 b=GjlVSiLq3jyGy0kHbLKRmcXNTUeM81cOGCnMDxdiYpkMEyy44OYZX6w6XFuRo3SVNO
 EwYIXs+820L7wv/dQORZx0V7LNhufN0Sx+d2qFrAP2vLk/NWqZks/MBvK5l6yD+ygFZZ
 GGuv7p3AENnCgt7io20TX93kO67sT7NrhlP1Ur55JwrHaT6spXa3BxoGB/PeVFuiyHHY
 acVjsvS4UQ7o3YjcVT45EfSy/8wgVZvmoEmzItE5k4ExCyHcsyJUFQOQUP73CZXypk7l
 MS2e5UCjlCE9MLjUxlocKwsn3tgUdkx0y4fe2YtqBHAXS+RyS+ihK5nKXsm3osB/BWB6
 K2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O3L/9QMpX61DzYXZh2zSuMODu8njIKKHvrLP8VuXitE=;
 b=h1X0mtQI0/BaR2Zj+N/NVrvTq0KqSSl9kMRnIFxw07j57fx+IocweuxEsk9sg+A1jC
 o4b2izrUj3IfLYwzVyF2UqSCgbDUW0VZML3Ir61hsAU9xRR7+Siu2inZjRezFGcB3FHj
 Wi8ffbZYb5GwulG2474SoIfSNNWwhlyypiJraeLQQkDG/wKnleZLt0GLprEKCpHpsua4
 6JDR2MheXS6zCJ+fEcsAq5lovCp1y/MQhLjUQLS6aSvq8UbtrzGxjC9THBSoDp0dcby4
 dLoJle0dVXmB/cUoIorYrRmS9ApaIOPgCIsj4mdrJshLLujNQCuuXaxxd3VWuBwoeQlF
 piFA==
X-Gm-Message-State: AOAM532jFm/Ta7T2Yn0bjMeoCZbQ75I+zeV/2h5wJdPHT4YR5nWb4Kq/
 aTm+frxgk42GPrpTqOfeDcMoxfpqe8OVMA==
X-Google-Smtp-Source: ABdhPJxy33Rtsjhg4zVykvTHLDONd1FQw4KSK4oHl3nTFdqIuT/jxk+Lj4L5MP1/w+Q9AtRvpJ3GEQ==
X-Received: by 2002:adf:e0c3:0:b0:20c:5672:9577 with SMTP id
 m3-20020adfe0c3000000b0020c56729577mr45678896wri.466.1653926841786; 
 Mon, 30 May 2022 09:07:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 014/117] target/arm: Use TRANS_FEAT for do_sve2_zzzz_ool
Date: Mon, 30 May 2022 17:05:25 +0100
Message-Id: <20220530160708.726466-15-peter.maydell@linaro.org>
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

Convert SVE translation functions using do_sve2_zzzz_ool
to use TRANS_FEAT and gen_gvec_ool_arg_zzzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-12-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 263 +++++++++++--------------------------
 1 file changed, 79 insertions(+), 184 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e795baf6f92..cae6df705a4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7109,45 +7109,19 @@ static bool trans_SQCADD_rot270(DisasContext *s, arg_rrr_esz *a)
     return do_cadd(s, a, true, true);
 }
 
-static bool do_sve2_zzzz_ool(DisasContext *s, arg_rrrr_esz *a,
-                             gen_helper_gvec_4 *fn, int data)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzzz(s, fn, a, data);
-}
+static gen_helper_gvec_4 * const sabal_fns[4] = {
+    NULL,                    gen_helper_sve2_sabal_h,
+    gen_helper_sve2_sabal_s, gen_helper_sve2_sabal_d,
+};
+TRANS_FEAT(SABALB, aa64_sve2, gen_gvec_ool_arg_zzzz, sabal_fns[a->esz], a, 0)
+TRANS_FEAT(SABALT, aa64_sve2, gen_gvec_ool_arg_zzzz, sabal_fns[a->esz], a, 1)
 
-static bool do_abal(DisasContext *s, arg_rrrr_esz *a, bool uns, bool sel)
-{
-    static gen_helper_gvec_4 * const fns[2][4] = {
-        { NULL,                    gen_helper_sve2_sabal_h,
-          gen_helper_sve2_sabal_s, gen_helper_sve2_sabal_d },
-        { NULL,                    gen_helper_sve2_uabal_h,
-          gen_helper_sve2_uabal_s, gen_helper_sve2_uabal_d },
-    };
-    return do_sve2_zzzz_ool(s, a, fns[uns][a->esz], sel);
-}
-
-static bool trans_SABALB(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_abal(s, a, false, false);
-}
-
-static bool trans_SABALT(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_abal(s, a, false, true);
-}
-
-static bool trans_UABALB(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_abal(s, a, true, false);
-}
-
-static bool trans_UABALT(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_abal(s, a, true, true);
-}
+static gen_helper_gvec_4 * const uabal_fns[4] = {
+    NULL,                    gen_helper_sve2_uabal_h,
+    gen_helper_sve2_uabal_s, gen_helper_sve2_uabal_d,
+};
+TRANS_FEAT(UABALB, aa64_sve2, gen_gvec_ool_arg_zzzz, uabal_fns[a->esz], a, 0)
+TRANS_FEAT(UABALT, aa64_sve2, gen_gvec_ool_arg_zzzz, uabal_fns[a->esz], a, 1)
 
 static bool do_adcl(DisasContext *s, arg_rrrr_esz *a, bool sel)
 {
@@ -7159,18 +7133,11 @@ static bool do_adcl(DisasContext *s, arg_rrrr_esz *a, bool sel)
      * Note that in this case the ESZ field encodes both size and sign.
      * Split out 'subtract' into bit 1 of the data field for the helper.
      */
-    return do_sve2_zzzz_ool(s, a, fns[a->esz & 1], (a->esz & 2) | sel);
+    return gen_gvec_ool_arg_zzzz(s, fns[a->esz & 1], a, (a->esz & 2) | sel);
 }
 
-static bool trans_ADCLB(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_adcl(s, a, false);
-}
-
-static bool trans_ADCLT(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_adcl(s, a, true);
-}
+TRANS_FEAT(ADCLB, aa64_sve2, do_adcl, a, false)
+TRANS_FEAT(ADCLT, aa64_sve2, do_adcl, a, true)
 
 static bool do_sve2_fn2i(DisasContext *s, arg_rri_esz *a, GVecGen2iFn *fn)
 {
@@ -8048,149 +8015,77 @@ static bool trans_FMMLA(DisasContext *s, arg_rrrr_esz *a)
     return true;
 }
 
-static bool do_sqdmlal_zzzw(DisasContext *s, arg_rrrr_esz *a,
-                            bool sel1, bool sel2)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        NULL,                           gen_helper_sve2_sqdmlal_zzzw_h,
-        gen_helper_sve2_sqdmlal_zzzw_s, gen_helper_sve2_sqdmlal_zzzw_d,
-    };
-    return do_sve2_zzzz_ool(s, a, fns[a->esz], (sel2 << 1) | sel1);
-}
+static gen_helper_gvec_4 * const sqdmlal_zzzw_fns[] = {
+    NULL,                           gen_helper_sve2_sqdmlal_zzzw_h,
+    gen_helper_sve2_sqdmlal_zzzw_s, gen_helper_sve2_sqdmlal_zzzw_d,
+};
+TRANS_FEAT(SQDMLALB_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           sqdmlal_zzzw_fns[a->esz], a, 0)
+TRANS_FEAT(SQDMLALT_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           sqdmlal_zzzw_fns[a->esz], a, 3)
+TRANS_FEAT(SQDMLALBT, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           sqdmlal_zzzw_fns[a->esz], a, 2)
 
-static bool do_sqdmlsl_zzzw(DisasContext *s, arg_rrrr_esz *a,
-                            bool sel1, bool sel2)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        NULL,                           gen_helper_sve2_sqdmlsl_zzzw_h,
-        gen_helper_sve2_sqdmlsl_zzzw_s, gen_helper_sve2_sqdmlsl_zzzw_d,
-    };
-    return do_sve2_zzzz_ool(s, a, fns[a->esz], (sel2 << 1) | sel1);
-}
+static gen_helper_gvec_4 * const sqdmlsl_zzzw_fns[] = {
+    NULL,                           gen_helper_sve2_sqdmlsl_zzzw_h,
+    gen_helper_sve2_sqdmlsl_zzzw_s, gen_helper_sve2_sqdmlsl_zzzw_d,
+};
+TRANS_FEAT(SQDMLSLB_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           sqdmlsl_zzzw_fns[a->esz], a, 0)
+TRANS_FEAT(SQDMLSLT_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           sqdmlsl_zzzw_fns[a->esz], a, 3)
+TRANS_FEAT(SQDMLSLBT, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           sqdmlsl_zzzw_fns[a->esz], a, 2)
 
-static bool trans_SQDMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sqdmlal_zzzw(s, a, false, false);
-}
+static gen_helper_gvec_4 * const sqrdmlah_fns[] = {
+    gen_helper_sve2_sqrdmlah_b, gen_helper_sve2_sqrdmlah_h,
+    gen_helper_sve2_sqrdmlah_s, gen_helper_sve2_sqrdmlah_d,
+};
+TRANS_FEAT(SQRDMLAH_zzzz, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           sqrdmlah_fns[a->esz], a, 0)
 
-static bool trans_SQDMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sqdmlal_zzzw(s, a, true, true);
-}
+static gen_helper_gvec_4 * const sqrdmlsh_fns[] = {
+    gen_helper_sve2_sqrdmlsh_b, gen_helper_sve2_sqrdmlsh_h,
+    gen_helper_sve2_sqrdmlsh_s, gen_helper_sve2_sqrdmlsh_d,
+};
+TRANS_FEAT(SQRDMLSH_zzzz, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           sqrdmlsh_fns[a->esz], a, 0)
 
-static bool trans_SQDMLALBT(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sqdmlal_zzzw(s, a, false, true);
-}
+static gen_helper_gvec_4 * const smlal_zzzw_fns[] = {
+    NULL,                         gen_helper_sve2_smlal_zzzw_h,
+    gen_helper_sve2_smlal_zzzw_s, gen_helper_sve2_smlal_zzzw_d,
+};
+TRANS_FEAT(SMLALB_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           smlal_zzzw_fns[a->esz], a, 0)
+TRANS_FEAT(SMLALT_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           smlal_zzzw_fns[a->esz], a, 1)
 
-static bool trans_SQDMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sqdmlsl_zzzw(s, a, false, false);
-}
+static gen_helper_gvec_4 * const umlal_zzzw_fns[] = {
+    NULL,                         gen_helper_sve2_umlal_zzzw_h,
+    gen_helper_sve2_umlal_zzzw_s, gen_helper_sve2_umlal_zzzw_d,
+};
+TRANS_FEAT(UMLALB_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           umlal_zzzw_fns[a->esz], a, 0)
+TRANS_FEAT(UMLALT_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           umlal_zzzw_fns[a->esz], a, 1)
 
-static bool trans_SQDMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sqdmlsl_zzzw(s, a, true, true);
-}
+static gen_helper_gvec_4 * const smlsl_zzzw_fns[] = {
+    NULL,                         gen_helper_sve2_smlsl_zzzw_h,
+    gen_helper_sve2_smlsl_zzzw_s, gen_helper_sve2_smlsl_zzzw_d,
+};
+TRANS_FEAT(SMLSLB_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           smlsl_zzzw_fns[a->esz], a, 0)
+TRANS_FEAT(SMLSLT_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           smlsl_zzzw_fns[a->esz], a, 1)
 
-static bool trans_SQDMLSLBT(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_sqdmlsl_zzzw(s, a, false, true);
-}
-
-static bool trans_SQRDMLAH_zzzz(DisasContext *s, arg_rrrr_esz *a)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        gen_helper_sve2_sqrdmlah_b, gen_helper_sve2_sqrdmlah_h,
-        gen_helper_sve2_sqrdmlah_s, gen_helper_sve2_sqrdmlah_d,
-    };
-    return do_sve2_zzzz_ool(s, a, fns[a->esz], 0);
-}
-
-static bool trans_SQRDMLSH_zzzz(DisasContext *s, arg_rrrr_esz *a)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        gen_helper_sve2_sqrdmlsh_b, gen_helper_sve2_sqrdmlsh_h,
-        gen_helper_sve2_sqrdmlsh_s, gen_helper_sve2_sqrdmlsh_d,
-    };
-    return do_sve2_zzzz_ool(s, a, fns[a->esz], 0);
-}
-
-static bool do_smlal_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        NULL,                         gen_helper_sve2_smlal_zzzw_h,
-        gen_helper_sve2_smlal_zzzw_s, gen_helper_sve2_smlal_zzzw_d,
-    };
-    return do_sve2_zzzz_ool(s, a, fns[a->esz], sel);
-}
-
-static bool trans_SMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_smlal_zzzw(s, a, false);
-}
-
-static bool trans_SMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_smlal_zzzw(s, a, true);
-}
-
-static bool do_umlal_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        NULL,                         gen_helper_sve2_umlal_zzzw_h,
-        gen_helper_sve2_umlal_zzzw_s, gen_helper_sve2_umlal_zzzw_d,
-    };
-    return do_sve2_zzzz_ool(s, a, fns[a->esz], sel);
-}
-
-static bool trans_UMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_umlal_zzzw(s, a, false);
-}
-
-static bool trans_UMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_umlal_zzzw(s, a, true);
-}
-
-static bool do_smlsl_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        NULL,                         gen_helper_sve2_smlsl_zzzw_h,
-        gen_helper_sve2_smlsl_zzzw_s, gen_helper_sve2_smlsl_zzzw_d,
-    };
-    return do_sve2_zzzz_ool(s, a, fns[a->esz], sel);
-}
-
-static bool trans_SMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_smlsl_zzzw(s, a, false);
-}
-
-static bool trans_SMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_smlsl_zzzw(s, a, true);
-}
-
-static bool do_umlsl_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
-{
-    static gen_helper_gvec_4 * const fns[] = {
-        NULL,                         gen_helper_sve2_umlsl_zzzw_h,
-        gen_helper_sve2_umlsl_zzzw_s, gen_helper_sve2_umlsl_zzzw_d,
-    };
-    return do_sve2_zzzz_ool(s, a, fns[a->esz], sel);
-}
-
-static bool trans_UMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_umlsl_zzzw(s, a, false);
-}
-
-static bool trans_UMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_umlsl_zzzw(s, a, true);
-}
+static gen_helper_gvec_4 * const umlsl_zzzw_fns[] = {
+    NULL,                         gen_helper_sve2_umlsl_zzzw_h,
+    gen_helper_sve2_umlsl_zzzw_s, gen_helper_sve2_umlsl_zzzw_d,
+};
+TRANS_FEAT(UMLSLB_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           umlsl_zzzw_fns[a->esz], a, 0)
+TRANS_FEAT(UMLSLT_zzzw, aa64_sve2, gen_gvec_ool_arg_zzzz,
+           umlsl_zzzw_fns[a->esz], a, 1)
 
 static gen_helper_gvec_4 * const cmla_fns[] = {
     gen_helper_sve2_cmla_zzzz_b, gen_helper_sve2_cmla_zzzz_h,
-- 
2.25.1


