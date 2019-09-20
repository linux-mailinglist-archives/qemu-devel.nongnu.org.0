Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59D5B8A7A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 07:33:29 +0200 (CEST)
Received: from localhost ([::1]:51454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBBXs-0000t7-Rk
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 01:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40479)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iBBWH-0000SJ-Vt
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 01:31:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iBBWF-0003pL-Mi
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 01:31:49 -0400
Received: from mga03.intel.com ([134.134.136.65]:47244)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iBBWF-0003o3-F6
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 01:31:47 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Sep 2019 22:31:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,527,1559545200"; d="scan'208";a="362747987"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by orsmga005.jf.intel.com with ESMTP; 19 Sep 2019 22:31:40 -0700
From: Tao Xu <tao3.xu@intel.com>
To: philmd@redhat.com, pbonzini@redhat.com, rth@twiddle.net,
 ehabkost@redhat.com
Subject: [PATCH v2] target/i386: clean up comments over 80 chars per line
Date: Fri, 20 Sep 2019 13:31:36 +0800
Message-Id: <20190920053136.945-1-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
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
Cc: Tao Xu <tao3.xu@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop the duplicate definition of CPUID_7_0_ECX_VBMI. And add some
comments, clean up comments over 80 chars per line.

There is an extra line in comment of CPUID_8000_0008_EBX_WBNOINVD,
remove the extra enter and spaces.

Signed-off-by: Tao Xu <tao3.xu@intel.com>
---
 target/i386/cpu.h           | 163 +++++++++++++++++++++++-------------
 target/i386/hvf/x86_cpuid.c |   2 +-
 2 files changed, 107 insertions(+), 58 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5f6e3a029a..587f96ca60 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -641,63 +641,112 @@ typedef uint32_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_SVM_PAUSEFILTER  (1U << 10)
 #define CPUID_SVM_PFTHRESHOLD  (1U << 12)
 
-#define CPUID_7_0_EBX_FSGSBASE (1U << 0)
-#define CPUID_7_0_EBX_BMI1     (1U << 3)
-#define CPUID_7_0_EBX_HLE      (1U << 4)
-#define CPUID_7_0_EBX_AVX2     (1U << 5)
-#define CPUID_7_0_EBX_SMEP     (1U << 7)
-#define CPUID_7_0_EBX_BMI2     (1U << 8)
-#define CPUID_7_0_EBX_ERMS     (1U << 9)
-#define CPUID_7_0_EBX_INVPCID  (1U << 10)
-#define CPUID_7_0_EBX_RTM      (1U << 11)
-#define CPUID_7_0_EBX_MPX      (1U << 14)
-#define CPUID_7_0_EBX_AVX512F  (1U << 16) /* AVX-512 Foundation */
-#define CPUID_7_0_EBX_AVX512DQ (1U << 17) /* AVX-512 Doubleword & Quadword Instrs */
-#define CPUID_7_0_EBX_RDSEED   (1U << 18)
-#define CPUID_7_0_EBX_ADX      (1U << 19)
-#define CPUID_7_0_EBX_SMAP     (1U << 20)
-#define CPUID_7_0_EBX_AVX512IFMA (1U << 21) /* AVX-512 Integer Fused Multiply Add */
-#define CPUID_7_0_EBX_PCOMMIT  (1U << 22) /* Persistent Commit */
-#define CPUID_7_0_EBX_CLFLUSHOPT (1U << 23) /* Flush a Cache Line Optimized */
-#define CPUID_7_0_EBX_CLWB     (1U << 24) /* Cache Line Write Back */
-#define CPUID_7_0_EBX_INTEL_PT (1U << 25) /* Intel Processor Trace */
-#define CPUID_7_0_EBX_AVX512PF (1U << 26) /* AVX-512 Prefetch */
-#define CPUID_7_0_EBX_AVX512ER (1U << 27) /* AVX-512 Exponential and Reciprocal */
-#define CPUID_7_0_EBX_AVX512CD (1U << 28) /* AVX-512 Conflict Detection */
-#define CPUID_7_0_EBX_SHA_NI   (1U << 29) /* SHA1/SHA256 Instruction Extensions */
-#define CPUID_7_0_EBX_AVX512BW (1U << 30) /* AVX-512 Byte and Word Instructions */
-#define CPUID_7_0_EBX_AVX512VL (1U << 31) /* AVX-512 Vector Length Extensions */
-
-#define CPUID_7_0_ECX_AVX512BMI (1U << 1)
-#define CPUID_7_0_ECX_VBMI     (1U << 1)  /* AVX-512 Vector Byte Manipulation Instrs */
-#define CPUID_7_0_ECX_UMIP     (1U << 2)
-#define CPUID_7_0_ECX_PKU      (1U << 3)
-#define CPUID_7_0_ECX_OSPKE    (1U << 4)
-#define CPUID_7_0_ECX_VBMI2    (1U << 6) /* Additional VBMI Instrs */
-#define CPUID_7_0_ECX_GFNI     (1U << 8)
-#define CPUID_7_0_ECX_VAES     (1U << 9)
-#define CPUID_7_0_ECX_VPCLMULQDQ (1U << 10)
-#define CPUID_7_0_ECX_AVX512VNNI (1U << 11)
-#define CPUID_7_0_ECX_AVX512BITALG (1U << 12)
-#define CPUID_7_0_ECX_AVX512_VPOPCNTDQ (1U << 14) /* POPCNT for vectors of DW/QW */
-#define CPUID_7_0_ECX_LA57     (1U << 16)
-#define CPUID_7_0_ECX_RDPID    (1U << 22)
-#define CPUID_7_0_ECX_CLDEMOTE (1U << 25)  /* CLDEMOTE Instruction */
-#define CPUID_7_0_ECX_MOVDIRI  (1U << 27)  /* MOVDIRI Instruction */
-#define CPUID_7_0_ECX_MOVDIR64B (1U << 28) /* MOVDIR64B Instruction */
-
-#define CPUID_7_0_EDX_AVX512_4VNNIW (1U << 2) /* AVX512 Neural Network Instructions */
-#define CPUID_7_0_EDX_AVX512_4FMAPS (1U << 3) /* AVX512 Multiply Accumulation Single Precision */
-#define CPUID_7_0_EDX_SPEC_CTRL     (1U << 26) /* Speculation Control */
-#define CPUID_7_0_EDX_ARCH_CAPABILITIES (1U << 29)  /*Arch Capabilities*/
-#define CPUID_7_0_EDX_CORE_CAPABILITY   (1U << 30)  /*Core Capability*/
-#define CPUID_7_0_EDX_SPEC_CTRL_SSBD  (1U << 31) /* Speculative Store Bypass Disable */
-
-#define CPUID_7_1_EAX_AVX512_BF16 (1U << 5) /* AVX512 BFloat16 Instruction */
-
-#define CPUID_8000_0008_EBX_WBNOINVD  (1U << 9)  /* Write back and
-                                                                             do not invalidate cache */
-#define CPUID_8000_0008_EBX_IBPB    (1U << 12) /* Indirect Branch Prediction Barrier */
+/* Support RDFSBASE/RDGSBASE/WRFSBASE/WRGSBASE */
+#define CPUID_7_0_EBX_FSGSBASE          (1U << 0)
+/* 1st Group of Advanced Bit Manipulation Extensions */
+#define CPUID_7_0_EBX_BMI1              (1U << 3)
+/* Hardware Lock Elision */
+#define CPUID_7_0_EBX_HLE               (1U << 4)
+/* Intel Advanced Vector Extensions 2 */
+#define CPUID_7_0_EBX_AVX2              (1U << 5)
+/* Supervisor-mode Execution Prevention */
+#define CPUID_7_0_EBX_SMEP              (1U << 7)
+/* 2nd Group of Advanced Bit Manipulation Extensions */
+#define CPUID_7_0_EBX_BMI2              (1U << 8)
+/* Enhanced REP MOVSB/STOSB */
+#define CPUID_7_0_EBX_ERMS              (1U << 9)
+/* Invalidate Process-Context Identifier */
+#define CPUID_7_0_EBX_INVPCID           (1U << 10)
+/* Restricted Transactional Memory */
+#define CPUID_7_0_EBX_RTM               (1U << 11)
+/* Memory Protection Extension */
+#define CPUID_7_0_EBX_MPX               (1U << 14)
+/* AVX-512 Foundation */
+#define CPUID_7_0_EBX_AVX512F           (1U << 16)
+/* AVX-512 Doubleword & Quadword Instruction */
+#define CPUID_7_0_EBX_AVX512DQ          (1U << 17)
+/* Read Random SEED */
+#define CPUID_7_0_EBX_RDSEED            (1U << 18)
+/* ADCX and ADOX instructions */
+#define CPUID_7_0_EBX_ADX               (1U << 19)
+/* Supervisor Mode Access Prevention */
+#define CPUID_7_0_EBX_SMAP              (1U << 20)
+/* AVX-512 Integer Fused Multiply Add */
+#define CPUID_7_0_EBX_AVX512IFMA        (1U << 21)
+/* Persistent Commit */
+#define CPUID_7_0_EBX_PCOMMIT           (1U << 22)
+/* Flush a Cache Line Optimized */
+#define CPUID_7_0_EBX_CLFLUSHOPT        (1U << 23)
+/* Cache Line Write Back */
+#define CPUID_7_0_EBX_CLWB              (1U << 24)
+/* Intel Processor Trace */
+#define CPUID_7_0_EBX_INTEL_PT          (1U << 25)
+/* AVX-512 Prefetch */
+#define CPUID_7_0_EBX_AVX512PF          (1U << 26)
+/* AVX-512 Exponential and Reciprocal */
+#define CPUID_7_0_EBX_AVX512ER          (1U << 27)
+/* AVX-512 Conflict Detection */
+#define CPUID_7_0_EBX_AVX512CD          (1U << 28)
+/* SHA1/SHA256 Instruction Extensions */
+#define CPUID_7_0_EBX_SHA_NI            (1U << 29)
+/* AVX-512 Byte and Word Instructions */
+#define CPUID_7_0_EBX_AVX512BW          (1U << 30)
+/* AVX-512 Vector Length Extensions */
+#define CPUID_7_0_EBX_AVX512VL          (1U << 31)
+
+/* AVX-512 Vector Byte Manipulation Instruction */
+#define CPUID_7_0_ECX_VBMI              (1U << 1)
+/* User-Mode Instruction Prevention */
+#define CPUID_7_0_ECX_UMIP              (1U << 2)
+/* Protection Keys for User-mode Pages */
+#define CPUID_7_0_ECX_PKU               (1U << 3)
+/* OS Enable Protection Keys */
+#define CPUID_7_0_ECX_OSPKE             (1U << 4)
+/* Additional AVX-512 Vector Byte Manipulation Instruction */
+#define CPUID_7_0_ECX_VBMI2             (1U << 6)
+/* Galois Field New Instructions */
+#define CPUID_7_0_ECX_GFNI              (1U << 8)
+/* Vector AES Instructions */
+#define CPUID_7_0_ECX_VAES              (1U << 9)
+/* Carry-Less Multiplication Quadword */
+#define CPUID_7_0_ECX_VPCLMULQDQ        (1U << 10)
+/* Vector Neural Network Instructions */
+#define CPUID_7_0_ECX_AVX512VNNI        (1U << 11)
+/* Support for VPOPCNT[B,W] and VPSHUFBITQMB */
+#define CPUID_7_0_ECX_AVX512BITALG      (1U << 12)
+/* POPCNT for vectors of DW/QW */
+#define CPUID_7_0_ECX_AVX512_VPOPCNTDQ  (1U << 14)
+/* 5-level Page Tables */
+#define CPUID_7_0_ECX_LA57              (1U << 16)
+/* Read Processor ID */
+#define CPUID_7_0_ECX_RDPID             (1U << 22)
+/* Cache Line Demote Instruction */
+#define CPUID_7_0_ECX_CLDEMOTE          (1U << 25)
+/* Move Doubleword as Direct Store Instruction */
+#define CPUID_7_0_ECX_MOVDIRI           (1U << 27)
+/* Move 64 Bytes as Direct Store Instruction */
+#define CPUID_7_0_ECX_MOVDIR64B         (1U << 28)
+
+/* AVX512 Neural Network Instructions */
+#define CPUID_7_0_EDX_AVX512_4VNNIW     (1U << 2)
+/* AVX512 Multiply Accumulation Single Precision */
+#define CPUID_7_0_EDX_AVX512_4FMAPS     (1U << 3)
+/* Speculation Control */
+#define CPUID_7_0_EDX_SPEC_CTRL         (1U << 26)
+/* Arch Capabilities */
+#define CPUID_7_0_EDX_ARCH_CAPABILITIES (1U << 29)
+/* Core Capability */
+#define CPUID_7_0_EDX_CORE_CAPABILITY   (1U << 30)
+/* Speculative Store Bypass Disable */
+#define CPUID_7_0_EDX_SPEC_CTRL_SSBD    (1U << 31)
+
+/* AVX512 BFloat16 Instruction */
+#define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
+
+/* Write back and do not invalidate cache */
+#define CPUID_8000_0008_EBX_WBNOINVD    (1U << 9)
+/* Indirect Branch Prediction Barrier */
+#define CPUID_8000_0008_EBX_IBPB        (1U << 12)
 
 #define CPUID_XSAVE_XSAVEOPT   (1U << 0)
 #define CPUID_XSAVE_XSAVEC     (1U << 1)
diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
index 4d957fe896..5041f48b8a 100644
--- a/target/i386/hvf/x86_cpuid.c
+++ b/target/i386/hvf/x86_cpuid.c
@@ -89,7 +89,7 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
                 ebx &= ~CPUID_7_0_EBX_INVPCID;
             }
 
-            ecx &= CPUID_7_0_ECX_AVX512BMI | CPUID_7_0_ECX_AVX512_VPOPCNTDQ;
+            ecx &= CPUID_7_0_ECX_VBMI | CPUID_7_0_ECX_AVX512_VPOPCNTDQ;
             edx &= CPUID_7_0_EDX_AVX512_4VNNIW | CPUID_7_0_EDX_AVX512_4FMAPS;
         } else {
             ebx = 0;
-- 
2.20.1


