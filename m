Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350CC410D1F
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 21:38:07 +0200 (CEST)
Received: from localhost ([::1]:32842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS2da-0004of-8O
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 15:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mS2ax-0001qP-Qp
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 15:35:23 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:40626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mS2aw-0002mY-4f
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 15:35:23 -0400
Received: by mail-il1-x129.google.com with SMTP id a20so16252337ilq.7
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 12:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=A4hciSc9uZI2RbKgDnJpT9KK+WSJmryBo6n54tk/MoI=;
 b=FMyQWN440WA4tLrRWUxMIdNiDb7hs2C87gP34hJHMeMLo660LwznMhJ3kfb6MM9JEE
 fnmEyIaqQVhfnKbhvdn9b8zyJhos4q2URX6JZtDYO8MtPJy2K9tOMFBCojiqPJMKSlqY
 MZPeGIVaJoUpxfGpOeVt76VBawRNktYcGbgTB4Stla9VdkbQl+1gSEGsFvaGy1muh+Mk
 T8Gqq3ofBRmUVWgiJkUIGqh9LmMxbTCSrHceiOJOU5C2wnmc8+9ALBuIDmxNeoCgcPhL
 nbKTd9pvlUbg3fGeg+8B7xtL/w3GxcoOjBKFNkLaHgwMAMaC5vHU0gIb2cPeBOY/DR9n
 C9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=A4hciSc9uZI2RbKgDnJpT9KK+WSJmryBo6n54tk/MoI=;
 b=z48zcOU7wpSkZ1XlSOJhd5G65rUKuhtMXCcA7pqeOOh7bAe14wKizet35q5Uxlv1wl
 nKKg9UlcbQFUCLkNn8W9mGYO2nOcq5dlHke4dFm14BYV2UkB5phtYnu02yXsXQRbIrg3
 fI41I/ENr5rDiI3iHfMgT6DnorohGxIl7gC16jCkWHLKbqastgWFTbkZ9VnNxYKJ05oA
 iXv+RjCw/MqaZ6sCC1iFWGTj04qCe8sJPiQPunldEzOcAUsafcVxNsS1hXGpBsYDbrau
 AoBA1c0dFr98Qon+NWpOktyzsQVkIH5K1T+fK765C3gmUqXQWbP9aSeVC/s85eOLrz0r
 F5ow==
X-Gm-Message-State: AOAM531op0sGcLcSp4zmFHSFIRndWQtPq/Xh8PQlB2ZwKLKTUYhjz1jX
 BzAmSyS2PdwZw8Oj6i7uy7dAEA==
X-Google-Smtp-Source: ABdhPJyXaC5UtOjId2AXT/8gqlvrpIst9QDigHkcCXkTGD4PgxzZonzFxlKoqsOTLh2ooZOmEke5Ag==
X-Received: by 2002:a92:cd8c:: with SMTP id r12mr7859769ilb.164.1632080120991; 
 Sun, 19 Sep 2021 12:35:20 -0700 (PDT)
Received: from macbook.nflx.bsdimp.com
 (50-253-99-174-static.hfc.comcastbusiness.net. [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d12sm7007682iow.16.2021.09.19.12.35.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 Sep 2021 12:35:20 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2 02/41] accel/tcg: Move clear_helper_retaddr to cpu loop
In-Reply-To: <20210918184527.408540-3-richard.henderson@linaro.org>
Date: Sun, 19 Sep 2021 13:35:19 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <A7323840-E40C-4967-8FA5-A873BCC4EA63@gmail.com>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-3-richard.henderson@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=wlosh@bsdimp.com; helo=mail-il1-x129.google.com
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



> On Sep 18, 2021, at 12:44 PM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> Currently there are only two places that require we reset this
> value before exiting to the main loop, but that will change.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> accel/tcg/cpu-exec.c  | 3 ++-
> accel/tcg/user-exec.c | 2 --
> 2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Warner Losh <imp@bsdimp.com>

> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 5fd1ed3422..410588d08a 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -451,6 +451,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
>          * memory.
>          */
> #ifndef CONFIG_SOFTMMU
> +        clear_helper_retaddr();
>         tcg_debug_assert(!have_mmap_lock());
> #endif
>         if (qemu_mutex_iothread_locked()) {
> @@ -460,7 +461,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
>         qemu_plugin_disable_mem_helpers(cpu);
>     }
>=20
> -
>     /*
>      * As we start the exclusive region before codegen we must still
>      * be in the region if we longjump out of either the codegen or
> @@ -905,6 +905,7 @@ int cpu_exec(CPUState *cpu)
> #endif
>=20
> #ifndef CONFIG_SOFTMMU
> +        clear_helper_retaddr();
>         tcg_debug_assert(!have_mmap_lock());
> #endif
>         if (qemu_mutex_iothread_locked()) {
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index cef025d001..e94f1fed00 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -175,7 +175,6 @@ static inline int handle_cpu_signal(uintptr_t pc, =
siginfo_t *info,
>              * currently executing TB was modified and must be exited
>              * immediately.  Clear helper_retaddr for next execution.
>              */
> -            clear_helper_retaddr();
>             cpu_exit_tb_from_sighandler(cpu, old_set);
>             /* NORETURN */
>=20
> @@ -193,7 +192,6 @@ static inline int handle_cpu_signal(uintptr_t pc, =
siginfo_t *info,
>      * an exception.  Undo signal and retaddr state prior to longjmp.
>      */
>     sigprocmask(SIG_SETMASK, old_set, NULL);
> -    clear_helper_retaddr();
>=20
>     cc =3D CPU_GET_CLASS(cpu);
>     cc->tcg_ops->tlb_fill(cpu, address, 0, access_type,
> --=20
> 2.25.1
>=20
>=20


