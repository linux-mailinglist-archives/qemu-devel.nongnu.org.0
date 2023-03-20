Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B27D6C2426
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 22:56:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peNTc-0005Z5-Tx; Mon, 20 Mar 2023 17:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UtYYZAYKCok6v6754t11tyr.p1z3rz7-qr8ry010t07.14t@flex--titusr.bounces.google.com>)
 id 1peNTZ-0005Wg-Ud
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:55:33 -0400
Received: from mail-ua1-x94a.google.com ([2607:f8b0:4864:20::94a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UtYYZAYKCok6v6754t11tyr.p1z3rz7-qr8ry010t07.14t@flex--titusr.bounces.google.com>)
 id 1peNTY-0006Z4-5L
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:55:33 -0400
Received: by mail-ua1-x94a.google.com with SMTP id
 w24-20020ab00918000000b0075e9c7ffadfso5781554uag.13
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 14:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679349330;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=SkjeIjBf24fTWVjbXjCodVjSEoYMWjTjsoIFCGcOfx4=;
 b=AI9pbGhJAlwjWNMAdtIJKZ/+Ecsd5jdACKlpZsZM0mRz7KySerAq9gIYPUyBH6tfWi
 STZ7EUjy/6jHSPchL+rVo/ZbJxaXWUnU+GiCD2pAdLPB20kJh8MqvnPCOOSOwdJ+OPev
 Eca6SDKCv5MbEyFNde6dykrEyhfLqyqKjfrbOhscDepY/Q0qJYHIn50uQQxo1mW8D2GH
 DYnCw8AT6BfmwEEZXGRdWltaMl3YLXGZ7OBvz0bm937ZaL1nOmdKeq5fCzdqN4qTBnO2
 OoIXGbOMJJtomQvGTHGH++cu+saUg2yNaM3frN5GvmOaEY4Hl1UzBJRMQ0YI8yI8zhvC
 qKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679349330;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SkjeIjBf24fTWVjbXjCodVjSEoYMWjTjsoIFCGcOfx4=;
 b=wXQiVbcoBDfeuAeOWqOi4ColfEHkZhoZMBP+B3HEYc5hCnJH6RJo/5uB84dChlkI+e
 vq68Q1/1109gEy5NkiAFRBkqN16fDsfS5KryYiuiKEHuU+UhkWYtNsMJIz56XrYsEZxS
 8czVIpMsiMWzdfNcuV7T4Kdqfw9VoPDFT/5YjPxGotFr07GpSBtLGUKTTctH6vbJBD8b
 kQjBNeqEjjLjCRrcasTD1QXBo7HWQJxLapDEQkr6DF+xhJXU1tTWC43rswOUKEH4TT1H
 n688jVTcdJ8A/C9cqX+SNZJBnhnLxuvXwOv+eXK6sblRQ2gxU7/ML8QcifJm20iIk8VO
 Ey2A==
X-Gm-Message-State: AAQBX9drQTwBk8rI8t3ZMfqAEe1oNSnK9Gml8YOTQsnLv4amEI8gu/OF
 OwGiAy+UzDfDWkWmrNzM+ToOllIOVLw=
X-Google-Smtp-Source: AKy350ZEXRJuoMLl+ri1+AVn5Uw2ymN59XG+bjAyhljzTVQMapdkIOrQopbdgYVaCmjcepoMVzwk0qNqMEg=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:ab0:6ca5:0:b0:75d:782c:f31b with SMTP id
 j5-20020ab06ca5000000b0075d782cf31bmr14342uaa.0.1679349330444; Mon, 20 Mar
 2023 14:55:30 -0700 (PDT)
Date: Mon, 20 Mar 2023 21:54:57 +0000
In-Reply-To: <20230320215500.722960-1-titusr@google.com>
Mime-Version: 1.0
References: <20230320215500.722960-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230320215500.722960-4-titusr@google.com>
Subject: [PATCH v3 3/5] hw/gpio: add PCA9536 i2c gpio expander
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::94a;
 envelope-from=3UtYYZAYKCok6v6754t11tyr.p1z3rz7-qr8ry010t07.14t@flex--titusr.bounces.google.com;
 helo=mail-ua1-x94a.google.com
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

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/gpio/pca_i2c_gpio.c         | 18 ++++++++++++++++++
 include/hw/gpio/pca_i2c_gpio.h |  2 ++
 tests/lcitool/libvirt-ci       |  2 +-
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/hw/gpio/pca_i2c_gpio.c b/hw/gpio/pca_i2c_gpio.c
index 00ba343f95..14da58e5c4 100644
--- a/hw/gpio/pca_i2c_gpio.c
+++ b/hw/gpio/pca_i2c_gpio.c
@@ -337,6 +337,19 @@ static void pca9538_gpio_class_init(ObjectClass *klass=
, void *data)
     k->send =3D pca953x_send;
 }
=20
+static void pca9536_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
+    PCAGPIOClass *pc =3D PCA_I2C_GPIO_CLASS(klass);
+
+    dc->desc =3D "PCA9536 4-bit I/O expander";
+    pc->num_pins =3D PCA9536_NUM_PINS;
+
+    k->recv =3D pca953x_recv;
+    k->send =3D pca953x_send;
+}
+
 static void pca_i2c_gpio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
@@ -387,6 +400,11 @@ static const TypeInfo pca_gpio_types[] =3D {
     .parent =3D TYPE_PCA_I2C_GPIO,
     .class_init =3D pca9538_gpio_class_init,
     },
+    {
+        .name =3D TYPE_PCA9536_GPIO,
+        .parent =3D TYPE_PCA_I2C_GPIO,
+        .class_init =3D pca9536_gpio_class_init,
+    },
 };
=20
 DEFINE_TYPES(pca_gpio_types);
diff --git a/include/hw/gpio/pca_i2c_gpio.h b/include/hw/gpio/pca_i2c_gpio.=
h
index a4220105e8..deb4528065 100644
--- a/include/hw/gpio/pca_i2c_gpio.h
+++ b/include/hw/gpio/pca_i2c_gpio.h
@@ -20,6 +20,7 @@
 #define PCA_I2C_MAX_PINS                     16
 #define PCA6416_NUM_PINS                     16
 #define PCA9538_NUM_PINS                     8
+#define PCA9536_NUM_PINS                     4
=20
 typedef struct PCAGPIOClass {
     I2CSlaveClass parent;
@@ -63,5 +64,6 @@ OBJECT_DECLARE_TYPE(PCAGPIOState, PCAGPIOClass, PCA_I2C_G=
PIO)
=20
 #define TYPE_PCA6416_GPIO "pca6416"
 #define TYPE_PCA9538_GPIO "pca9538"
+#define TYPE_PCA9536_GPIO "pca9536"
=20
 #endif
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index e3eb28cf2e..232f41f160 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit e3eb28cf2e17fbcf7fe7e19505ee432b8ec5bbb5
+Subproject commit 232f41f160d4567b8c82dd52aa96c2bc3a5b75c1
--=20
2.40.0.rc1.284.g88254d51c5-goog


