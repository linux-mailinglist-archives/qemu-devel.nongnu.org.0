Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE11EC72F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Nov 2019 18:03:26 +0100 (CET)
Received: from localhost ([::1]:41546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQaKb-0000ZN-0V
	for lists+qemu-devel@lfdr.de; Fri, 01 Nov 2019 13:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38990)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iQaFl-0006iu-AJ
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 12:58:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iQaFj-0006IF-Gm
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 12:58:25 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:44667)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iQaFj-0006Gw-8Q
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 12:58:23 -0400
Received: by mail-pl1-x643.google.com with SMTP id q16so4622178pll.11
 for <qemu-devel@nongnu.org>; Fri, 01 Nov 2019 09:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=uOYrRkDY3khUuAFGTP/r64pedNO6i230ZypmZvuzB8Q=;
 b=YbXxsXxtT+vdgU8BFLLk38sAk7ImEBz6PeG8uEf4TMkFxenpqjJBBpezKrrGcyuwey
 e6xi7U2odY6MtT61Igu8b8iACrPPXaMyj41MMiFVN8VKckCltejmYW9lmY9/SIXEzcVY
 qkGYHKnrF7xxS7P4mmyAAjhIvk90uMIMfNROo1hCclSSwCidhpurJGuEYJmDIbi8Zjv0
 y3PeZ+rSaEpVNPaAb6hM9xdJJcEz2fgVdOiw6cWy3tptEbDP8UveZ4GBCBWnryxxevJX
 OY2ITlU817XkbeCpaFyZ5prcOvNNi75W0lfxY8chn5Tma1IZHh47eNwCogRRt6XxhwIF
 X4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=uOYrRkDY3khUuAFGTP/r64pedNO6i230ZypmZvuzB8Q=;
 b=ddnXBRUXFvX8pWTSAFITuRt/Hn8XeRISz3oRNjSe30DgEH/IEAwFH17RARaU4IzQwG
 Kw0fh4eYGTKQb/wWnz5XOH4C36+ZjYnUK4WPaWFgDMJMuSTlodvb8F9gj64ZMVgnnSsK
 wx5pR/UwKflK0J++UDFOzGTcssJG/m84vuGkvyWn3Rztz8dn7oWvkAeAYZkIYQQr6GVY
 J6X2Zzutzqqbz1m25RK1Kuz7HiwoQ8PdUwZMtQGbEWJFnH+f1pQp7AZjIlOZwwBHkcca
 HN92Jir+S41Nscvz5a6kxDyBKDmk4pe+I9VosKpAoJ+o4/WdAyO9idlkN5C7SoKlxto8
 5V4w==
X-Gm-Message-State: APjAAAXBuN16g+M3h8Sh5g46RqaNsYhsYdK1c5o1bpgC62pQIV3jJgTj
 ULl1HbHEHcFvKf+FkXKYf35lUQ==
X-Google-Smtp-Source: APXvYqw6M23hM8bAZvhMisIUBnX4TtXkaV3baYJyuOmsW4aXS51YOoo8TxpGw8LnMOulfA7q0A3vsQ==
X-Received: by 2002:a17:902:d70b:: with SMTP id
 w11mr13887744ply.128.1572627501931; 
 Fri, 01 Nov 2019 09:58:21 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r21sm10381321pfc.27.2019.11.01.09.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 09:58:20 -0700 (PDT)
Date: Fri, 01 Nov 2019 09:58:20 -0700 (PDT)
X-Google-Original-Date: Fri, 01 Nov 2019 09:56:43 PDT (-0700)
Subject: Re: [PATCH v1 1/1] target/riscv: Remove atomic accesses to MIP CSR
In-Reply-To: <CAKmqyKP_tv5RTZ00ZEr4jDMy+3+6heWK5LyoTLmnmsbbpCLrqg@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-cb5a7a4a-9bbe-4f27-b2f9-3c69812d1037@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Oct 2019 23:54:30 PDT (-0700), alistair23@gmail.com wrote:
> On Tue, Oct 29, 2019 at 4:14 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Tue, 29 Oct 2019 03:49:23 PDT (-0700), alistair23@gmail.com wrote:
>> > On Fri, Oct 18, 2019 at 7:44 PM Alistair Francis <alistair23@gmail.com> wrote:
>> >>
>> >> On Fri, Oct 18, 2019 at 9:51 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>> >> >
>> >> > On Tue, 08 Oct 2019 15:04:18 PDT (-0700), Alistair Francis wrote:
>> >> > > Instead of relying on atomics to access the MIP register let's update
>> >> > > our helper function to instead just lock the IO mutex thread before
>> >> > > writing. This follows the same concept as used in PPC for handling
>> >> > > interrupts
>> >> > >
>> >> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> >> > > ---
>> >> > >  target/riscv/cpu.c        |  5 ++--
>> >> > >  target/riscv/cpu.h        |  9 --------
>> >> > >  target/riscv/cpu_helper.c | 48 +++++++++++++++------------------------
>> >> > >  target/riscv/csr.c        |  2 +-
>> >> > >  4 files changed, 21 insertions(+), 43 deletions(-)
>> >> > >
>> >> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> >> > > index f13e298a36..e09dd7aa23 100644
>> >> > > --- a/target/riscv/cpu.c
>> >> > > +++ b/target/riscv/cpu.c
>> >> > > @@ -224,8 +224,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>> >> > >  #ifndef CONFIG_USER_ONLY
>> >> > >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
>> >> > >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", env->mstatus);
>> >> > > -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ",
>> >> > > -                 (target_ulong)atomic_read(&env->mip));
>> >> > > +    qemu_fprintf(f, " %s 0x%x\n", "mip     ", env->mip);
>> >> > >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
>> >> > >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mideleg ", env->mideleg);
>> >> > >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "medeleg ", env->medeleg);
>> >> > > @@ -275,7 +274,7 @@ static bool riscv_cpu_has_work(CPUState *cs)
>> >> > >       * Definition of the WFI instruction requires it to ignore the privilege
>> >> > >       * mode and delegation registers, but respect individual enables
>> >> > >       */
>> >> > > -    return (atomic_read(&env->mip) & env->mie) != 0;
>> >> > > +    return (env->mip & env->mie) != 0;
>> >> > >  #else
>> >> > >      return true;
>> >> > >  #endif
>> >> > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> >> > > index 124ed33ee4..a71473b243 100644
>> >> > > --- a/target/riscv/cpu.h
>> >> > > +++ b/target/riscv/cpu.h
>> >> > > @@ -121,15 +121,6 @@ struct CPURISCVState {
>> >> > >      target_ulong mhartid;
>> >> > >      target_ulong mstatus;
>> >> > >
>> >> > > -    /*
>> >> > > -     * CAUTION! Unlike the rest of this struct, mip is accessed asynchonously
>> >> > > -     * by I/O threads. It should be read with atomic_read. It should be updated
>> >> > > -     * using riscv_cpu_update_mip with the iothread mutex held. The iothread
>> >> > > -     * mutex must be held because mip must be consistent with the CPU inturrept
>> >> > > -     * state. riscv_cpu_update_mip calls cpu_interrupt or cpu_reset_interrupt
>> >> > > -     * wuth the invariant that CPU_INTERRUPT_HARD is set iff mip is non-zero.
>> >> > > -     * mip is 32-bits to allow atomic_read on 32-bit hosts.
>> >> > > -     */
>> >> > >      uint32_t mip;
>> >> > >      uint32_t miclaim;
>> >> > >
>> >> > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> >> > > index 87dd6a6ece..4334978c2e 100644
>> >> > > --- a/target/riscv/cpu_helper.c
>> >> > > +++ b/target/riscv/cpu_helper.c
>> >> > > @@ -19,6 +19,7 @@
>> >> > >
>> >> > >  #include "qemu/osdep.h"
>> >> > >  #include "qemu/log.h"
>> >> > > +#include "qemu/main-loop.h"
>> >> > >  #include "cpu.h"
>> >> > >  #include "exec/exec-all.h"
>> >> > >  #include "tcg-op.h"
>> >> > > @@ -38,7 +39,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>> >> > >  {
>> >> > >      target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
>> >> > >      target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
>> >> > > -    target_ulong pending = atomic_read(&env->mip) & env->mie;
>> >> > > +    target_ulong pending = env->mip & env->mie;
>> >> > >      target_ulong mie = env->priv < PRV_M || (env->priv == PRV_M && mstatus_mie);
>> >> > >      target_ulong sie = env->priv < PRV_S || (env->priv == PRV_S && mstatus_sie);
>> >> > >      target_ulong irqs = (pending & ~env->mideleg & -mie) |
>> >> > > @@ -92,42 +93,29 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
>> >> > >      }
>> >> > >  }
>> >> > >
>> >> > > -struct CpuAsyncInfo {
>> >> > > -    uint32_t new_mip;
>> >> > > -};
>> >> > > -
>> >> > > -static void riscv_cpu_update_mip_irqs_async(CPUState *target_cpu_state,
>> >> > > -                                            run_on_cpu_data data)
>> >> > > -{
>> >> > > -    struct CpuAsyncInfo *info = (struct CpuAsyncInfo *) data.host_ptr;
>> >> > > -
>> >> > > -    if (info->new_mip) {
>> >> > > -        cpu_interrupt(target_cpu_state, CPU_INTERRUPT_HARD);
>> >> > > -    } else {
>> >> > > -        cpu_reset_interrupt(target_cpu_state, CPU_INTERRUPT_HARD);
>> >> > > -    }
>> >> > > -
>> >> > > -    g_free(info);
>> >> > > -}
>> >> > > -
>> >> > >  uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
>> >> > >  {
>> >> > >      CPURISCVState *env = &cpu->env;
>> >> > >      CPUState *cs = CPU(cpu);
>> >> > > -    struct CpuAsyncInfo *info;
>> >> > > -    uint32_t old, new, cmp = atomic_read(&env->mip);
>> >> > > +    uint32_t old = env->mip;
>> >> > > +    bool locked = false;
>> >> > > +
>> >> > > +    if (!qemu_mutex_iothread_locked()) {
>> >> > > +        locked = true;
>> >> > > +        qemu_mutex_lock_iothread();
>> >> > > +    }
>> >> >
>> >> > I must be lost here, because I have no idea what this is trying to do.
>> >>
>> >> We lock the QEMU IO Thread before we trigger an interrupt. This way we
>> >> can call it from the PLIC.
>> >
>> > Ping! This missed the latest PR.
>>
>> Sorry, I missed your reply.
>>
>> I really don't think this does that.  For example: if two threads enter this
>> function at the same time, both will see that the lock is not taken and try to
>> take it.  One will succeed and the other will fail, but both will have
>
> That's not what this is doing. This is ensuring that if we enter this
> function with the IO thread lock we won't try to lock it again, if it
> isn't locked we will take the lock. We then also only unlock it if we
> took the lock. This way when we return from the function we didn't
> change the lock state.

Sorry, I didn't realize that iothread_locked was per-thread.  In that case this 
should be fine.

Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>

I'm happy to take this as part of the soft freeze, as it's meant to be a 
non-functional change.

> QEMU will assert() if you try to lock the locked IO thread, this makes
> sure that we don't do that.
>
> Alistair
>
>> 'locked=true' so both will try to unlock.  The first will win, causing the
>> second function to execute for some period without the lock.  Then the second
>> will unlock, possibly defeating another lock somewhere else.
>>
>> It smells kind of like this is trying to be a recursive lock, but those are a
>> whole lot more complicated than this.
>>
>> >
>> > Alistair
>> >
>> >>
>> >> Alistair
>> >>
>> >> >
>> >> > > -    do {
>> >> > > -        old = cmp;
>> >> > > -        new = (old & ~mask) | (value & mask);
>> >> > > -        cmp = atomic_cmpxchg(&env->mip, old, new);
>> >> > > -    } while (old != cmp);
>> >> > > +    env->mip = (env->mip & ~mask) | (value & mask);
>> >> > >
>> >> > > -    info = g_new(struct CpuAsyncInfo, 1);
>> >> > > -    info->new_mip = new;
>> >> > > +    if (env->mip) {
>> >> > > +        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>> >> > > +    } else {
>> >> > > +        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
>> >> > > +    }
>> >> > >
>> >> > > -    async_run_on_cpu(cs, riscv_cpu_update_mip_irqs_async,
>> >> > > -                     RUN_ON_CPU_HOST_PTR(info));
>> >> > > +    if (locked) {
>> >> > > +        qemu_mutex_unlock_iothread();
>> >> > > +    }
>> >> > >
>> >> > >      return old;
>> >> > >  }
>> >> > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> >> > > index f767ad24be..db0cc6ef55 100644
>> >> > > --- a/target/riscv/csr.c
>> >> > > +++ b/target/riscv/csr.c
>> >> > > @@ -579,7 +579,7 @@ static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
>> >> > >      if (mask) {
>> >> > >          old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
>> >> > >      } else {
>> >> > > -        old_mip = atomic_read(&env->mip);
>> >> > > +        old_mip = env->mip;
>> >> > >      }
>> >> > >
>> >> > >      if (ret_value) {

