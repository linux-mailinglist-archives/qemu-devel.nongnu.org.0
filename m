Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213CA688F53
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 07:03:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNpAJ-0008Ml-8a; Fri, 03 Feb 2023 01:03:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pNp9Q-0007fF-BY
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 01:02:23 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pNp9N-0004aN-Hc
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 01:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675404137; x=1706940137;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2mjDiKdcVUFaEpelsnoWnyKHG0FgJpsVOJ8t8TZSR/M=;
 b=OCycd/cxeKcbI8UsiBw5DLnY6M2kUJ0WF8TGWIkZkuJ0rDRdeF0lz7L7
 u+LH4aFEu1H7PlZ27ksg5M+TPSXUkbJKNlBsVBNUCQtJYHRyo4Kk0EWYj
 Nv4la1ZC35akwaAvlWqoUtMhuEC0PbEQYIhkZKygdd6caXqsGOgnIXWYm
 WIhKAfrzsB3XD4noM78JH/viquw4Md2B/4fdKyu1h+7j4Q9ccNG1yBsQH
 GFgmNyjQwkvVX5h7iNQ7uenpYSHUiknsNInoHz2NZOH8JDqXIy+Zu4/kz
 wsDulopYlXBNVNo0uBOg3puCcgCL66ifGJkJhCQRVDeW1xev5xR6fkmWU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="328682708"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="328682708"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 22:02:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="665593079"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="665593079"
Received: from leiwang7-mobl.ccr.corp.intel.com (HELO [10.249.173.85])
 ([10.249.173.85])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 22:02:09 -0800
Message-ID: <c4a8a45c-17e9-faad-2fa9-d0256e0767ed@intel.com>
Date: Fri, 3 Feb 2023 14:02:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v3 6/6] i386: Add new CPU model SapphireRapids
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 berrange@redhat.com, xiaoyao.li@intel.com, yang.zhong@linux.intel.com
References: <20230106083826.5384-1-lei4.wang@intel.com>
 <20230106083826.5384-7-lei4.wang@intel.com>
 <20230202114055.2b8dd9c3@imammedo.users.ipa.redhat.com>
From: "Wang, Lei" <lei4.wang@intel.com>
In-Reply-To: <20230202114055.2b8dd9c3@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=lei4.wang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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

On 2/2/2023 6:40 PM, Igor Mammedov wrote:
> On Fri,  6 Jan 2023 00:38:26 -0800
> Lei Wang <lei4.wang@intel.com> wrote:
> 
>> The new CPU model mostly inherits features from Icelake-Server, while
>> adding new features:
>>  - AMX (Advance Matrix eXtensions)
>>  - Bus Lock Debug Exception
>> and new instructions:
>>  - AVX VNNI (Vector Neural Network Instruction):
>>     - VPDPBUS: Multiply and Add Unsigned and Signed Bytes
>>     - VPDPBUSDS: Multiply and Add Unsigned and Signed Bytes with Saturation
>>     - VPDPWSSD: Multiply and Add Signed Word Integers
>>     - VPDPWSSDS: Multiply and Add Signed Integers with Saturation
>>  - FP16: Replicates existing AVX512 computational SP (FP32) instructions
>>    using FP16 instead of FP32 for ~2X performance gain
>>  - SERIALIZE: Provide software with a simple way to force the processor to
>>    complete all modifications, faster, allowed in all privilege levels and
>>    not causing an unconditional VM exit
>>  - TSX Suspend Load Address Tracking: Allows programmers to choose which
>>    memory accesses do not need to be tracked in the TSX read set
>>  - AVX512_BF16: Vector Neural Network Instructions supporting BFLOAT16
>>    inputs and conversion instructions from IEEE single precision
> 
> you should mention all new features here, preferably in format:
>  feature-flag:  expected CPUID feature bits , so reviewer would be able to find it in spec

Thanks, will mention the new features introduced by the new CPU model.

> also you mention that it inherits most of the features from Icelake cpu,
> it would be nice to provide cpuid diff between real Icelake and new cpu
> somewhere in cover letter to simplify comparison.

OK, will add the diff between the command line output here.

>>
>> Features may be added in future versions:
>>  - CET (virtualization support hasn't been merged)
>> Instructions may be added in future versions:
>>  - fast zero-length MOVSB (KVM doesn't support yet)
>>  - fast short STOSB (KVM doesn't support yet)
>>  - fast short CMPSB, SCASB (KVM doesn't support yet)
>>
>> Signed-off-by: Lei Wang <lei4.wang@intel.com>
>> Reviewed-by: Robert Hoo <robert.hu@linux.intel.com>
>> ---
>>  target/i386/cpu.c | 135 ++++++++++++++++++++++++++++++++++++++++++++++
>>  target/i386/cpu.h |   4 ++
>>  2 files changed, 139 insertions(+)
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 946df29a3d..5e1ecd50b3 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -3576,6 +3576,141 @@ static const X86CPUDefinition builtin_x86_defs[] = {
>>              { /* end of list */ }
>>          }
>>      },
>> +    {
>> +        .name = "SapphireRapids",
>> +        .level = 0x20,
>> +        .vendor = CPUID_VENDOR_INTEL,
>> +        .family = 6,
>> +        .model = 143,
>> +        .stepping = 4,
>> +        /*
>> +         * please keep the ascending order so that we can have a clear view of
>> +         * bit position of each feature.
>> +         */
> 
> unless you have a way to enforce this comment. I wouldn't expect that would
> work in practice.
> 
> Also If you wish to bring more order here, you should start with a prerequisite
> patch that would do the same to all existing CPU models.
> That way one can easily see a difference between Icelake and new cpu model.
> 
> As it is in this patch (with all unnecessary reordering) it's hard for reviewer
> to see differences.
> I'd suggest to just copy Icelake definition and modify it to suit new cpu model
> (without reordering all feature bits)  

Thanks for the suggestion, will remove the comment and just copy Icelake
definition and modify it to suit new cpu model (without reordering all feature bits)

>> +        .features[FEAT_1_EDX] =
>> +            CPUID_FP87 | CPUID_VME | CPUID_DE | CPUID_PSE | CPUID_TSC |
>> +            CPUID_MSR | CPUID_PAE | CPUID_MCE | CPUID_CX8 | CPUID_APIC |
>> +            CPUID_SEP | CPUID_MTRR | CPUID_PGE | CPUID_MCA | CPUID_CMOV |
>> +            CPUID_PAT | CPUID_PSE36 | CPUID_CLFLUSH | CPUID_MMX | CPUID_FXSR |
>> +            CPUID_SSE | CPUID_SSE2,
>> +        .features[FEAT_1_ECX] =
>> +            CPUID_EXT_SSE3 | CPUID_EXT_PCLMULQDQ | CPUID_EXT_SSSE3 |
>> +            CPUID_EXT_FMA | CPUID_EXT_CX16 | CPUID_EXT_PCID | CPUID_EXT_SSE41 |
>> +            CPUID_EXT_SSE42 | CPUID_EXT_X2APIC | CPUID_EXT_MOVBE |
>> +            CPUID_EXT_POPCNT | CPUID_EXT_TSC_DEADLINE_TIMER | CPUID_EXT_AES |
>> +            CPUID_EXT_XSAVE | CPUID_EXT_AVX | CPUID_EXT_F16C | CPUID_EXT_RDRAND,
>> +        .features[FEAT_8000_0001_EDX] =
>> +            CPUID_EXT2_SYSCALL | CPUID_EXT2_NX | CPUID_EXT2_PDPE1GB |
>> +            CPUID_EXT2_RDTSCP | CPUID_EXT2_LM,
>> +        .features[FEAT_8000_0001_ECX] =
>> +            CPUID_EXT3_LAHF_LM | CPUID_EXT3_ABM | CPUID_EXT3_3DNOWPREFETCH,
>> +        .features[FEAT_8000_0008_EBX] =
>> +            CPUID_8000_0008_EBX_WBNOINVD,
>> +        .features[FEAT_7_0_EBX] =
>> +            CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_HLE |
>> +            CPUID_7_0_EBX_AVX2 | CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_BMI2 |
>> +            CPUID_7_0_EBX_ERMS | CPUID_7_0_EBX_INVPCID | CPUID_7_0_EBX_RTM |
>> +            CPUID_7_0_EBX_AVX512F | CPUID_7_0_EBX_AVX512DQ |
>> +            CPUID_7_0_EBX_RDSEED | CPUID_7_0_EBX_ADX | CPUID_7_0_EBX_SMAP |
>> +            CPUID_7_0_EBX_AVX512IFMA | CPUID_7_0_EBX_CLFLUSHOPT |
>> +            CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_AVX512CD | CPUID_7_0_EBX_SHA_NI |
>> +            CPUID_7_0_EBX_AVX512BW | CPUID_7_0_EBX_AVX512VL,
>> +        .features[FEAT_7_0_ECX] =
>> +            CPUID_7_0_ECX_AVX512_VBMI | CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_PKU |
>> +            CPUID_7_0_ECX_AVX512_VBMI2 | CPUID_7_0_ECX_GFNI |
>> +            CPUID_7_0_ECX_VAES | CPUID_7_0_ECX_VPCLMULQDQ |
>> +            CPUID_7_0_ECX_AVX512VNNI | CPUID_7_0_ECX_AVX512BITALG |
>> +            CPUID_7_0_ECX_AVX512_VPOPCNTDQ | CPUID_7_0_ECX_LA57 |
>> +            CPUID_7_0_ECX_RDPID | CPUID_7_0_ECX_BUS_LOCK_DETECT,
>> +        .features[FEAT_7_0_EDX] =
>> +            CPUID_7_0_EDX_FSRM | CPUID_7_0_EDX_SERIALIZE |
>> +            CPUID_7_0_EDX_TSX_LDTRK | CPUID_7_0_EDX_AMX_BF16 |
>> +            CPUID_7_0_EDX_AVX512_FP16 | CPUID_7_0_EDX_AMX_TILE |
>> +            CPUID_7_0_EDX_AMX_INT8 | CPUID_7_0_EDX_SPEC_CTRL |
>> +            CPUID_7_0_EDX_ARCH_CAPABILITIES | CPUID_7_0_EDX_SPEC_CTRL_SSBD,
>> +        .features[FEAT_ARCH_CAPABILITIES] =
>> +            MSR_ARCH_CAP_RDCL_NO | MSR_ARCH_CAP_IBRS_ALL |
>> +            MSR_ARCH_CAP_SKIP_L1DFL_VMENTRY | MSR_ARCH_CAP_MDS_NO |
>> +            MSR_ARCH_CAP_PSCHANGE_MC_NO | MSR_ARCH_CAP_TAA_NO,
>> +        .features[FEAT_XSAVE] =
>> +            CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
>> +            CPUID_XSAVE_XGETBV1 | CPUID_XSAVE_XSAVES | CPUID_D_1_EAX_XFD,
>> +        .features[FEAT_6_EAX] =
>> +            CPUID_6_EAX_ARAT,
>> +        .features[FEAT_7_1_EAX] =
>> +            CPUID_7_1_EAX_AVX_VNNI | CPUID_7_1_EAX_AVX512_BF16,
>> +        .features[FEAT_1D_1_EAX] = INTEL_SPR_AMX_TOTAL_TILE_BYTES |
>> +            (INTEL_SPR_AMX_BYTES_PER_TILE << 16),
>> +        .features[FEAT_1D_1_EBX] = INTEL_SPR_AMX_BYTES_PER_ROW |
>> +            (INTEL_SPR_AMX_TILE_MAX_NAMES << 16),
>> +        .features[FEAT_1D_1_ECX] = INTEL_SPR_AMX_TILE_MAX_ROWS,
>> +        .features[FEAT_1E_0_EBX] = INTEL_SPR_AMX_TMUL_MAX_K |
>> +            (INTEL_SPR_AMX_TMUL_MAX_N << 8),
>> +        .features[FEAT_VMX_BASIC] =
>> +            MSR_VMX_BASIC_INS_OUTS | MSR_VMX_BASIC_TRUE_CTLS,
>> +        .features[FEAT_VMX_ENTRY_CTLS] =
>> +            VMX_VM_ENTRY_LOAD_DEBUG_CONTROLS | VMX_VM_ENTRY_IA32E_MODE |
>> +            VMX_VM_ENTRY_LOAD_IA32_PERF_GLOBAL_CTRL |
>> +            VMX_VM_ENTRY_LOAD_IA32_PAT | VMX_VM_ENTRY_LOAD_IA32_EFER,
>> +        .features[FEAT_VMX_EPT_VPID_CAPS] =
>> +            MSR_VMX_EPT_EXECONLY |
>> +            MSR_VMX_EPT_PAGE_WALK_LENGTH_4 | MSR_VMX_EPT_PAGE_WALK_LENGTH_5 |
>> +            MSR_VMX_EPT_WB | MSR_VMX_EPT_2MB | MSR_VMX_EPT_1GB |
>> +            MSR_VMX_EPT_INVEPT | MSR_VMX_EPT_AD_BITS |
>> +            MSR_VMX_EPT_INVEPT_SINGLE_CONTEXT | MSR_VMX_EPT_INVEPT_ALL_CONTEXT |
>> +            MSR_VMX_EPT_INVVPID | MSR_VMX_EPT_INVVPID_SINGLE_ADDR |
>> +            MSR_VMX_EPT_INVVPID_SINGLE_CONTEXT |
>> +            MSR_VMX_EPT_INVVPID_ALL_CONTEXT |
>> +            MSR_VMX_EPT_INVVPID_SINGLE_CONTEXT_NOGLOBALS,
>> +        .features[FEAT_VMX_EXIT_CTLS] =
>> +            VMX_VM_EXIT_SAVE_DEBUG_CONTROLS |
>> +            VMX_VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
>> +            VMX_VM_EXIT_ACK_INTR_ON_EXIT | VMX_VM_EXIT_SAVE_IA32_PAT |
>> +            VMX_VM_EXIT_LOAD_IA32_PAT | VMX_VM_EXIT_SAVE_IA32_EFER |
>> +            VMX_VM_EXIT_LOAD_IA32_EFER | VMX_VM_EXIT_SAVE_VMX_PREEMPTION_TIMER,
>> +        .features[FEAT_VMX_MISC] =
>> +            MSR_VMX_MISC_STORE_LMA | MSR_VMX_MISC_ACTIVITY_HLT |
>> +            MSR_VMX_MISC_VMWRITE_VMEXIT,
>> +        .features[FEAT_VMX_PINBASED_CTLS] =
>> +            VMX_PIN_BASED_EXT_INTR_MASK | VMX_PIN_BASED_NMI_EXITING |
>> +            VMX_PIN_BASED_VIRTUAL_NMIS | VMX_PIN_BASED_VMX_PREEMPTION_TIMER |
>> +            VMX_PIN_BASED_POSTED_INTR,
>> +        .features[FEAT_VMX_PROCBASED_CTLS] =
>> +            VMX_CPU_BASED_VIRTUAL_INTR_PENDING |
>> +            VMX_CPU_BASED_USE_TSC_OFFSETING | VMX_CPU_BASED_HLT_EXITING |
>> +            VMX_CPU_BASED_INVLPG_EXITING | VMX_CPU_BASED_MWAIT_EXITING |
>> +            VMX_CPU_BASED_RDPMC_EXITING | VMX_CPU_BASED_RDTSC_EXITING |
>> +            VMX_CPU_BASED_CR3_LOAD_EXITING | VMX_CPU_BASED_CR3_STORE_EXITING |
>> +            VMX_CPU_BASED_CR8_LOAD_EXITING | VMX_CPU_BASED_CR8_STORE_EXITING |
>> +            VMX_CPU_BASED_TPR_SHADOW | VMX_CPU_BASED_VIRTUAL_NMI_PENDING |
>> +            VMX_CPU_BASED_MOV_DR_EXITING | VMX_CPU_BASED_UNCOND_IO_EXITING |
>> +            VMX_CPU_BASED_USE_IO_BITMAPS | VMX_CPU_BASED_MONITOR_TRAP_FLAG |
>> +            VMX_CPU_BASED_USE_MSR_BITMAPS | VMX_CPU_BASED_MONITOR_EXITING |
>> +            VMX_CPU_BASED_PAUSE_EXITING |
>> +            VMX_CPU_BASED_ACTIVATE_SECONDARY_CONTROLS,
>> +        .features[FEAT_VMX_SECONDARY_CTLS] =
>> +            VMX_SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES |
>> +            VMX_SECONDARY_EXEC_ENABLE_EPT | VMX_SECONDARY_EXEC_DESC |
>> +            VMX_SECONDARY_EXEC_RDTSCP |
>> +            VMX_SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE |
>> +            VMX_SECONDARY_EXEC_ENABLE_VPID | VMX_SECONDARY_EXEC_WBINVD_EXITING |
>> +            VMX_SECONDARY_EXEC_UNRESTRICTED_GUEST |
>> +            VMX_SECONDARY_EXEC_APIC_REGISTER_VIRT |
>> +            VMX_SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY |
>> +            VMX_SECONDARY_EXEC_RDRAND_EXITING |
>> +            VMX_SECONDARY_EXEC_ENABLE_INVPCID |
>> +            VMX_SECONDARY_EXEC_ENABLE_VMFUNC | VMX_SECONDARY_EXEC_SHADOW_VMCS |
>> +            VMX_SECONDARY_EXEC_RDSEED_EXITING | VMX_SECONDARY_EXEC_ENABLE_PML |
>> +            VMX_SECONDARY_EXEC_XSAVES,
>> +        .features[FEAT_VMX_VMFUNC] =
>> +            MSR_VMX_VMFUNC_EPT_SWITCHING,
>> +        .xlevel = 0x80000008,
>> +        .model_id = "Intel Xeon Processor (SapphireRapids)",
>> +        .versions = (X86CPUVersionDefinition[]) {
>> +            { .version = 1 },
>> +            { /* end of list */ },
>> +        },
>> +    },
>>      {
>>          .name = "Denverton",
>>          .level = 21,
>> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>> index 3e3e0cfe59..8361b9f3ff 100644
>> --- a/target/i386/cpu.h
>> +++ b/target/i386/cpu.h
>> @@ -893,10 +893,14 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
>>  #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
>>  /* Architectural LBRs */
>>  #define CPUID_7_0_EDX_ARCH_LBR          (1U << 19)
>> +/* AMX_BF16 instruction */
>> +#define CPUID_7_0_EDX_AMX_BF16          (1U << 22)
>>  /* AVX512_FP16 instruction */
>>  #define CPUID_7_0_EDX_AVX512_FP16       (1U << 23)
>>  /* AMX tile (two-dimensional register) */
>>  #define CPUID_7_0_EDX_AMX_TILE          (1U << 24)
>> +/* AMX_INT8 instruction */
>> +#define CPUID_7_0_EDX_AMX_INT8          (1U << 25)
>>  /* Speculation Control */
>>  #define CPUID_7_0_EDX_SPEC_CTRL         (1U << 26)
>>  /* Single Thread Indirect Branch Predictors */
> 

