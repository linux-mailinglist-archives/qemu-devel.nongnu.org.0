Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07BF5D279
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 17:12:56 +0200 (CEST)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiKSm-0002Ql-4S
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 11:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57044)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hiKIC-0001iU-BH
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:02:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hiKI9-0004jl-OD
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:02:00 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52212)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hiKI8-0004T2-0e
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:01:57 -0400
Received: by mail-wm1-x342.google.com with SMTP id 207so1187580wma.1
 for <qemu-devel@nongnu.org>; Tue, 02 Jul 2019 08:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Hr3iA7qAJtOCS8u1vEWGuD19D8NaEBdGyux4f0bmqyI=;
 b=l42jDHFwQe1K86tprB9SlNbdem8F6Y5pZM9QCWnDoVx4wqanpO/0R2EBTBh26T45uW
 Eu3sJvS97jMGNyIgGKFX+DroPiGeUY3tTFJR2S3JTotsye7xe2R4k+gzqYsIrUSnVy1h
 dpELEm6frtD1AJmYDP/9JMlv/1PEfauRIrfxAQpItlEztjA8/WeMFQEV6CaH1GUVWAly
 oZRG+8o7Qr96+QFAnh57MHEKUsckvaYmsRDacv5UvNE7h2RVLwS/KAPxRyocf8D0r4ZL
 AL8UW2U5FQNP6ulXF/jfzp8gOtS5Vo1Fir/+tFFIVlLpvo3E7FZU28sFepM7dKXGg+pL
 eMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=Hr3iA7qAJtOCS8u1vEWGuD19D8NaEBdGyux4f0bmqyI=;
 b=gveo4wyKxPW163zg+9QohfZytmNN0tm3yW6npSfC6qGuTZMDs+bMFiTPxKfOh6h1eB
 vz1X+ZjHxsCATWC3l2/uTvrG7jkcAtVD+bUuxdbChLEvi3zGQcsgYpNroMLxF6KnctG6
 2Ic/xp4eM4VvY7s/qFYP/ewU84KrL+F4iolFyeL8/zeCt8WnhzOaUD+CaV0R9gP0jDSi
 DLVwDLS/dZpUXLgPdf3Nk0EV92RvuUUkJR6FWu8m0zQnyTqslVnY9C3CRy/OKPeVxnjC
 TdIGcCfBKdkwWQNYR4Y0q5wtul2gRmWBQjOy2n2RKyeHa+bjwtLmbWxUQLa6MVWs67jt
 TS4g==
X-Gm-Message-State: APjAAAWWfWKrgmS+Uh01i4IgPi3FMuLT/F3dcxv62upFVLBpNq1iMCYp
 J994IsGBLAwKeCYBEPWe9wYQVwoF4dk=
X-Google-Smtp-Source: APXvYqzCFuj4E2KA51xgIn5v/BU53alrRHAYCMVqEko6mcnvhWixgVwEKhDK58+xFbi+rkv5zIq8IQ==
X-Received: by 2002:a7b:c455:: with SMTP id l21mr3855243wmi.114.1562079691234; 
 Tue, 02 Jul 2019 08:01:31 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id m24sm3006262wmi.39.2019.07.02.08.01.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 08:01:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 17:01:20 +0200
Message-Id: <1562079681-19204-7-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562079681-19204-1-git-send-email-pbonzini@redhat.com>
References: <1562079681-19204-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH 6/7] target/i386: add VMX features
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
Cc: Liran Alon <liran.alon@oracle.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add code to convert the VMX feature words back into MSR values,
allowing the user to enable/disable VMX features as they wish.  The same
infrastructure enables support for limiting VMX features in named
CPU models.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 221 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/i386/cpu.h |   9 +++
 target/i386/kvm.c | 154 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 382 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4de44e4..12f76a3 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1211,6 +1211,163 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             .index = MSR_IA32_CORE_CAPABILITY,
         },
     },
+
+    [FEAT_VMX_PROCBASED_CTLS] = {
+        .type = MSR_FEATURE_WORD,
+        .feat_names = {
+            NULL, NULL, "vmx-vintr-pending", "vmx-tsc-offset",
+            NULL, NULL, NULL, "vmx-hlt-exit",
+            NULL, "vmx-invlpg-exit", "vmx-mwait-exit", "vmx-rdpmc-exit",
+            "vmx-rdtsc-exit", NULL, NULL, "vmx-cr3-load-noexit",
+            "vmx-cr3-store-noexit", NULL, NULL, "vmx-cr8-load-exit",
+            "vmx-cr8-store-exit", "vmx-flexpriority", "vmx-vnmi-pending", "vmx-movdr-exit",
+            "vmx-io-exit", "vmx-io-bitmap", NULL, "vmx-mtf",
+            "vmx-msr-bitmap", "vmx-monitor-exit", "vmx-pause-exit", "vmx-secondary-ctls",
+        },
+        .msr = {
+            .index = MSR_IA32_VMX_TRUE_PROCBASED_CTLS,
+        }
+    },
+
+    [FEAT_VMX_SECONDARY_CTLS] = {
+        .type = MSR_FEATURE_WORD,
+        .feat_names = {
+            "vmx-apicv-xapic", "vmx-ept", "vmx-desc-exit", "vmx-rdtscp-exit",
+            "vmx-apicv-x2apic", "vmx-vpid", "vmx-wbinvd-exit", "vmx-unrestricted-guest",
+            "vmx-apicv-register", "vmx-apicv-vid", "vmx-ple", "vmx-rdrand-exit",
+            "vmx-invpcid-exit", "vmx-vmfunc", "vmx-shadow-vmcs", "vmx-encls-exit",
+            "vmx-rdseed-exit", "vmx-pml", NULL, NULL,
+            "vmx-xsaves", NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+        },
+        .msr = {
+            .index = MSR_IA32_VMX_PROCBASED_CTLS2,
+        }
+    },
+
+    [FEAT_VMX_PINBASED_CTLS] = {
+        .type = MSR_FEATURE_WORD,
+        .feat_names = {
+            "vmx-intr-exit", NULL, NULL, "vmx-nmi-exit",
+            NULL, "vmx-vnmi", "vmx-preemption-timer", "vmx-posted-intr",
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+        },
+        .msr = {
+            .index = MSR_IA32_VMX_TRUE_PINBASED_CTLS,
+        }
+    },
+
+    [FEAT_VMX_EXIT_CTLS] = {
+        .type = MSR_FEATURE_WORD,
+        /*
+         * VMX_VM_EXIT_HOST_ADDR_SPACE_SIZE is copied from
+         * the LM CPUID bit.
+         */
+        .feat_names = {
+            NULL, NULL, "vmx-exit-nosave-debugctl", NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL /* vmx-exit-host-addr-space-size */, NULL, NULL,
+            "vmx-exit-load-perf-global-ctrl", NULL, NULL, "vmx-exit-ack-intr",
+            NULL, NULL, "vmx-exit-save-pat", "vmx-exit-load-pat",
+            "vmx-exit-save-efer", "vmx-exit-load-efer",
+                "vmx-exit-save-preemption-timer", "vmx-exit-clear-bndcfgs",
+            NULL, "vmx-exit-clear-rtit-ctl", NULL, NULL,
+            NULL, NULL, NULL, NULL,
+        },
+        .msr = {
+            .index = MSR_IA32_VMX_TRUE_EXIT_CTLS,
+        }
+    },
+
+    [FEAT_VMX_ENTRY_CTLS] = {
+        .type = MSR_FEATURE_WORD,
+        .feat_names = {
+            NULL, NULL, "vmx-entry-noload-debugctl", NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, "vmx-entry-ia32e-mode", NULL, NULL,
+            NULL, "vmx-entry-load-perf-global-ctrl", "vmx-entry-load-pat", "vmx-entry-load-efer",
+            "vmx-entry-load-bndcfgs", NULL, "vmx-entry-load-rtit-ctl", NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+        },
+        .msr = {
+            .index = MSR_IA32_VMX_TRUE_ENTRY_CTLS,
+        }
+    },
+
+    [FEAT_VMX_MISC] = {
+        .type = MSR_FEATURE_WORD,
+        .feat_names = {
+            NULL, NULL, NULL, NULL,
+            NULL, "vmx-store-lma", "vmx-activity-hlt", "vmx-activity-shutdown",
+            "vmx-activity-wait-sipi", NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, "vmx-vmwrite-vmexit-fields", "vmx-zero-len-inject", NULL,
+        },
+        .msr = {
+            .index = MSR_IA32_VMX_MISC,
+        }
+    },
+
+    [FEAT_VMX_EPT_VPID_CAPS] = {
+        .type = MSR_FEATURE_WORD,
+        .feat_names = {
+            "vmx-ept-execonly", NULL, NULL, NULL,
+            NULL, NULL, "vmx-page-walk-4", "vmx-page-walk-5",
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            "vmx-ept-2mb", "vmx-ept-1gb", NULL, NULL,
+            "vmx-invept", "vmx-eptad", "vmx-ept-advanced-exitinfo", NULL,
+            NULL, "vmx-invept-single-context", "vmx-invept-all-context", NULL,
+            NULL, NULL, NULL, NULL,
+            "vmx-invvpid", NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            "vmx-invvpid-single-addr", "vmx-invept-single-context",
+                "vmx-invvpid-all-context", "vmx-invept-single-context-noglobals",
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+        },
+        .msr = {
+            .index = MSR_IA32_VMX_EPT_VPID_CAP,
+        }
+    },
+
+    [FEAT_VMX_BASIC] = {
+        .type = MSR_FEATURE_WORD,
+        .feat_names = {
+            [54] = "vmx-ins-outs",
+            [55] = "vmx-true-ctls",
+        },
+        .msr = {
+            .index = MSR_IA32_VMX_BASIC,
+        },
+        /* Just to be safe - we don't support setting the MSEG version field.  */
+        .no_autoenable_flags = MSR_VMX_BASIC_DUAL_MONITOR,
+    },
+
+    [FEAT_VMX_VMFUNC] = {
+        .type = MSR_FEATURE_WORD,
+        .feat_names = {
+            [0] = "vmx-eptp-switching",
+        },
+        .msr = {
+            .index = MSR_IA32_VMX_VMFUNC,
+        }
+    },
+
 };
 
 typedef struct FeatureDep {
@@ -1227,6 +1384,70 @@ static FeatureDep feature_dependencies[] = {
         .from = FEAT_7_0_EDX,            .from_flag = CPUID_7_0_EDX_CORE_CAPABILITY,
         .to = FEAT_CORE_CAPABILITY,      .to_flags = ~0ull,
     },
+    {
+        .from = FEAT_1_ECX,              .from_flag = CPUID_EXT_VMX,
+        .to = FEAT_VMX_PROCBASED_CTLS,   .to_flags = ~0ull,
+    },
+    {
+        .from = FEAT_1_ECX,              .from_flag = CPUID_EXT_VMX,
+        .to = FEAT_VMX_PINBASED_CTLS,    .to_flags = ~0ull,
+    },
+    {
+        .from = FEAT_1_ECX,              .from_flag = CPUID_EXT_VMX,
+        .to = FEAT_VMX_EXIT_CTLS,        .to_flags = ~0ull,
+    },
+    {
+        .from = FEAT_1_ECX,              .from_flag = CPUID_EXT_VMX,
+        .to = FEAT_VMX_ENTRY_CTLS,       .to_flags = ~0ull,
+    },
+    {
+        .from = FEAT_1_ECX,              .from_flag = CPUID_EXT_VMX,
+        .to = FEAT_VMX_MISC,             .to_flags = ~0ull,
+    },
+    {
+        .from = FEAT_1_ECX,              .from_flag = CPUID_EXT_VMX,
+        .to = FEAT_VMX_BASIC,            .to_flags = ~0ull,
+    },
+    {
+        .from = FEAT_8000_0001_EDX,      .from_flag = CPUID_EXT2_LM,
+        .to = FEAT_VMX_ENTRY_CTLS,       .to_flags = VMX_VM_ENTRY_IA32E_MODE,
+    },
+    {
+        .from = FEAT_VMX_PROCBASED_CTLS, .from_flag = VMX_CPU_BASED_ACTIVATE_SECONDARY_CONTROLS,
+        .to = FEAT_VMX_SECONDARY_CTLS,   .to_flags = ~0ull,
+    },
+    {
+        .from = FEAT_XSAVE,              .from_flag = CPUID_XSAVE_XSAVES,
+        .to = FEAT_VMX_SECONDARY_CTLS,   .to_flags = VMX_SECONDARY_EXEC_XSAVES,
+    },
+    {
+        .from = FEAT_1_ECX,              .from_flag = CPUID_EXT_RDRAND,
+        .to = FEAT_VMX_SECONDARY_CTLS,   .to_flags = VMX_SECONDARY_EXEC_RDRAND_EXITING,
+    },
+    {
+        .from = FEAT_7_0_EBX,            .from_flag = CPUID_7_0_EBX_INVPCID,
+        .to = FEAT_VMX_SECONDARY_CTLS,   .to_flags = VMX_SECONDARY_EXEC_ENABLE_INVPCID,
+    },
+    {
+        .from = FEAT_7_0_EBX,            .from_flag = CPUID_7_0_EBX_RDSEED,
+        .to = FEAT_VMX_SECONDARY_CTLS,   .to_flags = VMX_SECONDARY_EXEC_RDSEED_EXITING,
+    },
+    {
+        .from = FEAT_8000_0001_EDX,      .from_flag = CPUID_EXT2_RDTSCP,
+        .to = FEAT_VMX_SECONDARY_CTLS,   .to_flags = VMX_SECONDARY_EXEC_RDTSCP,
+    },
+    {
+        .from = FEAT_VMX_SECONDARY_CTLS, .from_flag = VMX_SECONDARY_EXEC_ENABLE_EPT,
+        .to = FEAT_VMX_EPT_VPID_CAPS,    .to_flags = 0xffffffffull,
+    },
+    {
+        .from = FEAT_VMX_SECONDARY_CTLS, .from_flag = VMX_SECONDARY_EXEC_ENABLE_VPID,
+        .to = FEAT_VMX_EPT_VPID_CAPS,    .to_flags = 0xffffffffull << 32,
+    },
+    {
+        .from = FEAT_VMX_SECONDARY_CTLS, .from_flag = VMX_SECONDARY_EXEC_ENABLE_VMFUNC,
+        .to = FEAT_VMX_VMFUNC,           .to_flags = ~0ull,
+    },
 };
 
 typedef struct X86RegisterInfo32 {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index ec479d5..a5710c1 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -517,6 +517,15 @@ typedef enum FeatureWord {
     FEAT_XSAVE_COMP_HI, /* CPUID[EAX=0xd,ECX=0].EDX */
     FEAT_ARCH_CAPABILITIES,
     FEAT_CORE_CAPABILITY,
+    FEAT_VMX_PROCBASED_CTLS,
+    FEAT_VMX_SECONDARY_CTLS,
+    FEAT_VMX_PINBASED_CTLS,
+    FEAT_VMX_EXIT_CTLS,
+    FEAT_VMX_ENTRY_CTLS,
+    FEAT_VMX_MISC,
+    FEAT_VMX_EPT_VPID_CAPS,
+    FEAT_VMX_BASIC,
+    FEAT_VMX_VMFUNC,
     FEATURE_WORDS,
 } FeatureWord;
 
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 6801696..e35489c 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -96,6 +96,7 @@ static bool has_msr_virt_ssbd;
 static bool has_msr_smi_count;
 static bool has_msr_arch_capabs;
 static bool has_msr_core_capabs;
+static bool has_msr_vmx_vmfunc;
 
 static uint32_t has_architectural_pmu_version;
 static uint32_t num_architectural_pmu_gp_counters;
@@ -438,7 +439,8 @@ uint64_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index)
         struct kvm_msrs info;
         struct kvm_msr_entry entries[1];
     } msr_data;
-    uint32_t ret;
+    uint64_t value;
+    uint32_t ret, can_be_one, must_be_one;
 
     if (kvm_feature_msrs == NULL) { /* Host doesn't support feature MSRs */
         return 0;
@@ -464,7 +466,25 @@ uint64_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index)
         exit(1);
     }
 
-    return msr_data.entries[0].data;
+    value = msr_data.entries[0].data;
+    switch (index) {
+    case MSR_IA32_VMX_PROCBASED_CTLS2:
+    case MSR_IA32_VMX_TRUE_PINBASED_CTLS:
+    case MSR_IA32_VMX_TRUE_PROCBASED_CTLS:
+    case MSR_IA32_VMX_TRUE_ENTRY_CTLS:
+    case MSR_IA32_VMX_TRUE_EXIT_CTLS:
+        /*
+         * Return true for bits that can be one, but do not have to be one.
+         * The SDM tells us which bits could have a "must be one" setting,
+         * so we can do the opposite transformation in make_vmx_msr_value.
+         */
+        must_be_one = (uint32_t)value;
+        can_be_one = (uint32_t)(value >> 32);
+        return can_be_one & ~must_be_one;
+
+    default:
+        return value;
+    }
 }
 
 
@@ -1933,6 +1953,9 @@ static int kvm_get_supported_msrs(KVMState *s)
                 case MSR_IA32_CORE_CAPABILITY:
                     has_msr_core_capabs = true;
                     break;
+                case MSR_IA32_VMX_VMFUNC:
+                    has_msr_vmx_vmfunc = true;
+                    break;
                 }
             }
         }
@@ -2407,6 +2430,126 @@ static int kvm_put_msr_feature_control(X86CPU *cpu)
     return 0;
 }
 
+static uint64_t make_vmx_msr_value(uint32_t index, uint32_t features)
+{
+    uint32_t default1, can_be_one, can_be_zero;
+    uint32_t must_be_one;
+
+    switch (index) {
+    case MSR_IA32_VMX_TRUE_PINBASED_CTLS:
+        default1 = 0x00000016;
+        break;
+    case MSR_IA32_VMX_TRUE_PROCBASED_CTLS:
+        default1 = 0x0401e172;
+        break;
+    case MSR_IA32_VMX_TRUE_ENTRY_CTLS:
+        default1 = 0x000011ff;
+        break;
+    case MSR_IA32_VMX_TRUE_EXIT_CTLS:
+        default1 = 0x00036dff;
+        break;
+    case MSR_IA32_VMX_PROCBASED_CTLS2:
+        default1 = 0;
+        break;
+    default:
+        abort();
+    }
+
+    /* If a feature bit is set, the control can be either set or clear.
+     * Otherwise the value is limited to either 0 or 1 by default1.
+     */
+    can_be_one = features | default1;
+    can_be_zero = features | ~default1;
+    must_be_one = ~can_be_zero;
+
+    /*
+     * Bit 0:31 -> 0 if the control bit can be zero (i.e. 1 if it must be one).
+     * Bit 32:63 -> 1 if the control bit can be one.
+     */
+    return must_be_one | (((uint64_t)can_be_one) << 32);
+}
+
+#define VMCS12_MAX_FIELD_INDEX (0x17)
+
+static void kvm_msr_entry_add_vmx(X86CPU *cpu, FeatureWordArray f)
+{
+    uint64_t kvm_vmx_basic =
+        kvm_arch_get_supported_msr_feature(kvm_state,
+                                           MSR_IA32_VMX_BASIC);
+    uint64_t kvm_vmx_misc =
+        kvm_arch_get_supported_msr_feature(kvm_state,
+                                           MSR_IA32_VMX_MISC);
+    uint64_t kvm_vmx_ept_vpid =
+        kvm_arch_get_supported_msr_feature(kvm_state,
+                                           MSR_IA32_VMX_EPT_VPID_CAP);
+
+    /*
+     * If the guest is 64-bit, a value of 1 is allowed for the host address
+     * space size vmexit control.
+     */
+    uint64_t fixed_vmx_exit = f[FEAT_8000_0001_EDX] & CPUID_EXT2_LM
+        ? (uint64_t)VMX_VM_EXIT_HOST_ADDR_SPACE_SIZE << 32 : 0;
+
+    /*
+     * Bits 0-30, 32-44 and 50-53 come from the host.  KVM should
+     * not change them for backwards compatibility.
+     */
+    uint64_t fixed_vmx_basic = kvm_vmx_basic & 0x003c1fff7fffffffULL;
+
+    /*
+     * Same for bits 0-4 and 25-27.  Bits 16-24 (CR3 target count) can
+     * change in the future but are always zero for now, clear them to be
+     * future proof.  Bits 32-63 in theory could change, though KVM does
+     * not support dual-monitor treatment and probably never will; mask
+     * them out as well.
+     */
+    uint64_t fixed_vmx_misc = kvm_vmx_misc & 0x0e00001f;
+
+    /*
+     * EPT memory types should not change either, so we do not bother
+     * adding features for them.
+     */
+    uint64_t fixed_vmx_ept_mask =
+            (f[FEAT_VMX_SECONDARY_CTLS] & VMX_SECONDARY_EXEC_ENABLE_EPT ? 0x4100ull : 0);
+    uint64_t fixed_vmx_ept_vpid = kvm_vmx_ept_vpid & fixed_vmx_ept_mask;
+
+    kvm_msr_entry_add(cpu, MSR_IA32_VMX_TRUE_PROCBASED_CTLS,
+                      make_vmx_msr_value(MSR_IA32_VMX_TRUE_PROCBASED_CTLS,
+                                         f[FEAT_VMX_PROCBASED_CTLS]));
+    kvm_msr_entry_add(cpu, MSR_IA32_VMX_TRUE_PINBASED_CTLS,
+                      make_vmx_msr_value(MSR_IA32_VMX_TRUE_PINBASED_CTLS,
+                                         f[FEAT_VMX_PINBASED_CTLS]));
+    kvm_msr_entry_add(cpu, MSR_IA32_VMX_TRUE_EXIT_CTLS,
+                      make_vmx_msr_value(MSR_IA32_VMX_TRUE_EXIT_CTLS,
+                                         f[FEAT_VMX_EXIT_CTLS]) | fixed_vmx_exit);
+    kvm_msr_entry_add(cpu, MSR_IA32_VMX_TRUE_ENTRY_CTLS,
+                      make_vmx_msr_value(MSR_IA32_VMX_TRUE_ENTRY_CTLS,
+                                         f[FEAT_VMX_ENTRY_CTLS]));
+    kvm_msr_entry_add(cpu, MSR_IA32_VMX_PROCBASED_CTLS2,
+                      make_vmx_msr_value(MSR_IA32_VMX_PROCBASED_CTLS2,
+                                         f[FEAT_VMX_SECONDARY_CTLS]));
+    kvm_msr_entry_add(cpu, MSR_IA32_VMX_EPT_VPID_CAP,
+                      f[FEAT_VMX_EPT_VPID_CAPS] | fixed_vmx_ept_vpid);
+    kvm_msr_entry_add(cpu, MSR_IA32_VMX_BASIC,
+                      f[FEAT_VMX_BASIC] | fixed_vmx_basic);
+    kvm_msr_entry_add(cpu, MSR_IA32_VMX_MISC,
+                      f[FEAT_VMX_MISC] | fixed_vmx_misc);
+    if (has_msr_vmx_vmfunc) {
+        kvm_msr_entry_add(cpu, MSR_IA32_VMX_VMFUNC, f[FEAT_VMX_VMFUNC]);
+    }
+
+    /*
+     * Just to be safe, write these with constant values.  The CRn_FIXED1
+     * MSRs are generated by KVM based on the vCPU's CPUID.
+     */
+    kvm_msr_entry_add(cpu, MSR_IA32_VMX_CR0_FIXED0,
+                      CR0_PE_MASK | CR0_PG_MASK | CR0_NE_MASK);
+    kvm_msr_entry_add(cpu, MSR_IA32_VMX_CR4_FIXED0,
+                      CR4_VMXE_MASK);
+    kvm_msr_entry_add(cpu, MSR_IA32_VMX_VMCS_ENUM,
+                      VMCS12_MAX_FIELD_INDEX << 1);
+}
+
 static int kvm_put_msrs(X86CPU *cpu, int level)
 {
     CPUX86State *env = &cpu->env;
@@ -2659,6 +2802,13 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
             kvm_msr_entry_add(cpu, MSR_MC0_CTL + i, env->mce_banks[i]);
         }
     }
+    /*
+     * Older kernels do not include VMX MSRs in KVM_GET_MSR_INDEX_LIST, but
+     * all kernels with MSR features should have them.
+     */
+    if (kvm_feature_msrs && cpu_has_vmx(env)) {
+        kvm_msr_entry_add_vmx(cpu, env->features);
+    }
 
     ret = kvm_vcpu_ioctl(CPU(cpu), KVM_SET_MSRS, cpu->kvm_msr_buf);
     if (ret < 0) {
-- 
1.8.3.1



