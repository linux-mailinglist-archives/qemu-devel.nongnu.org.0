Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F257543C207
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 07:08:30 +0200 (CEST)
Received: from localhost ([::1]:58888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfbAr-0000GO-Uw
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 01:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfb8x-0006nr-TI; Wed, 27 Oct 2021 01:06:31 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfb8v-0000y2-RC; Wed, 27 Oct 2021 01:06:31 -0400
Received: by mail-wr1-x436.google.com with SMTP id i9so1952830wrc.3;
 Tue, 26 Oct 2021 22:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P2zY8VnMxEj7Q/Oh++PVCEOCyr1gbKSTWGTaCnhCWj8=;
 b=E0p1trehGn+hj2JwiD6m5mprUH35LV/NXJXR3Tkfds0iocOXu0e6UOcajuBGE4670P
 jZ4dcLIUQ5SoaEoU1ifp7R8hBVOGQrYoRX0Rd89yj+aNogj5EDePo6C0bRGvFa9k9uH0
 lfKiLikyZeRGM3MrSKi39fgHp1WEqGuDNCmHlxuov+Q/DWqjK1xoZthdQ+2THtzVqb3c
 FeuzrXmKokW9wKlIs6m1M+JNx9vMobXeA/8g429STCPajiVZAfQI+ogZVAgx2Oa3x4h3
 45jTv1vK5O72DOOaFQ0+5BJD3h/eeeTg7Dh2eelpSRe+T/wZjiVDWUItRMO/uS79fcTY
 ygdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=P2zY8VnMxEj7Q/Oh++PVCEOCyr1gbKSTWGTaCnhCWj8=;
 b=Mvd+BJYo9tHrWqxSxXqJTK3dp9g/u3F1ti6/1kal6fn1GcEHm66eRf9TDynL5WGtnh
 Zy1rNi6uDGrZTIeakYXzTpDJJt4DN/bptYMMQyMMabVDFaviTfO58HLWKk6b2Q4HhFhw
 BW8u9o9/1gq2CM4JDczhyJaS2oy1BVTLzYosQcuDDPSy0+FQnZxI2UFyoCoNxC4j5pFj
 YACPTS0KGg22ywewZltYBI6WOkvDT4+1omH672RuMccNlfTlpxwpVqLTpmVVV8Bvi5Xz
 ff15vEyi+7wfW7QwJ3HC1pAKoB1dCMf/JYBcxL3v0swI1duLi9p91gD+LR2qVYtPebmu
 buSw==
X-Gm-Message-State: AOAM530JBfq4SwAk+Mn5QuCSaFpVcjawNP+0E9b6hfcz7x5zaJtqAyFb
 zcQinGmhgUQ2y8SI8VL82OxAjEECDi8=
X-Google-Smtp-Source: ABdhPJyLXDf+z3fzs7kiNx3U+Fi+pDdWCxvczxDThjpc7R89SV3H5Ikh1Vi5pEa0NUzfkfoVyocBAw==
X-Received: by 2002:adf:a118:: with SMTP id o24mr37122936wro.15.1635311187492; 
 Tue, 26 Oct 2021 22:06:27 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g3sm23758947wri.45.2021.10.26.22.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 22:06:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw: Add a 'Sensor devices' qdev category
Date: Wed, 27 Oct 2021 07:06:25 +0200
Message-Id: <20211027050625.1265828-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
 Hao Wu <wuhaotsh@google.com>, qemu-trivial@nongnu.org,
 John Wang <wangzhiqiang.bj@bytedance.com>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sensors models are listed in the 'Misc devices' category.
Move them to their own category.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Only include hw/sensor/, removed AER915 device from hw/arm/z2.c
---
 include/hw/qdev-core.h | 1 +
 hw/sensor/adm1272.c    | 1 +
 hw/sensor/dps310.c     | 1 +
 hw/sensor/emc141x.c    | 1 +
 hw/sensor/max34451.c   | 2 ++
 hw/sensor/tmp105.c     | 1 +
 hw/sensor/tmp421.c     | 1 +
 softmmu/qdev-monitor.c | 1 +
 8 files changed, 9 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 1bad07002df..2fd6b73bd8b 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -26,6 +26,7 @@ typedef enum DeviceCategory {
     DEVICE_CATEGORY_SOUND,
     DEVICE_CATEGORY_MISC,
     DEVICE_CATEGORY_CPU,
+    DEVICE_CATEGORY_SENSOR,
     DEVICE_CATEGORY_MAX
 } DeviceCategory;
 
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
index 4851de51a5c..a411af03c5c 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -164,6 +164,7 @@ static void qdev_print_devinfos(bool show_no_user)
         [DEVICE_CATEGORY_SOUND]   = "Sound",
         [DEVICE_CATEGORY_MISC]    = "Misc",
         [DEVICE_CATEGORY_CPU]     = "CPU",
+        [DEVICE_CATEGORY_SENSOR]  = "Sensor",
         [DEVICE_CATEGORY_MAX]     = "Uncategorized",
     };
     GSList *list, *elt;
-- 
2.31.1


