Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206906A830A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:00:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiBW-0007U1-O5; Thu, 02 Mar 2023 07:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi8H-0003K7-Da
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:34:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7i-0003xx-1g
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YnjkGLR5MCm0CPW75Kgqyct846xLnI4gs1BcmfaanK0=;
 b=MHE9fM/VdxnAKNkoMV1u2nv8GzEj3fNh+HUJ06KV15mIauAUtokq54lykWLbV5QLOLCWKe
 xfPCaupZmmRM5JfPD/e835oDUxLKwMkIECt+Twn/dD7S1n0moYClu6/pkC/oqT6Cx6Jj+Z
 n+YjzoyMHwSvkWO9Ot/UMUb8riaAZFg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-599-slyewoTqNgiF99Y5W46t0w-1; Thu, 02 Mar 2023 07:33:24 -0500
X-MC-Unique: slyewoTqNgiF99Y5W46t0w-1
Received: by mail-wm1-f72.google.com with SMTP id
 j32-20020a05600c1c2000b003e9bdf02c9fso1195144wms.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:33:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YnjkGLR5MCm0CPW75Kgqyct846xLnI4gs1BcmfaanK0=;
 b=JENKl2Asszku56SdEq3IU5k0oMk5iYeQLhCeZvcFQKV9pLVfwA6T0fqQMjfO15M4gs
 oul8STC4VQhmDxFVwonSZQeqiszik9ODLkZmMtVERL1GZyzvYrzrIzYeWxu7eL4XGTTh
 5LcCN7k4S5lB2omaPYerTgVUUdnsQzLmUwN6VfVUuoJEiaSKzFhTuE/nKRE/XL8cHlZF
 xT2xKSl6sJeKzEgH1tpAtGlW0E2+4i17zUQkcdo0gcLKyVG4mtlkhwvFvi+BPNZvDB4P
 nU6U2AhagMIbKX6xw6mJ87XmySDMZ0c08NYyXPRt1YAAe7u6rTWwvLDSUyYbpxcWKGQi
 egqg==
X-Gm-Message-State: AO0yUKUFyt6ifSaSkcI+/pkJfLTeevCjOBbtJe/VyGXvuRWfTAW95/WH
 83NS5e/nCF/RsiNcvftkTMBtfCWcHypwXaf08dIfrQMjX8au+40674wzL0lJSg59gu3QfVLkSOA
 f2YOzx3J8jGVJN/jKf+n35jjjXK90/dCnYDpwbZeiY7uIJiblpIqyDsmrI5mrQP29puDQgWFgQO
 A=
X-Received: by 2002:a05:600c:715:b0:3e8:f27b:a92c with SMTP id
 i21-20020a05600c071500b003e8f27ba92cmr7466974wmn.32.1677760402364; 
 Thu, 02 Mar 2023 04:33:22 -0800 (PST)
X-Google-Smtp-Source: AK7set8utcoL0qnO30ANLlX2ChF4z15iGsUY5xA44ZpxPEhk+t+p0f3qx7OkcEiRCSH2EVlTEfUNJA==
X-Received: by 2002:a05:600c:715:b0:3e8:f27b:a92c with SMTP id
 i21-20020a05600c071500b003e8f27ba92cmr7466957wmn.32.1677760401972; 
 Thu, 02 Mar 2023 04:33:21 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a7bce8a000000b003ea57808179sm2820341wmj.38.2023.03.02.04.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:33:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 58/62] kvm/i386: Add xen-evtchn-max-pirq property
Date: Thu,  2 Mar 2023 13:30:25 +0100
Message-Id: <20230302123029.153265-59-pbonzini@redhat.com>
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

From: David Woodhouse <dwmw@amazon.co.uk>

The default number of PIRQs is set to 256 to avoid issues with 32-bit MSI
devices. Allow it to be increased if the user desires.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 accel/kvm/kvm-all.c       |  1 +
 hw/i386/kvm/xen_evtchn.c  | 21 +++++++++++----------
 include/sysemu/kvm_int.h  |  1 +
 include/sysemu/kvm_xen.h  |  1 +
 target/i386/kvm/kvm.c     | 34 ++++++++++++++++++++++++++++++++++
 target/i386/kvm/xen-emu.c |  6 ++++++
 6 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 3d8e400bbf86..f2a6ea6a68a2 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3705,6 +3705,7 @@ static void kvm_accel_instance_init(Object *obj)
     s->notify_window = 0;
     s->xen_version = 0;
     s->xen_gnttab_max_frames = 64;
+    s->xen_evtchn_max_pirq = 256;
 }
 
 /**
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 69c0204d4f0c..886fbf6b3bed 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -302,17 +302,18 @@ void xen_evtchn_create(void)
     }
 
     /*
-     * We could parameterise the number of PIRQs available if needed,
-     * but for now limit it to 256. The Xen scheme for encoding PIRQ#
-     * into an MSI message is not compatible with 32-bit MSI, as it
-     * puts the high bits of the PIRQ# into the high bits of the MSI
-     * message address, instead of using the Extended Destination ID
-     * in address bits 4-11 which perhaps would have been a better
-     * choice. So to keep life simple, just stick with 256 as the
-     * default, which conveniently doesn't need to set anything
-     * outside the low 32 bits of the address.
+     * The Xen scheme for encoding PIRQ# into an MSI message is not
+     * compatible with 32-bit MSI, as it puts the high bits of the
+     * PIRQ# into the high bits of the MSI message address, instead of
+     * using the Extended Destination ID in address bits 4-11 which
+     * perhaps would have been a better choice.
+     *
+     * To keep life simple, kvm_accel_instance_init() initialises the
+     * default to 256. which conveniently doesn't need to set anything
+     * outside the low 32 bits of the address. It can be increased by
+     * setting the xen-evtchn-max-pirq property.
      */
-    s->nr_pirqs = 256;
+    s->nr_pirqs = kvm_xen_get_evtchn_max_pirq();
 
     s->nr_pirq_inuse_words = DIV_ROUND_UP(s->nr_pirqs, 64);
     s->pirq_inuse_bitmap = g_new0(uint64_t, s->nr_pirq_inuse_words);
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 39ce4d36f684..a641c974ea54 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -121,6 +121,7 @@ struct KVMState
     uint32_t xen_version;
     uint32_t xen_caps;
     uint16_t xen_gnttab_max_frames;
+    uint16_t xen_evtchn_max_pirq;
 };
 
 void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index b2aafaf7abdd..595abfbe402f 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -26,6 +26,7 @@ void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type);
 void kvm_xen_set_callback_asserted(void);
 int kvm_xen_set_vcpu_virq(uint32_t vcpu_id, uint16_t virq, uint16_t port);
 uint16_t kvm_xen_get_gnttab_max_frames(void);
+uint16_t kvm_xen_get_evtchn_max_pirq(void);
 
 #define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
                                  KVM_XEN_HVM_CONFIG_ ## cap))
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index d390137f02be..1aef54f87e64 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5922,6 +5922,33 @@ static void kvm_arch_set_xen_gnttab_max_frames(Object *obj, Visitor *v,
     s->xen_gnttab_max_frames = value;
 }
 
+static void kvm_arch_get_xen_evtchn_max_pirq(Object *obj, Visitor *v,
+                                             const char *name, void *opaque,
+                                             Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    uint16_t value = s->xen_evtchn_max_pirq;
+
+    visit_type_uint16(v, name, &value, errp);
+}
+
+static void kvm_arch_set_xen_evtchn_max_pirq(Object *obj, Visitor *v,
+                                             const char *name, void *opaque,
+                                             Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    Error *error = NULL;
+    uint16_t value;
+
+    visit_type_uint16(v, name, &value, &error);
+    if (error) {
+        error_propagate(errp, error);
+        return;
+    }
+
+    s->xen_evtchn_max_pirq = value;
+}
+
 void kvm_arch_accel_class_init(ObjectClass *oc)
 {
     object_class_property_add_enum(oc, "notify-vmexit", "NotifyVMexitOption",
@@ -5954,6 +5981,13 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
                               NULL, NULL);
     object_class_property_set_description(oc, "xen-gnttab-max-frames",
                                           "Maximum number of grant table frames");
+
+    object_class_property_add(oc, "xen-evtchn-max-pirq", "uint16",
+                              kvm_arch_get_xen_evtchn_max_pirq,
+                              kvm_arch_set_xen_evtchn_max_pirq,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "xen-evtchn-max-pirq",
+                                          "Maximum number of Xen PIRQs");
 }
 
 void kvm_set_max_apic_id(uint32_t max_apic_id)
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 96a90821969d..bad3131d08e1 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -1765,6 +1765,12 @@ uint16_t kvm_xen_get_gnttab_max_frames(void)
     return s->xen_gnttab_max_frames;
 }
 
+uint16_t kvm_xen_get_evtchn_max_pirq(void)
+{
+    KVMState *s = KVM_STATE(current_accel());
+    return s->xen_evtchn_max_pirq;
+}
+
 int kvm_put_xen_state(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
-- 
2.39.1


