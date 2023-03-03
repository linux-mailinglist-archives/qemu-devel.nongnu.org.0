Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B497B6A8F2A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 03:27:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXv89-0000xA-CS; Thu, 02 Mar 2023 21:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <33FoBZAUKCr0kvkdqjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--hshan.bounces.google.com>)
 id 1pXv83-0000wl-Sk
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:26:39 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <33FoBZAUKCr0kvkdqjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--hshan.bounces.google.com>)
 id 1pXv81-0007Xv-TN
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:26:39 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 d7-20020a25adc7000000b00953ffdfbe1aso896205ybe.23
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1677810396;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Os80dw8QyJd4/ZKOS1KxKkozjCiAs1UTtuUlBbbIAng=;
 b=BSg7+mjHgxN+dN8dd+O9jKxDocadgAGgwTw4f7+JuBMwWjHRdUKMKiK5bK3q9vVwVT
 tpASe1TzTkJnIaGqqE3nd+e8OtpNivjS/7ejwfgznrMTcZml7uIyZbF16/AYpN8BYM9g
 fR6qn8Ljn+hwWSMB5hF2CjYtx2NXr1bJe6Jsqy9V3JHFtkDUL7sRaQzSYRzRayyJETla
 NWYiVTbZMtXwuzBBuSyVrhiZadcdRYrNd7qfPx2BEwvJ6NjzdQmiG+F3r4HMLsNnsRJQ
 dulfOulVDpBv9Q8Akgs5a8gMW1uGhdOYbLOhC8jM/okOK8tQv/0ceKERBL+yD77x4tES
 HRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677810396;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Os80dw8QyJd4/ZKOS1KxKkozjCiAs1UTtuUlBbbIAng=;
 b=sgo7u/7MJxDHWKLkJJo8IuIMEcthilwihZbq3I3s8WH1RCVd+nvKsQpVS336v+OWJG
 YhAhdRhA6WNNsXkDzP+dITvFqM6mZh+umH6KYLWyHpg/t/gTXmPJNncRyeFU5pzq8lC3
 SIjA1mOF5UMkpG+Dyfk8kUVN8wzjPccJOlvVvFsJH8vrBDHtqIl3fsoCsl/Xe7RTBJMI
 gygfCPbOzrrJ5Hk0Gx97GnPGd9y7nCA0HGFu0KkdKG3lPYMwyWsL4FAUEXtrkXSzuOJ4
 XkGPOCoIKVcEmRGKDYMbIpSoonh5lueQl9nN1Bmb0XU7JbyMwT4exht+RgzsaQDL3Cnc
 S4Xg==
X-Gm-Message-State: AO0yUKUL5qdvuHsxjqGUf4ov/HG5YJXjt9HbXumWw5O/Uj66YfDmhcji
 wmLIoztFfAHqAjg/+iHoSsDkTowmYyqt5yIpnsq81dbyRMoXuu6mrvsi0z9GHv1qlS2skxIBva1
 IgKdm5URN86I0kfI48CrDBBP4itIIkOqOWcMIAMhR514EaUawwochNrkReA==
X-Google-Smtp-Source: AK7set9ANx2BiVqich8oG5cgH/MDU4EntqHI+YfAEG9foQb8lfGSr7uHAuOkpnRKyAHQa+Pqezd0iOcFyg==
X-Received: from hshan17.roam.corp.google.com
 ([2620:15c:211:201:633f:2163:6a23:74ef])
 (user=hshan job=sendgmr) by 2002:a81:b624:0:b0:52e:f77c:315d with SMTP id
 u36-20020a81b624000000b0052ef77c315dmr32783ywh.3.1677810396385; Thu, 02 Mar
 2023 18:26:36 -0800 (PST)
Date: Thu,  2 Mar 2023 18:26:15 -0800
In-Reply-To: <20230303022618.4098825-1-hshan@google.com>
Mime-Version: 1.0
References: <20230303022618.4098825-1-hshan@google.com>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Message-ID: <20230303022618.4098825-4-hshan@google.com>
Subject: [PATCH 4/6] Add the aehd-ioapic device type.
From: Haitao Shan <hshan@google.com>
To: qemu-devel@nongnu.org
Cc: Haitao Shan <hshan@google.com>, Haitao Shan <haitao.shan@google.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:Android Emulator..." <emu-dev@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=33FoBZAUKCr0kvkdqjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--hshan.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

The aehd-ioapic device type represents the AEHD in kernel IO-APIC.
The irqchips should be always in kernel when AEHD is used.

Signed-off-by: Haitao Shan <hshan@google.com>
---
 hw/i386/aehd/ioapic.c       | 164 ++++++++++++++++++++++++++++++++++++
 hw/i386/aehd/meson.build    |   1 +
 hw/i386/pc.c                |   3 +
 hw/i386/x86.c               |   3 +
 include/hw/intc/ioapic.h    |   1 +
 include/sysemu/aehd.h       |   4 +
 target/i386/aehd/aehd-all.c |  14 +++
 7 files changed, 190 insertions(+)
 create mode 100644 hw/i386/aehd/ioapic.c

diff --git a/hw/i386/aehd/ioapic.c b/hw/i386/aehd/ioapic.c
new file mode 100644
index 0000000000..62ffb0172f
--- /dev/null
+++ b/hw/i386/aehd/ioapic.c
@@ -0,0 +1,164 @@
+/*
+ * AEHD in-kernel IOPIC support
+ *
+ * Copyright (c) 2011 Siemens AG
+ *
+ * Authors:
+ *  Jan Kiszka          <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "monitor/monitor.h"
+#include "hw/i386/pc.h"
+#include "hw/qdev-properties.h"
+#include "hw/intc/ioapic_internal.h"
+#include "sysemu/aehd.h"
+#include "sysemu/aehd-interface.h"
+
+/* PC Utility function */
+void aehd_pc_setup_irq_routing(bool pci_enabled)
+{
+    AEHDState *s = aehd_state;
+    int i;
+
+    for (i = 0; i < 8; ++i) {
+        if (i == 2) {
+            continue;
+        }
+        aehd_irqchip_add_irq_route(s, i, AEHD_IRQCHIP_PIC_MASTER, i);
+    }
+    for (i = 8; i < 16; ++i) {
+        aehd_irqchip_add_irq_route(s, i, AEHD_IRQCHIP_PIC_SLAVE, i - 8);
+    }
+    if (pci_enabled) {
+        for (i = 0; i < 24; ++i) {
+            if (i == 0) {
+                aehd_irqchip_add_irq_route(s, i, AEHD_IRQCHIP_IOAPIC, 2);
+            } else if (i != 2) {
+                aehd_irqchip_add_irq_route(s, i, AEHD_IRQCHIP_IOAPIC, i);
+            }
+        }
+    }
+    aehd_irqchip_commit_routes(s);
+}
+
+typedef struct AEHDIOAPICState AEHDIOAPICState;
+
+struct AEHDIOAPICState {
+    IOAPICCommonState ioapic;
+    uint32_t aehd_gsi_base;
+};
+
+static void aehd_ioapic_get(IOAPICCommonState *s)
+{
+    struct aehd_irqchip chip;
+    struct aehd_ioapic_state *aioapic;
+    int ret, i;
+
+    chip.chip_id = AEHD_IRQCHIP_IOAPIC;
+    ret = aehd_vm_ioctl(aehd_state, AEHD_GET_IRQCHIP, &chip, sizeof(chip),
+                        &chip, sizeof(chip));
+    if (ret < 0) {
+        fprintf(stderr, "AEHD_GET_IRQCHIP failed: %s\n", strerror(ret));
+        abort();
+    }
+
+    aioapic = &chip.chip.ioapic;
+
+    s->id = aioapic->id;
+    s->ioregsel = aioapic->ioregsel;
+    s->irr = aioapic->irr;
+    for (i = 0; i < IOAPIC_NUM_PINS; i++) {
+        s->ioredtbl[i] = aioapic->redirtbl[i].bits;
+    }
+}
+
+static void aehd_ioapic_put(IOAPICCommonState *s)
+{
+    struct aehd_irqchip chip;
+    struct aehd_ioapic_state *aioapic;
+    int ret, i;
+
+    chip.chip_id = AEHD_IRQCHIP_IOAPIC;
+    aioapic = &chip.chip.ioapic;
+
+    aioapic->id = s->id;
+    aioapic->ioregsel = s->ioregsel;
+    aioapic->base_address = s->busdev.mmio[0].addr;
+    aioapic->irr = s->irr;
+    for (i = 0; i < IOAPIC_NUM_PINS; i++) {
+        aioapic->redirtbl[i].bits = s->ioredtbl[i];
+    }
+
+    ret = aehd_vm_ioctl(aehd_state, AEHD_SET_IRQCHIP,
+                        &chip, sizeof(chip), NULL, 0);
+    if (ret < 0) {
+        fprintf(stderr, "AEHD_GET_IRQCHIP failed: %s\n", strerror(ret));
+        abort();
+    }
+}
+
+static void aehd_ioapic_reset(DeviceState *dev)
+{
+    IOAPICCommonState *s = IOAPIC_COMMON(dev);
+
+    ioapic_reset_common(dev);
+    aehd_ioapic_put(s);
+}
+
+static void aehd_ioapic_set_irq(void *opaque, int irq, int level)
+{
+    AEHDIOAPICState *s = opaque;
+
+    aehd_set_irq(aehd_state, s->aehd_gsi_base + irq, level);
+}
+
+static void aehd_ioapic_realize(DeviceState *dev, Error **errp)
+{
+    IOAPICCommonState *s = IOAPIC_COMMON(dev);
+
+    memory_region_init_io(&s->io_memory, OBJECT(dev), NULL, NULL,
+                          "aehd-ioapic", 0x1000);
+
+    /*
+     * AEHD ioapic only supports 0x11 now. This will only be used when
+     * we want to dump ioapic version.
+     */
+    s->version = 0x11;
+
+    qdev_init_gpio_in(dev, aehd_ioapic_set_irq, IOAPIC_NUM_PINS);
+}
+
+static Property aehd_ioapic_properties[] = {
+    DEFINE_PROP_UINT32("gsi_base", AEHDIOAPICState, aehd_gsi_base, 0),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void aehd_ioapic_class_init(ObjectClass *klass, void *data)
+{
+    IOAPICCommonClass *k = IOAPIC_COMMON_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    k->realize   = aehd_ioapic_realize;
+    k->pre_save  = aehd_ioapic_get;
+    k->post_load = aehd_ioapic_put;
+    dc->reset    = aehd_ioapic_reset;
+    device_class_set_props(dc, aehd_ioapic_properties);
+}
+
+static const TypeInfo aehd_ioapic_info = {
+    .name  = TYPE_AEHD_IOAPIC,
+    .parent = TYPE_IOAPIC_COMMON,
+    .instance_size = sizeof(AEHDIOAPICState),
+    .class_init = aehd_ioapic_class_init,
+};
+
+static void aehd_ioapic_register_types(void)
+{
+    type_register_static(&aehd_ioapic_info);
+}
+
+type_init(aehd_ioapic_register_types)
diff --git a/hw/i386/aehd/meson.build b/hw/i386/aehd/meson.build
index 1749860954..259c9f66f7 100644
--- a/hw/i386/aehd/meson.build
+++ b/hw/i386/aehd/meson.build
@@ -1,4 +1,5 @@
 i386_aehd_ss = ss.source_set()
 i386_aehd_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c'))
+i386_aehd_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
 
 i386_ss.add_all(when: 'CONFIG_AEHD', if_true: i386_aehd_ss)
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 992951c107..59513a5c38 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -58,6 +58,7 @@
 #include "sysemu/tcg.h"
 #include "sysemu/numa.h"
 #include "sysemu/kvm.h"
+#include "sysemu/aehd.h"
 #include "sysemu/xen.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
@@ -405,6 +406,8 @@ GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled)
     s = g_new0(GSIState, 1);
     if (kvm_ioapic_in_kernel()) {
         kvm_pc_setup_irq_routing(pci_enabled);
+    } else if (aehd_enabled()) {
+        aehd_pc_setup_irq_routing(pci_enabled);
     }
     *irqs = qemu_allocate_irqs(gsi_handler, s, IOAPIC_NUM_PINS);
 
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index c44846f47b..ffc6f97ce0 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -34,6 +34,7 @@
 #include "qapi/visitor.h"
 #include "sysemu/qtest.h"
 #include "sysemu/whpx.h"
+#include "sysemu/aehd.h"
 #include "sysemu/numa.h"
 #include "sysemu/replay.h"
 #include "sysemu/reset.h"
@@ -628,6 +629,8 @@ void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name)
     assert(parent_name);
     if (kvm_ioapic_in_kernel()) {
         dev = qdev_new(TYPE_KVM_IOAPIC);
+    } else if (aehd_enabled()) {
+        dev = qdev_new(TYPE_AEHD_IOAPIC);
     } else {
         dev = qdev_new(TYPE_IOAPIC);
     }
diff --git a/include/hw/intc/ioapic.h b/include/hw/intc/ioapic.h
index aa122e25e3..6f46543e24 100644
--- a/include/hw/intc/ioapic.h
+++ b/include/hw/intc/ioapic.h
@@ -26,6 +26,7 @@
 #define IO_APIC_SECONDARY_IRQBASE 24 /* primary 0 -> 23, secondary 24 -> 47 */
 
 #define TYPE_KVM_IOAPIC "kvm-ioapic"
+#define TYPE_AEHD_IOAPIC "aehd-ioapic"
 #define TYPE_IOAPIC "ioapic"
 
 void ioapic_eoi_broadcast(int vector);
diff --git a/include/sysemu/aehd.h b/include/sysemu/aehd.h
index 87fa2f8362..534dd95e3c 100644
--- a/include/sysemu/aehd.h
+++ b/include/sysemu/aehd.h
@@ -66,6 +66,8 @@ int aehd_arch_release_virq_post(int virq);
 int aehd_set_irq(AEHDState *s, int irq, int level);
 int aehd_irqchip_send_msi(AEHDState *s, MSIMessage msg);
 
+void aehd_irqchip_add_irq_route(AEHDState *s, int gsi, int irqchip, int pin);
+
 void aehd_put_apic_state(DeviceState *d, struct aehd_lapic_state *kapic);
 void aehd_get_apic_state(DeviceState *d, struct aehd_lapic_state *kapic);
 
@@ -74,4 +76,6 @@ void aehd_get_apic_state(DeviceState *d, struct aehd_lapic_state *kapic);
 void aehd_irqchip_commit_routes(AEHDState *s);
 void aehd_irqchip_release_virq(AEHDState *s, int virq);
 
+void aehd_pc_setup_irq_routing(bool pci_enabled);
+
 #endif
diff --git a/target/i386/aehd/aehd-all.c b/target/i386/aehd/aehd-all.c
index f2eb80ecde..4c6a670cb7 100644
--- a/target/i386/aehd/aehd-all.c
+++ b/target/i386/aehd/aehd-all.c
@@ -124,6 +124,20 @@ static void aehd_add_routing_entry(AEHDState *s,
     set_gsi(s, entry->gsi);
 }
 
+void aehd_irqchip_add_irq_route(AEHDState *s, int irq, int irqchip, int pin)
+{
+    struct aehd_irq_routing_entry e = {};
+
+    assert(pin < s->gsi_count);
+
+    e.gsi = irq;
+    e.type = AEHD_IRQ_ROUTING_IRQCHIP;
+    e.flags = 0;
+    e.u.irqchip.irqchip = irqchip;
+    e.u.irqchip.pin = pin;
+    aehd_add_routing_entry(s, &e);
+}
+
 void aehd_irqchip_release_virq(AEHDState *s, int virq)
 {
     struct aehd_irq_routing_entry *e;
-- 
2.40.0.rc0.216.gc4246ad0f0-goog


