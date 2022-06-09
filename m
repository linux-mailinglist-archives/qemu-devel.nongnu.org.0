Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E32544975
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:49:26 +0200 (CEST)
Received: from localhost ([::1]:40874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFjB-0000ef-5S
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7O-0001Z2-Gg
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:21 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7L-0005v7-GR
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:18 -0400
Received: by mail-wr1-x429.google.com with SMTP id u8so27137454wrm.13
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vssipGCOqEJQNoMsGfFwc+dxYekNW1L8kP+aFic/gt8=;
 b=NCooA6v8ACoFTIlVaviEsHeZ6x5CwA1abm6IcfTfPLbyUY/rehr6+Mky2geKX2bbTL
 Sw3hrEvPORH4NQLaBFL1iDIFNZFuBonXypsLlu4mx0EFTfQ7tTQsoC7pIhKf10dHUnCa
 B1cKJYA9+BFPewG6hJc6/y6qIMS7yk7b8i3ZPKKuDDJQm2y/fs+ZvoGkyQp21d8BtFFU
 swyH8niWKdIw9pw5KtmQWB4ID3RCfNXijL8qA7QCO5X77GAijPjw8MFHVrglHkVgrstn
 R1dXFAOcPNuR/BWlTg1KqtuNsBE4llG0rxWaVMh4aTK+SQCWE0t3wfD+F7sInfQdmzrv
 xVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vssipGCOqEJQNoMsGfFwc+dxYekNW1L8kP+aFic/gt8=;
 b=1OCg6LVlVBHiH/0Vi7uM77hg8C/gReU0thHvtfxVYG78pK0QNEGvbqEabDPJXatiUP
 Jr3dbtUdRLPq5kJV4B8WWC8rBICBW0zpQnD6D9SJOLz4A/oHYM6VoLOlt2KZC+LtjYFR
 SjYmmZ61Rp21b6EivS9acq34AnZcyJZyUHiMVlQPHeKYE37QJ7EPrl6t9F9fKKv4l0sO
 RL+ogFRqWFNLV2SJA/n9L7O44LjGeD2UEhkCCJNZCZv69f1CDADb0sNWYyPK9/A0zHDW
 5mcxpvMcGR40XM32BZ2zbr0WvqWT23lbUrn1wbPSq/itGa/cHGi1pRQIOza2PT3E3wFb
 sgcw==
X-Gm-Message-State: AOAM533Mzd75FwrMpbU1s58Q5k/Gg8/oPOCQqf7lwWfxG8BclTTKkZpR
 RA7mg1d4ouTFTyJYHnQSwZDsMp2vBJkJMw==
X-Google-Smtp-Source: ABdhPJwCTFtEHZT1Yn1GvjSHBHtkGOzz6GE5+6YxO6sllOUU0zR3BEfZ5iBFh8Zion6TSsJhPCNnhQ==
X-Received: by 2002:a5d:58ed:0:b0:217:dd5:7508 with SMTP id
 f13-20020a5d58ed000000b002170dd57508mr24330176wrd.606.1654765574388; 
 Thu, 09 Jun 2022 02:06:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/55] target/arm: Move regime_ttbr to ptw.c
Date: Thu,  9 Jun 2022 10:05:13 +0100
Message-Id: <20220609090537.1971756-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
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
Message-id: 20220604040607.269301-25-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |  1 -
 target/arm/helper.c | 16 ----------------
 target/arm/ptw.c    | 16 ++++++++++++++++
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 3d3061a4351..ed152ddaf4e 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -12,7 +12,6 @@
 #ifndef CONFIG_USER_ONLY
 
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
-uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn);
 
 #endif /* !CONFIG_USER_ONLY */
 #endif /* TARGET_ARM_PTW_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8deb0fa94c1..fdda87e87e2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10475,22 +10475,6 @@ bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
-/* Return the TTBR associated with this translation regime */
-uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
-{
-    if (mmu_idx == ARMMMUIdx_Stage2) {
-        return env->cp15.vttbr_el2;
-    }
-    if (mmu_idx == ARMMMUIdx_Stage2_S) {
-        return env->cp15.vsttbr_el2;
-    }
-    if (ttbrn == 0) {
-        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
-    } else {
-        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
-    }
-}
-
 /* Convert a possible stage1+2 MMU index into the appropriate
  * stage 1 MMU index
  */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8db4b5edf1a..dc559e6bdfd 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -75,6 +75,22 @@ static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+/* Return the TTBR associated with this translation regime */
+static uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
+{
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        return env->cp15.vttbr_el2;
+    }
+    if (mmu_idx == ARMMMUIdx_Stage2_S) {
+        return env->cp15.vsttbr_el2;
+    }
+    if (ttbrn == 0) {
+        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
+    } else {
+        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
+    }
+}
+
 static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
 {
     /*
-- 
2.25.1


