Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254714A46B2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 13:17:10 +0100 (CET)
Received: from localhost ([::1]:33998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEVcI-0001e4-Vg
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 07:17:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYk-00064v-1L; Mon, 31 Jan 2022 06:09:27 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYd-00056w-UZ; Mon, 31 Jan 2022 06:09:21 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VB68Ww016450; 
 Mon, 31 Jan 2022 11:08:52 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dwf7y7hpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:51 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VB29gW006649;
 Mon, 31 Jan 2022 11:08:50 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3dvw79ag07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:50 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20VAx1Zo28901774
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 10:59:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA74C4C059;
 Mon, 31 Jan 2022 11:08:47 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C8F24C052;
 Mon, 31 Jan 2022 11:08:47 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 31 Jan 2022 11:08:47 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.57.185])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B24652201C1;
 Mon, 31 Jan 2022 12:08:46 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 41/41] target/ppc: Remove support for the PowerPC 602 CPU
Date: Mon, 31 Jan 2022 12:08:11 +0100
Message-Id: <20220131110811.619053-42-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131110811.619053-1-clg@kaod.org>
References: <20220131110811.619053-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4fapoekuh-ko-y5P3kebBgQB0UEYxHsb
X-Proofpoint-GUID: 4fapoekuh-ko-y5P3kebBgQB0UEYxHsb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1034
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201310074
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, TVD_SUBJ_WIPE_DEBT=1.004,
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 602 was derived from the PowerPC 603, for the gaming market it
seems. It was hardly used and no firmware supporting the CPU could be
found. Drop support.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu-models.h      |   1 -
 target/ppc/cpu.h             |   8 +-
 target/ppc/helper.h          |   1 -
 target/ppc/cpu-models.c      |   2 -
 target/ppc/cpu_init.c        | 147 -----------------------------------
 target/ppc/excp_helper.c     |   1 -
 target/ppc/int_helper.c      |  21 -----
 target/ppc/mfrom_table_gen.c |  34 --------
 target/ppc/translate.c       |  30 -------
 target/ppc/mfrom_table.c.inc |  78 -------------------
 10 files changed, 1 insertion(+), 322 deletions(-)
 delete mode 100644 target/ppc/mfrom_table_gen.c
 delete mode 100644 target/ppc/mfrom_table.c.inc

diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
index bf1dc7e5ca3d..612978a3fbd2 100644
--- a/target/ppc/cpu-models.h
+++ b/target/ppc/cpu-models.h
@@ -208,7 +208,6 @@ enum {
     CPU_POWERPC_601_v0             =3D 0x00010001,
     CPU_POWERPC_601_v1             =3D 0x00010001,
     CPU_POWERPC_601_v2             =3D 0x00010002,
-    CPU_POWERPC_602                =3D 0x00050100,
     CPU_POWERPC_603                =3D 0x00030100,
     CPU_POWERPC_603E_v11           =3D 0x00060101,
     CPU_POWERPC_603E_v12           =3D 0x00060102,
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 66e13075c3df..dcd83b503c62 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -321,9 +321,7 @@ typedef enum {
 #define MSR_UCLE 26 /* User-mode cache lock enable for BookE            =
     */
 #define MSR_VR   25 /* altivec available                            x hf=
lags */
 #define MSR_SPE  25 /* SPE enable for BookE                         x hf=
lags */
-#define MSR_AP   23 /* Access privilege state on 602                  hf=
lags */
 #define MSR_VSX  23 /* Vector Scalar Extension (ISA 2.06 and later) x hf=
lags */
-#define MSR_SA   22 /* Supervisor access mode on 602                  hf=
lags */
 #define MSR_S    22 /* Secure state                                     =
     */
 #define MSR_KEY  19 /* key bit on 603e                                  =
     */
 #define MSR_POW  18 /* Power management                                 =
     */
@@ -477,9 +475,7 @@ typedef enum {
 #define msr_ucle ((env->msr >> MSR_UCLE) & 1)
 #define msr_vr   ((env->msr >> MSR_VR)   & 1)
 #define msr_spe  ((env->msr >> MSR_SPE)  & 1)
-#define msr_ap   ((env->msr >> MSR_AP)   & 1)
 #define msr_vsx  ((env->msr >> MSR_VSX)  & 1)
-#define msr_sa   ((env->msr >> MSR_SA)   & 1)
 #define msr_key  ((env->msr >> MSR_KEY)  & 1)
 #define msr_pow  ((env->msr >> MSR_POW)  & 1)
 #define msr_tgpr ((env->msr >> MSR_TGPR) & 1)
@@ -2142,8 +2138,6 @@ enum {
     PPC_MFTB           =3D 0x0000000000000200ULL,
=20
     /* Fixed-point unit extensions                                      =
     */
-    /*   PowerPC 602 specific                                           =
     */
-    PPC_602_SPEC       =3D 0x0000000000000400ULL,
     /*   isel instruction                                               =
     */
     PPC_ISEL           =3D 0x0000000000000800ULL,
     /*   popcntb instruction                                            =
     */
@@ -2245,7 +2239,7 @@ enum {
 #define PPC_TCG_INSNS  (PPC_INSNS_BASE | PPC_POWER | PPC_POWER2 \
                         | PPC_POWER_RTC | PPC_POWER_BR | PPC_64B \
                         | PPC_64BX | PPC_64H | PPC_WAIT | PPC_MFTB \
-                        | PPC_602_SPEC | PPC_ISEL | PPC_POPCNTB \
+                        | PPC_ISEL | PPC_POPCNTB \
                         | PPC_STRING | PPC_FLOAT | PPC_FLOAT_EXT \
                         | PPC_FLOAT_FSQRT | PPC_FLOAT_FRES \
                         | PPC_FLOAT_FRSQRTE | PPC_FLOAT_FRSQRTES \
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index bdbbd5e1d90f..f2e5060910de 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -646,7 +646,6 @@ DEF_HELPER_FLAGS_2(slbieg, TCG_CALL_NO_RWG, void, env=
, tl)
 DEF_HELPER_FLAGS_2(load_sr, TCG_CALL_NO_RWG, tl, env, tl)
 DEF_HELPER_FLAGS_3(store_sr, TCG_CALL_NO_RWG, void, env, tl, tl)
=20
-DEF_HELPER_FLAGS_1(602_mfrom, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_1(msgsnd, void, tl)
 DEF_HELPER_2(msgclr, void, env, tl)
 DEF_HELPER_1(book3s_msgsnd, void, tl)
diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
index 764afe5a2afb..a2c720cc4d0c 100644
--- a/target/ppc/cpu-models.c
+++ b/target/ppc/cpu-models.c
@@ -428,8 +428,6 @@
                 "PowerPC 601v1")
     POWERPC_DEF("601_v2",        CPU_POWERPC_601_v2,                 601=
v,
                 "PowerPC 601v2")
-    POWERPC_DEF("602",           CPU_POWERPC_602,                    602=
,
-                "PowerPC 602")
     POWERPC_DEF("603",           CPU_POWERPC_603,                    603=
,
                 "PowerPC 603")
     POWERPC_DEF("603e_v1.1",     CPU_POWERPC_603E_v11,               603=
E,
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 23a13036b211..bf60529d3715 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -749,54 +749,6 @@ static void register_G2_sprs(CPUPPCState *env)
                  0x00000000);
 }
=20
-/* SPR specific to PowerPC 602 implementation */
-static void register_602_sprs(CPUPPCState *env)
-{
-    /* ESA registers */
-    /* XXX : not implemented */
-    spr_register(env, SPR_SER, "SER",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_SEBR, "SEBR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_ESASRR, "ESASRR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Floating point status */
-    /* XXX : not implemented */
-    spr_register(env, SPR_SP, "SP",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_LT, "LT",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Watchdog timer */
-    /* XXX : not implemented */
-    spr_register(env, SPR_TCR, "TCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Interrupt base */
-    spr_register(env, SPR_IBR, "IBR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_IABR, "IABR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
 /* SPR specific to PowerPC 601 implementation */
 static void register_601_sprs(CPUPPCState *env)
 {
@@ -2128,33 +2080,6 @@ static void init_excp_601(CPUPPCState *env)
 #endif
 }
=20
-static void init_excp_602(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    /* XXX: exception prefix has a special behavior on 602 */
-    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000100;
-    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
-    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000300;
-    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000400;
-    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
-    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
-    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
-    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
-    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
-    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
-    env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
-    env->excp_vectors[POWERPC_EXCP_IFTLB]    =3D 0x00001000;
-    env->excp_vectors[POWERPC_EXCP_DLTLB]    =3D 0x00001100;
-    env->excp_vectors[POWERPC_EXCP_DSTLB]    =3D 0x00001200;
-    env->excp_vectors[POWERPC_EXCP_IABR]     =3D 0x00001300;
-    env->excp_vectors[POWERPC_EXCP_SMI]      =3D 0x00001400;
-    env->excp_vectors[POWERPC_EXCP_WDT]      =3D 0x00001500;
-    env->excp_vectors[POWERPC_EXCP_EMUL]     =3D 0x00001600;
-    /* Hardware reset vector */
-    env->hreset_vector =3D 0x00000100UL;
-#endif
-}
-
 static void init_excp_603(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -4081,76 +4006,6 @@ POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
     pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK | POWERPC_FLAG=
_HID0_LE;
 }
=20
-static void init_proc_602(CPUPPCState *env)
-{
-    register_ne_601_sprs(env);
-    register_sdr1_sprs(env);
-    register_602_sprs(env);
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
-    init_excp_602(env);
-    env->dcache_line_size =3D 32;
-    env->icache_line_size =3D 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(602)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc =3D DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
-
-    dc->desc =3D "PowerPC 602";
-    pcc->init_proc =3D init_proc_602;
-    pcc->check_pow =3D check_pow_hid0;
-    pcc->insns_flags =3D PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_6xx_TLB | PPC_MEM_TLBSYNC |
-                       PPC_SEGMENT | PPC_602_SPEC;
-    pcc->msr_mask =3D (1ull << MSR_VSX) |
-                    (1ull << MSR_SA) |
-                    (1ull << MSR_POW) |
-                    (1ull << MSR_TGPR) |
-                    (1ull << MSR_ILE) |
-                    (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_FE0) |
-                    (1ull << MSR_SE) |
-                    (1ull << MSR_DE) |
-                    (1ull << MSR_FE1) |
-                    (1ull << MSR_EP) |
-                    (1ull << MSR_IR) |
-                    (1ull << MSR_DR) |
-                    (1ull << MSR_RI) |
-                    (1ull << MSR_LE);
-    /* XXX: 602 MMU is quite specific. Should add a special case */
-    pcc->mmu_model =3D POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model =3D POWERPC_EXCP_602;
-    pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach =3D bfd_mach_ppc_602;
-    pcc->flags =3D POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
-                 POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
-}
-
 static void init_proc_603(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
@@ -8271,8 +8126,6 @@ static void ppc_cpu_reset(DeviceState *dev)
=20
     msr =3D (target_ulong)0;
     msr |=3D (target_ulong)MSR_HVB;
-    msr |=3D (target_ulong)0 << MSR_AP; /* TO BE CHECKED */
-    msr |=3D (target_ulong)0 << MSR_SA; /* TO BE CHECKED */
     msr |=3D (target_ulong)1 << MSR_EP;
 #if defined(DO_SINGLE_STEP) && 0
     /* Single step trace mode */
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 4e6bb87b70a3..c107953dec10 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1422,7 +1422,6 @@ static inline void powerpc_excp_legacy(PowerPCCPU *=
cpu, int excp)
     case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                  =
     */
     case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                 =
     */
         switch (excp_model) {
-        case POWERPC_EXCP_602:
         case POWERPC_EXCP_603:
         case POWERPC_EXCP_G2:
             /* Swap temporary saved registers with GPRs */
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 9bc327bcba5a..d7765fd3e3d8 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -488,27 +488,6 @@ target_ulong helper_divso(CPUPPCState *env, target_u=
long arg1,
     }
 }
=20
-/***********************************************************************=
******/
-/* 602 specific instructions */
-/* mfrom is the most crazy instruction ever seen, imho ! */
-/* Real implementation uses a ROM table. Do the same */
-/*
- * Extremely decomposed:
- *                      -arg / 256
- * return 256 * log10(10           + 1.0) + 0.5
- */
-#if !defined(CONFIG_USER_ONLY)
-target_ulong helper_602_mfrom(target_ulong arg)
-{
-    if (likely(arg < 602)) {
-#include "mfrom_table.c.inc"
-        return mfrom_ROM_table[arg];
-    } else {
-        return 0;
-    }
-}
-#endif
-
 /***********************************************************************=
******/
 /* Altivec extension helpers */
 #if defined(HOST_WORDS_BIGENDIAN)
diff --git a/target/ppc/mfrom_table_gen.c b/target/ppc/mfrom_table_gen.c
deleted file mode 100644
index f96c4268ba70..000000000000
--- a/target/ppc/mfrom_table_gen.c
+++ /dev/null
@@ -1,34 +0,0 @@
-#define _GNU_SOURCE
-#include "qemu/osdep.h"
-#include <math.h>
-
-int main(void)
-{
-    double d;
-    uint8_t n;
-    int i;
-
-    printf("static const uint8_t mfrom_ROM_table[602] =3D\n{\n    ");
-    for (i =3D 0; i < 602; i++) {
-        /*
-         * Extremely decomposed:
-         *                    -T0 / 256
-         * T0 =3D 256 * log10(10          + 1.0) + 0.5
-         */
-        d =3D -i;
-        d /=3D 256.0;
-        d =3D exp10(d);
-        d +=3D 1.0;
-        d =3D log10(d);
-        d *=3D 256;
-        d +=3D 0.5;
-        n =3D d;
-        printf("%3d, ", n);
-        if ((i & 7) =3D=3D 7) {
-            printf("\n    ");
-        }
-    }
-    printf("\n};\n");
-
-    return 0;
-}
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d61c6f0e8f91..c2f436f8d3bc 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6272,33 +6272,6 @@ static void gen_srq(DisasContext *ctx)
     }
 }
=20
-/* PowerPC 602 specific instructions */
-
-/* dsa  */
-static void gen_dsa(DisasContext *ctx)
-{
-    /* XXX: TODO */
-    gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
-}
-
-/* esa */
-static void gen_esa(DisasContext *ctx)
-{
-    /* XXX: TODO */
-    gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
-}
-
-/* mfrom */
-static void gen_mfrom(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
-#else
-    CHK_SV;
-    gen_helper_602_mfrom(cpu_gpr[rD(ctx->opcode)], cpu_gpr[rA(ctx->opcod=
e)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
 /* 602 - 603 - G2 TLB management */
=20
 /* tlbld */
@@ -7779,9 +7752,6 @@ GEN_HANDLER(sriq, 0x1F, 0x18, 0x15, 0x00000000, PPC=
_POWER_BR),
 GEN_HANDLER(srliq, 0x1F, 0x18, 0x17, 0x00000000, PPC_POWER_BR),
 GEN_HANDLER(srlq, 0x1F, 0x18, 0x16, 0x00000000, PPC_POWER_BR),
 GEN_HANDLER(srq, 0x1F, 0x18, 0x14, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(dsa, 0x1F, 0x14, 0x13, 0x03FFF801, PPC_602_SPEC),
-GEN_HANDLER(esa, 0x1F, 0x14, 0x12, 0x03FFF801, PPC_602_SPEC),
-GEN_HANDLER(mfrom, 0x1F, 0x09, 0x08, 0x03E0F801, PPC_602_SPEC),
 GEN_HANDLER2(tlbld_6xx, "tlbld", 0x1F, 0x12, 0x1E, 0x03FF0001, PPC_6xx_T=
LB),
 GEN_HANDLER2(tlbli_6xx, "tlbli", 0x1F, 0x12, 0x1F, 0x03FF0001, PPC_6xx_T=
LB),
 GEN_HANDLER(clf, 0x1F, 0x16, 0x03, 0x03E00000, PPC_POWER),
diff --git a/target/ppc/mfrom_table.c.inc b/target/ppc/mfrom_table.c.inc
deleted file mode 100644
index 1653b974a434..000000000000
--- a/target/ppc/mfrom_table.c.inc
+++ /dev/null
@@ -1,78 +0,0 @@
-static const uint8_t mfrom_ROM_table[602] =3D {
-     77,  77,  76,  76,  75,  75,  74,  74,
-     73,  73,  72,  72,  71,  71,  70,  70,
-     69,  69,  68,  68,  68,  67,  67,  66,
-     66,  65,  65,  64,  64,  64,  63,  63,
-     62,  62,  61,  61,  61,  60,  60,  59,
-     59,  58,  58,  58,  57,  57,  56,  56,
-     56,  55,  55,  54,  54,  54,  53,  53,
-     53,  52,  52,  51,  51,  51,  50,  50,
-     50,  49,  49,  49,  48,  48,  47,  47,
-     47,  46,  46,  46,  45,  45,  45,  44,
-     44,  44,  43,  43,  43,  42,  42,  42,
-     42,  41,  41,  41,  40,  40,  40,  39,
-     39,  39,  39,  38,  38,  38,  37,  37,
-     37,  37,  36,  36,  36,  35,  35,  35,
-     35,  34,  34,  34,  34,  33,  33,  33,
-     33,  32,  32,  32,  32,  31,  31,  31,
-     31,  30,  30,  30,  30,  29,  29,  29,
-     29,  28,  28,  28,  28,  28,  27,  27,
-     27,  27,  26,  26,  26,  26,  26,  25,
-     25,  25,  25,  25,  24,  24,  24,  24,
-     24,  23,  23,  23,  23,  23,  23,  22,
-     22,  22,  22,  22,  21,  21,  21,  21,
-     21,  21,  20,  20,  20,  20,  20,  20,
-     19,  19,  19,  19,  19,  19,  19,  18,
-     18,  18,  18,  18,  18,  17,  17,  17,
-     17,  17,  17,  17,  16,  16,  16,  16,
-     16,  16,  16,  16,  15,  15,  15,  15,
-     15,  15,  15,  15,  14,  14,  14,  14,
-     14,  14,  14,  14,  13,  13,  13,  13,
-     13,  13,  13,  13,  13,  12,  12,  12,
-     12,  12,  12,  12,  12,  12,  12,  11,
-     11,  11,  11,  11,  11,  11,  11,  11,
-     11,  11,  10,  10,  10,  10,  10,  10,
-     10,  10,  10,  10,  10,   9,   9,   9,
-      9,   9,   9,   9,   9,   9,   9,   9,
-      9,   9,   8,   8,   8,   8,   8,   8,
-      8,   8,   8,   8,   8,   8,   8,   8,
-      7,   7,   7,   7,   7,   7,   7,   7,
-      7,   7,   7,   7,   7,   7,   7,   7,
-      7,   6,   6,   6,   6,   6,   6,   6,
-      6,   6,   6,   6,   6,   6,   6,   6,
-      6,   6,   6,   6,   5,   5,   5,   5,
-      5,   5,   5,   5,   5,   5,   5,   5,
-      5,   5,   5,   5,   5,   5,   5,   5,
-      5,   5,   5,   4,   4,   4,   4,   4,
-      4,   4,   4,   4,   4,   4,   4,   4,
-      4,   4,   4,   4,   4,   4,   4,   4,
-      4,   4,   4,   4,   4,   4,   4,   3,
-      3,   3,   3,   3,   3,   3,   3,   3,
-      3,   3,   3,   3,   3,   3,   3,   3,
-      3,   3,   3,   3,   3,   3,   3,   3,
-      3,   3,   3,   3,   3,   3,   3,   3,
-      3,   3,   3,   3,   3,   2,   2,   2,
-      2,   2,   2,   2,   2,   2,   2,   2,
-      2,   2,   2,   2,   2,   2,   2,   2,
-      2,   2,   2,   2,   2,   2,   2,   2,
-      2,   2,   2,   2,   2,   2,   2,   2,
-      2,   2,   2,   2,   2,   2,   2,   2,
-      2,   2,   2,   2,   2,   2,   2,   2,
-      2,   2,   2,   2,   2,   2,   1,   1,
-      1,   1,   1,   1,   1,   1,   1,   1,
-      1,   1,   1,   1,   1,   1,   1,   1,
-      1,   1,   1,   1,   1,   1,   1,   1,
-      1,   1,   1,   1,   1,   1,   1,   1,
-      1,   1,   1,   1,   1,   1,   1,   1,
-      1,   1,   1,   1,   1,   1,   1,   1,
-      1,   1,   1,   1,   1,   1,   1,   1,
-      1,   1,   1,   1,   1,   1,   1,   1,
-      1,   1,   1,   1,   1,   1,   1,   1,
-      1,   1,   1,   1,   1,   1,   1,   1,
-      1,   1,   1,   1,   1,   1,   1,   1,
-      1,   1,   1,   1,   1,   1,   1,   1,
-      1,   1,   1,   1,   1,   1,   1,   1,
-      1,   1,   1,   1,   1,   1,   1,   1,
-      1,   1,   1,   1,   1,   1,   1,   1,
-      1,   0,
-};
--=20
2.34.1


