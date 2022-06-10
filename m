Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E0C545F6D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:39:54 +0200 (CEST)
Received: from localhost ([::1]:50936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzaBO-0001G8-0j
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXD-0000NN-9H
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXB-0006Ix-AR
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TOvkDkiafeYSAXY0KZc9ourX4zMJEzIbZqDfZoh54AA=;
 b=hV5oqcH1UhbiChQnvFN5DIxqb7Jmjl+YQI6PjIVp9ckcaGpyykJLbNlZBUol3TBL6kdH9a
 AOR8TOIQiShQGygXxh0DfPlUn/3JQgVNAsiXZihv6vMIACGVC+hK6sbQVglNLatz5YyeT7
 A3qE5w9C19w9hqFK/sI/NjR1o+VGp78=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-dtlkOJAwOfCKMjzDXO1ldA-1; Fri, 10 Jun 2022 03:58:18 -0400
X-MC-Unique: dtlkOJAwOfCKMjzDXO1ldA-1
Received: by mail-wr1-f69.google.com with SMTP id
 r13-20020adff10d000000b002160e9d64f8so4473903wro.0
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TOvkDkiafeYSAXY0KZc9ourX4zMJEzIbZqDfZoh54AA=;
 b=gtf/QRR82YthttgZe6PD3CbFHfvtPP9mkThu5lifJhMWnEpwO+y5cFRvkUjCrHn7uD
 FDLBWRO5rpYDcTHsIm8NHS+9jmiFI24qkJjVJkFCgZG48wpsL465yZhA9oct1SHHNWEw
 FvXdE8/43MLdXP5CfzwTkOMbn3YHN5g0hIh7OVj05+HgaUlXliKMcXJiblDxt1SqSoBW
 ysfXAFIrFV/f0sJgM10mKrUgYe4tLeOM0YypraqiLn4jhY1LKG++X/Q1P1n2RjsQgDPn
 3vneu9Pjq2fCOm5aNQmZUCS7+90MK1voWuOYRWssTcSvM1XnCZpZkmq6SAHEJlDyF2O9
 baOQ==
X-Gm-Message-State: AOAM532vfHc0ePcxZsE1Z44pJlf9r4foDWEEUpT+J604S/h6fLnZlao7
 qtYwhhq4GT4908WQDv/4NOtfqYdu09G6Z+pealoWzPQYsBI5aPU5KaURViqE5yCA8hrVZD4I0ux
 Fqr/K9bG6z+CpoMxkXRsQ3LNeq40SC+i0PoPk1sQlvUgCY4rxa/3O88vuaT6o
X-Received: by 2002:a1c:a301:0:b0:392:9bc5:203c with SMTP id
 m1-20020a1ca301000000b003929bc5203cmr7426284wme.67.1654847896445; 
 Fri, 10 Jun 2022 00:58:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwle9W/hD7egAoyjxgjJUj8mhEVM0RSvjL9UDUBmWBpKHlYx95+BmqFY038KhVnromkLjjMrA==
X-Received: by 2002:a1c:a301:0:b0:392:9bc5:203c with SMTP id
 m1-20020a1ca301000000b003929bc5203cmr7426241wme.67.1654847896074; 
 Fri, 10 Jun 2022 00:58:16 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 n39-20020a05600c3ba700b00397342e3830sm7733545wms.0.2022.06.10.00.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:58:15 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:58:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 24/54] acpi: applesmc: use AcpiDevAmlIfClass:build_dev_aml to
 provide device's AML
Message-ID: <20220610075631.367501-25-mst@redhat.com>
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

  .. and clean up not longer needed conditionals in DSTD build
code. applesmc AML will be fetched and included when ISA bridge
will build its own AML code (incl. attached devices).

Expected AML change:
the device under separate _SB.PCI0.ISA scope is moved directly
under Device(ISA) node.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-25-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/isa/isa.h | 14 --------------
 hw/i386/acpi-build.c | 22 ----------------------
 hw/misc/applesmc.c   | 29 +++++++++++++++++++++++++++++
 3 files changed, 29 insertions(+), 36 deletions(-)

diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 5c5a3d43a7..6f9380007d 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -16,20 +16,6 @@ OBJECT_DECLARE_TYPE(ISADevice, ISADeviceClass, ISA_DEVICE)
 #define TYPE_ISA_BUS "ISA"
 OBJECT_DECLARE_SIMPLE_TYPE(ISABus, ISA_BUS)
 
-#define TYPE_APPLE_SMC "isa-applesmc"
-#define APPLESMC_MAX_DATA_LENGTH       32
-#define APPLESMC_PROP_IO_BASE "iobase"
-
-static inline uint16_t applesmc_port(void)
-{
-    Object *obj = object_resolve_path_type("", TYPE_APPLE_SMC, NULL);
-
-    if (obj) {
-        return object_property_get_uint(obj, APPLESMC_PROP_IO_BASE, NULL);
-    }
-    return 0;
-}
-
 #define TYPE_ISADMA "isa-dma"
 
 typedef struct IsaDmaClass IsaDmaClass;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f7f1671407..b96705c688 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -121,7 +121,6 @@ typedef struct AcpiMiscInfo {
     const unsigned char *dsdt_code;
     unsigned dsdt_size;
     uint16_t pvpanic_port;
-    uint16_t applesmc_io_base;
 } AcpiMiscInfo;
 
 typedef struct AcpiBuildPciBusHotplugState {
@@ -307,7 +306,6 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
     info->tpm_version = tpm_get_version(tpm_find());
 #endif
     info->pvpanic_port = pvpanic_port();
-    info->applesmc_io_base = applesmc_port();
 }
 
 /*
@@ -1800,26 +1798,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dsdt, scope);
     }
 
-    if (misc->applesmc_io_base) {
-        scope = aml_scope("\\_SB.PCI0.ISA");
-        dev = aml_device("SMC");
-
-        aml_append(dev, aml_name_decl("_HID", aml_eisaid("APP0001")));
-        /* device present, functioning, decoding, not shown in UI */
-        aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
-
-        crs = aml_resource_template();
-        aml_append(crs,
-            aml_io(AML_DECODE16, misc->applesmc_io_base, misc->applesmc_io_base,
-                   0x01, APPLESMC_MAX_DATA_LENGTH)
-        );
-        aml_append(crs, aml_irq_no_flags(6));
-        aml_append(dev, aml_name_decl("_CRS", crs));
-
-        aml_append(scope, dev);
-        aml_append(dsdt, scope);
-    }
-
     if (misc->pvpanic_port) {
         scope = aml_scope("\\_SB.PCI0.ISA");
 
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 81cd6b6423..5f9c742e50 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -37,10 +37,14 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "qom/object.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 /* #define DEBUG_SMC */
 
 #define APPLESMC_DEFAULT_IOBASE        0x300
+#define TYPE_APPLE_SMC "isa-applesmc"
+#define APPLESMC_MAX_DATA_LENGTH       32
+#define APPLESMC_PROP_IO_BASE "iobase"
 
 enum {
     APPLESMC_DATA_PORT               = 0x00,
@@ -347,14 +351,35 @@ static Property applesmc_isa_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void build_applesmc_aml(AcpiDevAmlIf *adev, Aml *scope)
+{
+    Aml *crs;
+    AppleSMCState *s = APPLE_SMC(adev);
+    uint32_t iobase = s->iobase;
+    Aml *dev = aml_device("SMC");
+
+    aml_append(dev, aml_name_decl("_HID", aml_eisaid("APP0001")));
+    /* device present, functioning, decoding, not shown in UI */
+    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
+    crs = aml_resource_template();
+    aml_append(crs,
+        aml_io(AML_DECODE16, iobase, iobase, 0x01, APPLESMC_MAX_DATA_LENGTH)
+    );
+    aml_append(crs, aml_irq_no_flags(6));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
 static void qdev_applesmc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     dc->realize = applesmc_isa_realize;
     dc->reset = qdev_applesmc_isa_reset;
     device_class_set_props(dc, applesmc_isa_properties);
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    adevc->build_dev_aml = build_applesmc_aml;
 }
 
 static const TypeInfo applesmc_isa_info = {
@@ -362,6 +387,10 @@ static const TypeInfo applesmc_isa_info = {
     .parent        = TYPE_ISA_DEVICE,
     .instance_size = sizeof(AppleSMCState),
     .class_init    = qdev_applesmc_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_ACPI_DEV_AML_IF },
+        { },
+    },
 };
 
 static void applesmc_register_types(void)
-- 
MST


