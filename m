Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624C76EBE9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 23:06:02 +0200 (CEST)
Received: from localhost ([::1]:48204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoa4n-00041P-1i
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 17:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55111)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hoa3V-0007qM-Lc
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 17:04:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hoa3R-0005Vi-9X
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 17:04:41 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45769)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hoa3R-00058m-0e
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 17:04:37 -0400
Received: by mail-pl1-x642.google.com with SMTP id y8so16176378plr.12
 for <qemu-devel@nongnu.org>; Fri, 19 Jul 2019 14:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ONlRo+aGNPiboAPXE/iCxOa/p0BidbUC71A8LKcDA68=;
 b=uMqw9/aa/EwMrjfcb/ASPxNGkGHr4lJ237lWd4dM9TWhWdL/R8yKE/c7VybWZebALR
 wZLGm+IGmyT+R+0bqMw/7kafNY0uhLKxnb3Vwpj0zSKoFWIOj4yi4GkycCtpZKRILGWU
 Hik7SdVHxyJIktYlQnZHra8bJ499lQ+ObOAJ2I+X8x7R5EGaGvCedVlC6NUhn5uVN1MN
 eXPUf/9Ec10oFvQCL+KTWZ9ymx4fagYX9Agk9xb0pRN/sGIQWcIowa0hsAq07YEV2NLT
 G0duiUd7yZC+0WtZboaJs4YpCeYTuwyMX7pAqoFL5cZ3jN4nILTLGO9s/t1gU5j0SGBm
 60pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ONlRo+aGNPiboAPXE/iCxOa/p0BidbUC71A8LKcDA68=;
 b=rvJ9WEL6xEiFGEM3yQX/p13aE0vVQ9aamL74zMr8obUiIHHZVbv4Vf88GTq4bg8ted
 ZFvDQtgBSqZvHW1K/DiJK/2B3R9eh0Cn2vbnTsjwgTMzyJxElwuPDNG3ghC7CBSJSrZO
 Eqyb74FtoYzXsIxx5SdYkFjelyUZ7Ve3Pg2YkfI19Hw/+gbhDhlCW2fewPBFm6pPQm7E
 8lV+mQ1PHTCRHUtgT4FtGoaiLv6ELKeEaMb4JofmGNA7FcKSGleQlNXXIqLN4lmctysL
 9RGI73h3n+oPW0Y0KTuymdiiBmR9zwCXYekARYn5CRwSIRexyZtfDIHqyTuaYS9x/Opf
 MR8A==
X-Gm-Message-State: APjAAAVxcu6LN8rDISm0c2lsK91rhVS6YZDO2SEbm3VMV7Nh8ys1BFjH
 Gquhywcm1jI0C0Wrrj2mcDCveEVLTZc=
X-Google-Smtp-Source: APXvYqxsLiICronbIwG0r0AxnpIc0VlbrI4ft5vjpkizAPy2VODaJj3x2IGocu3HkfR041l6Jd3W7A==
X-Received: by 2002:a17:902:e6:: with SMTP id
 a93mr58939964pla.175.1563570220312; 
 Fri, 19 Jul 2019 14:03:40 -0700 (PDT)
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net.
 [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id i6sm32724751pgi.40.2019.07.19.14.03.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 14:03:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 19 Jul 2019 14:03:12 -0700
Message-Id: <20190719210326.15466-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190719210326.15466-1-richard.henderson@linaro.org>
References: <20190719210326.15466-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-devel] [PATCH for-4.2 10/24] target/arm: Update CNTVCT_EL0
 for VHE
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
Cc: peter.maydell@linaro.org, beata.michalska@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virtual offset may be 0 depending on EL, E2H and TGE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 40 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index da2e0627b2..3124d682a2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2484,9 +2484,31 @@ static uint64_t gt_cnt_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return gt_get_countervalue(env);
 }
 
+static uint64_t gt_virt_cnt_offset(CPUARMState *env)
+{
+    uint64_t hcr;
+
+    switch (arm_current_el(env)) {
+    case 2:
+        hcr = arm_hcr_el2_eff(env);
+        if (hcr & HCR_E2H) {
+            return 0;
+        }
+        break;
+    case 0:
+        hcr = arm_hcr_el2_eff(env);
+        if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+            return 0;
+        }
+        break;
+    }
+
+    return env->cp15.cntvoff_el2;
+}
+
 static uint64_t gt_virt_cnt_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    return gt_get_countervalue(env) - env->cp15.cntvoff_el2;
+    return gt_get_countervalue(env) - gt_virt_cnt_offset(env);
 }
 
 static void gt_cval_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -2501,7 +2523,13 @@ static void gt_cval_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static uint64_t gt_tval_read(CPUARMState *env, const ARMCPRegInfo *ri,
                              int timeridx)
 {
-    uint64_t offset = timeridx == GTIMER_VIRT ? env->cp15.cntvoff_el2 : 0;
+    uint64_t offset = 0;
+
+    switch (timeridx) {
+    case GTIMER_VIRT:
+        offset = gt_virt_cnt_offset(env);
+        break;
+    }
 
     return (uint32_t)(env->cp15.c14_timer[timeridx].cval -
                       (gt_get_countervalue(env) - offset));
@@ -2511,7 +2539,13 @@ static void gt_tval_write(CPUARMState *env, const ARMCPRegInfo *ri,
                           int timeridx,
                           uint64_t value)
 {
-    uint64_t offset = timeridx == GTIMER_VIRT ? env->cp15.cntvoff_el2 : 0;
+    uint64_t offset = 0;
+
+    switch (timeridx) {
+    case GTIMER_VIRT:
+        offset = gt_virt_cnt_offset(env);
+        break;
+    }
 
     trace_arm_gt_tval_write(timeridx, value);
     env->cp15.c14_timer[timeridx].cval = gt_get_countervalue(env) - offset +
-- 
2.17.1


