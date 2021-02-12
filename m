Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5FB31A6A7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 22:18:17 +0100 (CET)
Received: from localhost ([::1]:37026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAfpQ-0003r6-J9
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 16:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAfmH-0001xa-Nk
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 16:15:01 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:47509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAfmE-0003SY-FT
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 16:15:01 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N5VPe-1lyU7S3Ude-016v42; Fri, 12 Feb 2021 22:14:53 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] m68k: improve cpu instantiation comments
Date: Fri, 12 Feb 2021 22:14:42 +0100
Message-Id: <20210212211448.413489-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210212211448.413489-1-laurent@vivier.eu>
References: <20210212211448.413489-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:USKoJlXf1ASHqdpKIvsaYZrVRjF08Xy+IjR/IrpPFOl5TTlwXb7
 SxT0t3/s2xrpC70026x+w46IHK/LQD4G+9ou7plMdtDEOyQYy4HRhX0H+VN2uKMCK6EZMkN
 hVY8tCdliXI8FDtPN6w0NibFsA+UVVQlHlZ2vMEVW4B2Jd4lGE9JzQM3k2q+YbbpPpyUg1b
 ii3QOBqAOPJvtxjaqh4TQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2zRf2Pfnxp0=:fWILALIYtJ8ClMiXSNC2ka
 6ZjFM/hVOII59e5S1mXx+MniD+gpYwLVuGgyOYdbI3pzEy07tVkvTTAFAM3jFxJzMLkVV1YJP
 MhhjA9/4gJU1R6Mx7YHwRWTY0Qqzp3d9OVerftTlSANj10JrBvAI60UNOTH1NchivQ68Stsqs
 TFfNvFFLT3158vhSpCy5j0Qzr2nA6SrvpUWDl2px2Scv8QpZHOMrhCe7RfcS43TmgUNUFVgGT
 KWsNnHjKk82Z3a2FgJWlxqGsaRzBFWsdcMaqdhIM4v2enH0EbZfpEgjS4FutEtxGjO0SPsZ/d
 5HuIlTN8yBllg5qnlNJ8iR2vy0EdCA+Rz4TrsgEBs9mEdlHtZ3Ivm63VoJgT/ROWw9vdnVDcE
 WJNwT6cT3qEYNwNXK1eTrPzLXIZHK2RylfZzjcUQ2eD75XP25Fk7tVDqTuBJp
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>

Improvement in comments for the instantiation functions.
This is to highlight what each cpu class, in the 68000 series, contains
in terms of instructions/features.

Signed-off-by: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <2dfe32672ee6ddce4b54c6bcfce579d35abeaf51.1612137712.git.balaton@eik.bme.hu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/cpu.h | 49 ++++++++++++++++++++++++++++-------------------
 target/m68k/cpu.c | 44 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+), 20 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index de5b9875fea3..1d59cbb3f4ab 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -450,39 +450,48 @@ void m68k_switch_sp(CPUM68KState *env);
 void do_m68k_semihosting(CPUM68KState *env, int nr);
 
 /*
+ * The 68000 family is defined in six main CPU classes, the 680[012346]0.
+ * Generally each successive CPU adds enhanced data/stack/instructions.
+ * However, some features are only common to one, or a few classes.
+ * The features covers those subsets of instructons.
+ *
+ * CPU32/32+ are basically 680010 compatible with some 68020 class instructons,
+ * and some additional CPU32 instructions. Mostly Supervisor state differences.
+ *
+ * The ColdFire core ISA is a RISC-style reduction of the 68000 series cpu.
  * There are 4 ColdFire core ISA revisions: A, A+, B and C.
  * Each feature covers the subset of instructions common to the
  * ISA revisions mentioned.
  */
 
 enum m68k_features {
-    M68K_FEATURE_M68000,
+    M68K_FEATURE_M68000,   /* Base m68k instruction set */
     M68K_FEATURE_M68020,
     M68K_FEATURE_M68030,
     M68K_FEATURE_M68040,
     M68K_FEATURE_M68060,
-    M68K_FEATURE_CF_ISA_A,
-    M68K_FEATURE_CF_ISA_B, /* (ISA B or C).  */
-    M68K_FEATURE_CF_ISA_APLUSC, /* BIT/BITREV, FF1, STRLDSR (ISA A+ or C).  */
-    M68K_FEATURE_BRAL, /* Long unconditional branch.  (ISA A+ or B).  */
+    M68K_FEATURE_CF_ISA_A, /* Base Coldfire set Rev A. */
+    M68K_FEATURE_CF_ISA_B, /* (ISA B or C). */
+    M68K_FEATURE_CF_ISA_APLUSC, /* BIT/BITREV, FF1, STRLDSR (ISA A+ or C). */
+    M68K_FEATURE_BRAL, /* BRA with Long branch. (680[2346]0, ISA A+ or B). */
     M68K_FEATURE_CF_FPU,
     M68K_FEATURE_CF_MAC,
     M68K_FEATURE_CF_EMAC,
-    M68K_FEATURE_CF_EMAC_B, /* Revision B EMAC (dual accumulate).  */
-    M68K_FEATURE_USP, /* User Stack Pointer.  (ISA A+, B or C).  */
-    M68K_FEATURE_EXT_FULL, /* 68020+ full extension word.  */
-    M68K_FEATURE_WORD_INDEX, /* word sized address index registers.  */
-    M68K_FEATURE_SCALED_INDEX, /* scaled address index registers.  */
-    M68K_FEATURE_LONG_MULDIV, /* 32 bit multiply/divide. */
-    M68K_FEATURE_QUAD_MULDIV, /* 64 bit multiply/divide. */
-    M68K_FEATURE_BCCL, /* Long conditional branches.  */
-    M68K_FEATURE_BITFIELD, /* Bit field insns.  */
-    M68K_FEATURE_FPU,
-    M68K_FEATURE_CAS,
-    M68K_FEATURE_BKPT,
-    M68K_FEATURE_RTD,
-    M68K_FEATURE_CHK2,
-    M68K_FEATURE_MOVEP,
+    M68K_FEATURE_CF_EMAC_B,   /* Revision B EMAC (dual accumulate). */
+    M68K_FEATURE_USP, /* User Stack Pointer. (680[012346]0, ISA A+, B or C).*/
+    M68K_FEATURE_EXT_FULL,    /* 68020+ full extension word. */
+    M68K_FEATURE_WORD_INDEX,  /* word sized address index registers. */
+    M68K_FEATURE_SCALED_INDEX, /* scaled address index registers. */
+    M68K_FEATURE_LONG_MULDIV, /* 32 bit mul/div. (680[2346]0, and CPU32) */
+    M68K_FEATURE_QUAD_MULDIV, /* 64 bit mul/div. (680[2346]0, and CPU32) */
+    M68K_FEATURE_BCCL,  /* Bcc with Long branches. (680[2346]0, and CPU32) */
+    M68K_FEATURE_BITFIELD, /* BFxxx Bit field insns. (680[2346]0) */
+    M68K_FEATURE_FPU,   /* fpu insn. (680[46]0) */
+    M68K_FEATURE_CAS,   /* CAS/CAS2[WL] insns. (680[2346]0) */
+    M68K_FEATURE_BKPT,  /* BKPT insn. (680[12346]0, and CPU32) */
+    M68K_FEATURE_RTD,   /* RTD insn. (680[12346]0, and CPU32) */
+    M68K_FEATURE_CHK2,  /* CHK2 insn. (680[2346]0, and CPU32) */
+    M68K_FEATURE_MOVEP, /* MOVEP insn. (680[01234]0, and CPU32) */
 };
 
 static inline int m68k_feature(CPUM68KState *env, int feature)
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index c6fde8132b2f..5c72f2469471 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -103,6 +103,7 @@ static void m5206_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_CF_ISA_A);
 }
 
+/* Base feature set, including isns. for m68k family */
 static void m68000_cpu_initfn(Object *obj)
 {
     M68kCPU *cpu = M68K_CPU(obj);
@@ -135,6 +136,13 @@ static void m680x0_cpu_common(CPUM68KState *env)
     m68k_set_feature(env, M68K_FEATURE_MOVEP);
 }
 
+/*
+ * Adds BFCHG, BFCLR, BFEXTS, BFEXTU, BFFFO, BFINS, BFSET, BFTST, CAS, CAS2,
+ *      CHK2, CMP2, DIVSL, DIVUL, EXTB, PACK, TRAPcc, UNPK.
+ *
+ * 68020/30 only:
+ *      CALLM, cpBcc, cpDBcc, cpGEN, cpRESTORE, cpSAVE, cpScc, cpTRAPcc
+ */
 static void m68020_cpu_initfn(Object *obj)
 {
     M68kCPU *cpu = M68K_CPU(obj);
@@ -144,6 +152,14 @@ static void m68020_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_M68020);
 }
 
+/*
+ * Adds: PFLUSH (*5)
+ * 68030 Only: PFLUSHA (*5), PLOAD (*5), PMOVE
+ * 68030/40 Only: PTEST
+ *
+ * NOTES:
+ *  5. Not valid on MC68EC030
+ */
 static void m68030_cpu_initfn(Object *obj)
 {
     M68kCPU *cpu = M68K_CPU(obj);
@@ -153,6 +169,23 @@ static void m68030_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_M68030);
 }
 
+/*
+ * Adds: CINV, CPUSH
+ * Adds all with Note *2: FABS, FSABS, FDABS, FADD, FSADD, FDADD, FBcc, FCMP,
+ *                        FDBcc, FDIV, FSDIV, FDDIV, FMOVE, FSMOVE, FDMOVE,
+ *                        FMOVEM, FMUL, FSMUL, FDMUL, FNEG, FSNEG, FDNEG, FNOP,
+ *                        FRESTORE, FSAVE, FScc, FSQRT, FSSQRT, FDSQRT, FSUB,
+ *                        FSSUB, FDSUB, FTRAPcc, FTST
+ *
+ * Adds with Notes *2, and *3: FACOS, FASIN, FATAN, FATANH, FCOS, FCOSH, FETOX,
+ *                             FETOXM, FGETEXP, FGETMAN, FINT, FINTRZ, FLOG10,
+ *                             FLOG2, FLOGN, FLOGNP1, FMOD, FMOVECR, FREM,
+ *                             FSCALE, FSGLDIV, FSGLMUL, FSIN, FSINCOS, FSINH,
+ *                             FTAN, FTANH, FTENTOX, FTWOTOX
+ * NOTES:
+ * 2. Not applicable to the MC68EC040, MC68LC040, MC68EC060, and MC68LC060.
+ * 3. These are software-supported instructions on the MC68040 and MC68060.
+ */
 static void m68040_cpu_initfn(Object *obj)
 {
     M68kCPU *cpu = M68K_CPU(obj);
@@ -162,6 +195,17 @@ static void m68040_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_M68040);
 }
 
+/*
+ * Adds: PLPA
+ * Adds all with Note *2: CAS, CAS2, MULS, MULU, CHK2, CMP2, DIVS, DIVU
+ * All Fxxxx instructions are as per m68040 with exception to; FMOVEM NOTE3
+ *
+ * Does NOT implement MOVEP
+ *
+ * NOTES:
+ * 2. Not applicable to the MC68EC040, MC68LC040, MC68EC060, and MC68LC060.
+ * 3. These are software-supported instructions on the MC68040 and MC68060.
+ */
 static void m68060_cpu_initfn(Object *obj)
 {
     M68kCPU *cpu = M68K_CPU(obj);
-- 
2.29.2


