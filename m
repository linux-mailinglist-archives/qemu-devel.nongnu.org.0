Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C1C48656A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:42:29 +0100 (CET)
Received: from localhost ([::1]:32968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5T2C-0001wo-Ia
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:42:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SeB-00053L-Hu
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Se8-0000wa-Ox
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtPfDvFmE3YguG6jVHreVpLhjGHZGLUGaDiekrm7E4k=;
 b=Bx6084BLXgGtjH6n0SKGcbcOhnkfcJtNx6JWEYQ/bER/YtP8+I1E6zHvfC2W0hKm/29F8e
 4GexGeOg9xibdDAOhlsSBQI5+HLS8qWZwFfe9H7Ghie/5DoI5Q5pUs7vjqQJVt1yUBOXax
 pkKdhdjazoBIBdMdjqxMy+Kgyw72vuI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-_monbUxSNJmGfDrFjs3L6A-1; Thu, 06 Jan 2022 08:17:35 -0500
X-MC-Unique: _monbUxSNJmGfDrFjs3L6A-1
Received: by mail-ed1-f72.google.com with SMTP id
 y10-20020a056402358a00b003f88b132849so1973176edc.0
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EtPfDvFmE3YguG6jVHreVpLhjGHZGLUGaDiekrm7E4k=;
 b=te+v7qpBaA7oztlUFnMadlxA2skbyJzC4IgkDy/QDY/eE6hdSuH7kr5mZEk+p+QJ5U
 hUi/+YjCpPzkfj/+a6breY/OgmRgT1Zvzbf6vA8w6NJK59q7F0v6mgPCjt9L10mk92ra
 FORD4X/FVQGVQB85vSH1Nw4LCEj7JoBjY8vsH7kAwacp1haPB+eEuLKEysovYc7+1Gtw
 xtQCDVOdc7g3g7XjCEOFO4KHDDhQ0S28XwpMv23Yqela4AyXGTxiS4Xb9HfuGCc2PTPI
 0zs5qI/JZWzb1rH0mKdZbE41yXA/xXy6hJxdWzTQvlpFZbEp1XCRFGVQiYw0X5Z9X86w
 V9mA==
X-Gm-Message-State: AOAM531z2ZW0cDuqv8wi80R7p5g9tzu3yWjnjH2vtbKjg5rQi1H64Kcl
 N++N2zcrLlh5I4uDHV8KXWE0NjDMiy6XsqfHdl8wuP8ATSFafnrz3vBrTRX5uxEx7nUJQ7qc9Dk
 ouFGUT7lYh9pylzTdkqytHznih6BvTg00tn2ni7Sb1LCjxe7XMnTLqiHCSlhe
X-Received: by 2002:a17:906:36d8:: with SMTP id
 b24mr13256026ejc.342.1641475053669; 
 Thu, 06 Jan 2022 05:17:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrkTth4wyPkFVFdSfuH11WtRajdP6C296BnUsZtML1sqhzXGZ9YB3aGgkNWp0flf1Kr889/Q==
X-Received: by 2002:a17:906:36d8:: with SMTP id
 b24mr13256004ejc.342.1641475053402; 
 Thu, 06 Jan 2022 05:17:33 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id ga37sm488331ejc.65.2022.01.06.05.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:17:32 -0800 (PST)
Date: Thu, 6 Jan 2022 08:17:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/52] hw/i386: expose a "smbios-entry-point-type" PC machine
 property
Message-ID: <20220106131534.423671-28-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

The i440fx and Q35 machine types are both hardcoded to use the
legacy SMBIOS 2.1 (32-bit) entry point. This is a sensible
conservative choice because SeaBIOS only supports SMBIOS 2.1

EDK2, however, can also support SMBIOS 3.0 (64-bit) entry points,
and QEMU already uses this on the ARM virt machine type.

This adds a property to allow the choice of SMBIOS entry point
versions For example to opt in to 64-bit SMBIOS entry point:

   $QEMU -machine q35,smbios-entry-point-type=64

Based on a patch submitted by Daniel Berrangé.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20211026151100.1691925-4-ehabkost@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/i386/pc.h |  4 ++++
 hw/i386/pc.c         | 26 ++++++++++++++++++++++++++
 hw/i386/pc_piix.c    |  2 +-
 hw/i386/pc_q35.c     |  2 +-
 4 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index b38947c224..9c9f4ac748 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -13,6 +13,7 @@
 #include "hw/hotplug.h"
 #include "qom/object.h"
 #include "hw/i386/sgx-epc.h"
+#include "hw/firmware/smbios.h"
 
 #define HPET_INTCAP "hpet-intcap"
 
@@ -40,6 +41,7 @@ typedef struct PCMachineState {
     /* Configuration options: */
     uint64_t max_ram_below_4g;
     OnOffAuto vmport;
+    SmbiosEntryPointType smbios_entry_point_type;
 
     bool acpi_build_enabled;
     bool smbus_enabled;
@@ -63,6 +65,8 @@ typedef struct PCMachineState {
 #define PC_MACHINE_SATA             "sata"
 #define PC_MACHINE_PIT              "pit"
 #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
+#define PC_MACHINE_SMBIOS_EP        "smbios-entry-point-type"
+
 /**
  * PCMachineClass:
  *
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index fccde2ef39..959efa5b3f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -77,6 +77,7 @@
 #include "hw/mem/nvdimm.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-common.h"
+#include "qapi/qapi-visit-machine.h"
 #include "qapi/visitor.h"
 #include "hw/core/cpu.h"
 #include "hw/usb.h"
@@ -1524,6 +1525,23 @@ static void pc_machine_set_default_bus_bypass_iommu(Object *obj, bool value,
     pcms->default_bus_bypass_iommu = value;
 }
 
+static void pc_machine_get_smbios_ep(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+    SmbiosEntryPointType smbios_entry_point_type = pcms->smbios_entry_point_type;
+
+    visit_type_SmbiosEntryPointType(v, name, &smbios_entry_point_type, errp);
+}
+
+static void pc_machine_set_smbios_ep(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    visit_type_SmbiosEntryPointType(v, name, &pcms->smbios_entry_point_type, errp);
+}
+
 static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
@@ -1614,6 +1632,8 @@ static void pc_machine_initfn(Object *obj)
     pcms->vmport = ON_OFF_AUTO_OFF;
 #endif /* CONFIG_VMPORT */
     pcms->max_ram_below_4g = 0; /* use default */
+    pcms->smbios_entry_point_type = SMBIOS_ENTRY_POINT_TYPE_32;
+
     /* acpi build is enabled by default if machine supports it */
     pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
     pcms->smbus_enabled = true;
@@ -1756,6 +1776,12 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
         "Maximum combined firmware size");
+
+    object_class_property_add(oc, PC_MACHINE_SMBIOS_EP, "str",
+        pc_machine_get_smbios_ep, pc_machine_set_smbios_ep,
+        NULL, NULL);
+    object_class_property_set_description(oc, PC_MACHINE_SMBIOS_EP,
+        "SMBIOS Entry Point type [32, 64]");
 }
 
 static const TypeInfo pc_machine_info = {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 25f918b609..7c7790a5ce 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -177,7 +177,7 @@ static void pc_init1(MachineState *machine,
         smbios_set_defaults("QEMU", "Standard PC (i440FX + PIIX, 1996)",
                             mc->name, pcmc->smbios_legacy_mode,
                             pcmc->smbios_uuid_encoded,
-                            SMBIOS_ENTRY_POINT_TYPE_32);
+                            pcms->smbios_entry_point_type);
     }
 
     /* allocate ram and load rom/bios */
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 1103fbcd90..1780f79bc1 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -200,7 +200,7 @@ static void pc_q35_init(MachineState *machine)
         smbios_set_defaults("QEMU", "Standard PC (Q35 + ICH9, 2009)",
                             mc->name, pcmc->smbios_legacy_mode,
                             pcmc->smbios_uuid_encoded,
-                            SMBIOS_ENTRY_POINT_TYPE_32);
+                            pcms->smbios_entry_point_type);
     }
 
     /* allocate ram and load rom/bios */
-- 
MST


