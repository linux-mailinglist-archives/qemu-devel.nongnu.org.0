Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E5D43AD58
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 09:38:14 +0200 (CEST)
Received: from localhost ([::1]:36316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfH2A-0007Zc-2D
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 03:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFfQ-0005rr-RH; Tue, 26 Oct 2021 02:10:37 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:10024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFfM-0002k2-ER; Tue, 26 Oct 2021 02:10:35 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 1769A7B940;
 Tue, 26 Oct 2021 06:10:31 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HdhJQ6yJYz3N20;
 Tue, 26 Oct 2021 06:10:30 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id C5435D131;
 Tue, 26 Oct 2021 06:10:30 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f177.google.com with SMTP id z24so12518218qtv.9;
 Mon, 25 Oct 2021 23:10:30 -0700 (PDT)
X-Gm-Message-State: AOAM531OkIGiDgZnGU8hg1kq0ryyFt7AYGPSrBP/PSHD7wihHzhrn78h
 zsVoqLAtup+SQpIBJmqQfQlntHrJpva2OtfZx2E=
X-Google-Smtp-Source: ABdhPJxcu6W/CJtqTNk2dOa58LZVJsKPolh/dc0ep4mU1kNtbMGGccvhAML+bszqZhNceozr1twQp0EXM/Ir3coPTTI=
X-Received: by 2002:ac8:5846:: with SMTP id h6mr21803557qth.340.1635228630497; 
 Mon, 25 Oct 2021 23:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-21-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-21-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 26 Oct 2021 01:10:19 -0500
X-Gmail-Original-Message-ID: <CACNAnaEesBu1n-7nk_CH3wtN-pqED_=X9vk8u6EW2GtapErBag@mail.gmail.com>
Message-ID: <CACNAnaEesBu1n-7nk_CH3wtN-pqED_=X9vk8u6EW2GtapErBag@mail.gmail.com>
Subject: Re: [PATCH 20/24] bsd-user/arm/target_arch_signal.h: arm
 set_sigtramp_args
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@freebsd.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Implement set_sigtramp_args to setup the arguments to the sigtramp
> calls.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_signal.h | 35 +++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
> index 67355ff28f..b421c2522c 100644
> --- a/bsd-user/arm/target_arch_signal.h
> +++ b/bsd-user/arm/target_arch_signal.h
> @@ -128,4 +128,39 @@ struct target_trapframe {
>      abi_ulong tf_pc;
>  };
>
> +/*
> + * Compare to arm/arm/machdep.c sendsig()
> + * Assumes that target stack frame memory is locked.
> + */
> +static inline abi_long
> +set_sigtramp_args(CPUARMState *regs, int sig, struct target_sigframe *frame,
> +    abi_ulong frame_addr, struct target_sigaction *ka)
> +{
> +    /*
> +     * Arguments to signal handler:
> +     *  r0 = signal number
> +     *  r1 = siginfo pointer
> +     *  r2 = ucontext pointer
> +     *  r5 = ucontext pointer
> +     *  pc = signal handler pointer
> +     *  sp = sigframe struct pointer
> +     *  lr = sigtramp at base of user stack
> +     */
> +
> +    regs->regs[0] = sig;
> +    regs->regs[1] = frame_addr +
> +        offsetof(struct target_sigframe, sf_si);
> +    regs->regs[2] = frame_addr +
> +        offsetof(struct target_sigframe, sf_uc);
> +
> +    /* the trampoline uses r5 as the uc address */
> +    regs->regs[5] = frame_addr +
> +        offsetof(struct target_sigframe, sf_uc);
> +    regs->regs[TARGET_REG_PC] = ka->_sa_handler;
> +    regs->regs[TARGET_REG_SP] = frame_addr;
> +    regs->regs[TARGET_REG_LR] = TARGET_PS_STRINGS - TARGET_SZSIGCODE;
> +
> +    return 0;
> +}
> +
>  #endif /* !_TARGET_ARCH_SIGNAL_H_ */
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

