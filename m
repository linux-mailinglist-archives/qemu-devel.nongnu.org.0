Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8CE59AEBC
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 16:54:10 +0200 (CEST)
Received: from localhost ([::1]:59126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPPrT-0008Ba-D2
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 10:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPKA-0005Ei-Js
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:42 -0400
Received: from mail-out-2a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:45]:12696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPK7-0003lu-S0
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:42 -0400
X-IPAS-Result: =?us-ascii?q?A2CrAAD06wBj/5sagoZaHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?T4EAQELAYR9hE6RD4ETnWwLAQEBAQEBAQEBCAFCBAEBhQMCAgKEYiY3Bg4BA?=
 =?us-ascii?q?gQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEgRyFL0aGQwIBAyMECwFGECAFA?=
 =?us-ascii?q?iYCAlcGDgWCfYMjqRl/MoEBhHCFEgkBgQcsAYgPghqFK4JQgRWCc3WEYYM5g?=
 =?us-ascii?q?mUEmU4cOAMJBAcFLB5CAwsfDhYFCAkXEhAQAgQRGgsGAxY+CQIEDgNACA0DE?=
 =?us-ascii?q?QQDDxgJEggQBAYDMQwlCwMUDAEGAwYFAwEDGwMUAwUkBwMZDyMNDQQfDAMDB?=
 =?us-ascii?q?SUDAgIbBwICAwIGFQYCAjYYOQgECAQrIw8FAgcvBQQvAh4EBQYRCAIWAgYEB?=
 =?us-ascii?q?AQEFQIQCAIIJxcHEzMZAQUyJxAJIRwOGhAFBhMDIG8FBz4PKDM1OSsdGwqBE?=
 =?us-ascii?q?iopFQMEBAMCBhMDAyICEC4xAxUGKRMSLQcrdQkCAyJpBQMDBCgsAwk+BwkiJ?=
 =?us-ascii?q?j0FBVs6BQMDECI9BgMJAwIpPJsNgQ+jb6BkB4IWoUlMlnECkgGXB6F3gRiEJ?=
 =?us-ascii?q?wIEAgQFAhaBd4F/cYM2URcCD44sFo4wczsCBgEKAQEDCYpcAQE?=
IronPort-Data: A9a23:boSNBKMdAJGZ+ZHvrR0XlcFynXyQoLVcMsEvi/4bfWQNrUoi1jUAz
 TEYX26OO/fZMzegKIogaYW28U4Fv5/UytJrQHM5pCpnJ55oRWspJvzEdBuqb3PKRiHnZBg6h
 ynLQoCYdKjYdleF+lH1dOGJQUBUjclkfJKlYAL/En03FFQMpBsJ00o5wbZp2NYw27BVPivU0
 T/Mi5yHULOa82MsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3ecldG0DFrrx8RYZWc
 c6elu3jrjOBl/saIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0o2HKJ0VKtZt9mGt/978
 45R8raTcxwCIPLXyesiED9xDC4raMWq+JefSZS+mfas823rQz7XmbBESlspIY1d8+oxDWwmG
 f4wcWtRKEnY36TsnvTiF7QEascLdaEHOKsDvXthxCqfF/ErQZXOR43Q+sNYmT45jcBDG7DSa
 qL1bBI2PUqaPEEXZz/7Droclt2EqGHaTQRW8muolIgNvHPNxhd+he2F3N39P4biqd9utl+Vo
 3+D82nnDxUyMtuZxjyYtHW2iYfnhS7nVZhUEbSp+vNuhHWXx2oaEhpQUkG0ycRVkWakRM5fJ
 lxR4XBrp+4o61CrC9DxGRG1yJKZgiMhtxNrO7VSwGmwJmD8uW512kBsouZ9VeEb
IronPort-HdrOrdr: A9a23:/UZkFaDiyYpSsajlHemS55DYdb4zR+YMi2TDtnoRdfUxSKfzqy
 nApoV56faZslsssQgb6La90cq7L080l6QY3WB5B97LYOGN0FHYVb2KhrGM/9SPIU3DHuI079
 YDT0ByYOeAamSTh67BkWyF+9lJ+qjizJyV
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.93,251,1654552800"; d="scan'208";a="19627405"
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
Subject: [PATCH v3 7/9] target/arm: Add PMSAv8r registers
Date: Sat, 20 Aug 2022 16:19:12 +0200
Message-ID: <20220820141914.217399-8-tobias.roehmel@rwth-aachen.de>
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

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
---
 target/arm/cpu.h    |  10 +++
 target/arm/helper.c | 171 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 181 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 86e06116a9..632d0d13c6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -726,8 +726,18 @@ typedef struct CPUArchState {
          */
         uint32_t *rbar[M_REG_NUM_BANKS];
         uint32_t *rlar[M_REG_NUM_BANKS];
+        uint32_t prbarn[255];
+        uint32_t prlarn[255];
+        uint32_t hprbarn[255];
+        uint32_t hprlarn[255];
         uint32_t mair0[M_REG_NUM_BANKS];
         uint32_t mair1[M_REG_NUM_BANKS];
+        uint32_t prbar;
+        uint32_t prlar;
+        uint32_t prselr;
+        uint32_t hprbar;
+        uint32_t hprlar;
+        uint32_t hprselr;
     } pmsav8;
 
     /* v8M SAU */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 23461397e0..1730383f28 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7422,6 +7422,78 @@ static CPAccessResult access_joscr_jmcr(CPUARMState *env,
     return CP_ACCESS_OK;
 }
 
+static void prbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    env->pmsav8.prbarn[env->pmsav8.prselr] = value;
+}
+
+static void prlar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    env->pmsav8.prlarn[env->pmsav8.prselr] = value;
+}
+
+static uint64_t prbar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.prbarn[env->pmsav8.prselr];
+}
+
+static uint64_t prlar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.prlarn[env->pmsav8.prselr];
+}
+
+static void hprbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    env->pmsav8.hprbarn[env->pmsav8.hprselr] = value;
+}
+
+static void hprlar_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    env->pmsav8.hprlarn[env->pmsav8.hprselr] = value;
+}
+
+static void hprenr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    uint32_t n;
+    ARMCPU *cpu = env_archcpu(env);
+    for (n = 0; n < (int)cpu->pmsav7_dregion; ++n) {
+        if (value & (1 << n)) {
+            env->pmsav8.hprlarn[n] |= 0x1;
+        } else {
+            env->pmsav8.hprlarn[n] &= (~0x1);
+        }
+    }
+}
+
+static uint64_t hprbar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.hprbarn[env->pmsav8.hprselr];
+}
+
+static uint64_t hprlar_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pmsav8.hprlarn[env->pmsav8.hprselr];
+}
+
+static uint64_t hprenr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint32_t n;
+    uint32_t result = 0x0;
+    ARMCPU *cpu = env_archcpu(env);
+
+    for (n = 0; n < (int)cpu->pmsav7_dregion; ++n) {
+        if (env->pmsav8.hprlarn[n] & 0x1) {
+            result |= (0x1 << n);
+        }
+    }
+    return result;
+}
+
 static const ARMCPRegInfo jazelle_regs[] = {
     { .name = "JIDR",
       .cp = 14, .crn = 0, .crm = 0, .opc1 = 7, .opc2 = 0,
@@ -8249,6 +8321,46 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .resetvalue = cpu->pmsav7_dregion << 8
         };
+        /* PMSAv8-R registers*/
+        ARMCPRegInfo id_pmsav8_r_reginfo[] = {
+            { .name = "HMPUIR",
+              .cp = 15, .crn = 0, .crm = 0, .opc1 = 4, .opc2 = 4,
+              .access = PL2_R, .type = ARM_CP_CONST,
+              .resetvalue = cpu->pmsav7_dregion},
+             /* PMSAv8-R registers */
+            { .name = "PRBAR",
+              .cp = 15, .opc1 = 0, .crn = 6, .crm = 3, .opc2 = 0,
+              .access = PL1_RW, .resetvalue = 0,
+              .readfn = prbar_read, .writefn = prbar_write,
+              .fieldoffset = offsetof(CPUARMState, pmsav8.prbar)},
+            { .name = "PRLAR",
+              .cp = 15, .opc1 = 0, .crn = 6, .crm = 3, .opc2 = 1,
+              .access = PL1_RW, .resetvalue = 0,
+              .readfn = prlar_read, .writefn = prlar_write,
+              .fieldoffset = offsetof(CPUARMState, pmsav8.prlar)},
+            { .name = "PRSELR", .resetvalue = 0,
+              .cp = 15, .opc1 = 0, .crn = 6, .crm = 2, .opc2 = 1,
+              .access = PL1_RW, .accessfn = access_tvm_trvm,
+              .fieldoffset = offsetof(CPUARMState, pmsav8.prselr)},
+            { .name = "HPRBAR", .resetvalue = 0,
+              .readfn = hprbar_read, .writefn = hprbar_write,
+              .cp = 15, .opc1 = 4, .crn = 6, .crm = 3, .opc2 = 0,
+              .access = PL2_RW, .resetvalue = 0,
+              .fieldoffset = offsetof(CPUARMState, pmsav8.hprbar)},
+            { .name = "HPRLAR",
+              .cp = 15, .opc1 = 4, .crn = 6, .crm = 3, .opc2 = 1,
+              .access = PL2_RW, .resetvalue = 0,
+              .readfn = hprlar_read, .writefn = hprlar_write,
+              .fieldoffset = offsetof(CPUARMState, pmsav8.hprlar)},
+            { .name = "HPRSELR", .resetvalue = 0,
+              .cp = 15, .opc1 = 4, .crn = 6, .crm = 2, .opc2 = 1,
+              .access = PL2_RW, .accessfn = access_tvm_trvm,
+              .fieldoffset = offsetof(CPUARMState, pmsav8.hprselr)},
+            { .name = "HPRENR",
+              .cp = 15, .opc1 = 4, .crn = 6, .crm = 1, .opc2 = 1,
+              .access = PL2_RW, .resetvalue = 0,
+              .readfn = hprenr_read, .writefn = hprenr_write},
+        };
         static const ARMCPRegInfo crn0_wi_reginfo = {
             .name = "CRN0_WI", .cp = 15, .crn = 0, .crm = CP_ANY,
             .opc1 = CP_ANY, .opc2 = CP_ANY, .access = PL1_W,
@@ -8292,6 +8404,65 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, id_cp_reginfo);
         if (!arm_feature(env, ARM_FEATURE_PMSA)) {
             define_one_arm_cp_reg(cpu, &id_tlbtr_reginfo);
+        } else if (arm_feature(env, ARM_FEATURE_V8_R)) {
+            uint32_t i = 0;
+            char hprbar_string[] = "HPRBAR%u";
+            char hprlar_string[] = "HPRLAR%u";
+
+            char prbar_string[] = "PRBAR%u";
+            char prlar_string[] = "PRLAR%u";
+            char tmp_string[50];
+            define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
+            define_arm_cp_regs(cpu, id_pmsav8_r_reginfo);
+            for (i = 0; i < cpu->pmsav7_dregion; ++i) {
+                uint8_t crm = 0b1000 | ((i & 0b1110) >> 1);
+                uint8_t opc2 = (i & 0x1) << 2;
+
+                sprintf(tmp_string, hprbar_string, i);
+                ARMCPRegInfo tmp_hprbarn_reginfo = {
+                    .name = tmp_string,
+                    .cp = 15, .opc1 = 4, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL2_RW, .resetvalue = 0,
+                    .accessfn = access_tvm_trvm,
+                    .fieldoffset = offsetof(CPUARMState, pmsav8.hprbarn)
+                    + i * sizeof(env->pmsav8.hprbarn[0])
+                };
+                define_one_arm_cp_reg(cpu, &tmp_hprbarn_reginfo);
+
+                sprintf(tmp_string, prbar_string, i);
+                ARMCPRegInfo tmp_prbarn_reginfo = {
+                    .name = tmp_string,
+                    .cp = 15, .opc1 = 0, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL1_RW, .resetvalue = 0,
+                    .accessfn = access_tvm_trvm,
+                    .fieldoffset = offsetof(CPUARMState, pmsav8.prbarn)
+                    + i * sizeof(env->pmsav8.prbarn[0])
+                };
+                define_one_arm_cp_reg(cpu, &tmp_prbarn_reginfo);
+
+                opc2 = (i & 0x1) << 2 | 0x1;
+                sprintf(tmp_string, hprlar_string, i);
+                ARMCPRegInfo tmp_hprlarn_reginfo = {
+                    .name = tmp_string,
+                    .cp = 15, .opc1 = 4, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL2_RW, .resetvalue = 0,
+                    .accessfn = access_tvm_trvm,
+                    .fieldoffset = offsetof(CPUARMState, pmsav8.hprlarn)
+                    + i * sizeof(env->pmsav8.hprlarn[0])
+                };
+                define_one_arm_cp_reg(cpu, &tmp_hprlarn_reginfo);
+
+                sprintf(tmp_string, prlar_string, i);
+                ARMCPRegInfo tmp_prlarn_reginfo = {
+                    .name = tmp_string,
+                    .cp = 15, .opc1 = 0, .crn = 6, .crm = crm, .opc2 = opc2,
+                    .access = PL1_RW, .resetvalue = 0,
+                    .accessfn = access_tvm_trvm,
+                    .fieldoffset = offsetof(CPUARMState, pmsav8.prlarn)
+                    + i * sizeof(env->pmsav8.prlarn[0])
+                };
+                define_one_arm_cp_reg(cpu, &tmp_prlarn_reginfo);
+            }
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
         }
-- 
2.25.1


