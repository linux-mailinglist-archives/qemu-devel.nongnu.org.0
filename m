Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590F16AFBE4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:14:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiNS-0002u3-AT; Tue, 07 Mar 2023 20:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNP-0002do-OT
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNN-0001yw-BT
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u0abA4a9iIhVvhgBVi0sbRg9TnAU3XPQFF5wCUhX2/0=;
 b=IZiQ6jutwjzIebQ+/xZU4SDOUiRH9CsPoMf9a6UJkkgIg+5kjTfS0RVyVizU4I0tIgEuDU
 WAzl87Qupo0+s+w9Rmkd9RfIvkejjPOErBFHqSH+kA5uKM6Rvig/5BqA1kqzwSzFgECm5i
 43syqZnQG9B/unINtsyglTnxEIRLtL8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-Q-8z0dyXMyGNZ_ZULsj8dg-1; Tue, 07 Mar 2023 20:13:51 -0500
X-MC-Unique: Q-8z0dyXMyGNZ_ZULsj8dg-1
Received: by mail-ed1-f69.google.com with SMTP id
 v11-20020a056402348b00b004ce34232666so18103615edc.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238030;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u0abA4a9iIhVvhgBVi0sbRg9TnAU3XPQFF5wCUhX2/0=;
 b=Cdx5yLKSmcFwnXPJ1L3d0dV+zSrlUS6GwaEU08lQ9okv+sDeDGJMiHCcdTEDI5L2c9
 JltCO5mAl6XQtPFh2f5tKhT4d5AwqZqVZmpIo4btt88RoL6d3WPcLfi2NTdwhDpIBOJf
 JicZ91igl9V1yL2i0YOF/23kiUyXVbZu/Hb1lhFxEvNpdsHDww/AySzYs0Q5UhQ46+8m
 oSxjKvZTp+Z+69IKUHiGeTEtZblsBVlpde0c+f1v251tMZbJ4Hhop75cFUtGWRz6Ttuh
 9XK9q951e1Zp/BM1oYAKFpG07FeTPCUdQ6oSMsj2rEUozkvMZ8LT17oxQxEu5zwwJ/pM
 COJw==
X-Gm-Message-State: AO0yUKU/B3R7+pxAZ8ol4vpk58MIlVkPFdQ53TpdjlcSh7YjlhihvIf6
 JAfCiWaG8AIn8CUpL0oRik8kWNOIWfuU6YOzPQi8GPugaXutcuT63pVcYlTPUPJJjs16olF7jFm
 urLMKbWTm+fu0v60kN2SmkPWYiVz6oHw8gUBr4+wdLO+LK2xV02grX9tM9TvnqpyJ0uD2
X-Received: by 2002:aa7:c657:0:b0:4af:6969:73d4 with SMTP id
 z23-20020aa7c657000000b004af696973d4mr13640638edr.30.1678238029743; 
 Tue, 07 Mar 2023 17:13:49 -0800 (PST)
X-Google-Smtp-Source: AK7set/GurSCSzm0X9i1jzWd79d6QT+164IcXwScX2ttxU+ckh0ujib0muBduombR1oxLBq0Njz6Fw==
X-Received: by 2002:aa7:c657:0:b0:4af:6969:73d4 with SMTP id
 z23-20020aa7c657000000b004af696973d4mr13640623edr.30.1678238029442; 
 Tue, 07 Mar 2023 17:13:49 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 v15-20020a50954f000000b004c09527d62dsm7529450eda.30.2023.03.07.17.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:13:49 -0800 (PST)
Date: Tue, 7 Mar 2023 20:13:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PULL 59/73] pcihp: move fields enabling hotplug into AcpiPciHpState
Message-ID: <6536e427ce490d1d57e9d4369f1765f9f1a85310.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

... instead of duplicating them in piix4 and lpc and then
trying to pass them to pcihp routines as arguments.
it simplifies call sites and places pcihp specific in
its own structure.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-34-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/pcihp.h         |  8 ++++----
 include/hw/acpi/piix4.h         |  2 --
 hw/acpi/acpi-pci-hotplug-stub.c |  5 ++---
 hw/acpi/ich9.c                  | 15 +++++++--------
 hw/acpi/pcihp.c                 | 16 ++++++++--------
 hw/acpi/piix4.c                 | 23 +++++++++++++----------
 6 files changed, 34 insertions(+), 35 deletions(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index cd18ebdcdc..04c98511a4 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -49,14 +49,14 @@ typedef struct AcpiPciHpState {
     uint32_t acpi_index;
     PCIBus *root;
     MemoryRegion io;
-    bool legacy_piix;
     uint16_t io_base;
     uint16_t io_len;
+    bool use_acpi_hotplug_bridge;
+    bool use_acpi_root_pci_hotplug;
 } AcpiPciHpState;
 
 void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
-                     MemoryRegion *address_space_io, bool bridges_enabled,
-                     uint16_t io_base);
+                     MemoryRegion *address_space_io, uint16_t io_base);
 
 void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                    DeviceState *dev, Error **errp);
@@ -69,7 +69,7 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
                                          Error **errp);
 
 /* Called on reset */
-void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off);
+void acpi_pcihp_reset(AcpiPciHpState *s);
 
 void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus);
 
diff --git a/include/hw/acpi/piix4.h b/include/hw/acpi/piix4.h
index be1f8ea80e..eb1c122d80 100644
--- a/include/hw/acpi/piix4.h
+++ b/include/hw/acpi/piix4.h
@@ -57,8 +57,6 @@ struct PIIX4PMState {
     Notifier powerdown_notifier;
 
     AcpiPciHpState acpi_pci_hotplug;
-    bool use_acpi_hotplug_bridge;
-    bool use_acpi_root_pci_hotplug;
     bool not_migrate_acpi_index;
 
     uint8_t disable_s3;
diff --git a/hw/acpi/acpi-pci-hotplug-stub.c b/hw/acpi/acpi-pci-hotplug-stub.c
index a43f6dafc9..d1794399f7 100644
--- a/hw/acpi/acpi-pci-hotplug-stub.c
+++ b/hw/acpi/acpi-pci-hotplug-stub.c
@@ -5,8 +5,7 @@
 const VMStateDescription vmstate_acpi_pcihp_pci_status;
 
 void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
-                     MemoryRegion *address_space_io, bool bridges_enabled,
-                     uint16_t io_base)
+                     MemoryRegion *address_space_io, uint16_t io_base)
 {
     return;
 }
@@ -36,7 +35,7 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
     return;
 }
 
-void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
+void acpi_pcihp_reset(AcpiPciHpState *s)
 {
     return;
 }
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index d23bfcaa6b..f778ade7ea 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -218,7 +218,7 @@ static bool vmstate_test_use_pcihp(void *opaque)
 {
     ICH9LPCPMRegs *s = opaque;
 
-    return s->use_acpi_hotplug_bridge;
+    return s->acpi_pci_hotplug.use_acpi_hotplug_bridge;
 }
 
 static const VMStateDescription vmstate_pcihp_state = {
@@ -277,8 +277,8 @@ static void pm_reset(void *opaque)
     }
     pm->smi_en_wmask = ~0;
 
-    if (pm->use_acpi_hotplug_bridge) {
-        acpi_pcihp_reset(&pm->acpi_pci_hotplug, true);
+    if (pm->acpi_pci_hotplug.use_acpi_hotplug_bridge) {
+        acpi_pcihp_reset(&pm->acpi_pci_hotplug);
     }
 
     acpi_update_sci(&pm->acpi_regs, pm->irq);
@@ -316,12 +316,11 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm, qemu_irq sci_irq)
         acpi_pm_tco_init(&pm->tco_regs, &pm->io);
     }
 
-    if (pm->use_acpi_hotplug_bridge) {
+    if (pm->acpi_pci_hotplug.use_acpi_hotplug_bridge) {
         acpi_pcihp_init(OBJECT(lpc_pci),
                         &pm->acpi_pci_hotplug,
                         pci_get_bus(lpc_pci),
                         pci_address_space_io(lpc_pci),
-                        true,
                         ACPI_PCIHP_ADDR_ICH9);
 
         qbus_set_hotplug_handler(BUS(pci_get_bus(lpc_pci)),
@@ -403,14 +402,14 @@ static bool ich9_pm_get_acpi_pci_hotplug(Object *obj, Error **errp)
 {
     ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
 
-    return s->pm.use_acpi_hotplug_bridge;
+    return s->pm.acpi_pci_hotplug.use_acpi_hotplug_bridge;
 }
 
 static void ich9_pm_set_acpi_pci_hotplug(Object *obj, bool value, Error **errp)
 {
     ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
 
-    s->pm.use_acpi_hotplug_bridge = value;
+    s->pm.acpi_pci_hotplug.use_acpi_hotplug_bridge = value;
 }
 
 static bool ich9_pm_get_keep_pci_slot_hpc(Object *obj, Error **errp)
@@ -435,7 +434,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     pm->disable_s3 = 0;
     pm->disable_s4 = 0;
     pm->s4_val = 2;
-    pm->use_acpi_hotplug_bridge = true;
+    pm->acpi_pci_hotplug.use_acpi_hotplug_bridge = true;
     pm->keep_pci_slot_hpc = true;
     pm->enable_tco = true;
 
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index adf45e8443..34cad061a8 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -276,12 +276,12 @@ static void acpi_pcihp_update(AcpiPciHpState *s)
     }
 }
 
-void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
+void acpi_pcihp_reset(AcpiPciHpState *s)
 {
-    if (acpihp_root_off) {
+    if (!s->use_acpi_root_pci_hotplug) {
         acpi_pcihp_disable_root_bus();
     }
-    acpi_set_pci_info(!s->legacy_piix);
+    acpi_set_pci_info(s->use_acpi_hotplug_bridge);
     acpi_pcihp_update(s);
 }
 
@@ -316,7 +316,7 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
          * Overwrite the default hotplug handler with the ACPI PCI one
          * for cold plugged bridges only.
          */
-        if (!s->legacy_piix &&
+        if (s->use_acpi_hotplug_bridge &&
             object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
             PCIBus *sec = pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
 
@@ -398,7 +398,7 @@ static uint64_t pci_read(void *opaque, hwaddr addr, unsigned int size)
     switch (addr) {
     case PCI_UP_BASE:
         val = s->acpi_pcihp_pci_status[bsel].up;
-        if (!s->legacy_piix) {
+        if (s->use_acpi_hotplug_bridge) {
             s->acpi_pcihp_pci_status[bsel].up = 0;
         }
         trace_acpi_pci_up_read(val);
@@ -473,7 +473,8 @@ static void pci_write(void *opaque, hwaddr addr, uint64_t data,
         trace_acpi_pci_ej_write(addr, data);
         break;
     case PCI_SEL_BASE:
-        s->hotplug_select = s->legacy_piix ? ACPI_PCIHP_BSEL_DEFAULT : data;
+        s->hotplug_select = s->use_acpi_hotplug_bridge ? data :
+            ACPI_PCIHP_BSEL_DEFAULT;
         trace_acpi_pci_sel_write(addr, data);
     default:
         break;
@@ -491,14 +492,13 @@ static const MemoryRegionOps acpi_pcihp_io_ops = {
 };
 
 void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
-                     MemoryRegion *address_space_io, bool bridges_enabled,
+                     MemoryRegion *address_space_io,
                      uint16_t io_base)
 {
     s->io_len = ACPI_PCIHP_SIZE;
     s->io_base = io_base;
 
     s->root = root_bus;
-    s->legacy_piix = !bridges_enabled;
 
     memory_region_init_io(&s->io, owner, &acpi_pcihp_io_ops, s,
                           "acpi-pci-hotplug", s->io_len);
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 8fc422829a..0a233fa95d 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -170,14 +170,14 @@ static const VMStateDescription vmstate_pci_status = {
 static bool vmstate_test_use_acpi_hotplug_bridge(void *opaque, int version_id)
 {
     PIIX4PMState *s = opaque;
-    return s->use_acpi_hotplug_bridge;
+    return s->acpi_pci_hotplug.use_acpi_hotplug_bridge;
 }
 
 static bool vmstate_test_no_use_acpi_hotplug_bridge(void *opaque,
                                                     int version_id)
 {
     PIIX4PMState *s = opaque;
-    return !s->use_acpi_hotplug_bridge;
+    return !s->acpi_pci_hotplug.use_acpi_hotplug_bridge;
 }
 
 static bool vmstate_test_use_memhp(void *opaque)
@@ -234,7 +234,8 @@ static bool piix4_vmstate_need_smbus(void *opaque, int version_id)
 static bool vmstate_test_migrate_acpi_index(void *opaque, int version_id)
 {
     PIIX4PMState *s = PIIX4_PM(opaque);
-    return s->use_acpi_hotplug_bridge && !s->not_migrate_acpi_index;
+    return s->acpi_pci_hotplug.use_acpi_hotplug_bridge &&
+           !s->not_migrate_acpi_index;
 }
 
 /* qemu-kvm 1.2 uses version 3 but advertised as 2
@@ -303,8 +304,9 @@ static void piix4_pm_reset(DeviceState *dev)
     acpi_update_sci(&s->ar, s->irq);
 
     pm_io_space_update(s);
-    if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
-        acpi_pcihp_reset(&s->acpi_pci_hotplug, !s->use_acpi_root_pci_hotplug);
+    if (s->acpi_pci_hotplug.use_acpi_hotplug_bridge ||
+        s->acpi_pci_hotplug.use_acpi_root_pci_hotplug) {
+        acpi_pcihp_reset(&s->acpi_pci_hotplug);
     }
 }
 
@@ -487,7 +489,7 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
     qemu_add_machine_init_done_notifier(&s->machine_ready);
 
     if (xen_enabled()) {
-        s->use_acpi_hotplug_bridge = false;
+        s->acpi_pci_hotplug.use_acpi_hotplug_bridge = false;
     }
 
     piix4_acpi_system_hot_add_init(pci_address_space_io(dev),
@@ -560,9 +562,10 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
                           "acpi-gpe0", GPE_LEN);
     memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe);
 
-    if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
+    if (s->acpi_pci_hotplug.use_acpi_hotplug_bridge ||
+        s->acpi_pci_hotplug.use_acpi_root_pci_hotplug) {
         acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
-                        s->use_acpi_hotplug_bridge, ACPI_PCIHP_ADDR_PIIX4);
+                        ACPI_PCIHP_ADDR_PIIX4);
         qbus_set_hotplug_handler(BUS(pci_get_bus(PCI_DEVICE(s))), OBJECT(s));
     }
 
@@ -602,9 +605,9 @@ static Property piix4_pm_properties[] = {
     DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_DISABLED, PIIX4PMState, disable_s4, 0),
     DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_VAL, PIIX4PMState, s4_val, 2),
     DEFINE_PROP_BOOL(ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, PIIX4PMState,
-                     use_acpi_hotplug_bridge, true),
+                     acpi_pci_hotplug.use_acpi_hotplug_bridge, true),
     DEFINE_PROP_BOOL(ACPI_PM_PROP_ACPI_PCI_ROOTHP, PIIX4PMState,
-                     use_acpi_root_pci_hotplug, true),
+                     acpi_pci_hotplug.use_acpi_root_pci_hotplug, true),
     DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
                      acpi_memory_hotplug.is_enabled, true),
     DEFINE_PROP_BOOL("smm-compat", PIIX4PMState, smm_compat, false),
-- 
MST


