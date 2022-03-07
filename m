Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B320B4CFA77
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:19:55 +0100 (CET)
Received: from localhost ([::1]:36734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAT4-0004qh-Ox
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:19:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACq-0002Em-T1
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACp-0002pj-0j
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SQth6lOfktpVOUsr0klqFIRbAjmvm/XtYoxQErUCb0c=;
 b=Y+SaMaQ73BBmlbDFTPDu/KbVyB4g1rf0L2L3MR6zj/MEDpAmy0DPeoF8EjHqG3tNQ1AYMa
 Q+oDiPSMufSRTO2/jLN/wPc0WBA6AUaI4orlH1Y/yRplrhEOZpJD6AruTmO9DckyGNE9/C
 W8wwONLkfLPX2WBePyQMR6SxWWrTGiU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-cL6cKT9POPyQDvcS4ir0sA-1; Mon, 07 Mar 2022 05:03:05 -0500
X-MC-Unique: cL6cKT9POPyQDvcS4ir0sA-1
Received: by mail-ej1-f71.google.com with SMTP id
 hr26-20020a1709073f9a00b006d6d1ee8cf8so6681968ejc.19
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:03:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SQth6lOfktpVOUsr0klqFIRbAjmvm/XtYoxQErUCb0c=;
 b=Bu+wuekUvE2g7358Q0JD246nrCX0RQAVqutG47z8dfeySNPGn8bBOCveHtuCk3pabV
 ML7Isu1yETIyGEEsS9N5i0zZnLWfL6eiG0IjhFF8vk6O07vU93mfDA7YeQaPPaeuuDMT
 xCfM8kBMEGdCZiCMjaf2d4rIurr2Skgfj14zm2jta5KO4pJgEg3N9RAFfEdoLz1uvz+q
 gbmmVpMMrgHMnO7c76DziDMqU0hZOLgHwBc0qMVh5ymJ9yb/ck5CWoxHc2TY4OYiVLzO
 1Rvznk+J5sS/3czaB3KUQhZhfC7LdemnGTYJncjSFHZV/cFemY+uo4sK4EpoXS39ZMfg
 H7uQ==
X-Gm-Message-State: AOAM532/xCK4t2p9HklPU40ELGPSoRug2oHtZ117OyjYUmnxea95BAdG
 Os/3iZyZsnLgc3iL8ESh9XQAVq7Je3/Baal316yPdbaB9VMT/vCaLyc640zxESAe4eY+1byw0FP
 xlnz1PY+jFGFuULgRz11VQwXU0S34JUSVqXDNazKTLijfjDwv5GiByPpH7Qhy
X-Received: by 2002:a05:6402:3492:b0:416:3846:c1a6 with SMTP id
 v18-20020a056402349200b004163846c1a6mr5757352edc.221.1646647383755; 
 Mon, 07 Mar 2022 02:03:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIqQtGtxhhhdxKQ4W/Ft95AY9Rvdx1+Ykt+n/Y6gK23xVt6kBnijwljb6XcaB9LX+QQC3xgg==
X-Received: by 2002:a05:6402:3492:b0:416:3846:c1a6 with SMTP id
 v18-20020a056402349200b004163846c1a6mr5757329edc.221.1646647383437; 
 Mon, 07 Mar 2022 02:03:03 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 z2-20020a05640235c200b00415cec386a5sm6099651edc.16.2022.03.07.02.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:03:03 -0800 (PST)
Date: Mon, 7 Mar 2022 05:03:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 34/47] acpi: pcihp: pcie: set power on cap on parent slot
Message-ID: <20220307100058.449628-35-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

on creation a PCIDevice has power turned on at the end of pci_qdev_realize()
however later on if PCIe slot isn't populated with any children
it's power is turned off. It's fine if native hotplug is used
as plug callback will power slot on among other things.
However when ACPI hotplug is enabled it replaces native PCIe plug
callbacks with ACPI specific ones (acpi_pcihp_device_*plug_cb) and
as result slot stays powered off. It works fine as ACPI hotplug
on guest side takes care of enumerating/initializing hotplugged
device. But when later guest is migrated, call chain introduced by]
commit d5daff7d312 (pcie: implement slot power control for pcie root ports)

   pcie_cap_slot_post_load()
       -> pcie_cap_update_power()
           -> pcie_set_power_device()
               -> pci_set_power()
                   -> pci_update_mappings()

will disable earlier initialized BARs for the hotplugged device
in powered off slot due to commit 23786d13441 (pci: implement power state)
which disables BARs if power is off.

Fix it by setting PCI_EXP_SLTCTL_PCC to PCI_EXP_SLTCTL_PWR_ON
on slot (root port/downstream port) at the time a device
hotplugged into it. As result PCI_EXP_SLTCTL_PWR_ON is migrated
to target and above call chain keeps device plugged into it
powered on.

Fixes: d5daff7d312 ("pcie: implement slot power control for pcie root ports")
Fixes: 23786d13441 ("pci: implement power state")
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2053584
Suggested-by: "Michael S. Tsirkin" <mst@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220301151200.3507298-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pcie.h |  1 +
 hw/acpi/pcihp.c       | 12 +++++++++++-
 hw/pci/pcie.c         | 11 +++++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 168950a83b..798a262a0a 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -118,6 +118,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
                                 uint32_t addr, uint32_t val, int len);
 int pcie_cap_slot_post_load(void *opaque, int version_id);
 void pcie_cap_slot_push_attention_button(PCIDevice *dev);
+void pcie_cap_slot_enable_power(PCIDevice *dev);
 
 void pcie_cap_root_init(PCIDevice *dev);
 void pcie_cap_root_reset(PCIDevice *dev);
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 6befd23e16..6351bd3424 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -32,6 +32,7 @@
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_host.h"
 #include "hw/pci/pcie_port.h"
+#include "hw/pci-bridge/xio3130_downstream.h"
 #include "hw/i386/acpi-build.h"
 #include "hw/acpi/acpi.h"
 #include "hw/pci/pci_bus.h"
@@ -336,6 +337,8 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
 {
     PCIDevice *pdev = PCI_DEVICE(dev);
     int slot = PCI_SLOT(pdev->devfn);
+    PCIDevice *bridge;
+    PCIBus *bus;
     int bsel;
 
     /* Don't send event when device is enabled during qemu machine creation:
@@ -365,7 +368,14 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
         return;
     }
 
-    bsel = acpi_pcihp_get_bsel(pci_get_bus(pdev));
+    bus = pci_get_bus(pdev);
+    bridge = pci_bridge_get_device(bus);
+    if (object_dynamic_cast(OBJECT(bridge), TYPE_PCIE_ROOT_PORT) ||
+        object_dynamic_cast(OBJECT(bridge), TYPE_XIO3130_DOWNSTREAM)) {
+        pcie_cap_slot_enable_power(bridge);
+    }
+
+    bsel = acpi_pcihp_get_bsel(bus);
     g_assert(bsel >= 0);
     s->acpi_pcihp_pci_status[bsel].up |= (1U << slot);
     acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 3c44204cf3..67a5d67372 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -366,6 +366,17 @@ static void hotplug_event_clear(PCIDevice *dev)
     }
 }
 
+void pcie_cap_slot_enable_power(PCIDevice *dev)
+{
+    uint8_t *exp_cap = dev->config + dev->exp.exp_cap;
+    uint32_t sltcap = pci_get_long(exp_cap + PCI_EXP_SLTCAP);
+
+    if (sltcap & PCI_EXP_SLTCAP_PCP) {
+        pci_set_word_by_mask(exp_cap + PCI_EXP_SLTCTL,
+                             PCI_EXP_SLTCTL_PCC, PCI_EXP_SLTCTL_PWR_ON);
+    }
+}
+
 static void pcie_set_power_device(PCIBus *bus, PCIDevice *dev, void *opaque)
 {
     bool *power = opaque;
-- 
MST


