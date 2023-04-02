Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810D86D3985
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:46:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1kl-0001Zr-U4; Sun, 02 Apr 2023 13:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1pj0xJ-0006WF-Bo
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 12:53:25 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1pj0xF-0001uj-0P
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 12:53:25 -0400
Received: by mail-wr1-x432.google.com with SMTP id q19so23940241wrc.5
 for <qemu-devel@nongnu.org>; Sun, 02 Apr 2023 09:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680454397;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JFU3OcGNXq0ws12Ay+1HOv9McddUtSFjAFRXJpsqf3A=;
 b=ZTpAojtOBIrQrBBzHGaB3NAKTCFutV8EldIIn+g3LuI2ZGrGYpzSevBkls4WXt9CN3
 CZiLc3u1sA2T1ovnnNuEyU/maQ/8W+fghnmJ5X0pwZNBY4QT4TnwJfevxn9S6RieC1fJ
 VQ8SbXkXzfdcsl09iHm4uXIB0IOgkWhnXSJ+Mme9nnAv+NIB2lL5UpWz0JOBRkLmfORG
 0cyEIOKn/Y8tiwdwnNbtxQH17NpgTdU1FKc0LUwFg2hm8JeDZMyDdDcVjUdySIkU2Qp6
 BQKsFsel9doGpGSlPgMsG9WGX5TeSEPID6bexKDWC7Ba07XWS3veiierQPFefeqjv/D5
 JLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680454397;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JFU3OcGNXq0ws12Ay+1HOv9McddUtSFjAFRXJpsqf3A=;
 b=yE/OVzG9CDKEqt7Uu5FVwNNmAoI1xOUrm/YWGRXQhrxvEEcTmglNjQBHLzRd11Q9EP
 oyOEjleUlwHkth42lYjcw8+vzmPft80ax5aT/QZY6ufbY5YmYWmnHwqYwtQSbaoTgeh+
 mWVKZg299Gsp7oyPRAU4xaihKkK5OuRBk3KHnUKtHiRjoG54QB6OhZoapjFvUWiAOhTu
 2iTvGD+bY/R3qyVmPK0urpKA/GcbNsc3CfcMaoo4JYOXmQ8JADbr5o/BJIqcyTMdTOh3
 Lo61ZVKg8729eVcPm7ekh2LNBKGULgHEAWubCfv45eHeZa5gYZk9UtiNLyA1yl/k8+Rp
 dCRg==
X-Gm-Message-State: AAQBX9eBT9M8Cdsxkq4VG4linuC8DEtmxuvosuT0qhFaiWxHYkva50Y/
 Hbg4sXAEuaZuxu7+oXOQnMEoFHyQDns=
X-Google-Smtp-Source: AKy350Y7t+NN9rtdb3g6rOgoptROTSgO1oXQOdJS+HwU+ArlTg2KB6SP7gFKBazBhpQyGWz0E13sng==
X-Received: by 2002:a5d:604a:0:b0:2e4:aa42:7881 with SMTP id
 j10-20020a5d604a000000b002e4aa427881mr9400739wrt.49.1680454396360; 
 Sun, 02 Apr 2023 09:53:16 -0700 (PDT)
Received: from auriga-VirtualBox.. (m90-131-38-144.cust.tele2.lt.
 [90.131.38.144]) by smtp.gmail.com with ESMTPSA id
 e5-20020a05600c218500b003ed243222adsm9486193wme.42.2023.04.02.09.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Apr 2023 09:53:15 -0700 (PDT)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-devel@nongnu.org
Cc: Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH] Make bootable RPi4B model
Date: Sun,  2 Apr 2023 19:53:06 +0300
Message-Id: <20230402165306.137092-1-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=serg.oker@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 02 Apr 2023 13:44:30 -0400
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 configs/devices/aarch64-softmmu/default.mak |   1 +
 hw/arm/Kconfig                              |   7 +
 hw/arm/bcm2835_peripherals.c                | 218 ++++++----
 hw/arm/bcm2836.c                            | 129 +++---
 hw/arm/bcm2838.c                            | 294 ++++++++++++++
 hw/arm/bcm2838_pcie.c                       | 300 ++++++++++++++
 hw/arm/bcm2838_peripherals.c                | 262 ++++++++++++
 hw/arm/meson.build                          |   6 +
 hw/arm/raspi.c                              | 128 +++---
 hw/arm/raspi4b.c                            | 232 +++++++++++
 hw/arm/trace-events                         |   6 +
 hw/gpio/bcm2838_gpio.c                      | 395 ++++++++++++++++++
 hw/gpio/meson.build                         |   1 +
 hw/misc/bcm2835_property.c                  | 318 ++++++++++++---
 hw/misc/bcm2838_rng200.c                    | 421 ++++++++++++++++++++
 hw/misc/bcm2838_thermal.c                   |  97 +++++
 hw/misc/meson.build                         |   4 +
 hw/misc/trace-events                        |  10 +
 include/hw/arm/bcm2835_peripherals.h        |  29 +-
 include/hw/arm/bcm2836.h                    |  30 +-
 include/hw/arm/bcm2838.h                    |  26 ++
 include/hw/arm/bcm2838_pcie.h               |  67 ++++
 include/hw/arm/bcm2838_peripherals.h        |  56 +++
 include/hw/arm/raspi4b_platform.h           |  54 +++
 include/hw/arm/raspi_platform.h             |  34 ++
 include/hw/display/bcm2835_fb.h             |   2 +
 include/hw/gpio/bcm2838_gpio.h              |  45 +++
 include/hw/misc/bcm2838_rng200.h            |  77 ++++
 include/hw/misc/bcm2838_thermal.h           |  24 ++
 include/hw/misc/raspberrypi-fw-defs.h       | 169 ++++++++
 30 files changed, 3175 insertions(+), 267 deletions(-)
 create mode 100644 hw/arm/bcm2838.c
 create mode 100644 hw/arm/bcm2838_pcie.c
 create mode 100644 hw/arm/bcm2838_peripherals.c
 create mode 100644 hw/arm/raspi4b.c
 create mode 100644 hw/gpio/bcm2838_gpio.c
 create mode 100644 hw/misc/bcm2838_rng200.c
 create mode 100644 hw/misc/bcm2838_thermal.c
 create mode 100644 include/hw/arm/bcm2838.h
 create mode 100644 include/hw/arm/bcm2838_pcie.h
 create mode 100644 include/hw/arm/bcm2838_peripherals.h
 create mode 100644 include/hw/arm/raspi4b_platform.h
 create mode 100644 include/hw/gpio/bcm2838_gpio.h
 create mode 100644 include/hw/misc/bcm2838_rng200.h
 create mode 100644 include/hw/misc/bcm2838_thermal.h
 create mode 100644 include/hw/misc/raspberrypi-fw-defs.h

diff --git a/configs/devices/aarch64-softmmu/default.mak b/configs/devices/aarch64-softmmu/default.mak
index cf43ac8da1..3575d70f21 100644
--- a/configs/devices/aarch64-softmmu/default.mak
+++ b/configs/devices/aarch64-softmmu/default.mak
@@ -6,3 +6,4 @@ include ../arm-softmmu/default.mak
 CONFIG_XLNX_ZYNQMP_ARM=y
 CONFIG_XLNX_VERSAL=y
 CONFIG_SBSA_REF=y
+CONFIG_RASPI4B=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b5aed4aff5..f3ac9e520b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -351,6 +351,13 @@ config RASPI
     select SDHCI
     select USB_DWC2
 
+config RASPI4B
+    bool
+    select FRAMEBUFFER
+    select PL011 # UART
+    select SDHCI
+    select USB_DWC2
+
 config STM32F100_SOC
     bool
     select ARM_V7M
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 3c2a4160cd..7b98065b97 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -30,9 +30,9 @@
 #define SEPARATE_DMA_IRQ_MAX 10
 #define ORGATED_DMA_IRQ_COUNT 4
 
-static void create_unimp(BCM2835PeripheralState *ps,
-                         UnimplementedDeviceState *uds,
-                         const char *name, hwaddr ofs, hwaddr size)
+void create_unimp(RaspiPeripheralBaseState *ps,
+                  UnimplementedDeviceState *uds,
+                  const char *name, hwaddr ofs, hwaddr size)
 {
     object_initialize_child(OBJECT(ps), name, uds, TYPE_UNIMPLEMENTED_DEVICE);
     qdev_prop_set_string(DEVICE(uds), "name", name);
@@ -45,9 +45,36 @@ static void create_unimp(BCM2835PeripheralState *ps,
 static void bcm2835_peripherals_init(Object *obj)
 {
     BCM2835PeripheralState *s = BCM2835_PERIPHERALS(obj);
+    RaspiPeripheralBaseState *s_base = RASPI_PERIPHERALS_BASE(obj);
+
+    /* Random Number Generator */
+    object_initialize_child(obj, "rng", &s->rng, TYPE_BCM2835_RNG);
+
+    /* Thermal */
+    object_initialize_child(obj, "thermal", &s->thermal, TYPE_BCM2835_THERMAL);
+
+    /* GPIO */
+    object_initialize_child(obj, "gpio", &s->gpio, TYPE_BCM2835_GPIO);
+
+    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",
+                                   OBJECT(&s_base->sdhci.sdbus));
+    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhost",
+                                   OBJECT(&s_base->sdhost.sdbus));
+
+    /* Gated DMA interrupts */
+    object_initialize_child(obj, "orgated-dma-irq",
+                            &s_base->orgated_dma_irq, TYPE_OR_IRQ);
+    object_property_set_int(OBJECT(&s_base->orgated_dma_irq), "num-lines",
+                            ORGATED_DMA_IRQ_COUNT, &error_abort);
+}
+
+static void raspi_peripherals_base_init(Object *obj)
+{
+    RaspiPeripheralBaseState *s = RASPI_PERIPHERALS_BASE(obj);
+    RaspiPeripheralBaseClass *bc = RASPI_PERIPHERALS_BASE_GET_CLASS(obj);
 
     /* Memory region for peripheral devices, which we export to our parent */
-    memory_region_init(&s->peri_mr, obj,"bcm2835-peripherals", 0x1000000);
+    memory_region_init(&s->peri_mr, obj, "bcm2835-peripherals", bc->peri_size);
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->peri_mr);
 
     /* Internal memory region for peripheral bus addresses (not exported) */
@@ -81,6 +108,7 @@ static void bcm2835_peripherals_init(Object *obj)
     /* Framebuffer */
     object_initialize_child(obj, "fb", &s->fb, TYPE_BCM2835_FB);
     object_property_add_alias(obj, "vcram-size", OBJECT(&s->fb), "vcram-size");
+    object_property_add_alias(obj, "vcram-base", OBJECT(&s->fb), "vcram-base");
 
     object_property_add_const_link(OBJECT(&s->fb), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr));
@@ -96,9 +124,6 @@ static void bcm2835_peripherals_init(Object *obj)
     object_property_add_const_link(OBJECT(&s->property), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr));
 
-    /* Random Number Generator */
-    object_initialize_child(obj, "rng", &s->rng, TYPE_BCM2835_RNG);
-
     /* Extended Mass Media Controller */
     object_initialize_child(obj, "sdhci", &s->sdhci, TYPE_SYSBUS_SDHCI);
 
@@ -108,25 +133,9 @@ static void bcm2835_peripherals_init(Object *obj)
     /* DMA Channels */
     object_initialize_child(obj, "dma", &s->dma, TYPE_BCM2835_DMA);
 
-    object_initialize_child(obj, "orgated-dma-irq",
-                            &s->orgated_dma_irq, TYPE_OR_IRQ);
-    object_property_set_int(OBJECT(&s->orgated_dma_irq), "num-lines",
-                            ORGATED_DMA_IRQ_COUNT, &error_abort);
-
     object_property_add_const_link(OBJECT(&s->dma), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr));
 
-    /* Thermal */
-    object_initialize_child(obj, "thermal", &s->thermal, TYPE_BCM2835_THERMAL);
-
-    /* GPIO */
-    object_initialize_child(obj, "gpio", &s->gpio, TYPE_BCM2835_GPIO);
-
-    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",
-                                   OBJECT(&s->sdhci.sdbus));
-    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhost",
-                                   OBJECT(&s->sdhost.sdbus));
-
     /* Mphi */
     object_initialize_child(obj, "mphi", &s->mphi, TYPE_BCM2835_MPHI);
 
@@ -146,11 +155,76 @@ static void bcm2835_peripherals_init(Object *obj)
 
 static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
 {
+    MemoryRegion *mphi_mr;
     BCM2835PeripheralState *s = BCM2835_PERIPHERALS(dev);
+    RaspiPeripheralBaseState *s_base = RASPI_PERIPHERALS_BASE(dev);
+    int n;
+
+    raspi_peripherals_common_realize(dev, errp);
+
+    /* Extended Mass Media Controller */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->sdhci), 0,
+        qdev_get_gpio_in_named(DEVICE(&s_base->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_ARASANSDIO));
+
+     /* Connect DMA 0-12 to the interrupt controller */
+    for (n = 0; n <= SEPARATE_DMA_IRQ_MAX; n++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->dma), n,
+                           qdev_get_gpio_in_named(DEVICE(&s_base->ic),
+                                                  BCM2835_IC_GPU_IRQ,
+                                                  INTERRUPT_DMA0 + n));
+    }
+
+    if (!qdev_realize(DEVICE(&s_base->orgated_dma_irq), NULL, errp)) {
+        return;
+    }
+    for (n = 0; n < ORGATED_DMA_IRQ_COUNT; n++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->dma),
+                           SEPARATE_DMA_IRQ_MAX + 1 + n,
+                           qdev_get_gpio_in(DEVICE(&s_base->orgated_dma_irq), n));
+    }
+    qdev_connect_gpio_out(DEVICE(&s_base->orgated_dma_irq), 0,
+                          qdev_get_gpio_in_named(DEVICE(&s_base->ic),
+                              BCM2835_IC_GPU_IRQ,
+                              INTERRUPT_DMA0 + SEPARATE_DMA_IRQ_MAX + 1));
+
+    /* Random Number Generator */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->rng), errp)) {
+        return;
+    }
+    memory_region_add_subregion(
+        &s_base->peri_mr, RNG_OFFSET,
+        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0));
+
+    /* THERMAL */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->thermal), errp)) {
+        return;
+    }
+    memory_region_add_subregion(&s_base->peri_mr, THERMAL_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->thermal), 0));
+
+    /* Map MPHI to the peripherals memory map */
+    mphi_mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s_base->mphi), 0);
+    memory_region_add_subregion(&s_base->peri_mr, MPHI_OFFSET, mphi_mr);
+
+    /* GPIO */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
+        return;
+    }
+    memory_region_add_subregion(
+        &s_base->peri_mr, GPIO_OFFSET,
+        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio), 0));
+
+    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->gpio), "sd-bus");
+}
+
+void raspi_peripherals_common_realize(DeviceState *dev, Error **errp)
+{
+    RaspiPeripheralBaseState *s = RASPI_PERIPHERALS_BASE(dev);
     Object *obj;
     MemoryRegion *ram;
     Error *err = NULL;
-    uint64_t ram_size, vcram_size;
+    uint64_t ram_size, vcram_size, vcram_base;
     int n;
 
     obj = object_property_get_link(OBJECT(dev), "ram", &error_abort);
@@ -254,11 +328,24 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (!object_property_set_uint(OBJECT(&s->fb), "vcram-base",
-                                  ram_size - vcram_size, errp)) {
+    vcram_base = object_property_get_uint(OBJECT(s), "vcram-base", &err);
+    if (err) {
+        error_propagate(errp, err);
         return;
     }
 
+    if (vcram_base == 0) {
+        vcram_base = (ram_size > UPPER_RAM_BASE ? UPPER_RAM_BASE : ram_size)
+            - vcram_size;
+    } else {
+        if (vcram_base + vcram_size > UPPER_RAM_BASE) {
+            vcram_base = UPPER_RAM_BASE - vcram_size;
+        }
+    }
+    if (!object_property_set_uint(OBJECT(&s->fb), "vcram-base", vcram_base,
+                                  errp)) {
+        return;
+    }
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->fb), errp)) {
         return;
     }
@@ -279,14 +366,6 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->property), 0,
                       qdev_get_gpio_in(DEVICE(&s->mboxes), MBOX_CHAN_PROPERTY));
 
-    /* Random Number Generator */
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->rng), errp)) {
-        return;
-    }
-
-    memory_region_add_subregion(&s->peri_mr, RNG_OFFSET,
-                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0));
-
     /* Extended Mass Media Controller
      *
      * Compatible with:
@@ -309,9 +388,6 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
 
     memory_region_add_subregion(&s->peri_mr, EMMC1_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->sdhci), 0));
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
-        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
-                               INTERRUPT_ARASANSDIO));
 
     /* SDHOST */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sdhost), errp)) {
@@ -334,49 +410,11 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->peri_mr, DMA15_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dma), 1));
 
-    for (n = 0; n <= SEPARATE_DMA_IRQ_MAX; n++) {
-        sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
-                           qdev_get_gpio_in_named(DEVICE(&s->ic),
-                                                  BCM2835_IC_GPU_IRQ,
-                                                  INTERRUPT_DMA0 + n));
-    }
-    if (!qdev_realize(DEVICE(&s->orgated_dma_irq), NULL, errp)) {
-        return;
-    }
-    for (n = 0; n < ORGATED_DMA_IRQ_COUNT; n++) {
-        sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma),
-                           SEPARATE_DMA_IRQ_MAX + 1 + n,
-                           qdev_get_gpio_in(DEVICE(&s->orgated_dma_irq), n));
-    }
-    qdev_connect_gpio_out(DEVICE(&s->orgated_dma_irq), 0,
-                          qdev_get_gpio_in_named(DEVICE(&s->ic),
-                              BCM2835_IC_GPU_IRQ,
-                              INTERRUPT_DMA0 + SEPARATE_DMA_IRQ_MAX + 1));
-
-    /* THERMAL */
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->thermal), errp)) {
-        return;
-    }
-    memory_region_add_subregion(&s->peri_mr, THERMAL_OFFSET,
-                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->thermal), 0));
-
-    /* GPIO */
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
-        return;
-    }
-
-    memory_region_add_subregion(&s->peri_mr, GPIO_OFFSET,
-                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio), 0));
-
-    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->gpio), "sd-bus");
-
     /* Mphi */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->mphi), errp)) {
         return;
     }
 
-    memory_region_add_subregion(&s->peri_mr, MPHI_OFFSET,
-                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mphi), 0));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->mphi), 0,
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_HOSTPORT));
@@ -419,21 +457,27 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
 static void bcm2835_peripherals_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
+    RaspiPeripheralBaseClass *bc = RASPI_PERIPHERALS_BASE_CLASS(oc);
 
+    bc->peri_size = 0x1000000;
     dc->realize = bcm2835_peripherals_realize;
 }
 
-static const TypeInfo bcm2835_peripherals_type_info = {
-    .name = TYPE_BCM2835_PERIPHERALS,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(BCM2835PeripheralState),
-    .instance_init = bcm2835_peripherals_init,
-    .class_init = bcm2835_peripherals_class_init,
+static const TypeInfo bcm2835_peripherals_types[] = {
+    {
+        .name = TYPE_BCM2835_PERIPHERALS,
+        .parent = TYPE_RASPI_PERIPHERALS_BASE,
+        .instance_size = sizeof(BCM2835PeripheralState),
+        .instance_init = bcm2835_peripherals_init,
+        .class_init = bcm2835_peripherals_class_init,
+    }, {
+        .name = TYPE_RASPI_PERIPHERALS_BASE,
+        .parent = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(RaspiPeripheralBaseState),
+        .instance_init = raspi_peripherals_base_init,
+        .class_size = sizeof(RaspiPeripheralBaseClass),
+        .abstract = true,
+    }
 };
 
-static void bcm2835_peripherals_register_types(void)
-{
-    type_register_static(&bcm2835_peripherals_type_info);
-}
-
-type_init(bcm2835_peripherals_register_types)
+DEFINE_TYPES(bcm2835_peripherals_types)
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index f894338fc6..ce916a5a60 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -16,25 +16,13 @@
 #include "hw/arm/raspi_platform.h"
 #include "hw/sysbus.h"
 
-struct BCM283XClass {
-    /*< private >*/
-    DeviceClass parent_class;
-    /*< public >*/
-    const char *name;
-    const char *cpu_type;
-    unsigned core_count;
-    hwaddr peri_base; /* Peripheral base address seen by the CPU */
-    hwaddr ctrl_base; /* Interrupt controller and mailboxes etc. */
-    int clusterid;
-};
-
 static Property bcm2836_enabled_cores_property =
-    DEFINE_PROP_UINT32("enabled-cpus", BCM283XState, enabled_cpus, 0);
+    DEFINE_PROP_UINT32("enabled-cpus", BCM283XBaseState, enabled_cpus, 0);
 
-static void bcm2836_init(Object *obj)
+static void bcm283x_base_init(Object *obj)
 {
-    BCM283XState *s = BCM283X(obj);
-    BCM283XClass *bc = BCM283X_GET_CLASS(obj);
+    BCM283XBaseState *s = BCM283X_BASE(obj);
+    BCM283XBaseClass *bc = BCM283X_BASE_GET_CLASS(obj);
     int n;
 
     for (n = 0; n < bc->core_count; n++) {
@@ -50,6 +38,11 @@ static void bcm2836_init(Object *obj)
         object_initialize_child(obj, "control", &s->control,
                                 TYPE_BCM2836_CONTROL);
     }
+}
+
+static void bcm283x_init(Object *obj)
+{
+    BCM283XState *s = BCM283X(obj);
 
     object_initialize_child(obj, "peripherals", &s->peripherals,
                             TYPE_BCM2835_PERIPHERALS);
@@ -57,114 +50,120 @@ static void bcm2836_init(Object *obj)
                               "board-rev");
     object_property_add_alias(obj, "vcram-size", OBJECT(&s->peripherals),
                               "vcram-size");
+    object_property_add_alias(obj, "vcram-base", OBJECT(&s->peripherals),
+                              "vcram-base");
 }
 
-static bool bcm283x_common_realize(DeviceState *dev, Error **errp)
+bool bcm283x_common_realize(DeviceState *dev, RaspiPeripheralBaseState *ps,
+                            Error **errp)
 {
-    BCM283XState *s = BCM283X(dev);
-    BCM283XClass *bc = BCM283X_GET_CLASS(dev);
     Object *obj;
+    BCM283XBaseState *s = BCM283X_BASE(dev);
+    BCM283XBaseClass *bc = BCM283X_BASE_GET_CLASS(dev);
 
     /* common peripherals from bcm2835 */
-
     obj = object_property_get_link(OBJECT(dev), "ram", &error_abort);
 
-    object_property_add_const_link(OBJECT(&s->peripherals), "ram", obj);
+    object_property_add_const_link(OBJECT(ps), "ram", obj);
 
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->peripherals), errp)) {
+    if (!sysbus_realize(SYS_BUS_DEVICE(ps), errp)) {
         return false;
     }
 
-    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->peripherals),
-                              "sd-bus");
+    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(ps), "sd-bus");
 
-    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->peripherals), 0,
-                            bc->peri_base, 1);
+    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(ps), 0, bc->peri_base, 1);
     return true;
 }
 
 static void bcm2835_realize(DeviceState *dev, Error **errp)
 {
     BCM283XState *s = BCM283X(dev);
+    BCM283XBaseState *s_base = BCM283X_BASE(dev);
+    RaspiPeripheralBaseState *ps_base
+        = RASPI_PERIPHERALS_BASE(&s->peripherals);
 
-    if (!bcm283x_common_realize(dev, errp)) {
+    if (!bcm283x_common_realize(dev, ps_base, errp)) {
         return;
     }
 
-    if (!qdev_realize(DEVICE(&s->cpu[0].core), NULL, errp)) {
+    if (!qdev_realize(DEVICE(&s_base->cpu[0].core), NULL, errp)) {
         return;
     }
 
     /* Connect irq/fiq outputs from the interrupt controller. */
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 0,
-            qdev_get_gpio_in(DEVICE(&s->cpu[0].core), ARM_CPU_IRQ));
+            qdev_get_gpio_in(DEVICE(&s_base->cpu[0].core), ARM_CPU_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
-            qdev_get_gpio_in(DEVICE(&s->cpu[0].core), ARM_CPU_FIQ));
+            qdev_get_gpio_in(DEVICE(&s_base->cpu[0].core), ARM_CPU_FIQ));
 }
 
 static void bcm2836_realize(DeviceState *dev, Error **errp)
 {
-    BCM283XState *s = BCM283X(dev);
-    BCM283XClass *bc = BCM283X_GET_CLASS(dev);
     int n;
+    BCM283XState *s = BCM283X(dev);
+    BCM283XBaseState *s_base = BCM283X_BASE(dev);
+    BCM283XBaseClass *bc = BCM283X_BASE_GET_CLASS(dev);
+    RaspiPeripheralBaseState *ps_base
+        = RASPI_PERIPHERALS_BASE(&s->peripherals);
 
-    if (!bcm283x_common_realize(dev, errp)) {
+    if (!bcm283x_common_realize(dev, ps_base, errp)) {
         return;
     }
 
     /* bcm2836 interrupt controller (and mailboxes, etc.) */
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->control), errp)) {
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s_base->control), errp)) {
         return;
     }
 
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->control), 0, bc->ctrl_base);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s_base->control), 0, bc->ctrl_base);
 
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 0,
-        qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-irq", 0));
+        qdev_get_gpio_in_named(DEVICE(&s_base->control), "gpu-irq", 0));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
-        qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-fiq", 0));
+        qdev_get_gpio_in_named(DEVICE(&s_base->control), "gpu-fiq", 0));
 
     for (n = 0; n < BCM283X_NCPUS; n++) {
         /* TODO: this should be converted to a property of ARM_CPU */
-        s->cpu[n].core.mp_affinity = (bc->clusterid << 8) | n;
+        s_base->cpu[n].core.mp_affinity = (bc->clusterid << 8) | n;
 
         /* set periphbase/CBAR value for CPU-local registers */
-        if (!object_property_set_int(OBJECT(&s->cpu[n].core), "reset-cbar",
+        if (!object_property_set_int(OBJECT(&s_base->cpu[n].core), "reset-cbar",
                                      bc->peri_base, errp)) {
             return;
         }
 
         /* start powered off if not enabled */
-        if (!object_property_set_bool(OBJECT(&s->cpu[n].core),
+        if (!object_property_set_bool(OBJECT(&s_base->cpu[n].core),
                                       "start-powered-off",
-                                      n >= s->enabled_cpus,
+                                      n >= s_base->enabled_cpus,
                                       errp)) {
             return;
         }
 
-        if (!qdev_realize(DEVICE(&s->cpu[n].core), NULL, errp)) {
+        if (!qdev_realize(DEVICE(&s_base->cpu[n].core), NULL, errp)) {
             return;
         }
 
         /* Connect irq/fiq outputs from the interrupt controller. */
-        qdev_connect_gpio_out_named(DEVICE(&s->control), "irq", n,
-                qdev_get_gpio_in(DEVICE(&s->cpu[n].core), ARM_CPU_IRQ));
-        qdev_connect_gpio_out_named(DEVICE(&s->control), "fiq", n,
-                qdev_get_gpio_in(DEVICE(&s->cpu[n].core), ARM_CPU_FIQ));
+        qdev_connect_gpio_out_named(DEVICE(&s_base->control), "irq", n,
+            qdev_get_gpio_in(DEVICE(&s_base->cpu[n].core), ARM_CPU_IRQ));
+        qdev_connect_gpio_out_named(DEVICE(&s_base->control), "fiq", n,
+            qdev_get_gpio_in(DEVICE(&s_base->cpu[n].core), ARM_CPU_FIQ));
 
         /* Connect timers from the CPU to the interrupt controller */
-        qdev_connect_gpio_out(DEVICE(&s->cpu[n].core), GTIMER_PHYS,
-                qdev_get_gpio_in_named(DEVICE(&s->control), "cntpnsirq", n));
-        qdev_connect_gpio_out(DEVICE(&s->cpu[n].core), GTIMER_VIRT,
-                qdev_get_gpio_in_named(DEVICE(&s->control), "cntvirq", n));
-        qdev_connect_gpio_out(DEVICE(&s->cpu[n].core), GTIMER_HYP,
-                qdev_get_gpio_in_named(DEVICE(&s->control), "cnthpirq", n));
-        qdev_connect_gpio_out(DEVICE(&s->cpu[n].core), GTIMER_SEC,
-                qdev_get_gpio_in_named(DEVICE(&s->control), "cntpsirq", n));
+        qdev_connect_gpio_out(DEVICE(&s_base->cpu[n].core), GTIMER_PHYS,
+            qdev_get_gpio_in_named(DEVICE(&s_base->control), "cntpnsirq", n));
+        qdev_connect_gpio_out(DEVICE(&s_base->cpu[n].core), GTIMER_VIRT,
+            qdev_get_gpio_in_named(DEVICE(&s_base->control), "cntvirq", n));
+        qdev_connect_gpio_out(DEVICE(&s_base->cpu[n].core), GTIMER_HYP,
+            qdev_get_gpio_in_named(DEVICE(&s_base->control), "cnthpirq", n));
+        qdev_connect_gpio_out(DEVICE(&s_base->cpu[n].core), GTIMER_SEC,
+            qdev_get_gpio_in_named(DEVICE(&s_base->control), "cntpsirq", n));
     }
 }
 
-static void bcm283x_class_init(ObjectClass *oc, void *data)
+static void bcm283x_base_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
@@ -175,7 +174,7 @@ static void bcm283x_class_init(ObjectClass *oc, void *data)
 static void bcm2835_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
-    BCM283XClass *bc = BCM283X_CLASS(oc);
+    BCM283XBaseClass *bc = BCM283X_BASE_CLASS(oc);
 
     bc->cpu_type = ARM_CPU_TYPE_NAME("arm1176");
     bc->core_count = 1;
@@ -186,7 +185,7 @@ static void bcm2835_class_init(ObjectClass *oc, void *data)
 static void bcm2836_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
-    BCM283XClass *bc = BCM283X_CLASS(oc);
+    BCM283XBaseClass *bc = BCM283X_BASE_CLASS(oc);
 
     bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
     bc->core_count = BCM283X_NCPUS;
@@ -200,7 +199,7 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
 static void bcm2837_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
-    BCM283XClass *bc = BCM283X_CLASS(oc);
+    BCM283XBaseClass *bc = BCM283X_BASE_CLASS(oc);
 
     bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
     bc->core_count = BCM283X_NCPUS;
@@ -228,11 +227,17 @@ static const TypeInfo bcm283x_types[] = {
 #endif
     }, {
         .name           = TYPE_BCM283X,
-        .parent         = TYPE_DEVICE,
+        .parent         = TYPE_BCM283X_BASE,
         .instance_size  = sizeof(BCM283XState),
-        .instance_init  = bcm2836_init,
-        .class_size     = sizeof(BCM283XClass),
-        .class_init     = bcm283x_class_init,
+        .instance_init  = bcm283x_init,
+        .abstract       = true,
+    }, {
+        .name           = TYPE_BCM283X_BASE,
+        .parent         = TYPE_DEVICE,
+        .instance_size  = sizeof(BCM283XBaseState),
+        .instance_init  = bcm283x_base_init,
+        .class_size     = sizeof(BCM283XBaseClass),
+        .class_init     = bcm283x_base_class_init,
         .abstract       = true,
     }
 };
diff --git a/hw/arm/bcm2838.c b/hw/arm/bcm2838.c
new file mode 100644
index 0000000000..0fcfcb29a6
--- /dev/null
+++ b/hw/arm/bcm2838.c
@@ -0,0 +1,294 @@
+/*
+ * BCM2838 SoC emulation
+ *
+ * Copyright (C) 2022 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "hw/arm/raspi_platform.h"
+#include "hw/sysbus.h"
+#include "hw/arm/bcm2838.h"
+#include "hw/arm/raspi4b_platform.h"
+#include "trace.h"
+
+module_obj(TYPE_BCM2838);
+module_arch("aarch64");
+
+struct BCM2838Class {
+    /*< private >*/
+    BCM283XBaseClass parent_class;
+    /*< public >*/
+    hwaddr peri_low_base; /* Lower peripheral base address seen by the CPU */
+    hwaddr gic_base; /* GIC base address inside ARM local peripherals region */
+};
+
+#define GIC400_MAINTAINANCE_IRQ      9
+#define GIC400_TIMER_NS_EL2_IRQ     10
+#define GIC400_TIMER_VIRT_IRQ       11
+#define GIC400_LEGACY_FIQ           12
+#define GIC400_TIMER_S_EL1_IRQ      13
+#define GIC400_TIMER_NS_EL1_IRQ     14
+#define GIC400_LEGACY_IRQ           15
+
+/* Number of external interrupt lines to configure the GIC with */
+#define GIC_NUM_IRQS                192
+
+#define PPI(cpu, irq) (GIC_NUM_IRQS + (cpu) * GIC_INTERNAL + GIC_NR_SGIS + irq)
+
+#define GIC_BASE_OFS                0x0000
+#define GIC_DIST_OFS                0x1000
+#define GIC_CPU_OFS                 0x2000
+#define GIC_VIFACE_THIS_OFS         0x4000
+#define GIC_VIFACE_OTHER_OFS(cpu)  (0x5000 + (cpu) * 0x200)
+#define GIC_VCPU_OFS                0x6000
+
+#define VIRTUAL_PMU_IRQ 7
+
+static void bcm2838_gic_set_irq(void *opaque, int irq, int level)
+{
+    BCM2838State *s = (BCM2838State *)opaque;
+
+    trace_bcm2838_gic_set_irq(irq, level);
+    qemu_set_irq(qdev_get_gpio_in(DEVICE(&s->gic), irq), level);
+}
+
+static void bcm2838_init(Object *obj)
+{
+    BCM2838State *s = BCM2838(obj);
+
+    object_initialize_child(obj, "peripherals", &s->peripherals,
+                            TYPE_BCM2838_PERIPHERALS);
+    object_property_add_alias(obj, "board-rev", OBJECT(&s->peripherals),
+                              "board-rev");
+    object_property_add_alias(obj, "vcram-size", OBJECT(&s->peripherals),
+                              "vcram-size");
+    object_property_add_alias(obj, "vcram-base", OBJECT(&s->peripherals),
+                              "vcram-base");
+
+    object_initialize_child(obj, "gic", &s->gic, TYPE_ARM_GIC);
+}
+
+static void bcm2838_realize(DeviceState *dev, Error **errp)
+{
+    int n;
+    int int_n;
+    BCM2838State *s = BCM2838(dev);
+    BCM283XBaseState *s_base = BCM283X_BASE(dev);
+    BCM2838Class *bc = BCM2838_GET_CLASS(dev);
+    BCM283XBaseClass *bc_base = BCM283X_BASE_GET_CLASS(dev);
+    BCM2838PeripheralState *ps = BCM2838_PERIPHERALS(&s->peripherals);
+    RaspiPeripheralBaseState *ps_base = RASPI_PERIPHERALS_BASE(&s->peripherals);
+
+    if (!bcm283x_common_realize(dev, ps_base, errp)) {
+        return;
+    }
+    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(ps), 1, bc->peri_low_base, 1);
+
+    /* bcm2836 interrupt controller (and mailboxes, etc.) */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s_base->control), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s_base->control), 0, bc_base->ctrl_base);
+
+    /* Create cores */
+    for (n = 0; n < bc_base->core_count; n++) {
+        /* TODO: this should be converted to a property of ARM_CPU */
+        s_base->cpu[n].core.mp_affinity = (bc_base->clusterid << 8) | n;
+
+        /* set periphbase/CBAR value for CPU-local registers */
+        if (!object_property_set_int(OBJECT(&s_base->cpu[n].core), "reset-cbar",
+                                     bc_base->ctrl_base + bc->gic_base, errp)) {
+            return;
+        }
+
+        /* start powered off if not enabled */
+        if (!object_property_set_bool(OBJECT(&s_base->cpu[n].core),
+                                      "start-powered-off",
+                                      n >= s_base->enabled_cpus,
+                                      errp)) {
+            return;
+        }
+
+        if (!qdev_realize(DEVICE(&s_base->cpu[n].core), NULL, errp)) {
+            return;
+        }
+    }
+
+    if (!object_property_set_uint(OBJECT(&s->gic), "revision", 2, errp)) {
+        return;
+    }
+
+    if (!object_property_set_uint(OBJECT(&s->gic), "num-cpu", BCM283X_NCPUS,
+                                  errp)) {
+        return;
+    }
+
+    if (!object_property_set_uint(OBJECT(&s->gic), "num-irq",
+                                  GIC_NUM_IRQS + GIC_INTERNAL, errp)) {
+        return;
+    }
+
+    if (!object_property_set_bool(OBJECT(&s->gic),
+                                  "has-virtualization-extensions", true,
+                                  errp)) {
+        return;
+    }
+
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
+        return;
+    }
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 0,
+                    bc_base->ctrl_base + bc->gic_base + GIC_DIST_OFS);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 1,
+                    bc_base->ctrl_base + bc->gic_base + GIC_CPU_OFS);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 2,
+                    bc_base->ctrl_base + bc->gic_base + GIC_VIFACE_THIS_OFS);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 3,
+                    bc_base->ctrl_base + bc->gic_base + GIC_VCPU_OFS);
+
+    for (n = 0; n < BCM283X_NCPUS; n++) {
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 4 + n,
+                        bc_base->ctrl_base + bc->gic_base
+                            + GIC_VIFACE_OTHER_OFS(n));
+    }
+
+    DeviceState *gicdev = DEVICE(&s->gic);
+
+    for (n = 0; n < BCM283X_NCPUS; n++) {
+        DeviceState *cpudev = DEVICE(&s_base->cpu[n]);
+
+        /* Connect the GICv2 outputs to the CPU */
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), n,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), n + BCM283X_NCPUS,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), n + 2 * BCM283X_NCPUS,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), n + 3 * BCM283X_NCPUS,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), n + 4 * BCM283X_NCPUS,
+                           qdev_get_gpio_in(gicdev,
+                                            PPI(n, GIC400_MAINTAINANCE_IRQ)));
+
+        /* Connect timers from the CPU to the interrupt controller */
+        qdev_connect_gpio_out(cpudev, GTIMER_PHYS,
+                    qdev_get_gpio_in(gicdev, PPI(n, GIC400_TIMER_NS_EL1_IRQ)));
+        qdev_connect_gpio_out(cpudev, GTIMER_VIRT,
+                    qdev_get_gpio_in(gicdev, PPI(n, GIC400_TIMER_VIRT_IRQ)));
+        qdev_connect_gpio_out(cpudev, GTIMER_HYP,
+                    qdev_get_gpio_in(gicdev, PPI(n, GIC400_TIMER_NS_EL2_IRQ)));
+        qdev_connect_gpio_out(cpudev, GTIMER_SEC,
+                    qdev_get_gpio_in(gicdev, PPI(n, GIC400_TIMER_S_EL1_IRQ)));
+        /* PMU interrupt */
+        qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
+                    qdev_get_gpio_in(gicdev, PPI(n, VIRTUAL_PMU_IRQ)));
+    }
+
+    /* Connect UART0 to the interrupt controller */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->uart0), 0,
+                       qdev_get_gpio_in(gicdev, RPI4_INTERRUPT_UART0));
+
+    /* Connect AUX / UART1 to the interrupt controller */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->aux), 0,
+                       qdev_get_gpio_in(gicdev, RPI4_INTERRUPT_AUX_UART1));
+
+    /* Connect VC mailbox to the interrupt controller */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->mboxes), 0,
+                       qdev_get_gpio_in(gicdev, RPI4_INTERRUPT_MBOX));
+
+    /* Connect SD host to the interrupt controller */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->sdhost), 0,
+                       qdev_get_gpio_in(gicdev, RPI4_INTERRUPT_SDHOST));
+
+    /* According to DTS, EMMC and EMMC2 share one irq */
+    DeviceState *mmc_irq_orgate = DEVICE(&ps->mmc_irq_orgate);
+
+    /* Connect EMMC and EMMC2 to the interrupt controller */
+    qdev_connect_gpio_out(mmc_irq_orgate, 0,
+                          qdev_get_gpio_in(gicdev, RPI4_INTERRUPT_EMMC_EMMC2));
+
+    /* Connect USB OTG and MPHI to the interrupt controller */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->mphi), 0,
+                       qdev_get_gpio_in(gicdev, RPI4_INTERRUPT_MPHI));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->dwc2), 0,
+                       qdev_get_gpio_in(gicdev, RPI4_INTERRUPT_DWC2));
+
+    /* Connect RNG200 to the interrupt controller */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&ps->rng200), 0,
+                       qdev_get_gpio_in(gicdev, RPI4_INTERRUPT_RNG200));
+
+    /* Connect DMA 0-6 to the interrupt controller */
+    for (int_n = RPI4_INTERRUPT_DMA_0; int_n <= RPI4_INTERRUPT_DMA_6;
+         int_n++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->dma),
+                           int_n - RPI4_INTERRUPT_DMA_0,
+                           qdev_get_gpio_in(gicdev, int_n));
+    }
+
+    /* According to DTS, DMA 7 and 8 share one irq */
+    DeviceState *dma_7_8_irq_orgate = DEVICE(&ps->dma_7_8_irq_orgate);
+
+    /* Connect DMA 7-8 to the interrupt controller */
+    qdev_connect_gpio_out(dma_7_8_irq_orgate, 0,
+                          qdev_get_gpio_in(gicdev, RPI4_INTERRUPT_DMA_7_8));
+
+    /* According to DTS, DMA 9 and 10 share one irq */
+    DeviceState *dma_9_10_irq_orgate = DEVICE(&ps->dma_9_10_irq_orgate);
+
+    /* Connect DMA 9-10 to the interrupt controller */
+    qdev_connect_gpio_out(dma_9_10_irq_orgate, 0,
+                          qdev_get_gpio_in(gicdev, RPI4_INTERRUPT_DMA_9_10));
+
+    /* Connect PCIe host bridge to the interrupt controller */
+    for (n = 0; n < BCM2838_PCIE_NUM_IRQS; n++) {
+        int_n = RPI4_INTERRUPT_PCI_INT_A + n;
+        sysbus_connect_irq(SYS_BUS_DEVICE(&ps->pcie_host), n,
+                           qdev_get_gpio_in(gicdev, int_n));
+        bcm2838_pcie_host_set_irq_num(BCM2838_PCIE_HOST(&ps->pcie_host), n,
+                                      int_n);
+    }
+
+    /* Pass through inbound GPIO lines to the GIC */
+    qdev_init_gpio_in(dev, bcm2838_gic_set_irq, GIC_NUM_IRQS);
+
+    /* Pass through outbound IRQ lines from the GIC */
+    qdev_pass_gpios(DEVICE(&s->gic), DEVICE(&s->peripherals), NULL);
+}
+
+static void bcm2838_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    BCM2838Class *bc = BCM2838_CLASS(oc);
+    BCM283XBaseClass *bc_base = BCM283X_BASE_CLASS(oc);
+
+    bc_base->cpu_type = ARM_CPU_TYPE_NAME("cortex-a72");
+    bc_base->core_count = BCM283X_NCPUS;
+    bc_base->peri_base = 0xfe000000;
+    bc_base->ctrl_base = 0xff800000;
+    bc_base->clusterid = 0x0;
+    bc->peri_low_base = 0xfc000000;
+    bc->gic_base = 0x40000;
+    dc->realize = bcm2838_realize;
+}
+
+static const TypeInfo bcm2838_type = {
+    .name           = TYPE_BCM2838,
+    .parent         = TYPE_BCM283X_BASE,
+    .instance_size  = sizeof(BCM2838State),
+    .instance_init  = bcm2838_init,
+    .class_size     = sizeof(BCM2838Class),
+    .class_init     = bcm2838_class_init,
+};
+
+static void bcm2838_register_types(void)
+{
+    type_register_static(&bcm2838_type);
+}
+
+type_init(bcm2838_register_types);
diff --git a/hw/arm/bcm2838_pcie.c b/hw/arm/bcm2838_pcie.c
new file mode 100644
index 0000000000..2cb18d2e43
--- /dev/null
+++ b/hw/arm/bcm2838_pcie.c
@@ -0,0 +1,300 @@
+/*
+ * BCM2838 PCIe Root Complex emulation
+ *
+ * Copyright (C) 2022 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "hw/irq.h"
+#include "hw/pci-host/gpex.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "qemu/module.h"
+#include "hw/arm/bcm2838_pcie.h"
+#include "trace.h"
+
+/*
+ * RC host part
+ */
+
+static uint64_t bcm2838_pcie_host_read(void *opaque, hwaddr offset,
+                                       unsigned size)
+{
+    hwaddr mmcfg_addr;
+    uint64_t value = ~0;
+    BCM2838PcieHostState *s = opaque;
+    PCIExpressHost *pcie_hb = PCIE_HOST_BRIDGE(s);
+    PCIDevice *root_pci_dev = PCI_DEVICE(&s->root_port);
+    uint8_t *root_regs = s->root_port.regs;
+    uint32_t *cfg_idx = (uint32_t *)(root_regs + BCM2838_PCIE_EXT_CFG_INDEX
+                                     - PCIE_CONFIG_SPACE_SIZE);
+
+    if (offset < PCIE_CONFIG_SPACE_SIZE) {
+        value = pci_host_config_read_common(root_pci_dev, offset,
+                                            PCIE_CONFIG_SPACE_SIZE, size);
+    } else if (offset - PCIE_CONFIG_SPACE_SIZE + size
+               <= sizeof(s->root_port.regs)) {
+        switch (offset) {
+        case BCM2838_PCIE_EXT_CFG_DATA
+            ... BCM2838_PCIE_EXT_CFG_DATA + PCIE_CONFIG_SPACE_SIZE - 1:
+            mmcfg_addr = *cfg_idx
+                | PCIE_MMCFG_CONFOFFSET(offset - BCM2838_PCIE_EXT_CFG_DATA);
+            value = pcie_hb->mmio.ops->read(opaque, mmcfg_addr, size);
+            break;
+        default:
+            memcpy(&value, root_regs + offset - PCIE_CONFIG_SPACE_SIZE, size);
+        }
+    } else {
+        qemu_log_mask(
+            LOG_GUEST_ERROR,
+            "%s: out-of-range access, %u bytes @ offset 0x%04" PRIx64 "\n",
+            __func__, size, offset);
+    }
+
+    trace_bcm2838_pcie_host_read(size, offset, value);
+    return value;
+}
+
+static void bcm2838_pcie_host_write(void *opaque, hwaddr offset,
+                                    uint64_t value, unsigned size)
+{
+    hwaddr mmcfg_addr;
+    BCM2838PcieHostState *s = opaque;
+    PCIExpressHost *pcie_hb = PCIE_HOST_BRIDGE(s);
+    PCIDevice *root_pci_dev = PCI_DEVICE(&s->root_port);
+    uint8_t *root_regs = s->root_port.regs;
+    uint32_t *cfg_idx = (uint32_t *)(root_regs + BCM2838_PCIE_EXT_CFG_INDEX
+                                     - PCIE_CONFIG_SPACE_SIZE);
+
+    trace_bcm2838_pcie_host_write(size, offset, value);
+
+    if (offset < PCIE_CONFIG_SPACE_SIZE) {
+        pci_host_config_write_common(root_pci_dev, offset,
+                                     PCIE_CONFIG_SPACE_SIZE, value, size);
+    } else if (offset - PCIE_CONFIG_SPACE_SIZE + size
+               <= sizeof(s->root_port.regs)) {
+        switch (offset) {
+        case BCM2838_PCIE_EXT_CFG_DATA
+            ... BCM2838_PCIE_EXT_CFG_DATA + PCIE_CONFIG_SPACE_SIZE - 1:
+            mmcfg_addr = *cfg_idx
+                | PCIE_MMCFG_CONFOFFSET(offset - BCM2838_PCIE_EXT_CFG_DATA);
+            pcie_hb->mmio.ops->write(opaque, mmcfg_addr, value, size);
+            break;
+        default:
+            memcpy(root_regs + offset - PCIE_CONFIG_SPACE_SIZE, &value, size);
+        }
+    } else {
+        qemu_log_mask(
+            LOG_GUEST_ERROR,
+            "%s: out-of-range access, %u bytes @ offset 0x%04" PRIx64 "\n",
+            __func__, size, offset);
+    }
+}
+
+static const MemoryRegionOps bcm2838_pcie_host_ops = {
+    .read = bcm2838_pcie_host_read,
+    .write = bcm2838_pcie_host_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {.max_access_size = sizeof(uint64_t)},
+};
+
+int bcm2838_pcie_host_set_irq_num(BCM2838PcieHostState *s, int index, int spi)
+{
+    if (index >= BCM2838_PCIE_NUM_IRQS) {
+        return -EINVAL;
+    }
+
+    s->irq_num[index] = spi;
+    return 0;
+}
+
+static void bcm2838_pcie_host_set_irq(void *opaque, int irq_num, int level)
+{
+    BCM2838PcieHostState *s = opaque;
+
+    qemu_set_irq(s->irq[irq_num], level);
+}
+
+static PCIINTxRoute bcm2838_pcie_host_route_intx_pin_to_irq(void *opaque,
+                                                            int pin)
+{
+    PCIINTxRoute route;
+    BCM2838PcieHostState *s = opaque;
+
+    route.irq = s->irq_num[pin];
+    route.mode = route.irq < 0 ? PCI_INTX_DISABLED : PCI_INTX_ENABLED;
+
+    return route;
+}
+
+static int bcm2838_pcie_host_map_irq(PCIDevice *pci_dev, int pin)
+{
+    return pin;
+}
+
+static void bcm2838_pcie_host_realize(DeviceState *dev, Error **errp)
+{
+    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
+    BCM2838PcieHostState *s = BCM2838_PCIE_HOST(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    /*
+     * TODO: is PCIE_HOST_BRIDGE() needed?
+     * PCIExpressHost *pex = PCIE_HOST_BRIDGE(dev);
+     */
+    int i;
+
+    memory_region_init_io(&s->cfg_regs, OBJECT(s), &bcm2838_pcie_host_ops, s,
+                          "bcm2838_pcie_cfg_regs", BCM2838_PCIE_REGS_SIZE);
+    sysbus_init_mmio(sbd, &s->cfg_regs);
+
+    /*
+     * The MemoryRegions io_mmio and io_ioport that we pass to
+     * pci_register_root_bus() are not the same as the MemoryRegions
+     * io_mmio_window and io_ioport_window that we expose as SysBus MRs.
+     * The difference is in the behavior of accesses to addresses where no PCI
+     * device has been mapped.
+     *
+     * io_mmio and io_ioport are the underlying PCI view of the PCI address
+     * space, and when a PCI device does a bus master access to a bad address
+     * this is reported back to it as a transaction failure.
+     *
+     * io_mmio_window and io_ioport_window implement "unmapped addresses read as
+     * -1 and ignore writes"; this is a traditional x86 PC behavior, which is
+     * not mandated properly by the PCI spec but expected by the majority of
+     * PCI-using guest software, including Linux.
+     *
+     * We implement it in the PCIe host controller, by providing the *_window
+     * MRs, which are containers with io ops that implement the 'background'
+     * behavior and which hold the real PCI MRs as sub-regions.
+     */
+    memory_region_init(&s->io_mmio, OBJECT(s), "bcm2838_pcie_mmio", UINT64_MAX);
+    memory_region_init(&s->io_ioport, OBJECT(s), "bcm2838_pcie_ioport",
+                       64 * 1024);
+
+    if (s->allow_unmapped_accesses) {
+        memory_region_init_io(&s->io_mmio_window, OBJECT(s),
+                              &unassigned_io_ops, OBJECT(s),
+                              "bcm2838_pcie_mmio_window", UINT64_MAX);
+        memory_region_init_io(&s->io_ioport_window, OBJECT(s),
+                              &unassigned_io_ops, OBJECT(s),
+                              "bcm2838_pcie_ioport_window", 64 * 1024);
+
+        memory_region_add_subregion(&s->io_mmio_window, 0, &s->io_mmio);
+        memory_region_add_subregion(&s->io_ioport_window, 0, &s->io_ioport);
+        sysbus_init_mmio(sbd, &s->io_mmio_window);
+        sysbus_init_mmio(sbd, &s->io_ioport_window);
+    } else {
+        sysbus_init_mmio(sbd, &s->io_mmio);
+        sysbus_init_mmio(sbd, &s->io_ioport);
+    }
+
+    for (i = 0; i < BCM2838_PCIE_NUM_IRQS; i++) {
+        sysbus_init_irq(sbd, &s->irq[i]);
+        s->irq_num[i] = -1;
+    }
+
+    pci->bus = pci_register_root_bus(dev, "pcie.0", bcm2838_pcie_host_set_irq,
+                                     bcm2838_pcie_host_map_irq, s, &s->io_mmio,
+                                     &s->io_ioport, 0, BCM2838_PCIE_NUM_IRQS,
+                                     TYPE_PCIE_BUS);
+    pci_bus_set_route_irq_fn(pci->bus, bcm2838_pcie_host_route_intx_pin_to_irq);
+    qdev_realize(DEVICE(&s->root_port), BUS(pci->bus), &error_fatal);
+}
+
+static const char *bcm2838_pcie_host_root_bus_path(PCIHostState *host_bridge,
+                                                   PCIBus *rootbus)
+{
+    return "0000:00";
+}
+
+static Property bcm2838_pcie_host_properties[] = {
+    /*
+     * Permit CPU accesses to unmapped areas of the PIO and MMIO windows
+     * (discarding writes and returning -1 for reads) rather than aborting.
+     */
+    DEFINE_PROP_BOOL("allow-unmapped-accesses", BCM2838PcieHostState,
+                     allow_unmapped_accesses, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void bcm2838_pcie_host_class_init(ObjectClass *class, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(class);
+    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(class);
+
+    hc->root_bus_path = bcm2838_pcie_host_root_bus_path;
+    dc->realize = bcm2838_pcie_host_realize;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->fw_name = "pci";
+    device_class_set_props(dc, bcm2838_pcie_host_properties);
+}
+
+static void bcm2838_pcie_host_initfn(Object *obj)
+{
+    BCM2838PcieHostState *s = BCM2838_PCIE_HOST(obj);
+    BCM2838PcieRootState *root = &s->root_port;
+
+    object_initialize_child(obj, "root_port", root, TYPE_BCM2838_PCIE_ROOT);
+    qdev_prop_set_int32(DEVICE(root), "addr", PCI_DEVFN(0, 0));
+    qdev_prop_set_bit(DEVICE(root), "multifunction", false);
+}
+
+static const TypeInfo bcm2838_pcie_host_info = {
+    .name       = TYPE_BCM2838_PCIE_HOST,
+    .parent     = TYPE_PCIE_HOST_BRIDGE,
+    .instance_size = sizeof(BCM2838PcieHostState),
+    .instance_init = bcm2838_pcie_host_initfn,
+    .class_init = bcm2838_pcie_host_class_init,
+};
+
+/*
+ * RC root part (D0:F0)
+ */
+
+static void bcm2838_pcie_root_init(Object *obj)
+{
+    PCIBridge *br = PCI_BRIDGE(obj);
+    BCM2838PcieRootState *s = BCM2838_PCIE_ROOT(obj);
+
+    br->bus_name = "pcie.1";
+    memset(s->regs, 0xFF, sizeof(s->regs));
+}
+
+static void bcm2838_pcie_root_class_init(ObjectClass *class, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(class);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(class);
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(class);
+
+    dc->desc = "BCM2711 PCIe Bridge";
+    /*
+     * PCI-facing part of the host bridge, not usable without the host-facing
+     * part, which can't be device_add'ed.
+     */
+    dc->user_creatable = false;
+    k->vendor_id = BCM2838_PCIE_VENDOR_ID;
+    k->device_id = BCM2838_PCIE_DEVICE_ID;
+    k->revision = BCM2838_PCIE_REVISION;
+    rpc->exp_offset = BCM2838_PCIE_EXP_CAP_OFFSET;
+    rpc->aer_offset = BCM2838_PCIE_AER_CAP_OFFSET;
+}
+
+static const TypeInfo bcm2838_pcie_root_info = {
+    .name = TYPE_BCM2838_PCIE_ROOT,
+    .parent = TYPE_PCIE_ROOT_PORT,
+    .instance_size = sizeof(BCM2838PcieRootState),
+    .instance_init = bcm2838_pcie_root_init,
+    .class_init = bcm2838_pcie_root_class_init,
+};
+
+static void bcm2838_pcie_register(void)
+{
+    type_register_static(&bcm2838_pcie_root_info);
+    type_register_static(&bcm2838_pcie_host_info);
+}
+
+type_init(bcm2838_pcie_register)
diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
new file mode 100644
index 0000000000..43a5c8973e
--- /dev/null
+++ b/hw/arm/bcm2838_peripherals.c
@@ -0,0 +1,262 @@
+/*
+ * BCM2838 peripherals emulation
+ *
+ * Copyright (C) 2022 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "hw/arm/raspi_platform.h"
+#include "hw/arm/raspi4b_platform.h"
+#include "hw/arm/bcm2838_peripherals.h"
+
+/* Lower peripheral base address on the VC (GPU) system bus */
+#define BCM2838_VC_PERI_LOW_BASE 0x7c000000
+
+/* Capabilities for SD controller: no DMA, high-speed, default clocks etc. */
+#define BCM2835_SDHC_CAPAREG 0x52134b4
+
+static void bcm2838_peripherals_init(Object *obj)
+{
+    BCM2838PeripheralState *s = BCM2838_PERIPHERALS(obj);
+    BCM2838PeripheralClass *bc = BCM2838_PERIPHERALS_GET_CLASS(obj);
+    RaspiPeripheralBaseState *s_base = RASPI_PERIPHERALS_BASE(obj);
+
+    /* Lower memory region for peripheral devices (exported to the Soc) */
+    memory_region_init(&s->peri_low_mr, obj, "bcm2838-peripherals",
+                       bc->peri_low_size);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->peri_low_mr);
+
+    /* Random Number Generator */
+    object_initialize_child(obj, "rng200", &s->rng200, TYPE_BCM2838_RNG200);
+
+    /* Thermal */
+    object_initialize_child(obj, "thermal", &s->thermal, TYPE_BCM2838_THERMAL);
+
+    /* PCIe Host Bridge */
+    object_initialize_child(obj, "pcie-host", &s->pcie_host,
+                            TYPE_BCM2838_PCIE_HOST);
+
+    /* Extended Mass Media Controller 2 */
+    object_initialize_child(obj, "emmc2", &s->emmc2, TYPE_SYSBUS_SDHCI);
+
+    /* GPIO */
+    object_initialize_child(obj, "gpio", &s->gpio, TYPE_BCM2838_GPIO);
+
+    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",
+                                   OBJECT(&s_base->sdhci.sdbus));
+    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhost",
+                                   OBJECT(&s_base->sdhost.sdbus));
+
+    object_initialize_child(obj, "mmc_irq_orgate", &s->mmc_irq_orgate,
+                            TYPE_OR_IRQ);
+    object_property_set_int(OBJECT(&s->mmc_irq_orgate), "num-lines", 2,
+                            &error_abort);
+
+    object_initialize_child(obj, "dma_7_8_irq_orgate", &s->dma_7_8_irq_orgate,
+                            TYPE_OR_IRQ);
+    object_property_set_int(OBJECT(&s->dma_7_8_irq_orgate), "num-lines", 2,
+                            &error_abort);
+
+    object_initialize_child(obj, "dma_9_10_irq_orgate", &s->dma_9_10_irq_orgate,
+                            TYPE_OR_IRQ);
+    object_property_set_int(OBJECT(&s->dma_9_10_irq_orgate), "num-lines", 2,
+                            &error_abort);
+}
+
+static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
+{
+    MemoryRegion *mphi_mr;
+    BCM2838PeripheralState *s = BCM2838_PERIPHERALS(dev);
+    RaspiPeripheralBaseState *s_base = RASPI_PERIPHERALS_BASE(dev);
+    MemoryRegion *regs_mr;
+    MemoryRegion *mmio_mr;
+    int n;
+
+    raspi_peripherals_common_realize(dev, errp);
+
+    /* Map lower peripherals into the GPU address space */
+    memory_region_init_alias(&s->peri_low_mr_alias, OBJECT(s),
+                             "bcm2838-peripherals", &s->peri_low_mr, 0,
+                             memory_region_size(&s->peri_low_mr));
+    memory_region_add_subregion_overlap(&s_base->gpu_bus_mr,
+                                        BCM2838_VC_PERI_LOW_BASE,
+                                        &s->peri_low_mr_alias, 1);
+
+    /* Random Number Generator */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->rng200), errp)) {
+        return;
+    }
+    memory_region_add_subregion(
+        &s_base->peri_mr, RNG_OFFSET,
+        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng200), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->rng200), 0,
+        qdev_get_gpio_in_named(DEVICE(&s_base->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_RNG));
+
+    /* THERMAL */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->thermal), errp)) {
+        return;
+    }
+    memory_region_add_subregion(
+        &s->peri_low_mr, 0x15D2000,
+        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->thermal), 0));
+
+    /* Extended Mass Media Controller 2 */
+    object_property_set_uint(OBJECT(&s->emmc2), "sd-spec-version", 3,
+                             &error_abort);
+    object_property_set_uint(OBJECT(&s->emmc2), "capareg",
+                             BCM2835_SDHC_CAPAREG, &error_abort);
+    object_property_set_bool(OBJECT(&s->emmc2), "pending-insert-quirk", true,
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->emmc2), errp)) {
+        return;
+    }
+
+    memory_region_add_subregion(
+        &s_base->peri_mr, EMMC2_OFFSET,
+        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->emmc2), 0));
+
+    /* According to DTS, EMMC and EMMC2 share one irq */
+    if (!qdev_realize(DEVICE(&s->mmc_irq_orgate), NULL, errp)) {
+        return;
+    }
+
+    DeviceState *mmc_irq_orgate = DEVICE(&s->mmc_irq_orgate);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc2), 0,
+                        qdev_get_gpio_in(mmc_irq_orgate, 0));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->sdhci), 0,
+                        qdev_get_gpio_in(mmc_irq_orgate, 1));
+
+   /* Connect EMMC and EMMC2 to the interrupt controller */
+    qdev_connect_gpio_out(mmc_irq_orgate, 0,
+                          qdev_get_gpio_in_named(DEVICE(&s_base->ic),
+                                                 BCM2835_IC_GPU_IRQ,
+                                                 INTERRUPT_ARASANSDIO));
+
+    /* Connect DMA 0-6 to the interrupt controller */
+    for (n = 0; n < 7; n++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->dma), n,
+                           qdev_get_gpio_in_named(DEVICE(&s_base->ic),
+                                                  BCM2835_IC_GPU_IRQ,
+                                                  RPI4_GPU_INTERRUPT_DMA0 + n));
+    }
+
+   /* According to DTS, DMA 7 and 8 share one irq */
+    if (!qdev_realize(DEVICE(&s->dma_7_8_irq_orgate), NULL, errp)) {
+        return;
+    }
+    DeviceState *dma_7_8_irq_orgate = DEVICE(&s->dma_7_8_irq_orgate);
+
+    /* Connect DMA 7-8 to the interrupt controller */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->dma), 7,
+                       qdev_get_gpio_in(dma_7_8_irq_orgate, 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->dma), 8,
+                       qdev_get_gpio_in(dma_7_8_irq_orgate, 1));
+
+    qdev_connect_gpio_out(dma_7_8_irq_orgate, 0,
+                          qdev_get_gpio_in_named(DEVICE(&s_base->ic),
+                                                 BCM2835_IC_GPU_IRQ,
+                                                 RPI4_GPU_INTERRUPT_DMA7_8));
+
+     /* According to DTS, DMA 9 and 10 share one irq */
+    if (!qdev_realize(DEVICE(&s->dma_9_10_irq_orgate), NULL, errp)) {
+        return;
+    }
+    DeviceState *dma_9_10_irq_orgate = DEVICE(&s->dma_9_10_irq_orgate);
+
+   /* Connect DMA 9-10 to the interrupt controller */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->dma), 9,
+                       qdev_get_gpio_in(dma_9_10_irq_orgate, 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->dma), 10,
+                       qdev_get_gpio_in(dma_9_10_irq_orgate, 1));
+
+    qdev_connect_gpio_out(dma_9_10_irq_orgate, 0,
+                          qdev_get_gpio_in_named(DEVICE(&s_base->ic),
+                                                 BCM2835_IC_GPU_IRQ,
+                                                 RPI4_GPU_INTERRUPT_DMA9_10));
+
+    /* Connect DMA 11-14 to the interrupt controller */
+    for (n = 11; n < 15; n++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->dma), n,
+                           qdev_get_gpio_in_named(DEVICE(&s_base->ic),
+                                                  BCM2835_IC_GPU_IRQ,
+                                                  RPI4_GPU_INTERRUPT_DMA11 + n
+                                                  - 11));
+    }
+
+    /*
+     * Connect DMA 15 to the interrupt controller, it is physically removed
+     * from other DMA channels and exclusively used by the GPU
+     */
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s_base->dma), 15,
+                        qdev_get_gpio_in_named(DEVICE(&s_base->ic),
+                                               BCM2835_IC_GPU_IRQ,
+                                               RPI4_GPU_INTERRUPT_DMA15));
+
+    /* Map MPHI to BCM2838 memory map */
+    mphi_mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s_base->mphi), 0);
+    memory_region_init_alias(&s->mphi_mr_alias, OBJECT(s), "mphi", mphi_mr, 0,
+                             BCM2838_MPHI_SIZE);
+    memory_region_add_subregion(&s_base->peri_mr, BCM2838_MPHI_OFFSET,
+                                &s->mphi_mr_alias);
+
+    /* PCIe Root Complex */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->pcie_host), errp)) {
+        return;
+    }
+    /* RC registers region */
+    regs_mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->pcie_host), 0);
+    memory_region_add_subregion(&s->peri_low_mr, PCIE_RC_OFFSET, regs_mr);
+    /* MMIO region */
+    mmio_mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->pcie_host), 1);
+    memory_region_init_alias(&s->pcie_mmio_alias, OBJECT(&s->pcie_host),
+                             "pcie-mmio", mmio_mr, PCIE_MMIO_OFFSET,
+                             PCIE_MMIO_SIZE);
+    memory_region_add_subregion(get_system_memory(), PCIE_MMIO_ARM_OFFSET,
+                                &s->pcie_mmio_alias);
+
+    create_unimp(s_base, &s->clkisp, "bcm2835-clkisp", CLOCK_ISP_OFFSET,
+                 CLOCK_ISP_SIZE);
+
+    /* GPIO */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
+        return;
+    }
+    memory_region_add_subregion(
+        &s_base->peri_mr, GPIO_OFFSET,
+        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio), 0));
+
+    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->gpio), "sd-bus");
+}
+
+static void bcm2838_peripherals_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    BCM2838PeripheralClass *bc = BCM2838_PERIPHERALS_CLASS(oc);
+    RaspiPeripheralBaseClass *bc_base = RASPI_PERIPHERALS_BASE_CLASS(oc);
+
+    bc->peri_low_size = 0x2000000;
+    bc_base->peri_size = 0x1800000;
+    dc->realize = bcm2838_peripherals_realize;
+}
+
+static const TypeInfo bcm2838_peripherals_type_info = {
+    .name = TYPE_BCM2838_PERIPHERALS,
+    .parent = TYPE_RASPI_PERIPHERALS_BASE,
+    .instance_size = sizeof(BCM2838PeripheralState),
+    .instance_init = bcm2838_peripherals_init,
+    .class_size = sizeof(BCM2838PeripheralClass),
+    .class_init = bcm2838_peripherals_class_init,
+};
+
+static void bcm2838_peripherals_register_types(void)
+{
+    type_register_static(&bcm2838_peripherals_type_info);
+}
+
+type_init(bcm2838_peripherals_register_types)
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index b545ba0e4f..2ed6793d86 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -38,6 +38,12 @@ arm_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
+arm_ss.add(when: 'CONFIG_RASPI4B', if_true: files(
+  'bcm2838_peripherals.c',
+  'bcm2838_pcie.c',
+  'bcm2838.c',
+  'raspi4b.c'
+))
 arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 92d068d1f9..8fff63eed0 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -17,13 +17,15 @@
 #include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "hw/arm/bcm2836.h"
+#include "hw/arm/raspi_platform.h"
 #include "hw/registerfields.h"
 #include "qemu/error-report.h"
-#include "hw/boards.h"
 #include "hw/loader.h"
-#include "hw/arm/boot.h"
 #include "qom/object.h"
 
+#define TYPE_RASPI_MACHINE  MACHINE_TYPE_NAME("raspi-common")
+OBJECT_DECLARE_SIMPLE_TYPE(RaspiMachineState, RASPI_MACHINE)
+
 #define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATAGS */
 #define MVBAR_ADDR      0x400 /* secure vectors */
 #define BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */
@@ -36,25 +38,10 @@
 
 struct RaspiMachineState {
     /*< private >*/
-    MachineState parent_obj;
+    RaspiBaseMachineState parent_obj;
     /*< public >*/
     BCM283XState soc;
-    struct arm_boot_info binfo;
 };
-typedef struct RaspiMachineState RaspiMachineState;
-
-struct RaspiMachineClass {
-    /*< private >*/
-    MachineClass parent_obj;
-    /*< public >*/
-    uint32_t board_rev;
-};
-typedef struct RaspiMachineClass RaspiMachineClass;
-
-#define TYPE_RASPI_MACHINE       MACHINE_TYPE_NAME("raspi-common")
-DECLARE_OBJ_CHECKERS(RaspiMachineState, RaspiMachineClass,
-                     RASPI_MACHINE, TYPE_RASPI_MACHINE)
-
 
 /*
  * Board revision codes:
@@ -71,6 +58,7 @@ typedef enum RaspiProcessorId {
     PROCESSOR_ID_BCM2835 = 0,
     PROCESSOR_ID_BCM2836 = 1,
     PROCESSOR_ID_BCM2837 = 2,
+    PROCESSOR_ID_BCM2838 = 3,
 } RaspiProcessorId;
 
 static const struct {
@@ -80,9 +68,10 @@ static const struct {
     [PROCESSOR_ID_BCM2835] = {TYPE_BCM2835, 1},
     [PROCESSOR_ID_BCM2836] = {TYPE_BCM2836, BCM283X_NCPUS},
     [PROCESSOR_ID_BCM2837] = {TYPE_BCM2837, BCM283X_NCPUS},
+    [PROCESSOR_ID_BCM2838] = {TYPE_BCM2838, BCM283X_NCPUS},
 };
 
-static uint64_t board_ram_size(uint32_t board_rev)
+uint64_t board_ram_size(uint32_t board_rev)
 {
     assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style */
     return 256 * MiB << FIELD_EX32(board_rev, REV_CODE, MEMORY_SIZE);
@@ -98,7 +87,7 @@ static RaspiProcessorId board_processor_id(uint32_t board_rev)
     return proc_id;
 }
 
-static const char *board_soc_type(uint32_t board_rev)
+const char *board_soc_type(uint32_t board_rev)
 {
     return soc_property[board_processor_id(board_rev)].type;
 }
@@ -196,13 +185,12 @@ static void reset_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
     cpu_set_pc(cs, info->smp_loader_start);
 }
 
-static void setup_boot(MachineState *machine, RaspiProcessorId processor_id,
-                       size_t ram_size)
+static void setup_boot(MachineState *machine, ARMCPU *cpu,
+                       RaspiProcessorId processor_id, size_t ram_size)
 {
-    RaspiMachineState *s = RASPI_MACHINE(machine);
+    RaspiBaseMachineState *s = RASPI_BASE_MACHINE(machine);
     int r;
 
-    s->binfo.board_id = MACH_TYPE_BCM2708;
     s->binfo.ram_size = ram_size;
 
     if (processor_id <= PROCESSOR_ID_BCM2836) {
@@ -248,16 +236,17 @@ static void setup_boot(MachineState *machine, RaspiProcessorId processor_id,
         s->binfo.firmware_loaded = true;
     }
 
-    arm_load_kernel(&s->soc.cpu[0].core, machine, &s->binfo);
+    arm_load_kernel(cpu, machine, &s->binfo);
 }
 
-static void raspi_machine_init(MachineState *machine)
+void raspi_base_machine_init(MachineState *machine,
+                             BCM283XBaseState *soc)
 {
-    RaspiMachineClass *mc = RASPI_MACHINE_GET_CLASS(machine);
-    RaspiMachineState *s = RASPI_MACHINE(machine);
+    RaspiBaseMachineClass *mc = RASPI_BASE_MACHINE_GET_CLASS(machine);
     uint32_t board_rev = mc->board_rev;
     uint64_t ram_size = board_ram_size(board_rev);
-    uint32_t vcram_size;
+    uint32_t vcram_base, vcram_size;
+    size_t boot_ram_size;
     DriveInfo *di;
     BlockBackend *blk;
     BusState *bus;
@@ -275,17 +264,14 @@ static void raspi_machine_init(MachineState *machine)
                                         machine->ram, 0);
 
     /* Setup the SOC */
-    object_initialize_child(OBJECT(machine), "soc", &s->soc,
-                            board_soc_type(board_rev));
-    object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(machine->ram));
-    object_property_set_int(OBJECT(&s->soc), "board-rev", board_rev,
-                            &error_abort);
-    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
+    object_property_add_const_link(OBJECT(soc), "ram", OBJECT(machine->ram));
+    object_property_set_int(OBJECT(soc), "board-rev", board_rev, &error_abort);
+    qdev_realize(DEVICE(soc), NULL, &error_fatal);
 
     /* Create and plug in the SD cards */
     di = drive_get(IF_SD, 0, 0);
     blk = di ? blk_by_legacy_dinfo(di) : NULL;
-    bus = qdev_get_child_bus(DEVICE(&s->soc), "sd-bus");
+    bus = qdev_get_child_bus(DEVICE(soc), "sd-bus");
     if (bus == NULL) {
         error_report("No SD bus found in SOC object");
         exit(1);
@@ -294,19 +280,41 @@ static void raspi_machine_init(MachineState *machine)
     qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
     qdev_realize_and_unref(carddev, bus, &error_fatal);
 
-    vcram_size = object_property_get_uint(OBJECT(&s->soc), "vcram-size",
+    vcram_size = object_property_get_uint(OBJECT(soc), "vcram-size",
+                                          &error_abort);
+    vcram_base = object_property_get_uint(OBJECT(soc), "vcram-base",
                                           &error_abort);
-    setup_boot(machine, board_processor_id(mc->board_rev),
-               machine->ram_size - vcram_size);
+    if (!vcram_base) {
+        boot_ram_size = (ram_size > UPPER_RAM_BASE ? UPPER_RAM_BASE : ram_size)
+            - vcram_size;
+    } else {
+        boot_ram_size = (vcram_base + vcram_size > UPPER_RAM_BASE ?
+                                UPPER_RAM_BASE - vcram_size : vcram_base);
+    }
+    setup_boot(machine, &soc->cpu[0].core, board_processor_id(board_rev),
+               boot_ram_size);
+}
+
+static void raspi_machine_init(MachineState *machine)
+{
+    RaspiMachineState *s = RASPI_MACHINE(machine);
+    RaspiBaseMachineState *s_base = RASPI_BASE_MACHINE(machine);
+    RaspiBaseMachineClass *mc = RASPI_BASE_MACHINE_GET_CLASS(machine);
+    BCM283XState *soc = &s->soc;
+
+    s_base->binfo.board_id = MACH_TYPE_BCM2708;
+
+    object_initialize_child(OBJECT(machine), "soc", soc,
+                            board_soc_type(mc->board_rev));
+    raspi_base_machine_init(machine, &soc->parent_obj);
 }
 
-static void raspi_machine_class_common_init(MachineClass *mc,
-                                            uint32_t board_rev)
+void raspi_machine_class_common_init(MachineClass *mc,
+                                     uint32_t board_rev)
 {
     mc->desc = g_strdup_printf("Raspberry Pi %s (revision 1.%u)",
                                board_type(board_rev),
                                FIELD_EX32(board_rev, REV_CODE, REVISION));
-    mc->init = raspi_machine_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
     mc->no_floppy = 1;
@@ -316,50 +324,57 @@ static void raspi_machine_class_common_init(MachineClass *mc,
     mc->default_ram_id = "ram";
 };
 
+static void raspi_machine_class_init(MachineClass *mc,
+                                     uint32_t board_rev)
+{
+    raspi_machine_class_common_init(mc, board_rev);
+    mc->init = raspi_machine_init;
+};
+
 static void raspi0_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
-    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+    RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
 
     rmc->board_rev = 0x920092; /* Revision 1.2 */
-    raspi_machine_class_common_init(mc, rmc->board_rev);
+    raspi_machine_class_init(mc, rmc->board_rev);
 };
 
 static void raspi1ap_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
-    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+    RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
 
     rmc->board_rev = 0x900021; /* Revision 1.1 */
-    raspi_machine_class_common_init(mc, rmc->board_rev);
+    raspi_machine_class_init(mc, rmc->board_rev);
 };
 
 static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
-    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+    RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
 
     rmc->board_rev = 0xa21041;
-    raspi_machine_class_common_init(mc, rmc->board_rev);
+    raspi_machine_class_init(mc, rmc->board_rev);
 };
 
 #ifdef TARGET_AARCH64
 static void raspi3ap_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
-    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+    RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
 
     rmc->board_rev = 0x9020e0; /* Revision 1.0 */
-    raspi_machine_class_common_init(mc, rmc->board_rev);
+    raspi_machine_class_init(mc, rmc->board_rev);
 };
 
 static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
-    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+    RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
 
     rmc->board_rev = 0xa02082;
-    raspi_machine_class_common_init(mc, rmc->board_rev);
+    raspi_machine_class_init(mc, rmc->board_rev);
 };
 #endif /* TARGET_AARCH64 */
 
@@ -388,9 +403,14 @@ static const TypeInfo raspi_machine_types[] = {
 #endif
     }, {
         .name           = TYPE_RASPI_MACHINE,
-        .parent         = TYPE_MACHINE,
+        .parent         = TYPE_RASPI_BASE_MACHINE,
         .instance_size  = sizeof(RaspiMachineState),
-        .class_size     = sizeof(RaspiMachineClass),
+        .abstract       = true,
+    }, {
+        .name           = TYPE_RASPI_BASE_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .instance_size  = sizeof(RaspiBaseMachineState),
+        .class_size     = sizeof(RaspiBaseMachineClass),
         .abstract       = true,
     }
 };
diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
new file mode 100644
index 0000000000..6ce15ecd62
--- /dev/null
+++ b/hw/arm/raspi4b.c
@@ -0,0 +1,232 @@
+/*
+ * Raspberry Pi 4B emulation
+ *
+ * Copyright (C) 2022 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/cutils.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "hw/arm/raspi_platform.h"
+#include "hw/display/bcm2835_fb.h"
+#include "hw/registerfields.h"
+#include "qemu/error-report.h"
+#include "sysemu/device_tree.h"
+#include "hw/boards.h"
+#include "hw/loader.h"
+#include "hw/arm/boot.h"
+#include "qom/object.h"
+#include "hw/arm/bcm2838.h"
+#include <libfdt.h>
+
+#define TYPE_RASPI4B_MACHINE MACHINE_TYPE_NAME("raspi4b-common")
+OBJECT_DECLARE_SIMPLE_TYPE(Raspi4bMachineState, RASPI4B_MACHINE)
+
+struct Raspi4bMachineState {
+    /*< private >*/
+    RaspiBaseMachineState parent_obj;
+    /*< public >*/
+    BCM2838State soc;
+    uint32_t vcram_base;
+    uint32_t vcram_size;
+};
+
+
+static int raspi_add_memory_node(void *fdt, hwaddr mem_base, hwaddr mem_len)
+{
+    int ret;
+    uint32_t acells, scells;
+    char *nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
+
+    acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells",
+                                   NULL, &error_fatal);
+    scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells",
+                                   NULL, &error_fatal);
+    if (acells == 0 || scells == 0) {
+        fprintf(stderr, "dtb file invalid (#address-cells or #size-cells 0)\n");
+        ret = -1;
+    } else {
+        qemu_fdt_add_subnode(fdt, nodename);
+        qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
+        ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
+                                           acells, mem_base,
+                                           scells, mem_len);
+    }
+
+    g_free(nodename);
+    return ret;
+}
+
+static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
+{
+    uint64_t ram_size = board_ram_size(info->board_id);
+    int offset;
+
+    offset = fdt_node_offset_by_compatible(fdt, -1, "brcm,bcm2711-genet-v5");
+    if (offset >= 0) {
+        if (!fdt_nop_node(fdt, offset)) {
+            warn_report("dtc: bcm2711-genet-v5 removed!");
+        }
+    }
+
+    if (ram_size > UPPER_RAM_BASE) {
+        raspi_add_memory_node(fdt, UPPER_RAM_BASE, ram_size - UPPER_RAM_BASE);
+    }
+}
+
+static void raspi4b_machine_init(MachineState *machine)
+{
+    Raspi4bMachineState *s = RASPI4B_MACHINE(machine);
+    RaspiBaseMachineState *s_base = RASPI_BASE_MACHINE(machine);
+    RaspiBaseMachineClass *mc = RASPI_BASE_MACHINE_GET_CLASS(machine);
+    BCM2838State *soc = &s->soc;
+
+    s_base->binfo.modify_dtb = raspi4_modify_dtb;
+    /*
+     * Hack to get board revision during device tree modification without
+     * changes of common code.
+     * The correct way is to set board_id to MACH_TYPE_BCM2708 and add board_rev
+     * to the arm_boot_info structure.
+     */
+    s_base->binfo.board_id = mc->board_rev;
+
+    object_initialize_child(OBJECT(machine), "soc", soc,
+                            board_soc_type(mc->board_rev));
+
+    if (s->vcram_base) {
+        object_property_set_uint(OBJECT(soc), "vcram-base", s->vcram_base, NULL);
+    }
+
+    if (s->vcram_size) {
+        object_property_set_uint(OBJECT(soc), "vcram-size", s->vcram_size, NULL);
+    }
+
+    raspi_base_machine_init(machine, &soc->parent_obj);
+}
+
+static void get_vcram_base(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    Raspi4bMachineState *ms = RASPI4B_MACHINE(obj);
+    hwaddr value = ms->vcram_base;
+
+    visit_type_uint64(v, name, &value, errp);
+}
+
+static void set_vcram_base(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    Raspi4bMachineState *ms = RASPI4B_MACHINE(obj);
+    hwaddr value;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    ms->vcram_base = value;
+}
+
+static void get_vcram_size(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    Raspi4bMachineState *ms = RASPI4B_MACHINE(obj);
+    hwaddr value = ms->vcram_size;
+
+    visit_type_uint64(v, name, &value, errp);
+}
+
+static void set_vcram_size(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    Raspi4bMachineState *ms = RASPI4B_MACHINE(obj);
+    hwaddr value;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    ms->vcram_size = value;
+}
+
+static void raspi4b_machine_class_init(MachineClass *mc,
+                                       uint32_t board_rev)
+{
+    object_class_property_add(OBJECT_CLASS(mc), "vcram-size", "uint32",
+                              get_vcram_size, set_vcram_size, NULL, NULL);
+    object_class_property_set_description(OBJECT_CLASS(mc), "vcram-size",
+                                            "VideoCore RAM base address");
+    object_class_property_add(OBJECT_CLASS(mc), "vcram-base", "uint32",
+                              get_vcram_base, set_vcram_base, NULL, NULL);
+    object_class_property_set_description(OBJECT_CLASS(mc), "vcram-base",
+                                            "VideoCore RAM size");
+
+    raspi_machine_class_common_init(mc, board_rev);
+    mc->init = raspi4b_machine_init;
+}
+
+static void raspi4b1g_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
+
+    rmc->board_rev = 0xa03111;
+    raspi4b_machine_class_init(mc, rmc->board_rev);
+}
+
+static void raspi4b2g_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
+
+    rmc->board_rev = 0xb03112;
+    raspi4b_machine_class_init(mc, rmc->board_rev);
+}
+
+static void raspi4b4g_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
+
+    rmc->board_rev = 0xc03114;
+    raspi4b_machine_class_init(mc, rmc->board_rev);
+}
+
+static void raspi4b8g_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiBaseMachineClass *rmc = RASPI_BASE_MACHINE_CLASS(oc);
+
+    rmc->board_rev = 0xd03114;
+    raspi4b_machine_class_init(mc, rmc->board_rev);
+}
+
+static const TypeInfo raspi4b_machine_types[] = {
+    {
+        .name           = MACHINE_TYPE_NAME("raspi4b1g"),
+        .parent         = TYPE_RASPI4B_MACHINE,
+        .class_init     = raspi4b1g_machine_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("raspi4b2g"),
+        .parent         = TYPE_RASPI4B_MACHINE,
+        .class_init     = raspi4b2g_machine_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("raspi4b4g"),
+        .parent         = TYPE_RASPI4B_MACHINE,
+        .class_init     = raspi4b4g_machine_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("raspi4b8g"),
+        .parent         = TYPE_RASPI4B_MACHINE,
+        .class_init     = raspi4b8g_machine_class_init,
+    }, {
+        .name           = TYPE_RASPI4B_MACHINE,
+        .parent         = TYPE_RASPI_BASE_MACHINE,
+        .instance_size  = sizeof(Raspi4bMachineState),
+        .abstract       = true,
+    }
+};
+
+DEFINE_TYPES(raspi4b_machine_types)
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 2dee296c8f..b8881277f6 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -53,3 +53,9 @@ smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
 smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
 
+# bcm2838_pcie.c
+bcm2838_pcie_host_read(unsigned int size, uint64_t offset, uint64_t value) "%u bytes @ 0x%04"PRIx64": 0x%016"PRIx64
+bcm2838_pcie_host_write(unsigned int size, uint64_t offset, uint64_t value) "%u bytes @ 0x%04"PRIx64": 0x%016"PRIx64
+
+# bcm2838.c
+bcm2838_gic_set_irq(int irq, int level) "gic irq:%d lvl:%d"
diff --git a/hw/gpio/bcm2838_gpio.c b/hw/gpio/bcm2838_gpio.c
new file mode 100644
index 0000000000..f1899129c7
--- /dev/null
+++ b/hw/gpio/bcm2838_gpio.c
@@ -0,0 +1,395 @@
+/*
+ * Raspberry Pi (BCM2838) GPIO Controller
+ * This implementation is based on bcm2835_gpio (hw/gpio/bcm2835_gpio.c)
+ *
+ * Copyright (c) 2022 Auriga LLC
+ *
+ * Authors:
+ *  Lotosh, Aleksey <aleksey.lotosh@auriga.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/timer.h"
+#include "qapi/error.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "hw/sd/sd.h"
+#include "hw/gpio/bcm2838_gpio.h"
+#include "hw/irq.h"
+
+#define GPFSEL0   0x00
+#define GPFSEL1   0x04
+#define GPFSEL2   0x08
+#define GPFSEL3   0x0C
+#define GPFSEL4   0x10
+#define GPFSEL5   0x14
+#define GPSET0    0x1C
+#define GPSET1    0x20
+#define GPCLR0    0x28
+#define GPCLR1    0x2C
+#define GPLEV0    0x34
+#define GPLEV1    0x38
+#define GPEDS0    0x40
+#define GPEDS1    0x44
+#define GPREN0    0x4C
+#define GPREN1    0x50
+#define GPFEN0    0x58
+#define GPFEN1    0x5C
+#define GPHEN0    0x64
+#define GPHEN1    0x68
+#define GPLEN0    0x70
+#define GPLEN1    0x74
+#define GPAREN0   0x7C
+#define GPAREN1   0x80
+#define GPAFEN0   0x88
+#define GPAFEN1   0x8C
+
+#define GPIO_PUP_PDN_CNTRL_REG0 0xE4
+#define GPIO_PUP_PDN_CNTRL_REG1 0xE8
+#define GPIO_PUP_PDN_CNTRL_REG2 0xEC
+#define GPIO_PUP_PDN_CNTRL_REG3 0xF0
+
+#define RESET_VAL_CNTRL_REG0 0xAAA95555;
+#define RESET_VAL_CNTRL_REG1 0xA0AAAAAA;
+#define RESET_VAL_CNTRL_REG2 0x50AAA95A;
+#define RESET_VAL_CNTRL_REG3 0x00055555;
+
+#define NUM_FSELN_IN_GPFSELN 10
+#define NUM_BITS_FSELN       3
+#define MASK_FSELN           0x7
+
+#define BYTES_IN_WORD        4
+
+/* bcm,function property */
+#define BCM2838_FSEL_GPIO_IN    0
+#define BCM2838_FSEL_GPIO_OUT   1
+#define BCM2838_FSEL_ALT5       2
+#define BCM2838_FSEL_ALT4       3
+#define BCM2838_FSEL_ALT0       4
+#define BCM2838_FSEL_ALT1       5
+#define BCM2838_FSEL_ALT2       6
+#define BCM2838_FSEL_ALT3       7
+
+static uint32_t gpfsel_get(BCM2838GpioState *s, uint8_t reg)
+{
+    int i;
+    uint32_t value = 0;
+    for (i = 0; i < NUM_FSELN_IN_GPFSELN; i++) {
+        uint32_t index = NUM_FSELN_IN_GPFSELN * reg + i;
+        if (index < sizeof(s->fsel)) {
+            value |= (s->fsel[index] & MASK_FSELN) << (NUM_BITS_FSELN * i);
+        }
+    }
+    return value;
+}
+
+static void gpfsel_set(BCM2838GpioState *s, uint8_t reg, uint32_t value)
+{
+    int i;
+    for (i = 0; i < NUM_FSELN_IN_GPFSELN; i++) {
+        uint32_t index = NUM_FSELN_IN_GPFSELN * reg + i;
+        if (index < sizeof(s->fsel)) {
+            int fsel = (value >> (NUM_BITS_FSELN * i)) & MASK_FSELN;
+            s->fsel[index] = fsel;
+        }
+    }
+
+    /* SD controller selection (48-53) */
+    if (s->sd_fsel != BCM2838_FSEL_GPIO_IN
+        && (s->fsel[48] == BCM2838_FSEL_GPIO_IN)
+        && (s->fsel[49] == BCM2838_FSEL_GPIO_IN)
+        && (s->fsel[50] == BCM2838_FSEL_GPIO_IN)
+        && (s->fsel[51] == BCM2838_FSEL_GPIO_IN)
+        && (s->fsel[52] == BCM2838_FSEL_GPIO_IN)
+        && (s->fsel[53] == BCM2838_FSEL_GPIO_IN)
+       ) {
+        /* SDHCI controller selected */
+        sdbus_reparent_card(s->sdbus_sdhost, s->sdbus_sdhci);
+        s->sd_fsel = BCM2838_FSEL_GPIO_IN;
+    } else if (s->sd_fsel != BCM2838_FSEL_ALT0
+               && (s->fsel[48] == BCM2838_FSEL_ALT0) /* SD_CLK_R */
+               && (s->fsel[49] == BCM2838_FSEL_ALT0) /* SD_CMD_R */
+               && (s->fsel[50] == BCM2838_FSEL_ALT0) /* SD_DATA0_R */
+               && (s->fsel[51] == BCM2838_FSEL_ALT0) /* SD_DATA1_R */
+               && (s->fsel[52] == BCM2838_FSEL_ALT0) /* SD_DATA2_R */
+               && (s->fsel[53] == BCM2838_FSEL_ALT0) /* SD_DATA3_R */
+              ) {
+        /* SDHost controller selected */
+        sdbus_reparent_card(s->sdbus_sdhci, s->sdbus_sdhost);
+        s->sd_fsel = BCM2838_FSEL_ALT0;
+    }
+}
+
+static int gpfsel_is_out(BCM2838GpioState *s, int index)
+{
+    if (index >= 0 && index < BCM2838_GPIO_NUM) {
+        return s->fsel[index] == 1;
+    }
+    return 0;
+}
+
+static void gpset(BCM2838GpioState *s, uint32_t val, uint8_t start,
+                  uint8_t count, uint32_t *lev)
+{
+    uint32_t changes = val & ~*lev;
+    uint32_t cur = 1;
+
+    int i;
+    for (i = 0; i < count; i++) {
+        if ((changes & cur) && (gpfsel_is_out(s, start + i))) {
+            qemu_set_irq(s->out[start + i], 1);
+        }
+        cur <<= 1;
+    }
+
+    *lev |= val;
+}
+
+static void gpclr(BCM2838GpioState *s, uint32_t val, uint8_t start,
+                  uint8_t count, uint32_t *lev)
+{
+    uint32_t changes = val & *lev;
+    uint32_t cur = 1;
+
+    int i;
+    for (i = 0; i < count; i++) {
+        if ((changes & cur) && (gpfsel_is_out(s, start + i))) {
+            qemu_set_irq(s->out[start + i], 0);
+        }
+        cur <<= 1;
+    }
+
+    *lev &= ~val;
+}
+
+static uint64_t bcm2838_gpio_read(void *opaque, hwaddr offset, unsigned size)
+{
+    BCM2838GpioState *s = (BCM2838GpioState *)opaque;
+    uint64_t value = 0;
+
+    switch (offset) {
+    case GPFSEL0:
+    case GPFSEL1:
+    case GPFSEL2:
+    case GPFSEL3:
+    case GPFSEL4:
+    case GPFSEL5:
+        value = gpfsel_get(s, offset / BYTES_IN_WORD);
+        break;
+    case GPSET0:
+    case GPSET1:
+    case GPCLR0:
+    case GPCLR1:
+        /* Write Only */
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: %s: Attempt reading from write only"
+                      " register. %lu will be returned. Address 0x%"HWADDR_PRIx
+                      ", size %u\n", TYPE_BCM2838_GPIO, __func__, value, offset,
+                      size);
+        break;
+    case GPLEV0:
+        value = s->lev0;
+        break;
+    case GPLEV1:
+        value = s->lev1;
+        break;
+    case GPEDS0:
+    case GPEDS1:
+    case GPREN0:
+    case GPREN1:
+    case GPFEN0:
+    case GPFEN1:
+    case GPHEN0:
+    case GPHEN1:
+    case GPLEN0:
+    case GPLEN1:
+    case GPAREN0:
+    case GPAREN1:
+    case GPAFEN0:
+    case GPAFEN1:
+        /* Not implemented */
+        qemu_log_mask(LOG_UNIMP, "%s: %s: not implemented for %"HWADDR_PRIx"\n",
+                      TYPE_BCM2838_GPIO, __func__, offset);
+        break;
+    case GPIO_PUP_PDN_CNTRL_REG0:
+    case GPIO_PUP_PDN_CNTRL_REG1:
+    case GPIO_PUP_PDN_CNTRL_REG2:
+    case GPIO_PUP_PDN_CNTRL_REG3:
+        value = s->pup_cntrl_reg[(offset - GPIO_PUP_PDN_CNTRL_REG0)
+                                 / sizeof(s->pup_cntrl_reg[0])];
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: %s: bad offset %"HWADDR_PRIx"\n",
+                      TYPE_BCM2838_GPIO, __func__, offset);
+        break;
+    }
+
+    return value;
+}
+
+static void bcm2838_gpio_write(void *opaque, hwaddr offset, uint64_t value,
+                               unsigned size)
+{
+    BCM2838GpioState *s = (BCM2838GpioState *)opaque;
+
+    switch (offset) {
+    case GPFSEL0:
+    case GPFSEL1:
+    case GPFSEL2:
+    case GPFSEL3:
+    case GPFSEL4:
+    case GPFSEL5:
+        gpfsel_set(s, offset / BYTES_IN_WORD, value);
+        break;
+    case GPSET0:
+        gpset(s, value, 0, 32, &s->lev0);
+        break;
+    case GPSET1:
+        gpset(s, value, 32, 22, &s->lev1);
+        break;
+    case GPCLR0:
+        gpclr(s, value, 0, 32, &s->lev0);
+        break;
+    case GPCLR1:
+        gpclr(s, value, 32, 22, &s->lev1);
+        break;
+    case GPLEV0:
+    case GPLEV1:
+        /* Read Only */
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: %s: Attempt writing %lu to read "
+                      "only register. Ignored. Address 0x%"HWADDR_PRIx", size "
+                      "%u\n", TYPE_BCM2838_GPIO, __func__, value, offset, size);
+        break;
+    case GPEDS0:
+    case GPEDS1:
+    case GPREN0:
+    case GPREN1:
+    case GPFEN0:
+    case GPFEN1:
+    case GPHEN0:
+    case GPHEN1:
+    case GPLEN0:
+    case GPLEN1:
+    case GPAREN0:
+    case GPAREN1:
+    case GPAFEN0:
+    case GPAFEN1:
+        /* Not implemented */
+        qemu_log_mask(LOG_UNIMP, "%s: %s: not implemented for %"HWADDR_PRIx"\n",
+                      TYPE_BCM2838_GPIO, __func__, offset);
+        break;
+    case GPIO_PUP_PDN_CNTRL_REG0:
+    case GPIO_PUP_PDN_CNTRL_REG1:
+    case GPIO_PUP_PDN_CNTRL_REG2:
+    case GPIO_PUP_PDN_CNTRL_REG3:
+        s->pup_cntrl_reg[(offset - GPIO_PUP_PDN_CNTRL_REG0)
+                         / sizeof(s->pup_cntrl_reg[0])] = value;
+        break;
+    default:
+        goto err_out;
+    }
+    return;
+
+err_out:
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: %s: bad offset %"HWADDR_PRIx"\n",
+                  TYPE_BCM2838_GPIO, __func__, offset);
+}
+
+static void bcm2838_gpio_reset(DeviceState *dev)
+{
+    BCM2838GpioState *s = BCM2838_GPIO(dev);
+
+    int i;
+    for (i = 0; i < 6; i++) {
+        gpfsel_set(s, i, 0);
+    }
+
+    s->sd_fsel = 0;
+
+    /* SDHCI is selected by default */
+    sdbus_reparent_card(&s->sdbus, s->sdbus_sdhci);
+
+    s->lev0 = 0;
+    s->lev1 = 0;
+
+    s->pup_cntrl_reg[0] = RESET_VAL_CNTRL_REG0;
+    s->pup_cntrl_reg[1] = RESET_VAL_CNTRL_REG1;
+    s->pup_cntrl_reg[2] = RESET_VAL_CNTRL_REG2;
+    s->pup_cntrl_reg[3] = RESET_VAL_CNTRL_REG3;
+}
+
+static const MemoryRegionOps bcm2838_gpio_ops = {
+    .read = bcm2838_gpio_read,
+    .write = bcm2838_gpio_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static const VMStateDescription vmstate_bcm2838_gpio = {
+    .name = "bcm2838_gpio",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(fsel, BCM2838GpioState, BCM2838_GPIO_NUM),
+        VMSTATE_UINT32(lev0, BCM2838GpioState),
+        VMSTATE_UINT32(lev1, BCM2838GpioState),
+        VMSTATE_UINT8(sd_fsel, BCM2838GpioState),
+        VMSTATE_UINT32_ARRAY(pup_cntrl_reg, BCM2838GpioState,
+                             GPIO_PUP_PDN_CNTRL_NUM),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2838_gpio_init(Object *obj)
+{
+    BCM2838GpioState *s = BCM2838_GPIO(obj);
+    DeviceState *dev = DEVICE(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    qbus_init(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS, DEVICE(s), "sd-bus");
+
+    memory_region_init_io(
+        &s->iomem, obj,
+        &bcm2838_gpio_ops, s, "bcm2838_gpio", BCM2838_GPIO_REGS_SIZE);
+    sysbus_init_mmio(sbd, &s->iomem);
+    qdev_init_gpio_out(dev, s->out, BCM2838_GPIO_NUM);
+}
+
+static void bcm2838_gpio_realize(DeviceState *dev, Error **errp)
+{
+    BCM2838GpioState *s = BCM2838_GPIO(dev);
+    Object *obj;
+
+    obj = object_property_get_link(OBJECT(dev), "sdbus-sdhci", &error_abort);
+    s->sdbus_sdhci = SD_BUS(obj);
+
+    obj = object_property_get_link(OBJECT(dev), "sdbus-sdhost", &error_abort);
+    s->sdbus_sdhost = SD_BUS(obj);
+}
+
+static void bcm2838_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_bcm2838_gpio;
+    dc->realize = &bcm2838_gpio_realize;
+    dc->reset = &bcm2838_gpio_reset;
+}
+
+static const TypeInfo bcm2838_gpio_info = {
+    .name          = TYPE_BCM2838_GPIO,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2838GpioState),
+    .instance_init = bcm2838_gpio_init,
+    .class_init    = bcm2838_gpio_class_init,
+};
+
+static void bcm2838_gpio_register_types(void)
+{
+    type_register_static(&bcm2838_gpio_info);
+}
+
+type_init(bcm2838_gpio_register_types)
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index b726e6d27a..c1dc2bdd06 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -10,5 +10,6 @@ softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c'))
+softmmu_ss.add(when: 'CONFIG_RASPI4B', if_true: files('bcm2838_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true: files('sifive_gpio.c'))
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 890ae7bae5..d2fec2a0e5 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -16,6 +16,52 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
+#include "hw/arm/raspi_platform.h"
+#include "hw/misc/raspberrypi-fw-defs.h"
+
+#define RPI_EXP_GPIO_BASE       128
+#define VC4_GPIO_EXPANDER_COUNT 8
+
+struct vc4_display_settings_t {
+    uint32_t display_num;
+    uint32_t width;
+    uint32_t height;
+    uint32_t depth;
+    uint16_t pitch;
+    uint32_t virtual_width;
+    uint32_t virtual_height;
+    uint16_t virtual_width_offset;
+    uint32_t virtual_height_offset;
+    unsigned long fb_bus_address;
+} QEMU_PACKED;
+
+enum rpi_firmware_clk_id {
+    RPI_FIRMWARE_EMMC_CLK_ID = 1,
+    RPI_FIRMWARE_UART_CLK_ID,
+    RPI_FIRMWARE_ARM_CLK_ID,
+    RPI_FIRMWARE_CORE_CLK_ID,
+    RPI_FIRMWARE_V3D_CLK_ID,
+    RPI_FIRMWARE_H264_CLK_ID,
+    RPI_FIRMWARE_ISP_CLK_ID,
+    RPI_FIRMWARE_SDRAM_CLK_ID,
+    RPI_FIRMWARE_PIXEL_CLK_ID,
+    RPI_FIRMWARE_PWM_CLK_ID,
+    RPI_FIRMWARE_HEVC_CLK_ID,
+    RPI_FIRMWARE_EMMC2_CLK_ID,
+    RPI_FIRMWARE_M2MC_CLK_ID,
+    RPI_FIRMWARE_PIXEL_BVB_CLK_ID,
+    RPI_FIRMWARE_VEC_CLK_ID,
+    RPI_FIRMWARE_NUM_CLK_ID,
+};
+
+struct vc4_gpio_expander_t {
+    uint32_t direction;
+    uint32_t polarity;
+    uint32_t term_en;
+    uint32_t term_pull_up;
+    uint32_t state;
+} vc4_gpio_expander[VC4_GPIO_EXPANDER_COUNT];
+
 
 /* https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface */
 
@@ -28,6 +74,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
     uint32_t tmp;
     int n;
     uint32_t offset, length, color;
+    uint32_t gpio_num;
 
     /*
      * Copy the current state of the framebuffer config; we will update
@@ -51,48 +98,48 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
         /* @(value + 8) : Request/response indicator */
         resplen = 0;
         switch (tag) {
-        case 0x00000000: /* End tag */
+        case RPI_FWREQ_PROPERTY_END: /* End tag */
             break;
-        case 0x00000001: /* Get firmware revision */
+        case RPI_FWREQ_GET_FIRMWARE_REVISION: /* Get firmware revision */
             stl_le_phys(&s->dma_as, value + 12, 346337);
             resplen = 4;
             break;
-        case 0x00010001: /* Get board model */
+        case RPI_FWREQ_GET_BOARD_MODEL: /* Get board model */
             qemu_log_mask(LOG_UNIMP,
                           "bcm2835_property: 0x%08x get board model NYI\n",
                           tag);
             resplen = 4;
             break;
-        case 0x00010002: /* Get board revision */
+        case RPI_FWREQ_GET_BOARD_REVISION: /* Get board revision */
             stl_le_phys(&s->dma_as, value + 12, s->board_rev);
             resplen = 4;
             break;
-        case 0x00010003: /* Get board MAC address */
+        case RPI_FWREQ_GET_BOARD_MAC_ADDRESS: /* Get board MAC address */
             resplen = sizeof(s->macaddr.a);
             dma_memory_write(&s->dma_as, value + 12, s->macaddr.a, resplen,
                              MEMTXATTRS_UNSPECIFIED);
             break;
-        case 0x00010004: /* Get board serial */
+        case RPI_FWREQ_GET_BOARD_SERIAL: /* Get board serial */
             qemu_log_mask(LOG_UNIMP,
                           "bcm2835_property: 0x%08x get board serial NYI\n",
                           tag);
             resplen = 8;
             break;
-        case 0x00010005: /* Get ARM memory */
+        case RPI_FWREQ_GET_ARM_MEMORY: /* Get ARM memory */
             /* base */
             stl_le_phys(&s->dma_as, value + 12, 0);
             /* size */
             stl_le_phys(&s->dma_as, value + 16, s->fbdev->vcram_base);
             resplen = 8;
             break;
-        case 0x00010006: /* Get VC memory */
+        case RPI_FWREQ_GET_VC_MEMORY: /* Get VC memory */
             /* base */
             stl_le_phys(&s->dma_as, value + 12, s->fbdev->vcram_base);
             /* size */
             stl_le_phys(&s->dma_as, value + 16, s->fbdev->vcram_size);
             resplen = 8;
             break;
-        case 0x00028001: /* Set power state */
+        case RPI_FWREQ_SET_POWER_STATE: /* Set power state */
             /* Assume that whatever device they asked for exists,
              * and we'll just claim we set it to the desired state
              */
@@ -103,38 +150,50 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
 
         /* Clocks */
 
-        case 0x00030001: /* Get clock state */
+        case RPI_FWREQ_GET_CLOCK_STATE: /* Get clock state */
             stl_le_phys(&s->dma_as, value + 16, 0x1);
             resplen = 8;
             break;
 
-        case 0x00038001: /* Set clock state */
+        case RPI_FWREQ_SET_CLOCK_STATE: /* Set clock state */
             qemu_log_mask(LOG_UNIMP,
                           "bcm2835_property: 0x%08x set clock state NYI\n",
                           tag);
             resplen = 8;
             break;
 
-        case 0x00030002: /* Get clock rate */
-        case 0x00030004: /* Get max clock rate */
-        case 0x00030007: /* Get min clock rate */
+        case RPI_FWREQ_GET_CLOCK_RATE: /* Get clock rate */
+        case RPI_FWREQ_GET_MAX_CLOCK_RATE: /* Get max clock rate */
+        case RPI_FWREQ_GET_MIN_CLOCK_RATE: /* Get min clock rate */
             switch (ldl_le_phys(&s->dma_as, value + 12)) {
-            case 1: /* EMMC */
-                stl_le_phys(&s->dma_as, value + 16, 50000000);
+            case RPI_FIRMWARE_EMMC_CLK_ID: /* EMMC */
+                stl_le_phys(&s->dma_as, value + 16, RPI_FIRMWARE_EMMC_CLK_RATE);
                 break;
-            case 2: /* UART */
-                stl_le_phys(&s->dma_as, value + 16, 3000000);
+            case RPI_FIRMWARE_UART_CLK_ID: /* UART */
+                stl_le_phys(&s->dma_as, value + 16, RPI_FIRMWARE_UART_CLK_RATE);
+                break;
+            case RPI_FIRMWARE_CORE_CLK_ID: /* Core Clock */
+                stl_le_phys(&s->dma_as, value + 16, RPI_FIRMWARE_CORE_CLK_RATE);
                 break;
             default:
-                stl_le_phys(&s->dma_as, value + 16, 700000000);
+                stl_le_phys(&s->dma_as, value + 16, RPI_FIRMWARE_DEFAULT_CLK_RATE);
                 break;
             }
             resplen = 8;
             break;
 
-        case 0x00038002: /* Set clock rate */
-        case 0x00038004: /* Set max clock rate */
-        case 0x00038007: /* Set min clock rate */
+        case RPI_FWREQ_GET_CLOCKS: /* Get clocks */
+            /* TODO: add more clock IDs if needed */
+            stl_le_phys(&s->dma_as, value + 12, 0);
+            stl_le_phys(&s->dma_as, value + 16, RPI_FIRMWARE_ARM_CLK_ID);
+            resplen = 8;
+            break;
+
+
+
+        case RPI_FWREQ_SET_CLOCK_RATE: /* Set clock rate */
+        case RPI_FWREQ_SET_MAX_CLOCK_RATE: /* Set max clock rate */
+        case RPI_FWREQ_SET_MIN_CLOCK_RATE: /* Set min clock rate */
             qemu_log_mask(LOG_UNIMP,
                           "bcm2835_property: 0x%08x set clock rate NYI\n",
                           tag);
@@ -143,121 +202,128 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
 
         /* Temperature */
 
-        case 0x00030006: /* Get temperature */
+        case RPI_FWREQ_GET_TEMPERATURE: /* Get temperature */
             stl_le_phys(&s->dma_as, value + 16, 25000);
             resplen = 8;
             break;
 
-        case 0x0003000A: /* Get max temperature */
+        case RPI_FWREQ_GET_MAX_TEMPERATURE: /* Get max temperature */
             stl_le_phys(&s->dma_as, value + 16, 99000);
             resplen = 8;
             break;
 
         /* Frame buffer */
 
-        case 0x00040001: /* Allocate buffer */
+        case RPI_FWREQ_FRAMEBUFFER_ALLOCATE: /* Allocate buffer */
             stl_le_phys(&s->dma_as, value + 12, fbconfig.base);
             stl_le_phys(&s->dma_as, value + 16,
                         bcm2835_fb_get_size(&fbconfig));
             resplen = 8;
             break;
-        case 0x00048001: /* Release buffer */
+        case RPI_FWREQ_FRAMEBUFFER_RELEASE: /* Release buffer */
             resplen = 0;
             break;
-        case 0x00040002: /* Blank screen */
+        case RPI_FWREQ_FRAMEBUFFER_BLANK: /* Blank screen */
             resplen = 4;
             break;
-        case 0x00044003: /* Test physical display width/height */
-        case 0x00044004: /* Test virtual display width/height */
+        /* Test physical display width/height */
+        case RPI_FWREQ_FRAMEBUFFER_TEST_PHYSICAL_WIDTH_HEIGHT:
+        /* Test virtual display width/height */
+        case RPI_FWREQ_FRAMEBUFFER_TEST_VIRTUAL_WIDTH_HEIGHT:
             resplen = 8;
             break;
-        case 0x00048003: /* Set physical display width/height */
+        /* Set physical display width/height */
+        case RPI_FWREQ_FRAMEBUFFER_SET_PHYSICAL_WIDTH_HEIGHT:
             fbconfig.xres = ldl_le_phys(&s->dma_as, value + 12);
             fbconfig.yres = ldl_le_phys(&s->dma_as, value + 16);
             bcm2835_fb_validate_config(&fbconfig);
             fbconfig_updated = true;
             /* fall through */
-        case 0x00040003: /* Get physical display width/height */
+        /* Get physical display width/height */
+        case RPI_FWREQ_FRAMEBUFFER_GET_PHYSICAL_WIDTH_HEIGHT:
             stl_le_phys(&s->dma_as, value + 12, fbconfig.xres);
             stl_le_phys(&s->dma_as, value + 16, fbconfig.yres);
             resplen = 8;
             break;
-        case 0x00048004: /* Set virtual display width/height */
+        /* Set virtual display width/height */
+        case RPI_FWREQ_FRAMEBUFFER_SET_VIRTUAL_WIDTH_HEIGHT:
             fbconfig.xres_virtual = ldl_le_phys(&s->dma_as, value + 12);
             fbconfig.yres_virtual = ldl_le_phys(&s->dma_as, value + 16);
             bcm2835_fb_validate_config(&fbconfig);
             fbconfig_updated = true;
             /* fall through */
-        case 0x00040004: /* Get virtual display width/height */
+        /* Get virtual display width/height */
+        case RPI_FWREQ_FRAMEBUFFER_GET_VIRTUAL_WIDTH_HEIGHT:
             stl_le_phys(&s->dma_as, value + 12, fbconfig.xres_virtual);
             stl_le_phys(&s->dma_as, value + 16, fbconfig.yres_virtual);
             resplen = 8;
             break;
-        case 0x00044005: /* Test depth */
+        case RPI_FWREQ_FRAMEBUFFER_TEST_DEPTH: /* Test depth */
             resplen = 4;
             break;
-        case 0x00048005: /* Set depth */
+        case RPI_FWREQ_FRAMEBUFFER_SET_DEPTH: /* Set depth */
             fbconfig.bpp = ldl_le_phys(&s->dma_as, value + 12);
             bcm2835_fb_validate_config(&fbconfig);
             fbconfig_updated = true;
             /* fall through */
-        case 0x00040005: /* Get depth */
+        case RPI_FWREQ_FRAMEBUFFER_GET_DEPTH: /* Get depth */
             stl_le_phys(&s->dma_as, value + 12, fbconfig.bpp);
             resplen = 4;
             break;
-        case 0x00044006: /* Test pixel order */
+        case RPI_FWREQ_FRAMEBUFFER_TEST_PIXEL_ORDER: /* Test pixel order */
             resplen = 4;
             break;
-        case 0x00048006: /* Set pixel order */
+        case RPI_FWREQ_FRAMEBUFFER_SET_PIXEL_ORDER: /* Set pixel order */
             fbconfig.pixo = ldl_le_phys(&s->dma_as, value + 12);
             bcm2835_fb_validate_config(&fbconfig);
             fbconfig_updated = true;
             /* fall through */
-        case 0x00040006: /* Get pixel order */
+        case RPI_FWREQ_FRAMEBUFFER_GET_PIXEL_ORDER: /* Get pixel order */
             stl_le_phys(&s->dma_as, value + 12, fbconfig.pixo);
             resplen = 4;
             break;
-        case 0x00044007: /* Test pixel alpha */
+        case RPI_FWREQ_FRAMEBUFFER_TEST_ALPHA_MODE: /* Test pixel alpha */
             resplen = 4;
             break;
-        case 0x00048007: /* Set alpha */
+        case RPI_FWREQ_FRAMEBUFFER_SET_ALPHA_MODE: /* Set alpha */
             fbconfig.alpha = ldl_le_phys(&s->dma_as, value + 12);
             bcm2835_fb_validate_config(&fbconfig);
             fbconfig_updated = true;
             /* fall through */
-        case 0x00040007: /* Get alpha */
+        case RPI_FWREQ_FRAMEBUFFER_GET_ALPHA_MODE: /* Get alpha */
             stl_le_phys(&s->dma_as, value + 12, fbconfig.alpha);
             resplen = 4;
             break;
-        case 0x00040008: /* Get pitch */
+        case RPI_FWREQ_FRAMEBUFFER_GET_PITCH: /* Get pitch */
             stl_le_phys(&s->dma_as, value + 12,
                         bcm2835_fb_get_pitch(&fbconfig));
             resplen = 4;
             break;
-        case 0x00044009: /* Test virtual offset */
+        /* Test virtual offset */
+        case RPI_FWREQ_FRAMEBUFFER_TEST_VIRTUAL_OFFSET:
             resplen = 8;
             break;
-        case 0x00048009: /* Set virtual offset */
+        case RPI_FWREQ_FRAMEBUFFER_SET_VIRTUAL_OFFSET: /* Set virtual offset */
             fbconfig.xoffset = ldl_le_phys(&s->dma_as, value + 12);
             fbconfig.yoffset = ldl_le_phys(&s->dma_as, value + 16);
             bcm2835_fb_validate_config(&fbconfig);
             fbconfig_updated = true;
             /* fall through */
-        case 0x00040009: /* Get virtual offset */
+        case RPI_FWREQ_FRAMEBUFFER_GET_VIRTUAL_OFFSET: /* Get virtual offset */
             stl_le_phys(&s->dma_as, value + 12, fbconfig.xoffset);
             stl_le_phys(&s->dma_as, value + 16, fbconfig.yoffset);
             resplen = 8;
             break;
-        case 0x0004000a: /* Get/Test/Set overscan */
-        case 0x0004400a:
-        case 0x0004800a:
+        case RPI_FWREQ_FRAMEBUFFER_GET_OVERSCAN: /* Get/Test/Set overscan */
+        case RPI_FWREQ_FRAMEBUFFER_TEST_OVERSCAN:
+        case RPI_FWREQ_FRAMEBUFFER_SET_OVERSCAN:
             stl_le_phys(&s->dma_as, value + 12, 0);
             stl_le_phys(&s->dma_as, value + 16, 0);
             stl_le_phys(&s->dma_as, value + 20, 0);
             stl_le_phys(&s->dma_as, value + 24, 0);
             resplen = 16;
             break;
-        case 0x0004800b: /* Set palette */
+        case RPI_FWREQ_FRAMEBUFFER_SET_PALETTE: /* Set palette */
             offset = ldl_le_phys(&s->dma_as, value + 12);
             length = ldl_le_phys(&s->dma_as, value + 16);
             n = 0;
@@ -270,21 +336,161 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             stl_le_phys(&s->dma_as, value + 12, 0);
             resplen = 4;
             break;
-        case 0x00040013: /* Get number of displays */
-            stl_le_phys(&s->dma_as, value + 12, 1);
-            resplen = 4;
-            break;
 
-        case 0x00060001: /* Get DMA channels */
+        case RPI_FWREQ_GET_DMA_CHANNELS: /* Get DMA channels */
             /* channels 2-5 */
             stl_le_phys(&s->dma_as, value + 12, 0x003C);
             resplen = 4;
             break;
 
-        case 0x00050001: /* Get command line */
+        case RPI_FWREQ_GET_COMMAND_LINE: /* Get command line */
+            resplen = 0;
+            break;
+
+        case RPI_FWREQ_GET_THROTTLED: /* Get throttled */
+            stl_le_phys(&s->dma_as, value + 12, 0);
+            resplen = 4;
+            break;
+
+        /* Get number of displays */
+        case RPI_FWREQ_FRAMEBUFFER_GET_NUM_DISPLAYS:
+            stl_le_phys(&s->dma_as, value + 12, 1);
+            resplen = 4;
+            break;
+
+        /* Get display settings*/
+        case RPI_FWREQ_FRAMEBUFFER_GET_DISPLAY_SETTINGS:
+            stl_le_phys(&s->dma_as, value + 12, 0); /* display_num */
+            stl_le_phys(&s->dma_as, value + 16, 800); /* width */
+            stl_le_phys(&s->dma_as, value + 20, 600); /* height */
+            stl_le_phys(&s->dma_as, value + 24, 32); /* depth */
+            stl_le_phys(&s->dma_as, value + 28, 32); /* pitch */
+            stl_le_phys(&s->dma_as, value + 30, 0); /* virtual_width */
+            stl_le_phys(&s->dma_as, value + 34, 0); /* virtual_height */
+            stl_le_phys(&s->dma_as, value + 38, 0); /* virtual_width_offset */
+            stl_le_phys(&s->dma_as, value + 40, 0); /* virtual_height_offset */
+            stl_le_phys(&s->dma_as, value + 44, 0); /* fb_bus_address low */
+            stl_le_phys(&s->dma_as, value + 48, 0); /* fb_bus_address hi */
+            resplen = sizeof(struct vc4_display_settings_t);
+            break;
+
+        case RPI_FWREQ_FRAMEBUFFER_SET_PITCH: /* Set Pitch */
             resplen = 0;
             break;
 
+        case RPI_FWREQ_GET_GPIO_CONFIG:
+            if (ldl_le_phys(&s->dma_as, value + 12) < RPI_EXP_GPIO_BASE) {
+                qemu_log_mask(LOG_UNIMP, "RPI_FWREQ_GET_GPIO_CONFIG "
+                              "not implemented for gpiochip0\n");
+            } else {
+                gpio_num = ldl_le_phys(&s->dma_as, value + 12)
+                           - RPI_EXP_GPIO_BASE;
+
+                if (gpio_num < VC4_GPIO_EXPANDER_COUNT) {
+                    stl_le_phys(&s->dma_as, value + 16,
+                                vc4_gpio_expander[gpio_num].direction);
+                    stl_le_phys(&s->dma_as, value + 20,
+                                vc4_gpio_expander[gpio_num].polarity);
+                    stl_le_phys(&s->dma_as, value + 24,
+                                vc4_gpio_expander[gpio_num].term_en);
+                    stl_le_phys(&s->dma_as, value + 28,
+                                vc4_gpio_expander[gpio_num].term_pull_up);
+                    /* must be equal 0 */
+                    stl_le_phys(&s->dma_as, value + 12, 0);
+                    resplen = 4 * 5;
+                } else {
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                                  "RPI_FWREQ_GET_GPIO_CONFIG "
+                                  "gpio num must be < %d",
+                                  RPI_EXP_GPIO_BASE + VC4_GPIO_EXPANDER_COUNT);
+                }
+            }
+            break;
+
+        case RPI_FWREQ_SET_GPIO_CONFIG:
+            if (ldl_le_phys(&s->dma_as, value + 12) < RPI_EXP_GPIO_BASE) {
+                qemu_log_mask(LOG_UNIMP, "RPI_FWREQ_SET_GPIO_CONFIG "
+                              "not implemented for gpiochip0\n");
+            } else {
+                gpio_num = ldl_le_phys(&s->dma_as, value + 12)
+                           - RPI_EXP_GPIO_BASE;
+
+                if (gpio_num < VC4_GPIO_EXPANDER_COUNT) {
+                    vc4_gpio_expander[gpio_num].direction =
+                        ldl_le_phys(&s->dma_as, value + 16);
+                    vc4_gpio_expander[gpio_num].polarity =
+                        ldl_le_phys(&s->dma_as, value + 20);
+                    vc4_gpio_expander[gpio_num].term_en =
+                        ldl_le_phys(&s->dma_as, value + 24);
+                    vc4_gpio_expander[gpio_num].term_pull_up =
+                        ldl_le_phys(&s->dma_as, value + 28);
+                    vc4_gpio_expander[gpio_num].state =
+                        ldl_le_phys(&s->dma_as, value + 32);
+                    /* must be equal 0 */
+                    stl_le_phys(&s->dma_as, value + 12, 0);
+                    resplen = 4;
+                } else {
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                                  "RPI_FWREQ_SET_GPIO_CONFIG "
+                                  "gpio num must be < %d",
+                                  RPI_EXP_GPIO_BASE + VC4_GPIO_EXPANDER_COUNT);
+                }
+            }
+            break;
+
+        case RPI_FWREQ_GET_GPIO_STATE:
+            if (ldl_le_phys(&s->dma_as, value + 12) < RPI_EXP_GPIO_BASE) {
+                qemu_log_mask(LOG_UNIMP, "RPI_FWREQ_GET_GPIO_STATE "
+                              "not implemented for gpiochip0\n");
+            } else {
+                gpio_num = ldl_le_phys(&s->dma_as, value + 12)
+                           - RPI_EXP_GPIO_BASE;
+
+                if (gpio_num < VC4_GPIO_EXPANDER_COUNT) {
+                    stl_le_phys(&s->dma_as, value + 16,
+                                vc4_gpio_expander[gpio_num].state);
+                    /* must be equal 0 */
+                    stl_le_phys(&s->dma_as, value + 12, 0);
+                    resplen = 8;
+                } else {
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                                  "RPI_FWREQ_GET_GPIO_STATE "
+                                  "gpio num must be < %d",
+                                  RPI_EXP_GPIO_BASE + VC4_GPIO_EXPANDER_COUNT);
+                }
+            }
+            break;
+
+        case RPI_FWREQ_SET_GPIO_STATE:
+            if (ldl_le_phys(&s->dma_as, value + 12) < RPI_EXP_GPIO_BASE) {
+                qemu_log_mask(LOG_UNIMP, "RPI_FWREQ_SET_GPIO_STATE not "
+                              "implemented for gpiochip0\n");
+            } else {
+                gpio_num = ldl_le_phys(&s->dma_as, value + 12)
+                           - RPI_EXP_GPIO_BASE;
+
+                if (gpio_num < VC4_GPIO_EXPANDER_COUNT) {
+                    vc4_gpio_expander[gpio_num].state = ldl_le_phys(&s->dma_as,
+                                                                    value + 16);
+                    /* must be equal 0 */
+                    stl_le_phys(&s->dma_as, value + 12, 0);
+                    resplen = 4;
+                } else {
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                                  "RPI_FWREQ_SET_GPIO_STATE "
+                                  "gpio num must be < %d",
+                                  RPI_EXP_GPIO_BASE + VC4_GPIO_EXPANDER_COUNT);
+                }
+            }
+            break;
+
+        case RPI_FWREQ_VCHIQ_INIT:
+            stl_le_phys(&s->dma_as,
+                        value + offsetof(rpi_firmware_prop_request_t, payload),
+                        0);
+            resplen = VCHI_BUSADDR_SIZE;
+            break;
+
         default:
             qemu_log_mask(LOG_UNIMP,
                           "bcm2835_property: unhandled tag 0x%08x\n", tag);
diff --git a/hw/misc/bcm2838_rng200.c b/hw/misc/bcm2838_rng200.c
new file mode 100644
index 0000000000..96ae6c4ffc
--- /dev/null
+++ b/hw/misc/bcm2838_rng200.c
@@ -0,0 +1,421 @@
+/*
+ * BCM2838 Random Number Generator emulation
+ *
+ * Copyright (C) 2022 Sergey Pushkarev <sergey.pushkarev@auriga.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/guest-random.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+#include "qom/object_interfaces.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/misc/bcm2838_rng200.h"
+#include "trace.h"
+
+#define RNG_CTRL_OFFSET                      0x00
+#define RNG_SOFT_RESET                       0x01
+#define RNG_SOFT_RESET_OFFSET                0x04
+#define RBG_SOFT_RESET_OFFSET                0x08
+#define RNG_TOTAL_BIT_COUNT_OFFSET           0x0C
+#define RNG_TOTAL_BIT_COUNT_THRESHOLD_OFFSET 0x10
+#define RNG_INT_STATUS_OFFSET                0x18
+#define RNG_INT_ENABLE_OFFSET                0x1C
+#define RNG_FIFO_DATA_OFFSET                 0x20
+#define RNG_FIFO_COUNT_OFFSET                0x24
+
+#define RNG_WARM_UP_PERIOD_ELAPSED           17
+
+#define BCM2838_RNG200_PTIMER_POLICY         (PTIMER_POLICY_CONTINUOUS_TRIGGER)
+
+static void bcm2838_rng200_update_irq(BCM2838Rng200State *state)
+{
+    qemu_set_irq(state->irq, !!(state->rng_int_enable.value
+                              & state->rng_int_status.value));
+}
+
+static void bcm2838_rng200_update_rbg_period(void *opaque, ClockEvent event)
+{
+    BCM2838Rng200State *s = (BCM2838Rng200State *)opaque;
+
+    ptimer_transaction_begin(s->ptimer);
+    ptimer_set_period_from_clock(s->ptimer, s->clock, s->rng_fifo_cap * 8);
+    ptimer_transaction_commit(s->ptimer);
+}
+
+static void bcm2838_rng200_update_fifo(void *opaque, const void *buf,
+                                       size_t size)
+{
+    BCM2838Rng200State *state = (BCM2838Rng200State *)opaque;
+    Fifo8 *fifo = &state->fifo;
+    size_t num = MIN(size, fifo8_num_free(fifo));
+    uint32_t num_bits = num * 8;
+    uint32_t bit_threshold_left = 0;
+
+    state->rng_total_bit_count += num_bits;
+    if (state->rng_bit_count_threshold > state->rng_total_bit_count) {
+        bit_threshold_left =
+            state->rng_bit_count_threshold - state->rng_total_bit_count;
+    } else {
+        bit_threshold_left = 0;
+    }
+
+    if (bit_threshold_left < num_bits) {
+        num_bits -= bit_threshold_left;
+    } else {
+        num_bits = 0;
+    }
+
+    num = num_bits / 8;
+    if ((num == 0) && (num_bits > 0)) {
+        num = 1;
+    }
+    if (!state->use_timer || (num > 0)) {
+        fifo8_push_all(fifo, buf, num);
+
+        if (!state->use_timer
+            || (fifo8_num_used(fifo) > state->rng_fifo_count.thld)) {
+            state->rng_int_status.total_bits_count_irq = 1;
+        }
+    }
+
+    state->rng_fifo_count.count = fifo8_num_used(fifo) >> 2;
+    bcm2838_rng200_update_irq(state);
+    trace_bcm2838_rng200_update_fifo(num, fifo8_num_used(fifo));
+}
+
+static void bcm2838_rng200_fill_fifo(BCM2838Rng200State *state)
+{
+    rng_backend_request_entropy(state->rng,
+                                fifo8_num_free(&state->fifo),
+                                bcm2838_rng200_update_fifo, state);
+}
+
+static void bcm2838_rng200_disable_rbg(BCM2838Rng200State *state)
+{
+    if (state->use_timer) {
+        ptimer_transaction_begin(state->ptimer);
+        ptimer_stop(state->ptimer);
+        ptimer_transaction_commit(state->ptimer);
+    }
+
+    trace_bcm2838_rng200_disable_rbg();
+}
+
+static void bcm2838_rng200_enable_rbg(BCM2838Rng200State *state)
+{
+    state->rng_total_bit_count = RNG_WARM_UP_PERIOD_ELAPSED;
+
+    if (state->use_timer) {
+        uint32_t div = state->rng_ctrl.div + 1;
+
+        ptimer_transaction_begin(state->ptimer);
+        ptimer_set_limit(state->ptimer, div, 1);
+        ptimer_set_count(state->ptimer, div);
+        ptimer_run(state->ptimer, 0);
+        ptimer_transaction_commit(state->ptimer);
+    } else {
+        bcm2838_rng200_fill_fifo(state);
+    }
+
+    trace_bcm2838_rng200_enable_rbg();
+}
+
+static void bcm2838_rng200_ptimer_cb(void *arg)
+{
+    BCM2838Rng200State *state = (BCM2838Rng200State *)arg;
+    Fifo8 *fifo = &state->fifo;
+    size_t size = fifo8_num_free(fifo);
+
+    assert(state->rng_ctrl.rbg_enable);
+
+    if (size > 0) {
+        rng_backend_request_entropy(state->rng, size,
+                                    bcm2838_rng200_update_fifo, state);
+    } else {
+        ptimer_stop(state->ptimer);
+        trace_bcm2838_rng200_fifo_full();
+    }
+}
+
+static void bcm2838_rng200_rng_reset(BCM2838Rng200State *state)
+{
+    state->rng_ctrl.value = 0;
+    state->rng_total_bit_count = 0;
+    state->rng_bit_count_threshold = 0;
+    state->rng_fifo_count.value = 0;
+    state->rng_int_status.value = 0;
+    state->rng_int_status.startup_transition_met_irq = 1;
+    state->rng_int_enable.value = 0;
+    fifo8_reset(&state->fifo);
+
+    trace_bcm2838_rng200_rng_soft_reset();
+}
+
+static void bcm2838_rng200_rbg_reset(BCM2838Rng200State *state)
+{
+    trace_bcm2838_rng200_rbg_soft_reset();
+}
+
+static uint32_t bcm2838_rng200_read_fifo_data(BCM2838Rng200State *state)
+{
+    Fifo8 *fifo = &state->fifo;
+    const uint8_t *buf;
+    uint32_t ret = 0;
+    uint32_t num = 0;
+    uint32_t max = MIN(fifo8_num_used(fifo), sizeof(ret));
+
+    if (max > 0) {
+        buf = fifo8_pop_buf(fifo, max, &num);
+        if ((buf != NULL) && (num > 0)) {
+            memcpy(&ret, buf, num);
+
+            if (state->rng_ctrl.rbg_enable && state->use_timer) {
+                ptimer_transaction_begin(state->ptimer);
+                ptimer_run(state->ptimer, 0);
+                ptimer_transaction_commit(state->ptimer);
+            }
+        }
+    } else {
+        qemu_log_mask(
+            LOG_GUEST_ERROR,
+            "bcm2838_rng200_read_fifo_data: FIFO is empty\n"
+        );
+    }
+
+    state->rng_fifo_count.count = fifo8_num_used(fifo) >> 2;
+
+    if (!state->use_timer) {
+        bcm2838_rng200_fill_fifo(state);
+    }
+
+    return ret;
+}
+
+static void bcm2838_rng200_ctrl_write(BCM2838Rng200State *s, uint64_t value)
+{
+    bool rng_enable = s->rng_ctrl.rbg_enable;
+
+    s->rng_ctrl.value = value;
+    if (!s->rng_ctrl.rbg_enable && rng_enable) {
+        bcm2838_rng200_disable_rbg(s);
+    } else if (s->rng_ctrl.rbg_enable && !rng_enable) {
+        bcm2838_rng200_enable_rbg(s);
+    }
+}
+
+static uint64_t bcm2838_rng200_read(void *opaque, hwaddr offset,
+                                    unsigned size)
+{
+    BCM2838Rng200State *s = (BCM2838Rng200State *)opaque;
+    uint32_t res = 0;
+
+    switch (offset) {
+    case RNG_CTRL_OFFSET:
+        res = s->rng_ctrl.value;
+        break;
+    case RNG_SOFT_RESET_OFFSET:
+    case RBG_SOFT_RESET_OFFSET:
+        break;
+    case RNG_INT_STATUS_OFFSET:
+        res = s->rng_int_status.value;
+        break;
+    case RNG_INT_ENABLE_OFFSET:
+        res = s->rng_int_enable.value;
+        break;
+    case RNG_FIFO_DATA_OFFSET:
+        res = bcm2838_rng200_read_fifo_data(s);
+        break;
+    case RNG_FIFO_COUNT_OFFSET:
+        res = s->rng_fifo_count.value;
+        break;
+    case RNG_TOTAL_BIT_COUNT_OFFSET:
+        res = s->rng_total_bit_count;
+        break;
+    case RNG_TOTAL_BIT_COUNT_THRESHOLD_OFFSET:
+        res = s->rng_bit_count_threshold;
+        break;
+    default:
+        qemu_log_mask(
+            LOG_GUEST_ERROR,
+            "bcm2838_rng200_read: Bad offset 0x%" HWADDR_PRIx "\n",
+            offset
+        );
+        res = 0;
+        break;
+    }
+
+    trace_bcm2838_rng200_read((void *)offset, size, res);
+    return res;
+}
+
+static void bcm2838_rng200_write(void *opaque, hwaddr offset,
+                                 uint64_t value, unsigned size)
+{
+    BCM2838Rng200State *s = (BCM2838Rng200State *)opaque;
+
+    trace_bcm2838_rng200_write((void *)offset, value, size);
+
+    switch (offset) {
+    case RNG_CTRL_OFFSET:
+        bcm2838_rng200_ctrl_write(s, value);
+        break;
+    case RNG_SOFT_RESET_OFFSET:
+        if (value & RNG_SOFT_RESET) {
+            bcm2838_rng200_rng_reset(s);
+        }
+        break;
+    case RBG_SOFT_RESET_OFFSET:
+        if (value & RNG_SOFT_RESET) {
+            bcm2838_rng200_rbg_reset(s);
+        }
+        break;
+    case RNG_INT_STATUS_OFFSET:
+        s->rng_int_status.value &= ~value;
+        bcm2838_rng200_update_irq(s);
+        break;
+    case RNG_INT_ENABLE_OFFSET:
+        s->rng_int_enable.value = value;
+        bcm2838_rng200_update_irq(s);
+        break;
+    case RNG_FIFO_COUNT_OFFSET:
+        {
+            BCM2838Rng200FifoCount tmp = {.value = value};
+            s->rng_fifo_count.thld = tmp.thld;
+        }
+        break;
+    case RNG_TOTAL_BIT_COUNT_THRESHOLD_OFFSET:
+        s->rng_bit_count_threshold = value;
+        if (s->use_timer) {
+            s->rng_total_bit_count = 0;
+        } else {
+            s->rng_total_bit_count = value + 1;
+        }
+        break;
+    default:
+        qemu_log_mask(
+            LOG_GUEST_ERROR,
+            "bcm2838_rng200_write: Bad offset 0x%" HWADDR_PRIx "\n",
+            offset
+        );
+        break;
+    }
+}
+
+static const MemoryRegionOps bcm2838_rng200_ops = {
+    .read = bcm2838_rng200_read,
+    .write = bcm2838_rng200_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .max_access_size = 4,
+        .min_access_size = 4,
+    },
+    .valid = {
+        .max_access_size = 4,
+        .min_access_size = 4
+    },
+};
+
+static void bcm2838_rng200_realize(DeviceState *dev, Error **errp)
+{
+    BCM2838Rng200State *s = BCM2838_RNG200(dev);
+
+    if (s->use_timer) {
+        s->ptimer = ptimer_init(bcm2838_rng200_ptimer_cb, s,
+                                BCM2838_RNG200_PTIMER_POLICY);
+        if (s->ptimer == NULL) {
+            error_setg(&error_fatal, "Failed to init RBG timer");
+            return;
+        }
+    }
+
+    if (s->rng == NULL) {
+        Object *default_backend = object_new(TYPE_RNG_BUILTIN);
+
+        if (!user_creatable_complete(USER_CREATABLE(default_backend),
+                                     errp)) {
+            object_unref(default_backend);
+            error_setg(errp, "Failed to create user creatable RNG backend");
+            return;
+        }
+
+        object_property_add_child(OBJECT(dev), "default-backend",
+                                  default_backend);
+        object_unref(default_backend);
+
+        object_property_set_link(OBJECT(dev), "rng", default_backend,
+                                 errp);
+    }
+
+    if (s->use_timer && !clock_has_source(s->clock)) {
+        ptimer_transaction_begin(s->ptimer);
+        ptimer_set_period(s->ptimer, s->rbg_period * s->rng_fifo_cap * 8);
+        ptimer_transaction_commit(s->ptimer);
+    }
+
+    fifo8_create(&s->fifo, s->rng_fifo_cap);
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
+}
+
+static void bcm2838_rng200_init(Object *obj)
+{
+    BCM2838Rng200State *s = BCM2838_RNG200(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    s->clock = qdev_init_clock_in(DEVICE(s), "rbg-clock",
+                                  bcm2838_rng200_update_rbg_period, s,
+                                  ClockPreUpdate);
+    if (s->clock == NULL) {
+        error_setg(&error_fatal, "Failed to init RBG clock");
+        return;
+    }
+
+    memory_region_init_io(&s->iomem, obj, &bcm2838_rng200_ops, s,
+                          TYPE_BCM2838_RNG200, 0x28);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void bcm2838_rng200_reset(DeviceState *dev)
+{
+    BCM2838Rng200State *s = BCM2838_RNG200(dev);
+
+    bcm2838_rng200_rbg_reset(s);
+    bcm2838_rng200_rng_reset(s);
+}
+
+static Property bcm2838_rng200_properties[] = {
+    DEFINE_PROP_UINT32("rbg-period", BCM2838Rng200State, rbg_period, 250),
+    DEFINE_PROP_UINT32("rng-fifo-cap", BCM2838Rng200State, rng_fifo_cap, 128),
+    DEFINE_PROP_LINK("rng", BCM2838Rng200State, rng, TYPE_RNG_BACKEND, RngBackend *),
+    DEFINE_PROP_BOOL("use-timer", BCM2838Rng200State, use_timer, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void bcm2838_rng200_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = bcm2838_rng200_realize;
+    dc->reset = bcm2838_rng200_reset;
+    device_class_set_props(dc, bcm2838_rng200_properties);
+}
+
+static const TypeInfo bcm2838_rng200_info = {
+    .name          = TYPE_BCM2838_RNG200,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2838Rng200State),
+    .class_init    = bcm2838_rng200_class_init,
+    .instance_init = bcm2838_rng200_init,
+};
+
+static void bcm2838_rng200_register_types(void)
+{
+    type_register_static(&bcm2838_rng200_info);
+}
+
+type_init(bcm2838_rng200_register_types)
diff --git a/hw/misc/bcm2838_thermal.c b/hw/misc/bcm2838_thermal.c
new file mode 100644
index 0000000000..39bfe60c4c
--- /dev/null
+++ b/hw/misc/bcm2838_thermal.c
@@ -0,0 +1,97 @@
+/*
+ * BCM2838 dummy thermal sensor
+ *
+ * Copyright (C) 2022 Maksim Kopusov <maksim.kopusov@auriga.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "hw/misc/bcm2838_thermal.h"
+#include "hw/registerfields.h"
+#include "migration/vmstate.h"
+#include "qemu/error-report.h"
+
+REG32(STAT, 0x200)
+FIELD(STAT, DATA, 0, 10)
+FIELD(STAT, VALID_1, 10, 1)
+FIELD(STAT, VALID_2, 16, 1)
+
+#define BCM2838_THERMAL_SIZE 0xf00
+
+#define THERMAL_OFFSET_C 410040
+#define THERMAL_COEFF  (-487.0f)
+#define MILLIDEGREE_COEFF 1000
+
+static uint16_t bcm2838_thermal_temp2adc(int temp_C)
+{
+    return (temp_C * MILLIDEGREE_COEFF - THERMAL_OFFSET_C) / THERMAL_COEFF;
+}
+
+static uint64_t bcm2838_thermal_read(void *opaque, hwaddr addr, unsigned size)
+{
+    uint32_t val = 0;
+
+    switch (addr) {
+    case A_STAT:
+        /* Temperature is constantly 25°C */
+         val = FIELD_DP32(val, STAT, DATA, bcm2838_thermal_temp2adc(25));
+         val = FIELD_DP32(val, STAT, VALID_1, 1);
+         val = FIELD_DP32(val, STAT, VALID_2, 1);
+
+         info_report("%s: 0x%x", TYPE_BCM2838_THERMAL, val);
+         break;
+    default:
+         /* MemoryRegionOps are aligned, so this can not happen. */
+         warn_report("%s can't access addr: 0x%"PRIx64,
+                     TYPE_BCM2838_THERMAL, addr);
+         g_assert_not_reached();
+    }
+    return val;
+}
+
+static const MemoryRegionOps bcm2838_thermal_ops = {
+    .read = bcm2838_thermal_read,
+    .impl.max_access_size = 4,
+    .valid.min_access_size = 4,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void bcm2838_thermal_realize(DeviceState *dev, Error **errp)
+{
+    Bcm2838ThermalState *s = BCM2838_THERMAL(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &bcm2838_thermal_ops,
+                          s, TYPE_BCM2838_THERMAL, BCM2838_THERMAL_SIZE);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+}
+
+static const VMStateDescription bcm2838_thermal_vmstate = {
+    .name = TYPE_BCM2838_THERMAL,
+    .version_id = 1,
+    .minimum_version_id = 1,
+};
+
+static void bcm2838_thermal_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = bcm2838_thermal_realize;
+    dc->vmsd = &bcm2838_thermal_vmstate;
+}
+
+static const TypeInfo bcm2838_thermal_info = {
+    .name = TYPE_BCM2838_THERMAL,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(Bcm2838ThermalState),
+    .class_init = bcm2838_thermal_class_init,
+};
+
+static void bcm2838_thermal_register_types(void)
+{
+    type_register_static(&bcm2838_thermal_info);
+}
+
+type_init(bcm2838_thermal_register_types)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index a40245ad44..975855b460 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -85,6 +85,10 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
   'bcm2835_cprman.c',
   'bcm2835_powermgt.c',
 ))
+softmmu_ss.add(when: 'CONFIG_RASPI4B', if_true: files(
+  'bcm2838_rng200.c',
+  'bcm2838_thermal.c',
+))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
 softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-crf.c'))
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index c47876a902..13ecd6f5fd 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -279,3 +279,13 @@ virt_ctrl_instance_init(void *dev) "ctrl: %p"
 lasi_chip_mem_valid(uint64_t addr, uint32_t val) "access to addr 0x%"PRIx64" is %d"
 lasi_chip_read(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
 lasi_chip_write(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
+
+# bcm2838_rng200.c
+bcm2838_rng200_rng_soft_reset(void) "========= RNumG SOFT RESET ========="
+bcm2838_rng200_rbg_soft_reset(void) "========= RBitG SOFT RESET ========="
+bcm2838_rng200_enable_rbg(void)     "========= RBitG ENABLED ========="
+bcm2838_rng200_disable_rbg(void)    "========= RBitG DISABLED ========="
+bcm2838_rng200_update_fifo(uint32_t len, uint32_t fifo_len)    "len %u, fifo_len %u"
+bcm2838_rng200_fifo_full(void) "========= RNumG FIFO FULL ========="
+bcm2838_rng200_write(void *addr, uint64_t value, unsigned size) "addr %p, value 0x%016" PRIx64 ", size %u"
+bcm2838_rng200_read(void *addr, unsigned size, uint64_t value) "addr %p, size %u, value 0x%016" PRIx64
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index d724a2fc28..dec61e2fd8 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -34,10 +34,13 @@
 #include "hw/misc/unimp.h"
 #include "qom/object.h"
 
+#define TYPE_RASPI_PERIPHERALS_BASE "raspi-peripherals-base"
+OBJECT_DECLARE_TYPE(RaspiPeripheralBaseState, RaspiPeripheralBaseClass,
+                    RASPI_PERIPHERALS_BASE)
 #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
 OBJECT_DECLARE_SIMPLE_TYPE(BCM2835PeripheralState, BCM2835_PERIPHERALS)
 
-struct BCM2835PeripheralState {
+struct RaspiPeripheralBaseState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -59,12 +62,9 @@ struct BCM2835PeripheralState {
     OrIRQState orgated_dma_irq;
     BCM2835ICState ic;
     BCM2835PropertyState property;
-    BCM2835RngState rng;
     BCM2835MboxState mboxes;
     SDHCIState sdhci;
     BCM2835SDHostState sdhost;
-    BCM2835GpioState gpio;
-    Bcm2835ThermalState thermal;
     UnimplementedDeviceState i2s;
     UnimplementedDeviceState spi[1];
     UnimplementedDeviceState i2c[3];
@@ -78,4 +78,25 @@ struct BCM2835PeripheralState {
     UnimplementedDeviceState sdramc;
 };
 
+struct RaspiPeripheralBaseClass {
+    /*< private >*/
+    SysBusDeviceClass parent_class;
+    /*< public >*/
+    uint64_t peri_size; /* Peripheral range size */
+};
+
+struct BCM2835PeripheralState {
+    /*< private >*/
+    RaspiPeripheralBaseState parent_obj;
+    /*< public >*/
+    BCM2835RngState rng;
+    Bcm2835ThermalState thermal;
+    BCM2835GpioState gpio;
+};
+
+void create_unimp(RaspiPeripheralBaseState *ps,
+                  UnimplementedDeviceState *uds,
+                  const char *name, hwaddr ofs, hwaddr size);
+void raspi_peripherals_common_realize(DeviceState *dev, Error **errp);
+
 #endif /* BCM2835_PERIPHERALS_H */
diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
index 6f90cabfa3..de6fe3ba0b 100644
--- a/include/hw/arm/bcm2836.h
+++ b/include/hw/arm/bcm2836.h
@@ -17,8 +17,10 @@
 #include "target/arm/cpu.h"
 #include "qom/object.h"
 
+#define TYPE_BCM283X_BASE "bcm283x-base"
+OBJECT_DECLARE_TYPE(BCM283XBaseState, BCM283XBaseClass, BCM283X_BASE)
 #define TYPE_BCM283X "bcm283x"
-OBJECT_DECLARE_TYPE(BCM283XState, BCM283XClass, BCM283X)
+OBJECT_DECLARE_SIMPLE_TYPE(BCM283XState, BCM283X)
 
 #define BCM283X_NCPUS 4
 
@@ -29,19 +31,39 @@ OBJECT_DECLARE_TYPE(BCM283XState, BCM283XClass, BCM283X)
 #define TYPE_BCM2835 "bcm2835"
 #define TYPE_BCM2836 "bcm2836"
 #define TYPE_BCM2837 "bcm2837"
+#define TYPE_BCM2838 "bcm2838"
 
-struct BCM283XState {
+struct BCM283XBaseState {
     /*< private >*/
     DeviceState parent_obj;
     /*< public >*/
-
     uint32_t enabled_cpus;
-
     struct {
         ARMCPU core;
     } cpu[BCM283X_NCPUS];
     BCM2836ControlState control;
+};
+
+struct BCM283XBaseClass {
+    /*< private >*/
+    DeviceClass parent_class;
+    /*< public >*/
+    const char *name;
+    const char *cpu_type;
+    unsigned core_count;
+    hwaddr peri_base; /* Peripheral base address seen by the CPU */
+    hwaddr ctrl_base; /* Interrupt controller and mailboxes etc. */
+    int clusterid;
+};
+
+struct BCM283XState {
+    /*< private >*/
+    BCM283XBaseState parent_obj;
+    /*< public >*/
     BCM2835PeripheralState peripherals;
 };
 
+bool bcm283x_common_realize(DeviceState *dev, RaspiPeripheralBaseState *ps,
+                            Error **errp);
+
 #endif /* BCM2836_H */
diff --git a/include/hw/arm/bcm2838.h b/include/hw/arm/bcm2838.h
new file mode 100644
index 0000000000..685fbcc5a2
--- /dev/null
+++ b/include/hw/arm/bcm2838.h
@@ -0,0 +1,26 @@
+/*
+ * BCM2838 SoC emulation
+ *
+ * Copyright (C) 2022 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef BCM2838_H
+#define BCM2838_H
+
+#include "hw/arm/bcm2836.h"
+#include "hw/intc/arm_gic.h"
+#include "hw/arm/bcm2838_peripherals.h"
+
+OBJECT_DECLARE_TYPE(BCM2838State, BCM2838Class, BCM2838)
+
+struct BCM2838State {
+    /*< private >*/
+    BCM283XBaseState parent_obj;
+    /*< public >*/
+    BCM2838PeripheralState peripherals;
+    GICState gic;
+};
+
+#endif /* BCM2838_H */
diff --git a/include/hw/arm/bcm2838_pcie.h b/include/hw/arm/bcm2838_pcie.h
new file mode 100644
index 0000000000..14e80fd1d7
--- /dev/null
+++ b/include/hw/arm/bcm2838_pcie.h
@@ -0,0 +1,67 @@
+/*
+ * BCM2838 PCIe Root Complex emulation
+ *
+ * Copyright (C) 2022 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef BCM2838_PCIE_H
+#define BCM2838_PCIE_H
+
+#include "exec/hwaddr.h"
+#include "hw/sysbus.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pcie_host.h"
+#include "hw/pci/pcie_port.h"
+#include "qom/object.h"
+
+#define TYPE_BCM2838_PCIE_HOST "bcm2838-pcie-host"
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2838PcieHostState, BCM2838_PCIE_HOST)
+
+#define TYPE_BCM2838_PCIE_ROOT "bcm2838-pcie-root"
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2838PcieRootState, BCM2838_PCIE_ROOT)
+
+#define BCM2838_PCIE_VENDOR_ID      0x14E4
+#define BCM2838_PCIE_DEVICE_ID      0x2711
+#define BCM2838_PCIE_REVISION       20
+
+#define BCM2838_PCIE_REGS_SIZE      0x9310
+#define BCM2838_PCIE_NUM_IRQS       4
+
+#define BCM2838_PCIE_EXP_CAP_OFFSET 0xAC
+#define BCM2838_PCIE_AER_CAP_OFFSET 0x100
+
+#define BCM2838_PCIE_EXT_CFG_DATA   0x8000
+#define BCM2838_PCIE_EXT_CFG_INDEX  0x9000
+
+struct BCM2838PcieRootState {
+    /*< private >*/
+    PCIESlot parent_obj;
+
+    /*< public >*/
+    uint8_t regs[BCM2838_PCIE_REGS_SIZE - PCIE_CONFIG_SPACE_SIZE];
+};
+
+struct BCM2838PcieHostState {
+    /*< private >*/
+    PCIExpressHost parent_obj;
+
+    /*< public >*/
+    BCM2838PcieRootState root_port;
+
+    MemoryRegion cfg_regs;
+    MemoryRegion io_ioport;
+    MemoryRegion io_mmio;
+    MemoryRegion io_ioport_window;
+    MemoryRegion io_mmio_window;
+
+    qemu_irq irq[BCM2838_PCIE_NUM_IRQS];
+    int irq_num[BCM2838_PCIE_NUM_IRQS];
+
+    bool allow_unmapped_accesses;
+};
+
+int bcm2838_pcie_host_set_irq_num(BCM2838PcieHostState *s, int index, int spi);
+
+#endif /* BCM2838_PCIE_H */
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
new file mode 100644
index 0000000000..2178c017e6
--- /dev/null
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -0,0 +1,56 @@
+/*
+ * BCM2838 peripherals emulation
+ *
+ * Copyright (C) 2022 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef BCM2838_PERIPHERALS_H
+#define BCM2838_PERIPHERALS_H
+
+#include "hw/sysbus.h"
+#include "hw/or-irq.h"
+
+#include "hw/arm/bcm2835_peripherals.h"
+#include "hw/misc/bcm2838_rng200.h"
+#include "hw/misc/bcm2838_thermal.h"
+#include "hw/arm/bcm2838_pcie.h"
+#include "hw/sd/sdhci.h"
+#include "hw/gpio/bcm2838_gpio.h"
+
+
+#define TYPE_BCM2838_PERIPHERALS "bcm2838-peripherals"
+OBJECT_DECLARE_TYPE(BCM2838PeripheralState, BCM2838PeripheralClass,
+                    BCM2838_PERIPHERALS)
+
+struct BCM2838PeripheralState {
+    /*< private >*/
+    RaspiPeripheralBaseState parent_obj;
+
+    /*< public >*/
+    MemoryRegion peri_low_mr;
+    MemoryRegion peri_low_mr_alias;
+    MemoryRegion mphi_mr_alias;
+    MemoryRegion pcie_mmio_alias;
+
+    BCM2838Rng200State rng200;
+    Bcm2838ThermalState thermal;
+    SDHCIState emmc2;
+    UnimplementedDeviceState clkisp;
+    BCM2838PcieHostState pcie_host;
+    BCM2838GpioState gpio;
+
+    OrIRQState mmc_irq_orgate;
+    OrIRQState dma_7_8_irq_orgate;
+    OrIRQState dma_9_10_irq_orgate;
+};
+
+struct BCM2838PeripheralClass {
+    /*< private >*/
+    RaspiPeripheralBaseClass parent_class;
+    /*< public >*/
+    uint64_t peri_low_size; /* Peripheral lower range size */
+};
+
+#endif /* BCM2838_PERIPHERALS_H */
diff --git a/include/hw/arm/raspi4b_platform.h b/include/hw/arm/raspi4b_platform.h
new file mode 100644
index 0000000000..518218284e
--- /dev/null
+++ b/include/hw/arm/raspi4b_platform.h
@@ -0,0 +1,54 @@
+/*
+ * Raspberry Pi 4 B platform common definitions.
+ *
+ * Copyright (C) 2022  Auriga LLC, mrm <cmpl.error@gmail.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_ARM_RASPI4_PLATFORM_H
+#define HW_ARM_RASPI4_PLATFORM_H
+
+#define BCM2838_MPHI_OFFSET     0xb200
+#define BCM2838_MPHI_SIZE       0x200
+
+#define CLOCK_ISP_OFFSET        0xc11000
+#define CLOCK_ISP_SIZE          0x100
+
+#define PCIE_RC_OFFSET          0x1500000
+#define PCIE_MMIO_OFFSET        0xc0000000
+#define PCIE_MMIO_ARM_OFFSET    0x600000000
+#define PCIE_MMIO_SIZE          0x40000000
+
+/* SPI */
+#define RPI4_INTERRUPT_MBOX         33
+#define RPI4_INTERRUPT_MPHI         40
+#define RPI4_INTERRUPT_DWC2         73
+#define RPI4_INTERRUPT_DMA_0        80
+#define RPI4_INTERRUPT_DMA_6        86
+#define RPI4_INTERRUPT_DMA_7_8      87
+#define RPI4_INTERRUPT_DMA_9_10     88
+#define RPI4_INTERRUPT_AUX_UART1    93
+#define RPI4_INTERRUPT_SDHOST       120
+#define RPI4_INTERRUPT_UART0        121
+#define RPI4_INTERRUPT_RNG200       125
+#define RPI4_INTERRUPT_EMMC_EMMC2   126
+#define RPI4_INTERRUPT_PCI_INT_A    143
+
+/* GPU (legacy) DMA interrupts */
+#define RPI4_GPU_INTERRUPT_DMA0      16
+#define RPI4_GPU_INTERRUPT_DMA1      17
+#define RPI4_GPU_INTERRUPT_DMA2      18
+#define RPI4_GPU_INTERRUPT_DMA3      19
+#define RPI4_GPU_INTERRUPT_DMA4      20
+#define RPI4_GPU_INTERRUPT_DMA5      21
+#define RPI4_GPU_INTERRUPT_DMA6      22
+#define RPI4_GPU_INTERRUPT_DMA7_8    23
+#define RPI4_GPU_INTERRUPT_DMA9_10   24
+#define RPI4_GPU_INTERRUPT_DMA11     25
+#define RPI4_GPU_INTERRUPT_DMA12     26
+#define RPI4_GPU_INTERRUPT_DMA13     27
+#define RPI4_GPU_INTERRUPT_DMA14     28
+#define RPI4_GPU_INTERRUPT_DMA15     31
+
+#endif
diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index 4a56dd4b89..681b9633a1 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -28,6 +28,35 @@
 #ifndef HW_ARM_RASPI_PLATFORM_H
 #define HW_ARM_RASPI_PLATFORM_H
 
+#include "hw/boards.h"
+#include "hw/arm/boot.h"
+
+#define TYPE_RASPI_BASE_MACHINE MACHINE_TYPE_NAME("raspi-base")
+OBJECT_DECLARE_TYPE(RaspiBaseMachineState, RaspiBaseMachineClass,
+                    RASPI_BASE_MACHINE)
+
+struct RaspiBaseMachineState {
+    /*< private >*/
+    MachineState parent_obj;
+    /*< public >*/
+    struct arm_boot_info binfo;
+};
+
+struct RaspiBaseMachineClass {
+    /*< private >*/
+    MachineClass parent_obj;
+    /*< public >*/
+    uint32_t board_rev;
+};
+
+uint64_t board_ram_size(uint32_t board_rev);
+const char *board_soc_type(uint32_t board_rev);
+void raspi_machine_class_common_init(MachineClass *mc,
+                                     uint32_t board_rev);
+typedef struct BCM283XBaseState BCM283XBaseState;
+void raspi_base_machine_init(MachineState *machine,
+                             BCM283XBaseState *soc);
+
 #define MSYNC_OFFSET            0x0000   /* Multicore Sync Block */
 #define CCPT_OFFSET             0x1000   /* Compact Camera Port 2 TX */
 #define INTE_OFFSET             0x2000   /* VC Interrupt controller */
@@ -170,4 +199,9 @@
 #define INTERRUPT_ILLEGAL_TYPE0        6
 #define INTERRUPT_ILLEGAL_TYPE1        7
 
+#define RPI_FIRMWARE_EMMC_CLK_RATE    50000000
+#define RPI_FIRMWARE_UART_CLK_RATE    3000000
+#define RPI_FIRMWARE_CORE_CLK_RATE    350000000
+#define RPI_FIRMWARE_DEFAULT_CLK_RATE 700000000
+
 #endif
diff --git a/include/hw/display/bcm2835_fb.h b/include/hw/display/bcm2835_fb.h
index 38671afffd..49541bf08f 100644
--- a/include/hw/display/bcm2835_fb.h
+++ b/include/hw/display/bcm2835_fb.h
@@ -16,6 +16,8 @@
 #include "ui/console.h"
 #include "qom/object.h"
 
+#define UPPER_RAM_BASE 0x40000000
+
 #define TYPE_BCM2835_FB "bcm2835-fb"
 OBJECT_DECLARE_SIMPLE_TYPE(BCM2835FBState, BCM2835_FB)
 
diff --git a/include/hw/gpio/bcm2838_gpio.h b/include/hw/gpio/bcm2838_gpio.h
new file mode 100644
index 0000000000..f2a57a697f
--- /dev/null
+++ b/include/hw/gpio/bcm2838_gpio.h
@@ -0,0 +1,45 @@
+/*
+ * Raspberry Pi (BCM2838) GPIO Controller
+ * This implementation is based on bcm2835_gpio (hw/gpio/bcm2835_gpio.c)
+ *
+ * Copyright (c) 2022 Auriga LLC
+ *
+ * Authors:
+ *  Lotosh, Aleksey <aleksey.lotosh@auriga.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef BCM2838_GPIO_H
+#define BCM2838_GPIO_H
+
+#include "hw/sd/sd.h"
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_BCM2838_GPIO "bcm2838-gpio"
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2838GpioState, BCM2838_GPIO)
+
+#define BCM2838_GPIO_REGS_SIZE 0x1000
+#define BCM2838_GPIO_NUM       58
+#define GPIO_PUP_PDN_CNTRL_NUM 4
+
+struct BCM2838GpioState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+
+    /* SDBus selector */
+    SDBus sdbus;
+    SDBus *sdbus_sdhci;
+    SDBus *sdbus_sdhost;
+
+    uint8_t fsel[BCM2838_GPIO_NUM];
+    uint32_t lev0, lev1;
+    uint8_t sd_fsel;
+    qemu_irq out[BCM2838_GPIO_NUM];
+    uint32_t pup_cntrl_reg[GPIO_PUP_PDN_CNTRL_NUM];
+};
+
+#endif
diff --git a/include/hw/misc/bcm2838_rng200.h b/include/hw/misc/bcm2838_rng200.h
new file mode 100644
index 0000000000..77f6cd8df4
--- /dev/null
+++ b/include/hw/misc/bcm2838_rng200.h
@@ -0,0 +1,77 @@
+/*
+ * BCM2838 Random Number Generator emulation
+ *
+ * Copyright (C) 2022 Sergey Pushkarev <sergey.pushkarev@auriga.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef BCM2838_RNG200_H
+#define BCM2838_RNG200_H
+
+#include <stdbool.h>
+#include "qom/object.h"
+#include "qemu/fifo8.h"
+#include "sysemu/rng.h"
+#include "hw/sysbus.h"
+#include "hw/ptimer.h"
+#include "hw/qdev-clock.h"
+#include "hw/irq.h"
+
+#define TYPE_BCM2838_RNG200 "bcm2838-rng200"
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2838Rng200State, BCM2838_RNG200)
+
+typedef union BCM2838Rng200Ctrl {
+    uint32_t value;
+    struct {
+        uint32_t rbg_enable:1;
+        uint32_t __r0:12;
+        uint32_t div:8;
+    };
+} BCM2838Rng200Ctrl;
+
+typedef union BCM2838Rng200Int {
+    uint32_t value;
+    struct {
+        uint32_t total_bits_count_irq:1;
+        uint32_t __r0:4;
+        uint32_t nist_fail_irq:1;
+        uint32_t __r1:11;
+        uint32_t startup_transition_met_irq:1;
+        uint32_t __r2:13;
+        uint32_t master_fail_lockout_irq:1;
+    };
+} BCM2838Rng200Int;
+
+typedef union BCM2838Rng200FifoCount {
+    uint32_t value;
+    struct {
+        uint32_t count:8;
+        uint32_t thld:8;
+    };
+} BCM2838Rng200FifoCount;
+
+struct BCM2838Rng200State {
+    SysBusDevice busdev;
+    MemoryRegion iomem;
+
+    ptimer_state *ptimer;
+    RngBackend *rng;
+    Clock *clock;
+
+    uint32_t rbg_period;
+    uint32_t rng_fifo_cap;
+    bool use_timer;
+
+    Fifo8    fifo;
+    qemu_irq irq;
+    BCM2838Rng200Ctrl rng_ctrl;
+    BCM2838Rng200Int rng_int_status;
+    BCM2838Rng200Int rng_int_enable;
+    uint32_t rng_total_bit_count;
+    BCM2838Rng200FifoCount rng_fifo_count;
+    uint32_t rng_bit_count_threshold;
+};
+
+#endif /* BCM2838_RNG200_H */
diff --git a/include/hw/misc/bcm2838_thermal.h b/include/hw/misc/bcm2838_thermal.h
new file mode 100644
index 0000000000..bb6302a037
--- /dev/null
+++ b/include/hw/misc/bcm2838_thermal.h
@@ -0,0 +1,24 @@
+/*
+ * BCM2838 dummy thermal sensor
+ *
+ * Copyright (C) 2022 Maksim Kopusov <maksim.kopusov@auriga.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef BCM2838_THERMAL_H
+#define BCM2838_THERMAL_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_BCM2838_THERMAL "bcm2838-thermal"
+OBJECT_DECLARE_SIMPLE_TYPE(Bcm2838ThermalState, BCM2838_THERMAL)
+
+struct Bcm2838ThermalState {
+    SysBusDevice busdev;
+    MemoryRegion iomem;
+};
+
+#endif /* BCM2838_THERMAL_H */
diff --git a/include/hw/misc/raspberrypi-fw-defs.h b/include/hw/misc/raspberrypi-fw-defs.h
new file mode 100644
index 0000000000..649965524b
--- /dev/null
+++ b/include/hw/misc/raspberrypi-fw-defs.h
@@ -0,0 +1,169 @@
+/*
+ * Raspberry Pi firmware definitions
+ *
+ * Copyright (C) 2022  Auriga LLC, based on Linux kernel
+ *   `include/soc/bcm2835/raspberrypi-firmware.h` (Copyright © 2015 Broadcom)
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef INCLUDE_HW_MISC_RASPBERRYPI_FW_DEFS_H_
+#define INCLUDE_HW_MISC_RASPBERRYPI_FW_DEFS_H_
+
+#include "qemu/osdep.h"
+
+enum rpi_firmware_property_tag {
+    RPI_FWREQ_PROPERTY_END =                           0,
+    RPI_FWREQ_GET_FIRMWARE_REVISION =                  0x00000001,
+    RPI_FWREQ_GET_FIRMWARE_VARIANT =                   0x00000002,
+    RPI_FWREQ_GET_FIRMWARE_HASH =                      0x00000003,
+
+    RPI_FWREQ_SET_CURSOR_INFO =                        0x00008010,
+    RPI_FWREQ_SET_CURSOR_STATE =                       0x00008011,
+
+    RPI_FWREQ_GET_BOARD_MODEL =                        0x00010001,
+    RPI_FWREQ_GET_BOARD_REVISION =                     0x00010002,
+    RPI_FWREQ_GET_BOARD_MAC_ADDRESS =                  0x00010003,
+    RPI_FWREQ_GET_BOARD_SERIAL =                       0x00010004,
+    RPI_FWREQ_GET_ARM_MEMORY =                         0x00010005,
+    RPI_FWREQ_GET_VC_MEMORY =                          0x00010006,
+    RPI_FWREQ_GET_CLOCKS =                             0x00010007,
+    RPI_FWREQ_GET_POWER_STATE =                        0x00020001,
+    RPI_FWREQ_GET_TIMING =                             0x00020002,
+    RPI_FWREQ_SET_POWER_STATE =                        0x00028001,
+    RPI_FWREQ_GET_CLOCK_STATE =                        0x00030001,
+    RPI_FWREQ_GET_CLOCK_RATE =                         0x00030002,
+    RPI_FWREQ_GET_VOLTAGE =                            0x00030003,
+    RPI_FWREQ_GET_MAX_CLOCK_RATE =                     0x00030004,
+    RPI_FWREQ_GET_MAX_VOLTAGE =                        0x00030005,
+    RPI_FWREQ_GET_TEMPERATURE =                        0x00030006,
+    RPI_FWREQ_GET_MIN_CLOCK_RATE =                     0x00030007,
+    RPI_FWREQ_GET_MIN_VOLTAGE =                        0x00030008,
+    RPI_FWREQ_GET_TURBO =                              0x00030009,
+    RPI_FWREQ_GET_MAX_TEMPERATURE =                    0x0003000a,
+    RPI_FWREQ_GET_STC =                                0x0003000b,
+    RPI_FWREQ_ALLOCATE_MEMORY =                        0x0003000c,
+    RPI_FWREQ_LOCK_MEMORY =                            0x0003000d,
+    RPI_FWREQ_UNLOCK_MEMORY =                          0x0003000e,
+    RPI_FWREQ_RELEASE_MEMORY =                         0x0003000f,
+    RPI_FWREQ_EXECUTE_CODE =                           0x00030010,
+    RPI_FWREQ_EXECUTE_QPU =                            0x00030011,
+    RPI_FWREQ_SET_ENABLE_QPU =                         0x00030012,
+    RPI_FWREQ_GET_DISPMANX_RESOURCE_MEM_HANDLE =       0x00030014,
+    RPI_FWREQ_GET_EDID_BLOCK =                         0x00030020,
+    RPI_FWREQ_GET_CUSTOMER_OTP =                       0x00030021,
+    RPI_FWREQ_GET_EDID_BLOCK_DISPLAY =                 0x00030023,
+    RPI_FWREQ_GET_DOMAIN_STATE =                       0x00030030,
+    RPI_FWREQ_GET_THROTTLED =                          0x00030046,
+    RPI_FWREQ_GET_CLOCK_MEASURED =                     0x00030047,
+    RPI_FWREQ_NOTIFY_REBOOT =                          0x00030048,
+    RPI_FWREQ_SET_CLOCK_STATE =                        0x00038001,
+    RPI_FWREQ_SET_CLOCK_RATE =                         0x00038002,
+    RPI_FWREQ_SET_VOLTAGE =                            0x00038003,
+    RPI_FWREQ_SET_MAX_CLOCK_RATE =                     0x00038004,
+    RPI_FWREQ_SET_MIN_CLOCK_RATE =                     0x00038007,
+    RPI_FWREQ_SET_TURBO =                              0x00038009,
+    RPI_FWREQ_SET_CUSTOMER_OTP =                       0x00038021,
+    RPI_FWREQ_SET_DOMAIN_STATE =                       0x00038030,
+    RPI_FWREQ_GET_GPIO_STATE =                         0x00030041,
+    RPI_FWREQ_SET_GPIO_STATE =                         0x00038041,
+    RPI_FWREQ_SET_SDHOST_CLOCK =                       0x00038042,
+    RPI_FWREQ_GET_GPIO_CONFIG =                        0x00030043,
+    RPI_FWREQ_SET_GPIO_CONFIG =                        0x00038043,
+    RPI_FWREQ_GET_PERIPH_REG =                         0x00030045,
+    RPI_FWREQ_SET_PERIPH_REG =                         0x00038045,
+    RPI_FWREQ_GET_POE_HAT_VAL =                        0x00030049,
+    RPI_FWREQ_SET_POE_HAT_VAL =                        0x00038049,
+    RPI_FWREQ_SET_POE_HAT_VAL_OLD =                    0x00030050,
+    RPI_FWREQ_NOTIFY_XHCI_RESET =                      0x00030058,
+    RPI_FWREQ_GET_REBOOT_FLAGS =                       0x00030064,
+    RPI_FWREQ_SET_REBOOT_FLAGS =                       0x00038064,
+    RPI_FWREQ_NOTIFY_DISPLAY_DONE =                    0x00030066,
+
+    /* Dispmanx TAGS */
+    RPI_FWREQ_FRAMEBUFFER_ALLOCATE =                   0x00040001,
+    RPI_FWREQ_FRAMEBUFFER_BLANK =                      0x00040002,
+    RPI_FWREQ_FRAMEBUFFER_GET_PHYSICAL_WIDTH_HEIGHT =  0x00040003,
+    RPI_FWREQ_FRAMEBUFFER_GET_VIRTUAL_WIDTH_HEIGHT =   0x00040004,
+    RPI_FWREQ_FRAMEBUFFER_GET_DEPTH =                  0x00040005,
+    RPI_FWREQ_FRAMEBUFFER_GET_PIXEL_ORDER =            0x00040006,
+    RPI_FWREQ_FRAMEBUFFER_GET_ALPHA_MODE =             0x00040007,
+    RPI_FWREQ_FRAMEBUFFER_GET_PITCH =                  0x00040008,
+    RPI_FWREQ_FRAMEBUFFER_GET_VIRTUAL_OFFSET =         0x00040009,
+    RPI_FWREQ_FRAMEBUFFER_GET_OVERSCAN =               0x0004000a,
+    RPI_FWREQ_FRAMEBUFFER_GET_PALETTE =                0x0004000b,
+    RPI_FWREQ_FRAMEBUFFER_GET_LAYER =                  0x0004000c,
+    RPI_FWREQ_FRAMEBUFFER_GET_TRANSFORM =              0x0004000d,
+    RPI_FWREQ_FRAMEBUFFER_GET_VSYNC =                  0x0004000e,
+    RPI_FWREQ_FRAMEBUFFER_GET_TOUCHBUF =               0x0004000f,
+    RPI_FWREQ_FRAMEBUFFER_GET_GPIOVIRTBUF =            0x00040010,
+    RPI_FWREQ_FRAMEBUFFER_RELEASE =                    0x00048001,
+    RPI_FWREQ_FRAMEBUFFER_GET_DISPLAY_ID =             0x00040016,
+    RPI_FWREQ_FRAMEBUFFER_SET_DISPLAY_NUM =            0x00048013,
+    RPI_FWREQ_FRAMEBUFFER_GET_NUM_DISPLAYS =           0x00040013,
+    RPI_FWREQ_FRAMEBUFFER_GET_DISPLAY_SETTINGS =       0x00040014,
+    RPI_FWREQ_FRAMEBUFFER_TEST_PHYSICAL_WIDTH_HEIGHT = 0x00044003,
+    RPI_FWREQ_FRAMEBUFFER_TEST_VIRTUAL_WIDTH_HEIGHT =  0x00044004,
+    RPI_FWREQ_FRAMEBUFFER_TEST_DEPTH =                 0x00044005,
+    RPI_FWREQ_FRAMEBUFFER_TEST_PIXEL_ORDER =           0x00044006,
+    RPI_FWREQ_FRAMEBUFFER_TEST_ALPHA_MODE =            0x00044007,
+    RPI_FWREQ_FRAMEBUFFER_TEST_VIRTUAL_OFFSET =        0x00044009,
+    RPI_FWREQ_FRAMEBUFFER_TEST_OVERSCAN =              0x0004400a,
+    RPI_FWREQ_FRAMEBUFFER_TEST_PALETTE =               0x0004400b,
+    RPI_FWREQ_FRAMEBUFFER_TEST_LAYER =                 0x0004400c,
+    RPI_FWREQ_FRAMEBUFFER_TEST_TRANSFORM =             0x0004400d,
+    RPI_FWREQ_FRAMEBUFFER_TEST_VSYNC =                 0x0004400e,
+    RPI_FWREQ_FRAMEBUFFER_SET_PHYSICAL_WIDTH_HEIGHT =  0x00048003,
+    RPI_FWREQ_FRAMEBUFFER_SET_VIRTUAL_WIDTH_HEIGHT =   0x00048004,
+    RPI_FWREQ_FRAMEBUFFER_SET_DEPTH =                  0x00048005,
+    RPI_FWREQ_FRAMEBUFFER_SET_PIXEL_ORDER =            0x00048006,
+    RPI_FWREQ_FRAMEBUFFER_SET_ALPHA_MODE =             0x00048007,
+    RPI_FWREQ_FRAMEBUFFER_SET_PITCH =                  0x00048008,
+    RPI_FWREQ_FRAMEBUFFER_SET_VIRTUAL_OFFSET =         0x00048009,
+    RPI_FWREQ_FRAMEBUFFER_SET_OVERSCAN =               0x0004800a,
+    RPI_FWREQ_FRAMEBUFFER_SET_PALETTE =                0x0004800b,
+
+    RPI_FWREQ_FRAMEBUFFER_SET_TOUCHBUF =               0x0004801f,
+    RPI_FWREQ_FRAMEBUFFER_SET_GPIOVIRTBUF =            0x00048020,
+    RPI_FWREQ_FRAMEBUFFER_SET_VSYNC =                  0x0004800e,
+    RPI_FWREQ_FRAMEBUFFER_SET_LAYER =                  0x0004800c,
+    RPI_FWREQ_FRAMEBUFFER_SET_TRANSFORM =              0x0004800d,
+    RPI_FWREQ_FRAMEBUFFER_SET_BACKLIGHT =              0x0004800f,
+
+    RPI_FWREQ_VCHIQ_INIT =                             0x00048010,
+
+    RPI_FWREQ_SET_PLANE =                              0x00048015,
+    RPI_FWREQ_GET_DISPLAY_TIMING =                     0x00040017,
+    RPI_FWREQ_SET_TIMING =                             0x00048017,
+    RPI_FWREQ_GET_DISPLAY_CFG =                        0x00040018,
+    RPI_FWREQ_SET_DISPLAY_POWER =                      0x00048019,
+    RPI_FWREQ_GET_COMMAND_LINE =                       0x00050001,
+    RPI_FWREQ_GET_DMA_CHANNELS =                       0x00060001,
+};
+
+
+/**
+ * struct rpi_firmware_property_tag_header - Firmware property tag header
+ * @tag:        One of enum_mbox_property_tag.
+ * @buf_size:   The number of bytes in the value buffer following this
+ *      struct.
+ * @req_resp_size:  On submit, the length of the request (though it doesn't
+ *      appear to be currently used by the firmware).  On return,
+ *      the length of the response (always 4 byte aligned), with
+ *      the low bit set.
+ */
+struct rpi_firmware_property_tag_header {
+    uint32_t tag;
+    uint32_t buf_size;
+    uint32_t req_resp_size;
+};
+
+typedef struct rpi_firmware_prop_request {
+    struct  rpi_firmware_property_tag_header hdr;
+    uint8_t payload[0];
+} rpi_firmware_prop_request_t;
+
+
+#define VCHI_BUSADDR_SIZE   sizeof(uint32_t)
+
+#endif /* INCLUDE_HW_MISC_RASPBERRYPI_FW_DEFS_H_ */
-- 
2.34.1


