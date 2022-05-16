Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AD0528B0B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:50:34 +0200 (CEST)
Received: from localhost ([::1]:37410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdvV-0002br-JY
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd50-0001dS-5G
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd4x-0003MA-0s
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvRcbHvPEJfxvw2rMPmTP64RF5hN1UgQIqqLow5waU4=;
 b=WWP8BnQRrtC75CprRzUXuncrZyxj+T0YBPZ/M+R8HGXxWdKsvz070vOLPgABBMFeII9cAk
 MJzSLOX5hS7caLkY7FMBWNV0qADWsgDvCmbE7RmQW8W7qzCH22kOpUpgss6XpL8bxbjaBB
 teLb83bryLn/6o0LIsLji4PS3+xY3o4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-d7ohrvdeORGXWNPtkZ8BWw-1; Mon, 16 May 2022 11:56:13 -0400
X-MC-Unique: d7ohrvdeORGXWNPtkZ8BWw-1
Received: by mail-ej1-f72.google.com with SMTP id
 oz9-20020a1709077d8900b006f3d9488090so6031961ejc.6
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XvRcbHvPEJfxvw2rMPmTP64RF5hN1UgQIqqLow5waU4=;
 b=zbGai2UJjLEH/5sey+8ni0B3DqA858PHS+U7j04pY6r/F+H0cbIr9l2o91yvfrMX+8
 4D7yrYoR6BSBct26TbEO8NoMXTyMcvTeIRCiRGSRuBaZCMoXxDhioCjKi3bqh0kpQk9c
 SlmG8AfVFZulYSaGgDah80Oi4gKgKeVRYHw1W539ddYTS62RmVLN5HUKqAkBJcCK8fG0
 +VPX87rtFpM7npUqos6oaYQHDBMbb2/J9ErRn/hqa7YTtkxG1c8k5DFinztZajCdYeSc
 fOa/popFq9+cOSklKwHP1dg1fuBfnh8CSStH/3KdydnfAOVfeIq0w8CapQNepmxZyORc
 3syA==
X-Gm-Message-State: AOAM5329kt3gml1n/55p7S7F225kQAKxrZJ8novdc+8rArh1gV4BCVYV
 Mes5LcWZXnLSOLN/W/0edn4EHtDAQASGdehRBjfXbxN6rMh2cWNWz0SEi0rgcWowf7kDci9JOZr
 tlMwSSUw2CiADO9evpXYNty460hBp71rzY1LSMp/+K6H3fWYjz+loIkK4aMmUbtWfQ8g=
X-Received: by 2002:a17:907:728c:b0:6f4:57e5:9ac6 with SMTP id
 dt12-20020a170907728c00b006f457e59ac6mr15502485ejc.22.1652716571387; 
 Mon, 16 May 2022 08:56:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkJq3RUNU79j+wbyqhfx+0YZ+OvMi9UfiCfDUJ4/fJnxfylEt0oDeq5ItDggmmYbao2fJWAw==
X-Received: by 2002:a17:907:728c:b0:6f4:57e5:9ac6 with SMTP id
 dt12-20020a170907728c00b006f457e59ac6mr15502460ejc.22.1652716570954; 
 Mon, 16 May 2022 08:56:10 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a056402104900b0042ac0e79bb6sm232882edu.45.2022.05.16.08.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Robert Hoo <robert.hu@linux.intel.com>, Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 04/23] i386/cpu: Remove the deprecated cpu model
 'Icelake-Client'
Date: Mon, 16 May 2022 17:55:44 +0200
Message-Id: <20220516155603.1234712-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Robert Hoo <robert.hu@linux.intel.com>

Icelake, is the codename for Intel 3rd generation Xeon Scalable server
processors. There isn't ever client variants. This "Icelake-Client" CPU
model was added wrongly and imaginarily.

It has been deprecated since v5.2, now it's time to remove it completely
from code.

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <1647247859-4947-1-git-send-email-robert.hu@linux.intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/deprecated.rst       |   6 --
 docs/about/removed-features.rst |   6 ++
 target/i386/cpu.c               | 122 --------------------------------
 3 files changed, 6 insertions(+), 128 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 896e5a97ab..44f52c172d 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -270,12 +270,6 @@ from Linux upstream kernel, declare it deprecated.
 System emulator CPUS
 --------------------
 
-``Icelake-Client`` CPU Model (since 5.2)
-''''''''''''''''''''''''''''''''''''''''
-
-``Icelake-Client`` CPU Models are deprecated. Use ``Icelake-Server`` CPU
-Models instead.
-
 MIPS ``I7200`` CPU Model (since 5.2)
 ''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 4a0b270296..ba78bc1a19 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -557,6 +557,12 @@ Support for this CPU was removed from the upstream Linux kernel, and
 there is no available upstream toolchain to build binaries for it.
 Removed without replacement.
 
+x86 ``Icelake-Client`` CPU (removed in 7.1)
+'''''''''''''''''''''''''''''''''''''''''''
+
+There isn't ever Icelake Client CPU, it is some wrong and imaginary one.
+Use ``Icelake-Server`` instead.
+
 System emulator machines
 ------------------------
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index c4a17c93f6..6083e556f5 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3258,128 +3258,6 @@ static const X86CPUDefinition builtin_x86_defs[] = {
             { /* end of list */ }
         }
     },
-    {
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
-        /* XSAVES is added in version 3 */
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
-            {
-                .version = 3,
-                .note = "no TSX, XSAVES, deprecated",
-                .props = (PropValue[]) {
-                    { "xsaves", "on" },
-                    { "vmx-xsaves", "on" },
-                    { /* end of list */ }
-                },
-            },
-            { /* end of list */ }
-        },
-        .deprecation_note = "use Icelake-Server instead"
-    },
     {
         .name = "Icelake-Server",
         .level = 0xd,
-- 
2.36.0


