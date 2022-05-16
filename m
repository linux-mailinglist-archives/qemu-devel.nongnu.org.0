Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A134528423
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:26:48 +0200 (CEST)
Received: from localhost ([::1]:51858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZoF-0004XZ-LO
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9Q-0002k3-JW
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9O-0005n5-Jz
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vmiSQAuHJykmFquAlpTdzf2f3zovEvTK3ZqZ3s7Mnc8=;
 b=YQWfK38PI0iAieW8J9RVi3vU97idIjNOfFQOk+aomJfbMOiESdWG8xEA4TAqKoIh502Udc
 qfODXNY+OAyW3ZVeSPFTqtNxyHU2Nke6WjpeN0iV0MvzWH6gVHMie2iEEIZFUOkqzrWgSQ
 MRaG8jjSuP6dqkuzXof4dkTl0mTtdRI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-5JTpL19oNsWsg1NvuBgq1A-1; Mon, 16 May 2022 06:40:28 -0400
X-MC-Unique: 5JTpL19oNsWsg1NvuBgq1A-1
Received: by mail-wr1-f71.google.com with SMTP id
 bj22-20020a0560001e1600b0020cccc6b25aso3810664wrb.1
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vmiSQAuHJykmFquAlpTdzf2f3zovEvTK3ZqZ3s7Mnc8=;
 b=3MSzrKay5fInLjDcjVpRxPuugrw7t66X2+iLXsyN4jPpUz3fSh9aSxJs7tdVpYGIwI
 y/xGIc5E+ISFUXSNivRObfveR6YhN+RtSyXLy8bL6SfvzrJrtQRWWO3paE0hy2Gb1grF
 1bBihONwYcim5WHOQU6VubxArUaJRIcWWm+7SBMKq4pLE0w9b0Z+X1Zl8DcV1I1ksX7K
 RGmQ4VozsUqQazsNyyicOidjlfYnoJH9U9H1RQ6rMuu42BtEt7nAQWNI/vVVpAW9q/Yi
 v28zJfyhRdQ55yhBC/8EFiszOBSMtzp7rWKjwXL6kHIbRDMfpkKK79orma0sIUSdI6kX
 R8yQ==
X-Gm-Message-State: AOAM532LlK8ZMsqe6qh9gbdF0CAM2h4aSC9T9gKgL4EUZpaXAB36Ccb3
 y6r0wU1HhYdcGszWFNr+1wZRgucvymn2eE4CsSYz+Cd/OTXSQTeNad3d0KfaBjxUglfEIEsmAII
 0BcWNPKXD+A+yfx1flwKBnDirev+btDwOLQFK1Wty5A62aO77ELDAp2XiQpe7
X-Received: by 2002:a05:6000:16c1:b0:20c:d01d:141 with SMTP id
 h1-20020a05600016c100b0020cd01d0141mr13483828wrf.385.1652697627412; 
 Mon, 16 May 2022 03:40:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdQbsBkBN1LZScKRGrEfMgEzPXV7OehSxFkNQCys7oO9BlLlJXU99suM8b6g+mx3galBccAw==
X-Received: by 2002:a05:6000:16c1:b0:20c:d01d:141 with SMTP id
 h1-20020a05600016c100b0020cd01d0141mr13483800wrf.385.1652697627102; 
 Mon, 16 May 2022 03:40:27 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 p26-20020adfa21a000000b0020c61af5e1fsm9064345wra.51.2022.05.16.03.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:40:26 -0700 (PDT)
Date: Mon, 16 May 2022 06:40:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 82/91] hw/i386: Make pit a property of common x86 base machine
 type
Message-ID: <20220516095448.507876-83-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Xiaoyao Li <xiaoyao.li@intel.com>

Both pc and microvm have pit property individually. Let's just make it
the property of common x86 base machine type.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-Id: <20220310122811.807794-2-xiaoyao.li@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/microvm.h |  2 --
 include/hw/i386/pc.h      |  2 --
 include/hw/i386/x86.h     |  2 ++
 hw/i386/microvm.c         | 27 +--------------------------
 hw/i386/pc.c              | 24 +++---------------------
 hw/i386/x86.c             | 25 +++++++++++++++++++++++++
 6 files changed, 31 insertions(+), 51 deletions(-)

diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index efcbd926fd..83f9ac0b2a 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -67,7 +67,6 @@
 #define PCIE_ECAM_SIZE        0x10000000
 
 /* Machine type options */
-#define MICROVM_MACHINE_PIT                 "pit"
 #define MICROVM_MACHINE_PIC                 "pic"
 #define MICROVM_MACHINE_RTC                 "rtc"
 #define MICROVM_MACHINE_PCIE                "pcie"
@@ -87,7 +86,6 @@ struct MicrovmMachineState {
 
     /* Machine type options */
     OnOffAuto pic;
-    OnOffAuto pit;
     OnOffAuto rtc;
     OnOffAuto pcie;
     OnOffAuto ioapic2;
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index aff8add155..ffcac5121e 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -46,7 +46,6 @@ typedef struct PCMachineState {
     bool acpi_build_enabled;
     bool smbus_enabled;
     bool sata_enabled;
-    bool pit_enabled;
     bool hpet_enabled;
     bool i8042_enabled;
     bool default_bus_bypass_iommu;
@@ -64,7 +63,6 @@ typedef struct PCMachineState {
 #define PC_MACHINE_VMPORT           "vmport"
 #define PC_MACHINE_SMBUS            "smbus"
 #define PC_MACHINE_SATA             "sata"
-#define PC_MACHINE_PIT              "pit"
 #define PC_MACHINE_I8042            "i8042"
 #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
 #define PC_MACHINE_SMBIOS_EP        "smbios-entry-point-type"
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 4841a49f86..b81fce54a0 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -65,6 +65,7 @@ struct X86MachineState {
 
     OnOffAuto smm;
     OnOffAuto acpi;
+    OnOffAuto pit;
 
     char *oem_id;
     char *oem_table_id;
@@ -84,6 +85,7 @@ struct X86MachineState {
 
 #define X86_MACHINE_SMM              "smm"
 #define X86_MACHINE_ACPI             "acpi"
+#define X86_MACHINE_PIT              "pit"
 #define X86_MACHINE_OEM_ID           "x-oem-id"
 #define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
 #define X86_MACHINE_BUS_LOCK_RATELIMIT  "bus-lock-ratelimit"
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 4b3b1dd262..89b555a2f5 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -257,7 +257,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
         g_free(i8259);
     }
 
-    if (mms->pit == ON_OFF_AUTO_ON || mms->pit == ON_OFF_AUTO_AUTO) {
+    if (x86ms->pit == ON_OFF_AUTO_ON || x86ms->pit == ON_OFF_AUTO_AUTO) {
         if (kvm_pit_in_kernel()) {
             kvm_pit_init(isa_bus, 0x40);
         } else {
@@ -508,23 +508,6 @@ static void microvm_machine_set_pic(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &mms->pic, errp);
 }
 
-static void microvm_machine_get_pit(Object *obj, Visitor *v, const char *name,
-                                    void *opaque, Error **errp)
-{
-    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
-    OnOffAuto pit = mms->pit;
-
-    visit_type_OnOffAuto(v, name, &pit, errp);
-}
-
-static void microvm_machine_set_pit(Object *obj, Visitor *v, const char *name,
-                                    void *opaque, Error **errp)
-{
-    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
-
-    visit_type_OnOffAuto(v, name, &mms->pit, errp);
-}
-
 static void microvm_machine_get_rtc(Object *obj, Visitor *v, const char *name,
                                     void *opaque, Error **errp)
 {
@@ -650,7 +633,6 @@ static void microvm_machine_initfn(Object *obj)
 
     /* Configuration */
     mms->pic = ON_OFF_AUTO_AUTO;
-    mms->pit = ON_OFF_AUTO_AUTO;
     mms->rtc = ON_OFF_AUTO_AUTO;
     mms->pcie = ON_OFF_AUTO_AUTO;
     mms->ioapic2 = ON_OFF_AUTO_AUTO;
@@ -709,13 +691,6 @@ static void microvm_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, MICROVM_MACHINE_PIC,
         "Enable i8259 PIC");
 
-    object_class_property_add(oc, MICROVM_MACHINE_PIT, "OnOffAuto",
-                              microvm_machine_get_pit,
-                              microvm_machine_set_pit,
-                              NULL, NULL);
-    object_class_property_set_description(oc, MICROVM_MACHINE_PIT,
-        "Enable i8254 PIT");
-
     object_class_property_add(oc, MICROVM_MACHINE_RTC, "OnOffAuto",
                               microvm_machine_get_rtc,
                               microvm_machine_set_rtc,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 15f37d8dc6..7c39c91335 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1123,6 +1123,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
     ISADevice *pit = NULL;
     MemoryRegion *ioport80_io = g_new(MemoryRegion, 1);
     MemoryRegion *ioportF0_io = g_new(MemoryRegion, 1);
+    X86MachineState *x86ms = X86_MACHINE(pcms);
 
     memory_region_init_io(ioport80_io, NULL, &ioport80_io_ops, NULL, "ioport80", 1);
     memory_region_add_subregion(isa_bus->address_space_io, 0x80, ioport80_io);
@@ -1167,7 +1168,8 @@ void pc_basic_device_init(struct PCMachineState *pcms,
 
     qemu_register_boot_set(pc_boot_set, *rtc_state);
 
-    if (!xen_enabled() && pcms->pit_enabled) {
+    if (!xen_enabled() &&
+        (x86ms->pit == ON_OFF_AUTO_AUTO || x86ms->pit == ON_OFF_AUTO_ON)) {
         if (kvm_pit_in_kernel()) {
             pit = kvm_pit_init(isa_bus, 0x40);
         } else {
@@ -1537,20 +1539,6 @@ static void pc_machine_set_sata(Object *obj, bool value, Error **errp)
     pcms->sata_enabled = value;
 }
 
-static bool pc_machine_get_pit(Object *obj, Error **errp)
-{
-    PCMachineState *pcms = PC_MACHINE(obj);
-
-    return pcms->pit_enabled;
-}
-
-static void pc_machine_set_pit(Object *obj, bool value, Error **errp)
-{
-    PCMachineState *pcms = PC_MACHINE(obj);
-
-    pcms->pit_enabled = value;
-}
-
 static bool pc_machine_get_hpet(Object *obj, Error **errp)
 {
     PCMachineState *pcms = PC_MACHINE(obj);
@@ -1707,7 +1695,6 @@ static void pc_machine_initfn(Object *obj)
     pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
     pcms->smbus_enabled = true;
     pcms->sata_enabled = true;
-    pcms->pit_enabled = true;
     pcms->i8042_enabled = true;
     pcms->max_fw_size = 8 * MiB;
 #ifdef CONFIG_HPET
@@ -1836,11 +1823,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, PC_MACHINE_SATA,
         "Enable/disable Serial ATA bus");
 
-    object_class_property_add_bool(oc, PC_MACHINE_PIT,
-        pc_machine_get_pit, pc_machine_set_pit);
-    object_class_property_set_description(oc, PC_MACHINE_PIT,
-        "Enable/disable Intel 8254 programmable interval timer emulation");
-
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
     object_class_property_set_description(oc, "hpet",
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index f79e720cc2..784d54efa9 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1244,6 +1244,23 @@ static void x86_machine_set_acpi(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &x86ms->acpi, errp);
 }
 
+static void x86_machine_get_pit(Object *obj, Visitor *v, const char *name,
+                                    void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+    OnOffAuto pit = x86ms->pit;
+
+    visit_type_OnOffAuto(v, name, &pit, errp);
+}
+
+static void x86_machine_set_pit(Object *obj, Visitor *v, const char *name,
+                                    void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);;
+
+    visit_type_OnOffAuto(v, name, &x86ms->pit, errp);
+}
+
 static char *x86_machine_get_oem_id(Object *obj, Error **errp)
 {
     X86MachineState *x86ms = X86_MACHINE(obj);
@@ -1333,6 +1350,7 @@ static void x86_machine_initfn(Object *obj)
 
     x86ms->smm = ON_OFF_AUTO_AUTO;
     x86ms->acpi = ON_OFF_AUTO_AUTO;
+    x86ms->pit = ON_OFF_AUTO_AUTO;
     x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
@@ -1364,6 +1382,13 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, X86_MACHINE_ACPI,
         "Enable ACPI");
 
+    object_class_property_add(oc, X86_MACHINE_PIT, "OnOffAuto",
+                              x86_machine_get_pit,
+                              x86_machine_set_pit,
+                              NULL, NULL);
+    object_class_property_set_description(oc, X86_MACHINE_PIT,
+        "Enable i8254 PIT");
+
     object_class_property_add_str(oc, X86_MACHINE_OEM_ID,
                                   x86_machine_get_oem_id,
                                   x86_machine_set_oem_id);
-- 
MST


