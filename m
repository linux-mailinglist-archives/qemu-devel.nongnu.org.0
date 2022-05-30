Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D1C538657
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:51:03 +0200 (CEST)
Received: from localhost ([::1]:43058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvibe-0004wB-42
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvc-00036J-4H
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:36 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhva-0007Aa-Cr
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:35 -0400
Received: by mail-wr1-x430.google.com with SMTP id p10so15256837wrg.12
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JYeZaqnsqx2R+Y9I8egSesqWI+mAXWiyeDSBtClE71Q=;
 b=bNU38zGlYtb6inKfyHFXTBFt21QTeiY22Cdkwpv2XurKH7Bwq/9Lk4dp9krDfNFVhk
 pChiKW5ur0X6nElXhJ3yXfOVTxohpwSxmha946KLt8EPUlA0Pn2Z5YP6zZhs2NkWOmAY
 ow0V1hWFhS3jLDypZuEWfZoJ9itczKzNnaZICSsbNI0gWenWmdFkLP7GQDXvKfCocYbj
 aQjbRUKebd/OQAJG8mLWkpgVUXnCQIQ2K9WBljbDpnc0pTm2UDhCC6iaaa+UbSf3hjNf
 VdcnLzw7tPW+hOqDYa2151k2upinvNMMzl13ZbzDzdqevKIqakZpHNz+WRsV1oJunJh8
 KypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JYeZaqnsqx2R+Y9I8egSesqWI+mAXWiyeDSBtClE71Q=;
 b=O+vBHiFjsRHvnSqoSOLveGHYNFi1vmEuuWWN4WWcBdG8F39nZxD0VAeHiR7LsXlM7r
 oZyoQkdq7F/pkqEGNUWXBQMZ6t9zMScBiFfzcVgYz9CbDWpblUP/ZK9vON6VoemOGc7h
 6jYyKlvJIvAa9KS/SH8SU2h/BZBTuves9YDmv4c3WsMiWb1WhOlALFwVJqhJbx4qFzDs
 +Dg3SoAzu83dmaJF9oWIz2LJYlthpxtzTxNDLHYoUJZsD4COqUwRP5Duu9Jl0TY4Kv9R
 zarehe3wI+jMsg9qeZsZ1OW68NA3HNPt25tbv16LmLA/A9869QSz/+fHAH6QfmpYg7Hh
 eLIQ==
X-Gm-Message-State: AOAM533frGhapAqtVLQnzLQ8GwdnUZT1c7NZe4f3ApcSjnq1KzWAxmjw
 R+k4q3iXHIlbcpwQD7hydq98BI1v8sREIQ==
X-Google-Smtp-Source: ABdhPJyuES+MVwstozyMDE1krUIps+wGnBMIzs1rGLhXZ1CKoa75FV9+kO8I+DLoPC9JNg5DEeI5sQ==
X-Received: by 2002:a5d:52c7:0:b0:210:ac6:3956 with SMTP id
 r7-20020a5d52c7000000b002100ac63956mr18443710wrv.379.1653926853502; 
 Mon, 30 May 2022 09:07:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 029/117] target/arm: Introduce gen_gvec_ool_arg_zpzz
Date: Mon, 30 May 2022 17:05:40 +0100
Message-Id: <20220530160708.726466-30-peter.maydell@linaro.org>
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

Use gen_gvec_ool_arg_zpzz instead of gen_gvec_ool_zzzp
when the arguments come from arg_rprr_esz.
Replaces do_zpzz_ool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-27-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fea7164d729..d63099c5b7b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -252,6 +252,12 @@ static bool gen_gvec_ool_zzzp(DisasContext *s, gen_helper_gvec_4 *fn,
     return true;
 }
 
+static bool gen_gvec_ool_arg_zpzz(DisasContext *s, gen_helper_gvec_4 *fn,
+                                  arg_rprr_esz *a, int data)
+{
+    return gen_gvec_ool_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, data);
+}
+
 /* Invoke a vector expander on two Zregs.  */
 static void gen_gvec_fn_zz(DisasContext *s, GVecGen2Fn *gvec_fn,
                            int esz, int rd, int rn)
@@ -737,11 +743,6 @@ static bool trans_UQSUB_zzz(DisasContext *s, arg_rrr_esz *a)
  *** SVE Integer Arithmetic - Binary Predicated Group
  */
 
-static bool do_zpzz_ool(DisasContext *s, arg_rprr_esz *a, gen_helper_gvec_4 *fn)
-{
-    return gen_gvec_ool_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, 0);
-}
-
 /* Select active elememnts from Zn and inactive elements from Zm,
  * storing the result in Zd.
  */
@@ -761,7 +762,7 @@ static bool trans_##NAME##_zpzz(DisasContext *s, arg_rprr_esz *a)         \
         gen_helper_sve_##name##_zpzz_b, gen_helper_sve_##name##_zpzz_h,   \
         gen_helper_sve_##name##_zpzz_s, gen_helper_sve_##name##_zpzz_d,   \
     };                                                                    \
-    return do_zpzz_ool(s, a, fns[a->esz]);                                \
+    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);                   \
 }
 
 DO_ZPZZ(AND, and)
@@ -792,7 +793,7 @@ static bool trans_SDIV_zpzz(DisasContext *s, arg_rprr_esz *a)
     static gen_helper_gvec_4 * const fns[4] = {
         NULL, NULL, gen_helper_sve_sdiv_zpzz_s, gen_helper_sve_sdiv_zpzz_d
     };
-    return do_zpzz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a)
@@ -800,7 +801,7 @@ static bool trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a)
     static gen_helper_gvec_4 * const fns[4] = {
         NULL, NULL, gen_helper_sve_udiv_zpzz_s, gen_helper_sve_udiv_zpzz_d
     };
-    return do_zpzz_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a)
@@ -1076,7 +1077,7 @@ static bool trans_##NAME##_zpzw(DisasContext *s, arg_rprr_esz *a)         \
     if (a->esz < 0 || a->esz >= 3) {                                      \
         return false;                                                     \
     }                                                                     \
-    return do_zpzz_ool(s, a, fns[a->esz]);                                \
+    return gen_gvec_ool_arg_zpzz(s, fns[a->esz], a, 0);                   \
 }
 
 DO_ZPZW(ASR, asr)
@@ -6489,7 +6490,7 @@ static bool do_sve2_zpzz_ool(DisasContext *s, arg_rprr_esz *a,
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zpzz_ool(s, a, fn);
+    return gen_gvec_ool_arg_zpzz(s, fn, a, 0);
 }
 
 static bool trans_SADALP_zpzz(DisasContext *s, arg_rprr_esz *a)
-- 
2.25.1


