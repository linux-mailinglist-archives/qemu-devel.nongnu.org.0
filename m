Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF6C6AC218
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:02:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBQ6-00016K-FR; Mon, 06 Mar 2023 09:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4224746ab=anthony.perard@citrix.com>)
 id 1pZBPj-0000wa-PI
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:02:14 -0500
Received: from esa1.hc3370-68.iphmx.com ([216.71.145.142])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4224746ab=anthony.perard@citrix.com>)
 id 1pZBPf-0006b6-K3
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:02:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1678111323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+RkltQVQaAlX61CZ7K+kv5+XfVyi0StV55f/sdDEHwc=;
 b=WaljSph3QFXQBHMD9Z8kk68St168r/6rnuPnlRzeBIHAw/YnSSHPw9Ak
 41+OhHPIWdAVaR7SFP/Pd5nh5stLSXDbo1905iBwes7WbDPJd3YMBijHz
 XtK7q2bR1CT1KZDMCRDmdb7VyYb57jOcxfYQlNwrfz4oivHRVKpgE/9da Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100081127
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:vs3r1KAqDaC7yxVW/1Ljw5YqxClBgxIJ4kV8jS/XYbTApD0igT0Hm
 mobUGnXPv/eMGvxf4t0bYuzoEIEsZeHyN9iQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhA4ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw6+MqLGRR0
 vMkIykBMBWaq+6d+oOBY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4TSHZUMxxzHz
 o7A12TACDY1c9aG8D6Iql2An8/e2irHAp1HQdVU8dY12QbOlwT/EiY+TFa+vLy1h1CzX/pZL
 Eob/DdoqrI9nGShVNL9Qha7slaNuRpaUN1Ve9DW8ynUlPCSuVzAQDFZEHgYModOWNIKqSICx
 1rUstb2IjNTu6SZF3eE2ru/lwKIEH1ARYMdXhMsQQwA6tjlhYg8iBPTU9pueJKIYs3J9SLYm
 G7T8nVn71kHpYtSjvjgowib6965jsKRJjPZ8Dk7SY5MAulRQIe+L7Kl5lHAhRqrBNbIFwLR1
 JTodiX30QzvMX1vvHbSKAnuNOvzjxpgDNE7qQ8HInXZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSX1PfcrOtjsVph3kcAM8OgJsdiOM7JzjmVZLlfbrEmCm2bLt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLqxQ1iNcWKtQF7TqLH/jTlk33uYdykVbJEd/pxnPSNLFmhE5FyS2Jm
 +ti2zyikk0DAbCgO3SGqeb+7zkidBAGOHw/kOQPHsbrH+asMD9+YxMN6dvNo7BYopk=
IronPort-HdrOrdr: A9a23:uWpyYK6GtcoK0bkCxAPXwMzXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NyZLWrbUQWTXeVfxLqn7zr8GzDvss5xvJ
 0QFJSW0eeAb2SSW/yKhTWFLw==
X-IronPort-AV: E=Sophos;i="5.98,238,1673931600"; d="scan'208";a="100081127"
To: <qemu-devel@nongnu.org>
CC: Chuck Zmudzinski <brchuckz@aol.com>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: [PULL 1/2] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Date: Mon, 6 Mar 2023 14:00:43 +0000
Message-ID: <20230306140044.44076-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230306140044.44076-1-anthony.perard@citrix.com>
References: <20230306140044.44076-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.145.142;
 envelope-from=prvs=4224746ab=anthony.perard@citrix.com;
 helo=esa1.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Chuck Zmudzinski <brchuckz@aol.com>

Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
as noted in docs/igd-assign.txt in the Qemu source code.

Currently, when the xl toolstack is used to configure a Xen HVM guest with
Intel IGD passthrough to the guest with the Qemu upstream device model,
a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
a different slot. This problem often prevents the guest from booting.

The only available workarounds are not good: Configure Xen HVM guests to
use the old and no longer maintained Qemu traditional device model
available from xenbits.xen.org which does reserve slot 2 for the Intel
IGD or use the "pc" machine type instead of the "xenfv" machine type and
add the xen platform device at slot 3 using a command line option
instead of patching qemu to fix the "xenfv" machine type directly. The
second workaround causes some degredation in startup performance such as
a longer boot time and reduced resolution of the grub menu that is
displayed on the monitor. This patch avoids that reduced startup
performance when using the Qemu upstream device model for Xen HVM guests
configured with the igd-passthru=on option.

To implement this feature in the Qemu upstream device model for Xen HVM
guests, introduce the following new functions, types, and macros:

* XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
* XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
* typedef XenPTQdevRealize function pointer
* XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
* xen_igd_reserve_slot and xen_igd_clear_slot functions

Michael Tsirkin:
* Introduce XEN_PCI_IGD_DOMAIN, XEN_PCI_IGD_BUS, XEN_PCI_IGD_DEV, and
  XEN_PCI_IGD_FN - use them to compute the value of XEN_PCI_IGD_SLOT_MASK

The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
the xl toolstack with the gfx_passthru option enabled, which sets the
igd-passthru=on option to Qemu for the Xen HVM machine type.

The new xen_igd_reserve_slot function also needs to be implemented in
hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
in which case it does nothing.

The new xen_igd_clear_slot function overrides qdev->realize of the parent
PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
created in hw/i386/pc_piix.c for the case when igd-passthru=on.

Move the call to xen_host_pci_device_get, and the associated error
handling, from xen_pt_realize to the new xen_igd_clear_slot function to
initialize the device class and vendor values which enables the checks for
the Intel IGD to succeed. The verification that the host device is an
Intel IGD to be passed through is done by checking the domain, bus, slot,
and function values as well as by checking that gfx_passthru is enabled,
the device class is VGA, and the device vendor in Intel.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <b1b4a21fe9a600b1322742dda55a40e9961daa57.1674346505.git.brchuckz@aol.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/i386/pc_piix.c    |  1 +
 hw/xen/xen_pt.c      | 64 ++++++++++++++++++++++++++++++++++++--------
 hw/xen/xen_pt.h      | 20 ++++++++++++++
 hw/xen/xen_pt_stub.c |  4 +++
 4 files changed, 78 insertions(+), 11 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 2f16011bab..4bf15f9c1f 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -422,6 +422,7 @@ static void pc_xen_hvm_init(MachineState *machine)
     }
 
     pc_xen_hvm_init_pci(machine);
+    xen_igd_reserve_slot(pcms->bus);
     pci_create_simple(pcms->bus, -1, "xen-platform");
 }
 #endif
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 8db0532632..85c93cffcf 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -57,6 +57,7 @@
 #include <sys/ioctl.h>
 
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/xen/xen.h"
@@ -780,15 +781,6 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
                s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
                s->dev.devfn);
 
-    xen_host_pci_device_get(&s->real_device,
-                            s->hostaddr.domain, s->hostaddr.bus,
-                            s->hostaddr.slot, s->hostaddr.function,
-                            errp);
-    if (*errp) {
-        error_append_hint(errp, "Failed to \"open\" the real pci device");
-        return;
-    }
-
     s->is_virtfn = s->real_device.is_virtfn;
     if (s->is_virtfn) {
         XEN_PT_LOG(d, "%04x:%02x:%02x.%d is a SR-IOV Virtual Function\n",
@@ -803,8 +795,10 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
     s->io_listener = xen_pt_io_listener;
 
     /* Setup VGA bios for passthrough GFX */
-    if ((s->real_device.domain == 0) && (s->real_device.bus == 0) &&
-        (s->real_device.dev == 2) && (s->real_device.func == 0)) {
+    if ((s->real_device.domain == XEN_PCI_IGD_DOMAIN) &&
+        (s->real_device.bus == XEN_PCI_IGD_BUS) &&
+        (s->real_device.dev == XEN_PCI_IGD_DEV) &&
+        (s->real_device.func == XEN_PCI_IGD_FN)) {
         if (!is_igd_vga_passthrough(&s->real_device)) {
             error_setg(errp, "Need to enable igd-passthru if you're trying"
                     " to passthrough IGD GFX");
@@ -950,11 +944,58 @@ static void xen_pci_passthrough_instance_init(Object *obj)
     PCI_DEVICE(obj)->cap_present |= QEMU_PCI_CAP_EXPRESS;
 }
 
+void xen_igd_reserve_slot(PCIBus *pci_bus)
+{
+    if (!xen_igd_gfx_pt_enabled()) {
+        return;
+    }
+
+    XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
+    pci_bus->slot_reserved_mask |= XEN_PCI_IGD_SLOT_MASK;
+}
+
+static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
+{
+    ERRP_GUARD();
+    PCIDevice *pci_dev = (PCIDevice *)qdev;
+    XenPCIPassthroughState *s = XEN_PT_DEVICE(pci_dev);
+    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_GET_CLASS(s);
+    PCIBus *pci_bus = pci_get_bus(pci_dev);
+
+    xen_host_pci_device_get(&s->real_device,
+                            s->hostaddr.domain, s->hostaddr.bus,
+                            s->hostaddr.slot, s->hostaddr.function,
+                            errp);
+    if (*errp) {
+        error_append_hint(errp, "Failed to \"open\" the real pci device");
+        return;
+    }
+
+    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK)) {
+        xpdc->pci_qdev_realize(qdev, errp);
+        return;
+    }
+
+    if (is_igd_vga_passthrough(&s->real_device) &&
+        s->real_device.domain == XEN_PCI_IGD_DOMAIN &&
+        s->real_device.bus == XEN_PCI_IGD_BUS &&
+        s->real_device.dev == XEN_PCI_IGD_DEV &&
+        s->real_device.func == XEN_PCI_IGD_FN &&
+        s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
+        pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK;
+        XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
+    }
+    xpdc->pci_qdev_realize(qdev, errp);
+}
+
 static void xen_pci_passthrough_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
+    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_CLASS(klass);
+    xpdc->pci_qdev_realize = dc->realize;
+    dc->realize = xen_igd_clear_slot;
     k->realize = xen_pt_realize;
     k->exit = xen_pt_unregister_device;
     k->config_read = xen_pt_pci_read_config;
@@ -977,6 +1018,7 @@ static const TypeInfo xen_pci_passthrough_info = {
     .instance_size = sizeof(XenPCIPassthroughState),
     .instance_finalize = xen_pci_passthrough_finalize,
     .class_init = xen_pci_passthrough_class_init,
+    .class_size = sizeof(XenPTDeviceClass),
     .instance_init = xen_pci_passthrough_instance_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index cf10fc7bbf..e184699740 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -40,7 +40,20 @@ typedef struct XenPTReg XenPTReg;
 #define TYPE_XEN_PT_DEVICE "xen-pci-passthrough"
 OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
 
+#define XEN_PT_DEVICE_CLASS(klass) \
+    OBJECT_CLASS_CHECK(XenPTDeviceClass, klass, TYPE_XEN_PT_DEVICE)
+#define XEN_PT_DEVICE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(XenPTDeviceClass, obj, TYPE_XEN_PT_DEVICE)
+
+typedef void (*XenPTQdevRealize)(DeviceState *qdev, Error **errp);
+
+typedef struct XenPTDeviceClass {
+    PCIDeviceClass parent_class;
+    XenPTQdevRealize pci_qdev_realize;
+} XenPTDeviceClass;
+
 uint32_t igd_read_opregion(XenPCIPassthroughState *s);
+void xen_igd_reserve_slot(PCIBus *pci_bus);
 void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
 void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
                                            XenHostPCIDevice *dev);
@@ -75,6 +88,13 @@ typedef int (*xen_pt_conf_byte_read)
 
 #define XEN_PCI_INTEL_OPREGION 0xfc
 
+#define XEN_PCI_IGD_DOMAIN 0
+#define XEN_PCI_IGD_BUS 0
+#define XEN_PCI_IGD_DEV 2
+#define XEN_PCI_IGD_FN 0
+#define XEN_PCI_IGD_SLOT_MASK \
+    (1UL << PCI_SLOT(PCI_DEVFN(XEN_PCI_IGD_DEV, XEN_PCI_IGD_FN)))
+
 typedef enum {
     XEN_PT_GRP_TYPE_HARDWIRED = 0,  /* 0 Hardwired reg group */
     XEN_PT_GRP_TYPE_EMU,            /* emul reg group */
diff --git a/hw/xen/xen_pt_stub.c b/hw/xen/xen_pt_stub.c
index 2d8cac8d54..5c108446a8 100644
--- a/hw/xen/xen_pt_stub.c
+++ b/hw/xen/xen_pt_stub.c
@@ -20,3 +20,7 @@ void xen_igd_gfx_pt_set(bool value, Error **errp)
         error_setg(errp, "Xen PCI passthrough support not built in");
     }
 }
+
+void xen_igd_reserve_slot(PCIBus *pci_bus)
+{
+}
-- 
Anthony PERARD


