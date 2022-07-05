Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4E256756A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 19:19:18 +0200 (CEST)
Received: from localhost ([::1]:36134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8mCj-00009G-RH
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 13:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8mA2-0006G4-5F
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:16:31 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:40517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8mA0-00081I-BW
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:16:29 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so17587085pjl.5
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 10:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RsheyObkH6nPm7s078ieDEVx4gIvhlxXzkit1L9GD0I=;
 b=wGGFgSYttLTQzYq45eAK66z6UTNPpXb1aFYYWjcOpJMXVJhMyLJfz995dLsuvRR71l
 Vfpau2bt6NpISGAtYliPdiS7WVuTplyaTOgh8K9pN0MN4Sd2IavreUt2IKKBqPW4SV33
 jWmjp9B3+Q/Jy8UrSB9lYfwxqpsB1ujlmjeWG3BuonpCINule4Moby0tkxYjwYO81YDW
 0we3ETGCSaPuHT+Sup0tzKcolxZH+W8uxUlC9q3WuuSy+h6qGBSMfKZDzAivFg+b1Zf6
 IcXYnNnc3mDCR9yATfQUF4cyotphhJr7PxqREWGTQZih8PgsZB4SCOR0pt/sd5a3zgcO
 0epA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RsheyObkH6nPm7s078ieDEVx4gIvhlxXzkit1L9GD0I=;
 b=XyJ/ZKJPyeBbym4rSLnenNXHw+cQ4/Ryt6DG8FmHxN216347qHTD6Ed4Fcr/jR0WmA
 IKFsqfLms7SWGRaLISFsNIJbbHY43ckI3KwchnoAhV3pSReWXvZ6WFpeEmeqPRc523Fz
 o4E7LR9HD/bpOVmKjSr8k51N5VqvVS/qMOo0sAWaNburz++wPlZjwIEynnnq3yjOMZkj
 wlWom/pCrVTE1wpYHyO95ExjKTJHnU5DxrPynQP4p4sJgvaBDWmi3ay2YUF9i0RCdHwh
 JFCIU2Vrng96QB/syugKpmFP7zle5tj1T2Z426QQaXjRqECDrzKTzQJinHHOo4eYrIGK
 1AMQ==
X-Gm-Message-State: AJIora8FTAggUmQb6Up1zneSywM32rVYqZgT/1FFE9NINss1lr77f7ir
 hdGW71vh4NWUA+1vbQikPVXCZQ==
X-Google-Smtp-Source: AGRyM1tGFhK9mCwSV6rxdHIFJAxRS0vP4BulajVGvUytdIoIGteg83JO7wWqMwj1hAELy8jys3iLNw==
X-Received: by 2002:a17:90b:3b81:b0:1ed:3655:d0c8 with SMTP id
 pc1-20020a17090b3b8100b001ed3655d0c8mr45454183pjb.56.1657041386857; 
 Tue, 05 Jul 2022 10:16:26 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a6567c9000000b003fd7e217686sm22741703pgs.57.2022.07.05.10.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 10:16:25 -0700 (PDT)
Message-ID: <af9aa8da-d76d-9da9-6f82-bb0341d01acb@linaro.org>
Date: Tue, 5 Jul 2022 22:46:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/5] target/arm: Correctly implement Feat_DoubleLock
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
 <20220630194116.3438513-6-peter.maydell@linaro.org>
 <d717bccb-09d1-99e5-f15b-fdecb2b224f6@linaro.org>
 <CAFEAcA_5QBpjRH_VGFDG8bYFDduRJ9eew98WpeXXpceuhK6s4Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_5QBpjRH_VGFDG8bYFDduRJ9eew98WpeXXpceuhK6s4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/5/22 21:06, Peter Maydell wrote:
> On Sat, 2 Jul 2022 at 15:19, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 7/1/22 01:11, Peter Maydell wrote:
>>> +static inline bool isar_feature_any_doublelock(const ARMISARegisters *id)
>>> +{
>>> +    /*
>>> +     * We can't just OR together the aa32 and aa64 checks, because
>>> +     * if there is no AArch64 support the aa64 function will default
>>> +     * to returning true for a zero id_aa64dfr0.
>>> +     * We use "is id_aa64pfr0 non-zero" as a proxy for "do we have
>>> +     * the AArch64 ID register values in id", because it's always the
>>> +     * case that ID_AA64PFR0_EL1.EL0 at least will be non-zero.
>>> +     */
>>> +    if (id->id_aa64pfr0) {
>>> +        return isar_feature_aa64_doublelock(id);
>>> +    }
>>> +    return isar_feature_aa32_doublelock(id);
>>> +}
>>
>> If you're going to rely on this, you need to clear this register for -cpu aarch64=off.
>> It's probably easier to drop this function...
>>
>>> +static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>>> +                        uint64_t value)
>>> +{
>>> +    /*
>>> +     * Only defined bit is bit 0 (DLK); if Feat_DoubleLock is not
>>> +     * implemented this is RAZ/WI.
>>> +     */
>>> +    if (cpu_isar_feature(any_doublelock, env_archcpu(env))) {
>>
>> ... and use
>>
>>       if (arm_feature(env, ARM_FEATURE_AARCH64)
>>           ? cpu_isar_feature(aa64_doublelock, cpu)
>>           : cpu_isar_feature(aa32_doublelock, cpu)) {
>>
>> since it's just used once.
> 
> If I squash in this change:
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 069dfe1d308..1f4f3e0485c 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -4218,22 +4218,6 @@ static inline bool isar_feature_any_ras(const
> ARMISARegisters *id)
>       return isar_feature_aa64_ras(id) || isar_feature_aa32_ras(id);
>   }
> 
> -static inline bool isar_feature_any_doublelock(const ARMISARegisters *id)
> -{
> -    /*
> -     * We can't just OR together the aa32 and aa64 checks, because
> -     * if there is no AArch64 support the aa64 function will default
> -     * to returning true for a zero id_aa64dfr0.
> -     * We use "is id_aa64pfr0 non-zero" as a proxy for "do we have
> -     * the AArch64 ID register values in id", because it's always the
> -     * case that ID_AA64PFR0_EL1.EL0 at least will be non-zero.
> -     */
> -    if (id->id_aa64pfr0) {
> -        return isar_feature_aa64_doublelock(id);
> -    }
> -    return isar_feature_aa32_doublelock(id);
> -}
> -
>   /*
>    * Forward to the above feature tests given an ARMCPU pointer.
>    */
> diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
> index 62bd8f85383..d09fccb0a4f 100644
> --- a/target/arm/debug_helper.c
> +++ b/target/arm/debug_helper.c
> @@ -617,11 +617,14 @@ static void oslar_write(CPUARMState *env, const
> ARMCPRegInfo *ri,
>   static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                           uint64_t value)
>   {
> +    ARMCPU *cpu = env_archcpu(env);
>       /*
>        * Only defined bit is bit 0 (DLK); if Feat_DoubleLock is not
>        * implemented this is RAZ/WI.
>        */
> -    if (cpu_isar_feature(any_doublelock, env_archcpu(env))) {
> +    if(arm_feature(env, ARM_FEATURE_AARCH64)
> +       ? cpu_isar_feature(aa64_doublelock, cpu)
> +       : cpu_isar_feature(aa32_doublelock, cpu)) {
>           env->cp15.osdlr_el1 = value & 1;
>       }
>   }
> 
> 
> 
> 
> can I have a reviewed-by? Would save me doing a respin.

You may.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

