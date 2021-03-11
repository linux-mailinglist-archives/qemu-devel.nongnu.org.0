Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19F0337C58
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:19:46 +0100 (CET)
Received: from localhost ([::1]:49828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPuT-0000xT-Jn
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wFxKYAgKCqshfSLZedSRZZRWP.NZXbPXf-OPgPWYZYRYf.ZcR@flex--wuhaotsh.bounces.google.com>)
 id 1lKPkD-0007DA-5e
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:09:13 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:50814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wFxKYAgKCqshfSLZedSRZZRWP.NZXbPXf-OPgPWYZYRYf.ZcR@flex--wuhaotsh.bounces.google.com>)
 id 1lKPkA-0000dF-Eg
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:09:08 -0500
Received: by mail-pg1-x54a.google.com with SMTP id e4so11878751pgt.17
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=rkYYucWMn4F4axWZnGzQOMkDRtHuB/4pu2dUy2RZ63U=;
 b=ufu5stm6SqFCw38ZBq0SljoCniPHzfzriU/K3yyyFf1ecPPX+34KYh72cbZFUs7Yhb
 EdgkWNb4bwRKFES71CePDyRNr4dffPK5vgSDEasjQoBgpvRIeKYmq6foWbl2Anob0yab
 ciPT12kygyU0QBWQfSDpNYmFhZ46xaM/0e9/tFLyTROSXVdjfu3NiqDbZhSoX2QNplUc
 3MQ9stSU7djmGLYa3kNQjvKQ+m99WQxqAy+MQdrG2nkAjYT1FkSLcXd3HzIzJ6JkI7xw
 iZMW6T7HCwegOhRMXcxcOqIUHpE8t6knSItEFztvTKuRuWt0LnU78k4h19/PGbkoYnHT
 jUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=rkYYucWMn4F4axWZnGzQOMkDRtHuB/4pu2dUy2RZ63U=;
 b=WQxO0y1Kkb01+8QgJOa4Bu2QA2HdiYP8qDJF3KGEmDXfd1N5oJNUKxRBaaepv3vCXC
 NmEbTSlneWCtbRiAVFxKEvMNDpy18wHpXCNZ87njMQ4bDDVsTdqySmbI8LgJnPoi5f9/
 QOVlaF+AnISfbqNW1cSDrxVFlzsNSHcmlnsxxzug90Qe+konvg3MWRFiTOhmofYhzAdC
 GvQwohP7+OlPBMgFPVnieIpqzRKPFRRhUtNzAMPBAoAxe+2ZAxGM87a1+u4/+i+iTBXy
 7PKuJblANjLn/aYrXCy84sSnpJxLMyUxglwB7QMwI9XOg1jKKj91qZFBRn+WMnzduMgC
 gpNg==
X-Gm-Message-State: AOAM530ma5VnMsmuHMpNBqgryTjqOTuw0q4nbfCQk7TNJpQ538fmcdtl
 aCMUqOokEWmho4uE1T8ouD7kffKyg5Oflw==
X-Google-Smtp-Source: ABdhPJxTg83ppmTrUlCyN3kTZWEJiNiPlnGKFcZTWYzOuEjsC8EpeYDa6gkMOMx0C0uCl17ehLkC/3j/RE03gg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:6845:b029:e4:4d0f:c207 with SMTP
 id f5-20020a1709026845b02900e44d0fc207mr9163967pln.36.1615486144315; Thu, 11
 Mar 2021 10:09:04 -0800 (PST)
Date: Thu, 11 Mar 2021 10:08:54 -0800
In-Reply-To: <20210311180855.149764-1-wuhaotsh@google.com>
Message-Id: <20210311180855.149764-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210311180855.149764-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH v2 4/5] hw/arm: Connect PWM fans in NPCM7XX boards
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3wFxKYAgKCqshfSLZedSRZZRWP.NZXbPXf-OPgPWYZYRYf.ZcR@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds fan_splitters (split IRQs) in NPCM7XX boards. Each fan
splitter corresponds to 1 PWM output and can connect to multiple fan
inputs (MFT devices).
In NPCM7XX boards(NPCM750 EVB and Quanta GSJ boards), we initializes
these splitters and connect them to their corresponding modules
according their specific device trees.

Reviewed-by: Doug Evans <dje@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c  | 99 ++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/npcm7xx.h | 11 ++++-
 2 files changed, 109 insertions(+), 1 deletion(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index fbf6ce8e02..e22fe4bf8f 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -21,6 +21,7 @@
 #include "hw/core/cpu.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/loader.h"
+#include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
@@ -116,6 +117,64 @@ static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
     i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
 }
 
+static void npcm7xx_init_pwm_splitter(NPCM7xxMachine *machine,
+                                      NPCM7xxState *soc, const int *fan_counts)
+{
+    SplitIRQ *splitters = machine->fan_splitter;
+
+    /*
+     * PWM 0~3 belong to module 0 output 0~3.
+     * PWM 4~7 belong to module 1 output 0~3.
+     */
+    for (int i = 0; i < NPCM7XX_NR_PWM_MODULES; ++i) {
+        for (int j = 0; j < NPCM7XX_PWM_PER_MODULE; ++j) {
+            int splitter_no = i * NPCM7XX_PWM_PER_MODULE + j;
+            DeviceState *splitter;
+
+            if (fan_counts[splitter_no] < 1) {
+                continue;
+            }
+            object_initialize_child(OBJECT(machine), "fan-splitter[*]",
+                                    &splitters[splitter_no], TYPE_SPLIT_IRQ);
+            splitter = DEVICE(&splitters[splitter_no]);
+            qdev_prop_set_uint16(splitter, "num-lines",
+                                 fan_counts[splitter_no]);
+            qdev_realize(splitter, NULL, &error_abort);
+            qdev_connect_gpio_out_named(DEVICE(&soc->pwm[i]), "duty-gpio-out",
+                                        j, qdev_get_gpio_in(splitter, 0));
+        }
+    }
+}
+
+static void npcm7xx_connect_pwm_fan(NPCM7xxState *soc, SplitIRQ *splitter,
+                                    int fan_no, int output_no)
+{
+    DeviceState *fan;
+    int fan_input;
+    qemu_irq fan_duty_gpio;
+
+    g_assert(fan_no >= 0 && fan_no <= NPCM7XX_MFT_MAX_FAN_INPUT);
+    /*
+     * Fan 0~1 belong to module 0 input 0~1.
+     * Fan 2~3 belong to module 1 input 0~1.
+     * ...
+     * Fan 14~15 belong to module 7 input 0~1.
+     * Fan 16~17 belong to module 0 input 2~3.
+     * Fan 18~19 belong to module 1 input 2~3.
+     */
+    if (fan_no < 16) {
+        fan = DEVICE(&soc->mft[fan_no / 2]);
+        fan_input = fan_no % 2;
+    } else {
+        fan = DEVICE(&soc->mft[(fan_no - 16) / 2]);
+        fan_input = fan_no % 2 + 2;
+    }
+
+    /* Connect the Fan to PWM module */
+    fan_duty_gpio = qdev_get_gpio_in_named(fan, "duty", fan_input);
+    qdev_connect_gpio_out(DEVICE(splitter), output_no, fan_duty_gpio);
+}
+
 static void npcm750_evb_i2c_init(NPCM7xxState *soc)
 {
     /* lm75 temperature sensor on SVB, tmp105 is compatible */
@@ -128,6 +187,30 @@ static void npcm750_evb_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 6), "tmp105", 0x48);
 }
 
+static void npcm750_evb_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
+{
+    SplitIRQ *splitter = machine->fan_splitter;
+    static const int fan_counts[] = {2, 2, 2, 2, 2, 2, 2, 2};
+
+    npcm7xx_init_pwm_splitter(machine, soc, fan_counts);
+    npcm7xx_connect_pwm_fan(soc, &splitter[0], 0x00, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[0], 0x01, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[1], 0x02, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[1], 0x03, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[2], 0x04, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[2], 0x05, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[3], 0x06, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[3], 0x07, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[4], 0x08, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[4], 0x09, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[5], 0x0a, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[5], 0x0b, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[6], 0x0c, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[6], 0x0d, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[7], 0x0e, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[7], 0x0f, 1);
+}
+
 static void quanta_gsj_i2c_init(NPCM7xxState *soc)
 {
     /* GSJ machine have 4 max31725 temperature sensors, tmp105 is compatible. */
@@ -142,6 +225,20 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     /* TODO: Add additional i2c devices. */
 }
 
+static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
+{
+    SplitIRQ *splitter = machine->fan_splitter;
+    static const int fan_counts[] = {2, 2, 2, 0, 0, 0, 0, 0};
+
+    npcm7xx_init_pwm_splitter(machine, soc, fan_counts);
+    npcm7xx_connect_pwm_fan(soc, &splitter[0], 0x00, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[0], 0x01, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[1], 0x02, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[1], 0x03, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[2], 0x04, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[2], 0x05, 1);
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -153,6 +250,7 @@ static void npcm750_evb_init(MachineState *machine)
     npcm7xx_load_bootrom(machine, soc);
     npcm7xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD, 0, 0));
     npcm750_evb_i2c_init(soc);
+    npcm750_evb_fan_init(NPCM7XX_MACHINE(machine), soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
@@ -168,6 +266,7 @@ static void quanta_gsj_init(MachineState *machine)
     npcm7xx_connect_flash(&soc->fiu[0], 0, "mx25l25635e",
                           drive_get(IF_MTD, 0, 0));
     quanta_gsj_i2c_init(soc);
+    quanta_gsj_fan_init(NPCM7XX_MACHINE(machine), soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 3f70554d0f..61ecc57ab9 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -18,6 +18,7 @@
 
 #include "hw/boards.h"
 #include "hw/adc/npcm7xx_adc.h"
+#include "hw/core/split-irq.h"
 #include "hw/cpu/a9mpcore.h"
 #include "hw/gpio/npcm7xx_gpio.h"
 #include "hw/i2c/npcm7xx_smbus.h"
@@ -48,8 +49,16 @@
 #define NPCM7XX_GIC_CPU_IF_ADDR         (0xf03fe100)  /* GIC within A9 */
 #define NPCM7XX_BOARD_SETUP_ADDR        (0xffff1000)  /* Boot ROM */
 
+#define NPCM7XX_NR_PWM_MODULES 2
+
 typedef struct NPCM7xxMachine {
     MachineState        parent;
+    /*
+     * PWM fan splitter. each splitter connects to one PWM output and
+     * multiple MFT inputs.
+     */
+    SplitIRQ            fan_splitter[NPCM7XX_NR_PWM_MODULES *
+                                     NPCM7XX_PWM_PER_MODULE];
 } NPCM7xxMachine;
 
 #define TYPE_NPCM7XX_MACHINE MACHINE_TYPE_NAME("npcm7xx")
@@ -82,7 +91,7 @@ typedef struct NPCM7xxState {
     NPCM7xxCLKState     clk;
     NPCM7xxTimerCtrlState tim[3];
     NPCM7xxADCState     adc;
-    NPCM7xxPWMState     pwm[2];
+    NPCM7xxPWMState     pwm[NPCM7XX_NR_PWM_MODULES];
     NPCM7xxMFTState     mft[8];
     NPCM7xxOTPState     key_storage;
     NPCM7xxOTPState     fuse_array;
-- 
2.31.0.rc2.261.g7f71774620-goog


