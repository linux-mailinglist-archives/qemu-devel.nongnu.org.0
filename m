Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C712364413B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 11:27:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2V9Q-0007Lt-6l; Tue, 06 Dec 2022 05:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2V9A-0007FW-M5
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:26:00 -0500
Received: from mail-out-4.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2V98-0002Co-K1
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:25:56 -0500
X-IPAS-Result: =?us-ascii?q?A2DqBADNF49j/5sagoZaHgEBCxIMQIZahE6RH58zDwEBA?=
 =?us-ascii?q?QEBAQEBAQgBRAQBAYUBAgIChQ8mOBMBAgQBAQEBAwIDAQEBAQEBAwEBBgEBA?=
 =?us-ascii?q?QEBAQYEgR2FL0aGVgIBAyMECwFGEB0DBQImAgJJDgYOBYJ+gyOtSn8zgQGEc?=
 =?us-ascii?q?ZxNCQGBCiyJCIJOhUKCUIJRgTd1hGEwgwqCZwSBFIkmjFsObhw3AwkDBwUsH?=
 =?us-ascii?q?UADCxgNFjIKEzI1CxFMKxwbB4EMKigVAwQEAwIGEwMgAg0oMRQEKRMNKyZtC?=
 =?us-ascii?q?QIDIWEFAwMEKCwDCUAHJiY8B1Y3BQMCDyA4BgMJAwIfVHQvEhQFAwsVJQgFS?=
 =?us-ascii?q?QQINwUGUxICChESDyxFDkg+ORYGJ0EBMA4OEwNdSx2BAQRgOYEVLy6bE4EPg?=
 =?us-ascii?q?XtEwy8Hgh+iDkyWfQKSHS2RWoU5oyqEKAIEAgQFAhaBeYF+cYM2UhcCD5xxd?=
 =?us-ascii?q?DsCBwEKAQEDCYofAQE?=
IronPort-Data: A9a23:VpOouaALTwlrLBVW/3biw5YqxClBgxIJ4kV8jS/XYbTApGsq3zNWy
 zMaXDyBP6yDNGCkeot3bYS+pENQvcLSndA1OVdlrnsFo1CmCCbmLYnDch2gb3v6wunrFh8PA
 xA2M4GYRCwMZiaA4E3ra9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtcAbeORXkXc5
 7sen+WFYAX/gmQsbDpOg06+gEoHUMra6WtwUmMWOKgjUG/2zxE9EJ8ZLKetGHr0KqE88jmSH
 rurIBmRpws1zj91Yj+Xuu+Tnn4iHtY+CTOzZk9+AMBOtDAf/HBogvZjXBYrQRw/Zz2hx7idw
 TjW3HC6YV9B0qbkwIzxX/TEes1zFfUuxVPJHZSwmZS+xXCbdmrM+tpzVkUtGYAGpPprMG4bo
 JT0KBhVBvyCr9iJ/JKWeqxX3IEJatP0IINas30mwTyx4fQOGMufBfyRvZkCgnFp250m8fX2P
 qL1bRJzax7BagYJIFAaCJczmM+ymWX/NjRRo1KYo+w77gA/ySQojuSwYIuLJoXiqcN9pFicr
 CXX/G7AHTobZYfE8RmLyHm+v7qa9c/8cMdIfFGizdZzjViOg2AeFhASfV28p/a/lwi5Qd03A
 1QZ5ic066075UCmSt3VWxy+qWSD+BkGVLJt//YS8h6RyqfEph3DQ2JCVCFdaJkvuIk6SFTGy
 2O0oj8gPhQ32JX9dJ5X3uv8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:s9moo6+uCG7EMTzcNw9uk+DjI+orL9Y04lQ7vn2ZESYlEPBw5P
 re+cjztCWE8Qr5N0tBpTntAsS9qBDnhOZICOsqTNSftWDd0QPCRr2KhrGM/9SUIUzDH5lmu5
 uIHZITNDS6NykfsS+z2njeLz8P+qjgzJyV
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,222,1665439200"; d="scan'208";a="164589641"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-4.itc.rwth-aachen.de with ESMTP; 06 Dec 2022 11:25:31 +0100
Received: from localhost.localdomain (2a02:908:1088:5920:7fc5:a897:a756:e2fb)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Tue, 6 Dec 2022 11:25:31 +0100
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v6 4/7] target/arm: Enable TTBCR_EAE for ARMv8-R AArch32
Date: Tue, 6 Dec 2022 11:25:01 +0100
Message-ID: <20221206102504.165775-5-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
References: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:7fc5:a897:a756:e2fb]
X-ClientProxiedBy: rwthex-s2-a.rwth-ad.de (2a00:8a60:1:e500::26:154) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:49;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-4.itc.rwth-aachen.de
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

ARMv8-R AArch32 CPUs behave as if TTBCR.EAE is always 1 even
tough they don't have the TTBCR register.
See ARM Architecture Reference Manual Supplement - ARMv8, for the ARMv8-R
AArch32 architecture profile Version:A.c section C1.2.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/debug_helper.c | 3 +++
 target/arm/internals.h    | 4 ++++
 target/arm/tlb_helper.c   | 4 ++++
 3 files changed, 11 insertions(+)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index c21739242c..2f6ddc0da5 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -437,6 +437,9 @@ static uint32_t arm_debug_exception_fsr(CPUARMState *env)
 
     if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
         using_lpae = true;
+    } else if (arm_feature(env, ARM_FEATURE_PMSA) &&
+               arm_feature(env, ARM_FEATURE_V8)) {
+        using_lpae = true;
     } else {
         if (arm_feature(env, ARM_FEATURE_LPAE) &&
             (env->cp15.tcr_el[target_el] & TTBCR_EAE)) {
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 161e42d50f..d9555309df 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -257,6 +257,10 @@ unsigned int arm_pamax(ARMCPU *cpu);
 static inline bool extended_addresses_enabled(CPUARMState *env)
 {
     uint64_t tcr = env->cp15.tcr_el[arm_is_secure(env) ? 3 : 1];
+    if (arm_feature(env, ARM_FEATURE_PMSA) &&
+        arm_feature(env, ARM_FEATURE_V8)) {
+        return true;
+    }
     return arm_el_is_aa64(env, 1) ||
            (arm_feature(env, ARM_FEATURE_LPAE) && (tcr & TTBCR_EAE));
 }
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 0f4f4fc809..60abcbebe6 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -19,6 +19,10 @@ bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
     if (el == 2 || arm_el_is_aa64(env, el)) {
         return true;
     }
+    if (arm_feature(env, ARM_FEATURE_PMSA) &&
+        arm_feature(env, ARM_FEATURE_V8)) {
+        return true;
+    }
     if (arm_feature(env, ARM_FEATURE_LPAE)
         && (regime_tcr(env, mmu_idx) & TTBCR_EAE)) {
         return true;
-- 
2.34.1


