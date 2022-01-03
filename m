Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BDD482E90
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 07:52:37 +0100 (CET)
Received: from localhost ([::1]:33392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4HCu-00069b-IT
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 01:52:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4Gvz-00025d-HV; Mon, 03 Jan 2022 01:35:08 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4Gvw-0007zO-Fz; Mon, 03 Jan 2022 01:35:05 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2035qNb2018393; 
 Mon, 3 Jan 2022 06:34:49 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dbpg5mmma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 06:34:49 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2036YJWv017685;
 Mon, 3 Jan 2022 06:34:46 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3daek9qppu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 06:34:46 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2036YiKm43385290
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 06:34:44 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 491D5A4068;
 Mon,  3 Jan 2022 06:34:44 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15F3BA4065;
 Mon,  3 Jan 2022 06:34:44 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  3 Jan 2022 06:34:44 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6B96D2201BB;
 Mon,  3 Jan 2022 07:34:43 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] target/ppc: Remove static inline
Date: Mon,  3 Jan 2022 07:34:33 +0100
Message-Id: <20220103063441.3424853-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220103063441.3424853-1-clg@kaod.org>
References: <20220103063441.3424853-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sItgPwWjzlFIn8Zx6bukpT9kBxHlowFh
X-Proofpoint-GUID: sItgPwWjzlFIn8Zx6bukpT9kBxHlowFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_02,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 clxscore=1034 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 mlxscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201030044
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The compiler should know better how to inline code if necessary.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index f90e616aacda..8ba93d25aee6 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -36,7 +36,7 @@
 /* Exception processing */
 #if !defined(CONFIG_USER_ONLY)
=20
-static inline void dump_syscall(CPUPPCState *env)
+static void dump_syscall(CPUPPCState *env)
 {
     qemu_log_mask(CPU_LOG_INT, "syscall r0=3D%016" PRIx64
                   " r3=3D%016" PRIx64 " r4=3D%016" PRIx64 " r5=3D%016" P=
RIx64
@@ -48,7 +48,7 @@ static inline void dump_syscall(CPUPPCState *env)
                   ppc_dump_gpr(env, 8), env->nip);
 }
=20
-static inline void dump_hcall(CPUPPCState *env)
+static void dump_hcall(CPUPPCState *env)
 {
     qemu_log_mask(CPU_LOG_INT, "hypercall r3=3D%016" PRIx64
                   " r4=3D%016" PRIx64 " r5=3D%016" PRIx64 " r6=3D%016" P=
RIx64
@@ -161,7 +161,7 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPCS=
tate *env, int excp,
  * | a         | h          | 11          | 1       | 1           | h   =
|
  * +--------------------------------------------------------------------=
+
  */
-static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, i=
nt excp,
+static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp=
,
                                       target_ulong msr,
                                       target_ulong *new_msr,
                                       target_ulong *vector)
@@ -258,7 +258,7 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu=
, int excp_model, int excp,
 #endif
 }
=20
-static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
+static void powerpc_set_excp_state(PowerPCCPU *cpu,
                                           target_ulong vector, target_ul=
ong msr)
 {
     CPUState *cs =3D CPU(cpu);
@@ -293,7 +293,7 @@ static inline void powerpc_set_excp_state(PowerPCCPU =
*cpu,
  * Note that this function should be greatly optimized when called
  * with a constant excp, from ppc_hw_interrupt
  */
-static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int exc=
p)
+static void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 {
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
@@ -1167,7 +1167,7 @@ void helper_pminsn(CPUPPCState *env, powerpc_pm_ins=
n_t insn)
 #endif /* defined(TARGET_PPC64) */
 #endif /* CONFIG_TCG */
=20
-static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulo=
ng msr)
+static void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
 {
     CPUState *cs =3D env_cpu(env);
=20
--=20
2.31.1


