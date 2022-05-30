Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AACD65386D5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:36:45 +0200 (CEST)
Received: from localhost ([::1]:46922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjJs-0002OI-Pa
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwd-000471-Bi
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:39 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwa-0007BN-6V
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:38 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t6so15296903wra.4
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vWEUha9/FpKpSr3NefwhwgbQhO/TxyF64NaiHMcRV/8=;
 b=yb4Bv/dlKWnyY7D7BKfEWa7juAHDZRobNxEiSledeopptxBbxbpQuLvJN0QGH3eyAG
 ieShrBeFYb4D6aBMssWoxOun4FDwBTq8r++oSvrOp9KTOYpvLOnrnXZWTglG9mFTsUr9
 tpLbeht21m+bWBRKnbXdj9MPd4PiJrCjoQGegk66TXJvCoQG2e5+AWIgfELKy30xCl42
 NI+QGHmDlfqLmt83MKiVxSLOxi5CA9Sx88X/IM+nStay/DpK6jpGgM/ZAxV2G1mKnRhe
 THcOjUb/dnQIkgY0Z66nbWutVLxrGkxMlno7gaZTYlXEChoaa9RGCZNNPAnXxm6l1PQG
 Zuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vWEUha9/FpKpSr3NefwhwgbQhO/TxyF64NaiHMcRV/8=;
 b=xcAHhijRCRH/RPG0QwxuFWxYSqtSSNpxizU/RyDNIpKh3zycLGoKxsL4by1V5YxxTM
 DwSggca2gpfALGoDawGZwuZXJCW8fHBf9z1kej6/27FBpMuHPDcOVs1RueSiV8XmRPSo
 KCa13oPclHdw+rgBmJIe6Vwy9jBGLhXx6fbFxx2BG95jPuZZdNpaaBQ74lARVjyNb7DN
 0uD226GK8de1gth1jDLyorYzX0LVytHO2tUplFa0t9qXU0nyumfeS4WF/jV2kbMNcAmD
 S3njOtaXQOH3OJCP68oYrwuIDzgYTUwFCjcljfYErziAcFBxyLNknN5/8KYufLT+dyEY
 B/Hw==
X-Gm-Message-State: AOAM533JLucboiuqXIapjzs1sDWCOHUoFfm/TWjS2qr1h69zWB2e71N2
 h9fnF3nzQR/NUPFfGcwQCUl3BkItUDJrTg==
X-Google-Smtp-Source: ABdhPJw0190g/kyqIOeU2YYXAFwW7Qkyh5XsYBLWR0tVQjG8LmxmHTj2IKXI1DrI1DK4Wzfh1ji1Rg==
X-Received: by 2002:a5d:47a1:0:b0:20f:ecc4:7f6c with SMTP id
 1-20020a5d47a1000000b0020fecc47f6cmr28374000wrb.236.1653926912235; 
 Mon, 30 May 2022 09:08:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 091/117] target/arm: Use TRANS_FEAT for FTMAD
Date: Mon, 30 May 2022 17:06:42 +0100
Message-Id: <20220530160708.726466-92-peter.maydell@linaro.org>
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
Message-id: 20220527181907.189259-89-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 29fcc8b0141..11e4b4e1e4a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3715,28 +3715,13 @@ DO_PPZ(FCMNE_ppz0, fcmne0)
  *** SVE floating-point trig multiply-add coefficient
  */
 
-static bool trans_FTMAD(DisasContext *s, arg_FTMAD *a)
-{
-    static gen_helper_gvec_3_ptr * const fns[3] = {
-        gen_helper_sve_ftmad_h,
-        gen_helper_sve_ftmad_s,
-        gen_helper_sve_ftmad_d,
-    };
-
-    if (a->esz == 0) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           status, vsz, vsz, a->imm, fns[a->esz - 1]);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
-}
+static gen_helper_gvec_3_ptr * const ftmad_fns[4] = {
+    NULL,                   gen_helper_sve_ftmad_h,
+    gen_helper_sve_ftmad_s, gen_helper_sve_ftmad_d,
+};
+TRANS_FEAT(FTMAD, aa64_sve, gen_gvec_fpst_zzz,
+           ftmad_fns[a->esz], a->rd, a->rn, a->rm, a->imm,
+           a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
 /*
  *** SVE Floating Point Accumulating Reduction Group
-- 
2.25.1


