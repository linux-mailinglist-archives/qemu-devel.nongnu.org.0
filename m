Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47810204B27
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 09:32:40 +0200 (CEST)
Received: from localhost ([::1]:56164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jndQ7-0006Pt-7I
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 03:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jndLB-0007C2-P3; Tue, 23 Jun 2020 03:27:33 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jndL9-0004zl-TX; Tue, 23 Jun 2020 03:27:33 -0400
Received: by mail-wm1-x341.google.com with SMTP id t194so2059097wmt.4;
 Tue, 23 Jun 2020 00:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NpyG7hZJw/+4UIPOBhAz0178NGmLQwbmVGrN4QqVZFU=;
 b=Oyo6uM2pc/TKyMHQ+OeOmsgQxA41aLeKDMRq2f1rCNNjzLU4CBhPlRbcXbAHZ2PAxk
 LneLB69NaArLxr7+molzKwcloPOvrNY7Vjc33KJi1CqZf1bWl+k0VVwqNc2HqKTVi8LC
 7XZH13CR0X0iaZ331Lf/ayKiaALAOu1yiaQ7LQfBAeCeb29xFfy1PRp9F7QB3LRByE1q
 fwgvLc5mdRau6MmnMJ8Bbtckh4osm9w/y1d3klhWSHB28Oj52Y/gg3kEkTQ3XqWnMMKF
 MtZEQMvvQtq7Vy0DorJBhVk4abj2EO2luGty6PTzTDZIey3P7Dqd4DRmwsjF+o9wLw/R
 39gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NpyG7hZJw/+4UIPOBhAz0178NGmLQwbmVGrN4QqVZFU=;
 b=qMRTBBtI/ZNXMWE/uw3hCz++BXIKWj8HMShK3qiLpp2F1LKfsDWw/rVv+K8JZrWzW8
 eWSz9KsON+iIwXzSXp8ZoZobu2Ox8j0i2qq20DTsj3o62DNNGUYXfwxzv6vAPJA0MylV
 4emki2zsshJqhI++ejNUNnjFizEAinvs/ioIu0A2ALQLJR9gtU2pKIC3Ky+9yfqZukxy
 aNlhn6liny4eKiTHjzLBd+W+y6vp0W+/pNmLoIjdY/VGK/zStgwFQDqlPyR4zrCECji9
 +T3NfenuqBVu/WVLdX7urj3nbq6VzfL177Nd15DnYhSRovJc/CLr9nepD/0LjQ71csup
 8oUw==
X-Gm-Message-State: AOAM532KgmAtGTeoQi1xNjS88aNkLN9MSDE6YyHyJxaa83i/OrJxcPFH
 SoBsVf0gOvXPpX4M+wN5Z3EEVU8d
X-Google-Smtp-Source: ABdhPJzkbE8o7CDIO1D1HfMQrY1AZevFb7uQyrcZto6diyiZZ1NFtf4ec4LI7Kxym2kWS7m5GIT0TQ==
X-Received: by 2002:a05:600c:22c9:: with SMTP id
 9mr24349932wmg.68.1592897249227; 
 Tue, 23 Jun 2020 00:27:29 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id l14sm4200059wrn.18.2020.06.23.00.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 00:27:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/9] hw/misc/pca9552: Rename generic code as pca955x
Date: Tue, 23 Jun 2020 09:27:17 +0200
Message-Id: <20200623072723.6324-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200623072723.6324-1-f4bug@amsat.org>
References: <20200623072723.6324-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
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
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various code from the PCA9552 device model is generic to the
PCA955X family. We'll split the generic code in a base class
in the next commit. To ease review, first do a dumb renaming.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/pca9552.h | 10 ++---
 hw/misc/pca9552.c         | 80 +++++++++++++++++++--------------------
 2 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/include/hw/misc/pca9552.h b/include/hw/misc/pca9552.h
index bc5ed31087..db527595a3 100644
--- a/include/hw/misc/pca9552.h
+++ b/include/hw/misc/pca9552.h
@@ -12,11 +12,11 @@
 #include "hw/i2c/i2c.h"
 
 #define TYPE_PCA9552 "pca9552"
-#define PCA9552(obj) OBJECT_CHECK(PCA9552State, (obj), TYPE_PCA9552)
+#define PCA955X(obj) OBJECT_CHECK(PCA955xState, (obj), TYPE_PCA9552)
 
-#define PCA9552_NR_REGS 10
+#define PCA955X_NR_REGS 10
 
-typedef struct PCA9552State {
+typedef struct PCA955xState {
     /*< private >*/
     I2CSlave i2c;
     /*< public >*/
@@ -24,9 +24,9 @@ typedef struct PCA9552State {
     uint8_t len;
     uint8_t pointer;
 
-    uint8_t regs[PCA9552_NR_REGS];
+    uint8_t regs[PCA955X_NR_REGS];
     uint8_t max_reg;
     uint8_t pin_count;
-} PCA9552State;
+} PCA955xState;
 
 #endif
diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index 81da757a7e..5681ff3b22 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -25,7 +25,7 @@
 
 static const char *led_state[] = {"on", "off", "pwm0", "pwm1"};
 
-static uint8_t pca9552_pin_get_config(PCA9552State *s, int pin)
+static uint8_t pca955x_pin_get_config(PCA955xState *s, int pin)
 {
     uint8_t reg   = PCA9552_LS0 + (pin / 4);
     uint8_t shift = (pin % 4) << 1;
@@ -33,14 +33,14 @@ static uint8_t pca9552_pin_get_config(PCA9552State *s, int pin)
     return extract32(s->regs[reg], shift, 2);
 }
 
-static void pca9552_update_pin_input(PCA9552State *s)
+static void pca955x_update_pin_input(PCA955xState *s)
 {
     int i;
 
     for (i = 0; i < s->pin_count; i++) {
         uint8_t input_reg = PCA9552_INPUT0 + (i / 8);
         uint8_t input_shift = (i % 8);
-        uint8_t config = pca9552_pin_get_config(s, i);
+        uint8_t config = pca955x_pin_get_config(s, i);
 
         switch (config) {
         case PCA9552_LED_ON:
@@ -58,7 +58,7 @@ static void pca9552_update_pin_input(PCA9552State *s)
     }
 }
 
-static uint8_t pca9552_read(PCA9552State *s, uint8_t reg)
+static uint8_t pca955x_read(PCA955xState *s, uint8_t reg)
 {
     switch (reg) {
     case PCA9552_INPUT0:
@@ -79,7 +79,7 @@ static uint8_t pca9552_read(PCA9552State *s, uint8_t reg)
     }
 }
 
-static void pca9552_write(PCA9552State *s, uint8_t reg, uint8_t data)
+static void pca955x_write(PCA955xState *s, uint8_t reg, uint8_t data)
 {
     switch (reg) {
     case PCA9552_PSC0:
@@ -94,7 +94,7 @@ static void pca9552_write(PCA9552State *s, uint8_t reg, uint8_t data)
     case PCA9552_LS2:
     case PCA9552_LS3:
         s->regs[reg] = data;
-        pca9552_update_pin_input(s);
+        pca955x_update_pin_input(s);
         break;
 
     case PCA9552_INPUT0:
@@ -110,7 +110,7 @@ static void pca9552_write(PCA9552State *s, uint8_t reg, uint8_t data)
  * after each byte is sent to or received by the device. The index
  * rollovers to 0 when the maximum register address is reached.
  */
-static void pca9552_autoinc(PCA9552State *s)
+static void pca955x_autoinc(PCA955xState *s)
 {
     if (s->pointer != 0xFF && s->pointer & PCA9552_AUTOINC) {
         uint8_t reg = s->pointer & 0xf;
@@ -120,12 +120,12 @@ static void pca9552_autoinc(PCA9552State *s)
     }
 }
 
-static uint8_t pca9552_recv(I2CSlave *i2c)
+static uint8_t pca955x_recv(I2CSlave *i2c)
 {
-    PCA9552State *s = PCA9552(i2c);
+    PCA955xState *s = PCA955X(i2c);
     uint8_t ret;
 
-    ret = pca9552_read(s, s->pointer & 0xf);
+    ret = pca955x_read(s, s->pointer & 0xf);
 
     /*
      * From the Specs:
@@ -143,40 +143,40 @@ static uint8_t pca9552_recv(I2CSlave *i2c)
                       __func__);
     }
 
-    pca9552_autoinc(s);
+    pca955x_autoinc(s);
 
     return ret;
 }
 
-static int pca9552_send(I2CSlave *i2c, uint8_t data)
+static int pca955x_send(I2CSlave *i2c, uint8_t data)
 {
-    PCA9552State *s = PCA9552(i2c);
+    PCA955xState *s = PCA955X(i2c);
 
     /* First byte sent by is the register address */
     if (s->len == 0) {
         s->pointer = data;
         s->len++;
     } else {
-        pca9552_write(s, s->pointer & 0xf, data);
+        pca955x_write(s, s->pointer & 0xf, data);
 
-        pca9552_autoinc(s);
+        pca955x_autoinc(s);
     }
 
     return 0;
 }
 
-static int pca9552_event(I2CSlave *i2c, enum i2c_event event)
+static int pca955x_event(I2CSlave *i2c, enum i2c_event event)
 {
-    PCA9552State *s = PCA9552(i2c);
+    PCA955xState *s = PCA955X(i2c);
 
     s->len = 0;
     return 0;
 }
 
-static void pca9552_get_led(Object *obj, Visitor *v, const char *name,
+static void pca955x_get_led(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
-    PCA9552State *s = PCA9552(obj);
+    PCA955xState *s = PCA955X(obj);
     int led, rc, reg;
     uint8_t state;
 
@@ -195,7 +195,7 @@ static void pca9552_get_led(Object *obj, Visitor *v, const char *name,
      * reading the INPUTx reg
      */
     reg = PCA9552_LS0 + led / 4;
-    state = (pca9552_read(s, reg) >> (led % 8)) & 0x3;
+    state = (pca955x_read(s, reg) >> (led % 8)) & 0x3;
     visit_type_str(v, name, (char **)&led_state[state], errp);
 }
 
@@ -209,10 +209,10 @@ static inline uint8_t pca955x_ledsel(uint8_t oldval, int led_num, int state)
                 ((state & 0x3) << (led_num << 1));
 }
 
-static void pca9552_set_led(Object *obj, Visitor *v, const char *name,
+static void pca955x_set_led(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
-    PCA9552State *s = PCA9552(obj);
+    PCA955xState *s = PCA955X(obj);
     Error *local_err = NULL;
     int led, rc, reg, val;
     uint8_t state;
@@ -244,9 +244,9 @@ static void pca9552_set_led(Object *obj, Visitor *v, const char *name,
     }
 
     reg = PCA9552_LS0 + led / 4;
-    val = pca9552_read(s, reg);
+    val = pca955x_read(s, reg);
     val = pca955x_ledsel(val, led % 4, state);
-    pca9552_write(s, reg, val);
+    pca955x_write(s, reg, val);
 }
 
 static const VMStateDescription pca9552_vmstate = {
@@ -254,17 +254,17 @@ static const VMStateDescription pca9552_vmstate = {
     .version_id = 0,
     .minimum_version_id = 0,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT8(len, PCA9552State),
-        VMSTATE_UINT8(pointer, PCA9552State),
-        VMSTATE_UINT8_ARRAY(regs, PCA9552State, PCA9552_NR_REGS),
-        VMSTATE_I2C_SLAVE(i2c, PCA9552State),
+        VMSTATE_UINT8(len, PCA955xState),
+        VMSTATE_UINT8(pointer, PCA955xState),
+        VMSTATE_UINT8_ARRAY(regs, PCA955xState, PCA955X_NR_REGS),
+        VMSTATE_I2C_SLAVE(i2c, PCA955xState),
         VMSTATE_END_OF_LIST()
     }
 };
 
 static void pca9552_reset(DeviceState *dev)
 {
-    PCA9552State *s = PCA9552(dev);
+    PCA955xState *s = PCA955X(dev);
 
     s->regs[PCA9552_PSC0] = 0xFF;
     s->regs[PCA9552_PWM0] = 0x80;
@@ -275,15 +275,15 @@ static void pca9552_reset(DeviceState *dev)
     s->regs[PCA9552_LS2] = 0x55;
     s->regs[PCA9552_LS3] = 0x55;
 
-    pca9552_update_pin_input(s);
+    pca955x_update_pin_input(s);
 
     s->pointer = 0xFF;
     s->len = 0;
 }
 
-static void pca9552_initfn(Object *obj)
+static void pca955x_initfn(Object *obj)
 {
-    PCA9552State *s = PCA9552(obj);
+    PCA955xState *s = PCA955X(obj);
     int led;
 
     /* If support for the other PCA955X devices are implemented, these
@@ -297,7 +297,7 @@ static void pca9552_initfn(Object *obj)
         char *name;
 
         name = g_strdup_printf("led%d", led);
-        object_property_add(obj, name, "bool", pca9552_get_led, pca9552_set_led,
+        object_property_add(obj, name, "bool", pca955x_get_led, pca955x_set_led,
                             NULL, NULL);
         g_free(name);
     }
@@ -308,9 +308,9 @@ static void pca9552_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
 
-    k->event = pca9552_event;
-    k->recv = pca9552_recv;
-    k->send = pca9552_send;
+    k->event = pca955x_event;
+    k->recv = pca955x_recv;
+    k->send = pca955x_send;
     dc->reset = pca9552_reset;
     dc->vmsd = &pca9552_vmstate;
 }
@@ -318,14 +318,14 @@ static void pca9552_class_init(ObjectClass *klass, void *data)
 static const TypeInfo pca9552_info = {
     .name          = TYPE_PCA9552,
     .parent        = TYPE_I2C_SLAVE,
-    .instance_init = pca9552_initfn,
-    .instance_size = sizeof(PCA9552State),
+    .instance_init = pca955x_initfn,
+    .instance_size = sizeof(PCA955xState),
     .class_init    = pca9552_class_init,
 };
 
-static void pca9552_register_types(void)
+static void pca955x_register_types(void)
 {
     type_register_static(&pca9552_info);
 }
 
-type_init(pca9552_register_types)
+type_init(pca955x_register_types)
-- 
2.21.3


