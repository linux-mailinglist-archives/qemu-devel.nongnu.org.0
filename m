Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB8F6A823F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:32:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi5P-0007bT-MI; Thu, 02 Mar 2023 07:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5H-0007RZ-PX
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5E-0002rU-Vt
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:30:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ceoIbQOk6izAHTjTrmjqkHlNAoN9f/28BcAw9b8QFI0=;
 b=H91brcOS8OPJ/lHEsQJwHoScCZJ1svYs3NjtqMc2K5PUMVv67RZ2T4+8AR/p5p/NmYH0xq
 SEVyhwrsUKqmOXKDBSVoruR2DgMtncsfCMVSt1raBdPzzKr5q++a7HpAejq8N+axP73Ewy
 FMAGykTRda0PycuqitGUexzuAN0yVIo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-357-1cbRUxUtNnGuhTc-FynEpQ-1; Thu, 02 Mar 2023 07:30:51 -0500
X-MC-Unique: 1cbRUxUtNnGuhTc-FynEpQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 az39-20020a05600c602700b003e97eb80524so1197358wmb.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:30:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ceoIbQOk6izAHTjTrmjqkHlNAoN9f/28BcAw9b8QFI0=;
 b=3Ri6A9ZQv0tXmok/YG6LMVMUsInhphVEOwEQ/D73UAMkbQbNYrCbHC3KXaEytpZmY4
 IHfJ2p1CjX5ZHGBIMLhznX6HglRaqEt9Ti4itnQCW7mC/OAIxIDmfio8iR2EWKUsItWq
 LCHxc55liiWa27ht0yFDdN7O3jMQUrKYe4svhjaa5DZMWplkAy8/rsTSZKdu7GVtzK1P
 zid5kmxhAHRFmPciCuu59MRkuCVNyHyyNIYd/kmz4lLv4wu4DcgiSu2J2eGh91D9OeDO
 HE3QfPRl0TQbmqBds5XLQTKR5zud5ifAvmpEcOhSCAwt+c3JfkbFIlKnG8gVTyLT/oVB
 N1Xw==
X-Gm-Message-State: AO0yUKWKiUj4dfZIX9jNiofe2PWY+qU6Yt43SL7AXC4s9NS9KB8ioV3Z
 vmuvUGTpZ2H2IayMPahNOzX/J4jYO7aAq86XMVTK/TDQHd0F7G9PcI0XQElH8P4jubrZBBsFtuJ
 bzxLjoxW2v402bpXQKyvhvlG1IzA42nCN2b0tMQd8nmrCFsZW27y1BUIB1gX2R6g/dY1v6VBaQG
 A=
X-Received: by 2002:a05:600c:491f:b0:3ea:bc08:42ad with SMTP id
 f31-20020a05600c491f00b003eabc0842admr7684902wmp.2.1677760249640; 
 Thu, 02 Mar 2023 04:30:49 -0800 (PST)
X-Google-Smtp-Source: AK7set9qSF7Hn1Opzo7Mx92ZLkPNb2FYlB01DX/83pfrlm3JRw54bUKF1KugkPTPKbumH8Q0HYf3mQ==
X-Received: by 2002:a05:600c:491f:b0:3ea:bc08:42ad with SMTP id
 f31-20020a05600c491f00b003eabc0842admr7684883wmp.2.1677760249287; 
 Thu, 02 Mar 2023 04:30:49 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a5d594f000000b002c5d3f0f737sm15074727wri.30.2023.03.02.04.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:30:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [PULL 05/62] i386/kvm: handle Xen HVM cpuid leaves
Date: Thu,  2 Mar 2023 13:29:32 +0100
Message-Id: <20230302123029.153265-6-pbonzini@redhat.com>
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

Introduce support for emulating CPUID for Xen HVM guests. It doesn't make
sense to advertise the KVM leaves to a Xen guest, so do Xen unconditionally
when the xen-version machine property is set.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Obtain xen_version from KVM property, make it automatic]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/cpu.c         |  1 +
 target/i386/cpu.h         |  2 +
 target/i386/kvm/kvm.c     | 77 ++++++++++++++++++++++++++++++++++++++-
 target/i386/kvm/xen-emu.c |  4 +-
 target/i386/kvm/xen-emu.h | 13 ++++++-
 5 files changed, 91 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4bad3d41d33f..a0fa04e079e8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7200,6 +7200,7 @@ static Property x86_cpu_properties[] = {
      * own cache information (see x86_cpu_load_def()).
      */
     DEFINE_PROP_BOOL("legacy-cache", X86CPU, legacy_cache, true),
+    DEFINE_PROP_BOOL("xen-vapic", X86CPU, xen_vapic, false),
 
     /*
      * From "Requirements for Implementing the Microsoft
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index ea650e68a3a2..5069adfbe7e0 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1975,6 +1975,8 @@ struct ArchCPU {
     int32_t thread_id;
 
     int32_t hv_max_vps;
+
+    bool xen_vapic;
 };
 
 
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index da7342630c03..aac43174e886 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -22,6 +22,7 @@
 
 #include <linux/kvm.h>
 #include "standard-headers/asm-x86/kvm_para.h"
+#include "hw/xen/interface/arch-x86/cpuid.h"
 
 #include "cpu.h"
 #include "host-cpu.h"
@@ -1819,7 +1820,77 @@ int kvm_arch_init_vcpu(CPUState *cs)
         has_msr_hv_hypercall = true;
     }
 
-    if (cpu->expose_kvm) {
+    if (cs->kvm_state->xen_version) {
+#ifdef CONFIG_XEN_EMU
+        struct kvm_cpuid_entry2 *xen_max_leaf;
+
+        memcpy(signature, "XenVMMXenVMM", 12);
+
+        xen_max_leaf = c = &cpuid_data.entries[cpuid_i++];
+        c->function = kvm_base + XEN_CPUID_SIGNATURE;
+        c->eax = kvm_base + XEN_CPUID_TIME;
+        c->ebx = signature[0];
+        c->ecx = signature[1];
+        c->edx = signature[2];
+
+        c = &cpuid_data.entries[cpuid_i++];
+        c->function = kvm_base + XEN_CPUID_VENDOR;
+        c->eax = cs->kvm_state->xen_version;
+        c->ebx = 0;
+        c->ecx = 0;
+        c->edx = 0;
+
+        c = &cpuid_data.entries[cpuid_i++];
+        c->function = kvm_base + XEN_CPUID_HVM_MSR;
+        /* Number of hypercall-transfer pages */
+        c->eax = 1;
+        /* Hypercall MSR base address */
+        if (hyperv_enabled(cpu)) {
+            c->ebx = XEN_HYPERCALL_MSR_HYPERV;
+            kvm_xen_init(cs->kvm_state, c->ebx);
+        } else {
+            c->ebx = XEN_HYPERCALL_MSR;
+        }
+        c->ecx = 0;
+        c->edx = 0;
+
+        c = &cpuid_data.entries[cpuid_i++];
+        c->function = kvm_base + XEN_CPUID_TIME;
+        c->eax = ((!!tsc_is_stable_and_known(env) << 1) |
+            (!!(env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_RDTSCP) << 2));
+        /* default=0 (emulate if necessary) */
+        c->ebx = 0;
+        /* guest tsc frequency */
+        c->ecx = env->user_tsc_khz;
+        /* guest tsc incarnation (migration count) */
+        c->edx = 0;
+
+        c = &cpuid_data.entries[cpuid_i++];
+        c->function = kvm_base + XEN_CPUID_HVM;
+        xen_max_leaf->eax = kvm_base + XEN_CPUID_HVM;
+        if (cs->kvm_state->xen_version >= XEN_VERSION(4, 5)) {
+            c->function = kvm_base + XEN_CPUID_HVM;
+
+            if (cpu->xen_vapic) {
+                c->eax |= XEN_HVM_CPUID_APIC_ACCESS_VIRT;
+                c->eax |= XEN_HVM_CPUID_X2APIC_VIRT;
+            }
+
+            c->eax |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
+
+            if (cs->kvm_state->xen_version >= XEN_VERSION(4, 6)) {
+                c->eax |= XEN_HVM_CPUID_VCPU_ID_PRESENT;
+                c->ebx = cs->cpu_index;
+            }
+        }
+
+        kvm_base += 0x100;
+#else /* CONFIG_XEN_EMU */
+        /* This should never happen as kvm_arch_init() would have died first. */
+        fprintf(stderr, "Cannot enable Xen CPUID without Xen support\n");
+        abort();
+#endif
+    } else if (cpu->expose_kvm) {
         memcpy(signature, "KVMKVMKVM\0\0\0", 12);
         c = &cpuid_data.entries[cpuid_i++];
         c->function = KVM_CPUID_SIGNATURE | kvm_base;
@@ -2539,7 +2610,9 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
             error_report("kvm: Xen support only available in PC machine");
             return -ENOTSUP;
         }
-        ret = kvm_xen_init(s);
+        /* hyperv_enabled() doesn't work yet. */
+        uint32_t msr = XEN_HYPERCALL_MSR;
+        ret = kvm_xen_init(s, msr);
         if (ret < 0) {
             return ret;
         }
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index b556d903aa94..34d5bc1bc964 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -15,12 +15,12 @@
 #include "kvm/kvm_i386.h"
 #include "xen-emu.h"
 
-int kvm_xen_init(KVMState *s)
+int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
 {
     const int required_caps = KVM_XEN_HVM_CONFIG_HYPERCALL_MSR |
         KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL | KVM_XEN_HVM_CONFIG_SHARED_INFO;
     struct kvm_xen_hvm_config cfg = {
-        .msr = XEN_HYPERCALL_MSR,
+        .msr = hypercall_msr,
         .flags = KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL,
     };
     int xen_caps, ret;
diff --git a/target/i386/kvm/xen-emu.h b/target/i386/kvm/xen-emu.h
index 4f31bd96cbb7..2101df01824b 100644
--- a/target/i386/kvm/xen-emu.h
+++ b/target/i386/kvm/xen-emu.h
@@ -12,8 +12,17 @@
 #ifndef QEMU_I386_KVM_XEN_EMU_H
 #define QEMU_I386_KVM_XEN_EMU_H
 
-#define XEN_HYPERCALL_MSR 0x40000000
+#define XEN_HYPERCALL_MSR               0x40000000
+#define XEN_HYPERCALL_MSR_HYPERV        0x40000200
 
-int kvm_xen_init(KVMState *s);
+#define XEN_CPUID_SIGNATURE        0
+#define XEN_CPUID_VENDOR           1
+#define XEN_CPUID_HVM_MSR          2
+#define XEN_CPUID_TIME             3
+#define XEN_CPUID_HVM              4
+
+#define XEN_VERSION(maj, min) ((maj) << 16 | (min))
+
+int kvm_xen_init(KVMState *s, uint32_t hypercall_msr);
 
 #endif /* QEMU_I386_KVM_XEN_EMU_H */
-- 
2.39.1


