Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1416A82C0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:53:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi6J-0001OT-Pb; Thu, 02 Mar 2023 07:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6C-000153-UA
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6A-0003Al-UE
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iUu22BXVf+ZRbreJqmfzXzlEonPrzNJdVobwNZIzTgU=;
 b=KGH33ftEcEQoQY7qPWmJH5wgEP1lfZdcGtgoGsA2MUlOZYMNbo4j2vElbQSiJTWkgGT8LQ
 AAVO3LlEMJDLTnD1PlkKZa2DS80CG4RPLl0lhq8xZBjh1HdFWvdWlrNhCgIBKx3csyXaT4
 eJ3h2FbJfU6MLJ4bje5hW3LPnoGm+EQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-cqvtmrPSPF2FaBSirpy7ig-1; Thu, 02 Mar 2023 07:31:49 -0500
X-MC-Unique: cqvtmrPSPF2FaBSirpy7ig-1
Received: by mail-wm1-f70.google.com with SMTP id
 4-20020a05600c024400b003eb2e295c05so5712480wmj.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iUu22BXVf+ZRbreJqmfzXzlEonPrzNJdVobwNZIzTgU=;
 b=dOxTyZ10SfkrGnO2jZ0fsrvrpHrKmBUELMJ1FGcn5+y5eTUYTBSFiU+frxGd7TZYAU
 sO0hch/Cp4neBy9AvkrJSFJWJUA5UNj1xJlT+aFon+qLZCgMU9U3gs+Z2jkJIg/bNmrF
 PIUavCGCrQS7tJsah0HO2eIOOrQtan4Ut84rPlEyE6Z6bVZ6Ykonx6s0MR/yEkNAhbVH
 kNdKIzOyUT2qQPv4K7A1pzfVn0d6F/EVnWuT/Ob/AGbH2M9lySyqvJFLG7fO3E+989ST
 tmo1aogRGsQHemZjvSrHzIY6OGRa2+oYTaxkGoZZgFfsy0234iz6mFMUuaGf/KF4roe0
 +gwQ==
X-Gm-Message-State: AO0yUKU8s56mMRGEZxX1bGDs8ATVew/+6/i5dXZEi6aW9xPnCFJEO2Nn
 C0QYZtueSTdISzgaQnyAXIn2vRpRYIinvUAPr5pnGZHWCeP5j0FvayzQqfBQdBw3/+1GVaARRHh
 kXTQYWYS5YnKJsu6NUJEe7v6DXDQ1BDB/t66quwUnVd2JelAHeHkYRbUs/jvuGduVpHkKQV9t5z
 0=
X-Received: by 2002:a05:600c:5252:b0:3ea:8ed9:8f03 with SMTP id
 fc18-20020a05600c525200b003ea8ed98f03mr7513514wmb.24.1677760307581; 
 Thu, 02 Mar 2023 04:31:47 -0800 (PST)
X-Google-Smtp-Source: AK7set+XtLEyc0TR+1fBniFlfaN8hHWE15qiKG2sOI6aZrDjWBhE6qXhj+EdAemR298WeznuyaP35g==
X-Received: by 2002:a05:600c:5252:b0:3ea:8ed9:8f03 with SMTP id
 fc18-20020a05600c525200b003ea8ed98f03mr7513494wmb.24.1677760307276; 
 Thu, 02 Mar 2023 04:31:47 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a05600c46d200b003eaee9e0d22sm3096749wmo.33.2023.03.02.04.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:46 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ankur Arora <ankur.a.arora@oracle.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [PULL 25/62] i386/xen: implement HVMOP_set_evtchn_upcall_vector
Date: Thu,  2 Mar 2023 13:29:52 +0100
Message-Id: <20230302123029.153265-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

From: Ankur Arora <ankur.a.arora@oracle.com>

The HVMOP_set_evtchn_upcall_vector hypercall sets the per-vCPU upcall
vector, to be delivered to the local APIC just like an MSI (with an EOI).

This takes precedence over the system-wide delivery method set by the
HVMOP_set_param hypercall with HVM_PARAM_CALLBACK_IRQ. It's used by
Windows and Xen (PV shim) guests but normally not by Linux.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Rework for upstream kernel changes and split from HVMOP_set_param]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/cpu.h            |  1 +
 target/i386/kvm/trace-events |  1 +
 target/i386/kvm/xen-emu.c    | 84 ++++++++++++++++++++++++++++++++++--
 target/i386/machine.c        |  1 +
 4 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5613df6d75a8..e882c4e251c1 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1803,6 +1803,7 @@ typedef struct CPUArchState {
     uint64_t xen_vcpu_info_default_gpa;
     uint64_t xen_vcpu_time_info_gpa;
     uint64_t xen_vcpu_runstate_gpa;
+    uint8_t xen_vcpu_callback_vector;
 #endif
 #if defined(CONFIG_HVF)
     HVFX86LazyFlags hvf_lflags;
diff --git a/target/i386/kvm/trace-events b/target/i386/kvm/trace-events
index a840e0333de7..b365a8e8e282 100644
--- a/target/i386/kvm/trace-events
+++ b/target/i386/kvm/trace-events
@@ -11,3 +11,4 @@ kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1
 kvm_xen_soft_reset(void) ""
 kvm_xen_set_shared_info(uint64_t gfn) "shared info at gfn 0x%" PRIx64
 kvm_xen_set_vcpu_attr(int cpu, int type, uint64_t gpa) "vcpu attr cpu %d type %d gpa 0x%" PRIx64
+kvm_xen_set_vcpu_callback(int cpu, int vector) "callback vcpu %d vector %d"
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index ac143c05a441..e9a4422d93f0 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -27,6 +27,7 @@
 #include "hw/xen/interface/sched.h"
 #include "hw/xen/interface/memory.h"
 #include "hw/xen/interface/hvm/hvm_op.h"
+#include "hw/xen/interface/hvm/params.h"
 #include "hw/xen/interface/vcpu.h"
 #include "hw/xen/interface/event_channel.h"
 
@@ -193,7 +194,8 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
             fi.submap |= 1 << XENFEAT_writable_page_tables |
                          1 << XENFEAT_writable_descriptor_tables |
                          1 << XENFEAT_auto_translated_physmap |
-                         1 << XENFEAT_supervisor_mode_kernel;
+                         1 << XENFEAT_supervisor_mode_kernel |
+                         1 << XENFEAT_hvm_callback_vector;
         }
 
         err = kvm_copy_to_gva(CPU(cpu), arg, &fi, sizeof(fi));
@@ -220,6 +222,31 @@ static int kvm_xen_set_vcpu_attr(CPUState *cs, uint16_t type, uint64_t gpa)
     return kvm_vcpu_ioctl(cs, KVM_XEN_VCPU_SET_ATTR, &xhsi);
 }
 
+static int kvm_xen_set_vcpu_callback_vector(CPUState *cs)
+{
+    uint8_t vector = X86_CPU(cs)->env.xen_vcpu_callback_vector;
+    struct kvm_xen_vcpu_attr xva;
+
+    xva.type = KVM_XEN_VCPU_ATTR_TYPE_UPCALL_VECTOR;
+    xva.u.vector = vector;
+
+    trace_kvm_xen_set_vcpu_callback(cs->cpu_index, vector);
+
+    return kvm_vcpu_ioctl(cs, KVM_XEN_HVM_SET_ATTR, &xva);
+}
+
+static void do_set_vcpu_callback_vector(CPUState *cs, run_on_cpu_data data)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    env->xen_vcpu_callback_vector = data.host_int;
+
+    if (kvm_xen_has_cap(EVTCHN_SEND)) {
+        kvm_xen_set_vcpu_callback_vector(cs);
+    }
+}
+
 static void do_set_vcpu_info_default_gpa(CPUState *cs, run_on_cpu_data data)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -276,12 +303,16 @@ static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
     env->xen_vcpu_info_default_gpa = INVALID_GPA;
     env->xen_vcpu_time_info_gpa = INVALID_GPA;
     env->xen_vcpu_runstate_gpa = INVALID_GPA;
+    env->xen_vcpu_callback_vector = 0;
 
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, INVALID_GPA);
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO,
                           INVALID_GPA);
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR,
                           INVALID_GPA);
+    if (kvm_xen_has_cap(EVTCHN_SEND)) {
+        kvm_xen_set_vcpu_callback_vector(cs);
+    }
 
 }
 
@@ -458,17 +489,53 @@ static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static int kvm_xen_hcall_evtchn_upcall_vector(struct kvm_xen_exit *exit,
+                                              X86CPU *cpu, uint64_t arg)
+{
+    struct xen_hvm_evtchn_upcall_vector up;
+    CPUState *target_cs;
+
+    /* No need for 32/64 compat handling */
+    qemu_build_assert(sizeof(up) == 8);
+
+    if (kvm_copy_from_gva(CPU(cpu), arg, &up, sizeof(up))) {
+        return -EFAULT;
+    }
+
+    if (up.vector < 0x10) {
+        return -EINVAL;
+    }
+
+    target_cs = qemu_get_cpu(up.vcpu);
+    if (!target_cs) {
+        return -EINVAL;
+    }
+
+    async_run_on_cpu(target_cs, do_set_vcpu_callback_vector,
+                     RUN_ON_CPU_HOST_INT(up.vector));
+    return 0;
+}
+
 static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                  int cmd, uint64_t arg)
 {
+    int ret = -ENOSYS;
     switch (cmd) {
+    case HVMOP_set_evtchn_upcall_vector:
+        ret = kvm_xen_hcall_evtchn_upcall_vector(exit, cpu,
+                                                 exit->u.hcall.params[0]);
+        break;
+
     case HVMOP_pagetable_dying:
-        exit->u.hcall.result = -ENOSYS;
-        return true;
+        ret = -ENOSYS;
+        break;
 
     default:
         return false;
     }
+
+    exit->u.hcall.result = ret;
+    return true;
 }
 
 static int vcpuop_register_vcpu_info(CPUState *cs, CPUState *target,
@@ -812,6 +879,17 @@ int kvm_put_xen_state(CPUState *cs)
         }
     }
 
+    if (!kvm_xen_has_cap(EVTCHN_SEND)) {
+        return 0;
+    }
+
+    if (env->xen_vcpu_callback_vector) {
+        ret = kvm_xen_set_vcpu_callback_vector(cs);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
     return 0;
 }
 
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 3f3d436aaaa0..a4874eda9041 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1274,6 +1274,7 @@ static const VMStateDescription vmstate_xen_vcpu = {
         VMSTATE_UINT64(env.xen_vcpu_info_default_gpa, X86CPU),
         VMSTATE_UINT64(env.xen_vcpu_time_info_gpa, X86CPU),
         VMSTATE_UINT64(env.xen_vcpu_runstate_gpa, X86CPU),
+        VMSTATE_UINT8(env.xen_vcpu_callback_vector, X86CPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.39.1


