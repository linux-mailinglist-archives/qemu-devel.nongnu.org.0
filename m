Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D95B54DF13
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 04:23:11 +0200 (CEST)
Received: from localhost ([::1]:54234 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he9Cp-0000rJ-26
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 22:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41412)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1he8a8-0006j8-AW
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:43:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1he8a2-0006cx-PW
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:43:12 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36723)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1he8a2-0006NR-3a
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:43:06 -0400
Received: by mail-wm1-x344.google.com with SMTP id u8so4905974wmm.1
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 18:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HGNVhh5Hqgn3qvbZX5LfBs/YDqW8d0pwwOKzE3d6Mfc=;
 b=kavWPgpGSYu7HeO+l7JgYZl/8yFPTaHsy7lGRkaluVHZNBraHC+THCyzjXZqjI27Q6
 nD+ERgri3DHMqtrkjIm/G+VE8PXind+yNCGPX9g5EwuIXPNJzGIsctgPRNzNSW83DbVU
 4J8Po+UQPxT1QRgrIt3Uplfa5QjhFAbFcBHSXk/JBwN21eYMAUTes3KGLEMKXaWVtZZj
 cFSTT+uBTYLIiD+8tccC+Z+e2+ffAxxzRq/gUB5XZ5XjDL4ZM9HXpYHWmS9ESYK+F1mf
 EN89O1Y6nDqWsIFVKSON0nTJRCH4wQwMdDDCpqBIgkjwztCw7oPcdc0mX2Xo6Xiza2sb
 x1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=HGNVhh5Hqgn3qvbZX5LfBs/YDqW8d0pwwOKzE3d6Mfc=;
 b=rkFCYWH7YrCeAVkceM2oFeQS79nCvQs4Ew8sirhc+DfT/scaGIiIQuYiMNK5ch6k9z
 VF5hjh9FUej6XTB66cW4jMQ5zTQzOCH2Fhd+bo5vSg29yy2aJxbjAPfg3oa2IDQ2ZFrO
 U2mrHe7U2Csu7D5CnGR2iWIQ7bXvdFoKRcD8DImFaTZoylST21Arj4PmBdqKYZFUlsdJ
 MKlDwcEFWJU4qa9agKQ0lg8TnXsj1fkIPyQccL4KpmbMxVP8mcfMhA2FtGep1ds1+diY
 k14Q7BCmQKv3KZLqq6v+vV6ft6FDCyYJz+YS9SYNnBY86+bI936ZTAYIofKwP0xb6eWv
 9vKg==
X-Gm-Message-State: APjAAAUDQw9gAfr1u8ZvVHtZW1UIZSY2mS863TshBWDTTw3zlC8IFhvX
 9O1j5CR3z0P+6y8rAC4BZEpq/Ugq
X-Google-Smtp-Source: APXvYqz/OU8QhpyVMe+uLT5SLgW3Sdg0G80KpirkhzNZBcmeHSqG6lE27EB1UoXnfCqK0D1l+/iO2w==
X-Received: by 2002:a1c:40c6:: with SMTP id n189mr1486992wma.118.1561081372634; 
 Thu, 20 Jun 2019 18:42:52 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id d1sm1123125wru.41.2019.06.20.18.42.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 18:42:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 03:42:25 +0200
Message-Id: <1561081350-3723-21-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561081350-3723-1-git-send-email-pbonzini@redhat.com>
References: <1561081350-3723-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PULL 20/25] target/i386: kvm: Add support for save
 and restore nested state
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
Cc: Liran Alon <liran.alon@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liran Alon <liran.alon@oracle.com>

Kernel commit 8fcc4b5923af ("kvm: nVMX: Introduce KVM_CAP_NESTED_STATE")
introduced new IOCTLs to extract and restore vCPU state related to
Intel VMX & AMD SVM.

Utilize these IOCTLs to add support for migration of VMs which are
running nested hypervisors.

Reviewed-by: Nikita Leshenko <nikita.leshchenko@oracle.com>
Reviewed-by: Maran Wilson <maran.wilson@oracle.com>
Tested-by: Maran Wilson <maran.wilson@oracle.com>
Signed-off-by: Liran Alon <liran.alon@oracle.com>
Message-Id: <20190619162140.133674-9-liran.alon@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c   |   8 ++
 include/sysemu/kvm.h  |   1 +
 target/i386/cpu.h     |   3 +
 target/i386/kvm.c     |  80 ++++++++++++++++++++
 target/i386/machine.c | 198 ++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 290 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f0f5ab8..e3cf728 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -87,6 +87,7 @@ struct KVMState
 #ifdef KVM_CAP_SET_GUEST_DEBUG
     QTAILQ_HEAD(, kvm_sw_breakpoint) kvm_sw_breakpoints;
 #endif
+    int max_nested_state_len;
     int many_ioeventfds;
     int intx_set_mask;
     bool sync_mmu;
@@ -1681,6 +1682,8 @@ static int kvm_init(MachineState *ms)
     s->debugregs = kvm_check_extension(s, KVM_CAP_DEBUGREGS);
 #endif
 
+    s->max_nested_state_len = kvm_check_extension(s, KVM_CAP_NESTED_STATE);
+
 #ifdef KVM_CAP_IRQ_ROUTING
     kvm_direct_msi_allowed = (kvm_check_extension(s, KVM_CAP_SIGNAL_MSI) > 0);
 #endif
@@ -2248,6 +2251,11 @@ int kvm_has_debugregs(void)
     return kvm_state->debugregs;
 }
 
+int kvm_max_nested_state_length(void)
+{
+    return kvm_state->max_nested_state_len;
+}
+
 int kvm_has_many_ioeventfds(void)
 {
     if (!kvm_enabled()) {
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 64f55e5..acd90ae 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -210,6 +210,7 @@ bool kvm_has_sync_mmu(void);
 int kvm_has_vcpu_events(void);
 int kvm_has_robust_singlestep(void);
 int kvm_has_debugregs(void);
+int kvm_max_nested_state_length(void);
 int kvm_has_pit_state2(void);
 int kvm_has_many_ioeventfds(void);
 int kvm_has_gsi_routing(void);
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 4ae4145..16d898c 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1360,6 +1360,9 @@ typedef struct CPUX86State {
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     void *xsave_buf;
 #endif
+#if defined(CONFIG_KVM)
+    struct kvm_nested_state *nested_state;
+#endif
 #if defined(CONFIG_HVF)
     HVFX86EmulatorState *hvf_emul;
 #endif
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index f9872f1..e924663 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1324,6 +1324,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     struct kvm_cpuid_entry2 *c;
     uint32_t signature[3];
     int kvm_base = KVM_CPUID_SIGNATURE;
+    int max_nested_state_len;
     int r;
     Error *local_err = NULL;
 
@@ -1658,6 +1659,24 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (has_xsave) {
         env->xsave_buf = qemu_memalign(4096, sizeof(struct kvm_xsave));
     }
+
+    max_nested_state_len = kvm_max_nested_state_length();
+    if (max_nested_state_len > 0) {
+        assert(max_nested_state_len >= offsetof(struct kvm_nested_state, data));
+        env->nested_state = g_malloc0(max_nested_state_len);
+
+        env->nested_state->size = max_nested_state_len;
+
+        if (IS_INTEL_CPU(env)) {
+            struct kvm_vmx_nested_state_hdr *vmx_hdr =
+                &env->nested_state->hdr.vmx;
+
+            env->nested_state->format = KVM_STATE_NESTED_FORMAT_VMX;
+            vmx_hdr->vmxon_pa = -1ull;
+            vmx_hdr->vmcs12_pa = -1ull;
+        }
+    }
+
     cpu->kvm_msr_buf = g_malloc0(MSR_BUF_SIZE);
 
     if (!(env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_RDTSCP)) {
@@ -1682,12 +1701,18 @@ int kvm_arch_init_vcpu(CPUState *cs)
 int kvm_arch_destroy_vcpu(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
 
     if (cpu->kvm_msr_buf) {
         g_free(cpu->kvm_msr_buf);
         cpu->kvm_msr_buf = NULL;
     }
 
+    if (env->nested_state) {
+        g_free(env->nested_state);
+        env->nested_state = NULL;
+    }
+
     return 0;
 }
 
@@ -3411,6 +3436,52 @@ static int kvm_get_debugregs(X86CPU *cpu)
     return 0;
 }
 
+static int kvm_put_nested_state(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    int max_nested_state_len = kvm_max_nested_state_length();
+
+    if (max_nested_state_len <= 0) {
+        return 0;
+    }
+
+    assert(env->nested_state->size <= max_nested_state_len);
+    return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_NESTED_STATE, env->nested_state);
+}
+
+static int kvm_get_nested_state(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    int max_nested_state_len = kvm_max_nested_state_length();
+    int ret;
+
+    if (max_nested_state_len <= 0) {
+        return 0;
+    }
+
+    /*
+     * It is possible that migration restored a smaller size into
+     * nested_state->hdr.size than what our kernel support.
+     * We preserve migration origin nested_state->hdr.size for
+     * call to KVM_SET_NESTED_STATE but wish that our next call
+     * to KVM_GET_NESTED_STATE will use max size our kernel support.
+     */
+    env->nested_state->size = max_nested_state_len;
+
+    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_NESTED_STATE, env->nested_state);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (env->nested_state->flags & KVM_STATE_NESTED_GUEST_MODE) {
+        env->hflags |= HF_GUEST_MASK;
+    } else {
+        env->hflags &= ~HF_GUEST_MASK;
+    }
+
+    return ret;
+}
+
 int kvm_arch_put_registers(CPUState *cpu, int level)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
@@ -3418,6 +3489,11 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
 
     assert(cpu_is_stopped(cpu) || qemu_cpu_is_self(cpu));
 
+    ret = kvm_put_nested_state(x86_cpu);
+    if (ret < 0) {
+        return ret;
+    }
+
     if (level >= KVM_PUT_RESET_STATE) {
         ret = kvm_put_msr_feature_control(x86_cpu);
         if (ret < 0) {
@@ -3533,6 +3609,10 @@ int kvm_arch_get_registers(CPUState *cs)
     if (ret < 0) {
         goto out;
     }
+    ret = kvm_get_nested_state(cpu);
+    if (ret < 0) {
+        goto out;
+    }
     ret = 0;
  out:
     cpu_sync_bndcs_hflags(&cpu->env);
diff --git a/target/i386/machine.c b/target/i386/machine.c
index a39ce7f..a6afdf8 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -231,6 +231,15 @@ static int cpu_pre_save(void *opaque)
         env->segs[R_SS].flags &= ~(env->segs[R_SS].flags & DESC_DPL_MASK);
     }
 
+#ifdef CONFIG_KVM
+    /* Verify we have nested virtualization state from kernel if required */
+    if (cpu_has_nested_virt(env) && !env->nested_state) {
+        error_report("Guest enabled nested virtualization but kernel "
+                "does not support saving of nested state");
+        return -EINVAL;
+    }
+#endif
+
     return 0;
 }
 
@@ -278,6 +287,16 @@ static int cpu_post_load(void *opaque, int version_id)
     env->hflags &= ~HF_CPL_MASK;
     env->hflags |= (env->segs[R_SS].flags >> DESC_DPL_SHIFT) & HF_CPL_MASK;
 
+#ifdef CONFIG_KVM
+    if ((env->hflags & HF_GUEST_MASK) &&
+        (!env->nested_state ||
+        !(env->nested_state->flags & KVM_STATE_NESTED_GUEST_MODE))) {
+        error_report("vCPU set in guest-mode inconsistent with "
+                     "migrated kernel nested state");
+        return -EINVAL;
+    }
+#endif
+
     env->fpstt = (env->fpus_vmstate >> 11) & 7;
     env->fpus = env->fpus_vmstate & ~0x3800;
     env->fptag_vmstate ^= 0xff;
@@ -851,6 +870,182 @@ static const VMStateDescription vmstate_tsc_khz = {
     }
 };
 
+#ifdef CONFIG_KVM
+
+static bool vmx_vmcs12_needed(void *opaque)
+{
+    struct kvm_nested_state *nested_state = opaque;
+    return (nested_state->size >
+            offsetof(struct kvm_nested_state, data.vmx[0].vmcs12));
+}
+
+static const VMStateDescription vmstate_vmx_vmcs12 = {
+    .name = "cpu/kvm_nested_state/vmx/vmcs12",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = vmx_vmcs12_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(data.vmx[0].vmcs12,
+                            struct kvm_nested_state,
+                            KVM_STATE_NESTED_VMX_VMCS_SIZE),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool vmx_shadow_vmcs12_needed(void *opaque)
+{
+    struct kvm_nested_state *nested_state = opaque;
+    return (nested_state->size >
+            offsetof(struct kvm_nested_state, data.vmx[0].shadow_vmcs12));
+}
+
+static const VMStateDescription vmstate_vmx_shadow_vmcs12 = {
+    .name = "cpu/kvm_nested_state/vmx/shadow_vmcs12",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = vmx_shadow_vmcs12_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(data.vmx[0].shadow_vmcs12,
+                            struct kvm_nested_state,
+                            KVM_STATE_NESTED_VMX_VMCS_SIZE),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool vmx_nested_state_needed(void *opaque)
+{
+    struct kvm_nested_state *nested_state = opaque;
+
+    return ((nested_state->format == KVM_STATE_NESTED_FORMAT_VMX) &&
+            ((nested_state->hdr.vmx.vmxon_pa != -1ull) ||
+             (nested_state->hdr.vmx.smm.flags & KVM_STATE_NESTED_SMM_VMXON)));
+}
+
+static const VMStateDescription vmstate_vmx_nested_state = {
+    .name = "cpu/kvm_nested_state/vmx",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = vmx_nested_state_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_U64(hdr.vmx.vmxon_pa, struct kvm_nested_state),
+        VMSTATE_U64(hdr.vmx.vmcs12_pa, struct kvm_nested_state),
+        VMSTATE_U16(hdr.vmx.smm.flags, struct kvm_nested_state),
+        VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription*[]) {
+        &vmstate_vmx_vmcs12,
+        &vmstate_vmx_shadow_vmcs12,
+        NULL,
+    }
+};
+
+static bool svm_nested_state_needed(void *opaque)
+{
+    struct kvm_nested_state *nested_state = opaque;
+
+    return (nested_state->format == KVM_STATE_NESTED_FORMAT_SVM);
+}
+
+static const VMStateDescription vmstate_svm_nested_state = {
+    .name = "cpu/kvm_nested_state/svm",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = svm_nested_state_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool nested_state_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return (env->nested_state &&
+            (vmx_nested_state_needed(env->nested_state) ||
+             svm_nested_state_needed(env->nested_state)));
+}
+
+static int nested_state_post_load(void *opaque, int version_id)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+    struct kvm_nested_state *nested_state = env->nested_state;
+    int min_nested_state_len = offsetof(struct kvm_nested_state, data);
+    int max_nested_state_len = kvm_max_nested_state_length();
+
+    /*
+     * If our kernel don't support setting nested state
+     * and we have received nested state from migration stream,
+     * we need to fail migration
+     */
+    if (max_nested_state_len <= 0) {
+        error_report("Received nested state when kernel cannot restore it");
+        return -EINVAL;
+    }
+
+    /*
+     * Verify that the size of received nested_state struct
+     * at least cover required header and is not larger
+     * than the max size that our kernel support
+     */
+    if (nested_state->size < min_nested_state_len) {
+        error_report("Received nested state size less than min: "
+                     "len=%d, min=%d",
+                     nested_state->size, min_nested_state_len);
+        return -EINVAL;
+    }
+    if (nested_state->size > max_nested_state_len) {
+        error_report("Recieved unsupported nested state size: "
+                     "nested_state->size=%d, max=%d",
+                     nested_state->size, max_nested_state_len);
+        return -EINVAL;
+    }
+
+    /* Verify format is valid */
+    if ((nested_state->format != KVM_STATE_NESTED_FORMAT_VMX) &&
+        (nested_state->format != KVM_STATE_NESTED_FORMAT_SVM)) {
+        error_report("Received invalid nested state format: %d",
+                     nested_state->format);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_kvm_nested_state = {
+    .name = "cpu/kvm_nested_state",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_U16(flags, struct kvm_nested_state),
+        VMSTATE_U16(format, struct kvm_nested_state),
+        VMSTATE_U32(size, struct kvm_nested_state),
+        VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription*[]) {
+        &vmstate_vmx_nested_state,
+        &vmstate_svm_nested_state,
+        NULL
+    }
+};
+
+static const VMStateDescription vmstate_nested_state = {
+    .name = "cpu/nested_state",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = nested_state_needed,
+    .post_load = nested_state_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT_POINTER(env.nested_state, X86CPU,
+                vmstate_kvm_nested_state,
+                struct kvm_nested_state),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+#endif
+
 static bool mcg_ext_ctl_needed(void *opaque)
 {
     X86CPU *cpu = opaque;
@@ -1113,6 +1308,9 @@ VMStateDescription vmstate_x86_cpu = {
 #ifndef TARGET_X86_64
         &vmstate_efer32,
 #endif
+#ifdef CONFIG_KVM
+        &vmstate_nested_state,
+#endif
         NULL
     }
 };
-- 
1.8.3.1



