Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911E539B077
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 04:34:46 +0200 (CEST)
Received: from localhost ([::1]:59774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lozfZ-0001kq-1g
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 22:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lozeh-0000yB-Kf; Thu, 03 Jun 2021 22:33:51 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:37564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lozef-0003hH-2i; Thu, 03 Jun 2021 22:33:51 -0400
Received: by mail-io1-xd31.google.com with SMTP id q7so8523074iob.4;
 Thu, 03 Jun 2021 19:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H7T3Af6HEweov5G8gii3vO79UGQ0O79bUfjjaf3Wfm4=;
 b=kHdNpFp+ao81ZTwqkid9FKdYdEXB7gpLShlfEw6JzrkYOhTWHSYiR8P4fzgQuhQnwe
 bDsZ2quHbwGdBSDmfgoktMT95oY2pIunfKS9GhSFBye2gYdgwRhw8QNV9QImz+PfdJsc
 GLI5bJE12SH+cKHjAUK0RRP1/l9Wt4rVK03NtJ1lpswkZPyMCYneznByp0Laajkoe7Kc
 cchI4RHGlpUpc2t0Rj7wtH26wfI227nhopD5O43ZGE8B90kY9yAu+GjDRqE/dLzs7nFZ
 Vo1cVPma3YC6MkuC4r3vmvDymBGnuTuyHi19w7QhJCMm/vP4Q1cVhPyOFZUSL4t/ahpz
 /N2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H7T3Af6HEweov5G8gii3vO79UGQ0O79bUfjjaf3Wfm4=;
 b=fx9VxNZYpFxIgHk9NNq+rehx86LcLltRp0iwNwZ3wC6YB+SSqNbArA/Flg0h1wrSHi
 jLOxFwUFBzSD+KlEz7wvfE6seMgTWLg9j0mKi1xlP7X9khxaJAek53Pql6h/K0HW2FNG
 ZbzF0bIz8amkihG77GhnxOzNfDEZbNPoCsz7dLUE2zv8J5/CbhAdUr+E4FM59mki9xhj
 9SGtprLnb2tbgxSt7DGpthcxZuRDW58HIZFTVA9QEDx28vi/ZFK2V/4X/4NwqOl0hwzE
 q8j4eZPhT/eJ1r5IHvIHv7Gdh3G+3HxMVBUfUdaEyYG4iab23buWCEem6Mz2u9o6FtLO
 GieA==
X-Gm-Message-State: AOAM531aw9wdaVj5h6pNHYbeLYMzzFzDE9MS+texXdrwYZ20dKnMEwtT
 SpSs1maQ7tyPjdgKTqS/k/QQ/5oeD2O5T5z+3l0=
X-Google-Smtp-Source: ABdhPJwM2PfW6T33aiIHjJjrHVF4QVIHYHTR01nSwimqwxNU8fXOs+S1VkGxT+kfwY8yTKnSGPBsZhefKYg56yV+Sk4=
X-Received: by 2002:a05:6638:635:: with SMTP id
 h21mr1881357jar.135.1622774027160; 
 Thu, 03 Jun 2021 19:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622435529.git.alistair.francis@wdc.com>
 <3a2dd5ce519fb1e66b539cba93750fb5cb706b1a.1622435529.git.alistair.francis@wdc.com>
 <CAEUhbmVnyTEaPjukMEuJp-cUXV_fEQGGzLfH47xkma3r3eh5RQ@mail.gmail.com>
 <CAKmqyKMXoOdnjvNDX2q3EbmLEhXa41s8fVAuWC05X+PfkeOhHg@mail.gmail.com>
 <CAEUhbmUQEoxkjoiAVxuyikdzNumDo40iZQxdTmGRS39Oc4gThQ@mail.gmail.com>
In-Reply-To: <CAEUhbmUQEoxkjoiAVxuyikdzNumDo40iZQxdTmGRS39Oc4gThQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Jun 2021 12:33:20 +1000
Message-ID: <CAKmqyKN0D5_BXjaH+cqNfGhLiQeGAqOzRNpa=rHTF7V3bFtLgA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] hw/timer: Initial commit of Ibex Timer
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 4, 2021 at 12:11 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Jun 4, 2021 at 7:21 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Tue, Jun 1, 2021 at 11:05 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Mon, May 31, 2021 at 12:33 PM Alistair Francis
> > > <alistair.francis@wdc.com> wrote:
> > >
> > > Please write some commit message, for example, what is supported in
> > > this initial version, and what is not.
> >
> > I'll add something.
> >
> > >
> > > >
> > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > >  include/hw/timer/ibex_timer.h |  52 ++++++
> > > >  hw/timer/ibex_timer.c         | 305 ++++++++++++++++++++++++++++++++++
> > > >  MAINTAINERS                   |   6 +-
> > > >  hw/timer/meson.build          |   1 +
> > > >  4 files changed, 360 insertions(+), 4 deletions(-)
> > > >  create mode 100644 include/hw/timer/ibex_timer.h
> > > >  create mode 100644 hw/timer/ibex_timer.c
> > > >
> > > > diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.h
> > > > new file mode 100644
> > > > index 0000000000..6a43537003
> > > > --- /dev/null
> > > > +++ b/include/hw/timer/ibex_timer.h
> > > > @@ -0,0 +1,52 @@
> > > > +/*
> > > > + * QEMU lowRISC Ibex Timer device
> > > > + *
> > > > + * Copyright (c) 2021 Western Digital
> > > > + *
> > > > + * Permission is hereby granted, free of charge, to any person obtaining a copy
> > > > + * of this software and associated documentation files (the "Software"), to deal
> > > > + * in the Software without restriction, including without limitation the rights
> > > > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> > > > + * copies of the Software, and to permit persons to whom the Software is
> > > > + * furnished to do so, subject to the following conditions:
> > > > + *
> > > > + * The above copyright notice and this permission notice shall be included in
> > > > + * all copies or substantial portions of the Software.
> > > > + *
> > > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> > > > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > > > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> > > > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> > > > + * THE SOFTWARE.
> > > > + */
> > > > +
> > > > +#ifndef HW_IBEX_TIMER_H
> > > > +#define HW_IBEX_TIMER_H
> > > > +
> > > > +#include "hw/sysbus.h"
> > > > +
> > > > +#define TYPE_IBEX_TIMER "ibex-timer"
> > > > +OBJECT_DECLARE_SIMPLE_TYPE(IbexTimerState, IBEX_TIMER)
> > > > +
> > > > +struct IbexTimerState {
> > > > +    /* <private> */
> > > > +    SysBusDevice parent_obj;
> > > > +
> > > > +    /* <public> */
> > > > +    MemoryRegion mmio;
> > > > +
> > > > +    uint32_t timer_ctrl;
> > > > +    uint32_t timer_cfg0;
> > > > +    uint32_t timer_compare_lower0;
> > > > +    uint32_t timer_compare_upper0;
> > > > +    uint32_t timer_intr_enable;
> > > > +    uint32_t timer_intr_state;
> > > > +    uint32_t timer_intr_test;
> > > > +
> > > > +    uint32_t timebase_freq;
> > > > +
> > > > +    qemu_irq irq;
> > > > +};
> > > > +#endif /* HW_IBEX_TIMER_H */
> > > > diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
> > > > new file mode 100644
> > > > index 0000000000..0a1030b15f
> > > > --- /dev/null
> > > > +++ b/hw/timer/ibex_timer.c
> > > > @@ -0,0 +1,305 @@
> > > > +/*
> > > > + * QEMU lowRISC Ibex Timer device
> > > > + *
> > > > + * Copyright (c) 2021 Western Digital
> > > > + *
> > > > + * For details check the documentation here:
> > > > + *    https://docs.opentitan.org/hw/ip/rv_timer/doc/
> > > > + *
> > > > + * Permission is hereby granted, free of charge, to any person obtaining a copy
> > > > + * of this software and associated documentation files (the "Software"), to deal
> > > > + * in the Software without restriction, including without limitation the rights
> > > > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> > > > + * copies of the Software, and to permit persons to whom the Software is
> > > > + * furnished to do so, subject to the following conditions:
> > > > + *
> > > > + * The above copyright notice and this permission notice shall be included in
> > > > + * all copies or substantial portions of the Software.
> > > > + *
> > > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> > > > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > > > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> > > > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> > > > + * THE SOFTWARE.
> > > > + */
> > > > +
> > > > +#include "qemu/osdep.h"
> > > > +#include "qemu/log.h"
> > > > +#include "qemu/timer.h"
> > > > +#include "hw/timer/ibex_timer.h"
> > > > +#include "hw/irq.h"
> > > > +#include "hw/qdev-properties.h"
> > > > +#include "target/riscv/cpu.h"
> > > > +#include "migration/vmstate.h"
> > > > +
> > > > +REG32(CTRL, 0x00)
> > > > +    FIELD(CTRL, ACTIVE, 0, 1)
> > > > +REG32(CFG0, 0x100)
> > > > +    FIELD(CFG0, PRESCALE, 0, 12)
> > > > +    FIELD(CFG0, STEP, 16, 8)
> > > > +REG32(LOWER0, 0x104)
> > > > +REG32(UPPER0, 0x108)
> > > > +REG32(COMPARE_LOWER0, 0x10C)
> > > > +REG32(COMPARE_UPPER0, 0x110)
> > > > +REG32(INTR_ENABLE, 0x114)
> > > > +    FIELD(INTR_ENABLE, IE_0, 0, 1)
> > > > +REG32(INTR_STATE, 0x118)
> > > > +    FIELD(INTR_STATE, IS_0, 0, 1)
> > > > +REG32(INTR_TEST, 0x11C)
> > > > +    FIELD(INTR_TEST, T_0, 0, 1)
> > > > +
> > > > +static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
> > > > +{
> > > > +    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> > > > +                    timebase_freq, NANOSECONDS_PER_SECOND);
> > > > +}
> > > > +
> > > > +static void ibex_timer_update_irqs(IbexTimerState *s)
> > > > +{
> > > > +    CPUState *cs = qemu_get_cpu(0);
> > > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > > > +    uint64_t value = s->timer_compare_lower0 |
> > > > +                         ((uint64_t)s->timer_compare_upper0 << 32);
> > > > +    uint64_t next, diff;
> > > > +    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
> > > > +
> > > > +    if (!(s->timer_ctrl & R_CTRL_ACTIVE_MASK)) {
> > > > +        /* Timer isn't active */
> > > > +        return;
> > > > +    }
> > >
> > > I am not sure if compiler can optimize such, but this if block can be
> > > put at the beginning of this function.
> >
> > QEMU's style guide prefers declarations at the start of blocks, so I
> > think we should leave this as is.
> >
> > https://github.com/qemu/qemu/blob/master/docs/devel/style.rst#declarations
> >
> > >
> > > > +
> > > > +    /* Update the CPUs mtimecmp */
> > > > +    cpu->env.timecmp = value;
> > >
> > > The existing env.timecmp seems to be only valid for CLINT. Should we
> > > move it out of env?
> >
> > This is the CLINT equivalent for OpenTitan, so in this case it's the
> > correct use.
> >
> > In saying that as a future improvement it's probably good to move this
> > stuff out of env if we can.
> >
> > >
> > > > +
> > > > +    if (cpu->env.timecmp <= now) {
> > > > +        /*
> > > > +         * If the mtimecmp was in the past raise the interrupt now.
> > > > +         */
> > > > +        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> > > > +        if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
> > > > +            s->timer_intr_state |= R_INTR_STATE_IS_0_MASK;
> > > > +            qemu_set_irq(s->irq, true);
> > > > +        }
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    /* Setup a timer to trigger the interrupt in the future */
> > > > +    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
> > > > +    qemu_set_irq(s->irq, false);
> > > > +
> > > > +    diff = cpu->env.timecmp - now;
> > > > +    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> > > > +                                 muldiv64(diff,
> > > > +                                          NANOSECONDS_PER_SECOND,
> > > > +                                          s->timebase_freq);
> > > > +
> > > > +    if (next < qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
> > > > +        /* We overflowed the timer, just set it as large as we can */
> > > > +        timer_mod(cpu->env.timer, 0x0FFFFFFFFFFFFFFF);
> > >
> > > Should it be 0x7FFFFFFFFFFFFFFF?
> >
> > Yeah, you are right.
> >
> > >
> > > > +    } else {
> > > > +        timer_mod(cpu->env.timer, next);
> > > > +    }
> > > > +}
> > > > +
> > > > +static void ibex_timer_cb(void *opaque)
> > > > +{
> > > > +    IbexTimerState *s = opaque;
> > > > +    CPUState *cs = qemu_get_cpu(0);
> > > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > > > +
> > > > +    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> > > > +    if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
> > > > +        s->timer_intr_state |= R_INTR_STATE_IS_0_MASK;
> > > > +        qemu_set_irq(s->irq, true);
> > > > +    }
> > > > +}
> > > > +
> > > > +static void ibex_timer_reset(DeviceState *dev)
> > > > +{
> > > > +    IbexTimerState *s = IBEX_TIMER(dev);
> > > > +
> > > > +    CPUState *cpu = qemu_get_cpu(0);
> > > > +    CPURISCVState *env = cpu->env_ptr;
> > > > +    env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > > > +                              &ibex_timer_cb, s);
> > > > +    env->timecmp = 0;
> > > > +
> > > > +    s->timer_ctrl = 0x00000000;
> > > > +    s->timer_cfg0 = 0x00000000;
> > > > +    s->timer_compare_lower0 = 0x0000003c;
> > > > +    s->timer_compare_upper0 = 0x00000000;
> > >
> > > The reset values seem not to conform with the spec?
> >
> > You are right! Fixed
> >
> > >
> > > > +    s->timer_intr_enable = 0x00000000;
> > > > +    s->timer_intr_state = 0x00000000;
> > > > +    s->timer_intr_test = 0x00000000;
> > > > +
> > > > +    ibex_timer_update_irqs(s);
> > > > +}
> > > > +
> > > > +static uint64_t ibex_timer_read(void *opaque, hwaddr addr,
> > > > +                                       unsigned int size)
> > > > +{
> > > > +    IbexTimerState *s = opaque;
> > > > +    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
> > > > +    uint64_t retvalue = 0;
> > > > +
> > > > +    switch (addr >> 2) {
> > > > +    case R_CTRL:
> > > > +        retvalue = s->timer_ctrl;
> > > > +        break;
> > > > +    case R_CFG0:
> > > > +        retvalue = s->timer_cfg0;
> > > > +        break;
> > > > +    case R_LOWER0:
> > > > +        retvalue = now;
> > > > +        break;
> > > > +    case R_UPPER0:
> > > > +        retvalue = now >> 32;
> > > > +        break;
> > > > +    case R_COMPARE_LOWER0:
> > > > +        retvalue = s->timer_compare_lower0;
> > > > +        break;
> > > > +    case R_COMPARE_UPPER0:
> > > > +        retvalue = s->timer_compare_upper0;
> > > > +        break;
> > > > +    case R_INTR_ENABLE:
> > > > +        retvalue = s->timer_intr_enable;
> > > > +        break;
> > > > +    case R_INTR_STATE:
> > > > +        retvalue = s->timer_intr_state;
> > > > +        break;
> > > > +    case R_INTR_TEST:
> > > > +        retvalue = s->timer_intr_test;
> > > > +        break;
> > > > +    default:
> > > > +        qemu_log_mask(LOG_GUEST_ERROR,
> > > > +                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
> > > > +        return 0;
> > > > +    }
> > > > +
> > > > +    return retvalue;
> > > > +}
> > > > +
> > > > +static void ibex_timer_write(void *opaque, hwaddr addr,
> > > > +                             uint64_t val64, unsigned int size)
> > > > +{
> > > > +    IbexTimerState *s = opaque;
> > > > +    uint32_t val = val64;
> > > > +
> > > > +    switch (addr >> 2) {
> > > > +    case R_CTRL:
> > > > +        s->timer_ctrl = val;
> > > > +        break;
> > > > +    case R_CFG0:
> > > > +        qemu_log_mask(LOG_UNIMP, "Changing prescale or step not supported");
> > > > +        s->timer_cfg0 = val;
> > > > +        break;
> > > > +    case R_LOWER0:
> > > > +        qemu_log_mask(LOG_UNIMP, "Changing timer value is not supported");
> > > > +        break;
> > > > +    case R_UPPER0:
> > > > +        qemu_log_mask(LOG_UNIMP, "Changing timer value is not supported");
> > > > +        break;
> > > > +    case R_COMPARE_LOWER0:
> > > > +        s->timer_compare_lower0 = val;
> > > > +        ibex_timer_update_irqs(s);
> > > > +        break;
> > > > +    case R_COMPARE_UPPER0:
> > > > +        s->timer_compare_upper0 = val;
> > > > +        ibex_timer_update_irqs(s);
> > > > +        break;
> > > > +    case R_INTR_ENABLE:
> > > > +        s->timer_intr_enable = val;
> > >
> > > Does this register connect to MIE?
> >
> > No, it's a little confusing.
> >
> > The timer is connected to MIE AND it also has its own interrupt. This
> > controls it's custom interrupt.
> >
>
> I don't see codes to connect this to MIE, so in this version we only
> support connecting interrupt to PLIC?

We call `riscv_cpu_update_mip()` which updates the bits in MIP.

Alistair

>
> Regards,
> Bin

