Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D93E4CA2EC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:13:54 +0100 (CET)
Received: from localhost ([::1]:43534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPMvZ-00009J-Cy
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:13:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqF-0008Gg-Mj; Wed, 02 Mar 2022 06:08:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqC-0001gk-4f; Wed, 02 Mar 2022 06:08:21 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228Lfmm012737; 
 Wed, 2 Mar 2022 11:08:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej50ku5p3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:15 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222Atgpu017094;
 Wed, 2 Mar 2022 11:08:14 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej50ku5m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:14 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2faN027265;
 Wed, 2 Mar 2022 11:08:12 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3efbu9d1rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:12 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 222B89q642008906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4AE74C058;
 Wed,  2 Mar 2022 11:08:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A06BD4C040;
 Wed,  2 Mar 2022 11:08:09 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:09 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E52F0220294;
 Wed,  2 Mar 2022 12:08:08 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 03/87] target/ppc: make power8-pmu.c CONFIG_TCG only
Date: Wed,  2 Mar 2022 12:06:39 +0100
Message-Id: <20220302110803.849505-4-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gV-jNZ3u7VwxHv-mOpodA63fuNn_nosh
X-Proofpoint-ORIG-GUID: gzgdED_DcAaSdW02gf6mgjNWL_y6u3kT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1034
 phishscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=882 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

This is an exclusive TCG helper. Gating it with CONFIG_TCG and changing
meson.build accordingly will prevent problems --disable-tcg and
--disable-linux-user later on.

We're also changing the uses of !kvm_enabled() to tcg_enabled() to avoid
adding "defined(CONFIG_TCG)" ifdefs, since tcg_enabled() will be
defaulted to false with --disable-tcg and the block will always be
skipped.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220225101140.1054160-2-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/power8-pmu.h |  4 ++--
 target/ppc/cpu_init.c   | 16 +++++++---------
 target/ppc/machine.c    |  6 +++++-
 target/ppc/meson.build  |  2 +-
 4 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/target/ppc/power8-pmu.h b/target/ppc/power8-pmu.h
index a8391995618a..256d90f523c9 100644
--- a/target/ppc/power8-pmu.h
+++ b/target/ppc/power8-pmu.h
@@ -13,11 +13,11 @@
 #ifndef POWER8_PMU
 #define POWER8_PMU
=20
-void cpu_ppc_pmu_init(CPUPPCState *env);
-
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+void cpu_ppc_pmu_init(CPUPPCState *env);
 void pmu_update_summaries(CPUPPCState *env);
 #else
+static inline void cpu_ppc_pmu_init(CPUPPCState *env) { }
 static inline void pmu_update_summaries(CPUPPCState *env) { }
 #endif
=20
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 61d36b11a093..544e0522902d 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5698,12 +5698,10 @@ static void register_power9_mmu_sprs(CPUPPCState =
*env)
  */
 static void init_tcg_pmu_power8(CPUPPCState *env)
 {
-#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
     /* Init PMU overflow timers */
-    if (!kvm_enabled()) {
+    if (tcg_enabled()) {
         cpu_ppc_pmu_init(env);
     }
-#endif
 }
=20
 static void init_proc_book3s_common(CPUPPCState *env)
@@ -7167,14 +7165,14 @@ static void ppc_cpu_reset(DeviceState *dev)
=20
 #if !defined(CONFIG_USER_ONLY)
     env->nip =3D env->hreset_vector | env->excp_prefix;
-#if defined(CONFIG_TCG)
-    if (env->mmu_model !=3D POWERPC_MMU_REAL) {
-        ppc_tlb_invalidate_all(env);
+
+    if (tcg_enabled()) {
+        if (env->mmu_model !=3D POWERPC_MMU_REAL) {
+            ppc_tlb_invalidate_all(env);
+        }
+        pmu_update_summaries(env);
     }
-#endif /* CONFIG_TCG */
 #endif
-
-    pmu_update_summaries(env);
     hreg_compute_hflags(env);
     env->reserve_addr =3D (target_ulong)-1ULL;
     /* Be sure no exception or interrupt is pending */
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 1b63146ed128..e67394459792 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -2,6 +2,7 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "helper_regs.h"
 #include "mmu-hash64.h"
 #include "migration/cpu.h"
@@ -20,7 +21,10 @@ static void post_load_update_msr(CPUPPCState *env)
      */
     env->msr ^=3D env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
     ppc_store_msr(env, msr);
-    pmu_update_summaries(env);
+
+    if (tcg_enabled()) {
+        pmu_update_summaries(env);
+    }
 }
=20
 static int get_avr(QEMUFile *f, void *pv, size_t size,
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index a49a8911e069..79beaff14716 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -16,6 +16,7 @@ ppc_ss.add(when: 'CONFIG_TCG', if_true: files(
   'misc_helper.c',
   'timebase_helper.c',
   'translate.c',
+  'power8-pmu.c',
 ))
=20
 ppc_ss.add(libdecnumber)
@@ -51,7 +52,6 @@ ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files=
(
   'mmu-book3s-v3.c',
   'mmu-hash64.c',
   'mmu-radix64.c',
-  'power8-pmu.c',
 ))
=20
 target_arch +=3D {'ppc': ppc_ss}
--=20
2.34.1


