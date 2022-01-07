Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A484876CA
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:50:28 +0100 (CET)
Received: from localhost ([::1]:50280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nlM-0002as-0c
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:50:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2z-0000u4-AB
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2t-0001vP-OC
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtPfDvFmE3YguG6jVHreVpLhjGHZGLUGaDiekrm7E4k=;
 b=M7qDrU5QOlv8GlAeZqoKU+xp6S3WPiGJilhO+l1xZwTzhUl3PKuRo+E/ZsOU26XMqEO/4j
 JUeGhWJCqlnKXEE34c5YmVxfcykaMM364a/NFUwlnIGV7ytqbCK9bk8hnBN0Pm7FcFOzeh
 GThwCk+RqRWd0YVxzY9NXKFvH0l1iu0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-KKS9CEzsMaGB8I6L1aLRrg-1; Fri, 07 Jan 2022 06:04:29 -0500
X-MC-Unique: KKS9CEzsMaGB8I6L1aLRrg-1
Received: by mail-wr1-f70.google.com with SMTP id
 n4-20020adf8b04000000b001a49cff5283so2075667wra.14
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EtPfDvFmE3YguG6jVHreVpLhjGHZGLUGaDiekrm7E4k=;
 b=eJI22QinTNnYfprm38lTY3kuOvaR30xhIEqR8UK+rv/9IGH4D+ZgCaTKNcaZWbTnpE
 FpGoPKT/Rt1/uREUXwObPgmF/UWOk73gODkvMlx7OuXQ3j7fjdbF59YGaKOQQZ88JS9I
 o/80OMAkI7GnmUft17+9Y0tXuTSbWZMVX5vfs7KMfD7MWGYfmrHwv14585kQPZggLV25
 AfMgGMdofNiajti4DYziEtmLQa6K4ZD+V4Zr8eH65UzrKz8DyxE+EJPxpOacq4EIPp7+
 /hXyVGrzfuo0rRIeoTP24p5YbY0aN6V5qIhqATIVIYV3Jzn/GCzGD3/9PZ9qFVe6O3iI
 SWVg==
X-Gm-Message-State: AOAM530FrcpLPq2lDdilMby+0a+Ragh2RD0fXQ61rul9ctN6tz+5uTn5
 ne0DX/p4J0z7LHXL+MEagcrGPVo8Otx4M/rrBCrie83G93Y1wlUhY3SPRBnivKrYVyCd75YcJPZ
 A3j9TvEMZWk0T0ci1xXSQ7eVMiq7o3255UGK5rX8mVQcIAitjJEmp/dnc4LNF
X-Received: by 2002:a5d:65c9:: with SMTP id e9mr919040wrw.181.1641553468239;
 Fri, 07 Jan 2022 03:04:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzPIMEGKflJI9OkF3ooLTqS6x3151YFFeTzGhIzoiaxQek9kN3tPxPn8gYK76JJV/sLaJURQ==
X-Received: by 2002:a5d:65c9:: with SMTP id e9mr919014wrw.181.1641553467954;
 Fri, 07 Jan 2022 03:04:27 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id x8sm7220575wmj.44.2022.01.07.03.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:04:27 -0800 (PST)
Date: Fri, 7 Jan 2022 06:04:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 27/55] hw/i386: expose a "smbios-entry-point-type" PC
 machine property
Message-ID: <20220107102526.39238-28-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


