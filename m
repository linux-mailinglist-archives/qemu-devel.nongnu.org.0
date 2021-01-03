Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A412E8E49
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:08:07 +0100 (CET)
Received: from localhost ([::1]:54210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAbe-00052d-Pp
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALL-00033q-D2
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:15 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALJ-0005uG-SJ
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:15 -0500
Received: by mail-wm1-x335.google.com with SMTP id 3so16636582wmg.4
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nOzZTcac2kllEQZs0BxsVCpPfK/RYn4dnLOEe0pRhUU=;
 b=JdRLgVF9+4WGYfgUPblH9CF7aCD8k2deznbeYHdfqemdHTxcTVPjnQwo6UY8UUZClL
 ugtNlUtT99WZTJG7qpe0zUGp7l7fLk1vATcSmyngj5GEjaMsvQzNUwQ8F4hDx+ggW0v9
 qGZED3/BRkiOPcJwpDOBPAlLbuo154mLCoEFuRloro6/f+jxNSZGllW3zwaJ1+ekZG56
 mVawOB13qld7ctQR/eDDZgViyTHnGOSzsehnKvfTj3r4/tt1Xqx+x6K9qjo6Z+CSy19T
 6T8jOUO7xX0JIW4uFO2mwWv+GEd83swTy4Oip19z6uUCN6AwfGakwqkOXiwv9fZwnnye
 gScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nOzZTcac2kllEQZs0BxsVCpPfK/RYn4dnLOEe0pRhUU=;
 b=D6Hf/5xIr9IrjuzaxCh3cQs7lT/3p/XgXs3HIkZRJyVqdEEN1p9hCeGYJxX74Rf38/
 rlzn13MOc7xsAcWJEXblaQE8/n4hJHjk/zaGPiuuggTLQsOVuao1nBBg2ZLwABt0jt0n
 gcH0CbD+VKiipUvGhzR+0zMoJNuuRwJCTfZjmHHN2KqdJCyjtMr42u2c4h2XbZySAnBG
 gxFCvHVK4Q6I/WUeaIbiS2voDznYNgsZvpRRCrWAkRsBDEfNWusBzUdWeB+0U1+N5mhG
 eopOU1C9ea6cuwWygKRq7LldpoHU0pG7WwMIy1iW1gM2AR5UVzKAjOG/XwanlHD8m5iK
 tShA==
X-Gm-Message-State: AOAM530QB9WPJFYH/wfwvlhQhoSenX8+ataRjEAb1OT0GcAJvB2l6EKn
 V6MVjRHKzj6TW94B3mF8oOI2C3Cz7O4=
X-Google-Smtp-Source: ABdhPJy9l+76skRYYb7/m/4rlZBMUTU2PYbqCFQFEOAuSLOQzr97MSD5fzCDNsIbapyN4LiWYvHh2A==
X-Received: by 2002:a1c:1dd4:: with SMTP id
 d203mr24495300wmd.118.1609707072406; 
 Sun, 03 Jan 2021 12:51:12 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id b13sm84101630wrt.31.2021.01.03.12.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:51:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/35] vt82c686: Remove vt82c686b_[am]c97_init() functions
Date: Sun,  3 Jan 2021 21:49:56 +0100
Message-Id: <20210103205021.2837760-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

These are legacy init functions that are just equivalent to directly
calling pci_create_simple so do that instead. Also rename objects to
lower case via-ac97 and via-mc97 matching naming of other devices.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <1c4373c8aeb6c4fb2a8df2c864b0e91a977a3d7b.1609584216.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/isa/vt82c686.h |  4 ++--
 hw/isa/vt82c686.c         | 27 ++++-----------------------
 hw/mips/fuloong2e.c       |  4 ++--
 3 files changed, 8 insertions(+), 27 deletions(-)

diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index f23f45dfb1d..ff80a926dcb 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -3,11 +3,11 @@
 
 
 #define TYPE_VT82C686B_SUPERIO "vt82c686b-superio"
+#define TYPE_VIA_AC97 "via-ac97"
+#define TYPE_VIA_MC97 "via-mc97"
 
 /* vt82c686.c */
 ISABus *vt82c686b_isa_init(PCIBus * bus, int devfn);
-void vt82c686b_ac97_init(PCIBus *bus, int devfn);
-void vt82c686b_mc97_init(PCIBus *bus, int devfn);
 I2CBus *vt82c686b_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
                           qemu_irq sci_irq);
 
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index d40599c7daa..8677a2d212b 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -179,12 +179,6 @@ struct VIAMC97State {
 #define TYPE_VT82C686B_PM "VT82C686B_PM"
 OBJECT_DECLARE_SIMPLE_TYPE(VT686PMState, VT82C686B_PM)
 
-#define TYPE_VIA_MC97 "VIA_MC97"
-OBJECT_DECLARE_SIMPLE_TYPE(VIAMC97State, VIA_MC97)
-
-#define TYPE_VIA_AC97 "VIA_AC97"
-OBJECT_DECLARE_SIMPLE_TYPE(VIAAC97State, VIA_AC97)
-
 static void pm_update_sci(VT686PMState *s)
 {
     int sci_level, pmsts;
@@ -254,10 +248,13 @@ static const VMStateDescription vmstate_acpi = {
 };
 
 /*
- * TODO: vt82c686b_ac97_init() and vt82c686b_mc97_init()
+ * TODO: VIA_AC97 and VIA_MC97
  * just register a PCI device now, functionalities will be implemented later.
  */
 
+OBJECT_DECLARE_SIMPLE_TYPE(VIAMC97State, VIA_MC97)
+OBJECT_DECLARE_SIMPLE_TYPE(VIAAC97State, VIA_AC97)
+
 static void vt82c686b_ac97_realize(PCIDevice *dev, Error **errp)
 {
     VIAAC97State *s = VIA_AC97(dev);
@@ -270,14 +267,6 @@ static void vt82c686b_ac97_realize(PCIDevice *dev, Error **errp)
     pci_set_long(pci_conf + PCI_INTERRUPT_PIN, 0x03);
 }
 
-void vt82c686b_ac97_init(PCIBus *bus, int devfn)
-{
-    PCIDevice *dev;
-
-    dev = pci_new(devfn, TYPE_VIA_AC97);
-    pci_realize_and_unref(dev, bus, &error_fatal);
-}
-
 static void via_ac97_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -314,14 +303,6 @@ static void vt82c686b_mc97_realize(PCIDevice *dev, Error **errp)
     pci_set_long(pci_conf + PCI_INTERRUPT_PIN, 0x03);
 }
 
-void vt82c686b_mc97_init(PCIBus *bus, int devfn)
-{
-    PCIDevice *dev;
-
-    dev = pci_new(devfn, TYPE_VIA_MC97);
-    pci_realize_and_unref(dev, bus, &error_fatal);
-}
-
 static void via_mc97_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 45c596f4fe5..8287e65c52c 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -262,8 +262,8 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     *i2c_bus = vt82c686b_pm_init(pci_bus, PCI_DEVFN(slot, 4), 0xeee1, NULL);
 
     /* Audio support */
-    vt82c686b_ac97_init(pci_bus, PCI_DEVFN(slot, 5));
-    vt82c686b_mc97_init(pci_bus, PCI_DEVFN(slot, 6));
+    pci_create_simple(pci_bus, PCI_DEVFN(slot, 5), TYPE_VIA_AC97);
+    pci_create_simple(pci_bus, PCI_DEVFN(slot, 6), TYPE_VIA_MC97);
 }
 
 /* Network support */
-- 
2.26.2


