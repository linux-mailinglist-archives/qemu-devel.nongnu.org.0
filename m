Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BA86A829F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:50:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiAJ-0006Do-BE; Thu, 02 Mar 2023 07:36:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7H-0002ua-Pb
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7C-0003eG-CM
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s1Kwb/OQQGKmkQyhJ4EJcuGR+ecu59Z8zUinJBSa8Ng=;
 b=WQjx8VC/Kr7w6F2zzBNbRNFGm2TNIWhYRiSZBFAhbZ+HE7gJUyyyRlWLjO7UQthY11I/7/
 gbJ93Janj20FAded8zAB3b3Lm6iA5M4EFnynOkLQdM+D5ysniofiLoTEmQC/IDxCH2BI0c
 BAw4jf/TWHKXpLWw6XFsyVWJS7kwkTI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-d7WIpaFiMnSAXFPnOTKcww-1; Thu, 02 Mar 2023 07:32:52 -0500
X-MC-Unique: d7WIpaFiMnSAXFPnOTKcww-1
Received: by mail-wm1-f69.google.com with SMTP id
 z6-20020a7bc7c6000000b003e0107732f4so5700684wmk.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s1Kwb/OQQGKmkQyhJ4EJcuGR+ecu59Z8zUinJBSa8Ng=;
 b=t2sG3WrYt4ROo402Y+b27Xxlap/j4WrkxNXT+LRHM7X6d8w4cExAdMRuV4CAfTLjqn
 QAMhtOu3WePM3tR8Dbbo87PfHHX6EjafzOsUAKi80yPdj/c1CFvNm4f4pfTZO3aT1dOR
 IZ2A7dV3aX8olPDfSHryiJbxrrm4oOArlUgqqiVhzfSa9WyHNgGl6nJitv9QQU0wxC4H
 wE1sRCYHCxB2A0Yt4cDX6JgT6PqZiF0gX+Ak0E1831LUingiDOAcuVwWjcJIrXpju3K6
 sHiUUgPw9lo+k/mmneOKJJNDPAe5aKADGd5jSlt04r/ob6XwyYFvM4CpLlgguvRGALXj
 a0vA==
X-Gm-Message-State: AO0yUKXhsUjKouelXjWfcY12TqYK1kYzcM1wS8m9DSp4404/UJgCDbuI
 5yzyOJQuWz2b7lU5gSDHjaF4/nHDHcMXXwpJHFqNS8WPAl1czzRh+72xCkrcjq1kQqmNb2KPt50
 eqQ07IOcAmWlLQnBMORhRSU7zD7ZEuk447y4JAUAgDmYEDyCPhaOaL6mZlRYPs6Cxu3GR3+yqSn
 M=
X-Received: by 2002:adf:f404:0:b0:2c5:5687:5ed5 with SMTP id
 g4-20020adff404000000b002c556875ed5mr6980473wro.18.1677760370705; 
 Thu, 02 Mar 2023 04:32:50 -0800 (PST)
X-Google-Smtp-Source: AK7set/lpT4XOw1XakJXHblowf8FeXZWuSjSO/OrTW5vldUMFCSyl/ZjVUTbfi9PWh/ctVt6UjcLpg==
X-Received: by 2002:adf:f404:0:b0:2c5:5687:5ed5 with SMTP id
 g4-20020adff404000000b002c556875ed5mr6980458wro.18.1677760370405; 
 Thu, 02 Mar 2023 04:32:50 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d51c5000000b002c70d97af78sm15427242wrv.85.2023.03.02.04.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [PULL 47/62] i386/xen: handle PV timer hypercalls
Date: Thu,  2 Mar 2023 13:30:14 +0100
Message-Id: <20230302123029.153265-48-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Joao Martins <joao.m.martins@oracle.com>

Introduce support for one shot and periodic mode of Xen PV timers,
whereby timer interrupts come through a special virq event channel
with deadlines being set through:

1) set_timer_op hypercall (only oneshot)
2) vcpu_op hypercall for {set,stop}_{singleshot,periodic}_timer
hypercalls

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c  |  31 +++++
 hw/i386/kvm/xen_evtchn.h  |   2 +
 target/i386/cpu.h         |   5 +
 target/i386/kvm/xen-emu.c | 271 +++++++++++++++++++++++++++++++++++++-
 target/i386/machine.c     |   1 +
 5 files changed, 308 insertions(+), 2 deletions(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index f39b751ff999..71ed48018942 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -1222,6 +1222,37 @@ int xen_evtchn_send_op(struct evtchn_send *send)
     return ret;
 }
 
+int xen_evtchn_set_port(uint16_t port)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    XenEvtchnPort *p;
+    int ret = -EINVAL;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (!valid_port(port)) {
+        return -EINVAL;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    p = &s->port_table[port];
+
+    /* QEMU has no business sending to anything but these */
+    if (p->type == EVTCHNSTAT_virq ||
+        (p->type == EVTCHNSTAT_interdomain &&
+         (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU))) {
+        set_port_pending(s, port);
+        ret = 0;
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
+
 EvtchnInfoList *qmp_xen_event_list(Error **errp)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index b03c3108bcba..24611478b87a 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -20,6 +20,8 @@ int xen_evtchn_set_callback_param(uint64_t param);
 void xen_evtchn_connect_gsis(qemu_irq *system_gsis);
 void xen_evtchn_set_callback_level(int level);
 
+int xen_evtchn_set_port(uint16_t port);
+
 struct evtchn_status;
 struct evtchn_close;
 struct evtchn_unmask;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 7227a8ec08d8..d243e290d385 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -26,6 +26,7 @@
 #include "exec/cpu-defs.h"
 #include "qapi/qapi-types-common.h"
 #include "qemu/cpu-float.h"
+#include "qemu/timer.h"
 
 #define XEN_NR_VIRQS 24
 
@@ -1811,6 +1812,10 @@ typedef struct CPUArchState {
     bool xen_callback_asserted;
     uint16_t xen_virq[XEN_NR_VIRQS];
     uint64_t xen_singleshot_timer_ns;
+    QEMUTimer *xen_singleshot_timer;
+    uint64_t xen_periodic_timer_period;
+    QEMUTimer *xen_periodic_timer;
+    QemuMutex xen_timers_lock;
 #endif
 #if defined(CONFIG_HVF)
     HVFX86LazyFlags hvf_lflags;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 3b46cab1dae0..c210ff9d91be 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -38,6 +38,9 @@
 
 #include "xen-compat.h"
 
+static void xen_vcpu_singleshot_timer_event(void *opaque);
+static void xen_vcpu_periodic_timer_event(void *opaque);
+
 #ifdef TARGET_X86_64
 #define hypercall_compat32(longmode) (!(longmode))
 #else
@@ -201,6 +204,23 @@ int kvm_xen_init_vcpu(CPUState *cs)
     env->xen_vcpu_time_info_gpa = INVALID_GPA;
     env->xen_vcpu_runstate_gpa = INVALID_GPA;
 
+    qemu_mutex_init(&env->xen_timers_lock);
+    env->xen_singleshot_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                             xen_vcpu_singleshot_timer_event,
+                                             cpu);
+    if (!env->xen_singleshot_timer) {
+        return -ENOMEM;
+    }
+    env->xen_singleshot_timer->opaque = cs;
+
+    env->xen_periodic_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                           xen_vcpu_periodic_timer_event,
+                                           cpu);
+    if (!env->xen_periodic_timer) {
+        return -ENOMEM;
+    }
+    env->xen_periodic_timer->opaque = cs;
+
     return 0;
 }
 
@@ -232,7 +252,8 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
                          1 << XENFEAT_writable_descriptor_tables |
                          1 << XENFEAT_auto_translated_physmap |
                          1 << XENFEAT_supervisor_mode_kernel |
-                         1 << XENFEAT_hvm_callback_vector;
+                         1 << XENFEAT_hvm_callback_vector |
+                         1 << XENFEAT_hvm_safe_pvclock;
         }
 
         err = kvm_copy_to_gva(CPU(cpu), arg, &fi, sizeof(fi));
@@ -878,13 +899,208 @@ static int vcpuop_register_runstate_info(CPUState *cs, CPUState *target,
     return 0;
 }
 
+static uint64_t kvm_get_current_ns(void)
+{
+    struct kvm_clock_data data;
+    int ret;
+
+    ret = kvm_vm_ioctl(kvm_state, KVM_GET_CLOCK, &data);
+    if (ret < 0) {
+        fprintf(stderr, "KVM_GET_CLOCK failed: %s\n", strerror(ret));
+                abort();
+    }
+
+    return data.clock;
+}
+
+static void xen_vcpu_singleshot_timer_event(void *opaque)
+{
+    CPUState *cpu = opaque;
+    CPUX86State *env = &X86_CPU(cpu)->env;
+    uint16_t port = env->xen_virq[VIRQ_TIMER];
+
+    if (likely(port)) {
+        xen_evtchn_set_port(port);
+    }
+
+    qemu_mutex_lock(&env->xen_timers_lock);
+    env->xen_singleshot_timer_ns = 0;
+    qemu_mutex_unlock(&env->xen_timers_lock);
+}
+
+static void xen_vcpu_periodic_timer_event(void *opaque)
+{
+    CPUState *cpu = opaque;
+    CPUX86State *env = &X86_CPU(cpu)->env;
+    uint16_t port = env->xen_virq[VIRQ_TIMER];
+    int64_t qemu_now;
+
+    if (likely(port)) {
+        xen_evtchn_set_port(port);
+    }
+
+    qemu_mutex_lock(&env->xen_timers_lock);
+
+    qemu_now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    timer_mod_ns(env->xen_periodic_timer,
+                 qemu_now + env->xen_periodic_timer_period);
+
+    qemu_mutex_unlock(&env->xen_timers_lock);
+}
+
+static int do_set_periodic_timer(CPUState *target, uint64_t period_ns)
+{
+    CPUX86State *tenv = &X86_CPU(target)->env;
+    int64_t qemu_now;
+
+    timer_del(tenv->xen_periodic_timer);
+
+    qemu_mutex_lock(&tenv->xen_timers_lock);
+
+    qemu_now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    timer_mod_ns(tenv->xen_periodic_timer, qemu_now + period_ns);
+    tenv->xen_periodic_timer_period = period_ns;
+
+    qemu_mutex_unlock(&tenv->xen_timers_lock);
+    return 0;
+}
+
+#define MILLISECS(_ms)  ((int64_t)((_ms) * 1000000ULL))
+#define MICROSECS(_us)  ((int64_t)((_us) * 1000ULL))
+#define STIME_MAX ((time_t)((int64_t)~0ull >> 1))
+/* Chosen so (NOW() + delta) wont overflow without an uptime of 200 years */
+#define STIME_DELTA_MAX ((int64_t)((uint64_t)~0ull >> 2))
+
+static int vcpuop_set_periodic_timer(CPUState *cs, CPUState *target,
+                                     uint64_t arg)
+{
+    struct vcpu_set_periodic_timer spt;
+
+    qemu_build_assert(sizeof(spt) == 8);
+    if (kvm_copy_from_gva(cs, arg, &spt, sizeof(spt))) {
+        return -EFAULT;
+    }
+
+    if (spt.period_ns < MILLISECS(1) || spt.period_ns > STIME_DELTA_MAX) {
+        return -EINVAL;
+    }
+
+    return do_set_periodic_timer(target, spt.period_ns);
+}
+
+static int vcpuop_stop_periodic_timer(CPUState *target)
+{
+    CPUX86State *tenv = &X86_CPU(target)->env;
+
+    qemu_mutex_lock(&tenv->xen_timers_lock);
+
+    timer_del(tenv->xen_periodic_timer);
+    tenv->xen_periodic_timer_period = 0;
+
+    qemu_mutex_unlock(&tenv->xen_timers_lock);
+    return 0;
+}
+
+static int do_set_singleshot_timer(CPUState *cs, uint64_t timeout_abs,
+                                   bool future, bool linux_wa)
+{
+    CPUX86State *env = &X86_CPU(cs)->env;
+    int64_t now = kvm_get_current_ns();
+    int64_t qemu_now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    int64_t delta = timeout_abs - now;
+
+    if (future && timeout_abs < now) {
+        return -ETIME;
+    }
+
+    if (linux_wa && unlikely((int64_t)timeout_abs < 0 ||
+                             (delta > 0 && (uint32_t)(delta >> 50) != 0))) {
+        /*
+         * Xen has a 'Linux workaround' in do_set_timer_op() which checks
+         * for negative absolute timeout values (caused by integer
+         * overflow), and for values about 13 days in the future (2^50ns)
+         * which would be caused by jiffies overflow. For those cases, it
+         * sets the timeout 100ms in the future (not *too* soon, since if
+         * a guest really did set a long timeout on purpose we don't want
+         * to keep churning CPU time by waking it up).
+         */
+        delta = (100 * SCALE_MS);
+        timeout_abs = now + delta;
+    }
+
+    qemu_mutex_lock(&env->xen_timers_lock);
+
+    timer_mod_ns(env->xen_singleshot_timer, qemu_now + delta);
+    env->xen_singleshot_timer_ns = now + delta;
+
+    qemu_mutex_unlock(&env->xen_timers_lock);
+    return 0;
+}
+
+static int vcpuop_set_singleshot_timer(CPUState *cs, uint64_t arg)
+{
+    struct vcpu_set_singleshot_timer sst = { 0 };
+
+    /*
+     * The struct is a uint64_t followed by a uint32_t. On 32-bit that
+     * makes it 12 bytes. On 64-bit it gets padded to 16. The parts
+     * that get used are identical, and there's four bytes of padding
+     * unused at the end. For true Xen compatibility we should attempt
+     * to copy the full 16 bytes from 64-bit guests, and return -EFAULT
+     * if we can't get the padding too. But that's daft. Just copy what
+     * we need.
+     */
+    qemu_build_assert(offsetof(struct vcpu_set_singleshot_timer, flags) == 8);
+    qemu_build_assert(sizeof(sst) >= 12);
+
+    if (kvm_copy_from_gva(cs, arg, &sst, 12)) {
+        return -EFAULT;
+    }
+
+    return do_set_singleshot_timer(cs, sst.timeout_abs_ns,
+                                   !!(sst.flags & VCPU_SSHOTTMR_future),
+                                   false);
+}
+
+static int vcpuop_stop_singleshot_timer(CPUState *cs)
+{
+    CPUX86State *env = &X86_CPU(cs)->env;
+
+    qemu_mutex_lock(&env->xen_timers_lock);
+
+    timer_del(env->xen_singleshot_timer);
+    env->xen_singleshot_timer_ns = 0;
+
+    qemu_mutex_unlock(&env->xen_timers_lock);
+    return 0;
+}
+
+static bool kvm_xen_hcall_set_timer_op(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                       uint64_t timeout)
+{
+    int err;
+
+    if (unlikely(timeout == 0)) {
+        err = vcpuop_stop_singleshot_timer(CPU(cpu));
+    } else {
+        err = do_set_singleshot_timer(CPU(cpu), timeout, false, true);
+    }
+    exit->u.hcall.result = err;
+    return true;
+}
+
 static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                   int cmd, int vcpu_id, uint64_t arg)
 {
-    CPUState *dest = qemu_get_cpu(vcpu_id);
     CPUState *cs = CPU(cpu);
+    CPUState *dest = cs->cpu_index == vcpu_id ? cs : qemu_get_cpu(vcpu_id);
     int err;
 
+    if (!dest) {
+        err = -ENOENT;
+        goto out;
+    }
+
     switch (cmd) {
     case VCPUOP_register_runstate_memory_area:
         err = vcpuop_register_runstate_info(cs, dest, arg);
@@ -895,11 +1111,34 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     case VCPUOP_register_vcpu_info:
         err = vcpuop_register_vcpu_info(cs, dest, arg);
         break;
+    case VCPUOP_set_singleshot_timer: {
+        if (cs->cpu_index == vcpu_id) {
+            err = vcpuop_set_singleshot_timer(dest, arg);
+        } else {
+            err = -EINVAL;
+        }
+        break;
+    }
+    case VCPUOP_stop_singleshot_timer:
+        if (cs->cpu_index == vcpu_id) {
+            err = vcpuop_stop_singleshot_timer(dest);
+        } else {
+            err = -EINVAL;
+        }
+        break;
+    case VCPUOP_set_periodic_timer: {
+        err = vcpuop_set_periodic_timer(cs, dest, arg);
+        break;
+    }
+    case VCPUOP_stop_periodic_timer:
+        err = vcpuop_stop_periodic_timer(dest);
+        break;
 
     default:
         return false;
     }
 
+ out:
     exit->u.hcall.result = err;
     return true;
 }
@@ -1249,6 +1488,16 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     }
 
     switch (code) {
+    case __HYPERVISOR_set_timer_op:
+        if (exit->u.hcall.longmode) {
+            return kvm_xen_hcall_set_timer_op(exit, cpu,
+                                              exit->u.hcall.params[0]);
+        } else {
+            /* In 32-bit mode, the 64-bit timer value is in two args. */
+            uint64_t val = ((uint64_t)exit->u.hcall.params[1]) << 32 |
+                (uint32_t)exit->u.hcall.params[0];
+            return kvm_xen_hcall_set_timer_op(exit, cpu, val);
+        }
     case __HYPERVISOR_grant_table_op:
         return kvm_xen_hcall_gnttab_op(exit, cpu, exit->u.hcall.params[0],
                                        exit->u.hcall.params[1],
@@ -1358,7 +1607,25 @@ int kvm_put_xen_state(CPUState *cs)
         }
     }
 
+    if (env->xen_periodic_timer_period) {
+        ret = do_set_periodic_timer(cs, env->xen_periodic_timer_period);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
     if (!kvm_xen_has_cap(EVTCHN_SEND)) {
+        /*
+         * If the kernel has EVTCHN_SEND support then it handles timers too,
+         * so the timer will be restored by kvm_xen_set_vcpu_timer() below.
+         */
+        if (env->xen_singleshot_timer_ns) {
+            ret = do_set_singleshot_timer(cs, env->xen_singleshot_timer_ns,
+                                    false, false);
+            if (ret < 0) {
+                return ret;
+            }
+        }
         return 0;
     }
 
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 603a1077e34a..c7ac8084b22c 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1277,6 +1277,7 @@ static const VMStateDescription vmstate_xen_vcpu = {
         VMSTATE_UINT8(env.xen_vcpu_callback_vector, X86CPU),
         VMSTATE_UINT16_ARRAY(env.xen_virq, X86CPU, XEN_NR_VIRQS),
         VMSTATE_UINT64(env.xen_singleshot_timer_ns, X86CPU),
+        VMSTATE_UINT64(env.xen_periodic_timer_period, X86CPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.39.1


