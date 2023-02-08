Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7CF68FA60
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 23:45:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPtAX-0008SK-N5; Wed, 08 Feb 2023 17:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3qyXkYwYKCqwfUfgedSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--titusr.bounces.google.com>)
 id 1pPtAU-0008Qi-OT
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:43:58 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3qyXkYwYKCqwfUfgedSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--titusr.bounces.google.com>)
 id 1pPtAT-0002fh-2I
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:43:58 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-50fe0b4495cso1258867b3.14
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 14:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=HJtdqo5x3Q9Dj2SEUEmvGH+Sb78En/Ae2vGc0nZMPY4=;
 b=Vi/HZPMhPjP6z5CuNPTXCOEeSE6HwpjCUeUMf10LX/hIrpSiyVOufZwzVqlN+1G6JV
 Mb9DjjHjMFRbzac/5AjeFih2wu1ZRhdbAzK26o6FVe7b+PGwomKuIu6SrB+QxVolYkif
 HtpMNMpow1P4ApyXLWMJV6y9QCs30E0fLyB1+4Pdv7IMRyLad43Awth9toV6ExCtBztk
 /uouO0Fgp4mhxEzrozP20hw1jmC4o8P+BTawBJyDvb/iQGZUNZrMlpGDntIEsR/bviYd
 qXQjUMfr/rsRMLHZIrCWtl61KUJ9aiQRVAAG22k8a2G110oTsiyjs4/wAPkZz7YliljD
 bgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HJtdqo5x3Q9Dj2SEUEmvGH+Sb78En/Ae2vGc0nZMPY4=;
 b=yLGG2FdVVX7seqmTofHt9Oi+ursw8+/ktCC0HDQJsPuFdNEb5Twjtm35R1eBZcuvjd
 zTTsmb2HHc9o/D8hSoQQvHE9GyTQPctOivzxkVy04tFKNkKtXusfIxK7p8R15Z65AAqy
 YpY7lo2qEDheS9zIVOMjeeBsDNkV/CN1JpRtHy3bZPGCHCIZncronw49S3s6sMdKVETJ
 FC+RT2dE8hFvfYXeNcpftLepW0ZtTPtuUQiuMt5+FX5d+mdWZW9Raz1r31xQkWQPRTfa
 HLvyc8EZ7wESHXlwV+WpLXOEwKeI9U6f8Ce92GEDSLOiejy3c3VM3xdeoy+tZj1UvfqG
 9Mmw==
X-Gm-Message-State: AO0yUKVBsHe+vqJ0FjAnm2bKWGKce6cB42sf3XxzahvFcAy5KyfuEx2e
 Q5lKAkoKwJdeFcXoVqPE4U1xf4CTauk=
X-Google-Smtp-Source: AK7set+B6izyUB6Gv/1MKnGAt9JkK2Vbh3DIDM1BOPpeeClEL+XLVBlJ8LWa1cDI3CAwcFb6VVz2IaYzBmI=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a5b:610:0:b0:8bb:87b6:f253 with SMTP id
 d16-20020a5b0610000000b008bb87b6f253mr834567ybq.499.1675896235525; Wed, 08
 Feb 2023 14:43:55 -0800 (PST)
Date: Wed,  8 Feb 2023 22:43:37 +0000
In-Reply-To: <20230208224339.270589-1-titusr@google.com>
Mime-Version: 1.0
References: <20230208224339.270589-1-titusr@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230208224339.270589-3-titusr@google.com>
Subject: [PATCH v2 2/4] hw/gpio: add PCA9538 8-bit GPIO expander
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org, eddie.dong@intel.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, joel@jms.id.au, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3qyXkYwYKCqwfUfgedSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--titusr.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
 hw/gpio/pca_i2c_gpio.c         | 94 ++++++++++++++++++++++++++++++++++
 include/hw/gpio/pca_i2c_gpio.h |  7 +++
 2 files changed, 101 insertions(+)

diff --git a/hw/gpio/pca_i2c_gpio.c b/hw/gpio/pca_i2c_gpio.c
index 434a759453..fa69523556 100644
--- a/hw/gpio/pca_i2c_gpio.c
+++ b/hw/gpio/pca_i2c_gpio.c
@@ -143,6 +143,41 @@ static uint8_t pca6416_recv(I2CSlave *i2c)
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
@@ -203,6 +238,47 @@ static int pca6416_send(I2CSlave *i2c, uint8_t data)
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
@@ -337,6 +413,19 @@ static void pca6416_gpio_class_init(ObjectClass *klass, void *data)
     k->send = pca6416_send;
 }
 
+static void pca9538_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+    PCAGPIOClass *pc = PCA_I2C_GPIO_CLASS(klass);
+
+    dc->desc = "PCA9538 8-bit I/O expander";
+    pc->num_pins = PCA9538_NUM_PINS;
+
+    k->recv = pca9538_recv;
+    k->send = pca9538_send;
+}
+
 static void pca_i2c_gpio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -383,6 +472,11 @@ static const TypeInfo pca_gpio_types[] = {
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
index 99322959e1..3ab7d19a97 100644
--- a/include/hw/gpio/pca_i2c_gpio.h
+++ b/include/hw/gpio/pca_i2c_gpio.h
@@ -19,6 +19,7 @@
 
 #define PCA_I2C_MAX_PINS                     16
 #define PCA6416_NUM_PINS                     16
+#define PCA9538_NUM_PINS                     8
 
 typedef struct PCAGPIOClass {
     I2CSlaveClass parent;
@@ -62,8 +63,14 @@ OBJECT_DECLARE_TYPE(PCAGPIOState, PCAGPIOClass, PCA_I2C_GPIO)
 #define PCA6416_CONFIGURATION_PORT_0         0x06 /* read/write */
 #define PCA6416_CONFIGURATION_PORT_1         0x07 /* read/write */
 
+#define PCA9538_INPUT_PORT                   0x00 /* read */
+#define PCA9538_OUTPUT_PORT                  0x01 /* read/write */
+#define PCA9538_POLARITY_INVERSION_PORT      0x02 /* read/write */
+#define PCA9538_CONFIGURATION_PORT           0x03 /* read/write */
+
 #define PCA_I2C_CONFIG_DEFAULT               0
 
 #define TYPE_PCA6416_GPIO "pca6416"
+#define TYPE_PCA9538_GPIO "pca9538"
 
 #endif
-- 
2.39.1.581.gbfd45094c4-goog


