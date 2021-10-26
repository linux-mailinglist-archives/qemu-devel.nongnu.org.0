Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B3243AC68
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 08:48:28 +0200 (CEST)
Received: from localhost ([::1]:37198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfGG3-00029C-5C
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 02:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFh7-0006xW-Tk; Tue, 26 Oct 2021 02:12:22 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:12127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFh4-0002xe-30; Tue, 26 Oct 2021 02:12:21 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4D0617BB24;
 Tue, 26 Oct 2021 06:12:17 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HdhLT1NQ8z3N9X;
 Tue, 26 Oct 2021 06:12:17 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 1156ED414;
 Tue, 26 Oct 2021 06:12:17 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f176.google.com with SMTP id w8so12529881qts.4;
 Mon, 25 Oct 2021 23:12:17 -0700 (PDT)
X-Gm-Message-State: AOAM533Cyn3ZMOk4DCYgXH6FkLbl8sNHSKEJux+YhmIuwEwMAPaLpxAs
 JD7lI3aPBB8BcApsXhCZjPiZtz6L5HEO5WXfwCk=
X-Google-Smtp-Source: ABdhPJzL7ufmDoK5R85CVYMcfTwozZ8N6gpyekn4Lfk3tkRMGgnzusu1rg1+skcNrPlF/Ffp8hrxR2/aE9fuUWWy74Q=
X-Received: by 2002:ac8:5747:: with SMTP id 7mr22352365qtx.11.1635228736730;
 Mon, 25 Oct 2021 23:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-23-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-23-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 26 Oct 2021 01:12:05 -0500
X-Gmail-Original-Message-ID: <CACNAnaEz4jJHO6WQEo0wK8LK30s45HZaK+QSOHWsSE87WgKQ9w@mail.gmail.com>
Message-ID: <CACNAnaEz4jJHO6WQEo0wK8LK30s45HZaK+QSOHWsSE87WgKQ9w@mail.gmail.com>
Subject: Re: [PATCH 22/24] bsd-user/arm/target_arch_signal.h: arm set_mcontext
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
 Klye Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Move the machine context to the CPU state.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Klye Evans <kevans@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_signal.h | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
> index 302fdc2846..1d051af9ae 100644
> --- a/bsd-user/arm/target_arch_signal.h
> +++ b/bsd-user/arm/target_arch_signal.h
> @@ -201,4 +201,35 @@ static inline abi_long get_mcontext(CPUARMState *regs, target_mcontext_t *mcp,
>      return err;
>  }
>
> +/* Compare to arm/arm/machdep.c set_mcontext() */
> +static inline abi_long set_mcontext(CPUARMState *regs, target_mcontext_t *mcp,
> +        int srflag)
> +{
> +    int err = 0;
> +    const uint32_t *gr = mcp->__gregs;
> +    uint32_t cpsr;
> +
> +    regs->regs[0] = tswap32(gr[TARGET_REG_R0]);
> +    regs->regs[1] = tswap32(gr[TARGET_REG_R1]);
> +    regs->regs[2] = tswap32(gr[TARGET_REG_R2]);
> +    regs->regs[3] = tswap32(gr[TARGET_REG_R3]);
> +    regs->regs[4] = tswap32(gr[TARGET_REG_R4]);
> +    regs->regs[5] = tswap32(gr[TARGET_REG_R5]);
> +    regs->regs[6] = tswap32(gr[TARGET_REG_R6]);
> +    regs->regs[7] = tswap32(gr[TARGET_REG_R7]);
> +    regs->regs[8] = tswap32(gr[TARGET_REG_R8]);
> +    regs->regs[9] = tswap32(gr[TARGET_REG_R9]);
> +    regs->regs[10] = tswap32(gr[TARGET_REG_R10]);
> +    regs->regs[11] = tswap32(gr[TARGET_REG_R11]);
> +    regs->regs[12] = tswap32(gr[TARGET_REG_R12]);
> +
> +    regs->regs[13] = tswap32(gr[TARGET_REG_SP]);
> +    regs->regs[14] = tswap32(gr[TARGET_REG_LR]);
> +    regs->regs[15] = tswap32(gr[TARGET_REG_PC]);
> +    cpsr = tswap32(gr[TARGET_REG_CPSR]);
> +    cpsr_write(regs, cpsr, CPSR_USER | CPSR_EXEC, CPSRWriteByInstr);
> +
> +    return err;
> +}
> +
>  #endif /* !_TARGET_ARCH_SIGNAL_H_ */
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

