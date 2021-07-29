Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894583DA3AC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 15:07:40 +0200 (CEST)
Received: from localhost ([::1]:51754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95lD-0005es-JO
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 09:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m95kI-0004Dd-4F
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:06:42 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:35496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m95kG-0004Z2-DW
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:06:41 -0400
Received: by mail-ej1-x632.google.com with SMTP id o5so10635642ejy.2
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 06:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J6q26A8oDzi1eVCimnqNYmwuCfv6Rkt29HFirajbQ0A=;
 b=Ptp6zk1t5yeZ4vF9r+x4tiEPKQWSDqin6yspvmYLKgigOUHDW9LrzNBsAiVEO6YlY6
 lXdU/5Mb1yYZJookdo/LWQbXxwPOIbrbEg/zX9LlEn1fCpEsfvE29w48htIEfLvwNVFY
 n3Ho7hEqAw2pgWspI+WzDu9to6vAtgSn0RyowzvPsbfgbr/QZFDM8bPeSxc4JsqonzZ4
 unISSQ3QVeJOPCFTf5Oi8JoJcgOtEULOvosITCx79E+f1bkG38xQ5EboLNNFiopvAcbi
 2QM25wXDCRoEZjVpEjYQyqnr33WxGPEOtj65FwwfDj5opkyXFFuq9mv3o8jdTkPuwhYh
 ON3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J6q26A8oDzi1eVCimnqNYmwuCfv6Rkt29HFirajbQ0A=;
 b=eXlX0EnF5UyRG01OZ6htSfKZbgQIEDBh9o33mKl0hKwsICh30/vIHuSiC3UQSlgecd
 pJmioL+L5aGn1QPdXdU/i+Z9YgADBjriilzJrvbLO0W5ivgIwTasjpgUf6C80R420GHZ
 f6XCMiI22QRg/YoX6uasqUXl4EUPAv+ehDtt+ixhwSMFwOzHjoa4hhobQ9IAVJ797g4R
 MxdFu4lGaS7xpomi9Kza55vJh2qb2sYR+hJ9oLaJYV8HB+tR0hB8xnEUEEvrC0CNyl+3
 vQFC/7rwRUZ7H8JDcy4FvnCo9lY1pd6wma6LcQHN4wUSVmFyapHDiAW6Ivv5pSrOM4G2
 FcBA==
X-Gm-Message-State: AOAM530M6PyKHG91TVBHCosf4dSCjW+5BqaRnjV+7lQ88yq2AS4anXpZ
 fkBTbKARdskh5LNN4hV5oKmaOqqp0qBYLD2jWMOgC6hYNkA=
X-Google-Smtp-Source: ABdhPJzQx9km4vsaz81FHLjZZE5rD2CKCtgN3iFWRboKkeG8tpMhuc+0IGU71/vedZputZIe2dTwApngYW3DL6EbUVI=
X-Received: by 2002:a17:907:364:: with SMTP id
 rs4mr4661991ejb.56.1627563998706; 
 Thu, 29 Jul 2021 06:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-3-richard.henderson@linaro.org>
In-Reply-To: <20210729004647.282017-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jul 2021 14:05:56 +0100
Message-ID: <CAFEAcA9pX6qHM66-zcR8G7SpdzAEBxXZUd8dg=fG9-ub6mas3Q@mail.gmail.com>
Subject: Re: [PATCH for-6.2 02/43] target/alpha: Implement do_unaligned_access
 for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 01:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/alpha/cpu.c        | 2 +-
>  target/alpha/mem_helper.c | 8 +++-----
>  2 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 4871ad0c0a..cb7e5261bd 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -220,11 +220,11 @@ static const struct TCGCPUOps alpha_tcg_ops = {
>      .initialize = alpha_translate_init,
>      .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
>      .tlb_fill = alpha_cpu_tlb_fill,
> +    .do_unaligned_access = alpha_cpu_do_unaligned_access,
>
>  #ifndef CONFIG_USER_ONLY
>      .do_interrupt = alpha_cpu_do_interrupt,
>      .do_transaction_failed = alpha_cpu_do_transaction_failed,
> -    .do_unaligned_access = alpha_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
>  };
>
> diff --git a/target/alpha/mem_helper.c b/target/alpha/mem_helper.c
> index 75e72bc337..e3cf98b270 100644
> --- a/target/alpha/mem_helper.c
> +++ b/target/alpha/mem_helper.c
> @@ -23,30 +23,28 @@
>  #include "exec/exec-all.h"
>  #include "exec/cpu_ldst.h"
>
> -/* Softmmu support */
> -#ifndef CONFIG_USER_ONLY
>  void alpha_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>                                     MMUAccessType access_type,
>                                     int mmu_idx, uintptr_t retaddr)
>  {
>      AlphaCPU *cpu = ALPHA_CPU(cs);
>      CPUAlphaState *env = &cpu->env;
> -    uint64_t pc;
>      uint32_t insn;
>
>      cpu_restore_state(cs, retaddr, true);
>
> -    pc = env->pc;
> -    insn = cpu_ldl_code(env, pc);
> +    insn = cpu_ldl_code(env, env->pc);
>
>      env->trap_arg0 = addr;
>      env->trap_arg1 = insn >> 26;                /* opcode */
>      env->trap_arg2 = (insn >> 21) & 31;         /* dest regno */
> +
>      cs->exception_index = EXCP_UNALIGN;
>      env->error_code = 0;
>      cpu_loop_exit(cs);
>  }

The code changes here seem unnecessary ?

Anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

