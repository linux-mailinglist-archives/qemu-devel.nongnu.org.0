Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE37360956A
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Oct 2022 20:16:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omfRD-0002t3-Kv
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 14:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1omd2U-00061K-DL
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:37:27 -0400
Received: from mail-out-3.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1omd2S-0006L3-Br
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:37:26 -0400
X-IPAS-Result: =?us-ascii?q?A2AUBAAhREVj/5sagoZaHQEBAQEJARIBBQUBQIFPhH6ET?=
 =?us-ascii?q?pEYnxMLAQEBAQEBAQEBCAFCBAEBhQECAgKEdSY4EwECBAEBAQEDAgMBAQEBA?=
 =?us-ascii?q?QEDAQEGAQEBAQEBBgSBHIUvRoZDAgEDIwQLAUYQHQMFAiYCAkkOBg4Fgn2DI?=
 =?us-ascii?q?a0UfzOBAYRwiXEJAYEHLIhRgiuFNIJQglGBN3WEYTCDCoJmBJIiUYdGHDgDC?=
 =?us-ascii?q?QMHBSwdQAMLHw0WNRgDFAMFIQcDGQ8jDQ0EHQwDAwUlAwICGwcCAgMCBhMFA?=
 =?us-ascii?q?gI1GDQIBAgEKyQPBQIHLwUELwIeBAUGEQgCFgIGBAQEBBUCEAgCCCYXBxMzG?=
 =?us-ascii?q?QEFMicOCSEcDhoNBQYTAyBvBQc7DygvaSsdGweBDCooFQMEBAMCBhMDIAINK?=
 =?us-ascii?q?TEUBCkTDy0HKXEJAgMiZQUDAwQoLAMJQAcoJDwHWDoFAwIQIjwGAwkDAiQTR?=
 =?us-ascii?q?nQwEhQFAw0XJggFNxsECDwCBQZSEwIKEgMSDy1JD0o+OxcInFiBD4F7wxAHg?=
 =?us-ascii?q?huhakyWdAKSFi2RMoUyox6EKAIEAgQFAhaBeIF+cYM2URcCD5xyczsCBgEKA?=
 =?us-ascii?q?QEDCYsKAQE?=
IronPort-Data: A9a23:LQp5MKNqrgzcpPHvrR36lsFynXyQoLVcMsEvi/4bfWQNrUp312QOz
 mMeDT2Hb/jZNGWmc413boqx9RgHv5CBzodrHHM5pCpnJ55oRWspJvzEdBuqb3PKRiHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYx6TSCK17L6
 I6aT/H3Ygf/gWcsaztMscpvlTs21BjMkGJA1rABTa0T1LPuvyF9JI4SI6i3M0z5TuF8dgJtb
 7+epF0R1jqxEyYFUrtJoJ6iGqE5auK60Ty1t5Zjc/PKbi5q+3ZuiPZrbJLwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSMIUekIIrL0RTvuTCwE39d2PT6slrCUMWNKoT+eNFLD1Ro
 KlwxDAlNnhvhsqM/46bZ9kpvZ5mBo/xI58f/3hsiz3UZRokacmYH+OTvocehml2350TdRrdT
 5NxhT5HcBPKYhRUfE0QBZI7keOAnGbjc3hRoVmVqKxx72W7IAlZieewbIGMJoXbLSlTth6av
 VqFzXTHOTYxON+h9Qe/rCmggNaayEsXX6pXTtVU7MVCmVCW2ykfBQMbUXO9pv+2jFP4XMhQQ
 2QM9zYjt+43/V2nQ935dxm5pneeuVgbQdU4LgEhwBuS1qrZ80OCXC0OCCRedNxjvcNwSTFCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:Zd1V9aF1UHR9qEuApLqE0ceALOsnbusQ8zAXPidKOHtom62j5q
 STdZEgvnXJYVkqNU3I5urwXpVoLUmyyXcN2/hyAV7AZniChILLFuFfBOLZqlXd8kvFmNK1vp
 0AT0ERMrHN5CBB/KXHCQCDYq8d/OU=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.95,176,1661810400"; d="scan'208";a="175431419"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-3.itc.rwth-aachen.de with ESMTP; 23 Oct 2022 17:37:12 +0200
Received: from localhost.localdomain (2a02:908:1088:5920:10a7:3a65:7c9d:55ef)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Sun, 23 Oct 2022 17:37:12 +0200
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v4 4/7] target/arm: Enable TTBCR_EAE for ARMv8-R AArch32
Date: Sun, 23 Oct 2022 17:36:56 +0200
Message-ID: <20221023153659.121138-5-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
References: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:10a7:3a65:7c9d:55ef]
X-ClientProxiedBy: rwthex-s4-b.rwth-ad.de (2a00:8a60:1:e500::26:165) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:48;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-3.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

ARMv8-R AArch32 CPUs behave as if TTBCR.EAE is always 1 even
tough they don't have the TTBCR register.
See ARM Architecture Reference Manual Supplement - ARMv8, for the ARMv8-R
AArch32 architecture profile Version:A.c section C1.2.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/debug_helper.c | 3 +++
 target/arm/internals.h    | 4 ++++
 target/arm/tlb_helper.c   | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index c21739242c..73665f988b 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -437,6 +437,9 @@ static uint32_t arm_debug_exception_fsr(CPUARMState *env)
 
     if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
         using_lpae = true;
+    } else if (arm_feature(env, ARM_FEATURE_PMSA)
+            && arm_feature(env, ARM_FEATURE_V8)) {
+        using_lpae = true;
     } else {
         if (arm_feature(env, ARM_FEATURE_LPAE) &&
             (env->cp15.tcr_el[target_el] & TTBCR_EAE)) {
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 307a596505..e3699421b0 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -253,6 +253,10 @@ unsigned int arm_pamax(ARMCPU *cpu);
 static inline bool extended_addresses_enabled(CPUARMState *env)
 {
     uint64_t tcr = env->cp15.tcr_el[arm_is_secure(env) ? 3 : 1];
+    if (arm_feature(env, ARM_FEATURE_PMSA)
+     && arm_feature(env, ARM_FEATURE_V8)) {
+        return true;
+    }
     return arm_el_is_aa64(env, 1) ||
            (arm_feature(env, ARM_FEATURE_LPAE) && (tcr & TTBCR_EAE));
 }
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index ad225b1cb2..a2047b0bc6 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -18,6 +18,9 @@ bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
     int el = regime_el(env, mmu_idx);
     if (el == 2 || arm_el_is_aa64(env, el)) {
         return true;
+    } else if (arm_feature(env, ARM_FEATURE_PMSA)
+            && arm_feature(env, ARM_FEATURE_V8)) {
+        return true;
     }
     if (arm_feature(env, ARM_FEATURE_LPAE)
         && (regime_tcr(env, mmu_idx) & TTBCR_EAE)) {
-- 
2.34.1


