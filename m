Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D71E410D1E
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 21:36:16 +0200 (CEST)
Received: from localhost ([::1]:57116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS2bm-00021P-JQ
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 15:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mS2a9-0000vc-Hh
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 15:34:33 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:43766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mS2a7-0002CY-CB
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 15:34:33 -0400
Received: by mail-il1-x144.google.com with SMTP id b15so16258216ils.10
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 12:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ezvovchdeXks6F+LIsfj9zMxVivH2Wuiw0KUct7eqCY=;
 b=PJiiZNyvE6XoEpfZO7u8HBbeHSjHdHm8CRY2ysmn5WUfza6+XszTXaSbjkNJ1n/RRq
 FZzANcaG2T4NRjzvoaT62yqORWSAFpChDaG+axn/7RTsjLymP6IMFRPVbnUBy+D5UuqV
 GoxWcvM9JZz7zRrQDR7GZTf61fxhsp/WEkkL0doErDY1j6+xjhNrrRkGsDYR4O4PC2IC
 kvhnt45mSSAQKzWVEx9vceqLwBa8WXoCHmyfVgZPvr6IZgBvsxz6SMR/PVlGEoUEuQ8S
 qXrcIK2u2Hg+VJu9fTCUsBvQz9kQt8yzIdu8nHI8gY+dGiGeWpvrh4oXnRYJbg0sE5ol
 WS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=ezvovchdeXks6F+LIsfj9zMxVivH2Wuiw0KUct7eqCY=;
 b=yFCCVCP5IaMTsImubG+mXFjyJgwy3L/E7Zj2fDW7Ao4z7T+jJ61YZwbPyiDYAv3n3Y
 JLSvACGOb/V+QyFSKf9OCQx5lzduol8ZL+XZWTRa/5NcpTiR6ewvFzHD9OygAQAGGlWl
 9vNzxukl8TpKV34yaCgCYXE8x6Gnr1PTcspLYwkLW+Q2YHvCrw+L0F2C3dMMw7G3SvLT
 LQmhd6kMIHoF27hLHBZCgkuZPyFUujdT45GIdKgOTkyOnCaymlZKh4XGVFv/oTe77IWd
 fnwyX7renTZYRLFidY8ExlwsZsI26/OI+LC8SyarP9VhKzyxd9hVZSxk13BgRe0p/2yZ
 sOcQ==
X-Gm-Message-State: AOAM530/1vkaeUR9OMO8obtTgp+ryUCzo/LfKQVQV+ug2MzLI7Wo2wrt
 H/WmaBLOAgyALVKiDr/gwlu49Q==
X-Google-Smtp-Source: ABdhPJzQ9LzWEzZ2TpSt2wZ5Cr6KWaBY9Pk6/kfkZDIA4V5Crgjtkb77U94lkJJj88QNrQNsPF1EAQ==
X-Received: by 2002:a92:8707:: with SMTP id m7mr14331155ild.177.1632080069537; 
 Sun, 19 Sep 2021 12:34:29 -0700 (PDT)
Received: from macbook.nflx.bsdimp.com
 (50-253-99-174-static.hfc.comcastbusiness.net. [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d12sm7007682iow.16.2021.09.19.12.34.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 Sep 2021 12:34:29 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2 08/41] linux-user/host/ppc: Populate host_signal.h
In-Reply-To: <20210918184527.408540-9-richard.henderson@linaro.org>
Date: Sun, 19 Sep 2021 13:34:28 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <FCAE546B-2629-45E0-969B-131F3A003E4C@gmail.com>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-9-richard.henderson@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::144;
 envelope-from=wlosh@bsdimp.com; helo=mail-il1-x144.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Sep 18, 2021, at 12:44 PM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> Split host_signal_pc and host_signal_write out of user-exec.c.
> Drop the *BSD code, to be re-created under bsd-user/ later.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> linux-user/host/ppc/host-signal.h   | 25 ++++++++-
> linux-user/host/ppc64/host-signal.h |  2 +-
> accel/tcg/user-exec.c               | 79 +----------------------------
> 3 files changed, 26 insertions(+), 80 deletions(-)

This is going to be a little work for me, but I=E2=80=99ll be able to =
snag most of it from
the - lines in this patch. It=E2=80=99s a better structure, to be =
honest, since we were
building user-exec.c for some platforms that never really had bsd-user
and a natural consequence of this patch will stop that.

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/linux-user/host/ppc/host-signal.h =
b/linux-user/host/ppc/host-signal.h
> index f4b4d65031..e09756c691 100644
> --- a/linux-user/host/ppc/host-signal.h
> +++ b/linux-user/host/ppc/host-signal.h
> @@ -1 +1,24 @@
> -#define HOST_SIGNAL_PLACEHOLDER
> +/*
> + * host-signal.h: signal info dependent on the host architecture
> + *
> + * Copyright (C) 2021 Linaro Limited
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef PPC_HOST_SIGNAL_H
> +#define PPC_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.regs->nip;
> +}
> +
> +static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.regs->trap !=3D 0x400
> +        && (uc->uc_mcontext.regs->dsisr & 0x02000000);
> +}
> +
> +#endif
> diff --git a/linux-user/host/ppc64/host-signal.h =
b/linux-user/host/ppc64/host-signal.h
> index f4b4d65031..a353c22a90 100644
> --- a/linux-user/host/ppc64/host-signal.h
> +++ b/linux-user/host/ppc64/host-signal.h
> @@ -1 +1 @@
> -#define HOST_SIGNAL_PLACEHOLDER
> +#include "../ppc/host-signal.h"
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index b5d06183db..e9e530e2e1 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -255,84 +255,7 @@ void *probe_access(CPUArchState *env, =
target_ulong addr, int size,
>     return size ? g2h(env_cpu(env), addr) : NULL;
> }
>=20
> -#if defined(_ARCH_PPC)
> -
> =
-/***********************************************************************
> - * signal context platform-specific definitions
> - * =46rom Wine
> - */
> -#ifdef linux
> -/* All Registers access - only for local access */
> -#define REG_sig(reg_name, context)              \
> -    ((context)->uc_mcontext.regs->reg_name)
> -/* Gpr Registers access  */
> -#define GPR_sig(reg_num, context)              REG_sig(gpr[reg_num], =
context)
> -/* Program counter */
> -#define IAR_sig(context)                       REG_sig(nip, context)
> -/* Machine State Register (Supervisor) */
> -#define MSR_sig(context)                       REG_sig(msr, context)
> -/* Count register */
> -#define CTR_sig(context)                       REG_sig(ctr, context)
> -/* User's integer exception register */
> -#define XER_sig(context)                       REG_sig(xer, context)
> -/* Link register */
> -#define LR_sig(context)                        REG_sig(link, context)
> -/* Condition register */
> -#define CR_sig(context)                        REG_sig(ccr, context)
> -
> -/* Float Registers access  */
> -#define FLOAT_sig(reg_num, context)                                   =
  \
> -    (((double *)((char *)((context)->uc_mcontext.regs + 48 * =
4)))[reg_num])
> -#define FPSCR_sig(context) \
> -    (*(int *)((char *)((context)->uc_mcontext.regs + (48 + 32 * 2) * =
4)))
> -/* Exception Registers access */
> -#define DAR_sig(context)                       REG_sig(dar, context)
> -#define DSISR_sig(context)                     REG_sig(dsisr, =
context)
> -#define TRAP_sig(context)                      REG_sig(trap, context)
> -#endif /* linux */
> -
> -#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
> -#include <ucontext.h>
> -#define IAR_sig(context)               =
((context)->uc_mcontext.mc_srr0)
> -#define MSR_sig(context)               =
((context)->uc_mcontext.mc_srr1)
> -#define CTR_sig(context)               =
((context)->uc_mcontext.mc_ctr)
> -#define XER_sig(context)               =
((context)->uc_mcontext.mc_xer)
> -#define LR_sig(context)                ((context)->uc_mcontext.mc_lr)
> -#define CR_sig(context)                ((context)->uc_mcontext.mc_cr)
> -/* Exception Registers access */
> -#define DAR_sig(context)               =
((context)->uc_mcontext.mc_dar)
> -#define DSISR_sig(context)             =
((context)->uc_mcontext.mc_dsisr)
> -#define TRAP_sig(context)              =
((context)->uc_mcontext.mc_exc)
> -#endif /* __FreeBSD__|| __FreeBSD_kernel__ */
> -
> -int cpu_signal_handler(int host_signum, void *pinfo,
> -                       void *puc)
> -{
> -    siginfo_t *info =3D pinfo;
> -#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
> -    ucontext_t *uc =3D puc;
> -#else
> -    ucontext_t *uc =3D puc;
> -#endif
> -    unsigned long pc;
> -    int is_write;
> -
> -    pc =3D IAR_sig(uc);
> -    is_write =3D 0;
> -#if 0
> -    /* ppc 4xx case */
> -    if (DSISR_sig(uc) & 0x00800000) {
> -        is_write =3D 1;
> -    }
> -#else
> -    if (TRAP_sig(uc) !=3D 0x400 && (DSISR_sig(uc) & 0x02000000)) {
> -        is_write =3D 1;
> -    }
> -#endif
> -    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
> -}
> -
> -#elif defined(__alpha__)
> +#if defined(__alpha__)
>=20
> int cpu_signal_handler(int host_signum, void *pinfo,
>                            void *puc)
> --=20
> 2.25.1
>=20
>=20


