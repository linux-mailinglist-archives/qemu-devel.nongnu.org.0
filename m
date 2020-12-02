Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC1A2CB28B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 02:55:18 +0100 (CET)
Received: from localhost ([::1]:33498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkHMT-0005WX-6E
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 20:55:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkHKN-0004QO-Ht
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 20:53:07 -0500
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:35983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkHKK-00080P-O2
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 20:53:07 -0500
Received: by mail-il1-x142.google.com with SMTP id z10so126117ilu.3
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 17:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xw/6TqtXbP70qBDB3Zn4fwDBzBKi7xZOU/jPeQ/gcTE=;
 b=YvY7gVkvC1vbj9YQcfDEZRyNCFdgc0gGItgb8KDlRRadypUcwDRJnLqqaLRRcRwA5b
 cAkT4MuH0Cb0Z3KNBKHgXcetspK9HZNi+QhDkuAJUMHTldECRa5A6irtlnw5uTca+zzh
 PDwJf6mzztLXJIVB2KHd310N2eFpkxUWowF9rrBCjtIgcxgKGh9QHmeRQX3z2hql9Els
 4qfZXQnV65JYqLKVRkOfOdPAG64/BSgMlzHt949m0omNf4GaRcf2LH6ffMHcenaJKgNs
 xJPDSLT/N3b9ZKmaYaozjufGd/NCQVRBkyO1o9tC0pt44Xq6MB9g2/vhh8w4MxynB1eM
 M2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xw/6TqtXbP70qBDB3Zn4fwDBzBKi7xZOU/jPeQ/gcTE=;
 b=ehyV0GUcsAIh/bn1kFTg3NLXO6PfLtrG9Te+m7gIJwYka+mzI/7IKa/QPEKlcq4ULS
 8jfq93dMfoxjy0W7odQp8gNuaBpzkMOe4GMnNaDenL8j2WzpGtAgJ8jOMMxGSr7UHCsp
 FxErIbboil/3/nTuZA0ZMUU5xPRz0sZ5bCDkD+kt0bH651UkZheo4vNp0Urbp46+sPUK
 5d+m69AOzkV2DGRbj4ZVmXvrbS9bu81DF6nWJP6dHm9wkm2IrnXQ8brried/pv9Y9VIB
 TsGdd70FgpHnZfnPZt5m0hrmoZUSqWYXcpbXnfmH2SkXq8EkRANXPc1pMiX62YEhdTbu
 Kjxg==
X-Gm-Message-State: AOAM530154RhdhVdz8oPCM4G1TonMdFxbmRuTXj80hpxJj8xa+Uf+M9s
 IY93NX4kE6sPC27ZxJdBue7GPs/zLM9JfS1djAcJYw==
X-Google-Smtp-Source: ABdhPJwij/TTjiw8Be/qbbCxRI4A42cNHqmeFBHgmE4rmkfHC7SwyWT6UjTTTXV9Lm1bgk2SR3ViEUvn1JWVf7IMYOc=
X-Received: by 2002:a92:990e:: with SMTP id p14mr456349ili.28.1606873983341;
 Tue, 01 Dec 2020 17:53:03 -0800 (PST)
MIME-Version: 1.0
References: <4a2d15d01087207e2fba1f55ad312727dbfc782e.1606856104.git.pcc@google.com>
 <3aef88d7-c620-11b0-49c4-36d140d05c12@csgraf.de>
 <CAMn1gO4pNFb338-X7JAghCBqJKarrzbQfmpB6v0fLr843fM12A@mail.gmail.com>
 <b41352d9-26db-a232-957a-9c63fcc2db18@csgraf.de>
In-Reply-To: <b41352d9-26db-a232-957a-9c63fcc2db18@csgraf.de>
From: Peter Collingbourne <pcc@google.com>
Date: Tue, 1 Dec 2020 17:52:52 -0800
Message-ID: <CAMn1gO4ZBEZ9DvsEPjTtg-h0jO-G2NZcR++FuJa8Zzw7ZKdj_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm/hvf: Optimize and simplify WFI handling
To: Alexander Graf <agraf@csgraf.de>
Cc: Frank Yang <lfy@google.com>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=pcc@google.com; helo=mail-il1-x142.google.com
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

On Tue, Dec 1, 2020 at 5:39 PM Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 02.12.20 02:32, Peter Collingbourne wrote:
> > On Tue, Dec 1, 2020 at 3:24 PM Alexander Graf <agraf@csgraf.de> wrote:
> >>
> >> On 01.12.20 22:00, Peter Collingbourne wrote:
> >>> Sleep on WFx until the VTIMER is due but allow ourselves to be woken
> >>> up on IPI.
> >>>
> >>> Signed-off-by: Peter Collingbourne <pcc@google.com>
> >>> ---
> >>> v2:
> >>> - simplify locking further
> >>> - wait indefinitely on disabled or masked timers
> >>>
> >>>    accel/hvf/hvf-cpus.c     |   5 +-
> >>>    include/sysemu/hvf_int.h |   3 +-
> >>>    target/arm/hvf/hvf.c     | 116 ++++++++++++++-------------------------
> >>>    3 files changed, 43 insertions(+), 81 deletions(-)
> >>>
> >>> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
> >>> index 4360f64671..b2c8fb57f6 100644
> >>> --- a/accel/hvf/hvf-cpus.c
> >>> +++ b/accel/hvf/hvf-cpus.c
> >>> @@ -344,9 +344,8 @@ static int hvf_init_vcpu(CPUState *cpu)
> >>>        sigact.sa_handler = dummy_signal;
> >>>        sigaction(SIG_IPI, &sigact, NULL);
> >>>
> >>> -    pthread_sigmask(SIG_BLOCK, NULL, &set);
> >>> -    sigdelset(&set, SIG_IPI);
> >>> -    pthread_sigmask(SIG_SETMASK, &set, NULL);
> >>> +    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->unblock_ipi_mask);
> >>> +    sigdelset(&cpu->hvf->unblock_ipi_mask, SIG_IPI);
> >>>
> >>>    #ifdef __aarch64__
> >>>        r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
> >>> diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
> >>> index c56baa3ae8..13adf6ea77 100644
> >>> --- a/include/sysemu/hvf_int.h
> >>> +++ b/include/sysemu/hvf_int.h
> >>> @@ -62,8 +62,7 @@ extern HVFState *hvf_state;
> >>>    struct hvf_vcpu_state {
> >>>        uint64_t fd;
> >>>        void *exit;
> >>> -    struct timespec ts;
> >>> -    bool sleeping;
> >>> +    sigset_t unblock_ipi_mask;
> >>>    };
> >>>
> >>>    void assert_hvf_ok(hv_return_t ret);
> >>> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> >>> index 8fe10966d2..3321d48aa2 100644
> >>> --- a/target/arm/hvf/hvf.c
> >>> +++ b/target/arm/hvf/hvf.c
> >>> @@ -2,6 +2,7 @@
> >>>     * QEMU Hypervisor.framework support for Apple Silicon
> >>>
> >>>     * Copyright 2020 Alexander Graf <agraf@csgraf.de>
> >>> + * Copyright 2020 Google LLC
> >>>     *
> >>>     * This work is licensed under the terms of the GNU GPL, version 2 or later.
> >>>     * See the COPYING file in the top-level directory.
> >>> @@ -18,6 +19,7 @@
> >>>    #include "sysemu/hw_accel.h"
> >>>
> >>>    #include <Hypervisor/Hypervisor.h>
> >>> +#include <mach/mach_time.h>
> >>>
> >>>    #include "exec/address-spaces.h"
> >>>    #include "hw/irq.h"
> >>> @@ -320,18 +322,8 @@ int hvf_arch_init_vcpu(CPUState *cpu)
> >>>
> >>>    void hvf_kick_vcpu_thread(CPUState *cpu)
> >>>    {
> >>> -    if (cpu->hvf->sleeping) {
> >>> -        /*
> >>> -         * When sleeping, make sure we always send signals. Also, clear the
> >>> -         * timespec, so that an IPI that arrives between setting hvf->sleeping
> >>> -         * and the nanosleep syscall still aborts the sleep.
> >>> -         */
> >>> -        cpu->thread_kicked = false;
> >>> -        cpu->hvf->ts = (struct timespec){ };
> >>> -        cpus_kick_thread(cpu);
> >>> -    } else {
> >>> -        hv_vcpus_exit(&cpu->hvf->fd, 1);
> >>> -    }
> >>> +    cpus_kick_thread(cpu);
> >>> +    hv_vcpus_exit(&cpu->hvf->fd, 1);
> >>>    }
> >>>
> >>>    static int hvf_inject_interrupts(CPUState *cpu)
> >>> @@ -349,6 +341,18 @@ static int hvf_inject_interrupts(CPUState *cpu)
> >>>        return 0;
> >>>    }
> >>>
> >>> +static void hvf_wait_for_ipi(CPUState *cpu, struct timespec *ts)
> >>> +{
> >>> +    /*
> >>> +     * Use pselect to sleep so that other threads can IPI us while we're
> >>> +     * sleeping.
> >>> +     */
> >>> +    qatomic_mb_set(&cpu->thread_kicked, false);
> >>> +    qemu_mutex_unlock_iothread();
> >>> +    pselect(0, 0, 0, 0, ts, &cpu->hvf->unblock_ipi_mask);
> >>> +    qemu_mutex_lock_iothread();
> >>> +}
> >>> +
> >>>    int hvf_vcpu_exec(CPUState *cpu)
> >>>    {
> >>>        ARMCPU *arm_cpu = ARM_CPU(cpu);
> >>> @@ -357,15 +361,11 @@ int hvf_vcpu_exec(CPUState *cpu)
> >>>        hv_return_t r;
> >>>        int ret = 0;
> >>>
> >>> -    qemu_mutex_unlock_iothread();
> >>> -
> >>>        do {
> >>>            bool advance_pc = false;
> >>>
> >>> -        qemu_mutex_lock_iothread();
> >>>            current_cpu = cpu;
> >>>            qemu_wait_io_event_common(cpu);
> >>> -        qemu_mutex_unlock_iothread();
> >>>
> >>>            flush_cpu_state(cpu);
> >>>
> >>> @@ -374,10 +374,10 @@ int hvf_vcpu_exec(CPUState *cpu)
> >>>            }
> >>>
> >>>            if (cpu->halted) {
> >>> -            qemu_mutex_lock_iothread();
> >>>                return EXCP_HLT;
> >>>            }
> >>>
> >>> +        qemu_mutex_unlock_iothread();
> >>>            assert_hvf_ok(hv_vcpu_run(cpu->hvf->fd));
> >>>
> >>>            /* handle VMEXIT */
> >>> @@ -385,15 +385,14 @@ int hvf_vcpu_exec(CPUState *cpu)
> >>>            uint64_t syndrome = hvf_exit->exception.syndrome;
> >>>            uint32_t ec = syn_get_ec(syndrome);
> >>>
> >>> +        qemu_mutex_lock_iothread();
> >>>            switch (exit_reason) {
> >>>            case HV_EXIT_REASON_EXCEPTION:
> >>>                /* This is the main one, handle below. */
> >>>                break;
> >>>            case HV_EXIT_REASON_VTIMER_ACTIVATED:
> >>> -            qemu_mutex_lock_iothread();
> >>>                current_cpu = cpu;
> >>>                qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
> >>> -            qemu_mutex_unlock_iothread();
> >>>                continue;
> >>>            case HV_EXIT_REASON_CANCELED:
> >>>                /* we got kicked, no exit to process */
> >>> @@ -413,7 +412,6 @@ int hvf_vcpu_exec(CPUState *cpu)
> >>>                uint32_t srt = (syndrome >> 16) & 0x1f;
> >>>                uint64_t val = 0;
> >>>
> >>> -            qemu_mutex_lock_iothread();
> >>>                current_cpu = cpu;
> >>>
> >>>                DPRINTF("data abort: [pc=0x%llx va=0x%016llx pa=0x%016llx isv=%x "
> >>> @@ -446,8 +444,6 @@ int hvf_vcpu_exec(CPUState *cpu)
> >>>                    hvf_set_reg(cpu, srt, val);
> >>>                }
> >>>
> >>> -            qemu_mutex_unlock_iothread();
> >>> -
> >>>                advance_pc = true;
> >>>                break;
> >>>            }
> >>> @@ -493,68 +489,40 @@ int hvf_vcpu_exec(CPUState *cpu)
> >>>            case EC_WFX_TRAP:
> >>>                if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_request &
> >>>                    (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
> >>> -                uint64_t cval, ctl, val, diff, now;
> >>> +                advance_pc = true;
> >>>
> >>> -                /* Set up a local timer for vtimer if necessary ... */
> >>> -                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0, &ctl);
> >>> -                assert_hvf_ok(r);
> >>> -                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0, &cval);
> >>> +                uint64_t ctl;
> >>> +                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0,
> >>> +                                        &ctl);
> >>>                    assert_hvf_ok(r);
> >>>
> >>> -                asm volatile("mrs %0, cntvct_el0" : "=r"(val));
> >>> -                diff = cval - val;
> >>> -
> >>> -                now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
> >>> -                      gt_cntfrq_period_ns(arm_cpu);
> >>> -
> >>> -                /* Timer disabled or masked, just wait for long */
> >>>                    if (!(ctl & 1) || (ctl & 2)) {
> >>> -                    diff = (120 * NANOSECONDS_PER_SECOND) /
> >>> -                           gt_cntfrq_period_ns(arm_cpu);
> >>> +                    /* Timer disabled or masked, just wait for an IPI. */
> >>> +                    hvf_wait_for_ipi(cpu, NULL);
> >>> +                    break;
> >>>                    }
> >>>
> >>> -                if (diff < INT64_MAX) {
> >>> -                    uint64_t ns = diff * gt_cntfrq_period_ns(arm_cpu);
> >>> -                    struct timespec *ts = &cpu->hvf->ts;
> >>> -
> >>> -                    *ts = (struct timespec){
> >>> -                        .tv_sec = ns / NANOSECONDS_PER_SECOND,
> >>> -                        .tv_nsec = ns % NANOSECONDS_PER_SECOND,
> >>> -                    };
> >>> -
> >>> -                    /*
> >>> -                     * Waking up easily takes 1ms, don't go to sleep for smaller
> >>> -                     * time periods than 2ms.
> >>> -                     */
> >>> -                    if (!ts->tv_sec && (ts->tv_nsec < (SCALE_MS * 2))) {
> >>> -                        advance_pc = true;
> >>> -                        break;
> >>> -                    }
> >>> -
> >>> -                    /* Set cpu->hvf->sleeping so that we get a SIG_IPI signal. */
> >>> -                    cpu->hvf->sleeping = true;
> >>> -                    smp_mb();
> >>> -
> >>> -                    /* Bail out if we received an IRQ meanwhile */
> >>> -                    if (cpu->thread_kicked || (cpu->interrupt_request &
> >>> -                        (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
> >>> -                        cpu->hvf->sleeping = false;
> >>> -                        break;
> >>> -                    }
> >>> -
> >>> -                    /* nanosleep returns on signal, so we wake up on kick. */
> >>> -                    nanosleep(ts, NULL);
> >>> -
> >>> -                    /* Out of sleep - either naturally or because of a kick */
> >>> -                    cpu->hvf->sleeping = false;
> >>> +                uint64_t cval;
> >>> +                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0,
> >>> +                                        &cval);
> >>> +                assert_hvf_ok(r);
> >>> +
> >>> +                int64_t ticks_to_sleep = cval - mach_absolute_time();
> >>
> >> I think you touched based on it in a previous thread, but would you mind
> >> to explain again why mach_absolute_time() is the right thing to check
> >> cval against? If I read the headers correctly, the cnvt_off register
> >> should be 0, so cntvct should be the reference time, no?
> > In my experiments I've found that CNTPCT_EL0 and CNTVCT_EL0 are the
> > same when read on the host (i.e. host CNTVOFF_EL2 = 0). When we look
> > at the guest we see that CNTPCT_EL0 corresponds to
> > mach_absolute_time() on the host and not host CNTPCT_EL0 (if you look
> > at XNU kernel sources you will see that mach_absolute_time() reads
> > CNTPCT_EL0 and adds a constant corresponding to the amount of time
> > that the machine spends asleep) so I think that what's going on at the
> > hypervisor level is that guest CNTPOFF_EL2 is being set to the same
> > constant to make it correspond to mach_absolute_time().
>
>
> Yes, I can absolutely see how it's different from CNTPCT, but it should
> be identical to CNTVCT_EL0 inside QEMU, no?

Not necessarily. It's possible for the guest to observe a different
CNTVCT_EL0 either because CNTPOFF_EL2 is set to a non-zero value or
because the hypervisor is secretly adding the "time spent asleep"
constant to CNTVOFF_EL2 on top of the value that we set it to via the
API.

Peter

