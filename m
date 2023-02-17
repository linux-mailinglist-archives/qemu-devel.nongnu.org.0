Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7179E69A359
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 02:19:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSpOA-0002yo-Mv; Thu, 16 Feb 2023 20:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pSpO8-0002yf-RJ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 20:18:12 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pSpO6-0007BS-DG
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 20:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676596690; x=1708132690;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=saNcZ/ZeMhuqFZ2cdMwxNJ3Ykw5Fy2wHuEnphWqcYM8=;
 b=EadqGl4O4yA9TrIqaxd/11NCyWMajLMXATMj/Frtfu22RjyLPB3SNtPa
 autyN2pmXketir/Fx7Y53q39WIbRJ/TkAXMkMCCjRndTmYj2nNnfYisZc
 MeI5Aw9wuUJ8wy/oABk6EDVTfKy02sFEMpZa8APoRnyi7AifX9YxfDOwc
 HHliDREGkxD0soOHKtqql24l2s7zQv8/B5vhgGlw3Nlwtvb79t7WDUHte
 qCCRxwE6wiI+lTO1JvUyKkrDK+A50zGxBSaeeBqjLsnd1hegKdOj18u+i
 4AzopiaN7QtRS5x+meJFaKHROyrv1ePClob1USOT3DLUiZFL52vJKrazW Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="334084287"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="334084287"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 17:18:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="999277864"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="999277864"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.254.213.70])
 ([10.254.213.70])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 17:18:00 -0800
Message-ID: <f27e7f9a-030c-60c1-475f-56b59c4f67c6@intel.com>
Date: Fri, 17 Feb 2023 09:17:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.2
Subject: Re: [PATCH] i386: Add new CPU model SapphireRapids
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Wang, Lei" <lei4.wang@intel.com>, paul.c.lai@intel.com,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, robert.hu@intel.com, chenyi.qiang@intel.com
References: <20220812055751.14553-1-lei4.wang@intel.com>
 <Yysk/taT/eKR0Bp3@work-vm>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <Yysk/taT/eKR0Bp3@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.65; envelope-from=xiaoyao.li@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.649, NICE_REPLY_A=-0.351,
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

On 9/21/2022 10:51 PM, Dr. David Alan Gilbert wrote:
> * Wang, Lei (lei4.wang@intel.com) wrote:
>> The new CPU model mostly inherits features from Icelake-Server, while
>> adding new features:
>>   - AMX (Advance Matrix eXtensions)
>>   - Bus Lock Debug Exception
>> and new instructions:
>>   - AVX VNNI (Vector Neural Network Instruction):
>>      - VPDPBUS: Multiply and Add Unsigned and Signed Bytes
>>      - VPDPBUSDS: Multiply and Add Unsigned and Signed Bytes with Saturation
>>      - VPDPWSSD: Multiply and Add Signed Word Integers
>>      - VPDPWSSDS: Multiply and Add Signed Integers with Saturation
>>   - FP16: Replicates existing AVX512 computational SP (FP32) instructions
>>     using FP16 instead of FP32 for ~2X performance gain
>>   - SERIALIZE: Provide software with a simple way to force the processor to
>>     complete all modifications, faster, allowed in all privilege levels and
>>     not causing an unconditional VM exit
>>   - TSX Suspend Load Address Tracking: Allows programmers to choose which
>>     memory accesses do not need to be tracked in the TSX read set
>>   - AVX512_BF16: Vector Neural Network Instructions supporting BFLOAT16
>>     inputs and conversion instructions from IEEE single precision
>>
>> Features may be added in future versions:
>>   - CET (virtualization support hasn't been merged)
>> Instructions may be added in future versions:
>>   - fast zero-length MOVSB (KVM doesn't support yet)
>>   - fast short STOSB (KVM doesn't support yet)
>>   - fast short CMPSB, SCASB (KVM doesn't support yet)
>>
>> Signed-off-by: Wang, Lei <lei4.wang@intel.com>
>> Reviewed-by: Robert Hoo <robert.hu@linux.intel.com>
> 
> Hi,
>     What fills in the AMX tile and tmul information leafs
> (0x1D, 0x1E)?

Current QEMU hard-codes the value of AMX tile and tmul information leafs 
(0x1D, 0x1E) if AMX is exposed to guest. In cpu_x86_cpuid(), 
target/i386/cpu.c

case 0x1D: {
         /* AMX TILE */
         *eax = 0;
         *ebx = 0;
         *ecx = 0;
         *edx = 0;
         if (!(env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_AMX_TILE)) {
             break;
         }

         if (count == 0) {
             /* Highest numbered palette subleaf */
             *eax = INTEL_AMX_TILE_MAX_SUBLEAF;
         } else if (count == 1) {
             *eax = INTEL_AMX_TOTAL_TILE_BYTES |
                    (INTEL_AMX_BYTES_PER_TILE << 16);
             *ebx = INTEL_AMX_BYTES_PER_ROW | (INTEL_AMX_TILE_MAX_NAMES 
<< 16);
             *ecx = INTEL_AMX_TILE_MAX_ROWS;
         }
         break;
     }
     case 0x1E: {
         /* AMX TMUL */
         *eax = 0;
         *ebx = 0;
         *ecx = 0;
         *edx = 0;
         if (!(env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_AMX_TILE)) {
             break;
         }

         if (count == 0) {
             /* Highest numbered palette subleaf */
             *ebx = INTEL_AMX_TMUL_MAX_K | (INTEL_AMX_TMUL_MAX_N << 8);
         }
         break;
     }



>    In particular, how would we make sure when we migrate between two
> generations of AMX/Tile/Tmul capable devices with different
> register/palette/tmul limits that the migration is tied to the CPU type
> correctly?

Since they'are hard-coded. The value of guest never change no matter 
what HW is.

>    Would you expect all devices called a 'SappireRapids' to have the same
> sizes?

I suppose here the devices you mean HW platform? If so, Intel commits 
that palette 1 value (CPUID leaf 0x1d, subleaf 0x1) will never change. 
And TMUL capability (CPUID leaf 0x1e) are constant for a few generations 
after SPR.

But this has no impact on migration safety as long as CPUID value of 
leaf 0x1d and 0x1e are tied to a named CPU model and doesn't vary on 
different hosts. And current QEMU code satisfy it since the values are 
hard-coded.

So, IMHO, it seems OK to define AMX in SPR cpu model with current QEMU 
as this patch does. Although hard-coded value of 0x1E seems to have 
potential issue if far future product reports smaller value (Intel only 
can commit it doesn't change for a few generations so far), it's another 
thing we can handle separately for AMX.

Dave and Paolo, what do you think?

> Dave
>   
>> ---
>>   target/i386/cpu.c | 128 ++++++++++++++++++++++++++++++++++++++++++++++
>>   target/i386/cpu.h |   4 ++
>>   2 files changed, 132 insertions(+)
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 1db1278a59..abb43853d4 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -3467,6 +3467,134 @@ static const X86CPUDefinition builtin_x86_defs[] = {
>>               { /* end of list */ }
>>           }
>>       },
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
>>       {
>>           .name = "Denverton",
>>           .level = 21,
>> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>> index 82004b65b9..ef3e8a5ed5 100644
>> --- a/target/i386/cpu.h
>> +++ b/target/i386/cpu.h
>> @@ -879,10 +879,14 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
>>   #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
>>   /* Architectural LBRs */
>>   #define CPUID_7_0_EDX_ARCH_LBR          (1U << 19)
>> +/* AMX_BF16 instruction */
>> +#define CPUID_7_0_EDX_AMX_BF16          (1U << 22)
>>   /* AVX512_FP16 instruction */
>>   #define CPUID_7_0_EDX_AVX512_FP16       (1U << 23)
>>   /* AMX tile (two-dimensional register) */
>>   #define CPUID_7_0_EDX_AMX_TILE          (1U << 24)
>> +/* AMX_INT8 instruction */
>> +#define CPUID_7_0_EDX_AMX_INT8          (1U << 25)
>>   /* Speculation Control */
>>   #define CPUID_7_0_EDX_SPEC_CTRL         (1U << 26)
>>   /* Single Thread Indirect Branch Predictors */
>> -- 
>> 2.34.1
>>
>>


