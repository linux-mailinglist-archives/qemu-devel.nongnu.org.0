Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0E069FE59
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 23:15:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUxNw-0000Y6-IC; Wed, 22 Feb 2023 17:14:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUxNv-0000XW-2f
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 17:14:47 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUxNr-0003E5-RT
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 17:14:46 -0500
Received: by mail-pl1-x634.google.com with SMTP id c1so10848670plg.4
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 14:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ixxLxJ0Xfd0Bhj6NjchLM61v85VOUc/tIPHDgotylVQ=;
 b=uuunxppQfNOcVaoG6QwxB+r7ZWZZw7AG3QIcS0wOJ+6IJkEjTqIBQHBtx4cFSJMVHI
 4luD4FRXLSd+zrZMdyxcKY5rKlHLJPZhdAApY+T+bmPtYvF1iYIzcJcAl5w85Xo4y6pk
 5GZat8ZG3BTI0z0nj2cmmdLR6FsHoK4LMMCJUjkle41JxMrYwP/QnvpspwGghvpFoWJt
 pqWpfRL9ag0fImWdk5xbbVOctRVWbwXlpOLaKGWJZBxu31MoKjStWeWk6o/IiuVoA2gS
 JV6yhPLc2lKWT+U/m/pcdjUbaufKKWGIxYRsj3KdoGcij86jXgO3iD0jI6aO/ThlY05O
 tnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ixxLxJ0Xfd0Bhj6NjchLM61v85VOUc/tIPHDgotylVQ=;
 b=TTF9AWq+mpxlIcRmYnqbRTuZzD6c3r53hn4MlALYTknMIo65fasbeR4T80X9JS4xjP
 47br9WZLFfmKabq1bosLDXa9K876ncPpbAciE09Rmv7djF7NeSAa3Aj3fvGZel1i+fIq
 Qz1MBvmHgEYEoy8DJldV3AaBWpGbS0JEum1LYNyjVF+VI0zmzQH4fRyLo8SyImV//Qwy
 FdeW3WFz3pJ1+z3PQwSNmG/QF25d/IYLipsMrWTiG7FVnB36ly1OIIR6C2tweQnnlhaU
 elkMAq8FdosNIQAQNNG4TY2upydVXXyYB4CI6GJxe0Ji2q6QbNlV1l8ZG/V27scECyVX
 SLIg==
X-Gm-Message-State: AO0yUKUtlBrnIujwuIKL7U7VFm2R6Ax3Wwtf4GI0Efsw6+JW/0G72/RU
 XOtH6k3RngtJHnlZPUwrj6QMpw==
X-Google-Smtp-Source: AK7set9tjLrhoACxG9nzOceNq7Wjoq9NGt/1bLOwGjJRSgfc4zU1wn+Rvz1SmlRB0zjBKM7Nv/KJKg==
X-Received: by 2002:a17:902:ce8e:b0:19a:de35:aeaf with SMTP id
 f14-20020a170902ce8e00b0019ade35aeafmr12373843plg.40.1677104082039; 
 Wed, 22 Feb 2023 14:14:42 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 b2-20020a170902ed0200b0019c919bccf8sm3944866pld.86.2023.02.22.14.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 14:14:41 -0800 (PST)
Message-ID: <c79aa318-0fa9-e93e-56dc-c084de47f645@linaro.org>
Date: Wed, 22 Feb 2023 12:14:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 7/7] target/arm: Add CPU properties for most v8.3 PAC
 features
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-8-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222193544.3392713-8-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/22/23 09:35, Aaron Lindsay wrote:
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>   target/arm/cpu.h   |  5 +++
>   target/arm/cpu64.c | 81 ++++++++++++++++++++++++++++++++++++++--------
>   2 files changed, 72 insertions(+), 14 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9c3cbc9a29..40b4631f11 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1039,6 +1039,11 @@ struct ArchCPU {
>        */
>       bool prop_pauth;
>       bool prop_pauth_impdef;
> +    bool prop_pauth_qarma3;
> +    bool prop_pauth_epac;
> +    bool prop_pauth2; // also known as EnhancedPAC2/EPAC2

No c++ comments.

> +    if (cpu->prop_pauth_epac &&
> +            (cpu->prop_pauth2 ||
> +             cpu->prop_pauth_fpac ||
> +             cpu->prop_pauth_fpac_combine)) {

Indentation.

> +        if (address_auth == 0)
> +            address_auth = 0b0001;

Missing braces.

> +static Property arm_cpu_pauth2_property =
> +    DEFINE_PROP_BOOL("pauth2", ARMCPU, prop_pauth2, false);
> +static Property arm_cpu_pauth_fpac_property =
> +    DEFINE_PROP_BOOL("pauth-fpac", ARMCPU, prop_pauth_fpac, false);
> +static Property arm_cpu_pauth_fpac_combine_property =
> +    DEFINE_PROP_BOOL("pauth-fpac-combine", ARMCPU, prop_pauth_fpac_combine, false);

For -cpu max, I would expect these to default on.
Or perhaps not expose these or epac as properties at all.

> @@ -646,6 +694,11 @@ static void aarch64_add_pauth_properties(Object *obj)
>           cpu->prop_pauth = cpu_isar_feature(aa64_pauth, cpu);
>       } else {
>           qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_qarma3_property);
> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_epac_property);
> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth2_property);
> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_fpac_property);
> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_fpac_combine_property);

I think the *only* property that makes sense for KVM is pauth=on/off, which controls if 
KVM exposes the key registers at all (and if off, APA/GPA/etc all get zeroed). There is 
certainly no way to adjust the algorithm exposed by the hardware.

The primary reason we have a property for pauth at all is speed of emulation.  When we 
first enabled qarma5, we saw a major slowdown, with pauth_computepac consuming nearly 50% 
of the entire runtime.  Later we added impdef, as a way of doing *some* testing of pauth 
without the extreme overhead of qarma5.

I see that qarma3 does about half the work of qarma5, so it would be interesting to 
measure the relative speed of the 3 implementations on a boot of kernel + selftests.

You may want to look a the code generated and play with flatten and noinline attributes 
around pauth_computepac and subroutines.  E.g.

static uint64_t __attribute__((flatten, noinline))
pauth_computepac_qarma5(uint64_t data, uint64_t modifier, ARMPACKey key)
{
     return pauth_computepac_architected(data, modifier, key, false);
}

static uint64_t __attribute__((flatten, noinline))
pauth_computepac_qarma3(uint64_t data, uint64_t modifier, ARMPACKey key)
{
     return pauth_computepac_architected(data, modifier, key, true);
}

static uint64_t __attribute__((flatten, noinline))
pauth_computepac_impdef(uint64_t data, uint64_t modifier, ARMPACKey key)
{
     return qemu_xxhash64_4(data, modifier, key.lo, key.hi);
}

static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
                                  uint64_t modifier, ARMPACKey key)
{
     if (cpu_isar_feature(aa64_pauth_arch_qarma5, env_archcpu(env))) {
         return pauth_computepac_qarma5(data, modifier, key);
     } else if (cpu_isar_feature(aa64_pauth_arch_qarma3, env_archcpu(env))) {
         return pauth_computepac_qarma3(data, modifier, key);
     } else {
         return pauth_computepac_impdef(data, modifier, key);
     }
}


r~

