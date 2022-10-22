Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B04609676
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Oct 2022 23:18:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhNN-0007EO-35
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5Q-0007I0-07; Sat, 22 Oct 2022 11:06:56 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5N-00026R-TY; Sat, 22 Oct 2022 11:06:55 -0400
Received: by mail-ed1-x52d.google.com with SMTP id u21so16102131edi.9;
 Sat, 22 Oct 2022 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eo8tfp6teNlFVPHAvi7UB79RgFfoqZm7PsttG4dSiug=;
 b=A5a3t0ACSVRrpf+oOdle3XMh+rf972J336+6e3YreyflSIu1K/zz9VHA88p8SeFSwD
 CbDbEcnzhizwNspCOxOHaB+veY6uUdReraC1ga5Mq7GUfWfzAEqiIFyBejIs2qGZR7OV
 BZ2ZJ7AJFt3x29gJR2v05KzkUgkE0UHdCTZpIefl+PFcnotZQ1A4eXctL6iUJe8c32c1
 LIpA4kTT/+8vybVJ5hqcdEmmcCR0GvqMthJ6+9SziogDZYpO/sjUmS4UiARupH+EhqsI
 Ce9rbhT+Ac6rTjSGzGiQBAcsNKoZI7ASwmG/SKDrYQe5NcJlAvySQlbBdbN7bM0G1jZN
 Wr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eo8tfp6teNlFVPHAvi7UB79RgFfoqZm7PsttG4dSiug=;
 b=HER7ZIYhfJvyrrADbF0Tb/iOSFigDkNomsW2rDyNrrTrgxWKRcMrUuY8TrL9nzrzDP
 9WytB5Ugu8zgkSdM8yDGDKO/fOsCbds58WTNj6+N/6rCyKxUXmu4lkWvmc2c+gff0WpL
 g06V8MCO1x7w3bBMml74PisN31QcgrO3PLiMBjaLY1aSg56ABOVooXGblc2poI2p3xqY
 YTRGe+xNhq44nkJcO97Wcm/hpT4kOINx/WDj6rIM4jiJiX2CflAjrqJRoZd+MLKkuC6i
 2IgfeaoYe3f//9tvAFd66o3J2rOJC7vFVvv/xAvMssWRNM82cD8XAPhheo2mSMQBrNJ2
 8xHw==
X-Gm-Message-State: ACrzQf2jY6V+ZveYx9dLEmjOZ0mlAR2TEiZo3FHpJkt2MSrU42GycYpo
 1nAFIA/uM8AgV3+2BNBkPa4um7AqhVZflg==
X-Google-Smtp-Source: AMsMyM4ohhKba+8lyJP0XbB9LggIszqK5LMfLsLmxIS20kDy65UUa5tVJojcAul3IdzBpiqr/fh1qg==
X-Received: by 2002:a17:906:30c5:b0:782:707:9e2d with SMTP id
 b5-20020a17090630c500b0078207079e2dmr19779033ejb.286.1666451212388; 
 Sat, 22 Oct 2022 08:06:52 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:51 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 24/43] hw/isa/piix3: Rename typedef PIIX3State to PIIXState
Date: Sat, 22 Oct 2022 17:04:49 +0200
Message-Id: <20221022150508.26830-25-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit marks the finalization of the PIIX3 preparations
to be merged with PIIX4. In particular, PIIXState is prepared
to be reused in piix4.c.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix3.c                | 58 +++++++++++++++++------------------
 include/hw/southbridge/piix.h |  4 +--
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 8878d71465..b02a91c8eb 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -38,7 +38,7 @@
 
 #define XEN_PIIX_NUM_PIRQS      128ULL
 
-static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
+static void piix3_set_irq_pic(PIIXState *piix3, int pic_irq)
 {
     qemu_set_irq(piix3->pic.in_irqs[pic_irq],
                  !!(piix3->pic_levels &
@@ -46,7 +46,7 @@ static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
                      (pic_irq * PIIX_NUM_PIRQS))));
 }
 
-static void piix3_set_irq_level_internal(PIIX3State *piix3, int pirq, int level)
+static void piix3_set_irq_level_internal(PIIXState *piix3, int pirq, int level)
 {
     int pic_irq;
     uint64_t mask;
@@ -61,7 +61,7 @@ static void piix3_set_irq_level_internal(PIIX3State *piix3, int pirq, int level)
     piix3->pic_levels |= mask * !!level;
 }
 
-static void piix3_set_irq_level(PIIX3State *piix3, int pirq, int level)
+static void piix3_set_irq_level(PIIXState *piix3, int pirq, int level)
 {
     int pic_irq;
 
@@ -77,7 +77,7 @@ static void piix3_set_irq_level(PIIX3State *piix3, int pirq, int level)
 
 static void piix3_set_irq(void *opaque, int pirq, int level)
 {
-    PIIX3State *piix3 = opaque;
+    PIIXState *piix3 = opaque;
     piix3_set_irq_level(piix3, pirq, level);
 }
 
@@ -94,7 +94,7 @@ static int piix3_pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
 
 static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 {
-    PIIX3State *piix3 = opaque;
+    PIIXState *piix3 = opaque;
     int irq = piix3->dev.config[PIIX_PIRQCA + pin];
     PCIINTxRoute route;
 
@@ -109,7 +109,7 @@ static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 }
 
 /* irq routing is changed. so rebuild bitmap */
-static void piix3_update_irq_levels(PIIX3State *piix3)
+static void piix3_update_irq_levels(PIIXState *piix3)
 {
     PCIBus *bus = pci_get_bus(&piix3->dev);
     int pirq;
@@ -125,7 +125,7 @@ static void piix3_write_config(PCIDevice *dev,
 {
     pci_default_write_config(dev, address, val, len);
     if (ranges_overlap(address, len, PIIX_PIRQCA, 4)) {
-        PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+        PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
         int pic_irq;
 
         pci_bus_fire_intx_routing_notifier(pci_get_bus(&piix3->dev));
@@ -158,7 +158,7 @@ static void piix3_write_config_xen(PCIDevice *dev,
 
 static void piix_reset(DeviceState *dev)
 {
-    PIIX3State *d = PIIX3_PCI_DEVICE(dev);
+    PIIXState *d = PIIX_PCI_DEVICE(dev);
     uint8_t *pci_conf = d->dev.config;
 
     pci_conf[0x04] = 0x07; /* master, memory and I/O */
@@ -199,7 +199,7 @@ static void piix_reset(DeviceState *dev)
 
 static int piix3_post_load(void *opaque, int version_id)
 {
-    PIIX3State *piix3 = opaque;
+    PIIXState *piix3 = opaque;
     int pirq;
 
     /*
@@ -222,7 +222,7 @@ static int piix3_post_load(void *opaque, int version_id)
 static int piix3_pre_save(void *opaque)
 {
     int i;
-    PIIX3State *piix3 = opaque;
+    PIIXState *piix3 = opaque;
 
     for (i = 0; i < ARRAY_SIZE(piix3->pci_irq_levels_vmstate); i++) {
         piix3->pci_irq_levels_vmstate[i] =
@@ -234,7 +234,7 @@ static int piix3_pre_save(void *opaque)
 
 static bool piix3_rcr_needed(void *opaque)
 {
-    PIIX3State *piix3 = opaque;
+    PIIXState *piix3 = opaque;
 
     return (piix3->rcr != 0);
 }
@@ -245,7 +245,7 @@ static const VMStateDescription vmstate_piix3_rcr = {
     .minimum_version_id = 1,
     .needed = piix3_rcr_needed,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT8(rcr, PIIX3State),
+        VMSTATE_UINT8(rcr, PIIXState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -257,8 +257,8 @@ static const VMStateDescription vmstate_piix3 = {
     .post_load = piix3_post_load,
     .pre_save = piix3_pre_save,
     .fields = (VMStateField[]) {
-        VMSTATE_PCI_DEVICE(dev, PIIX3State),
-        VMSTATE_INT32_ARRAY_V(pci_irq_levels_vmstate, PIIX3State,
+        VMSTATE_PCI_DEVICE(dev, PIIXState),
+        VMSTATE_INT32_ARRAY_V(pci_irq_levels_vmstate, PIIXState,
                               PIIX_NUM_PIRQS, 3),
         VMSTATE_END_OF_LIST()
     },
@@ -271,7 +271,7 @@ static const VMStateDescription vmstate_piix3 = {
 
 static void rcr_write(void *opaque, hwaddr addr, uint64_t val, unsigned len)
 {
-    PIIX3State *d = opaque;
+    PIIXState *d = opaque;
 
     if (val & 4) {
         qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
@@ -282,7 +282,7 @@ static void rcr_write(void *opaque, hwaddr addr, uint64_t val, unsigned len)
 
 static uint64_t rcr_read(void *opaque, hwaddr addr, unsigned len)
 {
-    PIIX3State *d = opaque;
+    PIIXState *d = opaque;
 
     return d->rcr;
 }
@@ -299,7 +299,7 @@ static const MemoryRegionOps rcr_ops = {
 
 static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 {
-    PIIX3State *d = PIIX3_PCI_DEVICE(dev);
+    PIIXState *d = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
 
@@ -374,7 +374,7 @@ static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
 
 static void pci_piix3_init(Object *obj)
 {
-    PIIX3State *d = PIIX3_PCI_DEVICE(obj);
+    PIIXState *d = PIIX_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "pic", &d->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
@@ -382,14 +382,14 @@ static void pci_piix3_init(Object *obj)
 }
 
 static Property pci_piix_props[] = {
-    DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
-    DEFINE_PROP_UINT8("pirqa", PIIX3State, pci_irq_reset_mappings[0], 0x80),
-    DEFINE_PROP_UINT8("pirqb", PIIX3State, pci_irq_reset_mappings[1], 0x80),
-    DEFINE_PROP_UINT8("pirqc", PIIX3State, pci_irq_reset_mappings[2], 0x80),
-    DEFINE_PROP_UINT8("pirqd", PIIX3State, pci_irq_reset_mappings[3], 0x80),
-    DEFINE_PROP_BOOL("has-acpi", PIIX3State, has_acpi, true),
-    DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
-    DEFINE_PROP_BOOL("smm-enabled", PIIX3State, smm_enabled, false),
+    DEFINE_PROP_UINT32("smb_io_base", PIIXState, smb_io_base, 0),
+    DEFINE_PROP_UINT8("pirqa", PIIXState, pci_irq_reset_mappings[0], 0x80),
+    DEFINE_PROP_UINT8("pirqb", PIIXState, pci_irq_reset_mappings[1], 0x80),
+    DEFINE_PROP_UINT8("pirqc", PIIXState, pci_irq_reset_mappings[2], 0x80),
+    DEFINE_PROP_UINT8("pirqd", PIIXState, pci_irq_reset_mappings[3], 0x80),
+    DEFINE_PROP_BOOL("has-acpi", PIIXState, has_acpi, true),
+    DEFINE_PROP_BOOL("has-usb", PIIXState, has_usb, true),
+    DEFINE_PROP_BOOL("smm-enabled", PIIXState, smm_enabled, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -419,7 +419,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
 static const TypeInfo piix3_pci_type_info = {
     .name = TYPE_PIIX3_PCI_DEVICE,
     .parent = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PIIX3State),
+    .instance_size = sizeof(PIIXState),
     .instance_init = pci_piix3_init,
     .abstract = true,
     .class_init = pci_piix3_class_init,
@@ -433,7 +433,7 @@ static const TypeInfo piix3_pci_type_info = {
 static void piix3_realize(PCIDevice *dev, Error **errp)
 {
     ERRP_GUARD();
-    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+    PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
     pci_piix3_realize(dev, errp);
@@ -463,7 +463,7 @@ static const TypeInfo piix3_info = {
 static void piix3_xen_realize(PCIDevice *dev, Error **errp)
 {
     ERRP_GUARD();
-    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+    PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
     pci_piix3_realize(dev, errp);
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index ae3b49fe93..c9fa0f1aa6 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -73,10 +73,10 @@ struct PIIXState {
     bool has_usb;
     bool smm_enabled;
 };
-typedef struct PIIXState PIIX3State;
+typedef struct PIIXState PIIXState;
 
 #define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
-DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
+DECLARE_INSTANCE_CHECKER(PIIXState, PIIX_PCI_DEVICE,
                          TYPE_PIIX3_PCI_DEVICE)
 
 #define TYPE_PIIX3_DEVICE "PIIX3"
-- 
2.38.1


