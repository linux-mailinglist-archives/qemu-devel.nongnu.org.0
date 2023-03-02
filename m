Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4696A8285
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:44:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi6J-0001Lg-Ga; Thu, 02 Mar 2023 07:31:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi61-0000fk-DQ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5z-000387-Bb
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W0bpVE4uH/lSlO1rU5S3/hK4YldwUzNm6GBRSdsBQeI=;
 b=UJdBnxZs5PzncyqmExgKya7pJzPDHt1S4UkwoNTLEj4Tou0rItMXatSw9q6t83nASIZwc9
 HhvRb2G0FvlZ8K4mNO3YNrs+0JZ0ktV3yUCj8EgMW285elcaGyZp3O5P+a2rU+yRsIrFwc
 ChEIClHQgxaeMyhnzACOCbSbxjl9A4E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-fqk6lhoHNn6svmAOkr6kLA-1; Thu, 02 Mar 2023 07:31:37 -0500
X-MC-Unique: fqk6lhoHNn6svmAOkr6kLA-1
Received: by mail-wm1-f71.google.com with SMTP id
 r7-20020a05600c35c700b003eb3f2c4fb4so1013586wmq.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0bpVE4uH/lSlO1rU5S3/hK4YldwUzNm6GBRSdsBQeI=;
 b=Io23GEKQsr2q4XLdIdFwEx0nHzHjlqaNX9JeOkFQOJxyYb8qm32B3WyE0nu9V1RePa
 Q20zYqENgI21wioJJQi/D6hevd0riEJ3mS2+bcKBaKfiZE9oxMEKKZxPRdMpt+W3DWG7
 i1CfRVb1cl5Dq8kpjq5+Pn330pAJU2DZPlgTLydey/sN/eZ56nq6OUmez1GJMuM0q0Jk
 Xzq0RofBL0UFYhyQ1WsedHMJyAATCi+6ymFZQkD3OogzrKEBuwwTMK8gXBLdCd9mjpA1
 HZ3YGuhv5ViYrsAjv7cPqFHaXRNHckLkRNhUhG9LKBlWEnmilj6NQ6HZUEu/hA+CiwOf
 dJxg==
X-Gm-Message-State: AO0yUKWg/L1PyOMcbePy+iKXmX5xBFQJpRgSWjtR7P0Heoe6DdiWEOW9
 Y/57+epGfhPFXpnwz9SiuOSktPEpAFunOnSELnRnBz6LX/AIj+A0DzPK2IoBXfIM75ihqEbl48X
 g2sEXUKP58ulNyiH5JXFwh1sQ593uJRSEuBJbBnnktADsK71e45EVrLs1xnagvGBSqRmQ2U7sr3
 8=
X-Received: by 2002:a05:600c:a691:b0:3eb:5d17:8ddc with SMTP id
 ip17-20020a05600ca69100b003eb5d178ddcmr2640265wmb.18.1677760295939; 
 Thu, 02 Mar 2023 04:31:35 -0800 (PST)
X-Google-Smtp-Source: AK7set/DXVlL+zY7Dmzmkg0DXvX0pzaHQlNKKdDUujk7s8Sfo+EosoQCwvCmwfHAo93wWhPKuFPQrA==
X-Received: by 2002:a05:600c:a691:b0:3eb:5d17:8ddc with SMTP id
 ip17-20020a05600ca69100b003eb5d178ddcmr2640244wmb.18.1677760295520; 
 Thu, 02 Mar 2023 04:31:35 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a5d4a50000000b002c5526234d2sm15373742wrs.8.2023.03.02.04.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [PULL 21/62] i386/xen: handle VCPUOP_register_vcpu_info
Date: Thu,  2 Mar 2023 13:29:48 +0100
Message-Id: <20230302123029.153265-22-pbonzini@redhat.com>
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

From: Joao Martins <joao.m.martins@oracle.com>

Handle the hypercall to set a per vcpu info, and also wire up the default
vcpu_info in the shared_info page for the first 32 vCPUs.

To avoid deadlock within KVM a vCPU thread must set its *own* vcpu_info
rather than it being set from the context in which the hypercall is
invoked.

Add the vcpu_info (and default) GPA to the vmstate_x86_cpu for migration,
and restore it in kvm_arch_put_registers() appropriately.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/cpu.h            |   2 +
 target/i386/kvm/kvm.c        |  17 ++++
 target/i386/kvm/trace-events |   1 +
 target/i386/kvm/xen-emu.c    | 153 ++++++++++++++++++++++++++++++++++-
 target/i386/kvm/xen-emu.h    |   2 +
 target/i386/machine.c        |  19 +++++
 6 files changed, 191 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5069adfbe7e0..9070efdc5184 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1799,6 +1799,8 @@ typedef struct CPUArchState {
 #endif
 #if defined(CONFIG_KVM)
     struct kvm_nested_state *nested_state;
+    uint64_t xen_vcpu_info_gpa;
+    uint64_t xen_vcpu_info_default_gpa;
 #endif
 #if defined(CONFIG_HVF)
     HVFX86LazyFlags hvf_lflags;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f43e5531bf85..5a144ec0de3a 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4750,6 +4750,15 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
         kvm_arch_set_tsc_khz(cpu);
     }
 
+#ifdef CONFIG_XEN_EMU
+    if (xen_mode == XEN_EMULATE && level == KVM_PUT_FULL_STATE) {
+        ret = kvm_put_xen_state(cpu);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+#endif
+
     ret = kvm_getput_regs(x86_cpu, 1);
     if (ret < 0) {
         return ret;
@@ -4849,6 +4858,14 @@ int kvm_arch_get_registers(CPUState *cs)
     if (ret < 0) {
         goto out;
     }
+#ifdef CONFIG_XEN_EMU
+    if (xen_mode == XEN_EMULATE) {
+        ret = kvm_get_xen_state(cs);
+        if (ret < 0) {
+            goto out;
+        }
+    }
+#endif
     ret = 0;
  out:
     cpu_sync_bndcs_hflags(&cpu->env);
diff --git a/target/i386/kvm/trace-events b/target/i386/kvm/trace-events
index 8e9f269f5671..a840e0333de7 100644
--- a/target/i386/kvm/trace-events
+++ b/target/i386/kvm/trace-events
@@ -10,3 +10,4 @@ kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
 kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1, uint64_t a2, uint64_t ret) "xen_hypercall: cpu %d cpl %d input %" PRIu64 " a0 0x%" PRIx64 " a1 0x%" PRIx64 " a2 0x%" PRIx64" ret 0x%" PRIx64
 kvm_xen_soft_reset(void) ""
 kvm_xen_set_shared_info(uint64_t gfn) "shared info at gfn 0x%" PRIx64
+kvm_xen_set_vcpu_attr(int cpu, int type, uint64_t gpa) "vcpu attr cpu %d type %d gpa 0x%" PRIx64
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index e5ae0a9a386d..30b4789da394 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -119,6 +119,8 @@ int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
 
 int kvm_xen_init_vcpu(CPUState *cs)
 {
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
     int err;
 
     /*
@@ -142,6 +144,9 @@ int kvm_xen_init_vcpu(CPUState *cs)
         }
     }
 
+    env->xen_vcpu_info_gpa = INVALID_GPA;
+    env->xen_vcpu_info_default_gpa = INVALID_GPA;
+
     return 0;
 }
 
@@ -187,10 +192,58 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static int kvm_xen_set_vcpu_attr(CPUState *cs, uint16_t type, uint64_t gpa)
+{
+    struct kvm_xen_vcpu_attr xhsi;
+
+    xhsi.type = type;
+    xhsi.u.gpa = gpa;
+
+    trace_kvm_xen_set_vcpu_attr(cs->cpu_index, type, gpa);
+
+    return kvm_vcpu_ioctl(cs, KVM_XEN_VCPU_SET_ATTR, &xhsi);
+}
+
+static void do_set_vcpu_info_default_gpa(CPUState *cs, run_on_cpu_data data)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    env->xen_vcpu_info_default_gpa = data.host_ulong;
+
+    /* Changing the default does nothing if a vcpu_info was explicitly set. */
+    if (env->xen_vcpu_info_gpa == INVALID_GPA) {
+        kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO,
+                              env->xen_vcpu_info_default_gpa);
+    }
+}
+
+static void do_set_vcpu_info_gpa(CPUState *cs, run_on_cpu_data data)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    env->xen_vcpu_info_gpa = data.host_ulong;
+
+    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO,
+                          env->xen_vcpu_info_gpa);
+}
+
+static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    env->xen_vcpu_info_gpa = INVALID_GPA;
+    env->xen_vcpu_info_default_gpa = INVALID_GPA;
+
+    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, INVALID_GPA);
+}
+
 static int xen_set_shared_info(uint64_t gfn)
 {
     uint64_t gpa = gfn << TARGET_PAGE_BITS;
-    int err;
+    int i, err;
 
     QEMU_IOTHREAD_LOCK_GUARD();
 
@@ -207,6 +260,15 @@ static int xen_set_shared_info(uint64_t gfn)
 
     trace_kvm_xen_set_shared_info(gfn);
 
+    for (i = 0; i < XEN_LEGACY_MAX_VCPUS; i++) {
+        CPUState *cpu = qemu_get_cpu(i);
+        if (cpu) {
+            async_run_on_cpu(cpu, do_set_vcpu_info_default_gpa,
+                             RUN_ON_CPU_HOST_ULONG(gpa));
+        }
+        gpa += sizeof(vcpu_info_t);
+    }
+
     return err;
 }
 
@@ -364,15 +426,43 @@ static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     }
 }
 
+static int vcpuop_register_vcpu_info(CPUState *cs, CPUState *target,
+                                     uint64_t arg)
+{
+    struct vcpu_register_vcpu_info rvi;
+    uint64_t gpa;
+
+    /* No need for 32/64 compat handling */
+    qemu_build_assert(sizeof(rvi) == 16);
+    qemu_build_assert(sizeof(struct vcpu_info) == 64);
+
+    if (!target) {
+        return -ENOENT;
+    }
+
+    if (kvm_copy_from_gva(cs, arg, &rvi, sizeof(rvi))) {
+        return -EFAULT;
+    }
+
+    if (rvi.offset > TARGET_PAGE_SIZE - sizeof(struct vcpu_info)) {
+        return -EINVAL;
+    }
+
+    gpa = ((rvi.mfn << TARGET_PAGE_BITS) + rvi.offset);
+    async_run_on_cpu(target, do_set_vcpu_info_gpa, RUN_ON_CPU_HOST_ULONG(gpa));
+    return 0;
+}
+
 static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                   int cmd, int vcpu_id, uint64_t arg)
 {
+    CPUState *dest = qemu_get_cpu(vcpu_id);
+    CPUState *cs = CPU(cpu);
     int err;
 
     switch (cmd) {
     case VCPUOP_register_vcpu_info:
-        /* no vcpu info placement for now */
-        err = -ENOSYS;
+        err = vcpuop_register_vcpu_info(cs, dest, arg);
         break;
 
     default:
@@ -385,12 +475,17 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
 
 int kvm_xen_soft_reset(void)
 {
+    CPUState *cpu;
     int err;
 
     assert(qemu_mutex_iothread_locked());
 
     trace_kvm_xen_soft_reset();
 
+    CPU_FOREACH(cpu) {
+        async_run_on_cpu(cpu, do_vcpu_soft_reset, RUN_ON_CPU_NULL);
+    }
+
     err = xen_overlay_map_shinfo_page(INVALID_GFN);
     if (err) {
         return err;
@@ -539,3 +634,55 @@ int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
                             exit->u.hcall.result);
     return 0;
 }
+
+int kvm_put_xen_state(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    uint64_t gpa;
+    int ret;
+
+    gpa = env->xen_vcpu_info_gpa;
+    if (gpa == INVALID_GPA) {
+        gpa = env->xen_vcpu_info_default_gpa;
+    }
+
+    if (gpa != INVALID_GPA) {
+        ret = kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, gpa);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
+int kvm_get_xen_state(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    uint64_t gpa;
+
+    /*
+     * The kernel does not mark vcpu_info as dirty when it delivers interrupts
+     * to it. It's up to userspace to *assume* that any page shared thus is
+     * always considered dirty. The shared_info page is different since it's
+     * an overlay and migrated separately anyway.
+     */
+    gpa = env->xen_vcpu_info_gpa;
+    if (gpa == INVALID_GPA) {
+        gpa = env->xen_vcpu_info_default_gpa;
+    }
+    if (gpa != INVALID_GPA) {
+        MemoryRegionSection mrs = memory_region_find(get_system_memory(),
+                                                     gpa,
+                                                     sizeof(struct vcpu_info));
+        if (mrs.mr &&
+            !int128_lt(mrs.size, int128_make64(sizeof(struct vcpu_info)))) {
+            memory_region_set_dirty(mrs.mr, mrs.offset_within_region,
+                                    sizeof(struct vcpu_info));
+        }
+    }
+
+    return 0;
+}
diff --git a/target/i386/kvm/xen-emu.h b/target/i386/kvm/xen-emu.h
index 21faf6bf38fd..452605699abb 100644
--- a/target/i386/kvm/xen-emu.h
+++ b/target/i386/kvm/xen-emu.h
@@ -26,5 +26,7 @@
 int kvm_xen_init(KVMState *s, uint32_t hypercall_msr);
 int kvm_xen_init_vcpu(CPUState *cs);
 int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit);
+int kvm_put_xen_state(CPUState *cs);
+int kvm_get_xen_state(CPUState *cs);
 
 #endif /* QEMU_I386_KVM_XEN_EMU_H */
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 310b12523508..1215e616c8f4 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -6,8 +6,10 @@
 #include "kvm/hyperv.h"
 #include "hw/i386/x86.h"
 #include "kvm/kvm_i386.h"
+#include "hw/xen/xen.h"
 
 #include "sysemu/kvm.h"
+#include "sysemu/kvm_xen.h"
 #include "sysemu/tcg.h"
 
 #include "qemu/error-report.h"
@@ -1257,6 +1259,22 @@ static const VMStateDescription vmstate_nested_state = {
     }
 };
 
+static bool xen_vcpu_needed(void *opaque)
+{
+    return (xen_mode == XEN_EMULATE);
+}
+
+static const VMStateDescription vmstate_xen_vcpu = {
+    .name = "cpu/xen_vcpu",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = xen_vcpu_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.xen_vcpu_info_gpa, X86CPU),
+        VMSTATE_UINT64(env.xen_vcpu_info_default_gpa, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
 #endif
 
 static bool mcg_ext_ctl_needed(void *opaque)
@@ -1716,6 +1734,7 @@ const VMStateDescription vmstate_x86_cpu = {
 #endif
 #ifdef CONFIG_KVM
         &vmstate_nested_state,
+        &vmstate_xen_vcpu,
 #endif
         &vmstate_msr_tsx_ctrl,
         &vmstate_msr_intel_sgx,
-- 
2.39.1


