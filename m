Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363B4538614
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:24:20 +0200 (CEST)
Received: from localhost ([::1]:43344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviBn-0007iL-A7
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvN-0002e4-3g
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:21 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvK-0007Aw-HI
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:20 -0400
Received: by mail-wr1-x436.google.com with SMTP id q7so4314885wrg.5
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=F7D5A4jK2slAbzXLwOeiXimVOY+Rz3I47iq2p6PuNZA=;
 b=Te0kRqsOBh0senBIW5ECaxO+cTprzFMD6sxjkvcCNF/5e8sE2emPJ7ewspA0HoEl0A
 CYsEbE1xfzrfX7nBgInFY4eQSMAuUPttuVpv12aFFueTk43PKqDL+KZ/8ZZxpwYYcXKd
 ZIRg1W8eTlGLes7vuTs7LvsvcOzAE1rT7aoV+xQ9L+z3OEsnQ74kVcUtmJP4Trx4fET4
 B8BZFg6TldWstpGKy/1u80pcowmZlADShxxPHfQVzswvSgXmVao5k8ZYSEjck4Zq3Qhj
 MhX4J30JVI4XjPOj0tcqUZ6q05GO+DyAY+xqRwhgGm/kcKOjR6Tb3oH/hjIo6Zi52PRD
 Dl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F7D5A4jK2slAbzXLwOeiXimVOY+Rz3I47iq2p6PuNZA=;
 b=3euv9MnwQBVXj++eBI48DRoy0CLD8ydDUpxzwPKMLpHLnxqBVEU+9s4Isk/yKMpbXd
 df/98Y3/r2IAypjRJ1HzvSnOccCA1jIcf/jbq2DFdUoveOaJHiByFIhWz1mYYuWiwaQH
 NvbtpJxupYV6fHBJcIpIH9nJH/5ozRlceuZm0H7njs355jwVPfdTCSWyfXdDMrmHOSaZ
 45m9ooLO4+eR1xE0XUKHWxOrkn2jUzISfdXr/qexva2XepWdBk48czAqcw2Oohl50DZH
 AYteyYUk79Pg5CiYMmVKM2uyK4q/ppY7yI7snf8xvJTe6kiNbV4q7InyQj17RPE4rAYS
 RdYw==
X-Gm-Message-State: AOAM5336Qe0pVG4tUoZqH+uE561yVXGsZaxPv6nstEmkgT3PIclwS3DT
 fVoKeN2G5dDuMNKJi+yZH2RW9dk/Zzf+XA==
X-Google-Smtp-Source: ABdhPJzncdd++tuqCNoxcbgBW7coyDZQiIlyPTNYlrthpzHPVgPQSbVEvenaK9vNWPcsQgNkAgQ9zA==
X-Received: by 2002:a5d:6847:0:b0:20f:c0b6:d783 with SMTP id
 o7-20020a5d6847000000b0020fc0b6d783mr40461499wrw.101.1653926834974; 
 Mon, 30 May 2022 09:07:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 006/117] target/arm: Use TRANS_FEAT for gen_gvec_ool_zz
Date: Mon, 30 May 2022 17:05:17 +0100
Message-Id: <20220530160708.726466-7-peter.maydell@linaro.org>
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

Convert SVE translation functions using gen_gvec_ool_zz to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-4-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 39 +++++++++++++-------------------------
 1 file changed, 13 insertions(+), 26 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 903514cb6a8..f7e7a569b7a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1375,16 +1375,12 @@ static bool trans_ADR_u32(DisasContext *s, arg_rrri *a)
  *** SVE Integer Misc - Unpredicated Group
  */
 
-static bool trans_FEXPA(DisasContext *s, arg_rr_esz *a)
-{
-    static gen_helper_gvec_2 * const fns[4] = {
-        NULL,
-        gen_helper_sve_fexpa_h,
-        gen_helper_sve_fexpa_s,
-        gen_helper_sve_fexpa_d,
-    };
-    return gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
-}
+static gen_helper_gvec_2 * const fexpa_fns[4] = {
+    NULL,                   gen_helper_sve_fexpa_h,
+    gen_helper_sve_fexpa_s, gen_helper_sve_fexpa_d,
+};
+TRANS_FEAT(FEXPA, aa64_sve, gen_gvec_ool_zz,
+           fexpa_fns[a->esz], a->rd, a->rn, 0)
 
 static bool trans_FTSSEL(DisasContext *s, arg_rrr_esz *a)
 {
@@ -2418,14 +2414,11 @@ static bool trans_INSR_r(DisasContext *s, arg_rrr_esz *a)
     return true;
 }
 
-static bool trans_REV_v(DisasContext *s, arg_rr_esz *a)
-{
-    static gen_helper_gvec_2 * const fns[4] = {
-        gen_helper_sve_rev_b, gen_helper_sve_rev_h,
-        gen_helper_sve_rev_s, gen_helper_sve_rev_d
-    };
-    return gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
-}
+static gen_helper_gvec_2 * const rev_fns[4] = {
+    gen_helper_sve_rev_b, gen_helper_sve_rev_h,
+    gen_helper_sve_rev_s, gen_helper_sve_rev_d
+};
+TRANS_FEAT(REV_v, aa64_sve, gen_gvec_ool_zz, rev_fns[a->esz], a->rd, a->rn, 0)
 
 static bool trans_TBL(DisasContext *s, arg_rrr_esz *a)
 {
@@ -8376,14 +8369,8 @@ static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
     return true;
 }
 
-static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
-{
-    if (!dc_isar_feature(aa64_sve2_aes, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zz(s, gen_helper_crypto_aesmc,
-                           a->rd, a->rd, a->decrypt);
-}
+TRANS_FEAT(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
+           gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt)
 
 static bool do_aese(DisasContext *s, arg_rrr_esz *a, bool decrypt)
 {
-- 
2.25.1


