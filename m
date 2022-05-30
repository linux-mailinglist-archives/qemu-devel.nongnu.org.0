Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3142E53871F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:12:35 +0200 (CEST)
Received: from localhost ([::1]:57212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjsY-0007Rv-Ah
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwe-0004AE-Nu
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:40 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwb-0007MM-TW
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:40 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u3so15272110wrg.3
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=y6320XCgMwJY1zG7cLEXVifisYCoFNkKfucLWd4W1X4=;
 b=VhBexR0V7LBIHP3xP7EZixnRRZwfVxpXnTf8E9xrBkOPT6PWPSxcA+Ldw6L7eoOGeL
 3LqtW2KCIi6sRR3OCkr9E1QEkUtAr3DdLNnggVuKOdMfLPp4knmO+Z63X0VBgnbqBrdt
 9IqNosCrCbFyaGDxC+TgSNSSb1VkyOB9wTE3TfGRB8dAYcpwqNW52Z1nVVh0J1FXpC1i
 0QIsws8X3tKX0WUQ5M58h9wVWsCq62MsZBuCoIAdY7u0OQao9ULRKPHAuEWIlunBXUd6
 LsmbDYAk+RrOcdHl0Zq4gcm+JkhfpRy4EdKev2+/aVHvmL359CdORo/qnJx+JbkGpqgd
 baxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y6320XCgMwJY1zG7cLEXVifisYCoFNkKfucLWd4W1X4=;
 b=IhomIwM4m+cp4O8FVDRQzQZXHEcx45eAmycQb67s3u7YZOpJw0FFNkhFKrmd/8PMxI
 EzMFjyn23XoW9s9rdqp/nRFLP5O1T58PYeaj7pGO1AluvT2GzkuGRgQtv2KH39gpWjEf
 sTwzV5biZnVR0vGI0GrGhGo64PSr4vudquitBuUwOZoCCsuG+1OA7kOhQnu01ykJEu4K
 Da1wyKhY4OMU8a2gkR8PjCL4Ee0tgypWF0V8ygHGqk2fNGr3l3W1Y0/0fXNaetpzIu45
 A5uUWTVK8/yXCsojItOxCxWGzhk43xFE4Ww0hCRSUIhhQyes5Tdwj4aBzPvuvV9hUOyX
 3+mw==
X-Gm-Message-State: AOAM530kjiXodxRLP5GEllboEDo5Rh4S6TNtaQsL/KICJTpH2gW/1kTk
 y07O4PIGhyYgb2qmuuF+lMgYfu5nR7typQ==
X-Google-Smtp-Source: ABdhPJzlVMMoxlYMvj7mhaTErn5IpO0NYKjhT7SrmNxoMP0CXkk019mr/xABevwJBZlBQYXBmR+oeg==
X-Received: by 2002:a5d:52c7:0:b0:210:ac6:3956 with SMTP id
 r7-20020a5d52c7000000b002100ac63956mr18447365wrv.379.1653926916967; 
 Mon, 30 May 2022 09:08:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 097/117] target/arm: Move null function and sve check into
 do_frint_mode
Date: Mon, 30 May 2022 17:06:48 +0100
Message-Id: <20220530160708.726466-98-peter.maydell@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-95-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 52 +++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2a5fbec2d6d..43cfd2818ea 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4140,62 +4140,56 @@ TRANS_FEAT(FRINTX, aa64_sve, gen_gvec_fpst_arg_zpz, frintx_fns[a->esz],
 static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
                           int mode, gen_helper_gvec_3_ptr *fn)
 {
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_i32 tmode = tcg_const_i32(mode);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+    unsigned vsz;
+    TCGv_i32 tmode;
+    TCGv_ptr status;
 
-        gen_helper_set_rmode(tmode, tmode, status);
-
-        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           pred_full_reg_offset(s, a->pg),
-                           status, vsz, vsz, 0, fn);
-
-        gen_helper_set_rmode(tmode, tmode, status);
-        tcg_temp_free_i32(tmode);
-        tcg_temp_free_ptr(status);
+    if (fn == NULL) {
+        return false;
     }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    vsz = vec_full_reg_size(s);
+    tmode = tcg_const_i32(mode);
+    status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+
+    gen_helper_set_rmode(tmode, tmode, status);
+
+    tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       pred_full_reg_offset(s, a->pg),
+                       status, vsz, vsz, 0, fn);
+
+    gen_helper_set_rmode(tmode, tmode, status);
+    tcg_temp_free_i32(tmode);
+    tcg_temp_free_ptr(status);
     return true;
 }
 
 static bool trans_FRINTN(DisasContext *s, arg_rpr_esz *a)
 {
-    if (a->esz == 0) {
-        return false;
-    }
     return do_frint_mode(s, a, float_round_nearest_even, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTP(DisasContext *s, arg_rpr_esz *a)
 {
-    if (a->esz == 0) {
-        return false;
-    }
     return do_frint_mode(s, a, float_round_up, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTM(DisasContext *s, arg_rpr_esz *a)
 {
-    if (a->esz == 0) {
-        return false;
-    }
     return do_frint_mode(s, a, float_round_down, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTZ(DisasContext *s, arg_rpr_esz *a)
 {
-    if (a->esz == 0) {
-        return false;
-    }
     return do_frint_mode(s, a, float_round_to_zero, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a)
 {
-    if (a->esz == 0) {
-        return false;
-    }
     return do_frint_mode(s, a, float_round_ties_away, frint_fns[a->esz]);
 }
 
-- 
2.25.1


