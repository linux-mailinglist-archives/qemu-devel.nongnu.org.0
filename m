Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B96367DEF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 11:44:03 +0200 (CEST)
Received: from localhost ([::1]:33416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZVsR-0001jJ-0H
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 05:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lZVqv-0000GE-D0
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:42:29 -0400
Received: from mga01.intel.com ([192.55.52.88]:30564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lZVqs-0000aH-Re
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:42:29 -0400
IronPort-SDR: l1PY6Lnk87DG1Pv/qtUjxBJHd0q/E5X7M3ZLeetveovU1njr/oM1E06cL2VyShnh5sW0iAZpEx
 QaSFmIjJWD7g==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="216525754"
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="216525754"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 02:42:20 -0700
IronPort-SDR: E2LYqV3z8I9r2pibeQXF9EC9+ljcV7BoAgZBleRrgaEUIb5MWPk+XuIAiR7Xuv7CBMlL02jPYl
 dxOMwnOxFN7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="386033237"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga006.jf.intel.com with ESMTP; 22 Apr 2021 02:42:18 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: pbonzini@redhat.com,
	richard.henderson@linaro.org,
	ehabkost@redhat.com
Subject: [PATCH] i386/cpu: Remove the deprecated cpu model 'Icelake-Client'
Date: Thu, 22 Apr 2021 17:42:16 +0800
Message-Id: <1619084536-89845-1-git-send-email-robert.hu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=robert.hu@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
Cc: robert.hu@intel.com, qemu-devel@nongnu.org,
 Robert Hoo <robert.hu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As it's been marked deprecated since v5.2, now I think it's time remove it
from code.

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
---
 target/i386/cpu.c | 118 ------------------------------------------------------
 1 file changed, 118 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ad99cad..75f2ad1 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3338,124 +3338,6 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .model_id = "Intel Xeon Processor (Cooperlake)",
     },
     {
-        .name = "Icelake-Client",
-        .level = 0xd,
-        .vendor = CPUID_VENDOR_INTEL,
-        .family = 6,
-        .model = 126,
-        .stepping = 0,
-        .features[FEAT_1_EDX] =
-            CPUID_VME | CPUID_SSE2 | CPUID_SSE | CPUID_FXSR | CPUID_MMX |
-            CPUID_CLFLUSH | CPUID_PSE36 | CPUID_PAT | CPUID_CMOV | CPUID_MCA |
-            CPUID_PGE | CPUID_MTRR | CPUID_SEP | CPUID_APIC | CPUID_CX8 |
-            CPUID_MCE | CPUID_PAE | CPUID_MSR | CPUID_TSC | CPUID_PSE |
-            CPUID_DE | CPUID_FP87,
-        .features[FEAT_1_ECX] =
-            CPUID_EXT_AVX | CPUID_EXT_XSAVE | CPUID_EXT_AES |
-            CPUID_EXT_POPCNT | CPUID_EXT_X2APIC | CPUID_EXT_SSE42 |
-            CPUID_EXT_SSE41 | CPUID_EXT_CX16 | CPUID_EXT_SSSE3 |
-            CPUID_EXT_PCLMULQDQ | CPUID_EXT_SSE3 |
-            CPUID_EXT_TSC_DEADLINE_TIMER | CPUID_EXT_FMA | CPUID_EXT_MOVBE |
-            CPUID_EXT_PCID | CPUID_EXT_F16C | CPUID_EXT_RDRAND,
-        .features[FEAT_8000_0001_EDX] =
-            CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | CPUID_EXT2_NX |
-            CPUID_EXT2_SYSCALL,
-        .features[FEAT_8000_0001_ECX] =
-            CPUID_EXT3_ABM | CPUID_EXT3_LAHF_LM | CPUID_EXT3_3DNOWPREFETCH,
-        .features[FEAT_8000_0008_EBX] =
-            CPUID_8000_0008_EBX_WBNOINVD,
-        .features[FEAT_7_0_EBX] =
-            CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 |
-            CPUID_7_0_EBX_HLE | CPUID_7_0_EBX_AVX2 | CPUID_7_0_EBX_SMEP |
-            CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_ERMS | CPUID_7_0_EBX_INVPCID |
-            CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_RDSEED | CPUID_7_0_EBX_ADX |
-            CPUID_7_0_EBX_SMAP,
-        .features[FEAT_7_0_ECX] =
-            CPUID_7_0_ECX_AVX512_VBMI | CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_PKU |
-            CPUID_7_0_ECX_AVX512_VBMI2 | CPUID_7_0_ECX_GFNI |
-            CPUID_7_0_ECX_VAES | CPUID_7_0_ECX_VPCLMULQDQ |
-            CPUID_7_0_ECX_AVX512VNNI | CPUID_7_0_ECX_AVX512BITALG |
-            CPUID_7_0_ECX_AVX512_VPOPCNTDQ,
-        .features[FEAT_7_0_EDX] =
-            CPUID_7_0_EDX_SPEC_CTRL | CPUID_7_0_EDX_SPEC_CTRL_SSBD,
-        /* Missing: XSAVES (not supported by some Linux versions,
-                * including v4.1 to v4.12).
-                * KVM doesn't yet expose any XSAVES state save component,
-                * and the only one defined in Skylake (processor tracing)
-                * probably will block migration anyway.
-                */
-        .features[FEAT_XSAVE] =
-            CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
-            CPUID_XSAVE_XGETBV1,
-        .features[FEAT_6_EAX] =
-            CPUID_6_EAX_ARAT,
-        /* Missing: Mode-based execute control (XS/XU), processor tracing, TSC scaling */
-        .features[FEAT_VMX_BASIC] = MSR_VMX_BASIC_INS_OUTS |
-             MSR_VMX_BASIC_TRUE_CTLS,
-        .features[FEAT_VMX_ENTRY_CTLS] = VMX_VM_ENTRY_IA32E_MODE |
-             VMX_VM_ENTRY_LOAD_IA32_PERF_GLOBAL_CTRL | VMX_VM_ENTRY_LOAD_IA32_PAT |
-             VMX_VM_ENTRY_LOAD_DEBUG_CONTROLS | VMX_VM_ENTRY_LOAD_IA32_EFER,
-        .features[FEAT_VMX_EPT_VPID_CAPS] = MSR_VMX_EPT_EXECONLY |
-             MSR_VMX_EPT_PAGE_WALK_LENGTH_4 | MSR_VMX_EPT_WB | MSR_VMX_EPT_2MB |
-             MSR_VMX_EPT_1GB | MSR_VMX_EPT_INVEPT |
-             MSR_VMX_EPT_INVEPT_SINGLE_CONTEXT | MSR_VMX_EPT_INVEPT_ALL_CONTEXT |
-             MSR_VMX_EPT_INVVPID | MSR_VMX_EPT_INVVPID_SINGLE_ADDR |
-             MSR_VMX_EPT_INVVPID_SINGLE_CONTEXT | MSR_VMX_EPT_INVVPID_ALL_CONTEXT |
-             MSR_VMX_EPT_INVVPID_SINGLE_CONTEXT_NOGLOBALS | MSR_VMX_EPT_AD_BITS,
-        .features[FEAT_VMX_EXIT_CTLS] =
-             VMX_VM_EXIT_ACK_INTR_ON_EXIT | VMX_VM_EXIT_SAVE_DEBUG_CONTROLS |
-             VMX_VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
-             VMX_VM_EXIT_LOAD_IA32_PAT | VMX_VM_EXIT_LOAD_IA32_EFER |
-             VMX_VM_EXIT_SAVE_IA32_PAT | VMX_VM_EXIT_SAVE_IA32_EFER |
-             VMX_VM_EXIT_SAVE_VMX_PREEMPTION_TIMER,
-        .features[FEAT_VMX_MISC] = MSR_VMX_MISC_ACTIVITY_HLT |
-             MSR_VMX_MISC_STORE_LMA | MSR_VMX_MISC_VMWRITE_VMEXIT,
-        .features[FEAT_VMX_PINBASED_CTLS] = VMX_PIN_BASED_EXT_INTR_MASK |
-             VMX_PIN_BASED_NMI_EXITING | VMX_PIN_BASED_VIRTUAL_NMIS |
-             VMX_PIN_BASED_VMX_PREEMPTION_TIMER,
-        .features[FEAT_VMX_PROCBASED_CTLS] = VMX_CPU_BASED_VIRTUAL_INTR_PENDING |
-             VMX_CPU_BASED_USE_TSC_OFFSETING | VMX_CPU_BASED_HLT_EXITING |
-             VMX_CPU_BASED_INVLPG_EXITING | VMX_CPU_BASED_MWAIT_EXITING |
-             VMX_CPU_BASED_RDPMC_EXITING | VMX_CPU_BASED_RDTSC_EXITING |
-             VMX_CPU_BASED_CR8_LOAD_EXITING | VMX_CPU_BASED_CR8_STORE_EXITING |
-             VMX_CPU_BASED_TPR_SHADOW | VMX_CPU_BASED_MOV_DR_EXITING |
-             VMX_CPU_BASED_UNCOND_IO_EXITING | VMX_CPU_BASED_USE_IO_BITMAPS |
-             VMX_CPU_BASED_MONITOR_EXITING | VMX_CPU_BASED_PAUSE_EXITING |
-             VMX_CPU_BASED_VIRTUAL_NMI_PENDING | VMX_CPU_BASED_USE_MSR_BITMAPS |
-             VMX_CPU_BASED_CR3_LOAD_EXITING | VMX_CPU_BASED_CR3_STORE_EXITING |
-             VMX_CPU_BASED_MONITOR_TRAP_FLAG |
-             VMX_CPU_BASED_ACTIVATE_SECONDARY_CONTROLS,
-        .features[FEAT_VMX_SECONDARY_CTLS] =
-             VMX_SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES |
-             VMX_SECONDARY_EXEC_WBINVD_EXITING | VMX_SECONDARY_EXEC_ENABLE_EPT |
-             VMX_SECONDARY_EXEC_DESC | VMX_SECONDARY_EXEC_RDTSCP |
-             VMX_SECONDARY_EXEC_ENABLE_VPID | VMX_SECONDARY_EXEC_UNRESTRICTED_GUEST |
-             VMX_SECONDARY_EXEC_RDRAND_EXITING | VMX_SECONDARY_EXEC_ENABLE_INVPCID |
-             VMX_SECONDARY_EXEC_ENABLE_VMFUNC | VMX_SECONDARY_EXEC_SHADOW_VMCS |
-             VMX_SECONDARY_EXEC_RDSEED_EXITING | VMX_SECONDARY_EXEC_ENABLE_PML,
-        .features[FEAT_VMX_VMFUNC] = MSR_VMX_VMFUNC_EPT_SWITCHING,
-        .xlevel = 0x80000008,
-        .model_id = "Intel Core Processor (Icelake)",
-        .versions = (X86CPUVersionDefinition[]) {
-            {
-                .version = 1,
-                .note = "deprecated"
-            },
-            {
-                .version = 2,
-                .note = "no TSX, deprecated",
-                .alias = "Icelake-Client-noTSX",
-                .props = (PropValue[]) {
-                    { "hle", "off" },
-                    { "rtm", "off" },
-                    { /* end of list */ }
-                },
-            },
-            { /* end of list */ }
-        },
-        .deprecation_note = "use Icelake-Server instead"
-    },
-    {
         .name = "Icelake-Server",
         .level = 0xd,
         .vendor = CPUID_VENDOR_INTEL,
-- 
1.8.3.1


