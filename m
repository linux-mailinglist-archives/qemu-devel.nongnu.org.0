Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353C53979FF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 20:22:51 +0200 (CEST)
Received: from localhost ([::1]:54076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo92Q-0008Kj-8N
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 14:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qa-0002RW-Pe
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qX-0005l7-Vr
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622571033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tWbTh5azKkSHnk5dSQVUKwc4EmlCKm5APBOp69VVApw=;
 b=ZgdN+BNhqikvr1+HGYEjzQsbh8WOj9jWFOuYOcilDpvmvicN2DO6mvAXWlEkdPR/Vq1b6B
 i7uHFy9t3up9M1ceOve7dC3Dq6CKE4qJ3yJ6PsdXctjpFwqJOApoBVd/cRlUpXUD6I5As+
 IqfAgkNOSLW/y18pd6AxoIbo3qQ5rrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-DTPiFTAeOTKTcy4-PZKfuA-1; Tue, 01 Jun 2021 14:10:31 -0400
X-MC-Unique: DTPiFTAeOTKTcy4-PZKfuA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F7AB195D560;
 Tue,  1 Jun 2021 18:10:30 +0000 (UTC)
Received: from localhost (ovpn-112-239.rdu2.redhat.com [10.10.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D39475C1BB;
 Tue,  1 Jun 2021 18:10:29 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 14/24] i386: drop FEAT_HYPERV feature leaves
Date: Tue,  1 Jun 2021 14:10:04 -0400
Message-Id: <20210601181014.2568861-15-ehabkost@redhat.com>
In-Reply-To: <20210601181014.2568861-1-ehabkost@redhat.com>
References: <20210601181014.2568861-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

Hyper-V feature leaves are weird. We have some of them in
feature_word_info[] array but we don't use feature_word_info
magic to enable them. Neither do we use feature_dependencies[]
mechanism to validate the configuration as it doesn't allign
well with Hyper-V's many-to-many dependency chains. Some of
the feature leaves hold not only feature bits, but also values.
E.g. FEAT_HV_NESTED_EAX contains both features and the supported
Enlightened VMCS range.

Hyper-V features are already represented in 'struct X86CPU' with
uint64_t hyperv_features so duplicating them in env->features adds
little (or zero) benefits. THe other half of Hyper-V emulation features
is also stored with values in hyperv_vendor_id[], hyperv_limits[],...
so env->features[] is already incomplete.

Remove Hyper-V feature leaves from env->features[] completely.
kvm_hyperv_properties[] is converted to using raw CPUID func/reg
pairs for features, this allows us to get rid of hv_cpuid_get_fw()
conversion.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20210422161130.652779-8-vkuznets@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.h        |   5 --
 target/i386/cpu-sysemu.c |   2 +-
 target/i386/cpu.c        |  88 -------------------------------
 target/i386/kvm/kvm.c    | 108 +++++++++++++--------------------------
 4 files changed, 37 insertions(+), 166 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 681f11607ff..ac3abea97c1 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -531,11 +531,6 @@ typedef enum FeatureWord {
     FEAT_C000_0001_EDX, /* CPUID[C000_0001].EDX */
     FEAT_KVM,           /* CPUID[4000_0001].EAX (KVM_CPUID_FEATURES) */
     FEAT_KVM_HINTS,     /* CPUID[4000_0001].EDX */
-    FEAT_HYPERV_EAX,    /* CPUID[4000_0003].EAX */
-    FEAT_HYPERV_EBX,    /* CPUID[4000_0003].EBX */
-    FEAT_HYPERV_EDX,    /* CPUID[4000_0003].EDX */
-    FEAT_HV_RECOMM_EAX, /* CPUID[4000_0004].EAX */
-    FEAT_HV_NESTED_EAX, /* CPUID[4000_000A].EAX */
     FEAT_SVM,           /* CPUID[8000_000A].EDX */
     FEAT_XSAVE,         /* CPUID[EAX=0xd,ECX=1].EAX */
     FEAT_6_EAX,         /* CPUID[6].EAX */
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index 6477584313a..1078e3d157f 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -312,7 +312,7 @@ GuestPanicInformation *x86_cpu_get_crash_info(CPUState *cs)
     CPUX86State *env = &cpu->env;
     GuestPanicInformation *panic_info = NULL;
 
-    if (env->features[FEAT_HYPERV_EDX] & HV_GUEST_CRASH_MSR_AVAILABLE) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_CRASH)) {
         panic_info = g_malloc0(sizeof(GuestPanicInformation));
 
         panic_info->type = GUEST_PANIC_INFORMATION_TYPE_HYPER_V;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 48dabc5238a..e0ba36cc233 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -776,94 +776,6 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
          */
         .no_autoenable_flags = ~0U,
     },
-    /*
-     * .feat_names are commented out for Hyper-V enlightenments because we
-     * don't want to have two different ways for enabling them on QEMU command
-     * line. Some features (e.g. "hyperv_time", "hyperv_vapic", ...) require
-     * enabling several feature bits simultaneously, exposing these bits
-     * individually may just confuse guests.
-     */
-    [FEAT_HYPERV_EAX] = {
-        .type = CPUID_FEATURE_WORD,
-        .feat_names = {
-            NULL /* hv_msr_vp_runtime_access */, NULL /* hv_msr_time_refcount_access */,
-            NULL /* hv_msr_synic_access */, NULL /* hv_msr_stimer_access */,
-            NULL /* hv_msr_apic_access */, NULL /* hv_msr_hypercall_access */,
-            NULL /* hv_vpindex_access */, NULL /* hv_msr_reset_access */,
-            NULL /* hv_msr_stats_access */, NULL /* hv_reftsc_access */,
-            NULL /* hv_msr_idle_access */, NULL /* hv_msr_frequency_access */,
-            NULL /* hv_msr_debug_access */, NULL /* hv_msr_reenlightenment_access */,
-            NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-        },
-        .cpuid = { .eax = 0x40000003, .reg = R_EAX, },
-    },
-    [FEAT_HYPERV_EBX] = {
-        .type = CPUID_FEATURE_WORD,
-        .feat_names = {
-            NULL /* hv_create_partitions */, NULL /* hv_access_partition_id */,
-            NULL /* hv_access_memory_pool */, NULL /* hv_adjust_message_buffers */,
-            NULL /* hv_post_messages */, NULL /* hv_signal_events */,
-            NULL /* hv_create_port */, NULL /* hv_connect_port */,
-            NULL /* hv_access_stats */, NULL, NULL, NULL /* hv_debugging */,
-            NULL /* hv_cpu_power_management */, NULL /* hv_configure_profiler */,
-            NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-        },
-        .cpuid = { .eax = 0x40000003, .reg = R_EBX, },
-    },
-    [FEAT_HYPERV_EDX] = {
-        .type = CPUID_FEATURE_WORD,
-        .feat_names = {
-            NULL /* hv_mwait */, NULL /* hv_guest_debugging */,
-            NULL /* hv_perf_monitor */, NULL /* hv_cpu_dynamic_part */,
-            NULL /* hv_hypercall_params_xmm */, NULL /* hv_guest_idle_state */,
-            NULL, NULL,
-            NULL, NULL, NULL /* hv_guest_crash_msr */, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-        },
-        .cpuid = { .eax = 0x40000003, .reg = R_EDX, },
-    },
-    [FEAT_HV_RECOMM_EAX] = {
-        .type = CPUID_FEATURE_WORD,
-        .feat_names = {
-            NULL /* hv_recommend_pv_as_switch */,
-            NULL /* hv_recommend_pv_tlbflush_local */,
-            NULL /* hv_recommend_pv_tlbflush_remote */,
-            NULL /* hv_recommend_msr_apic_access */,
-            NULL /* hv_recommend_msr_reset */,
-            NULL /* hv_recommend_relaxed_timing */,
-            NULL /* hv_recommend_dma_remapping */,
-            NULL /* hv_recommend_int_remapping */,
-            NULL /* hv_recommend_x2apic_msrs */,
-            NULL /* hv_recommend_autoeoi_deprecation */,
-            NULL /* hv_recommend_pv_ipi */,
-            NULL /* hv_recommend_ex_hypercalls */,
-            NULL /* hv_hypervisor_is_nested */,
-            NULL /* hv_recommend_int_mbec */,
-            NULL /* hv_recommend_evmcs */,
-            NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-        },
-        .cpuid = { .eax = 0x40000004, .reg = R_EAX, },
-    },
-    [FEAT_HV_NESTED_EAX] = {
-        .type = CPUID_FEATURE_WORD,
-        .cpuid = { .eax = 0x4000000A, .reg = R_EAX, },
-    },
     [FEAT_SVM] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 018f19c3a3a..6d6afd83e3a 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -801,7 +801,8 @@ static bool tsc_is_stable_and_known(CPUX86State *env)
 static struct {
     const char *desc;
     struct {
-        uint32_t fw;
+        uint32_t func;
+        int reg;
         uint32_t bits;
     } flags[2];
     uint64_t dependencies;
@@ -809,25 +810,25 @@ static struct {
     [HYPERV_FEAT_RELAXED] = {
         .desc = "relaxed timing (hv-relaxed)",
         .flags = {
-            {.fw = FEAT_HYPERV_EAX,
+            {.func = HV_CPUID_FEATURES, .reg = R_EAX,
              .bits = HV_HYPERCALL_AVAILABLE},
-            {.fw = FEAT_HV_RECOMM_EAX,
+            {.func = HV_CPUID_ENLIGHTMENT_INFO, .reg = R_EAX,
              .bits = HV_RELAXED_TIMING_RECOMMENDED}
         }
     },
     [HYPERV_FEAT_VAPIC] = {
         .desc = "virtual APIC (hv-vapic)",
         .flags = {
-            {.fw = FEAT_HYPERV_EAX,
+            {.func = HV_CPUID_FEATURES, .reg = R_EAX,
              .bits = HV_HYPERCALL_AVAILABLE | HV_APIC_ACCESS_AVAILABLE},
-            {.fw = FEAT_HV_RECOMM_EAX,
+            {.func = HV_CPUID_ENLIGHTMENT_INFO, .reg = R_EAX,
              .bits = HV_APIC_ACCESS_RECOMMENDED}
         }
     },
     [HYPERV_FEAT_TIME] = {
         .desc = "clocksources (hv-time)",
         .flags = {
-            {.fw = FEAT_HYPERV_EAX,
+            {.func = HV_CPUID_FEATURES, .reg = R_EAX,
              .bits = HV_HYPERCALL_AVAILABLE | HV_TIME_REF_COUNT_AVAILABLE |
              HV_REFERENCE_TSC_AVAILABLE}
         }
@@ -835,42 +836,42 @@ static struct {
     [HYPERV_FEAT_CRASH] = {
         .desc = "crash MSRs (hv-crash)",
         .flags = {
-            {.fw = FEAT_HYPERV_EDX,
+            {.func = HV_CPUID_FEATURES, .reg = R_EDX,
              .bits = HV_GUEST_CRASH_MSR_AVAILABLE}
         }
     },
     [HYPERV_FEAT_RESET] = {
         .desc = "reset MSR (hv-reset)",
         .flags = {
-            {.fw = FEAT_HYPERV_EAX,
+            {.func = HV_CPUID_FEATURES, .reg = R_EAX,
              .bits = HV_RESET_AVAILABLE}
         }
     },
     [HYPERV_FEAT_VPINDEX] = {
         .desc = "VP_INDEX MSR (hv-vpindex)",
         .flags = {
-            {.fw = FEAT_HYPERV_EAX,
+            {.func = HV_CPUID_FEATURES, .reg = R_EAX,
              .bits = HV_VP_INDEX_AVAILABLE}
         }
     },
     [HYPERV_FEAT_RUNTIME] = {
         .desc = "VP_RUNTIME MSR (hv-runtime)",
         .flags = {
-            {.fw = FEAT_HYPERV_EAX,
+            {.func = HV_CPUID_FEATURES, .reg = R_EAX,
              .bits = HV_VP_RUNTIME_AVAILABLE}
         }
     },
     [HYPERV_FEAT_SYNIC] = {
         .desc = "synthetic interrupt controller (hv-synic)",
         .flags = {
-            {.fw = FEAT_HYPERV_EAX,
+            {.func = HV_CPUID_FEATURES, .reg = R_EAX,
              .bits = HV_SYNIC_AVAILABLE}
         }
     },
     [HYPERV_FEAT_STIMER] = {
         .desc = "synthetic timers (hv-stimer)",
         .flags = {
-            {.fw = FEAT_HYPERV_EAX,
+            {.func = HV_CPUID_FEATURES, .reg = R_EAX,
              .bits = HV_SYNTIMERS_AVAILABLE}
         },
         .dependencies = BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_TIME)
@@ -878,23 +879,23 @@ static struct {
     [HYPERV_FEAT_FREQUENCIES] = {
         .desc = "frequency MSRs (hv-frequencies)",
         .flags = {
-            {.fw = FEAT_HYPERV_EAX,
+            {.func = HV_CPUID_FEATURES, .reg = R_EAX,
              .bits = HV_ACCESS_FREQUENCY_MSRS},
-            {.fw = FEAT_HYPERV_EDX,
+            {.func = HV_CPUID_FEATURES, .reg = R_EDX,
              .bits = HV_FREQUENCY_MSRS_AVAILABLE}
         }
     },
     [HYPERV_FEAT_REENLIGHTENMENT] = {
         .desc = "reenlightenment MSRs (hv-reenlightenment)",
         .flags = {
-            {.fw = FEAT_HYPERV_EAX,
+            {.func = HV_CPUID_FEATURES, .reg = R_EAX,
              .bits = HV_ACCESS_REENLIGHTENMENTS_CONTROL}
         }
     },
     [HYPERV_FEAT_TLBFLUSH] = {
         .desc = "paravirtualized TLB flush (hv-tlbflush)",
         .flags = {
-            {.fw = FEAT_HV_RECOMM_EAX,
+            {.func = HV_CPUID_ENLIGHTMENT_INFO, .reg = R_EAX,
              .bits = HV_REMOTE_TLB_FLUSH_RECOMMENDED |
              HV_EX_PROCESSOR_MASKS_RECOMMENDED}
         },
@@ -903,7 +904,7 @@ static struct {
     [HYPERV_FEAT_EVMCS] = {
         .desc = "enlightened VMCS (hv-evmcs)",
         .flags = {
-            {.fw = FEAT_HV_RECOMM_EAX,
+            {.func = HV_CPUID_ENLIGHTMENT_INFO, .reg = R_EAX,
              .bits = HV_ENLIGHTENED_VMCS_RECOMMENDED}
         },
         .dependencies = BIT(HYPERV_FEAT_VAPIC)
@@ -911,7 +912,7 @@ static struct {
     [HYPERV_FEAT_IPI] = {
         .desc = "paravirtualized IPI (hv-ipi)",
         .flags = {
-            {.fw = FEAT_HV_RECOMM_EAX,
+            {.func = HV_CPUID_ENLIGHTMENT_INFO, .reg = R_EAX,
              .bits = HV_CLUSTER_IPI_RECOMMENDED |
              HV_EX_PROCESSOR_MASKS_RECOMMENDED}
         },
@@ -920,7 +921,7 @@ static struct {
     [HYPERV_FEAT_STIMER_DIRECT] = {
         .desc = "direct mode synthetic timers (hv-stimer-direct)",
         .flags = {
-            {.fw = FEAT_HYPERV_EDX,
+            {.func = HV_CPUID_FEATURES, .reg = R_EDX,
              .bits = HV_STIMER_DIRECT_MODE_AVAILABLE}
         },
         .dependencies = BIT(HYPERV_FEAT_STIMER)
@@ -1066,48 +1067,6 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid_legacy(CPUState *cs)
     return cpuid;
 }
 
-static int hv_cpuid_get_fw(struct kvm_cpuid2 *cpuid, int fw, uint32_t *r)
-{
-    struct kvm_cpuid_entry2 *entry;
-    uint32_t func;
-    int reg;
-
-    switch (fw) {
-    case FEAT_HYPERV_EAX:
-        reg = R_EAX;
-        func = HV_CPUID_FEATURES;
-        break;
-    case FEAT_HYPERV_EDX:
-        reg = R_EDX;
-        func = HV_CPUID_FEATURES;
-        break;
-    case FEAT_HV_RECOMM_EAX:
-        reg = R_EAX;
-        func = HV_CPUID_ENLIGHTMENT_INFO;
-        break;
-    default:
-        return -EINVAL;
-    }
-
-    entry = cpuid_find_entry(cpuid, func, 0);
-    if (!entry) {
-        return -ENOENT;
-    }
-
-    switch (reg) {
-    case R_EAX:
-        *r = entry->eax;
-        break;
-    case R_EDX:
-        *r = entry->edx;
-        break;
-    default:
-        return -EINVAL;
-    }
-
-    return 0;
-}
-
 static uint32_t hv_cpuid_get_host(struct kvm_cpuid2 *cpuid, uint32_t func,
                                   int reg)
 {
@@ -1123,18 +1082,20 @@ static uint32_t hv_cpuid_get_host(struct kvm_cpuid2 *cpuid, uint32_t func,
 
 static bool hyperv_feature_supported(struct kvm_cpuid2 *cpuid, int feature)
 {
-    uint32_t r, fw, bits;
-    int i;
+    uint32_t func, bits;
+    int i, reg;
 
     for (i = 0; i < ARRAY_SIZE(kvm_hyperv_properties[feature].flags); i++) {
-        fw = kvm_hyperv_properties[feature].flags[i].fw;
+
+        func = kvm_hyperv_properties[feature].flags[i].func;
+        reg = kvm_hyperv_properties[feature].flags[i].reg;
         bits = kvm_hyperv_properties[feature].flags[i].bits;
 
-        if (!fw) {
+        if (!func) {
             continue;
         }
 
-        if (hv_cpuid_get_fw(cpuid, fw, &r) || (r & bits) != bits) {
+        if ((hv_cpuid_get_host(cpuid, func, reg) & bits) != bits) {
             return false;
         }
     }
@@ -1184,7 +1145,7 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
     return 0;
 }
 
-static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t fw)
+static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t func, int reg)
 {
     X86CPU *cpu = X86_CPU(cs);
     uint32_t r = 0;
@@ -1196,7 +1157,10 @@ static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t fw)
         }
 
         for (j = 0; j < ARRAY_SIZE(kvm_hyperv_properties[i].flags); j++) {
-            if (kvm_hyperv_properties[i].flags[j].fw != fw) {
+            if (kvm_hyperv_properties[i].flags[j].func != func) {
+                continue;
+            }
+            if (kvm_hyperv_properties[i].flags[j].reg != reg) {
                 continue;
             }
 
@@ -1348,16 +1312,16 @@ static int hyperv_handle_properties(CPUState *cs,
 
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_FEATURES;
-    c->eax = hv_build_cpuid_leaf(cs, FEAT_HYPERV_EAX);
-    c->ebx = hv_build_cpuid_leaf(cs, FEAT_HYPERV_EBX);
-    c->edx = hv_build_cpuid_leaf(cs, FEAT_HYPERV_EDX);
+    c->eax = hv_build_cpuid_leaf(cs, HV_CPUID_FEATURES, R_EAX);
+    c->ebx = hv_build_cpuid_leaf(cs, HV_CPUID_FEATURES, R_EBX);
+    c->edx = hv_build_cpuid_leaf(cs, HV_CPUID_FEATURES, R_EDX);
 
     /* Not exposed by KVM but needed to make CPU hotplug in Windows work */
     c->edx |= HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE;
 
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_ENLIGHTMENT_INFO;
-    c->eax = hv_build_cpuid_leaf(cs, FEAT_HV_RECOMM_EAX);
+    c->eax = hv_build_cpuid_leaf(cs, HV_CPUID_ENLIGHTMENT_INFO, R_EAX);
     c->ebx = cpu->hyperv_spinlock_attempts;
 
     if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_ON) {
-- 
2.30.2


