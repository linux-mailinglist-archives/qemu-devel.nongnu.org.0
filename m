Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940474E5F8F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 08:37:15 +0100 (CET)
Received: from localhost ([::1]:36182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXI1y-0006f2-7B
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 03:37:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXI04-0005vg-Cn
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 03:35:16 -0400
Received: from [2a00:1450:4864:20::636] (port=46742
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXI02-0001Em-Li
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 03:35:16 -0400
Received: by mail-ej1-x636.google.com with SMTP id qx21so7311957ejb.13
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 00:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1fSiinXMkPdt0Dz1OSntIBZZsTdF1b0J9b6Jk9X9ABI=;
 b=WpqCe6mKjtb3gb2S28oSGQGqKLXwnI2aQ1tHOfoHgRvmq9EqHChxJnrVkRGLJic4VF
 UlJWRnaLdP08euBdZT6kcQuDXKDQ4K9W0YC6ckuk7z+/SNxHlTZOfVLMSPPl6PdR3IAW
 2ANAidGQ0fXlJ8lLBChUHc6c8pRrCl+iEMlfp+VeSoDvmqqc7tbcfOdxL5PlHY/qJqCZ
 YfWKp2BT7bIvVCXu5aXZAyqGSxuq5j8Bzxk+Vz+RWCKrOFKon+2bnJTbGd8I0SLwB5Y+
 UXuSk9dLtjediNQ584gJLzvIbt77Aiqh/oI0fcCO22P02eVPhcc72gIzgJqA4a9bEg+k
 je3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1fSiinXMkPdt0Dz1OSntIBZZsTdF1b0J9b6Jk9X9ABI=;
 b=oEpi+N3Ljg/N59vfLQiRxcHxYI6bukEbd9QxJh1XMfAURcoqJaL37qw54p4dEGR1KU
 FnrHJSwnX2EXVSp98oyUd4fNwgH3vakBod9l2g2xcE3Ai0H5q9dAj90J/CXmVA7+zI7m
 wJm58FDwO+dwsv1L66MYCKzqtQg0GuSRjkKkeHbsCbkElNlxgA4Q9qVE6KNBTyYxse2U
 9Q94psUyBRoaJ/zd+t5CaTl2r47Ia9w3hQHipiuyuFD5ctb25sbzIAeheTSl5xTUii52
 z+zIL8uxn12PTRVt8p0oSUTlICfPKE1HiLSNVlblONbbqJfycmuqxe5xliUNrCJgyLYw
 xe9g==
X-Gm-Message-State: AOAM532rCUYC42JWa8xy1npxk3bQekWCiLjUFv96u+bpXRnov/ULVh3c
 yxwqVHslTd8SA4tZtEV1gKs=
X-Google-Smtp-Source: ABdhPJw1+l0syJ0tUZjfpvu4OnNZAGBOVCJDBOEoBzqY2mzQfOf3sbWd92SExb/4ODLkGwxXjgnlxw==
X-Received: by 2002:a17:906:16cc:b0:6ce:e607:ff02 with SMTP id
 t12-20020a17090616cc00b006cee607ff02mr4310370ejd.418.1648107313104; 
 Thu, 24 Mar 2022 00:35:13 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 i22-20020a170906251600b006d6d9081f46sm779550ejb.150.2022.03.24.00.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 00:35:12 -0700 (PDT)
Message-ID: <8650f038-15ce-a67b-c5d7-1960c3ac6695@redhat.com>
Date: Thu, 24 Mar 2022 08:35:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] target/i386: Return right size value after dynamic
 xfeature enabled
Content-Language: en-US
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20220324031846.11943-1-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220324031846.11943-1-yang.zhong@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/24/22 04:18, Yang Zhong wrote:
> The kvm_arch_get_supported_cpuid() only call KVM_GET_SUPPORTED_CPUID one
> time, so the cpuid buffer information still keep older value. Once Qemu
> enable new dynamic xfeature, like XTILEDATA, the cpuid[0D,0].{EBX,ECX}
> still return older value.
> 
> This patch can return right size value in kvm_init_xsave() if XTILEDATA
> has been enabled by arch_prctl.
> 
> assert(kvm_arch_get_supported_cpuid(kvm_state, 0xd, 0, R_ECX) <=
>             env->xsave_buf_len);
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>

I don't understand, is this a bugfix for an assertion failure or just a 
cleanup?

Either way, while I like the idea of modifying 
kvm_arch_get_supported_cpuid, I think the right thing to do is to just 
use has_xsave2 as the return value if it is nonzero.  And then 
kvm_init_xsave can just do

if (!has_xsave) {
     return;
}
env->xsave_buf_len = kvm_arch_get_supported_cpuid(kvm_state, 0xd, 0, R_ECX);

without the assertion that is now obvious.

Paolo

> ---
>   target/i386/cpu.h     |  3 +++
>   target/i386/kvm/kvm.c | 15 +++++++++++++--
>   2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 5e406088a9..814ba4020b 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -565,6 +565,9 @@ typedef enum X86Seg {
>   #define ESA_FEATURE_ALIGN64_MASK        (1U << ESA_FEATURE_ALIGN64_BIT)
>   #define ESA_FEATURE_XFD_MASK            (1U << ESA_FEATURE_XFD_BIT)
>   
> +#define ARCH_GET_XCOMP_GUEST_PERM       0x1024
> +#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
> +
>   
>   /* CPUID feature words */
>   typedef enum FeatureWord {
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 06901c2a43..312d4fccf8 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -46,6 +46,7 @@
>   #include "hw/i386/intel_iommu.h"
>   #include "hw/i386/x86-iommu.h"
>   #include "hw/i386/e820_memory_layout.h"
> +#include "target/i386/cpu.h"
>   
>   #include "hw/pci/pci.h"
>   #include "hw/pci/msi.h"
> @@ -437,6 +438,18 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
>               return ret;
>           }
>           ret = (reg == R_EAX) ? bitmask : bitmask >> 32;
> +    } else if (function == 0xd && index == 0 &&
> +               (reg == R_EBX || reg == R_ECX)) {
> +        /*
> +         * The value returned by KVM_GET_SUPPORTED_CPUID does not include
> +         * features that already be enabled with the arch_prctl system call.
> +         */
> +        int rc = syscall(SYS_arch_prctl, ARCH_GET_XCOMP_GUEST_PERM, &bitmask);
> +        if (rc) {
> +            warn_report("prctl(ARCH_GET_XCOMP_GUEST_PERM) error: %d", rc);
> +        } else if (bitmask & XSTATE_XTILE_DATA_MASK) {
> +            ret += sizeof(XSaveXTILEDATA);
> +        }
>       } else if (function == 0x80000001 && reg == R_ECX) {
>           /*
>            * It's safe to enable TOPOEXT even if it's not returned by
> @@ -5214,8 +5227,6 @@ bool kvm_arch_cpu_check_are_resettable(void)
>       return !sev_es_enabled();
>   }
>   
> -#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
> -
>   void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
>   {
>       KVMState *s = kvm_state;
> 


