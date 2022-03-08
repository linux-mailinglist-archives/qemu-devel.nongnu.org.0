Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E064D2477
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 23:46:08 +0100 (CET)
Received: from localhost ([::1]:32944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRiak-0001TV-Uc
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 17:46:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nRiYE-0000U7-46
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 17:43:30 -0500
Received: from [2607:f8b0:4864:20::b29] (port=47038
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nRiYC-0004av-33
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 17:43:29 -0500
Received: by mail-yb1-xb29.google.com with SMTP id v130so653290ybe.13
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 14:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=md7kLhrPRaa1BOY+jseqm7DsyRmatKiprgRqclGq0fY=;
 b=gn/SmQj03Lsq5MzFNueZ7NOA+S5PrjvWRw/UPSXZCnfMFhwHiJyAUmvyVcWBXqlL4v
 RpLs3W3S7pVITDOl+i5OJihngws8U+0r370wSY/JBcanLvr50tt0S6bywgXDn3GSkwwz
 9j7xgqQBnADmCNLxDibiKKuNMUD8n9iyue9lE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=md7kLhrPRaa1BOY+jseqm7DsyRmatKiprgRqclGq0fY=;
 b=0BGZdhSfwTwACGQHo0fFNFLW5iofs02zCSjOo6Bjsz/H/cL2DU/x+g+0iUJYsiuHNv
 RiuQQPz1gl9/PuFGe0VCMMq3jF9RtVtseqTTIvt7nS/mEwf6OAWP3Nzp7MXHwtFn6TXF
 ho/OI29t9rq76DBLmR6nI0+0R4UnMMT79qQ+8d2el8zn9RTyg99jzDxNcsicgib49fXw
 VNTPZyrBoIlTBLfkcOf4+jMNEkpLB0FTgFUj/jPv8TE2EOEuNg0K/YbHOqay14ph9ZGV
 GuymzjbIFD9+xf3+2qNOTabv7e3Q/cZzzXw/uZSfxPKEvKSdLfjaj53UWh/uSnXILuqy
 iEWg==
X-Gm-Message-State: AOAM531dRIXmmFDlXsM3/+fkH0nRa1om3p/75FZ+0cMEdHBUitpKSirI
 wiw6ukdEm/FvaDdwh7B649MIxwLTt+Bp+2aeKfXo
X-Google-Smtp-Source: ABdhPJxGZPwDY6qV9lYLrxSW21eRPE2dxEiNDjkeQ0nr+UHu4O/a64JgtcdE3SPqq83yFPhARXFaUxiIoDJHjTipIaI=
X-Received: by 2002:a25:f904:0:b0:628:a84d:a105 with SMTP id
 q4-20020a25f904000000b00628a84da105mr13816931ybe.53.1646779406432; Tue, 08
 Mar 2022 14:43:26 -0800 (PST)
MIME-Version: 1.0
References: <20220304032023.730344-1-atishp@rivosinc.com>
 <20220304032023.730344-2-atishp@rivosinc.com>
 <CAAhSdy2W4aDauH50zS_BNaeghTsDNVMsYHQtkaeydz5Ob-O_SQ@mail.gmail.com>
 <CAKmqyKOLh4bHdRiTj6oMZR36+Wo4mLhEw=8G5US-NUobjWdhCw@mail.gmail.com>
In-Reply-To: <CAKmqyKOLh4bHdRiTj6oMZR36+Wo4mLhEw=8G5US-NUobjWdhCw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 8 Mar 2022 14:43:15 -0800
Message-ID: <CAOnJCUK_XRH4hJAJ-rajnDcNkoHp_7b0EV+=GnerD9VLrwUuSw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] target/riscv: Rename timer & timecmp to mtimer
 and mtimecmp
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>,
 Atish Patra <atishp@rivosinc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 8, 2022 at 1:33 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Mar 4, 2022 at 2:08 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Fri, Mar 4, 2022 at 8:50 AM Atish Patra <atishp@rivosinc.com> wrote:
> > >
> > > Currently, the aclint and ibex timer devices uses the "timer" &
> > > "timecmp" to generate the m-mode timer interrupt. In future,
> > > we will have timer interrupt injected to S/VS mode directly.
> > > No functionality change introduced in this patch.
> >
> > s/have timer/have a timer/
> >
> > >
> > > Add a prefix "m" these enviornment variables to indicate its
> > > true purpose.
> >
> > s/enviornment/environment/
> >
> > >
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> >
> > I suggest we should remove mtimecmp and mtimer from
> > target/riscv because mtimer is a memory mapped device.
>
> I agree. I guess this is in the CPU as it's per hart, and it's easy to
> store here instead of in the timer, but we could convert aclint to use
> an array of timers (Ibex only ever has one hart).
>
> That would probably be a closer match to hardware, as the timer is
> external to the CPU
>

ok sure. I will revise that.

> Alistair
>
> >
> > Regards,
> > Anup
> >
> > > ---
> > >  hw/intc/riscv_aclint.c | 20 ++++++++++----------
> > >  hw/timer/ibex_timer.c  | 14 +++++++-------
> > >  target/riscv/cpu.h     |  4 ++--
> > >  target/riscv/machine.c |  2 +-
> > >  4 files changed, 20 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> > > index f1a5d3d284fd..642794a06865 100644
> > > --- a/hw/intc/riscv_aclint.c
> > > +++ b/hw/intc/riscv_aclint.c
> > > @@ -59,8 +59,8 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
> > >
> > >      uint64_t rtc_r = cpu_riscv_read_rtc(timebase_freq);
> > >
> > > -    cpu->env.timecmp = value;
> > > -    if (cpu->env.timecmp <= rtc_r) {
> > > +    cpu->env.mtimecmp = value;
> > > +    if (cpu->env.mtimecmp <= rtc_r) {
> > >          /*
> > >           * If we're setting an MTIMECMP value in the "past",
> > >           * immediately raise the timer interrupt
> > > @@ -71,7 +71,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
> > >
> > >      /* otherwise, set up the future timer interrupt */
> > >      qemu_irq_lower(mtimer->timer_irqs[hartid - mtimer->hartid_base]);
> > > -    diff = cpu->env.timecmp - rtc_r;
> > > +    diff = cpu->env.mtimecmp - rtc_r;
> > >      /* back to ns (note args switched in muldiv64) */
> > >      uint64_t ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
> > >
> > > @@ -96,7 +96,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
> > >          next = MIN(next, INT64_MAX);
> > >      }
> > >
> > > -    timer_mod(cpu->env.timer, next);
> > > +    timer_mod(cpu->env.mtimer, next);
> > >  }
> > >
> > >  /*
> > > @@ -127,11 +127,11 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
> > >                            "aclint-mtimer: invalid hartid: %zu", hartid);
> > >          } else if ((addr & 0x7) == 0) {
> > >              /* timecmp_lo */
> > > -            uint64_t timecmp = env->timecmp;
> > > +            uint64_t timecmp = env->mtimecmp;
> > >              return timecmp & 0xFFFFFFFF;
> > >          } else if ((addr & 0x7) == 4) {
> > >              /* timecmp_hi */
> > > -            uint64_t timecmp = env->timecmp;
> > > +            uint64_t timecmp = env->mtimecmp;
> > >              return (timecmp >> 32) & 0xFFFFFFFF;
> > >          } else {
> > >              qemu_log_mask(LOG_UNIMP,
> > > @@ -168,14 +168,14 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
> > >                            "aclint-mtimer: invalid hartid: %zu", hartid);
> > >          } else if ((addr & 0x7) == 0) {
> > >              /* timecmp_lo */
> > > -            uint64_t timecmp_hi = env->timecmp >> 32;
> > > +            uint64_t timecmp_hi = env->mtimecmp >> 32;
> > >              riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
> > >                  timecmp_hi << 32 | (value & 0xFFFFFFFF),
> > >                  mtimer->timebase_freq);
> > >              return;
> > >          } else if ((addr & 0x7) == 4) {
> > >              /* timecmp_hi */
> > > -            uint64_t timecmp_lo = env->timecmp;
> > > +            uint64_t timecmp_lo = env->mtimecmp;
> > >              riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
> > >                  value << 32 | (timecmp_lo & 0xFFFFFFFF),
> > >                  mtimer->timebase_freq);
> > > @@ -304,9 +304,9 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
> > >
> > >          cb->s = RISCV_ACLINT_MTIMER(dev);
> > >          cb->num = i;
> > > -        env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > > +        env->mtimer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > >                                    &riscv_aclint_mtimer_cb, cb);
> > > -        env->timecmp = 0;
> > > +        env->mtimecmp = 0;
> > >
> > >          qdev_connect_gpio_out(dev, i,
> > >                                qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_TIMER));
> > > diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
> > > index 8c2ca364daab..4c34f9e08282 100644
> > > --- a/hw/timer/ibex_timer.c
> > > +++ b/hw/timer/ibex_timer.c
> > > @@ -73,9 +73,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
> > >      }
> > >
> > >      /* Update the CPUs mtimecmp */
> > > -    cpu->env.timecmp = value;
> > > +    cpu->env.mtimecmp = value;
> > >
> > > -    if (cpu->env.timecmp <= now) {
> > > +    if (cpu->env.mtimecmp <= now) {
> > >          /*
> > >           * If the mtimecmp was in the past raise the interrupt now.
> > >           */
> > > @@ -91,7 +91,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
> > >      qemu_irq_lower(s->m_timer_irq);
> > >      qemu_set_irq(s->irq, false);
> > >
> > > -    diff = cpu->env.timecmp - now;
> > > +    diff = cpu->env.mtimecmp - now;
> > >      next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> > >                                   muldiv64(diff,
> > >                                            NANOSECONDS_PER_SECOND,
> > > @@ -99,9 +99,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
> > >
> > >      if (next < qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
> > >          /* We overflowed the timer, just set it as large as we can */
> > > -        timer_mod(cpu->env.timer, 0x7FFFFFFFFFFFFFFF);
> > > +        timer_mod(cpu->env.mtimer, 0x7FFFFFFFFFFFFFFF);
> > >      } else {
> > > -        timer_mod(cpu->env.timer, next);
> > > +        timer_mod(cpu->env.mtimer, next);
> > >      }
> > >  }
> > >
> > > @@ -122,9 +122,9 @@ static void ibex_timer_reset(DeviceState *dev)
> > >
> > >      CPUState *cpu = qemu_get_cpu(0);
> > >      CPURISCVState *env = cpu->env_ptr;
> > > -    env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > > +    env->mtimer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > >                                &ibex_timer_cb, s);
> > > -    env->timecmp = 0;
> > > +    env->mtimecmp = 0;
> > >
> > >      s->timer_ctrl = 0x00000000;
> > >      s->timer_cfg0 = 0x00010000;
> > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > index 5d914bd34550..94234c59ffa8 100644
> > > --- a/target/riscv/cpu.h
> > > +++ b/target/riscv/cpu.h
> > > @@ -265,7 +265,7 @@ struct CPURISCVState {
> > >      /* temporary htif regs */
> > >      uint64_t mfromhost;
> > >      uint64_t mtohost;
> > > -    uint64_t timecmp;
> > > +    uint64_t mtimecmp;
> > >
> > >      /* physical memory protection */
> > >      pmp_table_t pmp_state;
> > > @@ -316,7 +316,7 @@ struct CPURISCVState {
> > >      float_status fp_status;
> > >
> > >      /* Fields from here on are preserved across CPU reset. */
> > > -    QEMUTimer *timer; /* Internal timer */
> > > +    QEMUTimer *mtimer; /* Internal timer for M-mode interrupt */
> > >
> > >      hwaddr kernel_addr;
> > >      hwaddr fdt_addr;
> > > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > > index ebc33c9e2781..be3022082a46 100644
> > > --- a/target/riscv/machine.c
> > > +++ b/target/riscv/machine.c
> > > @@ -303,7 +303,7 @@ const VMStateDescription vmstate_riscv_cpu = {
> > >          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
> > >          VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> > >          VMSTATE_UINT64(env.mtohost, RISCVCPU),
> > > -        VMSTATE_UINT64(env.timecmp, RISCVCPU),
> > > +        VMSTATE_UINT64(env.mtimecmp, RISCVCPU),
> > >
> > >          VMSTATE_END_OF_LIST()
> > >      },
> > > --
> > > 2.30.2
> > >
> > >
> >
>


-- 
Regards,
Atish

