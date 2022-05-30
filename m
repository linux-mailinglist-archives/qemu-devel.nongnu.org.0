Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B935386A2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:14:49 +0200 (CEST)
Received: from localhost ([::1]:49624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviye-00073t-Ln
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvo-0003ZJ-Cb
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:48 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvm-0007J3-OB
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:48 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 h62-20020a1c2141000000b0039aa4d054e2so2622811wmh.1
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nnl0FxSy2lQGEXHLpuMztJtWf2ssR/52boz+nuGDoCs=;
 b=lT2G1r6HBVzWOJQ1iTIDjvzdeTS60VLGqZsple6WNWaf2Q1VduhrV2J/jDFrjMdJUF
 7nU9xDYLxLQ7mvZGO5gu9jN8n9Zgt5BPJ5RPMSJeCemsZ3Olm8/MRqP/Ov1NnPtvnETJ
 hN236fAjkAhjLh6ScZ6u4RumEECX/93ARl03wcbSJLtENcPSvZhQ9eJzfrJMuWa2Tli7
 nfr2sQx/FjHKNaGAzzN6nnDD+x52t7p8SC+rm4o55UQhD9703UYWt1HP76bYqACUJSOO
 dDd9FfRHedGwqBglcQuCwfdsY8n97DKzFu5frGbBBY9pu21uMOOhw4HOKy14Xsw2cF4F
 YO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nnl0FxSy2lQGEXHLpuMztJtWf2ssR/52boz+nuGDoCs=;
 b=A8XlPvreiq7Ydw0MQ9l6tVl4eSe/6olnDPR/lpnLdLHzcSZvY1nJ8NKATvg39eWuL8
 i4/B29jG41Bei+zx/8SZ93NcWTx3p6KZtjv79Uw+q7VB8PvEMmM1zHPoGEhhKRFonYvk
 Y98CNJTcqrmsrCM/IdLm8VaJhpwEI0EvbJPiND+QT52mtmCu9vzj7p9JlTZdb2v7MQvH
 n4ZfdR2zKkc6UZaukbOKsE7+HXi1qs+mrRWfRXLePi0ShcTXwReTAmkMXfPHRlTY5Jh2
 q3kBPtfuXMXA84I0eGZFHz/r000qafiBHEMCu13pKfVnelBwLIscQW9/Rc5YhWlUPuJW
 Ig2w==
X-Gm-Message-State: AOAM533Bo0jqnsw9pG+ZuOGmEyyulTyZmVn0g3trVF1cnKuiffdHuWIx
 12+wVHiCxB0s9A+L89X4iO4lnERUHnIO8Q==
X-Google-Smtp-Source: ABdhPJyRs5OVcO+U9v9ysCOMrT9ZPJ37DIxjxotO8TD4Vm/9G0F+kjcKnyLQIx0iCXGoVGWcVvbkow==
X-Received: by 2002:a05:600c:3510:b0:397:8454:991a with SMTP id
 h16-20020a05600c351000b003978454991amr17544203wmq.165.1653926865266; 
 Mon, 30 May 2022 09:07:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 044/117] target/arm: Introduce gen_gvec_fn_arg_zzi
Date: Mon, 30 May 2022 17:05:55 +0100
Message-Id: <20220530160708.726466-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

We have two places that perform this particular operation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-42-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 62bfc6fe7c4..7a3b5f137ac 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -273,6 +273,16 @@ static bool gen_gvec_fn_zzi(DisasContext *s, GVecGen2iFn *gvec_fn,
     return true;
 }
 
+static bool gen_gvec_fn_arg_zzi(DisasContext *s, GVecGen2iFn *gvec_fn,
+                                arg_rri_esz *a)
+{
+    if (a->esz < 0) {
+        /* Invalid tsz encoding -- see tszimm_esz. */
+        return false;
+    }
+    return gen_gvec_fn_zzi(s, gvec_fn, a->esz, a->rd, a->rn, a->imm);
+}
+
 /* Invoke a vector expander on three Zregs.  */
 static bool gen_gvec_fn_zzz(DisasContext *s, GVecGen3Fn *gvec_fn,
                             int esz, int rd, int rn, int rm)
@@ -3503,12 +3513,7 @@ static bool trans_ADD_zzi(DisasContext *s, arg_rri_esz *a)
     if (a->esz == 0 && extract32(s->insn, 13, 1)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_addi(a->esz, vec_full_reg_offset(s, a->rd),
-                          vec_full_reg_offset(s, a->rn), a->imm, vsz, vsz);
-    }
-    return true;
+    return gen_gvec_fn_arg_zzi(s, tcg_gen_gvec_addi, a);
 }
 
 static bool trans_SUB_zzi(DisasContext *s, arg_rri_esz *a)
@@ -6825,10 +6830,10 @@ TRANS_FEAT(ADCLT, aa64_sve2, do_adcl, a, true)
 
 static bool do_sve2_fn2i(DisasContext *s, arg_rri_esz *a, GVecGen2iFn *fn)
 {
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+    if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return gen_gvec_fn_zzi(s, fn, a->esz, a->rd, a->rn, a->imm);
+    return gen_gvec_fn_arg_zzi(s, fn, a);
 }
 
 static bool trans_SSRA(DisasContext *s, arg_rri_esz *a)
-- 
2.25.1


