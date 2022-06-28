Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA09155BE6C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:19:47 +0200 (CEST)
Received: from localhost ([::1]:47630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63da-0004ii-Ta
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kO-0002nJ-Hz
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:45 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kK-0003vZ-Th
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:42 -0400
Received: by mail-pf1-x433.google.com with SMTP id x4so10915804pfq.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=asVIVIoowKUhkyzxDq1stWKniA6O4cXXCtHWZbtFt2Q=;
 b=Ao/eB+e5FFFqh27hPkQrx/LIlq2Ca6tVIwX7ae33mY84ib+/BsB1Xqe4wcLVr6DjE2
 fSJwZBkjhjr29nzvBbhGKerDEOkRX8QO3QEOviE+kIsLn2X3pORH6L2COpe9PRn60KNf
 Ivqc1ZTSj9pGnpNNiqOHWckSddaKyvAVSI4lGxlRpY2Arg/I/AkEtOYFlYLWB7NxmUHZ
 frucMkKKqpHodFrQ9ePW57H3x8wGEOr8EGpbF7NSkNbvUtFLXL+JDBis4Zl3d5Mjgh0o
 puyeOFOTvqY7iq+5iMKe3PHMLXY6GxFPGtTNpP6ne1+U3eCzThTxvI1OaztodgumU0vM
 M9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=asVIVIoowKUhkyzxDq1stWKniA6O4cXXCtHWZbtFt2Q=;
 b=NvWBdaUh3I0Lk2KIfbrsnVWspOtb6fMO6n6j9jrWo311Sa58Umiy099X+ulWu/6Nxl
 8cLzaG61//g49VJx6oIC2cEFXasOowXwoe9O07RPeWmoFWgRKW23yBvi6A4iC1X4ZtbQ
 npJ4btcn47pNyds4KQx3ZRjIAcS20u3zXR+W8n6k2nxu1akpRql25dXpxgJdp5trhBS0
 cdwBKXnB2XT6oWHK0UKltqAF7u/zRJjlGMLnKcsL4vl3hRVDnqCJh2/uEiXsyD70jH1e
 4iFBb2q0IwggwiRU2MoeLOJVC3Ww04IPwWgM1hHoFGE5rK1FZpOA0HN6JRyGC0vAwRl8
 Qlbw==
X-Gm-Message-State: AJIora+YkJPWJTCzGhfrLDwctYhBpGY0Bf/HIqAM7u41KGB3u2VtSxpc
 vTI8iM1NnS2+YNxUavUPDytuLvJZFHpgEQ==
X-Google-Smtp-Source: AGRyM1tafMU8PaLVUf8kM2QudlO1Y6YK9Ti+lQtut2tr9Khc2d1XFnKexofIvPp14bBMpHoR2f9Wlg==
X-Received: by 2002:aa7:90c4:0:b0:521:2cd6:bd3e with SMTP id
 k4-20020aa790c4000000b005212cd6bd3emr2659317pfk.19.1656390159201; 
 Mon, 27 Jun 2022 21:22:39 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 32/45] target/arm: Enable SME for -cpu max
Date: Tue, 28 Jun 2022 09:51:04 +0530
Message-Id: <20220628042117.368549-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

Note that SME remains effectively disabled for user-only,
because we do not yet set CPACR_EL1.SMEN.  This needs to
wait until the kernel ABI is implemented.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst |  4 ++++
 target/arm/cpu64.c            | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 83b4410065..8e494c8bea 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -65,6 +65,10 @@ the following architecture extensions:
 - FEAT_SHA512 (Advanced SIMD SHA512 instructions)
 - FEAT_SM3 (Advanced SIMD SM3 instructions)
 - FEAT_SM4 (Advanced SIMD SM4 instructions)
+- FEAT_SME (Scalable Matrix Extension)
+- FEAT_SME_FA64 (Full A64 instruction set in Streaming SVE mode)
+- FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
+- FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SPECRES (Speculation restriction instructions)
 - FEAT_SSBS (Speculative Store Bypass Safe)
 - FEAT_TLBIOS (TLB invalidate instructions in Outer Shareable domain)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 19188d6cc2..40a0f043d0 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1018,6 +1018,7 @@ static void aarch64_max_initfn(Object *obj)
      */
     t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
     t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 + FEAT_DoubleFault */
+    t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr1 = t;
 
@@ -1068,6 +1069,16 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
+    t = cpu->isar.id_aa64smfr0;
+    t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, B16F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, F16F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, I8I32, 0xf);  /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, F64F64, 1);   /* FEAT_SME_F64F64 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, I16I64, 0xf); /* FEAT_SME_I16I64 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
+    cpu->isar.id_aa64smfr0 = t;
+
     /* Replicate the same data to the 32-bit id registers.  */
     aa32_max_features(cpu);
 
-- 
2.34.1


