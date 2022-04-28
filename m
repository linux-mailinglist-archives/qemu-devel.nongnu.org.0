Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0226F51387B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:35:45 +0200 (CEST)
Received: from localhost ([::1]:58508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6BD-0004f4-5n
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K1-0005b3-Tp
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:46 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Ju-0006RV-IO
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:42 -0400
Received: by mail-wr1-x429.google.com with SMTP id t6so7101613wra.4
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KiYqpjMVAlfCZGgNUdSywBEI1Zyg7nfSOh0zPewuNHQ=;
 b=De91P9xrrSI+AFbFkctOw1E/VpzgcHokGN5uXxzENRd+ZGkqlzlg/6j0FtK58JFmTy
 aBHCSNTdfajB5d4yRt+HOBq9lza5ojXok/YHfykQqrJVUjOR02RMm81xVvWAHJD6sgf4
 1lQjJNAKd7EimUUMOagAKSfqcRJlNUQBOccGSA2DhL/9bn1ej6ZczRMQmc+vI7+hy5Rp
 FiUm7EQeBb3Lervj9D12RCpp3w5PAsjJofQRAldulGoIxzDZkXr/yo50ewARUgF519Er
 XHJwpNAoSFj/zDL48tRkEpq8e8eStsgnklVHpw2+iYKwtYs1ZFwvU/DxzdN+Yans6Oul
 vGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KiYqpjMVAlfCZGgNUdSywBEI1Zyg7nfSOh0zPewuNHQ=;
 b=yvAbBljNfwavvhTD9QWI/frCez/gWLsD790Na/m8QS+dV+Hg+iYZ5guS0IFkN/PPPV
 A9fHQEmUYQlt/EazYnnBcbDb/kUvbjz5PwBJoDSeGT9wQkCSDYA4/M/WceYMG3osBA0q
 Uxoit9kTffHDxn6iwcIttTQZQ/Ck+YstmnVoDG1R5XarKUe4UpU4VwmzxAy2L1neyvpv
 NOiBybVMG7q8KpGw9+AGQM/3EPORUdYs8xTNVIaIiooKjR8c3aYoTqhzkfOA5I+X+ZzE
 hfPR2sXh5lj81PghSnwwo6aYqwwm/xCLVap4E8nnukeN+ikluBxUEgZ4JQbU4M/cIyO1
 Cc9A==
X-Gm-Message-State: AOAM5314pqDuC86/VxnsQ8MKJ8CZ81CP9w3X4/zYBKCD05Gn431oCtY+
 s/YAKocQntkbPtMyEvWJrZCXeApBpJ5sDA==
X-Google-Smtp-Source: ABdhPJylsQxnFDmfVRW/ksWZrAsRpLDi3Ef4qKcoOImsE6pYftruj+dLpuhcUTN7aj5YEGiOKtW4eQ==
X-Received: by 2002:a5d:4581:0:b0:20a:d58f:3307 with SMTP id
 p1-20020a5d4581000000b0020ad58f3307mr20798847wrq.702.1651156835656; 
 Thu, 28 Apr 2022 07:40:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/54] target/arm: Use tcg_constant in trans_CSEL
Date: Thu, 28 Apr 2022 15:39:39 +0100
Message-Id: <20220428143958.2451229-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-36-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5ce23947a17..37fb17cdaaf 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8982,13 +8982,14 @@ static bool trans_CSEL(DisasContext *s, arg_CSEL *a)
     }
 
     /* In this insn input reg fields of 0b1111 mean "zero", not "PC" */
+    zero = tcg_constant_i32(0);
     if (a->rn == 15) {
-        rn = tcg_const_i32(0);
+        rn = zero;
     } else {
         rn = load_reg(s, a->rn);
     }
     if (a->rm == 15) {
-        rm = tcg_const_i32(0);
+        rm = zero;
     } else {
         rm = load_reg(s, a->rm);
     }
@@ -9010,10 +9011,8 @@ static bool trans_CSEL(DisasContext *s, arg_CSEL *a)
     }
 
     arm_test_cc(&c, a->fcond);
-    zero = tcg_const_i32(0);
     tcg_gen_movcond_i32(c.cond, rn, c.value, zero, rn, rm);
     arm_free_cc(&c);
-    tcg_temp_free_i32(zero);
 
     store_reg(s, a->rd, rn);
     tcg_temp_free_i32(rm);
-- 
2.25.1


