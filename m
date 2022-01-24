Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145C4497CDD
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 11:19:37 +0100 (CET)
Received: from localhost ([::1]:42542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBwRk-0004du-6l
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 05:19:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nBwOv-0002Ta-0U
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 05:16:43 -0500
Received: from [2a00:1450:4864:20::52e] (port=40479
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nBwOs-0006W2-UO
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 05:16:40 -0500
Received: by mail-ed1-x52e.google.com with SMTP id a18so55508302edj.7
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 02:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EketEQvLfz5t0pTsmrH+cpxYcEf2gmkm8qYSYTA4jYk=;
 b=TeidEOiJ5g0Lm6ocVAW6CrzbRa1JVHDI4CX/bmGoW/TJ0SgZcNWZyFgCtb1Lgtayn7
 Jke6an7VgQe3YS61ZGNSSiq2rH+kfQ58mzkcvG0j4qjq8tmzQSDYxy6BcQEWCWxIdjag
 xZNgrxQjTFc1cbuzzdYuIPQfvs/AaBZXtVj+zCz0wXSPOmA9fSBpmonQj5vQ+SSTSzFv
 GXLN/cwDMxkwpXqb7EXDbIiBuLILcIjdwbL2cr975nV+ygvTu7HSvSEOLednTZcev52W
 MkcOKHjtxKSRylnyQJomx9BlMWqZ1pfqMG70HNZoDxCRBCwdFdUGL20FDV00PTC6Rbkj
 MEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EketEQvLfz5t0pTsmrH+cpxYcEf2gmkm8qYSYTA4jYk=;
 b=IaGxutmjiKvJ01887NbCyLpsMY3N9hqJzLiV0AI2Y9sgiqRIyJWRURC59Y/LB1ZHD8
 gPUgGXDjNsVO6r/kywOZwLUx0mkXJ6ufeOooTORRo4kVnHxLiSXLrNKxElJbRKm21ADs
 WKkhOiWTIF7qlhyJCAcSQCCPrBPw7rJgGK9jJNLMckkE6XBIXhTjGsFclYT4HnidHMoE
 QWeeFFZ+fDzkZcdedBWykG7xSxe6hZTVNdVetWoD+2bAEUMlvZ9aPa8VRgT36SOuX8wm
 FfJq95Ut3FuP7NlCEnuTCFbsqPjXTs8oKuoFx8WjJUHAirfuFTch1KL2iWW14KQPVqZr
 jjlQ==
X-Gm-Message-State: AOAM531OwTdfUilXS43W/Lk5VxyrzGOKsbVNLXARV4JfWfz+mNwzcv4T
 QL+7IHdJYhZf8BEeMzN+ZxY=
X-Google-Smtp-Source: ABdhPJyjX6z7bPaLgm8p29l96gGPkMRXal62s+WSbXZ7681BOvU93Cos05Xld8+QEX8wgDN7KFnZfg==
X-Received: by 2002:a05:6402:50cd:: with SMTP id
 h13mr15279954edb.177.1643019397209; 
 Mon, 24 Jan 2022 02:16:37 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id s14sm6402481edx.37.2022.01.24.02.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 02:16:36 -0800 (PST)
Message-ID: <cdd1bc06-619c-cd8c-b9cf-e6da22fd8751@redhat.com>
Date: Mon, 24 Jan 2022 11:16:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/7] x86: Grant AMX permission for guest
Content-Language: en-US
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20220124075523.108875-1-yang.zhong@intel.com>
 <20220124075523.108875-4-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220124075523.108875-4-yang.zhong@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: seanjc@google.com, kevin.tian@intel.com, jing2.liu@linux.intel.com,
 wei.w.wang@intel.com, guang.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/22 08:55, Yang Zhong wrote:
> Kernel allocates 4K xstate buffer by default. For XSAVE features
> which require large state component (e.g. AMX), Linux kernel
> dynamically expands the xstate buffer only after the process has
> acquired the necessary permissions. Those are called dynamically-
> enabled XSAVE features (or dynamic xfeatures).
> 
> There are separate permissions for native tasks and guests.
> 
> Qemu should request the guest permissions for dynamic xfeatures
> which will be exposed to the guest. This only needs to be done
> once before the first vcpu is created.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> Signed-off-by: Jing Liu <jing2.liu@intel.com>
> Signed-off-by: Wei Wang <wei.w.wang@intel.com>
> ---
>   target/i386/cpu.h         |  7 +++++++
>   target/i386/cpu.c         | 31 +++++++++++++++++++++++++++++++
>   target/i386/kvm/kvm-cpu.c | 12 ++++++------
>   target/i386/kvm/kvm.c     |  6 ++++++
>   4 files changed, 50 insertions(+), 6 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 06d2d6bccf..d4ad0f56bd 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -549,6 +549,13 @@ typedef enum X86Seg {
>   #define XSTATE_ZMM_Hi256_MASK           (1ULL << XSTATE_ZMM_Hi256_BIT)
>   #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
>   #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
> +#define XSTATE_XTILE_CFG_MASK           (1ULL << XSTATE_XTILE_CFG_BIT)
> +#define XSTATE_XTILE_DATA_MASK          (1ULL << XSTATE_XTILE_DATA_BIT)
> +#define XFEATURE_XTILE_MASK             (XSTATE_XTILE_CFG_MASK \
> +                                         | XSTATE_XTILE_DATA_MASK)
> +
> +#define ARCH_GET_XCOMP_GUEST_PERM       0x1024
> +#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
>   
>   #define ESA_FEATURE_ALIGN64_BIT         1
>   
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 3390820745..29b0348c25 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -43,6 +43,10 @@
>   #include "disas/capstone.h"
>   #include "cpu-internal.h"
>   
> +#include <sys/syscall.h>
> +
> +bool request_perm;
> +
>   /* Helpers for building CPUID[2] descriptors: */
>   
>   struct CPUID2CacheDescriptorInfo {
> @@ -6000,6 +6004,27 @@ static void x86_cpu_adjust_feat_level(X86CPU *cpu, FeatureWord w)
>       }
>   }
>   
> +static void kvm_request_xsave_components(X86CPU *cpu, uint32_t bit)
> +{
> +    KVMState *s = CPU(cpu)->kvm_state;
> +
> +    long rc = syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_GUEST_PERM,
> +                      bit);
> +    if (rc) {
> +        /*
> +         * The older kernel version(<5.15) can't support
> +         * ARCH_REQ_XCOMP_GUEST_PERM and directly return.
> +         */
> +        return;
> +    }
> +
> +    rc = kvm_arch_get_supported_cpuid(s, 0xd, 0, R_EAX);
> +    if (!(rc & XFEATURE_XTILE_MASK)) {
> +        error_report("get cpuid failure and rc=0x%lx", rc);
> +        exit(EXIT_FAILURE);
> +    }
> +}
> +
>   /* Calculate XSAVE components based on the configured CPU feature flags */
>   static void x86_cpu_enable_xsave_components(X86CPU *cpu)
>   {
> @@ -6021,6 +6046,12 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
>           }
>       }
>   
> +    /* Only request permission from fisrt vcpu. */
> +    if (kvm_enabled() && !request_perm) {
> +        kvm_request_xsave_components(cpu, XSTATE_XTILE_DATA_BIT);
> +        request_perm = true;
> +    }

You should pass "mask" here, or "mask & XSTATE_DYNAMIC_MASK" so that the 
components are only requested if necessary.

>       env->features[FEAT_XSAVE_COMP_LO] = mask;
>       env->features[FEAT_XSAVE_COMP_HI] = mask >> 32;
>   }
> diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
> index 033ca011ea..5ab6a0b9d2 100644
> --- a/target/i386/kvm/kvm-cpu.c
> +++ b/target/i386/kvm/kvm-cpu.c
> @@ -84,7 +84,7 @@ static void kvm_cpu_max_instance_init(X86CPU *cpu)
>   static void kvm_cpu_xsave_init(void)
>   {
>       static bool first = true;
> -    KVMState *s = kvm_state;
> +    uint32_t eax, ebx, ecx, edx;
>       int i;
>   
>       if (!first) {
> @@ -100,13 +100,13 @@ static void kvm_cpu_xsave_init(void)
>           ExtSaveArea *esa = &x86_ext_save_areas[i];
>   
>           if (esa->size) {
> -            int sz = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EAX);
> -            if (sz != 0) {
> -                assert(esa->size == sz);
> -                esa->offset = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EBX);
> +            host_cpuid(0xd, i, &eax, &ebx, &ecx, &edx);
> +            if (eax != 0) {
> +                assert(esa->size == eax);
> +                esa->offset = ebx;
>               }
>   
> -            esa->ecx = kvm_arch_get_supported_cpuid(s, 0xd, i, R_ECX);
> +            esa->ecx = ecx;

I think esa->ecx should be assigned inside the "if".  This is also true 
in patch 1.

>           }
>       }
>   }
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 2c8feb4a6f..caf1388d8b 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -405,6 +405,12 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
>           if (!has_msr_arch_capabs) {
>               ret &= ~CPUID_7_0_EDX_ARCH_CAPABILITIES;
>           }
> +    } else if (function == 0xd && index == 0 && reg == R_EAX) {
> +        /*
> +         * We can set the AMX XTILE DATA flag, even if KVM does not
> +         * return it on GET_SUPPORTED_CPUID.
> +         */
> +        ret |= XSTATE_XTILE_DATA_MASK;
>       } else if (function == 0x80000001 && reg == R_ECX) {
>           /*
>            * It's safe to enable TOPOEXT even if it's not returned by
> 

Instead of setting XSTATE_XTILE_DATA_MASK blindly, you need something 
like arch_prctl(ARCH_GET_XCOMP_GUEST_SUPP).  However, this arch_prctl 
only exists in the bare-metal version ARCH_GET_XCOMP_SUPP, and it would 
need access to the variable supported_xcr0 that KVM exports.  So I think 
it's better to implement it as a new KVM_CHECK_EXTENSION value instead 
of a prctl.

Paolo

