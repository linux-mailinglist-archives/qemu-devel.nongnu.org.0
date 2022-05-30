Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14EE538709
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:08:32 +0200 (CEST)
Received: from localhost ([::1]:48828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjod-0001eP-K4
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwa-00040Q-AY
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:36 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwV-0007Aw-N0
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:33 -0400
Received: by mail-wr1-x436.google.com with SMTP id q7so4314885wrg.5
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=O+yJvbh7BLlQNWDjDVOzRXcWwfLPp+Ci/M3gIfNfqGE=;
 b=RPvC0ttlXHGIgiGImXTx+fJRdQ9CoN4/pRvf8ggQqOEh2RaS7fvPwHRHfp7KHi8R/R
 esF3EySmpBPvU7QRGM1KFaBZUCpEqPyZKOi4dQ2rIkYWibPM3jCSkZKh79DSh/2dOKpk
 iGS8wOZBxOdT+R4xJSP/I9vUChN6oA1yh8Cp2Fw1y/xNpCtEpaBhSbl00wWYNixGUd1v
 poi3tjJ24RliumOarN8JnsABC/Z/UuYcGvjV1WIBIuRAdp1Z/7zvWpoiiLgXsRZxkRds
 RXWvdaSN7KFDfF/UCWCUu6ar/Wsp3E0/6MpC5Cll5umwOrv2C5syR/nM8YGFK1IbVivF
 ztjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O+yJvbh7BLlQNWDjDVOzRXcWwfLPp+Ci/M3gIfNfqGE=;
 b=LPF11rgX5wIjxpmA8JbV9aEeYNjqwOgFZntDMwLYoeKj1Hf3zUO5AlY9MKDrMZj7UL
 9V7WHAalmIx5cq8hG2neoiq1n84L5mRWkEBJyJF/D16RYSjVvpbGGNmN6d0JMYDxQMpo
 aVFXYTZDxh3gC+BS0wQyMgdVAEMSIEuR/FfXy4SSH5dq50asTej4C9KN4YWQEgs31DhQ
 GzJ4Yy96oOeUSDn/giiUbcjko16f6PTBbeqQoQ98P2KIw/MZtjkwKte2hKaQ8RQ+9Ab/
 hggf3mZbAnrFU74cMEVLnxONk0/wY6NS/p70wHFjFhGKpiJ/RPVOfUCIeFO0QfAWpA58
 KbMw==
X-Gm-Message-State: AOAM532FRp0y++cE7qC+RmIqLtkL7eVS3f6GigIQ5+HgKL6wOhfNz6dK
 Ew/RZH9l/VUA3lt+juP3uMEr4bExrZ7NMQ==
X-Google-Smtp-Source: ABdhPJzVa2NTT7QkvzpIqxlgfbg8fqXq6Y7S244/bcyJlawImyqQRHtUzp2//Cg3WLtqJwv0AgKuZA==
X-Received: by 2002:a5d:47c5:0:b0:20e:73a0:79a0 with SMTP id
 o5-20020a5d47c5000000b0020e73a079a0mr43526705wrc.632.1653926910826; 
 Mon, 30 May 2022 09:08:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 089/117] target/arm: Use TRANS_FEAT for DO_FP3
Date: Mon, 30 May 2022 17:06:40 +0100
Message-Id: <20220530160708.726466-90-peter.maydell@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-87-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 61bf5f57578..d596e7a0277 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3799,14 +3799,11 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
  */
 
 #define DO_FP3(NAME, name) \
-static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)           \
-{                                                                   \
-    static gen_helper_gvec_3_ptr * const fns[4] = {                 \
+    static gen_helper_gvec_3_ptr * const name##_fns[4] = {          \
         NULL, gen_helper_gvec_##name##_h,                           \
         gen_helper_gvec_##name##_s, gen_helper_gvec_##name##_d      \
     };                                                              \
-    return gen_gvec_fpst_arg_zzz(s, fns[a->esz], a, 0);             \
-}
+    TRANS_FEAT(NAME, aa64_sve, gen_gvec_fpst_arg_zzz, name##_fns[a->esz], a, 0)
 
 DO_FP3(FADD_zzz, fadd)
 DO_FP3(FSUB_zzz, fsub)
-- 
2.25.1


