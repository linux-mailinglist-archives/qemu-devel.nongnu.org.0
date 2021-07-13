Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 147AC3C7994
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:23:22 +0200 (CEST)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3QoD-0007l8-03
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Qbc-0006Wv-AJ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:10:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QbY-0007ZU-CZ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:10:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9QZG8Wl50+7PmAQdBrLDebzFMtsRxXny/OdYWszhAo8=;
 b=HeQbU+wE/JirbLzGFkAwKzyPDd8QZtqMzoeueWjks1LJa6uNXSs9x+SlhcHK8yfcx+D7P+
 Ejb8LaB/VrAYZUzaJnbXRroLg0n6SfdUnnEFvvfNpcY4BwZweZJaT3xq3fz9nwoBhB/Wer
 Q15mGeuHXhcHIF4lKgzyRb966zaRm9A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-iAqPiY9sOJmY0CucJwAofQ-1; Tue, 13 Jul 2021 18:10:14 -0400
X-MC-Unique: iAqPiY9sOJmY0CucJwAofQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 p4-20020a5d63840000b0290126f2836a61so336708wru.6
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9QZG8Wl50+7PmAQdBrLDebzFMtsRxXny/OdYWszhAo8=;
 b=rIawBh+G0cYp38mE97HDTrJAmpE1IVNAZoU1c9s8n2Q6fVB4aSaWio54jFYcZJ86wO
 5z/r8ZKZB5FusePzvNF5lONe9SLBHT/h/ljge3/4Nbkq6FOIjVzrGFQdTrGcya/wCnBs
 n3GHWXHlRveboS0neyJ0JFwzHr6yK10VGK5SOP9111NwsiL+BEip+mSpLRoU6L4cX4Ev
 0gWC8UJI1BKFHcV/4D6pyclUcagnkSizTNxQl+4P/PrnIRYVRtncikFB0YH4yYFCNCU3
 7waH40iv8IwSdvD1nzurHjI7tynpE69wqn0FAwzWyA265E5vlim5I3pYX3/lH+Ruy+I/
 RMJg==
X-Gm-Message-State: AOAM530NurFgRjiyF8VlB5b2GQYiPY3905dL4wSMelcvfrgi97vQXVpy
 pUA1Un9Me/u2umKJwt8XFLPxQ0ajwDHw54urnYm2HB61p76jYO5SBMQxWuCwFLaVQNYmvlSyDH2
 sklmmSX9DP7sF9eO4Jar2FB2SvB0lIWL2BB/4h9RYOTDnp8xPJy2jKncnpPvE
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr7469400wmk.146.1626214212936; 
 Tue, 13 Jul 2021 15:10:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJbrOA9QleCXnGTEWrmJxNkuE1hEkUsbVvMfIOq8KpSxySyEVFjSeD1LH9Dx3BpmMjATySUg==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr7469356wmk.146.1626214212563; 
 Tue, 13 Jul 2021 15:10:12 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id r17sm3475523wmq.13.2021.07.13.15.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:10:12 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:10:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/23] hw/acpi/ich9: Enable ACPI PCI hot-plug
Message-ID: <20210713220946.212562-3-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Julia Suvorova <jusual@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Julia Suvorova <jusual@redhat.com>

Add acpi_pcihp to ich9_pm as part of
'acpi-pci-hotplug-with-bridge-support' option. Set default to false.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210713004205.775386-3-jusual@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/i386/acpi-build.h    |  1 +
 include/hw/acpi/ich9.h  |  3 ++
 hw/acpi/acpi-x86-stub.c |  6 ++++
 hw/acpi/ich9.c          | 70 +++++++++++++++++++++++++++++++++++++++++
 hw/acpi/pcihp.c         | 12 +++++--
 hw/i386/acpi-build.c    | 14 ++++++---
 6 files changed, 100 insertions(+), 6 deletions(-)

diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
index 487ec7710f..0dce155c8c 100644
--- a/hw/i386/acpi-build.h
+++ b/hw/i386/acpi-build.h
@@ -10,5 +10,6 @@ extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
 #define ACPI_PCIHP_BNMR_BASE 0x10
 
 void acpi_setup(void);
+Object *acpi_get_i386_pci_host(void);
 
 #endif
diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index 596120d97f..a329ce43ab 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -24,6 +24,7 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/cpu_hotplug.h"
 #include "hw/acpi/cpu.h"
+#include "hw/acpi/pcihp.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/acpi/tco.h"
@@ -55,6 +56,8 @@ typedef struct ICH9LPCPMRegs {
     AcpiCpuHotplug gpe_cpu;
     CPUHotplugState cpuhp_state;
 
+    bool use_acpi_hotplug_bridge;
+    AcpiPciHpState acpi_pci_hotplug;
     MemHotplugState acpi_memory_hotplug;
 
     uint8_t disable_s3;
diff --git a/hw/acpi/acpi-x86-stub.c b/hw/acpi/acpi-x86-stub.c
index f88d6a090b..e9e46c5c5f 100644
--- a/hw/acpi/acpi-x86-stub.c
+++ b/hw/acpi/acpi-x86-stub.c
@@ -1,7 +1,13 @@
 #include "qemu/osdep.h"
 #include "hw/i386/pc.h"
+#include "hw/i386/acpi-build.h"
 
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
                        const CPUArchIdList *apic_ids, GArray *entry)
 {
 }
+
+Object *acpi_get_i386_pci_host(void)
+{
+       return NULL;
+}
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 4daa79ec8d..2f4eb453ac 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -217,6 +217,26 @@ static const VMStateDescription vmstate_cpuhp_state = {
     }
 };
 
+static bool vmstate_test_use_pcihp(void *opaque)
+{
+    ICH9LPCPMRegs *s = opaque;
+
+    return s->use_acpi_hotplug_bridge;
+}
+
+static const VMStateDescription vmstate_pcihp_state = {
+    .name = "ich9_pm/pcihp",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = vmstate_test_use_pcihp,
+    .fields      = (VMStateField[]) {
+        VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug,
+                            ICH9LPCPMRegs,
+                            NULL, NULL),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_ich9_pm = {
     .name = "ich9_pm",
     .version_id = 1,
@@ -238,6 +258,7 @@ const VMStateDescription vmstate_ich9_pm = {
         &vmstate_memhp_state,
         &vmstate_tco_io_state,
         &vmstate_cpuhp_state,
+        &vmstate_pcihp_state,
         NULL
     }
 };
@@ -259,6 +280,10 @@ static void pm_reset(void *opaque)
     }
     pm->smi_en_wmask = ~0;
 
+    if (pm->use_acpi_hotplug_bridge) {
+        acpi_pcihp_reset(&pm->acpi_pci_hotplug, true);
+    }
+
     acpi_update_sci(&pm->acpi_regs, pm->irq);
 }
 
@@ -297,6 +322,18 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
     pm->enable_tco = true;
     acpi_pm_tco_init(&pm->tco_regs, &pm->io);
 
+    if (pm->use_acpi_hotplug_bridge) {
+        acpi_pcihp_init(OBJECT(lpc_pci),
+                        &pm->acpi_pci_hotplug,
+                        pci_get_bus(lpc_pci),
+                        pci_address_space_io(lpc_pci),
+                        true,
+                        ACPI_PCIHP_ADDR_ICH9);
+
+        qbus_set_hotplug_handler(BUS(pci_get_bus(lpc_pci)),
+                                 OBJECT(lpc_pci));
+    }
+
     pm->irq = sci_irq;
     qemu_register_reset(pm_reset, pm);
     pm->powerdown_notifier.notify = pm_powerdown_req;
@@ -368,6 +405,20 @@ static void ich9_pm_set_enable_tco(Object *obj, bool value, Error **errp)
     s->pm.enable_tco = value;
 }
 
+static bool ich9_pm_get_acpi_pci_hotplug(Object *obj, Error **errp)
+{
+    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
+
+    return s->pm.use_acpi_hotplug_bridge;
+}
+
+static void ich9_pm_set_acpi_pci_hotplug(Object *obj, bool value, Error **errp)
+{
+    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
+
+    s->pm.use_acpi_hotplug_bridge = value;
+}
+
 void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
 {
     static const uint32_t gpe0_len = ICH9_PMIO_GPE0_LEN;
@@ -376,6 +427,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     pm->disable_s3 = 0;
     pm->disable_s4 = 0;
     pm->s4_val = 2;
+    pm->use_acpi_hotplug_bridge = false;
 
     object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
                                    &pm->pm_io_base, OBJ_PROP_FLAG_READ);
@@ -399,6 +451,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     object_property_add_bool(obj, ACPI_PM_PROP_TCO_ENABLED,
                              ich9_pm_get_enable_tco,
                              ich9_pm_set_enable_tco);
+    object_property_add_bool(obj, "acpi-pci-hotplug-with-bridge-support",
+                             ich9_pm_get_acpi_pci_hotplug,
+                             ich9_pm_set_acpi_pci_hotplug);
 }
 
 void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
@@ -406,6 +461,11 @@ void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
 {
     ICH9LPCState *lpc = ICH9_LPC_DEVICE(hotplug_dev);
 
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_pre_plug_cb(hotplug_dev, dev, errp);
+        return;
+    }
+
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
         !lpc->pm.acpi_memory_hotplug.is_enabled) {
         error_setg(errp,
@@ -441,6 +501,9 @@ void ich9_pm_device_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
         } else {
             acpi_cpu_plug_cb(hotplug_dev, &lpc->pm.cpuhp_state, dev, errp);
         }
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_plug_cb(hotplug_dev, &lpc->pm.acpi_pci_hotplug,
+                                  dev, errp);
     } else {
         error_setg(errp, "acpi: device plug request for not supported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -473,6 +536,10 @@ void ich9_pm_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 
         acpi_cpu_unplug_request_cb(hotplug_dev, &lpc->pm.cpuhp_state,
                                    dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_unplug_request_cb(hotplug_dev,
+                                            &lpc->pm.acpi_pci_hotplug,
+                                            dev, errp);
     } else {
         error_setg(errp, "acpi: device unplug request for not supported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -490,6 +557,9 @@ void ich9_pm_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU) &&
                !lpc->pm.cpu_hotplug_legacy) {
         acpi_cpu_unplug_cb(&lpc->pm.cpuhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_unplug_cb(hotplug_dev, &lpc->pm.acpi_pci_hotplug,
+                                    dev, errp);
     } else {
         error_setg(errp, "acpi: device unplug for not supported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index d98a284b7a..9fdc6342b0 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -30,6 +30,8 @@
 #include "hw/pci-host/i440fx.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
+#include "hw/pci/pci_host.h"
+#include "hw/i386/acpi-build.h"
 #include "hw/acpi/acpi.h"
 #include "hw/pci/pci_bus.h"
 #include "migration/vmstate.h"
@@ -103,6 +105,7 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
 static void acpi_set_pci_info(void)
 {
     static bool bsel_is_set;
+    Object *host = acpi_get_i386_pci_host();
     PCIBus *bus;
     unsigned bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT;
 
@@ -111,7 +114,11 @@ static void acpi_set_pci_info(void)
     }
     bsel_is_set = true;
 
-    bus = find_i440fx(); /* TODO: Q35 support */
+    if (!host) {
+        return;
+    }
+
+    bus = PCI_HOST_BRIDGE(host)->bus;
     if (bus) {
         /* Scan all PCI buses. Set property to enable acpi based hotplug. */
         pci_for_each_bus_depth_first(bus, acpi_set_bsel, NULL, &bsel_alloc);
@@ -121,13 +128,14 @@ static void acpi_set_pci_info(void)
 static void acpi_pcihp_disable_root_bus(void)
 {
     static bool root_hp_disabled;
+    Object *host = acpi_get_i386_pci_host();
     PCIBus *bus;
 
     if (root_hp_disabled) {
         return;
     }
 
-    bus = find_i440fx();
+    bus = PCI_HOST_BRIDGE(host)->bus;
     if (bus) {
         /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
         qbus_set_hotplug_handler(BUS(bus), NULL);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index e1c246d6e8..bc966a4110 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -299,7 +299,7 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
  * Because of the PXB hosts we cannot simply query TYPE_PCI_HOST_BRIDGE.
  * On i386 arch we only have two pci hosts, so we can look only for them.
  */
-static Object *acpi_get_i386_pci_host(void)
+Object *acpi_get_i386_pci_host(void)
 {
     PCIHostState *host;
 
@@ -320,7 +320,10 @@ static void acpi_get_pci_holes(Range *hole, Range *hole64)
     Object *pci_host;
 
     pci_host = acpi_get_i386_pci_host();
-    g_assert(pci_host);
+
+    if (!pci_host) {
+        return;
+    }
 
     range_set_bounds1(hole,
                       object_property_get_uint(pci_host,
@@ -1765,6 +1768,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         PCIBus *bus = NULL;
 
         pci_host = acpi_get_i386_pci_host();
+
         if (pci_host) {
             bus = PCI_HOST_BRIDGE(pci_host)->bus;
         }
@@ -2321,7 +2325,9 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
     QObject *o;
 
     pci_host = acpi_get_i386_pci_host();
-    g_assert(pci_host);
+    if (!pci_host) {
+        return false;
+    }
 
     o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_BASE, NULL);
     if (!o) {
@@ -2351,7 +2357,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     AcpiPmInfo pm;
     AcpiMiscInfo misc;
     AcpiMcfgInfo mcfg;
-    Range pci_hole, pci_hole64;
+    Range pci_hole = {}, pci_hole64 = {};
     uint8_t *u;
     size_t aml_len = 0;
     GArray *tables_blob = tables->table_data;
-- 
MST


