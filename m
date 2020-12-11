Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCBC2D6D2B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 02:19:16 +0100 (CET)
Received: from localhost ([::1]:40966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knX5X-000120-8r
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 20:19:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knWxZ-0005N1-2j
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:11:01 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:33422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knWxW-00021v-LR
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:11:00 -0500
Received: by mail-oi1-x236.google.com with SMTP id d27so8047468oic.0
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 17:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YwdbJvu50xhYf1az37D1pyL9pyu0uC4ZCNblH9rdcYo=;
 b=R8WBWX1PjZNPhw2969CbQzWSeLSz601Ww+dMU/iShtK8YV+TViFCcLtHkC+T83yTeN
 2o/DQgtaFgubYObQ/HG/drEfWL2MQAruwup4HnPhFLu29rFqF1iLDnDqn0zT6dFsjF8o
 FaczKrRUYG+w8N4V7lZ/voh1r5sSaUFaI5Irdk1A7oqnfegY4lDUNoTOciE4RH5cBSY6
 x7lWy78RYoqzAH4F+SZ2yGXRbnrd7leoi7ocC+Zkw5hnV3oL6ih1cSxAL6oh8FXTzpwL
 fi+YlkKsi2zLQnUzYWO+v2QQGE4+4ku3r3HEKmla3m8cuzgRKTDxpchZ1HDQlTeFE8ER
 Poog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YwdbJvu50xhYf1az37D1pyL9pyu0uC4ZCNblH9rdcYo=;
 b=YI7YpIYFcJpH2Kmd7SdYPzCndxI1cM86kLAJY61+jnQxaHFYCo7vnncCTjutO54wnp
 7m7bGpXuadr3UPLxGkOLvOvKV1KEntfymz3KvdUQdYzolKHJwIGghexg6vpsZDIb5RRi
 h2k8hAgofBC7ch/veMWsUQ5mT14r1ZEgcyh2qwWrcWE9/qeubRyNxwVheekm04gw0c5N
 xG4iK9v71ud9YjOrJ56hu/nv2v5ZNtTUEFetItsDcKCA2Ui85jIbgIvBQV0/RP+yCCwG
 PE3aJCpUZyddxkeWb+fltStUUAbgN6cE3rkTZRcJQflOBNgbV1DbiowZuXRTTERR6Ap3
 a+jg==
X-Gm-Message-State: AOAM531UakP5vpyyw8jCP5H4RA17Jx3NLK3I2iMK7ZW2XalOiDPVr759
 B9PuHuldUf9YrjH3+1bxooCey39SIOgXH2ut
X-Google-Smtp-Source: ABdhPJxkM3G+pJxcaCdzTcZ86VLfG1eANMb4f4oyuPGT9i0K4nlMUAR3Ey8u4FWYQip1D/q2hsBQ/g==
X-Received: by 2002:aca:b355:: with SMTP id c82mr7534771oif.48.1607649055932; 
 Thu, 10 Dec 2020 17:10:55 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id w8sm1412905oos.37.2020.12.10.17.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 17:10:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] accel/tcg: rename tcg-cpus functions to match module name
Date: Thu, 10 Dec 2020 19:10:49 -0600
Message-Id: <20201211011049.474889-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201211011049.474889-1-richard.henderson@linaro.org>
References: <20201211011049.474889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201015143217.29337-4-cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-cpus-icount.h |  6 +--
 accel/tcg/tcg-cpus-rr.h     |  2 +-
 accel/tcg/tcg-cpus.h        |  6 +--
 accel/tcg/tcg-cpus-icount.c | 24 ++++++------
 accel/tcg/tcg-cpus-mttcg.c  | 10 ++---
 accel/tcg/tcg-cpus-rr.c     | 74 ++++++++++++++++++-------------------
 accel/tcg/tcg-cpus.c        |  6 +--
 7 files changed, 64 insertions(+), 64 deletions(-)

diff --git a/accel/tcg/tcg-cpus-icount.h b/accel/tcg/tcg-cpus-icount.h
index cbcf76b413..b695939dfa 100644
--- a/accel/tcg/tcg-cpus-icount.h
+++ b/accel/tcg/tcg-cpus-icount.h
@@ -10,8 +10,8 @@
 #ifndef TCG_CPUS_ICOUNT_H
 #define TCG_CPUS_ICOUNT_H
 
-void handle_icount_deadline(void);
-void prepare_icount_for_run(CPUState *cpu);
-void process_icount_data(CPUState *cpu);
+void icount_handle_deadline(void);
+void icount_prepare_for_run(CPUState *cpu);
+void icount_process_data(CPUState *cpu);
 
 #endif /* TCG_CPUS_ICOUNT_H */
diff --git a/accel/tcg/tcg-cpus-rr.h b/accel/tcg/tcg-cpus-rr.h
index 2e5943eda9..54f6ae6e86 100644
--- a/accel/tcg/tcg-cpus-rr.h
+++ b/accel/tcg/tcg-cpus-rr.h
@@ -13,7 +13,7 @@
 #define TCG_KICK_PERIOD (NANOSECONDS_PER_SECOND / 10)
 
 /* Kick all RR vCPUs. */
-void qemu_cpu_kick_rr_cpus(CPUState *unused);
+void rr_kick_vcpu_thread(CPUState *unused);
 
 /* start the round robin vcpu thread */
 void rr_start_vcpu_thread(CPUState *cpu);
diff --git a/accel/tcg/tcg-cpus.h b/accel/tcg/tcg-cpus.h
index b7ca954e13..d6893a32f8 100644
--- a/accel/tcg/tcg-cpus.h
+++ b/accel/tcg/tcg-cpus.h
@@ -18,8 +18,8 @@ extern const CpusAccel tcg_cpus_mttcg;
 extern const CpusAccel tcg_cpus_icount;
 extern const CpusAccel tcg_cpus_rr;
 
-void qemu_tcg_destroy_vcpu(CPUState *cpu);
-int tcg_cpu_exec(CPUState *cpu);
-void tcg_handle_interrupt(CPUState *cpu, int mask);
+void tcg_cpus_destroy(CPUState *cpu);
+int tcg_cpus_exec(CPUState *cpu);
+void tcg_cpus_handle_interrupt(CPUState *cpu, int mask);
 
 #endif /* TCG_CPUS_H */
diff --git a/accel/tcg/tcg-cpus-icount.c b/accel/tcg/tcg-cpus-icount.c
index 82dbe2cacf..9f45432275 100644
--- a/accel/tcg/tcg-cpus-icount.c
+++ b/accel/tcg/tcg-cpus-icount.c
@@ -36,7 +36,7 @@
 #include "tcg-cpus-icount.h"
 #include "tcg-cpus-rr.h"
 
-static int64_t tcg_get_icount_limit(void)
+static int64_t icount_get_limit(void)
 {
     int64_t deadline;
 
@@ -68,37 +68,37 @@ static int64_t tcg_get_icount_limit(void)
     }
 }
 
-static void notify_aio_contexts(void)
+static void icount_notify_aio_contexts(void)
 {
     /* Wake up other AioContexts.  */
     qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
     qemu_clock_run_timers(QEMU_CLOCK_VIRTUAL);
 }
 
-void handle_icount_deadline(void)
+void icount_handle_deadline(void)
 {
     assert(qemu_in_vcpu_thread());
     int64_t deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
                                                   QEMU_TIMER_ATTR_ALL);
 
     if (deadline == 0) {
-        notify_aio_contexts();
+        icount_notify_aio_contexts();
     }
 }
 
-void prepare_icount_for_run(CPUState *cpu)
+void icount_prepare_for_run(CPUState *cpu)
 {
     int insns_left;
 
     /*
-     * These should always be cleared by process_icount_data after
+     * These should always be cleared by icount_process_data after
      * each vCPU execution. However u16.high can be raised
-     * asynchronously by cpu_exit/cpu_interrupt/tcg_handle_interrupt
+     * asynchronously by cpu_exit/cpu_interrupt/tcg_cpus_handle_interrupt
      */
     g_assert(cpu_neg(cpu)->icount_decr.u16.low == 0);
     g_assert(cpu->icount_extra == 0);
 
-    cpu->icount_budget = tcg_get_icount_limit();
+    cpu->icount_budget = icount_get_limit();
     insns_left = MIN(0xffff, cpu->icount_budget);
     cpu_neg(cpu)->icount_decr.u16.low = insns_left;
     cpu->icount_extra = cpu->icount_budget - insns_left;
@@ -106,11 +106,11 @@ void prepare_icount_for_run(CPUState *cpu)
     replay_mutex_lock();
 
     if (cpu->icount_budget == 0 && replay_has_checkpoint()) {
-        notify_aio_contexts();
+        icount_notify_aio_contexts();
     }
 }
 
-void process_icount_data(CPUState *cpu)
+void icount_process_data(CPUState *cpu)
 {
     /* Account for executed instructions */
     icount_update(cpu);
@@ -129,7 +129,7 @@ static void icount_handle_interrupt(CPUState *cpu, int mask)
 {
     int old_mask = cpu->interrupt_request;
 
-    tcg_handle_interrupt(cpu, mask);
+    tcg_cpus_handle_interrupt(cpu, mask);
     if (qemu_cpu_is_self(cpu) &&
         !cpu->can_do_io
         && (mask & ~old_mask) != 0) {
@@ -139,7 +139,7 @@ static void icount_handle_interrupt(CPUState *cpu, int mask)
 
 const CpusAccel tcg_cpus_icount = {
     .create_vcpu_thread = rr_start_vcpu_thread,
-    .kick_vcpu_thread = qemu_cpu_kick_rr_cpus,
+    .kick_vcpu_thread = rr_kick_vcpu_thread,
 
     .handle_interrupt = icount_handle_interrupt,
     .get_virtual_clock = icount_get,
diff --git a/accel/tcg/tcg-cpus-mttcg.c b/accel/tcg/tcg-cpus-mttcg.c
index f2b892a380..9c3767d260 100644
--- a/accel/tcg/tcg-cpus-mttcg.c
+++ b/accel/tcg/tcg-cpus-mttcg.c
@@ -40,7 +40,7 @@
  * current CPUState for a given thread.
  */
 
-static void *tcg_cpu_thread_fn(void *arg)
+static void *mttcg_cpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
 
@@ -66,7 +66,7 @@ static void *tcg_cpu_thread_fn(void *arg)
         if (cpu_can_run(cpu)) {
             int r;
             qemu_mutex_unlock_iothread();
-            r = tcg_cpu_exec(cpu);
+            r = tcg_cpus_exec(cpu);
             qemu_mutex_lock_iothread();
             switch (r) {
             case EXCP_DEBUG:
@@ -97,7 +97,7 @@ static void *tcg_cpu_thread_fn(void *arg)
         qemu_wait_io_event(cpu);
     } while (!cpu->unplug || cpu_can_run(cpu));
 
-    qemu_tcg_destroy_vcpu(cpu);
+    tcg_cpus_destroy(cpu);
     qemu_mutex_unlock_iothread();
     rcu_unregister_thread();
     return NULL;
@@ -124,7 +124,7 @@ static void mttcg_start_vcpu_thread(CPUState *cpu)
     snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/TCG",
              cpu->cpu_index);
 
-    qemu_thread_create(cpu->thread, thread_name, tcg_cpu_thread_fn,
+    qemu_thread_create(cpu->thread, thread_name, mttcg_cpu_thread_fn,
                        cpu, QEMU_THREAD_JOINABLE);
 
 #ifdef _WIN32
@@ -136,5 +136,5 @@ const CpusAccel tcg_cpus_mttcg = {
     .create_vcpu_thread = mttcg_start_vcpu_thread,
     .kick_vcpu_thread = mttcg_kick_vcpu_thread,
 
-    .handle_interrupt = tcg_handle_interrupt,
+    .handle_interrupt = tcg_cpus_handle_interrupt,
 };
diff --git a/accel/tcg/tcg-cpus-rr.c b/accel/tcg/tcg-cpus-rr.c
index f3b262bec7..0181d2e4eb 100644
--- a/accel/tcg/tcg-cpus-rr.c
+++ b/accel/tcg/tcg-cpus-rr.c
@@ -37,7 +37,7 @@
 #include "tcg-cpus-icount.h"
 
 /* Kick all RR vCPUs */
-void qemu_cpu_kick_rr_cpus(CPUState *unused)
+void rr_kick_vcpu_thread(CPUState *unused)
 {
     CPUState *cpu;
 
@@ -58,62 +58,62 @@ void qemu_cpu_kick_rr_cpus(CPUState *unused)
  * idleness is complete.
  */
 
-static QEMUTimer *tcg_kick_vcpu_timer;
-static CPUState *tcg_current_rr_cpu;
+static QEMUTimer *rr_kick_vcpu_timer;
+static CPUState *rr_current_cpu;
 
 #define TCG_KICK_PERIOD (NANOSECONDS_PER_SECOND / 10)
 
-static inline int64_t qemu_tcg_next_kick(void)
+static inline int64_t rr_next_kick_time(void)
 {
     return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + TCG_KICK_PERIOD;
 }
 
 /* Kick the currently round-robin scheduled vCPU to next */
-static void qemu_cpu_kick_rr_next_cpu(void)
+static void rr_kick_next_cpu(void)
 {
     CPUState *cpu;
     do {
-        cpu = qatomic_mb_read(&tcg_current_rr_cpu);
+        cpu = qatomic_mb_read(&rr_current_cpu);
         if (cpu) {
             cpu_exit(cpu);
         }
-    } while (cpu != qatomic_mb_read(&tcg_current_rr_cpu));
+    } while (cpu != qatomic_mb_read(&rr_current_cpu));
 }
 
-static void kick_tcg_thread(void *opaque)
+static void rr_kick_thread(void *opaque)
 {
-    timer_mod(tcg_kick_vcpu_timer, qemu_tcg_next_kick());
-    qemu_cpu_kick_rr_next_cpu();
+    timer_mod(rr_kick_vcpu_timer, rr_next_kick_time());
+    rr_kick_next_cpu();
 }
 
-static void start_tcg_kick_timer(void)
+static void rr_start_kick_timer(void)
 {
-    if (!tcg_kick_vcpu_timer && CPU_NEXT(first_cpu)) {
-        tcg_kick_vcpu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                           kick_tcg_thread, NULL);
+    if (!rr_kick_vcpu_timer && CPU_NEXT(first_cpu)) {
+        rr_kick_vcpu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                           rr_kick_thread, NULL);
     }
-    if (tcg_kick_vcpu_timer && !timer_pending(tcg_kick_vcpu_timer)) {
-        timer_mod(tcg_kick_vcpu_timer, qemu_tcg_next_kick());
+    if (rr_kick_vcpu_timer && !timer_pending(rr_kick_vcpu_timer)) {
+        timer_mod(rr_kick_vcpu_timer, rr_next_kick_time());
     }
 }
 
-static void stop_tcg_kick_timer(void)
+static void rr_stop_kick_timer(void)
 {
-    if (tcg_kick_vcpu_timer && timer_pending(tcg_kick_vcpu_timer)) {
-        timer_del(tcg_kick_vcpu_timer);
+    if (rr_kick_vcpu_timer && timer_pending(rr_kick_vcpu_timer)) {
+        timer_del(rr_kick_vcpu_timer);
     }
 }
 
-static void qemu_tcg_rr_wait_io_event(void)
+static void rr_wait_io_event(void)
 {
     CPUState *cpu;
 
     while (all_cpu_threads_idle()) {
-        stop_tcg_kick_timer();
+        rr_stop_kick_timer();
         qemu_cond_wait_iothread(first_cpu->halt_cond);
     }
 
-    start_tcg_kick_timer();
+    rr_start_kick_timer();
 
     CPU_FOREACH(cpu) {
         qemu_wait_io_event_common(cpu);
@@ -124,13 +124,13 @@ static void qemu_tcg_rr_wait_io_event(void)
  * Destroy any remaining vCPUs which have been unplugged and have
  * finished running
  */
-static void deal_with_unplugged_cpus(void)
+static void rr_deal_with_unplugged_cpus(void)
 {
     CPUState *cpu;
 
     CPU_FOREACH(cpu) {
         if (cpu->unplug && !cpu_can_run(cpu)) {
-            qemu_tcg_destroy_vcpu(cpu);
+            tcg_cpus_destroy(cpu);
             break;
         }
     }
@@ -144,7 +144,7 @@ static void deal_with_unplugged_cpus(void)
  * elsewhere.
  */
 
-static void *tcg_rr_cpu_thread_fn(void *arg)
+static void *rr_cpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
 
@@ -171,7 +171,7 @@ static void *tcg_rr_cpu_thread_fn(void *arg)
         }
     }
 
-    start_tcg_kick_timer();
+    rr_start_kick_timer();
 
     cpu = first_cpu;
 
@@ -190,7 +190,7 @@ static void *tcg_rr_cpu_thread_fn(void *arg)
              * Run the timers here.  This is much more efficient than
              * waking up the I/O thread and waiting for completion.
              */
-            handle_icount_deadline();
+            icount_handle_deadline();
         }
 
         replay_mutex_unlock();
@@ -201,7 +201,7 @@ static void *tcg_rr_cpu_thread_fn(void *arg)
 
         while (cpu && cpu_work_list_empty(cpu) && !cpu->exit_request) {
 
-            qatomic_mb_set(&tcg_current_rr_cpu, cpu);
+            qatomic_mb_set(&rr_current_cpu, cpu);
             current_cpu = cpu;
 
             qemu_clock_enable(QEMU_CLOCK_VIRTUAL,
@@ -212,11 +212,11 @@ static void *tcg_rr_cpu_thread_fn(void *arg)
 
                 qemu_mutex_unlock_iothread();
                 if (icount_enabled()) {
-                    prepare_icount_for_run(cpu);
+                    icount_prepare_for_run(cpu);
                 }
-                r = tcg_cpu_exec(cpu);
+                r = tcg_cpus_exec(cpu);
                 if (icount_enabled()) {
-                    process_icount_data(cpu);
+                    icount_process_data(cpu);
                 }
                 qemu_mutex_lock_iothread();
 
@@ -240,7 +240,7 @@ static void *tcg_rr_cpu_thread_fn(void *arg)
         } /* while (cpu && !cpu->exit_request).. */
 
         /* Does not need qatomic_mb_set because a spurious wakeup is okay.  */
-        qatomic_set(&tcg_current_rr_cpu, NULL);
+        qatomic_set(&rr_current_cpu, NULL);
 
         if (cpu && cpu->exit_request) {
             qatomic_mb_set(&cpu->exit_request, 0);
@@ -254,8 +254,8 @@ static void *tcg_rr_cpu_thread_fn(void *arg)
             qemu_notify_event();
         }
 
-        qemu_tcg_rr_wait_io_event();
-        deal_with_unplugged_cpus();
+        rr_wait_io_event();
+        rr_deal_with_unplugged_cpus();
     }
 
     rcu_unregister_thread();
@@ -279,7 +279,7 @@ void rr_start_vcpu_thread(CPUState *cpu)
         /* share a single thread for all cpus with TCG */
         snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "ALL CPUs/TCG");
         qemu_thread_create(cpu->thread, thread_name,
-                           tcg_rr_cpu_thread_fn,
+                           rr_cpu_thread_fn,
                            cpu, QEMU_THREAD_JOINABLE);
 
         single_tcg_halt_cond = cpu->halt_cond;
@@ -299,7 +299,7 @@ void rr_start_vcpu_thread(CPUState *cpu)
 
 const CpusAccel tcg_cpus_rr = {
     .create_vcpu_thread = rr_start_vcpu_thread,
-    .kick_vcpu_thread = qemu_cpu_kick_rr_cpus,
+    .kick_vcpu_thread = rr_kick_vcpu_thread,
 
-    .handle_interrupt = tcg_handle_interrupt,
+    .handle_interrupt = tcg_cpus_handle_interrupt,
 };
diff --git a/accel/tcg/tcg-cpus.c b/accel/tcg/tcg-cpus.c
index 86fd09545a..e335f9f155 100644
--- a/accel/tcg/tcg-cpus.c
+++ b/accel/tcg/tcg-cpus.c
@@ -38,12 +38,12 @@
 
 /* common functionality among all TCG variants */
 
-void qemu_tcg_destroy_vcpu(CPUState *cpu)
+void tcg_cpus_destroy(CPUState *cpu)
 {
     cpu_thread_signal_destroyed(cpu);
 }
 
-int tcg_cpu_exec(CPUState *cpu)
+int tcg_cpus_exec(CPUState *cpu)
 {
     int ret;
 #ifdef CONFIG_PROFILER
@@ -64,7 +64,7 @@ int tcg_cpu_exec(CPUState *cpu)
 }
 
 /* mask must never be zero, except for A20 change call */
-void tcg_handle_interrupt(CPUState *cpu, int mask)
+void tcg_cpus_handle_interrupt(CPUState *cpu, int mask)
 {
     g_assert(qemu_mutex_iothread_locked());
 
-- 
2.25.1


