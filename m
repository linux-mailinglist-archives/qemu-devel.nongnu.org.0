Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF74538667
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:54:40 +0200 (CEST)
Received: from localhost ([::1]:51814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvif9-000335-M8
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvd-0003C5-Ow
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:37 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:41903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvb-0007GW-Ra
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:37 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 p5-20020a1c2905000000b003970dd5404dso6724791wmp.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PCVJ1qTePM05IdkOS/bZ+gSR8RJ0xbTrczq1XWSujRA=;
 b=WBpsiFlNbS5Kq8d/IUwDxtuD5B8X6vpW5rGpWZOjVjZh8scLSxtr6ex5t+3CY1K+JN
 He5L4vUpibDfWlyiyqEAykY7k2gyFArAqclPeALMAJ3fnEHOMP0OT8k7keHMNVzUi8SU
 ZRbjPTfSSY8dtjZVapb53ltYIfwHFF1GEFuSIZ26eeqh1EinmxWqV1dslUj76z0BVfTL
 5EdfwdI66TjkCjd5DUQ8cY5iF1KhONXfhUVMIVqhwbTorMMWk5pHm3Ku1OI5ylXDULNa
 zpTAFzysiVCccax1KyRALGEDeEDVsudZIVNyWz7JrfKNfARZVY3jKh4HTh5abuIZgV6y
 8F6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PCVJ1qTePM05IdkOS/bZ+gSR8RJ0xbTrczq1XWSujRA=;
 b=EkN9T3JQU6JihTHnQ1iHlIh/kBAigSHseBjxIfT19CyvtD8MZwXerX2aknzBc+ympG
 JDew7hrtyyKbe5HnvVMBPiSZRp2HJAWT305mdmADokXonADymis0zn6lilivId1fZx3j
 DU+tkyAHBaQOP0lPhStqbYaP+BRGKwKkOA8jKfLrmbu0dEc5rPP5rkg2zn8B1PeVtkSC
 aVmtNWwPU+nDiKyNgPtfg61TapiRXO/S7zTvomXjKEy7Xh5uBPeMTlx727GB5hTruddJ
 mOoKuE2eKGUBWvhquSw9PMctFkzg1zfHtW4eQZsLrICLs0F8roAfGm+8NJibPuoD+r6B
 /wdQ==
X-Gm-Message-State: AOAM532JLwuJPnB04afBqHtMkSsTvHKcUl4U4CJowT9m/jFn+8Zlivom
 ay5rIQiiwjoYOvtb0Qd3Ym4ruVwccE6hsw==
X-Google-Smtp-Source: ABdhPJxzVee9RXnwn9rQ1Dkz1U1BsiBgHzlvLslZfIxoX6MfxDHIqjpn83PA3ouQ85fxRZKqlaZWDw==
X-Received: by 2002:a05:600c:209:b0:397:4a0f:7 with SMTP id
 9-20020a05600c020900b003974a0f0007mr19439757wmi.91.1653926854301; 
 Mon, 30 May 2022 09:07:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 030/117] target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zpzz
Date: Mon, 30 May 2022 17:05:41 +0100
Message-Id: <20220530160708.726466-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Convert SVE translation functions directly using
gen_gvec_ool_arg_zpzz to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-28-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 85 ++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 49 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d63099c5b7b..f8277eeb7c0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -755,54 +755,46 @@ static void do_sel_z(DisasContext *s, int rd, int rn, int rm, int pg, int esz)
     gen_gvec_ool_zzzp(s, fns[esz], rd, rn, rm, pg, 0);
 }
 
-#define DO_ZPZZ(NAME, name) \
-static bool trans_##NAME##_zpzz(DisasContext *s, arg_rprr_esz *a)         \
-{                                                                         \
-    static gen_helper_gvec_4 * const fns[4] = {                           \
-        gen_helper_sve_##name##_zpzz_b, gen_helper_sve_##name##_zpzz_h,   \
-        gen_helper_sve_##name##_zpzz_s, gen_helper_sve_##name##_zpzz_d,   \
+#define DO_ZPZZ(NAME, FEAT, name) \
+    static gen_helper_gvec_4 * const name##_zpzz_fns[4] = {               \
+        gen_helper_##name##_zpzz_b, gen_helper_##name##_zpzz_h,           \
+        gen_helper_##name##_zpzz_s, gen_helper_##name##_zpzz_d,           \
     };                                                                    \
-    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);                   \
-}
+    TRANS_FEAT(NAME, FEAT, gen_gvec_ool_arg_zpzz,                         \
+               name##_zpzz_fns[a->esz], a, 0)
 
-DO_ZPZZ(AND, and)
-DO_ZPZZ(EOR, eor)
-DO_ZPZZ(ORR, orr)
-DO_ZPZZ(BIC, bic)
+DO_ZPZZ(AND_zpzz, aa64_sve, sve_and)
+DO_ZPZZ(EOR_zpzz, aa64_sve, sve_eor)
+DO_ZPZZ(ORR_zpzz, aa64_sve, sve_orr)
+DO_ZPZZ(BIC_zpzz, aa64_sve, sve_bic)
 
-DO_ZPZZ(ADD, add)
-DO_ZPZZ(SUB, sub)
+DO_ZPZZ(ADD_zpzz, aa64_sve, sve_add)
+DO_ZPZZ(SUB_zpzz, aa64_sve, sve_sub)
 
-DO_ZPZZ(SMAX, smax)
-DO_ZPZZ(UMAX, umax)
-DO_ZPZZ(SMIN, smin)
-DO_ZPZZ(UMIN, umin)
-DO_ZPZZ(SABD, sabd)
-DO_ZPZZ(UABD, uabd)
+DO_ZPZZ(SMAX_zpzz, aa64_sve, sve_smax)
+DO_ZPZZ(UMAX_zpzz, aa64_sve, sve_umax)
+DO_ZPZZ(SMIN_zpzz, aa64_sve, sve_smin)
+DO_ZPZZ(UMIN_zpzz, aa64_sve, sve_umin)
+DO_ZPZZ(SABD_zpzz, aa64_sve, sve_sabd)
+DO_ZPZZ(UABD_zpzz, aa64_sve, sve_uabd)
 
-DO_ZPZZ(MUL, mul)
-DO_ZPZZ(SMULH, smulh)
-DO_ZPZZ(UMULH, umulh)
+DO_ZPZZ(MUL_zpzz, aa64_sve, sve_mul)
+DO_ZPZZ(SMULH_zpzz, aa64_sve, sve_smulh)
+DO_ZPZZ(UMULH_zpzz, aa64_sve, sve_umulh)
 
-DO_ZPZZ(ASR, asr)
-DO_ZPZZ(LSR, lsr)
-DO_ZPZZ(LSL, lsl)
+DO_ZPZZ(ASR_zpzz, aa64_sve, sve_asr)
+DO_ZPZZ(LSR_zpzz, aa64_sve, sve_lsr)
+DO_ZPZZ(LSL_zpzz, aa64_sve, sve_lsl)
 
-static bool trans_SDIV_zpzz(DisasContext *s, arg_rprr_esz *a)
-{
-    static gen_helper_gvec_4 * const fns[4] = {
-        NULL, NULL, gen_helper_sve_sdiv_zpzz_s, gen_helper_sve_sdiv_zpzz_d
-    };
-    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_4 * const sdiv_fns[4] = {
+    NULL, NULL, gen_helper_sve_sdiv_zpzz_s, gen_helper_sve_sdiv_zpzz_d
+};
+TRANS_FEAT(SDIV_zpzz, aa64_sve, gen_gvec_ool_arg_zpzz, sdiv_fns[a->esz], a, 0)
 
-static bool trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a)
-{
-    static gen_helper_gvec_4 * const fns[4] = {
-        NULL, NULL, gen_helper_sve_udiv_zpzz_s, gen_helper_sve_udiv_zpzz_d
-    };
-    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);
-}
+static gen_helper_gvec_4 * const udiv_fns[4] = {
+    NULL, NULL, gen_helper_sve_udiv_zpzz_s, gen_helper_sve_udiv_zpzz_d
+};
+TRANS_FEAT(UDIV_zpzz, aa64_sve, gen_gvec_ool_arg_zpzz, udiv_fns[a->esz], a, 0)
 
 static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a)
 {
@@ -1068,17 +1060,12 @@ TRANS_FEAT(SQSHLU, aa64_sve2, gen_gvec_ool_arg_zpzi,
  */
 
 #define DO_ZPZW(NAME, name) \
-static bool trans_##NAME##_zpzw(DisasContext *s, arg_rprr_esz *a)         \
-{                                                                         \
-    static gen_helper_gvec_4 * const fns[3] = {                           \
+    static gen_helper_gvec_4 * const name##_zpzw_fns[4] = {               \
         gen_helper_sve_##name##_zpzw_b, gen_helper_sve_##name##_zpzw_h,   \
-        gen_helper_sve_##name##_zpzw_s,                                   \
+        gen_helper_sve_##name##_zpzw_s, NULL                              \
     };                                                                    \
-    if (a->esz < 0 || a->esz >= 3) {                                      \
-        return false;                                                     \
-    }                                                                     \
-    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);                   \
-}
+    TRANS_FEAT(NAME##_zpzw, aa64_sve, gen_gvec_ool_arg_zpzz,              \
+               a->esz < 0 ? NULL : name##_zpzw_fns[a->esz], a, 0)
 
 DO_ZPZW(ASR, asr)
 DO_ZPZW(LSR, lsr)
-- 
2.25.1


