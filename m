Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A5220D075
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 19:41:18 +0200 (CEST)
Received: from localhost ([::1]:50144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpxmP-0008R5-3N
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 13:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jpxjn-0005y8-Me; Mon, 29 Jun 2020 13:38:35 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:41158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jpxjl-0000JM-7r; Mon, 29 Jun 2020 13:38:35 -0400
Received: by mail-ed1-x544.google.com with SMTP id e22so13556581edq.8;
 Mon, 29 Jun 2020 10:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KiqAtoEZxN9iujAVoojggA/nsoA7gi2cNnzLKEYZw80=;
 b=sUaCqhenZXl5cBaL0fs/hO05iEoYj171cdkMU5uhKNAdnjTWiAdIdDBe9WCNkb/4RV
 NutM1ig3wKTq+0Pgo/s4G9OFMU9/xQJ6W1jZief5A6w3YH7e1GZo1MrYi32pxrvU0Ja8
 Vp11cq0BqJVefh+dXuzPa3n6Jrii3KwV5+DrK9soLc+SFExX8AXpQCXhAFbIYQP+7PeI
 /MMYKHEcMRXbcA3veOt8H//rlincLM/qoNbRh4szDNwqbD08/EnFYxWUJoynj6gXyfhi
 KVU8xR9XoevcTG/qn7zKc7y0jv98TdHATKScoyFkU9Qlz84eqv2MH3H9DGdAgGtqd1ec
 tbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KiqAtoEZxN9iujAVoojggA/nsoA7gi2cNnzLKEYZw80=;
 b=mMdRqshsbSEdo/2MMZCWcHrDnIROUHGmpAKedxfKsRSoNo/TnYG90zNxHZuSeyLrh4
 qv6ZCPmbPCp2inU0TQDbmSy27s34s9/H5nTLl7wrIRAqNZH4Tjr72Ieu/VC+uKaggb+W
 ET7ffjQ0Q5MUSjsM/hlH7EJbr/1aKGZhhmXXM1VPknt06UQcNsX6Et4+4JMQg/2/5idz
 DuXJtpu24yMTf9ylAMNBwXkbVsGCrwot9AmNoCSHD4Bd1Y7ptHp+HGWcGA1ONfazbWk/
 I2VYwRiN9qVcGJFU4a0iYdq2u4ZsmvLlenkf5bQK56jFAYTDUdoIKFL5fC2IJ4tTWLzE
 MpgA==
X-Gm-Message-State: AOAM533L+K3o/2h7ibAH/9fYy/XB4JoLTwa70yMJzGnyEXuV2+YUvVdN
 OUn28yGtX28mjKPzmVDg5WMe5pYP8Ik=
X-Google-Smtp-Source: ABdhPJytyWvvDl0licA0AaDlkx0joOAB98vT6xeLoqRJEe0dkwekSzIrubjMwiFLDV/oSxaBJ1tDNw==
X-Received: by 2002:a50:9b5d:: with SMTP id a29mr16408955edj.68.1593452310525; 
 Mon, 29 Jun 2020 10:38:30 -0700 (PDT)
Received: from x1w.redhat.com (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id ce19sm216029ejb.24.2020.06.29.10.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 10:38:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] hw/i2c: Rename i2c_create_slave() as
 i2c_slave_create_simple()
Date: Mon, 29 Jun 2020 19:38:20 +0200
Message-Id: <20200629173821.22037-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200629173821.22037-1-f4bug@amsat.org>
References: <20200629173821.22037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Jan Kiszka <jan.kiszka@web.de>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We use "create_simple" names for functions that allocate, initialize,
configure and realize device objects: pci_create_simple(),
isa_create_simple(), usb_create_simple(). For consistency, rename
i2c_create_slave() as i2c_slave_create_simple(). Since we have
to update all the callers, also let it return a I2CSlave object.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/i2c/i2c.h |  2 +-
 hw/arm/aspeed.c      | 58 ++++++++++++++++++++++----------------------
 hw/arm/musicpal.c    |  4 +--
 hw/arm/nseries.c     |  8 +++---
 hw/arm/pxa2xx.c      |  5 ++--
 hw/arm/realview.c    |  2 +-
 hw/arm/spitz.c       |  4 +--
 hw/arm/stellaris.c   |  2 +-
 hw/arm/tosa.c        |  2 +-
 hw/arm/versatilepb.c |  2 +-
 hw/arm/vexpress.c    |  2 +-
 hw/arm/z2.c          |  4 +--
 hw/display/sii9022.c |  2 +-
 hw/i2c/core.c        |  6 ++---
 hw/ppc/e500.c        |  2 +-
 hw/ppc/sam460ex.c    |  2 +-
 16 files changed, 54 insertions(+), 53 deletions(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index cb7211f027..c533058998 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -80,7 +80,7 @@ int i2c_send(I2CBus *bus, uint8_t data);
 uint8_t i2c_recv(I2CBus *bus);
 
 I2CSlave *i2c_slave_new(const char *name, uint8_t addr);
-DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr);
+I2CSlave *i2c_slave_create_simple(I2CBus *bus, const char *name, uint8_t addr);
 bool i2c_slave_realize_and_unref(I2CSlave *dev, I2CBus *bus, Error **errp);
 
 /* lm832x.c */
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index ed14e79f57..5fa95f0f02 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -385,14 +385,14 @@ static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
 
     /* The palmetto platform expects a ds3231 RTC but a ds1338 is
      * enough to provide basic RTC features. Alarms will be missing */
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 0), "ds1338", 0x68);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 0), "ds1338", 0x68);
 
     smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 0), 0x50,
                           eeprom_buf);
 
     /* add a TMP423 temperature sensor */
-    dev = i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 2),
-                           "tmp423", 0x4c);
+    dev = DEVICE(i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2),
+                                         "tmp423", 0x4c));
     object_property_set_int(OBJECT(dev), 31000, "temperature0", &error_abort);
     object_property_set_int(OBJECT(dev), 28000, "temperature1", &error_abort);
     object_property_set_int(OBJECT(dev), 20000, "temperature2", &error_abort);
@@ -408,12 +408,12 @@ static void ast2500_evb_i2c_init(AspeedMachineState *bmc)
                           eeprom_buf);
 
     /* The AST2500 EVB expects a LM75 but a TMP105 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 7),
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7),
                      TYPE_TMP105, 0x4d);
 
     /* The AST2500 EVB does not have an RTC. Let's pretend that one is
      * plugged on the I2C bus header */
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
 }
 
 static void ast2600_evb_i2c_init(AspeedMachineState *bmc)
@@ -428,36 +428,36 @@ static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
 
     /* The romulus board expects Epson RX8900 I2C RTC but a ds1338 is
      * good enough */
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
 }
 
 static void swift_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
 
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9552", 0x60);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9552", 0x60);
 
     /* The swift board expects a TMP275 but a TMP105 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 7), "tmp105", 0x48);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "tmp105", 0x48);
     /* The swift board expects a pca9551 but a pca9552 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552", 0x60);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552", 0x60);
 
     /* The swift board expects an Epson RX8900 RTC but a ds1338 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 8), "ds1338", 0x32);
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552", 0x60);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "ds1338", 0x32);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552", 0x60);
 
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4c);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4c);
     /* The swift board expects a pca9539 but a pca9552 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 9), "pca9552", 0x74);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "pca9552", 0x74);
 
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4c);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4c);
     /* The swift board expects a pca9539 but a pca9552 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 10), "pca9552",
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "pca9552",
                      0x74);
 
     /* The swift board expects a TMP275 but a TMP105 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105", 0x48);
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105", 0x4a);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105", 0x48);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105", 0x4a);
 }
 
 static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
@@ -465,8 +465,8 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
     AspeedSoCState *soc = &bmc->soc;
 
     /* bus 2 : */
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x48);
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x49);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x48);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x49);
     /* bus 2 : pca9546 @ 0x73 */
 
     /* bus 3 : pca9548 @ 0x70 */
@@ -476,21 +476,21 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
     smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 4), 0x54,
                           eeprom4_54);
     /* PCA9539 @ 0x76, but PCA9552 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 4), "pca9552", 0x76);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "pca9552", 0x76);
     /* PCA9539 @ 0x77, but PCA9552 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 4), "pca9552", 0x77);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "pca9552", 0x77);
 
     /* bus 6 : */
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x48);
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x49);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x48);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x49);
     /* bus 6 : pca9546 @ 0x73 */
 
     /* bus 8 : */
     uint8_t *eeprom8_56 = g_malloc0(8 * 1024);
     smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 8), 0x56,
                           eeprom8_56);
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552", 0x60);
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552", 0x61);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552", 0x60);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552", 0x61);
     /* bus 8 : adc128d818 @ 0x1d */
     /* bus 8 : adc128d818 @ 0x1f */
 
@@ -519,16 +519,16 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
                                 aspeed_i2c_get_bus(&soc->i2c, 3),
                                 &error_fatal);
 
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 4), "tmp423", 0x4c);
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 5), "tmp423", 0x4c);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "tmp423", 0x4c);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), "tmp423", 0x4c);
 
     /* The Witherspoon expects a TMP275 but a TMP105 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 9), TYPE_TMP105,
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), TYPE_TMP105,
                      0x4a);
 
     /* The witherspoon board expects Epson RX8900 I2C RTC but a ds1338 is
      * good enough */
-    i2c_create_slave(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
 
     smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 11), 0x51,
                           eeprom_buf);
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 394a3345bd..bf7bd28b94 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1584,7 +1584,7 @@ static void musicpal_init(MachineState *machine)
     DeviceState *i2c_dev;
     DeviceState *lcd_dev;
     DeviceState *key_dev;
-    DeviceState *wm8750_dev;
+    I2CSlave *wm8750_dev;
     SysBusDevice *s;
     I2CBus *i2c;
     int i;
@@ -1687,7 +1687,7 @@ static void musicpal_init(MachineState *machine)
         qdev_connect_gpio_out(key_dev, i, qdev_get_gpio_in(dev, i + 15));
     }
 
-    wm8750_dev = i2c_create_slave(i2c, TYPE_WM8750, MP_WM_ADDR);
+    wm8750_dev = i2c_slave_create_simple(i2c, TYPE_WM8750, MP_WM_ADDR);
     dev = qdev_new(TYPE_MV88W8618_AUDIO);
     s = SYS_BUS_DEVICE(dev);
     object_property_set_link(OBJECT(dev), OBJECT(wm8750_dev),
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 428a2a2c5a..e48092ca04 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -215,7 +215,7 @@ static void n8x0_i2c_setup(struct n800_s *s)
     I2CBus *i2c = omap_i2c_bus(s->mpu->i2c[0]);
 
     /* Attach a menelaus PM chip */
-    dev = i2c_create_slave(i2c, "twl92230", N8X0_MENELAUS_ADDR);
+    dev = DEVICE(i2c_slave_create_simple(i2c, "twl92230", N8X0_MENELAUS_ADDR));
     qdev_connect_gpio_out(dev, 3,
                           qdev_get_gpio_in(s->mpu->ih[0],
                                            OMAP_INT_24XX_SYS_NIRQ));
@@ -224,7 +224,7 @@ static void n8x0_i2c_setup(struct n800_s *s)
     qemu_register_powerdown_notifier(&n8x0_system_powerdown_notifier);
 
     /* Attach a TMP105 PM chip (A0 wired to ground) */
-    dev = i2c_create_slave(i2c, TYPE_TMP105, N8X0_TMP105_ADDR);
+    dev = DEVICE(i2c_slave_create_simple(i2c, TYPE_TMP105, N8X0_TMP105_ADDR));
     qdev_connect_gpio_out(dev, 0, tmp_irq);
 }
 
@@ -416,8 +416,8 @@ static void n810_kbd_setup(struct n800_s *s)
 
     /* Attach the LM8322 keyboard to the I2C bus,
      * should happen in n8x0_i2c_setup and s->kbd be initialised here.  */
-    s->kbd = i2c_create_slave(omap_i2c_bus(s->mpu->i2c[0]),
-                           "lm8323", N810_LM8323_ADDR);
+    s->kbd = DEVICE(i2c_slave_create_simple(omap_i2c_bus(s->mpu->i2c[0]),
+                                            "lm8323", N810_LM8323_ADDR));
     qdev_connect_gpio_out(s->kbd, 0, kbd_irq);
 }
 
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index f104a33463..6203c4cfe0 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -1522,8 +1522,9 @@ PXA2xxI2CState *pxa2xx_i2c_init(hwaddr base,
     s = PXA2XX_I2C(i2c_dev);
     /* FIXME: Should the slave device really be on a separate bus?  */
     i2cbus = i2c_init_bus(dev, "dummy");
-    dev = i2c_create_slave(i2cbus, TYPE_PXA2XX_I2C_SLAVE, 0);
-    s->slave = PXA2XX_I2C_SLAVE(dev);
+    s->slave = PXA2XX_I2C_SLAVE(i2c_slave_create_simple(i2cbus,
+                                                        TYPE_PXA2XX_I2C_SLAVE,
+                                                        0));
     s->slave->host = s;
 
     return s;
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index b6c0a1adb9..e105b6509f 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -285,7 +285,7 @@ static void realview_init(MachineState *machine,
 
     dev = sysbus_create_simple(TYPE_VERSATILE_I2C, 0x10002000, NULL);
     i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
-    i2c_create_slave(i2c, "ds1338", 0x68);
+    i2c_slave_create_simple(i2c, "ds1338", 0x68);
 
     /* Memory map for RealView Emulation Baseboard:  */
     /* 0x10000000 System registers.  */
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index fc18212e68..716ca3c7b6 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -758,7 +758,7 @@ static void spitz_i2c_setup(PXA2xxState *cpu)
     DeviceState *wm;
 
     /* Attach a WM8750 to the bus */
-    wm = i2c_create_slave(bus, TYPE_WM8750, 0);
+    wm = DEVICE(i2c_slave_create_simple(bus, TYPE_WM8750, 0));
 
     spitz_wm8750_addr(wm, 0, 0);
     qdev_connect_gpio_out(cpu->gpio, SPITZ_GPIO_WM,
@@ -773,7 +773,7 @@ static void spitz_i2c_setup(PXA2xxState *cpu)
 static void spitz_akita_i2c_setup(PXA2xxState *cpu)
 {
     /* Attach a Max7310 to Akita I2C bus.  */
-    i2c_create_slave(pxa2xx_i2c_bus(cpu->i2c[0]), "max7310",
+    i2c_slave_create_simple(pxa2xx_i2c_bus(cpu->i2c[0]), "max7310",
                      AKITA_MAX_ADDR);
 }
 
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 97ef566c12..3f45550cf6 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1380,7 +1380,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
                                    qdev_get_gpio_in(nvic, 8));
         i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
         if (board->peripherals & BP_OLED_I2C) {
-            i2c_create_slave(i2c, "ssd0303", 0x3d);
+            i2c_slave_create_simple(i2c, "ssd0303", 0x3d);
         }
     }
 
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 5dee2d76c6..8c1ee0cdd1 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -206,7 +206,7 @@ static uint8_t tosa_dac_recv(I2CSlave *s)
 static void tosa_tg_init(PXA2xxState *cpu)
 {
     I2CBus *bus = pxa2xx_i2c_bus(cpu->i2c[0]);
-    i2c_create_slave(bus, TYPE_TOSA_DAC, DAC_BASE);
+    i2c_slave_create_simple(bus, TYPE_TOSA_DAC, DAC_BASE);
     ssi_create_slave(cpu->ssp[1], "tosa-ssp");
 }
 
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index e596b8170f..34709afb32 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -317,7 +317,7 @@ static void versatile_init(MachineState *machine, int board_id)
 
     dev = sysbus_create_simple(TYPE_VERSATILE_I2C, 0x10002000, NULL);
     i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
-    i2c_create_slave(i2c, "ds1338", 0x68);
+    i2c_slave_create_simple(i2c, "ds1338", 0x68);
 
     /* Add PL041 AACI Interface to the LM4549 codec */
     pl041 = qdev_new("pl041");
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 5bf9cff8a8..4f6a2b6ddd 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -642,7 +642,7 @@ static void vexpress_common_init(MachineState *machine)
 
     dev = sysbus_create_simple(TYPE_VERSATILE_I2C, map[VE_SERIALDVI], NULL);
     i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
-    i2c_create_slave(i2c, "sii9022", 0x39);
+    i2c_slave_create_simple(i2c, "sii9022", 0x39);
 
     sysbus_create_simple("pl031", map[VE_RTC], pic[4]); /* RTC */
 
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index a0f4095990..8cf8189f6f 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -327,8 +327,8 @@ static void z2_init(MachineState *machine)
     type_register_static(&aer915_info);
     z2_lcd = ssi_create_slave(mpu->ssp[1], "zipit-lcd");
     bus = pxa2xx_i2c_bus(mpu->i2c[0]);
-    i2c_create_slave(bus, TYPE_AER915, 0x55);
-    wm = i2c_create_slave(bus, TYPE_WM8750, 0x1b);
+    i2c_slave_create_simple(bus, TYPE_AER915, 0x55);
+    wm = DEVICE(i2c_slave_create_simple(bus, TYPE_WM8750, 0x1b));
     mpu->i2s->opaque = wm;
     mpu->i2s->codec_out = wm8750_dac_dat;
     mpu->i2s->codec_in = wm8750_adc_dat;
diff --git a/hw/display/sii9022.c b/hw/display/sii9022.c
index 0710ce9de5..3b82a8567f 100644
--- a/hw/display/sii9022.c
+++ b/hw/display/sii9022.c
@@ -161,7 +161,7 @@ static void sii9022_realize(DeviceState *dev, Error **errp)
     I2CBus *bus;
 
     bus = I2C_BUS(qdev_get_parent_bus(dev));
-    i2c_create_slave(bus, TYPE_I2CDDC, 0x50);
+    i2c_slave_create_simple(bus, TYPE_I2CDDC, 0x50);
 }
 
 static void sii9022_class_init(ObjectClass *klass, void *data)
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 135ea56036..21ec52ac5a 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -281,11 +281,11 @@ bool i2c_slave_realize_and_unref(I2CSlave *dev, I2CBus *bus, Error **errp)
     return qdev_realize_and_unref(&dev->qdev, &bus->qbus, errp);
 }
 
-DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)
+I2CSlave *i2c_slave_create_simple(I2CBus *bus, const char *name, uint8_t addr)
 {
-    DeviceState *dev = DEVICE(i2c_slave_new(name, addr));
+    I2CSlave *dev = i2c_slave_new(name, addr);
 
-    i2c_slave_realize_and_unref(I2C_SLAVE(dev), bus, &error_fatal);
+    i2c_slave_realize_and_unref(dev, bus, &error_abort);
 
     return dev;
 }
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 51bf95b303..67924915ae 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -944,7 +944,7 @@ void ppce500_init(MachineState *machine)
     memory_region_add_subregion(ccsr_addr_space, MPC8544_I2C_REGS_OFFSET,
                                 sysbus_mmio_get_region(s, 0));
     i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
-    i2c_create_slave(i2c, "ds1338", RTC_REGS_OFFSET);
+    i2c_slave_create_simple(i2c, "ds1338", RTC_REGS_OFFSET);
 
 
     /* General Utility device */
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 1a106a68de..1702344c46 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -339,7 +339,7 @@ static void sam460ex_init(MachineState *machine)
     spd_data[20] = 4; /* SO-DIMM module */
     smbus_eeprom_init_one(i2c, 0x50, spd_data);
     /* RTC */
-    i2c_create_slave(i2c, "m41t80", 0x68);
+    i2c_slave_create_simple(i2c, "m41t80", 0x68);
 
     dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600800, uic[0][3]);
 
-- 
2.21.3


