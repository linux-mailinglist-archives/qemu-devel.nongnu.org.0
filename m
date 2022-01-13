Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722DF48DCE2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:25:56 +0100 (CET)
Received: from localhost ([::1]:45752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83rH-0001ny-0d
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:25:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n83fl-0005rY-As
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:14:03 -0500
Received: from [2a00:1450:4864:20::330] (port=56238
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n83fi-0007gF-6s
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:14:00 -0500
Received: by mail-wm1-x330.google.com with SMTP id c66so4349898wma.5
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 09:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qptX/qO+0dHLr4mRwd+/lzCcgE+jX4z+b2J+1+jmxg8=;
 b=azYnhggdcQSqBvcTZ/TUCu+3jZrVwOgYrj1+19EaNmWOi/LpqMzU9eHkSKTPA9dV5s
 ZPN8nZECFNG9ltN7fTW858/ZZXGdXZ6ki8QdnVN3JIqP4EV3WuiCjYNOl3M6Y85CMMC+
 3QKHJ9qm+hCX4/hNA8SHO2s0CNHOV6jnu3Krm7M6LanW7aO1Z7Z0jmeZ797bNZrKWh/R
 /YfT88XB7uhNtpqS29jmAR+I/5OZq6aVP/ynmNP7ClzKAcobfh7JMKtQ7gs0dLV8PCAe
 Q6KcEKlN+cNuZ2txucl8r3f87JyvZ5eH92JSpP6zhY40LJFmv94HjdndQz9XvPaovM4L
 qKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qptX/qO+0dHLr4mRwd+/lzCcgE+jX4z+b2J+1+jmxg8=;
 b=OJphBGxXpBzOajmepRS245bC74SOK4ZfPHMLpH16JvVcobKg8uMEcG0WcoosocwRHD
 XBXJREgdz4Tn53se4U8JcI5BGUAIO+XK04k8+zKL7JqPSY/x+uQQCoaN0vJ+qwu5p91z
 R1Tuf30Esz8Nlcm+Uyij7Y0royAmljc/E2eDDgw0MFAWdvE8dQEaBHwXhVKGMN4kh7my
 oTmNB8I+1c4ANCKSA63VMFjrtqQl0WJOwMzd7P76Qduk0Yq7a1BQ86HPyQTYSM4VFPee
 2T4tET4YvIbfRQtEqpLBXBdWQo424AJSkRhpcnaM+WgPKn2y29MaRKEH8+0zTaIsk7wL
 wFqg==
X-Gm-Message-State: AOAM531Vla2LJYOxvOw7rWbYCkz3GonVjz5Kf9QzjutnrrY59IsHW2k+
 K7bY9EAp7crvz1TL735wjEVVt1ABVqAHwNaO5MVmFw==
X-Google-Smtp-Source: ABdhPJwcJkCfotYZuZS7bcaGdA7vYbEnxM0NabZrEm2zgp1EYxccuWHCn7it4iBoSM+OPt//WUqP5AdL42fJ2iy+UHo=
X-Received: by 2002:a05:600c:1991:: with SMTP id
 t17mr11925874wmq.21.1642094036584; 
 Thu, 13 Jan 2022 09:13:56 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-6-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-6-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 17:13:45 +0000
Message-ID: <CAFEAcA8T8xXv6+2hJ50oQpob7=7nFTh=sGGhcMxJnPfvZyHM7g@mail.gmail.com>
Subject: Re: [PATCH 05/30] bsd-user/arm/arget_arch_cpu.h: Move EXCP_DEBUG and
 EXCP_BKPT together
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jan 2022 at 16:26, Warner Losh <imp@bsdimp.com> wrote:
>
> Implement EXCP_DEBUG and EXCP_BKPT the same, as is done in
> linux-user. The prior adjustment of register 15 isn't needed, so remove
> that. Remove a redunant comment (that code in FreeBSD never handled
> break points).
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_cpu.h | 23 +++--------------------
>  1 file changed, 3 insertions(+), 20 deletions(-)
>
> diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
> index c526fc73502..05b19ce6119 100644
> --- a/bsd-user/arm/target_arch_cpu.h
> +++ b/bsd-user/arm/target_arch_cpu.h
> @@ -21,6 +21,7 @@
>  #define _TARGET_ARCH_CPU_H_
>
>  #include "target_arch.h"
> +#include "signal-common.h"
>
>  #define TARGET_DEFAULT_CPU_MODEL "any"
>
> @@ -64,19 +65,7 @@ static inline void target_cpu_loop(CPUARMState *env)
>              }
>              break;
>          case EXCP_SWI:
> -        case EXCP_BKPT:
>              {
> -                /*
> -                 * system call
> -                 * See arm/arm/trap.c cpu_fetch_syscall_args()
> -                 */
> -                if (trapnr == EXCP_BKPT) {
> -                    if (env->thumb) {
> -                        env->regs[15] += 2;
> -                    } else {
> -                        env->regs[15] += 4;
> -                    }
> -                }

So the previous code was implementing BKPT as a way to do
a syscall (added in commit 8d450c9a30). Was that just a mistake ?

>                  n = env->regs[7];
>                  if (bsd_type == target_freebsd) {
>                      int ret;
> @@ -171,14 +160,8 @@ static inline void target_cpu_loop(CPUARMState *env)
>              queue_signal(env, info.si_signo, &info);
>              break;
>          case EXCP_DEBUG:
> -            {
> -
> -                info.si_signo = TARGET_SIGTRAP;
> -                info.si_errno = 0;
> -                info.si_code = TARGET_TRAP_BRKPT;
> -                info.si_addr = env->exception.vaddress;
> -                queue_signal(env, info.si_signo, &info);
> -            }
> +        case EXCP_BKPT:
> +            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->regs[15]);
>              break;
>          case EXCP_YIELD:
>              /* nothing to do here for user-mode, just resume guest code */

Looks like it now matches the freebsd kernel behaviour, anyway.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

