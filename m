Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40115570524
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:12:42 +0200 (CEST)
Received: from localhost ([::1]:41460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAu9R-0001yN-2p
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvQ-0006V9-IK
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:12 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvD-0002oE-KQ
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:03 -0400
Received: by mail-wm1-x331.google.com with SMTP id n185so3088514wmn.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=b/+WDKk3Mk2Y2JF1uylZFAgYZTRJ5lUsqHT3ajN06B8=;
 b=fonUMEhqZBII12HhvTgMPJCSEzdQQ4j0PWp76CCLErVvHyNtCXQTvGmZjXI/tehrZL
 HCorogZHptEdqLeqCUvRzAm1Bp4az3ixBogaM8D3nVNrHOnyfQba48u8iumlXmZFrK80
 8qJJiVzdbrDTZDlo/NF04Gt9kTImdNfIEpGTAasHOh49U1rZlyxLVUGsMsKmqEfdpI/A
 pcnq6EB3oJBE6knStK9xRdYDSoG6C5GtJkdnGoUffU2tXQPg/jNwAxHKq7rQPOM9grPP
 UDz0UN/TV42PvbntlzX0bTQx6SbHK8HZs+p1+x3BUnNi4fr9o25xLCjiPlYMZXOqz/i8
 6JMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b/+WDKk3Mk2Y2JF1uylZFAgYZTRJ5lUsqHT3ajN06B8=;
 b=RdUuDYtN24APqKQWo+iAG8050x+lWC8bZ31gO1P9vmYitayuBdMckaNyYrUfayrxT9
 C+rqrSQrHBrzTzGjjQiRmn+lv1zac9+tnVUsuzUqBk9EP7yvZdrK1l7R67ROo/BJdhzB
 ri5K3o2kDmlUWJk29pd40kMOm5rncuTbeiXu46RPNQqCl+TimXQw5osXozhURf/6Sn3a
 32VRvkLNKklAHfJcDaxmb9P2JGVN+x57Ma8XXXoLYSXEdbm9rQV895JBuw3z3+XInD7x
 M9AT/9owOn7PKsyjbxaIa8zIcMZbqMOzCVG2ednFPcoR8vThZ/x0zQ/FV5nnnrbzguhx
 vVDg==
X-Gm-Message-State: AJIora9wajp5NOKq1J+AHKj9w9sPuPwnI3K93O7gtFdTl3ppysz6pLkG
 gze0FHY3tO3Ls8SWcZrU4O4A0JlwynkT8w==
X-Google-Smtp-Source: AGRyM1sUDh1Tkp1zM6WvfSO2K6/dYlX58cv4IkqqaBjxaM7q+Aui0k8ZlChWqqe+yo48rqoY6hhdhw==
X-Received: by 2002:a05:600c:3b8d:b0:3a2:ea2b:d0f9 with SMTP id
 n13-20020a05600c3b8d00b003a2ea2bd0f9mr1572088wms.120.1657547878248; 
 Mon, 11 Jul 2022 06:57:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.57.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:57:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/45] target/arm: Mark PMULL, FMMLA as non-streaming
Date: Mon, 11 Jul 2022 14:57:12 +0100
Message-Id: <20220711135750.765803-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
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

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-8-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sme-fa64.decode |  2 --
 target/arm/translate-sve.c | 24 +++++++++++++++---------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 4f515939d9c..4ff2df82e5b 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,8 +59,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)
-FAIL    0110 0100 --1- ---- 1110 01-- ---- ----   # FMMLA, BFMMLA
 FAIL    0110 0101 --0- ---- 0000 11-- ---- ----   # FTSMUL
 FAIL    0110 0101 --01 0--- 100- ---- ---- ----   # FTMAD
 FAIL    0110 0101 --01 1--- 001- ---- ---- ----   # FADDA
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ae48040aa4c..4ff2102fc86 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6186,9 +6186,13 @@ static bool do_trans_pmull(DisasContext *s, arg_rrr_esz *a, bool sel)
         gen_helper_gvec_pmull_q, gen_helper_sve2_pmull_h,
         NULL,                    gen_helper_sve2_pmull_d,
     };
-    if (a->esz == 0
-        ? !dc_isar_feature(aa64_sve2_pmull128, s)
-        : !dc_isar_feature(aa64_sve, s)) {
+
+    if (a->esz == 0) {
+        if (!dc_isar_feature(aa64_sve2_pmull128, s)) {
+            return false;
+        }
+        s->is_nonstreaming = true;
+    } else if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
     return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, sel);
@@ -7125,10 +7129,12 @@ DO_ZPZZ_FP(FMINP, aa64_sve2, sve2_fminp_zpzz)
  * SVE Integer Multiply-Add (unpredicated)
  */
 
-TRANS_FEAT(FMMLA_s, aa64_sve_f32mm, gen_gvec_fpst_zzzz, gen_helper_fmmla_s,
-           a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR)
-TRANS_FEAT(FMMLA_d, aa64_sve_f64mm, gen_gvec_fpst_zzzz, gen_helper_fmmla_d,
-           a->rd, a->rn, a->rm, a->ra, 0, FPST_FPCR)
+TRANS_FEAT_NONSTREAMING(FMMLA_s, aa64_sve_f32mm, gen_gvec_fpst_zzzz,
+                        gen_helper_fmmla_s, a->rd, a->rn, a->rm, a->ra,
+                        0, FPST_FPCR)
+TRANS_FEAT_NONSTREAMING(FMMLA_d, aa64_sve_f64mm, gen_gvec_fpst_zzzz,
+                        gen_helper_fmmla_d, a->rd, a->rn, a->rm, a->ra,
+                        0, FPST_FPCR)
 
 static gen_helper_gvec_4 * const sqdmlal_zzzw_fns[] = {
     NULL,                           gen_helper_sve2_sqdmlal_zzzw_h,
@@ -7301,8 +7307,8 @@ TRANS_FEAT(BFDOT_zzzz, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
 TRANS_FEAT(BFDOT_zzxz, aa64_sve_bf16, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_bfdot_idx, a)
 
-TRANS_FEAT(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
-           gen_helper_gvec_bfmmla, a, 0)
+TRANS_FEAT_NONSTREAMING(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
+                        gen_helper_gvec_bfmmla, a, 0)
 
 static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
 {
-- 
2.25.1


