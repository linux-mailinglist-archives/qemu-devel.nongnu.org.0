Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241CB16AFF6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 20:07:43 +0100 (CET)
Received: from localhost ([::1]:41182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6J4w-0002eL-8D
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 14:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35303)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j6J46-0002AY-H8
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 14:06:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j6J45-0003Xg-F7
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 14:06:50 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:43740)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j6J41-0003OQ-Tj; Mon, 24 Feb 2020 14:06:46 -0500
Received: by mail-lj1-x243.google.com with SMTP id a13so11331378ljm.10;
 Mon, 24 Feb 2020 11:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vROQhmF37GxxVHdJLrkoLplAKn72rc6FbAjeldPt1/8=;
 b=pgHeKxjg+Hr5hUbhV43A0DUC5jNbD1y4SHU1UuTF+nMdLwMbg04gs5hBeWE+G43eC5
 jJr67Fu3CvFUF0fmKawg4L4dDemS2N8HW6wq5FJTI18dOGUu93BfFqInlVWhcmbQ10EX
 zMAicxLnoXF2+mvbdBvOQ8qvYvtFv2eMHFajh4Lnyq9qsHM1b47kKXmoSX4uJ3bc0Pd1
 6uSrx4nnOPhE7Do9X1Coh+h3wTXsS0N6h+D5cnoCbVivCprS5coYbXqhsJFRqi2ldhc/
 wISyaWzCbSV4aGq2lLcrRIuLn7eret2GKumboZO8eFOuy1NHy3a95oqTkw6B7MeKFJrf
 0Wuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vROQhmF37GxxVHdJLrkoLplAKn72rc6FbAjeldPt1/8=;
 b=gbzTERqCSJBLRvC2qaBdmmOh0m+dbfZ8gEAYVVnyU8bzWu8XQWQoL/jY4hJYDA3UyD
 2Rso8LSvXDazgukLkh3BFifKlcPgVHiVteywL9RkBFTEAgM93vI8QYbyG9FR+u1fu0fX
 KGea51vyCL+fh+8Kb06pVRlNEb+MNhn1jxiYWHPe9WXgGfRGxj07uVEn5tzpypRY4uS9
 QdbsBFhN9TI3MysUIiKUxk+0l6KSjSAlGo99SQ6bqu0X+8cQjjbRWDtWgJBB+0sB69v9
 2sOueqWTT+PocY6CcmJFelOyia+n+lcjwQUdYAxYF5tAjozXQBGhgvhCvZuIBPXSTXUN
 ALtw==
X-Gm-Message-State: APjAAAXM6s74ONIxoehbPR3wVqnBCvlPK00c0awzjapckgzW8xKFAmUN
 DjyDdijJlD2Voubvmz5nNtWY0pySfDNZwWq+3J0=
X-Google-Smtp-Source: APXvYqwd15A+vzRlt+BYQ+c6QIDpepQenvlcH/o4I4gi7fGxqS9IS5izIROp9ywW1/pYutZezWJQNrWdicjc3hKE8sY=
X-Received: by 2002:a2e:b0db:: with SMTP id g27mr30207478ljl.74.1582571204256; 
 Mon, 24 Feb 2020 11:06:44 -0800 (PST)
MIME-Version: 1.0
References: <0c4859f90948ba392da456c9e1daf8fde8f5b22e.1582453384.git.rajnesh.kanwal49@gmail.com>
 <CAC41xo0PWCZw4mrcEfRq9fv+b3mSk9sN0mWhFXPwgdD6LR8xnQ@mail.gmail.com>
In-Reply-To: <CAC41xo0PWCZw4mrcEfRq9fv+b3mSk9sN0mWhFXPwgdD6LR8xnQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Feb 2020 10:59:05 -0800
Message-ID: <CAKmqyKNn8V0yWA8t7dQeMwxcnmywDJoGKag9vQzwFruaygKL7Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: Fix VS mode interrupts forwarding.
To: Jose Martins <josemartins90@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, rajnesh.kanwal49@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 23, 2020 at 11:23 AM Jose Martins <josemartins90@gmail.com> wrote:
>
> Hello rajnesh,
>
> I had already submitted almost this exact patch a few weeks ago.

To QEMU? I don't see the patch.

Alistair

>
> Jose
>
> On Sun, 23 Feb 2020 at 13:51, <rajnesh.kanwal49@gmail.com> wrote:
> >
> > From: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> >
> > Currently riscv_cpu_local_irq_pending is used to find out pending
> > interrupt and VS mode interrupts are being shifted to represent
> > S mode interrupts in this function. So when the cause returned by
> > this function is passed to riscv_cpu_do_interrupt to actually
> > forward the interrupt, the VS mode forwarding check does not work
> > as intended and interrupt is actually forwarded to hypervisor. This
> > patch fixes this issue.
> >
> > Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> > ---
> >  target/riscv/cpu_helper.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index b9e90dfd9a..59535ecba6 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -46,7 +46,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> >      target_ulong pending = env->mip & env->mie &
> >                                 ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
> >      target_ulong vspending = (env->mip & env->mie &
> > -                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)) >> 1;
> > +                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
> >
> >      target_ulong mie    = env->priv < PRV_M ||
> >                            (env->priv == PRV_M && mstatus_mie);
> > @@ -900,6 +900,13 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >
> >              if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1) &&
> >                  !force_hs_execp) {
> > +                /*
> > +                 * See if we need to adjust cause. Yes if its VS mode interrupt
> > +                 * no if hypervisor has delegated one of hs mode's interrupt
> > +                 */
> > +                if (cause == IRQ_VS_TIMER || cause == IRQ_VS_SOFT ||
> > +                    cause == IRQ_VS_EXT)
> > +                    cause = cause - 1;
> >                  /* Trap to VS mode */
> >              } else if (riscv_cpu_virt_enabled(env)) {
> >                  /* Trap into HS mode, from virt */
> > --
> > 2.17.1
> >
> >
>

