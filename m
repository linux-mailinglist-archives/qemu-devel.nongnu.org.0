Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE8E6ABE3F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 12:34:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ96R-0003HH-OH; Mon, 06 Mar 2023 06:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZ96F-0003Gf-52
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:33:52 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZ96C-0008Ts-L9
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:33:50 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so7378398pjb.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 03:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678102427;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dekmBCFs5J9OoDF3Z8Vg/w4o7AGZapFqDp/kYDBFUbs=;
 b=B8jt4zoRQQTGd1W5/9UIHpe5x/PEo+tWY1abfMqw54K7BsfoaVt8Qy75yHqCAJUOJ9
 6F/Bx2d1CmsiaEjcPcPqV356sBXuz+fNyUJsX3nTKUofgHzXeoXBhLpK/hHqfHSJF6Jo
 vLBAJKaJf19HVgZplI1fYMvfex0/211/C7idEWq9nc4D8TVzgS3Q6DRf9NAH88NSkUsr
 d/0IlR7vZxjO3+pIVxG6ZmbhC+fu9wwNaxXZSCZAIiqGV15nek6eXA3E8P/W6OnrXgaM
 CHQEZ38nBWgoUldP/u7unvSpDx3T06rpUxziCpIsMIo7U0rpn9uS08br0aQepIqwoOqk
 Ry+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678102427;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dekmBCFs5J9OoDF3Z8Vg/w4o7AGZapFqDp/kYDBFUbs=;
 b=oJnhHoFs43TwSOr0IGBa5lBh5GMCBKWbagrd/1UHdu5I/YuyesnF8fywHCXZJyCZva
 YXf0vVYsIbUI4+wFZU+4jXUwO5cqjJhEB09DvFVmuckoHw+5+Mi5LcdwzM5Ll4L6Gnsu
 klVwcV/1FQYdGoA5HZAVciPdfIvCvCNvQvWJ5UoZX01SAg22tuFTu15F/UtPLT1AsUyc
 8bYl/IYuQCk3Gvh5cz+9wG59kWKbIBHbnFM3QLM75OgYqmBOtsNW4ynjUDdhTFwHERTp
 sEC3SiN+Pl6xSs84FKYqEsnOaoTHRfh9LwDFXs7uoVhN65rW+JmV8QLhzE853Lp0+DVb
 kcnQ==
X-Gm-Message-State: AO0yUKUhFoYEWubeRnapPkr+FQAkTMcUID71SgxUS0kh+GGxv/1+H+yv
 9bbScFakW9C38uqzh6NwMpufI7vrP+v7+v6ONxrV4g==
X-Google-Smtp-Source: AK7set+S0Jit5MPQsovj1psuATYyaXesHtMTduh46F1JNDH+fbW0WguOzxctOJ6wkTw2Do5gE9QIqSKFye7UCCYAHYc=
X-Received: by 2002:a17:902:ab05:b0:198:ec76:e249 with SMTP id
 ik5-20020a170902ab0500b00198ec76e249mr4312301plb.13.1678102427155; Mon, 06
 Mar 2023 03:33:47 -0800 (PST)
MIME-Version: 1.0
References: <20230303161518.3411149-1-chenbaozi@phytium.com.cn>
 <20230303161518.3411149-2-chenbaozi@phytium.com.cn>
In-Reply-To: <20230303161518.3411149-2-chenbaozi@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 11:33:36 +0000
Message-ID: <CAFEAcA-Ce4qpLjCmzVjuKmLM-RnNfW4rAtD_xMJPjM8U309S6Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Add Neoverse-N1 registers
To: Chen Baozi <chenbaozi@phytium.com.cn>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 3 Mar 2023 at 16:15, Chen Baozi <chenbaozi@phytium.com.cn> wrote:
>
> Add implementation defined registers for neoverse-n1 which
> would be accessed by TF-A.
>
> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
> ---
>  target/arm/cpu64.c     |  2 ++
>  target/arm/cpu_tcg.c   | 62 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/internals.h |  2 ++
>  3 files changed, 66 insertions(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 4066950da1..a6ae7cafac 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -1094,6 +1094,8 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
>
>      /* From D5.1 AArch64 PMU register summary */
>      cpu->isar.reset_pmcr_el0 = 0x410c3000;
> +
> +    define_neoverse_n1_cp_reginfo(cpu);
>  }
>
>  static void aarch64_host_initfn(Object *obj)
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index df0c45e523..6a1bb56b25 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -150,6 +150,68 @@ void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu)
>  {
>      define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
>  }
> +
> +static const ARMCPRegInfo neoverse_n1_cp_reginfo[] = {
> +    { .name = "ATCR_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 7, .opc2 = 0,
> +      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "ATCR_EL2", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 4, .crn = 15, .crm = 7, .opc2 = 0,
> +      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "ATCR_EL3", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 7, .opc2 = 0,
> +      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "ATCR_EL12", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 5, .crn = 15, .crm = 7, .opc2 = 0,
> +      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "AVTCR_EL2", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 4, .crn = 15, .crm = 7, .opc2 = 1,
> +      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "CPUACTLR_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 0,
> +      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "CPUACTLR2_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 1,
> +      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "CPUACTLR3_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 2,
> +      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "CPUCFR_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 0, .opc2 = 0,
> +      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },

.PL1_R -- this register is read-only.

If we report bit 2 as 1 ("the DSU SCU is not present"), does
TF-A pay attention to that and not try to access the DSU
related registers you define in patch 2 ? If so, it would
probably be nicer to say "no DSU" and not have to define
dummy registers for it...

> +    { .name = "CPUECTLR_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 4,
> +      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0x961563010 },
> +    { .name = "CPUPCR_EL3", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 1,
> +      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "CPUPMR_EL3", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 3,
> +      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "CPUPOR_EL3", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 2,
> +      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "CPUPSELR_EL3", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 0,
> +      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "CPUPWRCTLR_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 7,
> +      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "ERXPFGCDN_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 2,
> +      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },

Shouldn't this be PL1_RW ?

> +    { .name = "ERXPFGCTL_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 1,
> +      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },

Also PL1_RW.

> +    { .name = "ERXPFGF_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 0,
> +      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +};
> +
> +void define_neoverse_n1_cp_reginfo(ARMCPU *cpu)
> +{
> +    define_arm_cp_regs(cpu, neoverse_n1_cp_reginfo);
> +}
>  #endif /* !CONFIG_USER_ONLY */

thanks
-- PMM

