Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832E93DA3BA
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 15:17:48 +0200 (CEST)
Received: from localhost ([::1]:59398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95v1-0003A7-KR
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 09:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m95ta-0001lM-BQ
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:16:18 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m95tX-0002dp-Sz
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:16:17 -0400
Received: by mail-ej1-x62f.google.com with SMTP id v21so10690642ejg.1
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 06:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uiZb0cs8f7Evi7waR8GLsbJupEtnxSTCHQXDzgv8Mr0=;
 b=nMODpE1DqqU8SJI06Ce0EQVmqcStAK8SQ1l+TEtp5SSUzXdbLI8RpRn29q2Qt8OieX
 nS0/J8GwfLz6g2yQcQ83CZIP1IEnYgJQm1Mw2/fmNZEyJNkncPf7a+BsqkZSR6XrIN16
 jnJyCLqzmwWiYpds07Vlmp+hSdZWjCDdb4dLTXDIrmAs+3G96nxyMnZwTiaMm+Q4PQtc
 JUJ7kUmenbACCUGmRFadC0sun7JCR2tRpAQgoJFaAAAbtNeYobII5NwKio0zppPb71k4
 Fks91KxuDQBfWBwKJVT56zGIcHa5vMoa2jOMtw1MSOoTIGXPE9K7bXMXcH1gdogkxJeQ
 PeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uiZb0cs8f7Evi7waR8GLsbJupEtnxSTCHQXDzgv8Mr0=;
 b=FBTOC5cJIgEovjQ2RbuRkD/dBkORWUlzc1AfBulzGhZ4ZR4eBpOE5qZXUotQ8cxVVT
 rdkptT4CbIeNZtbaxtHYr6Et/cZCYbquWIcHOcPbC/ZFUcX9zcdSKb0fdH5zB/mv54an
 c2F5PnDuBKFJiI/fbbhD95zeRbXeGf8OU7yJClDeuBhOq/A0+lzT5ROkGMCxpia3zV5K
 OxwmQdYNFvE6HkC01jq6Ta51LJQn45m4rzYa93/KdIcckWRTzIfgV8BAzjErVsUf28mT
 Dk/3i8ZDWPTkKOprSQdpvPTg6uV7yBoVnhGfYFV4aFbGhIbuTFNEiMeOuKkgGhjvgT+U
 tumw==
X-Gm-Message-State: AOAM5329uvT9HjrQRuoo5RgO3d5T0ngvkHpZcFleItCucRdBysl6/pCS
 hI2AiSrGq9yLDMgbndPLLwPrALsBgPNgGX4tWZ79bw==
X-Google-Smtp-Source: ABdhPJxjLAQd/Vb/fq7pI32sbXQIlBFmsd9qnkM9aLH9g5vqQCGWahUQBJuUg/i/qd/+D2EdtHPAT/yj22NYOs+59ZU=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr4670462ejz.250.1627564574404; 
 Thu, 29 Jul 2021 06:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-5-richard.henderson@linaro.org>
In-Reply-To: <20210729004647.282017-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jul 2021 14:15:32 +0100
Message-ID: <CAFEAcA8-H3HUPMFrd1zE38twtwVk8gDav99-50t9=PJP_5UO_g@mail.gmail.com>
Subject: Re: [PATCH for-6.2 04/43] target/hppa: Implement do_unaligned_access
 for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Thu, 29 Jul 2021 at 01:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/hppa/cpu_loop.c | 2 +-
>  target/hppa/cpu.c          | 8 +++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
> index 82d8183821..5ce30fec8b 100644
> --- a/linux-user/hppa/cpu_loop.c
> +++ b/linux-user/hppa/cpu_loop.c
> @@ -161,7 +161,7 @@ void cpu_loop(CPUHPPAState *env)
>          case EXCP_UNALIGN:
>              info.si_signo = TARGET_SIGBUS;
>              info.si_errno = 0;
> -            info.si_code = 0;
> +            info.si_code = TARGET_BUS_ADRALN;
>              info._sifields._sigfault._addr = env->cr[CR_IOR];
>              queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>              break;
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index 2eace4ee12..55c0d81046 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -71,7 +71,6 @@ static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
>      info->print_insn = print_insn_hppa;
>  }
>
> -#ifndef CONFIG_USER_ONLY
>  static void hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>                                           MMUAccessType access_type,
>                                           int mmu_idx, uintptr_t retaddr)
> @@ -80,15 +79,18 @@ static void hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>      CPUHPPAState *env = &cpu->env;
>
>      cs->exception_index = EXCP_UNALIGN;
> +#ifdef CONFIG_USER_ONLY
> +    env->cr[CR_IOR] = addr;

Do we not need the top 32 bits of the address, which the softmmu
version is recording in CR_ISR ?

> +#else
>      if (env->psw & PSW_Q) {
>          /* ??? Needs tweaking for hppa64.  */
>          env->cr[CR_IOR] = addr;
>          env->cr[CR_ISR] = addr >> 32;
>      }
> +#endif
>
>      cpu_loop_exit_restore(cs, retaddr);
>  }
> -#endif /* CONFIG_USER_ONLY */

-- PMM

