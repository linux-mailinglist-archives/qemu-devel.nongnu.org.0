Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48092188261
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 12:42:23 +0100 (CET)
Received: from localhost ([::1]:59158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEAc2-0002ZI-C4
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 07:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43452)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jEAaV-0000N1-3Z
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 07:40:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jEAaT-0001yb-7m
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 07:40:47 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42739)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jEAaS-0001nB-Uc
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 07:40:45 -0400
Received: by mail-wr1-x442.google.com with SMTP id v11so25232679wrm.9
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 04:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UwW4Of4L0vp9KCPhla6GcS2im8yFuLCul7ILXLuzBRg=;
 b=Lwrrr0ZGoxOdmfQbYG/ei6zgi9vn0a7rD+TH2wyduWwR14P+YOFNmPHTBj1RQx/hsC
 9nTiIpl4MS75hJVLBK2r1gyNuWR59sVKOXeffh/eQJjb7rY6V0wy47v5zdq9X81xeaMe
 mbhMUjrkIfNpxG2/1o5zeQidoJVljVnBun52bkHlXXowfvfZdVSCX54TuJfz1n7/9nJL
 Nh+YaQTgurErAdgfNT29m4Jto8Kasf1Cg7y+OucC8hQt/xH9Dun1+WQ8Zi6xEiMNofLl
 grnuijEwtIwuE1LyC7iNyH+PI+aPVnoODZ0gxCjgf5iWXqfiqqgqaZE6zcadmzWt1NBp
 /OXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UwW4Of4L0vp9KCPhla6GcS2im8yFuLCul7ILXLuzBRg=;
 b=MFaOT0mI7o2vJ3A3JuKBBq9cxtc6RN5cQBbYfaabzDxXMrBa9YfNc1iFb8tThKde7G
 SDFJDZ4FeACiH2kdLQND22hLoH7soawyQj8lxo0UddAJ71rs+ovFcABKmjbTCwm1cWg9
 dHq8P9UbaX+zRF86yiztcp5sYPh0N03JHMsQwignDiu7/KAIe/47zItflPzvWSohY9BF
 3ImsgIHJr9poRzOB6A0vBl+WuB/g/ysGBImoEcJCRvrtlUXvoA8QJ4DUwAyLByUaR18L
 /HM6KIilu+KwTKouOAHIXrKxL/Uap+GR8bTJ5Zama3I4PCyWvFfBGUmsOeOxKkHxWk85
 /jQg==
X-Gm-Message-State: ANhLgQ33DxYtqyFLRaKANmoqE3OapeilXAzNUaE6/Ces81zUhnFtHoBB
 uidngNcmh6KdbPUAM7peEmS4bktm7i8X/g==
X-Google-Smtp-Source: ADFU+vs8oUceyNrVpx703z3WSwBN4zha/nhanJLKnjJDrGAybvKVOXwFJi3ZDn5EfPKreaAwllI3qA==
X-Received: by 2002:a5d:6aca:: with SMTP id u10mr5290428wrw.99.1584445243427; 
 Tue, 17 Mar 2020 04:40:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a186sm3577443wmh.33.2020.03.17.04.40.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 04:40:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/11] hw/usb: Add basic i.MX USB Phy support
Date: Tue, 17 Mar 2020 11:40:29 +0000
Message-Id: <20200317114039.26914-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317114039.26914-1-peter.maydell@linaro.org>
References: <20200317114039.26914-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guenter Roeck <linux@roeck-us.net>

Add basic USB PHY support as implemented in i.MX23, i.MX28, i.MX6,
and i.MX7 SoCs.

The only support really needed - at least to boot Linux - is support
for soft reset, which needs to reset various registers to their initial
value. Otherwise, just record register values.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Message-id: 20200313014551.12554-2-linux@roeck-us.net
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/usb/Makefile.objs         |   2 +
 include/hw/usb/imx-usb-phy.h |  53 +++++++++
 hw/usb/imx-usb-phy.c         | 225 +++++++++++++++++++++++++++++++++++
 MAINTAINERS                  |   2 +
 hw/arm/Kconfig               |   1 +
 hw/usb/Kconfig               |   5 +
 6 files changed, 288 insertions(+)
 create mode 100644 include/hw/usb/imx-usb-phy.h
 create mode 100644 hw/usb/imx-usb-phy.c

diff --git a/hw/usb/Makefile.objs b/hw/usb/Makefile.objs
index 2b108689370..66835e5bf73 100644
--- a/hw/usb/Makefile.objs
+++ b/hw/usb/Makefile.objs
@@ -61,3 +61,5 @@ common-obj-$(CONFIG_XEN) += xen-usb.o
 xen-usb.o-cflags := $(LIBUSB_CFLAGS)
 xen-usb.o-libs := $(LIBUSB_LIBS)
 endif
+
+common-obj-$(CONFIG_IMX_USBPHY) += imx-usb-phy.o
diff --git a/include/hw/usb/imx-usb-phy.h b/include/hw/usb/imx-usb-phy.h
new file mode 100644
index 00000000000..07f0235d101
--- /dev/null
+++ b/include/hw/usb/imx-usb-phy.h
@@ -0,0 +1,53 @@
+#ifndef IMX_USB_PHY_H
+#define IMX_USB_PHY_H
+
+#include "hw/sysbus.h"
+#include "qemu/bitops.h"
+
+enum IMXUsbPhyRegisters {
+    USBPHY_PWD,
+    USBPHY_PWD_SET,
+    USBPHY_PWD_CLR,
+    USBPHY_PWD_TOG,
+    USBPHY_TX,
+    USBPHY_TX_SET,
+    USBPHY_TX_CLR,
+    USBPHY_TX_TOG,
+    USBPHY_RX,
+    USBPHY_RX_SET,
+    USBPHY_RX_CLR,
+    USBPHY_RX_TOG,
+    USBPHY_CTRL,
+    USBPHY_CTRL_SET,
+    USBPHY_CTRL_CLR,
+    USBPHY_CTRL_TOG,
+    USBPHY_STATUS,
+    USBPHY_DEBUG = 0x14,
+    USBPHY_DEBUG_SET,
+    USBPHY_DEBUG_CLR,
+    USBPHY_DEBUG_TOG,
+    USBPHY_DEBUG0_STATUS,
+    USBPHY_DEBUG1 = 0x1c,
+    USBPHY_DEBUG1_SET,
+    USBPHY_DEBUG1_CLR,
+    USBPHY_DEBUG1_TOG,
+    USBPHY_VERSION,
+    USBPHY_MAX
+};
+
+#define USBPHY_CTRL_SFTRST BIT(31)
+
+#define TYPE_IMX_USBPHY "imx.usbphy"
+#define IMX_USBPHY(obj) OBJECT_CHECK(IMXUSBPHYState, (obj), TYPE_IMX_USBPHY)
+
+typedef struct IMXUSBPHYState {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /* <public> */
+    MemoryRegion iomem;
+
+    uint32_t usbphy[USBPHY_MAX];
+} IMXUSBPHYState;
+
+#endif /* IMX_USB_PHY_H */
diff --git a/hw/usb/imx-usb-phy.c b/hw/usb/imx-usb-phy.c
new file mode 100644
index 00000000000..e705a03a1fc
--- /dev/null
+++ b/hw/usb/imx-usb-phy.c
@@ -0,0 +1,225 @@
+/*
+ * i.MX USB PHY
+ *
+ * Copyright (c) 2020 Guenter Roeck <linux@roeck-us.net>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ * We need to implement basic reset control in the PHY control register.
+ * For everything else, it is sufficient to set whatever is written.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/usb/imx-usb-phy.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+
+static const VMStateDescription vmstate_imx_usbphy = {
+    .name = TYPE_IMX_USBPHY,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(usbphy, IMXUSBPHYState, USBPHY_MAX),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void imx_usbphy_softreset(IMXUSBPHYState *s)
+{
+    s->usbphy[USBPHY_PWD] = 0x001e1c00;
+    s->usbphy[USBPHY_TX] = 0x10060607;
+    s->usbphy[USBPHY_RX] = 0x00000000;
+    s->usbphy[USBPHY_CTRL] = 0xc0200000;
+}
+
+static void imx_usbphy_reset(DeviceState *dev)
+{
+    IMXUSBPHYState *s = IMX_USBPHY(dev);
+
+    s->usbphy[USBPHY_STATUS] = 0x00000000;
+    s->usbphy[USBPHY_DEBUG] = 0x7f180000;
+    s->usbphy[USBPHY_DEBUG0_STATUS] = 0x00000000;
+    s->usbphy[USBPHY_DEBUG1] = 0x00001000;
+    s->usbphy[USBPHY_VERSION] = 0x04020000;
+
+    imx_usbphy_softreset(s);
+}
+
+static uint64_t imx_usbphy_read(void *opaque, hwaddr offset, unsigned size)
+{
+    IMXUSBPHYState *s = (IMXUSBPHYState *)opaque;
+    uint32_t index = offset >> 2;
+    uint32_t value;
+
+    switch (index) {
+    case USBPHY_PWD_SET:
+    case USBPHY_TX_SET:
+    case USBPHY_RX_SET:
+    case USBPHY_CTRL_SET:
+    case USBPHY_DEBUG_SET:
+    case USBPHY_DEBUG1_SET:
+        /*
+         * All REG_NAME_SET register access are in fact targeting the
+         * REG_NAME register.
+         */
+        value = s->usbphy[index - 1];
+        break;
+    case USBPHY_PWD_CLR:
+    case USBPHY_TX_CLR:
+    case USBPHY_RX_CLR:
+    case USBPHY_CTRL_CLR:
+    case USBPHY_DEBUG_CLR:
+    case USBPHY_DEBUG1_CLR:
+        /*
+         * All REG_NAME_CLR register access are in fact targeting the
+         * REG_NAME register.
+         */
+        value = s->usbphy[index - 2];
+        break;
+    case USBPHY_PWD_TOG:
+    case USBPHY_TX_TOG:
+    case USBPHY_RX_TOG:
+    case USBPHY_CTRL_TOG:
+    case USBPHY_DEBUG_TOG:
+    case USBPHY_DEBUG1_TOG:
+        /*
+         * All REG_NAME_TOG register access are in fact targeting the
+         * REG_NAME register.
+         */
+        value = s->usbphy[index - 3];
+        break;
+    default:
+        value = s->usbphy[index];
+        break;
+    }
+    return (uint64_t)value;
+}
+
+static void imx_usbphy_write(void *opaque, hwaddr offset, uint64_t value,
+                             unsigned size)
+{
+    IMXUSBPHYState *s = (IMXUSBPHYState *)opaque;
+    uint32_t index = offset >> 2;
+
+    switch (index) {
+    case USBPHY_CTRL:
+        s->usbphy[index] = value;
+        if (value & USBPHY_CTRL_SFTRST) {
+            imx_usbphy_softreset(s);
+        }
+        break;
+    case USBPHY_PWD:
+    case USBPHY_TX:
+    case USBPHY_RX:
+    case USBPHY_STATUS:
+    case USBPHY_DEBUG:
+    case USBPHY_DEBUG1:
+        s->usbphy[index] = value;
+        break;
+    case USBPHY_CTRL_SET:
+        s->usbphy[index - 1] |= value;
+        if (value & USBPHY_CTRL_SFTRST) {
+            imx_usbphy_softreset(s);
+        }
+        break;
+    case USBPHY_PWD_SET:
+    case USBPHY_TX_SET:
+    case USBPHY_RX_SET:
+    case USBPHY_DEBUG_SET:
+    case USBPHY_DEBUG1_SET:
+        /*
+         * All REG_NAME_SET register access are in fact targeting the
+         * REG_NAME register. So we change the value of the REG_NAME
+         * register, setting bits passed in the value.
+         */
+        s->usbphy[index - 1] |= value;
+        break;
+    case USBPHY_PWD_CLR:
+    case USBPHY_TX_CLR:
+    case USBPHY_RX_CLR:
+    case USBPHY_CTRL_CLR:
+    case USBPHY_DEBUG_CLR:
+    case USBPHY_DEBUG1_CLR:
+        /*
+         * All REG_NAME_CLR register access are in fact targeting the
+         * REG_NAME register. So we change the value of the REG_NAME
+         * register, unsetting bits passed in the value.
+         */
+        s->usbphy[index - 2] &= ~value;
+        break;
+    case USBPHY_CTRL_TOG:
+        s->usbphy[index - 3] ^= value;
+        if ((value & USBPHY_CTRL_SFTRST) &&
+            (s->usbphy[index - 3] & USBPHY_CTRL_SFTRST)) {
+            imx_usbphy_softreset(s);
+        }
+        break;
+    case USBPHY_PWD_TOG:
+    case USBPHY_TX_TOG:
+    case USBPHY_RX_TOG:
+    case USBPHY_DEBUG_TOG:
+    case USBPHY_DEBUG1_TOG:
+        /*
+         * All REG_NAME_TOG register access are in fact targeting the
+         * REG_NAME register. So we change the value of the REG_NAME
+         * register, toggling bits passed in the value.
+         */
+        s->usbphy[index - 3] ^= value;
+        break;
+    default:
+        /* Other registers are read-only */
+        break;
+    }
+}
+
+static const struct MemoryRegionOps imx_usbphy_ops = {
+    .read = imx_usbphy_read,
+    .write = imx_usbphy_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        /*
+         * Our device would not work correctly if the guest was doing
+         * unaligned access. This might not be a limitation on the real
+         * device but in practice there is no reason for a guest to access
+         * this device unaligned.
+         */
+        .min_access_size = 4,
+        .max_access_size = 4,
+        .unaligned = false,
+    },
+};
+
+static void imx_usbphy_realize(DeviceState *dev, Error **errp)
+{
+    IMXUSBPHYState *s = IMX_USBPHY(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &imx_usbphy_ops, s,
+                          "imx-usbphy", 0x1000);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+}
+
+static void imx_usbphy_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = imx_usbphy_reset;
+    dc->vmsd = &vmstate_imx_usbphy;
+    dc->desc = "i.MX USB PHY Module";
+    dc->realize = imx_usbphy_realize;
+}
+
+static const TypeInfo imx_usbphy_info = {
+    .name          = TYPE_IMX_USBPHY,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IMXUSBPHYState),
+    .class_init    = imx_usbphy_class_init,
+};
+
+static void imx_usbphy_register_types(void)
+{
+    type_register_static(&imx_usbphy_info);
+}
+
+type_init(imx_usbphy_register_types)
diff --git a/MAINTAINERS b/MAINTAINERS
index 32867bc6367..f8741cabdc5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -764,6 +764,8 @@ F: hw/arm/sabrelite.c
 F: hw/arm/fsl-imx6.c
 F: hw/misc/imx6_*.c
 F: hw/ssi/imx_spi.c
+F: hw/usb/imx-usb-phy.c
+F: include/hw/usb/imx-usb-phy.h
 F: include/hw/arm/fsl-imx6.h
 F: include/hw/misc/imx6_*.h
 F: include/hw/ssi/imx_spi.h
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e5a876c8d14..188419dc1e7 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -373,6 +373,7 @@ config FSL_IMX6
     select IMX
     select IMX_FEC
     select IMX_I2C
+    select IMX_USBPHY
     select SDHCI
 
 config ASPEED_SOC
diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 5e70ed5f7b8..464348ba142 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -91,3 +91,8 @@ config USB_STORAGE_MTP
     bool
     default y
     depends on USB
+
+config IMX_USBPHY
+    bool
+    default y
+    depends on USB
-- 
2.20.1


