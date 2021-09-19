Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD0A410CF9
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 21:00:34 +0200 (CEST)
Received: from localhost ([::1]:40648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS23F-0006Pv-99
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 15:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mS21s-0005j1-P3
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:59:08 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:46075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mS21p-00030A-TC
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:59:08 -0400
Received: by mail-io1-xd31.google.com with SMTP id a22so19217864iok.12
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=sVEgT40WuyXSXQXIJmIXu57mr3X89L89kDe4j/sgmFg=;
 b=jE8wvBPy4IPJYsiEbqHX9Z9Flkb1uC/O/vN73Jz3VoNzcfZTcNXBqV095VgyQXIUbS
 JHAMGjwkrtc3nbRDA/GrQzN+jDuBdRgxU2wrTrZgXNOA44OwX56PvMj1X8PyeRLVmNru
 0Lm+BGmDG6SAisevf1DGgLpHYtzqRw9f8fbmgh8onZkODjsoEB/LPab2ryJ/6gD/wjac
 uHpfcI58VjuXHm2jr5ZGI/Tx8Lu57g/Vk3VmEuvijEr/adBoMFRu2cABvQVfZ9FxkNPv
 CftVP7Ruz27s/lFFmx7Zh43910zmDpC/92YonCnN0z5QnLA2YxzJ70La0QAcjujAYLVr
 YvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=sVEgT40WuyXSXQXIJmIXu57mr3X89L89kDe4j/sgmFg=;
 b=Ar6aaAMYnIkLCEEfJZ6OqGxqSL0xN4oOzspSFT/0SgAcKJdA4gnYqDPhkkdap8XyhD
 3MEnZZyiI3xXCj4o1wUzNJxxf/rzQqnEqSmmY+J7HWNz/fOX7Jsm9do8vRH5817cetF+
 GMTQyMA6U9ysMnImF5mn0TUEiE/qt8rXYhdKYb9CZ+YjD9o9YeTTHcOeV9wI03Km3y1w
 avX2KPOjurlUy5gBEqpNupak+K770PnGNSdIjiIBSu0VCIgvSc24e3bjZNMqTW7u9oir
 Lu2+tPFj4kjMsX7oxnzC/Vbw+51yYrC3RQSK5pUKou78AgQNUaGYrTE0b9c2OoWjIl2n
 rW3w==
X-Gm-Message-State: AOAM530heNhwlJpyd5zSI7wUsYluoJ96Fg0iUWPgUsZDAB2RHn5Mq3J+
 UidGGTNGAEetiNqE+A4OvEMdcA==
X-Google-Smtp-Source: ABdhPJyvGwTYfQSsu93Z4q1xsU1K2FmOzoUhDbnIFnd6C/33kvzl7Fmv7572o2WmQPH62on8djr8tg==
X-Received: by 2002:a05:6602:1696:: with SMTP id
 s22mr16543725iow.198.1632077944417; 
 Sun, 19 Sep 2021 11:59:04 -0700 (PDT)
Received: from macbook.nflx.bsdimp.com
 (50-253-99-174-static.hfc.comcastbusiness.net. [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id g14sm8100297ila.28.2021.09.19.11.59.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:59:03 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2 27/41] target/i386: Implement x86_cpu_record_sigsegv
In-Reply-To: <20210918184527.408540-28-richard.henderson@linaro.org>
Date: Sun, 19 Sep 2021 12:59:02 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <B9D948F4-E743-4630-B43F-E3ABB6C86045@gmail.com>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-28-richard.henderson@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=wlosh@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Sep 18, 2021, at 12:45 PM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> Record cr2, error_code, and exception_index.  That last means
> that we must exit to cpu_loop ourselves, instead of letting
> exception_index being overwritten.
>=20
> Use the maperr parameter to properly set PG_ERROR_P_MASK.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> target/i386/tcg/helper-tcg.h       |  6 ++++++
> target/i386/tcg/tcg-cpu.c          |  3 ++-
> target/i386/tcg/user/excp_helper.c | 23 +++++++++++++++++------
> 3 files changed, 25 insertions(+), 7 deletions(-)


Reviewed by: Warner Losh <imp@bsdimp.com>

I think this encoding is fine, but haven=E2=80=99t thought though how =
I=E2=80=99d implement
this in bsd-user yet=E2=80=A6  I have the signal code queued up, but not =
ready to send
off yet.

> diff --git a/target/i386/tcg/helper-tcg.h =
b/target/i386/tcg/helper-tcg.h
> index 60ca09e95e..0a4401e917 100644
> --- a/target/i386/tcg/helper-tcg.h
> +++ b/target/i386/tcg/helper-tcg.h
> @@ -43,9 +43,15 @@ bool x86_cpu_exec_interrupt(CPUState *cpu, int =
int_req);
> #endif
>=20
> /* helper.c */
> +#ifdef CONFIG_USER_ONLY
> +void x86_cpu_record_sigsegv(CPUState *cs, vaddr addr,
> +                            MMUAccessType access_type,
> +                            bool maperr, uintptr_t ra);
> +#else
> bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                       MMUAccessType access_type, int mmu_idx,
>                       bool probe, uintptr_t retaddr);
> +#endif
>=20
> void breakpoint_handler(CPUState *cs);
>=20
> diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
> index aef050d089..3fab3676b1 100644
> --- a/target/i386/tcg/tcg-cpu.c
> +++ b/target/i386/tcg/tcg-cpu.c
> @@ -77,11 +77,12 @@ static const struct TCGCPUOps x86_tcg_ops =3D {
>     .synchronize_from_tb =3D x86_cpu_synchronize_from_tb,
>     .cpu_exec_enter =3D x86_cpu_exec_enter,
>     .cpu_exec_exit =3D x86_cpu_exec_exit,
> -    .tlb_fill =3D x86_cpu_tlb_fill,
> #ifdef CONFIG_USER_ONLY
>     .fake_user_interrupt =3D x86_cpu_do_interrupt,
> +    .record_sigsegv =3D x86_cpu_record_sigsegv,
> #else
>     .has_work =3D x86_cpu_has_work,
> +    .tlb_fill =3D x86_cpu_tlb_fill,
>     .do_interrupt =3D x86_cpu_do_interrupt,
>     .cpu_exec_interrupt =3D x86_cpu_exec_interrupt,
>     .debug_excp_handler =3D breakpoint_handler,
> diff --git a/target/i386/tcg/user/excp_helper.c =
b/target/i386/tcg/user/excp_helper.c
> index a89b5228fd..cd507e2a1b 100644
> --- a/target/i386/tcg/user/excp_helper.c
> +++ b/target/i386/tcg/user/excp_helper.c
> @@ -22,18 +22,29 @@
> #include "exec/exec-all.h"
> #include "tcg/helper-tcg.h"
>=20
> -bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
> -                      MMUAccessType access_type, int mmu_idx,
> -                      bool probe, uintptr_t retaddr)
> +void x86_cpu_record_sigsegv(CPUState *cs, vaddr addr,
> +                            MMUAccessType access_type,
> +                            bool maperr, uintptr_t ra)
> {
>     X86CPU *cpu =3D X86_CPU(cs);
>     CPUX86State *env =3D &cpu->env;
>=20
> +    /*
> +     * The error_code that hw reports as part of the exception frame
> +     * is copied to linux sigcontext.err.  The exception_index is
> +     * copied to linux sigcontext.trapno.  Short of inventing a new
> +     * place to store the trapno, we cannot let our caller raise the
> +     * signal and set exception_index to EXCP_INTERRUPT.
> +     */
>     env->cr[2] =3D addr;
> -    env->error_code =3D (access_type =3D=3D MMU_DATA_STORE) << =
PG_ERROR_W_BIT;
> -    env->error_code |=3D PG_ERROR_U_MASK;
> +    env->error_code =3D ((access_type =3D=3D MMU_DATA_STORE) << =
PG_ERROR_W_BIT)
> +                    | (maperr ? 0 : PG_ERROR_P_MASK)
> +                    | PG_ERROR_U_MASK;
>     cs->exception_index =3D EXCP0E_PAGE;
> +
> +    /* Disable do_interrupt_user. */
>     env->exception_is_int =3D 0;
>     env->exception_next_eip =3D -1;
> -    cpu_loop_exit_restore(cs, retaddr);
> +
> +    cpu_loop_exit_restore(cs, ra);
> }
> --=20
> 2.25.1
>=20
>=20


