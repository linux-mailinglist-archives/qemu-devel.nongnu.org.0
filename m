Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E523E4A86F6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:50:00 +0100 (CET)
Received: from localhost ([::1]:41426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFdQt-0001nC-Vs
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:50:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nFd60-0001Li-Pd; Thu, 03 Feb 2022 09:28:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nFd5v-00081D-UZ; Thu, 03 Feb 2022 09:28:24 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213DoENb010777; 
 Thu, 3 Feb 2022 14:28:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e03fn7nb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 14:28:10 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 213EN0BR039137;
 Thu, 3 Feb 2022 14:28:09 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e03fn7na9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 14:28:09 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213EQvIi027931;
 Thu, 3 Feb 2022 14:28:07 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3dvw7a6te0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 14:28:06 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 213ES4Xr37028346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 14:28:04 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71B9B52051;
 Thu,  3 Feb 2022 14:28:04 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id F283C52057;
 Thu,  3 Feb 2022 14:28:03 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.38.172])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E374B220158;
 Thu,  3 Feb 2022 15:28:02 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Remove PowerPC 601 CPUs
Date: Thu,  3 Feb 2022 15:27:56 +0100
Message-Id: <20220203142756.1302515-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _cSJyR77UpBfeY8QO3ZYrQjNd1iizGTV
X-Proofpoint-ORIG-GUID: TEgChh9P8hHoiSt2wqXw_qlw6tkdgsKm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_04,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 clxscore=1034 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030088
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 TVD_SUBJ_WIPE_DEBT=1.004,
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PowerPC 601 processor is the first generation of processors to
implement the PowerPC architecture. It was designed as a bridge
processor and also could execute most of the instructions of the
previous POWER architecture. It was found on the first Macs and IBM
RS/6000 workstations.

There is not much interest in keeping the CPU model of this
POWER-PowerPC bridge processor. We have the 603 and 604 CPU models of
the 60x family which implement the complete PowerPC instruction set.

Cc: "Herv=C3=A9 Poussineau" <hpoussin@reactos.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 I wonder if we could remove env->hflags_compat_nmsr also ?

 Thanks,

 C.

 target/ppc/cpu-models.h            |   3 -
 target/ppc/cpu-qom.h               |   6 -
 target/ppc/cpu.h                   |  39 +-
 target/ppc/helper.h                |  13 -
 target/ppc/mmu-hash32.h            |   9 -
 target/ppc/spr_tcg.h               |   8 -
 hw/ppc/ppc.c                       |  21 -
 hw/ppc/prep.c                      |   9 +-
 linux-user/ppc/cpu_loop.c          |  16 -
 target/ppc/cpu-models.c            |   8 -
 target/ppc/cpu_init.c              | 214 +-------
 target/ppc/excp_helper.c           |  11 -
 target/ppc/helper_regs.c           |  10 -
 target/ppc/int_helper.c            |  66 ---
 target/ppc/machine.c               |   5 +-
 target/ppc/misc_helper.c           |  40 --
 target/ppc/mmu-hash32.c            |  48 +-
 target/ppc/mmu_common.c            |  21 -
 target/ppc/mmu_helper.c            |  84 ---
 target/ppc/timebase_helper.c       |  20 -
 target/ppc/translate.c             | 842 -----------------------------
 target/ppc/translate/fp-impl.c.inc | 179 ------
 22 files changed, 13 insertions(+), 1659 deletions(-)

diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
index 612978a3fbd2..76775a74a9b6 100644
--- a/target/ppc/cpu-models.h
+++ b/target/ppc/cpu-models.h
@@ -205,9 +205,6 @@ enum {
 #define CPU_POWERPC_MPC8641          CPU_POWERPC_e600
 #define CPU_POWERPC_MPC8641D         CPU_POWERPC_e600
     /* PowerPC 6xx cores */
-    CPU_POWERPC_601_v0             =3D 0x00010001,
-    CPU_POWERPC_601_v1             =3D 0x00010001,
-    CPU_POWERPC_601_v2             =3D 0x00010002,
     CPU_POWERPC_603                =3D 0x00030100,
     CPU_POWERPC_603E_v11           =3D 0x00060101,
     CPU_POWERPC_603E_v12           =3D 0x00060102,
diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 99a6b509af08..5d591ff6c5ee 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -61,8 +61,6 @@ enum powerpc_mmu_t {
     POWERPC_MMU_BOOKE      =3D 0x00000008,
     /* BookE 2.06 MMU model                                    */
     POWERPC_MMU_BOOKE206   =3D 0x00000009,
-    /* PowerPC 601 MMU model (specific BATs format)            */
-    POWERPC_MMU_601        =3D 0x0000000A,
 #define POWERPC_MMU_64       0x00010000
     /* 64 bits PowerPC MMU                                     */
     POWERPC_MMU_64B        =3D POWERPC_MMU_64 | 0x00000001,
@@ -90,10 +88,6 @@ enum powerpc_excp_t {
     POWERPC_EXCP_STD,
     /* PowerPC 40x exception model      */
     POWERPC_EXCP_40x,
-    /* PowerPC 601 exception model      */
-    POWERPC_EXCP_601,
-    /* PowerPC 602 exception model      */
-    POWERPC_EXCP_602,
     /* PowerPC 603 exception model      */
     POWERPC_EXCP_603,
     /* PowerPC G2 exception model       */
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index dcd83b503c62..555c6b924576 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -89,11 +89,9 @@ enum {
     POWERPC_EXCP_VPU      =3D 73, /* Vector unavailable exception       =
       */
     /* 40x specific exceptions                                          =
     */
     POWERPC_EXCP_PIT      =3D 74, /* Programmable interval timer interru=
pt     */
-    /* 601 specific exceptions                                          =
     */
-    POWERPC_EXCP_IO       =3D 75, /* IO error exception                 =
       */
-    POWERPC_EXCP_RUNM     =3D 76, /* Run mode exception                 =
       */
+    /* Vectors 75-76 are 601 specific exceptions                        =
     */
     /* 602 specific exceptions                                          =
     */
-    POWERPC_EXCP_EMUL     =3D 77, /* Emulation trap exception           =
       */
+    POWERPC_EXCP_EMUL      =3D 77, /* Emulation trap exception          =
       */
     /* 602/603 specific exceptions                                      =
     */
     POWERPC_EXCP_IFTLB    =3D 78, /* Instruction fetch TLB miss         =
       */
     POWERPC_EXCP_DLTLB    =3D 79, /* Data load TLB miss                 =
       */
@@ -632,8 +630,7 @@ enum {
     POWERPC_FLAG_PX       =3D 0x00000200,
     POWERPC_FLAG_PMM      =3D 0x00000400,
     /* Flag for special features                                        =
     */
-    /* Decrementer clock: RTC clock (POWER, 601) or bus clock           =
     */
-    POWERPC_FLAG_RTC_CLK  =3D 0x00010000,
+    /* Decrementer clock                                                =
     */
     POWERPC_FLAG_BUS_CLK  =3D 0x00020000,
     /* Has CFAR                                                         =
     */
     POWERPC_FLAG_CFAR     =3D 0x00040000,
@@ -643,8 +640,6 @@ enum {
     POWERPC_FLAG_TM       =3D 0x00100000,
     /* Has SCV (ISA 3.00)                                               =
     */
     POWERPC_FLAG_SCV      =3D 0x00200000,
-    /* Has HID0 for LE bit (601)                                        =
     */
-    POWERPC_FLAG_HID0_LE  =3D 0x00400000,
 };
=20
 /*
@@ -655,7 +650,7 @@ enum {
  * the MSR are validated in hreg_compute_hflags.
  */
 enum {
-    HFLAGS_LE =3D 0,   /* MSR_LE -- comes from elsewhere on 601 */
+    HFLAGS_LE =3D 0,   /* MSR_LE */
     HFLAGS_HV =3D 1,   /* computed from MSR_HV and other state */
     HFLAGS_64 =3D 2,   /* computed from MSR_CE and MSR_SF */
     HFLAGS_GTSE =3D 3, /* computed from SPR_LPCR[GTSE] */
@@ -1389,11 +1384,7 @@ void cpu_ppc_store_hdecr(CPUPPCState *env, target_=
ulong value);
 void cpu_ppc_store_tbu40(CPUPPCState *env, uint64_t value);
 uint64_t cpu_ppc_load_purr(CPUPPCState *env);
 void cpu_ppc_store_purr(CPUPPCState *env, uint64_t value);
-uint32_t cpu_ppc601_load_rtcl(CPUPPCState *env);
-uint32_t cpu_ppc601_load_rtcu(CPUPPCState *env);
 #if !defined(CONFIG_USER_ONLY)
-void cpu_ppc601_store_rtcl(CPUPPCState *env, uint32_t value);
-void cpu_ppc601_store_rtcu(CPUPPCState *env, uint32_t value);
 target_ulong load_40x_pit(CPUPPCState *env);
 void store_40x_pit(CPUPPCState *env, target_ulong val);
 void store_40x_dbcr0(CPUPPCState *env, uint32_t val);
@@ -1516,17 +1507,12 @@ typedef PowerPCCPU ArchCPU;
 /* SPR definitions */
 #define SPR_MQ                (0x000)
 #define SPR_XER               (0x001)
-#define SPR_601_VRTCU         (0x004)
-#define SPR_601_VRTCL         (0x005)
-#define SPR_601_UDECR         (0x006)
 #define SPR_LR                (0x008)
 #define SPR_CTR               (0x009)
 #define SPR_UAMR              (0x00D)
 #define SPR_DSCR              (0x011)
 #define SPR_DSISR             (0x012)
-#define SPR_DAR               (0x013) /* DAE for PowerPC 601 */
-#define SPR_601_RTCU          (0x014)
-#define SPR_601_RTCL          (0x015)
+#define SPR_DAR               (0x013)
 #define SPR_DECR              (0x016)
 #define SPR_SDR1              (0x019)
 #define SPR_SRR0              (0x01A)
@@ -2003,7 +1989,6 @@ typedef PowerPCCPU ArchCPU;
 #define SPR_HID1              (0x3F1)
 #define SPR_IABR              (0x3F2)
 #define SPR_40x_DBCR0         (0x3F2)
-#define SPR_601_HID2          (0x3F2)
 #define SPR_Exxx_L1CSR0       (0x3F2)
 #define SPR_ICTRL             (0x3F3)
 #define SPR_HID2              (0x3F3)
@@ -2019,7 +2004,6 @@ typedef PowerPCCPU ArchCPU;
 #define DABR_MASK (~(target_ulong)0x7)
 #define SPR_Exxx_BUCSR        (0x3F5)
 #define SPR_40x_IAC2          (0x3F5)
-#define SPR_601_HID5          (0x3F5)
 #define SPR_40x_DAC1          (0x3F6)
 #define SPR_MSSCR0            (0x3F6)
 #define SPR_970_HID5          (0x3F6)
@@ -2052,7 +2036,6 @@ typedef PowerPCCPU ArchCPU;
 #define SPR_403_PBL2          (0x3FE)
 #define SPR_PIR               (0x3FF)
 #define SPR_403_PBU2          (0x3FF)
-#define SPR_601_HID15         (0x3FF)
 #define SPR_604_HID15         (0x3FF)
 #define SPR_E500_SVR          (0x3FF)
=20
@@ -2117,15 +2100,6 @@ enum {
 #define PPC_RES     PPC_INSNS_BASE
     /*   spr/msr access instructions                                    =
     */
 #define PPC_MISC    PPC_INSNS_BASE
-    /* Deprecated instruction sets                                      =
     */
-    /*   Original POWER instruction set                                 =
     */
-    PPC_POWER          =3D 0x0000000000000002ULL,
-    /*   POWER2 instruction set extension                               =
     */
-    PPC_POWER2         =3D 0x0000000000000004ULL,
-    /*   Power RTC support                                              =
     */
-    PPC_POWER_RTC      =3D 0x0000000000000008ULL,
-    /*   Power-to-PowerPC bridge (601)                                  =
     */
-    PPC_POWER_BR       =3D 0x0000000000000010ULL,
     /* 64 bits PowerPC instruction set                                  =
     */
     PPC_64B            =3D 0x0000000000000020ULL,
     /*   New 64 bits extensions (PowerPC 2.0x)                          =
     */
@@ -2236,8 +2210,7 @@ enum {
     /* popcntw and popcntd instructions                                 =
     */
     PPC_POPCNTWD       =3D 0x8000000000000000ULL,
=20
-#define PPC_TCG_INSNS  (PPC_INSNS_BASE | PPC_POWER | PPC_POWER2 \
-                        | PPC_POWER_RTC | PPC_POWER_BR | PPC_64B \
+#define PPC_TCG_INSNS  (PPC_INSNS_BASE | PPC_64B \
                         | PPC_64BX | PPC_64H | PPC_WAIT | PPC_MFTB \
                         | PPC_ISEL | PPC_POPCNTB \
                         | PPC_STRING | PPC_FLOAT | PPC_FLOAT_EXT \
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f2e5060910de..ab008c9d4ee9 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -7,7 +7,6 @@ DEF_HELPER_FLAGS_4(td, TCG_CALL_NO_WG, void, env, tl, tl,=
 i32)
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_2(store_msr, void, env, tl)
 DEF_HELPER_1(rfi, void, env)
-DEF_HELPER_1(rfsvc, void, env)
 DEF_HELPER_1(40x_rfci, void, env)
 DEF_HELPER_1(rfci, void, env)
 DEF_HELPER_1(rfdi, void, env)
@@ -653,14 +652,9 @@ DEF_HELPER_2(book3s_msgclr, void, env, tl)
 #endif
=20
 DEF_HELPER_4(dlmzb, tl, env, tl, tl, i32)
-DEF_HELPER_FLAGS_2(clcs, TCG_CALL_NO_RWG_SE, tl, env, i32)
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_2(rac, tl, env, tl)
 #endif
-DEF_HELPER_3(div, tl, env, tl, tl)
-DEF_HELPER_3(divo, tl, env, tl, tl)
-DEF_HELPER_3(divs, tl, env, tl, tl)
-DEF_HELPER_3(divso, tl, env, tl, tl)
=20
 DEF_HELPER_2(load_dcr, tl, env, tl)
 DEF_HELPER_3(store_dcr, void, env, tl, tl)
@@ -674,8 +668,6 @@ DEF_HELPER_FLAGS_1(load_tbu, TCG_CALL_NO_RWG, tl, env=
)
 DEF_HELPER_FLAGS_1(load_atbl, TCG_CALL_NO_RWG, tl, env)
 DEF_HELPER_FLAGS_1(load_atbu, TCG_CALL_NO_RWG, tl, env)
 DEF_HELPER_FLAGS_1(load_vtb, TCG_CALL_NO_RWG, tl, env)
-DEF_HELPER_FLAGS_1(load_601_rtcl, TCG_CALL_NO_RWG, tl, env)
-DEF_HELPER_FLAGS_1(load_601_rtcu, TCG_CALL_NO_RWG, tl, env)
 #if !defined(CONFIG_USER_ONLY)
 #if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_1(load_purr, TCG_CALL_NO_RWG, tl, env)
@@ -693,15 +685,12 @@ DEF_HELPER_FLAGS_2(store_tbl, TCG_CALL_NO_RWG, void=
, env, tl)
 DEF_HELPER_FLAGS_2(store_tbu, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(store_atbl, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(store_atbu, TCG_CALL_NO_RWG, void, env, tl)
-DEF_HELPER_FLAGS_2(store_601_rtcl, TCG_CALL_NO_RWG, void, env, tl)
-DEF_HELPER_FLAGS_2(store_601_rtcu, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_1(load_decr, TCG_CALL_NO_RWG, tl, env)
 DEF_HELPER_FLAGS_2(store_decr, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_1(load_hdecr, TCG_CALL_NO_RWG, tl, env)
 DEF_HELPER_FLAGS_2(store_hdecr, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(store_vtb, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(store_tbu40, TCG_CALL_NO_RWG, void, env, tl)
-DEF_HELPER_2(store_hid0_601, void, env, tl)
 DEF_HELPER_FLAGS_1(load_40x_pit, TCG_CALL_NO_RWG, tl, env)
 DEF_HELPER_FLAGS_2(store_40x_pit, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(store_40x_tcr, TCG_CALL_NO_RWG, void, env, tl)
@@ -715,8 +704,6 @@ DEF_HELPER_3(store_ibatl, void, env, i32, tl)
 DEF_HELPER_3(store_ibatu, void, env, i32, tl)
 DEF_HELPER_3(store_dbatl, void, env, i32, tl)
 DEF_HELPER_3(store_dbatu, void, env, i32, tl)
-DEF_HELPER_3(store_601_batl, void, env, i32, tl)
-DEF_HELPER_3(store_601_batu, void, env, i32, tl)
 #endif
=20
 #define dh_alias_fprp ptr
diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
index 3892b693d6ef..7119a63d97a1 100644
--- a/target/ppc/mmu-hash32.h
+++ b/target/ppc/mmu-hash32.h
@@ -34,15 +34,6 @@ bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MM=
UAccessType access_type,
 #define BATL32_WIMG             0x00000078
 #define BATL32_PP               0x00000003
=20
-/* PowerPC 601 has slightly different BAT registers */
-
-#define BATU32_601_KS           0x00000008
-#define BATU32_601_KP           0x00000004
-#define BATU32_601_PP           0x00000003
-
-#define BATL32_601_V            0x00000040
-#define BATL32_601_BL           0x0000003f
-
 /*
  * Hash page table definitions
  */
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 89ff111724dc..df2abacc644f 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -45,8 +45,6 @@ void spr_read_tbl(DisasContext *ctx, int gprn, int sprn=
);
 void spr_read_tbu(DisasContext *ctx, int gprn, int sprn);
 void spr_read_atbl(DisasContext *ctx, int gprn, int sprn);
 void spr_read_atbu(DisasContext *ctx, int gprn, int sprn);
-void spr_read_601_rtcl(DisasContext *ctx, int gprn, int sprn);
-void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn);
 void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
 void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn);
@@ -77,12 +75,6 @@ void spr_write_dbatu_h(DisasContext *ctx, int sprn, in=
t gprn);
 void spr_write_dbatl(DisasContext *ctx, int sprn, int gprn);
 void spr_write_dbatl_h(DisasContext *ctx, int sprn, int gprn);
 void spr_write_sdr1(DisasContext *ctx, int sprn, int gprn);
-void spr_write_601_rtcu(DisasContext *ctx, int sprn, int gprn);
-void spr_write_601_rtcl(DisasContext *ctx, int sprn, int gprn);
-void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn);
-void spr_read_601_ubat(DisasContext *ctx, int gprn, int sprn);
-void spr_write_601_ubatu(DisasContext *ctx, int sprn, int gprn);
-void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn);
 void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn);
 void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn);
 void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn);
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 462c87dba8bf..ba7fa0f3b53a 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1083,27 +1083,6 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, ui=
nt32_t freq)
     return &cpu_ppc_set_tb_clk;
 }
=20
-/* Specific helpers for POWER & PowerPC 601 RTC */
-void cpu_ppc601_store_rtcu (CPUPPCState *env, uint32_t value)
-{
-    _cpu_ppc_store_tbu(env, value);
-}
-
-uint32_t cpu_ppc601_load_rtcu (CPUPPCState *env)
-{
-    return _cpu_ppc_load_tbu(env);
-}
-
-void cpu_ppc601_store_rtcl (CPUPPCState *env, uint32_t value)
-{
-    cpu_ppc_store_tbl(env, value & 0x3FFFFF80);
-}
-
-uint32_t cpu_ppc601_load_rtcl (CPUPPCState *env)
-{
-    return cpu_ppc_load_tbl(env) & 0x3FFFFF80;
-}
-
 /***********************************************************************=
******/
 /* PowerPC 40x timers */
=20
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 25a2e86b4217..bf622aa38fab 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -255,13 +255,8 @@ static void ibm_40p_init(MachineState *machine)
         exit(1);
     }
=20
-    if (env->flags & POWERPC_FLAG_RTC_CLK) {
-        /* POWER / PowerPC 601 RTC clock frequency is 7.8125 MHz */
-        cpu_ppc_tb_init(env, 7812500UL);
-    } else {
-        /* Set time-base frequency to 100 Mhz */
-        cpu_ppc_tb_init(env, 100UL * 1000UL * 1000UL);
-    }
+    /* Set time-base frequency to 100 Mhz */
+    cpu_ppc_tb_init(env, 100UL * 1000UL * 1000UL);
     qemu_register_reset(ppc_prep_reset, cpu);
=20
     /* PCI host */
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index 46e6ffd6d300..38097b02ff71 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -54,14 +54,6 @@ uint64_t cpu_ppc_load_vtb(CPUPPCState *env)
     return cpu_ppc_get_tb(env);
 }
=20
-uint32_t cpu_ppc601_load_rtcu(CPUPPCState *env)
-__attribute__ (( alias ("cpu_ppc_load_tbu") ));
-
-uint32_t cpu_ppc601_load_rtcl(CPUPPCState *env)
-{
-    return cpu_ppc_load_tbl(env) & 0x3FFFFF80;
-}
-
 /* XXX: to be fixed */
 int ppc_dcr_read (ppc_dcr_t *dcr_env, int dcrn, uint32_t *valp)
 {
@@ -289,14 +281,6 @@ void cpu_loop(CPUPPCState *env)
             cpu_abort(cs, "Programmable interval timer interrupt "
                       "while in user mode. Aborting\n");
             break;
-        case POWERPC_EXCP_IO:       /* IO error exception               =
     */
-            cpu_abort(cs, "IO error exception while in user mode. "
-                      "Aborting\n");
-            break;
-        case POWERPC_EXCP_RUNM:     /* Run mode exception               =
     */
-            cpu_abort(cs, "Run mode exception while in user mode. "
-                      "Aborting\n");
-            break;
         case POWERPC_EXCP_EMUL:     /* Emulation trap exception         =
     */
             cpu_abort(cs, "Emulation trap exception not handled\n");
             break;
diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
index a2c720cc4d0c..976be5e0d171 100644
--- a/target/ppc/cpu-models.c
+++ b/target/ppc/cpu-models.c
@@ -422,12 +422,6 @@
                     CPU_POWERPC_MPC8641D,     POWERPC_SVR_8641D,     e60=
0)
     /* 32 bits "classic" PowerPC                                        =
     */
     /* PowerPC 6xx family                                               =
     */
-    POWERPC_DEF("601_v0",        CPU_POWERPC_601_v0,                 601=
,
-                "PowerPC 601v0")
-    POWERPC_DEF("601_v1",        CPU_POWERPC_601_v1,                 601=
,
-                "PowerPC 601v1")
-    POWERPC_DEF("601_v2",        CPU_POWERPC_601_v2,                 601=
v,
-                "PowerPC 601v2")
     POWERPC_DEF("603",           CPU_POWERPC_603,                    603=
,
                 "PowerPC 603")
     POWERPC_DEF("603e_v1.1",     CPU_POWERPC_603E_v11,               603=
E,
@@ -859,8 +853,6 @@ PowerPCCPUAlias ppc_cpu_aliases[] =3D {
     { "mpc8555", "mpc8555_v11" },
     { "mpc8555e", "mpc8555e_v11" },
     { "mpc8560", "mpc8560_v21" },
-    { "601",  "601_v2" },
-    { "601v", "601_v2" },
     { "vanilla", "603" },
     { "603e", "603e_v4.1" },
     { "stretch", "603e_v4.1" },
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index b4f0835849a6..a5e1f5a3b204 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -749,83 +749,6 @@ static void register_G2_sprs(CPUPPCState *env)
                  0x00000000);
 }
=20
-/* SPR specific to PowerPC 601 implementation */
-static void register_601_sprs(CPUPPCState *env)
-{
-    /* Multiplication/division register */
-    /* MQ */
-    spr_register(env, SPR_MQ, "MQ",
-                 &spr_read_generic, &spr_write_generic,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* RTC registers */
-    spr_register(env, SPR_601_RTCU, "RTCU",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, &spr_write_601_rtcu,
-                 0x00000000);
-    spr_register(env, SPR_601_VRTCU, "RTCU",
-                 &spr_read_601_rtcu, SPR_NOACCESS,
-                 &spr_read_601_rtcu, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_601_RTCL, "RTCL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, &spr_write_601_rtcl,
-                 0x00000000);
-    spr_register(env, SPR_601_VRTCL, "RTCL",
-                 &spr_read_601_rtcl, SPR_NOACCESS,
-                 &spr_read_601_rtcl, SPR_NOACCESS,
-                 0x00000000);
-    /* Timer */
-#if 0 /* ? */
-    spr_register(env, SPR_601_UDECR, "UDECR",
-                 &spr_read_decr, SPR_NOACCESS,
-                 &spr_read_decr, SPR_NOACCESS,
-                 0x00000000);
-#endif
-    /* External access control */
-    /* XXX : not implemented */
-    spr_register(env, SPR_EAR, "EAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Memory management */
-#if !defined(CONFIG_USER_ONLY)
-    spr_register(env, SPR_IBAT0U, "IBAT0U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_601_ubat, &spr_write_601_ubatu,
-                 0x00000000);
-    spr_register(env, SPR_IBAT0L, "IBAT0L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_601_ubat, &spr_write_601_ubatl,
-                 0x00000000);
-    spr_register(env, SPR_IBAT1U, "IBAT1U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_601_ubat, &spr_write_601_ubatu,
-                 0x00000000);
-    spr_register(env, SPR_IBAT1L, "IBAT1L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_601_ubat, &spr_write_601_ubatl,
-                 0x00000000);
-    spr_register(env, SPR_IBAT2U, "IBAT2U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_601_ubat, &spr_write_601_ubatu,
-                 0x00000000);
-    spr_register(env, SPR_IBAT2L, "IBAT2L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_601_ubat, &spr_write_601_ubatl,
-                 0x00000000);
-    spr_register(env, SPR_IBAT3U, "IBAT3U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_601_ubat, &spr_write_601_ubatu,
-                 0x00000000);
-    spr_register(env, SPR_IBAT3L, "IBAT3L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_601_ubat, &spr_write_601_ubatl,
-                 0x00000000);
-    env->nb_BATs =3D 4;
-#endif
-}
-
 static void register_74xx_sprs(CPUPPCState *env)
 {
     /* Processor identification */
@@ -2060,26 +1983,6 @@ static void init_excp_BookE(CPUPPCState *env)
 #endif
 }
=20
-static void init_excp_601(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000100;
-    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
-    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000300;
-    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000400;
-    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
-    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
-    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
-    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
-    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
-    env->excp_vectors[POWERPC_EXCP_IO]       =3D 0x00000A00;
-    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
-    env->excp_vectors[POWERPC_EXCP_RUNM]     =3D 0x00002000;
-    /* Hardware reset vector */
-    env->hreset_vector =3D 0x00000100UL;
-#endif
-}
-
 static void init_excp_603(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -3809,120 +3712,6 @@ POWERPC_FAMILY(e6500)(ObjectClass *oc, void *data=
)
 #endif
=20
 /* Non-embedded PowerPC                                                 =
     */
-
-#define POWERPC_MSRR_601     (0x0000000000001040ULL)
-
-static void init_proc_601(CPUPPCState *env)
-{
-    register_ne_601_sprs(env);
-    register_sdr1_sprs(env);
-    register_601_sprs(env);
-    /* Hardware implementation registers */
-    /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_hid0_601,
-                 0x80010080);
-    /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_601_HID2, "HID2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_601_HID5, "HID5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Memory management */
-    init_excp_601(env);
-    /*
-     * XXX: beware that dcache line size is 64
-     *      but dcbz uses 32 bytes "sectors"
-     * XXX: this breaks clcs instruction !
-     */
-    env->dcache_line_size =3D 32;
-    env->icache_line_size =3D 64;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(601)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc =3D DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
-
-    dc->desc =3D "PowerPC 601";
-    pcc->init_proc =3D init_proc_601;
-    pcc->check_pow =3D check_pow_none;
-    pcc->insns_flags =3D PPC_INSNS_BASE | PPC_STRING | PPC_POWER_BR |
-                       PPC_FLOAT |
-                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO | PPC_MEM_TLBIE |
-                       PPC_SEGMENT | PPC_EXTERN;
-    pcc->msr_mask =3D (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_FE0) |
-                    (1ull << MSR_SE) |
-                    (1ull << MSR_FE1) |
-                    (1ull << MSR_EP) |
-                    (1ull << MSR_IR) |
-                    (1ull << MSR_DR);
-    pcc->mmu_model =3D POWERPC_MMU_601;
-    pcc->excp_model =3D POWERPC_EXCP_601;
-    pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach =3D bfd_mach_ppc_601;
-    pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK | POWERPC_FLAG=
_HID0_LE;
-}
-
-#define POWERPC_MSRR_601v    (0x0000000000001040ULL)
-
-static void init_proc_601v(CPUPPCState *env)
-{
-    init_proc_601(env);
-    /* XXX : not implemented */
-    spr_register(env, SPR_601_HID15, "HID15",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc =3D DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
-
-    dc->desc =3D "PowerPC 601v";
-    pcc->init_proc =3D init_proc_601v;
-    pcc->check_pow =3D check_pow_none;
-    pcc->insns_flags =3D PPC_INSNS_BASE | PPC_STRING | PPC_POWER_BR |
-                       PPC_FLOAT |
-                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO | PPC_MEM_TLBIE |
-                       PPC_SEGMENT | PPC_EXTERN;
-    pcc->msr_mask =3D (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_FE0) |
-                    (1ull << MSR_SE) |
-                    (1ull << MSR_FE1) |
-                    (1ull << MSR_EP) |
-                    (1ull << MSR_IR) |
-                    (1ull << MSR_DR);
-    pcc->mmu_model =3D POWERPC_MMU_601;
-    pcc->excp_model =3D POWERPC_EXCP_601;
-    pcc->bus_model =3D PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach =3D bfd_mach_ppc_601;
-    pcc->flags =3D POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK | POWERPC_FLAG=
_HID0_LE;
-}
-
 static void init_proc_603(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
@@ -7677,7 +7466,7 @@ static void init_ppc_proc(PowerPCCPU *cpu)
                 "Should not define POWERPC_FLAG_PX nor POWERPC_FLAG_PMM\=
n");
         exit(1);
     }
-    if ((env->flags & (POWERPC_FLAG_RTC_CLK | POWERPC_FLAG_BUS_CLK)) =3D=
=3D 0) {
+    if ((env->flags & POWERPC_FLAG_BUS_CLK) =3D=3D 0) {
         fprintf(stderr, "PowerPC flags inconsistency\n"
                 "Should define the time-base and decrementer clock sourc=
e\n");
         exit(1);
@@ -8491,7 +8280,6 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int =
flags)
=20
     switch (env->mmu_model) {
     case POWERPC_MMU_32B:
-    case POWERPC_MMU_601:
     case POWERPC_MMU_SOFT_6xx:
 #if defined(TARGET_PPC64)
     case POWERPC_MMU_64B:
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 7d7d0a08b536..ae6871a3c0f3 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -73,8 +73,6 @@ static const char *powerpc_excp_name(int excp)
     case POWERPC_EXCP_HISEG:    return "HISEG";
     case POWERPC_EXCP_VPU:      return "VPU";
     case POWERPC_EXCP_PIT:      return "PIT";
-    case POWERPC_EXCP_IO:       return "IO";
-    case POWERPC_EXCP_RUNM:     return "RUNM";
     case POWERPC_EXCP_EMUL:     return "EMUL";
     case POWERPC_EXCP_IFTLB:    return "IFTLB";
     case POWERPC_EXCP_DLTLB:    return "DLTLB";
@@ -1671,9 +1669,6 @@ static inline void powerpc_excp_legacy(PowerPCCPU *=
cpu, int excp)
     case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interru=
pt   */
     case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interr=
upt  */
     case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interru=
pt   */
-    case POWERPC_EXCP_IO:        /* IO error exception                  =
     */
-    case POWERPC_EXCP_RUNM:      /* Run mode exception                  =
     */
-    case POWERPC_EXCP_EMUL:      /* Emulation trap exception            =
     */
     case POWERPC_EXCP_FPA:       /* Floating-point assist exception     =
     */
     case POWERPC_EXCP_DABR:      /* Data address breakpoint             =
     */
     case POWERPC_EXCP_IABR:      /* Instruction address breakpoint      =
     */
@@ -2202,14 +2197,8 @@ void helper_td(CPUPPCState *env, target_ulong arg1=
, target_ulong arg2,
 #endif
=20
 #if !defined(CONFIG_USER_ONLY)
-/***********************************************************************=
******/
-/* PowerPC 601 specific instructions (POWER bridge) */
=20
 #ifdef CONFIG_TCG
-void helper_rfsvc(CPUPPCState *env)
-{
-    do_rfi(env, env->lr, env->ctr & 0x0000FFFF);
-}
=20
 /* Embedded.Processor Control */
 static int dbell2irq(target_ulong rb)
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 5b12cb03c961..38fcb5fe5048 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -59,15 +59,6 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState =
*env)
     msr_mask =3D ((1 << MSR_LE) | (1 << MSR_PR) |
                 (1 << MSR_DR) | (1 << MSR_FP));
=20
-    if (ppc_flags & POWERPC_FLAG_HID0_LE) {
-        /*
-         * Note that MSR_LE is not set in env->msr_mask for this cpu,
-         * and so will never be set in msr.
-         */
-        uint32_t le =3D extract32(env->spr[SPR_HID0], 3, 1);
-        hflags |=3D le << MSR_LE;
-    }
-
     if (ppc_flags & POWERPC_FLAG_DE) {
         target_ulong dbcr0 =3D env->spr[SPR_BOOKE_DBCR0];
         if (dbcr0 & DBCR0_ICMP) {
@@ -249,7 +240,6 @@ int hreg_store_msr(CPUPPCState *env, target_ulong val=
ue, int alter_hv)
         hreg_swap_gpr_tgpr(env);
     }
     if (unlikely((value >> MSR_EP) & 1) !=3D msr_ep) {
-        /* Change the exception prefix on PowerPC 601 */
         env->excp_prefix =3D ((value >> MSR_EP) & 1) * 0xFFF00000;
     }
     /*
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index d7765fd3e3d8..d1b12788b215 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -422,72 +422,6 @@ uint64_t helper_PEXTD(uint64_t src, uint64_t mask)
     return result;
 }
=20
-/***********************************************************************=
******/
-/* PowerPC 601 specific instructions (POWER bridge) */
-target_ulong helper_div(CPUPPCState *env, target_ulong arg1, target_ulon=
g arg2)
-{
-    uint64_t tmp =3D (uint64_t)arg1 << 32 | env->spr[SPR_MQ];
-
-    if (((int32_t)tmp =3D=3D INT32_MIN && (int32_t)arg2 =3D=3D (int32_t)=
-1) ||
-        (int32_t)arg2 =3D=3D 0) {
-        env->spr[SPR_MQ] =3D 0;
-        return INT32_MIN;
-    } else {
-        env->spr[SPR_MQ] =3D tmp % arg2;
-        return  tmp / (int32_t)arg2;
-    }
-}
-
-target_ulong helper_divo(CPUPPCState *env, target_ulong arg1,
-                         target_ulong arg2)
-{
-    uint64_t tmp =3D (uint64_t)arg1 << 32 | env->spr[SPR_MQ];
-
-    if (((int32_t)tmp =3D=3D INT32_MIN && (int32_t)arg2 =3D=3D (int32_t)=
-1) ||
-        (int32_t)arg2 =3D=3D 0) {
-        env->so =3D env->ov =3D 1;
-        env->spr[SPR_MQ] =3D 0;
-        return INT32_MIN;
-    } else {
-        env->spr[SPR_MQ] =3D tmp % arg2;
-        tmp /=3D (int32_t)arg2;
-        if ((int32_t)tmp !=3D tmp) {
-            env->so =3D env->ov =3D 1;
-        } else {
-            env->ov =3D 0;
-        }
-        return tmp;
-    }
-}
-
-target_ulong helper_divs(CPUPPCState *env, target_ulong arg1,
-                         target_ulong arg2)
-{
-    if (((int32_t)arg1 =3D=3D INT32_MIN && (int32_t)arg2 =3D=3D (int32_t=
)-1) ||
-        (int32_t)arg2 =3D=3D 0) {
-        env->spr[SPR_MQ] =3D 0;
-        return INT32_MIN;
-    } else {
-        env->spr[SPR_MQ] =3D (int32_t)arg1 % (int32_t)arg2;
-        return (int32_t)arg1 / (int32_t)arg2;
-    }
-}
-
-target_ulong helper_divso(CPUPPCState *env, target_ulong arg1,
-                          target_ulong arg2)
-{
-    if (((int32_t)arg1 =3D=3D INT32_MIN && (int32_t)arg2 =3D=3D (int32_t=
)-1) ||
-        (int32_t)arg2 =3D=3D 0) {
-        env->so =3D env->ov =3D 1;
-        env->spr[SPR_MQ] =3D 0;
-        return INT32_MIN;
-    } else {
-        env->ov =3D 0;
-        env->spr[SPR_MQ] =3D (int32_t)arg1 % (int32_t)arg2;
-        return (int32_t)arg1 / (int32_t)arg2;
-    }
-}
-
 /***********************************************************************=
******/
 /* Altivec extension helpers */
 #if defined(HOST_WORDS_BIGENDIAN)
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index a503e00ddc0b..1b63146ed128 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -205,9 +205,8 @@ static int cpu_pre_save(void *opaque)
         }
     }
=20
-    /* Retain migration compatibility for pre 6.0 for 601 machines. */
-    env->hflags_compat_nmsr =3D (env->flags & POWERPC_FLAG_HID0_LE
-                               ? env->hflags & MSR_LE : 0);
+    /* Used to retain migration compatibility for pre 6.0 for 601 machin=
es. */
+    env->hflags_compat_nmsr =3D 0;
=20
     return 0;
 }
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 1bcefa7c843c..29e73a6ffda3 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -211,21 +211,6 @@ void helper_store_lpidr(CPUPPCState *env, target_ulo=
ng val)
     tlb_flush(env_cpu(env));
 }
=20
-void helper_store_hid0_601(CPUPPCState *env, target_ulong val)
-{
-    target_ulong hid0;
-
-    hid0 =3D env->spr[SPR_HID0];
-    env->spr[SPR_HID0] =3D (uint32_t)val;
-
-    if ((val ^ hid0) & 0x00000008) {
-        /* Change current endianness */
-        hreg_compute_hflags(env);
-        qemu_log("%s: set endianness to %c =3D> %08x\n", __func__,
-                 val & 0x8 ? 'l' : 'b', env->hflags);
-    }
-}
-
 void helper_store_40x_dbcr0(CPUPPCState *env, target_ulong val)
 {
     /* Bits 26 & 27 affect single-stepping. */
@@ -239,31 +224,6 @@ void helper_store_40x_sler(CPUPPCState *env, target_=
ulong val)
     store_40x_sler(env, val);
 }
 #endif
-/***********************************************************************=
******/
-/* PowerPC 601 specific instructions (POWER bridge) */
-
-target_ulong helper_clcs(CPUPPCState *env, uint32_t arg)
-{
-    switch (arg) {
-    case 0x0CUL:
-        /* Instruction cache line size */
-        return env->icache_line_size;
-    case 0x0DUL:
-        /* Data cache line size */
-        return env->dcache_line_size;
-    case 0x0EUL:
-        /* Minimum cache line size */
-        return (env->icache_line_size < env->dcache_line_size) ?
-            env->icache_line_size : env->dcache_line_size;
-    case 0x0FUL:
-        /* Maximum cache line size */
-        return (env->icache_line_size > env->dcache_line_size) ?
-            env->icache_line_size : env->dcache_line_size;
-    default:
-        /* Undefined */
-        return 0;
-    }
-}
=20
 /***********************************************************************=
******/
 /* Special registers manipulation */
diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 3957aab2dc0b..cc091c3e62f4 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -125,30 +125,6 @@ static int hash32_bat_prot(PowerPCCPU *cpu,
     return prot;
 }
=20
-static target_ulong hash32_bat_601_size(PowerPCCPU *cpu,
-                                target_ulong batu, target_ulong batl)
-{
-    if (!(batl & BATL32_601_V)) {
-        return 0;
-    }
-
-    return BATU32_BEPI & ~((batl & BATL32_601_BL) << 17);
-}
-
-static int hash32_bat_601_prot(int mmu_idx,
-                               target_ulong batu, target_ulong batl)
-{
-    int key, pp;
-
-    pp =3D batu & BATU32_601_PP;
-    if (mmuidx_pr(mmu_idx) =3D=3D 0) {
-        key =3D !!(batu & BATU32_601_KS);
-    } else {
-        key =3D !!(batu & BATU32_601_KP);
-    }
-    return ppc_hash32_pp_prot(key, pp, 0);
-}
-
 static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea,
                                     MMUAccessType access_type, int *prot=
,
                                     int mmu_idx)
@@ -172,11 +148,7 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu,=
 target_ulong ea,
         target_ulong batl =3D BATlt[i];
         target_ulong mask;
=20
-        if (unlikely(env->mmu_model =3D=3D POWERPC_MMU_601)) {
-            mask =3D hash32_bat_601_size(cpu, batu, batl);
-        } else {
-            mask =3D hash32_bat_size(mmu_idx, batu, batl);
-        }
+        mask =3D hash32_bat_size(mmu_idx, batu, batl);
         LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
                  " BATl " TARGET_FMT_lx "\n", __func__,
                  ifetch ? 'I' : 'D', i, ea, batu, batl);
@@ -184,11 +156,7 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu,=
 target_ulong ea,
         if (mask && ((ea & mask) =3D=3D (batu & BATU32_BEPI))) {
             hwaddr raddr =3D (batl & mask) | (ea & ~mask);
=20
-            if (unlikely(env->mmu_model =3D=3D POWERPC_MMU_601)) {
-                *prot =3D hash32_bat_601_prot(mmu_idx, batu, batl);
-            } else {
-                *prot =3D hash32_bat_prot(cpu, batu, batl);
-            }
+            *prot =3D hash32_bat_prot(cpu, batu, batl);
=20
             return raddr & TARGET_PAGE_MASK;
         }
@@ -231,18 +199,6 @@ static bool ppc_hash32_direct_store(PowerPCCPU *cpu,=
 target_ulong sr,
=20
     qemu_log_mask(CPU_LOG_MMU, "direct store...\n");
=20
-    if ((sr & 0x1FF00000) >> 20 =3D=3D 0x07f) {
-        /*
-         * Memory-forced I/O controller interface access
-         *
-         * If T=3D1 and BUID=3Dx'07F', the 601 performs a memory access
-         * to SR[28-31] LA[4-31], bypassing all protection mechanisms.
-         */
-        *raddr =3D ((sr & 0xF) << 28) | (eaddr & 0x0FFFFFFF);
-        *prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        return true;
-    }
-
     if (access_type =3D=3D MMU_INST_FETCH) {
         /* No code fetch is allowed in direct-store areas */
         if (guest_visible) {
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 6512ee031cfc..e9c5b14c0f48 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -441,29 +441,9 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mmu=
_ctx_t *ctx,
             ret =3D -3;
         }
     } else {
-        target_ulong sr;
-
         qemu_log_mask(CPU_LOG_MMU, "direct store...\n");
         /* Direct-store segment : absolutely *BUGGY* for now */
=20
-        /*
-         * Direct-store implies a 32-bit MMU.
-         * Check the Segment Register's bus unit ID (BUID).
-         */
-        sr =3D env->sr[eaddr >> 28];
-        if ((sr & 0x1FF00000) >> 20 =3D=3D 0x07f) {
-            /*
-             * Memory-forced I/O controller interface access
-             *
-             * If T=3D1 and BUID=3Dx'07F', the 601 performs a memory
-             * access to SR[28-31] LA[4-31], bypassing all protection
-             * mechanisms.
-             */
-            ctx->raddr =3D ((sr & 0xF) << 28) | (eaddr & 0x0FFFFFFF);
-            ctx->prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-            return 0;
-        }
-
         switch (type) {
         case ACCESS_INT:
             /* Integer load/store : only access allowed */
@@ -1539,7 +1519,6 @@ bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAcc=
essType access_type,
 #endif
=20
     case POWERPC_MMU_32B:
-    case POWERPC_MMU_601:
         return ppc_hash32_xlate(cpu, eaddr, access_type, raddrp,
                                psizep, protp, mmu_idx, guest_visible);
=20
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index a2a52a12c3a4..142a717255c4 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -279,88 +279,6 @@ void helper_store_dbatl(CPUPPCState *env, uint32_t n=
r, target_ulong value)
     env->DBAT[1][nr] =3D value;
 }
=20
-void helper_store_601_batu(CPUPPCState *env, uint32_t nr, target_ulong v=
alue)
-{
-    target_ulong mask;
-#if defined(FLUSH_ALL_TLBS)
-    int do_inval;
-#endif
-
-    dump_store_bat(env, 'I', 0, nr, value);
-    if (env->IBAT[0][nr] !=3D value) {
-#if defined(FLUSH_ALL_TLBS)
-        do_inval =3D 0;
-#endif
-        mask =3D (env->IBAT[1][nr] << 17) & 0x0FFE0000UL;
-        if (env->IBAT[1][nr] & 0x40) {
-            /* Invalidate BAT only if it is valid */
-#if !defined(FLUSH_ALL_TLBS)
-            do_invalidate_BAT(env, env->IBAT[0][nr], mask);
-#else
-            do_inval =3D 1;
-#endif
-        }
-        /*
-         * When storing valid upper BAT, mask BEPI and BRPN and
-         * invalidate all TLBs covered by this BAT
-         */
-        env->IBAT[0][nr] =3D (value & 0x00001FFFUL) |
-            (value & ~0x0001FFFFUL & ~mask);
-        env->DBAT[0][nr] =3D env->IBAT[0][nr];
-        if (env->IBAT[1][nr] & 0x40) {
-#if !defined(FLUSH_ALL_TLBS)
-            do_invalidate_BAT(env, env->IBAT[0][nr], mask);
-#else
-            do_inval =3D 1;
-#endif
-        }
-#if defined(FLUSH_ALL_TLBS)
-        if (do_inval) {
-            tlb_flush(env_cpu(env));
-        }
-#endif
-    }
-}
-
-void helper_store_601_batl(CPUPPCState *env, uint32_t nr, target_ulong v=
alue)
-{
-#if !defined(FLUSH_ALL_TLBS)
-    target_ulong mask;
-#else
-    int do_inval;
-#endif
-
-    dump_store_bat(env, 'I', 1, nr, value);
-    if (env->IBAT[1][nr] !=3D value) {
-#if defined(FLUSH_ALL_TLBS)
-        do_inval =3D 0;
-#endif
-        if (env->IBAT[1][nr] & 0x40) {
-#if !defined(FLUSH_ALL_TLBS)
-            mask =3D (env->IBAT[1][nr] << 17) & 0x0FFE0000UL;
-            do_invalidate_BAT(env, env->IBAT[0][nr], mask);
-#else
-            do_inval =3D 1;
-#endif
-        }
-        if (value & 0x40) {
-#if !defined(FLUSH_ALL_TLBS)
-            mask =3D (value << 17) & 0x0FFE0000UL;
-            do_invalidate_BAT(env, env->IBAT[0][nr], mask);
-#else
-            do_inval =3D 1;
-#endif
-        }
-        env->IBAT[1][nr] =3D value;
-        env->DBAT[1][nr] =3D value;
-#if defined(FLUSH_ALL_TLBS)
-        if (do_inval) {
-            tlb_flush(env_cpu(env));
-        }
-#endif
-    }
-}
-
 /***********************************************************************=
******/
 /* TLB management */
 void ppc_tlb_invalidate_all(CPUPPCState *env)
@@ -392,7 +310,6 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
         booke206_flush_tlb(env, -1, 0);
         break;
     case POWERPC_MMU_32B:
-    case POWERPC_MMU_601:
         env->tlb_need_flush =3D 0;
         tlb_flush(env_cpu(env));
         break;
@@ -426,7 +343,6 @@ void ppc_tlb_invalidate_one(CPUPPCState *env, target_=
ulong addr)
         }
         break;
     case POWERPC_MMU_32B:
-    case POWERPC_MMU_601:
         /*
          * Actual CPUs invalidate entire congruence classes based on
          * the geometry of their TLBs and some OSes take that into
diff --git a/target/ppc/timebase_helper.c b/target/ppc/timebase_helper.c
index af378318c19c..86d01d6e4e7a 100644
--- a/target/ppc/timebase_helper.c
+++ b/target/ppc/timebase_helper.c
@@ -63,16 +63,6 @@ void helper_store_purr(CPUPPCState *env, target_ulong =
val)
 }
 #endif
=20
-target_ulong helper_load_601_rtcl(CPUPPCState *env)
-{
-    return cpu_ppc601_load_rtcl(env);
-}
-
-target_ulong helper_load_601_rtcu(CPUPPCState *env)
-{
-    return cpu_ppc601_load_rtcu(env);
-}
-
 #if !defined(CONFIG_USER_ONLY)
 void helper_store_tbl(CPUPPCState *env, target_ulong val)
 {
@@ -94,16 +84,6 @@ void helper_store_atbu(CPUPPCState *env, target_ulong =
val)
     cpu_ppc_store_atbu(env, val);
 }
=20
-void helper_store_601_rtcl(CPUPPCState *env, target_ulong val)
-{
-    cpu_ppc601_store_rtcl(env, val);
-}
-
-void helper_store_601_rtcu(CPUPPCState *env, target_ulong val)
-{
-    cpu_ppc601_store_rtcu(env, val);
-}
-
 target_ulong helper_load_decr(CPUPPCState *env)
 {
     return cpu_ppc_load_decr(env);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index c2f436f8d3bc..2eaffd432a9d 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -794,61 +794,6 @@ void spr_write_dpdes(DisasContext *ctx, int sprn, in=
t gprn)
 #endif
 #endif
=20
-/* PowerPC 601 specific registers */
-/* RTC */
-void spr_read_601_rtcl(DisasContext *ctx, int gprn, int sprn)
-{
-    gen_helper_load_601_rtcl(cpu_gpr[gprn], cpu_env);
-}
-
-void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn)
-{
-    gen_helper_load_601_rtcu(cpu_gpr[gprn], cpu_env);
-}
-
-#if !defined(CONFIG_USER_ONLY)
-void spr_write_601_rtcu(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_store_601_rtcu(cpu_env, cpu_gpr[gprn]);
-}
-
-void spr_write_601_rtcl(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_store_601_rtcl(cpu_env, cpu_gpr[gprn]);
-}
-
-void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn)
-{
-    gen_helper_store_hid0_601(cpu_env, cpu_gpr[gprn]);
-    /* Must stop the translation as endianness may have changed */
-    ctx->base.is_jmp =3D DISAS_EXIT_UPDATE;
-}
-#endif
-
-/* Unified bats */
-#if !defined(CONFIG_USER_ONLY)
-void spr_read_601_ubat(DisasContext *ctx, int gprn, int sprn)
-{
-    tcg_gen_ld_tl(cpu_gpr[gprn], cpu_env,
-                  offsetof(CPUPPCState,
-                           IBAT[sprn & 1][(sprn - SPR_IBAT0U) / 2]));
-}
-
-void spr_write_601_ubatu(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv_i32 t0 =3D tcg_const_i32((sprn - SPR_IBAT0U) / 2);
-    gen_helper_store_601_batl(cpu_env, t0, cpu_gpr[gprn]);
-    tcg_temp_free_i32(t0);
-}
-
-void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn)
-{
-    TCGv_i32 t0 =3D tcg_const_i32((sprn - SPR_IBAT0U) / 2);
-    gen_helper_store_601_batu(cpu_env, t0, cpu_gpr[gprn]);
-    tcg_temp_free_i32(t0);
-}
-#endif
-
 /* PowerPC 40x specific registers */
 #if !defined(CONFIG_USER_ONLY)
 void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn)
@@ -5609,669 +5554,6 @@ static void gen_ecowx(DisasContext *ctx)
     tcg_temp_free(t0);
 }
=20
-/* PowerPC 601 specific instructions */
-
-/* abs - abs. */
-static void gen_abs(DisasContext *ctx)
-{
-    TCGv d =3D cpu_gpr[rD(ctx->opcode)];
-    TCGv a =3D cpu_gpr[rA(ctx->opcode)];
-
-    tcg_gen_abs_tl(d, a);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, d);
-    }
-}
-
-/* abso - abso. */
-static void gen_abso(DisasContext *ctx)
-{
-    TCGv d =3D cpu_gpr[rD(ctx->opcode)];
-    TCGv a =3D cpu_gpr[rA(ctx->opcode)];
-
-    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_ov, a, 0x80000000);
-    tcg_gen_abs_tl(d, a);
-    tcg_gen_or_tl(cpu_so, cpu_so, cpu_ov);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, d);
-    }
-}
-
-/* clcs */
-static void gen_clcs(DisasContext *ctx)
-{
-    TCGv_i32 t0 =3D tcg_const_i32(rA(ctx->opcode));
-    gen_helper_clcs(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
-    tcg_temp_free_i32(t0);
-    /* Rc=3D1 sets CR0 to an undefined state */
-}
-
-/* div - div. */
-static void gen_div(DisasContext *ctx)
-{
-    gen_helper_div(cpu_gpr[rD(ctx->opcode)], cpu_env, cpu_gpr[rA(ctx->op=
code)],
-                   cpu_gpr[rB(ctx->opcode)]);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rD(ctx->opcode)]);
-    }
-}
-
-/* divo - divo. */
-static void gen_divo(DisasContext *ctx)
-{
-    gen_helper_divo(cpu_gpr[rD(ctx->opcode)], cpu_env, cpu_gpr[rA(ctx->o=
pcode)],
-                    cpu_gpr[rB(ctx->opcode)]);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rD(ctx->opcode)]);
-    }
-}
-
-/* divs - divs. */
-static void gen_divs(DisasContext *ctx)
-{
-    gen_helper_divs(cpu_gpr[rD(ctx->opcode)], cpu_env, cpu_gpr[rA(ctx->o=
pcode)],
-                    cpu_gpr[rB(ctx->opcode)]);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rD(ctx->opcode)]);
-    }
-}
-
-/* divso - divso. */
-static void gen_divso(DisasContext *ctx)
-{
-    gen_helper_divso(cpu_gpr[rD(ctx->opcode)], cpu_env,
-                     cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)])=
;
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rD(ctx->opcode)]);
-    }
-}
-
-/* doz - doz. */
-static void gen_doz(DisasContext *ctx)
-{
-    TCGLabel *l1 =3D gen_new_label();
-    TCGLabel *l2 =3D gen_new_label();
-    tcg_gen_brcond_tl(TCG_COND_GE, cpu_gpr[rB(ctx->opcode)],
-                      cpu_gpr[rA(ctx->opcode)], l1);
-    tcg_gen_sub_tl(cpu_gpr[rD(ctx->opcode)], cpu_gpr[rB(ctx->opcode)],
-                   cpu_gpr[rA(ctx->opcode)]);
-    tcg_gen_br(l2);
-    gen_set_label(l1);
-    tcg_gen_movi_tl(cpu_gpr[rD(ctx->opcode)], 0);
-    gen_set_label(l2);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rD(ctx->opcode)]);
-    }
-}
-
-/* dozo - dozo. */
-static void gen_dozo(DisasContext *ctx)
-{
-    TCGLabel *l1 =3D gen_new_label();
-    TCGLabel *l2 =3D gen_new_label();
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-    TCGv t2 =3D tcg_temp_new();
-    /* Start with XER OV disabled, the most likely case */
-    tcg_gen_movi_tl(cpu_ov, 0);
-    tcg_gen_brcond_tl(TCG_COND_GE, cpu_gpr[rB(ctx->opcode)],
-                      cpu_gpr[rA(ctx->opcode)], l1);
-    tcg_gen_sub_tl(t0, cpu_gpr[rB(ctx->opcode)], cpu_gpr[rA(ctx->opcode)=
]);
-    tcg_gen_xor_tl(t1, cpu_gpr[rB(ctx->opcode)], cpu_gpr[rA(ctx->opcode)=
]);
-    tcg_gen_xor_tl(t2, cpu_gpr[rA(ctx->opcode)], t0);
-    tcg_gen_andc_tl(t1, t1, t2);
-    tcg_gen_mov_tl(cpu_gpr[rD(ctx->opcode)], t0);
-    tcg_gen_brcondi_tl(TCG_COND_GE, t1, 0, l2);
-    tcg_gen_movi_tl(cpu_ov, 1);
-    tcg_gen_movi_tl(cpu_so, 1);
-    tcg_gen_br(l2);
-    gen_set_label(l1);
-    tcg_gen_movi_tl(cpu_gpr[rD(ctx->opcode)], 0);
-    gen_set_label(l2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rD(ctx->opcode)]);
-    }
-}
-
-/* dozi */
-static void gen_dozi(DisasContext *ctx)
-{
-    target_long simm =3D SIMM(ctx->opcode);
-    TCGLabel *l1 =3D gen_new_label();
-    TCGLabel *l2 =3D gen_new_label();
-    tcg_gen_brcondi_tl(TCG_COND_LT, cpu_gpr[rA(ctx->opcode)], simm, l1);
-    tcg_gen_subfi_tl(cpu_gpr[rD(ctx->opcode)], simm, cpu_gpr[rA(ctx->opc=
ode)]);
-    tcg_gen_br(l2);
-    gen_set_label(l1);
-    tcg_gen_movi_tl(cpu_gpr[rD(ctx->opcode)], 0);
-    gen_set_label(l2);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rD(ctx->opcode)]);
-    }
-}
-
-/* lscbx - lscbx. */
-static void gen_lscbx(DisasContext *ctx)
-{
-    TCGv t0 =3D tcg_temp_new();
-    TCGv_i32 t1 =3D tcg_const_i32(rD(ctx->opcode));
-    TCGv_i32 t2 =3D tcg_const_i32(rA(ctx->opcode));
-    TCGv_i32 t3 =3D tcg_const_i32(rB(ctx->opcode));
-
-    gen_addr_reg_index(ctx, t0);
-    gen_helper_lscbx(t0, cpu_env, t0, t1, t2, t3);
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t3);
-    tcg_gen_andi_tl(cpu_xer, cpu_xer, ~0x7F);
-    tcg_gen_or_tl(cpu_xer, cpu_xer, t0);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, t0);
-    }
-    tcg_temp_free(t0);
-}
-
-/* maskg - maskg. */
-static void gen_maskg(DisasContext *ctx)
-{
-    TCGLabel *l1 =3D gen_new_label();
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-    TCGv t2 =3D tcg_temp_new();
-    TCGv t3 =3D tcg_temp_new();
-    tcg_gen_movi_tl(t3, 0xFFFFFFFF);
-    tcg_gen_andi_tl(t0, cpu_gpr[rB(ctx->opcode)], 0x1F);
-    tcg_gen_andi_tl(t1, cpu_gpr[rS(ctx->opcode)], 0x1F);
-    tcg_gen_addi_tl(t2, t0, 1);
-    tcg_gen_shr_tl(t2, t3, t2);
-    tcg_gen_shr_tl(t3, t3, t1);
-    tcg_gen_xor_tl(cpu_gpr[rA(ctx->opcode)], t2, t3);
-    tcg_gen_brcond_tl(TCG_COND_GE, t0, t1, l1);
-    tcg_gen_neg_tl(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rA(ctx->opcode)]);
-    gen_set_label(l1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    tcg_temp_free(t3);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* maskir - maskir. */
-static void gen_maskir(DisasContext *ctx)
-{
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-    tcg_gen_and_tl(t0, cpu_gpr[rS(ctx->opcode)], cpu_gpr[rB(ctx->opcode)=
]);
-    tcg_gen_andc_tl(t1, cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode=
)]);
-    tcg_gen_or_tl(cpu_gpr[rA(ctx->opcode)], t0, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* mul - mul. */
-static void gen_mul(DisasContext *ctx)
-{
-    TCGv_i64 t0 =3D tcg_temp_new_i64();
-    TCGv_i64 t1 =3D tcg_temp_new_i64();
-    TCGv t2 =3D tcg_temp_new();
-    tcg_gen_extu_tl_i64(t0, cpu_gpr[rA(ctx->opcode)]);
-    tcg_gen_extu_tl_i64(t1, cpu_gpr[rB(ctx->opcode)]);
-    tcg_gen_mul_i64(t0, t0, t1);
-    tcg_gen_trunc_i64_tl(t2, t0);
-    gen_store_spr(SPR_MQ, t2);
-    tcg_gen_shri_i64(t1, t0, 32);
-    tcg_gen_trunc_i64_tl(cpu_gpr[rD(ctx->opcode)], t1);
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
-    tcg_temp_free(t2);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rD(ctx->opcode)]);
-    }
-}
-
-/* mulo - mulo. */
-static void gen_mulo(DisasContext *ctx)
-{
-    TCGLabel *l1 =3D gen_new_label();
-    TCGv_i64 t0 =3D tcg_temp_new_i64();
-    TCGv_i64 t1 =3D tcg_temp_new_i64();
-    TCGv t2 =3D tcg_temp_new();
-    /* Start with XER OV disabled, the most likely case */
-    tcg_gen_movi_tl(cpu_ov, 0);
-    tcg_gen_extu_tl_i64(t0, cpu_gpr[rA(ctx->opcode)]);
-    tcg_gen_extu_tl_i64(t1, cpu_gpr[rB(ctx->opcode)]);
-    tcg_gen_mul_i64(t0, t0, t1);
-    tcg_gen_trunc_i64_tl(t2, t0);
-    gen_store_spr(SPR_MQ, t2);
-    tcg_gen_shri_i64(t1, t0, 32);
-    tcg_gen_trunc_i64_tl(cpu_gpr[rD(ctx->opcode)], t1);
-    tcg_gen_ext32s_i64(t1, t0);
-    tcg_gen_brcond_i64(TCG_COND_EQ, t0, t1, l1);
-    tcg_gen_movi_tl(cpu_ov, 1);
-    tcg_gen_movi_tl(cpu_so, 1);
-    gen_set_label(l1);
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
-    tcg_temp_free(t2);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rD(ctx->opcode)]);
-    }
-}
-
-/* nabs - nabs. */
-static void gen_nabs(DisasContext *ctx)
-{
-    TCGv d =3D cpu_gpr[rD(ctx->opcode)];
-    TCGv a =3D cpu_gpr[rA(ctx->opcode)];
-
-    tcg_gen_abs_tl(d, a);
-    tcg_gen_neg_tl(d, d);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, d);
-    }
-}
-
-/* nabso - nabso. */
-static void gen_nabso(DisasContext *ctx)
-{
-    TCGv d =3D cpu_gpr[rD(ctx->opcode)];
-    TCGv a =3D cpu_gpr[rA(ctx->opcode)];
-
-    tcg_gen_abs_tl(d, a);
-    tcg_gen_neg_tl(d, d);
-    /* nabs never overflows */
-    tcg_gen_movi_tl(cpu_ov, 0);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, d);
-    }
-}
-
-/* rlmi - rlmi. */
-static void gen_rlmi(DisasContext *ctx)
-{
-    uint32_t mb =3D MB(ctx->opcode);
-    uint32_t me =3D ME(ctx->opcode);
-    TCGv t0 =3D tcg_temp_new();
-    tcg_gen_andi_tl(t0, cpu_gpr[rB(ctx->opcode)], 0x1F);
-    tcg_gen_rotl_tl(t0, cpu_gpr[rS(ctx->opcode)], t0);
-    tcg_gen_andi_tl(t0, t0, MASK(mb, me));
-    tcg_gen_andi_tl(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rA(ctx->opcode)],
-                    ~MASK(mb, me));
-    tcg_gen_or_tl(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rA(ctx->opcode)], t0=
);
-    tcg_temp_free(t0);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* rrib - rrib. */
-static void gen_rrib(DisasContext *ctx)
-{
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-    tcg_gen_andi_tl(t0, cpu_gpr[rB(ctx->opcode)], 0x1F);
-    tcg_gen_movi_tl(t1, 0x80000000);
-    tcg_gen_shr_tl(t1, t1, t0);
-    tcg_gen_shr_tl(t0, cpu_gpr[rS(ctx->opcode)], t0);
-    tcg_gen_and_tl(t0, t0, t1);
-    tcg_gen_andc_tl(t1, cpu_gpr[rA(ctx->opcode)], t1);
-    tcg_gen_or_tl(cpu_gpr[rA(ctx->opcode)], t0, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* sle - sle. */
-static void gen_sle(DisasContext *ctx)
-{
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-    tcg_gen_andi_tl(t1, cpu_gpr[rB(ctx->opcode)], 0x1F);
-    tcg_gen_shl_tl(t0, cpu_gpr[rS(ctx->opcode)], t1);
-    tcg_gen_subfi_tl(t1, 32, t1);
-    tcg_gen_shr_tl(t1, cpu_gpr[rS(ctx->opcode)], t1);
-    tcg_gen_or_tl(t1, t0, t1);
-    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], t0);
-    gen_store_spr(SPR_MQ, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* sleq - sleq. */
-static void gen_sleq(DisasContext *ctx)
-{
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-    TCGv t2 =3D tcg_temp_new();
-    tcg_gen_andi_tl(t0, cpu_gpr[rB(ctx->opcode)], 0x1F);
-    tcg_gen_movi_tl(t2, 0xFFFFFFFF);
-    tcg_gen_shl_tl(t2, t2, t0);
-    tcg_gen_rotl_tl(t0, cpu_gpr[rS(ctx->opcode)], t0);
-    gen_load_spr(t1, SPR_MQ);
-    gen_store_spr(SPR_MQ, t0);
-    tcg_gen_and_tl(t0, t0, t2);
-    tcg_gen_andc_tl(t1, t1, t2);
-    tcg_gen_or_tl(cpu_gpr[rA(ctx->opcode)], t0, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* sliq - sliq. */
-static void gen_sliq(DisasContext *ctx)
-{
-    int sh =3D SH(ctx->opcode);
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-    tcg_gen_shli_tl(t0, cpu_gpr[rS(ctx->opcode)], sh);
-    tcg_gen_shri_tl(t1, cpu_gpr[rS(ctx->opcode)], 32 - sh);
-    tcg_gen_or_tl(t1, t0, t1);
-    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], t0);
-    gen_store_spr(SPR_MQ, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* slliq - slliq. */
-static void gen_slliq(DisasContext *ctx)
-{
-    int sh =3D SH(ctx->opcode);
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-    tcg_gen_rotli_tl(t0, cpu_gpr[rS(ctx->opcode)], sh);
-    gen_load_spr(t1, SPR_MQ);
-    gen_store_spr(SPR_MQ, t0);
-    tcg_gen_andi_tl(t0, t0,  (0xFFFFFFFFU << sh));
-    tcg_gen_andi_tl(t1, t1, ~(0xFFFFFFFFU << sh));
-    tcg_gen_or_tl(cpu_gpr[rA(ctx->opcode)], t0, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* sllq - sllq. */
-static void gen_sllq(DisasContext *ctx)
-{
-    TCGLabel *l1 =3D gen_new_label();
-    TCGLabel *l2 =3D gen_new_label();
-    TCGv t0 =3D tcg_temp_local_new();
-    TCGv t1 =3D tcg_temp_local_new();
-    TCGv t2 =3D tcg_temp_local_new();
-    tcg_gen_andi_tl(t2, cpu_gpr[rB(ctx->opcode)], 0x1F);
-    tcg_gen_movi_tl(t1, 0xFFFFFFFF);
-    tcg_gen_shl_tl(t1, t1, t2);
-    tcg_gen_andi_tl(t0, cpu_gpr[rB(ctx->opcode)], 0x20);
-    tcg_gen_brcondi_tl(TCG_COND_EQ, t0, 0, l1);
-    gen_load_spr(t0, SPR_MQ);
-    tcg_gen_and_tl(cpu_gpr[rA(ctx->opcode)], t0, t1);
-    tcg_gen_br(l2);
-    gen_set_label(l1);
-    tcg_gen_shl_tl(t0, cpu_gpr[rS(ctx->opcode)], t2);
-    gen_load_spr(t2, SPR_MQ);
-    tcg_gen_andc_tl(t1, t2, t1);
-    tcg_gen_or_tl(cpu_gpr[rA(ctx->opcode)], t0, t1);
-    gen_set_label(l2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* slq - slq. */
-static void gen_slq(DisasContext *ctx)
-{
-    TCGLabel *l1 =3D gen_new_label();
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-    tcg_gen_andi_tl(t1, cpu_gpr[rB(ctx->opcode)], 0x1F);
-    tcg_gen_shl_tl(t0, cpu_gpr[rS(ctx->opcode)], t1);
-    tcg_gen_subfi_tl(t1, 32, t1);
-    tcg_gen_shr_tl(t1, cpu_gpr[rS(ctx->opcode)], t1);
-    tcg_gen_or_tl(t1, t0, t1);
-    gen_store_spr(SPR_MQ, t1);
-    tcg_gen_andi_tl(t1, cpu_gpr[rB(ctx->opcode)], 0x20);
-    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], t0);
-    tcg_gen_brcondi_tl(TCG_COND_EQ, t1, 0, l1);
-    tcg_gen_movi_tl(cpu_gpr[rA(ctx->opcode)], 0);
-    gen_set_label(l1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* sraiq - sraiq. */
-static void gen_sraiq(DisasContext *ctx)
-{
-    int sh =3D SH(ctx->opcode);
-    TCGLabel *l1 =3D gen_new_label();
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-    tcg_gen_shri_tl(t0, cpu_gpr[rS(ctx->opcode)], sh);
-    tcg_gen_shli_tl(t1, cpu_gpr[rS(ctx->opcode)], 32 - sh);
-    tcg_gen_or_tl(t0, t0, t1);
-    gen_store_spr(SPR_MQ, t0);
-    tcg_gen_movi_tl(cpu_ca, 0);
-    tcg_gen_brcondi_tl(TCG_COND_EQ, t1, 0, l1);
-    tcg_gen_brcondi_tl(TCG_COND_GE, cpu_gpr[rS(ctx->opcode)], 0, l1);
-    tcg_gen_movi_tl(cpu_ca, 1);
-    gen_set_label(l1);
-    tcg_gen_sari_tl(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rS(ctx->opcode)], =
sh);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* sraq - sraq. */
-static void gen_sraq(DisasContext *ctx)
-{
-    TCGLabel *l1 =3D gen_new_label();
-    TCGLabel *l2 =3D gen_new_label();
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_local_new();
-    TCGv t2 =3D tcg_temp_local_new();
-    tcg_gen_andi_tl(t2, cpu_gpr[rB(ctx->opcode)], 0x1F);
-    tcg_gen_shr_tl(t0, cpu_gpr[rS(ctx->opcode)], t2);
-    tcg_gen_sar_tl(t1, cpu_gpr[rS(ctx->opcode)], t2);
-    tcg_gen_subfi_tl(t2, 32, t2);
-    tcg_gen_shl_tl(t2, cpu_gpr[rS(ctx->opcode)], t2);
-    tcg_gen_or_tl(t0, t0, t2);
-    gen_store_spr(SPR_MQ, t0);
-    tcg_gen_andi_tl(t0, cpu_gpr[rB(ctx->opcode)], 0x20);
-    tcg_gen_brcondi_tl(TCG_COND_EQ, t2, 0, l1);
-    tcg_gen_mov_tl(t2, cpu_gpr[rS(ctx->opcode)]);
-    tcg_gen_sari_tl(t1, cpu_gpr[rS(ctx->opcode)], 31);
-    gen_set_label(l1);
-    tcg_temp_free(t0);
-    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], t1);
-    tcg_gen_movi_tl(cpu_ca, 0);
-    tcg_gen_brcondi_tl(TCG_COND_GE, t1, 0, l2);
-    tcg_gen_brcondi_tl(TCG_COND_EQ, t2, 0, l2);
-    tcg_gen_movi_tl(cpu_ca, 1);
-    gen_set_label(l2);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* sre - sre. */
-static void gen_sre(DisasContext *ctx)
-{
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-    tcg_gen_andi_tl(t1, cpu_gpr[rB(ctx->opcode)], 0x1F);
-    tcg_gen_shr_tl(t0, cpu_gpr[rS(ctx->opcode)], t1);
-    tcg_gen_subfi_tl(t1, 32, t1);
-    tcg_gen_shl_tl(t1, cpu_gpr[rS(ctx->opcode)], t1);
-    tcg_gen_or_tl(t1, t0, t1);
-    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], t0);
-    gen_store_spr(SPR_MQ, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* srea - srea. */
-static void gen_srea(DisasContext *ctx)
-{
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-    tcg_gen_andi_tl(t1, cpu_gpr[rB(ctx->opcode)], 0x1F);
-    tcg_gen_rotr_tl(t0, cpu_gpr[rS(ctx->opcode)], t1);
-    gen_store_spr(SPR_MQ, t0);
-    tcg_gen_sar_tl(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rS(ctx->opcode)], t=
1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* sreq */
-static void gen_sreq(DisasContext *ctx)
-{
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-    TCGv t2 =3D tcg_temp_new();
-    tcg_gen_andi_tl(t0, cpu_gpr[rB(ctx->opcode)], 0x1F);
-    tcg_gen_movi_tl(t1, 0xFFFFFFFF);
-    tcg_gen_shr_tl(t1, t1, t0);
-    tcg_gen_rotr_tl(t0, cpu_gpr[rS(ctx->opcode)], t0);
-    gen_load_spr(t2, SPR_MQ);
-    gen_store_spr(SPR_MQ, t0);
-    tcg_gen_and_tl(t0, t0, t1);
-    tcg_gen_andc_tl(t2, t2, t1);
-    tcg_gen_or_tl(cpu_gpr[rA(ctx->opcode)], t0, t2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* sriq */
-static void gen_sriq(DisasContext *ctx)
-{
-    int sh =3D SH(ctx->opcode);
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-    tcg_gen_shri_tl(t0, cpu_gpr[rS(ctx->opcode)], sh);
-    tcg_gen_shli_tl(t1, cpu_gpr[rS(ctx->opcode)], 32 - sh);
-    tcg_gen_or_tl(t1, t0, t1);
-    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], t0);
-    gen_store_spr(SPR_MQ, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* srliq */
-static void gen_srliq(DisasContext *ctx)
-{
-    int sh =3D SH(ctx->opcode);
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-    tcg_gen_rotri_tl(t0, cpu_gpr[rS(ctx->opcode)], sh);
-    gen_load_spr(t1, SPR_MQ);
-    gen_store_spr(SPR_MQ, t0);
-    tcg_gen_andi_tl(t0, t0,  (0xFFFFFFFFU >> sh));
-    tcg_gen_andi_tl(t1, t1, ~(0xFFFFFFFFU >> sh));
-    tcg_gen_or_tl(cpu_gpr[rA(ctx->opcode)], t0, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* srlq */
-static void gen_srlq(DisasContext *ctx)
-{
-    TCGLabel *l1 =3D gen_new_label();
-    TCGLabel *l2 =3D gen_new_label();
-    TCGv t0 =3D tcg_temp_local_new();
-    TCGv t1 =3D tcg_temp_local_new();
-    TCGv t2 =3D tcg_temp_local_new();
-    tcg_gen_andi_tl(t2, cpu_gpr[rB(ctx->opcode)], 0x1F);
-    tcg_gen_movi_tl(t1, 0xFFFFFFFF);
-    tcg_gen_shr_tl(t2, t1, t2);
-    tcg_gen_andi_tl(t0, cpu_gpr[rB(ctx->opcode)], 0x20);
-    tcg_gen_brcondi_tl(TCG_COND_EQ, t0, 0, l1);
-    gen_load_spr(t0, SPR_MQ);
-    tcg_gen_and_tl(cpu_gpr[rA(ctx->opcode)], t0, t2);
-    tcg_gen_br(l2);
-    gen_set_label(l1);
-    tcg_gen_shr_tl(t0, cpu_gpr[rS(ctx->opcode)], t2);
-    tcg_gen_and_tl(t0, t0, t2);
-    gen_load_spr(t1, SPR_MQ);
-    tcg_gen_andc_tl(t1, t1, t2);
-    tcg_gen_or_tl(cpu_gpr[rA(ctx->opcode)], t0, t1);
-    gen_set_label(l2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
-/* srq */
-static void gen_srq(DisasContext *ctx)
-{
-    TCGLabel *l1 =3D gen_new_label();
-    TCGv t0 =3D tcg_temp_new();
-    TCGv t1 =3D tcg_temp_new();
-    tcg_gen_andi_tl(t1, cpu_gpr[rB(ctx->opcode)], 0x1F);
-    tcg_gen_shr_tl(t0, cpu_gpr[rS(ctx->opcode)], t1);
-    tcg_gen_subfi_tl(t1, 32, t1);
-    tcg_gen_shl_tl(t1, cpu_gpr[rS(ctx->opcode)], t1);
-    tcg_gen_or_tl(t1, t0, t1);
-    gen_store_spr(SPR_MQ, t1);
-    tcg_gen_andi_tl(t1, cpu_gpr[rB(ctx->opcode)], 0x20);
-    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], t0);
-    tcg_gen_brcondi_tl(TCG_COND_EQ, t0, 0, l1);
-    tcg_gen_movi_tl(cpu_gpr[rA(ctx->opcode)], 0);
-    gen_set_label(l1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    if (unlikely(Rc(ctx->opcode) !=3D 0)) {
-        gen_set_Rc0(ctx, cpu_gpr[rA(ctx->opcode)]);
-    }
-}
-
 /* 602 - 603 - G2 TLB management */
=20
 /* tlbld */
@@ -6296,81 +5578,6 @@ static void gen_tlbli_6xx(DisasContext *ctx)
 #endif /* defined(CONFIG_USER_ONLY) */
 }
=20
-/* POWER instructions not in PowerPC 601 */
-
-/* clf */
-static void gen_clf(DisasContext *ctx)
-{
-    /* Cache line flush: implemented as no-op */
-}
-
-/* cli */
-static void gen_cli(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
-#else
-    /* Cache line invalidate: privileged and treated as no-op */
-    CHK_SV;
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
-/* dclst */
-static void gen_dclst(DisasContext *ctx)
-{
-    /* Data cache line store: treated as no-op */
-}
-
-static void gen_mfsri(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
-#else
-    int ra =3D rA(ctx->opcode);
-    int rd =3D rD(ctx->opcode);
-    TCGv t0;
-
-    CHK_SV;
-    t0 =3D tcg_temp_new();
-    gen_addr_reg_index(ctx, t0);
-    tcg_gen_extract_tl(t0, t0, 28, 4);
-    gen_helper_load_sr(cpu_gpr[rd], cpu_env, t0);
-    tcg_temp_free(t0);
-    if (ra !=3D 0 && ra !=3D rd) {
-        tcg_gen_mov_tl(cpu_gpr[ra], cpu_gpr[rd]);
-    }
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
-static void gen_rac(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
-#else
-    TCGv t0;
-
-    CHK_SV;
-    t0 =3D tcg_temp_new();
-    gen_addr_reg_index(ctx, t0);
-    gen_helper_rac(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
-    tcg_temp_free(t0);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
-static void gen_rfsvc(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
-#else
-    CHK_SV;
-
-    gen_helper_rfsvc(cpu_env);
-    ctx->base.is_jmp =3D DISAS_EXIT;
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
-/* svc is not implemented for now */
-
 /* BookE specific instructions */
=20
 /* XXX: not implemented on 440 ? */
@@ -7718,56 +6925,8 @@ GEN_HANDLER_E(slbsync, 0x1F, 0x12, 0x0A, 0x03FFF80=
1, PPC_NONE, PPC2_ISA300),
 #endif
 GEN_HANDLER(eciwx, 0x1F, 0x16, 0x0D, 0x00000001, PPC_EXTERN),
 GEN_HANDLER(ecowx, 0x1F, 0x16, 0x09, 0x00000001, PPC_EXTERN),
-GEN_HANDLER(abs, 0x1F, 0x08, 0x0B, 0x0000F800, PPC_POWER_BR),
-GEN_HANDLER(abso, 0x1F, 0x08, 0x1B, 0x0000F800, PPC_POWER_BR),
-GEN_HANDLER(clcs, 0x1F, 0x10, 0x13, 0x0000F800, PPC_POWER_BR),
-GEN_HANDLER(div, 0x1F, 0x0B, 0x0A, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(divo, 0x1F, 0x0B, 0x1A, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(divs, 0x1F, 0x0B, 0x0B, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(divso, 0x1F, 0x0B, 0x1B, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(doz, 0x1F, 0x08, 0x08, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(dozo, 0x1F, 0x08, 0x18, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(dozi, 0x09, 0xFF, 0xFF, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(lscbx, 0x1F, 0x15, 0x08, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(maskg, 0x1F, 0x1D, 0x00, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(maskir, 0x1F, 0x1D, 0x10, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(mul, 0x1F, 0x0B, 0x03, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(mulo, 0x1F, 0x0B, 0x13, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(nabs, 0x1F, 0x08, 0x0F, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(nabso, 0x1F, 0x08, 0x1F, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(rlmi, 0x16, 0xFF, 0xFF, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(rrib, 0x1F, 0x19, 0x10, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(sle, 0x1F, 0x19, 0x04, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(sleq, 0x1F, 0x19, 0x06, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(sliq, 0x1F, 0x18, 0x05, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(slliq, 0x1F, 0x18, 0x07, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(sllq, 0x1F, 0x18, 0x06, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(slq, 0x1F, 0x18, 0x04, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(sraiq, 0x1F, 0x18, 0x1D, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(sraq, 0x1F, 0x18, 0x1C, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(sre, 0x1F, 0x19, 0x14, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(srea, 0x1F, 0x19, 0x1C, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(sreq, 0x1F, 0x19, 0x16, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(sriq, 0x1F, 0x18, 0x15, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(srliq, 0x1F, 0x18, 0x17, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(srlq, 0x1F, 0x18, 0x16, 0x00000000, PPC_POWER_BR),
-GEN_HANDLER(srq, 0x1F, 0x18, 0x14, 0x00000000, PPC_POWER_BR),
 GEN_HANDLER2(tlbld_6xx, "tlbld", 0x1F, 0x12, 0x1E, 0x03FF0001, PPC_6xx_T=
LB),
 GEN_HANDLER2(tlbli_6xx, "tlbli", 0x1F, 0x12, 0x1F, 0x03FF0001, PPC_6xx_T=
LB),
-GEN_HANDLER(clf, 0x1F, 0x16, 0x03, 0x03E00000, PPC_POWER),
-GEN_HANDLER(cli, 0x1F, 0x16, 0x0F, 0x03E00000, PPC_POWER),
-GEN_HANDLER(dclst, 0x1F, 0x16, 0x13, 0x03E00000, PPC_POWER),
-GEN_HANDLER(mfsri, 0x1F, 0x13, 0x13, 0x00000001, PPC_POWER),
-GEN_HANDLER(rac, 0x1F, 0x12, 0x19, 0x00000001, PPC_POWER),
-GEN_HANDLER(rfsvc, 0x13, 0x12, 0x02, 0x03FFF0001, PPC_POWER),
-GEN_HANDLER(lfq, 0x38, 0xFF, 0xFF, 0x00000003, PPC_POWER2),
-GEN_HANDLER(lfqu, 0x39, 0xFF, 0xFF, 0x00000003, PPC_POWER2),
-GEN_HANDLER(lfqux, 0x1F, 0x17, 0x19, 0x00000001, PPC_POWER2),
-GEN_HANDLER(lfqx, 0x1F, 0x17, 0x18, 0x00000001, PPC_POWER2),
-GEN_HANDLER(stfq, 0x3C, 0xFF, 0xFF, 0x00000003, PPC_POWER2),
-GEN_HANDLER(stfqu, 0x3D, 0xFF, 0xFF, 0x00000003, PPC_POWER2),
-GEN_HANDLER(stfqux, 0x1F, 0x17, 0x1D, 0x00000001, PPC_POWER2),
-GEN_HANDLER(stfqx, 0x1F, 0x17, 0x1C, 0x00000001, PPC_POWER2),
 GEN_HANDLER(mfapidi, 0x1F, 0x13, 0x08, 0x0000F801, PPC_MFAPIDI),
 GEN_HANDLER(tlbiva, 0x1F, 0x12, 0x18, 0x03FFF801, PPC_TLBIVA),
 GEN_HANDLER(mfdcr, 0x1F, 0x03, 0x0A, 0x00000001, PPC_DCR),
@@ -8463,7 +7622,6 @@ static void ppc_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     ctx->has_cfar =3D !!(env->flags & POWERPC_FLAG_CFAR);
 #endif
     ctx->lazy_tlb_flush =3D env->mmu_model =3D=3D POWERPC_MMU_32B
-        || env->mmu_model =3D=3D POWERPC_MMU_601
         || env->mmu_model & POWERPC_MMU_64;
=20
     ctx->fpu_enabled =3D (hflags >> HFLAGS_FP) & 1;
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp=
-impl.c.inc
index c96769742e14..cfb27bd02040 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -1105,185 +1105,6 @@ static inline void gen_qemu_st32fiw(DisasContext =
*ctx, TCGv_i64 arg1, TCGv arg2)
 /* stfiwx */
 GEN_STXF(stfiw, st32fiw, 0x17, 0x1E, PPC_FLOAT_STFIWX);
=20
-/* POWER2 specific instructions */
-/* Quad manipulation (load/store two floats at a time) */
-
-/* lfq */
-static void gen_lfq(DisasContext *ctx)
-{
-    int rd =3D rD(ctx->opcode);
-    TCGv t0;
-    TCGv_i64 t1;
-    gen_set_access_type(ctx, ACCESS_FLOAT);
-    t0 =3D tcg_temp_new();
-    t1 =3D tcg_temp_new_i64();
-    gen_addr_imm_index(ctx, t0, 0);
-    gen_qemu_ld64_i64(ctx, t1, t0);
-    set_fpr(rd, t1);
-    gen_addr_add(ctx, t0, t0, 8);
-    gen_qemu_ld64_i64(ctx, t1, t0);
-    set_fpr((rd + 1) % 32, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free_i64(t1);
-}
-
-/* lfqu */
-static void gen_lfqu(DisasContext *ctx)
-{
-    int ra =3D rA(ctx->opcode);
-    int rd =3D rD(ctx->opcode);
-    TCGv t0, t1;
-    TCGv_i64 t2;
-    gen_set_access_type(ctx, ACCESS_FLOAT);
-    t0 =3D tcg_temp_new();
-    t1 =3D tcg_temp_new();
-    t2 =3D tcg_temp_new_i64();
-    gen_addr_imm_index(ctx, t0, 0);
-    gen_qemu_ld64_i64(ctx, t2, t0);
-    set_fpr(rd, t2);
-    gen_addr_add(ctx, t1, t0, 8);
-    gen_qemu_ld64_i64(ctx, t2, t1);
-    set_fpr((rd + 1) % 32, t2);
-    if (ra !=3D 0) {
-        tcg_gen_mov_tl(cpu_gpr[ra], t0);
-    }
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free_i64(t2);
-}
-
-/* lfqux */
-static void gen_lfqux(DisasContext *ctx)
-{
-    int ra =3D rA(ctx->opcode);
-    int rd =3D rD(ctx->opcode);
-    gen_set_access_type(ctx, ACCESS_FLOAT);
-    TCGv t0, t1;
-    TCGv_i64 t2;
-    t2 =3D tcg_temp_new_i64();
-    t0 =3D tcg_temp_new();
-    gen_addr_reg_index(ctx, t0);
-    gen_qemu_ld64_i64(ctx, t2, t0);
-    set_fpr(rd, t2);
-    t1 =3D tcg_temp_new();
-    gen_addr_add(ctx, t1, t0, 8);
-    gen_qemu_ld64_i64(ctx, t2, t1);
-    set_fpr((rd + 1) % 32, t2);
-    tcg_temp_free(t1);
-    if (ra !=3D 0) {
-        tcg_gen_mov_tl(cpu_gpr[ra], t0);
-    }
-    tcg_temp_free(t0);
-    tcg_temp_free_i64(t2);
-}
-
-/* lfqx */
-static void gen_lfqx(DisasContext *ctx)
-{
-    int rd =3D rD(ctx->opcode);
-    TCGv t0;
-    TCGv_i64 t1;
-    gen_set_access_type(ctx, ACCESS_FLOAT);
-    t0 =3D tcg_temp_new();
-    t1 =3D tcg_temp_new_i64();
-    gen_addr_reg_index(ctx, t0);
-    gen_qemu_ld64_i64(ctx, t1, t0);
-    set_fpr(rd, t1);
-    gen_addr_add(ctx, t0, t0, 8);
-    gen_qemu_ld64_i64(ctx, t1, t0);
-    set_fpr((rd + 1) % 32, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free_i64(t1);
-}
-
-/* stfq */
-static void gen_stfq(DisasContext *ctx)
-{
-    int rd =3D rD(ctx->opcode);
-    TCGv t0;
-    TCGv_i64 t1;
-    gen_set_access_type(ctx, ACCESS_FLOAT);
-    t0 =3D tcg_temp_new();
-    t1 =3D tcg_temp_new_i64();
-    gen_addr_imm_index(ctx, t0, 0);
-    get_fpr(t1, rd);
-    gen_qemu_st64_i64(ctx, t1, t0);
-    gen_addr_add(ctx, t0, t0, 8);
-    get_fpr(t1, (rd + 1) % 32);
-    gen_qemu_st64_i64(ctx, t1, t0);
-    tcg_temp_free(t0);
-    tcg_temp_free_i64(t1);
-}
-
-/* stfqu */
-static void gen_stfqu(DisasContext *ctx)
-{
-    int ra =3D rA(ctx->opcode);
-    int rd =3D rD(ctx->opcode);
-    TCGv t0, t1;
-    TCGv_i64 t2;
-    gen_set_access_type(ctx, ACCESS_FLOAT);
-    t2 =3D tcg_temp_new_i64();
-    t0 =3D tcg_temp_new();
-    gen_addr_imm_index(ctx, t0, 0);
-    get_fpr(t2, rd);
-    gen_qemu_st64_i64(ctx, t2, t0);
-    t1 =3D tcg_temp_new();
-    gen_addr_add(ctx, t1, t0, 8);
-    get_fpr(t2, (rd + 1) % 32);
-    gen_qemu_st64_i64(ctx, t2, t1);
-    tcg_temp_free(t1);
-    if (ra !=3D 0) {
-        tcg_gen_mov_tl(cpu_gpr[ra], t0);
-    }
-    tcg_temp_free(t0);
-    tcg_temp_free_i64(t2);
-}
-
-/* stfqux */
-static void gen_stfqux(DisasContext *ctx)
-{
-    int ra =3D rA(ctx->opcode);
-    int rd =3D rD(ctx->opcode);
-    TCGv t0, t1;
-    TCGv_i64 t2;
-    gen_set_access_type(ctx, ACCESS_FLOAT);
-    t2 =3D tcg_temp_new_i64();
-    t0 =3D tcg_temp_new();
-    gen_addr_reg_index(ctx, t0);
-    get_fpr(t2, rd);
-    gen_qemu_st64_i64(ctx, t2, t0);
-    t1 =3D tcg_temp_new();
-    gen_addr_add(ctx, t1, t0, 8);
-    get_fpr(t2, (rd + 1) % 32);
-    gen_qemu_st64_i64(ctx, t2, t1);
-    tcg_temp_free(t1);
-    if (ra !=3D 0) {
-        tcg_gen_mov_tl(cpu_gpr[ra], t0);
-    }
-    tcg_temp_free(t0);
-    tcg_temp_free_i64(t2);
-}
-
-/* stfqx */
-static void gen_stfqx(DisasContext *ctx)
-{
-    int rd =3D rD(ctx->opcode);
-    TCGv t0;
-    TCGv_i64 t1;
-    gen_set_access_type(ctx, ACCESS_FLOAT);
-    t1 =3D tcg_temp_new_i64();
-    t0 =3D tcg_temp_new();
-    gen_addr_reg_index(ctx, t0);
-    get_fpr(t1, rd);
-    gen_qemu_st64_i64(ctx, t1, t0);
-    gen_addr_add(ctx, t0, t0, 8);
-    get_fpr(t1, (rd + 1) % 32);
-    gen_qemu_st64_i64(ctx, t1, t0);
-    tcg_temp_free(t0);
-    tcg_temp_free_i64(t1);
-}
-
 /*            Floating-point Load/Store Instructions                    =
     */
 static bool do_lsfpsd(DisasContext *ctx, int rt, int ra, TCGv displ,
                       bool update, bool store, bool single)
--=20
2.34.1


