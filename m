Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6265E62E068
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 16:55:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovhDK-0005NV-6w; Thu, 17 Nov 2022 10:54:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ovhDI-0005Mt-Pz
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 10:54:04 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ovhDH-0003WH-2z
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 10:54:04 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 w15-20020a17090a380f00b0021873113cb4so1935348pjb.0
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 07:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rgWdVFzuKo1NHFHh7xaRXaVW9h6FdB/k8sMtVSECDEA=;
 b=CTYobnxJYzxjwWigJpC+1MGSNZE47hTZT7Ynb7Pwyyx1h6hERucNM/RGOSHmCeFZMX
 dpWAkZ4YFT1SigXdg3Hj5ILbVcC0VwlE7SBzCShKsexUN9luvOUfzlyk1u9zY0SLmmvs
 NssmhS25dpgmqOiXyCdNvuT9SpkUzFOMFWqPmLPRlljMdGsbJLvMXFB5Y7CE3aKAi329
 5cSJOFwvlRHg3s9sddOGaobDwgtgmr+0FcbDNsyE4fipwyq7fp7lTTVnjd5UqwKgaRUW
 pDj7bd/sIud76jUrs9hpzqk9MZDFH7138J+GGFrEOyFGu91S7Y/hGc48Wm4oTQg7LwKY
 WwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rgWdVFzuKo1NHFHh7xaRXaVW9h6FdB/k8sMtVSECDEA=;
 b=JgFt7SV3/6PcH0omZOQ5QQGXrfmWkmY9qsJDqWU0KGHbVmhQKDKZ00zLA51+JHKlBw
 jgjs8ar7cVIbs6BLHgrMddnuZhah593WEMLdd9WkwBNGuirsBUUv2j4MzdVh0DywWzNv
 3U5aMGaG/OMmz2QjS8+nZPvr7kTiCUY5QGvqh1On+fbNbGn38eeK1ZjBuvjY7yXzrXT9
 H3XLYFi1o/XY7Oo8kmd0hnZK+3dazbDTVOAlKAhFtuFvSglY2ToqjSSNQCpIvXq8nLQ5
 fgWVC+2Tw6VKy2/mhl5Ns3rEPmAC5OW+0Jk1nZ4K+jHyEZEhS7XtuDYMOFvf14VWcChf
 GaNw==
X-Gm-Message-State: ANoB5plRCTl+uRjqa4eLdSdU5urlzBRB5hK9Cd5ov4TNS6wRtF3PF/H3
 01oNsqhFiTjd6fo/3GNWOpve3oeFZ5kUwEzMZ/DOnw==
X-Google-Smtp-Source: AA0mqf79RR+r9dEHY9Mk+gXt44cb9a/s5WJSa7NrWD8t7lMfgqe16rsSf2MNCHbu9mpi7mW5u7aqLpt18Zcxg124FUI=
X-Received: by 2002:a17:902:b18a:b0:188:5240:50ec with SMTP id
 s10-20020a170902b18a00b00188524050ecmr3187221plr.168.1668700441422; Thu, 17
 Nov 2022 07:54:01 -0800 (PST)
MIME-Version: 1.0
References: <20221110090444.550362-1-tkutergin@gmail.com>
In-Reply-To: <20221110090444.550362-1-tkutergin@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Nov 2022 15:53:49 +0000
Message-ID: <CAFEAcA9yitrE0n1b4Q1_=VaZH-RF0bVPUSTihOKhOFCTidARXg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: added cortex-a55 CPU support for qemu-virt
To: Timofey Kutergin <tkutergin@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 10 Nov 2022 at 09:04, Timofey Kutergin <tkutergin@gmail.com> wrote:
>
>   cortex-a55 is one of newer armv8.2+ CPUs supporting native
>   Privileged Access Never (PAN) feature.

Hi; thanks for this patch. There are a few missing ID register
values below, but otherwise it looks good.

> Using this CPU
>   provides access to this feature without using fictious "max"

"fictitious"

>   CPU.
>
> Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>
> ---
>  hw/arm/virt.c      |  1 +
>  target/arm/cpu64.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b871350856..fc0c9baba6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -201,6 +201,7 @@ static const char *valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a15"),
>      ARM_CPU_TYPE_NAME("cortex-a35"),
>      ARM_CPU_TYPE_NAME("cortex-a53"),
> +    ARM_CPU_TYPE_NAME("cortex-a55"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
>      ARM_CPU_TYPE_NAME("cortex-a76"),

There's a corresponding list of supported CPUs in
docs/system/arm/virt.rst that also needs the new CPU type adding.

> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 3d74f134f5..e1ade1b2a3 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -792,6 +792,60 @@ static void aarch64_a53_initfn(Object *obj)
>      define_cortex_a72_a57_a53_cp_reginfo(cpu);
>  }
>
> +static void aarch64_a55_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cpu->dtb_compatible = "arm,cortex-a55";
> +    set_feature(&cpu->env, ARM_FEATURE_V8);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);

It's helpful for review to order the ID register values in
the same layout they are in the TRM, in the "AArch64 registers
by functional group" table, which is how we've ordered other
new CPUs we've added recently (eg see the Neoverse N1 or
the Cortex-A76).

> +    cpu->midr = 0x411fd050;

There's an r2p0 TRM out, so we might as well advertise
ourselves as r2p0:  0x412FD050

> +    cpu->revidr = 0x00000000;
> +    cpu->reset_fpsid = 0x41034070;
> +    cpu->isar.mvfr0 = 0x10110222;
> +    cpu->isar.mvfr1 = 0x13211111;
> +    cpu->isar.mvfr2 = 0x00000043;
> +    cpu->ctr = 0x84448004; /* L1Ip = VIPT */
> +    cpu->reset_sctlr = 0x00c50838;

Should be 0x30c50838 : bits [29:28] are RES1

> +    cpu->isar.id_pfr0 = 0x10000131;
> +    cpu->isar.id_pfr1 = 0x00011011;

Forgotten id_pfr2: 0x00000011

> +    cpu->isar.id_dfr0 = 0x04010088;
> +    cpu->id_afr0 = 0x00000000;
> +    cpu->isar.id_mmfr0 = 0x10201105;
> +    cpu->isar.id_mmfr1 = 0x40000000;
> +    cpu->isar.id_mmfr2 = 0x01260000;
> +    cpu->isar.id_mmfr3 = 0x02122211;

You've forgotten id_mmfr4 : 0x00021110

> +    cpu->isar.id_isar0 = 0x02101110;
> +    cpu->isar.id_isar1 = 0x13112111;
> +    cpu->isar.id_isar2 = 0x21232042;
> +    cpu->isar.id_isar3 = 0x01112131;
> +    cpu->isar.id_isar4 = 0x00011142;
> +    cpu->isar.id_isar5 = 0x01011121;
> +    cpu->isar.id_isar6 = 0x00000010;
> +    cpu->isar.id_aa64pfr0 = 0x10112222;

You've missed out id_aa64pfr1 : should be 0x0000000000000010ull

> +    cpu->isar.id_aa64dfr0 = 0x10305408;
> +    cpu->isar.id_aa64isar0 = 0x10211120;

You've missed out the DP field: this should be
0x0000100010211120ull

> +    cpu->isar.id_aa64isar1 = 0x00100001;
> +    cpu->isar.id_aa64mmfr0 = 0x00101122;
> +    cpu->isar.id_aa64mmfr1 = 0x10212122;
> +    cpu->isar.id_aa64mmfr2 = 0x00001011;
> +    cpu->isar.dbgdidr = 0x3516d000;
> +    cpu->clidr = 0x82000023;
> +    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
> +    cpu->ccsidr[1] = 0x200fe01a; /* 32KB L1 icache */
> +    cpu->ccsidr[2] = 0x703fe07a; /* 512KB L2 cache */

The A55 TRM says that it has an L3 cache, so I think we
also need to fill in cpu->ccsidr[4] here (NB not [3], which
is a reserved index since the L2 is not split I&D).

> +    cpu->dcz_blocksize = 4; /* 64 bytes */
> +    cpu->gic_num_lrs = 4;
> +    cpu->gic_vpribits = 5;
> +    cpu->gic_vprebits = 5;

You need to set gic_pribits also.

Missing reset_pmcr_el0: 0x41453000

The impdef sysregs are different from A53/A57/A72 etc,
so it's correct that we don't call
define_cortex_a72_a57_a53_cp_reginfo(). We can add definitions
of the impdef sysregs later if guest software runs into them
I guess...

thanks
-- PMM

