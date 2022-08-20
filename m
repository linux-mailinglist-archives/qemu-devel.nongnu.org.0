Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A839B59AEB4
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 16:37:40 +0200 (CEST)
Received: from localhost ([::1]:32864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPPbX-000337-6N
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 10:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPK7-0005DP-GF
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:39 -0400
Received: from mail-out-2a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:45]:12696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPK2-0003lu-I3
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:39 -0400
X-IPAS-Result: =?us-ascii?q?A2B5AAD06wBj/5sagoZaHQEBAQEJARIBBQUBQIE9BgELA?=
 =?us-ascii?q?YR9hE6RD4ETm3CBfAsBAQEBAQEBAQEIAUIEAQGFAwICAoRiJjYHDgECBAEBA?=
 =?us-ascii?q?QEDAgMBAQEBAQEDAQEGAQEBAQEBBgSBHIUvRoZDAgEDIwQLAUYQHQMFAiYCA?=
 =?us-ascii?q?kkOBg4Fgn2DI6kZfzKBAYRwhRIJAYEHLAGID4IahSuCUIEVgnN1hGEwgwmCZ?=
 =?us-ascii?q?QSWKIMmHDgDCQQHBSweQgMLHw4WBQgJFxIQEAIEERoLBgMWPgkCBA4DQAgNA?=
 =?us-ascii?q?xEEAw8YCRIIEAQGAzEMJQsDFAwBBgMGBQMBAxsDFAMFJAcDGQ8jDQ0EHwwDA?=
 =?us-ascii?q?wUlAwICGwcCAgMCBhUGAgI2GDkIBAgEKyMPBQIHLwUELwIeBAUGEQgCFgIGB?=
 =?us-ascii?q?AQEBBUCEAgCCCcXBxMzGQEFMicQCSEcDhoQBQYTAyBvBQc+DygzNTkrHRsKg?=
 =?us-ascii?q?RIqKRUDBAQDAgYTAwMiAhAuMQMVBikTEi0HK3UJAgMiaQUDAwQoLAMJPgcJI?=
 =?us-ascii?q?iY9BQVbOgUDAxAiPQYDCQMCKRUnmw2BD4F7wlgHghahSUyDdpJ7ApIBLZEph?=
 =?us-ascii?q?TGCSqBFhCcCBAIEBQIWgWgIggZxgzZRFwIPnHJzOwIGAQoBAQMJilwBAQ?=
IronPort-Data: A9a23:6JRsZKNMMCPHRZrvrR0XlcFynXyQoLVcMsEvi/4bfWQNrUoigjJWn
 WEWDG7SbK6IMWvwLt9+bIvgpEsH7JKDzNBjG3M5pCpnJ55oRWspJvzEdBuqb3PKRiHnZBg6h
 ynLQoCYdKjYdleF+lH1dOGJQUBUjclkfJKlYAL/En03FFQMpBsJ00o5wbZp2NYw27BVPivU0
 T/Mi5yHULOa82MsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3ecldG0DFrrx8RYZWc
 c6elu3jrjOBl/saIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0o2HKJ0VKtZt9mGt+5b5
 thOkdufcgo4MqbXqvpFeDJcNBgraMWq+JefSZS+mfas823rQz7XmbBESlspIY1d8+oxDWwmG
 f4wcWtRKEnY36TsnvTiF7QEascLdaEHOKsDvXthxCqfF/ErQZXOR43Q+sNYmT45jcBDG7DSa
 qL1bBI2PUqaPEEXZj/7DroXhN+Di1D6egdjrVzEipM0wnKMlxBYhe2F3N39P4biqd9utl+Vo
 3+D82nnDxUyMtuZxjyYtHW2iYfnhS7nVZhUEbSp+vNuhHWXx2oaEhpQUkG0ycRVkWakRM5fJ
 lxR4XBrp+4o61CrC9DxGRG1yJKZgiMhtxNrO7VSwGmwJmD8um512kBsouZ9VeEb
IronPort-HdrOrdr: A9a23:RwWX9q/HhPxjVN8fecduk+DmI+orL9Y04lQ7vn2ZKCY1TiX8ra
 vFoB11726WtN98YhwdcKm7Sc+9qBDnm6Kdg7N8AV7KZmCPhIPDRLsSlLcKqAeOJ8SRzI5gPa
 sJSdkdNDX8ZWIK6voT6mGDYrMdKNbuytHNudvj
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.93,251,1654552800"; d="scan'208";a="19627404"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-2a.itc.rwth-aachen.de with ESMTP; 20 Aug 2022 16:19:27 +0200
Received: from localhost.localdomain (2a02:908:1088:5920:e70b:29db:1db5:28bf)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Sat, 20 Aug 2022 16:19:27 +0200
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v3 6/9] target/arm: Enable TTBCR_EAE for ARMv8-R AArch32
Date: Sat, 20 Aug 2022 16:19:11 +0200
Message-ID: <20220820141914.217399-7-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
References: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:e70b:29db:1db5:28bf]
X-ClientProxiedBy: rwthex-w4-b.rwth-ad.de (2a00:8a60:1:e500::26:167) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:45;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-2a.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

ARMv8-R AArch32 CPUs behave as if TTBCR.EAE is always 1 even
tough they don't have the TTBCR register.
See ARM Architecture Reference Manual Supplement - ARMv8, for the ARMv8-R
AArch32 architecture profile Version:A.c section C1.2.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/debug_helper.c | 3 ++-
 target/arm/internals.h    | 3 ++-
 target/arm/tlb_helper.c   | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index b18a6bd3a2..44b1e32974 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -434,7 +434,8 @@ static uint32_t arm_debug_exception_fsr(CPUARMState *env)
         using_lpae = true;
     } else {
         if (arm_feature(env, ARM_FEATURE_LPAE) &&
-            (env->cp15.tcr_el[target_el].raw_tcr & TTBCR_EAE)) {
+            ((env->cp15.tcr_el[target_el].raw_tcr & TTBCR_EAE)
+            || arm_feature(env, ARM_FEATURE_V8_R))) {
             using_lpae = true;
         }
     }
diff --git a/target/arm/internals.h b/target/arm/internals.h
index b03049d920..e2a2b03d41 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -254,7 +254,8 @@ static inline bool extended_addresses_enabled(CPUARMState *env)
 {
     TCR *tcr = &env->cp15.tcr_el[arm_is_secure(env) ? 3 : 1];
     return arm_el_is_aa64(env, 1) ||
-           (arm_feature(env, ARM_FEATURE_LPAE) && (tcr->raw_tcr & TTBCR_EAE));
+           (arm_feature(env, ARM_FEATURE_LPAE) && ((tcr->raw_tcr & TTBCR_EAE)
+           || arm_feature(env, ARM_FEATURE_V8_R)));
 }
 
 /* Update a QEMU watchpoint based on the information the guest has set in the
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 7d8a86b3c4..891326edb8 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -20,7 +20,8 @@ bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
         return true;
     }
     if (arm_feature(env, ARM_FEATURE_LPAE)
-        && (regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)) {
+        && ((regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)
+        || arm_feature(env, ARM_FEATURE_V8_R))) {
         return true;
     }
     return false;
-- 
2.25.1


