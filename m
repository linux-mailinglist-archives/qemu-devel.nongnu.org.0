Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B513544946
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:39:48 +0200 (CEST)
Received: from localhost ([::1]:51772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFZr-0005M2-7q
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7J-0001Yd-9E
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:18 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7B-00062j-TP
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:13 -0400
Received: by mail-wr1-x431.google.com with SMTP id o8so3625311wro.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TD1PLdCagSw5QrlgIXtULFKaHs2aOf+o891C3P6EsSQ=;
 b=j0TKzAGApZF0gBczopLtY9dfGeA9G24MSE6bd8q5WZ9INxwNEVAHb5ZlHlb2uZSqHj
 xW1dEkkQxA+Pjpn70kE4930ySQsmj784eZdX+9zKcXbkdX/J+oCGP9yJh0Jb+45U5TTd
 WdhYRBxT3V4ciMpAf6zssDYCn7jV/+D9RgMISVu/oEMzucugWVu5h/Ky5/0WneE2jTrW
 W/cuOa38nylOvpZomInaEHjnRMisNcMmEnj8K/uaOavJjm+n8y2neZesFlE5owAEICKM
 LBEXaSGXb1MDMxfHiTT0ljY951MvQ5suLAYj2wdHM72wWc64YfjbpRy6Ti+xu3To5MUG
 uiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TD1PLdCagSw5QrlgIXtULFKaHs2aOf+o891C3P6EsSQ=;
 b=jpTvf9PzjDHsdzThD/XiMOZpdDeiulno3TZE1H4C6MRG+NQizpEY+4eL3FGwefpK+g
 Rxij+Btq+NKaD4UcSjDwATUjZbvgwT+EPfCeVvUqQeEeDAJ62AvYL8PLh7JbrnG1noGe
 PRaEs6JWBtQId042Dpq35AjM4Z2OFg46cTH5rKMqM7VN6wWAy1kIh5UshSNRCVk+Bd+H
 q81MD0DIwBK7BkEv5LtA0BxUdGDrDZGn+HSTCMj/P31tEI7KfBZgJrdH+MON+tQmM0L1
 OGuuXm+hRRpCQ4l+wfBtaeufAAwNT9LAkw8jvlWwp1/ZGr2LBU31N8QVr1tmS4eNL8rX
 4E3w==
X-Gm-Message-State: AOAM530srhmuhIoHuvzbt5NCdmqvyIbeQ+XJhW277+KOubwL7wjBSitY
 y9TxyUhnUWD+UPLOPpwuNK/7TEE8hUR5yA==
X-Google-Smtp-Source: ABdhPJzj4MHZ7o4UXRvrpqkecPR3Ke0NOSNGXPltfsNXBCCK3wx8a8hrNuaO2+DRUkhkZIyv81fwGg==
X-Received: by 2002:a05:6000:184f:b0:218:555e:6b69 with SMTP id
 c15-20020a056000184f00b00218555e6b69mr11528701wri.562.1654765562794; 
 Thu, 09 Jun 2022 02:06:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/55] target/arm: Move get_level1_table_address to ptw.c
Date: Thu,  9 Jun 2022 10:05:02 +0100
Message-Id: <20220609090537.1971756-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Message-id: 20220604040607.269301-14-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |  4 ++--
 target/arm/helper.c | 26 +-------------------------
 target/arm/ptw.c    | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 6c47a575991..dd6fb93f336 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -18,11 +18,11 @@ uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
 
 bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx);
 bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx);
+uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn);
+
 ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
                                  ARMCacheAttrs s1, ARMCacheAttrs s2);
 
-bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
-                              uint32_t *table, uint32_t address);
 int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
                   int ap, int domain_prot);
 int simple_ap_to_rw_prot_is_user(int ap, bool is_user);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d2ef12346b6..a144cb26413 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10482,8 +10482,7 @@ static inline bool regime_translation_big_endian(CPUARMState *env,
 }
 
 /* Return the TTBR associated with this translation regime */
-static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
-                                   int ttbrn)
+uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
 {
     if (mmu_idx == ARMMMUIdx_Stage2) {
         return env->cp15.vttbr_el2;
@@ -10774,29 +10773,6 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     return prot_rw | PAGE_EXEC;
 }
 
-bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
-                              uint32_t *table, uint32_t address)
-{
-    /* Note that we can only get here for an AArch32 PL0/PL1 lookup */
-    TCR *tcr = regime_tcr(env, mmu_idx);
-
-    if (address & tcr->mask) {
-        if (tcr->raw_tcr & TTBCR_PD1) {
-            /* Translation table walk disabled for TTBR1 */
-            return false;
-        }
-        *table = regime_ttbr(env, mmu_idx, 1) & 0xffffc000;
-    } else {
-        if (tcr->raw_tcr & TTBCR_PD0) {
-            /* Translation table walk disabled for TTBR0 */
-            return false;
-        }
-        *table = regime_ttbr(env, mmu_idx, 0) & tcr->base_mask;
-    }
-    *table |= (address >> 18) & 0x3ffc;
-    return true;
-}
-
 static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
 {
     /*
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 32ba2e5e8bf..5737a3976b8 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -15,6 +15,29 @@
 #include "ptw.h"
 
 
+static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
+                                     uint32_t *table, uint32_t address)
+{
+    /* Note that we can only get here for an AArch32 PL0/PL1 lookup */
+    TCR *tcr = regime_tcr(env, mmu_idx);
+
+    if (address & tcr->mask) {
+        if (tcr->raw_tcr & TTBCR_PD1) {
+            /* Translation table walk disabled for TTBR1 */
+            return false;
+        }
+        *table = regime_ttbr(env, mmu_idx, 1) & 0xffffc000;
+    } else {
+        if (tcr->raw_tcr & TTBCR_PD0) {
+            /* Translation table walk disabled for TTBR0 */
+            return false;
+        }
+        *table = regime_ttbr(env, mmu_idx, 0) & tcr->base_mask;
+    }
+    *table |= (address >> 18) & 0x3ffc;
+    return true;
+}
+
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
                              hwaddr *phys_ptr, int *prot,
-- 
2.25.1


