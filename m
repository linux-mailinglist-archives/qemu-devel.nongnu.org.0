Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9099114FA5E
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Feb 2020 20:45:31 +0100 (CET)
Received: from localhost ([::1]:49972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixyhu-0007Rr-La
	for lists+qemu-devel@lfdr.de; Sat, 01 Feb 2020 14:45:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58829)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ixySm-0007jM-0k
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 14:29:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ixySk-0006x4-EL
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 14:29:51 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:39031)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ixySk-0006wB-8q
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 14:29:50 -0500
Received: by mail-pl1-x642.google.com with SMTP id g6so4176090plp.6
 for <qemu-devel@nongnu.org>; Sat, 01 Feb 2020 11:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6jzMS+VeQu48tglWZQ9BQ5nKqto6PDtfoSP2XjIUF4U=;
 b=C7tVNXRdzpxxe6uIjEIy4SWZgRtMpiEhroGBvmWIsHPnO5LwvFoFUxzUhkO16xgf6j
 eZeh9ygCl1UjMEn32BeEMOgop2JjBeJ6RcA+jAzACK/rPCLvHjMeTpxSm1XNLnQrn2D/
 gUQB/2BQo+9BSGSlOK+vmT2bym1WAdjy0lDvf5hWgm2/zYPKWmfD9lxLrl/ETHz5DyEm
 yt3a3VdETj/I8GmXq4dj670tPQoLEra18o4GlCJ8O227v+E25m1jCi6cRPALW3EH2jYo
 2A9Dxe3KKVXDv1fRhT9nR+qvNYbJHo0XcT2ZkMCkqgWlrcZwB4YXZ/oIYH81EPfPgPST
 +Ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6jzMS+VeQu48tglWZQ9BQ5nKqto6PDtfoSP2XjIUF4U=;
 b=NPQSXaoHUY2oDH5yXV+bHkhsvWoo4sw6MSH+1aysQuXr6tUJXNis6sB0uRP5Qt/WGr
 AkPS/r/IyXTvNqLoWhQPNfHlW8CVZ+WyqwB8TOnSYOrqmHOHXZO8N8aWv860A0gIQFZE
 +CHV2GzJ6e6n5hkTfCOb3/T3YDfnl1L6aZQZw7SxHaJDgz8WylxSqRyonPOcy6XRYuoT
 Xq2bOTcsuba5BqfbK7XeZ2/LT9jpUUFrOQ5cTVHuSg8l9BHrqQdR73BGhS3iW5FC2pZa
 rPG1Blo3oGVmxR/0wQ26p7usFaOzR4lp6+vq1r7RVRg4Au7mkRggluRN3JoYpYxasqok
 lPgg==
X-Gm-Message-State: APjAAAXCBD5ah6/EK6HlcYRJ+JSH0Ualxi2OgCSGtd5RmjGyovj0R22e
 eLMVS5YRwxwNhuVImCpr70pnljBiSlk=
X-Google-Smtp-Source: APXvYqzt82klEZhvKobG2umKWhhVdIOIPdhk6/DtEIbdyDRwUFdepmjk072UynKw783VDWrHcqELmg==
X-Received: by 2002:a17:90a:fd85:: with SMTP id
 cx5mr19848663pjb.80.1580585388902; 
 Sat, 01 Feb 2020 11:29:48 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id l7sm3668509pga.27.2020.02.01.11.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2020 11:29:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 26/41] target/arm: Update timer access for VHE
Date: Sat,  1 Feb 2020 11:29:01 -0800
Message-Id: <20200201192916.31796-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200201192916.31796-1-richard.henderson@linaro.org>
References: <20200201192916.31796-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 102 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 81 insertions(+), 21 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 996865a3a2..992ab2a15f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2324,10 +2324,18 @@ static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri,
      * Writable only at the highest implemented exception level.
      */
     int el = arm_current_el(env);
+    uint64_t hcr;
+    uint32_t cntkctl;
 
     switch (el) {
     case 0:
-        if (!extract32(env->cp15.c14_cntkctl, 0, 2)) {
+        hcr = arm_hcr_el2_eff(env);
+        if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+            cntkctl = env->cp15.cnthctl_el2;
+        } else {
+            cntkctl = env->cp15.c14_cntkctl;
+        }
+        if (!extract32(cntkctl, 0, 2)) {
             return CP_ACCESS_TRAP;
         }
         break;
@@ -2355,17 +2363,47 @@ static CPAccessResult gt_counter_access(CPUARMState *env, int timeridx,
 {
     unsigned int cur_el = arm_current_el(env);
     bool secure = arm_is_secure(env);
+    uint64_t hcr = arm_hcr_el2_eff(env);
 
-    /* CNT[PV]CT: not visible from PL0 if ELO[PV]CTEN is zero */
-    if (cur_el == 0 &&
-        !extract32(env->cp15.c14_cntkctl, timeridx, 1)) {
-        return CP_ACCESS_TRAP;
-    }
+    switch (cur_el) {
+    case 0:
+        /* If HCR_EL2.<E2H,TGE> == '11': check CNTHCTL_EL2.EL0[PV]CTEN. */
+        if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+            return (extract32(env->cp15.cnthctl_el2, timeridx, 1)
+                    ? CP_ACCESS_OK : CP_ACCESS_TRAP_EL2);
+        }
 
-    if (arm_feature(env, ARM_FEATURE_EL2) &&
-        timeridx == GTIMER_PHYS && !secure && cur_el < 2 &&
-        !extract32(env->cp15.cnthctl_el2, 0, 1)) {
-        return CP_ACCESS_TRAP_EL2;
+        /* CNT[PV]CT: not visible from PL0 if EL0[PV]CTEN is zero */
+        if (!extract32(env->cp15.c14_cntkctl, timeridx, 1)) {
+            return CP_ACCESS_TRAP;
+        }
+
+        /* If HCR_EL2.<E2H,TGE> == '10': check CNTHCTL_EL2.EL1PCTEN. */
+        if (hcr & HCR_E2H) {
+            if (timeridx == GTIMER_PHYS &&
+                !extract32(env->cp15.cnthctl_el2, 10, 1)) {
+                return CP_ACCESS_TRAP_EL2;
+            }
+        } else {
+            /* If HCR_EL2.<E2H> == 0: check CNTHCTL_EL2.EL1PCEN. */
+            if (arm_feature(env, ARM_FEATURE_EL2) &&
+                timeridx == GTIMER_PHYS && !secure &&
+                !extract32(env->cp15.cnthctl_el2, 1, 1)) {
+                return CP_ACCESS_TRAP_EL2;
+            }
+        }
+        break;
+
+    case 1:
+        /* Check CNTHCTL_EL2.EL1PCTEN, which changes location based on E2H. */
+        if (arm_feature(env, ARM_FEATURE_EL2) &&
+            timeridx == GTIMER_PHYS && !secure &&
+            (hcr & HCR_E2H
+             ? !extract32(env->cp15.cnthctl_el2, 10, 1)
+             : !extract32(env->cp15.cnthctl_el2, 0, 1))) {
+            return CP_ACCESS_TRAP_EL2;
+        }
+        break;
     }
     return CP_ACCESS_OK;
 }
@@ -2375,19 +2413,41 @@ static CPAccessResult gt_timer_access(CPUARMState *env, int timeridx,
 {
     unsigned int cur_el = arm_current_el(env);
     bool secure = arm_is_secure(env);
+    uint64_t hcr = arm_hcr_el2_eff(env);
 
-    /* CNT[PV]_CVAL, CNT[PV]_CTL, CNT[PV]_TVAL: not visible from PL0 if
-     * EL0[PV]TEN is zero.
-     */
-    if (cur_el == 0 &&
-        !extract32(env->cp15.c14_cntkctl, 9 - timeridx, 1)) {
-        return CP_ACCESS_TRAP;
-    }
+    switch (cur_el) {
+    case 0:
+        if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+            /* If HCR_EL2.<E2H,TGE> == '11': check CNTHCTL_EL2.EL0[PV]TEN. */
+            return (extract32(env->cp15.cnthctl_el2, 9 - timeridx, 1)
+                    ? CP_ACCESS_OK : CP_ACCESS_TRAP_EL2);
+        }
 
-    if (arm_feature(env, ARM_FEATURE_EL2) &&
-        timeridx == GTIMER_PHYS && !secure && cur_el < 2 &&
-        !extract32(env->cp15.cnthctl_el2, 1, 1)) {
-        return CP_ACCESS_TRAP_EL2;
+        /*
+         * CNT[PV]_CVAL, CNT[PV]_CTL, CNT[PV]_TVAL: not visible from
+         * EL0 if EL0[PV]TEN is zero.
+         */
+        if (!extract32(env->cp15.c14_cntkctl, 9 - timeridx, 1)) {
+            return CP_ACCESS_TRAP;
+        }
+        /* fall through */
+
+    case 1:
+        if (arm_feature(env, ARM_FEATURE_EL2) &&
+            timeridx == GTIMER_PHYS && !secure) {
+            if (hcr & HCR_E2H) {
+                /* If HCR_EL2.<E2H,TGE> == '10': check CNTHCTL_EL2.EL1PTEN. */
+                if (!extract32(env->cp15.cnthctl_el2, 11, 1)) {
+                    return CP_ACCESS_TRAP_EL2;
+                }
+            } else {
+                /* If HCR_EL2.<E2H> == 0: check CNTHCTL_EL2.EL1PCEN. */
+                if (!extract32(env->cp15.cnthctl_el2, 1, 1)) {
+                    return CP_ACCESS_TRAP_EL2;
+                }
+            }
+        }
+        break;
     }
     return CP_ACCESS_OK;
 }
-- 
2.20.1


