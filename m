Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976EE475FAC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:47:33 +0100 (CET)
Received: from localhost ([::1]:59694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYNI-0006yu-CG
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:47:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiE-0004lx-Gf; Wed, 15 Dec 2021 12:05:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiB-0004hl-Ud; Wed, 15 Dec 2021 12:05:05 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfbvu026427; 
 Wed, 15 Dec 2021 17:04:39 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cygtrwvve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:39 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH2jgE024838;
 Wed, 15 Dec 2021 17:04:37 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3cy78e7kvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:36 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4YhK46203288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:34 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F530AE04D;
 Wed, 15 Dec 2021 17:04:34 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EEA6AE045;
 Wed, 15 Dec 2021 17:04:34 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:34 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 7A510220295;
 Wed, 15 Dec 2021 18:04:33 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 058/102] target/ppc: Remove 603e exception model
Date: Wed, 15 Dec 2021 18:03:13 +0100
Message-Id: <20211215170357.321643-46-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lLG5sWMFvzIWZ9PRO7phjaE-OieFBJLL
X-Proofpoint-GUID: lLG5sWMFvzIWZ9PRO7phjaE-OieFBJLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=745 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1034 bulkscore=0 adultscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

The 603e uses the same exception code as 603 so we don't need a
dedicated entry for it.

This is only a removal of redundant code, no functional change.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211208123029.2052625-3-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu-qom.h     |  2 --
 target/ppc/cpu_init.c    | 32 ++------------------------------
 target/ppc/excp_helper.c |  1 -
 3 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index ef9e32447473..7d299f90c74f 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -98,8 +98,6 @@ enum powerpc_excp_t {
     POWERPC_EXCP_602,
     /* PowerPC 603 exception model      */
     POWERPC_EXCP_603,
-    /* PowerPC 603e exception model     */
-    POWERPC_EXCP_603E,
     /* PowerPC G2 exception model       */
     POWERPC_EXCP_G2,
     /* PowerPC 604 exception model      */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 7e61994e3596..db065687775d 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -4721,41 +4721,13 @@ POWERPC_FAMILY(603)(ObjectClass *oc, void *data)
                  POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
 }
=20
-static void init_proc_603E(CPUPPCState *env)
-{
-    register_ne_601_sprs(env);
-    register_sdr1_sprs(env);
-    register_603_sprs(env);
-    /* Time base */
-    register_tbl(env);
-    /* hardware implementation registers */
-    /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Memory management */
-    register_low_BATs(env);
-    register_6xx_7xx_soft_tlb(env, 64, 2);
-    init_excp_603(env);
-    env->dcache_line_size =3D 32;
-    env->icache_line_size =3D 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
 POWERPC_FAMILY(603E)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(oc);
     PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
=20
     dc->desc =3D "PowerPC 603e";
-    pcc->init_proc =3D init_proc_603E;
+    pcc->init_proc =3D init_proc_603;
     pcc->check_pow =3D check_pow_hid0;
     pcc->insns_flags =3D PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
@@ -4781,7 +4753,7 @@ POWERPC_FAMILY(603E)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model =3D POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model =3D POWERPC_EXCP_603E;
+    pcc->excp_model =3D POWERPC_EXCP_603;
     pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach =3D bfd_mach_ppc_ec603e;
     pcc->flags =3D POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index f1da0e119d6f..1612b9b30e35 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -672,7 +672,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
         switch (excp_model) {
         case POWERPC_EXCP_602:
         case POWERPC_EXCP_603:
-        case POWERPC_EXCP_603E:
         case POWERPC_EXCP_G2:
             /* Swap temporary saved registers with GPRs */
             if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
--=20
2.31.1


