Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A52756A826C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:39:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi7G-0002eZ-J8; Thu, 02 Mar 2023 07:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6N-00020i-7e
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6L-0003E7-7P
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gRxuVZGl8h1KqXZTVo8H98oGMzaTj2zrcLO/J2UUgog=;
 b=TbSjVGauRQkR/x+VMWHXY7JTugA9n5Y4Ekm45XuO6P0WcZHn3MtQy0qdKwMVivMqiYSK5F
 GBH2SffJbvk93XM3duYxbShcxVxrHW7MF0Wd//iqWSR9o8tGvVo66Xt76hX7m8+Zxq3qFl
 8y/XuDntr3U7ojPEoGRhoQRmanyua0k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-204-vpTajjV8OCipOtNOQfHjmg-1; Thu, 02 Mar 2023 07:31:58 -0500
X-MC-Unique: vpTajjV8OCipOtNOQfHjmg-1
Received: by mail-wr1-f71.google.com with SMTP id
 m7-20020a056000008700b002c7047ea429so3199459wrx.21
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gRxuVZGl8h1KqXZTVo8H98oGMzaTj2zrcLO/J2UUgog=;
 b=1oMPKEuTOVMPsb4/IAk2IQ0yMabVejHHaOGJ7zwCpo3McVVrR3Ff5S/qYbxlgyoLTO
 iL4BR+vbj2yvPFEHtGDqI6BmUcL1aha98UxHcPBNsUAUOOvrrjaSq3qI44cPFGu8A5uo
 4XyUvIkBtBZKWEUrn5EX14aNeEPx6cpykQma+uFGTQcPDDXHc64hYhomq5QRjlcJXNGk
 8kxGJ5aDrtZzX9jO7irsaJqTDJgTAYSzGKgvbj2pH3MnRTlxfSuvUUaqGiJqP58659b/
 6gcvvGukQwWNWoN1pAAgo2RN01ri/PAWeT+0x8UhZEMXwozos9NmtJIjPTuQMtRP7lt3
 8ZTg==
X-Gm-Message-State: AO0yUKXNh7E0T17LQG8fOMzKOD8kukf0jWq0sDM68QTctNlGNm8AOH2H
 SgZOU2zFykZ7IMhssfWYNB/vQqPtMROnxVrNgWkPA/KGpuVTsU228M71gz4UZ0PHLusumQsvHLU
 87Byphe28vp1FuUmUwovgNUpoLOpryUB3DHICyVdcknkLTqJ4XNT7JKBec+DlOyaAhZZ5RcKSlC
 Q=
X-Received: by 2002:adf:f34e:0:b0:2c3:dd81:49ad with SMTP id
 e14-20020adff34e000000b002c3dd8149admr7439773wrp.33.1677760316181; 
 Thu, 02 Mar 2023 04:31:56 -0800 (PST)
X-Google-Smtp-Source: AK7set8zIWKSs2SRXciyt57uVT3Ewmnu45+h4rumYDmelaOmbrxmMosQfppJRGC7wKRy6K0042bPsA==
X-Received: by 2002:adf:f34e:0:b0:2c3:dd81:49ad with SMTP id
 e14-20020adff34e000000b002c3dd8149admr7439760wrp.33.1677760315846; 
 Thu, 02 Mar 2023 04:31:55 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc44a000000b003e21dcccf9fsm2682467wmi.16.2023.03.02.04.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 28/62] i386/xen: Add support for Xen event channel delivery to
 vCPU
Date: Thu,  2 Mar 2023 13:29:55 +0100
Message-Id: <20230302123029.153265-29-pbonzini@redhat.com>
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

From: David Woodhouse <dwmw@amazon.co.uk>

The kvm_xen_inject_vcpu_callback_vector() function will either deliver
the per-vCPU local APIC vector (as an MSI), or just kick the vCPU out
of the kernel to trigger KVM's automatic delivery of the global vector.
Support for asserting the GSI/PCI_INTX callbacks will come later.

Also add kvm_xen_get_vcpu_info_hva() which returns the vcpu_info of
a given vCPU.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 include/sysemu/kvm_xen.h  |  2 +
 target/i386/cpu.h         |  2 +
 target/i386/kvm/xen-emu.c | 94 ++++++++++++++++++++++++++++++++++++---
 3 files changed, 92 insertions(+), 6 deletions(-)

diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index cec21c8fab2f..644c7d889c6b 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -21,6 +21,8 @@
 
 int kvm_xen_soft_reset(void);
 uint32_t kvm_xen_get_caps(void);
+void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id);
+void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type);
 
 #define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
                                  KVM_XEN_HVM_CONFIG_ ## cap))
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e882c4e251c1..1c7603221dc6 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1799,6 +1799,8 @@ typedef struct CPUArchState {
 #endif
 #if defined(CONFIG_KVM)
     struct kvm_nested_state *nested_state;
+    MemoryRegion *xen_vcpu_info_mr;
+    void *xen_vcpu_info_hva;
     uint64_t xen_vcpu_info_gpa;
     uint64_t xen_vcpu_info_default_gpa;
     uint64_t xen_vcpu_time_info_gpa;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 435c51f625a1..1b319e8bad69 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -21,6 +21,8 @@
 #include "trace.h"
 #include "sysemu/runstate.h"
 
+#include "hw/pci/msi.h"
+#include "hw/i386/apic-msidef.h"
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
 
@@ -248,6 +250,43 @@ static void do_set_vcpu_callback_vector(CPUState *cs, run_on_cpu_data data)
     }
 }
 
+static int set_vcpu_info(CPUState *cs, uint64_t gpa)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    MemoryRegionSection mrs = { .mr = NULL };
+    void *vcpu_info_hva = NULL;
+    int ret;
+
+    ret = kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, gpa);
+    if (ret || gpa == INVALID_GPA) {
+        goto out;
+    }
+
+    mrs = memory_region_find(get_system_memory(), gpa,
+                             sizeof(struct vcpu_info));
+    if (mrs.mr && mrs.mr->ram_block &&
+        !int128_lt(mrs.size, int128_make64(sizeof(struct vcpu_info)))) {
+        vcpu_info_hva = qemu_map_ram_ptr(mrs.mr->ram_block,
+                                         mrs.offset_within_region);
+    }
+    if (!vcpu_info_hva) {
+        if (mrs.mr) {
+            memory_region_unref(mrs.mr);
+            mrs.mr = NULL;
+        }
+        ret = -EINVAL;
+    }
+
+ out:
+    if (env->xen_vcpu_info_mr) {
+        memory_region_unref(env->xen_vcpu_info_mr);
+    }
+    env->xen_vcpu_info_hva = vcpu_info_hva;
+    env->xen_vcpu_info_mr = mrs.mr;
+    return ret;
+}
+
 static void do_set_vcpu_info_default_gpa(CPUState *cs, run_on_cpu_data data)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -257,8 +296,7 @@ static void do_set_vcpu_info_default_gpa(CPUState *cs, run_on_cpu_data data)
 
     /* Changing the default does nothing if a vcpu_info was explicitly set. */
     if (env->xen_vcpu_info_gpa == INVALID_GPA) {
-        kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO,
-                              env->xen_vcpu_info_default_gpa);
+        set_vcpu_info(cs, env->xen_vcpu_info_default_gpa);
     }
 }
 
@@ -269,8 +307,52 @@ static void do_set_vcpu_info_gpa(CPUState *cs, run_on_cpu_data data)
 
     env->xen_vcpu_info_gpa = data.host_ulong;
 
-    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO,
-                          env->xen_vcpu_info_gpa);
+    set_vcpu_info(cs, env->xen_vcpu_info_gpa);
+}
+
+void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id)
+{
+    CPUState *cs = qemu_get_cpu(vcpu_id);
+    if (!cs) {
+        return NULL;
+    }
+
+    return X86_CPU(cs)->env.xen_vcpu_info_hva;
+}
+
+void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type)
+{
+    CPUState *cs = qemu_get_cpu(vcpu_id);
+    uint8_t vector;
+
+    if (!cs) {
+        return;
+    }
+
+    vector = X86_CPU(cs)->env.xen_vcpu_callback_vector;
+    if (vector) {
+        /*
+         * The per-vCPU callback vector injected via lapic. Just
+         * deliver it as an MSI.
+         */
+        MSIMessage msg = {
+            .address = APIC_DEFAULT_ADDRESS | X86_CPU(cs)->apic_id,
+            .data = vector | (1UL << MSI_DATA_LEVEL_SHIFT),
+        };
+        kvm_irqchip_send_msi(kvm_state, msg);
+        return;
+    }
+
+    switch (type) {
+    case HVM_PARAM_CALLBACK_TYPE_VECTOR:
+        /*
+         * If the evtchn_upcall_pending field in the vcpu_info is set, then
+         * KVM will automatically deliver the vector on entering the vCPU
+         * so all we have to do is kick it out.
+         */
+        qemu_cpu_kick(cs);
+        break;
+    }
 }
 
 static void do_set_vcpu_time_info_gpa(CPUState *cs, run_on_cpu_data data)
@@ -306,7 +388,7 @@ static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
     env->xen_vcpu_runstate_gpa = INVALID_GPA;
     env->xen_vcpu_callback_vector = 0;
 
-    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, INVALID_GPA);
+    set_vcpu_info(cs, INVALID_GPA);
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO,
                           INVALID_GPA);
     kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR,
@@ -903,7 +985,7 @@ int kvm_put_xen_state(CPUState *cs)
     }
 
     if (gpa != INVALID_GPA) {
-        ret = kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, gpa);
+        ret = set_vcpu_info(cs, gpa);
         if (ret < 0) {
             return ret;
         }
-- 
2.39.1


