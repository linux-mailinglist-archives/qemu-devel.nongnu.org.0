Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BD6E8617
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 11:51:07 +0100 (CET)
Received: from localhost ([::1]:54780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPP5e-0000x0-E3
	for lists+qemu-devel@lfdr.de; Tue, 29 Oct 2019 06:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33388)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iPP4T-0007mR-Ju
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 06:49:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iPP4S-0006F9-43
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 06:49:53 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:46952)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iPP4R-0006EB-RQ; Tue, 29 Oct 2019 06:49:52 -0400
Received: by mail-lf1-x143.google.com with SMTP id t8so10113811lfc.13;
 Tue, 29 Oct 2019 03:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6tRMUK9AjTpL0eDCVHY9YXGwvCZ+XOK7o1ibbiFRLso=;
 b=Ych67S04MblOBWisxY38dhkMqTvxVy3Mko+iIIohihRxgf+OYVLI9ybQM1laDSB8h8
 0/1srQAYajNA4bleHztmg6Hj018KLpEs61mhi+KhINCSNu/oA/7SjL34SxFQPpENov9e
 Im1vqnvbAI13imAJWvulER5Ua1i/zo1fxfdzvrE2UpB0r8dmrD3jtMC6nISAdQPwoO+F
 51I+ysYkv4DWcf0s0VbQUFW8uGlnwg+MOpB8pCjAQ0Q0rRBtZAtLeyXCJzp4SbFkzDjD
 DN26B1f2y0sezuw/8C0O8tLNXRoZ9paYLAa/wQXy86BErbIth2NJgGZuKfY1e2ndy1hx
 zpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6tRMUK9AjTpL0eDCVHY9YXGwvCZ+XOK7o1ibbiFRLso=;
 b=I1jw/kEA3Vw2EHwv1yEc3i4SrIlL9cAZDi9HHPiBEtjIPApkRPkhQ9jdwOMNZnfjdo
 Wls0MKvEJRPDo+5OyzzWbMQWD2x7R9uoI9abPrpXcOmRjkFmqFvQvgdCIFdKplf4SkzJ
 E/MWiMTt2YRc6wicqHoJK3ozP4bKgK/L3rMArHCwME1uxJdgzdjL7k+tsXeTCNOvNiWO
 76o5JETejV4Vw50De+qU/uMHnkpgIotdLMr2EKg2tYH4PE0NUylxbfsw3F5CzboWT+Df
 aYbQaAre7T+LxYUt3Sm8QXmVuVq9BmLgNOLAKvIKy9+KhJtjufgLv3C2v2kLS0qn+Jjb
 QjGg==
X-Gm-Message-State: APjAAAVN4LqgJZ077bT+SCkXc9pjqynVz3cPOnahvire+t+mbHW3IyIK
 /7iUHjPMu4F3C0OoqoJAdUzoqiC/bpj1IfRx5oc=
X-Google-Smtp-Source: APXvYqwids/NEX9KL9YUfzeF6QRE4Laz99sCMVzAHK7rVDyrTTpFPT+39+HF0rUztj9TnpMaCH9bGhyGdktxxF1expM=
X-Received: by 2002:ac2:4a8f:: with SMTP id l15mr1970646lfp.5.1572346190264;
 Tue, 29 Oct 2019 03:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <34350af3b53fadc50bfe4f1fbc452c7d3a8fe8f7.1570572202.git.alistair.francis@wdc.com>
 <mhng-55b18e6b-d882-4d24-a4af-2cbecd403a49@palmer-si-x1c4>
 <CAKmqyKPmKc2hhNkVrDgZerXVzyCyrS4WJjMY8fRKf8MNAwmLKg@mail.gmail.com>
In-Reply-To: <CAKmqyKPmKc2hhNkVrDgZerXVzyCyrS4WJjMY8fRKf8MNAwmLKg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 29 Oct 2019 11:49:23 +0100
Message-ID: <CAKmqyKM9kKQxc7ZcSOMciqxBLUf=sWYzGJc98WkiOp3sozgq9g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] target/riscv: Remove atomic accesses to MIP CSR
To: Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 18, 2019 at 7:44 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Oct 18, 2019 at 9:51 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> >
> > On Tue, 08 Oct 2019 15:04:18 PDT (-0700), Alistair Francis wrote:
> > > Instead of relying on atomics to access the MIP register let's update
> > > our helper function to instead just lock the IO mutex thread before
> > > writing. This follows the same concept as used in PPC for handling
> > > interrupts
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  target/riscv/cpu.c        |  5 ++--
> > >  target/riscv/cpu.h        |  9 --------
> > >  target/riscv/cpu_helper.c | 48 +++++++++++++++------------------------
> > >  target/riscv/csr.c        |  2 +-
> > >  4 files changed, 21 insertions(+), 43 deletions(-)
> > >
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index f13e298a36..e09dd7aa23 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -224,8 +224,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> > >  #ifndef CONFIG_USER_ONLY
> > >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
> > >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", env->mstatus);
> > > -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ",
> > > -                 (target_ulong)atomic_read(&env->mip));
> > > +    qemu_fprintf(f, " %s 0x%x\n", "mip     ", env->mip);
> > >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
> > >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mideleg ", env->mideleg);
> > >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "medeleg ", env->medeleg);
> > > @@ -275,7 +274,7 @@ static bool riscv_cpu_has_work(CPUState *cs)
> > >       * Definition of the WFI instruction requires it to ignore the privilege
> > >       * mode and delegation registers, but respect individual enables
> > >       */
> > > -    return (atomic_read(&env->mip) & env->mie) != 0;
> > > +    return (env->mip & env->mie) != 0;
> > >  #else
> > >      return true;
> > >  #endif
> > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > index 124ed33ee4..a71473b243 100644
> > > --- a/target/riscv/cpu.h
> > > +++ b/target/riscv/cpu.h
> > > @@ -121,15 +121,6 @@ struct CPURISCVState {
> > >      target_ulong mhartid;
> > >      target_ulong mstatus;
> > >
> > > -    /*
> > > -     * CAUTION! Unlike the rest of this struct, mip is accessed asynchonously
> > > -     * by I/O threads. It should be read with atomic_read. It should be updated
> > > -     * using riscv_cpu_update_mip with the iothread mutex held. The iothread
> > > -     * mutex must be held because mip must be consistent with the CPU inturrept
> > > -     * state. riscv_cpu_update_mip calls cpu_interrupt or cpu_reset_interrupt
> > > -     * wuth the invariant that CPU_INTERRUPT_HARD is set iff mip is non-zero.
> > > -     * mip is 32-bits to allow atomic_read on 32-bit hosts.
> > > -     */
> > >      uint32_t mip;
> > >      uint32_t miclaim;
> > >
> > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > index 87dd6a6ece..4334978c2e 100644
> > > --- a/target/riscv/cpu_helper.c
> > > +++ b/target/riscv/cpu_helper.c
> > > @@ -19,6 +19,7 @@
> > >
> > >  #include "qemu/osdep.h"
> > >  #include "qemu/log.h"
> > > +#include "qemu/main-loop.h"
> > >  #include "cpu.h"
> > >  #include "exec/exec-all.h"
> > >  #include "tcg-op.h"
> > > @@ -38,7 +39,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> > >  {
> > >      target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
> > >      target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
> > > -    target_ulong pending = atomic_read(&env->mip) & env->mie;
> > > +    target_ulong pending = env->mip & env->mie;
> > >      target_ulong mie = env->priv < PRV_M || (env->priv == PRV_M && mstatus_mie);
> > >      target_ulong sie = env->priv < PRV_S || (env->priv == PRV_S && mstatus_sie);
> > >      target_ulong irqs = (pending & ~env->mideleg & -mie) |
> > > @@ -92,42 +93,29 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
> > >      }
> > >  }
> > >
> > > -struct CpuAsyncInfo {
> > > -    uint32_t new_mip;
> > > -};
> > > -
> > > -static void riscv_cpu_update_mip_irqs_async(CPUState *target_cpu_state,
> > > -                                            run_on_cpu_data data)
> > > -{
> > > -    struct CpuAsyncInfo *info = (struct CpuAsyncInfo *) data.host_ptr;
> > > -
> > > -    if (info->new_mip) {
> > > -        cpu_interrupt(target_cpu_state, CPU_INTERRUPT_HARD);
> > > -    } else {
> > > -        cpu_reset_interrupt(target_cpu_state, CPU_INTERRUPT_HARD);
> > > -    }
> > > -
> > > -    g_free(info);
> > > -}
> > > -
> > >  uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
> > >  {
> > >      CPURISCVState *env = &cpu->env;
> > >      CPUState *cs = CPU(cpu);
> > > -    struct CpuAsyncInfo *info;
> > > -    uint32_t old, new, cmp = atomic_read(&env->mip);
> > > +    uint32_t old = env->mip;
> > > +    bool locked = false;
> > > +
> > > +    if (!qemu_mutex_iothread_locked()) {
> > > +        locked = true;
> > > +        qemu_mutex_lock_iothread();
> > > +    }
> >
> > I must be lost here, because I have no idea what this is trying to do.
>
> We lock the QEMU IO Thread before we trigger an interrupt. This way we
> can call it from the PLIC.

Ping! This missed the latest PR.

Alistair

>
> Alistair
>
> >
> > > -    do {
> > > -        old = cmp;
> > > -        new = (old & ~mask) | (value & mask);
> > > -        cmp = atomic_cmpxchg(&env->mip, old, new);
> > > -    } while (old != cmp);
> > > +    env->mip = (env->mip & ~mask) | (value & mask);
> > >
> > > -    info = g_new(struct CpuAsyncInfo, 1);
> > > -    info->new_mip = new;
> > > +    if (env->mip) {
> > > +        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> > > +    } else {
> > > +        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> > > +    }
> > >
> > > -    async_run_on_cpu(cs, riscv_cpu_update_mip_irqs_async,
> > > -                     RUN_ON_CPU_HOST_PTR(info));
> > > +    if (locked) {
> > > +        qemu_mutex_unlock_iothread();
> > > +    }
> > >
> > >      return old;
> > >  }
> > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > > index f767ad24be..db0cc6ef55 100644
> > > --- a/target/riscv/csr.c
> > > +++ b/target/riscv/csr.c
> > > @@ -579,7 +579,7 @@ static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
> > >      if (mask) {
> > >          old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
> > >      } else {
> > > -        old_mip = atomic_read(&env->mip);
> > > +        old_mip = env->mip;
> > >      }
> > >
> > >      if (ret_value) {

