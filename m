Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8109C4DECB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 03:49:28 +0200 (CEST)
Received: from localhost ([::1]:54038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he8gB-00009q-L5
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 21:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40741)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1he8Zc-0006NK-RD
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:42:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1he8ZZ-00068o-AH
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:42:40 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:55299)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1he8ZY-00063q-OK
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:42:37 -0400
Received: by mail-wm1-x333.google.com with SMTP id a15so4783387wmj.5
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 18:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jRxVFuHpbr4EI8miJwJfPa6C/23qivxTRXPqmbxVszk=;
 b=SegDEA2Kis2UXGq82hZuCEsGldAWjiXXkdsmGJMjCbjnGKC2s2zchOnreAdo0wpJgH
 H7vVaHG2Wc+/VyPYKoGue/QaTAmP+8lC7ED1n8i/snRUCnQrxggmMbETAivbCjZP+iGf
 MVrS3ZOF79Zm4kjnM4j//qXBk9zEcPD3rJ/euR+rxy2tYSZDYaA4u08fHEV/j4FnWH1P
 rmq+uc5XmuHc3cyqSXk9lknwFcJWo3kHvkNgQaH2R2Wd7MIb8VZ2CJXjB8VO51lWCWWQ
 eeCA1Kgsd3otQnCccoxz2xJpAgzPkijh1T7Fx/1ltqUJ/VEfXuU6zLBuCxx9PrsWZBaX
 yoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=jRxVFuHpbr4EI8miJwJfPa6C/23qivxTRXPqmbxVszk=;
 b=pIblYlyacLRv0cyB6aeHtYIn5Imb+UXNNNKMM8M0Dzt9SLEu7PrEixPFYnpcv+HSiJ
 eFbQhk4kqsFE7aPyBTprYsHzHglfWuURfBBdsvR2L6R61wPQCxtftugjSjK6pTqBqi1Q
 yNqU8p34fVxOkJd063NaOrqgTgQAcp6MiuDojm5d7qPTTUuxGLCFkbkxTFJ5HSieGITX
 UN9lLHl18MbYSbAzsRHLTiPJV3wKpabSDsalCbfoK0Xenm53Nwoc4b46JnaQapPdMj8U
 j4bgn5l8Zqt/U/x5399o0mjhuvNezSJdVbveEVf/pup5tYC20zK/6gNFhMyGAF5V2DoP
 VMXA==
X-Gm-Message-State: APjAAAUT+MP2hwuuOe8Km2G31VoP6BpNGWXiN7oIC3agZq+025hPBx+g
 nhsmyQ/1Jkzl+bmUxRb/qYTf0IrJ
X-Google-Smtp-Source: APXvYqxx/EjKtpQt8Q+UpkrZUXSw4t7g0NVuEg85MQbZLiVa0Yk1xzG8KuA/DQzrhdMFCitm31zJIw==
X-Received: by 2002:a1c:2e16:: with SMTP id u22mr1507314wmu.80.1561081354771; 
 Thu, 20 Jun 2019 18:42:34 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id d1sm1123125wru.41.2019.06.20.18.42.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 18:42:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 03:42:08 +0200
Message-Id: <1561081350-3723-4-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561081350-3723-1-git-send-email-pbonzini@redhat.com>
References: <1561081350-3723-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::333
Subject: [Qemu-devel] [PULL 03/25] i386/kvm: convert hyperv enlightenments
 properties from bools to bits
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

Representing Hyper-V properties as bits will allow us to check features
and dependencies between them in a natural way.

Suggested-by: Roman Kagan <rkagan@virtuozzo.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20190517141924.19024-2-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc.c          |  3 +-
 target/i386/cpu.c     | 44 ++++++++++++++++++---------
 target/i386/cpu.h     | 37 ++++++++++++++---------
 target/i386/hyperv.c  |  2 +-
 target/i386/kvm.c     | 83 +++++++++++++++++++++------------------------------
 target/i386/machine.c |  2 +-
 6 files changed, 91 insertions(+), 80 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2c5446b..e41192b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2386,7 +2386,8 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
     }
     cpu->thread_id = topo.smt_id;
 
-    if (cpu->hyperv_vpindex && !kvm_hv_vpindex_settable()) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX) &&
+        !kvm_hv_vpindex_settable()) {
         error_setg(errp, "kernel doesn't allow setting HyperV VP_INDEX");
         return;
     }
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index fbed2eb..e90c1ac 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5853,21 +5853,37 @@ static Property x86_cpu_properties[] = {
 #endif
     DEFINE_PROP_INT32("node-id", X86CPU, node_id, CPU_UNSET_NUMA_NODE_ID),
     DEFINE_PROP_BOOL("pmu", X86CPU, enable_pmu, false),
+
     { .name  = "hv-spinlocks", .info  = &qdev_prop_spinlocks },
-    DEFINE_PROP_BOOL("hv-relaxed", X86CPU, hyperv_relaxed_timing, false),
-    DEFINE_PROP_BOOL("hv-vapic", X86CPU, hyperv_vapic, false),
-    DEFINE_PROP_BOOL("hv-time", X86CPU, hyperv_time, false),
-    DEFINE_PROP_BOOL("hv-crash", X86CPU, hyperv_crash, false),
-    DEFINE_PROP_BOOL("hv-reset", X86CPU, hyperv_reset, false),
-    DEFINE_PROP_BOOL("hv-vpindex", X86CPU, hyperv_vpindex, false),
-    DEFINE_PROP_BOOL("hv-runtime", X86CPU, hyperv_runtime, false),
-    DEFINE_PROP_BOOL("hv-synic", X86CPU, hyperv_synic, false),
-    DEFINE_PROP_BOOL("hv-stimer", X86CPU, hyperv_stimer, false),
-    DEFINE_PROP_BOOL("hv-frequencies", X86CPU, hyperv_frequencies, false),
-    DEFINE_PROP_BOOL("hv-reenlightenment", X86CPU, hyperv_reenlightenment, false),
-    DEFINE_PROP_BOOL("hv-tlbflush", X86CPU, hyperv_tlbflush, false),
-    DEFINE_PROP_BOOL("hv-evmcs", X86CPU, hyperv_evmcs, false),
-    DEFINE_PROP_BOOL("hv-ipi", X86CPU, hyperv_ipi, false),
+    DEFINE_PROP_BIT64("hv-relaxed", X86CPU, hyperv_features,
+                      HYPERV_FEAT_RELAXED, 0),
+    DEFINE_PROP_BIT64("hv-vapic", X86CPU, hyperv_features,
+                      HYPERV_FEAT_VAPIC, 0),
+    DEFINE_PROP_BIT64("hv-time", X86CPU, hyperv_features,
+                      HYPERV_FEAT_TIME, 0),
+    DEFINE_PROP_BIT64("hv-crash", X86CPU, hyperv_features,
+                      HYPERV_FEAT_CRASH, 0),
+    DEFINE_PROP_BIT64("hv-reset", X86CPU, hyperv_features,
+                      HYPERV_FEAT_RESET, 0),
+    DEFINE_PROP_BIT64("hv-vpindex", X86CPU, hyperv_features,
+                      HYPERV_FEAT_VPINDEX, 0),
+    DEFINE_PROP_BIT64("hv-runtime", X86CPU, hyperv_features,
+                      HYPERV_FEAT_RUNTIME, 0),
+    DEFINE_PROP_BIT64("hv-synic", X86CPU, hyperv_features,
+                      HYPERV_FEAT_SYNIC, 0),
+    DEFINE_PROP_BIT64("hv-stimer", X86CPU, hyperv_features,
+                      HYPERV_FEAT_STIMER, 0),
+    DEFINE_PROP_BIT64("hv-frequencies", X86CPU, hyperv_features,
+                      HYPERV_FEAT_FREQUENCIES, 0),
+    DEFINE_PROP_BIT64("hv-reenlightenment", X86CPU, hyperv_features,
+                      HYPERV_FEAT_REENLIGHTENMENT, 0),
+    DEFINE_PROP_BIT64("hv-tlbflush", X86CPU, hyperv_features,
+                      HYPERV_FEAT_TLBFLUSH, 0),
+    DEFINE_PROP_BIT64("hv-evmcs", X86CPU, hyperv_features,
+                      HYPERV_FEAT_EVMCS, 0),
+    DEFINE_PROP_BIT64("hv-ipi", X86CPU, hyperv_features,
+                      HYPERV_FEAT_IPI, 0),
+
     DEFINE_PROP_BOOL("check", X86CPU, check_cpuid, true),
     DEFINE_PROP_BOOL("enforce", X86CPU, enforce_cpuid, false),
     DEFINE_PROP_BOOL("kvm", X86CPU, expose_kvm, true),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 0732e05..30cd1a0 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -734,6 +734,22 @@ typedef uint32_t FeatureWordArray[FEATURE_WORDS];
 #define MSR_ARCH_CAP_SKIP_L1DFL_VMENTRY (1U << 3)
 #define MSR_ARCH_CAP_SSB_NO     (1U << 4)
 
+/* Supported Hyper-V Enlightenments */
+#define HYPERV_FEAT_RELAXED             0
+#define HYPERV_FEAT_VAPIC               1
+#define HYPERV_FEAT_TIME                2
+#define HYPERV_FEAT_CRASH               3
+#define HYPERV_FEAT_RESET               4
+#define HYPERV_FEAT_VPINDEX             5
+#define HYPERV_FEAT_RUNTIME             6
+#define HYPERV_FEAT_SYNIC               7
+#define HYPERV_FEAT_STIMER              8
+#define HYPERV_FEAT_FREQUENCIES         9
+#define HYPERV_FEAT_REENLIGHTENMENT     10
+#define HYPERV_FEAT_TLBFLUSH            11
+#define HYPERV_FEAT_EVMCS               12
+#define HYPERV_FEAT_IPI                 13
+
 #ifndef HYPERV_SPINLOCK_NEVER_RETRY
 #define HYPERV_SPINLOCK_NEVER_RETRY             0xFFFFFFFF
 #endif
@@ -1370,23 +1386,11 @@ struct X86CPU {
     CPUNegativeOffsetState neg;
     CPUX86State env;
 
-    bool hyperv_vapic;
-    bool hyperv_relaxed_timing;
     int hyperv_spinlock_attempts;
     char *hyperv_vendor_id;
-    bool hyperv_time;
-    bool hyperv_crash;
-    bool hyperv_reset;
-    bool hyperv_vpindex;
-    bool hyperv_runtime;
-    bool hyperv_synic;
     bool hyperv_synic_kvm_only;
-    bool hyperv_stimer;
-    bool hyperv_frequencies;
-    bool hyperv_reenlightenment;
-    bool hyperv_tlbflush;
-    bool hyperv_evmcs;
-    bool hyperv_ipi;
+    uint64_t hyperv_features;
+
     bool check_cpuid;
     bool enforce_cpuid;
     bool expose_kvm;
@@ -1906,4 +1910,9 @@ void x86_cpu_xrstor_all_areas(X86CPU *cpu, const X86XSaveArea *buf);
 void x86_cpu_xsave_all_areas(X86CPU *cpu, X86XSaveArea *buf);
 void x86_update_hflags(CPUX86State* env);
 
+static inline bool hyperv_feat_enabled(X86CPU *cpu, int feat)
+{
+    return !!(cpu->hyperv_features & BIT(feat));
+}
+
 #endif /* I386_CPU_H */
diff --git a/target/i386/hyperv.c b/target/i386/hyperv.c
index b264a28..26efc1e 100644
--- a/target/i386/hyperv.c
+++ b/target/i386/hyperv.c
@@ -52,7 +52,7 @@ int kvm_hv_handle_exit(X86CPU *cpu, struct kvm_hyperv_exit *exit)
 
     switch (exit->type) {
     case KVM_EXIT_HYPERV_SYNIC:
-        if (!cpu->hyperv_synic) {
+        if (!hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC)) {
             return -1;
         }
 
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 6899061..b34eb81 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -634,28 +634,12 @@ unsigned long kvm_arch_vcpu_id(CPUState *cs)
 #define KVM_CPUID_SIGNATURE_NEXT                0x40000100
 #endif
 
-static bool hyperv_hypercall_available(X86CPU *cpu)
-{
-    return cpu->hyperv_vapic ||
-           (cpu->hyperv_spinlock_attempts != HYPERV_SPINLOCK_NEVER_RETRY);
-}
-
 static bool hyperv_enabled(X86CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
     return kvm_check_extension(cs->kvm_state, KVM_CAP_HYPERV) > 0 &&
-           (hyperv_hypercall_available(cpu) ||
-            cpu->hyperv_time  ||
-            cpu->hyperv_relaxed_timing ||
-            cpu->hyperv_crash ||
-            cpu->hyperv_reset ||
-            cpu->hyperv_vpindex ||
-            cpu->hyperv_runtime ||
-            cpu->hyperv_synic ||
-            cpu->hyperv_stimer ||
-            cpu->hyperv_reenlightenment ||
-            cpu->hyperv_tlbflush ||
-            cpu->hyperv_ipi);
+        ((cpu->hyperv_spinlock_attempts != HYPERV_SPINLOCK_NEVER_RETRY) ||
+         cpu->hyperv_features);
 }
 
 static int kvm_arch_set_tsc_khz(CPUState *cs)
@@ -704,14 +688,14 @@ static int hyperv_handle_properties(CPUState *cs)
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
 
-    if (cpu->hyperv_relaxed_timing) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_RELAXED)) {
         env->features[FEAT_HYPERV_EAX] |= HV_HYPERCALL_AVAILABLE;
     }
-    if (cpu->hyperv_vapic) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VAPIC)) {
         env->features[FEAT_HYPERV_EAX] |= HV_HYPERCALL_AVAILABLE;
         env->features[FEAT_HYPERV_EAX] |= HV_APIC_ACCESS_AVAILABLE;
     }
-    if (cpu->hyperv_time) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_TIME)) {
         if (kvm_check_extension(cs->kvm_state, KVM_CAP_HYPERV_TIME) <= 0) {
             fprintf(stderr, "Hyper-V clocksources "
                     "(requested by 'hv-time' cpu flag) "
@@ -722,7 +706,7 @@ static int hyperv_handle_properties(CPUState *cs)
         env->features[FEAT_HYPERV_EAX] |= HV_TIME_REF_COUNT_AVAILABLE;
         env->features[FEAT_HYPERV_EAX] |= HV_REFERENCE_TSC_AVAILABLE;
     }
-    if (cpu->hyperv_frequencies) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_FREQUENCIES)) {
         if (!has_msr_hv_frequencies) {
             fprintf(stderr, "Hyper-V frequency MSRs "
                     "(requested by 'hv-frequencies' cpu flag) "
@@ -732,7 +716,7 @@ static int hyperv_handle_properties(CPUState *cs)
         env->features[FEAT_HYPERV_EAX] |= HV_ACCESS_FREQUENCY_MSRS;
         env->features[FEAT_HYPERV_EDX] |= HV_FREQUENCY_MSRS_AVAILABLE;
     }
-    if (cpu->hyperv_crash) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_CRASH)) {
         if (!has_msr_hv_crash) {
             fprintf(stderr, "Hyper-V crash MSRs "
                     "(requested by 'hv-crash' cpu flag) "
@@ -741,7 +725,7 @@ static int hyperv_handle_properties(CPUState *cs)
         }
         env->features[FEAT_HYPERV_EDX] |= HV_GUEST_CRASH_MSR_AVAILABLE;
     }
-    if (cpu->hyperv_reenlightenment) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_REENLIGHTENMENT)) {
         if (!has_msr_hv_reenlightenment) {
             fprintf(stderr,
                     "Hyper-V Reenlightenment MSRs "
@@ -752,7 +736,7 @@ static int hyperv_handle_properties(CPUState *cs)
         env->features[FEAT_HYPERV_EAX] |= HV_ACCESS_REENLIGHTENMENTS_CONTROL;
     }
     env->features[FEAT_HYPERV_EDX] |= HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE;
-    if (cpu->hyperv_reset) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_RESET)) {
         if (!has_msr_hv_reset) {
             fprintf(stderr, "Hyper-V reset MSR "
                     "(requested by 'hv-reset' cpu flag) "
@@ -761,7 +745,7 @@ static int hyperv_handle_properties(CPUState *cs)
         }
         env->features[FEAT_HYPERV_EAX] |= HV_RESET_AVAILABLE;
     }
-    if (cpu->hyperv_vpindex) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX)) {
         if (!has_msr_hv_vpindex) {
             fprintf(stderr, "Hyper-V VP_INDEX MSR "
                     "(requested by 'hv-vpindex' cpu flag) "
@@ -770,7 +754,7 @@ static int hyperv_handle_properties(CPUState *cs)
         }
         env->features[FEAT_HYPERV_EAX] |= HV_VP_INDEX_AVAILABLE;
     }
-    if (cpu->hyperv_runtime) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_RUNTIME)) {
         if (!has_msr_hv_runtime) {
             fprintf(stderr, "Hyper-V VP_RUNTIME MSR "
                     "(requested by 'hv-runtime' cpu flag) "
@@ -779,10 +763,10 @@ static int hyperv_handle_properties(CPUState *cs)
         }
         env->features[FEAT_HYPERV_EAX] |= HV_VP_RUNTIME_AVAILABLE;
     }
-    if (cpu->hyperv_synic) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC)) {
         unsigned int cap = KVM_CAP_HYPERV_SYNIC;
         if (!cpu->hyperv_synic_kvm_only) {
-            if (!cpu->hyperv_vpindex) {
+            if (!hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX)) {
                 fprintf(stderr, "Hyper-V SynIC "
                         "(requested by 'hv-synic' cpu flag) "
                         "requires Hyper-V VP_INDEX ('hv-vpindex')\n");
@@ -799,20 +783,20 @@ static int hyperv_handle_properties(CPUState *cs)
 
         env->features[FEAT_HYPERV_EAX] |= HV_SYNIC_AVAILABLE;
     }
-    if (cpu->hyperv_stimer) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_STIMER)) {
         if (!has_msr_hv_stimer) {
             fprintf(stderr, "Hyper-V timers aren't supported by kernel\n");
             return -ENOSYS;
         }
         env->features[FEAT_HYPERV_EAX] |= HV_SYNTIMERS_AVAILABLE;
     }
-    if (cpu->hyperv_relaxed_timing) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_RELAXED)) {
         env->features[FEAT_HV_RECOMM_EAX] |= HV_RELAXED_TIMING_RECOMMENDED;
     }
-    if (cpu->hyperv_vapic) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VAPIC)) {
         env->features[FEAT_HV_RECOMM_EAX] |= HV_APIC_ACCESS_RECOMMENDED;
     }
-    if (cpu->hyperv_tlbflush) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_TLBFLUSH)) {
         if (kvm_check_extension(cs->kvm_state,
                                 KVM_CAP_HYPERV_TLBFLUSH) <= 0) {
             fprintf(stderr, "Hyper-V TLB flush support "
@@ -823,7 +807,7 @@ static int hyperv_handle_properties(CPUState *cs)
         env->features[FEAT_HV_RECOMM_EAX] |= HV_REMOTE_TLB_FLUSH_RECOMMENDED;
         env->features[FEAT_HV_RECOMM_EAX] |= HV_EX_PROCESSOR_MASKS_RECOMMENDED;
     }
-    if (cpu->hyperv_ipi) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_IPI)) {
         if (kvm_check_extension(cs->kvm_state,
                                 KVM_CAP_HYPERV_SEND_IPI) <= 0) {
             fprintf(stderr, "Hyper-V IPI send support "
@@ -834,7 +818,7 @@ static int hyperv_handle_properties(CPUState *cs)
         env->features[FEAT_HV_RECOMM_EAX] |= HV_CLUSTER_IPI_RECOMMENDED;
         env->features[FEAT_HV_RECOMM_EAX] |= HV_EX_PROCESSOR_MASKS_RECOMMENDED;
     }
-    if (cpu->hyperv_evmcs) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
         uint16_t evmcs_version;
 
         if (kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
@@ -856,7 +840,7 @@ static int hyperv_init_vcpu(X86CPU *cpu)
     CPUState *cs = CPU(cpu);
     int ret;
 
-    if (cpu->hyperv_vpindex && !hv_vpindex_settable) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX) && !hv_vpindex_settable) {
         /*
          * the kernel doesn't support setting vp_index; assert that its value
          * is in sync
@@ -881,7 +865,7 @@ static int hyperv_init_vcpu(X86CPU *cpu)
         }
     }
 
-    if (cpu->hyperv_synic) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC)) {
         uint32_t synic_cap = cpu->hyperv_synic_kvm_only ?
             KVM_CAP_HYPERV_SYNIC : KVM_CAP_HYPERV_SYNIC2;
         ret = kvm_vcpu_enable_cap(cs, synic_cap, 0);
@@ -972,7 +956,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
             memset(signature, 0, 12);
             memcpy(signature, cpu->hyperv_vendor_id, len);
         }
-        c->eax = cpu->hyperv_evmcs ?
+        c->eax = hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) ?
             HV_CPUID_NESTED_FEATURES : HV_CPUID_IMPLEMENT_LIMITS;
         c->ebx = signature[0];
         c->ecx = signature[1];
@@ -1016,7 +1000,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
         kvm_base = KVM_CPUID_SIGNATURE_NEXT;
         has_msr_hv_hypercall = true;
 
-        if (cpu->hyperv_evmcs) {
+        if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
             __u32 function;
 
             /* Create zeroed 0x40000006..0x40000009 leaves */
@@ -1360,7 +1344,7 @@ void kvm_arch_reset_vcpu(X86CPU *cpu)
         env->mp_state = KVM_MP_STATE_RUNNABLE;
     }
 
-    if (cpu->hyperv_synic) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC)) {
         int i;
         for (i = 0; i < ARRAY_SIZE(env->msr_hv_synic_sint); i++) {
             env->msr_hv_synic_sint[i] = HV_SINT_MASKED;
@@ -2100,11 +2084,11 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
                 kvm_msr_entry_add(cpu, HV_X64_MSR_HYPERCALL,
                                   env->msr_hv_hypercall);
             }
-            if (cpu->hyperv_time) {
+            if (hyperv_feat_enabled(cpu, HYPERV_FEAT_TIME)) {
                 kvm_msr_entry_add(cpu, HV_X64_MSR_REFERENCE_TSC,
                                   env->msr_hv_tsc);
             }
-            if (cpu->hyperv_reenlightenment) {
+            if (hyperv_feat_enabled(cpu, HYPERV_FEAT_REENLIGHTENMENT)) {
                 kvm_msr_entry_add(cpu, HV_X64_MSR_REENLIGHTENMENT_CONTROL,
                                   env->msr_hv_reenlightenment_control);
                 kvm_msr_entry_add(cpu, HV_X64_MSR_TSC_EMULATION_CONTROL,
@@ -2113,7 +2097,7 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
                                   env->msr_hv_tsc_emulation_status);
             }
         }
-        if (cpu->hyperv_vapic) {
+        if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VAPIC)) {
             kvm_msr_entry_add(cpu, HV_X64_MSR_APIC_ASSIST_PAGE,
                               env->msr_hv_vapic);
         }
@@ -2129,11 +2113,12 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
         if (has_msr_hv_runtime) {
             kvm_msr_entry_add(cpu, HV_X64_MSR_VP_RUNTIME, env->msr_hv_runtime);
         }
-        if (cpu->hyperv_vpindex && hv_vpindex_settable) {
+        if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX)
+            && hv_vpindex_settable) {
             kvm_msr_entry_add(cpu, HV_X64_MSR_VP_INDEX,
                               hyperv_vp_index(CPU(cpu)));
         }
-        if (cpu->hyperv_synic) {
+        if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC)) {
             int j;
 
             kvm_msr_entry_add(cpu, HV_X64_MSR_SVERSION, HV_SYNIC_VERSION);
@@ -2473,13 +2458,13 @@ static int kvm_get_msrs(X86CPU *cpu)
         kvm_msr_entry_add(cpu, HV_X64_MSR_HYPERCALL, 0);
         kvm_msr_entry_add(cpu, HV_X64_MSR_GUEST_OS_ID, 0);
     }
-    if (cpu->hyperv_vapic) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VAPIC)) {
         kvm_msr_entry_add(cpu, HV_X64_MSR_APIC_ASSIST_PAGE, 0);
     }
-    if (cpu->hyperv_time) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_TIME)) {
         kvm_msr_entry_add(cpu, HV_X64_MSR_REFERENCE_TSC, 0);
     }
-    if (cpu->hyperv_reenlightenment) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_REENLIGHTENMENT)) {
         kvm_msr_entry_add(cpu, HV_X64_MSR_REENLIGHTENMENT_CONTROL, 0);
         kvm_msr_entry_add(cpu, HV_X64_MSR_TSC_EMULATION_CONTROL, 0);
         kvm_msr_entry_add(cpu, HV_X64_MSR_TSC_EMULATION_STATUS, 0);
@@ -2494,7 +2479,7 @@ static int kvm_get_msrs(X86CPU *cpu)
     if (has_msr_hv_runtime) {
         kvm_msr_entry_add(cpu, HV_X64_MSR_VP_RUNTIME, 0);
     }
-    if (cpu->hyperv_synic) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC)) {
         uint32_t msr;
 
         kvm_msr_entry_add(cpu, HV_X64_MSR_SCONTROL, 0);
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 4aff1a7..a39ce7f 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -634,7 +634,7 @@ static bool hyperv_runtime_enable_needed(void *opaque)
     X86CPU *cpu = opaque;
     CPUX86State *env = &cpu->env;
 
-    if (!cpu->hyperv_runtime) {
+    if (!hyperv_feat_enabled(cpu, HYPERV_FEAT_RUNTIME)) {
         return false;
     }
 
-- 
1.8.3.1



