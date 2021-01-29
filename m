Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C733082EA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 02:08:42 +0100 (CET)
Received: from localhost ([::1]:56682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5IHB-0007Qc-GW
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 20:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3DV8TYAgKCiASQD6KPODCKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--wuhaotsh.bounces.google.com>)
 id 1l5ICu-00035y-Ma
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 20:04:16 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:52862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3DV8TYAgKCiASQD6KPODCKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--wuhaotsh.bounces.google.com>)
 id 1l5ICs-0004WW-Vp
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 20:04:16 -0500
Received: by mail-pg1-x54a.google.com with SMTP id 18so5106150pgf.19
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 17:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=5L59xU9wVj0tK8cnn1xfmiztIbM883HqzN6NgU/DUus=;
 b=TDvJ+JOvg5KNVqJep2Rs2uPZInicmC0tZ+wrLDjT5u3s3JVeRj9qORVWfV79nxtb19
 QLr7PuNw0QZEsNZkrs+fezPgIXmMzuSlP6FASzYZKRQfwSMw/hNeBsBCd1+v+cX0dlFT
 HKCdyb3k1klUffiGk7cGqD8MsihinrMBqmTROUyg1yZsW5uwZHoqEVtoBPnOWWsiHpVU
 YQiED6l9omBtXrPgonHWpGr9s2hg2mRIw1XHyjbKFms20Ntyamr6iKnQr+pAEPJdD+0w
 3jfRWv+fq0b1j48an9FBk3tyrlZ4AdoAoZqpNOGvbS9eUDvZmYUfPFKRP0dPQFpVn2Qf
 QDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=5L59xU9wVj0tK8cnn1xfmiztIbM883HqzN6NgU/DUus=;
 b=lBn2YpZuN87EMw0WdGyEv1MQPJ0bqAL10YDUTsTXyPcg4Jun0XqdFBBgfbkncsPGpg
 WFXUPztDS68wrk4+18n05LvT2q3Xnpn5UUEUTrrRJsJxYsU4uWhqMj5oJTyqyFYmZ6nE
 /5rjjVyujH+eCSmdo0qW9SnXzcdeUo/RZrxj0sWTYER0+sS05PPCgXSlOxSVhWlqqtD3
 fL2Yklx0gQ1AaL8qGm8iKEcFaHeMX4i+DfB6pIWnRz/JYvHqbeU/2tbcwAT8ZheaTHF0
 FkaAY0EGBCUUkDLyXjtyUzSSQW6GCRUwAtkfLvbLEgmRbU5YQHQmrEvTeLP+g+YAGyqH
 7U3g==
X-Gm-Message-State: AOAM530i5654e8f2bOrjqedb79r5oFdivsF12Lvs3cGyGZyuzC76qY9d
 aUwmRNts5LkCRx9w8i+CbeDMywMs/MEQag==
X-Google-Smtp-Source: ABdhPJytIpPOhP87UEj3VVVqGvq8I7+WpjLx+tb+JAbe9FR6fyoaQuESaUBcLzOu1DB8autMLHqdNcJMvz0t8g==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:d305:: with SMTP id
 p5mr2059893pju.33.1611882253387; Thu, 28 Jan 2021 17:04:13 -0800 (PST)
Date: Thu, 28 Jan 2021 16:58:43 -0800
In-Reply-To: <20210129005845.416272-1-wuhaotsh@google.com>
Message-Id: <20210129005845.416272-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2 4/6] hw/arm: Add I2C sensors and EEPROM for GSJ machine
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3DV8TYAgKCiASQD6KPODCKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--wuhaotsh.bounces.google.com;
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
Cc: cminyard@mvista.com, venture@google.com, hskinnemoen@google.com,
 qemu-devel@nongnu.org, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-devel@nongnu.org>

Add AT24 EEPROM and temperature sensors for GSJ machine.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 default-configs/devices/arm-softmmu.mak |  1 +
 hw/arm/npcm7xx_boards.c                 | 27 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 0500156a0c..d9805dd539 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -7,6 +7,7 @@ CONFIG_ARM_V7M=y
 # CONFIG_TEST_DEVICES=n
 
 CONFIG_ARM_VIRT=y
+CONFIG_AT24C=y
 CONFIG_CUBIEBOARD=y
 CONFIG_EXYNOS4=y
 CONFIG_HIGHBANK=y
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 47a215bd01..2d757b4013 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -19,6 +19,7 @@
 #include "exec/address-spaces.h"
 #include "hw/arm/npcm7xx.h"
 #include "hw/core/cpu.h"
+#include "hw/i2c/smbus_eeprom.h"
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
@@ -104,6 +105,17 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
     return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
 }
 
+static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
+                              uint32_t rsize)
+{
+    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
+    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
+    DeviceState *dev = DEVICE(i2c_dev);
+
+    qdev_prop_set_uint32(dev, "rom-size", rsize);
+    i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
+}
+
 static void npcm750_evb_i2c_init(NPCM7xxState *soc)
 {
     /* lm75 temperature sensor on SVB, tmp105 is compatible */
@@ -116,6 +128,20 @@ static void npcm750_evb_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 6), "tmp105", 0x48);
 }
 
+static void quanta_gsj_i2c_init(NPCM7xxState *soc)
+{
+    /* GSJ machine have 4 max31725 temperature sensors, tmp105 is compatible. */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), "tmp105", 0x5c);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 2), "tmp105", 0x5c);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
+
+    at24c_eeprom_init(soc, 9, 0x55, 8192);
+    at24c_eeprom_init(soc, 10, 0x55, 8192);
+
+    /* TODO: Add addtional i2c devices. */
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -141,6 +167,7 @@ static void quanta_gsj_init(MachineState *machine)
     npcm7xx_load_bootrom(machine, soc);
     npcm7xx_connect_flash(&soc->fiu[0], 0, "mx25l25635e",
                           drive_get(IF_MTD, 0, 0));
+    quanta_gsj_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.30.0.365.g02bc693789-goog


