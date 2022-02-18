Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B8B4BB7B7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 12:08:56 +0100 (CET)
Received: from localhost ([::1]:55546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL18A-0003hN-2R
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 06:08:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fq-0001CD-Pw; Fri, 18 Feb 2022 05:39:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29802
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fh-0005iG-Dk; Fri, 18 Feb 2022 05:39:36 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I91dqb026981; 
 Fri, 18 Feb 2022 10:38:57 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea8fbj089-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:57 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAcAYR005723;
 Fri, 18 Feb 2022 10:38:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3e64haprsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:54 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21IAcquf37028344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:52 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6C71A406F;
 Fri, 18 Feb 2022 10:38:52 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 628BAA4064;
 Fri, 18 Feb 2022 10:38:52 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:52 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A91D2220294;
 Fri, 18 Feb 2022 11:38:51 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 33/39] target/ppc: cpu_init: Rename register_ne_601_sprs
Date: Fri, 18 Feb 2022 11:38:21 +0100
Message-Id: <20220218103827.682032-34-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ptz088bpZ-ejgbmQ98UtZ9wMJ-He6ReY
X-Proofpoint-GUID: ptz088bpZ-ejgbmQ98UtZ9wMJ-He6ReY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxscore=0
 priorityscore=1501 mlxlogscore=886 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180067
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

The important part of this function is that it applies to non-embedded
CPUs, not that it also applies to the 601. We removed support for the
601 anyway, so rename this function.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20220216162426.1885923-22-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu_init.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 243e05f7625d..5980a6a4d312 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -241,8 +241,7 @@ static void register_generic_sprs(PowerPCCPU *cpu)
                  0x00000000);
 }
=20
-/* SPR common to all non-embedded PowerPC, including 601 */
-static void register_ne_601_sprs(CPUPPCState *env)
+static void register_non_embedded_sprs(CPUPPCState *env)
 {
     /* Exception processing */
     spr_register_kvm(env, SPR_DSISR, "DSISR",
@@ -3018,7 +3017,7 @@ POWERPC_FAMILY(MPC8xx)(ObjectClass *oc, void *data)
=20
 static void init_proc_G2(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_G2_sprs(env);
=20
@@ -3728,7 +3727,7 @@ POWERPC_FAMILY(e6500)(ObjectClass *oc, void *data)
 /* Non-embedded PowerPC                                                 =
     */
 static void init_proc_603(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_603_sprs(env);
=20
@@ -3868,7 +3867,7 @@ POWERPC_FAMILY(e300)(ObjectClass *oc, void *data)
=20
 static void init_proc_604(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_604_sprs(env);
=20
@@ -3967,7 +3966,7 @@ POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
=20
 static void init_proc_740(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
     /* Thermal management */
@@ -4023,7 +4022,7 @@ POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
=20
 static void init_proc_750(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
=20
@@ -4088,7 +4087,7 @@ POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
=20
 static void init_proc_750cl(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
=20
@@ -4273,7 +4272,7 @@ POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
=20
 static void init_proc_750cx(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
=20
@@ -4341,7 +4340,7 @@ POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
=20
 static void init_proc_750fx(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
=20
@@ -4413,7 +4412,7 @@ POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
=20
 static void init_proc_750gx(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
=20
@@ -4485,7 +4484,7 @@ POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
=20
 static void init_proc_745(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
     register_745_sprs(env);
@@ -4589,7 +4588,7 @@ POWERPC_FAMILY(755)(ObjectClass *oc, void *data)
=20
 static void init_proc_7400(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -4661,7 +4660,7 @@ POWERPC_FAMILY(7400)(ObjectClass *oc, void *data)
=20
 static void init_proc_7410(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -4740,7 +4739,7 @@ POWERPC_FAMILY(7410)(ObjectClass *oc, void *data)
=20
 static void init_proc_7440(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -4840,7 +4839,7 @@ POWERPC_FAMILY(7440)(ObjectClass *oc, void *data)
=20
 static void init_proc_7450(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -4962,7 +4961,7 @@ POWERPC_FAMILY(7450)(ObjectClass *oc, void *data)
=20
 static void init_proc_7445(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -5091,7 +5090,7 @@ POWERPC_FAMILY(7445)(ObjectClass *oc, void *data)
=20
 static void init_proc_7455(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -5222,7 +5221,7 @@ POWERPC_FAMILY(7455)(ObjectClass *oc, void *data)
=20
 static void init_proc_7457(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -5373,7 +5372,7 @@ POWERPC_FAMILY(7457)(ObjectClass *oc, void *data)
=20
 static void init_proc_e600(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -6196,7 +6195,7 @@ static void init_tcg_pmu_power8(CPUPPCState *env)
=20
 static void init_proc_book3s_common(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_usprg3_sprs(env);
     register_book3s_altivec_sprs(env);
     register_book3s_pmu_sup_sprs(env);
--=20
2.34.1


