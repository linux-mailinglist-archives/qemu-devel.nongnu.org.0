Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2E968FA5E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 23:44:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPtAY-0008TA-F4; Wed, 08 Feb 2023 17:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3rCXkYwYKCq0gVghfeTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--titusr.bounces.google.com>)
 id 1pPtAV-0008R7-Nq
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:43:59 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3rCXkYwYKCq0gVghfeTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--titusr.bounces.google.com>)
 id 1pPtAT-0002fx-Om
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:43:59 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-4fa63c84621so1063727b3.20
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 14:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=5oMuDhrUQqITAotZfJ8MWZdGKIdyKs09j9oU2pnVQlU=;
 b=Ffg0Hi27/B0DGCFy+s9HUCXZp+jiFOv/iN6/1o+tikvqXF4nz/HxJaH0BVwxFCoWk9
 v6TvSEMB1PcKoa7wt4nKbclLb5oR0nkCvLY+BkQQyEE8HNsBX/yUl7cn0vi72JQiRu+g
 PIu3pI8hgOcPj325r8tIH7G3I+JzcDU5ocgbU4pddCzpntP9rGoXlyVXpslYDkZEE5Q0
 4DGWZLVcJAh1AJV8YHe+ndsJD8T+iTQvSqZh/HDxvfaT1dTYcMpVmfsfQCeAPh3rvI/F
 8HC1QwCr7VkLqF3y4yb4FhEhhafx0AXvOOSKQOFk2tJdxXQB0hh23weoCVLE2wjG9S5N
 YWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5oMuDhrUQqITAotZfJ8MWZdGKIdyKs09j9oU2pnVQlU=;
 b=w+5uvXkvDdE42mZD9DL/cfKRiVb8rZf8ecZpUfgzCZJY0gqSfGJ4NQR6WnghhzeBu3
 Nh4zGocEctP+BytvStoUoY8n09vNkU4lxwXVxMoLVOMwtSSwkrpcYmQurgo04Q0ySSxg
 JurY5o3qFw3vooCh/9BrBJxXpPHcjS3UvvqwdIKMoHJRmWhJZJGEG3G+uWH5LwDNsCbI
 MdYQSODLrgdKvaiMJt8pXvgxMLuFd6/3lp/ueuHKS1BetP0I8GP9RC6EcaIk88++tM3B
 7l3/UQ2nBpKlo7oIzFNo4hKpb/bLNa+E/KRbZVExqG5qy0xE0ExK8JGtpMd6K8TrXTyv
 TRVQ==
X-Gm-Message-State: AO0yUKXw6tZ23D+Np83z1fDiZqAac1bDef+dLDN6yhIykeORmSTo1g70
 kOYHL/fp7FkY+6phcRMP9C31lA/ZjpI=
X-Google-Smtp-Source: AK7set9dedtyRkFYOKAMa4rg5Ei3ucK3cZjekLVCkIl2wDY/ln99k3arbd0NoM0dMw8dYLaJ0wH7wFvmw84=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a25:6dd4:0:b0:8ac:dc22:ddec with SMTP id
 i203-20020a256dd4000000b008acdc22ddecmr8ybc.10.1675896236337; Wed, 08 Feb
 2023 14:43:56 -0800 (PST)
Date: Wed,  8 Feb 2023 22:43:38 +0000
In-Reply-To: <20230208224339.270589-1-titusr@google.com>
Mime-Version: 1.0
References: <20230208224339.270589-1-titusr@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230208224339.270589-4-titusr@google.com>
Subject: [PATCH v2 3/4] hw/gpio: add PCA9536 i2c gpio expander
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org, eddie.dong@intel.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, joel@jms.id.au, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3rCXkYwYKCq0gVghfeTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--titusr.bounces.google.com;
 helo=mail-yw1-x1149.google.com
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

This device has the same register layout as the pca9538, but 4 fewer
gpio pins. This commit lowers the number of pins initialised, and reuses
the pca9538 logic.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/gpio/pca_i2c_gpio.c         | 18 ++++++++++++++++++
 include/hw/gpio/pca_i2c_gpio.h |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/hw/gpio/pca_i2c_gpio.c b/hw/gpio/pca_i2c_gpio.c
index fa69523556..8e30064990 100644
--- a/hw/gpio/pca_i2c_gpio.c
+++ b/hw/gpio/pca_i2c_gpio.c
@@ -426,6 +426,19 @@ static void pca9538_gpio_class_init(ObjectClass *klass, void *data)
     k->send = pca9538_send;
 }
 
+static void pca9536_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+    PCAGPIOClass *pc = PCA_I2C_GPIO_CLASS(klass);
+
+    dc->desc = "PCA9536 4-bit I/O expander";
+    pc->num_pins = PCA9536_NUM_PINS;
+
+    k->recv = pca9538_recv;
+    k->send = pca9538_send;
+}
+
 static void pca_i2c_gpio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -477,6 +490,11 @@ static const TypeInfo pca_gpio_types[] = {
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
index 3ab7d19a97..6f8260a8c6 100644
--- a/include/hw/gpio/pca_i2c_gpio.h
+++ b/include/hw/gpio/pca_i2c_gpio.h
@@ -20,6 +20,7 @@
 #define PCA_I2C_MAX_PINS                     16
 #define PCA6416_NUM_PINS                     16
 #define PCA9538_NUM_PINS                     8
+#define PCA9536_NUM_PINS                     4
 
 typedef struct PCAGPIOClass {
     I2CSlaveClass parent;
@@ -72,5 +73,6 @@ OBJECT_DECLARE_TYPE(PCAGPIOState, PCAGPIOClass, PCA_I2C_GPIO)
 
 #define TYPE_PCA6416_GPIO "pca6416"
 #define TYPE_PCA9538_GPIO "pca9538"
+#define TYPE_PCA9536_GPIO "pca9536"
 
 #endif
-- 
2.39.1.581.gbfd45094c4-goog


