Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F4F2E8E3C
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:00:28 +0100 (CET)
Received: from localhost ([::1]:59584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAUF-0003eU-TC
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALe-0003Qh-9w
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:34 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALc-00060S-Pb
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:34 -0500
Received: by mail-wr1-x433.google.com with SMTP id t16so29476345wra.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hJrzfFBwJziaAyqYy93hx4DlRm1EQlMzThmIeVx9X0A=;
 b=LEzfXUC45FMtcebYOuVRq1Jo+R8lhf0lw5pJWEwu/C4tCpX54p9IXTzNHo+//IgN6y
 3p5LI2TSpuUl6Gf5vrLuKkwzUaGXKK8ACKVFGnKlD3fwPLhZpYRb/c1A1/NozwsFg9M8
 AnEWS014d+ImLTuIRDScDIZw8hFqZGxV7AmzT3ko2tdC8fMcAeBkj659emHCWEqM2ftw
 aHkPhINmH89weeOQmR762qc6Ym/7syxnzE/j/4t4ZDyRwglHjGbvOVAr4h69S3nV91X/
 WUr9b7D78bP9reIhvCdtIdjmF4knd0d/tyhsaH4Ij9L28W8xSY/IJYV9MH6elqirfF5X
 KjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hJrzfFBwJziaAyqYy93hx4DlRm1EQlMzThmIeVx9X0A=;
 b=eQvmuADGXQcV6PNsMxFXQxm6tnMLB3T23JOlqMrK55ADIG7KawlgImWcpJwnyhQEpM
 AyUr4M35X0nBbQTsqXbreZ4fcWnJRdkBwkK79ZMMZHawZJ+NWfjVk9PvWMrcrGTzPAlT
 FpJ5i/OjnpuAJVmmIXcbSllV0MZVvAePuZgYsPAXqbh7F7l1NWm+vH54yH6torC17nof
 WoCwf76SoxbF32+SpavYd85vTOua1uC/r4ZsiJAeokVqKSJIzt3hNxd5QwOG0O8fTjqW
 pd3zxzziY3vOcXM/wjpZSTjQo8g9ZaHaG4Q7Bv7W9BxZt3SYmfRIdyxyl0pcTFQ6SbPL
 dVLQ==
X-Gm-Message-State: AOAM531mUruYT8Dng6HCFxoTFOTxKDLSipkiZdicnvte9nS1zZfYlWcH
 rQWRscgPfcutOVfV2OtgYYDAS/8+bpU=
X-Google-Smtp-Source: ABdhPJzVnmfMY/Mea1XJxIY4fh7AmOBVbzlb1i6AM9tyMm6ujJCTTdmrQoeO2VjVRxXHcAc+jbLzuA==
X-Received: by 2002:adf:f58a:: with SMTP id f10mr80219954wro.338.1609707091258; 
 Sun, 03 Jan 2021 12:51:31 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id m11sm29066988wmi.16.2021.01.03.12.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:51:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/35] vt82c686: Remove legacy vt82c686b_pm_init() function
Date: Sun,  3 Jan 2021 21:50:00 +0100
Message-Id: <20210103205021.2837760-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

Remove legacy vt82c686b_pm_init() function and also rename
VT82C686B_PM type name to match other device names.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <a70982b32f11222d335385b90749abb6cf2e2cce.1609584216.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/isa/vt82c686.h |  5 +----
 hw/isa/vt82c686.c         | 18 ------------------
 hw/mips/fuloong2e.c       |  5 ++++-
 3 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index 8d2d276fe16..5b0a1ffe725 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -3,11 +3,8 @@
 
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
 #define TYPE_VT82C686B_SUPERIO "vt82c686b-superio"
+#define TYPE_VT82C686B_PM "vt82c686b-pm"
 #define TYPE_VIA_AC97 "via-ac97"
 #define TYPE_VIA_MC97 "via-mc97"
 
-/* vt82c686.c */
-I2CBus *vt82c686b_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                          qemu_irq sci_irq);
-
 #endif
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 2912c253dca..cd87ec01039 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -12,7 +12,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/isa/vt82c686.h"
-#include "hw/i2c/i2c.h"
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/isa/isa.h"
@@ -167,7 +166,6 @@ struct VT686PMState {
     uint32_t smb_io_base;
 };
 
-#define TYPE_VT82C686B_PM "VT82C686B_PM"
 OBJECT_DECLARE_SIMPLE_TYPE(VT686PMState, VT82C686B_PM)
 
 static void pm_update_sci(VT686PMState *s)
@@ -271,22 +269,6 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
     acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2);
 }
 
-I2CBus *vt82c686b_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                          qemu_irq sci_irq)
-{
-    PCIDevice *dev;
-    VT686PMState *s;
-
-    dev = pci_new(devfn, TYPE_VT82C686B_PM);
-    qdev_prop_set_uint32(&dev->qdev, "smb_io_base", smb_io_base);
-
-    s = VT82C686B_PM(dev);
-
-    pci_realize_and_unref(dev, bus, &error_fatal);
-
-    return s->smb.smbus;
-}
-
 static Property via_pm_properties[] = {
     DEFINE_PROP_UINT32("smb_io_base", VT686PMState, smb_io_base, 0),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 435f0e5be5b..e5d08669069 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -261,7 +261,10 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci");
 
-    *i2c_bus = vt82c686b_pm_init(pci_bus, PCI_DEVFN(slot, 4), 0xeee1, NULL);
+    dev = pci_new(PCI_DEVFN(slot, 4), TYPE_VT82C686B_PM);
+    qdev_prop_set_uint32(DEVICE(dev), "smb_io_base", 0xeee1);
+    pci_realize_and_unref(dev, pci_bus, &error_fatal);
+    *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
 
     /* Audio support */
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 5), TYPE_VIA_AC97);
-- 
2.26.2


