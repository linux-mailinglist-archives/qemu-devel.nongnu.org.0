Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5534766744F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:05:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBM-0002Gn-5q; Thu, 12 Jan 2023 09:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB9-000275-NL
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB2-0005tJ-Tc
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uWmUch0RpAK468vAHU3M2aMsKzVZnTBevu4b1+SMQFw=;
 b=jMPsrNQMrgz6ZJO9FaBVjrxDzpajaeIktFesB3/uO3IYjDJ2RvkIsdsWQNH18X/3kvwlvg
 OmZRs3o3rl5PBWbcBFg8N+Wvun6ccgzH/mX1VQi140dddw4uK83qD+GA/fZ6y3ktpY//Cu
 NOQC9S90lVYvMxmLrDCSjRh9mw4WhM8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-0pSCWcibO6SeBj-OlPebaQ-1; Thu, 12 Jan 2023 09:03:22 -0500
X-MC-Unique: 0pSCWcibO6SeBj-OlPebaQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF06588B7B1;
 Thu, 12 Jan 2023 14:03:21 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A8E94085720;
 Thu, 12 Jan 2023 14:03:21 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 09/40] pci: acpi hotplug: rename x-native-hotplug to
 x-do-not-expose-native-hotplug-cap
Date: Thu, 12 Jan 2023 15:02:41 +0100
Message-Id: <20230112140312.3096331-10-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

When ACPI PCI hotplug for Q35 was introduced (6.1), it was implemented
by hiding HPC capability on PCIE slot. That however led to a number of
regressions and to fix it, it was decided to keep HPC cap exposed
in ACPI PCI hotplug case and force guest in ACPI PCI hotplug mode
by other means [1].

That reduced meaning of x-native-hotplug to a compat knob [2] for
broken 6.1 machine type.
Rename property to match its current purpose.

1) 211afe5c69 (hw/i386/acpi-build: Deny control on PCIe Native Hot-plug in _OSC)
2) c318bef762 (hw/acpi/ich9: Add compat prop to keep HPC bit set for 6.1 machine type)

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/pci/pcie_port.h         | 3 ++-
 hw/i386/pc_q35.c                   | 5 +++--
 hw/pci-bridge/gen_pcie_root_port.c | 7 ++++++-
 hw/pci/pcie.c                      | 6 +++---
 hw/pci/pcie_port.c                 | 3 ++-
 5 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
index fd484afb30..6c40e3733f 100644
--- a/include/hw/pci/pcie_port.h
+++ b/include/hw/pci/pcie_port.h
@@ -63,7 +63,8 @@ struct PCIESlot {
     /* Indicates whether any type of hot-plug is allowed on the slot */
     bool        hotplug;
 
-    bool        native_hotplug;
+    /* broken ACPI hotplug compat knob to preserve 6.1 ABI intact */
+    bool        hide_native_hotplug_cap;
 
     QLIST_ENTRY(PCIESlot) next;
 };
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 67ceb04bcc..f6b9688964 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -256,8 +256,9 @@ static void pc_q35_init(MachineState *machine)
                                                  NULL);
 
     if (!keep_pci_slot_hpc && acpi_pcihp) {
-        object_register_sugar_prop(TYPE_PCIE_SLOT, "x-native-hotplug",
-                                   "false", true);
+        object_register_sugar_prop(TYPE_PCIE_SLOT,
+                                   "x-do-not-expose-native-hotplug-cap",
+                                   "true", true);
     }
 
     /* irq lines */
diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pcie_root_port.c
index 20099a8ae3..1ce4e7beba 100644
--- a/hw/pci-bridge/gen_pcie_root_port.c
+++ b/hw/pci-bridge/gen_pcie_root_port.c
@@ -87,7 +87,12 @@ static void gen_rp_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (grp->res_reserve.io == -1 && s->hotplug && !s->native_hotplug) {
+    /*
+     * reserving IO space led to worse issues in 6.1, when this hunk was
+     * introduced. (see commit: 211afe5c69b59). Keep this broken for 6.1
+     * machine type ABI compatibility only
+     */
+    if (s->hide_native_hotplug_cap && grp->res_reserve.io == -1 && s->hotplug) {
         grp->res_reserve.io = GEN_PCIE_ROOT_DEFAULT_IO_RANGE;
     }
     int rc = pci_bridge_qemu_reserve_cap_init(d, 0,
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 68a62da0b5..924fdabd15 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -611,11 +611,11 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
                                PCI_EXP_SLTCAP_ABP);
 
     /*
-     * Enable native hot-plug on all hot-plugged bridges unless
-     * hot-plug is disabled on the slot.
+     * Expose native hot-plug on all bridges if hot-plug is enabled on the slot.
+     * (unless broken 6.1 ABI is enforced for compat reasons)
      */
     if (s->hotplug &&
-        (s->native_hotplug || DEVICE(dev)->hotplugged)) {
+        (!s->hide_native_hotplug_cap || DEVICE(dev)->hotplugged)) {
         pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCAP,
                                    PCI_EXP_SLTCAP_HPS |
                                    PCI_EXP_SLTCAP_HPC);
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index 687e4e763a..65a397ad23 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -173,7 +173,8 @@ static Property pcie_slot_props[] = {
     DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
     DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
     DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
-    DEFINE_PROP_BOOL("x-native-hotplug", PCIESlot, native_hotplug, true),
+    DEFINE_PROP_BOOL("x-do-not-expose-native-hotplug-cap", PCIESlot,
+                     hide_native_hotplug_cap, false),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.31.1


