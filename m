Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704175A82AE
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 18:07:51 +0200 (CEST)
Received: from localhost ([::1]:52252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTQFp-0004Cv-V7
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 12:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvM-0002pP-28; Wed, 31 Aug 2022 11:46:40 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:38704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvJ-00038k-1e; Wed, 31 Aug 2022 11:46:38 -0400
Received: by mail-ed1-x52a.google.com with SMTP id a36so15132709edf.5;
 Wed, 31 Aug 2022 08:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Jlk6oFJAY+l1qPvv1++yQk3ViQamm2gz/v6Qx4/s2dE=;
 b=UImNWLK7vk3fDrDdjw6vcsIJa6sdOzTDCg/5w9VPo9ju8F7ebvEHNd29jkPAe35F1b
 bhwN587iJmjOLSMb2m1/ooNyccLOd7Gab22zBdvht5rV/NLNiqo86WUCHbeudOFazUBs
 W4db/csLGQs4I5Nmf9McKTmHkHOaZa2S+6lp8fmAhhHJpMit0KH2MYWawpwmiqgaB3PD
 ad42X7Pm9UdfFxkHJeC/19NN0ZBVKLJIAQgG3wcV+suoJvyhLLPfXGjFxkqcLT967RSl
 3Yy3or4l4tgQcyLVBpqBsWvajbF6ICk7ppzcUGnTK78aQsfXD0tnMjppvG3nJXTLN12c
 KzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Jlk6oFJAY+l1qPvv1++yQk3ViQamm2gz/v6Qx4/s2dE=;
 b=Q5jOcYVDTxamIWvGzMiS0iP3iWbz/6Rp5UiBwCCy1BiOPC2a8NTdJ1nSJvi8Uc+JLf
 AHpBZJ6C7mC3y2Ia739/DKihn9yGTSMng77veglyQq6a0uF/ILde/4PDyH9dd/NMAbdw
 MySZLmKDno10Y1UPGUg8KYgJ1ygVkaCfSo1sHaicsxu3uLH1fjK6/qIw+KzTY0A/0SIP
 hGq7AxkcTjmI7XBk3pcyhQO7pzK+ZTAqWpM/e+OkdiYNMYnZabO0NesENOOH72OuEoeD
 k+260lrhAgbBJZjD4y8VHf+FGdHlvcsGIKOgFlihW8LNDQPEHrE5+T9rMD8yfXNFnOpj
 qUWw==
X-Gm-Message-State: ACgBeo1JhJJgEkkILLfZt+J2Te8Mw5899m86U6UHF/5GaWKpLDU24wAD
 FjmsbYh27/+85FJvOLdL99dO/NW4z4o=
X-Google-Smtp-Source: AA6agR6NhBWHuSqPd12HXvFM4oYU6qhEGBdoeMjsSeT+/UiVgGvuXzKiHD3U6L3utMYcOnsztivkNA==
X-Received: by 2002:a05:6402:524c:b0:43e:aba4:a42d with SMTP id
 t12-20020a056402524c00b0043eaba4a42dmr25163156edd.328.1661960794768; 
 Wed, 31 Aug 2022 08:46:34 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a508ac9000000b00445e930e20esm9252123edk.64.2022.08.31.08.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 08:46:34 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 09/12] hw/isa/vt82c686: Instantiate PM function in host
 device
Date: Wed, 31 Aug 2022 17:46:02 +0200
Message-Id: <20220831154605.12773-10-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831154605.12773-1-shentey@gmail.com>
References: <20220831154605.12773-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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

The PM controller has activity bits which monitor activity of other
built-in devices in the host device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c         | 13 +++++++++++++
 hw/mips/fuloong2e.c       |  2 +-
 hw/ppc/pegasos2.c         |  3 +--
 include/hw/isa/vt82c686.h |  2 --
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index f05fd9948a..d048607079 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -250,6 +250,8 @@ static const ViaPMInitInfo vt82c686b_pm_init_info = {
     .device_id = PCI_DEVICE_ID_VIA_82C686B_PM,
 };
 
+#define TYPE_VT82C686B_PM "vt82c686b-pm"
+
 static const TypeInfo vt82c686b_pm_info = {
     .name          = TYPE_VT82C686B_PM,
     .parent        = TYPE_VIA_PM,
@@ -261,6 +263,8 @@ static const ViaPMInitInfo vt8231_pm_init_info = {
     .device_id = PCI_DEVICE_ID_VIA_8231_PM,
 };
 
+#define TYPE_VT8231_PM "vt8231-pm"
+
 static const TypeInfo vt8231_pm_info = {
     .name          = TYPE_VT8231_PM,
     .parent        = TYPE_VIA_PM,
@@ -548,6 +552,7 @@ struct ViaISAState {
     ViaSuperIOState via_sio;
     PCIIDEState ide;
     UHCIState uhci[2];
+    ViaPMState pm;
 };
 
 static const VMStateDescription vmstate_via = {
@@ -641,6 +646,12 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
             return;
         }
     }
+
+    /* Function 4: Power Management */
+    qdev_prop_set_int32(DEVICE(&s->pm), "addr", d->devfn + 4);
+    if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
+        return;
+    }
 }
 
 /* TYPE_VT82C686B_ISA */
@@ -683,6 +694,7 @@ static void vt82c686b_init(Object *obj)
     ViaISAState *s = VIA_ISA(obj);
 
     object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT82C686B_SUPERIO);
+    object_initialize_child(obj, "pm", &s->pm, TYPE_VT82C686B_PM);
 }
 
 static void vt82c686b_class_init(ObjectClass *klass, void *data)
@@ -746,6 +758,7 @@ static void vt8231_init(Object *obj)
     ViaISAState *s = VIA_ISA(obj);
 
     object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT8231_SUPERIO);
+    object_initialize_child(obj, "pm", &s->pm, TYPE_VT8231_PM);
 }
 
 static void vt8231_class_init(ObjectClass *klass, void *data)
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index dc92223b76..377108d313 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -208,7 +208,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
     pci_ide_create_devs(dev);
 
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
+    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
 
     /* Audio support */
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 85cca6f7a6..e32944ee2b 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -168,8 +168,7 @@ static void pegasos2_init(MachineState *machine)
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
     pci_ide_create_devs(dev);
 
-    /* VT8231 function 4: Power Management Controller */
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_PM);
+    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
     i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
     spd_data = spd_data_generate(DDR, machine->ram_size);
     smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index e6f6dd4d43..eaa07881c5 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -4,10 +4,8 @@
 #include "hw/pci/pci.h"
 
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
-#define TYPE_VT82C686B_PM "vt82c686b-pm"
 #define TYPE_VT82C686B_USB_UHCI "vt82c686b-usb-uhci"
 #define TYPE_VT8231_ISA "vt8231-isa"
-#define TYPE_VT8231_PM "vt8231-pm"
 #define TYPE_VIA_AC97 "via-ac97"
 #define TYPE_VIA_IDE "via-ide"
 #define TYPE_VIA_MC97 "via-mc97"
-- 
2.37.3


