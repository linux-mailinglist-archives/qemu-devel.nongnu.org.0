Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A2668C70F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 20:51:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP7Uw-0007hj-Rc; Mon, 06 Feb 2023 14:49:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <32lnhYwYKCjkodopnmbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--titusr.bounces.google.com>)
 id 1pP7Ut-0007fz-SD
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:49:51 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <32lnhYwYKCjkodopnmbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--titusr.bounces.google.com>)
 id 1pP7Ur-0007tL-Gy
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:49:51 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 z9-20020a25ba49000000b007d4416e3667so12625266ybj.23
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 11:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=9ABrUA5krIv7LfvsXEqxczxaHvxnH2HruiF60Riq0HE=;
 b=DlSNsRBhoPRYVT3NrHAWLtMTJbIOqrAPghBm/W/wmopCerf1PPI+LCDcFniockR3xo
 h4V+1/xvy4obUp4DOKeGFEAljQ3k5IYy/heXP2e8MRhPgSG1/iOuWJQEsNdhNcs7fMkn
 y+lOlLikRPChnkkB9XUkNb1zltKe/eMtYMN/Yc4UBeF0so5Ue4ekHwJIwFt7p650vLaD
 Lc1gwdcnQJyWHjyBkl7I/1N/7ucNfjpL9JETj37GT9zwTpLwSKOaZ7JWmJDDhhOVdFAB
 /toT77JzmeT+pn4BkqsZ60D/jIVAgTbKIFXPsV7PXrm9eW3HV3aEMdwxA23K9nzhSbhV
 lH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ABrUA5krIv7LfvsXEqxczxaHvxnH2HruiF60Riq0HE=;
 b=XzAnbDIWvc0o2XQAp77vpiu4e951UD55fCxrOEYDzGXvU3yJ0wrpQvnnMugbow/zdH
 jiaNhctRBi8b2frDCHOty239+VeSLAey8WShWx8FKn3/XfY+FFk6UCq9dzibfFBJ8iwp
 lQU+xV1mG6KaBnF9trl5mmVDg9fmDZYrIuapgGVAmzCvevM35l+psk876GC3cjwYCNp3
 i+7dErYkjo9V9MqZtXpbT4PtVIaeR0a2k9dw0EFtGGNnxT7WWWVYp1tRDPJba8v9F5uq
 W9XxAIo1nbGC8PbZ9Xs3ZuXszh50c88d8IOObAYa2aW2gXDeBL3jsu9PbzBpw1ElSJRZ
 fUQQ==
X-Gm-Message-State: AO0yUKVJTU/YW2Hjn1/oy70wbek0YgM40wzLVPM0AxK4iAUAuaM3UPdB
 k7B9YqkE6mubcivgBms9vlyHSJhVGcA=
X-Google-Smtp-Source: AK7set9YgjPQchLIhO5KNC7lISmGcAO/WrKpPLMcem5LI8bghFmIUSFERMCdGs+AFp6dGVl+y9pmn6rR4Zk=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a25:dc6:0:b0:89a:3c0a:d6de with SMTP id
 189-20020a250dc6000000b0089a3c0ad6demr0ybn.11.1675712986886; Mon, 06 Feb 2023
 11:49:46 -0800 (PST)
Date: Mon,  6 Feb 2023 19:49:36 +0000
In-Reply-To: <20230206194936.168843-1-titusr@google.com>
Mime-Version: 1.0
References: <20230206194936.168843-1-titusr@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230206194936.168843-4-titusr@google.com>
Subject: [PATCH 3/3] hw/gpio: add PCA9536 i2c gpio expander
From: Titus Rwantare <titusr@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=32lnhYwYKCjkodopnmbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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

This device has the same register layout as the pca9538, but 4 fewer
gpio pins. This commit lowers the number of pins intialised, and reuses
the pca9539 logic.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/gpio/pca_i2c_gpio.c         | 22 ++++++++++++++++++++++
 include/hw/gpio/pca_i2c_gpio.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/hw/gpio/pca_i2c_gpio.c b/hw/gpio/pca_i2c_gpio.c
index f77d8d7e84..66dd1d3369 100644
--- a/hw/gpio/pca_i2c_gpio.c
+++ b/hw/gpio/pca_i2c_gpio.c
@@ -414,6 +414,23 @@ static void pca9538_gpio_class_init(ObjectClass *klass, void *data)
     pc->num_pins = PCA9538_NUM_PINS;
 }
 
+static void pca9536_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+    PCAGPIOClass *pc = PCA_I2C_GPIO_CLASS(klass);
+
+    dc->desc = "PCA9536 4-bit I/O expander";
+    dc->realize = pca_i2c_realize;
+    dc->vmsd = &vmstate_pca_i2c_gpio;
+
+    k->event = pca_i2c_event;
+    k->recv = pca9538_recv;
+    k->send = pca9538_send;
+
+    pc->num_pins = PCA9536_NUM_PINS;
+}
+
 static void pca_i2c_gpio_init(Object *obj)
 {
     PCAGPIOState *ps = PCA_I2C_GPIO(obj);
@@ -455,6 +472,11 @@ static const TypeInfo pca_gpio_types[] = {
     .parent = TYPE_PCA_I2C_GPIO,
     .class_init = pca9538_gpio_class_init,
     },
+    {
+    .name = TYPE_PCA9536_GPIO,
+    .parent = TYPE_PCA_I2C_GPIO,
+    .class_init = pca9536_gpio_class_init,
+    },
 };
 
 DEFINE_TYPES(pca_gpio_types);
diff --git a/include/hw/gpio/pca_i2c_gpio.h b/include/hw/gpio/pca_i2c_gpio.h
index 8cd268e8f0..3d2a88ba7b 100644
--- a/include/hw/gpio/pca_i2c_gpio.h
+++ b/include/hw/gpio/pca_i2c_gpio.h
@@ -19,6 +19,7 @@
 
 #define PCA6416_NUM_PINS         16
 #define PCA9538_NUM_PINS         8
+#define PCA9536_NUM_PINS         4
 
 typedef struct PCAGPIOClass {
     I2CSlaveClass parent;
@@ -75,5 +76,6 @@ OBJECT_DECLARE_TYPE(PCAGPIOState, PCAGPIOClass, PCA_I2C_GPIO)
 
 #define TYPE_PCA6416_GPIO "pca6416"
 #define TYPE_PCA9538_GPIO "pca9538"
+#define TYPE_PCA9536_GPIO "pca9536"
 
 #endif
-- 
2.39.1.519.gcb327c4b5f-goog


