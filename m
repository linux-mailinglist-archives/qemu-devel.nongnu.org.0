Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B249D4E72E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 13:34:42 +0200 (CEST)
Received: from localhost ([::1]:59860 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heHoX-0002dQ-N7
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 07:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49001)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1heHkV-0000e1-E8
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1heHkS-0005Kn-Ar
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:31 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:39166)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1heHkS-0005IS-2M
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:28 -0400
Received: by mail-wm1-x344.google.com with SMTP id z23so6226751wma.4
 for <qemu-devel@nongnu.org>; Fri, 21 Jun 2019 04:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XT9le9VVaN1CUY3fsH4gQpa4Hm0TsMwRLakFDfXueCM=;
 b=sN/Y0qE9B964s3NtaXi5pENdgRnEDhIH/cX4dT8IPVb30pLfBNN4OqX/v3H7tl372V
 S5nh+Kxrg0Q8wIGY5oWOYUec6INjIUF+PPdo7JZ/WMKQtrlBJbHRrf6yFQIroLZrYLr/
 punYpsuv1PPuPdaKrzi8huDkkWNuojv0hXoUL+KHuW4HveraN9s/t7msrCbt/R3Qbs8J
 /EOrwEUedrO8I8xifkLNH64DKeVp/pzGkwfzWoY3G+QdRHLAsRtBqUgSYL63cg0shrP4
 5OD/Bt6fJR6rQDOeY6c+8grlguFuAit/b90yfNofa72vjJ6y0rg1Bs1Iz1qsq1E0/Jum
 Kiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=XT9le9VVaN1CUY3fsH4gQpa4Hm0TsMwRLakFDfXueCM=;
 b=IrZhBDwscW1HjtKn/5MO4e/P4FJ+bN0WlNFalEZ7yNjQxBJMqUdAVt5vWaeolNVQ+T
 OJS/4JDHDTOimk00QjZaX2U9iGSC+nbdD3v6anxGNQEhj/fD6T6ZnuXW5lLqn5cZFwDB
 yRa3h0CEi+GqRqdv4Ge+9EpMPzVCXSl6gIay3Dk9n1+Mt48JZSf97cb6PD0nN2djXjjz
 1A9lza7tlkzYCWNRivyZH+xQ7nHlrXoEX4JuZ0kEtUKAEr0CVCm+B6f6F+cYNOKWAvUZ
 ch+5uZjXZe+hOvQ1ppMJ2XDekFmvf9macFrUz2pzE16hkkC/vv6a1KAUkdE08akwuFq/
 S1Ow==
X-Gm-Message-State: APjAAAWulezuNC0zy8dcsTqLQ/gojoh5B7ZEIzepjR3dQjh8yraeW8id
 ytOFWVudYJ4TCDsgZlbJtn1JTS35
X-Google-Smtp-Source: APXvYqzsbSnNK12yt/snANrjEZcy04/u7i2k+IXOmFZeOB2/ckp+zdJnzBfoA9FlcqZaxsEG1SYf8g==
X-Received: by 2002:a1c:a1c1:: with SMTP id k184mr4026858wme.81.1561116626506; 
 Fri, 21 Jun 2019 04:30:26 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id r3sm2712851wrr.61.2019.06.21.04.30.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 04:30:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 13:29:59 +0200
Message-Id: <1561116620-22245-5-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561116620-22245-1-git-send-email-pbonzini@redhat.com>
References: <1561116620-22245-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PULL 04/25] i386/kvm: add support for
 KVM_GET_SUPPORTED_HV_CPUID
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

KVM now supports reporting supported Hyper-V features through CPUID
(KVM_GET_SUPPORTED_HV_CPUID ioctl). Going forward, this is going to be
the only way to announce new functionality and this has already happened
with Direct Mode stimers.

While we could just support KVM_GET_SUPPORTED_HV_CPUID for new features,
it seems to be beneficial to use it for all Hyper-V enlightenments when
possible. This way we can implement 'hv-all' pass-through mode giving the
guest all supported Hyper-V features even when QEMU knows nothing about
them.

Implementation-wise we create a new kvm_hyperv_properties structure
defining Hyper-V features, get_supported_hv_cpuid()/
get_supported_hv_cpuid_legacy() returning the supported CPUID set and
a bit over-engineered hv_cpuid_check_and_set() which we will also be
used to set cpu->hyperv_* properties for 'hv-all' mode.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20190517141924.19024-3-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm.c | 474 ++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 356 insertions(+), 118 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index b34eb81..cd492d4 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -683,156 +683,394 @@ static bool tsc_is_stable_and_known(CPUX86State *env)
         || env->user_tsc_khz;
 }
 
-static int hyperv_handle_properties(CPUState *cs)
+static struct {
+    const char *desc;
+    struct {
+        uint32_t fw;
+        uint32_t bits;
+    } flags[2];
+} kvm_hyperv_properties[] = {
+    [HYPERV_FEAT_RELAXED] = {
+        .desc = "relaxed timing (hv-relaxed)",
+        .flags = {
+            {.fw = FEAT_HYPERV_EAX,
+             .bits = HV_HYPERCALL_AVAILABLE},
+            {.fw = FEAT_HV_RECOMM_EAX,
+             .bits = HV_RELAXED_TIMING_RECOMMENDED}
+        }
+    },
+    [HYPERV_FEAT_VAPIC] = {
+        .desc = "virtual APIC (hv-vapic)",
+        .flags = {
+            {.fw = FEAT_HYPERV_EAX,
+             .bits = HV_HYPERCALL_AVAILABLE | HV_APIC_ACCESS_AVAILABLE},
+            {.fw = FEAT_HV_RECOMM_EAX,
+             .bits = HV_APIC_ACCESS_RECOMMENDED}
+        }
+    },
+    [HYPERV_FEAT_TIME] = {
+        .desc = "clocksources (hv-time)",
+        .flags = {
+            {.fw = FEAT_HYPERV_EAX,
+             .bits = HV_HYPERCALL_AVAILABLE | HV_TIME_REF_COUNT_AVAILABLE |
+             HV_REFERENCE_TSC_AVAILABLE}
+        }
+    },
+    [HYPERV_FEAT_CRASH] = {
+        .desc = "crash MSRs (hv-crash)",
+        .flags = {
+            {.fw = FEAT_HYPERV_EDX,
+             .bits = HV_GUEST_CRASH_MSR_AVAILABLE}
+        }
+    },
+    [HYPERV_FEAT_RESET] = {
+        .desc = "reset MSR (hv-reset)",
+        .flags = {
+            {.fw = FEAT_HYPERV_EAX,
+             .bits = HV_RESET_AVAILABLE}
+        }
+    },
+    [HYPERV_FEAT_VPINDEX] = {
+        .desc = "VP_INDEX MSR (hv-vpindex)",
+        .flags = {
+            {.fw = FEAT_HYPERV_EAX,
+             .bits = HV_VP_INDEX_AVAILABLE}
+        }
+    },
+    [HYPERV_FEAT_RUNTIME] = {
+        .desc = "VP_RUNTIME MSR (hv-runtime)",
+        .flags = {
+            {.fw = FEAT_HYPERV_EAX,
+             .bits = HV_VP_RUNTIME_AVAILABLE}
+        }
+    },
+    [HYPERV_FEAT_SYNIC] = {
+        .desc = "synthetic interrupt controller (hv-synic)",
+        .flags = {
+            {.fw = FEAT_HYPERV_EAX,
+             .bits = HV_SYNIC_AVAILABLE}
+        }
+    },
+    [HYPERV_FEAT_STIMER] = {
+        .desc = "synthetic timers (hv-stimer)",
+        .flags = {
+            {.fw = FEAT_HYPERV_EAX,
+             .bits = HV_SYNTIMERS_AVAILABLE}
+        }
+    },
+    [HYPERV_FEAT_FREQUENCIES] = {
+        .desc = "frequency MSRs (hv-frequencies)",
+        .flags = {
+            {.fw = FEAT_HYPERV_EAX,
+             .bits = HV_ACCESS_FREQUENCY_MSRS},
+            {.fw = FEAT_HYPERV_EDX,
+             .bits = HV_FREQUENCY_MSRS_AVAILABLE}
+        }
+    },
+    [HYPERV_FEAT_REENLIGHTENMENT] = {
+        .desc = "reenlightenment MSRs (hv-reenlightenment)",
+        .flags = {
+            {.fw = FEAT_HYPERV_EAX,
+             .bits = HV_ACCESS_REENLIGHTENMENTS_CONTROL}
+        }
+    },
+    [HYPERV_FEAT_TLBFLUSH] = {
+        .desc = "paravirtualized TLB flush (hv-tlbflush)",
+        .flags = {
+            {.fw = FEAT_HV_RECOMM_EAX,
+             .bits = HV_REMOTE_TLB_FLUSH_RECOMMENDED |
+             HV_EX_PROCESSOR_MASKS_RECOMMENDED}
+        }
+    },
+    [HYPERV_FEAT_EVMCS] = {
+        .desc = "enlightened VMCS (hv-evmcs)",
+        .flags = {
+            {.fw = FEAT_HV_RECOMM_EAX,
+             .bits = HV_ENLIGHTENED_VMCS_RECOMMENDED}
+        }
+    },
+    [HYPERV_FEAT_IPI] = {
+        .desc = "paravirtualized IPI (hv-ipi)",
+        .flags = {
+            {.fw = FEAT_HV_RECOMM_EAX,
+             .bits = HV_CLUSTER_IPI_RECOMMENDED |
+             HV_EX_PROCESSOR_MASKS_RECOMMENDED}
+        }
+    },
+};
+
+static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max)
+{
+    struct kvm_cpuid2 *cpuid;
+    int r, size;
+
+    size = sizeof(*cpuid) + max * sizeof(*cpuid->entries);
+    cpuid = g_malloc0(size);
+    cpuid->nent = max;
+
+    r = kvm_vcpu_ioctl(cs, KVM_GET_SUPPORTED_HV_CPUID, cpuid);
+    if (r == 0 && cpuid->nent >= max) {
+        r = -E2BIG;
+    }
+    if (r < 0) {
+        if (r == -E2BIG) {
+            g_free(cpuid);
+            return NULL;
+        } else {
+            fprintf(stderr, "KVM_GET_SUPPORTED_HV_CPUID failed: %s\n",
+                    strerror(-r));
+            exit(1);
+        }
+    }
+    return cpuid;
+}
+
+/*
+ * Run KVM_GET_SUPPORTED_HV_CPUID ioctl(), allocating a buffer large enough
+ * for all entries.
+ */
+static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
+{
+    struct kvm_cpuid2 *cpuid;
+    int max = 7; /* 0x40000000..0x40000005, 0x4000000A */
+
+    /*
+     * When the buffer is too small, KVM_GET_SUPPORTED_HV_CPUID fails with
+     * -E2BIG, however, it doesn't report back the right size. Keep increasing
+     * it and re-trying until we succeed.
+     */
+    while ((cpuid = try_get_hv_cpuid(cs, max)) == NULL) {
+        max++;
+    }
+    return cpuid;
+}
+
+/*
+ * When KVM_GET_SUPPORTED_HV_CPUID is not supported we fill CPUID feature
+ * leaves from KVM_CAP_HYPERV* and present MSRs data.
+ */
+static struct kvm_cpuid2 *get_supported_hv_cpuid_legacy(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
+    struct kvm_cpuid2 *cpuid;
+    struct kvm_cpuid_entry2 *entry_feat, *entry_recomm;
+
+    /* HV_CPUID_FEATURES, HV_CPUID_ENLIGHTMENT_INFO */
+    cpuid = g_malloc0(sizeof(*cpuid) + 2 * sizeof(*cpuid->entries));
+    cpuid->nent = 2;
+
+    /* HV_CPUID_VENDOR_AND_MAX_FUNCTIONS */
+    entry_feat = &cpuid->entries[0];
+    entry_feat->function = HV_CPUID_FEATURES;
 
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_RELAXED)) {
-        env->features[FEAT_HYPERV_EAX] |= HV_HYPERCALL_AVAILABLE;
+    entry_recomm = &cpuid->entries[1];
+    entry_recomm->function = HV_CPUID_ENLIGHTMENT_INFO;
+    entry_recomm->ebx = cpu->hyperv_spinlock_attempts;
+
+    if (kvm_check_extension(cs->kvm_state, KVM_CAP_HYPERV) > 0) {
+        entry_feat->eax |= HV_HYPERCALL_AVAILABLE;
+        entry_feat->eax |= HV_APIC_ACCESS_AVAILABLE;
+        entry_feat->edx |= HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE;
+        entry_recomm->eax |= HV_RELAXED_TIMING_RECOMMENDED;
+        entry_recomm->eax |= HV_APIC_ACCESS_RECOMMENDED;
     }
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VAPIC)) {
-        env->features[FEAT_HYPERV_EAX] |= HV_HYPERCALL_AVAILABLE;
-        env->features[FEAT_HYPERV_EAX] |= HV_APIC_ACCESS_AVAILABLE;
+
+    if (kvm_check_extension(cs->kvm_state, KVM_CAP_HYPERV_TIME) > 0) {
+        entry_feat->eax |= HV_TIME_REF_COUNT_AVAILABLE;
+        entry_feat->eax |= HV_REFERENCE_TSC_AVAILABLE;
     }
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_TIME)) {
-        if (kvm_check_extension(cs->kvm_state, KVM_CAP_HYPERV_TIME) <= 0) {
-            fprintf(stderr, "Hyper-V clocksources "
-                    "(requested by 'hv-time' cpu flag) "
-                    "are not supported by kernel\n");
-            return -ENOSYS;
-        }
-        env->features[FEAT_HYPERV_EAX] |= HV_HYPERCALL_AVAILABLE;
-        env->features[FEAT_HYPERV_EAX] |= HV_TIME_REF_COUNT_AVAILABLE;
-        env->features[FEAT_HYPERV_EAX] |= HV_REFERENCE_TSC_AVAILABLE;
+
+    if (has_msr_hv_frequencies) {
+        entry_feat->eax |= HV_ACCESS_FREQUENCY_MSRS;
+        entry_feat->edx |= HV_FREQUENCY_MSRS_AVAILABLE;
     }
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_FREQUENCIES)) {
-        if (!has_msr_hv_frequencies) {
-            fprintf(stderr, "Hyper-V frequency MSRs "
-                    "(requested by 'hv-frequencies' cpu flag) "
-                    "are not supported by kernel\n");
-            return -ENOSYS;
-        }
-        env->features[FEAT_HYPERV_EAX] |= HV_ACCESS_FREQUENCY_MSRS;
-        env->features[FEAT_HYPERV_EDX] |= HV_FREQUENCY_MSRS_AVAILABLE;
+
+    if (has_msr_hv_crash) {
+        entry_feat->edx |= HV_GUEST_CRASH_MSR_AVAILABLE;
     }
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_CRASH)) {
-        if (!has_msr_hv_crash) {
-            fprintf(stderr, "Hyper-V crash MSRs "
-                    "(requested by 'hv-crash' cpu flag) "
-                    "are not supported by kernel\n");
-            return -ENOSYS;
-        }
-        env->features[FEAT_HYPERV_EDX] |= HV_GUEST_CRASH_MSR_AVAILABLE;
+
+    if (has_msr_hv_reenlightenment) {
+        entry_feat->eax |= HV_ACCESS_REENLIGHTENMENTS_CONTROL;
     }
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_REENLIGHTENMENT)) {
-        if (!has_msr_hv_reenlightenment) {
-            fprintf(stderr,
-                    "Hyper-V Reenlightenment MSRs "
-                    "(requested by 'hv-reenlightenment' cpu flag) "
-                    "are not supported by kernel\n");
-            return -ENOSYS;
-        }
-        env->features[FEAT_HYPERV_EAX] |= HV_ACCESS_REENLIGHTENMENTS_CONTROL;
+
+    if (has_msr_hv_reset) {
+        entry_feat->eax |= HV_RESET_AVAILABLE;
     }
-    env->features[FEAT_HYPERV_EDX] |= HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE;
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_RESET)) {
-        if (!has_msr_hv_reset) {
-            fprintf(stderr, "Hyper-V reset MSR "
-                    "(requested by 'hv-reset' cpu flag) "
-                    "is not supported by kernel\n");
-            return -ENOSYS;
-        }
-        env->features[FEAT_HYPERV_EAX] |= HV_RESET_AVAILABLE;
+
+    if (has_msr_hv_vpindex) {
+        entry_feat->eax |= HV_VP_INDEX_AVAILABLE;
     }
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX)) {
-        if (!has_msr_hv_vpindex) {
-            fprintf(stderr, "Hyper-V VP_INDEX MSR "
-                    "(requested by 'hv-vpindex' cpu flag) "
-                    "is not supported by kernel\n");
-            return -ENOSYS;
-        }
-        env->features[FEAT_HYPERV_EAX] |= HV_VP_INDEX_AVAILABLE;
+
+    if (has_msr_hv_runtime) {
+        entry_feat->eax |= HV_VP_RUNTIME_AVAILABLE;
     }
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_RUNTIME)) {
-        if (!has_msr_hv_runtime) {
-            fprintf(stderr, "Hyper-V VP_RUNTIME MSR "
-                    "(requested by 'hv-runtime' cpu flag) "
-                    "is not supported by kernel\n");
-            return -ENOSYS;
+
+    if (has_msr_hv_synic) {
+        unsigned int cap = cpu->hyperv_synic_kvm_only ?
+            KVM_CAP_HYPERV_SYNIC : KVM_CAP_HYPERV_SYNIC2;
+
+        if (kvm_check_extension(cs->kvm_state, cap) > 0) {
+            entry_feat->eax |= HV_SYNIC_AVAILABLE;
         }
-        env->features[FEAT_HYPERV_EAX] |= HV_VP_RUNTIME_AVAILABLE;
     }
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC)) {
-        unsigned int cap = KVM_CAP_HYPERV_SYNIC;
-        if (!cpu->hyperv_synic_kvm_only) {
-            if (!hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX)) {
-                fprintf(stderr, "Hyper-V SynIC "
-                        "(requested by 'hv-synic' cpu flag) "
-                        "requires Hyper-V VP_INDEX ('hv-vpindex')\n");
-            return -ENOSYS;
-            }
-            cap = KVM_CAP_HYPERV_SYNIC2;
-        }
 
-        if (!has_msr_hv_synic || !kvm_check_extension(cs->kvm_state, cap)) {
-            fprintf(stderr, "Hyper-V SynIC (requested by 'hv-synic' cpu flag) "
-                    "is not supported by kernel\n");
-            return -ENOSYS;
-        }
+    if (has_msr_hv_stimer) {
+        entry_feat->eax |= HV_SYNTIMERS_AVAILABLE;
+    }
 
-        env->features[FEAT_HYPERV_EAX] |= HV_SYNIC_AVAILABLE;
+    if (kvm_check_extension(cs->kvm_state,
+                            KVM_CAP_HYPERV_TLBFLUSH) > 0) {
+        entry_recomm->eax |= HV_REMOTE_TLB_FLUSH_RECOMMENDED;
+        entry_recomm->eax |= HV_EX_PROCESSOR_MASKS_RECOMMENDED;
     }
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_STIMER)) {
-        if (!has_msr_hv_stimer) {
-            fprintf(stderr, "Hyper-V timers aren't supported by kernel\n");
-            return -ENOSYS;
-        }
-        env->features[FEAT_HYPERV_EAX] |= HV_SYNTIMERS_AVAILABLE;
+
+    if (kvm_check_extension(cs->kvm_state,
+                            KVM_CAP_HYPERV_ENLIGHTENED_VMCS) > 0) {
+        entry_recomm->eax |= HV_ENLIGHTENED_VMCS_RECOMMENDED;
     }
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_RELAXED)) {
-        env->features[FEAT_HV_RECOMM_EAX] |= HV_RELAXED_TIMING_RECOMMENDED;
+
+    if (kvm_check_extension(cs->kvm_state,
+                            KVM_CAP_HYPERV_SEND_IPI) > 0) {
+        entry_recomm->eax |= HV_CLUSTER_IPI_RECOMMENDED;
+        entry_recomm->eax |= HV_EX_PROCESSOR_MASKS_RECOMMENDED;
     }
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VAPIC)) {
-        env->features[FEAT_HV_RECOMM_EAX] |= HV_APIC_ACCESS_RECOMMENDED;
-    }
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_TLBFLUSH)) {
-        if (kvm_check_extension(cs->kvm_state,
-                                KVM_CAP_HYPERV_TLBFLUSH) <= 0) {
-            fprintf(stderr, "Hyper-V TLB flush support "
-                    "(requested by 'hv-tlbflush' cpu flag) "
-                    " is not supported by kernel\n");
-            return -ENOSYS;
-        }
-        env->features[FEAT_HV_RECOMM_EAX] |= HV_REMOTE_TLB_FLUSH_RECOMMENDED;
-        env->features[FEAT_HV_RECOMM_EAX] |= HV_EX_PROCESSOR_MASKS_RECOMMENDED;
+
+    return cpuid;
+}
+
+static int hv_cpuid_get_fw(struct kvm_cpuid2 *cpuid, int fw, uint32_t *r)
+{
+    struct kvm_cpuid_entry2 *entry;
+    uint32_t func;
+    int reg;
+
+    switch (fw) {
+    case FEAT_HYPERV_EAX:
+        reg = R_EAX;
+        func = HV_CPUID_FEATURES;
+        break;
+    case FEAT_HYPERV_EDX:
+        reg = R_EDX;
+        func = HV_CPUID_FEATURES;
+        break;
+    case FEAT_HV_RECOMM_EAX:
+        reg = R_EAX;
+        func = HV_CPUID_ENLIGHTMENT_INFO;
+        break;
+    default:
+        return -EINVAL;
     }
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_IPI)) {
-        if (kvm_check_extension(cs->kvm_state,
-                                KVM_CAP_HYPERV_SEND_IPI) <= 0) {
-            fprintf(stderr, "Hyper-V IPI send support "
-                    "(requested by 'hv-ipi' cpu flag) "
-                    " is not supported by kernel\n");
-            return -ENOSYS;
+
+    entry = cpuid_find_entry(cpuid, func, 0);
+    if (!entry) {
+        return -ENOENT;
+    }
+
+    switch (reg) {
+    case R_EAX:
+        *r = entry->eax;
+        break;
+    case R_EDX:
+        *r = entry->edx;
+        break;
+    default:
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
+                                  int feature)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    uint32_t r, fw, bits;;
+    int i;
+
+    if (!hyperv_feat_enabled(cpu, feature)) {
+        return 0;
+    }
+
+    for (i = 0; i < ARRAY_SIZE(kvm_hyperv_properties[feature].flags); i++) {
+        fw = kvm_hyperv_properties[feature].flags[i].fw;
+        bits = kvm_hyperv_properties[feature].flags[i].bits;
+
+        if (!fw) {
+            continue;
         }
-        env->features[FEAT_HV_RECOMM_EAX] |= HV_CLUSTER_IPI_RECOMMENDED;
-        env->features[FEAT_HV_RECOMM_EAX] |= HV_EX_PROCESSOR_MASKS_RECOMMENDED;
+
+        if (hv_cpuid_get_fw(cpuid, fw, &r) || (r & bits) != bits) {
+            fprintf(stderr,
+                    "Hyper-V %s is not supported by kernel\n",
+                    kvm_hyperv_properties[feature].desc);
+            return 1;
+        }
+
+        env->features[fw] |= bits;
     }
+
+    return 0;
+}
+
+static int hyperv_handle_properties(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    struct kvm_cpuid2 *cpuid;
+    int r = 0;
+
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
         uint16_t evmcs_version;
 
         if (kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
                                 (uintptr_t)&evmcs_version)) {
-            fprintf(stderr, "Hyper-V Enlightened VMCS "
-                    "(requested by 'hv-evmcs' cpu flag) "
-                    "is not supported by kernel\n");
+            fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
+                    kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
             return -ENOSYS;
         }
         env->features[FEAT_HV_RECOMM_EAX] |= HV_ENLIGHTENED_VMCS_RECOMMENDED;
         env->features[FEAT_HV_NESTED_EAX] = evmcs_version;
     }
 
-    return 0;
+    if (kvm_check_extension(cs->kvm_state, KVM_CAP_HYPERV_CPUID) > 0) {
+        cpuid = get_supported_hv_cpuid(cs);
+    } else {
+        cpuid = get_supported_hv_cpuid_legacy(cs);
+    }
+
+    /* Features */
+    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_RELAXED);
+    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_VAPIC);
+    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_TIME);
+    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_CRASH);
+    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_RESET);
+    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_VPINDEX);
+    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_RUNTIME);
+    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_SYNIC);
+    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_STIMER);
+    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_FREQUENCIES);
+    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_REENLIGHTENMENT);
+    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_TLBFLUSH);
+    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_EVMCS);
+    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_IPI);
+
+    /* Dependencies */
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC) &&
+        !cpu->hyperv_synic_kvm_only &&
+        !hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX)) {
+        fprintf(stderr, "Hyper-V %s requires %s\n",
+                kvm_hyperv_properties[HYPERV_FEAT_SYNIC].desc,
+                kvm_hyperv_properties[HYPERV_FEAT_VPINDEX].desc);
+        r |= 1;
+    }
+
+    /* Not exposed by KVM but needed to make CPU hotplug in Windows work */
+    env->features[FEAT_HYPERV_EDX] |= HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE;
+
+    g_free(cpuid);
+
+    return r ? -ENOSYS : 0;
 }
 
 static int hyperv_init_vcpu(X86CPU *cpu)
-- 
1.8.3.1



