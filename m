Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB890538635
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:38:55 +0200 (CEST)
Received: from localhost ([::1]:48462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviPv-000678-0G
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvb-00033o-7E
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:36 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvZ-0007Ft-FD
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:34 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x17so6211540wrg.6
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7uldykxv7S0T2FlbHU4wXyJpwce8lN2A/Vg/FiWs0Qc=;
 b=R+J2/1okI4P8LM0BVnvak3WB2DtlYa3zSs+KmdWYXoUolDZcgLg1jNmPtcAEvdtQAf
 nHPzsgTwOahpirdC7TvDTJQXS6xrh36fc5+DbD1wHcLI2tLym9vTKGLfENYrXT8+7oma
 cbg6I4AtPMfG57aDc1GYXb4ih/glIFLXyhWN9RK0Mw/eq7sMWyKb+dou7DC2hpao3s+k
 cHnSN1+3w6/XB5Ll3hWtFjzLyQ00zRtwdKTS6AeOFhfFjJGAu1jjdeK2oQxi9JoJoGzY
 ZbIkZ0MBhDXFwTI59aJrWkZhPPFAki66+9SGHTua7NbCV+lviPBJ15wlO0sVZs2OlEEq
 5Acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7uldykxv7S0T2FlbHU4wXyJpwce8lN2A/Vg/FiWs0Qc=;
 b=L4OJlI4+JljlqsMwOag3CXJnRA78IL428XJNldQxHIGP+u+V7Nl6v10AXX6viwYBUc
 DBawzdxy9/Z1Q7PtYS8fYdqpyUJOXCm2YKXufeSvfdvsFFnvcOalEkj1xhL3bRJgmTZ6
 jFPgOE8GbFglzzyG82uJPqirZuz6ti3+wpw+78PdEFTtQQSSP5f15c+S1vL9GpG8/Otr
 DZjNvkFcYUrOadRYpzUsTTvien/phCOWihuOMsjN1no/7+/XAOwMpmpRARdvRJhnGcYJ
 16cVtFfRl2avNn/p7NcEWa64uIRpNl/2xTpyK5g4lREQNlM6XuwE7xqUDmw/gOxItc8e
 q5Kw==
X-Gm-Message-State: AOAM532YywWBxe2hDhhEc20Me7Yr3Ij86rYRODSMwfQk+O8oq8YcR8CJ
 Fl9tsV15abGGVWEBx9jWCfWVe3BMTE86Qw==
X-Google-Smtp-Source: ABdhPJxdvlLtIQ0swMeNpx5zSZ7DSyJcuh+2QF3Lzo/WAvH6lJ0c3mqQQ2le7EervmwaNNAgPobIoQ==
X-Received: by 2002:adf:f68f:0:b0:210:2ef7:e801 with SMTP id
 v15-20020adff68f000000b002102ef7e801mr7010417wrp.318.1653926852039; 
 Mon, 30 May 2022 09:07:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 027/117] target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zpzi
Date: Mon, 30 May 2022 17:05:38 +0100
Message-Id: <20220530160708.726466-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

Convert some SVE translation functions using
gen_gvec_ool_arg_zpzi to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-25-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 85 ++++++++++++++------------------------
 1 file changed, 30 insertions(+), 55 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 86e87a20782..10614bf9151 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1027,65 +1027,40 @@ static bool trans_ASRD(DisasContext *s, arg_rpri_esz *a)
     }
 }
 
-static bool trans_SQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_sqshl_zpzi_b, gen_helper_sve2_sqshl_zpzi_h,
-        gen_helper_sve2_sqshl_zpzi_s, gen_helper_sve2_sqshl_zpzi_d,
-    };
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-}
+static gen_helper_gvec_3 * const sqshl_zpzi_fns[4] = {
+    gen_helper_sve2_sqshl_zpzi_b, gen_helper_sve2_sqshl_zpzi_h,
+    gen_helper_sve2_sqshl_zpzi_s, gen_helper_sve2_sqshl_zpzi_d,
+};
+TRANS_FEAT(SQSHL_zpzi, aa64_sve2, gen_gvec_ool_arg_zpzi,
+           a->esz < 0 ? NULL : sqshl_zpzi_fns[a->esz], a)
 
-static bool trans_UQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_uqshl_zpzi_b, gen_helper_sve2_uqshl_zpzi_h,
-        gen_helper_sve2_uqshl_zpzi_s, gen_helper_sve2_uqshl_zpzi_d,
-    };
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-}
+static gen_helper_gvec_3 * const uqshl_zpzi_fns[4] = {
+    gen_helper_sve2_uqshl_zpzi_b, gen_helper_sve2_uqshl_zpzi_h,
+    gen_helper_sve2_uqshl_zpzi_s, gen_helper_sve2_uqshl_zpzi_d,
+};
+TRANS_FEAT(UQSHL_zpzi, aa64_sve2, gen_gvec_ool_arg_zpzi,
+           a->esz < 0 ? NULL : uqshl_zpzi_fns[a->esz], a)
 
-static bool trans_SRSHR(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_srshr_b, gen_helper_sve2_srshr_h,
-        gen_helper_sve2_srshr_s, gen_helper_sve2_srshr_d,
-    };
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-}
+static gen_helper_gvec_3 * const srshr_fns[4] = {
+    gen_helper_sve2_srshr_b, gen_helper_sve2_srshr_h,
+    gen_helper_sve2_srshr_s, gen_helper_sve2_srshr_d,
+};
+TRANS_FEAT(SRSHR, aa64_sve2, gen_gvec_ool_arg_zpzi,
+           a->esz < 0 ? NULL : srshr_fns[a->esz], a)
 
-static bool trans_URSHR(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_urshr_b, gen_helper_sve2_urshr_h,
-        gen_helper_sve2_urshr_s, gen_helper_sve2_urshr_d,
-    };
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-}
+static gen_helper_gvec_3 * const urshr_fns[4] = {
+    gen_helper_sve2_urshr_b, gen_helper_sve2_urshr_h,
+    gen_helper_sve2_urshr_s, gen_helper_sve2_urshr_d,
+};
+TRANS_FEAT(URSHR, aa64_sve2, gen_gvec_ool_arg_zpzi,
+           a->esz < 0 ? NULL : urshr_fns[a->esz], a)
 
-static bool trans_SQSHLU(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_sqshlu_b, gen_helper_sve2_sqshlu_h,
-        gen_helper_sve2_sqshlu_s, gen_helper_sve2_sqshlu_d,
-    };
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-}
+static gen_helper_gvec_3 * const sqshlu_fns[4] = {
+    gen_helper_sve2_sqshlu_b, gen_helper_sve2_sqshlu_h,
+    gen_helper_sve2_sqshlu_s, gen_helper_sve2_sqshlu_d,
+};
+TRANS_FEAT(SQSHLU, aa64_sve2, gen_gvec_ool_arg_zpzi,
+           a->esz < 0 ? NULL : sqshlu_fns[a->esz], a)
 
 /*
  *** SVE Bitwise Shift - Predicated Group
-- 
2.25.1


