Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9696E4E754
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 13:49:45 +0200 (CEST)
Received: from localhost ([::1]:59970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heI36-0007GE-QE
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 07:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49031)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1heHkY-0000fp-Ct
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1heHkV-0005TU-8b
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:34 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54498)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1heHkV-0005Qp-1U
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:31 -0400
Received: by mail-wm1-x332.google.com with SMTP id g135so5999995wme.4
 for <qemu-devel@nongnu.org>; Fri, 21 Jun 2019 04:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rLWxEjPZN+ttDy6470/jW3LY13Gz8VOEZike0sn0oXQ=;
 b=Bvzdz/Z513MYyxRbWwsxtM4IvKkQurc5MqVNLcsp4dDHTFAuGttSkA3OgieFIvxXeJ
 q5LO1OOZxPLmCV2WUbSsb+LCxSwx31K6Ym2L/i80vxKwEZFfSfJU4TN7KCxVMoP9uqYg
 JxHJB+5L68IaGs+YschFkoiMkXc5UdTyPlsG7rxCxF3Puqg/kX+eUwzK4pgrtu3frIcO
 hTwUXVSwFXouKBpWtnwAgHqClPBfg9nyNMwNUu6olSm9WeyNhFvVgeBL3QuKnVN4vCNC
 u9BtkmWYDnaITpEfok+pBtD7vbl/YFc9ti7i0XC+79seJvLC+NRMUSCDf9z4GxN5thrk
 qp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=rLWxEjPZN+ttDy6470/jW3LY13Gz8VOEZike0sn0oXQ=;
 b=BiRMCsKhQcRsojlEtXLDuA/ocll2+MRoD6RDd3f2LHcgsutMF35a7dGDp704m573On
 Fh7QRpED+90lZrXtwGRbv/pN8qdd4QJPEW1I1oaPeSWCJ6pqyhm/EyfjkuEZlo4eB5ly
 JvTrSmfw/PHNHUjQ/iLB0joTFXPxD3l9ksfndd33uieiYQZ8MkDrUkl4r0vCC5rnvQPq
 yjHoHubneYn0lwMLc9LdiTMhqhXtCECVJtd+/r83BQ3qJAoZS0Q4GhPMF/opQW7ksBhl
 YFwGH12sa3e2YAGH1G9hvSc2hdRr1ao4OW+oUA6c509YYz5a/EnhXVtf/gA+eE3Rj0dX
 4yvQ==
X-Gm-Message-State: APjAAAXcLm+BO7UIm/AA0D92V3tKNwMJRmYoccMjVRh/y2VuGWLVp/j4
 zQGkKRWwBr2fUOt0ZpzeuKrhSiGQ
X-Google-Smtp-Source: APXvYqwg8RHNJTJxZ6E+4Ov0SQTcWQxjYDlMCn20/q4lXJ6XWiopmJkeQoUWsz8mw59ot6L+RprW5Q==
X-Received: by 2002:a7b:cb94:: with SMTP id m20mr3694471wmi.144.1561116629737; 
 Fri, 21 Jun 2019 04:30:29 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id r3sm2712851wrr.61.2019.06.21.04.30.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 04:30:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 13:30:02 +0200
Message-Id: <1561116620-22245-8-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561116620-22245-1-git-send-email-pbonzini@redhat.com>
References: <1561116620-22245-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::332
Subject: [Qemu-devel] [PULL 07/25] i386/kvm: implement 'hv-passthrough' mode
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

In many case we just want to give Windows guests all currently supported
Hyper-V enlightenments and that's where this new mode may come handy. We
pass through what was returned by KVM_GET_SUPPORTED_HV_CPUID.

hv_cpuid_check_and_set() is modified to also set cpu->hyperv_* flags as
we may want to check them later (and we actually do for hv_runtime,
hv_synic,...).

'hv-passthrough' is a development only feature, a migration blocker is
added to prevent issues while migrating between hosts with different
feature sets.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20190517141924.19024-6-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/hyperv.txt   | 10 +++++++
 target/i386/cpu.c |  1 +
 target/i386/cpu.h |  1 +
 target/i386/kvm.c | 89 ++++++++++++++++++++++++++++++++++++++++++++++---------
 4 files changed, 87 insertions(+), 14 deletions(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index c423e0f..beadb2d 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -175,6 +175,16 @@ without the feature to find out if enabling it is beneficial.
 Requires: hv-vapic
 
 
+4. Development features
+========================
+In some cases (e.g. during development) it may make sense to use QEMU in
+'pass-through' mode and give Windows guests all enlightenments currently
+supported by KVM. This pass-through mode is enabled by "hv-passthrough" CPU
+flag.
+Note: enabling this flag effectively prevents migration as supported features
+may differ between target and destination.
+
+
 4. Useful links
 ================
 Hyper-V Top Level Functional specification and other information:
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e90c1ac..e07996c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5883,6 +5883,7 @@ static Property x86_cpu_properties[] = {
                       HYPERV_FEAT_EVMCS, 0),
     DEFINE_PROP_BIT64("hv-ipi", X86CPU, hyperv_features,
                       HYPERV_FEAT_IPI, 0),
+    DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
 
     DEFINE_PROP_BOOL("check", X86CPU, check_cpuid, true),
     DEFINE_PROP_BOOL("enforce", X86CPU, enforce_cpuid, false),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 30cd1a0..86edbf5 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1390,6 +1390,7 @@ struct X86CPU {
     char *hyperv_vendor_id;
     bool hyperv_synic_kvm_only;
     uint64_t hyperv_features;
+    bool hyperv_passthrough;
 
     bool check_cpuid;
     bool enforce_cpuid;
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index a041b4d..93ac6ba 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -639,7 +639,7 @@ static bool hyperv_enabled(X86CPU *cpu)
     CPUState *cs = CPU(cpu);
     return kvm_check_extension(cs->kvm_state, KVM_CAP_HYPERV) > 0 &&
         ((cpu->hyperv_spinlock_attempts != HYPERV_SPINLOCK_NEVER_RETRY) ||
-         cpu->hyperv_features);
+         cpu->hyperv_features || cpu->hyperv_passthrough);
 }
 
 static int kvm_arch_set_tsc_khz(CPUState *cs)
@@ -985,10 +985,10 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
-    uint32_t r, fw, bits;;
+    uint32_t r, fw, bits;
     int i;
 
-    if (!hyperv_feat_enabled(cpu, feature)) {
+    if (!hyperv_feat_enabled(cpu, feature) && !cpu->hyperv_passthrough) {
         return 0;
     }
 
@@ -1001,15 +1001,23 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
         }
 
         if (hv_cpuid_get_fw(cpuid, fw, &r) || (r & bits) != bits) {
-            fprintf(stderr,
-                    "Hyper-V %s is not supported by kernel\n",
-                    kvm_hyperv_properties[feature].desc);
-            return 1;
+            if (hyperv_feat_enabled(cpu, feature)) {
+                fprintf(stderr,
+                        "Hyper-V %s is not supported by kernel\n",
+                        kvm_hyperv_properties[feature].desc);
+                return 1;
+            } else {
+                return 0;
+            }
         }
 
         env->features[fw] |= bits;
     }
 
+    if (cpu->hyperv_passthrough) {
+        cpu->hyperv_features |= BIT(feature);
+    }
+
     return 0;
 }
 
@@ -1027,22 +1035,29 @@ static int hyperv_handle_properties(CPUState *cs,
     struct kvm_cpuid_entry2 *c;
     uint32_t signature[3];
     uint32_t cpuid_i = 0;
-    int r = 0;
+    int r;
 
     if (!hyperv_enabled(cpu))
         return 0;
 
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) ||
+        cpu->hyperv_passthrough) {
         uint16_t evmcs_version;
 
-        if (kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
-                                (uintptr_t)&evmcs_version)) {
+        r = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
+                                (uintptr_t)&evmcs_version);
+
+        if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) && r) {
             fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
                     kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
             return -ENOSYS;
         }
-        env->features[FEAT_HV_RECOMM_EAX] |= HV_ENLIGHTENED_VMCS_RECOMMENDED;
-        env->features[FEAT_HV_NESTED_EAX] = evmcs_version;
+
+        if (!r) {
+            env->features[FEAT_HV_RECOMM_EAX] |=
+                HV_ENLIGHTENED_VMCS_RECOMMENDED;
+            env->features[FEAT_HV_NESTED_EAX] = evmcs_version;
+        }
     }
 
     if (kvm_check_extension(cs->kvm_state, KVM_CAP_HYPERV_CPUID) > 0) {
@@ -1051,8 +1066,33 @@ static int hyperv_handle_properties(CPUState *cs,
         cpuid = get_supported_hv_cpuid_legacy(cs);
     }
 
+    if (cpu->hyperv_passthrough) {
+        memcpy(cpuid_ent, &cpuid->entries[0],
+               cpuid->nent * sizeof(cpuid->entries[0]));
+
+        c = cpuid_find_entry(cpuid, HV_CPUID_FEATURES, 0);
+        if (c) {
+            env->features[FEAT_HYPERV_EAX] = c->eax;
+            env->features[FEAT_HYPERV_EBX] = c->ebx;
+            env->features[FEAT_HYPERV_EDX] = c->eax;
+        }
+        c = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
+        if (c) {
+            env->features[FEAT_HV_RECOMM_EAX] = c->eax;
+
+            /* hv-spinlocks may have been overriden */
+            if (cpu->hyperv_spinlock_attempts != HYPERV_SPINLOCK_NEVER_RETRY) {
+                c->ebx = cpu->hyperv_spinlock_attempts;
+            }
+        }
+        c = cpuid_find_entry(cpuid, HV_CPUID_NESTED_FEATURES, 0);
+        if (c) {
+            env->features[FEAT_HV_NESTED_EAX] = c->eax;
+        }
+    }
+
     /* Features */
-    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_RELAXED);
+    r = hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_RELAXED);
     r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_VAPIC);
     r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_TIME);
     r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_CRASH);
@@ -1085,6 +1125,12 @@ static int hyperv_handle_properties(CPUState *cs,
         goto free;
     }
 
+    if (cpu->hyperv_passthrough) {
+        /* We already copied all feature words from KVM as is */
+        r = cpuid->nent;
+        goto free;
+    }
+
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_VENDOR_AND_MAX_FUNCTIONS;
     if (!cpu->hyperv_vendor_id) {
@@ -1156,11 +1202,26 @@ free:
     return r;
 }
 
+static Error *hv_passthrough_mig_blocker;
+
 static int hyperv_init_vcpu(X86CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
+    Error *local_err = NULL;
     int ret;
 
+    if (cpu->hyperv_passthrough && hv_passthrough_mig_blocker == NULL) {
+        error_setg(&hv_passthrough_mig_blocker,
+                   "'hv-passthrough' CPU flag prevents migration, use explicit"
+                   " set of hv-* flags instead");
+        ret = migrate_add_blocker(hv_passthrough_mig_blocker, &local_err);
+        if (local_err) {
+            error_report_err(local_err);
+            error_free(hv_passthrough_mig_blocker);
+            return ret;
+        }
+    }
+
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX) && !hv_vpindex_settable) {
         /*
          * the kernel doesn't support setting vp_index; assert that its value
-- 
1.8.3.1



