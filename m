Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65EB53864F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:48:38 +0200 (CEST)
Received: from localhost ([::1]:37772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviZJ-0001Qv-SM
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvl-0003PI-Ms
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:45 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvj-0007I3-Mg
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:45 -0400
Received: by mail-wr1-x430.google.com with SMTP id t13so15277690wrg.9
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=avR2/pgwvkk2OR7g0STG26bwB5CQnXlwT2+SY4G/umw=;
 b=jNSYFOeY0sTPr6T2ZEfOhCcySRXXQBW1EpLIQAkg6mHX4fp9r4/r6kOpK685jcLtOR
 pgvyWjuk6KN8lZwJXsOPn1Dusk45UEmMDAeXI03efMmtPwAmXOYoEzXH0dCaCxtbDD3C
 eorq7ZGXk6GWw7ovIsEalaaO8fnmJPr7IzOT3P7iyyhvtSgFWNARfXT2Kb7WIP/l2GKl
 m7mj4rU2+/QiZroSuyHOtfyr/Sou/B2eu7N34kUNMF0TPboWXla4QAMcdlnGvaNzFueP
 ae9RFJYiC9Sj+e9lTLE0NbMoJBTNa9gfOhiX3hjLBtilDJf3DL480lBBKmaee5vWtt5F
 0p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=avR2/pgwvkk2OR7g0STG26bwB5CQnXlwT2+SY4G/umw=;
 b=zZBmTP1YGzzLc2LGr6KUSZkwg8PkSbkf7YWifVpP0B9xyj0PnpzfScyQZSMJi5d1mQ
 9O4B+YBhUMgzGV58fAbpXgxqZCtnX7nPWuAO5CyL7VnOnbY7CSd+GYkandIdqf4hFU6f
 6m7QyYAOTzJ4N7au88mxcC/PIq23OPNHS3BOGFBkc6HEc+ZfSUxHU/iPOy2DnVMbr9yC
 yKR9y5p31hGlw+xST7hKnpO3o/sKz6y4eq/UBqUqmqe7S52B3OT1MZhLAvzmtjjnX1De
 heMManu9HsXJvD8o+LS+za9sQL5cXFC0XjPwU3S9b1YJg3EYb/5myFq2qjjJpLtNzPvA
 Xs2Q==
X-Gm-Message-State: AOAM532DFrJCzaiakJqygdqH3SDz8zH6FeCi3JGYZbvg6UAGsuNYl1uh
 mAdhoQxLyu6bx2adGhLxhoX9JnT2VuLWNQ==
X-Google-Smtp-Source: ABdhPJw1z1zOGerPMZUyAMl01XLKl11NAaXyrfOIVy1WnPJFfdv5gCdhq6OHR/u6LWFj7U6kTCVg5w==
X-Received: by 2002:a5d:428f:0:b0:210:30cd:3753 with SMTP id
 k15-20020a5d428f000000b0021030cd3753mr6029765wrq.549.1653926861351; 
 Mon, 30 May 2022 09:07:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 039/117] target/arm: Introduce gen_gvec_fn_arg_zzzz
Date: Mon, 30 May 2022 17:05:50 +0100
Message-Id: <20220530160708.726466-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

Merge gen_gvec_fn_zzzz with the sve access check and the
dereference of arg_rrrr_esz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-37-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 36d739d7b2c..e0b083f8615 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -281,14 +281,20 @@ static bool gen_gvec_fn_arg_zzz(DisasContext *s, GVecGen3Fn *fn,
 }
 
 /* Invoke a vector expander on four Zregs.  */
-static void gen_gvec_fn_zzzz(DisasContext *s, GVecGen4Fn *gvec_fn,
-                             int esz, int rd, int rn, int rm, int ra)
+static bool gen_gvec_fn_arg_zzzz(DisasContext *s, GVecGen4Fn *gvec_fn,
+                                 arg_rrrr_esz *a)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    gvec_fn(esz, vec_full_reg_offset(s, rd),
-            vec_full_reg_offset(s, rn),
-            vec_full_reg_offset(s, rm),
-            vec_full_reg_offset(s, ra), vsz, vsz);
+    if (gvec_fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        gvec_fn(a->esz, vec_full_reg_offset(s, a->rd),
+                vec_full_reg_offset(s, a->rn),
+                vec_full_reg_offset(s, a->rm),
+                vec_full_reg_offset(s, a->ra), vsz, vsz);
+    }
+    return true;
 }
 
 /* Invoke a vector move on two Zregs.  */
@@ -490,10 +496,7 @@ static bool do_sve2_zzzz_fn(DisasContext *s, arg_rrrr_esz *a, GVecGen4Fn *fn)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_fn_zzzz(s, fn, a->esz, a->rd, a->rn, a->rm, a->ra);
-    }
-    return true;
+    return gen_gvec_fn_arg_zzzz(s, fn, a);
 }
 
 static void gen_eor3_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
-- 
2.25.1


