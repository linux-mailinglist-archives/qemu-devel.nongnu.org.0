Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2BB4760C4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:31:45 +0100 (CET)
Received: from localhost ([::1]:46870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZ44-0001m4-95
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:31:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiS-0005M3-Au; Wed, 15 Dec 2021 12:05:20 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53504
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiP-0004n7-U4; Wed, 15 Dec 2021 12:05:19 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfaO7019519; 
 Wed, 15 Dec 2021 17:04:55 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cyfv3qarm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:54 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3M8x024988;
 Wed, 15 Dec 2021 17:04:53 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3cy7qvydj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:52 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4otO38928650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52F4E11C05C;
 Wed, 15 Dec 2021 17:04:50 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12C5F11C052;
 Wed, 15 Dec 2021 17:04:50 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:50 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 493F8220295;
 Wed, 15 Dec 2021 18:04:49 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 080/102] Revert "target/ppc: Move SPR_DSISR setting to
 powerpc_excp"
Date: Wed, 15 Dec 2021 18:03:35 +0100
Message-Id: <20211215170357.321643-68-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FMR54r5hCJONzyzga4ylH_G8W38tWVr-
X-Proofpoint-ORIG-GUID: FMR54r5hCJONzyzga4ylH_G8W38tWVr-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1034
 priorityscore=1501 mlxlogscore=717 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

This reverts commit 336e91f85332dda0ede4c1d15b87a19a0fb898a2.

It breaks the --disable-tcg build:

 ../target/ppc/excp_helper.c:463:29: error: implicit declaration of
 function =E2=80=98cpu_ldl_code=E2=80=99 [-Werror=3Dimplicit-function-dec=
laration]

We should not have TCG code in powerpc_excp because some kvm-only
routines use it indirectly to dispatch interrupts. See
kvm_handle_debug, spapr_mce_req_event and
spapr_do_system_reset_on_cpu.

We can re-introduce the change once we have split the interrupt
injection code between KVM and TCG.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20211209173323.2166642-1-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index feb3fd42e26c..6ba0840e9935 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -464,15 +464,13 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
         break;
     }
     case POWERPC_EXCP_ALIGN:     /* Alignment exception                 =
     */
+        /* Get rS/rD and rA from faulting opcode */
         /*
-         * Get rS/rD and rA from faulting opcode.
-         * Note: We will only invoke ALIGN for atomic operations,
-         * so all instructions are X-form.
+         * Note: the opcode fields will not be set properly for a
+         * direct store load/store, but nobody cares as nobody
+         * actually uses direct store segments.
          */
-        {
-            uint32_t insn =3D cpu_ldl_code(env, env->nip);
-            env->spr[SPR_DSISR] |=3D (insn & 0x03FF0000) >> 16;
-        }
+        env->spr[SPR_DSISR] |=3D (env->error_code & 0x03FF0000) >> 16;
         break;
     case POWERPC_EXCP_PROGRAM:   /* Program exception                   =
     */
         switch (env->error_code & ~0xF) {
@@ -1441,6 +1439,11 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vad=
dr vaddr,
                                  int mmu_idx, uintptr_t retaddr)
 {
     CPUPPCState *env =3D cs->env_ptr;
+    uint32_t insn;
+
+    /* Restore state and reload the insn we executed, for filling in DSI=
SR.  */
+    cpu_restore_state(cs, retaddr, true);
+    insn =3D cpu_ldl_code(env, env->nip);
=20
     switch (env->mmu_model) {
     case POWERPC_MMU_SOFT_4xx:
@@ -1456,8 +1459,8 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vadd=
r vaddr,
     }
=20
     cs->exception_index =3D POWERPC_EXCP_ALIGN;
-    env->error_code =3D 0;
-    cpu_loop_exit_restore(cs, retaddr);
+    env->error_code =3D insn & 0x03FF0000;
+    cpu_loop_exit(cs);
 }
 #endif /* CONFIG_TCG */
 #endif /* !CONFIG_USER_ONLY */
--=20
2.31.1


