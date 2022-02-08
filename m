Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADFE4AD516
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:37:00 +0100 (CET)
Received: from localhost ([::1]:58404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMvj-00082E-7f
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:36:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nHM1R-00025E-T6
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:38:50 -0500
Received: from mga05.intel.com ([192.55.52.43]:22474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nHM1O-0004fV-PN
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:38:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644309526; x=1675845526;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YuxR+NqqTUVgLzTSWJzU5WAxgjUxqJmcR7/qTWyFiHo=;
 b=ieaG3BIreNJCXg/Gdbq8VXuvsH5gX1HIPZ/A/8QWveTABZ+XkFqvT/Xq
 wHoE8+zolhg74MMLB+OnQnKWWyYnpy79Vz803a2l4M5F7CcfS6/J3BpaL
 WhShBdKP4q1VeFhuNNS7AOG+ls6crBQkU7jRdHxYIJ3UrA5lf/03jVmCp
 MaqBOzZrpbi1dBJqkF9O8ujW8PoaaWz5Jj0HiL8mNpa26Z816ghe6VVfO
 a6mJgLOGlPOzTbP+P0eE+25ldiUSNWx/oPOe4M5wsLR1mrPXV3WPhX2u1
 GfQ2+Ixi40lD4cyj/XR8nQ1QtV4yhW8cB15sY49mOQ01ZBJCTP+4Yesry g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="335304678"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="335304678"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 00:38:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="773063087"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by fmsmga005.fm.intel.com with ESMTP; 08 Feb 2022 00:38:27 -0800
Message-ID: <8def2eb9aa6e195700e8ff02b9861e5514ca6177.camel@linux.intel.com>
Subject: Re: [PATCH v3] i386/cpu: Remove the deprecated cpu model
 'Icelake-Client'
From: Robert Hoo <robert.hu@linux.intel.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com
Date: Tue, 08 Feb 2022 16:38:27 +0800
In-Reply-To: <7a73c09fd325e162e8dc595b31bb5b414c4962e7.camel@linux.intel.com>
References: <1619660147-136679-1-git-send-email-robert.hu@linux.intel.com>
 <7a73c09fd325e162e8dc595b31bb5b414c4962e7.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-8.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=robert.hu@linux.intel.com; helo=mga05.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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
Cc: robert.hu@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Can we remove the deprecated 'Icelake-Client' CPU model now? if so, I
can rebase patch to latest and resend.

Thanks.

On Sat, 2021-05-08 at 11:16 +0800, Robert Hoo wrote:
> Hi,
> 
> Ping...
> 
> Thanks.
> 
> On Thu, 2021-04-29 at 09:35 +0800, Robert Hoo wrote:
> > As it's been marked deprecated since v5.2, now I think it's time
> > remove it
> > from code.
> > 
> > Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> > ---
> > Changelog:
> > v3:
> > 	Update deprecated.rst. (Sorry for my carelessness in last
> > search. I
> > sware I did search.)
> > v2:
> >     Update removed-features.rst.
> > ---
> >  docs/system/deprecated.rst       |   6 --
> >  docs/system/removed-features.rst |   5 ++
> >  target/i386/cpu.c                | 118 ---------------------------
> > ------------
> >  3 files changed, 5 insertions(+), 124 deletions(-)
> > 
> > diff --git a/docs/system/deprecated.rst
> > b/docs/system/deprecated.rst
> > index 80cae86..780b756 100644
> > --- a/docs/system/deprecated.rst
> > +++ b/docs/system/deprecated.rst
> > @@ -222,12 +222,6 @@ a future version of QEMU. Support for this CPU
> > was removed from the
> >  upstream Linux kernel, and there is no available upstream
> > toolchain
> >  to build binaries for it.
> >  
> > -``Icelake-Client`` CPU Model (since 5.2.0)
> > -''''''''''''''''''''''''''''''''''''''''''
> > -
> > -``Icelake-Client`` CPU Models are deprecated. Use ``Icelake-
> > Server`` 
> > CPU
> > -Models instead.
> > -
> >  MIPS ``I7200`` CPU Model (since 5.2)
> >  ''''''''''''''''''''''''''''''''''''
> >  
> > diff --git a/docs/system/removed-features.rst
> > b/docs/system/removed-
> > features.rst
> > index 29e9060..f1b5a16 100644
> > --- a/docs/system/removed-features.rst
> > +++ b/docs/system/removed-features.rst
> > @@ -285,6 +285,11 @@ The RISC-V no MMU cpus have been removed. The
> > two CPUs: ``rv32imacu-nommu`` and
> >  ``rv64imacu-nommu`` can no longer be used. Instead the MMU status
> > can be specified
> >  via the CPU ``mmu`` option when using the ``rv32`` or ``rv64``
> > CPUs.
> >  
> > +x86 Icelake-Client CPU (removed in 6.1)
> > +'''''''''''''''''''''''''''''''''''''''
> > +
> > +``Icelake-Client`` cpu can no longer be used. Use ``Icelake-
> > Server`` 
> > instead.
> > +
> >  System emulator machines
> >  ------------------------
> >  
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index ad99cad..75f2ad1 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -3338,124 +3338,6 @@ static X86CPUDefinition builtin_x86_defs[]
> > =
> > {
> >          .model_id = "Intel Xeon Processor (Cooperlake)",
> >      },
> >      {
> > -        .name = "Icelake-Client",
> > -        .level = 0xd,
> > -        .vendor = CPUID_VENDOR_INTEL,
> > -        .family = 6,
> > -        .model = 126,
> > -        .stepping = 0,
> > -        .features[FEAT_1_EDX] =
> > -            CPUID_VME | CPUID_SSE2 | CPUID_SSE | CPUID_FXSR |
> > CPUID_MMX |
> > -            CPUID_CLFLUSH | CPUID_PSE36 | CPUID_PAT | CPUID_CMOV |
> > CPUID_MCA |
> > -            CPUID_PGE | CPUID_MTRR | CPUID_SEP | CPUID_APIC |
> > CPUID_CX8 |
> > -            CPUID_MCE | CPUID_PAE | CPUID_MSR | CPUID_TSC |
> > CPUID_PSE |
> > -            CPUID_DE | CPUID_FP87,
> > -        .features[FEAT_1_ECX] =
> > -            CPUID_EXT_AVX | CPUID_EXT_XSAVE | CPUID_EXT_AES |
> > -            CPUID_EXT_POPCNT | CPUID_EXT_X2APIC | CPUID_EXT_SSE42
> > |
> > -            CPUID_EXT_SSE41 | CPUID_EXT_CX16 | CPUID_EXT_SSSE3 |
> > -            CPUID_EXT_PCLMULQDQ | CPUID_EXT_SSE3 |
> > -            CPUID_EXT_TSC_DEADLINE_TIMER | CPUID_EXT_FMA |
> > CPUID_EXT_MOVBE |
> > -            CPUID_EXT_PCID | CPUID_EXT_F16C | CPUID_EXT_RDRAND,
> > -        .features[FEAT_8000_0001_EDX] =
> > -            CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | CPUID_EXT2_NX |
> > -            CPUID_EXT2_SYSCALL,
> > -        .features[FEAT_8000_0001_ECX] =
> > -            CPUID_EXT3_ABM | CPUID_EXT3_LAHF_LM |
> > CPUID_EXT3_3DNOWPREFETCH,
> > -        .features[FEAT_8000_0008_EBX] =
> > -            CPUID_8000_0008_EBX_WBNOINVD,
> > -        .features[FEAT_7_0_EBX] =
> > -            CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 |
> > -            CPUID_7_0_EBX_HLE | CPUID_7_0_EBX_AVX2 |
> > CPUID_7_0_EBX_SMEP |
> > -            CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_ERMS |
> > CPUID_7_0_EBX_INVPCID |
> > -            CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_RDSEED |
> > CPUID_7_0_EBX_ADX |
> > -            CPUID_7_0_EBX_SMAP,
> > -        .features[FEAT_7_0_ECX] =
> > -            CPUID_7_0_ECX_AVX512_VBMI | CPUID_7_0_ECX_UMIP |
> > CPUID_7_0_ECX_PKU |
> > -            CPUID_7_0_ECX_AVX512_VBMI2 | CPUID_7_0_ECX_GFNI |
> > -            CPUID_7_0_ECX_VAES | CPUID_7_0_ECX_VPCLMULQDQ |
> > -            CPUID_7_0_ECX_AVX512VNNI | CPUID_7_0_ECX_AVX512BITALG
> > |
> > -            CPUID_7_0_ECX_AVX512_VPOPCNTDQ,
> > -        .features[FEAT_7_0_EDX] =
> > -            CPUID_7_0_EDX_SPEC_CTRL |
> > CPUID_7_0_EDX_SPEC_CTRL_SSBD,
> > -        /* Missing: XSAVES (not supported by some Linux versions,
> > -                * including v4.1 to v4.12).
> > -                * KVM doesn't yet expose any XSAVES state save
> > component,
> > -                * and the only one defined in Skylake (processor
> > tracing)
> > -                * probably will block migration anyway.
> > -                */
> > -        .features[FEAT_XSAVE] =
> > -            CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
> > -            CPUID_XSAVE_XGETBV1,
> > -        .features[FEAT_6_EAX] =
> > -            CPUID_6_EAX_ARAT,
> > -        /* Missing: Mode-based execute control (XS/XU), processor
> > tracing, TSC scaling */
> > -        .features[FEAT_VMX_BASIC] = MSR_VMX_BASIC_INS_OUTS |
> > -             MSR_VMX_BASIC_TRUE_CTLS,
> > -        .features[FEAT_VMX_ENTRY_CTLS] = VMX_VM_ENTRY_IA32E_MODE |
> > -             VMX_VM_ENTRY_LOAD_IA32_PERF_GLOBAL_CTRL |
> > VMX_VM_ENTRY_LOAD_IA32_PAT |
> > -             VMX_VM_ENTRY_LOAD_DEBUG_CONTROLS |
> > VMX_VM_ENTRY_LOAD_IA32_EFER,
> > -        .features[FEAT_VMX_EPT_VPID_CAPS] = MSR_VMX_EPT_EXECONLY |
> > -             MSR_VMX_EPT_PAGE_WALK_LENGTH_4 | MSR_VMX_EPT_WB |
> > MSR_VMX_EPT_2MB |
> > -             MSR_VMX_EPT_1GB | MSR_VMX_EPT_INVEPT |
> > -             MSR_VMX_EPT_INVEPT_SINGLE_CONTEXT |
> > MSR_VMX_EPT_INVEPT_ALL_CONTEXT |
> > -             MSR_VMX_EPT_INVVPID | MSR_VMX_EPT_INVVPID_SINGLE_ADDR
> > |
> > -             MSR_VMX_EPT_INVVPID_SINGLE_CONTEXT |
> > MSR_VMX_EPT_INVVPID_ALL_CONTEXT |
> > -             MSR_VMX_EPT_INVVPID_SINGLE_CONTEXT_NOGLOBALS |
> > MSR_VMX_EPT_AD_BITS,
> > -        .features[FEAT_VMX_EXIT_CTLS] =
> > -             VMX_VM_EXIT_ACK_INTR_ON_EXIT |
> > VMX_VM_EXIT_SAVE_DEBUG_CONTROLS |
> > -             VMX_VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
> > -             VMX_VM_EXIT_LOAD_IA32_PAT |
> > VMX_VM_EXIT_LOAD_IA32_EFER
> > > 
> > 
> > -             VMX_VM_EXIT_SAVE_IA32_PAT |
> > VMX_VM_EXIT_SAVE_IA32_EFER
> > > 
> > 
> > -             VMX_VM_EXIT_SAVE_VMX_PREEMPTION_TIMER,
> > -        .features[FEAT_VMX_MISC] = MSR_VMX_MISC_ACTIVITY_HLT |
> > -             MSR_VMX_MISC_STORE_LMA | MSR_VMX_MISC_VMWRITE_VMEXIT,
> > -        .features[FEAT_VMX_PINBASED_CTLS] =
> > VMX_PIN_BASED_EXT_INTR_MASK |
> > -             VMX_PIN_BASED_NMI_EXITING |
> > VMX_PIN_BASED_VIRTUAL_NMIS
> > > 
> > 
> > -             VMX_PIN_BASED_VMX_PREEMPTION_TIMER,
> > -        .features[FEAT_VMX_PROCBASED_CTLS] =
> > VMX_CPU_BASED_VIRTUAL_INTR_PENDING |
> > -             VMX_CPU_BASED_USE_TSC_OFFSETING |
> > VMX_CPU_BASED_HLT_EXITING |
> > -             VMX_CPU_BASED_INVLPG_EXITING |
> > VMX_CPU_BASED_MWAIT_EXITING |
> > -             VMX_CPU_BASED_RDPMC_EXITING |
> > VMX_CPU_BASED_RDTSC_EXITING |
> > -             VMX_CPU_BASED_CR8_LOAD_EXITING |
> > VMX_CPU_BASED_CR8_STORE_EXITING |
> > -             VMX_CPU_BASED_TPR_SHADOW |
> > VMX_CPU_BASED_MOV_DR_EXITING
> > > 
> > 
> > -             VMX_CPU_BASED_UNCOND_IO_EXITING |
> > VMX_CPU_BASED_USE_IO_BITMAPS |
> > -             VMX_CPU_BASED_MONITOR_EXITING |
> > VMX_CPU_BASED_PAUSE_EXITING |
> > -             VMX_CPU_BASED_VIRTUAL_NMI_PENDING |
> > VMX_CPU_BASED_USE_MSR_BITMAPS |
> > -             VMX_CPU_BASED_CR3_LOAD_EXITING |
> > VMX_CPU_BASED_CR3_STORE_EXITING |
> > -             VMX_CPU_BASED_MONITOR_TRAP_FLAG |
> > -             VMX_CPU_BASED_ACTIVATE_SECONDARY_CONTROLS,
> > -        .features[FEAT_VMX_SECONDARY_CTLS] =
> > -             VMX_SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES |
> > -             VMX_SECONDARY_EXEC_WBINVD_EXITING |
> > VMX_SECONDARY_EXEC_ENABLE_EPT |
> > -             VMX_SECONDARY_EXEC_DESC | VMX_SECONDARY_EXEC_RDTSCP |
> > -             VMX_SECONDARY_EXEC_ENABLE_VPID |
> > VMX_SECONDARY_EXEC_UNRESTRICTED_GUEST |
> > -             VMX_SECONDARY_EXEC_RDRAND_EXITING |
> > VMX_SECONDARY_EXEC_ENABLE_INVPCID |
> > -             VMX_SECONDARY_EXEC_ENABLE_VMFUNC |
> > VMX_SECONDARY_EXEC_SHADOW_VMCS |
> > -             VMX_SECONDARY_EXEC_RDSEED_EXITING |
> > VMX_SECONDARY_EXEC_ENABLE_PML,
> > -        .features[FEAT_VMX_VMFUNC] = MSR_VMX_VMFUNC_EPT_SWITCHING,
> > -        .xlevel = 0x80000008,
> > -        .model_id = "Intel Core Processor (Icelake)",
> > -        .versions = (X86CPUVersionDefinition[]) {
> > -            {
> > -                .version = 1,
> > -                .note = "deprecated"
> > -            },
> > -            {
> > -                .version = 2,
> > -                .note = "no TSX, deprecated",
> > -                .alias = "Icelake-Client-noTSX",
> > -                .props = (PropValue[]) {
> > -                    { "hle", "off" },
> > -                    { "rtm", "off" },
> > -                    { /* end of list */ }
> > -                },
> > -            },
> > -            { /* end of list */ }
> > -        },
> > -        .deprecation_note = "use Icelake-Server instead"
> > -    },
> > -    {
> >          .name = "Icelake-Server",
> >          .level = 0xd,
> >          .vendor = CPUID_VENDOR_INTEL,


