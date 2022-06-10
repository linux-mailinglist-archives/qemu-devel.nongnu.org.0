Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E49545F63
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:39:02 +0200 (CEST)
Received: from localhost ([::1]:50194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzaAV-0000lK-MK
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWw-00081r-JA
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWt-0006HG-T4
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ad/ttkr30vhbvvPoMvjHQNCv9unFN+kAKCHcdVGXlJA=;
 b=P/TtKWuGS1QeCStcEM/HkPlQn5YLCnXIKF4Chb4ZBlYJ5yieKrG0S7UjXWwCDs7cU3sdtK
 TfqhiP0CNZAnl/jp7bS0unVPg3KIMFsSX1zJaVDEWi/zRcDcbMJzQK+DwGVHCYvqcKHXcK
 AOU5O73GCgF4j0ePuMLipsjSKVxO4pM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-iWh4J37ZOtywbxiw59Kbtw-1; Fri, 10 Jun 2022 03:58:02 -0400
X-MC-Unique: iWh4J37ZOtywbxiw59Kbtw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso9328279wma.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ad/ttkr30vhbvvPoMvjHQNCv9unFN+kAKCHcdVGXlJA=;
 b=EJ3zRoS6PBqFVTsBEKyg7eD058hJ9PUV+DIgW6RyEhvr3x+cLdwpMmBR/6oujIM+wO
 3cq7Ifvox5WzEaXPWTYja23uBHX3YKylfgNuqx6B9l7cptkjLFc783I1d/ULEkL4neKn
 1Yqg+W5u4xOr+lrCl5fpUjNa/HK2xIZh2+5Id1U346XRVEt4qeWNgYly8R09Vr1ZRAY8
 Cwk9Qy6EAERkwNWat+yBAF3PaFnco9zIigqSGSdhAvvaMVBnqVmdd1K8PcuAvQwnze1H
 r+6F5YNDJgPMQqUBZ/3RtR915fkG2MEK+Drwr1G9zkVaYg0TmLAugpie1BXOk2reT3MJ
 UYmw==
X-Gm-Message-State: AOAM533/aj2+cUzGBqxWbnqfhJbNB8cXA1KOXcnldNTuybbR+FuIPIIv
 WFtlRL4pl3+bZ8ze2HDVp5yDpK02Xt7GokJNvQBJgyPndnEVqmD5/a+C9VncRjBiOj10S+HpIkv
 WBZqfdlLj9+2aVCMPB4EztUHpRTtx98id0mmV1QDyDKq8gcxC6scraaBOM7L/
X-Received: by 2002:adf:eb91:0:b0:20f:fcc2:475c with SMTP id
 t17-20020adfeb91000000b0020ffcc2475cmr42414708wrn.40.1654847880757; 
 Fri, 10 Jun 2022 00:58:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRGIO0jLskMJl3xzxtNT1KMsmwPlD6gCXNGadEy7jn8Ph2tB65iLVMFTnnCU/533Mi0OAALg==
X-Received: by 2002:adf:eb91:0:b0:20f:fcc2:475c with SMTP id
 t17-20020adfeb91000000b0020ffcc2475cmr42414684wrn.40.1654847880491; 
 Fri, 10 Jun 2022 00:58:00 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 q16-20020adfcd90000000b00213abce60e4sm22640446wrj.111.2022.06.10.00.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:58:00 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 19/54] acpi: pc: isa bridge: use AcpiDevAmlIf interface to
 build ISA device descriptors
Message-ID: <20220610075631.367501-20-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

replaces ad-hoc build_isa_devices_aml() with generic AcpiDevAmlIf
way to build bridge AML including all devices that are attached to
its ISA bus.

Later when PCI is converted to AcpiDevAmlIf, build_piix4_isa_bridge()
will also be dropped since PCI parts itself will take care of
building device prologue/epilogue AML for each enumerated PCI
device.

Expected AML change is contextual, where ISA devices are moved
from separately declared _SB.PCI0.ISA scope , directly under
Device(ISA) node.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-20-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 16 +++++++++++-----
 hw/isa/piix3.c       | 17 +++++++++++++++++
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d943354999..f903f30b7e 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1280,15 +1280,22 @@ static void build_piix4_isa_bridge(Aml *table)
 {
     Aml *dev;
     Aml *scope;
+    Object *obj;
+    bool ambiguous;
+
+    /*
+     * temporarily fish out isa bridge, build_piix4_isa_bridge() will be dropped
+     * once PCI is converted to AcpiDevAmlIf and would be ble to generate
+     * AML for bridge itself
+     */
+    obj = object_resolve_path_type("", TYPE_PIIX3_PCI_DEVICE, &ambiguous);
+    assert(obj && !ambiguous);
 
     scope =  aml_scope("_SB.PCI0");
     dev = aml_device("ISA");
     aml_append(dev, aml_name_decl("_ADR", aml_int(0x00010000)));
 
-    /* PIIX PCI to ISA irq remapping */
-    aml_append(dev, aml_operation_region("P40C", AML_PCI_CONFIG,
-                                         aml_int(0x60), 0x04));
-
+    call_dev_aml_func(DEVICE(obj), dev);
     aml_append(scope, dev);
     aml_append(table, scope);
 }
@@ -1476,7 +1483,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             build_hpet_aml(dsdt);
         }
         build_piix4_isa_bridge(dsdt);
-        build_isa_devices_aml(dsdt);
         if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index dab901c9ad..bfccd666d4 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -32,6 +32,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 #define XEN_PIIX_NUM_PIRQS      128ULL
 
@@ -286,10 +287,24 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
     qemu_register_reset(piix3_reset, d);
 }
 
+static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
+{
+    BusChild *kid;
+    BusState *bus = qdev_get_child_bus(DEVICE(adev), "isa.0");
+
+    /* PIIX PCI to ISA irq remapping */
+    aml_append(scope, aml_operation_region("P40C", AML_PCI_CONFIG,
+                                         aml_int(0x60), 0x04));
+    QTAILQ_FOREACH(kid, &bus->children, sibling) {
+        call_dev_aml_func(DEVICE(kid->child), scope);
+    }
+}
+
 static void pci_piix3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     dc->desc        = "ISA bridge";
     dc->vmsd        = &vmstate_piix3;
@@ -304,6 +319,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
      * pc_piix.c's pc_init1()
      */
     dc->user_creatable = false;
+    adevc->build_dev_aml = build_pci_isa_aml;
 }
 
 static const TypeInfo piix3_pci_type_info = {
@@ -314,6 +330,7 @@ static const TypeInfo piix3_pci_type_info = {
     .class_init = pci_piix3_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { TYPE_ACPI_DEV_AML_IF },
         { },
     },
 };
-- 
MST


