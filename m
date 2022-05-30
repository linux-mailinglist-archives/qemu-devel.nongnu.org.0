Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC9A53862B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:34:59 +0200 (CEST)
Received: from localhost ([::1]:40026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviM7-00005E-0w
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvZ-0002zB-Nc
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:33 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvX-0007BE-Cr
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:33 -0400
Received: by mail-wr1-x436.google.com with SMTP id e2so15314806wrc.1
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=to1P/F8jtgSpqEU9S2Gk4KaraD3n0l9S4bHiRVQ6FPc=;
 b=tSGu7/Uwpbvbv1eEAZC1fkRivle4/davDH6s5FKDoa9GcezM7M0WOm0jt+dNO4ElLv
 1D8zTqDUWrMTMtOYumS3S80PXqLAqdHzWo6BUH/fOw3Ivjgp5b2jm2mPV3qwIyImc6Fv
 NgDBS0d+0xPfrI76kHWtxLROvUol5Uhm2+A8cfwWw0i9Kv1/KyiQuysl0ojPI9DvtlDT
 wK6IiL0sSjaPEBVA9UKP1naTnVLuFOUAKpbmcZWbHEsg9696P5E2aAbrq+wsUWFSGs41
 lEoyWVevzFskO9TzD2d5HOrqtzWdBCQdh94TvRIKkd51dg0Gn87Z7wlMUhbrZOWnz5ae
 QYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=to1P/F8jtgSpqEU9S2Gk4KaraD3n0l9S4bHiRVQ6FPc=;
 b=jZsJwFiZfVD4BGJgAD5jfhY7nVYxRNL4Wwntv2mBBJInI6PbN6AytixkdkQNsOiOha
 qoECWDnbBfBzEvlqRKR4qWcNAIpIqw9Cm3BRjQxuPG3Z5RC5RUvn3PHsgKbE/l7jisOf
 U/HX32nKkCX3lwS0ckYs8cdIiQoUhJm+CKYDuPg7+f5hMx+ob9wWbXckLH2OuoMLaG9e
 WojKvu2mJVxVhL47065Udye8xz+EEUcEitFj4JuU/CpAbJeRo7nGlperpGfkj9hwUDtC
 OYENkIWW9Colht5qaJ9iWkExLPX+r6J1zkUNiPmpqGZUF8YiHxuS6jVoEEfRnGprj43C
 GMzQ==
X-Gm-Message-State: AOAM530m7gUGA+IbALaBLDvKDCesngTnMC8IMR3LWOER/iz6NnKmjR6r
 GMeD4eUrh3VgrjtLzYqCnBlL/YXm49CVbQ==
X-Google-Smtp-Source: ABdhPJwu46HKPc08XRAwNFzhygW+eqcXTlBSBH5gVoVyYIfvxipfPOWLj0Loib4KkHjJvvZPu/tfTQ==
X-Received: by 2002:a5d:58c2:0:b0:210:2baa:52b8 with SMTP id
 o2-20020a5d58c2000000b002102baa52b8mr8196482wrf.20.1653926850408; 
 Mon, 30 May 2022 09:07:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 025/117] target/arm: Use TRANS_FEAT for do_sve2_zpz_data
Date: Mon, 30 May 2022 17:05:36 +0100
Message-Id: <20220530160708.726466-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Convert SVE translation functions using do_sve2_zpz_data
to use TRANS_FEAT and gen_gvec_ool_arg_zpz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-23-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 53 ++++++++++----------------------------
 1 file changed, 14 insertions(+), 39 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d5a09a60af4..fe11cfed6bb 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6554,48 +6554,23 @@ static bool trans_UADALP_zpzz(DisasContext *s, arg_rprr_esz *a)
  * SVE2 integer unary operations (predicated)
  */
 
-static bool do_sve2_zpz_ool(DisasContext *s, arg_rpr_esz *a,
-                            gen_helper_gvec_3 *fn)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpz(s, fn, a, 0);
-}
+TRANS_FEAT(URECPE, aa64_sve2, gen_gvec_ool_arg_zpz,
+           a->esz == 2 ? gen_helper_sve2_urecpe_s : NULL, a, 0)
 
-static bool trans_URECPE(DisasContext *s, arg_rpr_esz *a)
-{
-    if (a->esz != 2) {
-        return false;
-    }
-    return do_sve2_zpz_ool(s, a, gen_helper_sve2_urecpe_s);
-}
+TRANS_FEAT(URSQRTE, aa64_sve2, gen_gvec_ool_arg_zpz,
+           a->esz == 2 ? gen_helper_sve2_ursqrte_s : NULL, a, 0)
 
-static bool trans_URSQRTE(DisasContext *s, arg_rpr_esz *a)
-{
-    if (a->esz != 2) {
-        return false;
-    }
-    return do_sve2_zpz_ool(s, a, gen_helper_sve2_ursqrte_s);
-}
+static gen_helper_gvec_3 * const sqabs_fns[4] = {
+    gen_helper_sve2_sqabs_b, gen_helper_sve2_sqabs_h,
+    gen_helper_sve2_sqabs_s, gen_helper_sve2_sqabs_d,
+};
+TRANS_FEAT(SQABS, aa64_sve2, gen_gvec_ool_arg_zpz, sqabs_fns[a->esz], a, 0)
 
-static bool trans_SQABS(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_sqabs_b, gen_helper_sve2_sqabs_h,
-        gen_helper_sve2_sqabs_s, gen_helper_sve2_sqabs_d,
-    };
-    return do_sve2_zpz_ool(s, a, fns[a->esz]);
-}
-
-static bool trans_SQNEG(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_sqneg_b, gen_helper_sve2_sqneg_h,
-        gen_helper_sve2_sqneg_s, gen_helper_sve2_sqneg_d,
-    };
-    return do_sve2_zpz_ool(s, a, fns[a->esz]);
-}
+static gen_helper_gvec_3 * const sqneg_fns[4] = {
+    gen_helper_sve2_sqneg_b, gen_helper_sve2_sqneg_h,
+    gen_helper_sve2_sqneg_s, gen_helper_sve2_sqneg_d,
+};
+TRANS_FEAT(SQNEG, aa64_sve2, gen_gvec_ool_arg_zpz, sqneg_fns[a->esz], a, 0)
 
 #define DO_SVE2_ZPZZ(NAME, name) \
 static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                \
-- 
2.25.1


