Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFEB5386F0
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:56:45 +0200 (CEST)
Received: from localhost ([::1]:50410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjdD-0007jb-W9
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwf-0004Db-Uj
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:41 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwQ-0007Aj-IG
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:41 -0400
Received: by mail-wr1-x42b.google.com with SMTP id e2so15314489wrc.1
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ytydms9W5FFSpsppcw4HGoJVFWLdAeMuRsUCrOx5fAk=;
 b=ap26YMBtCQ2ftZKvNv2zQrQcmKGZ54Qeyn3lNLRTbWjhSP5C/hQ/oBSqxwbWkjckaz
 UF3T53K/IrFm7XAKqwBnRYEk0cqAX0uKXxLUQ0pIlHk4VziJIgL0KbuEywbmbx6ehib7
 NMpIOFE1EY+3NdhCBzwH3D1mRnnNZRbXT3wtTalAtXYxqvSEdV9sl0tEmbTlFZ2OmVCD
 gqip2BUe87hdgIwNmXqZbu3lGhLtHy9+8VRHaXat2pF9+PXb/bru238nqJiNwQp5Q8k6
 tJu6FwG5bGL+54Tq1EiWt7IKcOKiye7XoDnHPAtLMGGfXqn7zhRyw95JzI81T4Y3MjQ5
 kcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ytydms9W5FFSpsppcw4HGoJVFWLdAeMuRsUCrOx5fAk=;
 b=4UB+/NMe7gyxniP3XjJG393ISbvjnfotM4EvW0s80eAVlBmccjSOgKpvwQ9bXndU7E
 V/rIiBXSb2RAzyXdtjwP/3/cUo21iWs2hKdUB6iLkFm38klI6ZlPV3W7nbJtiXTvUuad
 cl2tOAcLNExzhmc3Vu650VH7vsl0LuHD/qmiQpo+SMTtumgAIljDo+tc0h3uvA2wueTE
 2yn4IiKdC5dV4n728LRfyS3wWTRw/hzC+k5C+S7XXoh1IdVfMqZ4L3fQqiFeiP5XPYtL
 1M1VU7CCIBDjcmQ9RoTCHHERLZxgUUbRQl3sQAIAiP/DksY5Y7FlDUI+lIwCiy+glsup
 /iXw==
X-Gm-Message-State: AOAM530Zg6nAlujrqD9Md5TnUbAj4TzoEOFrLxmtNReyHf+mpoVJWgEy
 32NLmVXI9mGI1S6xn06/MZV8xFhzgzm7qA==
X-Google-Smtp-Source: ABdhPJy9cixv5vc9DA9BBHBf4446aMQSfDCEESHns6R/Bpq3djMdWifieWjk5CdNPBLJ/o7ilGPc0A==
X-Received: by 2002:a05:6000:3c1:b0:210:2e6d:86cd with SMTP id
 b1-20020a05600003c100b002102e6d86cdmr7214844wrg.335.1653926905683; 
 Mon, 30 May 2022 09:08:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 082/117] target/arm: Move sve check into gen_gvec_fn_ppp
Date: Mon, 30 May 2022 17:06:33 +0100
Message-Id: <20220530160708.726466-83-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Combined with the check already present in gen_mov_p,
we can simplify some special cases in trans_AND_pppp
and trans_BIC_pppp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-80-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 364e419f3eb..f33bc9d480b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -370,13 +370,16 @@ static void do_dupi_z(DisasContext *s, int rd, uint64_t word)
 }
 
 /* Invoke a vector expander on three Pregs.  */
-static void gen_gvec_fn_ppp(DisasContext *s, GVecGen3Fn *gvec_fn,
+static bool gen_gvec_fn_ppp(DisasContext *s, GVecGen3Fn *gvec_fn,
                             int rd, int rn, int rm)
 {
-    unsigned psz = pred_gvec_reg_size(s);
-    gvec_fn(MO_64, pred_full_reg_offset(s, rd),
-            pred_full_reg_offset(s, rn),
-            pred_full_reg_offset(s, rm), psz, psz);
+    if (sve_access_check(s)) {
+        unsigned psz = pred_gvec_reg_size(s);
+        gvec_fn(MO_64, pred_full_reg_offset(s, rd),
+                pred_full_reg_offset(s, rn),
+                pred_full_reg_offset(s, rm), psz, psz);
+    }
+    return true;
 }
 
 /* Invoke a vector move on two Pregs.  */
@@ -1317,19 +1320,13 @@ static bool trans_AND_pppp(DisasContext *s, arg_rprr_s *a)
     };
 
     if (!a->s) {
-        if (!sve_access_check(s)) {
-            return true;
-        }
         if (a->rn == a->rm) {
             if (a->pg == a->rn) {
-                do_mov_p(s, a->rd, a->rn);
-            } else {
-                gen_gvec_fn_ppp(s, tcg_gen_gvec_and, a->rd, a->rn, a->pg);
+                return do_mov_p(s, a->rd, a->rn);
             }
-            return true;
+            return gen_gvec_fn_ppp(s, tcg_gen_gvec_and, a->rd, a->rn, a->pg);
         } else if (a->pg == a->rn || a->pg == a->rm) {
-            gen_gvec_fn_ppp(s, tcg_gen_gvec_and, a->rd, a->rn, a->rm);
-            return true;
+            return gen_gvec_fn_ppp(s, tcg_gen_gvec_and, a->rd, a->rn, a->rm);
         }
     }
     return do_pppp_flags(s, a, &op);
@@ -1358,10 +1355,7 @@ static bool trans_BIC_pppp(DisasContext *s, arg_rprr_s *a)
     };
 
     if (!a->s && a->pg == a->rn) {
-        if (sve_access_check(s)) {
-            gen_gvec_fn_ppp(s, tcg_gen_gvec_andc, a->rd, a->rn, a->rm);
-        }
-        return true;
+        return gen_gvec_fn_ppp(s, tcg_gen_gvec_andc, a->rd, a->rn, a->rm);
     }
     return do_pppp_flags(s, a, &op);
 }
-- 
2.25.1


