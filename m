Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93143644138
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 11:27:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2V9L-0007IY-Ma; Tue, 06 Dec 2022 05:26:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2V97-0007F3-DX
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:25:53 -0500
Received: from mail-out-1a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2V8t-00028y-SJ
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:25:52 -0500
X-IPAS-Result: =?us-ascii?q?A2DrBACWF49j/5sagoZaHgEBCxIMQIZahE6RHAOBE5w2g?=
 =?us-ascii?q?WoPAQEBAQEBAQEBCAFEBAEBhQECAgKFDyY4EwECBAEBAQEDAgMBAQEBAQEDA?=
 =?us-ascii?q?QEGAQEBAQEBBgSBHYUvRoZWAgEDIwQLAUYQIAUCJgICVwYOBYJ+gyOtSn8zg?=
 =?us-ascii?q?QGEcZxNCQGBCiyJCIJOhUKCUIEVgnN1hCs2gzqCZwSBFJYBDm4cNwMJAwcFL?=
 =?us-ascii?q?B1AAwsYDRYyChMyNQsRTCscGweBDCooFQMEBAMCBhMDIAINKDEUBCkTDSsmb?=
 =?us-ascii?q?QkCAyFhBQMDBCgsAwlAByYmPAdWNwUDAg8gOAYDCQMCH1R0LxIUBQMLFSUIB?=
 =?us-ascii?q?UkECDcFBlMSAgoREg8sRQ5IPjkWBidBATAODhMDXUsdgQEEYDmBFS8umxN7F?=
 =?us-ascii?q?C8Tbkt+klQCjlKhTQeCH6IOTJZ9ApIdl0CiEoEYhCgCBAIEBQIWgXmBfnGDN?=
 =?us-ascii?q?lIXAg+BG40RFo4vdDsCBwEKAQEDCYofAQE?=
IronPort-Data: A9a23:CE/wMapjUw09JqWvJD2HK3IG4tFeBmJEZBIvgKrLsJaIsI4StFCzt
 garIBmCMvmIYDP2Ltkka4nl8BgEuJeEnNBqQQZtrCxgECkW8ePIVI+TRqvS04J+DeWeFh49v
 5VGAjXkBJppJpMJjk71atANlVEliefSAOOU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCmthg
 /uryyHkEALjimAc3l48sfrZ8ko15Kqq4lv0g3RnDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/TKbix5m8AH+v1T2Mw0NB0L0WXZx7id/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1yAh0rZNBJ1topW1t/8
 v4pdy0/Yxeq0rfeLLKTEoGAh+wZE/XLEbNagSsl53fDEuomBJnPBanHjTNa9G5r2oYXRq6YP
 ZRfMGcyBPjDS0Qn1lM/FJU0ne6zwGP4fj1dpVa9v7Ur4y3axQdx3b6rPNe9ltmiHp0Pzh7D/
 DmuE2LRWSkkM4aG1Tm5y3OUtPDAxQXaeL1CPejtnhJtqBjJroAJMzUPWF6m5PW0lEO6c9RYL
 UMS52wpt6da3FSmUtTnGRixsXKJuho0X9tWGvc9rgaXxcLpDx2xHHcYTjNRLcd88cVwXyM21
 hqAk5XlCFSDrYGodJ5UzZ/MxRvaBMTfBTVqifMsJefd3+TenQ==
IronPort-HdrOrdr: A9a23:Kukkma9arEjR5/rsCUBuk+BUI+orL9Y04lQ7vn2ZESYlD/Bxl6
 iV7ZEmPGzP+UossRAb6KO90cy7Kk80mqQFmLX5UY3SPzUO/VHYVr2KjrGSsQEIeReOjtK1vJ
 0IG8ISZOEYT2IK9voSizPId+rIteP3lpxA8t2uqEuFIzsaCZ2IpD0JdTpzWncGOjVuNN4CPK
 C9outGuiDIQxsqR/X+PFE+f6z7vNvBnJnnZB4aF3cchjWmvHeTwITbVyOz+DozOgkv/Z4StV
 LsqSy82am5qfG8zXbnt1M6xPxt6arcI/V4dbyxtvQ=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,222,1665439200"; d="scan'208";a="30280323"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-1a.itc.rwth-aachen.de with ESMTP; 06 Dec 2022 11:25:32 +0100
Received: from localhost.localdomain (2a02:908:1088:5920:7fc5:a897:a756:e2fb)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Tue, 6 Dec 2022 11:25:31 +0100
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v6 5/7] target/arm: Add PMSAv8r registers
Date: Tue, 6 Dec 2022 11:25:02 +0100
Message-ID: <20221206102504.165775-6-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
References: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:7fc5:a897:a756:e2fb]
X-ClientProxiedBy: rwthex-s2-a.rwth-ad.de (2a00:8a60:1:e500::26:154) To
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/cpu.c     |  28 +++-
 target/arm/cpu.h     |   6 +
 target/arm/helper.c  | 302 +++++++++++++++++++++++++++++++++++++++++++
 target/arm/machine.c |  28 ++++
 4 files changed, 360 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f9ab6af829..497be4b464 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -489,6 +489,14 @@ static void arm_cpu_reset(DeviceState *dev)
                        sizeof(*env->pmsav7.dracr) * cpu->pmsav7_dregion);
             }
         }
+
+        if (cpu->pmsav8r_hdregion > 0) {
+            memset(env->pmsav8.hprbar, 0,
+                   sizeof(*env->pmsav8.hprbar) * cpu->pmsav8r_hdregion);
+            memset(env->pmsav8.hprlar, 0,
+                   sizeof(*env->pmsav8.hprlar) * cpu->pmsav8r_hdregion);
+        }
+
         env->pmsav7.rnr[M_REG_NS] = 0;
         env->pmsav7.rnr[M_REG_S] = 0;
         env->pmsav8.mair0[M_REG_NS] = 0;
@@ -1999,11 +2007,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     /* MPU can be configured out of a PMSA CPU either by setting has-mpu
      * to false or by setting pmsav7-dregion to 0.
      */
-    if (!cpu->has_mpu) {
-        cpu->pmsav7_dregion = 0;
-    }
-    if (cpu->pmsav7_dregion == 0) {
+    if (!cpu->has_mpu || cpu->pmsav7_dregion == 0) {
         cpu->has_mpu = false;
+        cpu->pmsav7_dregion = 0;
+        cpu->pmsav8r_hdregion = 0;
     }
 
     if (arm_feature(env, ARM_FEATURE_PMSA) &&
@@ -2030,6 +2037,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                 env->pmsav7.dracr = g_new0(uint32_t, nr);
             }
         }
+
+        if (cpu->pmsav8r_hdregion > 0xff) {
+            error_setg(errp, "PMSAv8 MPU EL2 #regions invalid %" PRIu32,
+                              cpu->pmsav8r_hdregion);
+            return;
+        }
+
+        if (cpu->pmsav8r_hdregion) {
+            env->pmsav8.hprbar = g_new0(uint32_t,
+                                        cpu->pmsav8r_hdregion);
+            env->pmsav8.hprlar = g_new0(uint32_t,
+                                        cpu->pmsav8r_hdregion);
+        }
     }
 
     if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9aeed3c848..c2eab52174 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -309,6 +309,7 @@ typedef struct CPUArchState {
             };
             uint64_t sctlr_el[4];
         };
+        uint64_t vsctlr; /* Virtualization System control register. */
         uint64_t cpacr_el1; /* Architectural feature access control register */
         uint64_t cptr_el[4];  /* ARMv8 feature trap registers */
         uint32_t c1_xscaleauxcr; /* XScale auxiliary control register.  */
@@ -745,8 +746,11 @@ typedef struct CPUArchState {
          */
         uint32_t *rbar[M_REG_NUM_BANKS];
         uint32_t *rlar[M_REG_NUM_BANKS];
+        uint32_t *hprbar;
+        uint32_t *hprlar;
         uint32_t mair0[M_REG_NUM_BANKS];
         uint32_t mair1[M_REG_NUM_BANKS];
+        uint32_t hprselr;
     } pmsav8;
 
     /* v8M SAU */
@@ -906,6 +910,8 @@ struct ArchCPU {
     bool has_mpu;
     /* PMSAv7 MPU number of supported regions */
     uint32_t pmsav7_dregion;
+    /* PMSAv8 MPU number of supported hyp regions */
+    uint32_t pmsav8r_hdregion;
     /* v8M SAU number of supported regions */
     uint32_t sau_sregion;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 23a55dbe7d..e930b04970 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3657,6 +3657,222 @@ static void pmsav7_rgnr_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
+    /*
+     * Ignore writes that would select not implemented region.
+     * This is architecturally UNPREDICTABLE.
+     */
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
+    env->pmsav8.hprbar[env->pmsav8.hprselr] = value;
+}
+
+static uint64_t hprbar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.hprbar[env->pmsav8.hprselr];
+}
+
+static void hprlar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
+    env->pmsav8.hprlar[env->pmsav8.hprselr] = value;
+}
+
+static uint64_t hprlar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.hprlar[env->pmsav8.hprselr];
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
+    int rmax = MIN(cpu->pmsav8r_hdregion, 32);
+    value &= MAKE_64BIT_MASK(0, rmax);
+
+    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
+
+    /* Register alias is only valid for first 32 indexes */
+    for (n = 0; n < rmax; ++n) {
+        bit = extract32(value, n, 1);
+        env->pmsav8.hprlar[n] = deposit32(
+                    env->pmsav8.hprlar[n], 0, 1, bit);
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
+    for (n = 0; n < MIN(cpu->pmsav8r_hdregion, 32); ++n) {
+        if (env->pmsav8.hprlar[n] & 0x1) {
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
+    /*
+     * Ignore writes that would select not implemented region.
+     * This is architecturally UNPREDICTABLE.
+     */
+    if (value >= cpu->pmsav8r_hdregion) {
+        return;
+    }
+
+    env->pmsav8.hprselr = value;
+}
+
+static void pmsav8r_regn_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    uint8_t index = (extract32(ri->opc0, 0, 1) << 4) |
+                    (extract32(ri->crm, 0, 3) << 1) | extract32(ri->opc2, 2, 1);
+
+    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
+
+    if (ri->opc1 & 4) {
+        if (index >= cpu->pmsav8r_hdregion) {
+            return;
+        }
+        if (ri->opc2 & 0x1) {
+            env->pmsav8.hprlar[index] = value;
+        } else {
+            env->pmsav8.hprbar[index] = value;
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
+    uint8_t index = (extract32(ri->opc0, 0, 1) << 4) |
+                    (extract32(ri->crm, 0, 3) << 1) | extract32(ri->opc2, 2, 1);
+
+    if (ri->opc1 & 4) {
+        if (index >= cpu->pmsav8r_hdregion) {
+            return 0x0;
+        }
+        if (ri->opc2 & 0x1) {
+            return env->pmsav8.hprlar[index];
+        } else {
+            return env->pmsav8.hprbar[index];
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
+      .cp = 15, .opc1 = 0, .crn = 6, .crm = 3, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_NO_RAW,
+      .accessfn = access_tvm_trvm,
+      .readfn = prbar_read, .writefn = prbar_write },
+    { .name = "PRLAR",
+      .cp = 15, .opc1 = 0, .crn = 6, .crm = 3, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_NO_RAW,
+      .accessfn = access_tvm_trvm,
+      .readfn = prlar_read, .writefn = prlar_write },
+    { .name = "PRSELR", .resetvalue = 0,
+      .cp = 15, .opc1 = 0, .crn = 6, .crm = 2, .opc2 = 1,
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .writefn = prselr_write,
+      .fieldoffset = offsetof(CPUARMState, pmsav7.rnr[M_REG_NS]) },
+    { .name = "HPRBAR", .resetvalue = 0,
+      .cp = 15, .opc1 = 4, .crn = 6, .crm = 3, .opc2 = 0,
+      .access = PL2_RW, .type = ARM_CP_NO_RAW,
+      .readfn = hprbar_read, .writefn = hprbar_write },
+    { .name = "HPRLAR",
+      .cp = 15, .opc1 = 4, .crn = 6, .crm = 3, .opc2 = 1,
+      .access = PL2_RW, .type = ARM_CP_NO_RAW,
+      .readfn = hprlar_read, .writefn = hprlar_write },
+    { .name = "HPRSELR", .resetvalue = 0,
+      .cp = 15, .opc1 = 4, .crn = 6, .crm = 2, .opc2 = 1,
+      .access = PL2_RW,
+      .writefn = hprselr_write,
+      .fieldoffset = offsetof(CPUARMState, pmsav8.hprselr) },
+    { .name = "HPRENR",
+      .cp = 15, .opc1 = 4, .crn = 6, .crm = 1, .opc2 = 1,
+      .access = PL2_RW, .type = ARM_CP_NO_RAW,
+      .readfn = hprenr_read, .writefn = hprenr_write },
+};
+
 static const ARMCPRegInfo pmsav7_cp_reginfo[] = {
     /* Reset for all these registers is handled in arm_cpu_reset(),
      * because the PMSAv7 is also used by M-profile CPUs, which do
@@ -8166,6 +8382,13 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .resetvalue = cpu->pmsav7_dregion << 8
         };
+        /* HMPUIR is specific to PMSA V8 */
+        ARMCPRegInfo id_hmpuir_reginfo = {
+            .name = "HMPUIR",
+            .cp = 15, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 4,
+            .access = PL2_R, .type = ARM_CP_CONST,
+            .resetvalue = cpu->pmsav8r_hdregion
+        };
         static const ARMCPRegInfo crn0_wi_reginfo = {
             .name = "CRN0_WI", .cp = 15, .crn = 0, .crm = CP_ANY,
             .opc1 = CP_ANY, .opc2 = CP_ANY, .access = PL1_W,
@@ -8208,6 +8431,74 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, id_cp_reginfo);
         if (!arm_feature(env, ARM_FEATURE_PMSA)) {
             define_one_arm_cp_reg(cpu, &id_tlbtr_reginfo);
+        } else if (arm_feature(env, ARM_FEATURE_PMSA) &&
+                   arm_feature(env, ARM_FEATURE_V8)) {
+            uint32_t i = 0;
+            char *tmp_string;
+
+            define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
+            define_one_arm_cp_reg(cpu, &id_hmpuir_reginfo);
+            define_arm_cp_regs(cpu, pmsav8r_cp_reginfo);
+
+            /* Register alias is only valid for first 32 indexes */
+            for (i = 0; i < MIN(cpu->pmsav7_dregion, 32); ++i) {
+                uint8_t crm = 0b1000 | extract32(i, 1, 3);
+                uint8_t opc1 = extract32(i, 4, 1);
+                uint8_t opc2 = extract32(i, 0, 1) << 2;
+
+                tmp_string = g_strdup_printf("PRBAR%u", i);
+                ARMCPRegInfo tmp_prbarn_reginfo = {
+                    .name = tmp_string, .type = ARM_CP_ALIAS | ARM_CP_NO_RAW,
+                    .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL1_RW, .resetvalue = 0,
+                    .accessfn = access_tvm_trvm,
+                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
+                };
+                define_one_arm_cp_reg(cpu, &tmp_prbarn_reginfo);
+                g_free(tmp_string);
+
+                opc2 = extract32(i, 0, 1) << 2 | 0x1;
+                tmp_string = g_strdup_printf("PRLAR%u", i);
+                ARMCPRegInfo tmp_prlarn_reginfo = {
+                    .name = tmp_string, .type = ARM_CP_ALIAS | ARM_CP_NO_RAW,
+                    .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL1_RW, .resetvalue = 0,
+                    .accessfn = access_tvm_trvm,
+                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
+                };
+                define_one_arm_cp_reg(cpu, &tmp_prlarn_reginfo);
+                g_free(tmp_string);
+            }
+
+            /* Register alias is only valid for first 32 indexes */
+            for (i = 0; i < MIN(cpu->pmsav8r_hdregion, 32); ++i) {
+                uint8_t crm = 0b1000 | extract32(i, 1, 3);
+                uint8_t opc1 = 0b100 | extract32(i, 4, 1);
+                uint8_t opc2 = extract32(i, 0, 1) << 2;
+
+                tmp_string = g_strdup_printf("HPRBAR%u", i);
+                ARMCPRegInfo tmp_hprbarn_reginfo = {
+                    .name = tmp_string,
+                    .type = ARM_CP_NO_RAW,
+                    .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL2_RW, .resetvalue = 0,
+                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
+                };
+                define_one_arm_cp_reg(cpu, &tmp_hprbarn_reginfo);
+                g_free(tmp_string);
+
+                opc2 = extract32(i, 0, 1) << 2 | 0x1;
+                tmp_string = g_strdup_printf("HPRLAR%u", i);
+                ARMCPRegInfo tmp_hprlarn_reginfo = {
+                    .name = tmp_string,
+                    .type = ARM_CP_NO_RAW,
+                    .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL2_RW, .resetvalue = 0,
+                    .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
+                };
+                define_one_arm_cp_reg(cpu, &tmp_hprlarn_reginfo);
+                g_free(tmp_string);
+            }
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
         }
@@ -8329,6 +8620,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             sctlr.type |= ARM_CP_SUPPRESS_TB_END;
         }
         define_one_arm_cp_reg(cpu, &sctlr);
+
+        if (arm_feature(env, ARM_FEATURE_PMSA) &&
+            arm_feature(env, ARM_FEATURE_V8)) {
+            ARMCPRegInfo vsctlr = {
+                .name = "VSCTLR", .state = ARM_CP_STATE_AA32,
+                .cp = 15, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 0,
+                .access = PL2_RW, .resetvalue = 0x0,
+                .fieldoffset = offsetoflow32(CPUARMState, cp15.vsctlr),
+            };
+            define_one_arm_cp_reg(cpu, &vsctlr);
+        }
     }
 
     if (cpu_isar_feature(aa64_lor, cpu)) {
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 54c5c62433..5f26152652 100644
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
+        VMSTATE_VARRAY_UINT32(env.pmsav8.hprbar, ARMCPU,
+                        pmsav8r_hdregion, 0, vmstate_info_uint32, uint32_t),
+        VMSTATE_VARRAY_UINT32(env.pmsav8.hprlar, ARMCPU,
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
 
-- 
2.34.1


