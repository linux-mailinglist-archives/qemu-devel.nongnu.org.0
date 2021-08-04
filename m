Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D33B3E0339
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:32:08 +0200 (CEST)
Received: from localhost ([::1]:55394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBHwF-00029c-H2
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBHsI-0003C5-26
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:28:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBHsG-0003Si-8H
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628087279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JNl5Inw4Iwn9igzgBiU2/mXAXG2+LCCpC7PEv1O0wIE=;
 b=K3qoI3Yr1rsRxiX9lkPBpg3/7LweDCHk57dlLvtZKY/nPKsMHipCIybaCYO9Uoc+p/Lj+V
 WNMqB04dPkcmPZytVnEN3ZtRDIgug+Aqh9WxpwI8qm8n6UGfSGmDu9p565dHR2B3dIHc0q
 oX+ILx5WyoH+3zcZ59g9oxlkBt8SnIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-f6CYmisjN86LhHHhc3a6Tw-1; Wed, 04 Aug 2021 10:27:58 -0400
X-MC-Unique: f6CYmisjN86LhHHhc3a6Tw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6761D1026203;
 Wed,  4 Aug 2021 14:27:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 215B460BF4;
 Wed,  4 Aug 2021 14:27:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A39D0180098D; Wed,  4 Aug 2021 16:27:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] pc: add floppy=OnOffAuto
Date: Wed,  4 Aug 2021 16:27:37 +0200
Message-Id: <20210804142737.3366441-8-kraxel@redhat.com>
In-Reply-To: <20210804142737.3366441-1-kraxel@redhat.com>
References: <20210804142737.3366441-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allows to enable/disable the floppy controller.  Default depends on
MachineClass->no_floppy.  It's ON for now, but we can flip the default
for 6.2+ machine types.

NOTE: This requires -nodefaults or no_floppy=1 to actually have an
effect.  Otherwise the default floppy drive created by qemu will
auto-enable the floppy controller.  Not sure how to deal with that best.
IMHO we should simply stop creating a default floppy, unfortunaly
that will break live migration.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/i386/pc.h |  2 ++
 hw/i386/pc.c         | 23 +++++++++++++++++++++++
 hw/i386/pc_piix.c    |  8 +++++++-
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 88dffe751724..b418ead6c260 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -38,6 +38,7 @@ typedef struct PCMachineState {
     /* Configuration options: */
     uint64_t max_ram_below_4g;
     OnOffAuto vmport;
+    OnOffAuto floppy;
 
     bool acpi_build_enabled;
     bool smbus_enabled;
@@ -59,6 +60,7 @@ typedef struct PCMachineState {
 #define PC_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
 #define PC_MACHINE_DEVMEM_REGION_SIZE "device-memory-region-size"
 #define PC_MACHINE_VMPORT           "vmport"
+#define PC_MACHINE_FLOPPY           "floppy"
 #define PC_MACHINE_SMBUS            "smbus"
 #define PC_MACHINE_SATA             "sata"
 #define PC_MACHINE_PIT              "pit"
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c2b9d62a358f..832ea9cc8ef8 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1468,6 +1468,23 @@ static void pc_machine_set_vmport(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &pcms->vmport, errp);
 }
 
+static void pc_machine_get_floppy(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+    OnOffAuto floppy = pcms->floppy;
+
+    visit_type_OnOffAuto(v, name, &floppy, errp);
+}
+
+static void pc_machine_set_floppy(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    visit_type_OnOffAuto(v, name, &pcms->floppy, errp);
+}
+
 static bool pc_machine_get_smbus(Object *obj, Error **errp)
 {
     PCMachineState *pcms = PC_MACHINE(obj);
@@ -1751,6 +1768,12 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, PC_MACHINE_VMPORT,
         "Enable vmport (pc & q35)");
 
+    object_class_property_add(oc, PC_MACHINE_FLOPPY, "OnOffAuto",
+        pc_machine_get_floppy, pc_machine_set_floppy,
+        NULL, NULL);
+    object_class_property_set_description(oc, PC_MACHINE_FLOPPY,
+        "Enable floppy (pc only)");
+
     object_class_property_add_bool(oc, PC_MACHINE_SMBUS,
         pc_machine_get_smbus, pc_machine_set_smbus);
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 30b8bd6ea92d..7f81729e42cd 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -235,8 +235,14 @@ static void pc_init1(MachineState *machine,
         pcms->vmport = xen_enabled() ? ON_OFF_AUTO_OFF : ON_OFF_AUTO_ON;
     }
 
+    if (pcms->floppy == ON_OFF_AUTO_AUTO) {
+        pcms->floppy = MACHINE_CLASS(pcmc)->no_floppy
+            ? ON_OFF_AUTO_OFF : ON_OFF_AUTO_ON;
+    }
+
     /* init basic PC hardware */
-    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, true,
+    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state,
+                         pcms->floppy == ON_OFF_AUTO_ON,
                          0x4);
 
     pc_nic_init(pcmc, isa_bus, pci_bus);
-- 
2.31.1


