Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92B76A4332
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:47:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdpP-0000Wy-Hj; Mon, 27 Feb 2023 08:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pWdpF-0000PW-C2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:45:59 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pWdpC-0003eC-Pf
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:45:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677505554; x=1709041554;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iReBlGRjOzd9wAQHoqXfzfAooH8iNPA0QALvoaAD858=;
 b=m2WqVXAOqp4IbFA7hae1od7B7fVJBJMehOSzMcRdyTrwNCKfgayP6s31
 6OU1/bwmYOQBnIy3lrYVD24Bojz/MUir8FJYNp418bZpJVgyffGmg40Xi
 oGrVDTD2XsnEIEuueVRRT09GMefo+l6dCJlrp8SFwHbuviUDwKQLH5psf
 df2L649VwYFXeEmbH8Q/QOGz/7ZBp/eG8LQBh9ENjgybjewGaVXY+LWdp
 A1/el6s8Zz5vHYG2V9JJOXBn0qNu6pPACUtBlLlUHEatcGUSc7IYgD6Gd
 pJPz68zno1xGoAPN1xHZWuLLC4Q4/n+kJjsuJ5qYIz/djO2KKL/j5bbvp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="333902049"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; d="scan'208";a="333902049"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 05:45:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="847848493"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; d="scan'208";a="847848493"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.28.190])
 ([10.255.28.190])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 05:45:48 -0800
Message-ID: <25435148-8a6d-f57a-7adc-4544af9c7553@intel.com>
Date: Mon, 27 Feb 2023 21:45:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH v4 4/4] target/i386: Add new CPU model SapphireRapids
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: lei4.wang@intel.com, robert.hu@linux.intel.com, chenyi.qiang@intel.com
References: <20230227101332.636203-1-pbonzini@redhat.com>
 <20230227101332.636203-5-pbonzini@redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20230227101332.636203-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=xiaoyao.li@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/27/2023 6:13 PM, Paolo Bonzini wrote:
> From: "Wang, Lei" <lei4.wang@intel.com>
> 
> The new CPU model mostly inherits features from Icelake-Server, while
> adding new features:
>   - AMX (Advance Matrix eXtensions)
>   - Bus Lock Debug Exception
> and new instructions:
>   - AVX VNNI (Vector Neural Network Instruction):
>      - VPDPBUS: Multiply and Add Unsigned and Signed Bytes
>      - VPDPBUSDS: Multiply and Add Unsigned and Signed Bytes with Saturation
>      - VPDPWSSD: Multiply and Add Signed Word Integers
>      - VPDPWSSDS: Multiply and Add Signed Integers with Saturation
>   - FP16: Replicates existing AVX512 computational SP (FP32) instructions
>     using FP16 instead of FP32 for ~2X performance gain
>   - SERIALIZE: Provide software with a simple way to force the processor to
>     complete all modifications, faster, allowed in all privilege levels and
>     not causing an unconditional VM exit
>   - TSX Suspend Load Address Tracking: Allows programmers to choose which
>     memory accesses do not need to be tracked in the TSX read set
>   - AVX512_BF16: Vector Neural Network Instructions supporting BFLOAT16
>     inputs and conversion instructions from IEEE single precision
> 
> Features may be added in future versions:
>   - CET (virtualization support hasn't been merged)
> Instructions may be added in future versions:
>   - fast zero-length MOVSB (KVM doesn't support yet)
>   - fast short STOSB (KVM doesn't support yet)
>   - fast short CMPSB, SCASB (KVM doesn't support yet)

Paolo,

CPUID of the three intructions are added in your this re-post comparing 
to Lei's original. Please remove the description above.

> Signed-off-by: Wang, Lei <lei4.wang@intel.com>
> Reviewed-by: Robert Hoo <robert.hu@linux.intel.com>
> Message-Id: <20220812055751.14553-1-lei4.wang@intel.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

With above fixed,

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> ---
>   target/i386/cpu.c | 133 +++++++++++++++++++++++++++++++++++++++++++++-
>   target/i386/cpu.h |   4 ++
>   2 files changed, 135 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 26ec6e9da754..4bad3d41d33f 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -3468,6 +3468,135 @@ static const X86CPUDefinition builtin_x86_defs[] = {
>               { /* end of list */ }
>           }
>       },
> +    {
> +        .name = "SapphireRapids",
> +        .level = 0x20,
> +        .vendor = CPUID_VENDOR_INTEL,
> +        .family = 6,
> +        .model = 143,
> +        .stepping = 4,
> +        /*
> +         * please keep the ascending order so that we can have a clear view of
> +         * bit position of each feature.
> +         */
> +        .features[FEAT_1_EDX] =
> +            CPUID_FP87 | CPUID_VME | CPUID_DE | CPUID_PSE | CPUID_TSC |
> +            CPUID_MSR | CPUID_PAE | CPUID_MCE | CPUID_CX8 | CPUID_APIC |
> +            CPUID_SEP | CPUID_MTRR | CPUID_PGE | CPUID_MCA | CPUID_CMOV |
> +            CPUID_PAT | CPUID_PSE36 | CPUID_CLFLUSH | CPUID_MMX | CPUID_FXSR |
> +            CPUID_SSE | CPUID_SSE2,
> +        .features[FEAT_1_ECX] =
> +            CPUID_EXT_SSE3 | CPUID_EXT_PCLMULQDQ | CPUID_EXT_SSSE3 |
> +            CPUID_EXT_FMA | CPUID_EXT_CX16 | CPUID_EXT_PCID | CPUID_EXT_SSE41 |
> +            CPUID_EXT_SSE42 | CPUID_EXT_X2APIC | CPUID_EXT_MOVBE |
> +            CPUID_EXT_POPCNT | CPUID_EXT_TSC_DEADLINE_TIMER | CPUID_EXT_AES |
> +            CPUID_EXT_XSAVE | CPUID_EXT_AVX | CPUID_EXT_F16C | CPUID_EXT_RDRAND,
> +        .features[FEAT_8000_0001_EDX] =
> +            CPUID_EXT2_SYSCALL | CPUID_EXT2_NX | CPUID_EXT2_PDPE1GB |
> +            CPUID_EXT2_RDTSCP | CPUID_EXT2_LM,
> +        .features[FEAT_8000_0001_ECX] =
> +            CPUID_EXT3_LAHF_LM | CPUID_EXT3_ABM | CPUID_EXT3_3DNOWPREFETCH,
> +        .features[FEAT_8000_0008_EBX] =
> +            CPUID_8000_0008_EBX_WBNOINVD,
> +        .features[FEAT_7_0_EBX] =
> +            CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_HLE |
> +            CPUID_7_0_EBX_AVX2 | CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_BMI2 |
> +            CPUID_7_0_EBX_ERMS | CPUID_7_0_EBX_INVPCID | CPUID_7_0_EBX_RTM |
> +            CPUID_7_0_EBX_AVX512F | CPUID_7_0_EBX_AVX512DQ |
> +            CPUID_7_0_EBX_RDSEED | CPUID_7_0_EBX_ADX | CPUID_7_0_EBX_SMAP |
> +            CPUID_7_0_EBX_AVX512IFMA | CPUID_7_0_EBX_CLFLUSHOPT |
> +            CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_AVX512CD | CPUID_7_0_EBX_SHA_NI |
> +            CPUID_7_0_EBX_AVX512BW | CPUID_7_0_EBX_AVX512VL,
> +        .features[FEAT_7_0_ECX] =
> +            CPUID_7_0_ECX_AVX512_VBMI | CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_PKU |
> +            CPUID_7_0_ECX_AVX512_VBMI2 | CPUID_7_0_ECX_GFNI |
> +            CPUID_7_0_ECX_VAES | CPUID_7_0_ECX_VPCLMULQDQ |
> +            CPUID_7_0_ECX_AVX512VNNI | CPUID_7_0_ECX_AVX512BITALG |
> +            CPUID_7_0_ECX_AVX512_VPOPCNTDQ | CPUID_7_0_ECX_LA57 |
> +            CPUID_7_0_ECX_RDPID | CPUID_7_0_ECX_BUS_LOCK_DETECT,
> +        .features[FEAT_7_0_EDX] =
> +            CPUID_7_0_EDX_FSRM | CPUID_7_0_EDX_SERIALIZE |
> +            CPUID_7_0_EDX_TSX_LDTRK | CPUID_7_0_EDX_AMX_BF16 |
> +            CPUID_7_0_EDX_AVX512_FP16 | CPUID_7_0_EDX_AMX_TILE |
> +            CPUID_7_0_EDX_AMX_INT8 | CPUID_7_0_EDX_SPEC_CTRL |
> +            CPUID_7_0_EDX_ARCH_CAPABILITIES | CPUID_7_0_EDX_SPEC_CTRL_SSBD,
> +        .features[FEAT_ARCH_CAPABILITIES] =
> +            MSR_ARCH_CAP_RDCL_NO | MSR_ARCH_CAP_IBRS_ALL |
> +            MSR_ARCH_CAP_SKIP_L1DFL_VMENTRY | MSR_ARCH_CAP_MDS_NO |
> +            MSR_ARCH_CAP_PSCHANGE_MC_NO | MSR_ARCH_CAP_TAA_NO,
> +        .features[FEAT_XSAVE] =
> +            CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
> +            CPUID_XSAVE_XGETBV1 | CPUID_XSAVE_XSAVES | CPUID_D_1_EAX_XFD,
> +        .features[FEAT_6_EAX] =
> +            CPUID_6_EAX_ARAT,
> +        .features[FEAT_7_1_EAX] =
> +            CPUID_7_1_EAX_AVX_VNNI | CPUID_7_1_EAX_AVX512_BF16 |
> +            CPUID_7_1_EAX_FZRM | CPUID_7_1_EAX_FSRS | CPUID_7_1_EAX_FSRC,
> +        .features[FEAT_VMX_BASIC] =
> +            MSR_VMX_BASIC_INS_OUTS | MSR_VMX_BASIC_TRUE_CTLS,
> +        .features[FEAT_VMX_ENTRY_CTLS] =
> +            VMX_VM_ENTRY_LOAD_DEBUG_CONTROLS | VMX_VM_ENTRY_IA32E_MODE |
> +            VMX_VM_ENTRY_LOAD_IA32_PERF_GLOBAL_CTRL |
> +            VMX_VM_ENTRY_LOAD_IA32_PAT | VMX_VM_ENTRY_LOAD_IA32_EFER,
> +        .features[FEAT_VMX_EPT_VPID_CAPS] =
> +            MSR_VMX_EPT_EXECONLY |
> +            MSR_VMX_EPT_PAGE_WALK_LENGTH_4 | MSR_VMX_EPT_PAGE_WALK_LENGTH_5 |
> +            MSR_VMX_EPT_WB | MSR_VMX_EPT_2MB | MSR_VMX_EPT_1GB |
> +            MSR_VMX_EPT_INVEPT | MSR_VMX_EPT_AD_BITS |
> +            MSR_VMX_EPT_INVEPT_SINGLE_CONTEXT | MSR_VMX_EPT_INVEPT_ALL_CONTEXT |
> +            MSR_VMX_EPT_INVVPID | MSR_VMX_EPT_INVVPID_SINGLE_ADDR |
> +            MSR_VMX_EPT_INVVPID_SINGLE_CONTEXT |
> +            MSR_VMX_EPT_INVVPID_ALL_CONTEXT |
> +            MSR_VMX_EPT_INVVPID_SINGLE_CONTEXT_NOGLOBALS,
> +        .features[FEAT_VMX_EXIT_CTLS] =
> +            VMX_VM_EXIT_SAVE_DEBUG_CONTROLS |
> +            VMX_VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
> +            VMX_VM_EXIT_ACK_INTR_ON_EXIT | VMX_VM_EXIT_SAVE_IA32_PAT |
> +            VMX_VM_EXIT_LOAD_IA32_PAT | VMX_VM_EXIT_SAVE_IA32_EFER |
> +            VMX_VM_EXIT_LOAD_IA32_EFER | VMX_VM_EXIT_SAVE_VMX_PREEMPTION_TIMER,
> +        .features[FEAT_VMX_MISC] =
> +            MSR_VMX_MISC_STORE_LMA | MSR_VMX_MISC_ACTIVITY_HLT |
> +            MSR_VMX_MISC_VMWRITE_VMEXIT,
> +        .features[FEAT_VMX_PINBASED_CTLS] =
> +            VMX_PIN_BASED_EXT_INTR_MASK | VMX_PIN_BASED_NMI_EXITING |
> +            VMX_PIN_BASED_VIRTUAL_NMIS | VMX_PIN_BASED_VMX_PREEMPTION_TIMER |
> +            VMX_PIN_BASED_POSTED_INTR,
> +        .features[FEAT_VMX_PROCBASED_CTLS] =
> +            VMX_CPU_BASED_VIRTUAL_INTR_PENDING |
> +            VMX_CPU_BASED_USE_TSC_OFFSETING | VMX_CPU_BASED_HLT_EXITING |
> +            VMX_CPU_BASED_INVLPG_EXITING | VMX_CPU_BASED_MWAIT_EXITING |
> +            VMX_CPU_BASED_RDPMC_EXITING | VMX_CPU_BASED_RDTSC_EXITING |
> +            VMX_CPU_BASED_CR3_LOAD_EXITING | VMX_CPU_BASED_CR3_STORE_EXITING |
> +            VMX_CPU_BASED_CR8_LOAD_EXITING | VMX_CPU_BASED_CR8_STORE_EXITING |
> +            VMX_CPU_BASED_TPR_SHADOW | VMX_CPU_BASED_VIRTUAL_NMI_PENDING |
> +            VMX_CPU_BASED_MOV_DR_EXITING | VMX_CPU_BASED_UNCOND_IO_EXITING |
> +            VMX_CPU_BASED_USE_IO_BITMAPS | VMX_CPU_BASED_MONITOR_TRAP_FLAG |
> +            VMX_CPU_BASED_USE_MSR_BITMAPS | VMX_CPU_BASED_MONITOR_EXITING |
> +            VMX_CPU_BASED_PAUSE_EXITING |
> +            VMX_CPU_BASED_ACTIVATE_SECONDARY_CONTROLS,
> +        .features[FEAT_VMX_SECONDARY_CTLS] =
> +            VMX_SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES |
> +            VMX_SECONDARY_EXEC_ENABLE_EPT | VMX_SECONDARY_EXEC_DESC |
> +            VMX_SECONDARY_EXEC_RDTSCP |
> +            VMX_SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE |
> +            VMX_SECONDARY_EXEC_ENABLE_VPID | VMX_SECONDARY_EXEC_WBINVD_EXITING |
> +            VMX_SECONDARY_EXEC_UNRESTRICTED_GUEST |
> +            VMX_SECONDARY_EXEC_APIC_REGISTER_VIRT |
> +            VMX_SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY |
> +            VMX_SECONDARY_EXEC_RDRAND_EXITING |
> +            VMX_SECONDARY_EXEC_ENABLE_INVPCID |
> +            VMX_SECONDARY_EXEC_ENABLE_VMFUNC | VMX_SECONDARY_EXEC_SHADOW_VMCS |
> +            VMX_SECONDARY_EXEC_RDSEED_EXITING | VMX_SECONDARY_EXEC_ENABLE_PML |
> +            VMX_SECONDARY_EXEC_XSAVES,
> +        .features[FEAT_VMX_VMFUNC] =
> +            MSR_VMX_VMFUNC_EPT_SWITCHING,
> +        .xlevel = 0x80000008,
> +        .model_id = "Intel Xeon Processor (SapphireRapids)",
> +        .versions = (X86CPUVersionDefinition[]) {
> +            { .version = 1 },
> +            { /* end of list */ },
> +        },
> +    },
>       {
>           .name = "Denverton",
>           .level = 21,
> @@ -5623,7 +5752,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           break;
>       }
>       case 0x1D: {
> -        /* AMX TILE */
> +        /* AMX TILE, for now hardcoded for Sapphire Rapids*/
>           *eax = 0;
>           *ebx = 0;
>           *ecx = 0;
> @@ -5644,7 +5773,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           break;
>       }
>       case 0x1E: {
> -        /* AMX TMUL */
> +        /* AMX TMUL, for now hardcoded for Sapphire Rapids */
>           *eax = 0;
>           *ebx = 0;
>           *ecx = 0;
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index e0703feb5ed0..41777fb4b029 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -881,10 +881,14 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
>   #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
>   /* Architectural LBRs */
>   #define CPUID_7_0_EDX_ARCH_LBR          (1U << 19)
> +/* AMX_BF16 instruction */
> +#define CPUID_7_0_EDX_AMX_BF16          (1U << 22)
>   /* AVX512_FP16 instruction */
>   #define CPUID_7_0_EDX_AVX512_FP16       (1U << 23)
>   /* AMX tile (two-dimensional register) */
>   #define CPUID_7_0_EDX_AMX_TILE          (1U << 24)
> +/* AMX_INT8 instruction */
> +#define CPUID_7_0_EDX_AMX_INT8          (1U << 25)
>   /* Speculation Control */
>   #define CPUID_7_0_EDX_SPEC_CTRL         (1U << 26)
>   /* Single Thread Indirect Branch Predictors */


