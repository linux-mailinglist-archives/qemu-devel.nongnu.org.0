Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B729432A826
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:30:52 +0100 (CET)
Received: from localhost ([::1]:54402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8rD-00058y-Nk
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:30:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lH8q8-0004Ib-Qr
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:29:44 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:37862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lH8q7-0002wK-9B
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:29:44 -0500
Received: by mail-pj1-x102f.google.com with SMTP id u12so2483174pjr.2
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HdXHfF0esxqgy+KWP8ooxVtoJqVDo9Tm/88wrB+K/2Q=;
 b=XPbUH/udyPIG+3vIojti4Med02QJRg0/PhW60XRTP7DuaKqsBcabwY2dkuQISTnc6R
 XiXcJG+ZH/MIzpaToXBYUqMG5KXPc7CtzD30r5cetnIbu+k70dJaXCq49C8ANZvo+8U0
 NicBVZgIoAN2xhdkGJlykiIC7qaXyqhB0QCP1+VFR+cealsflfzM0KARv31NMm5h8SLH
 KMy7xpTKE2nblkXEDKF/hNQmyNLyBkefO9vZ7a3fcugnhotFrDMyCEziqZnJcdB41SQH
 zZVs8mdKYSRFmdguASv4nDU0a9zFYxsd9zLS+Sax/njEeuBmgj/2GG11XGkIogG1fF1O
 gYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HdXHfF0esxqgy+KWP8ooxVtoJqVDo9Tm/88wrB+K/2Q=;
 b=nq8tj2XDHh+TTEpUz5KT+PkvVDevWnASjWDFLIbshmiXvqlXkVBAPfn+ijyXUH93Jj
 GBxuzE95RpX2Fp63Nn9JkBtvATurLNuV7PrIBoIDVOyXfKHiZsOasCAGBe5lF68GYMsU
 tXS43B22spe4ANxfO31fIleD83HYuLuC3BXYbCYse65UvHFi5e/sWJJwe9BJrWIlFNIJ
 drXBYm/BswJHl2m86NQOjy5po8W8jxdt4iBCURDLp40/gmfdagcm42MFpxrzfrQ95R5z
 3YeIRxfbNZCGtOehQGh9S7F7gG7HoQqc32h58Hs60Rn8YPm5v1P5hewPbrkesp9swG8d
 wLgA==
X-Gm-Message-State: AOAM5327IxrUpUkLxT4RfeIUK5n2hG1TVtOATy68B5EbLy89BEulfPpi
 OqZADihh5oV5PzlNIcbenqvL2W+04/S/iA==
X-Google-Smtp-Source: ABdhPJx292rcSON9WyKM8I6Nmf0qhuAXomTb89YA/mDl5h07Oklf3URCnq4Ijs0A92gA70O1uWrx6w==
X-Received: by 2002:a17:90b:1950:: with SMTP id
 nk16mr888468pjb.140.1614706181573; 
 Tue, 02 Mar 2021 09:29:41 -0800 (PST)
Received: from localhost.localdomain ([45.115.91.0])
 by smtp.gmail.com with ESMTPSA id b15sm20122999pgj.84.2021.03.02.09.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:29:41 -0800 (PST)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] avr/arduino: Add D13 LED
Date: Tue,  2 Mar 2021 22:59:18 +0530
Message-Id: <20210302172919.7923-2-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210302172919.7923-1-niteesh.gs@gmail.com>
References: <20210302172919.7923-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>, f4bug@amsat.org,
 heecheol.yang@outlook.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 hw/avr/Kconfig   |  1 +
 hw/avr/arduino.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
index 16a57ced11..e0d4fc5537 100644
--- a/hw/avr/Kconfig
+++ b/hw/avr/Kconfig
@@ -8,3 +8,4 @@ config AVR_ATMEGA_MCU
 config ARDUINO
     select AVR_ATMEGA_MCU
     select UNIMP
+    select LED
diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
index 3c8388490d..5cdba3201c 100644
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
 
@@ -49,6 +52,18 @@ static void arduino_machine_init(MachineState *machine)
                              amc->xtal_hz, &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&ams->mcu), &error_abort);
 
+    ams->onboard_led = led_create_simple(OBJECT(ams),
+                                         GPIO_POLARITY_ACTIVE_HIGH,
+                                         LED_COLOR_BLUE,
+                                         "D13 LED");
+
+    /* TODO: Add macro or function to map pins to ports */
+    /* The onboard led is connected to PIN 13 in all boards currently supported
+     * in QEMU. And PIN 13 is mapped to PORT B BIT 5.
+     */
+    qdev_connect_gpio_out(DEVICE(&ams->mcu.gpio[1]), 5,
+                          qdev_get_gpio_in(DEVICE(ams->onboard_led), 0));
+
     if (machine->firmware) {
         if (!avr_load_firmware(&ams->mcu.cpu, machine,
                                &ams->mcu.flash, machine->firmware)) {
-- 
2.17.1


