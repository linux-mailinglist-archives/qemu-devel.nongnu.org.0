Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83A54AAD28
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 01:24:59 +0100 (CET)
Received: from localhost ([::1]:46940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGVMR-0007xd-0i
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 19:24:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVIm-0005pQ-CF
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:21:12 -0500
Received: from [2607:f8b0:4864:20::634] (port=47098
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVIc-0001cj-8I
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:21:05 -0500
Received: by mail-pl1-x634.google.com with SMTP id t9so6148452plg.13
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 16:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fG5H9Zgal+aZd6yAW86fwvKdq0d4D98ex+EbMEdvy5E=;
 b=n7DbugJOi8mcJUFK9mKfhuvhZiZVgjS3IBGm6XnnjHbKpqOB1DXBtiPwgaaiDRokuH
 nXeSIz6owGB6gur8xjk3XjsuqnxnOVQRrsDN+MBei+vZ9nxE7Eahva86m7EnkUeLM0of
 Pf3tfQLUBWxYDW1JTk0Hpv0Y+oDdbXo/trWNLWrCCQy+8XgrzG3r+eIRRJyG1oHjiIBk
 HCebqjqbJiRIk68j7kdwHG2m/GcOP9iowAIzMIHdNeFbhNI7CqTe43/DhhAVzogpufNm
 baWkGfEQ5PdIbbmL2SdKBL48EZfLXYZnCWc786iZnhwanTdkhY4IMaSlrhAYaFvdc3Or
 XC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fG5H9Zgal+aZd6yAW86fwvKdq0d4D98ex+EbMEdvy5E=;
 b=j/RIJNzAb76KK7LlpffvC24/3nDbWnEuoSNAcCbtqjz8I66DK+CbX4UZ0KCMpi+Sz8
 NKOHtgvVyj4DfflK7H8GwMQTrJPJwg+ASjT407VJwSOaPEWBIm3snR/iyvVqMH4xkGYF
 nFqPLBeGOI4/9PXELQ7u0L220GlkU+YvvmeBY0ojXk2+l7gfiA1r2uhtET0RJU0d4lgC
 GwgydD9HcH0TM9a4EkkYC0pUvk51FCCAj8HbmXZYOSIToKZROHfcRiWZp+BVZeanJQ4P
 E3nlQZdilch6Fx5vOGhskJn7ALR7iJikG5EvOHnSqwn67ZWDLh43p8GcA2zMVPJL8QJt
 h8tg==
X-Gm-Message-State: AOAM532jlqumHDdLRUrhrxfdQ1iHOuQn5ylOnVaThzgyrPc4LMOoszNQ
 N7ClyKLCjfRMfzRh0aO8WyRUZQ==
X-Google-Smtp-Source: ABdhPJxVpoWLyjtZuuLtbGXKG+uiDNgLRsOT5pFIv5esTKR8BztdCb5a2cY8D3QtUCHIT+24+31a7g==
X-Received: by 2002:a17:90a:af97:: with SMTP id
 w23mr6528266pjq.237.1644106839800; 
 Sat, 05 Feb 2022 16:20:39 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id h4sm7142111pfv.166.2022.02.05.16.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 16:20:39 -0800 (PST)
Message-ID: <0f2b9fe3-329c-d0de-aa37-a0e2242cbf6b@linaro.org>
Date: Sun, 6 Feb 2022 11:20:34 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/6] target/arm: Unindent unnecessary else-clause
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
 <20220204165506.2846058-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220204165506.2846058-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/22 03:55, Peter Maydell wrote:
> Now that the if() branch of the condition in aarch64_max_initfn()
> returns early, we don't need to keep the rest of the code in
> the function inside an else block. Remove the else, unindenting
> that code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu64.c | 288 +++++++++++++++++++++++----------------------
>   1 file changed, 145 insertions(+), 143 deletions(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index ae2e431247f..bc25a2567bf 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -707,176 +707,178 @@ static void aarch64_host_initfn(Object *obj)
>   static void aarch64_max_initfn(Object *obj)
>   {
>       ARMCPU *cpu = ARM_CPU(obj);
> +    uint64_t t;
> +    uint32_t u;
>   
>       if (kvm_enabled()) {
>           /* With KVM, '-cpu max' is identical to '-cpu host' */
>           aarch64_host_initfn(obj);
>           return;
> -    } else {
> -        uint64_t t;
> -        uint32_t u;
> -        aarch64_a57_initfn(obj);
> +    }


Could move the init of cpu afterward.  It's a runtime call to verify the qom class, and 
we'll wind up doing that again inside aarch64_host_initfn.  But either way,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

>   
> -        /*
> -         * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
> -         * one and try to apply errata workarounds or use impdef features we
> -         * don't provide.
> -         * An IMPLEMENTER field of 0 means "reserved for software use";
> -         * ARCHITECTURE must be 0xf indicating "v7 or later, check ID registers
> -         * to see which features are present";
> -         * the VARIANT, PARTNUM and REVISION fields are all implementation
> -         * defined and we choose to define PARTNUM just in case guest
> -         * code needs to distinguish this QEMU CPU from other software
> -         * implementations, though this shouldn't be needed.
> -         */
> -        t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
> -        t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
> -        t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
> -        t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
> -        t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
> -        cpu->midr = t;
> +    /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
>   
> -        t = cpu->isar.id_aa64isar0;
> -        t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2); /* AES + PMULL */
> -        t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);
> -        t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2); /* SHA512 */
> -        t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);
> -        t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);
> -        t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);
> -        t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 1);
> -        t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 1);
> -        t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 1);
> -        t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
> -        t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
> -        t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
> -        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2); /* FEAT_TLBIRANGE */
> -        t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
> -        cpu->isar.id_aa64isar0 = t;
> +    aarch64_a57_initfn(obj);
>   
> -        t = cpu->isar.id_aa64isar1;
> -        t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);
> -        t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);
> -        t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
> -        t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
> -        t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
> -        t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);
> -        t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
> -        t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
> -        t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
> -        cpu->isar.id_aa64isar1 = t;
> +    /*
> +     * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
> +     * one and try to apply errata workarounds or use impdef features we
> +     * don't provide.
> +     * An IMPLEMENTER field of 0 means "reserved for software use";
> +     * ARCHITECTURE must be 0xf indicating "v7 or later, check ID registers
> +     * to see which features are present";
> +     * the VARIANT, PARTNUM and REVISION fields are all implementation
> +     * defined and we choose to define PARTNUM just in case guest
> +     * code needs to distinguish this QEMU CPU from other software
> +     * implementations, though this shouldn't be needed.
> +     */
> +    t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
> +    t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
> +    t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
> +    t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
> +    t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
> +    cpu->midr = t;
>   
> -        t = cpu->isar.id_aa64pfr0;
> -        t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
> -        t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
> -        t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
> -        t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
> -        t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);
> -        cpu->isar.id_aa64pfr0 = t;
> +    t = cpu->isar.id_aa64isar0;
> +    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2); /* AES + PMULL */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);
> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2); /* SHA512 */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);
> +    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);
> +    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);
> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 1);
> +    t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 1);
> +    t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 1);
> +    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
> +    t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
> +    t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2); /* FEAT_TLBIRANGE */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
> +    cpu->isar.id_aa64isar0 = t;
>   
> -        t = cpu->isar.id_aa64pfr1;
> -        t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
> -        t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);
> -        /*
> -         * Begin with full support for MTE. This will be downgraded to MTE=0
> -         * during realize if the board provides no tag memory, much like
> -         * we do for EL2 with the virtualization=on property.
> -         */
> -        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);
> -        cpu->isar.id_aa64pfr1 = t;
> +    t = cpu->isar.id_aa64isar1;
> +    t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);
> +    t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);
> +    t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
> +    t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
> +    t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
> +    t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);
> +    t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
> +    t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
> +    t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
> +    cpu->isar.id_aa64isar1 = t;
>   
> -        t = cpu->isar.id_aa64mmfr0;
> -        t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 5); /* PARange: 48 bits */
> -        cpu->isar.id_aa64mmfr0 = t;
> +    t = cpu->isar.id_aa64pfr0;
> +    t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
> +    t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
> +    t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
> +    t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
> +    t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);
> +    cpu->isar.id_aa64pfr0 = t;
>   
> -        t = cpu->isar.id_aa64mmfr1;
> -        t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
> -        t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
> -        t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);
> -        t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2); /* ATS1E1 */
> -        t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* VMID16 */
> -        t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1); /* TTS2UXN */
> -        cpu->isar.id_aa64mmfr1 = t;
> +    t = cpu->isar.id_aa64pfr1;
> +    t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
> +    t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);
> +    /*
> +     * Begin with full support for MTE. This will be downgraded to MTE=0
> +     * during realize if the board provides no tag memory, much like
> +     * we do for EL2 with the virtualization=on property.
> +     */
> +    t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);
> +    cpu->isar.id_aa64pfr1 = t;
>   
> -        t = cpu->isar.id_aa64mmfr2;
> -        t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
> -        t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
> -        t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
> -        cpu->isar.id_aa64mmfr2 = t;
> +    t = cpu->isar.id_aa64mmfr0;
> +    t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 5); /* PARange: 48 bits */
> +    cpu->isar.id_aa64mmfr0 = t;
>   
> -        t = cpu->isar.id_aa64zfr0;
> -        t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
> -        t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
> -        t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
> -        t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);
> -        t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
> -        t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
> -        t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
> -        t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
> -        t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
> -        cpu->isar.id_aa64zfr0 = t;
> +    t = cpu->isar.id_aa64mmfr1;
> +    t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
> +    t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
> +    t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);
> +    t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2); /* ATS1E1 */
> +    t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* VMID16 */
> +    t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1); /* TTS2UXN */
> +    cpu->isar.id_aa64mmfr1 = t;
>   
> -        /* Replicate the same data to the 32-bit id registers.  */
> -        u = cpu->isar.id_isar5;
> -        u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
> -        u = FIELD_DP32(u, ID_ISAR5, SHA1, 1);
> -        u = FIELD_DP32(u, ID_ISAR5, SHA2, 1);
> -        u = FIELD_DP32(u, ID_ISAR5, CRC32, 1);
> -        u = FIELD_DP32(u, ID_ISAR5, RDM, 1);
> -        u = FIELD_DP32(u, ID_ISAR5, VCMA, 1);
> -        cpu->isar.id_isar5 = u;
> +    t = cpu->isar.id_aa64mmfr2;
> +    t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
> +    t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
> +    t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
> +    cpu->isar.id_aa64mmfr2 = t;
>   
> -        u = cpu->isar.id_isar6;
> -        u = FIELD_DP32(u, ID_ISAR6, JSCVT, 1);
> -        u = FIELD_DP32(u, ID_ISAR6, DP, 1);
> -        u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
> -        u = FIELD_DP32(u, ID_ISAR6, SB, 1);
> -        u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
> -        u = FIELD_DP32(u, ID_ISAR6, BF16, 1);
> -        u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
> -        cpu->isar.id_isar6 = u;
> +    t = cpu->isar.id_aa64zfr0;
> +    t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
> +    t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
> +    t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
> +    t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);
> +    t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
> +    t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
> +    t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
> +    t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
> +    t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
> +    cpu->isar.id_aa64zfr0 = t;
>   
> -        u = cpu->isar.id_pfr0;
> -        u = FIELD_DP32(u, ID_PFR0, DIT, 1);
> -        cpu->isar.id_pfr0 = u;
> +    /* Replicate the same data to the 32-bit id registers.  */
> +    u = cpu->isar.id_isar5;
> +    u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
> +    u = FIELD_DP32(u, ID_ISAR5, SHA1, 1);
> +    u = FIELD_DP32(u, ID_ISAR5, SHA2, 1);
> +    u = FIELD_DP32(u, ID_ISAR5, CRC32, 1);
> +    u = FIELD_DP32(u, ID_ISAR5, RDM, 1);
> +    u = FIELD_DP32(u, ID_ISAR5, VCMA, 1);
> +    cpu->isar.id_isar5 = u;
>   
> -        u = cpu->isar.id_pfr2;
> -        u = FIELD_DP32(u, ID_PFR2, SSBS, 1);
> -        cpu->isar.id_pfr2 = u;
> +    u = cpu->isar.id_isar6;
> +    u = FIELD_DP32(u, ID_ISAR6, JSCVT, 1);
> +    u = FIELD_DP32(u, ID_ISAR6, DP, 1);
> +    u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
> +    u = FIELD_DP32(u, ID_ISAR6, SB, 1);
> +    u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
> +    u = FIELD_DP32(u, ID_ISAR6, BF16, 1);
> +    u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
> +    cpu->isar.id_isar6 = u;
>   
> -        u = cpu->isar.id_mmfr3;
> -        u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
> -        cpu->isar.id_mmfr3 = u;
> +    u = cpu->isar.id_pfr0;
> +    u = FIELD_DP32(u, ID_PFR0, DIT, 1);
> +    cpu->isar.id_pfr0 = u;
>   
> -        u = cpu->isar.id_mmfr4;
> -        u = FIELD_DP32(u, ID_MMFR4, HPDS, 1); /* AA32HPD */
> -        u = FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
> -        u = FIELD_DP32(u, ID_MMFR4, CNP, 1); /* TTCNP */
> -        u = FIELD_DP32(u, ID_MMFR4, XNX, 1); /* TTS2UXN */
> -        cpu->isar.id_mmfr4 = u;
> +    u = cpu->isar.id_pfr2;
> +    u = FIELD_DP32(u, ID_PFR2, SSBS, 1);
> +    cpu->isar.id_pfr2 = u;
>   
> -        t = cpu->isar.id_aa64dfr0;
> -        t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
> -        cpu->isar.id_aa64dfr0 = t;
> +    u = cpu->isar.id_mmfr3;
> +    u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
> +    cpu->isar.id_mmfr3 = u;
>   
> -        u = cpu->isar.id_dfr0;
> -        u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
> -        cpu->isar.id_dfr0 = u;
> +    u = cpu->isar.id_mmfr4;
> +    u = FIELD_DP32(u, ID_MMFR4, HPDS, 1); /* AA32HPD */
> +    u = FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
> +    u = FIELD_DP32(u, ID_MMFR4, CNP, 1); /* TTCNP */
> +    u = FIELD_DP32(u, ID_MMFR4, XNX, 1); /* TTS2UXN */
> +    cpu->isar.id_mmfr4 = u;
>   
> -        u = cpu->isar.mvfr1;
> -        u = FIELD_DP32(u, MVFR1, FPHP, 3);      /* v8.2-FP16 */
> -        u = FIELD_DP32(u, MVFR1, SIMDHP, 2);    /* v8.2-FP16 */
> -        cpu->isar.mvfr1 = u;
> +    t = cpu->isar.id_aa64dfr0;
> +    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
> +    cpu->isar.id_aa64dfr0 = t;
> +
> +    u = cpu->isar.id_dfr0;
> +    u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
> +    cpu->isar.id_dfr0 = u;
> +
> +    u = cpu->isar.mvfr1;
> +    u = FIELD_DP32(u, MVFR1, FPHP, 3);      /* v8.2-FP16 */
> +    u = FIELD_DP32(u, MVFR1, SIMDHP, 2);    /* v8.2-FP16 */
> +    cpu->isar.mvfr1 = u;
>   
>   #ifdef CONFIG_USER_ONLY
> -        /* For usermode -cpu max we can use a larger and more efficient DCZ
> -         * blocksize since we don't have to follow what the hardware does.
> -         */
> -        cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
> -        cpu->dcz_blocksize = 7; /*  512 bytes */
> +    /* For usermode -cpu max we can use a larger and more efficient DCZ
> +     * blocksize since we don't have to follow what the hardware does.
> +     */
> +    cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
> +    cpu->dcz_blocksize = 7; /*  512 bytes */
>   #endif
>   
> -        bitmap_fill(cpu->sve_vq_supported, ARM_MAX_VQ);
> -    }
> +    bitmap_fill(cpu->sve_vq_supported, ARM_MAX_VQ);
>   
>       aarch64_add_pauth_properties(obj);
>       aarch64_add_sve_properties(obj);


