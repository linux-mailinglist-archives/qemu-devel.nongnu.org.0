Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9501F17AAEE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 17:52:15 +0100 (CET)
Received: from localhost ([::1]:52928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9tjK-0003UZ-Lt
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 11:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59240)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9tP7-0003UR-NA
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9tP6-0002Ik-Ee
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:21 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33724)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9tP6-0002Hw-7t
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:20 -0500
Received: by mail-wr1-x443.google.com with SMTP id x7so7821770wrr.0
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 08:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NFX4grdK7w+WKiMmZVSRsIqgwMx/D40LsR4lowSjx90=;
 b=VXpisTyWDwzKNQfaLDE3js9GFYi5ve+XisvQF7gNpmMioLoT1hoGAxxG7bkq1B+kk/
 XmQ41G42W0/Td9TGwfSD9KA5lR/20sz4dsdB8M1jfhgqaCgAJ3CwowAlpLGDbdSRPv2i
 qf7DnDyAxho+6EyArx/f3a1WAZm9Ldb5costwCCP1r8x7CIbuwrFHbrljCiIK0EEyqQ2
 9TfhLfPJR7N6ZwpdjywRZLqgO4ZT6n65MUDzeDu9eiHwjrlyLxBkQZEdc7O0OdKFdkVj
 aAyOPygE7TKpwttpm/FiBQm4lQ4TQKnfJUybN2AGfJZznK8CBr8dc6e2RvSXuGwYX9Bx
 VrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NFX4grdK7w+WKiMmZVSRsIqgwMx/D40LsR4lowSjx90=;
 b=HIEjKaWib3tL3qABu8ZjaW231ufVJMZP+lzbT0OjnWfrJGbl85biH5gXpi3gU8SLnK
 /USfgPRjH9nV2nad1FpRefByhpTmiBKcl96WBKult8o+8HLCBUBhvqoQ0OwhGzruPwPA
 NteqEYmoh3wXJzl24Ikte+5P7uNchoVfgyFIe2RtYnIzTKsoX2ihJdRYW1RHFfwWv76b
 Xct2hFg/9t2GVm8lHlAsBj572hKHSpgiADvpwlfVQgG3KY/7+kiAHfVkrbtUvGKZ+Fd2
 MFRuILEEYp9j0f37za6jX6R8gMxYfJTpW4a9ObS6oOgx/1HLJaooo3URbPQr8RHxkXpJ
 au/Q==
X-Gm-Message-State: ANhLgQ2BLy0hYBnPsEgwDF58Tjb9AQHg5RjKfXEuv2spYSGossK5FJTm
 rpP6bKmPoRinXX9A57K2O/z0DIk/yY9fhg==
X-Google-Smtp-Source: ADFU+vtHXZJyxuiPPM248NGfc5c3JIUcew3Cq8vbd6FahCicgq7EnV7RIFPwG27s5OYyBVWR9ZKUNQ==
X-Received: by 2002:adf:eccd:: with SMTP id s13mr10598329wro.278.1583425878824; 
 Thu, 05 Mar 2020 08:31:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w22sm10310729wmk.34.2020.03.05.08.31.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 08:31:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/37] target/arm: Improve masking of HCR/HCR2 RES0 bits
Date: Thu,  5 Mar 2020 16:30:38 +0000
Message-Id: <20200305163100.22912-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305163100.22912-1-peter.maydell@linaro.org>
References: <20200305163100.22912-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Don't merely start with v8.0, handle v7VE as well.  Ensure that writes
from aarch32 mode do not change bits in the other half of the register.
Protect reads of aa64 id registers with ARM_FEATURE_AARCH64.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200229012811.24129-2-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4eaf7333c7b..19a8be84938 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5086,11 +5086,15 @@ static const ARMCPRegInfo el3_no_el2_v8_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
-static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
+static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
 {
     ARMCPU *cpu = env_archcpu(env);
-    /* Begin with bits defined in base ARMv8.0.  */
-    uint64_t valid_mask = MAKE_64BIT_MASK(0, 34);
+
+    if (arm_feature(env, ARM_FEATURE_V8)) {
+        valid_mask |= MAKE_64BIT_MASK(0, 34);  /* ARMv8.0 */
+    } else {
+        valid_mask |= MAKE_64BIT_MASK(0, 28);  /* ARMv7VE */
+    }
 
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         valid_mask &= ~HCR_HCD;
@@ -5104,14 +5108,17 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
          */
         valid_mask &= ~HCR_TSC;
     }
-    if (cpu_isar_feature(aa64_vh, cpu)) {
-        valid_mask |= HCR_E2H;
-    }
-    if (cpu_isar_feature(aa64_lor, cpu)) {
-        valid_mask |= HCR_TLOR;
-    }
-    if (cpu_isar_feature(aa64_pauth, cpu)) {
-        valid_mask |= HCR_API | HCR_APK;
+
+    if (arm_feature(env, ARM_FEATURE_AARCH64)) {
+        if (cpu_isar_feature(aa64_vh, cpu)) {
+            valid_mask |= HCR_E2H;
+        }
+        if (cpu_isar_feature(aa64_lor, cpu)) {
+            valid_mask |= HCR_TLOR;
+        }
+        if (cpu_isar_feature(aa64_pauth, cpu)) {
+            valid_mask |= HCR_API | HCR_APK;
+        }
     }
 
     /* Clear RES0 bits.  */
@@ -5143,12 +5150,17 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     arm_cpu_update_vfiq(cpu);
 }
 
+static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
+{
+    do_hcr_write(env, value, 0);
+}
+
 static void hcr_writehigh(CPUARMState *env, const ARMCPRegInfo *ri,
                           uint64_t value)
 {
     /* Handle HCR2 write, i.e. write to high half of HCR_EL2 */
     value = deposit64(env->cp15.hcr_el2, 32, 32, value);
-    hcr_write(env, NULL, value);
+    do_hcr_write(env, value, MAKE_64BIT_MASK(0, 32));
 }
 
 static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -5156,7 +5168,7 @@ static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     /* Handle HCR write, i.e. write to low half of HCR_EL2 */
     value = deposit64(env->cp15.hcr_el2, 0, 32, value);
-    hcr_write(env, NULL, value);
+    do_hcr_write(env, value, MAKE_64BIT_MASK(32, 32));
 }
 
 /*
-- 
2.20.1


