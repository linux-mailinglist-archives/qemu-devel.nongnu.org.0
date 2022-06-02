Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A993953C0E3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:43:56 +0200 (CEST)
Received: from localhost ([::1]:34224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtXn-0001eS-PA
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskL-0001eP-NY
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:49 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:44680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskI-0000wF-KO
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:48 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so5876427pjb.3
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mFVh//BfUxyaXH4iD2Urka1nyqKt2dpPAkCKhfkhOyw=;
 b=WQa2vu1wcLEcs2BIUcuyvhiVHdgDF3ulolTu9+CzNxXIynp2w3lLsvgS1HOsGrwtEc
 L8c9L/6NCoQYQPKOiOOyKYbHi4/qRBON/ibGFFCjAHE5QJGcvDvayYjIWstqjlC99T5c
 SnNUHwbr1LQOHJH+TqBbqlm86/eZg2epavfWYIuj0KsRwXMy3qDPAx2bdihs9wJuoAiN
 klWyla4q6I2JSFjOGMua7aomJ5sWKg0V6kVDO+GUoroHe57m7PZSiBSHCUnQDdYrxIvg
 DCNd2umrbnFZeSIt8Q8/caG1FmiWn1uP+QYLRYe4ySWhFuTnipQfco41Qo5LMUN9hIv2
 SC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mFVh//BfUxyaXH4iD2Urka1nyqKt2dpPAkCKhfkhOyw=;
 b=I4W1lIC9mraeCsa3GrcRWs5j8VLUz79TuQpyLbUWN2aYt5TVSvgUQWjEYNBrV+HS7A
 BhO0jsktk4G3G4ee3CIVNqdwWeD3Tz3DBxsv5ImRFFgafebUEL7pAgKpiibjSPm/dpz+
 CBTX4CABo4F/jxbIThuUmrzcNxqC9+ctUa7yzoaEPP0eTO5ffHJpTrK+TUD+jZTPGMaf
 LNmHpAn8iBj9kCGScLBr9iwM33wmLKM9E0JPo2wCbWnvhts+gyms4F/r/jUWgbUE9oet
 YwchrZhTL9GL1fwAERyogfWV7nvbhmwyT0Cd+RKE3Jd4KQDAwRADlHJiWTLoLwePhjOB
 VqOA==
X-Gm-Message-State: AOAM532ELBCi+kPEQYjmY4vqJ/LDL0aORdo/bu2GGqi4u18WFehacmOM
 0cmxEqUr6eFugm8KI02wgTwEt1cxE2CXdw==
X-Google-Smtp-Source: ABdhPJxd/ucThABlh+YAaWP/5Csy+crNZzM742XzFefhGa+LFW/r26BExoGeKmtSHwrKqfdElOkPXQ==
X-Received: by 2002:a17:903:25c1:b0:164:1517:e8c3 with SMTP id
 jc1-20020a17090325c100b001641517e8c3mr7143204plb.116.1654206765246; 
 Thu, 02 Jun 2022 14:52:45 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 58/71] target/arm: Enable SME for -cpu max
Date: Thu,  2 Jun 2022 14:48:40 -0700
Message-Id: <20220602214853.496211-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst |  4 ++++
 target/arm/cpu64.c            | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 49cc3e8340..834289cb8e 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -63,6 +63,10 @@ the following architecture extensions:
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
index aaf2c243d6..d77522e278 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1017,6 +1017,7 @@ static void aarch64_max_initfn(Object *obj)
      * we do for EL2 with the virtualization=on property.
      */
     t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
+    t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr1 = t;
 
@@ -1067,6 +1068,16 @@ static void aarch64_max_initfn(Object *obj)
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


