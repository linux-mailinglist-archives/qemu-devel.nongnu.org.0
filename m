Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257793DD1ED
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 10:27:01 +0200 (CEST)
Received: from localhost ([::1]:38932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mATHn-0003hs-Ow
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 04:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mATGz-00032z-Ff
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 04:26:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mATGu-0002Pn-JO
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 04:26:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627892762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2tYD413SBp7OjqEft4d8mEssGDd3kwCLlg3bEmv53Ws=;
 b=TBWk/bLCrtcxww3wQvjiwx5GOKSVXBXOe/i0X9Y0bo/OEiNvlev2PIMdL9+6qfNHWeCyNr
 J5Kn452dt+pdI7X/lRNdEBFFGxYlYwUT8QvMwSOoTyu6MTHlS5bNY0ZvjWrp/M4johsWUu
 YcJveZFGvqAqVLgjw6rm4pNySDClehM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-_KLA1Jq2Nhu8IoDFI3H32w-1; Mon, 02 Aug 2021 04:26:00 -0400
X-MC-Unique: _KLA1Jq2Nhu8IoDFI3H32w-1
Received: by mail-ed1-f70.google.com with SMTP id
 ay20-20020a0564022034b02903bc515b673dso8337668edb.3
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 01:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2tYD413SBp7OjqEft4d8mEssGDd3kwCLlg3bEmv53Ws=;
 b=BuiDhIr+/yQIUyz4HfD2VXlZ7fdXAnai9o++XXFLaqLOJQ0BYQ9Zz+tUhqxEhrd1RV
 HUvO7F0dgetC5CdO9ag93GkqmupSmYTTHDzjf1dgH9gwwMPlA5W6nIin0GHx4PqTGRqV
 eN6JbQDbXOPRCUc9iMvDsLTEfY+25Rrz9vI6GGvRkr9RzNijf0kATQbWbWpbtjAHO8f+
 ap5AMlEWh2P9h+FiLO1VGKmwoip9u1BDPpGGPXYOUDv8culR29z1+L58wfvY9D7/ke2k
 YdUMEvQHkDIEIoTuA1JjusXjY+MQ5KjMFDdO0jqCUz61VfgOF2B5vVk81jTp1tMm9C61
 WPhA==
X-Gm-Message-State: AOAM533PrfQkHBmw7T9WX8eshWMuoreIOWEqKlT9iIOkibpWHarVFNKR
 cuNydORT6AerJLKpwFd0exVU/ntbmfpY3J7GujnHQ2Mz9M+IazjOqG2PH3YXWwJW3rZSBM4YGZS
 WP3ZzZrtPSKKcH9pJ8DRk+29vnWRnUe/Fo7wBM16Ispw5Ckchrb4jftSGyYTbqa5bDuU=
X-Received: by 2002:a17:906:14c8:: with SMTP id
 y8mr14609377ejc.475.1627892759210; 
 Mon, 02 Aug 2021 01:25:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYX9vTqVV+kVq4jjdp43iAxqawYWag1B1sf2J0I/cO+IRk2Km11W6wrVsal60PeOoTVU8B2A==
X-Received: by 2002:a17:906:14c8:: with SMTP id
 y8mr14609357ejc.475.1627892758874; 
 Mon, 02 Aug 2021 01:25:58 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bm1sm4201122ejb.38.2021.08.02.01.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 01:25:58 -0700 (PDT)
Subject: Re: [PATCH v3] target/i386: Added VGIF feature
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210730070742.9674-1-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3ff32373-41b7-86b9-d170-a801532242c1@redhat.com>
Date: Mon, 2 Aug 2021 10:25:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730070742.9674-1-laramglazier@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.08, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/07/21 09:07, Lara Lazier wrote:
> v2->v3: moved guest check into virtual_gif_enabled
> 
> VGIF allows STGI and CLGI to execute in guest mode and control virtual
> interrupts in guest mode.
> When the VGIF feature is enabled then:
>   * executing STGI in the guest sets bit 9 of the VMCB offset 60h.
>   * executing CLGI in the guest clears bit 9 of the VMCB offset 60h.
> 
> Signed-off-by: Lara Lazier <laramglazier@gmail.com>

This part looks good, I queued it for QEMU 6.2.  However, I am wondering 
if STGI/CLGI should also affect the emulation of VIRQ.  I am not very 
familiar with this part of VGIF because KVM does not need it, but it 
makes sense that STGI/CLGI respectively unmask and mask VIRQ just like 
STI/CLI do.  Can you look up in the manual if there's anything like 
this?  We can discuss the implementation tomorrow.

Thanks,

Paolo

> ---
>   target/i386/cpu.c                   |  3 ++-
>   target/i386/svm.h                   |  6 ++++++
>   target/i386/tcg/sysemu/svm_helper.c | 31 +++++++++++++++++++++++++++--
>   3 files changed, 37 insertions(+), 3 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index edb97ebbbe..71d26cf1bd 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -631,7 +631,8 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
>   #define TCG_EXT3_FEATURES (CPUID_EXT3_LAHF_LM | CPUID_EXT3_SVM | \
>             CPUID_EXT3_CR8LEG | CPUID_EXT3_ABM | CPUID_EXT3_SSE4A)
>   #define TCG_EXT4_FEATURES 0
> -#define TCG_SVM_FEATURES CPUID_SVM_NPT
> +#define TCG_SVM_FEATURES (CPUID_SVM_NPT | CPUID_SVM_VGIF | \
> +          CPUID_SVM_SVME_ADDR_CHK)
>   #define TCG_KVM_FEATURES 0
>   #define TCG_7_0_EBX_FEATURES (CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_SMAP | \
>             CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_ADX | \
> diff --git a/target/i386/svm.h b/target/i386/svm.h
> index adc058dc76..036597a2ff 100644
> --- a/target/i386/svm.h
> +++ b/target/i386/svm.h
> @@ -9,6 +9,12 @@
>   #define V_IRQ_SHIFT 8
>   #define V_IRQ_MASK (1 << V_IRQ_SHIFT)
>   
> +#define V_GIF_ENABLED_SHIFT 25
> +#define V_GIF_ENABLED_MASK (1 << V_GIF_ENABLED_SHIFT)
> +
> +#define V_GIF_SHIFT 9
> +#define V_GIF_MASK (1 << V_GIF_SHIFT)
> +
>   #define V_INTR_PRIO_SHIFT 16
>   #define V_INTR_PRIO_MASK (0x0f << V_INTR_PRIO_SHIFT)
>   
> diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
> index 90a9de30f8..b6ad425cca 100644
> --- a/target/i386/tcg/sysemu/svm_helper.c
> +++ b/target/i386/tcg/sysemu/svm_helper.c
> @@ -110,6 +110,17 @@ static inline bool is_efer_invalid_state (CPUX86State *env)
>       return false;
>   }
>   
> +static inline bool virtual_gif_enabled(CPUX86State *env, uint32_t *int_ctl)
> +{
> +    if (likely(env->hflags & HF_GUEST_MASK)) {
> +        *int_ctl = x86_ldl_phys(env_cpu(env),
> +                       env->vm_vmcb + offsetof(struct vmcb, control.int_ctl));
> +        return (env->features[FEAT_SVM] & CPUID_SVM_VGIF)
> +                    && (*int_ctl & V_GIF_ENABLED_MASK);
> +    }
> +    return false;
> +}
> +
>   void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>   {
>       CPUState *cs = env_cpu(env);
> @@ -503,13 +514,29 @@ void helper_vmsave(CPUX86State *env, int aflag)
>   void helper_stgi(CPUX86State *env)
>   {
>       cpu_svm_check_intercept_param(env, SVM_EXIT_STGI, 0, GETPC());
> -    env->hflags2 |= HF2_GIF_MASK;
> +
> +    CPUState *cs = env_cpu(env);
> +    uint32_t int_ctl;
> +    if (virtual_gif_enabled(env, &int_ctl)) {
> +        x86_stl_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.int_ctl),
> +                        int_ctl | V_GIF_MASK);
> +    } else {
> +        env->hflags2 |= HF2_GIF_MASK;
> +    }
>   }
>   
>   void helper_clgi(CPUX86State *env)
>   {
>       cpu_svm_check_intercept_param(env, SVM_EXIT_CLGI, 0, GETPC());
> -    env->hflags2 &= ~HF2_GIF_MASK;
> +
> +    CPUState *cs = env_cpu(env);
> +    uint32_t int_ctl;
> +    if (virtual_gif_enabled(env, &int_ctl)) {
> +        x86_stl_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.int_ctl),
> +                        int_ctl & ~V_GIF_MASK);
> +    } else {
> +        env->hflags2 &= ~HF2_GIF_MASK;
> +    }
>   }
>   
>   bool cpu_svm_has_intercept(CPUX86State *env, uint32_t type)
> 


