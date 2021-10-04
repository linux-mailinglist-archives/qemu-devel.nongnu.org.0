Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A594210B8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 15:51:04 +0200 (CEST)
Received: from localhost ([::1]:45642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXOMx-0001G1-6s
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 09:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXOJq-00065V-OO
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:47:50 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXOJo-0007Er-VH
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:47:50 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 r4-20020a7bc084000000b0030d6fc48bd2so10334wmh.1
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 06:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Us2EA51yLTgS1au9j6qZ6FszBVCH7jwMNhk/McVC0ic=;
 b=gGhzuzEFqz0zMqH4ZngdGORPC/MUEe3rFbxpAN+2eALpdD9iBhD1EZlD2Kkw3YPXen
 sT582VYBHWEhpDQ0huWWwWNltQtYoQ2cpfdFzHWocrokFmwAdJH7rCSQ6manu37fpe3K
 b3W0TDXz51ZOb4vktR/K0Gv6c94VuxQU3bL6TPnFg0CUROnQoYZZXvgaGADuLk9DXfHg
 UTzOviK02CuiOHggbK8QiUmrnF6n/3hfd++XN0YEHhDhwtIKZ1p8T5bHiLvI0oWOPUem
 p6rImJKP9gjPIcV+1tGrdratMQCjQt+e4K1ITK3/Ar+ZiSMCDv77mHHcK8vvFZDTW5/G
 X5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Us2EA51yLTgS1au9j6qZ6FszBVCH7jwMNhk/McVC0ic=;
 b=XbqhdTz7qO6zSffLV8GAxD9IlvGlFRwgHykExs/IvTk8e7KkDs8jZe55mbPyl5j6wq
 4btVrzvlR14es+H6WRdKdRpjYHObG4tXE7h09zqzn6NGWdwhs4A1oPDryI3EpFmjyj/t
 Y5vZUYC0gY6C23x7NXrOytRq2Gj3FgDMrUvBzKD3rThzYbDf22K872ZHv4p5AEi43D4n
 XKF+cPlgqe1F4IowO5Jr9wg2OQdUGEQYhXhEzp+rG+1LRBG2zliJp0351RSKsnZbN4DQ
 JHIoarYl/o8lD0AJu/oknuTdOBqzoCKfF6RUTTXmbgevCmB3OE+1xPDpoXZbIOmACaoz
 YNmQ==
X-Gm-Message-State: AOAM5329Qv0HpnabH43eGnwa7NyX16ZbdK2O4+eFnpA4ig3shajKXbrv
 UcwjxeXn+vVlBa8GiIvPdG1cjQ==
X-Google-Smtp-Source: ABdhPJwPmQdDeUHgtyQ7QRWluNjCjC61yyXyXQW2+JABbtowSYRtICHTXjKCzgUPe1niRnt+pHasNw==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr18858107wmp.165.1633355267430; 
 Mon, 04 Oct 2021 06:47:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h1sm14528381wmb.7.2021.10.04.06.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:47:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 62DEA1FF9B;
 Mon,  4 Oct 2021 14:47:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/7] hw/arm/bcm2835_peripherals: Map various BCM2711 blocks
Date: Mon,  4 Oct 2021 14:47:38 +0100
Message-Id: <20211004134742.2044280-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004134742.2044280-1-alex.bennee@linaro.org>
References: <20211004134742.2044280-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The BCM2711 provides more peripherals. Add them as 'unimplemented' so
we can track when/how firmware and kernel access them.

Based on various sources:

* U-boot: https://github.com/raspberrypi/firmware/tree/next/boot

  - arch/arm/dts/bcm283x.dtsi
  - arch/arm/dts/bcm2838.dtsi
  - arch/arm/dts/bcm2838-rpi-4-b.dts

* Arnd Bergmann analysis: https://www.cnx-software.com/2019/06/24/raspberry-pi-4-features-broadcom-bcm2711-processor-up-to-4gb-ram/#comment-563948

* Linux: https://patchwork.kernel.org/patch/11053097/

  - arch/arm/boot/dts/bcm283x.dtsi
  - arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
  - arch/arm/boot/dts/bcm2711.dtsi
  - arch/arm/boot/dts/bcm2711-rpi-4-b.dts

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[AJB: merge fixes, drop dwc2 unimp]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
TODO: At least use proper pl011[2] and pl011[3]
vAJB:
  - fixed merge conflict on re-base
  - rename to BCM2711
  - drop dwc2 unimp (as it is now imp)
---
 include/hw/arm/bcm2835_peripherals.h |  9 ++++++---
 include/hw/arm/raspi_platform.h      | 14 ++++++++++++++
 hw/arm/bcm2835_peripherals.c         | 24 +++++++++++++++++++-----
 3 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index d864879421..8f7f23712a 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -52,6 +52,7 @@ struct BCM2835PeripheralState {
     BCM2835PowerMgtState powermgt;
     BCM2835CprmanState cprman;
     PL011State uart0;
+    UnimplementedDeviceState uartu[6];
     BCM2835AuxState aux;
     BCM2835FBState fb;
     BCM2835DMAState dma;
@@ -63,16 +64,18 @@ struct BCM2835PeripheralState {
     BCM2835SDHostState sdhost;
     BCM2835GpioState gpio;
     Bcm2835ThermalState thermal;
+    DWC2State dwc2;
     UnimplementedDeviceState i2s;
-    UnimplementedDeviceState spi[1];
-    UnimplementedDeviceState i2c[3];
+    UnimplementedDeviceState spi[7];
+    UnimplementedDeviceState i2c[7];
     UnimplementedDeviceState otp;
     UnimplementedDeviceState dbus;
     UnimplementedDeviceState ave0;
     UnimplementedDeviceState v3d;
     UnimplementedDeviceState bscsl;
     UnimplementedDeviceState smi;
-    DWC2State dwc2;
+    UnimplementedDeviceState xhci;
+    UnimplementedDeviceState argon;
     UnimplementedDeviceState sdramc;
 };
 
diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index e0e6c8ce94..7b6393542a 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -51,10 +51,22 @@
 #define RNG_OFFSET              0x104000
 #define GPIO_OFFSET             0x200000
 #define UART0_OFFSET            0x201000 /* PL011 */
+#define UART2_OFFSET            0x201400 /* PL011 */
+#define UART3_OFFSET            0x201600 /* PL011 */
+#define UART4_OFFSET            0x201800 /* PL011 */
+#define UART5_OFFSET            0x201a00 /* PL011 */
 #define MMCI0_OFFSET            0x202000 /* Legacy MMC */
 #define I2S_OFFSET              0x203000 /* PCM */
 #define SPI0_OFFSET             0x204000 /* SPI master */
+#define SPI3_OFFSET             0x204600
+#define SPI4_OFFSET             0x204800
+#define SPI5_OFFSET             0x204a00
+#define SPI6_OFFSET             0x204c00
 #define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
+#define BSC3_OFFSET             0x205600
+#define BSC4_OFFSET             0x205800
+#define BSC5_OFFSET             0x205a00
+#define BSC6_OFFSET             0x205c00
 #define PIXV0_OFFSET            0x206000
 #define PIXV1_OFFSET            0x207000
 #define DPI_OFFSET              0x208000
@@ -86,6 +98,8 @@
 #define DBUS_OFFSET             0x900000
 #define AVE0_OFFSET             0x910000
 #define USB_OTG_OFFSET          0x980000 /* DTC_OTG USB controller */
+#define USB_XHCI_OFFSET         0x9c0000 /* generic-xhci controller */
+#define ARGON_OFFSET            0xb00000
 #define V3D_OFFSET              0xc00000
 #define SDRAMC_OFFSET           0xe00000
 #define L2CC_OFFSET             0xe01000 /* Level 2 Cache controller */
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 46852bc8a6..3856c7d267 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -388,15 +388,29 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x40);
     create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
     create_unimp(s, &s->smi, "bcm2835-smi", SMI_OFFSET, 0x100);
-    create_unimp(s, &s->spi[0], "bcm2835-spi0", SPI0_OFFSET, 0x20);
+    create_unimp(s, &s->uartu[2], "!pl011[2]", UART2_OFFSET, 0x100);
+    create_unimp(s, &s->uartu[3], "!pl011[3]", UART3_OFFSET, 0x100);
+    create_unimp(s, &s->uartu[4], "!pl011[4]", UART4_OFFSET, 0x100);
+    create_unimp(s, &s->uartu[5], "!pl011[5]", UART5_OFFSET, 0x100);
+    create_unimp(s, &s->spi[0], "bcm2835-spi[0]", SPI0_OFFSET, 0x20);
+    create_unimp(s, &s->spi[3], "bcm2835-spi[3]", SPI3_OFFSET, 0x20);
+    create_unimp(s, &s->spi[4], "bcm2835-spi[4]", SPI4_OFFSET, 0x20);
+    create_unimp(s, &s->spi[5], "bcm2835-spi[5]", SPI5_OFFSET, 0x20);
+    create_unimp(s, &s->spi[6], "bcm2835-spi[6]", SPI6_OFFSET, 0x20);
     create_unimp(s, &s->bscsl, "bcm2835-spis", BSC_SL_OFFSET, 0x100);
-    create_unimp(s, &s->i2c[0], "bcm2835-i2c0", BSC0_OFFSET, 0x20);
-    create_unimp(s, &s->i2c[1], "bcm2835-i2c1", BSC1_OFFSET, 0x20);
-    create_unimp(s, &s->i2c[2], "bcm2835-i2c2", BSC2_OFFSET, 0x20);
+    create_unimp(s, &s->i2c[0], "bcm2835-i2c[0]", BSC0_OFFSET, 0x20);
+    create_unimp(s, &s->i2c[1], "bcm2835-i2c[1]", BSC1_OFFSET, 0x20);
+    create_unimp(s, &s->i2c[2], "bcm2835-i2c[2]", BSC2_OFFSET, 0x20);
+    create_unimp(s, &s->i2c[3], "bcm2835-i2c[3]", BSC3_OFFSET, 0x20);
+    create_unimp(s, &s->i2c[4], "bcm2835-i2c[4]", BSC4_OFFSET, 0x20);
+    create_unimp(s, &s->i2c[5], "bcm2835-i2c[5]", BSC5_OFFSET, 0x20);
+    create_unimp(s, &s->i2c[6], "bcm2835-i2c[6]", BSC6_OFFSET, 0x20);
     create_unimp(s, &s->otp, "bcm2835-otp", OTP_OFFSET, 0x80);
     create_unimp(s, &s->dbus, "bcm2835-dbus", DBUS_OFFSET, 0x8000);
     create_unimp(s, &s->ave0, "bcm2835-ave0", AVE0_OFFSET, 0x8000);
-    create_unimp(s, &s->v3d, "bcm2835-v3d", V3D_OFFSET, 0x1000);
+    create_unimp(s, &s->xhci, "bcm2838-xhci", USB_XHCI_OFFSET, 0x100000);
+    create_unimp(s, &s->argon, "bcm2838-argon", ARGON_OFFSET, 4 * 0x10000);
+    create_unimp(s, &s->v3d, "bcm2835-v3d", V3D_OFFSET, 0x10000);
     create_unimp(s, &s->sdramc, "bcm2835-sdramc", SDRAMC_OFFSET, 0x100);
 }
 
-- 
2.30.2


