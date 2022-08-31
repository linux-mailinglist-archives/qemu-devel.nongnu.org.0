Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1375A82A2
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 18:03:33 +0200 (CEST)
Received: from localhost ([::1]:54142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTQBf-0001lf-UI
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 12:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvI-0002kC-J9; Wed, 31 Aug 2022 11:46:36 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:46711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvG-00037l-Ov; Wed, 31 Aug 2022 11:46:36 -0400
Received: by mail-ej1-x62d.google.com with SMTP id bj12so29180090ejb.13;
 Wed, 31 Aug 2022 08:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=JrsI/ne9g59XtZZjXBIVmp2BYTys8MQfr3EVDlgHowE=;
 b=O5upMJzGoLwehtuzGtGQMnkRwGNY+gJQ1jloKKUGioxTCpXxAeinUbmb2+68g0dL57
 py3c4H1GDTwLwHkX+LdLDUrgLk/cvzMf3vQ5gDYj7wS5dIetbsx/KoeEmWb7poIPGuP7
 UrTfzvucXpk3wY+biK8Uu+WoaKiSde4cow1OeSBVQtqG9m427px/2247ckgovF16Rbgs
 IvJim8zEc9CzAYQM92TFm/mGVA344RgLg/r+2aVA0LzV2VOtZ6h1Ve7hOu60bFDkXe9r
 qwD7wJD92fHamaommTmFUUyUFCVg2jka0a7+K/SUGcZ1t1Hi96pGV6IfAz0x+TkwTbUQ
 whQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=JrsI/ne9g59XtZZjXBIVmp2BYTys8MQfr3EVDlgHowE=;
 b=slcFrkcgrf2CVj3njiI7ezv2Zm7pehrLbdWGq7lC7TAaSe9iPt/hHkTKunNPgyt0lF
 zgjq+VT7EGobjKDDqLk5KtKmolM4w8TYqPCJ+HUcpBoOY8/zFewubU5qO8/iBA6/zKsr
 gOnb/6WGqE2ctahUUhiSkKaC6oJxTXExTJ4XG0IteSgtyVrDG8JPct+NC352NYYSPrEj
 4+Sjr/tumCItIYoZDk0UJX3K3xchjUWoZ9Jo74aMBSi2liRAi2ylSdcPKSjf/5wSrSMi
 PmQIPvR0EHioD2H4FapytdVRJmsFtOygva0P0suFH21BCgIZZZeRwBaYeOfzEjDczUNQ
 Ytng==
X-Gm-Message-State: ACgBeo1CnZxkT2xzif+qO48s0c2l3o9KWviFw9aENMhHwvN22ROtxE5e
 gQMQNFqDiBmvRsen7Qp8tJ5sTj/a1i4=
X-Google-Smtp-Source: AA6agR7QcrZ0Vrj1sHYZj7negZeCkfACi739ViP6tJ+bGMKdX94Ew4ctImuF5QcaEyvtSTbX0pH3ww==
X-Received: by 2002:a17:906:cc4c:b0:741:3f8b:1d19 with SMTP id
 mm12-20020a170906cc4c00b007413f8b1d19mr15346775ejb.72.1661960792305; 
 Wed, 31 Aug 2022 08:46:32 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a508ac9000000b00445e930e20esm9252123edk.64.2022.08.31.08.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 08:46:32 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 07/12] hw/isa/vt82c686: Introduce TYPE_VT82C686B_USB_UHCI
 define
Date: Wed, 31 Aug 2022 17:46:00 +0200
Message-Id: <20220831154605.12773-8-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831154605.12773-1-shentey@gmail.com>
References: <20220831154605.12773-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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

Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/mips/fuloong2e.c        | 4 ++--
 hw/ppc/pegasos2.c          | 4 ++--
 hw/usb/vt82c686-uhci-pci.c | 4 ++--
 include/hw/isa/vt82c686.h  | 1 +
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 32605901e7..6b7370f2aa 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -208,8 +208,8 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
     pci_ide_create_devs(dev);
 
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci");
+    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), TYPE_VT82C686B_USB_UHCI);
+    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), TYPE_VT82C686B_USB_UHCI);
 
     dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 8bc528a560..70776558c9 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -169,8 +169,8 @@ static void pegasos2_init(MachineState *machine)
     pci_ide_create_devs(dev);
 
     /* VT8231 function 2-3: USB Ports */
-    pci_create_simple(pci_bus, PCI_DEVFN(12, 2), "vt82c686b-usb-uhci");
-    pci_create_simple(pci_bus, PCI_DEVFN(12, 3), "vt82c686b-usb-uhci");
+    pci_create_simple(pci_bus, PCI_DEVFN(12, 2), TYPE_VT82C686B_USB_UHCI);
+    pci_create_simple(pci_bus, PCI_DEVFN(12, 3), TYPE_VT82C686B_USB_UHCI);
 
     /* VT8231 function 4: Power Management Controller */
     dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_PM);
diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
index 0bf2b72ff0..46a901f56f 100644
--- a/hw/usb/vt82c686-uhci-pci.c
+++ b/hw/usb/vt82c686-uhci-pci.c
@@ -31,7 +31,7 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
 
 static UHCIInfo uhci_info[] = {
     {
-        .name      = "vt82c686b-usb-uhci",
+        .name      = TYPE_VT82C686B_USB_UHCI,
         .vendor_id = PCI_VENDOR_ID_VIA,
         .device_id = PCI_DEVICE_ID_VIA_UHCI,
         .revision  = 0x01,
@@ -45,7 +45,7 @@ static UHCIInfo uhci_info[] = {
 
 static const TypeInfo vt82c686b_usb_uhci_type_info = {
     .parent         = TYPE_UHCI,
-    .name           = "vt82c686b-usb-uhci",
+    .name           = TYPE_VT82C686B_USB_UHCI,
     .class_init     = uhci_data_class_init,
     .class_data     = uhci_info,
 };
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index 87aca3e5bb..e6f6dd4d43 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -5,6 +5,7 @@
 
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
 #define TYPE_VT82C686B_PM "vt82c686b-pm"
+#define TYPE_VT82C686B_USB_UHCI "vt82c686b-usb-uhci"
 #define TYPE_VT8231_ISA "vt8231-isa"
 #define TYPE_VT8231_PM "vt8231-pm"
 #define TYPE_VIA_AC97 "via-ac97"
-- 
2.37.3


