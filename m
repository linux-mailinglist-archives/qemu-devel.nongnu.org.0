Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7031A6A823E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:32:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi5o-00006I-Sj; Thu, 02 Mar 2023 07:31:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5e-0008Fa-N9
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5c-0002y8-Oz
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WpMS7axuaDOJ8CmMkcoIKvn8UcONkTvOkLwLUqgv3+8=;
 b=OhDcW+n1Nf4r/gkW7sPcWWVbs59+rHaWmaT8zfjeo8TZLQXDW/uDTZ/j5XTRGleaH+9I3j
 vJt4ofgAPzkTzBjpCqzy9aOoGiQsWo3U8W8WU6ZWK0qn29wSGzq8MYsqZ6+a+YMWBAgVIT
 hRNU4AIvwF2wd8lnM8fSDCe8bxvsPk0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-1P5tOAA0MX-7R-x_cgyV8Q-1; Thu, 02 Mar 2023 07:31:14 -0500
X-MC-Unique: 1P5tOAA0MX-7R-x_cgyV8Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 4-20020a05600c024400b003eb2e295c05so5711834wmj.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WpMS7axuaDOJ8CmMkcoIKvn8UcONkTvOkLwLUqgv3+8=;
 b=Z1Jfoi9GvrYt6UAUNXvPtKIvPxRXD60QCy/QeWi+1Owfy9rl7VDxrlfxItKTq+0BWV
 Yxwg+TZ+vXSCE6fi2ezV53trZiKpoatQc7DJp+wwYPpk0b72qmixDI2q8ZfpG+UQEGEr
 rTDIocwK4VtoC0GMbOkXwaFKaAQW81su9xNUNO3kwPSSvTNP19pG/sW+gQBr4n1Xj2kr
 H3HpR2zYJp6un3EBTQbU7TSK45vnslNFDuu+7YuxVcZnpXnrWZ3/T/hqijzCmfX1TX8f
 A4HWNLMj/UD+IBPurWkSN8Vj79JinEHssCa78njGSwGmhnqjQJEe836zE1RsdtU7hDWI
 ZEhA==
X-Gm-Message-State: AO0yUKXAdKpdSlVbRwGNh46y/JuLyHtLs8v40FqFymmqjpgxGCkF0i4k
 fOheK2G8E8+C5YfMFndPNMVgO/ijWqh170g5oEVqsQFan7ejKF1GRRoBU4YDpN5kklOPY1SfmYb
 xdFD6u2970T0b9luwztB6u2m58IpTtIUSrvlBGNZmIvG8xtsqbBSNZdM9h8OBONmPq3jYlxqPPl
 s=
X-Received: by 2002:adf:cd11:0:b0:2ca:e856:59d with SMTP id
 w17-20020adfcd11000000b002cae856059dmr1688427wrm.1.1677760273103; 
 Thu, 02 Mar 2023 04:31:13 -0800 (PST)
X-Google-Smtp-Source: AK7set/PaMlIX5XUrtzDpmo7IiooW7AU3HsJD7v6LOmQ/USyfNVPybuNqSh7zOPgnfGzpUyHtgUEFw==
X-Received: by 2002:adf:cd11:0:b0:2ca:e856:59d with SMTP id
 w17-20020adfcd11000000b002cae856059dmr1688407wrm.1.1677760272719; 
 Thu, 02 Mar 2023 04:31:12 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a5d6a45000000b002c5706f7c6dsm15172587wrw.94.2023.03.02.04.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:12 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 13/62] hw/xen: Add xen_overlay device for emulating shared
 xenheap pages
Date: Thu,  2 Mar 2023 13:29:40 +0100
Message-Id: <20230302123029.153265-14-pbonzini@redhat.com>
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

For the shared info page and for grant tables, Xen shares its own pages
from the "Xen heap" to the guest. The guest requests that a given page
from a certain address space (XENMAPSPACE_shared_info, etc.) be mapped
to a given GPA using the XENMEM_add_to_physmap hypercall.

To support that in qemu when *emulating* Xen, create a memory region
(migratable) and allow it to be mapped as an overlay when requested.

Xen theoretically allows the same page to be mapped multiple times
into the guest, but that's hard to track and reinstate over migration,
so we automatically *unmap* any previous mapping when creating a new
one. This approach has been used in production with.... a non-trivial
number of guests expecting true Xen, without any problems yet being
noticed.

This adds just the shared info page for now. The grant tables will be
a larger region, and will need to be overlaid one page at a time. I
think that means I need to create separate aliases for each page of
the overall grant_frames region, so that they can be mapped individually.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/meson.build   |   1 +
 hw/i386/kvm/xen_overlay.c | 210 ++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_overlay.h |  20 ++++
 include/sysemu/kvm_xen.h  |   7 ++
 4 files changed, 238 insertions(+)
 create mode 100644 hw/i386/kvm/xen_overlay.c
 create mode 100644 hw/i386/kvm/xen_overlay.h

diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
index 95467f1ded6a..6165cbf019d6 100644
--- a/hw/i386/kvm/meson.build
+++ b/hw/i386/kvm/meson.build
@@ -4,5 +4,6 @@ i386_kvm_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c'))
 i386_kvm_ss.add(when: 'CONFIG_I8254', if_true: files('i8254.c'))
 i386_kvm_ss.add(when: 'CONFIG_I8259', if_true: files('i8259.c'))
 i386_kvm_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
+i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files('xen_overlay.c'))
 
 i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
diff --git a/hw/i386/kvm/xen_overlay.c b/hw/i386/kvm/xen_overlay.c
new file mode 100644
index 000000000000..a2441e2b4e4a
--- /dev/null
+++ b/hw/i386/kvm/xen_overlay.c
@@ -0,0 +1,210 @@
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
+#include "qemu/host-utils.h"
+#include "qemu/module.h"
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
+
+#include "sysemu/kvm.h"
+#include "sysemu/kvm_xen.h"
+#include <linux/kvm.h>
+
+#include "hw/xen/interface/memory.h"
+
+
+#define TYPE_XEN_OVERLAY "xen-overlay"
+OBJECT_DECLARE_SIMPLE_TYPE(XenOverlayState, XEN_OVERLAY)
+
+#define XEN_PAGE_SHIFT 12
+#define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
+
+struct XenOverlayState {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+
+    MemoryRegion shinfo_mem;
+    void *shinfo_ptr;
+    uint64_t shinfo_gpa;
+};
+
+struct XenOverlayState *xen_overlay_singleton;
+
+static void xen_overlay_do_map_page(MemoryRegion *page, uint64_t gpa)
+{
+    /*
+     * Xen allows guests to map the same page as many times as it likes
+     * into guest physical frames. We don't, because it would be hard
+     * to track and restore them all. One mapping of each page is
+     * perfectly sufficient for all known guests... and we've tested
+     * that theory on a few now in other implementations. dwmw2.
+     */
+    if (memory_region_is_mapped(page)) {
+        if (gpa == INVALID_GPA) {
+            memory_region_del_subregion(get_system_memory(), page);
+        } else {
+            /* Just move it */
+            memory_region_set_address(page, gpa);
+        }
+    } else if (gpa != INVALID_GPA) {
+        memory_region_add_subregion_overlap(get_system_memory(), gpa, page, 0);
+    }
+}
+
+/* KVM is the only existing back end for now. Let's not overengineer it yet. */
+static int xen_overlay_set_be_shinfo(uint64_t gfn)
+{
+    struct kvm_xen_hvm_attr xa = {
+        .type = KVM_XEN_ATTR_TYPE_SHARED_INFO,
+        .u.shared_info.gfn = gfn,
+    };
+
+    return kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &xa);
+}
+
+
+static void xen_overlay_realize(DeviceState *dev, Error **errp)
+{
+    XenOverlayState *s = XEN_OVERLAY(dev);
+
+    if (xen_mode != XEN_EMULATE) {
+        error_setg(errp, "Xen overlay page support is for Xen emulation");
+        return;
+    }
+
+    memory_region_init_ram(&s->shinfo_mem, OBJECT(dev), "xen:shared_info",
+                           XEN_PAGE_SIZE, &error_abort);
+    memory_region_set_enabled(&s->shinfo_mem, true);
+
+    s->shinfo_ptr = memory_region_get_ram_ptr(&s->shinfo_mem);
+    s->shinfo_gpa = INVALID_GPA;
+    memset(s->shinfo_ptr, 0, XEN_PAGE_SIZE);
+}
+
+static int xen_overlay_post_load(void *opaque, int version_id)
+{
+    XenOverlayState *s = opaque;
+
+    if (s->shinfo_gpa != INVALID_GPA) {
+        xen_overlay_do_map_page(&s->shinfo_mem, s->shinfo_gpa);
+        xen_overlay_set_be_shinfo(s->shinfo_gpa >> XEN_PAGE_SHIFT);
+    }
+
+    return 0;
+}
+
+static bool xen_overlay_is_needed(void *opaque)
+{
+    return xen_mode == XEN_EMULATE;
+}
+
+static const VMStateDescription xen_overlay_vmstate = {
+    .name = "xen_overlay",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = xen_overlay_is_needed,
+    .post_load = xen_overlay_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(shinfo_gpa, XenOverlayState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void xen_overlay_reset(DeviceState *dev)
+{
+    kvm_xen_soft_reset();
+}
+
+static void xen_overlay_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = xen_overlay_reset;
+    dc->realize = xen_overlay_realize;
+    dc->vmsd = &xen_overlay_vmstate;
+}
+
+static const TypeInfo xen_overlay_info = {
+    .name          = TYPE_XEN_OVERLAY,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XenOverlayState),
+    .class_init    = xen_overlay_class_init,
+};
+
+void xen_overlay_create(void)
+{
+    xen_overlay_singleton = XEN_OVERLAY(sysbus_create_simple(TYPE_XEN_OVERLAY,
+                                                             -1, NULL));
+
+    /* If xen_domid wasn't explicitly set, at least make sure it isn't zero. */
+    if (xen_domid == DOMID_QEMU) {
+        xen_domid = 1;
+    };
+}
+
+static void xen_overlay_register_types(void)
+{
+    type_register_static(&xen_overlay_info);
+}
+
+type_init(xen_overlay_register_types)
+
+int xen_overlay_map_shinfo_page(uint64_t gpa)
+{
+    XenOverlayState *s = xen_overlay_singleton;
+    int ret;
+
+    if (!s) {
+        return -ENOENT;
+    }
+
+    assert(qemu_mutex_iothread_locked());
+
+    if (s->shinfo_gpa) {
+        /* If removing shinfo page, turn the kernel magic off first */
+        ret = xen_overlay_set_be_shinfo(INVALID_GFN);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    xen_overlay_do_map_page(&s->shinfo_mem, gpa);
+    if (gpa != INVALID_GPA) {
+        ret = xen_overlay_set_be_shinfo(gpa >> XEN_PAGE_SHIFT);
+        if (ret) {
+            return ret;
+        }
+    }
+    s->shinfo_gpa = gpa;
+
+    return 0;
+}
+
+void *xen_overlay_get_shinfo_ptr(void)
+{
+    XenOverlayState *s = xen_overlay_singleton;
+
+    if (!s) {
+        return NULL;
+    }
+
+    return s->shinfo_ptr;
+}
diff --git a/hw/i386/kvm/xen_overlay.h b/hw/i386/kvm/xen_overlay.h
new file mode 100644
index 000000000000..00cff05bb0fd
--- /dev/null
+++ b/hw/i386/kvm/xen_overlay.h
@@ -0,0 +1,20 @@
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
+#ifndef QEMU_XEN_OVERLAY_H
+#define QEMU_XEN_OVERLAY_H
+
+void xen_overlay_create(void);
+
+int xen_overlay_map_shinfo_page(uint64_t gpa);
+void *xen_overlay_get_shinfo_ptr(void);
+
+#endif /* QEMU_XEN_OVERLAY_H */
diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index 5dffcc054294..cec21c8fab2f 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -12,6 +12,13 @@
 #ifndef QEMU_SYSEMU_KVM_XEN_H
 #define QEMU_SYSEMU_KVM_XEN_H
 
+/* The KVM API uses these to indicate "no GPA" or "no GFN" */
+#define INVALID_GPA UINT64_MAX
+#define INVALID_GFN UINT64_MAX
+
+/* QEMU plays the rôle of dom0 for "interdomain" communication. */
+#define DOMID_QEMU  0
+
 int kvm_xen_soft_reset(void);
 uint32_t kvm_xen_get_caps(void);
 
-- 
2.39.1


