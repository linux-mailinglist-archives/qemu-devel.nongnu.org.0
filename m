Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC195803FC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 20:27:30 +0200 (CEST)
Received: from localhost ([::1]:38754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG2nh-00076I-AG
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 14:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2gx-0000bg-AW
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:20:31 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2gv-0006Zz-Gm
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:20:30 -0400
Received: by mail-pl1-x62c.google.com with SMTP id i3so6711191pld.0
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 11:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=ACzgSzCa5ERQJBIyGWPc4HKpcVCvjGP1xHu7xLPnF8Q=;
 b=lP3NpA87wvstnTj22Ldd6LwAxx0lXpE//vOfrAQly0mU4fmI0S/b0tEYcHA9rvAtmz
 eLQJY4ETzHWGsQxHf6H8alLOMTHoNqn3T+3Wh+Rk6ahz8BAx/mYTD6aoWBNWNHD9Qwih
 G1X3N7y8gqwyCQXyhiYzcR4X1fD8NPUeO9HidAq2Kc8TAeO1hzvJKHKUBCrg9ZtdLE3m
 ndyW9E9TWejCHUIytFgkdBwgjFOz7wybg0poemHKHHp3f1WU+yAWl7iLc0Pwt7Eb0Jy7
 zdPu3DEwvCXrd9wmtzB2dUaYwe0u/Qgp7iuRcXKIDLITGEojANNWYM8a10WmtFrgdDHX
 FovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=ACzgSzCa5ERQJBIyGWPc4HKpcVCvjGP1xHu7xLPnF8Q=;
 b=05mzJQPHiwYrlOyMJ9h0WzlEmevLd3iDvbAC6i6bPvrqJDv7v4XketJDPFZmXA/tNC
 l0ksLuPU6UmCLPmCkfomqq9keP4kiLWfApVQNS4tYPWcUZdKN68UzlVLcA9dMZ0e/2vG
 ThP/TOzT4DhqICiyY9jFaMGrQEvy1zoxS0qd1xnqjP0SiFeJtWyXTcY/V7XsmVmwAnrS
 zZKSSy2AmE70P7kVzOx6ZACiOeGrcESTqJ6MM7LkCcjwW98Wz3l9c/8BSUp0rZ15dXCR
 YFewaqIv1HS+n2E4F6JjzYhAg0OrTUXocY2k/k+BbDeUTJyulxeL6UNxraCT6UgBBOzM
 ZkRw==
X-Gm-Message-State: AJIora/CA4VLcqrKDFRCu8nyQfUlgPiAJgaesoIevm6pC7UCekoD9diz
 x6qC9BPiJ7tOnyHwsIPeHPM1SSQFX/7oww==
X-Google-Smtp-Source: AGRyM1vcyU9cPEKltgnaJBtHGp+5O50UnODEXq0vXgpaC/rgVKcfGyHYiCA2l6tMMVBESVGYw0tvJA==
X-Received: by 2002:a17:90b:1d01:b0:1f2:104:6424 with SMTP id
 on1-20020a17090b1d0100b001f201046424mr15263086pjb.101.1658773226097; 
 Mon, 25 Jul 2022 11:20:26 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:30c1:2484:a853:233d?
 ([2602:ae:1549:801:30c1:2484:a853:233d])
 by smtp.gmail.com with ESMTPSA id
 6-20020a620606000000b005255489187fsm9948324pfg.135.2022.07.25.11.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 11:20:25 -0700 (PDT)
Message-ID: <8ee6d63a-67a9-0025-06ef-412f042fffae@linaro.org>
Date: Mon, 25 Jul 2022 11:20:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] target/arm: Set KVM_ARM_VCPU_SVE while probing the
 host
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yuzenghui@huawei.com, qemu-arm@nongnu.org
References: <20220725181457.41083-1-richard.henderson@linaro.org>
 <20220725181457.41083-3-richard.henderson@linaro.org>
In-Reply-To: <20220725181457.41083-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 7/25/22 11:14, Richard Henderson wrote:
> Because we weren't setting this flag, our probe of ID_AA64ZFR0
> was always returning zero.  This also obviates the adjustment
> of ID_AA64PFR0, which had sanitized the SVE field.


Oh, I meant to say here that this the effects of the bug are not visible, because the only 
thing that ISAR.ID_AA64ZFR0 is used for within qemu at present is tcg translation.  The 
other tests for SVE within KVM are via ISAR.ID_AA64PFR0.SVE.


r~


> 
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm64.c | 27 +++++++++++++--------------
>   1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 36ff20c9e3..8b2ae9948a 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -512,7 +512,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>       bool sve_supported;
>       bool pmu_supported = false;
>       uint64_t features = 0;
> -    uint64_t t;
>       int err;
>   
>       /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
> @@ -533,10 +532,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>       struct kvm_vcpu_init init = { .target = -1, };
>   
>       /*
> -     * Ask for Pointer Authentication if supported. We can't play the
> -     * SVE trick of synthesising the ID reg as KVM won't tell us
> -     * whether we have the architected or IMPDEF version of PAuth, so
> -     * we have to use the actual ID regs.
> +     * Ask for SVE if supported, so that we can query ID_AA64ZFR0,
> +     * which is otherwise RAZ.
> +     */
> +    sve_supported = kvm_arm_svm_supported();
> +    if (sve_supported) {
> +        init.features[0] |= 1 << KVM_ARM_VCPU_SVE;
> +    }
> +
> +    /*
> +     * Ask for Pointer Authentication if supported, so that we get
> +     * the unsanitized field values for AA64ISAR1_EL1.
>        */
>       if (kvm_arm_pauth_supported()) {
>           init.features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
> @@ -680,20 +686,13 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>           }
>       }
>   
> -    sve_supported = kvm_arm_svm_supported();
> -
> -    /* Add feature bits that can't appear until after VCPU init. */
>       if (sve_supported) {
> -        t = ahcf->isar.id_aa64pfr0;
> -        t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
> -        ahcf->isar.id_aa64pfr0 = t;
> -
>           /*
>            * There is a range of kernels between kernel commit 73433762fcae
>            * and f81cb2c3ad41 which have a bug where the kernel doesn't expose
>            * SYS_ID_AA64ZFR0_EL1 via the ONE_REG API unless the VM has enabled
> -         * SVE support, so we only read it here, rather than together with all
> -         * the other ID registers earlier.
> +         * SVE support, which resulted in an error rather than RAZ.
> +         * So only read the register if we set KVM_ARM_VCPU_SVE above.
>            */
>           err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
>                                 ARM64_SYS_REG(3, 0, 0, 4, 4));


