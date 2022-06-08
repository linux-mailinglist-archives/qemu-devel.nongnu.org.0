Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AD454322C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:05:11 +0200 (CEST)
Received: from localhost ([::1]:36190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywJ4-0007UN-L4
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8D-0001J9-QR
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8B-0004ME-TI
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OuwtbFTOdOvzd84hsP3hI1Uey/BdnTsltd8kmMeBHjk=;
 b=VSBi0uem2k5pgrAJDXygUEuSCxC+cUwkGFsVU4+0l5Dj5VdX2Azdjjq4nkj4QyJ8Qj1bmW
 FFjcmE1G825JKiI+WbhaFnra9Gc86WZzTK9Mz8GzOml8CHXw5XpSdcccHCU9m65o4lyZsg
 02/cAbPf8wJrodZNu+uRwzTBNgfM+Kw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-PbghpG6kNqm1BjgCHiKj0A-1; Wed, 08 Jun 2022 09:53:54 -0400
X-MC-Unique: PbghpG6kNqm1BjgCHiKj0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE28B80B90D
 for <qemu-devel@nongnu.org>; Wed,  8 Jun 2022 13:53:53 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AC59C28117;
 Wed,  8 Jun 2022 13:53:53 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 13/35] ipmi: acpi: use relative path to resource source
Date: Wed,  8 Jun 2022 09:53:18 -0400
Message-Id: <20220608135340.3304695-14-imammedo@redhat.com>
In-Reply-To: <20220608135340.3304695-1-imammedo@redhat.com>
References: <20220608135340.3304695-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

smbus-ipmi AML description needs to specify a path to its parent
node in _CRS. The rest of IPMI inplementations (ISA based)
do not need path at all. Instead of passing through a full path
use relative path to point to smbus-ipmi's parent node, it will
let follow up patches to create IPMI device AML in a generic
way instead of current ad-hoc way. (i.e. AML will be generated
the same way it's done for other ISA device, and smbus will be
converted to generate AML for its slave devices the same way
as ISA)

expected AML change:
     Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
     {
        I2cSerialBusV2 (0x0000, ControllerInitiated, 0x000186A0,
-           AddressingMode7Bit, "\\_SB.PCI0.SMB0",
+           AddressingMode7Bit, "^",
            0x00, ResourceProducer, , Exclusive,
            )
      })

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/acpi/ipmi.h |  2 +-
 hw/acpi/ipmi-stub.c    |  2 +-
 hw/acpi/ipmi.c         | 12 ++++++------
 hw/i386/acpi-build.c   |  4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/hw/acpi/ipmi.h b/include/hw/acpi/ipmi.h
index c14ad682ac..c38483565c 100644
--- a/include/hw/acpi/ipmi.h
+++ b/include/hw/acpi/ipmi.h
@@ -16,6 +16,6 @@
  * bus matches the given bus.  The resource is the ACPI resource that
  * contains the IPMI device, this is required for the I2C CRS.
  */
-void build_acpi_ipmi_devices(Aml *table, BusState *bus, const char *resource);
+void build_acpi_ipmi_devices(Aml *table, BusState *bus);
 
 #endif /* HW_ACPI_IPMI_H */
diff --git a/hw/acpi/ipmi-stub.c b/hw/acpi/ipmi-stub.c
index 8634fb325c..f525f71c2d 100644
--- a/hw/acpi/ipmi-stub.c
+++ b/hw/acpi/ipmi-stub.c
@@ -10,6 +10,6 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/ipmi.h"
 
-void build_acpi_ipmi_devices(Aml *table, BusState *bus, const char *resource)
+void build_acpi_ipmi_devices(Aml *table, BusState *bus)
 {
 }
diff --git a/hw/acpi/ipmi.c b/hw/acpi/ipmi.c
index 96e48eba15..c30b44fcf5 100644
--- a/hw/acpi/ipmi.c
+++ b/hw/acpi/ipmi.c
@@ -13,7 +13,7 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ipmi.h"
 
-static Aml *aml_ipmi_crs(IPMIFwInfo *info, const char *resource)
+static Aml *aml_ipmi_crs(IPMIFwInfo *info)
 {
     Aml *crs = aml_resource_template();
 
@@ -49,7 +49,7 @@ static Aml *aml_ipmi_crs(IPMIFwInfo *info, const char *resource)
         break;
     case IPMI_MEMSPACE_SMBUS:
         aml_append(crs, aml_i2c_serial_bus_device(info->base_address,
-                                                  resource));
+                                                  "^"));
         break;
     default:
         abort();
@@ -62,7 +62,7 @@ static Aml *aml_ipmi_crs(IPMIFwInfo *info, const char *resource)
     return crs;
 }
 
-static Aml *aml_ipmi_device(IPMIFwInfo *info, const char *resource)
+static Aml *aml_ipmi_device(IPMIFwInfo *info)
 {
     Aml *dev;
     uint16_t version = ((info->ipmi_spec_major_revision << 8)
@@ -75,14 +75,14 @@ static Aml *aml_ipmi_device(IPMIFwInfo *info, const char *resource)
     aml_append(dev, aml_name_decl("_STR", aml_string("ipmi_%s",
                                                      info->interface_name)));
     aml_append(dev, aml_name_decl("_UID", aml_int(info->uuid)));
-    aml_append(dev, aml_name_decl("_CRS", aml_ipmi_crs(info, resource)));
+    aml_append(dev, aml_name_decl("_CRS", aml_ipmi_crs(info)));
     aml_append(dev, aml_name_decl("_IFT", aml_int(info->interface_type)));
     aml_append(dev, aml_name_decl("_SRV", aml_int(version)));
 
     return dev;
 }
 
-void build_acpi_ipmi_devices(Aml *scope, BusState *bus, const char *resource)
+void build_acpi_ipmi_devices(Aml *scope, BusState *bus)
 {
 
     BusChild *kid;
@@ -102,6 +102,6 @@ void build_acpi_ipmi_devices(Aml *scope, BusState *bus, const char *resource)
         iic = IPMI_INTERFACE_GET_CLASS(obj);
         memset(&info, 0, sizeof(info));
         iic->get_fwinfo(ii, &info);
-        aml_append(scope, aml_ipmi_device(&info, resource));
+        aml_append(scope, aml_ipmi_device(&info));
     }
 }
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 1449832aa9..88506d563f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -873,7 +873,7 @@ static void build_isa_devices_aml(Aml *table)
     assert(obj && !ambiguous);
 
     scope = aml_scope("_SB.PCI0.ISA");
-    build_acpi_ipmi_devices(scope, BUS(obj), "\\_SB.PCI0.ISA");
+    build_acpi_ipmi_devices(scope, BUS(obj));
     isa_build_aml(ISA_BUS(obj), scope);
 
     aml_append(table, scope);
@@ -1406,7 +1406,7 @@ static void build_smb0(Aml *table, I2CBus *smbus, int devnr, int func)
     Aml *dev = aml_device("SMB0");
 
     aml_append(dev, aml_name_decl("_ADR", aml_int(devnr << 16 | func)));
-    build_acpi_ipmi_devices(dev, BUS(smbus), "\\_SB.PCI0.SMB0");
+    build_acpi_ipmi_devices(dev, BUS(smbus));
     aml_append(scope, dev);
     aml_append(table, scope);
 }
-- 
2.31.1


