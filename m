Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFF74767A8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 03:02:41 +0100 (CET)
Received: from localhost ([::1]:58258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxg6T-00067K-3s
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 21:02:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UJy6YQcKCocvzxwzotrzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--komlodi.bounces.google.com>)
 id 1mxg48-0003sQ-91
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 21:00:16 -0500
Received: from [2607:f8b0:4864:20::d49] (port=38558
 helo=mail-io1-xd49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UJy6YQcKCocvzxwzotrzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--komlodi.bounces.google.com>)
 id 1mxg45-0007Wh-Ts
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 21:00:15 -0500
Received: by mail-io1-xd49.google.com with SMTP id
 l124-20020a6b3e82000000b005ed165a1506so22193215ioa.5
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 18:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ZF0n7aVexYT+BTUKeAvJyOqsxB7EfrBsefo6NLji1Bo=;
 b=dHv+faqbOJsYE+RUZEX99tuzzSz2NBMNeW7NvNraPgq7ITRKxOsb7PLiOaXLy9xkMe
 sT0vz0PbDX5vowvmnCwf+BQqqv0fHl4rUGa3PDboDlgknqCvgsXmh1Fr+KEQSy7eIy/y
 IDvkFVmQgF2LM6krUs9M+EyrgF6F+ODNhrYGupjOYLHWItocI6MUNPjUIZYh/nvqeoTZ
 2ibA2hBRhvCE+pHPQ9PoQ0GVZBlcnTsHmpmshChZEn9ujRWBIyfzwrh9E1m9EqvXFtu2
 sfgEsmVet4gQyuvREDLmNcQxOYaiHb/PU5uyvf+rvmwHa1LxPJPJaBBWNVEPNTTuQOD5
 AiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ZF0n7aVexYT+BTUKeAvJyOqsxB7EfrBsefo6NLji1Bo=;
 b=sDUjjBY35+S3QNTmqONGqWajZl7YOECSaxATQDLZZuHKlGI0WglcBCBP/QkAwR4Qv5
 PaOpVwnWHl3+i1p63U2sRnZPbod1MFfKUdnN5rh69KvtKKu2lB10el0+W+kzG/VkDvym
 Q/Jrkk3PBICuHCSCgyz2H8NwfpPaZ4bR6eNuj448C00TB4q8DLOPlNhj54zV0KXkMLcN
 SzUFNW2cxzAWmgaXsfbR9+91+iiruTyDxroOQpVn0qiPauX52JIsY9suH/IiviYsaTtB
 DoHoYEsIdLwgYQw7AAo2DKis8FUZ8KUs5dZdW8Z1NEBLwTy9VGA2LTE6WM9YRtdyiFdn
 zRVg==
X-Gm-Message-State: AOAM531xVJ8BfjZuSTl/M0G4YGVxkCFM2vtSlobzEg3a8LWA7cMaybyN
 XOqDuYilyrDdz3q3hfTZU70/6xrsi6eCOebCwg5w9D/G5SXGf5UBQIDsezfNF781sLXnvl0EjSK
 +MCZJtfmN6sDMwLdKs8UCg4y4LS5jrlsB7Ztd3Spx4imWcLbLt7+FMLrehaQ6h5g=
X-Google-Smtp-Source: ABdhPJzK9wrxr8YKExMGuleXZlcSoFToh4sDhgkCfkq0QjTRMIttnvqY+rrij8qmdPfsNVimMLcGcGQ19UY7
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a63:510a:: with SMTP id
 f10mr10158838pgb.17.1639619664706; Wed, 15 Dec 2021 17:54:24 -0800 (PST)
Date: Thu, 16 Dec 2021 01:54:15 +0000
In-Reply-To: <20211216015417.1234812-1-komlodi@google.com>
Message-Id: <20211216015417.1234812-5-komlodi@google.com>
Mime-Version: 1.0
References: <20211216015417.1234812-1-komlodi@google.com>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [RFC PATCH 4/6] hw/arm/npcm7xx: gpio: Add GPIO transmitter
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, venture@google.com, hskinnemoen@google.com, 
 kfting@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d49;
 envelope-from=3UJy6YQcKCocvzxwzotrzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--komlodi.bounces.google.com;
 helo=mail-io1-xd49.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

This adds the GPIO transmitter to the NPCM7xx GPIO controller and
transmits packets any time the pin state changes.

Signed-off-by: Joe Komlodi <komlodi@google.com>
---
 hw/arm/Kconfig                 |  1 +
 hw/arm/npcm7xx.c               |  7 +++++++
 hw/gpio/npcm7xx_gpio.c         | 14 ++++++++++++++
 include/hw/arm/npcm7xx.h       |  2 ++
 include/hw/gpio/npcm7xx_gpio.h |  3 +++
 5 files changed, 27 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index ac11493667..046e277db8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -399,6 +399,7 @@ config NPCM7XX
     select UNIMP
     select PCA954X
+    select GOOGLE_GPIO_TRANSMITTER
 
 config FSL_IMX25
     bool
     select IMX
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 6a48a9a6d4..b3a65e5298 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -433,6 +433,9 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, "gpio[*]", &s->gpio[i], TYPE_NPCM7XX_GPIO);
     }
 
+    object_initialize_child(obj, "gpiotx", &s->gpiotx,
+                            TYPE_GOOGLE_GPIO_TRANSMITTER);
+
     for (i = 0; i < ARRAY_SIZE(s->smbus); i++) {
         object_initialize_child(obj, "smbus[*]", &s->smbus[i],
                                 TYPE_NPCM7XX_SMBUS);
@@ -590,11 +593,15 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->rng), &error_abort);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->rng), 0, NPCM7XX_RNG_BA);
 
+    sysbus_realize(SYS_BUS_DEVICE(&s->gpiotx), &error_abort);
+
     /* GPIO modules. Cannot fail. */
     QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_gpio) != ARRAY_SIZE(s->gpio));
     for (i = 0; i < ARRAY_SIZE(s->gpio); i++) {
         Object *obj = OBJECT(&s->gpio[i]);
 
+        object_property_set_link(obj, "gpio-tx", OBJECT(&s->gpiotx),
+                                 &error_abort);
         object_property_set_uint(obj, "controller-num", i, &error_abort);
         object_property_set_uint(obj, "reset-pullup",
                                  npcm7xx_gpio[i].reset_pu, &error_abort);
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index db62c4ed00..900436f901 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -7,6 +7,7 @@ softmmu_ss.add(when: 'CONFIG_ZAURUS', if_true: files('zaurus.c'))
 
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_gpio.c'))
+softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('google_gpio_transmitter.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c'))
diff --git a/hw/gpio/npcm7xx_gpio.c b/hw/gpio/npcm7xx_gpio.c
index 5075f61b3b..0d683903a2 100644
--- a/hw/gpio/npcm7xx_gpio.c
+++ b/hw/gpio/npcm7xx_gpio.c
@@ -65,6 +65,16 @@ enum NPCM7xxGPIORegister {
 #define NPCM7XX_GPIO_LOCK_MAGIC1 (0xc0defa73)
 #define NPCM7XX_GPIO_LOCK_MAGIC2 (0xc0de1248)
 
+static void npcm7xx_gpio_tx_state(NPCM7xxGPIOState *s)
+{
+    uint32_t state = s->regs[NPCM7XX_GPIO_DOUT] | s->regs[NPCM7XX_GPIO_DIN];
+
+    /* Only TX if we have a transmitter */
+    if (s->txs) {
+        google_gpio_tx_transmit(s->txs, s->controller_num, state);
+    }
+}
+
 static void npcm7xx_gpio_update_events(NPCM7xxGPIOState *s, uint32_t din_diff)
 {
     uint32_t din_new = s->regs[NPCM7XX_GPIO_DIN];
@@ -147,6 +157,7 @@ static void npcm7xx_gpio_update_pins(NPCM7xxGPIOState *s, uint32_t diff)
 
     /* See if any new events triggered because of all this. */
     npcm7xx_gpio_update_events(s, din_old ^ s->regs[NPCM7XX_GPIO_DIN]);
+    npcm7xx_gpio_tx_state(s);
 }
 
 static bool npcm7xx_gpio_is_locked(NPCM7xxGPIOState *s)
@@ -387,6 +398,9 @@ static const VMStateDescription vmstate_npcm7xx_gpio = {
 };
 
 static Property npcm7xx_gpio_properties[] = {
+    /* Pointer to the GPIO state transmitter */
+    DEFINE_PROP_LINK("gpio-tx", NPCM7xxGPIOState, txs,
+                     TYPE_GOOGLE_GPIO_TRANSMITTER, GoogleGPIOTXState *),
     /* The GPIO controller number (out of 8) */
     DEFINE_PROP_UINT8("controller-num", NPCM7xxGPIOState, controller_num, 0),
     /* Bit n set => pin n has pullup enabled by default. */
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 106cfb55bf..a52650010f 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -21,6 +21,7 @@
 #include "hw/core/split-irq.h"
 #include "hw/cpu/a9mpcore.h"
 #include "hw/gpio/npcm7xx_gpio.h"
+#include "hw/gpio/google_gpio_transmitter.h"
 #include "hw/i2c/npcm7xx_smbus.h"
 #include "hw/mem/npcm7xx_mc.h"
 #include "hw/misc/npcm7xx_clk.h"
@@ -99,6 +100,7 @@ typedef struct NPCM7xxState {
     NPCM7xxMCState      mc;
     NPCM7xxRNGState     rng;
     NPCM7xxGPIOState    gpio[8];
+    GoogleGPIOTXState   gpiotx;
     NPCM7xxSMBusState   smbus[16];
     EHCISysBusState     ehci;
     OHCISysBusState     ohci;
diff --git a/include/hw/gpio/npcm7xx_gpio.h b/include/hw/gpio/npcm7xx_gpio.h
index b065bba1c5..69c1004a6c 100644
--- a/include/hw/gpio/npcm7xx_gpio.h
+++ b/include/hw/gpio/npcm7xx_gpio.h
@@ -17,6 +17,7 @@
 
 #include "exec/memory.h"
 #include "hw/sysbus.h"
+#include "hw/gpio/google_gpio_transmitter.h"
 
 /* Number of pins managed by each controller. */
 #define NPCM7XX_GPIO_NR_PINS (32)
@@ -30,6 +31,8 @@
 typedef struct NPCM7xxGPIOState {
     SysBusDevice parent;
 
+    GoogleGPIOTXState *txs;
+
     /* Properties to be defined by the SoC */
     uint32_t reset_pu;
     uint32_t reset_pd;
-- 
2.34.1.173.g76aa8bc2d0-goog


