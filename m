Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E97BF7FE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 19:55:36 +0200 (CEST)
Received: from localhost ([::1]:41914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDXzL-0004kJ-4k
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 13:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgN-0004bq-Tl
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 13:36:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgM-0002zX-Ki
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 13:35:59 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45998)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iDXgM-0002ye-Ed; Thu, 26 Sep 2019 13:35:58 -0400
Received: by mail-wr1-f68.google.com with SMTP id r5so3410353wrm.12;
 Thu, 26 Sep 2019 10:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2A6n6OxqtYP6skSpTWQ0p/w/OuHJVeXJEFVCqu8qp6A=;
 b=b3VjajSM/wpGS76V9gYkpY7MKgJ0f+zLxQ44s6D2eZWyZNlH9l24dIjuhnyararZ+B
 Yz/P1zxJCesU9jdaaFpIOC4pOWx4OB5DelYp1iovP+mp+FZV6fPJseAFVrsSjtFr3Dy6
 2FkWZPToxLzcX0BE7NJCTtVjGvNt9exMt6N2Q7TUhVtBf01AdpOAJpKHdhnFiCZYvaoh
 jfV53i1KXIIOJDl/JpLXwKMq+YibeATL8Ftwq87T1V8DuiUZHMHcUkRZmFa88XY6GpMM
 EeIe6Fr1Lu0t52QOmWamQgTkIu1rYR2yIGbB/wumt3yp3YKuYcPfvhPod8Ul+9aVniS/
 YSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2A6n6OxqtYP6skSpTWQ0p/w/OuHJVeXJEFVCqu8qp6A=;
 b=pofGOUvOEOznygGXlg3OSmEcu1b23n8XGmi0GFUdIc26AP3S2S3+nJx1kRWGFQEnBV
 3CrH27Gm+kbCwVMCovYXJLm8JEXBJxpnEGIYBI/YM62BPCg4U0cZMBzFOc3Zcqd0Pp2I
 Dwv+1Xu2grEIWfWOTJZ7ZSDMPau80p3vZzh6KtcX5ehywQ7lmYrnsIPChZWEVooYl/wJ
 RfkL2LuLzd2qnrd6uMwGL9SrYyfHVl0HKCKSf8ePRyn89TMdpWBkvWszsUw+Dt1hSN75
 6nmyET+L+rgwYiWygU4EgYqrnZi0c3pyJ1mW23Q3Px10bBBN453eJ6NzePhE1DSI4DuW
 51Sg==
X-Gm-Message-State: APjAAAWxK912hwwjb5QjbdXbPClnUrIApLjzK2qr5ykE86kMzNV87sin
 CEyevbFORq4ej0PSqYB1bpwmSS4bAbk=
X-Google-Smtp-Source: APXvYqwjoJEc3zdLJa7luG3NF4TFcwEe58AYFfasQdWH9vZIwnQw0OptOFy8YrCsVmSk3rDGK8diYQ==
X-Received: by 2002:a5d:5642:: with SMTP id j2mr3981351wrw.345.1569519296192; 
 Thu, 26 Sep 2019 10:34:56 -0700 (PDT)
Received: from x1w.redhat.com (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id b186sm9918980wmd.16.2019.09.26.10.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:34:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/19] hw/arm/bcm2835_peripherals: Use the SYS_timer
Date: Thu, 26 Sep 2019 19:34:19 +0200
Message-Id: <20190926173428.10713-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926173428.10713-1-f4bug@amsat.org>
References: <20190926173428.10713-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Zolt=C3=A1n=20Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connect the recently added SYS_timer.
Now U-Boot does not hang anymore polling a free running counter
stuck at 0.
This timer is also used by the Linux kernel thermal subsystem.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c         | 21 ++++++++++++++++++++-
 include/hw/arm/bcm2835_peripherals.h |  3 ++-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 70bf927a02..965f4c1f3d 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -58,6 +58,10 @@ static void bcm2835_peripherals_init(Object *obj)
     /* Interrupt Controller */
     sysbus_init_child_obj(obj, "ic", &s->ic, sizeof(s->ic), TYPE_BCM2835_IC);
 
+    /* SYS Timer */
+    sysbus_init_child_obj(obj, "systimer", &s->systmr, sizeof(s->systmr),
+                          TYPE_BCM2835_SYSTIMER);
+
     /* UART0 */
     sysbus_init_child_obj(obj, "uart0", &s->uart0, sizeof(s->uart0),
                           TYPE_PL011);
@@ -171,6 +175,22 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ic), 0));
     sysbus_pass_irq(SYS_BUS_DEVICE(s), SYS_BUS_DEVICE(&s->ic));
 
+    /* Sys Timer */
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    object_property_set_bool(OBJECT(&s->systmr), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_add_subregion(&s->peri_mr, ST_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systmr), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 0,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
+                               INTERRUPT_ARM_TIMER));
+
     /* UART0 */
     qdev_prop_set_chr(DEVICE(&s->uart0), "chardev", serial_hd(0));
     object_property_set_bool(OBJECT(&s->uart0), true, "realized", &err);
@@ -352,7 +372,6 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     }
 
     create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x40);
-    create_unimp(s, &s->systmr, "bcm2835-systimer", ST_OFFSET, 0x20);
     create_unimp(s, &s->cprman, "bcm2835-cprman", CPRMAN_OFFSET, 0x1000);
     create_unimp(s, &s->a2w, "bcm2835-a2w", A2W_OFFSET, 0x1000);
     create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index be7ad9b499..5b9fc89453 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -24,6 +24,7 @@
 #include "hw/sd/sdhci.h"
 #include "hw/sd/bcm2835_sdhost.h"
 #include "hw/gpio/bcm2835_gpio.h"
+#include "hw/timer/bcm2835_systmr.h"
 #include "hw/misc/unimp.h"
 
 #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
@@ -39,7 +40,7 @@ typedef struct BCM2835PeripheralState {
     MemoryRegion ram_alias[4];
     qemu_irq irq, fiq;
 
-    UnimplementedDeviceState systmr;
+    BCM2835SysTimerState systmr;
     UnimplementedDeviceState armtmr;
     UnimplementedDeviceState cprman;
     UnimplementedDeviceState a2w;
-- 
2.20.1


