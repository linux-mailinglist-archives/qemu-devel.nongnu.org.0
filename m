Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96364322ED1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:35:15 +0100 (CET)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaeY-0007rZ-LB
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1lEacX-0006en-7O
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:33:09 -0500
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:36901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1lEacU-0008FJ-J4
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:33:08 -0500
Received: by mail-il1-x129.google.com with SMTP id k2so6685367ili.4
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BMZLxTegqq+B/ysuIUF3VxQtmO56nV7KjQfFXkhIFiw=;
 b=PW23wr7FbWq3Oelwbly+ERUOeJZOGbUlLuMMpyZ8yZSHAPmbpESccfedrawcrT0g0i
 QLVwiooTGJWKq0P4cBScw0o0g0FtVetnaJXnAtpcCeRgtsZzRyWZZGZ1cjmnUG7vvGDF
 B4ukewD1aQzpNMs8KyVsGa+2TNrw1+oue8/WDki3s/7Mi6X9KeaMnNFz9zubsAzxd5Do
 +qPFz6WT/tEHjfNjiG1jpSXzR941L8oK6IH29O8vmp18OrFcOQ8P1TnX8peLaHxiW45e
 6TkDfDy2uuNUE0rrSuaPF4cJZxF3AwRT/S0m4EQ2uN8uMcmC7LSeCU5kdz3PLFIx4Z1D
 +hMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BMZLxTegqq+B/ysuIUF3VxQtmO56nV7KjQfFXkhIFiw=;
 b=jKSjkdwl8fQFsPXH5MJX5Oth9Zfr9fg2lGt89qzvphGgr/l+NRs5P98Fq06MOYF0Ha
 xbs7H7M73VY6j0Bk4rbaJ5NrreLYirBlSTPdykSqCwTcO3Fx1E8w/mrDJuenvHzor5bG
 G3GQdRImlGr9AtKrDHUIzeBLJSmRv8z/PRDlU/6IMQYWERG7kQsyf+7oXbeLXQmv4/xO
 4EUXtfsBDXJGpPXSstzFjXATTXEDncGHPHTOPixW+guXEtmFZ0B+Qx3QusABubTzC/SJ
 5oZgs4oEIgy7SpjoWyw7PmLPscZ/pMFQzpaLh7LiE4rRMtbfJGR+pcohPz5PHbTWs+7d
 +akg==
X-Gm-Message-State: AOAM531plB0yMXW2IPkHwMm4rc3xTGKHJrD4qj0Qz32P+gdNiyCe7td3
 ObS2hCZuwr/EsWo3qBPbgVA9+uA+3ABsNhd5hds=
X-Google-Smtp-Source: ABdhPJzCQePZW8LNeY1xPGGZPj7BhZpBpvFE9XaNDCnetnAPNq7MSRczv1uEdv8iZILiLihVhRmcaAtgzwFLqOpAm3k=
X-Received: by 2002:a05:6e02:b27:: with SMTP id
 e7mr20275685ilu.253.1614097984764; 
 Tue, 23 Feb 2021 08:33:04 -0800 (PST)
MIME-Version: 1.0
References: <161290460478.11352.8933244555799318236.stgit@bmoger-ubuntu>
In-Reply-To: <161290460478.11352.8933244555799318236.stgit@bmoger-ubuntu>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Tue, 23 Feb 2021 17:32:53 +0100
Message-ID: <CAM9Jb+hOeKrQ1QxZm5zB1LioMNuyzzTObM8XL+zatqP7KdESWA@mail.gmail.com>
Subject: Re: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
 processors
To: Babu Moger <babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, richard.henderson@linaro.org,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Babu,

Have below doubt about exposed CPU flags between EPYC-Rome & EPYC-Milan family.
Please see below.

> Adds the support for AMD 3rd generation processors. The model
> display for the new processor will be EPYC-Milan.
>
> Adds the following new feature bits on top of the feature bits from
> the first and second generation EPYC models.
>
> pcid          : Process context identifiers support
> ibrs          : Indirect Branch Restricted Speculation
> ssbd          : Speculative Store Bypass Disable
> erms          : Enhanced REP MOVSB/STOSB support
> fsrm          : Fast Short REP MOVSB support
> invpcid       : Invalidate processor context ID
> pku           : Protection keys support
> svme-addr-chk : SVM instructions address check for #GP handling
>
> Depends on the following kernel commits:
> 14c2bf81fcd2 ("KVM: SVM: Fix #GP handling for doubly-nested virtualization")
> 3b9c723ed7cf ("KVM: SVM: Add support for SVM instruction address check change")
> 4aa2691dcbd3 ("8ce1c461188799d863398dd2865d KVM: x86: Factor out x86 instruction emulation with decoding")
> 4407a797e941 ("KVM: SVM: Enable INVPCID feature on AMD")
> 9715092f8d7e ("KVM: X86: Move handling of INVPCID types to x86")
> 3f3393b3ce38 ("KVM: X86: Rename and move the function vmx_handle_memory_failure to x86.c")
> 830bd71f2c06 ("KVM: SVM: Remove set_cr_intercept, clr_cr_intercept and is_cr_intercept")
> 4c44e8d6c193 ("KVM: SVM: Add new intercept word in vmcb_control_area")
> c62e2e94b9d4 ("KVM: SVM: Modify 64 bit intercept field to two 32 bit vectors")
> 9780d51dc2af ("KVM: SVM: Modify intercept_exceptions to generic intercepts")
> 30abaa88382c ("KVM: SVM: Change intercept_dr to generic intercepts")
> 03bfeeb988a9 ("KVM: SVM: Change intercept_cr to generic intercepts")
> c45ad7229d13 ("KVM: SVM: Introduce vmcb_(set_intercept/clr_intercept/_is_intercept)")
> a90c1ed9f11d ("(pcid) KVM: nSVM: Remove unused field")
> fa44b82eb831 ("KVM: x86: Move MPK feature detection to common code")
> 38f3e775e9c2 ("x86/Kconfig: Update config and kernel doc for MPK feature on AMD")
> 37486135d3a7 ("KVM: x86: Fix pkru save/restore when guest CR4.PKE=0, move it to x86.c")
>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v2: Added svme-addr-chk. Also added all the dependent kernel commits in the log.
>
> v1: https://lore.kernel.org/qemu-devel/161133338780.27536.17735339269843944966.stgit@bmoger-ubuntu/
>
>  target/i386/cpu.c |  107 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/i386/cpu.h |    4 ++
>  2 files changed, 110 insertions(+), 1 deletion(-)
>
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 9c3d2d60b7..24db7ed892 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -1033,7 +1033,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>              "clzero", NULL, "xsaveerptr", NULL,
>              NULL, NULL, NULL, NULL,
>              NULL, "wbnoinvd", NULL, NULL,
> -            "ibpb", NULL, NULL, "amd-stibp",
> +            "ibpb", NULL, "ibrs", "amd-stibp",
>              NULL, NULL, NULL, NULL,
>              NULL, NULL, NULL, NULL,
>              "amd-ssbd", "virt-ssbd", "amd-no-ssb", NULL,
> @@ -1798,6 +1798,56 @@ static CPUCaches epyc_rome_cache_info = {
>      },
>  };
>
> +static CPUCaches epyc_milan_cache_info = {
> +    .l1d_cache = &(CPUCacheInfo) {
> +        .type = DATA_CACHE,
> +        .level = 1,
> +        .size = 32 * KiB,
> +        .line_size = 64,
> +        .associativity = 8,
> +        .partitions = 1,
> +        .sets = 64,
> +        .lines_per_tag = 1,
> +        .self_init = 1,
> +        .no_invd_sharing = true,
> +    },
> +    .l1i_cache = &(CPUCacheInfo) {
> +        .type = INSTRUCTION_CACHE,
> +        .level = 1,
> +        .size = 32 * KiB,
> +        .line_size = 64,
> +        .associativity = 8,
> +        .partitions = 1,
> +        .sets = 64,
> +        .lines_per_tag = 1,
> +        .self_init = 1,
> +        .no_invd_sharing = true,
> +    },
> +    .l2_cache = &(CPUCacheInfo) {
> +        .type = UNIFIED_CACHE,
> +        .level = 2,
> +        .size = 512 * KiB,
> +        .line_size = 64,
> +        .associativity = 8,
> +        .partitions = 1,
> +        .sets = 1024,
> +        .lines_per_tag = 1,
> +    },
> +    .l3_cache = &(CPUCacheInfo) {
> +        .type = UNIFIED_CACHE,
> +        .level = 3,
> +        .size = 32 * MiB,
> +        .line_size = 64,
> +        .associativity = 16,
> +        .partitions = 1,
> +        .sets = 32768,
> +        .lines_per_tag = 1,
> +        .self_init = true,
> +        .inclusive = true,
> +        .complex_indexing = true,
> +    },
> +};
> +
>  /* The following VMX features are not supported by KVM and are left out in the
>   * CPU definitions:
>   *
> @@ -4130,6 +4180,61 @@ static X86CPUDefinition builtin_x86_defs[] = {
>          .model_id = "AMD EPYC-Rome Processor",
>          .cache_info = &epyc_rome_cache_info,
>      },
> +    {
> +        .name = "EPYC-Milan",
> +        .level = 0xd,
> +        .vendor = CPUID_VENDOR_AMD,
> +        .family = 25,
> +        .model = 1,
> +        .stepping = 1,
> +        .features[FEAT_1_EDX] =
> +            CPUID_SSE2 | CPUID_SSE | CPUID_FXSR | CPUID_MMX | CPUID_CLFLUSH |
> +            CPUID_PSE36 | CPUID_PAT | CPUID_CMOV | CPUID_MCA | CPUID_PGE |
> +            CPUID_MTRR | CPUID_SEP | CPUID_APIC | CPUID_CX8 | CPUID_MCE |
> +            CPUID_PAE | CPUID_MSR | CPUID_TSC | CPUID_PSE | CPUID_DE |
> +            CPUID_VME | CPUID_FP87,
> +        .features[FEAT_1_ECX] =
> +            CPUID_EXT_RDRAND | CPUID_EXT_F16C | CPUID_EXT_AVX |
> +            CPUID_EXT_XSAVE | CPUID_EXT_AES |  CPUID_EXT_POPCNT |
> +            CPUID_EXT_MOVBE | CPUID_EXT_SSE42 | CPUID_EXT_SSE41 |
> +            CPUID_EXT_CX16 | CPUID_EXT_FMA | CPUID_EXT_SSSE3 |
> +            CPUID_EXT_MONITOR | CPUID_EXT_PCLMULQDQ | CPUID_EXT_SSE3 |
> +            CPUID_EXT_PCID,
> +        .features[FEAT_8000_0001_EDX] =
> +            CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | CPUID_EXT2_PDPE1GB |
> +            CPUID_EXT2_FFXSR | CPUID_EXT2_MMXEXT | CPUID_EXT2_NX |
> +            CPUID_EXT2_SYSCALL,
> +        .features[FEAT_8000_0001_ECX] =
> +            CPUID_EXT3_OSVW | CPUID_EXT3_3DNOWPREFETCH |
> +            CPUID_EXT3_MISALIGNSSE | CPUID_EXT3_SSE4A | CPUID_EXT3_ABM |
> +            CPUID_EXT3_CR8LEG | CPUID_EXT3_SVM | CPUID_EXT3_LAHF_LM |
> +            CPUID_EXT3_TOPOEXT | CPUID_EXT3_PERFCORE,
> +        .features[FEAT_8000_0008_EBX] =
> +            CPUID_8000_0008_EBX_CLZERO | CPUID_8000_0008_EBX_XSAVEERPTR |
> +            CPUID_8000_0008_EBX_WBNOINVD | CPUID_8000_0008_EBX_IBPB |
> +            CPUID_8000_0008_EBX_IBRS | CPUID_8000_0008_EBX_STIBP |
> +            CPUID_8000_0008_EBX_AMD_SSBD,

Don't have SSBD flag exposed in default EPYC-Rome CPU configuration?
Is there any reason for this?
Or do we need to explicitly add it?

Thanks,
Pankaj

> +        .features[FEAT_7_0_EBX] =
> +            CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_AVX2 |
> +            CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_RDSEED |
> +            CPUID_7_0_EBX_ADX | CPUID_7_0_EBX_SMAP | CPUID_7_0_EBX_CLFLUSHOPT |
> +            CPUID_7_0_EBX_SHA_NI | CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_ERMS |
> +            CPUID_7_0_EBX_INVPCID,
> +        .features[FEAT_7_0_ECX] =
> +            CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_RDPID | CPUID_7_0_ECX_PKU,
> +        .features[FEAT_7_0_EDX] =
> +            CPUID_7_0_EDX_FSRM,
> +        .features[FEAT_XSAVE] =
> +            CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
> +            CPUID_XSAVE_XGETBV1 | CPUID_XSAVE_XSAVES,
> +        .features[FEAT_6_EAX] =
> +            CPUID_6_EAX_ARAT,
> +        .features[FEAT_SVM] =
> +            CPUID_SVM_NPT | CPUID_SVM_NRIPSAVE | CPUID_SVM_SVME_ADDR_CHK,
> +        .xlevel = 0x8000001E,
> +        .model_id = "AMD EPYC-Milan Processor",
> +        .cache_info = &epyc_milan_cache_info,
> +    },
>  };
>
>  /* KVM-specific features that are automatically added/removed
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 8d599bb5b8..888c3a59e2 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -816,8 +816,12 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
>  #define CPUID_8000_0008_EBX_WBNOINVD    (1U << 9)
>  /* Indirect Branch Prediction Barrier */
>  #define CPUID_8000_0008_EBX_IBPB        (1U << 12)
> +/* Indirect Branch Restricted Speculation */
> +#define CPUID_8000_0008_EBX_IBRS        (1U << 14)
>  /* Single Thread Indirect Branch Predictors */
>  #define CPUID_8000_0008_EBX_STIBP       (1U << 15)
> +/* Speculative Store Bypass Disable */
> +#define CPUID_8000_0008_EBX_AMD_SSBD    (1U << 24)
>
>  #define CPUID_XSAVE_XSAVEOPT   (1U << 0)
>  #define CPUID_XSAVE_XSAVEC     (1U << 1)
>
>

