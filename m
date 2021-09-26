Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC6E418B69
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:17:11 +0200 (CEST)
Received: from localhost ([::1]:41926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcSM-0007XE-F2
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcQg-0006V0-4a; Sun, 26 Sep 2021 18:15:27 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcQe-0003Wc-By; Sun, 26 Sep 2021 18:15:25 -0400
Received: by mail-wr1-x432.google.com with SMTP id t18so46481909wrb.0;
 Sun, 26 Sep 2021 15:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w/NNDDWuUjDFbzYRr3FSXhyOtAsFlq63TMrgjItSw3c=;
 b=Hj86/1L46+5hnnVaqDWbnuincgZs+Yr2Em2bRVpp+rx22MP32Owg46PTh6fit+Mdgb
 NH6QTj4DxDpwH0WHZayaQ7on9nwT5LjrR2VzZTbj7WNGkdzwQhK0ZnNXr8jtMOHl4QsG
 mz61vSbvLiXU2vVKIBfeiO5rn6PAYQUl2PikE3l1QpsazWTMmn3IGYyrr/mxcy5oszaF
 1TC3eSdtx7aH85AnYxfLBPPOPPGbzk4P/JJCv/J80nDJaPaqVSklj1TN1R8U9m7wjnPT
 ykYnocWIdr3Lk0pZIBi8MDE5FC5pYwLnQ5PwQf4oLhXkIC6ivZmhPs83fxj6mGrB6nUB
 u3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=w/NNDDWuUjDFbzYRr3FSXhyOtAsFlq63TMrgjItSw3c=;
 b=b6fwWcYY1jB4BxyeNowRhNVgSU8QozV8sz3akMYc7efGFWqhV3s7dZIbuVByH9N9BS
 92YholIiPr+qYmZ9iJh+BL0DnO1ZGmke3Y4WyRI/HqXfGZLfKjV+/1Bsq3geD6RAzn7Z
 JNDUqKY25f/r6PEm9MEZZCchz/0LrxAeCG0mx2pNI1f+5hIgWUhYIp/9LRMkoKFk1ti0
 KmvUGvEBuqAG/OI3odNVgdZYlwCS2PlECkv27c6N33+I5HlEhl9USLyoaFkR2H3b2Lav
 X4jMgNld1tIY1S2jkgCHvmkpP2EABZjoZjfMCT6hRC2etHy9rH+Ek7KHhvTHGe/5Nh4c
 AuUg==
X-Gm-Message-State: AOAM530kn52cnyZT5toH4M6ayxYMwJALFdk0I1SWKisKvU3pMVVw8bYM
 fj2qwJkoOjro9waoQzphWLtPVWneLcw=
X-Google-Smtp-Source: ABdhPJyBCs/J7HWjBfrMof0JuqnPbds8b/y7ZpSgHrk46Ixrpw6calEZp6wdoZLj6zCgt5j3f3KTVQ==
X-Received: by 2002:a1c:f310:: with SMTP id q16mr13105294wmq.145.1632694521057; 
 Sun, 26 Sep 2021 15:15:21 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 t6sm18354726wmj.12.2021.09.26.15.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:15:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw: Add a 'Sensor devices' qdev category
Date: Mon, 27 Sep 2021 00:15:18 +0200
Message-Id: <20210926221518.1726267-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Titus Rwantare <titusr@google.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, John Wang <wangzhiqiang.bj@bytedance.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sensors models are listed in the 'Misc devices' category.
Move them to their own category.

For the devices in the hw/sensor/ directory, the category
is obvious.

hw/arm/z2.c models the AER915 model which is described
on [*] as:

  The 14-pin chip marked AER915 just below the expansion
  port is a 80C51-type microcontroller, similar to Philips
  P89LPC915. It has an 8-bit A/D which is used to determine
  which of six buttons are pressed on the resistor-network
  wired remote.  It communicates with the main cpu via I2C.

It was introduced in commit 3bf11207c06 ("Add support for
Zipit Z2 machine") with this comment:

  248 static uint8_t aer915_recv(I2CSlave *slave)
  249 {
  ...
  253     switch (s->buf[0]) {
  254     /* Return hardcoded battery voltage,
  255      * 0xf0 means ~4.1V
  256      */
  257     case 0x02:
  258         retval = 0xf0;
  259         break;

For QEMU the AER915 is a very simple sensor model.

[*] https://www.bealecorner.org/best/measure/z2/index.html

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/qdev-core.h | 1 +
 hw/arm/z2.c            | 1 +
 hw/sensor/adm1272.c    | 1 +
 hw/sensor/dps310.c     | 1 +
 hw/sensor/emc141x.c    | 1 +
 hw/sensor/max34451.c   | 2 ++
 hw/sensor/tmp105.c     | 1 +
 hw/sensor/tmp421.c     | 1 +
 softmmu/qdev-monitor.c | 1 +
 9 files changed, 10 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 34c8a7506a1..f6241212247 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -26,6 +26,7 @@ typedef enum DeviceCategory {
     DEVICE_CATEGORY_SOUND,
     DEVICE_CATEGORY_MISC,
     DEVICE_CATEGORY_CPU,
+    DEVICE_CATEGORY_SENSOR,
     DEVICE_CATEGORY_MAX
 } DeviceCategory;
 
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 9c1e876207b..62db9741106 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -288,6 +288,7 @@ static void aer915_class_init(ObjectClass *klass, void *data)
     k->recv = aer915_recv;
     k->send = aer915_send;
     dc->vmsd = &vmstate_aer915_state;
+    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
 }
 
 static const TypeInfo aer915_info = {
diff --git a/hw/sensor/adm1272.c b/hw/sensor/adm1272.c
index 7310c769be2..2942ac75f90 100644
--- a/hw/sensor/adm1272.c
+++ b/hw/sensor/adm1272.c
@@ -518,6 +518,7 @@ static void adm1272_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PMBusDeviceClass *k = PMBUS_DEVICE_CLASS(klass);
 
+    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
     dc->desc = "Analog Devices ADM1272 Hot Swap controller";
     dc->vmsd = &vmstate_adm1272;
     k->write_data = adm1272_write_data;
diff --git a/hw/sensor/dps310.c b/hw/sensor/dps310.c
index d60a18ac41b..1e24a499b38 100644
--- a/hw/sensor/dps310.c
+++ b/hw/sensor/dps310.c
@@ -208,6 +208,7 @@ static void dps310_class_init(ObjectClass *klass, void *data)
     k->send = dps310_tx;
     dc->reset = dps310_reset;
     dc->vmsd = &vmstate_dps310;
+    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
 }
 
 static const TypeInfo dps310_info = {
diff --git a/hw/sensor/emc141x.c b/hw/sensor/emc141x.c
index 7ce8f4e9794..4202d8f185a 100644
--- a/hw/sensor/emc141x.c
+++ b/hw/sensor/emc141x.c
@@ -270,6 +270,7 @@ static void emc141x_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
 
+    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
     dc->reset = emc141x_reset;
     k->event = emc141x_event;
     k->recv = emc141x_rx;
diff --git a/hw/sensor/max34451.c b/hw/sensor/max34451.c
index a91d8bd487c..8300bf4ff43 100644
--- a/hw/sensor/max34451.c
+++ b/hw/sensor/max34451.c
@@ -751,6 +751,8 @@ static void max34451_class_init(ObjectClass *klass, void *data)
     ResettableClass *rc = RESETTABLE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
     PMBusDeviceClass *k = PMBUS_DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
     dc->desc = "Maxim MAX34451 16-Channel V/I monitor";
     dc->vmsd = &vmstate_max34451;
     k->write_data = max34451_write_data;
diff --git a/hw/sensor/tmp105.c b/hw/sensor/tmp105.c
index 20564494899..43d79b9eeec 100644
--- a/hw/sensor/tmp105.c
+++ b/hw/sensor/tmp105.c
@@ -305,6 +305,7 @@ static void tmp105_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
 
+    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
     dc->realize = tmp105_realize;
     k->event = tmp105_event;
     k->recv = tmp105_rx;
diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c
index a3db57dcb5a..c328978af9c 100644
--- a/hw/sensor/tmp421.c
+++ b/hw/sensor/tmp421.c
@@ -343,6 +343,7 @@ static void tmp421_class_init(ObjectClass *klass, void *data)
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
     TMP421Class *sc = TMP421_CLASS(klass);
 
+    set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
     dc->realize = tmp421_realize;
     k->event = tmp421_event;
     k->recv = tmp421_rx;
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 0705f008466..db56f328228 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -162,6 +162,7 @@ static void qdev_print_devinfos(bool show_no_user)
         [DEVICE_CATEGORY_SOUND]   = "Sound",
         [DEVICE_CATEGORY_MISC]    = "Misc",
         [DEVICE_CATEGORY_CPU]     = "CPU",
+        [DEVICE_CATEGORY_SENSOR]  = "Sensor",
         [DEVICE_CATEGORY_MAX]     = "Uncategorized",
     };
     GSList *list, *elt;
-- 
2.31.1


