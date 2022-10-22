Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B6C608435
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 06:16:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om5o8-0000ws-6l; Sat, 22 Oct 2022 00:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1om5o5-0000wC-Ps
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:08:21 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1om5o4-0007oH-0o
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:08:21 -0400
Received: by mail-pf1-x430.google.com with SMTP id y1so4403855pfr.3
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 21:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VRwSjyGUr2nUpMWM+CH/+r9r90XgFDCStyBiuBJV9hU=;
 b=lCn/JRUliw/HUgObfGBRxysVDO63I+n1dPrm3zRVNKhMyd8IVMISY2YwNj2Md9kSds
 0uWwGfcpqKe1jXf6ALdGrKXM4jI2kGKXoamugjqMRDNguqfseYoxmKaV1G7tdCVqYZXE
 vi/ZSzfKtoob30oCcp5UaoHP4Y75gB9Q7yJOLs0kSJmmwO74p612oyWPmxDsETJ4ieaY
 J2T3By4c9dCrgpFv6Fv6uboTPthHAdEoZbaKWvryyn2QbXAEdjMJbijpdyGcm0D0BVNG
 mDji6uprn3jKtzSAYhnkUu25f1bFc9NM3qjPqeDqF28lkxQ7wG6+F0fuO8gtAKh0s3IY
 tPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VRwSjyGUr2nUpMWM+CH/+r9r90XgFDCStyBiuBJV9hU=;
 b=RG+NY39lrWo5PnNaN7OgnMrpDlyuSRM2GurWp6XEMgIaTDMMrRJLdeR9HLvtw7JMI9
 6qX5NaH1MFzovShvTQ8nHMJR8Bbg+5WulM6+pBpln4vrCGXPgXU7zBG3cQHc57qJ1gHs
 J8B7qALtuxNNz2I8Se69XF9iduZsieoQjlQrPKSQVFvyRSguIPtABH8LjcI1ahD4lT0Q
 OIs4bpTU+/xBNXFQ9sGrc7FG6Ti8XKozM3YB3sTRUr13lcvRJV59Vj5vC/CzT1Y20axF
 LVjQ3MJY/niwBMoxo97wnBcUz7hUZCwsxvl+fGVtp5QcLr4LMgss9a1/L/s4YL+D9QM3
 04Kg==
X-Gm-Message-State: ACrzQf3f0ztfhi9AVy8VYAKzqbXbQYhCujhgBFeIi2YafS7m5ecR2ny+
 atKxlM3ZswHNVCTKk/m4z9xLxA==
X-Google-Smtp-Source: AMsMyM49pMTqTRduulM06TJXQFAFdyYcmGkf6Iqv3ZPNz4Vko9J3cmoQP58S0AlUbIZVmNMHF/TxkQ==
X-Received: by 2002:aa7:804b:0:b0:56a:ecab:e86a with SMTP id
 y11-20020aa7804b000000b0056aecabe86amr5372923pfm.40.1666411698456; 
 Fri, 21 Oct 2022 21:08:18 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a62f804000000b005628a30a500sm15934258pfh.41.2022.10.21.21.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 21:08:17 -0700 (PDT)
Message-ID: <3aec1273-cd35-a943-6aea-333553dbd560@linaro.org>
Date: Sat, 22 Oct 2022 14:08:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH] target/arm: don't process FCSE translations on
 physical TLBs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20221021172338.2782240-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221021172338.2782240-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/22/22 03:23, Alex Bennée wrote:
> A recent change to the page table walking code missed checking if we
> are at the processing the physical translation and bombs attempting to
> derive the current EL. Fix this by introducing a new
> helper (regime_is_phys) and extending the check around the FCSE
> processing.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Fixes: f3639a64f6 (target/arm: Use softmmu tlbs for page table walking)
> Cc: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h | 12 ++++++++++++
>   target/arm/ptw.c       |  2 +-
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index c3c3920ded..0e753203b5 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -673,6 +673,18 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
>       }
>   }
>   
> +static inline bool regime_is_phys(ARMMMUIdx mmu_idx)
> +{
> +    switch (mmu_idx) {
> +    case ARMMMUIdx_Phys_NS:
> +    case ARMMMUIdx_Phys_S:
> +        return true;
> +    default:
> +        return false;
> +    }
> +}
> +
> +
>   /* Return the exception level which controls this address translation regime */
>   static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
>   {
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 6c5ed56a10..1456a2f1de 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2557,7 +2557,7 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>        * Fast Context Switch Extension. This doesn't exist at all in v8.
>        * In v7 and earlier it affects all stage 1 translations.
>        */
> -    if (address < 0x02000000 && mmu_idx != ARMMMUIdx_Stage2
> +    if (address < 0x02000000 && !(mmu_idx == ARMMMUIdx_Stage2 || regime_is_phys(mmu_idx))
>           && !arm_feature(env, ARM_FEATURE_V8)) {
>           if (regime_el(env, mmu_idx) == 3) {
>               address += env->cp15.fcseidr_s;

Arg!  This is fixed in patch 2 of the FEAT_HAFDBS patches:

https://lore.kernel.org/qemu-devel/20221020223548.2310496-3-richard.henderson@linaro.org/

     switch (mmu_idx) {
     case ARMMMUIdx_Phys_S:
     case ARMMMUIdx_Phys_NS:
         /* Checking Phys early avoids special casing later vs regime_el. */
         return get_phys_addr_disabled(env, address, access_type, mmu_idx,
                                       is_secure, result, fi);


r~

