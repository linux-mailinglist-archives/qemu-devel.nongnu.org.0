Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025612C993F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 09:23:33 +0100 (CET)
Received: from localhost ([::1]:56036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk0wd-0001qa-Iu
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 03:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JP3FXwMKCjsmZZdlldib.Zljnbjr-absbiklkdkr.lod@flex--pcc.bounces.google.com>)
 id 1kk0vD-00013N-Cs
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:22:03 -0500
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:55197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JP3FXwMKCjsmZZdlldib.Zljnbjr-absbiklkdkr.lod@flex--pcc.bounces.google.com>)
 id 1kk0vA-0007ft-C3
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:22:03 -0500
Received: by mail-pf1-x449.google.com with SMTP id q199so497042pfc.21
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 00:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:subject:from:to:cc;
 bh=sMOfVbCGiF/fkRR4mA6VIbEyZe8RVeThKvxp8g2+BMQ=;
 b=eFi9v5reXvotnwLRdLnxaJ7uipa0c1Dss5qy6R8I3+XWdVhaO9oEO5mERWiDToEMqu
 HMEhOSXKM0nUCJRtt7Dj+h5RcgzgyVOFT7dzSRSngYqwoS0gMX6RlZtqYh3b9IbX2Yh5
 VMlJn6iQvwOfdKP2s4yIV/oTQMsVAK4CmnHZMRwkyzmVAU6okxmNcGfs8BRC3IdVxCw9
 M+DBbQrZHUTB/3rt8BvP/Z53CPmSOuo2T21puTqweylB3svmOuHCZTQSfvicaqKn+UdS
 idmBYhlBqbncLks4tS0pXzr03K5bDBNwa1qZRD9DLAalIdT1UkxCSV9lDvWyczhllF9t
 JHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :subject:from:to:cc;
 bh=sMOfVbCGiF/fkRR4mA6VIbEyZe8RVeThKvxp8g2+BMQ=;
 b=sywoo4IpMqy2XphejU47LXUPqhjiGifv6ZpS2hPoq0ppLolZhdJteuitqiV0O3zOj0
 Ya+uuzFlyXsXRpTkWTSUBipPbR166WwHG9almyUc1CDdpghmEBBOtugFVPuBxxk7Ab/I
 7TFdCvCWkNrXQKvtCY8jI+GPqM20oyJPsNBZvXtSaeT8NvXazBc9Xo3c5j7VdnHJtSea
 S0BWc1yjndzfnTXAMN7vmJ3PP8TBlVozPeqecEXDiePNFUo9GCVD7V7vYibxUZLYKavL
 YXbv7DHbHX6CZWiCvjRs3hr6II6vfX04/Af6LM3Ntsqv+q4r3TiizhO9TFwGE7RZ8kYT
 oWgg==
X-Gm-Message-State: AOAM531sy5Mx0mV4q28VjXxQxt6AkdbnsjUL3Y1ylJvUNDEL9cZGHp73
 57+5TqPOgElnTOncvhmUXpBkh+4=
X-Google-Smtp-Source: ABdhPJyj4Hpr18zN0UXNebWH44/mA5E4SHfco4WZSfeXWjLQSkS7TNjmXTzrZRDhaJ4wTsMDCVvVkzk=
X-Received: from pcc-desktop.svl.corp.google.com
 ([2620:15c:2ce:0:7220:84ff:fe09:385a])
 (user=pcc job=sendgmr) by 2002:a17:90a:17a4:: with SMTP id
 q33mr192910pja.0.1606810916388; Tue, 01 Dec 2020 00:21:56 -0800 (PST)
Date: Tue,  1 Dec 2020 00:21:42 -0800
In-Reply-To: <ed83843e-2bd1-771a-cb89-ac0f1a4aaae4@csgraf.de>
Message-Id: <20201201082142.649007-1-pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH] arm/hvf: Optimize and simplify WFI handling
To: Alexander Graf <agraf@csgraf.de>
Cc: Peter Collingbourne <pcc@google.com>, Frank Yang <lfy@google.com>, 
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, 
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3JP3FXwMKCjsmZZdlldib.Zljnbjr-absbiklkdkr.lod@flex--pcc.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Reply-to: Peter Collingbourne <pcc@google.com>
From: Peter Collingbourne via <qemu-devel@nongnu.org>

Sleep on WFx until the VTIMER is due but allow ourselves to be woken
up on IPI.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
Alexander Graf wrote:
> I would love to take a patch from you here :). I'll still be stuck for a
> while with the sysreg sync rework that Peter asked for before I can look
> at WFI again.

Okay, here's a patch :) It's a relatively straightforward adaptation
of what we have in our fork, which can now boot Android to GUI while
remaining at around 4% CPU when idle.

I'm not set up to boot a full Linux distribution at the moment so I
tested it on upstream QEMU by running a recent mainline Linux kernel
with a rootfs containing an init program that just does sleep(5)
and verified that the qemu process remains at low CPU usage during
the sleep. This was on top of your v2 plus the last patch of your v1
since it doesn't look like you have a replacement for that logic yet.

 accel/hvf/hvf-cpus.c     |  5 +--
 include/sysemu/hvf_int.h |  3 +-
 target/arm/hvf/hvf.c     | 94 +++++++++++-----------------------------
 3 files changed, 28 insertions(+), 74 deletions(-)

diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
index 4360f64671..b2c8fb57f6 100644
--- a/accel/hvf/hvf-cpus.c
+++ b/accel/hvf/hvf-cpus.c
@@ -344,9 +344,8 @@ static int hvf_init_vcpu(CPUState *cpu)
     sigact.sa_handler = dummy_signal;
     sigaction(SIG_IPI, &sigact, NULL);
 
-    pthread_sigmask(SIG_BLOCK, NULL, &set);
-    sigdelset(&set, SIG_IPI);
-    pthread_sigmask(SIG_SETMASK, &set, NULL);
+    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->unblock_ipi_mask);
+    sigdelset(&cpu->hvf->unblock_ipi_mask, SIG_IPI);
 
 #ifdef __aarch64__
     r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index c56baa3ae8..13adf6ea77 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -62,8 +62,7 @@ extern HVFState *hvf_state;
 struct hvf_vcpu_state {
     uint64_t fd;
     void *exit;
-    struct timespec ts;
-    bool sleeping;
+    sigset_t unblock_ipi_mask;
 };
 
 void assert_hvf_ok(hv_return_t ret);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8fe10966d2..60a361ff38 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2,6 +2,7 @@
  * QEMU Hypervisor.framework support for Apple Silicon
 
  * Copyright 2020 Alexander Graf <agraf@csgraf.de>
+ * Copyright 2020 Google LLC
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
@@ -18,6 +19,7 @@
 #include "sysemu/hw_accel.h"
 
 #include <Hypervisor/Hypervisor.h>
+#include <mach/mach_time.h>
 
 #include "exec/address-spaces.h"
 #include "hw/irq.h"
@@ -320,18 +322,8 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
-    if (cpu->hvf->sleeping) {
-        /*
-         * When sleeping, make sure we always send signals. Also, clear the
-         * timespec, so that an IPI that arrives between setting hvf->sleeping
-         * and the nanosleep syscall still aborts the sleep.
-         */
-        cpu->thread_kicked = false;
-        cpu->hvf->ts = (struct timespec){ };
-        cpus_kick_thread(cpu);
-    } else {
-        hv_vcpus_exit(&cpu->hvf->fd, 1);
-    }
+    cpus_kick_thread(cpu);
+    hv_vcpus_exit(&cpu->hvf->fd, 1);
 }
 
 static int hvf_inject_interrupts(CPUState *cpu)
@@ -385,18 +377,19 @@ int hvf_vcpu_exec(CPUState *cpu)
         uint64_t syndrome = hvf_exit->exception.syndrome;
         uint32_t ec = syn_get_ec(syndrome);
 
+        qemu_mutex_lock_iothread();
         switch (exit_reason) {
         case HV_EXIT_REASON_EXCEPTION:
             /* This is the main one, handle below. */
             break;
         case HV_EXIT_REASON_VTIMER_ACTIVATED:
-            qemu_mutex_lock_iothread();
             current_cpu = cpu;
             qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
             qemu_mutex_unlock_iothread();
             continue;
         case HV_EXIT_REASON_CANCELED:
             /* we got kicked, no exit to process */
+            qemu_mutex_unlock_iothread();
             continue;
         default:
             assert(0);
@@ -413,7 +406,6 @@ int hvf_vcpu_exec(CPUState *cpu)
             uint32_t srt = (syndrome >> 16) & 0x1f;
             uint64_t val = 0;
 
-            qemu_mutex_lock_iothread();
             current_cpu = cpu;
 
             DPRINTF("data abort: [pc=0x%llx va=0x%016llx pa=0x%016llx isv=%x "
@@ -446,8 +438,6 @@ int hvf_vcpu_exec(CPUState *cpu)
                 hvf_set_reg(cpu, srt, val);
             }
 
-            qemu_mutex_unlock_iothread();
-
             advance_pc = true;
             break;
         }
@@ -493,68 +483,36 @@ int hvf_vcpu_exec(CPUState *cpu)
         case EC_WFX_TRAP:
             if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_request &
                 (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
-                uint64_t cval, ctl, val, diff, now;
+                uint64_t cval;
 
-                /* Set up a local timer for vtimer if necessary ... */
-                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0, &ctl);
-                assert_hvf_ok(r);
                 r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0, &cval);
                 assert_hvf_ok(r);
 
-                asm volatile("mrs %0, cntvct_el0" : "=r"(val));
-                diff = cval - val;
-
-                now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
-                      gt_cntfrq_period_ns(arm_cpu);
-
-                /* Timer disabled or masked, just wait for long */
-                if (!(ctl & 1) || (ctl & 2)) {
-                    diff = (120 * NANOSECONDS_PER_SECOND) /
-                           gt_cntfrq_period_ns(arm_cpu);
+                int64_t ticks_to_sleep = cval - mach_absolute_time();
+                if (ticks_to_sleep < 0) {
+                    break;
                 }
 
-                if (diff < INT64_MAX) {
-                    uint64_t ns = diff * gt_cntfrq_period_ns(arm_cpu);
-                    struct timespec *ts = &cpu->hvf->ts;
-
-                    *ts = (struct timespec){
-                        .tv_sec = ns / NANOSECONDS_PER_SECOND,
-                        .tv_nsec = ns % NANOSECONDS_PER_SECOND,
-                    };
-
-                    /*
-                     * Waking up easily takes 1ms, don't go to sleep for smaller
-                     * time periods than 2ms.
-                     */
-                    if (!ts->tv_sec && (ts->tv_nsec < (SCALE_MS * 2))) {
-                        advance_pc = true;
-                        break;
-                    }
-
-                    /* Set cpu->hvf->sleeping so that we get a SIG_IPI signal. */
-                    cpu->hvf->sleeping = true;
-                    smp_mb();
-
-                    /* Bail out if we received an IRQ meanwhile */
-                    if (cpu->thread_kicked || (cpu->interrupt_request &
-                        (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
-                        cpu->hvf->sleeping = false;
-                        break;
-                    }
-
-                    /* nanosleep returns on signal, so we wake up on kick. */
-                    nanosleep(ts, NULL);
-
-                    /* Out of sleep - either naturally or because of a kick */
-                    cpu->hvf->sleeping = false;
-                }
+                uint64_t seconds = ticks_to_sleep / arm_cpu->gt_cntfrq_hz;
+                uint64_t nanos =
+                    (ticks_to_sleep - arm_cpu->gt_cntfrq_hz * seconds) *
+                    1000000000 / arm_cpu->gt_cntfrq_hz;
+                struct timespec ts = { seconds, nanos };
+
+                /*
+                 * Use pselect to sleep so that other threads can IPI us while
+                 * we're sleeping.
+                 */
+                qatomic_mb_set(&cpu->thread_kicked, false);
+                qemu_mutex_unlock_iothread();
+                pselect(0, 0, 0, 0, &ts, &cpu->hvf->unblock_ipi_mask);
+                qemu_mutex_lock_iothread();
 
                 advance_pc = true;
             }
             break;
         case EC_AA64_HVC:
             cpu_synchronize_state(cpu);
-            qemu_mutex_lock_iothread();
             current_cpu = cpu;
             if (arm_is_psci_call(arm_cpu, EXCP_HVC)) {
                 arm_handle_psci_call(arm_cpu);
@@ -562,11 +520,9 @@ int hvf_vcpu_exec(CPUState *cpu)
                 DPRINTF("unknown HVC! %016llx", env->xregs[0]);
                 env->xregs[0] = -1;
             }
-            qemu_mutex_unlock_iothread();
             break;
         case EC_AA64_SMC:
             cpu_synchronize_state(cpu);
-            qemu_mutex_lock_iothread();
             current_cpu = cpu;
             if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
                 arm_handle_psci_call(arm_cpu);
@@ -575,7 +531,6 @@ int hvf_vcpu_exec(CPUState *cpu)
                 env->xregs[0] = -1;
                 env->pc += 4;
             }
-            qemu_mutex_unlock_iothread();
             break;
         default:
             cpu_synchronize_state(cpu);
@@ -594,6 +549,7 @@ int hvf_vcpu_exec(CPUState *cpu)
             r = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_PC, pc);
             assert_hvf_ok(r);
         }
+        qemu_mutex_unlock_iothread();
     } while (ret == 0);
 
     qemu_mutex_lock_iothread();
-- 
2.29.2.454.gaff20da3a2-goog


