Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2B15386CC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:33:47 +0200 (CEST)
Received: from localhost ([::1]:38526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjH0-0004gd-FM
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwd-00046s-Ad
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:39 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwa-0007Hl-2j
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:38 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d26so9674574wrb.13
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=B+S5E6ge/+wsWYJ5Kej7wJNG7Uhv19vqV3imdXXvdmk=;
 b=uA3QkP8HXQZMkqYDVsiDNZdE9WiJiSpt8JMxIFPqFp3ZWxnnqQzyzeGftZ8W/Cdt5p
 zpLfNzdGzCSDuTIWE9kxMCLiqlz3910BuLF+kKqnP34/6naC8VkWqqoHZW1WnbCuwr04
 aC6zZ+BCJyO3VETwzD/XJKFY7WVn5yeojwSdh7+nf7f+vXW7xnH1TMbHR83sa5P1iAjB
 JKt1YbtbT8r0/qJpwdWsnQZnyL/6xQra3QlFG7jZ8qiJ4Wm4FhZ5VLrQNZaTzgCpsZVe
 XOsM6Dw2G7Fw81nbyX/rTFMAD514lHf1m2Xi9SlHhlGVDeM4sa4FOml3mzzNkIE42GRj
 KbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B+S5E6ge/+wsWYJ5Kej7wJNG7Uhv19vqV3imdXXvdmk=;
 b=5FchlGXn58LLpo+cxrNXRmZLzDjTmc+Ja88UFeXiKfaQkkjRpbZeO680B11Uo8sOaE
 YWNh+Q2iB99GJMIqxgOgNzIzDQVdLqHVyYNxo2msC4nuiO5rUDB6dFarzOnYGlWx+KJ6
 g2UZQnBwvkbyUPqS/A7ildxdwauDWYGkIP7FnKQmiQ05YKywhW2nunQxd03Yix7y+GOK
 crDkWo+GmSh+o/eBoc2D7ibsfMtCsHuKlVzfYX7jEuFUxaSpCNYWVpbSA3hkWF+cCM7X
 NbVIoZPEF/xNI7C0InNB/jPJB1YOIy9KsLBabO9AsX67GDfH0Wsooj+23YHhb5RUYLhW
 VFwg==
X-Gm-Message-State: AOAM533jNzcgDBqdx1xqA9S/USFtLpatxSgmylC1qVUmUx9BjxTbwk6U
 ongIp1T/qPPsaD9cKp63YhKX5L3NhUCjAg==
X-Google-Smtp-Source: ABdhPJzqNlVBsXopKZz5anPXPNjzMuoCHE6CtA4r39AqpsOdzsj+wN6xLyBaLJjSIJBxsNF6T47rwg==
X-Received: by 2002:a5d:58c2:0:b0:210:2baa:52b8 with SMTP id
 o2-20020a5d58c2000000b002102baa52b8mr8200007wrf.20.1653926914452; 
 Mon, 30 May 2022 09:08:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 094/117] target/arm: Use TRANS_FEAT for FRECPE, FRSQRTE
Date: Mon, 30 May 2022 17:06:45 +0100
Message-Id: <20220530160708.726466-95-peter.maydell@linaro.org>
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

Rename do_zz_fp to gen_gvec_fpst_arg_zz, and move up.
Split out gen_gvec_fpst_zz as a helper while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-92-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 77 ++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 41 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4a9ecd5e72d..2f7651249ad 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -152,6 +152,32 @@ static bool gen_gvec_ool_zz(DisasContext *s, gen_helper_gvec_2 *fn,
     return true;
 }
 
+static bool gen_gvec_fpst_zz(DisasContext *s, gen_helper_gvec_2_ptr *fn,
+                             int rd, int rn, int data,
+                             ARMFPStatusFlavour flavour)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = fpstatus_ptr(flavour);
+
+        tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           status, vsz, vsz, data, fn);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+static bool gen_gvec_fpst_arg_zz(DisasContext *s, gen_helper_gvec_2_ptr *fn,
+                                 arg_rr_esz *a, int data)
+{
+    return gen_gvec_fpst_zz(s, fn, a->rd, a->rn, data,
+                            a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+}
+
 /* Invoke an out-of-line helper on 3 Zregs. */
 static bool gen_gvec_ool_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int rm, int data)
@@ -3627,48 +3653,17 @@ DO_VPZ(FMAXV, fmaxv)
  *** SVE Floating Point Unary Operations - Unpredicated Group
  */
 
-static void do_zz_fp(DisasContext *s, arg_rr_esz *a, gen_helper_gvec_2_ptr *fn)
-{
-    unsigned vsz = vec_full_reg_size(s);
-    TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+static gen_helper_gvec_2_ptr * const frecpe_fns[] = {
+    NULL,                     gen_helper_gvec_frecpe_h,
+    gen_helper_gvec_frecpe_s, gen_helper_gvec_frecpe_d,
+};
+TRANS_FEAT(FRECPE, aa64_sve, gen_gvec_fpst_arg_zz, frecpe_fns[a->esz], a, 0)
 
-    tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, a->rd),
-                       vec_full_reg_offset(s, a->rn),
-                       status, vsz, vsz, 0, fn);
-    tcg_temp_free_ptr(status);
-}
-
-static bool trans_FRECPE(DisasContext *s, arg_rr_esz *a)
-{
-    static gen_helper_gvec_2_ptr * const fns[3] = {
-        gen_helper_gvec_frecpe_h,
-        gen_helper_gvec_frecpe_s,
-        gen_helper_gvec_frecpe_d,
-    };
-    if (a->esz == 0) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        do_zz_fp(s, a, fns[a->esz - 1]);
-    }
-    return true;
-}
-
-static bool trans_FRSQRTE(DisasContext *s, arg_rr_esz *a)
-{
-    static gen_helper_gvec_2_ptr * const fns[3] = {
-        gen_helper_gvec_frsqrte_h,
-        gen_helper_gvec_frsqrte_s,
-        gen_helper_gvec_frsqrte_d,
-    };
-    if (a->esz == 0) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        do_zz_fp(s, a, fns[a->esz - 1]);
-    }
-    return true;
-}
+static gen_helper_gvec_2_ptr * const frsqrte_fns[] = {
+    NULL,                      gen_helper_gvec_frsqrte_h,
+    gen_helper_gvec_frsqrte_s, gen_helper_gvec_frsqrte_d,
+};
+TRANS_FEAT(FRSQRTE, aa64_sve, gen_gvec_fpst_arg_zz, frsqrte_fns[a->esz], a, 0)
 
 /*
  *** SVE Floating Point Compare with Zero Group
-- 
2.25.1


