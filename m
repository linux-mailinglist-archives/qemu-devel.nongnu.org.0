Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED146A82BC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:53:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi9M-0004qj-Qk; Thu, 02 Mar 2023 07:35:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi73-0002p4-Px
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi71-0003M2-9N
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oeOvon9/KtSbK3fyhkr3bR6YqiZBhFCHe2DV2w+o6iI=;
 b=a9aXKBVIP0Q6FE6foTdt6TKC2ReK6yjAVu9ETGO1sG9UpPiZQHcTWRUipIt5ZEWlqHbr1H
 r5CjrGna/GnKuI73aSegy5KCT5f0OqbXTX6+Ito8bV8VjoFVSiyEuLhwqRKvzsEK4VWK6H
 o00gZbI/StAFsB2BMaEacMaM4pyz7Q0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-359-9nZQKXuiPmqcoXRDe1dzIw-1; Thu, 02 Mar 2023 07:32:41 -0500
X-MC-Unique: 9nZQKXuiPmqcoXRDe1dzIw-1
Received: by mail-wm1-f72.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so1193389wma.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oeOvon9/KtSbK3fyhkr3bR6YqiZBhFCHe2DV2w+o6iI=;
 b=zGqD+zlsUx3f39w+rK/kxZdiBeVBUQ/TsqQxqUNoGr2gMnXsFiAnirNRLFn5Siog/d
 eq7zsX0+IeL5Hft8XNVuQXIAtqYYbGKFn89E4anCyao20o0Jq8gtl8NeJ6ns7OtvGoLY
 DY6rdR8/WFI67Ju7VSbaRdR8ce/8U1ndHImJaxNakySlaj0WIQeo4NDWvY+nicTjK+Q5
 5QGyucS/yR6WgIEIOdpE7Pr9rcibVsdJ7QTmVI2x2SoMjfoCh+hZzkvoV70UMzLwV/8j
 RK5zZN1Xl1OERlcsftQVe/hNcoEyexfUb5OSl/XJjxd1FJpfb/KaNxlBL4Ddpx4RPkjN
 D0pA==
X-Gm-Message-State: AO0yUKWZlgvYoqtPl3+myEXE2wft2u+ZZGT7HOR5+usddJ9K4otz2Flb
 PezHrTp01lBhQzWRkzEEbTxgPGzq+xEyFIkniOUAFIcg5QoI1jem10sM/pxLtbGFnUME+c2XYyH
 7E2pM+szQg4jL7KFkqZWA2zna4vqV/3CjKX/vhkEP53VYVhbtnzNifrColhqF31S++zBGsJXf9+
 w=
X-Received: by 2002:a05:600c:1c1f:b0:3eb:246d:7efd with SMTP id
 j31-20020a05600c1c1f00b003eb246d7efdmr1332663wms.2.1677760359191; 
 Thu, 02 Mar 2023 04:32:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+jEd109fjqZBg2Vq2oY6jAPzIZmilIfINvw+fQZsYDkkgXIFCKJ0S2Q1o8gOCdzXtd8ZQvWA==
X-Received: by 2002:a05:600c:1c1f:b0:3eb:246d:7efd with SMTP id
 j31-20020a05600c1c1f00b003eb246d7efdmr1332650wms.2.1677760358959; 
 Thu, 02 Mar 2023 04:32:38 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a05600c1c8e00b003e215a796fasm3217690wms.34.2023.03.02.04.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 43/62] hw/xen: Add xen_gnttab device for grant table emulation
Date: Thu,  2 Mar 2023 13:30:10 +0100
Message-Id: <20230302123029.153265-44-pbonzini@redhat.com>
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/meson.build   |   1 +
 hw/i386/kvm/xen_gnttab.c  | 111 ++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_gnttab.h  |  18 +++++++
 hw/i386/pc.c              |   2 +
 target/i386/kvm/xen-emu.c |   3 ++
 5 files changed, 135 insertions(+)
 create mode 100644 hw/i386/kvm/xen_gnttab.c
 create mode 100644 hw/i386/kvm/xen_gnttab.h

diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
index 325c9014965b..067ff525eeb6 100644
--- a/hw/i386/kvm/meson.build
+++ b/hw/i386/kvm/meson.build
@@ -7,6 +7,7 @@ i386_kvm_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
 i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files(
   'xen_overlay.c',
   'xen_evtchn.c',
+  'xen_gnttab.c',
   ))
 
 i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
new file mode 100644
index 000000000000..ef8857e50c7b
--- /dev/null
+++ b/hw/i386/kvm/xen_gnttab.c
@@ -0,0 +1,111 @@
+/*
+ * QEMU Xen emulation: Grant table support
+ *
+ * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "qemu/module.h"
+#include "qemu/lockable.h"
+#include "qemu/main-loop.h"
+#include "qapi/error.h"
+#include "qom/object.h"
+#include "exec/target_page.h"
+#include "exec/address-spaces.h"
+#include "migration/vmstate.h"
+
+#include "hw/sysbus.h"
+#include "hw/xen/xen.h"
+#include "xen_overlay.h"
+#include "xen_gnttab.h"
+
+#include "sysemu/kvm.h"
+#include "sysemu/kvm_xen.h"
+
+#include "hw/xen/interface/memory.h"
+#include "hw/xen/interface/grant_table.h"
+
+#define TYPE_XEN_GNTTAB "xen-gnttab"
+OBJECT_DECLARE_SIMPLE_TYPE(XenGnttabState, XEN_GNTTAB)
+
+#define XEN_PAGE_SHIFT 12
+#define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
+
+struct XenGnttabState {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+
+    uint32_t nr_frames;
+    uint32_t max_frames;
+};
+
+struct XenGnttabState *xen_gnttab_singleton;
+
+static void xen_gnttab_realize(DeviceState *dev, Error **errp)
+{
+    XenGnttabState *s = XEN_GNTTAB(dev);
+
+    if (xen_mode != XEN_EMULATE) {
+        error_setg(errp, "Xen grant table support is for Xen emulation");
+        return;
+    }
+    s->nr_frames = 0;
+    s->max_frames = kvm_xen_get_gnttab_max_frames();
+}
+
+static bool xen_gnttab_is_needed(void *opaque)
+{
+    return xen_mode == XEN_EMULATE;
+}
+
+static const VMStateDescription xen_gnttab_vmstate = {
+    .name = "xen_gnttab",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = xen_gnttab_is_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(nr_frames, XenGnttabState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void xen_gnttab_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = xen_gnttab_realize;
+    dc->vmsd = &xen_gnttab_vmstate;
+}
+
+static const TypeInfo xen_gnttab_info = {
+    .name          = TYPE_XEN_GNTTAB,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XenGnttabState),
+    .class_init    = xen_gnttab_class_init,
+};
+
+void xen_gnttab_create(void)
+{
+    xen_gnttab_singleton = XEN_GNTTAB(sysbus_create_simple(TYPE_XEN_GNTTAB,
+                                                           -1, NULL));
+}
+
+static void xen_gnttab_register_types(void)
+{
+    type_register_static(&xen_gnttab_info);
+}
+
+type_init(xen_gnttab_register_types)
+
+int xen_gnttab_map_page(uint64_t idx, uint64_t gfn)
+{
+    return -ENOSYS;
+}
+
diff --git a/hw/i386/kvm/xen_gnttab.h b/hw/i386/kvm/xen_gnttab.h
new file mode 100644
index 000000000000..a7caa94c838c
--- /dev/null
+++ b/hw/i386/kvm/xen_gnttab.h
@@ -0,0 +1,18 @@
+/*
+ * QEMU Xen emulation: Grant table support
+ *
+ * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_XEN_GNTTAB_H
+#define QEMU_XEN_GNTTAB_H
+
+void xen_gnttab_create(void);
+int xen_gnttab_map_page(uint64_t idx, uint64_t gfn);
+
+#endif /* QEMU_XEN_GNTTAB_H */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 71d3b8bec260..1cf112e54227 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -92,6 +92,7 @@
 #include "hw/virtio/virtio-mem-pci.h"
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
+#include "hw/i386/kvm/xen_gnttab.h"
 #include "hw/mem/memory-device.h"
 #include "sysemu/replay.h"
 #include "target/i386/cpu.h"
@@ -1860,6 +1861,7 @@ int pc_machine_kvm_type(MachineState *machine, const char *kvm_type)
     if (xen_mode == XEN_EMULATE) {
         xen_overlay_create();
         xen_evtchn_create();
+        xen_gnttab_create();
     }
 #endif
     return 0;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 46be63172686..6f9b7a5cb96e 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -25,6 +25,7 @@
 #include "hw/i386/apic-msidef.h"
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
+#include "hw/i386/kvm/xen_gnttab.h"
 
 #include "hw/xen/interface/version.h"
 #include "hw/xen/interface/sched.h"
@@ -563,6 +564,8 @@ static int add_to_physmap_one(uint32_t space, uint64_t idx, uint64_t gfn)
         return xen_set_shared_info(gfn);
 
     case XENMAPSPACE_grant_table:
+        return xen_gnttab_map_page(idx, gfn);
+
     case XENMAPSPACE_gmfn:
     case XENMAPSPACE_gmfn_range:
         return -ENOTSUP;
-- 
2.39.1


