Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEB76A82EF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:57:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiAN-0006fQ-HR; Thu, 02 Mar 2023 07:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7g-0002xG-1h
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7N-0003uJ-0n
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GN/OxjDVjnnq3jpXOu8rLzM/zwUty9pjbgmj3uixKJc=;
 b=b8hayrGWxj2YAgI/4q8oCZgzvH7bNfxqdiqJ9/QyTQY9yBHiYNFiWOQ/qdgS/VD8eJpd00
 qcia95fMOc+aecgrBW2eV6sjhJgqn9U9UlegnoGhKrZ3VfxhwS2Cqo0KLiZdCwo5VGGTsE
 ddBgvJfLADExnm1g/5lKIBDvkLyYmag=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-532-FHchQafjPyaitzvo_rM10Q-1; Thu, 02 Mar 2023 07:33:03 -0500
X-MC-Unique: FHchQafjPyaitzvo_rM10Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 x18-20020a1c7c12000000b003e1e7d3cf9fso1206262wmc.3
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:33:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GN/OxjDVjnnq3jpXOu8rLzM/zwUty9pjbgmj3uixKJc=;
 b=xf8dm5RjC3/soraOsEr0XFoZpvMHXD0o0LfgjhKmmQ54e0uJav2y8FjUldKaYmfO7y
 S2F7pFMvK+vEWGCZ8o9h5XTunpz7qJc6uyTKfPvJDzpkCq4r27IiyQF4zwBGZREW12mR
 kfLQ2ipTSAsJQDBPbegGxMjsO6CzX60tVDgqIZAgCMKLMesOAfSnCbUyG7usuPtOFu+L
 XeC4epSrHLHrL5yBIKituhdLUxLqOwMK+GZuN+eftz1fceiMwirXTnVZ3BEqvtMVpC9C
 Gy02v52lHecPDFQIZU6fytTfmUfF9ku893YSBAfedoKP+6pihCC9ceCDsuDKfaDt0ruT
 Xdvg==
X-Gm-Message-State: AO0yUKUHeK7KyfohCHkitbx5MLw3WhRiepVdD7ICklvCAlzwlzDiBb+O
 rbaNjsDMqX/osKBczGu53AHQZV6ZczmVR/G3VE3b1+/Nks6HrAglG0GldTFIUlUIDwV+CUndfxH
 sfHn39zQgONbUpWL2TPyo1hY7iUWuRMtmHFFBvYJwT1y7x9vIvexJPkHedlbUGA3RUr70EbHVkj
 4=
X-Received: by 2002:a05:600c:1e12:b0:3eb:2067:1141 with SMTP id
 ay18-20020a05600c1e1200b003eb20671141mr7339735wmb.38.1677760382002; 
 Thu, 02 Mar 2023 04:33:02 -0800 (PST)
X-Google-Smtp-Source: AK7set9vCsev6ngRCbUDIdEo6p8uGmvyLuy9w4FEo4lzn7HpePoZBCloZwnclmfUh4SJuTmVi400jw==
X-Received: by 2002:a05:600c:1e12:b0:3eb:2067:1141 with SMTP id
 ay18-20020a05600c1e1200b003eb20671141mr7339718wmb.38.1677760381677; 
 Thu, 02 Mar 2023 04:33:01 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a5d5149000000b002c54c92e125sm15328917wrt.46.2023.03.02.04.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:33:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 51/62] hw/xen: Add xen_xenstore device for xenstore emulation
Date: Thu,  2 Mar 2023 13:30:18 +0100
Message-Id: <20230302123029.153265-52-pbonzini@redhat.com>
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

Just the basic shell, with the event channel hookup. It only dumps the
buffer for now; a real ring implmentation will come in a subsequent patch.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/meson.build    |   1 +
 hw/i386/kvm/xen_evtchn.c   |   1 +
 hw/i386/kvm/xen_xenstore.c | 252 +++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_xenstore.h |  20 +++
 hw/i386/pc.c               |   2 +
 target/i386/kvm/xen-emu.c  |  12 ++
 6 files changed, 288 insertions(+)
 create mode 100644 hw/i386/kvm/xen_xenstore.c
 create mode 100644 hw/i386/kvm/xen_xenstore.h

diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
index 067ff525eeb6..82dd6ae7c6d9 100644
--- a/hw/i386/kvm/meson.build
+++ b/hw/i386/kvm/meson.build
@@ -8,6 +8,7 @@ i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files(
   'xen_overlay.c',
   'xen_evtchn.c',
   'xen_gnttab.c',
+  'xen_xenstore.c',
   ))
 
 i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 601fbeee725a..6c396270b75d 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -34,6 +34,7 @@
 
 #include "xen_evtchn.h"
 #include "xen_overlay.h"
+#include "xen_xenstore.h"
 
 #include "sysemu/kvm.h"
 #include "sysemu/kvm_xen.h"
diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
new file mode 100644
index 000000000000..e8abddae57bd
--- /dev/null
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -0,0 +1,252 @@
+/*
+ * QEMU Xen emulation: Shared/overlay pages support
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
+
+#include "qemu/host-utils.h"
+#include "qemu/module.h"
+#include "qemu/main-loop.h"
+#include "qemu/cutils.h"
+#include "qapi/error.h"
+#include "qom/object.h"
+#include "migration/vmstate.h"
+
+#include "hw/sysbus.h"
+#include "hw/xen/xen.h"
+#include "xen_overlay.h"
+#include "xen_evtchn.h"
+#include "xen_xenstore.h"
+
+#include "sysemu/kvm.h"
+#include "sysemu/kvm_xen.h"
+
+#include "hw/xen/interface/io/xs_wire.h"
+#include "hw/xen/interface/event_channel.h"
+
+#define TYPE_XEN_XENSTORE "xen-xenstore"
+OBJECT_DECLARE_SIMPLE_TYPE(XenXenstoreState, XEN_XENSTORE)
+
+#define XEN_PAGE_SHIFT 12
+#define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
+
+#define ENTRIES_PER_FRAME_V1 (XEN_PAGE_SIZE / sizeof(grant_entry_v1_t))
+#define ENTRIES_PER_FRAME_V2 (XEN_PAGE_SIZE / sizeof(grant_entry_v2_t))
+
+#define XENSTORE_HEADER_SIZE ((unsigned int)sizeof(struct xsd_sockmsg))
+
+struct XenXenstoreState {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+
+    MemoryRegion xenstore_page;
+    struct xenstore_domain_interface *xs;
+    uint8_t req_data[XENSTORE_HEADER_SIZE + XENSTORE_PAYLOAD_MAX];
+    uint8_t rsp_data[XENSTORE_HEADER_SIZE + XENSTORE_PAYLOAD_MAX];
+    uint32_t req_offset;
+    uint32_t rsp_offset;
+    bool rsp_pending;
+    bool fatal_error;
+
+    evtchn_port_t guest_port;
+    evtchn_port_t be_port;
+    struct xenevtchn_handle *eh;
+};
+
+struct XenXenstoreState *xen_xenstore_singleton;
+
+static void xen_xenstore_event(void *opaque);
+
+static void xen_xenstore_realize(DeviceState *dev, Error **errp)
+{
+    XenXenstoreState *s = XEN_XENSTORE(dev);
+
+    if (xen_mode != XEN_EMULATE) {
+        error_setg(errp, "Xen xenstore support is for Xen emulation");
+        return;
+    }
+    memory_region_init_ram(&s->xenstore_page, OBJECT(dev), "xen:xenstore_page",
+                           XEN_PAGE_SIZE, &error_abort);
+    memory_region_set_enabled(&s->xenstore_page, true);
+    s->xs = memory_region_get_ram_ptr(&s->xenstore_page);
+    memset(s->xs, 0, XEN_PAGE_SIZE);
+
+    /* We can't map it this early as KVM isn't ready */
+    xen_xenstore_singleton = s;
+
+    s->eh = xen_be_evtchn_open();
+    if (!s->eh) {
+        error_setg(errp, "Xenstore evtchn port init failed");
+        return;
+    }
+    aio_set_fd_handler(qemu_get_aio_context(), xen_be_evtchn_fd(s->eh), true,
+                       xen_xenstore_event, NULL, NULL, NULL, s);
+}
+
+static bool xen_xenstore_is_needed(void *opaque)
+{
+    return xen_mode == XEN_EMULATE;
+}
+
+static int xen_xenstore_pre_save(void *opaque)
+{
+    XenXenstoreState *s = opaque;
+
+    if (s->eh) {
+        s->guest_port = xen_be_evtchn_get_guest_port(s->eh);
+    }
+    return 0;
+}
+
+static int xen_xenstore_post_load(void *opaque, int ver)
+{
+    XenXenstoreState *s = opaque;
+
+    /*
+     * As qemu/dom0, rebind to the guest's port. The Windows drivers may
+     * unbind the XenStore evtchn and rebind to it, having obtained the
+     * "remote" port through EVTCHNOP_status. In the case that migration
+     * occurs while it's unbound, the "remote" port needs to be the same
+     * as before so that the guest can find it, but should remain unbound.
+     */
+    if (s->guest_port) {
+        int be_port = xen_be_evtchn_bind_interdomain(s->eh, xen_domid,
+                                                     s->guest_port);
+        if (be_port < 0) {
+            return be_port;
+        }
+        s->be_port = be_port;
+    }
+    return 0;
+}
+
+static const VMStateDescription xen_xenstore_vmstate = {
+    .name = "xen_xenstore",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = xen_xenstore_is_needed,
+    .pre_save = xen_xenstore_pre_save,
+    .post_load = xen_xenstore_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(req_data, XenXenstoreState,
+                            sizeof_field(XenXenstoreState, req_data)),
+        VMSTATE_UINT8_ARRAY(rsp_data, XenXenstoreState,
+                            sizeof_field(XenXenstoreState, rsp_data)),
+        VMSTATE_UINT32(req_offset, XenXenstoreState),
+        VMSTATE_UINT32(rsp_offset, XenXenstoreState),
+        VMSTATE_BOOL(rsp_pending, XenXenstoreState),
+        VMSTATE_UINT32(guest_port, XenXenstoreState),
+        VMSTATE_BOOL(fatal_error, XenXenstoreState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void xen_xenstore_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = xen_xenstore_realize;
+    dc->vmsd = &xen_xenstore_vmstate;
+}
+
+static const TypeInfo xen_xenstore_info = {
+    .name          = TYPE_XEN_XENSTORE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XenXenstoreState),
+    .class_init    = xen_xenstore_class_init,
+};
+
+void xen_xenstore_create(void)
+{
+    DeviceState *dev = sysbus_create_simple(TYPE_XEN_XENSTORE, -1, NULL);
+
+    xen_xenstore_singleton = XEN_XENSTORE(dev);
+
+    /*
+     * Defer the init (xen_xenstore_reset()) until KVM is set up and the
+     * overlay page can be mapped.
+     */
+}
+
+static void xen_xenstore_register_types(void)
+{
+    type_register_static(&xen_xenstore_info);
+}
+
+type_init(xen_xenstore_register_types)
+
+uint16_t xen_xenstore_get_port(void)
+{
+    XenXenstoreState *s = xen_xenstore_singleton;
+    if (!s) {
+        return 0;
+    }
+    return s->guest_port;
+}
+
+static void xen_xenstore_event(void *opaque)
+{
+    XenXenstoreState *s = opaque;
+    evtchn_port_t port = xen_be_evtchn_pending(s->eh);
+    if (port != s->be_port) {
+        return;
+    }
+    printf("xenstore event\n");
+    /* We know this is a no-op. */
+    xen_be_evtchn_unmask(s->eh, port);
+    qemu_hexdump(stdout, "", s->xs, sizeof(*s->xs));
+    xen_be_evtchn_notify(s->eh, s->be_port);
+}
+
+static void alloc_guest_port(XenXenstoreState *s)
+{
+    struct evtchn_alloc_unbound alloc = {
+        .dom = DOMID_SELF,
+        .remote_dom = DOMID_QEMU,
+    };
+
+    if (!xen_evtchn_alloc_unbound_op(&alloc)) {
+        s->guest_port = alloc.port;
+    }
+}
+
+int xen_xenstore_reset(void)
+{
+    XenXenstoreState *s = xen_xenstore_singleton;
+    int err;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    s->req_offset = s->rsp_offset = 0;
+    s->rsp_pending = false;
+
+    if (!memory_region_is_mapped(&s->xenstore_page)) {
+        uint64_t gpa = XEN_SPECIAL_PFN(XENSTORE) << TARGET_PAGE_BITS;
+        xen_overlay_do_map_page(&s->xenstore_page, gpa);
+    }
+
+    alloc_guest_port(s);
+
+    /*
+     * As qemu/dom0, bind to the guest's port. For incoming migration, this
+     * will be unbound as the guest's evtchn table is overwritten. We then
+     * rebind to the correct guest port in xen_xenstore_post_load().
+     */
+    err = xen_be_evtchn_bind_interdomain(s->eh, xen_domid, s->guest_port);
+    if (err < 0) {
+        return err;
+    }
+    s->be_port = err;
+
+    return 0;
+}
diff --git a/hw/i386/kvm/xen_xenstore.h b/hw/i386/kvm/xen_xenstore.h
new file mode 100644
index 000000000000..8c3768e075f0
--- /dev/null
+++ b/hw/i386/kvm/xen_xenstore.h
@@ -0,0 +1,20 @@
+/*
+ * QEMU Xen emulation: Xenstore emulation
+ *
+ * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_XEN_XENSTORE_H
+#define QEMU_XEN_XENSTORE_H
+
+void xen_xenstore_create(void);
+int xen_xenstore_reset(void);
+
+uint16_t xen_xenstore_get_port(void);
+
+#endif /* QEMU_XEN_XENSTORE_H */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 1cf112e54227..f4a08cc23f1f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -93,6 +93,7 @@
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
 #include "hw/i386/kvm/xen_gnttab.h"
+#include "hw/i386/kvm/xen_xenstore.h"
 #include "hw/mem/memory-device.h"
 #include "sysemu/replay.h"
 #include "target/i386/cpu.h"
@@ -1862,6 +1863,7 @@ int pc_machine_kvm_type(MachineState *machine, const char *kvm_type)
         xen_overlay_create();
         xen_evtchn_create();
         xen_gnttab_create();
+        xen_xenstore_create();
     }
 #endif
     return 0;
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index d2c88ef0d93f..50965b56f3c9 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -27,6 +27,7 @@
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
 #include "hw/i386/kvm/xen_gnttab.h"
+#include "hw/i386/kvm/xen_xenstore.h"
 
 #include "hw/xen/interface/version.h"
 #include "hw/xen/interface/sched.h"
@@ -179,6 +180,9 @@ int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
         return ret;
     }
 
+    /* The page couldn't be overlaid until KVM was initialized */
+    xen_xenstore_reset();
+
     return 0;
 }
 
@@ -789,6 +793,9 @@ static bool handle_get_param(struct kvm_xen_exit *exit, X86CPU *cpu,
     case HVM_PARAM_STORE_PFN:
         hp.value = XEN_SPECIAL_PFN(XENSTORE);
         break;
+    case HVM_PARAM_STORE_EVTCHN:
+        hp.value = xen_xenstore_get_port();
+        break;
     default:
         return false;
     }
@@ -1383,6 +1390,11 @@ int kvm_xen_soft_reset(void)
         return err;
     }
 
+    err = xen_xenstore_reset();
+    if (err) {
+        return err;
+    }
+
     return 0;
 }
 
-- 
2.39.1


