Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D6643AD02
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 09:17:21 +0200 (CEST)
Received: from localhost ([::1]:34116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfGhz-0003TT-Di
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 03:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFdB-0004dN-J1; Tue, 26 Oct 2021 02:08:17 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:52125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFd9-00020v-58; Tue, 26 Oct 2021 02:08:16 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 54AC37A942;
 Tue, 26 Oct 2021 06:08:13 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HdhFm6n4lz3M3c;
 Tue, 26 Oct 2021 06:08:12 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id C9DCAD404;
 Tue, 26 Oct 2021 06:08:12 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f174.google.com with SMTP id d205so14190517qke.3;
 Mon, 25 Oct 2021 23:08:12 -0700 (PDT)
X-Gm-Message-State: AOAM530HPecZNM4mIr5GGgORAy0ptKRNjP7L9x2rHQSci3fCjWmEH+Wg
 tpCyIziqe9y/ImABiZW015+34Z7dGqbYFU2xsxI=
X-Google-Smtp-Source: ABdhPJzKsiH4GjjsLD7CHCXvSXgdZSay3m7zSWPDOyFhCqrEqLlj8xbzTpaFCMTMmUOtyeF4218UavKeLL6FUZadSe4=
X-Received: by 2002:a05:620a:424f:: with SMTP id
 w15mr17485498qko.258.1635228492523; 
 Mon, 25 Oct 2021 23:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-22-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-22-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 26 Oct 2021 01:08:01 -0500
X-Gmail-Original-Message-ID: <CACNAnaEMPKTs2uc_oqCjTwdgS+66nK0pEK55w9=NS0njS_gFYA@mail.gmail.com>
Message-ID: <CACNAnaEMPKTs2uc_oqCjTwdgS+66nK0pEK55w9=NS0njS_gFYA@mail.gmail.com>
Subject: Re: [PATCH 21/24] bsd-user/arm/target_arch_signal.h: arm get_mcontext
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
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
> Get the machine context from the CPU state.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Klye Evans <kevans@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_signal.h | 38 +++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
> index b421c2522c..302fdc2846 100644
> --- a/bsd-user/arm/target_arch_signal.h
> +++ b/bsd-user/arm/target_arch_signal.h
> @@ -163,4 +163,42 @@ set_sigtramp_args(CPUARMState *regs, int sig, struct target_sigframe *frame,
>      return 0;
>  }
>
> +/*
> + * Compare to arm/arm/machdep.c get_mcontext()
> + * Assumes that the memory is locked if mcp points to user memory.
> + */
> +static inline abi_long get_mcontext(CPUARMState *regs, target_mcontext_t *mcp,
> +        int flags)
> +{
> +    int err = 0;
> +    uint32_t *gr = mcp->__gregs;
> +
> +    gr[TARGET_REG_CPSR] = tswap32(cpsr_read(regs));
> +    if (flags & TARGET_MC_GET_CLEAR_RET) {
> +        gr[TARGET_REG_R0] = 0;
> +        gr[TARGET_REG_CPSR] &= ~CPSR_C;
> +    } else {
> +        gr[TARGET_REG_R0] = tswap32(regs->regs[0]);
> +    }
> +
> +    gr[TARGET_REG_R1] = tswap32(regs->regs[1]);
> +    gr[TARGET_REG_R2] = tswap32(regs->regs[2]);
> +    gr[TARGET_REG_R3] = tswap32(regs->regs[3]);
> +    gr[TARGET_REG_R4] = tswap32(regs->regs[4]);
> +    gr[TARGET_REG_R5] = tswap32(regs->regs[5]);
> +    gr[TARGET_REG_R6] = tswap32(regs->regs[6]);
> +    gr[TARGET_REG_R7] = tswap32(regs->regs[7]);
> +    gr[TARGET_REG_R8] = tswap32(regs->regs[8]);
> +    gr[TARGET_REG_R9] = tswap32(regs->regs[9]);
> +    gr[TARGET_REG_R10] = tswap32(regs->regs[10]);
> +    gr[TARGET_REG_R11] = tswap32(regs->regs[11]);
> +    gr[TARGET_REG_R12] = tswap32(regs->regs[12]);
> +
> +    gr[TARGET_REG_SP] = tswap32(regs->regs[13]);
> +    gr[TARGET_REG_LR] = tswap32(regs->regs[14]);
> +    gr[TARGET_REG_PC] = tswap32(regs->regs[15]);
> +
> +    return err;
> +}
> +
>  #endif /* !_TARGET_ARCH_SIGNAL_H_ */
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

