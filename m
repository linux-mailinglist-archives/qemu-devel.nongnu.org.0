Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BEC15F29F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 19:19:32 +0100 (CET)
Received: from localhost ([::1]:43550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2fYp-0001Ni-Br
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 13:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60779)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j2fVL-0004Gp-2T
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 13:15:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j2fVJ-0008W5-Te
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 13:15:54 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:54489)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j2fVJ-0008VZ-Mv
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 13:15:53 -0500
Received: by mail-pj1-x1043.google.com with SMTP id dw13so4186236pjb.4
 for <qemu-devel@nongnu.org>; Fri, 14 Feb 2020 10:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5fLn0UXMjSHE5U0IwLqHf4IaIEWWE0KQrcA+POHthnY=;
 b=do1S7mngwHwsUTsAmswxZIjWpSdFYZnLCYR1NddDX+iS1/Gw+R31l747vG8/0z7ORB
 IEajb831aH8oM3BStDZawaBfh9s8jYBzxWVfQ1qEqNrrQyxpNANIWHcFJuL9izQpaHAi
 Wew71zSPptaqJuawcYh9Oi4NpZ+9Y2bY09cGHQzyPM/5ilGYWDZQ2+D/xQ9KF+EiaCli
 1MGfjVyOEjHrFY6Ru+vnZfmUctubMIEVgNwjXyCaRuG/WRXuWeLyiRuwLpafwJ9IsfLe
 Z7rTnHQnt4lofiG5POoPUS2SKzZ2iXdOk7oUZf29ZdQH7ej/XxfOqs3eR0mSbrdnI8Hh
 RhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5fLn0UXMjSHE5U0IwLqHf4IaIEWWE0KQrcA+POHthnY=;
 b=nzaQXBDLE9Uj8AyEiXzpil6kKUrGXtNTZxYuBBxzgoK0IbYeV/2UgC/52IAHMt9lO5
 zK65ApjMcS4Ug59Tb+/JOjP88IIbtpiD2erkv2jTwlNFSqbljf5jAm7KTEwS++JNDHtf
 LT3z1rVViWFmFKeYzKHQMCmCjCrMVXz7aec9QwaBJyupeQeQfxIRl1EHxgZoKmaR8b8y
 XOEvOZt4UNQKQiZn1xnfT8Ld44+n14gn02mEDSuCpixSdoGQce6eB5frM/pRNOY9fGvl
 HcwgoiTE9/CQ1dcEWQ7F5r3X45EU8ggfmCzOU7t/hbkpwKy8EBMubDf8cuFFV8B3hcJC
 eo3A==
X-Gm-Message-State: APjAAAUDtLrxa+CSs+w0kS/4OAccIgJ1EbkVeT0NoAAqL23kz4nxL3N0
 ZecrfBTwlsgZgZuP5T4mdF3PT5nfXsE=
X-Google-Smtp-Source: APXvYqwLbc8YXcfB7C15m9rsmQ0pDfhW0V+dK+DrGBl8c9b00IZ1txzhMUYWR4Vt7zuH32WJjp6gyA==
X-Received: by 2002:a17:902:8f94:: with SMTP id
 z20mr4695199plo.62.1581704152332; 
 Fri, 14 Feb 2020 10:15:52 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id i3sm7525123pfg.94.2020.02.14.10.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 10:15:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/19] target/arm: Use isar_feature_aa32_simd_r32 more places
Date: Fri, 14 Feb 2020 10:15:31 -0800
Message-Id: <20200214181547.21408-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214181547.21408-1-richard.henderson@linaro.org>
References: <20200214181547.21408-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Many uses of ARM_FEATURE_VFP3 are testing for the number of simd
registers implemented.  Use the proper test vs MVCR0.SIMDReg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c       |  9 ++++-----
 target/arm/helper.c    | 13 ++++++-------
 target/arm/translate.c |  2 +-
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index de733aceeb..f0bd419dd8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1009,11 +1009,10 @@ static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
     if (flags & CPU_DUMP_FPU) {
         int numvfpregs = 0;
-        if (arm_feature(env, ARM_FEATURE_VFP)) {
-            numvfpregs += 16;
-        }
-        if (arm_feature(env, ARM_FEATURE_VFP3)) {
-            numvfpregs += 16;
+        if (cpu_isar_feature(aa32_simd_r32, cpu)) {
+            numvfpregs = 32;
+        } else if (arm_feature(env, ARM_FEATURE_VFP)) {
+            numvfpregs = 16;
         }
         for (i = 0; i < numvfpregs; i++) {
             uint64_t v = *aa32_vfp_dreg(env, i);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 366dbcf460..0eeedc3c18 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -49,10 +49,10 @@ static void switch_mode(CPUARMState *env, int mode);
 
 static int vfp_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
 {
-    int nregs;
+    ARMCPU *cpu = env_archcpu(env);
+    int nregs = cpu_isar_feature(aa32_simd_r32, cpu) ? 32 : 16;
 
     /* VFP data registers are always little-endian.  */
-    nregs = arm_feature(env, ARM_FEATURE_VFP3) ? 32 : 16;
     if (reg < nregs) {
         stq_le_p(buf, *aa32_vfp_dreg(env, reg));
         return 8;
@@ -77,9 +77,9 @@ static int vfp_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
 
 static int vfp_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
 {
-    int nregs;
+    ARMCPU *cpu = env_archcpu(env);
+    int nregs = cpu_isar_feature(aa32_simd_r32, cpu) ? 32 : 16;
 
-    nregs = arm_feature(env, ARM_FEATURE_VFP3) ? 32 : 16;
     if (reg < nregs) {
         *aa32_vfp_dreg(env, reg) = ldq_le_p(buf);
         return 8;
@@ -905,8 +905,7 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
             /* VFPv3 and upwards with NEON implement 32 double precision
              * registers (D0-D31).
              */
-            if (!arm_feature(env, ARM_FEATURE_NEON) ||
-                    !arm_feature(env, ARM_FEATURE_VFP3)) {
+            if (!cpu_isar_feature(aa32_simd_r32, env_archcpu(env))) {
                 /* D32DIS [30] is RAO/WI if D16-31 are not implemented. */
                 value |= (1 << 30);
             }
@@ -7755,7 +7754,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
     } else if (arm_feature(env, ARM_FEATURE_NEON)) {
         gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
                                  51, "arm-neon.xml", 0);
-    } else if (arm_feature(env, ARM_FEATURE_VFP3)) {
+    } else if (cpu_isar_feature(aa32_simd_r32, cpu)) {
         gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_reg,
                                  35, "arm-vfp3.xml", 0);
     } else if (arm_feature(env, ARM_FEATURE_VFP)) {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 20f89ace2f..3b9bf13933 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2612,7 +2612,7 @@ static int disas_dsp_insn(DisasContext *s, uint32_t insn)
 #define VFP_SREG(insn, bigbit, smallbit) \
   ((VFP_REG_SHR(insn, bigbit - 1) & 0x1e) | (((insn) >> (smallbit)) & 1))
 #define VFP_DREG(reg, insn, bigbit, smallbit) do { \
-    if (arm_dc_feature(s, ARM_FEATURE_VFP3)) { \
+    if (dc_isar_feature(aa32_simd_r32, s)) { \
         reg = (((insn) >> (bigbit)) & 0x0f) \
               | (((insn) >> ((smallbit) - 4)) & 0x10); \
     } else { \
-- 
2.20.1


