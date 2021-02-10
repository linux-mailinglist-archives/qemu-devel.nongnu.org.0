Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1549C317153
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 21:27:07 +0100 (CET)
Received: from localhost ([::1]:38344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9w4o-0008BW-6q
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 15:27:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1l9w39-0007Yf-IE
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 15:25:24 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:44409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1l9w37-0002NU-Bt
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 15:25:23 -0500
Received: by mail-io1-xd34.google.com with SMTP id p132so3308769iod.11
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 12:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V28eZbJ8yy9Fc+52BiN8k3moE8pllQE8dv3HilwKYI4=;
 b=iKX6x0k4PuP6daxyCCCI/wsO1v8Way8oxZLZNrivB0R66x7VGCRuGwhb0hJ8wZqGUZ
 VIZhl6QRR6nipYCqapkMdP8b+wsbTCp8WKtDoKma5aN3F2qrN/i3DDnchyocLwn+RVvZ
 f17P3EK+MEaM0D7ELmOOp0k+WTH8PnauGjpIDJ9ImRcujwTy4QUP0juHvgLWtLkvPfZk
 BX1FvbWG/N3sZp0GWNIdX7BMM9c/xc2WXjF1X2cjHbTLdNqibFJrtGllq+qo44RbrFWM
 W2VbvgqYvU9zG6SmK4kvMfr/jSHLCeL2U3TozXD3q+1g+tp2ISnXSjrKZRWvBnggEojD
 H6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V28eZbJ8yy9Fc+52BiN8k3moE8pllQE8dv3HilwKYI4=;
 b=X+I3fiBlLSkT8JDWwLqhaSqdxfNLA9XKiMRQoYeRdHDBAWD1TBqlxfmXhwDsAX35Od
 gSczKAFFa+g5vwXFxTqyxdSgjElgyi6ooqdBeKDI7dCWxM+AqSyC1iZHbpjo4CIxM2B+
 wOB7qglyGNNskHU549DOm6ToazGqyrtsqyLf8LQOh1PjeJ7xZDGFRx/nM8uTDDdFdDhT
 R637DVwfSSOOxNLlW+7BX1VAuOQ+w9GI7Vs+GAu6Z26xVrnNEs6qqAxlnSQqGC6RZlMg
 BnSilj/E+9OD1VaicAnjVbNWz2V7LgoEbkwFDxZsd7TQdHqN0XyLJVHbkiX1xSSZHjT6
 L9XA==
X-Gm-Message-State: AOAM531PlIyGmnWyu9Aj/f55mf7dQDObaOF7IH2Rj5uLl4b+w69Hfu9B
 /BXlBrCw+WTUJlN9vKw3lVPQJozGj6Gr8Avag8kHKg==
X-Google-Smtp-Source: ABdhPJy7ArAN22AThDQ0txmB9F4YPXmf5a5XPoo+JFYhxEJhcJ16cDekgcFpvg1XuZK/f7005otgjgzCmO1l7WkD738=
X-Received: by 2002:a02:708a:: with SMTP id f132mr5293359jac.62.1612988718699; 
 Wed, 10 Feb 2021 12:25:18 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-10-agraf@csgraf.de>
 <CAFEAcA_KFzEERYJ9d8YbPjhCv1rt9O9w567xP=ECqixLie5nmQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_KFzEERYJ9d8YbPjhCv1rt9O9w567xP=ECqixLie5nmQ@mail.gmail.com>
From: Peter Collingbourne <pcc@google.com>
Date: Wed, 10 Feb 2021 12:25:07 -0800
Message-ID: <CAMn1gO4p4CDH7qVhNnTpOeo_q98iYBHgS2LLSe26q-3SQJX1Xg@mail.gmail.com>
Subject: Re: [PATCH v6 09/11] arm/hvf: Add a WFI handler
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alexander Graf <agraf@csgraf.de>, QEMU Developers <qemu-devel@nongnu.org>, 
 qemu-arm <qemu-arm@nongnu.org>, Cameron Esfahani <dirty@apple.com>, 
 Roman Bolshakov <r.bolshakov@yadro.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, Frank Yang <lfy@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=pcc@google.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 28, 2021 at 8:25 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
> >
> > From: Peter Collingbourne <pcc@google.com>
> >
> > Sleep on WFI until the VTIMER is due but allow ourselves to be woken
> > up on IPI.
> >
> > In this implementation IPI is blocked on the CPU thread at startup and
> > pselect() is used to atomically unblock the signal and begin sleeping.
> > The signal is sent unconditionally so there's no need to worry about
> > races between actually sleeping and the "we think we're sleeping"
> > state. It may lead to an extra wakeup but that's better than missing
> > it entirely.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > [agraf: Remove unused 'set' variable, always advance PC on WFX trap]
> > Signed-off-by: Alexander Graf <agraf@csgraf.de>
> > Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > ---
> >  accel/hvf/hvf-cpus.c     |  5 ++--
> >  include/sysemu/hvf_int.h |  1 +
> >  target/arm/hvf/hvf.c     | 56 ++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 59 insertions(+), 3 deletions(-)
> >
> > diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
> > index 6d70ee742e..abef6a58f7 100644
> > --- a/accel/hvf/hvf-cpus.c
> > +++ b/accel/hvf/hvf-cpus.c
> > @@ -322,15 +322,14 @@ static int hvf_init_vcpu(CPUState *cpu)
> >      cpu->hvf = g_malloc0(sizeof(*cpu->hvf));
> >
> >      /* init cpu signals */
> > -    sigset_t set;
> >      struct sigaction sigact;
> >
> >      memset(&sigact, 0, sizeof(sigact));
> >      sigact.sa_handler = dummy_signal;
> >      sigaction(SIG_IPI, &sigact, NULL);
> >
> > -    pthread_sigmask(SIG_BLOCK, NULL, &set);
> > -    sigdelset(&set, SIG_IPI);
> > +    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->unblock_ipi_mask);
> > +    sigdelset(&cpu->hvf->unblock_ipi_mask, SIG_IPI);
> >
> >  #ifdef __aarch64__
> >      r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
> > diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
> > index c2ac6c8f97..7a397fe85a 100644
> > --- a/include/sysemu/hvf_int.h
> > +++ b/include/sysemu/hvf_int.h
> > @@ -51,6 +51,7 @@ extern HVFState *hvf_state;
> >  struct hvf_vcpu_state {
> >      uint64_t fd;
> >      void *exit;
> > +    sigset_t unblock_ipi_mask;
> >  };
> >
> >  void assert_hvf_ok(hv_return_t ret);
> > diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> > index 8f18efe856..f0850ab14a 100644
> > --- a/target/arm/hvf/hvf.c
> > +++ b/target/arm/hvf/hvf.c
> > @@ -2,6 +2,7 @@
> >   * QEMU Hypervisor.framework support for Apple Silicon
> >
> >   * Copyright 2020 Alexander Graf <agraf@csgraf.de>
> > + * Copyright 2020 Google LLC
> >   *
> >   * This work is licensed under the terms of the GNU GPL, version 2 or later.
> >   * See the COPYING file in the top-level directory.
> > @@ -17,6 +18,8 @@
> >  #include "sysemu/hvf_int.h"
> >  #include "sysemu/hw_accel.h"
> >
> > +#include <mach/mach_time.h>
> > +
> >  #include "exec/address-spaces.h"
> >  #include "hw/irq.h"
> >  #include "qemu/main-loop.h"
> > @@ -411,6 +414,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
> >
> >  void hvf_kick_vcpu_thread(CPUState *cpu)
> >  {
> > +    cpus_kick_thread(cpu);
> >      hv_vcpus_exit(&cpu->hvf->fd, 1);
> >  }
> >
> > @@ -466,6 +470,18 @@ static int hvf_inject_interrupts(CPUState *cpu)
> >      return 0;
> >  }
> >
> > +static void hvf_wait_for_ipi(CPUState *cpu, struct timespec *ts)
> > +{
> > +    /*
> > +     * Use pselect to sleep so that other threads can IPI us while we're
> > +     * sleeping.
> > +     */
> > +    qatomic_mb_set(&cpu->thread_kicked, false);
> > +    qemu_mutex_unlock_iothread();
> > +    pselect(0, 0, 0, 0, ts, &cpu->hvf->unblock_ipi_mask);
> > +    qemu_mutex_lock_iothread();
> > +}
>
> It seems a bit odd that this is specific to Arm hvf.
> Doesn't x86 hvf need "pause until interrupt" functionality ?

I'm not very familiar with x86 HVF (and I don't have an x86 Mac to
test with), but my reading of the x86 HVF code is that there appear to
be no exits that put the system to sleep (not even MWAIT which I think
is the x86 equivalent of WFI -- the code just appears to busy loop). I
think that implies that either we actually busy loop on x86 (seems
unlikely to me since I guess someone would have noticed by now) or
MWAIT does not actually result in a VM exit, and HVF itself goes to
sleep inside hv_vcpu_run(), unlike ARM HVF where WFI results in an
exit (and immediate re-entering would otherwise busy loop).

> > +
> >  int hvf_vcpu_exec(CPUState *cpu)
> >  {
> >      ARMCPU *arm_cpu = ARM_CPU(cpu);
> > @@ -577,6 +593,46 @@ int hvf_vcpu_exec(CPUState *cpu)
> >          }
> >          case EC_WFX_TRAP:
> >              advance_pc = true;
> > +            if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_request &
> > +                (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
> > +
> > +                uint64_t ctl;
> > +                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0,
> > +                                        &ctl);
> > +                assert_hvf_ok(r);
> > +
> > +                if (!(ctl & 1) || (ctl & 2)) {
> > +                    /* Timer disabled or masked, just wait for an IPI. */
> > +                    hvf_wait_for_ipi(cpu, NULL);
> > +                    break;
> > +                }
> > +
> > +                uint64_t cval;
> > +                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0,
> > +                                        &cval);
> > +                assert_hvf_ok(r);
> > +
> > +                int64_t ticks_to_sleep = cval - mach_absolute_time();
> > +                if (ticks_to_sleep < 0) {
> > +                    break;
> > +                }
> > +
> > +                uint64_t seconds = ticks_to_sleep / arm_cpu->gt_cntfrq_hz;
> > +                uint64_t nanos =
> > +                    (ticks_to_sleep - arm_cpu->gt_cntfrq_hz * seconds) *
> > +                    1000000000 / arm_cpu->gt_cntfrq_hz;
> > +
> > +                /*
> > +                 * Don't sleep for less than 2ms. This is believed to improve
> > +                 * latency of message passing workloads.
> > +                 */
>
> Believed by who ?

Alexander asked me to add this [1], so I'll defer to him. As I
mentioned on the thread I personally would prefer not to have this
logic without data specifically collected on the M1, but I don't have
a strong opinion.

> > +                if (!seconds && nanos < 2000000) {
> > +                    break;
> > +                }
> > +
> > +                struct timespec ts = { seconds, nanos };
> > +                hvf_wait_for_ipi(cpu, &ts);
> > +            }
>
> Why doesn't the timer timeout manifest as an IPI ? (Put another way,
> why is the timer interrupt special?)

Timer timeouts result in an IPI (via HV_EXIT_REASON_VTIMER_ACTIVATED)
if they become due while in hv_vcpu_run(). But at this point we are
not in hv_vcpu_run() (due to the aforementioned difference in wait
behavior between x86 and ARM) so we need to "manually" wait for the
timer to become due, re-enter the guest, let it exit with
HV_EXIT_REASON_VTIMER_ACTIVATED and then trigger the IPI.

Peter

[1] https://lists.gnu.org/archive/html/qemu-arm/2020-12/msg00056.html

