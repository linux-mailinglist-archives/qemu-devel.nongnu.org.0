Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7175B2CB3FA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 05:45:55 +0100 (CET)
Received: from localhost ([::1]:34714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkK1a-0002Rf-FC
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 23:45:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3nxvHXwMKCvYnaaemmejc.amkocks-bctcjlmlels.mpe@flex--pcc.bounces.google.com>)
 id 1kkK02-000164-Ki
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 23:44:18 -0500
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:53013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3nxvHXwMKCvYnaaemmejc.amkocks-bctcjlmlels.mpe@flex--pcc.bounces.google.com>)
 id 1kkK00-0003Ps-SL
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 23:44:18 -0500
Received: by mail-qk1-x74a.google.com with SMTP id h189so281920qke.19
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 20:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=Mp8zRU4gj1bN8pO12CPiOr1/PrmkMSQFvPBoGxdW/2M=;
 b=k4QI1l8eEXoWP240/5+nTQYIyGYERR1o0dKhTZUYl10ZbvmTLWXkhOyEDdjlYy7PRZ
 8lHdB9r8APhobOoV4EfebLQMwtQyD8+/azG9Njg00TWAL0CNonKshO3J78PmC7Z8jJqY
 7j43cqgb7bl/sEXUvF/CjKOZoJKIsfAHNND40TmghRd39zo0SPxCBK00avslCQvXDD4p
 INsHcLoeOz7Gqeaiq7Jmr2E3MU+uJ+Z6RHVP6SZwRlpnWBtlAnZm1up1lCwlOK9Pfo6G
 tjRyIvwtKfDbDF7aKoogl0egahHr65m8lyptLSc8dPVxROB13r7xLDHF3wGi7QK/JR3v
 YMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Mp8zRU4gj1bN8pO12CPiOr1/PrmkMSQFvPBoGxdW/2M=;
 b=XA/TXjnN0nQcg1/NXm6X8WFYCbmwNFbgONOd8blU2i03/5JuvpCJoMxJepf3ZZw1Gq
 zy06Jhn5uQK9fw23n90W6nQvpDSmQbwh8/IxPTcWqajS1AeLlbOFpW3snpXCRc+E8Ir/
 +MveNndeAL1MevY80l02e3m88h4HGThfbyKTTyJ4gaXfr8nX2vRXAXxC8JkffeuQo2GU
 teLLIRragnLe34iBGS40t/j69ieudrrF0yewbODD0QPbv3vSjy0+PinpzCfPYTGRv/I0
 onKjfm8YpXA84E8reNcTVpVxwBZt0zpBg6eblIat/l9sxaGWQFkq1xHepdl2+079xVbI
 vlDw==
X-Gm-Message-State: AOAM533dJTuGEW8kZeAlqYpA5JmUct92/A/h4g1bS9ikvK5PKgcRETmw
 QWbKiSBKgNnFBGOrDAM8dx6gSSA=
X-Google-Smtp-Source: ABdhPJzPxpp/KC8KgEITR5HpsDKcFFzQkJxiuSMCt8zsHWtoFe1DF0kEx3+fYT/tXqf/Zo4yehK86AU=
X-Received: from pcc-desktop.svl.corp.google.com
 ([2620:15c:2ce:0:7220:84ff:fe09:385a])
 (user=pcc job=sendgmr) by 2002:ad4:470d:: with SMTP id
 k13mr725644qvz.40.1606884255201; 
 Tue, 01 Dec 2020 20:44:15 -0800 (PST)
Date: Tue,  1 Dec 2020 20:44:07 -0800
In-Reply-To: <27f51056925889c41b763b71c992f04d935157c4.1606884132.git.pcc@google.com>
Message-Id: <f01281f814ceba088595917eb06d4cb21db820f1.1606884132.git.pcc@google.com>
Mime-Version: 1.0
References: <27f51056925889c41b763b71c992f04d935157c4.1606884132.git.pcc@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v3 3/3] arm/hvf: Add a WFI handler
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3nxvHXwMKCvYnaaemmejc.amkocks-bctcjlmlels.mpe@flex--pcc.bounces.google.com;
 helo=mail-qk1-x74a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Sleep on WFI until the VTIMER is due but allow ourselves to be woken
up on IPI.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
v3:
- move the simplified locking to a separate patch
- spin on sleep <2ms

v2:
- simplify locking further
- wait indefinitely on disabled or masked timers

 accel/hvf/hvf-cpus.c     |  4 +--
 include/sysemu/hvf_int.h |  1 +
 target/arm/hvf/hvf.c     | 56 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
index e613c22ad0..b2c8fb57f6 100644
--- a/accel/hvf/hvf-cpus.c
+++ b/accel/hvf/hvf-cpus.c
@@ -344,8 +344,8 @@ static int hvf_init_vcpu(CPUState *cpu)
     sigact.sa_handler = dummy_signal;
     sigaction(SIG_IPI, &sigact, NULL);
 
-    pthread_sigmask(SIG_BLOCK, NULL, &set);
-    sigdelset(&set, SIG_IPI);
+    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->unblock_ipi_mask);
+    sigdelset(&cpu->hvf->unblock_ipi_mask, SIG_IPI);
 
 #ifdef __aarch64__
     r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 5f15119184..13adf6ea77 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -62,6 +62,7 @@ extern HVFState *hvf_state;
 struct hvf_vcpu_state {
     uint64_t fd;
     void *exit;
+    sigset_t unblock_ipi_mask;
 };
 
 void assert_hvf_ok(hv_return_t ret);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 31db6fca68..f230193cf5 100644
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
@@ -320,6 +322,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
+    cpus_kick_thread(cpu);
     hv_vcpus_exit(&cpu->hvf->fd, 1);
 }
 
@@ -338,6 +341,18 @@ static int hvf_inject_interrupts(CPUState *cpu)
     return 0;
 }
 
+static void hvf_wait_for_ipi(CPUState *cpu, struct timespec *ts)
+{
+    /*
+     * Use pselect to sleep so that other threads can IPI us while we're
+     * sleeping.
+     */
+    qatomic_mb_set(&cpu->thread_kicked, false);
+    qemu_mutex_unlock_iothread();
+    pselect(0, 0, 0, 0, ts, &cpu->hvf->unblock_ipi_mask);
+    qemu_mutex_lock_iothread();
+}
+
 int hvf_vcpu_exec(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -466,6 +481,47 @@ int hvf_vcpu_exec(CPUState *cpu)
             break;
         }
         case EC_WFX_TRAP:
+            if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_request &
+                (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
+                advance_pc = true;
+
+                uint64_t ctl;
+                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0,
+                                        &ctl);
+                assert_hvf_ok(r);
+
+                if (!(ctl & 1) || (ctl & 2)) {
+                    /* Timer disabled or masked, just wait for an IPI. */
+                    hvf_wait_for_ipi(cpu, NULL);
+                    break;
+                }
+
+                uint64_t cval;
+                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0,
+                                        &cval);
+                assert_hvf_ok(r);
+
+                int64_t ticks_to_sleep = cval - mach_absolute_time();
+                if (ticks_to_sleep < 0) {
+                    break;
+                }
+
+                uint64_t seconds = ticks_to_sleep / arm_cpu->gt_cntfrq_hz;
+                uint64_t nanos =
+                    (ticks_to_sleep - arm_cpu->gt_cntfrq_hz * seconds) *
+                    1000000000 / arm_cpu->gt_cntfrq_hz;
+
+                /*
+                 * Don't sleep for less than 2ms. This is believed to improve
+                 * latency of message passing workloads.
+                 */
+                if (!seconds && nanos < 2000000) {
+                    break;
+                }
+
+                struct timespec ts = { seconds, nanos };
+                hvf_wait_for_ipi(cpu, &ts);
+            }
             break;
         case EC_AA64_HVC:
             cpu_synchronize_state(cpu);
-- 
2.29.2.454.gaff20da3a2-goog


