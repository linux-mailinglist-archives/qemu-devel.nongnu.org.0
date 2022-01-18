Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAEE49240A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 11:46:13 +0100 (CET)
Received: from localhost ([::1]:41934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9m0C-00051m-AG
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 05:46:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9lwM-0003FI-Mr; Tue, 18 Jan 2022 05:42:18 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9lwK-0001oa-Rr; Tue, 18 Jan 2022 05:42:14 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20I9aF1j010135; 
 Tue, 18 Jan 2022 10:41:59 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnkwhhw5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 10:41:58 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20IAYsqg008960;
 Tue, 18 Jan 2022 10:41:56 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3dknw91ww6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 10:41:56 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20IAfrPH31392150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 10:41:53 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D12EAAE074;
 Tue, 18 Jan 2022 10:41:53 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D5A6AE058;
 Tue, 18 Jan 2022 10:41:53 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 10:41:53 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D28B92201B7;
 Tue, 18 Jan 2022 11:41:52 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] target/ppc: Finish removal of 401/403 CPUs
Date: Tue, 18 Jan 2022 11:41:50 +0100
Message-Id: <20220118104150.1899661-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118104150.1899661-1-clg@kaod.org>
References: <20220118104150.1899661-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -xc_amePiFZGHbGMeE5N8LpZUS2XfcT1
X-Proofpoint-GUID: -xc_amePiFZGHbGMeE5N8LpZUS2XfcT1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_02,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=729 lowpriorityscore=0 mlxscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1034
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180064
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit c8f49e6b938e ("target/ppc: remove 401/403 CPUs") left a few
things behind.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20220117091541.1615807-1-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Changes in v2:

 - Removal of the 403 protection registers

 target/ppc/cpu.h         |  1 -
 target/ppc/helper.h      |  1 -
 target/ppc/cpu-models.c  |  1 -
 target/ppc/machine.c     | 24 ------------------------
 target/ppc/misc_helper.c |  9 ---------
 target/ppc/translate.c   | 16 +---------------
 6 files changed, 1 insertion(+), 51 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index f99cd0ea92fc..2560b70c5f10 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1133,7 +1133,6 @@ struct CPUPPCState {
     int nb_pids;     /* Number of available PID registers */
     int tlb_type;    /* Type of TLB we're dealing with */
     ppc_tlb_t tlb;   /* TLB is optional. Allocate them only if needed */
-    target_ulong pb[4]; /* 403 dedicated access protection registers */
     bool tlb_dirty;  /* Set to non-zero when modifying TLB */
     bool kvm_sw_tlb; /* non-zero if KVM SW TLB API is active */
     uint32_t tlb_need_flush; /* Delayed flush needed */
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f9c72dcd504d..d318837ea5cc 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -703,7 +703,6 @@ DEF_HELPER_FLAGS_2(store_hdecr, TCG_CALL_NO_RWG, void=
, env, tl)
 DEF_HELPER_FLAGS_2(store_vtb, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(store_tbu40, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_2(store_hid0_601, void, env, tl)
-DEF_HELPER_3(store_403_pbr, void, env, i32, tl)
 DEF_HELPER_FLAGS_1(load_40x_pit, TCG_CALL_NO_RWG, tl, env)
 DEF_HELPER_FLAGS_2(store_40x_pit, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(store_40x_tcr, TCG_CALL_NO_RWG, void, env, tl)
diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
index c9fcb6119f40..96fec9c2e501 100644
--- a/target/ppc/cpu-models.c
+++ b/target/ppc/cpu-models.c
@@ -750,7 +750,6 @@
 /* PowerPC CPU aliases                                                  =
   */
=20
 PowerPCCPUAlias ppc_cpu_aliases[] =3D {
-    { "403", "403gc" },
     { "405", "405d4" },
     { "405cr", "405crc" },
     { "405gp", "405gpd" },
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index df547385ff1e..733a22d74407 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -598,25 +598,6 @@ static bool tlbemb_needed(void *opaque)
     return env->nb_tlb && (env->tlb_type =3D=3D TLB_EMB);
 }
=20
-static bool pbr403_needed(void *opaque)
-{
-    PowerPCCPU *cpu =3D opaque;
-    uint32_t pvr =3D cpu->env.spr[SPR_PVR];
-
-    return (pvr & 0xffff0000) =3D=3D 0x00200000;
-}
-
-static const VMStateDescription vmstate_pbr403 =3D {
-    .name =3D "cpu/pbr403",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
-    .needed =3D pbr403_needed,
-    .fields =3D (VMStateField[]) {
-        VMSTATE_UINTTL_ARRAY(env.pb, PowerPCCPU, 4),
-        VMSTATE_END_OF_LIST()
-    },
-};
-
 static const VMStateDescription vmstate_tlbemb =3D {
     .name =3D "cpu/tlb6xx",
     .version_id =3D 1,
@@ -628,13 +609,8 @@ static const VMStateDescription vmstate_tlbemb =3D {
                                             env.nb_tlb,
                                             vmstate_tlbemb_entry,
                                             ppcemb_tlb_t),
-        /* 403 protection registers */
         VMSTATE_END_OF_LIST()
     },
-    .subsections =3D (const VMStateDescription*[]) {
-        &vmstate_pbr403,
-        NULL
-    }
 };
=20
 static const VMStateDescription vmstate_tlbmas_entry =3D {
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index c33f5f39b90b..1bcefa7c843c 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -226,15 +226,6 @@ void helper_store_hid0_601(CPUPPCState *env, target_=
ulong val)
     }
 }
=20
-void helper_store_403_pbr(CPUPPCState *env, uint32_t num, target_ulong v=
alue)
-{
-    if (likely(env->pb[num] !=3D value)) {
-        env->pb[num] =3D value;
-        /* Should be optimized */
-        tlb_flush(env_cpu(env));
-    }
-}
-
 void helper_store_40x_dbcr0(CPUPPCState *env, target_ulong val)
 {
     /* Bits 26 & 27 affect single-stepping. */
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index abbc3a5bb9f0..059956bc59b3 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -911,22 +911,8 @@ void spr_write_booke_tsr(DisasContext *ctx, int sprn=
, int gprn)
 }
 #endif
=20
-/* PowerPC 403 specific registers */
-/* PBL1 / PBU1 / PBL2 / PBU2 */
+/* PIR */
 #if !defined(CONFIG_USER_ONLY)
-void spr_read_403_pbr(DisasContext *ctx, int gprn, int sprn)
-{
-    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
-                  offsetof(CPUPPCState, pb[sprn - SPR_403_PBL1]));
-}
-
-void spr_write_403_pbr(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv_i32 t0 =3D tcg_const_i32(sprn - SPR_403_PBL1);
-    gen_helper_store_403_pbr(cpu_env, t0, cpu_gpr[gprn]);
-    tcg_temp_free_i32(t0);
-}
-
 void spr_write_pir(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv t0 =3D tcg_temp_new();
--=20
2.31.1


