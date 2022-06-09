Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464545449B9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 13:07:19 +0200 (CEST)
Received: from localhost ([::1]:58384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzG0T-0005tC-Vj
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 07:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7O-0001Z1-DS
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:21 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7K-000640-NK
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:18 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h5so31518518wrb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OuhXk6TQyBrgWjcan+zAuS1lnzgYNbegbZMrB1RwcE0=;
 b=w2vhU9JBzTbWDw98pfYdxQSWlbErFUebQSWz9iiLuQ3NDfXmJ49hhN63seyjgdEjsx
 G84r55Pe5sUQ+b2TkRu9/m/vAtu0XfCr7EmORUKufRu31WNLLgvE8gpdNbqARb+lqSEw
 nit7AaiVRoF2HHqFSczbRSY/qjg4GxbraHgdiJKC7kS868dC/Fi4Xnm6SF4xF0vLBr67
 XpIqYMFb738A7814FHw+AnGB5EdCnD2D4BHfDJ9NeRiaF7JgOq1iyBYQFzO0c6auk6aJ
 FX3TfsCy0nzJHlrRldqgu0uEYHBA/LZFuAE/kRpWhcCYrPKvJ+elU7Gg7m58TFF2fyB5
 dnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OuhXk6TQyBrgWjcan+zAuS1lnzgYNbegbZMrB1RwcE0=;
 b=bHypYM4ad4WPLQqr0pOYT5kPTFA9WKifYxAIBCBDcHy3IDWUpBX3KDltOcKwUU6L8F
 js31KwFfbGJ3X9O47+YOUdSE4DmBQImCiF/opjHpXikOHW2JmrANJiqdcNNyauz5fNqi
 XKU6jGFSNdUgW0XSfwRFP8lzpsdZ+zCcsppPTR3dIJsauXOKTFuTlYlwFhjeWLnkGWFc
 7S+0Lb9nNTCPXfpNC3vEIzuXu6hcSAwPf3D7EHJrRBdtnfM1dLrghNnSdNXJer6xWccO
 WpXi+9egpfUfjGks6jRy2aIutzxwSrw0StQpsISWLFaX5HXNcjVR9R4qxsjqZp5P+Qeb
 klKg==
X-Gm-Message-State: AOAM533wkTds1aMaKZOof50rduSXHl7j6xNHB8ohkuuQlsRA83p+GlXJ
 WMrb9+4RcK4BML1RJWTXjbmwLDp012QEJA==
X-Google-Smtp-Source: ABdhPJyhEOuS04JQ1/4eyPC8SK0KAxeaGRIRUagQgeDsxrGZQAz9ez3sIiwbDO5x/Hh0vkeiu9yZ0w==
X-Received: by 2002:a05:6000:1888:b0:218:3fab:c510 with SMTP id
 a8-20020a056000188800b002183fabc510mr19870503wri.473.1654765573417; 
 Thu, 09 Jun 2022 02:06:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/55] target/arm: Move regime_is_user to ptw.c
Date: Thu,  9 Jun 2022 10:05:12 +0100
Message-Id: <20220609090537.1971756-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Message-id: 20220604040607.269301-24-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |  1 -
 target/arm/helper.c | 24 ------------------------
 target/arm/ptw.c    | 22 ++++++++++++++++++++++
 3 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 85ad5767944..3d3061a4351 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -11,7 +11,6 @@
 
 #ifndef CONFIG_USER_ONLY
 
-bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx);
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
 uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e894afcb491..8deb0fa94c1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10515,30 +10515,6 @@ ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-#ifndef CONFIG_USER_ONLY
-bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_SE10_0:
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_Stage1_SE0:
-    case ARMMMUIdx_MUser:
-    case ARMMMUIdx_MSUser:
-    case ARMMMUIdx_MUserNegPri:
-    case ARMMMUIdx_MSUserNegPri:
-        return true;
-    default:
-        return false;
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-        g_assert_not_reached();
-    }
-}
-#endif /* !CONFIG_USER_ONLY */
-
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9ab77c39980..8db4b5edf1a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -53,6 +53,28 @@ static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
     return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
 }
 
+static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_SE10_0:
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_SE20_0:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_SE0:
+    case ARMMMUIdx_MUser:
+    case ARMMMUIdx_MSUser:
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MSUserNegPri:
+        return true;
+    default:
+        return false;
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+        g_assert_not_reached();
+    }
+}
+
 static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
 {
     /*
-- 
2.25.1


