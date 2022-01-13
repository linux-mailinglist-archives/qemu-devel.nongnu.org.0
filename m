Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65BE48DD63
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 19:03:02 +0100 (CET)
Received: from localhost ([::1]:46330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n84RB-0002ke-HU
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 13:03:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n845w-0004Qm-6u
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:41:06 -0500
Received: from [2a00:1450:4864:20::332] (port=36607
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n845r-0004cE-4H
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:41:01 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so5896628wmk.1
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 09:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dhx67JTqQ3sUY7FVmlpSr4VQxJmi3vvZs+6b//8YAq4=;
 b=EgaAnW5ISvx0UKbzN8bH/+KX9Pp1tagb5X480qq/7dixKV455B2TBGwTajCLMN1Ko3
 rp1tIQhxv3rXuTDplhjbVrS561rChcQKOBizBLM1vo3XOZIdO3q9HgylY6daWEwCHBYU
 rpE+rY/IeoxrAdDev9quGQ2VfSxJVvXspGYURAEXfkKgvdC+BMuYcCNNSV9U/uwsBUOg
 sx8wrsoeTdVGw41sBVKsJ4Lkd4fNPr70z7yNQKFQw/22YCmU7L8725hTmlwItjTkFj9g
 5Hrhs6YdB+Pe7Dqw1B5Y/BDG0X0PM7pvDxbCyR+q94sZsZ/Cm2ye3efAQSXk6cGxihXb
 lgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dhx67JTqQ3sUY7FVmlpSr4VQxJmi3vvZs+6b//8YAq4=;
 b=3Q/1i+xB7/BKTiWTnpNkLlrTO2w2DXlggBYyPCaoQpQ+j1Ccx2ocI+B35fu695WZsY
 fPvngJH8sLTUeqEfsOpV5WxDFNXH/cxu2MeU3LuwrdcPDhtksx89oWDwt/VKQFMKb4xw
 K/9ubzMnKTqu2HSh30qtAUoQpdQhf5FL7HkTrQ1qolmN5nGG5vabAcJdKE2ij4y465+6
 Y9PR4tg31ctjcYBwd/aL6n+fuVmRTUZLuw8xlEzzmEmPy6HmxiAeH7I1OeFHgd5SOY3W
 0C/09ttwsaI5HVYwF2cZscQ/gQS+d7hQTaWch+1cVTY/Pm3oOd+09kEZKMEOgvEl8fta
 jRXg==
X-Gm-Message-State: AOAM5312URPdzXijH8Bw/SgDNAASwMJ7Sfp9mXC6/r2k2uGik3ZcInqh
 8VgQF3vfsM0KLtDCk06lBl7yj0PrS+vfqgHHxRfWUw==
X-Google-Smtp-Source: ABdhPJxSIhkn7PtOq4yHOfBzS0//SZK9MwGjdHTbOwGxpj18c4L0yyMRBdmNUJMu4x/062uVLywVmILRCFz1a9xmz84=
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr4892810wms.32.1642095657521; 
 Thu, 13 Jan 2022 09:40:57 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-9-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-9-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 17:40:46 +0000
Message-ID: <CAFEAcA-ieL5iT5tq4M_D_wAN=aOe9fzAvpFJ7thq6YvaQwqJRg@mail.gmail.com>
Subject: Re: [PATCH 08/30] bsd-user/arm/target_arch_cpu.h: Implement data
 faults
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

On Sun, 9 Jan 2022 at 16:29, Warner Losh <imp@bsdimp.com> wrote:
>
> Update for the richer set of data faults that are now possible. Copied
> largely from linux-user/arm/cpu_loop.c
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_cpu.h | 44 ++++++++++++++++++++++++++--------
>  1 file changed, 34 insertions(+), 10 deletions(-)
>
> diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
> index 996a361e3fe..51e592bcfe7 100644
> --- a/bsd-user/arm/target_arch_cpu.h
> +++ b/bsd-user/arm/target_arch_cpu.h
> @@ -39,8 +39,7 @@ static inline void target_cpu_init(CPUARMState *env,
>
>  static inline void target_cpu_loop(CPUARMState *env)
>  {
> -    int trapnr;
> -    target_siginfo_t info;
> +    int trapnr, si_signo, si_code;
>      unsigned int n;
>      CPUState *cs = env_cpu(env);
>
> @@ -143,15 +142,40 @@ static inline void target_cpu_loop(CPUARMState *env)
>              /* just indicate that signals should be handled asap */
>              break;
>          case EXCP_PREFETCH_ABORT:
> -            /* See arm/arm/trap.c prefetch_abort_handler() */
>          case EXCP_DATA_ABORT:
> -            /* See arm/arm/trap.c data_abort_handler() */
> -            info.si_signo = TARGET_SIGSEGV;
> -            info.si_errno = 0;
> -            /* XXX: check env->error_code */
> -            info.si_code = 0;
> -            info.si_addr = env->exception.vaddress;
> -            queue_signal(env, info.si_signo, &info);
> +            /*
> +             * See arm/arm/trap-v6.c prefetch_abort_handler() and data_abort_handler()
> +             *
> +             * However, FreeBSD maps these to a generic value and then uses that
> +             * to maybe fault in pages in vm/vm_fault.c:vm_fault_trap(). I
> +             * believe that the indirection maps the same as Linux, but haven't
> +             * chased down every single possible indirection.
> +             */
> +
> +            /* For user-only we don't set TTBCR_EAE, so look at the FSR. */
> +            switch (env->exception.fsr & 0x1f) {
> +            case 0x1: /* Alignment */
> +                si_signo = TARGET_SIGBUS;
> +                si_code = TARGET_BUS_ADRALN;
> +                break;
> +            case 0x3: /* Access flag fault, level 1 */
> +            case 0x6: /* Access flag fault, level 2 */
> +            case 0x9: /* Domain fault, level 1 */
> +            case 0xb: /* Domain fault, level 2 */
> +            case 0xd: /* Permision fault, level 1 */
> +            case 0xf: /* Permision fault, level 2 */

"Permission" (I see we have this typo in linux-user).

> +                si_signo = TARGET_SIGSEGV;
> +                si_code = TARGET_SEGV_ACCERR;
> +                break;
> +            case 0x5: /* Translation fault, level 1 */
> +            case 0x7: /* Translation fault, level 2 */
> +                si_signo = TARGET_SIGSEGV;
> +                si_code = TARGET_SEGV_MAPERR;
> +                break;
> +            default:
> +                g_assert_not_reached();
> +            }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

