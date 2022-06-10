Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D28C545F18
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:31:28 +0200 (CEST)
Received: from localhost ([::1]:39650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nza3B-0001lu-Pe
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWz-0008Ch-Kj
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWx-0006Ha-RN
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HPYlZOhqsatfUI8giIrHn+a9jLbBfO9Bc7trMdQLAzE=;
 b=bdkSbobxX8MkUyl3le1wQKsuv3grGgtm+iFzGkUkN+1bCNpRlUiGON1+8jkE3fV2kB02Qu
 Efewkd+3OLJiaWZioNxfZ8vle6yLTSX0oFZksu6JOhq7FGzsBJiw2rbrIQVLLcKrjybxiK
 OLCdHd/s2R+S+qMzUSIfAozwr9rE/QM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-1bgbhPsjNUSDEzf9NZInGA-1; Fri, 10 Jun 2022 03:58:05 -0400
X-MC-Unique: 1bgbhPsjNUSDEzf9NZInGA-1
Received: by mail-wr1-f71.google.com with SMTP id
 bv8-20020a0560001f0800b002183c5d5c26so3827885wrb.20
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HPYlZOhqsatfUI8giIrHn+a9jLbBfO9Bc7trMdQLAzE=;
 b=eQAEzJGDKw1/SmhWSi8BwOz1mEjwKsfaRCxARsy886xmP5ltEn44AA+fjDYauYjxWO
 CKokJVpafeCSm+3t4N/jRiXhiE4h1aKrt7P40EKFTjHy9SlqeFQk3WHBrjUDA/sS2MU/
 i3My64CxxxBvm8eBoTFwzxlWm/ifQFLpJ2efmElmdfd3J2/v2ELsUE1XXjQie+3GCsh4
 ZXCquAZfJUdASrMV2fYgKMSgeebcCJZFXgEnnG5E4PaUB86VrXrbYB7zgxSuu8khjfdn
 e13Sz6eZ3M7SaQf1X7oavf1XCbgdvzE/21m2sgyotOI1hVychvyS/cVhGoG4/JTrnqzV
 grWQ==
X-Gm-Message-State: AOAM533b5W32lmok57sO1mdpUfSOcQogGAYP9GdQ77iM49h6Tfq/K3Z6
 5JA/qgJ0wKLCF2x38We/ENvKtxh/pL6yQvlJ/J1JRLylgxEbubTLyqaPYdZjOs0TkXQDct6xEq4
 bcr8dLvYRdWccB7UvU3CckVJoXsfNUJ4ZAWnRdNf5E+D/zSIn0TqzlO1iCYSw
X-Received: by 2002:a5d:678d:0:b0:210:2f33:4399 with SMTP id
 v13-20020a5d678d000000b002102f334399mr42133036wru.599.1654847883977; 
 Fri, 10 Jun 2022 00:58:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHnYBPJB8zzhKrrdb+QkIJl/yhqq5hivcp/MqmCjmX4D2veOFd3G8Y9W5iz3AMjYsNkOhHYg==
X-Received: by 2002:a5d:678d:0:b0:210:2f33:4399 with SMTP id
 v13-20020a5d678d000000b002102f334399mr42133002wru.599.1654847883597; 
 Fri, 10 Jun 2022 00:58:03 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 2-20020a05600c228200b0039482d95ab7sm1992724wmf.24.2022.06.10.00.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:58:03 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:58:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 20/54] acpi: q35: isa bridge: use AcpiDevAmlIf interface to
 build ISA device descriptors
Message-ID: <20220610075631.367501-21-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

replaces adhoc build_isa_devices_aml() with generic AcpiDevAmlIf
way to build bridge AML including all devices that are attached
to its ISA bus.

Later when PCI is converted to AcpiDevAmlIf, build_q35_isa_bridge()
will also be dropped since PCI parts itself will take care of
building device prologue/epilogue AML for each enumerated PCI device.

Expected AML change is contextual, where ISA devices are moved from
separately declared _SB.PCI0.ISA scope, directly under Device(ISA)
node.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-21-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 30 +++++++++++-------------------
 hw/isa/lpc_ich9.c    | 19 +++++++++++++++++++
 2 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f903f30b7e..f7f1671407 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -864,20 +864,6 @@ static Aml *build_vmbus_device_aml(VMBusBridge *vmbus_bridge)
     return dev;
 }
 
-static void build_isa_devices_aml(Aml *table)
-{
-    bool ambiguous;
-    Object *obj = object_resolve_path_type("", TYPE_ISA_BUS, &ambiguous);
-    Aml *scope;
-
-    assert(obj && !ambiguous);
-
-    scope = aml_scope("_SB.PCI0.ISA");
-    isa_build_aml(ISA_BUS(obj), scope);
-
-    aml_append(table, scope);
-}
-
 static void build_dbg_aml(Aml *table)
 {
     Aml *field;
@@ -1263,15 +1249,22 @@ static void build_q35_isa_bridge(Aml *table)
 {
     Aml *dev;
     Aml *scope;
+    Object *obj;
+    bool ambiguous;
+
+    /*
+     * temporarily fish out isa bridge, build_q35_isa_bridge() will be dropped
+     * once PCI is converted to AcpiDevAmlIf and would be ble to generate
+     * AML for bridge itself
+     */
+    obj = object_resolve_path_type("", TYPE_ICH9_LPC_DEVICE, &ambiguous);
+    assert(obj && !ambiguous);
 
     scope =  aml_scope("_SB.PCI0");
     dev = aml_device("ISA");
     aml_append(dev, aml_name_decl("_ADR", aml_int(0x001F0000)));
 
-    /* ICH9 PCI to ISA irq remapping */
-    aml_append(dev, aml_operation_region("PIRQ", AML_PCI_CONFIG,
-                                         aml_int(0x60), 0x0C));
-
+    call_dev_aml_func(DEVICE(obj), dev);
     aml_append(scope, dev);
     aml_append(table, scope);
 }
@@ -1531,7 +1524,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             build_hpet_aml(dsdt);
         }
         build_q35_isa_bridge(dsdt);
-        build_isa_devices_aml(dsdt);
         if (pm->pcihp_bridge_en) {
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 5f143dca17..4553b5925b 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -50,6 +50,7 @@
 #include "hw/core/cpu.h"
 #include "hw/nvram/fw_cfg.h"
 #include "qemu/cutils.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 /*****************************************************************************/
 /* ICH9 LPC PCI to ISA bridge */
@@ -803,12 +804,28 @@ static void ich9_send_gpe(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
     acpi_send_gpe_event(&s->pm.acpi_regs, s->pm.irq, ev);
 }
 
+static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
+{
+    BusChild *kid;
+    ICH9LPCState *s = ICH9_LPC_DEVICE(adev);
+    BusState *bus = BUS(s->isa_bus);
+
+    /* ICH9 PCI to ISA irq remapping */
+    aml_append(scope, aml_operation_region("PIRQ", AML_PCI_CONFIG,
+                                           aml_int(0x60), 0x0C));
+
+    QTAILQ_FOREACH(kid, &bus->children, sibling) {
+            call_dev_aml_func(DEVICE(kid->child), scope);
+    }
+}
+
 static void ich9_lpc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(klass);
     AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_CLASS(klass);
+    AcpiDevAmlIfClass *amldevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->reset = ich9_lpc_reset;
@@ -833,6 +850,7 @@ static void ich9_lpc_class_init(ObjectClass *klass, void *data)
     adevc->ospm_status = ich9_pm_ospm_status;
     adevc->send_event = ich9_send_gpe;
     adevc->madt_cpu = pc_madt_cpu_entry;
+    amldevc->build_dev_aml = build_ich9_isa_aml;
 }
 
 static const TypeInfo ich9_lpc_info = {
@@ -845,6 +863,7 @@ static const TypeInfo ich9_lpc_info = {
         { TYPE_HOTPLUG_HANDLER },
         { TYPE_ACPI_DEVICE_IF },
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { TYPE_ACPI_DEV_AML_IF },
         { }
     }
 };
-- 
MST


