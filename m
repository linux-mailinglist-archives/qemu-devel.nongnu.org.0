Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6890477ECD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 22:28:49 +0100 (CET)
Received: from localhost ([::1]:33902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxyIz-000720-1O
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 16:28:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLg-00036z-24; Thu, 16 Dec 2021 15:27:32 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18162
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLZ-0007Q1-CG; Thu, 16 Dec 2021 15:27:31 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGJeXaj006493; 
 Thu, 16 Dec 2021 20:26:57 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cygmwwunh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:57 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKCQkq024529;
 Thu, 16 Dec 2021 20:26:55 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3cy7k9j4dh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:55 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKQrk845744528
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:53 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A46FAE051;
 Thu, 16 Dec 2021 20:26:53 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE005AE04D;
 Thu, 16 Dec 2021 20:26:52 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:52 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1F870220238;
 Thu, 16 Dec 2021 21:26:52 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 055/101] target/ppc: Disable unused facilities in the e600 CPU
Date: Thu, 16 Dec 2021 21:25:28 +0100
Message-Id: <20211216202614.414266-56-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RPbLALmxL1rPalAGl9C2tQyVTrG7r6pk
X-Proofpoint-ORIG-GUID: RPbLALmxL1rPalAGl9C2tQyVTrG7r6pk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1034 lowpriorityscore=0 malwarescore=0
 mlxlogscore=678 mlxscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The e600 CPU is a successor of the 7448 and like all the 7450s CPUs,
it has an optional software TLB feature.

We have determined that there is no OS software support for the 7450
software TLB available these days. See the previous commit for more
information.

This patch disables the SPRs and instructions related to software TLB
from the e600 CPU.

No functional change intended. These facilities should be used by the
OS in interrupt handlers for interrupts that QEMU never generates.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211130230123.781844-3-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu_init.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 509df35d0907..962acf295fd1 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2537,9 +2537,6 @@ static void init_excp_7450(CPUPPCState *env)
     env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
     env->excp_vectors[POWERPC_EXCP_PERFM]    =3D 0x00000F00;
     env->excp_vectors[POWERPC_EXCP_VPU]      =3D 0x00000F20;
-    env->excp_vectors[POWERPC_EXCP_IFTLB]    =3D 0x00001000;
-    env->excp_vectors[POWERPC_EXCP_DLTLB]    =3D 0x00001100;
-    env->excp_vectors[POWERPC_EXCP_DSTLB]    =3D 0x00001200;
     env->excp_vectors[POWERPC_EXCP_IABR]     =3D 0x00001300;
     env->excp_vectors[POWERPC_EXCP_SMI]      =3D 0x00001400;
     env->excp_vectors[POWERPC_EXCP_VPUA]     =3D 0x00001600;
@@ -6643,7 +6640,6 @@ static void init_proc_e600(CPUPPCState *env)
     /* Memory management */
     register_low_BATs(env);
     register_high_BATs(env);
-    register_74xx_soft_tlb(env, 128, 2);
     init_excp_7450(env);
     env->dcache_line_size =3D 32;
     env->icache_line_size =3D 32;
@@ -6667,7 +6663,7 @@ POWERPC_FAMILY(e600)(ObjectClass *oc, void *data)
                        PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
                        PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA | PPC_74xx_TLB |
+                       PPC_MEM_TLBIA |
                        PPC_SEGMENT | PPC_EXTERN |
                        PPC_ALTIVEC;
     pcc->insns_flags2 =3D PPC_NONE;
--=20
2.31.1


