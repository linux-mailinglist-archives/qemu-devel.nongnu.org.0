Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E372A339F6F
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:19:25 +0100 (CET)
Received: from localhost ([::1]:40990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7vA-00026D-To
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7Y6-0005ak-3k
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:34 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7Y3-0001Bi-FI
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:33 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so17616055wmy.5
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4N2eu3gmWOHHigZSbFpUzeZRPjSztx/3jXLNY7gaaEU=;
 b=V7sDSGuJobQHtX6h4RhkkHETLZQncvMCEZEyQ+b992z9zDW3ZJa2RrQB7mxY2uHB1Q
 R7B2KRF/dHTWQodahBYKZ1VJM14epVMe9Pm2y/dhsvvuUevH0siRw/rKa/s3YQVch0NE
 KngjdtLbHKNxZZ4FmgSd2SxRMTmkNinqxci767WSXJW7/QkPsy7AJ63t2awDmM7JPP2I
 Y6hRMx1TQGV+pfIhKBN8O6411ZVwOFDn4MSwdiyDW6ws7BCnrDXNYc7IMPLxrGEd20IU
 hSCKi0XI1NJ/xoeYevmxm99m7hJIHo6SLf/0rt28lLTcns9zVLqBJBzspJ2+T9p628mD
 q2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4N2eu3gmWOHHigZSbFpUzeZRPjSztx/3jXLNY7gaaEU=;
 b=FVNtUqWmI9H0edugvrD8A7k/SRhYa9+FpoAg/UMw/kdwhgZLNyGMZ+s2CgyH1zsiah
 Y14mwd4fmh0yqqWucBo0n7gbRvfFhHMQi3NorNBHUSy7ovoAY87EpEygpWY2gBL/5vSk
 5KLOq0pzIMwjLqyyPpkd/pAbJ5ORp8B1iSqKtfHI4Yj3xoDb6LFCw+AsXb8yG52JZltC
 WegrDqy6p4x/DxOwO5by6EMsLZD8z3Kd2i5gPvUn5EyHbjdBWeD4p8s8zpxxI5N0EK2F
 u0aKLYVPgRwI8yhOsXuAJHeG43ccnoHgli0ATkJGgUzYWk0jZ25xHyz/UXvmSf3kpz8R
 zJLQ==
X-Gm-Message-State: AOAM530SPI6NSPbs5XFRyfTdVseBnfiXYo/zQiZRQvG0oqcvEYd8DLjX
 e8dAqp12Wktulr6vVSW+qTFPxFWgglMqbA==
X-Google-Smtp-Source: ABdhPJxr8VMN/+YgaNd5mDtGIXuj8d9jm2IUtOT76YoBsLqGu8Avat490F7L76Pz+FPXBEA6q5XhNQ==
X-Received: by 2002:a1c:2587:: with SMTP id l129mr2429377wml.135.1615654530067; 
 Sat, 13 Mar 2021 08:55:30 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j203sm7475542wmj.40.2021.03.13.08.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:55:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] hw/avr/arduino: Add D13 LED
Date: Sat, 13 Mar 2021 17:54:42 +0100
Message-Id: <20210313165445.2113938-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313165445.2113938-1-f4bug@amsat.org>
References: <20210313165445.2113938-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 G S Niteesh Babu <niteesh.gs@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: G S Niteesh Babu <niteesh.gs@gmail.com>

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Message-Id: <20210311135539.10206-4-niteesh.gs@gmail.com>
[PMD: Added ArduinoMachineClass::d13_led_portb_bit]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/avr/arduino.c | 18 ++++++++++++++++++
 hw/avr/Kconfig   |  1 +
 2 files changed, 19 insertions(+)

diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
index 3ff31492fa6..73563a35d0d 100644
--- a/hw/avr/arduino.c
+++ b/hw/avr/arduino.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
+#include "hw/misc/led.h"
 #include "atmega.h"
 #include "boot.h"
 #include "qom/object.h"
@@ -22,6 +23,8 @@ struct ArduinoMachineState {
     MachineState parent_obj;
     /*< public >*/
     AtmegaMcuState mcu;
+
+    LEDState *onboard_led;
 };
 typedef struct ArduinoMachineState ArduinoMachineState;
 
@@ -31,6 +34,7 @@ struct ArduinoMachineClass {
     /*< public >*/
     const char *mcu_type;
     uint64_t xtal_hz;
+    unsigned d13_led_portb_bit; /* PORTB GPIO for D13 yellow LED */
 };
 typedef struct ArduinoMachineClass ArduinoMachineClass;
 
@@ -49,6 +53,16 @@ static void arduino_machine_init(MachineState *machine)
                              amc->xtal_hz, &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&ams->mcu), &error_abort);
 
+    /* Onboard led connected to digital header PIN 13 */
+    ams->onboard_led = led_create_simple(OBJECT(ams),
+                                         GPIO_POLARITY_ACTIVE_HIGH,
+                                         LED_COLOR_YELLOW,
+                                         "D13 LED");
+
+    qdev_connect_gpio_out(DEVICE(&ams->mcu.gpio[1]),
+                          amc->d13_led_portb_bit,
+                          qdev_get_gpio_in(DEVICE(ams->onboard_led), 0));
+
     if (machine->firmware) {
         if (!avr_load_firmware(&ams->mcu.cpu, machine,
                                &ams->mcu.flash, machine->firmware)) {
@@ -83,6 +97,7 @@ static void arduino_duemilanove_class_init(ObjectClass *oc, void *data)
     mc->alias       = "2009";
     amc->mcu_type   = TYPE_ATMEGA168_MCU;
     amc->xtal_hz    = 16 * 1000 * 1000;
+    amc->d13_led_portb_bit = 5;
 };
 
 static void arduino_uno_class_init(ObjectClass *oc, void *data)
@@ -98,6 +113,7 @@ static void arduino_uno_class_init(ObjectClass *oc, void *data)
     mc->alias       = "uno";
     amc->mcu_type   = TYPE_ATMEGA328_MCU;
     amc->xtal_hz    = 16 * 1000 * 1000;
+    amc->d13_led_portb_bit = 5;
 };
 
 static void arduino_mega_class_init(ObjectClass *oc, void *data)
@@ -113,6 +129,7 @@ static void arduino_mega_class_init(ObjectClass *oc, void *data)
     mc->alias       = "mega";
     amc->mcu_type   = TYPE_ATMEGA1280_MCU;
     amc->xtal_hz    = 16 * 1000 * 1000;
+    amc->d13_led_portb_bit = 7;
 };
 
 static void arduino_mega2560_class_init(ObjectClass *oc, void *data)
@@ -128,6 +145,7 @@ static void arduino_mega2560_class_init(ObjectClass *oc, void *data)
     mc->alias       = "mega2560";
     amc->mcu_type   = TYPE_ATMEGA2560_MCU;
     amc->xtal_hz    = 16 * 1000 * 1000; /* CSTCE16M0V53-R0 */
+    amc->d13_led_portb_bit = 7;
 };
 
 static const TypeInfo arduino_machine_types[] = {
diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
index 16a57ced11f..e0d4fc5537a 100644
--- a/hw/avr/Kconfig
+++ b/hw/avr/Kconfig
@@ -8,3 +8,4 @@ config AVR_ATMEGA_MCU
 config ARDUINO
     select AVR_ATMEGA_MCU
     select UNIMP
+    select LED
-- 
2.26.2


