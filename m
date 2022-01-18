Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D97149288C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:38:44 +0100 (CET)
Received: from localhost ([::1]:47048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pdD-0006pm-Ap
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:38:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDk-0004CM-CC; Tue, 18 Jan 2022 08:08:22 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDg-0000FK-5E; Tue, 18 Jan 2022 08:08:20 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20ICSXBJ023513; 
 Tue, 18 Jan 2022 13:07:41 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnwkb9bxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:41 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID7e3n008328;
 Tue, 18 Jan 2022 13:07:40 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3dknw94h78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:39 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20ID7bqP39649700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:37 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 913074C04A;
 Tue, 18 Jan 2022 13:07:37 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D29B4C05E;
 Tue, 18 Jan 2022 13:07:37 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:37 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 9651B2201EB;
 Tue, 18 Jan 2022 14:07:36 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 07/31] target/ppc: Remove last user of .load_state_old
Date: Tue, 18 Jan 2022 14:07:06 +0100
Message-Id: <20220118130730.1927983-8-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WWuwvkPw1zUnJEL1huPTmy-l0vz-lVKT
X-Proofpoint-GUID: WWuwvkPw1zUnJEL1huPTmy-l0vz-lVKT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_03,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxlogscore=751
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201180081
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This breaks migration compatibility from (very) old versions of
QEMU. This should not be a problem for the pseries machine for which
migration is only supported on recent QEMUs ( > 2.x). There is no
clear status on what is supported or not for the other machines. Let's
move forward and remove the .load_state_old handler.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20220118104150.1899661-2-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/machine.c | 112 -------------------------------------------
 1 file changed, 112 deletions(-)

diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 756d8de5d8dd..df547385ff1e 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -23,117 +23,6 @@ static void post_load_update_msr(CPUPPCState *env)
     pmu_update_summaries(env);
 }
=20
-static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
-{
-    PowerPCCPU *cpu =3D opaque;
-    CPUPPCState *env =3D &cpu->env;
-    unsigned int i, j;
-    target_ulong sdr1;
-    uint32_t fpscr, vscr;
-#if defined(TARGET_PPC64)
-    int32_t slb_nr;
-#endif
-    target_ulong xer;
-
-    for (i =3D 0; i < 32; i++) {
-        qemu_get_betls(f, &env->gpr[i]);
-    }
-#if !defined(TARGET_PPC64)
-    for (i =3D 0; i < 32; i++) {
-        qemu_get_betls(f, &env->gprh[i]);
-    }
-#endif
-    qemu_get_betls(f, &env->lr);
-    qemu_get_betls(f, &env->ctr);
-    for (i =3D 0; i < 8; i++) {
-        qemu_get_be32s(f, &env->crf[i]);
-    }
-    qemu_get_betls(f, &xer);
-    cpu_write_xer(env, xer);
-    qemu_get_betls(f, &env->reserve_addr);
-    qemu_get_betls(f, &env->msr);
-    for (i =3D 0; i < 4; i++) {
-        qemu_get_betls(f, &env->tgpr[i]);
-    }
-    for (i =3D 0; i < 32; i++) {
-        union {
-            float64 d;
-            uint64_t l;
-        } u;
-        u.l =3D qemu_get_be64(f);
-        *cpu_fpr_ptr(env, i) =3D u.d;
-    }
-    qemu_get_be32s(f, &fpscr);
-    env->fpscr =3D fpscr;
-    qemu_get_sbe32s(f, &env->access_type);
-#if defined(TARGET_PPC64)
-    qemu_get_betls(f, &env->spr[SPR_ASR]);
-    qemu_get_sbe32s(f, &slb_nr);
-#endif
-    qemu_get_betls(f, &sdr1);
-    for (i =3D 0; i < 32; i++) {
-        qemu_get_betls(f, &env->sr[i]);
-    }
-    for (i =3D 0; i < 2; i++) {
-        for (j =3D 0; j < 8; j++) {
-            qemu_get_betls(f, &env->DBAT[i][j]);
-        }
-    }
-    for (i =3D 0; i < 2; i++) {
-        for (j =3D 0; j < 8; j++) {
-            qemu_get_betls(f, &env->IBAT[i][j]);
-        }
-    }
-    qemu_get_sbe32s(f, &env->nb_tlb);
-    qemu_get_sbe32s(f, &env->tlb_per_way);
-    qemu_get_sbe32s(f, &env->nb_ways);
-    qemu_get_sbe32s(f, &env->last_way);
-    qemu_get_sbe32s(f, &env->id_tlbs);
-    qemu_get_sbe32s(f, &env->nb_pids);
-    if (env->tlb.tlb6) {
-        /* XXX assumes 6xx */
-        for (i =3D 0; i < env->nb_tlb; i++) {
-            qemu_get_betls(f, &env->tlb.tlb6[i].pte0);
-            qemu_get_betls(f, &env->tlb.tlb6[i].pte1);
-            qemu_get_betls(f, &env->tlb.tlb6[i].EPN);
-        }
-    }
-    for (i =3D 0; i < 4; i++) {
-        qemu_get_betls(f, &env->pb[i]);
-    }
-    for (i =3D 0; i < 1024; i++) {
-        qemu_get_betls(f, &env->spr[i]);
-    }
-    if (!cpu->vhyp) {
-        ppc_store_sdr1(env, sdr1);
-    }
-    qemu_get_be32s(f, &vscr);
-    ppc_store_vscr(env, vscr);
-    qemu_get_be64s(f, &env->spe_acc);
-    qemu_get_be32s(f, &env->spe_fscr);
-    qemu_get_betls(f, &env->msr_mask);
-    qemu_get_be32s(f, &env->flags);
-    qemu_get_sbe32s(f, &env->error_code);
-    qemu_get_be32s(f, &env->pending_interrupts);
-    qemu_get_be32s(f, &env->irq_input_state);
-    for (i =3D 0; i < POWERPC_EXCP_NB; i++) {
-        qemu_get_betls(f, &env->excp_vectors[i]);
-    }
-    qemu_get_betls(f, &env->excp_prefix);
-    qemu_get_betls(f, &env->ivor_mask);
-    qemu_get_betls(f, &env->ivpr_mask);
-    qemu_get_betls(f, &env->hreset_vector);
-    qemu_get_betls(f, &env->nip);
-    qemu_get_sbetl(f); /* Discard unused hflags */
-    qemu_get_sbetl(f); /* Discard unused hflags_nmsr */
-    qemu_get_sbe32(f); /* Discard unused mmu_idx */
-    qemu_get_sbe32(f); /* Discard unused power_mode */
-
-    post_load_update_msr(env);
-
-    return 0;
-}
-
 static int get_avr(QEMUFile *f, void *pv, size_t size,
                    const VMStateField *field)
 {
@@ -808,7 +697,6 @@ const VMStateDescription vmstate_ppc_cpu =3D {
     .version_id =3D 5,
     .minimum_version_id =3D 5,
     .minimum_version_id_old =3D 4,
-    .load_state_old =3D cpu_load_old,
     .pre_save =3D cpu_pre_save,
     .post_load =3D cpu_post_load,
     .fields =3D (VMStateField[]) {
--=20
2.31.1


