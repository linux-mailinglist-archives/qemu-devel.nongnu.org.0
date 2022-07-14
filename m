Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C24574F2A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 15:30:50 +0200 (CEST)
Received: from localhost ([::1]:42070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oByvU-0000NB-O1
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 09:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByoA-0002Bx-Vi
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:23:11 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByo8-0004o5-2I
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:23:10 -0400
Received: by mail-wr1-x429.google.com with SMTP id d16so2533436wrv.10
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 06:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gSC4PvbkoAcYZyiRlv4heZM9qLY+Ka++bw/hOuy6a5U=;
 b=XEt+GqKSrAVSLav/UkeFpZhjP6bfLISWGoj9HtNNKS3Msmi4zYcFXvy6R4Q6/2o2ta
 tRR29w77JWHTOHlSOxwS3ALmo8MEbJ7kVHMMUUpRQhX+gAy9p+8r8mQSfNPHUs/qKHV6
 q8k9EJ1RVflq8suv0heHHGbkNrtLKIkV/LL9O/pVlmtAzpGVa0e/+ENMl6AZEvhMG7Cv
 DXj64zvRync7a5/3VRrNg3NYUI4t5QroMvdG7iMNi48ZNVc0AQTCLEZDhX+U1RPUurms
 NR2u76cP/wGx51Jm6HOGBmNQOV3HFq9IgIGYquudSAhj6HTOxFcaJMWoHvvuzUZ4uJie
 RuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gSC4PvbkoAcYZyiRlv4heZM9qLY+Ka++bw/hOuy6a5U=;
 b=UBsGhC+vTOM7EcLIzFqRk0Ie6bQLC898DXaPmrfcYKAlt+S/WAjCZ72G5uRvAXQOVN
 RkUE2hxuKgDINUnFO/uRlgVGdO7nUs1plg5+NjF4vkVApmQRyJLPMbM/C5RAfn9IqiaB
 oFxA3ZE6asI5oDzVanBsvekE1eWqd53+VbcCUS3ADKFTjIrV0857DxEcv1xGqAhlYofV
 UnUIO9RP/FKlr7vGP+8p9yCwJG2sjEzgw7VgSy5cLIU+QpIUe9gpl7i74zasTJckY/lZ
 4WOx+Sp2WU2WE9oISb6jfxydZIlCZT7RbqqZUbq75fZv34QexhUZL2ZAD/TBoQ8r6yip
 QY0A==
X-Gm-Message-State: AJIora9088vXX4qt+MMT06AElFeNCDCufxN8ZY4CpkX1jFgBeFMWdp5o
 XaO2PjEa6rjW/A9oG2PMtK0FYg==
X-Google-Smtp-Source: AGRyM1sOhVVKO388yt4vliISx3sJ82e7O2P1ES3Mi4mfaJ+9Lje+SOtX2eYS+qWa0bLOwcvKXlk43g==
X-Received: by 2002:a05:6000:887:b0:21d:4fca:44fc with SMTP id
 ca7-20020a056000088700b0021d4fca44fcmr8413446wrb.495.1657804986815; 
 Thu, 14 Jul 2022 06:23:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a7bc40b000000b0039c5cecf206sm1925079wmi.4.2022.07.14.06.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 06:23:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PATCH 1/7] target/arm: Define and use new regime_tcr_value() function
Date: Thu, 14 Jul 2022 14:22:57 +0100
Message-Id: <20220714132303.1287193-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714132303.1287193-1-peter.maydell@linaro.org>
References: <20220714132303.1287193-1-peter.maydell@linaro.org>
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

The regime_tcr() function returns a pointer to a struct TCR
corresponding to the TCR controlling a translation regime.  The
struct TCR has the raw value of the register, plus two fields mask
and base_mask which are used as a small optimization in the case of
32-bit short-descriptor lookups.  Almost all callers of regime_tcr()
only want the raw register value.  Define and use a new
regime_tcr_value() function which returns only the raw 64-bit
register value.

This is a preliminary to removing the 32-bit short descriptor
optimization -- it only saves a handful of bit operations, which is
tiny compared to the overhead of doing a page table walk at all, and
the TCR struct is awkward and makes fixing
https://gitlab.com/qemu-project/qemu/-/issues/1103 unnecessarily
difficult.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h  | 6 ++++++
 target/arm/helper.c     | 6 +++---
 target/arm/ptw.c        | 8 ++++----
 target/arm/tlb_helper.c | 2 +-
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 00e2e710f6c..fa046124fa8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -793,6 +793,12 @@ static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
     return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
 }
 
+/* Return the raw value of the TCR controlling this translation regime */
+static inline uint64_t regime_tcr_value(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    return regime_tcr(env, mmu_idx)->raw_tcr;
+}
+
 /**
  * arm_num_brps: Return number of implemented breakpoints.
  * Note that the ID register BRPS field is "number of bps - 1",
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cfcad97ce07..b45c81c714c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4216,7 +4216,7 @@ static int vae1_tlbmask(CPUARMState *env)
 static int tlbbits_for_regime(CPUARMState *env, ARMMMUIdx mmu_idx,
                               uint64_t addr)
 {
-    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
+    uint64_t tcr = regime_tcr_value(env, mmu_idx);
     int tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
     int select = extract64(addr, 55, 1);
 
@@ -10158,7 +10158,7 @@ static int aa64_va_parameter_tcma(uint64_t tcr, ARMMMUIdx mmu_idx)
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
-    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
+    uint64_t tcr = regime_tcr_value(env, mmu_idx);
     bool epd, hpd, using16k, using64k, tsz_oob, ds;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMCPU *cpu = env_archcpu(env);
@@ -10849,7 +10849,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 {
     CPUARMTBFlags flags = {};
     ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
-    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
+    uint64_t tcr = regime_tcr_value(env, mmu_idx);
     uint64_t sctlr;
     int tbii, tbid;
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e71fc1f4293..0d7e8ffa41b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -820,7 +820,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
 static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
                                           ARMMMUIdx mmu_idx)
 {
-    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
+    uint64_t tcr = regime_tcr_value(env, mmu_idx);
     uint32_t el = regime_el(env, mmu_idx);
     int select, tsz;
     bool epd, hpd;
@@ -994,7 +994,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     uint32_t attrs;
     int32_t stride;
     int addrsize, inputsize, outputsize;
-    TCR *tcr = regime_tcr(env, mmu_idx);
+    uint64_t tcr = regime_tcr_value(env, mmu_idx);
     int ap, ns, xn, pxn;
     uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
@@ -1112,8 +1112,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * For stage 2 translations the starting level is specified by the
          * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
          */
-        uint32_t sl0 = extract32(tcr->raw_tcr, 6, 2);
-        uint32_t sl2 = extract64(tcr->raw_tcr, 33, 1);
+        uint32_t sl0 = extract32(tcr, 6, 2);
+        uint32_t sl2 = extract64(tcr, 33, 1);
         uint32_t startlevel;
         bool ok;
 
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 7d8a86b3c45..a2f87a5042d 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -20,7 +20,7 @@ bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
         return true;
     }
     if (arm_feature(env, ARM_FEATURE_LPAE)
-        && (regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)) {
+        && (regime_tcr_value(env, mmu_idx) & TTBCR_EAE)) {
         return true;
     }
     return false;
-- 
2.25.1


