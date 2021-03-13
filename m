Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697D2339F5D
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:10:58 +0100 (CET)
Received: from localhost ([::1]:53828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7mz-00031g-EY
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7Xq-0005PG-Jq
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:19 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7Xn-0000zl-Rt
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:55:17 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso17622889wme.0
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hihCC5FBsAyENbINhxZtkFSu+BW/8DygZUmLRAPJkU4=;
 b=MwwtSuA44Gk9F22pvsonQrAWXMUSDXWXxIatWgWwj5F5fUTO8SuYm+QUU1LMDXdIDl
 /7umfknISv4pEtqSboCws68+Gg3kozxb3Lwacp4YQg0HSahbuoMLqJV6vG/6vu+rBqd9
 IwikClYXBO1PJsT3Jx8D+hdniZsa8jCxgDaSAgPJtfHJp8jtVyDJucPCdPT1djJAu61A
 NZvzNGEHzS9ffSglxTbgnk6SjBwLKodDzB5oyLG49bVnC7bxWYBrChn9fnh+O67Jth6x
 fksx5iI2h6/SYNLbhULlQz8h2yJLAlF+6aqlpAWjBw0ICzSnd2u7fyGhSMnmRSDGuNxi
 DBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hihCC5FBsAyENbINhxZtkFSu+BW/8DygZUmLRAPJkU4=;
 b=XoSSCGm365PUNNs+RTh/sTRLWx+mMKtQO/3pONhpCOn5LkenOqxkWtUc2VHCS8SEtF
 MasOO/fZNPQaNVCYG6HLU0BF3Sojk3goVSjcR0Oq9HaUOvBwkIdN23ZEqWU5cuNmBjq4
 GiMGKX5U+6R4XqCrE6FOJ3qY86YrNgxzE6QuVDWMZecaq+iT0rFUAK5pVbOa6rOMOT9d
 ZzWXMO2EbrcHNqLc02Nb8cGGAV9zZj8LtkqQC+OtMQ1kJJrBBNfSWs/0qDjlVT0LGy6H
 VG7Grr0/Q7Y48/GnwOBgS2rlchejGs/UDUyVl+KPdisF50kTGbgTp7sZHuwW13qOHLhu
 O0Jw==
X-Gm-Message-State: AOAM530ChGgJ2HnPeqT7b7eOjFNDEKhBRETSFf0InFEmieMGxDTC8QL0
 WwnVPG4saqPSN3AOizkbVnvd9qwflPz8UA==
X-Google-Smtp-Source: ABdhPJw8ienjOj3cpo0Loht0ydfjcMucsbTNVXLRZdIofRRGl+hZ3hSykgQyWU75T+Txp4F93jKF/g==
X-Received: by 2002:a1c:a74b:: with SMTP id q72mr18244373wme.158.1615654514380; 
 Sat, 13 Mar 2021 08:55:14 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z2sm12707485wrv.47.2021.03.13.08.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:55:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] hw/gpio/avr_gpio: Add 'id' field in AVRGPIOState
Date: Sat, 13 Mar 2021 17:54:39 +0100
Message-Id: <20210313165445.2113938-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313165445.2113938-1-f4bug@amsat.org>
References: <20210313165445.2113938-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AVR MCU have various GPIO ports. Add an 'id' property to distinct
all instances.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/gpio/avr_gpio.h |  1 +
 hw/avr/atmega.c            |  1 +
 hw/gpio/avr_gpio.c         | 14 ++++++++++++--
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/hw/gpio/avr_gpio.h b/include/hw/gpio/avr_gpio.h
index 498a7275f05..e982f627ea3 100644
--- a/include/hw/gpio/avr_gpio.h
+++ b/include/hw/gpio/avr_gpio.h
@@ -48,6 +48,7 @@ struct AVRGPIOState {
     /* PORTx data changed IRQs */
     qemu_irq out[8u];
 
+    uint8_t id;
 };
 
 #endif /* AVR_GPIO_H */
diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index 19c3122189f..a19e3035022 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -285,6 +285,7 @@ static void atmega_realize(DeviceState *dev, Error **errp)
         devname = g_strdup_printf("atmega-gpio-%c", 'a' + (char)i);
         object_initialize_child(OBJECT(dev), devname, &s->gpio[i],
                                 TYPE_AVR_GPIO);
+        qdev_prop_set_uint8(DEVICE(&s->gpio[i]), "id", i);
         sysbus_realize(SYS_BUS_DEVICE(&s->gpio[i]), &error_abort);
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0,
                         OFFSET_DATA + mc->dev[idx].addr);
diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c
index da34009daea..3db55bfa77f 100644
--- a/hw/gpio/avr_gpio.c
+++ b/hw/gpio/avr_gpio.c
@@ -113,6 +113,11 @@ static const VMStateDescription avr_gpio_vmstate = {
     },
 };
 
+static Property avr_gpio_properties[] = {
+    DEFINE_PROP_UINT8("id", AVRGPIOState, id, UINT8_MAX),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void avr_gpio_init(Object *obj)
 {
     AVRGPIOState *s = AVR_GPIO(obj);
@@ -123,9 +128,13 @@ static void avr_gpio_init(Object *obj)
 }
 static void avr_gpio_realize(DeviceState *dev, Error **errp)
 {
-    /* Do nothing currently */
-}
+    AVRGPIOState *s = AVR_GPIO(dev);
 
+    if (s->id == UINT8_MAX) {
+        error_setg(errp, "property 'id' not set");
+        return;
+    }
+}
 
 static void avr_gpio_class_init(ObjectClass *klass, void *data)
 {
@@ -134,6 +143,7 @@ static void avr_gpio_class_init(ObjectClass *klass, void *data)
     dc->reset = avr_gpio_reset;
     dc->realize = avr_gpio_realize;
     dc->vmsd = &avr_gpio_vmstate;
+    device_class_set_props(dc, avr_gpio_properties);
 }
 
 static const TypeInfo avr_gpio_info = {
-- 
2.26.2


