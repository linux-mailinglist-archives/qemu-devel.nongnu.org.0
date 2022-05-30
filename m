Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27486538625
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:32:15 +0200 (CEST)
Received: from localhost ([::1]:34146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviJR-0004K9-H6
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvY-0002xG-RK
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:32 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:45652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvW-0007Ek-FC
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 n124-20020a1c2782000000b003972dfca96cso6701293wmn.4
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QkImHyEx6gI+wlg1HnsBHPkyBHw+SkdzfryZkr3IJ+w=;
 b=md1nM76+L0JTaoVukpr6nLp1pieeZrmWrtw4JFN4/45CKEGSdQTyD6FonXRCLJKWJr
 r1T19IYvYUGOQl157Wl6YRQ12WQo6FktyYM7Q2vQg97yiEiI/qb59/b7qYRJvh+AaIbh
 QFhu90wk3JhnhhUZB/rIXtiqujZDunMSsPzYxWrJ8KMDaWzsic9RNTnnrm5mXJttr4iL
 EADbGTqZnDc9AoYywWZFIwb+mpf4HemjnPi6YI9fiINZjYFtP+C6gA2KfMw9/EF66qBk
 wxDkVmUorxD+3jxVuPXdqAzCYHKpDXZBJ7eV3IgkUi8na9YE7cLv6x2hppNBjX3a+U1O
 WiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QkImHyEx6gI+wlg1HnsBHPkyBHw+SkdzfryZkr3IJ+w=;
 b=I8wWpSbNgaJxltKnzaat5kzxIwzVjmy5xpm4+dqukKJV7P/sZffP+e3gh+KETOX8rF
 Os3jxyZTmngMyMHrKNZlTDApQeSgaKvhuW7RLGccAx8VByH0kuHzuq7SGItGl0Ewrq5R
 oJXdF5ZKytMway2bonr9lstFYY7kq4u4e5Qxgj+ARLFBr9vJn2tEYpU/omXz1mtt7khy
 CHx0pj2ubivISOpDdebLn/ks4/FlMaRHylI0nNaGkEaURb4yeb/drrNALplxn7c7pZlk
 u8h1Hy7+IDnXYL/zERum73wRy4eAvfSn3iUIEkzyz1zODvw46t4pIeV8X4EBhjXit8sA
 8LYA==
X-Gm-Message-State: AOAM532xMdgr0fgUk3qp3E0Z/7eYfjrT6LeXqQh3G+czRoDol+v4p9q9
 5e4gbPwZAwc014NwHWcIFZz/EV5dpO+MRA==
X-Google-Smtp-Source: ABdhPJxySLHsyvXp/WdchR/ND1jeolJpteoP5V7TGemRHfhiBhM6x/5VEn6nkGa/cIpkotnPZxVmSw==
X-Received: by 2002:a1c:f405:0:b0:397:56ec:b8fb with SMTP id
 z5-20020a1cf405000000b0039756ecb8fbmr19344875wma.99.1653926846611; 
 Mon, 30 May 2022 09:07:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 020/117] target/arm: Use TRANS_FEAT for do_sve2_zzw_data
Date: Mon, 30 May 2022 17:05:31 +0100
Message-Id: <20220530160708.726466-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

Convert SVE translation functions using do_sve2_zzw_data
to use TRANS_FEAT and gen_gvec_ool_arg_zzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-18-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 297 ++++++++++++++++++-------------------
 1 file changed, 145 insertions(+), 152 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c345399ace9..2347b60d8ef 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6711,79 +6711,99 @@ DO_SVE2_ZPZZ(USQADD, usqadd)
  * SVE2 Widening Integer Arithmetic
  */
 
-static bool do_sve2_zzw_ool(DisasContext *s, arg_rrr_esz *a,
-                            gen_helper_gvec_3 *fn, int data)
-{
-    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vsz, vsz, data, fn);
-    }
-    return true;
-}
+static gen_helper_gvec_3 * const saddl_fns[4] = {
+    NULL,                    gen_helper_sve2_saddl_h,
+    gen_helper_sve2_saddl_s, gen_helper_sve2_saddl_d,
+};
+TRANS_FEAT(SADDLB, aa64_sve2, gen_gvec_ool_arg_zzz,
+           saddl_fns[a->esz], a, 0)
+TRANS_FEAT(SADDLT, aa64_sve2, gen_gvec_ool_arg_zzz,
+           saddl_fns[a->esz], a, 3)
+TRANS_FEAT(SADDLBT, aa64_sve2, gen_gvec_ool_arg_zzz,
+           saddl_fns[a->esz], a, 2)
 
-#define DO_SVE2_ZZZ_TB(NAME, name, SEL1, SEL2) \
-static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)               \
-{                                                                       \
-    static gen_helper_gvec_3 * const fns[4] = {                         \
-        NULL,                       gen_helper_sve2_##name##_h,         \
-        gen_helper_sve2_##name##_s, gen_helper_sve2_##name##_d,         \
-    };                                                                  \
-    return do_sve2_zzw_ool(s, a, fns[a->esz], (SEL2 << 1) | SEL1);      \
-}
+static gen_helper_gvec_3 * const ssubl_fns[4] = {
+    NULL,                    gen_helper_sve2_ssubl_h,
+    gen_helper_sve2_ssubl_s, gen_helper_sve2_ssubl_d,
+};
+TRANS_FEAT(SSUBLB, aa64_sve2, gen_gvec_ool_arg_zzz,
+           ssubl_fns[a->esz], a, 0)
+TRANS_FEAT(SSUBLT, aa64_sve2, gen_gvec_ool_arg_zzz,
+           ssubl_fns[a->esz], a, 3)
+TRANS_FEAT(SSUBLBT, aa64_sve2, gen_gvec_ool_arg_zzz,
+           ssubl_fns[a->esz], a, 2)
+TRANS_FEAT(SSUBLTB, aa64_sve2, gen_gvec_ool_arg_zzz,
+           ssubl_fns[a->esz], a, 1)
 
-DO_SVE2_ZZZ_TB(SADDLB, saddl, false, false)
-DO_SVE2_ZZZ_TB(SSUBLB, ssubl, false, false)
-DO_SVE2_ZZZ_TB(SABDLB, sabdl, false, false)
+static gen_helper_gvec_3 * const sabdl_fns[4] = {
+    NULL,                    gen_helper_sve2_sabdl_h,
+    gen_helper_sve2_sabdl_s, gen_helper_sve2_sabdl_d,
+};
+TRANS_FEAT(SABDLB, aa64_sve2, gen_gvec_ool_arg_zzz,
+           sabdl_fns[a->esz], a, 0)
+TRANS_FEAT(SABDLT, aa64_sve2, gen_gvec_ool_arg_zzz,
+           sabdl_fns[a->esz], a, 3)
 
-DO_SVE2_ZZZ_TB(UADDLB, uaddl, false, false)
-DO_SVE2_ZZZ_TB(USUBLB, usubl, false, false)
-DO_SVE2_ZZZ_TB(UABDLB, uabdl, false, false)
+static gen_helper_gvec_3 * const uaddl_fns[4] = {
+    NULL,                    gen_helper_sve2_uaddl_h,
+    gen_helper_sve2_uaddl_s, gen_helper_sve2_uaddl_d,
+};
+TRANS_FEAT(UADDLB, aa64_sve2, gen_gvec_ool_arg_zzz,
+           uaddl_fns[a->esz], a, 0)
+TRANS_FEAT(UADDLT, aa64_sve2, gen_gvec_ool_arg_zzz,
+           uaddl_fns[a->esz], a, 3)
 
-DO_SVE2_ZZZ_TB(SADDLT, saddl, true, true)
-DO_SVE2_ZZZ_TB(SSUBLT, ssubl, true, true)
-DO_SVE2_ZZZ_TB(SABDLT, sabdl, true, true)
+static gen_helper_gvec_3 * const usubl_fns[4] = {
+    NULL,                    gen_helper_sve2_usubl_h,
+    gen_helper_sve2_usubl_s, gen_helper_sve2_usubl_d,
+};
+TRANS_FEAT(USUBLB, aa64_sve2, gen_gvec_ool_arg_zzz,
+           usubl_fns[a->esz], a, 0)
+TRANS_FEAT(USUBLT, aa64_sve2, gen_gvec_ool_arg_zzz,
+           usubl_fns[a->esz], a, 3)
 
-DO_SVE2_ZZZ_TB(UADDLT, uaddl, true, true)
-DO_SVE2_ZZZ_TB(USUBLT, usubl, true, true)
-DO_SVE2_ZZZ_TB(UABDLT, uabdl, true, true)
+static gen_helper_gvec_3 * const uabdl_fns[4] = {
+    NULL,                    gen_helper_sve2_uabdl_h,
+    gen_helper_sve2_uabdl_s, gen_helper_sve2_uabdl_d,
+};
+TRANS_FEAT(UABDLB, aa64_sve2, gen_gvec_ool_arg_zzz,
+           uabdl_fns[a->esz], a, 0)
+TRANS_FEAT(UABDLT, aa64_sve2, gen_gvec_ool_arg_zzz,
+           uabdl_fns[a->esz], a, 3)
 
-DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
-DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
-DO_SVE2_ZZZ_TB(SSUBLTB, ssubl, true, false)
+static gen_helper_gvec_3 * const sqdmull_fns[4] = {
+    NULL,                          gen_helper_sve2_sqdmull_zzz_h,
+    gen_helper_sve2_sqdmull_zzz_s, gen_helper_sve2_sqdmull_zzz_d,
+};
+TRANS_FEAT(SQDMULLB_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
+           sqdmull_fns[a->esz], a, 0)
+TRANS_FEAT(SQDMULLT_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
+           sqdmull_fns[a->esz], a, 3)
 
-DO_SVE2_ZZZ_TB(SQDMULLB_zzz, sqdmull_zzz, false, false)
-DO_SVE2_ZZZ_TB(SQDMULLT_zzz, sqdmull_zzz, true, true)
+static gen_helper_gvec_3 * const smull_fns[4] = {
+    NULL,                        gen_helper_sve2_smull_zzz_h,
+    gen_helper_sve2_smull_zzz_s, gen_helper_sve2_smull_zzz_d,
+};
+TRANS_FEAT(SMULLB_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
+           smull_fns[a->esz], a, 0)
+TRANS_FEAT(SMULLT_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
+           smull_fns[a->esz], a, 3)
 
-DO_SVE2_ZZZ_TB(SMULLB_zzz, smull_zzz, false, false)
-DO_SVE2_ZZZ_TB(SMULLT_zzz, smull_zzz, true, true)
+static gen_helper_gvec_3 * const umull_fns[4] = {
+    NULL,                        gen_helper_sve2_umull_zzz_h,
+    gen_helper_sve2_umull_zzz_s, gen_helper_sve2_umull_zzz_d,
+};
+TRANS_FEAT(UMULLB_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
+           umull_fns[a->esz], a, 0)
+TRANS_FEAT(UMULLT_zzz, aa64_sve2, gen_gvec_ool_arg_zzz,
+           umull_fns[a->esz], a, 3)
 
-DO_SVE2_ZZZ_TB(UMULLB_zzz, umull_zzz, false, false)
-DO_SVE2_ZZZ_TB(UMULLT_zzz, umull_zzz, true, true)
-
-static bool do_eor_tb(DisasContext *s, arg_rrr_esz *a, bool sel1)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_eoril_b, gen_helper_sve2_eoril_h,
-        gen_helper_sve2_eoril_s, gen_helper_sve2_eoril_d,
-    };
-    return do_sve2_zzw_ool(s, a, fns[a->esz], (!sel1 << 1) | sel1);
-}
-
-static bool trans_EORBT(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_eor_tb(s, a, false);
-}
-
-static bool trans_EORTB(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_eor_tb(s, a, true);
-}
+static gen_helper_gvec_3 * const eoril_fns[4] = {
+    gen_helper_sve2_eoril_b, gen_helper_sve2_eoril_h,
+    gen_helper_sve2_eoril_s, gen_helper_sve2_eoril_d,
+};
+TRANS_FEAT(EORBT, aa64_sve2, gen_gvec_ool_arg_zzz, eoril_fns[a->esz], a, 2)
+TRANS_FEAT(EORTB, aa64_sve2, gen_gvec_ool_arg_zzz, eoril_fns[a->esz], a, 1)
 
 static bool do_trans_pmull(DisasContext *s, arg_rrr_esz *a, bool sel)
 {
@@ -6794,38 +6814,39 @@ static bool do_trans_pmull(DisasContext *s, arg_rrr_esz *a, bool sel)
     if (a->esz == 0 && !dc_isar_feature(aa64_sve2_pmull128, s)) {
         return false;
     }
-    return do_sve2_zzw_ool(s, a, fns[a->esz], sel);
+    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, sel);
 }
 
-static bool trans_PMULLB(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_trans_pmull(s, a, false);
-}
+TRANS_FEAT(PMULLB, aa64_sve2, do_trans_pmull, a, false)
+TRANS_FEAT(PMULLT, aa64_sve2, do_trans_pmull, a, true)
 
-static bool trans_PMULLT(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_trans_pmull(s, a, true);
-}
+static gen_helper_gvec_3 * const saddw_fns[4] = {
+    NULL,                    gen_helper_sve2_saddw_h,
+    gen_helper_sve2_saddw_s, gen_helper_sve2_saddw_d,
+};
+TRANS_FEAT(SADDWB, aa64_sve2, gen_gvec_ool_arg_zzz, saddw_fns[a->esz], a, 0)
+TRANS_FEAT(SADDWT, aa64_sve2, gen_gvec_ool_arg_zzz, saddw_fns[a->esz], a, 1)
 
-#define DO_SVE2_ZZZ_WTB(NAME, name, SEL2) \
-static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)       \
-{                                                               \
-    static gen_helper_gvec_3 * const fns[4] = {                 \
-        NULL,                       gen_helper_sve2_##name##_h, \
-        gen_helper_sve2_##name##_s, gen_helper_sve2_##name##_d, \
-    };                                                          \
-    return do_sve2_zzw_ool(s, a, fns[a->esz], SEL2);            \
-}
+static gen_helper_gvec_3 * const ssubw_fns[4] = {
+    NULL,                    gen_helper_sve2_ssubw_h,
+    gen_helper_sve2_ssubw_s, gen_helper_sve2_ssubw_d,
+};
+TRANS_FEAT(SSUBWB, aa64_sve2, gen_gvec_ool_arg_zzz, ssubw_fns[a->esz], a, 0)
+TRANS_FEAT(SSUBWT, aa64_sve2, gen_gvec_ool_arg_zzz, ssubw_fns[a->esz], a, 1)
 
-DO_SVE2_ZZZ_WTB(SADDWB, saddw, false)
-DO_SVE2_ZZZ_WTB(SADDWT, saddw, true)
-DO_SVE2_ZZZ_WTB(SSUBWB, ssubw, false)
-DO_SVE2_ZZZ_WTB(SSUBWT, ssubw, true)
+static gen_helper_gvec_3 * const uaddw_fns[4] = {
+    NULL,                    gen_helper_sve2_uaddw_h,
+    gen_helper_sve2_uaddw_s, gen_helper_sve2_uaddw_d,
+};
+TRANS_FEAT(UADDWB, aa64_sve2, gen_gvec_ool_arg_zzz, uaddw_fns[a->esz], a, 0)
+TRANS_FEAT(UADDWT, aa64_sve2, gen_gvec_ool_arg_zzz, uaddw_fns[a->esz], a, 1)
 
-DO_SVE2_ZZZ_WTB(UADDWB, uaddw, false)
-DO_SVE2_ZZZ_WTB(UADDWT, uaddw, true)
-DO_SVE2_ZZZ_WTB(USUBWB, usubw, false)
-DO_SVE2_ZZZ_WTB(USUBWT, usubw, true)
+static gen_helper_gvec_3 * const usubw_fns[4] = {
+    NULL,                    gen_helper_sve2_usubw_h,
+    gen_helper_sve2_usubw_s, gen_helper_sve2_usubw_d,
+};
+TRANS_FEAT(USUBWB, aa64_sve2, gen_gvec_ool_arg_zzz, usubw_fns[a->esz], a, 0)
+TRANS_FEAT(USUBWT, aa64_sve2, gen_gvec_ool_arg_zzz, usubw_fns[a->esz], a, 1)
 
 static void gen_sshll_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t imm)
 {
@@ -6986,72 +7007,44 @@ static bool trans_USHLLT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_shll_tb(s, a, true, true);
 }
 
-static bool trans_BEXT(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_bext_b, gen_helper_sve2_bext_h,
-        gen_helper_sve2_bext_s, gen_helper_sve2_bext_d,
-    };
-    if (!dc_isar_feature(aa64_sve2_bitperm, s)) {
-        return false;
-    }
-    return do_sve2_zzw_ool(s, a, fns[a->esz], 0);
-}
+static gen_helper_gvec_3 * const bext_fns[4] = {
+    gen_helper_sve2_bext_b, gen_helper_sve2_bext_h,
+    gen_helper_sve2_bext_s, gen_helper_sve2_bext_d,
+};
+TRANS_FEAT(BEXT, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
+           bext_fns[a->esz], a, 0)
 
-static bool trans_BDEP(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_bdep_b, gen_helper_sve2_bdep_h,
-        gen_helper_sve2_bdep_s, gen_helper_sve2_bdep_d,
-    };
-    if (!dc_isar_feature(aa64_sve2_bitperm, s)) {
-        return false;
-    }
-    return do_sve2_zzw_ool(s, a, fns[a->esz], 0);
-}
+static gen_helper_gvec_3 * const bdep_fns[4] = {
+    gen_helper_sve2_bdep_b, gen_helper_sve2_bdep_h,
+    gen_helper_sve2_bdep_s, gen_helper_sve2_bdep_d,
+};
+TRANS_FEAT(BDEP, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
+           bdep_fns[a->esz], a, 0)
 
-static bool trans_BGRP(DisasContext *s, arg_rrr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_bgrp_b, gen_helper_sve2_bgrp_h,
-        gen_helper_sve2_bgrp_s, gen_helper_sve2_bgrp_d,
-    };
-    if (!dc_isar_feature(aa64_sve2_bitperm, s)) {
-        return false;
-    }
-    return do_sve2_zzw_ool(s, a, fns[a->esz], 0);
-}
+static gen_helper_gvec_3 * const bgrp_fns[4] = {
+    gen_helper_sve2_bgrp_b, gen_helper_sve2_bgrp_h,
+    gen_helper_sve2_bgrp_s, gen_helper_sve2_bgrp_d,
+};
+TRANS_FEAT(BGRP, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
+           bgrp_fns[a->esz], a, 0)
 
-static bool do_cadd(DisasContext *s, arg_rrr_esz *a, bool sq, bool rot)
-{
-    static gen_helper_gvec_3 * const fns[2][4] = {
-        { gen_helper_sve2_cadd_b, gen_helper_sve2_cadd_h,
-          gen_helper_sve2_cadd_s, gen_helper_sve2_cadd_d },
-        { gen_helper_sve2_sqcadd_b, gen_helper_sve2_sqcadd_h,
-          gen_helper_sve2_sqcadd_s, gen_helper_sve2_sqcadd_d },
-    };
-    return do_sve2_zzw_ool(s, a, fns[sq][a->esz], rot);
-}
+static gen_helper_gvec_3 * const cadd_fns[4] = {
+    gen_helper_sve2_cadd_b, gen_helper_sve2_cadd_h,
+    gen_helper_sve2_cadd_s, gen_helper_sve2_cadd_d,
+};
+TRANS_FEAT(CADD_rot90, aa64_sve2, gen_gvec_ool_arg_zzz,
+           cadd_fns[a->esz], a, 0)
+TRANS_FEAT(CADD_rot270, aa64_sve2, gen_gvec_ool_arg_zzz,
+           cadd_fns[a->esz], a, 1)
 
-static bool trans_CADD_rot90(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_cadd(s, a, false, false);
-}
-
-static bool trans_CADD_rot270(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_cadd(s, a, false, true);
-}
-
-static bool trans_SQCADD_rot90(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_cadd(s, a, true, false);
-}
-
-static bool trans_SQCADD_rot270(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_cadd(s, a, true, true);
-}
+static gen_helper_gvec_3 * const sqcadd_fns[4] = {
+    gen_helper_sve2_sqcadd_b, gen_helper_sve2_sqcadd_h,
+    gen_helper_sve2_sqcadd_s, gen_helper_sve2_sqcadd_d,
+};
+TRANS_FEAT(SQCADD_rot90, aa64_sve2, gen_gvec_ool_arg_zzz,
+           sqcadd_fns[a->esz], a, 0)
+TRANS_FEAT(SQCADD_rot270, aa64_sve2, gen_gvec_ool_arg_zzz,
+           sqcadd_fns[a->esz], a, 1)
 
 static gen_helper_gvec_4 * const sabal_fns[4] = {
     NULL,                    gen_helper_sve2_sabal_h,
-- 
2.25.1


