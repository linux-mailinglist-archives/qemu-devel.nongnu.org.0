Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481766A8F2E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 03:27:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXv8B-0000xm-DA; Thu, 02 Mar 2023 21:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <33loBZAUKCr8mxmfslttlqj.htrvjrz-ij0jqstslsz.twl@flex--hshan.bounces.google.com>)
 id 1pXv89-0000xU-A8
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:26:45 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <33loBZAUKCr8mxmfslttlqj.htrvjrz-ij0jqstslsz.twl@flex--hshan.bounces.google.com>)
 id 1pXv84-0007YL-MN
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:26:42 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-536bbaeceeaso10045207b3.11
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1677810399;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=zQ2x+aeHys1kZAjJL1OoMqEJX4HPeP9vJYjOd4CMUSc=;
 b=SEnPjLKtuSlMt3wf9yhidyH1sLz2vpqe/nQCrfBzA6ydCqZZs2CbPRMABFkXx3w8ms
 41opebc11z/yw2Tt1NK9hU0t1EkwPrho+CePEqZPWUZhpBi6pvD+AV7P8guVd52RN2q/
 P0z2e4otF7jcRah2Eh4mryDccfav76Ei5fvICR2T8KQaJ5e3XW11CBfUhXnQtBgassDZ
 XDMhRrY5fH2SmBv2f02bVYc7JxGhE+PEVjHLZCQV7aAUYWfr3dfG26BKSLaVZFwgduaX
 zyRrtRKuBVlvWlumuCoMDaa+tJBpciho2xF41qu6ggJUceA6HcFa3HBK1gsffzT9LiZm
 22ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677810399;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zQ2x+aeHys1kZAjJL1OoMqEJX4HPeP9vJYjOd4CMUSc=;
 b=fCZNWcAv4POwk3zP+p7KW+8n3gAoFrLv65kltYawNGn0AotbysP4FkQquHxw5GHMN5
 oHa3qbW33nQmqbS/yQ0WzgNF5NT3NqYz9Kr8z7LQpc35Z+zD6vZ8aiGXo/pgvqa5W2nv
 f9KzobjvOnjGZ10ykE5Qhw5hJVbnidlRb/d/GhGFHGIaIcBNKJUrrSOQVvYab4GFgWy/
 Bob2lqRFEVIQermIvY+zzhfy+D7pMjRD7WMtSySrL02XtSPqD528aBL8JZ4AquQT3zY0
 coJiOOKn7N/LzwGGJWyZxcpb6PZRYFhxAbu7scXO/LLxiFYp5YsCsCbgNVs7rIBwKREI
 OpCA==
X-Gm-Message-State: AO0yUKUZqfwkOoCcjZ7fB1YNnO3VRoHXeAqugA6DR3szuJDF69jACR3z
 1abJwix23yytelEtWaqpMTCgIfwpMhw3qe6mdRsarWzsJByMygdQlLvkhNvXKJZwy9AoUgCai/k
 vGDGxpxbkrPMRbZ/Sm9sRawiwtr3o8MzngE3HPUM00H2O6vzDsnc4p4zwfg==
X-Google-Smtp-Source: AK7set/wmHl7CT1idGBB49TagBUjPGTrVLamPDkkwxeqCkmWVQNkYYflvE9VebsTgx5rXfNL5/NEJKi/Iw==
X-Received: from hshan17.roam.corp.google.com
 ([2620:15c:211:201:633f:2163:6a23:74ef])
 (user=hshan job=sendgmr) by 2002:a05:6902:304:b0:8f0:84b:8b9c with SMTP id
 b4-20020a056902030400b008f0084b8b9cmr0ybs.487.1677810398450; Thu, 02 Mar 2023
 18:26:38 -0800 (PST)
Date: Thu,  2 Mar 2023 18:26:16 -0800
In-Reply-To: <20230303022618.4098825-1-hshan@google.com>
Mime-Version: 1.0
References: <20230303022618.4098825-1-hshan@google.com>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Message-ID: <20230303022618.4098825-5-hshan@google.com>
Subject: [PATCH 5/6] Add the aehd-i8259 device type.
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=33loBZAUKCr8mxmfslttlqj.htrvjrz-ij0jqstslsz.twl@flex--hshan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
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

The aehd-i8259 device type represents the AEHD in kernel PICs.
The irqchips should be always in kernel when AEHD is used.

Signed-off-by: Haitao Shan <hshan@google.com>
---
 hw/i386/aehd/i8259.c     | 165 +++++++++++++++++++++++++++++++++++++++
 hw/i386/aehd/meson.build |   1 +
 hw/i386/pc.c             |   2 +
 include/hw/intc/i8259.h  |   1 +
 4 files changed, 169 insertions(+)
 create mode 100644 hw/i386/aehd/i8259.c

diff --git a/hw/i386/aehd/i8259.c b/hw/i386/aehd/i8259.c
new file mode 100644
index 0000000000..9a18e824dc
--- /dev/null
+++ b/hw/i386/aehd/i8259.c
@@ -0,0 +1,165 @@
+/*
+ * AEHD in-kernel PIC (i8259) support
+ *
+ * Copyright (c) 2011 Siemens AG
+ *
+ * Authors:
+ *  Jan Kiszka          <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL version 2.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "hw/isa/i8259_internal.h"
+#include "hw/i386/apic_internal.h"
+#include "sysemu/aehd.h"
+#include "sysemu/aehd-interface.h"
+
+#define TYPE_AEHD_I8259 "aehd-i8259"
+#define AEHD_PIC_CLASS(class) \
+    OBJECT_CLASS_CHECK(AEHDPICClass, (class), TYPE_AEHD_I8259)
+#define AEHD_PIC_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(AEHDPICClass, (obj), TYPE_AEHD_I8259)
+
+/**
+ * AEHDPICClass:
+ * @parent_realize: The parent's realizefn.
+ */
+typedef struct AEHDPICClass {
+    PICCommonClass parent_class;
+
+    DeviceRealize parent_realize;
+} AEHDPICClass;
+
+static void aehd_pic_get(PICCommonState *s)
+{
+    struct aehd_irqchip chip;
+    struct aehd_pic_state *aepic;
+    int ret;
+
+    chip.chip_id = s->master ? AEHD_IRQCHIP_PIC_MASTER : AEHD_IRQCHIP_PIC_SLAVE;
+    ret = aehd_vm_ioctl(aehd_state, AEHD_GET_IRQCHIP, &chip, sizeof(chip),
+                        &chip, sizeof(chip));
+    if (ret < 0) {
+        fprintf(stderr, "AEHD_GET_IRQCHIP failed: %s\n", strerror(ret));
+        abort();
+    }
+
+    aepic = &chip.chip.pic;
+
+    s->last_irr = aepic->last_irr;
+    s->irr = aepic->irr;
+    s->imr = aepic->imr;
+    s->isr = aepic->isr;
+    s->priority_add = aepic->priority_add;
+    s->irq_base = aepic->irq_base;
+    s->read_reg_select = aepic->read_reg_select;
+    s->poll = aepic->poll;
+    s->special_mask = aepic->special_mask;
+    s->init_state = aepic->init_state;
+    s->auto_eoi = aepic->auto_eoi;
+    s->rotate_on_auto_eoi = aepic->rotate_on_auto_eoi;
+    s->special_fully_nested_mode = aepic->special_fully_nested_mode;
+    s->init4 = aepic->init4;
+    s->elcr = aepic->elcr;
+    s->elcr_mask = aepic->elcr_mask;
+}
+
+static void aehd_pic_put(PICCommonState *s)
+{
+    struct aehd_irqchip chip;
+    struct aehd_pic_state *aepic;
+    int ret;
+
+    chip.chip_id = s->master ? AEHD_IRQCHIP_PIC_MASTER : AEHD_IRQCHIP_PIC_SLAVE;
+
+    aepic = &chip.chip.pic;
+
+    aepic->last_irr = s->last_irr;
+    aepic->irr = s->irr;
+    aepic->imr = s->imr;
+    aepic->isr = s->isr;
+    aepic->priority_add = s->priority_add;
+    aepic->irq_base = s->irq_base;
+    aepic->read_reg_select = s->read_reg_select;
+    aepic->poll = s->poll;
+    aepic->special_mask = s->special_mask;
+    aepic->init_state = s->init_state;
+    aepic->auto_eoi = s->auto_eoi;
+    aepic->rotate_on_auto_eoi = s->rotate_on_auto_eoi;
+    aepic->special_fully_nested_mode = s->special_fully_nested_mode;
+    aepic->init4 = s->init4;
+    aepic->elcr = s->elcr;
+    aepic->elcr_mask = s->elcr_mask;
+
+    ret = aehd_vm_ioctl(aehd_state, AEHD_SET_IRQCHIP,
+                        &chip, sizeof(chip), NULL, 0);
+    if (ret < 0) {
+        fprintf(stderr, "AEHD_GET_IRQCHIP failed: %s\n", strerror(ret));
+        abort();
+    }
+}
+
+static void aehd_pic_reset(DeviceState *dev)
+{
+    PICCommonState *s = PIC_COMMON(dev);
+
+    s->elcr = 0;
+    pic_reset_common(s);
+
+    aehd_pic_put(s);
+}
+
+static void aehd_pic_set_irq(void *opaque, int irq, int level)
+{
+    pic_stat_update_irq(irq, level);
+    aehd_set_irq(aehd_state, irq, level);
+}
+
+static void aehd_pic_realize(DeviceState *dev, Error **errp)
+{
+    PICCommonState *s = PIC_COMMON(dev);
+    AEHDPICClass *kpc = AEHD_PIC_GET_CLASS(dev);
+
+    memory_region_init_io(&s->base_io, OBJECT(dev), NULL, NULL, "aehd-pic", 2);
+    memory_region_init_io(&s->elcr_io, OBJECT(dev), NULL, NULL, "aehd-elcr", 1);
+
+
+    kpc->parent_realize(dev, errp);
+}
+
+qemu_irq *aehd_i8259_init(ISABus *bus)
+{
+    i8259_init_chip(TYPE_AEHD_I8259, bus, true);
+    i8259_init_chip(TYPE_AEHD_I8259, bus, false);
+
+    return qemu_allocate_irqs(aehd_pic_set_irq, NULL, ISA_NUM_IRQS);
+}
+
+static void aehd_i8259_class_init(ObjectClass *klass, void *data)
+{
+    AEHDPICClass *kpc = AEHD_PIC_CLASS(klass);
+    PICCommonClass *k = PIC_COMMON_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset     = aehd_pic_reset;
+    kpc->parent_realize = dc->realize;
+    dc->realize   = aehd_pic_realize;
+    k->pre_save   = aehd_pic_get;
+    k->post_load  = aehd_pic_put;
+}
+
+static const TypeInfo aehd_i8259_info = {
+    .name = TYPE_AEHD_I8259,
+    .parent = TYPE_PIC_COMMON,
+    .instance_size = sizeof(PICCommonState),
+    .class_init = aehd_i8259_class_init,
+    .class_size = sizeof(AEHDPICClass),
+};
+
+static void aehd_pic_register_types(void)
+{
+    type_register_static(&aehd_i8259_info);
+}
+
+type_init(aehd_pic_register_types)
diff --git a/hw/i386/aehd/meson.build b/hw/i386/aehd/meson.build
index 259c9f66f7..90c9a3e2b6 100644
--- a/hw/i386/aehd/meson.build
+++ b/hw/i386/aehd/meson.build
@@ -1,5 +1,6 @@
 i386_aehd_ss = ss.source_set()
 i386_aehd_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c'))
+i386_aehd_ss.add(when: 'CONFIG_I8259', if_true: files('i8259.c'))
 i386_aehd_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
 
 i386_ss.add_all(when: 'CONFIG_AEHD', if_true: i386_aehd_ss)
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 59513a5c38..3b45f75fbd 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1356,6 +1356,8 @@ void pc_i8259_create(ISABus *isa_bus, qemu_irq *i8259_irqs)
 
     if (kvm_pic_in_kernel()) {
         i8259 = kvm_i8259_init(isa_bus);
+    } else if (aehd_enabled()) {
+        i8259 = aehd_i8259_init(isa_bus);
     } else if (xen_enabled()) {
         i8259 = xen_interrupt_controller_init();
     } else {
diff --git a/include/hw/intc/i8259.h b/include/hw/intc/i8259.h
index c412575775..5ce85ed590 100644
--- a/include/hw/intc/i8259.h
+++ b/include/hw/intc/i8259.h
@@ -14,6 +14,7 @@ extern PICCommonState *isa_pic;
  */
 qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq_in);
 qemu_irq *kvm_i8259_init(ISABus *bus);
+qemu_irq *aehd_i8259_init(ISABus *bus);
 int pic_get_output(PICCommonState *s);
 int pic_read_irq(PICCommonState *s);
 
-- 
2.40.0.rc0.216.gc4246ad0f0-goog


