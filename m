Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FDB435F6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 14:36:52 +0200 (CEST)
Received: from localhost ([::1]:39430 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbOyK-0003WO-3z
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 08:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58775)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbOcx-0007tk-HY
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:14:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbOcu-0003wy-B0
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:14:47 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39408)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbOcr-0003tS-DB
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 08:14:41 -0400
Received: by mail-wr1-x443.google.com with SMTP id x4so17872241wrt.6
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 05:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FgrJRA7j7aTJ3DWKdfLXQg9RBsbyTXhKrH5Enhs39X4=;
 b=mo6vMRnX3ZrwUK7W+GWxyPfZUPDHrhoAbLvdB199iH+Xt2Q+QkRNiGo9aZ1ifX/SQW
 3Nw/Yxb7lVSchyLOW7nI6RIhRE3RWy6rmOtdR3SDS6Uz7xUKOobBg+IhY/2ALLBoMSFy
 5vScqnSoOf9ndo639W6Yved1gARN5PANXXd73KrcanxIYOWajgS35AVZM6s1tVcKC+jk
 B5nKS5PSBwE1TneM4TBaQwzxORX+3BE8Xl/xKqf0xVxicjbMIpAr8+J2LiLE9WJzVMoi
 WtTe6xfKZKss6icO3EX8Mn2DvAWd0Ze9GFibtr/k4cR/AxCxLMRukO4IVBY5kAw9WDqY
 P6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FgrJRA7j7aTJ3DWKdfLXQg9RBsbyTXhKrH5Enhs39X4=;
 b=oVy1e6Wmvftw9Ch8QulPJnV31CkehUezGEzydDUa2OUJlK/+kfGUxMbyJT8MBj6QZE
 q82mATgehoFIZvBDb3cnA7XLeXW0KD0C3twbFUXDUErvqULZw0Pb/isRhUd85nF7InBM
 m7el1vAyVbfRPXlioqAXOQVnL/KMYARE3XwcIkIXytnbc1dTR8oIJvL2OaF7x+pV9OmF
 day+7pAF7CLemw9T5DXJ+OrxidRIYc4/8NcLo8lhgeLbFE81FrvIlG4hX//UZ5ctwJEB
 CozsqLV6VNtXE3NUjM3MZ6sqmWmZIgPWvj6+qEBlkKFwzhTFIxj6DTYN/SCF5jBSNwyK
 WUXg==
X-Gm-Message-State: APjAAAX7TrvxiP10b0Uf6/Ay0RGJ/40WRM3ijCXv890wSoGuzct8Jucf
 PgLaiNe8lW6Ug1j7Ym/s+Jmk+Al0UMlJ5g==
X-Google-Smtp-Source: APXvYqxRAhKHKi4j9t8SYU/WfhWIHiM1CV1bo2uRQMCU/poPbqnKk/6djKPpl/KdLO2VwjZbX3Q6QQ==
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr46597951wrn.31.1560428079139; 
 Thu, 13 Jun 2019 05:14:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y6sm2010576wrp.12.2019.06.13.05.14.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 05:14:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 13:13:48 +0100
Message-Id: <20190613121433.5246-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613121433.5246-1-peter.maydell@linaro.org>
References: <20190613121433.5246-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PULL 03/48] target/arm: Implement NSACR gating of
 floating point
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

The NSACR register allows secure code to configure the FPU
to be inaccessible to non-secure code. If the NSACR.CP10
bit is set then:
 * NS accesses to the FPU trap as UNDEF (ie to NS EL1 or EL2)
 * CPACR.{CP10,CP11} behave as if RAZ/WI
 * HCPTR.{TCP11,TCP10} behave as if RAO/WI

Note that we do not implement the NSACR.NSASEDIS bit which
gates only access to Advanced SIMD, in the same way that
we don't implement the equivalent CPACR.ASEDIS and HCPTR.TASE.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20190510110357.18825-1-peter.maydell@linaro.org
---
 target/arm/helper.c | 75 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 188fb1950ef..df4276f5f6c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -930,9 +930,36 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         value &= mask;
     }
+
+    /*
+     * For A-profile AArch32 EL3 (but not M-profile secure mode), if NSACR.CP10
+     * is 0 then CPACR.{CP11,CP10} ignore writes and read as 0b00.
+     */
+    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
+        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
+        value &= ~(0xf << 20);
+        value |= env->cp15.cpacr_el1 & (0xf << 20);
+    }
+
     env->cp15.cpacr_el1 = value;
 }
 
+static uint64_t cpacr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /*
+     * For A-profile AArch32 EL3 (but not M-profile secure mode), if NSACR.CP10
+     * is 0 then CPACR.{CP11,CP10} ignore writes and read as 0b00.
+     */
+    uint64_t value = env->cp15.cpacr_el1;
+
+    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
+        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
+        value &= ~(0xf << 20);
+    }
+    return value;
+}
+
+
 static void cpacr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     /* Call cpacr_write() so that we reset with the correct RAO bits set
@@ -998,7 +1025,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
     { .name = "CPACR", .state = ARM_CP_STATE_BOTH, .opc0 = 3,
       .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 2, .accessfn = cpacr_access,
       .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.cpacr_el1),
-      .resetfn = cpacr_reset, .writefn = cpacr_write },
+      .resetfn = cpacr_reset, .writefn = cpacr_write, .readfn = cpacr_read },
     REGINFO_SENTINEL
 };
 
@@ -4683,6 +4710,36 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
     return ret;
 }
 
+static void cptr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    /*
+     * For A-profile AArch32 EL3, if NSACR.CP10
+     * is 0 then HCPTR.{TCP11,TCP10} ignore writes and read as 1.
+     */
+    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
+        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
+        value &= ~(0x3 << 10);
+        value |= env->cp15.cptr_el[2] & (0x3 << 10);
+    }
+    env->cp15.cptr_el[2] = value;
+}
+
+static uint64_t cptr_el2_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /*
+     * For A-profile AArch32 EL3, if NSACR.CP10
+     * is 0 then HCPTR.{TCP11,TCP10} ignore writes and read as 1.
+     */
+    uint64_t value = env->cp15.cptr_el[2];
+
+    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
+        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
+        value |= 0x3 << 10;
+    }
+    return value;
+}
+
 static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "HCR_EL2", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_IO,
@@ -4730,7 +4787,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "CPTR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 2,
       .access = PL2_RW, .accessfn = cptr_access, .resetvalue = 0,
-      .fieldoffset = offsetof(CPUARMState, cp15.cptr_el[2]) },
+      .fieldoffset = offsetof(CPUARMState, cp15.cptr_el[2]),
+      .readfn = cptr_el2_read, .writefn = cptr_el2_write },
     { .name = "MAIR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 10, .crm = 2, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.mair_el[2]),
@@ -13587,6 +13645,19 @@ int fp_exception_el(CPUARMState *env, int cur_el)
         break;
     }
 
+    /*
+     * The NSACR allows A-profile AArch32 EL3 and M-profile secure mode
+     * to control non-secure access to the FPU. It doesn't have any
+     * effect if EL3 is AArch64 or if EL3 doesn't exist at all.
+     */
+    if ((arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
+         cur_el <= 2 && !arm_is_secure_below_el3(env))) {
+        if (!extract32(env->cp15.nsacr, 10, 1)) {
+            /* FP insns act as UNDEF */
+            return cur_el == 2 ? 2 : 1;
+        }
+    }
+
     /* For the CPTR registers we don't need to guard with an ARM_FEATURE
      * check because zero bits in the registers mean "don't trap".
      */
-- 
2.20.1


