Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EDA609538
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Oct 2022 19:44:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omezj-0003uE-Q4
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 13:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1omd2S-00060G-St
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:37:25 -0400
Received: from mail-out-1a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1omd2N-0006L7-9M
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:37:24 -0400
X-IPAS-Result: =?us-ascii?q?A2DRAgC8Q0Vj/5sagoZaHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?U+EfoROkRUDgROcGIFoCwEBAQEBAQEBAQgBQgQBAYUBAgIChHUmOBMBAgQBA?=
 =?us-ascii?q?QEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEgRyFL0aGQwIBAyMECwFGECAFAiYCA?=
 =?us-ascii?q?lcGDgWCfYMhrRR/M4EBhHCJcQkBgQcsiFGCK4U0glCBFYE8gTd1hCs2gzqCZ?=
 =?us-ascii?q?gSSIlGHRhw4AwkDBwUsHUADCx8NFjUYAxQDBSEHAxkPIw0NBB0MAwMFJQMCA?=
 =?us-ascii?q?hsHAgIDAgYTBQICNRg0CAQIBCskDwUCBy8FBC8CHgQFBhEIAhYCBgQEBAQVA?=
 =?us-ascii?q?hAIAggmFwcTMxkBBTInDgkhHA4aDQUGEwMgbwUHOw8oL2krHRsHgQwqKBUDB?=
 =?us-ascii?q?AQDAgYTAyACDSkxFAQpEw8tBylxCQIDImUFAwMEKCwDCUAHKCQ8B1g6BQMCE?=
 =?us-ascii?q?CI8BgMJAwIkWXQwEhQFAw0XJggFNxsECDwCBQZSEwIKEgMSDy1JD0o+OxcIm?=
 =?us-ascii?q?2ZyexQvE25LfpJJAo5FoQIHghuhakyWdAKSFpcRogaBGIQoAgQCBAUCFoF4g?=
 =?us-ascii?q?X5xgzZRFwIPgRuNERaOMHM7AgYBCgEBAwmLCgEB?=
IronPort-Data: A9a23:Ekt5fqpEgV/9mROkzJu2mShuq9BeBmJEZBIvgKrLsJaIsI4StFCzt
 garIBmBbveNa2vyf4hza4mx8k9T6pSAytFqTFQ6pC0yEy5G8OPIVI+TRqvS04J+DeWeFh49v
 5VGAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCmthg
 /uryyHkEALjimMc3l48sfrZ8ko35a2q4lv0g3RnDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/TKbix5m8AH+v1T2Mw0NB0L0WXZx7id/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1oKEQaDac62dp1GGNFz
 909ECwWbimM0rfeLLKTEoGAh+wZE/XLEbNagSsl53fDEuomBJnPBanHjTNa9G5r2oYXRq6YP
 ZRfMGcyBPjDS0Qn1lM/FJU0ne6zwGP4fj1dpVa9v7Ur4y3axQdx3b6rPNe9ltmiH5gEwx/I/
 T6uE2LRAg0bZYW55We57iyiobT/wDq8ALA0C+jtnhJtqBjJroAJMzUPWF6m5PW0lEO6c9RYL
 UMS52wpt6da3FSmUtTnGRixsXKJuho0X9tWGvc9rgaXxcLpDx2xHHcYTjNRLcd88cVwXyM21
 hqAk5XlCFSDrYGodJ5UzZ/MxRvaBMTfBTRqifMsJefd3+TenQ==
IronPort-HdrOrdr: A9a23:bYICSqv3w3KaOqQDG8rb/iPW7skDZNV00zEX/kB9WHVpm62j9/
 xG88516faZslsssRIb+OxoWpPvfZq0z/ccirX5VY3SPzUO01HFEGgN1+HfK2qKIVyaygcL79
 YDT5RD
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.95,176,1661810400"; d="scan'208";a="25951834"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-1a.itc.rwth-aachen.de with ESMTP; 23 Oct 2022 17:37:13 +0200
Received: from localhost.localdomain (2a02:908:1088:5920:10a7:3a65:7c9d:55ef)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Sun, 23 Oct 2022 17:37:13 +0200
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v4 5/7] target/arm: Add PMSAv8r registers
Date: Sun, 23 Oct 2022 17:36:57 +0200
Message-ID: <20221023153659.121138-6-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
References: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:10a7:3a65:7c9d:55ef]
X-ClientProxiedBy: rwthex-s4-b.rwth-ad.de (2a00:8a60:1:e500::26:165) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:44;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-1a.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/cpu.c     |  26 +++-
 target/arm/cpu.h     |  12 ++
 target/arm/helper.c  | 290 +++++++++++++++++++++++++++++++++++++++++++
 target/arm/machine.c |  28 +++++
 target/arm/ptw.c     |   9 +-
 5 files changed, 363 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b642749d6d..468150ad6c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -463,6 +463,16 @@ static void arm_cpu_reset(DeviceState *dev)
                        sizeof(*env->pmsav7.dracr) * cpu->pmsav7_dregion);
             }
         }
+
+        if (cpu->pmsav8r_hdregion > 0) {
+            memset(env->pmsav8.hprbar[M_REG_NS], 0,
+                sizeof(*env->pmsav8.hprbar[M_REG_NS])
+                * cpu->pmsav8r_hdregion);
+            memset(env->pmsav8.hprlar[M_REG_NS], 0,
+                sizeof(*env->pmsav8.hprlar[M_REG_NS])
+                * cpu->pmsav8r_hdregion);
+        }
+
         env->pmsav7.rnr[M_REG_NS] = 0;
         env->pmsav7.rnr[M_REG_S] = 0;
         env->pmsav8.mair0[M_REG_NS] = 0;
@@ -1965,8 +1975,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
      */
     if (!cpu->has_mpu) {
         cpu->pmsav7_dregion = 0;
+        cpu->pmsav8r_hdregion = 0;
     }
-    if (cpu->pmsav7_dregion == 0) {
+    if ((cpu->pmsav7_dregion == 0) && (cpu->pmsav8r_hdregion == 0)) {
         cpu->has_mpu = false;
     }
 
@@ -1994,6 +2005,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                 env->pmsav7.dracr = g_new0(uint32_t, nr);
             }
         }
+
+        if (cpu->pmsav8r_hdregion > 0xFF) {
+            error_setg(errp, "PMSAv8 MPU EL2 #regions invalid %" PRIu32,
+                              cpu->pmsav8r_hdregion);
+            return;
+        }
+
+        if (cpu->pmsav8r_hdregion) {
+            env->pmsav8.hprbar[M_REG_NS] = g_new0(uint32_t,
+                                            cpu->pmsav8r_hdregion);
+            env->pmsav8.hprlar[M_REG_NS] = g_new0(uint32_t,
+                                            cpu->pmsav8r_hdregion);
+        }
     }
 
     if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 429ed42eec..1bb3c24db1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -307,6 +307,13 @@ typedef struct CPUArchState {
             };
             uint64_t sctlr_el[4];
         };
+        union { /* Virtualization System control register. */
+            struct {
+                uint32_t vsctlr_ns;
+                uint32_t vsctlr_s;
+            };
+            uint32_t vsctlr_el[2];
+        };
         uint64_t cpacr_el1; /* Architectural feature access control register */
         uint64_t cptr_el[4];  /* ARMv8 feature trap registers */
         uint32_t c1_xscaleauxcr; /* XScale auxiliary control register.  */
@@ -740,8 +747,11 @@ typedef struct CPUArchState {
          */
         uint32_t *rbar[M_REG_NUM_BANKS];
         uint32_t *rlar[M_REG_NUM_BANKS];
+        uint32_t *hprbar[M_REG_NUM_BANKS];
+        uint32_t *hprlar[M_REG_NUM_BANKS];
         uint32_t mair0[M_REG_NUM_BANKS];
         uint32_t mair1[M_REG_NUM_BANKS];
+        uint32_t hprselr[M_REG_NUM_BANKS];
     } pmsav8;
 
     /* v8M SAU */
@@ -901,6 +911,8 @@ struct ArchCPU {
     bool has_mpu;
     /* PMSAv7 MPU number of supported regions */
     uint32_t pmsav7_dregion;
+    /* PMSAv8 MPU number of supported hyp regions */
+    uint32_t pmsav8r_hdregion;
     /* v8M SAU number of supported regions */
     uint32_t sau_sregion;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2e9e420d4e..6a27a618bc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3607,6 +3607,215 @@ static void pmsav7_rgnr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value);
 }
 
+static void prbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
+    env->pmsav8.rbar[M_REG_NS][env->pmsav7.rnr[M_REG_NS]] = value;
+}
+
+static uint64_t prbar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.rbar[M_REG_NS][env->pmsav7.rnr[M_REG_NS]];
+}
+
+static void prlar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
+    env->pmsav8.rlar[M_REG_NS][env->pmsav7.rnr[M_REG_NS]] = value;
+}
+
+static uint64_t prlar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.rlar[M_REG_NS][env->pmsav7.rnr[M_REG_NS]];
+}
+
+static void prselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    /* Ignore writes that would select not implemented region */
+    if (value >= cpu->pmsav7_dregion) {
+        return;
+    }
+
+    env->pmsav7.rnr[M_REG_NS] = value;
+}
+
+static void hprbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
+    env->pmsav8.hprbar[M_REG_NS][env->pmsav8.hprselr[M_REG_NS]] = value;
+}
+
+static uint64_t hprbar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.hprbar[M_REG_NS][env->pmsav8.hprselr[M_REG_NS]];
+}
+
+static void hprlar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
+    env->pmsav8.hprlar[M_REG_NS][env->pmsav8.hprselr[M_REG_NS]] = value;
+}
+
+static uint64_t hprlar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.hprlar[M_REG_NS][env->pmsav8.hprselr[M_REG_NS]];
+}
+
+static void hprenr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    uint32_t n;
+    uint32_t bit;
+    ARMCPU *cpu = env_archcpu(env);
+
+    /* Ignore writes to unimplemented regions */
+    value &= (1 << cpu->pmsav8r_hdregion) - 1;
+
+    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
+
+    /* Register alias is only valid for first 32 indexes */
+    for (n = 0; n < (cpu->pmsav8r_hdregion & 0x1F); ++n) {
+        bit = extract32(value, n, 1);
+        env->pmsav8.hprlar[M_REG_NS][n] = deposit32(
+                    env->pmsav8.hprlar[M_REG_NS][n], 0, 1, bit);
+    }
+}
+
+static uint64_t hprenr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint32_t n;
+    uint32_t result = 0x0;
+    ARMCPU *cpu = env_archcpu(env);
+
+    /* Register alias is only valid for first 32 indexes */
+    for (n = 0; n < (cpu->pmsav8r_hdregion & 0x1F); ++n) {
+        if (env->pmsav8.hprlar[M_REG_NS][n] & 0x1) {
+            result |= (0x1 << n);
+        }
+    }
+    return result;
+}
+
+static void hprselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    /* Ignore writes that would select not implemented region */
+    if (value >= cpu->pmsav8r_hdregion) {
+        return;
+    }
+
+    env->pmsav8.hprselr[M_REG_NS] = value;
+}
+
+static void pmsav8r_regn_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    uint8_t index = (ri->crm & 0b111) << 1;
+    index |= (ri->opc2 & 1 << 2) >> 2;
+
+    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
+
+    if (ri->opc1 == 4) {
+        if (index >= cpu->pmsav8r_hdregion) {
+            return;
+        }
+        if (ri->opc2 & 0x1) {
+            env->pmsav8.hprlar[M_REG_NS][index] = value;
+        } else {
+            env->pmsav8.hprbar[M_REG_NS][index] = value;
+        }
+    } else {
+        if (index >= cpu->pmsav7_dregion) {
+            return;
+        }
+        if (ri->opc2 & 0x1) {
+            env->pmsav8.rlar[M_REG_NS][index] = value;
+        } else {
+            env->pmsav8.rbar[M_REG_NS][index] = value;
+        }
+    }
+}
+
+static uint64_t pmsav8r_regn_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    uint8_t index = (ri->crm & 0b111) << 1;
+    index |= (ri->opc2 & 1 << 2) >> 2;
+
+    if (ri->opc1 == 4) {
+        if (index >= cpu->pmsav8r_hdregion) {
+            return 0x0;
+        }
+        if (ri->opc2 & 0x1) {
+            return env->pmsav8.hprlar[M_REG_NS][index];
+        } else {
+            return env->pmsav8.hprbar[M_REG_NS][index];
+        }
+    } else {
+        if (index >= cpu->pmsav7_dregion) {
+            return 0x0;
+        }
+        if (ri->opc2 & 0x1) {
+            return env->pmsav8.rlar[M_REG_NS][index];
+        } else {
+            return env->pmsav8.rbar[M_REG_NS][index];
+        }
+    }
+}
+
+static const ARMCPRegInfo pmsav8r_cp_reginfo[] = {
+    { .name = "PRBAR",
+        .cp = 15, .opc1 = 0, .crn = 6, .crm = 3, .opc2 = 0,
+        .access = PL1_RW, .type = ARM_CP_ALIAS,
+        .accessfn = access_tvm_trvm,
+        .readfn = prbar_read, .writefn = prbar_write},
+    { .name = "PRLAR",
+        .cp = 15, .opc1 = 0, .crn = 6, .crm = 3, .opc2 = 1,
+        .access = PL1_RW, .type = ARM_CP_ALIAS,
+        .accessfn = access_tvm_trvm,
+        .readfn = prlar_read, .writefn = prlar_write},
+    { .name = "PRSELR", .resetvalue = 0,
+        .cp = 15, .opc1 = 0, .crn = 6, .crm = 2, .opc2 = 1,
+        .access = PL1_RW, .accessfn = access_tvm_trvm,
+        .writefn = prselr_write,
+        .fieldoffset = offsetof(CPUARMState, pmsav7.rnr[M_REG_NS])},
+    { .name = "HPRBAR", .resetvalue = 0,
+        .cp = 15, .opc1 = 4, .crn = 6, .crm = 3, .opc2 = 0,
+        .access = PL2_RW, .type = ARM_CP_ALIAS,
+        .readfn = hprbar_read, .writefn = hprbar_write},
+    { .name = "HPRLAR",
+        .cp = 15, .opc1 = 4, .crn = 6, .crm = 3, .opc2 = 1,
+        .access = PL2_RW, .type = ARM_CP_ALIAS,
+        .readfn = hprlar_read, .writefn = hprlar_write},
+    { .name = "HPRSELR", .resetvalue = 0,
+        .cp = 15, .opc1 = 4, .crn = 6, .crm = 2, .opc2 = 1,
+        .access = PL2_RW,
+        .writefn = hprselr_write,
+        .fieldoffset = offsetof(CPUARMState, pmsav8.hprselr[M_REG_NS])},
+    { .name = "HPRENR",
+        .cp = 15, .opc1 = 4, .crn = 6, .crm = 1, .opc2 = 1,
+        .access = PL2_RW, .type = ARM_CP_ALIAS,
+        .readfn = hprenr_read, .writefn = hprenr_write},
+};
+
 static const ARMCPRegInfo pmsav7_cp_reginfo[] = {
     /* Reset for all these registers is handled in arm_cpu_reset(),
      * because the PMSAv7 is also used by M-profile CPUs, which do
@@ -8079,6 +8288,13 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .resetvalue = cpu->pmsav7_dregion << 8
         };
+        /* HMPUIR is specific to PMSA V8 */
+        ARMCPRegInfo id_hmpuir_reginfo = {
+            .name = "HMPUIR",
+            .cp = 15, .crn = 0, .crm = 0, .opc1 = 4, .opc2 = 4,
+            .access = PL2_R, .type = ARM_CP_CONST,
+            .resetvalue = cpu->pmsav8r_hdregion
+        };
         static const ARMCPRegInfo crn0_wi_reginfo = {
             .name = "CRN0_WI", .cp = 15, .crn = 0, .crm = CP_ANY,
             .opc1 = CP_ANY, .opc2 = CP_ANY, .access = PL1_W,
@@ -8122,6 +8338,67 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, id_cp_reginfo);
         if (!arm_feature(env, ARM_FEATURE_PMSA)) {
             define_one_arm_cp_reg(cpu, &id_tlbtr_reginfo);
+        } else if (arm_feature(env, ARM_FEATURE_PMSA)
+              && !arm_feature(env, ARM_FEATURE_M)
+               && arm_feature(env, ARM_FEATURE_V8)) {
+            uint32_t i = 0;
+            g_autofree char *tmp_string;
+
+            define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
+            define_one_arm_cp_reg(cpu, &id_hmpuir_reginfo);
+            define_arm_cp_regs(cpu, pmsav8r_cp_reginfo);
+
+            /* Register alias is only valid for first 32 indexes */
+            for (i = 0; i < (cpu->pmsav7_dregion & 0x1F); ++i) {
+                uint8_t crm = 0b1000 | ((i & 0b1110) >> 1);
+                uint8_t opc2 = (i & 0x1) << 2;
+
+                tmp_string = g_strdup_printf("PRBAR%u", i);
+                ARMCPRegInfo tmp_prbarn_reginfo = {
+                    .name = tmp_string, .type = ARM_CP_ALIAS,
+                    .cp = 15, .opc1 = 0, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL1_RW, .resetvalue = 0,
+                    .accessfn = access_tvm_trvm,
+                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
+                };
+                define_one_arm_cp_reg(cpu, &tmp_prbarn_reginfo);
+
+                opc2 = (i & 0x1) << 2 | 0x1;
+                tmp_string = g_strdup_printf("PRLAR%u", i);
+                ARMCPRegInfo tmp_prlarn_reginfo = {
+                    .name = tmp_string, .type = ARM_CP_ALIAS,
+                    .cp = 15, .opc1 = 0, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL1_RW, .resetvalue = 0,
+                    .accessfn = access_tvm_trvm,
+                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
+                };
+                define_one_arm_cp_reg(cpu, &tmp_prlarn_reginfo);
+            }
+
+            /* Register alias is only valid for first 32 indexes */
+            for (i = 0; i < (cpu->pmsav8r_hdregion & 0x1F); ++i) {
+                uint8_t crm = 0b1000 | ((i & 0b1110) >> 1);
+                uint8_t opc2 = (i & 0x1) << 2;
+
+                tmp_string = g_strdup_printf("HPRBAR%u", i);
+                ARMCPRegInfo tmp_hprbarn_reginfo = {
+                    .name = tmp_string, .type = ARM_CP_ALIAS,
+                    .cp = 15, .opc1 = 4, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL2_RW, .resetvalue = 0,
+                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
+                };
+                define_one_arm_cp_reg(cpu, &tmp_hprbarn_reginfo);
+
+                opc2 = (i & 0x1) << 2 | 0x1;
+                tmp_string = g_strdup_printf("HPRLAR%u", i);
+                ARMCPRegInfo tmp_hprlarn_reginfo = {
+                    .name = tmp_string, .type = ARM_CP_ALIAS,
+                    .cp = 15, .opc1 = 4, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL2_RW, .resetvalue = 0,
+                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
+                };
+                define_one_arm_cp_reg(cpu, &tmp_hprlarn_reginfo);
+            }
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
         }
@@ -8243,6 +8520,19 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             sctlr.type |= ARM_CP_SUPPRESS_TB_END;
         }
         define_one_arm_cp_reg(cpu, &sctlr);
+
+        if (arm_feature(env, ARM_FEATURE_PMSA)
+            && !arm_feature(env, ARM_FEATURE_M)
+            && arm_feature(env, ARM_FEATURE_V8)) {
+            ARMCPRegInfo vsctlr = {
+                .name = "VSCTLR", .state = ARM_CP_STATE_AA32,
+                .cp = 15, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 0,
+                .access = PL2_RW, .resetvalue = 0x0,
+                .bank_fieldoffsets = { offsetof(CPUARMState, cp15.vsctlr_s),
+                                    offsetof(CPUARMState, cp15.vsctlr_ns) },
+            };
+            define_one_arm_cp_reg(cpu, &vsctlr);
+        }
     }
 
     if (cpu_isar_feature(aa64_lor, cpu)) {
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 54c5c62433..923da8d0bc 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -487,6 +487,30 @@ static bool pmsav8_needed(void *opaque)
         arm_feature(env, ARM_FEATURE_V8);
 }
 
+static bool pmsav8r_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+
+    return arm_feature(env, ARM_FEATURE_PMSA) &&
+        arm_feature(env, ARM_FEATURE_V8) &&
+        !arm_feature(env, ARM_FEATURE_M);
+}
+
+static const VMStateDescription vmstate_pmsav8r = {
+    .name = "cpu/pmsav8/pmsav8r",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pmsav8r_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_VARRAY_UINT32(env.pmsav8.hprbar[M_REG_NS], ARMCPU,
+                        pmsav8r_hdregion, 0, vmstate_info_uint32, uint32_t),
+        VMSTATE_VARRAY_UINT32(env.pmsav8.hprlar[M_REG_NS], ARMCPU,
+                        pmsav8r_hdregion, 0, vmstate_info_uint32, uint32_t),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static const VMStateDescription vmstate_pmsav8 = {
     .name = "cpu/pmsav8",
     .version_id = 1,
@@ -500,6 +524,10 @@ static const VMStateDescription vmstate_pmsav8 = {
         VMSTATE_UINT32(env.pmsav8.mair0[M_REG_NS], ARMCPU),
         VMSTATE_UINT32(env.pmsav8.mair1[M_REG_NS], ARMCPU),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_pmsav8r,
+        NULL
     }
 };
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index db50715fa7..4bd7389fa9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1718,6 +1718,13 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     bool hit = false;
     uint32_t addr_page_base = address & TARGET_PAGE_MASK;
     uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
+    int region_counter;
+
+    if (regime_el(env, mmu_idx) == 2) {
+        region_counter = cpu->pmsav8r_hdregion;
+    } else {
+        region_counter = cpu->pmsav7_dregion;
+    }
 
     result->page_size = TARGET_PAGE_SIZE;
     result->phys = address;
@@ -1742,7 +1749,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             hit = true;
         }
 
-        for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
+        for (n = region_counter - 1; n >= 0; n--) {
             /* region search */
             /*
              * Note that the base address is bits [31:5] from the register
-- 
2.34.1


