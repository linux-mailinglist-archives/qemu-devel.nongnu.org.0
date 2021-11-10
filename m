Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8A244BB45
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 06:35:44 +0100 (CET)
Received: from localhost ([::1]:55836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkgGt-0007e5-RX
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 00:35:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1mkgD0-0002fA-3C
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:31:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1mkgCx-000577-7E
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:31:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636522297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XV019e6g7BT4wVaTPJF1vBDJmHNVtIgSBzGtSNrD/8g=;
 b=DZKPSzK7zW57XmXRE+zQO2vmrz4tBzAhFWTRWkj5/xdHZrwcUQedbYgj3OXk6rBdZJ8Ayz
 GPXUXLeahipcvz3leS271ukvJBy8Y/xo5XxsiiFvWMCP7r5Z5vitXgIbMxOuods8i+jIrd
 cMdHCUQ+MUbVta5H8+6n0/Yv+fSEgjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-PXJ8SH5INoe8auf3qFx8fg-1; Wed, 10 Nov 2021 00:31:34 -0500
X-MC-Unique: PXJ8SH5INoe8auf3qFx8fg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 409B41006AA0;
 Wed, 10 Nov 2021 05:31:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABBB65D9CA;
 Wed, 10 Nov 2021 05:31:21 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] hw/pci/pcie_port: Rename 'native-hotplug' to
 'native-hpc-bit'
Date: Wed, 10 Nov 2021 06:30:10 +0100
Message-Id: <20211110053014.489591-2-jusual@redhat.com>
In-Reply-To: <20211110053014.489591-1-jusual@redhat.com>
References: <20211110053014.489591-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jusual@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename the option to better represent its function - toggle Hot-Plug
Capable bit in the PCIe Slot Capability.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 include/hw/pci/pcie_port.h         | 2 +-
 hw/i386/pc_q35.c                   | 2 +-
 hw/pci-bridge/gen_pcie_root_port.c | 6 +++++-
 hw/pci/pcie.c                      | 2 +-
 hw/pci/pcie_port.c                 | 2 +-
 5 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
index e25b289ce8..0da6d66c95 100644
--- a/include/hw/pci/pcie_port.h
+++ b/include/hw/pci/pcie_port.h
@@ -60,7 +60,7 @@ struct PCIESlot {
     /* Indicates whether any type of hot-plug is allowed on the slot */
     bool        hotplug;
 
-    bool        native_hotplug;
+    bool        native_hpc_bit;
 
     QLIST_ENTRY(PCIESlot) next;
 };
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 797e09500b..ded61f8ef7 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -243,7 +243,7 @@ static void pc_q35_init(MachineState *machine)
                                           NULL);
 
     if (acpi_pcihp) {
-        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hotplug",
+        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hpc-bit",
                                    "false", true);
     }
 
diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pcie_root_port.c
index 20099a8ae3..ed079d72b3 100644
--- a/hw/pci-bridge/gen_pcie_root_port.c
+++ b/hw/pci-bridge/gen_pcie_root_port.c
@@ -87,7 +87,11 @@ static void gen_rp_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (grp->res_reserve.io == -1 && s->hotplug && !s->native_hotplug) {
+    /*
+     * Make sure that IO is assigned in case the slot is hot-pluggable
+     * but it is not visible through the PCIe Slot Capabilities
+     */
+    if (grp->res_reserve.io == -1 && s->hotplug && !s->native_hpc_bit) {
         grp->res_reserve.io = GEN_PCIE_ROOT_DEFAULT_IO_RANGE;
     }
     int rc = pci_bridge_qemu_reserve_cap_init(d, 0,
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 914a9bf3d1..ebe002831e 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -535,7 +535,7 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
      * hot-plug is disabled on the slot.
      */
     if (s->hotplug &&
-        (s->native_hotplug || DEVICE(dev)->hotplugged)) {
+        (s->native_hpc_bit || DEVICE(dev)->hotplugged)) {
         pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCAP,
                                    PCI_EXP_SLTCAP_HPS |
                                    PCI_EXP_SLTCAP_HPC);
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index da850e8dde..eae06d10e2 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -148,7 +148,7 @@ static Property pcie_slot_props[] = {
     DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
     DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
     DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
-    DEFINE_PROP_BOOL("native-hotplug", PCIESlot, native_hotplug, true),
+    DEFINE_PROP_BOOL("native-hpc-bit", PCIESlot, native_hpc_bit, true),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.31.1


