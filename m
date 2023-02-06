Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6749B68C70D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 20:51:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP7Ut-0007fO-Pi; Mon, 06 Feb 2023 14:49:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <32VnhYwYKCjgncnomlaiiafY.WigkYgo-XYpYfhihaho.ila@flex--titusr.bounces.google.com>)
 id 1pP7Us-0007ep-E1
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:49:50 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <32VnhYwYKCjgncnomlaiiafY.WigkYgo-XYpYfhihaho.ila@flex--titusr.bounces.google.com>)
 id 1pP7Uq-0007ss-Ko
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:49:50 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 s7-20020a257707000000b0085600c7c70cso12418522ybc.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 11:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=5svBDPpOEX5xuVnze/3gbbDHfyiQ5kPXXMWNym3ZBK0=;
 b=Q4CPINzb+aucGoGxaelTg/5fnrUgDRu2nBLvC1A47hANN4FduC8hUSfMM2S6kn8jrV
 EMA1UR5fqvkU12rEBEQ8RcJB8Czzgzo/Z1G4V1PHRn8MMwlRjKdLluWcqXthkccRFwsQ
 EIck/iMG7OsosP9gua1WQKQ6H54WuZzZDv8f6j9HPMdUqtnlmU1ImK3y89+4j8gkABjQ
 5Cx/Ei1c0t3Ypdk2QysEek6u0aux22Karru9CKNonG9BL+Wrt+axtuJbcEaIyEbFQkcr
 ywNd6mNTb3aiCQe/8MvJDspYVP1bIhB2vULtex8fTrleRWUBbAKoHCDYCgL+PCoa6AgS
 Exng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5svBDPpOEX5xuVnze/3gbbDHfyiQ5kPXXMWNym3ZBK0=;
 b=U5WdOtY8LQv/84tdpGe7Lp7iWtsMlrOAABWESLOnJHHDfTp3MKagfFbIPAYIuT/aYZ
 RmK8TbYhqP4UVoCN08EcJD0Q5eCw1s0NWf8Q6+qXjIA+5AQWxt5Nb0SXHpuNaZ9JJwKS
 X4eh8nqXmEDuBJJD4GpVDYZ017CAEwhP7vXBSUqotvGfy4ab9QaDSyeaICLDzMGV/5Kh
 lsjid3O7BY+YsGa/gKnFa87rfH75FRe9xMBCo38oJdb/h+yKVqSNsJS5/RWD4AfYgnFW
 sg3157Tv374NjVcph0dVOLc3McuAL9QTtoCeP3y3XmNDPMCzmU2nDcNfNHGoxOF7BebL
 AoQQ==
X-Gm-Message-State: AO0yUKVhidYg29QBFuAaOs3k3lU8B66MhJwAN/GTOWko8cltc0wQwkuM
 Sqa4TnihaBUivNTEbm5LPD4nb4khamU=
X-Google-Smtp-Source: AK7set9jG3+CDmkAzrYO/ZhyxdhHKVJ4gwL0Fwtq6moO5xgIhXEE3gfhYNJ1LX3V53+6czNIqwjnCV+BtUc=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a81:a14a:0:b0:52a:9cc9:492f with SMTP id
 y71-20020a81a14a000000b0052a9cc9492fmr38832ywg.351.1675712985096; Mon, 06 Feb
 2023 11:49:45 -0800 (PST)
Date: Mon,  6 Feb 2023 19:49:35 +0000
In-Reply-To: <20230206194936.168843-1-titusr@google.com>
Mime-Version: 1.0
References: <20230206194936.168843-1-titusr@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230206194936.168843-3-titusr@google.com>
Subject: [PATCH 2/3] hw/gpio: add PCA9538 8-bit GPIO expander
From: Titus Rwantare <titusr@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=32VnhYwYKCjgncnomlaiiafY.WigkYgo-XYpYfhihaho.ila@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  The 8-bit expander has different register offsets than the 16-bit one,
  making them incompatible.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/gpio/pca_i2c_gpio.c         | 98 ++++++++++++++++++++++++++++++++++
 include/hw/gpio/pca_i2c_gpio.h |  7 +++
 2 files changed, 105 insertions(+)

diff --git a/hw/gpio/pca_i2c_gpio.c b/hw/gpio/pca_i2c_gpio.c
index afae497a22..f77d8d7e84 100644
--- a/hw/gpio/pca_i2c_gpio.c
+++ b/hw/gpio/pca_i2c_gpio.c
@@ -141,6 +141,41 @@ static uint8_t pca6416_recv(I2CSlave *i2c)
     return data;
 }
 
+/* slave to master */
+static uint8_t pca9538_recv(I2CSlave *i2c)
+{
+    PCAGPIOState *ps = PCA_I2C_GPIO(i2c);
+    uint8_t data;
+
+    switch (ps->command) {
+    case PCA9538_INPUT_PORT:
+        data = ps->curr_input;
+        break;
+
+    case PCA9538_OUTPUT_PORT:
+        data = ps->new_output;
+        break;
+
+    case PCA9538_POLARITY_INVERSION_PORT:
+        data = ps->polarity_inv;
+        break;
+
+    case PCA9538_CONFIGURATION_PORT:
+        data = ps->config;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: reading from unsupported register 0x%02x",
+                      __func__, ps->command);
+        data = 0xFF;
+        break;
+    }
+
+    trace_pca_i2c_recv(DEVICE(ps)->canonical_path, ps->command, data);
+    return data;
+}
+
 /* master to slave */
 static int pca6416_send(I2CSlave *i2c, uint8_t data)
 {
@@ -201,6 +236,47 @@ static int pca6416_send(I2CSlave *i2c, uint8_t data)
     return 0;
 }
 
+/* master to slave */
+static int pca9538_send(I2CSlave *i2c, uint8_t data)
+{
+    PCAGPIOState *ps = PCA_I2C_GPIO(i2c);
+    if (ps->i2c_cmd) {
+        ps->command = data;
+        ps->i2c_cmd = false;
+        return 0;
+    }
+
+    trace_pca_i2c_send(DEVICE(ps)->canonical_path, ps->command, data);
+
+    switch (ps->command) {
+    case PCA9538_INPUT_PORT:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing to read only reg: 0x%02x",
+                      __func__, ps->command);
+        break;
+    case PCA9538_OUTPUT_PORT:
+        ps->new_output = data;
+        break;
+
+    case PCA9538_POLARITY_INVERSION_PORT:
+        ps->polarity_inv = data;
+        break;
+
+    case PCA9538_CONFIGURATION_PORT:
+        ps->config = data;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: writing to unsupported register\n",
+                      __func__);
+        return -1;
+    }
+
+    pca_i2c_update_irqs(ps);
+
+    return 0;
+}
+
 static int pca_i2c_event(I2CSlave *i2c, enum i2c_event event)
 {
     PCAGPIOState *ps = PCA_I2C_GPIO(i2c);
@@ -321,6 +397,23 @@ static void pca6416_gpio_class_init(ObjectClass *klass, void *data)
     pc->num_pins = PCA6416_NUM_PINS;
 }
 
+static void pca9538_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+    PCAGPIOClass *pc = PCA_I2C_GPIO_CLASS(klass);
+
+    dc->desc = "PCA9538 8-bit I/O expander";
+    dc->realize = pca_i2c_realize;
+    dc->vmsd = &vmstate_pca_i2c_gpio;
+
+    k->event = pca_i2c_event;
+    k->recv = pca9538_recv;
+    k->send = pca9538_send;
+
+    pc->num_pins = PCA9538_NUM_PINS;
+}
+
 static void pca_i2c_gpio_init(Object *obj)
 {
     PCAGPIOState *ps = PCA_I2C_GPIO(obj);
@@ -357,6 +450,11 @@ static const TypeInfo pca_gpio_types[] = {
     .parent = TYPE_PCA_I2C_GPIO,
     .class_init = pca6416_gpio_class_init,
     },
+    {
+    .name = TYPE_PCA9538_GPIO,
+    .parent = TYPE_PCA_I2C_GPIO,
+    .class_init = pca9538_gpio_class_init,
+    },
 };
 
 DEFINE_TYPES(pca_gpio_types);
diff --git a/include/hw/gpio/pca_i2c_gpio.h b/include/hw/gpio/pca_i2c_gpio.h
index a10897c0e0..8cd268e8f0 100644
--- a/include/hw/gpio/pca_i2c_gpio.h
+++ b/include/hw/gpio/pca_i2c_gpio.h
@@ -18,6 +18,7 @@
 #include "qom/object.h"
 
 #define PCA6416_NUM_PINS         16
+#define PCA9538_NUM_PINS         8
 
 typedef struct PCAGPIOClass {
     I2CSlaveClass parent;
@@ -61,6 +62,11 @@ OBJECT_DECLARE_TYPE(PCAGPIOState, PCAGPIOClass, PCA_I2C_GPIO)
 #define PCA6416_CONFIGURATION_PORT_0         0x06 /* read/write */
 #define PCA6416_CONFIGURATION_PORT_1         0x07 /* read/write */
 
+#define PCA9538_INPUT_PORT                   0x00 /* read */
+#define PCA9538_OUTPUT_PORT                  0x01 /* read/write */
+#define PCA9538_POLARITY_INVERSION_PORT      0x02 /* read/write */
+#define PCA9538_CONFIGURATION_PORT           0x03 /* read/write */
+
 #define PCA6416_OUTPUT_DEFAULT               0xFFFF
 #define PCA6416_CONFIG_DEFAULT               0xFFFF
 
@@ -68,5 +74,6 @@ OBJECT_DECLARE_TYPE(PCAGPIOState, PCAGPIOClass, PCA_I2C_GPIO)
 #define PCA_I2C_CONFIG_DEFAULT               0xFFFF
 
 #define TYPE_PCA6416_GPIO "pca6416"
+#define TYPE_PCA9538_GPIO "pca9538"
 
 #endif
-- 
2.39.1.519.gcb327c4b5f-goog


