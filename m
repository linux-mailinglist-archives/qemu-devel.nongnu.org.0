Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF5B53D52F
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:17:57 +0200 (CEST)
Received: from localhost ([::1]:39506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxLEa-0008Bm-Jj
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3O-0007mW-Ba
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:22 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3M-00006R-14
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:21 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so13499671pjl.4
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CLpDKm/Mr+ImE4VlqPmzYYKgYIlmztKlFv2bSQEVDKk=;
 b=n0jdkkYIBnOFhx7edV9so0HoaCEvJftfX4BhQ4CpEkhnfHoWqX1nibIjS5r++tfOog
 UKv2eUYh23durCqFAzsWQZIpOM3BvpNj72YEJJBJVkS82eU/tHuBdqM/igTYFqPJoSFO
 fgGBVQI5tnlLDfBT9BMBxMcq64fgpJnUaYbSM8ISaefeKFM+B7+Bm7G8jnP6HSAVxzzl
 oN8BiKc8fVrhjGOoJuKrYVZXvn7WXMYKVIMo4JOADVtKaayix3bhKFzzb+Z5d+6VBDl0
 DKR8sB/Loxdt6tvfT0G9Wn74Gjso64MEb/lGOCkQ1jDrzkBjkfR4AeFKdjsKCJL1J5Md
 /TTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CLpDKm/Mr+ImE4VlqPmzYYKgYIlmztKlFv2bSQEVDKk=;
 b=0p80f7Ue9Z5a7NQn8kRUy9+lT20ulVVVnevvcSWV+Z2Ie9uQPVTNXzLv0EFNvZ4oQp
 ruH35k3aKKqk1AqNQQyRQIe4YybIThTQ0bBeGY4oc0k1bXI5WVQe076w2nLTtrhH+dI9
 PHBf/9PhSgwsXqvWESv83zYW8IohtjF9/XdtkCWEkGnipZpaCCtPqIlirnhvqf3ncyzq
 VamflB1O6qgG9e3Fa3QwyB+ptq2kIOmoSTeLdJPp6nFUzMxzvZCoEOdbobY1LHhloJJp
 jSV/o7p/S9XpY8JvgVLJsf1KAUDOkNrkF+Rp4mBj8V8837iyZo+0GRdBWK3MV1zgh+XY
 xEAQ==
X-Gm-Message-State: AOAM5302q2KVKPFgP2x26CMOljw85cV0CgcE+chrj+KCTnwpJR/UwrFN
 96Y34fU9KzIRyZ73PlAeXu8l0pGS5G6Dkw==
X-Google-Smtp-Source: ABdhPJxp8MOoeG9HFM+FFPW60UmJIXO49yrAxzocsYpM5tj4K0anpqF+Z5sK8rSAxbHCZHFhRqMW4w==
X-Received: by 2002:a17:902:7005:b0:163:ffe7:32eb with SMTP id
 y5-20020a170902700500b00163ffe732ebmr13257599plk.18.1654315578692; 
 Fri, 03 Jun 2022 21:06:18 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/28] target/arm: Move pmsav7_use_background_region to ptw.c
Date: Fri,  3 Jun 2022 21:05:49 -0700
Message-Id: <20220604040607.269301-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |  2 --
 target/arm/helper.c | 19 -------------------
 target/arm/ptw.c    | 21 +++++++++++++++++++++
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 8d2e239714..d2d2711908 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -36,8 +36,6 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 bool m_is_ppb_region(CPUARMState *env, uint32_t address);
 bool m_is_system_region(CPUARMState *env, uint32_t address);
 
-bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool is_user);
-
 bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                         MMUAccessType access_type, ARMMMUIdx mmu_idx,
                         bool s1_is_el0,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a8186ac138..a2a5dab969 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11642,25 +11642,6 @@ do_fault:
     return true;
 }
 
-bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool is_user)
-{
-    /* Return true if we should use the default memory map as a
-     * "background" region if there are no hits against any MPU regions.
-     */
-    CPUARMState *env = &cpu->env;
-
-    if (is_user) {
-        return false;
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        return env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)]
-            & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
-    } else {
-        return regime_sctlr(env, mmu_idx) & SCTLR_BR;
-    }
-}
-
 bool m_is_ppb_region(CPUARMState *env, uint32_t address)
 {
     /* True if address is in the M profile PPB region 0xe0000000 - 0xe00fffff */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 989e783cce..b82638b5a0 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -415,6 +415,27 @@ static void get_phys_addr_pmsav7_default(CPUARMState *env, ARMMMUIdx mmu_idx,
     }
 }
 
+static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
+                                         bool is_user)
+{
+    /*
+     * Return true if we should use the default memory map as a
+     * "background" region if there are no hits against any MPU regions.
+     */
+    CPUARMState *env = &cpu->env;
+
+    if (is_user) {
+        return false;
+    }
+
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)]
+            & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
+    } else {
+        return regime_sctlr(env, mmu_idx) & SCTLR_BR;
+    }
+}
+
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                  hwaddr *phys_ptr, int *prot,
-- 
2.34.1


