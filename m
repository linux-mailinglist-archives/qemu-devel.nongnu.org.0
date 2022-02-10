Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C774B1274
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 17:13:54 +0100 (CET)
Received: from localhost ([::1]:40452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIC4v-00020x-Gn
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 11:13:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI949-00024n-Ax; Thu, 10 Feb 2022 08:00:59 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nI946-0004Gd-FJ; Thu, 10 Feb 2022 08:00:52 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ACU5wj020085; 
 Thu, 10 Feb 2022 13:00:45 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e4vmchfs9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:35 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21ACw8D4011946;
 Thu, 10 Feb 2022 13:00:32 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3e1gv9x271-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:00:30 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21AD0O8l39780742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 13:00:24 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 058C652067;
 Thu, 10 Feb 2022 13:00:24 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id C0D7E5204F;
 Thu, 10 Feb 2022 13:00:23 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.74.250])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 109282201DC;
 Thu, 10 Feb 2022 14:00:23 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 15/42] target/ppc: Merge exception model IDs for 6xx CPUs
Date: Thu, 10 Feb 2022 13:59:41 +0100
Message-Id: <20220210130008.2599950-16-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210130008.2599950-1-clg@kaod.org>
References: <20220210130008.2599950-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: setpWx_IjxMKXpXYhgLtuD7ckvxiZYd7
X-Proofpoint-ORIG-GUID: setpWx_IjxMKXpXYhgLtuD7ckvxiZYd7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1034 spamscore=0
 mlxlogscore=705 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202100071
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

We don't need three separate exception model IDs for the 603, 604 and
G2.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220203200957.1434641-2-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu-qom.h     |  8 ++------
 target/ppc/cpu_init.c    | 18 +++++++++---------
 target/ppc/excp_helper.c |  5 ++---
 3 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 5d591ff6c5ee..3880fb33376d 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -88,12 +88,8 @@ enum powerpc_excp_t {
     POWERPC_EXCP_STD,
     /* PowerPC 40x exception model      */
     POWERPC_EXCP_40x,
-    /* PowerPC 603 exception model      */
-    POWERPC_EXCP_603,
-    /* PowerPC G2 exception model       */
-    POWERPC_EXCP_G2,
-    /* PowerPC 604 exception model      */
-    POWERPC_EXCP_604,
+    /* PowerPC 603/604/G2 exception model */
+    POWERPC_EXCP_6xx,
     /* PowerPC 7x0 exception model      */
     POWERPC_EXCP_7x0,
     /* PowerPC 7x5 exception model      */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index a5e1f5a3b204..95c5831ba651 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2782,7 +2782,7 @@ POWERPC_FAMILY(MPC5xx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model =3D POWERPC_MMU_REAL;
-    pcc->excp_model =3D POWERPC_EXCP_603;
+    pcc->excp_model =3D POWERPC_EXCP_6xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_RCPU;
     pcc->bfd_mach =3D bfd_mach_ppc_505;
     pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -2825,7 +2825,7 @@ POWERPC_FAMILY(MPC8xx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model =3D POWERPC_MMU_MPC8xx;
-    pcc->excp_model =3D POWERPC_EXCP_603;
+    pcc->excp_model =3D POWERPC_EXCP_6xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_RCPU;
     pcc->bfd_mach =3D bfd_mach_ppc_860;
     pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -2906,7 +2906,7 @@ POWERPC_FAMILY(G2)(ObjectClass *oc, void *data)
                     (1ull << MSR_DR) |
                     (1ull << MSR_RI);
     pcc->mmu_model =3D POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model =3D POWERPC_EXCP_G2;
+    pcc->excp_model =3D POWERPC_EXCP_6xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_ec603e;
     pcc->flags =3D POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
@@ -2988,7 +2988,7 @@ POWERPC_FAMILY(G2LE)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model =3D POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model =3D POWERPC_EXCP_G2;
+    pcc->excp_model =3D POWERPC_EXCP_6xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_ec603e;
     pcc->flags =3D POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
@@ -3243,7 +3243,7 @@ POWERPC_FAMILY(e300)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model =3D POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model =3D POWERPC_EXCP_603;
+    pcc->excp_model =3D POWERPC_EXCP_6xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_603;
     pcc->flags =3D POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
@@ -3772,7 +3772,7 @@ POWERPC_FAMILY(603)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model =3D POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model =3D POWERPC_EXCP_603;
+    pcc->excp_model =3D POWERPC_EXCP_6xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_603;
     pcc->flags =3D POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
@@ -3811,7 +3811,7 @@ POWERPC_FAMILY(603E)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model =3D POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model =3D POWERPC_EXCP_603;
+    pcc->excp_model =3D POWERPC_EXCP_6xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_ec603e;
     pcc->flags =3D POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
@@ -3872,7 +3872,7 @@ POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model =3D POWERPC_MMU_32B;
-    pcc->excp_model =3D POWERPC_EXCP_604;
+    pcc->excp_model =3D POWERPC_EXCP_6xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_604;
     pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_BE |
@@ -3953,7 +3953,7 @@ POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model =3D POWERPC_MMU_32B;
-    pcc->excp_model =3D POWERPC_EXCP_604;
+    pcc->excp_model =3D POWERPC_EXCP_6xx;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_604;
     pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_BE |
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index ae6871a3c0f3..935f547f25f8 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1357,7 +1357,7 @@ static inline void powerpc_excp_legacy(PowerPCCPU *=
cpu, int excp)
             srr0 =3D SPR_BOOKE_CSRR0;
             srr1 =3D SPR_BOOKE_CSRR1;
             break;
-        case POWERPC_EXCP_G2:
+        case POWERPC_EXCP_6xx:
             break;
         default:
             goto excp_invalid;
@@ -1645,8 +1645,7 @@ static inline void powerpc_excp_legacy(PowerPCCPU *=
cpu, int excp)
     case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                  =
     */
     case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                 =
     */
         switch (excp_model) {
-        case POWERPC_EXCP_603:
-        case POWERPC_EXCP_G2:
+        case POWERPC_EXCP_6xx:
             /* Swap temporary saved registers with GPRs */
             if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
                 new_msr |=3D (target_ulong)1 << MSR_TGPR;
--=20
2.34.1


