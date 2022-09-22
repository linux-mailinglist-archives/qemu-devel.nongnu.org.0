Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEBD5E64E2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:15:05 +0200 (CEST)
Received: from localhost ([::1]:41390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obMym-0005z2-9M
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obM3a-0006ad-6B
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:15:59 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:42950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obM3Y-0001jW-9e
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:15:57 -0400
Received: by mail-ed1-x530.google.com with SMTP id q21so13534840edc.9
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 06:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=aZ3EWszPJbxaz1qjO6jU5azyzkhbCGvDpkvjEOBLZKw=;
 b=ThtpW9yt7OtEUTZpefrUoVMOL6kzvndqG2nyk6VsyzQqS7l7wTGO//Rf6nNpNfGod0
 2D3b9s7ZeQIsAb7RU+4P9aGsQ3K9C6G3/g+rn/UqLzXv8E9VRuWAjs+i1m6VsVfya2c4
 RuyFlB04+kh6+EWGVm29UZbUMUiEnRg9usS/HNqF0sGX6HpHO/Q18bz5lHkwgtIodtHw
 yYR/UslVrPjaPCBqTYNQ3Cqeb5o3fj8oCdCZ3myJF0pVxa6gjR7DRSKf/0oTrD74OFaH
 MAinLBkJqm7il6lnoIeyaWoOXJAtMjfTx7LKvZzXcmE88j3rORMyef7gogJpGxT8eE55
 r3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=aZ3EWszPJbxaz1qjO6jU5azyzkhbCGvDpkvjEOBLZKw=;
 b=SI2FotgzXv3TCXgpN84aebtxfh+55+Qdrzo3IW0zzwZVRwDRg7IJa9CidkmvT/x/1O
 BQYL+nKZKWmZFrh06s5Kz3nqbVGU3vvdh2wAZCe45Z/rRllZeUfG+kXDDR0H7EXJvsSt
 iRcFlQ6nSTpr3GYlOu0aI/LZhGzLSVgcIPjydglOtMiBWW3Pn+7yQtqG19HdbtM74njS
 tgM8RZOhhRjeffiCeilgtP3C3fItr3uFo1LU2Hlr0cyT1AQ7jyG/Q1CRxWlfFOb6YXl5
 vFphGDMLVgqCBFR75hl+bIcH2GmeaBEvFgHISLMt5t3rQVTKrHGulU+NnXnUmgAXvfVP
 oKbA==
X-Gm-Message-State: ACrzQf3diNbKMTDY+fTDrQ9K7VsSETAlnJAL9LAsi+W4L+CRgFFbzZwX
 Qn2BzlHArk3GaGlp8H46HXmsimOKSIQI7O93TRl0ig==
X-Google-Smtp-Source: AMsMyM6zOa/G1fWkp37ACLUZlK2UXbNdhRRyZsvZ5lPi7MmQb48k3+atvM8jNNTZnTTISZVqCnSY3FZ7jubEMy8fwsw=
X-Received: by 2002:a05:6402:847:b0:453:943b:bf4 with SMTP id
 b7-20020a056402084700b00453943b0bf4mr3237276edz.301.1663852554386; Thu, 22
 Sep 2022 06:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220910141213.111154-1-nb91605@student.uni-lj.si>
In-Reply-To: <20220910141213.111154-1-nb91605@student.uni-lj.si>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 14:15:43 +0100
Message-ID: <CAFEAcA8Up7DN1J7hLiXmuWhA-Ni3PKu7pUr=D_fPjqqzuqQMNw@mail.gmail.com>
Subject: Re: [PATCH] arm/monitor: add register name resolution
To: Nikola Brkovic <nb91605@student.uni-lj.si>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 10 Sept 2022 at 15:14, Nikola Brkovic <nb91605@student.uni-lj.si> wrote:
>
> This patch allows the monitor to resolve the
> stack pointer, instruction pointer,
> system status register and FPU status register
> on ARM targets.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1145
>
> Signed-off-by: Nikola Brkovic <nb91605@student.uni-lj.si>
> ---
>  target/arm/monitor.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index 80c64fa355..143c95bca4 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -31,6 +31,7 @@
>  #include "qapi/qmp/qerror.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qom/qom-qobject.h"
> +#include "monitor/hmp-target.h"
>
>  static GICCapability *gic_cap_new(int version)
>  {
> @@ -228,3 +229,31 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>
>      return expansion_info;
>  }
> +
> +static target_long monitor_get_cpsr(Monitor *mon, const struct MonitorDef *md,
> +                                    int val)
> +{
> +    CPUArchState *env = mon_get_cpu_env(mon);
> +    return cpsr_read(env);
> +}
> +
> +const MonitorDef monitor_defs[] = {
> +    { "sp|r13", offsetof(CPUARMState, regs[13])},
> +    { "lr|r14", offsetof(CPUARMState, regs[14])},
> +#ifndef TARGET_AARCH64
> +    { "pc|r15|ip", offsetof(CPUARMState, regs[15]) },
> +#else
> +    { "pc|ip", offsetof(CPUARMState, pc) },
> +#endif
> +
> +    /* State registers */
> +    { "cpsr", 0, &monitor_get_cpsr},
> +    { "fpscr", offsetof(CPUARMState, vfp.fp_status)},

Hi; thanks for this patch. Unfortunately, it doesn't look to
me like it handles the fact that 64-bit vs 32-bit is a runtime
question, not a compile-time one:

(1) if this is a 64-bit CPU executing AArch64 code then we
shouldn't be resolving sp/lr as regs[13] and regs[14]
(2) if this is a 64-bit CPU executing AArch32 code then
we shouldn't be resolving pc/ip as env->pc.

As a more minor bug:
(3) fpscr isn't only in vfp.fp_status, it's more complicated
than that -- you need to call vfp_get_fpscr().

Also, why only these registers ?

As a wider design thing, I'm not really a fan of target_monitor_defs():
it's the kind of quick hack that got added to QEMU decades ago
when we supported about three different target architectures but
which doesn't scale to the set we support now. It would be nicer
to be able to tie this into the existing gdbstub support code for
reading and writing registers. (Though that too has issues with
CPUs which support multiple modes like AArch32 vs AArch64).

thanks
-- PMM

