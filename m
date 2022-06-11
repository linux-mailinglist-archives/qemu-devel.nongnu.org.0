Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 420C254740C
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:01:05 +0200 (CEST)
Received: from localhost ([::1]:58150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzyrX-0004i3-Vb
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTA-0005f1-QX
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyT8-0006jR-Ol
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:52 -0400
Received: by mail-wm1-x336.google.com with SMTP id a10so621649wmj.5
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8lIdpUuj53G78ixCb6Twke/OwYar2O+RvomykKgYH0s=;
 b=OofF122HXzPRZfqgtwU+LsrMgWdop7lUAVi1bbkBBJA6zO5iZg4AtlDHQW/6XmipCh
 ryJn5MzoKf7uj8Ml5VgDaSg0jtxrirx5HADFVnuts57Lk3LFmh9UiSBnQ8b2B3is5VG7
 dKQc3SnE3IIrFdZjm3MXK1O1Ua4bbn72NFIB7HHPY5BwG6pdXVrXLYOG2xZFycij9bhk
 BZpNJw2DxpAPWF4QR9q6o+lFADjKtGaAOaIg/xR6wbm7QDt9iDJATISHIsppnqKgiWxX
 TZifviQLVsb5fK2p0nTlpeo9u3YEq4oGuZSEdRAcJma50xcAMhzKDJb1Cle+iqkP8iiF
 fsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8lIdpUuj53G78ixCb6Twke/OwYar2O+RvomykKgYH0s=;
 b=vMWaIyDQcmZn2362b2zsrn8qAmJIqnUfB8dhEbSPz6j6qCKFRud4t68T2wFJmDHB2n
 vKhTzz9ZjnPI7/bK3LZZWLMZMW6QiSGDTRfKHVlA/XmUBaHgL92Fa37w4cPSqkWOB9SL
 beGgxUsfG6GcQBGqKLrYtHQSc5TliG54XfPLmiyJCZGkV/R79f3hCnMIR+EeA7cntn8Y
 iKcJsZFJfmMWGB+laigB/8v4FS0Zm5Xxg1EBthBB/pHBRrEAVDkDn1B1Kb2CVW9AUt0h
 McR+f3eMJsWNYOlc2Oa/0zlUlI+2ZdbK8QZb8Oy/m6758bzku3a44goqR5v9P6jSxnB7
 2LlQ==
X-Gm-Message-State: AOAM533Jr1i2EJCR33ERayXX5W3+73sD0bYzhUFr/h6b6mW7JFStbYAX
 HdKo0UmId95u7Odslkw0lsCxFnxQ5Ew=
X-Google-Smtp-Source: ABdhPJzGO0HXwtKC55UEnjPS3CrGDx2H7OFDR9xSscloJelZPlA7TfzN2QCq2BDRFzG5VjaIRhpIbw==
X-Received: by 2002:a05:600c:22d9:b0:39c:4b1b:5f99 with SMTP id
 25-20020a05600c22d900b0039c4b1b5f99mr4160794wmg.151.1654943749185; 
 Sat, 11 Jun 2022 03:35:49 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 r16-20020a056000015000b0021108003596sm2194837wrx.10.2022.06.11.03.35.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:35:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 30/49] hw/isa/piix4: QOM'ify PCI device creation and wiring
Date: Sat, 11 Jun 2022 12:32:53 +0200
Message-Id: <20220611103312.67773-31-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

PCI interrupt wiring and device creation were performed in create()
functions which are obsolete. Move these tasks into QOM functions to
modernize the code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220603185045.143789-5-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 18aa24424f..058bebb5e2 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -35,6 +35,7 @@
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/ide/pci.h"
 #include "hw/acpi/piix4.h"
+#include "hw/usb/hcd-uhci.h"
 #include "migration/vmstate.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
@@ -46,6 +47,8 @@ struct PIIX4State {
     qemu_irq *isa;
 
     RTCState rtc;
+    PCIIDEState ide;
+    UHCIState uhci;
     /* Reset Control Register */
     MemoryRegion rcr_mem;
     uint8_t rcr;
@@ -205,6 +208,7 @@ static const MemoryRegionOps piix4_rcr_ops = {
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
     PIIX4State *s = PIIX4_PCI_DEVICE(dev);
+    PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
     qemu_irq *i8259_out_irq;
 
@@ -243,6 +247,21 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
     s->rtc.irq = isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc.isairq);
+
+    /* IDE */
+    qdev_prop_set_int32(DEVICE(&s->ide), "addr", dev->devfn + 1);
+    if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
+        return;
+    }
+    pci_ide_create_devs(PCI_DEVICE(&s->ide));
+
+    /* USB */
+    qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
+    if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
+        return;
+    }
+
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
 }
 
 static void piix4_init(Object *obj)
@@ -250,6 +269,8 @@ static void piix4_init(Object *obj)
     PIIX4State *s = PIIX4_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
+    object_initialize_child(obj, "ide", &s->ide, "piix4-ide");
+    object_initialize_child(obj, "uhci", &s->uhci, "piix4-usb-uhci");
 }
 
 static void piix4_class_init(ObjectClass *klass, void *data)
@@ -293,7 +314,6 @@ type_init(piix4_register_types)
 
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 {
-    PIIX4State *s;
     PCIDevice *pci;
     DeviceState *dev;
     int devfn = PCI_DEVFN(10, 0);
@@ -301,15 +321,11 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
     pci = pci_create_simple_multifunction(pci_bus, devfn,  true,
                                           TYPE_PIIX4_PCI_DEVICE);
     dev = DEVICE(pci);
-    s = PIIX4_PCI_DEVICE(pci);
+
     if (isa_bus) {
         *isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
     }
 
-    pci = pci_create_simple(pci_bus, devfn + 1, "piix4-ide");
-    pci_ide_create_devs(pci);
-
-    pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
     if (smbus) {
         pci = pci_new(devfn + 3, TYPE_PIIX4_PM);
         qdev_prop_set_uint32(DEVICE(pci), "smb_io_base", 0x1100);
@@ -320,7 +336,5 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
         *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pci), "i2c"));
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
-
     return dev;
 }
-- 
2.36.1


