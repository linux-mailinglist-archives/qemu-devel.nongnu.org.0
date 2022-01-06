Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA89486819
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 18:05:30 +0100 (CET)
Received: from localhost ([::1]:53050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5WCe-0006n0-PH
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 12:05:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5W5H-0002I9-Ju
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 11:57:51 -0500
Received: from [2a00:1450:4864:20::333] (port=33344
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5W5F-0000Rl-BL
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 11:57:50 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 az31-20020a05600c601f00b003475c3c3d03so347748wmb.0
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 08:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DiWpVTbQB8LMgHupaDBBXjjcIZsZaVwessQthDQ0hto=;
 b=clSWMJCsubQYkI9ZgqD/GB1zPV7l0SvKClRx5GAHwPZ/s1Hd/EadtcfVBnEYvJ01gl
 Xpd9UU4SLrJpgJCo1RrJN/HqpBf6T9u4+mBJdbzezXBGAEwFkIA+a/v4iPOw0LMfDLo3
 72KYJsvAQ3aud2EhY8TQEpE1zXOQj2Arlmyk/4xliuFWNpIBbJqhi5QO9cMQ24wal/AB
 uJ/XnqasJFnQiIeboaEOHXrvCJGXKYk2NcDnTyNvnJMchvOWgAQ+ZUaP6v4g3HGYVFHE
 gTBoVAsi+AC8+SWGScasL7+kRTAbph7HxKqfPjseeotSntxmX230Ai/JQJsMoW4vA0G+
 M52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DiWpVTbQB8LMgHupaDBBXjjcIZsZaVwessQthDQ0hto=;
 b=P8h/HNCAqZtfA5wNSuDNPkqZaT/1+P7MfhXiL0/M6XF+kQWrJCqynU8Nt1ryX20MNq
 OYDN0iAiae2JgCFXlgVi3vSib3w2lCz9teIelnFnSQbGVVw7L8KYu0FyOdlmXavir4Tt
 Bb7Zo7v1bdbdinhIrJ3zXGiOcLaqw6yK7Uv9IPWPmvIpdLq8V6CgfQ6AOmHTrYhjtzTI
 sUYZXRGCr14AHf+MccjT7V9mg6gOSG7+xZso79BBSvE+pu6oGt9i1LBqPvRk/qUAn8OU
 hLl0uHGsIlRIphwI/+8qx5b4lqwfQ2Vp1HhYsR0zTrFOwFWlcZAfRJDurfLLrUvkpD22
 Uavg==
X-Gm-Message-State: AOAM532sGHy9LxxN0OZ5LoQ/rLwh3HKl95f2kO4omAgBCgjgK+0pl3/i
 bixqTeqgOOFyChADjN4zIHLQ5m6vIr/gr4DadGa9Rg==
X-Google-Smtp-Source: ABdhPJxyhzo7rLHDwPG7j+ilnB8V+YnVyjJ9M/njoXAB3IQTVEY1g0ZCLIj3zonkt5t8gYKvgIb7aDPyatLFnPPRWYE=
X-Received: by 2002:a05:600c:154e:: with SMTP id
 f14mr8145886wmg.126.1641488266021; 
 Thu, 06 Jan 2022 08:57:46 -0800 (PST)
MIME-Version: 1.0
References: <20211216064820.61342-1-bslathi19@gmail.com>
 <20211216064820.61342-2-bslathi19@gmail.com>
In-Reply-To: <20211216064820.61342-2-bslathi19@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 16:57:34 +0000
Message-ID: <CAFEAcA_gy6dbA2X8BsvKkzdnny40hd-OHNYr1+cBFrUuZk8g4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/arm: Implement Cortex-A5
To: Byron Lathi <bslathi19@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bslathi19@gmail.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Dec 2021 at 06:48, Byron Lathi <bslathi19@gmail.com> wrote:
>
> Add support for the Cortex-A5. These changes are based off of the A7 and
> A9 Init functions, using the appropriate values from the technical
> reference manual for the A5.
>
> Signed-off-by: Byron Lathi <bslathi19@gmail.com>
> ---
>  target/arm/cpu_tcg.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 13d0e9b195..2b54fb618b 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -304,6 +304,41 @@ static void cortex_a8_initfn(Object *obj)
>      define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
>  }
>
> +static void cortex_a5_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cpu->dtb_compatible = "arm,cortex-a5";
> +    set_feature(&cpu->env, ARM_FEATURE_V7);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> +    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);

We should avoid using the DUMMY_C15_REGS feature where we
can for new cores. It's a legacy thing where we just RAZ/WI
the whole cp15 crn=15 space. For new CPU definitions we
should define the actual coprocessor registers they have in
this space, typically just as NOP/RAZ registers. You can see
how that's done for the Cortex-A9 with the
cortexa9_cp_reginfo[] array. The A5's registers are slightly
different but they are documented in the TRM:
https://developer.arm.com/documentation/ddi0433/c/system-control/register-summary/c15-summary-table?lang=en

Of those, the CBAR we handle with a feature bit (see below);
the others you can make ARM_CP_NOP for the WO ones and
ARM_CP_CONST with value 0 for the RO and RW ones. Make
sure you get the .access field right: these are all
available only frome secure mode, so should use
.access = PL3_RW / PL3_R / PL3_W for RW/RO/WO.

> +    set_feature(&cpu->env, ARM_FEATURE_PMU);

Missing ARM_FEATURE_EL3.
Missing ARM_FEATURE_CBAR_RO.
Missing ARM_FEATURE_V7MP.

> +    cpu->midr = 0x410fc0f1;

As you note, this is the A9 MIDR. A5 is 0x410fc051.

> +    cpu->reset_fpsid = 0x41023051;
> +    cpu->isar.mvfr0 = 0x10110221;

0x10110222

> +    cpu->isar.mvfr1 = 0x11000011;

0x11111111

These numbers are in the Cortex-A5 NEON Media Processing
Engine TRM:
https://developer.arm.com/documentation/ddi0450/b/Programmers-Model/Register-summary

and indicate the A5's VFPv4 support, among other things.
(QEMU drives its insn enablement off these ID register
values, so if we get them wrong then some guest code that
works on a real A5 will UNDEF on QEMU.)

> +    cpu->ctr = 0x83338003;
> +    cpu->reset_sctlr = 0x00c50078;
> +    cpu->isar.id_pfr0 = 0x00001231;
> +    cpu->isar.id_pfr1 = 0x00000011;
> +    cpu->isar.id_dfr0 = 0x02010444;
> +    cpu->id_afr0 = 0x00000000;
> +    cpu->isar.id_mmfr0 = 0x00100103;

0x00100003

> +    cpu->isar.id_mmfr1 = 0x40000000;
> +    cpu->isar.id_mmfr2 = 0x01230000;
> +    cpu->isar.id_mmfr3 = 0x00102211;
> +    cpu->isar.id_isar0 = 0x00101111;
> +    cpu->isar.id_isar1 = 0x13112111;
> +    cpu->isar.id_isar2 = 0x21232041;
> +    cpu->isar.id_isar3 = 0x11112131;
> +    cpu->isar.id_isar4 = 0x00011142;
> +    cpu->isar.dbgdidr = 0x1203f001;
> +    cpu->clidr = 0x09200003;
> +    cpu->ccsidr[0] = 0x701fe00a;
> +    cpu->ccsidr[1] = 0x203fe00a;

These don't match what the A5 TRM says are valid values for the
CCSIDR fields: specifically the associativity and linesize
fields don't match what the TRM says are the mandated values.
Where did you get your values from?

Following the TRM fields and using 32KB for each would be:

  cpu->ccsidr[0] = 0x701fe019; /* dcache: 32KB 4-way, 8 words/line */
  cpu->ccsidr[1] = 0x203fe009; /* icache: 32KB 2-way, 8 words/line */

> +}
> +
>  static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
>      /*
>       * power_control should be set to maximum latency. Again,
> @@ -1019,6 +1054,7 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
>      { .name = "arm1136",     .initfn = arm1136_initfn },
>      { .name = "arm1176",     .initfn = arm1176_initfn },
>      { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
> +    { .name = "cortex-a5",  .initfn = cortex_a5_initfn },
>      { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
>      { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
>      { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
> --
> 2.30.2
>

thanks
-- PMM

