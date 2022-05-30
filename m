Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E3B53869E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:12:07 +0200 (CEST)
Received: from localhost ([::1]:41106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviw2-00013P-Q3
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvo-0003Yr-94
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:48 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvj-0007Ht-ML
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:47 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 r9-20020a1c4409000000b00397345f2c6fso3118586wma.4
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VEIC8I1TyCPONODL7lkws/bVlUEyQgePU9miiwU3/CM=;
 b=w09S4FNO8W+gHbCh19NwJdaFdSnHEMIAg/aYKB8W9Shi2E3NtEybuqVqcOfH4c9icw
 1Qg7dLC8BXGMTyDCYVjc5Uf8DbJXdYHTIqsT/KOGkSP2lScRL+RNzSeOciz9ySUYilZB
 QmLHhuJ+/AP4GLPasGVlUHs3ZTCaK6iH7BU/KeUqBjXZMAGRxN+Y5xeeg8Kje0aVAZSx
 coYN0m+LxODZiGUMonJoSmkDa9ROF67TqxHyQXt9GNnfAWur1VXk3xf7yaEa7BoYDBij
 SHBlF0kL0rvtw2AjsEofq8Q0GrL26q3e8vmToK6IEzaniGXyeSjkJmU31kWwuyko3q6n
 D7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VEIC8I1TyCPONODL7lkws/bVlUEyQgePU9miiwU3/CM=;
 b=epS5J+KzG3ZVbrV/cQ2D95vrV0PcOvgKQ4t4bURUAp0NYxPMJFAs0hMwokzweJg5N0
 NPMe1fhf4UJCDnA36E1QkzON8lYGrkxOUyR3C07OjSQwJfvSsIRCwdxKi05mtnvPT7HM
 cW1E9KQ8uF3oXUwwMABBy2+Rk5W5XKtsgyrqwbBQCBArK7str+7vM5Lhn+fyDZO7Zy7m
 6xkx2NP3+WfFLkY3YzcCkBGEcH6qLzFaagsUzM5141yAUhUqCt1Wwe91Nhx4ldo89572
 3f49gFC4lqcSTpsScx/n7y4DfoG3JgqQQkIMGNQS5aQkdMFcQ9oU69JEOxdR92mpJFIP
 hgRg==
X-Gm-Message-State: AOAM533WRqWeKj32SmtCyXVCvHDuj4Xfh5RKVQN0T2faLnQgzMsmIhIM
 DwhBtR2ilEIQ7DTBYwt7wr3pCFBmRX4rhQ==
X-Google-Smtp-Source: ABdhPJx8WLp0K2CEJYx/1DzSs627HMh2AHhyhaRFAJpcLs+6TMIvakgtg57UlYLVY3HjgxJBHvVSRg==
X-Received: by 2002:a7b:c1d8:0:b0:397:337a:b593 with SMTP id
 a24-20020a7bc1d8000000b00397337ab593mr19581583wmj.96.1653926859850; 
 Mon, 30 May 2022 09:07:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 037/117] target/arm: Use TRANS_FEAT for do_sve2_fn_zzz
Date: Mon, 30 May 2022 17:05:48 +0100
Message-Id: <20220530160708.726466-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

Convert SVE translation functions using do_sve2_fn_zzz
to use TRANS_FEAT and gen_gvec_fn_arg_zzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-35-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ddb34cad8e9..e92fef23041 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6897,23 +6897,8 @@ static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
     return do_sve2_fn2i(s, a, gen_gvec_sli);
 }
 
-static bool do_sve2_fn_zzz(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *fn)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_fn_arg_zzz(s, fn, a);
-}
-
-static bool trans_SABA(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_sve2_fn_zzz(s, a, gen_gvec_saba);
-}
-
-static bool trans_UABA(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_sve2_fn_zzz(s, a, gen_gvec_uaba);
-}
+TRANS_FEAT(SABA, aa64_sve2, gen_gvec_fn_arg_zzz, gen_gvec_saba, a)
+TRANS_FEAT(UABA, aa64_sve2, gen_gvec_fn_arg_zzz, gen_gvec_uaba, a)
 
 static bool do_sve2_narrow_extract(DisasContext *s, arg_rri_esz *a,
                                    const GVecGen2 ops[3])
-- 
2.25.1


