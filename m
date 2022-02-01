Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4267C4A6346
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 19:11:54 +0100 (CET)
Received: from localhost ([::1]:36222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nExdB-0007UV-2t
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 13:11:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3EWD5YQcKCswDw5BC9wy66y3w.u648w4C-vwDw3565y5C.69y@flex--venture.bounces.google.com>)
 id 1nEw8b-0005gu-FN
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:36:17 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=33540
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3EWD5YQcKCswDw5BC9wy66y3w.u648w4C-vwDw3565y5C.69y@flex--venture.bounces.google.com>)
 id 1nEw8Y-0000Wc-SR
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:36:13 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 u185-20020a2560c2000000b0060fd98540f7so34199968ybb.0
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=7qgTSv2Qca38AF58tQe7sG2bmCZn6VioTVSnDScd/KU=;
 b=I3N+O9s+cJ/rxN7JHsvgKB7jxdZJA7Ifi4KA0ptB/nzGh4pkj2DDIAInK/bGekm4A+
 ZcTivAUZfa19JsnUJ6XlEuxsJ8clUnZ9w/YoUaQ8/KVnIXyCuS2m9wxSo2f8Ct4ULB5J
 kDpr5ztbNC7Bn3kmpK00g8yQ/IBMeFv4t7Bl6PzCAjLbYQ/bV5zM5ZltiyNyZAVZ9euS
 a0nQHb//91jiTK8NH+0Il1R3K5OLXDk0pHo/FTKeXiVGBr5/897kyzhpFRHl4/fmwURc
 Iy2SmUEFj2DqPPAad4rNiNOirHi9jHCyU1JqhNL+8dHSXFtAoLn5esz9p7rPCsMoVhCu
 mN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=7qgTSv2Qca38AF58tQe7sG2bmCZn6VioTVSnDScd/KU=;
 b=B9KVDCxhVtBzYn8G5/RyTLmtiWoXpnT9EG9trG2fw8v5hPamJS3okteZLhEay+sGvG
 lSd2J5ecWSbSZv80/YFinv+ZisD2xYQGopRL2MQlYHbzCkFptcK0E1Bdwzlgwlq74S+e
 uDu7hFa38J4HHpMAutR4OLVbi2Df9G0A93eWPbmn2wedhuqvyPL51gWTjsl2siJdiOaW
 EeE4efPIp8KyJ+luRzA/VOTq0MXv8NBEUQ4gZX5MgSdEjlUmEgggFvscQkd0qhqvMmE8
 dqOqUer7+vn7noJNVYTxmgvAI7OaV1wsGIZpwhJXDCfMX0jxr0ZSgJctUA3C87BxMpDE
 Gcyw==
X-Gm-Message-State: AOAM532AE0ilZmI9IzaJPcMB0dXOhvFpc2CU3sekc+Zf8b0mUIFuA6Mq
 sZA26acWMaQcX/JLlmeeZCKn/gKS6aND
X-Google-Smtp-Source: ABdhPJwPiE0FCf1Zt/LnnuVZ6UnGd78t7amm+fcNLWrt1FktI6MwF6RjYsPs61FAZ4QcWyRFabMhiw/F1egj
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:5780:bdf0:5f14:9c50])
 (user=venture job=sendgmr) by 2002:a81:24d8:: with SMTP id
 k207mr67ywk.151.1643733009606; Tue, 01 Feb 2022 08:30:09 -0800 (PST)
Date: Tue,  1 Feb 2022 08:30:05 -0800
Message-Id: <20220201163005.989457-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH] hw/i2c: flatten pca954x mux device
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3EWD5YQcKCswDw5BC9wy66y3w.u648w4C-vwDw3565y5C.69y@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously this device created N subdevices which each owned an i2c bus.
Now this device simply owns the N i2c busses directly.

Tested: Verified devices behind mux are still accessible via qmp and i2c
from within an arm32 SoC.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
 hw/i2c/i2c_mux_pca954x.c | 75 ++++++----------------------------------
 1 file changed, 11 insertions(+), 64 deletions(-)

diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index 847c59921c..f9ce633b3a 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -30,24 +30,6 @@
 #define PCA9548_CHANNEL_COUNT 8
 #define PCA9546_CHANNEL_COUNT 4
 
-/*
- * struct Pca954xChannel - The i2c mux device will have N of these states
- * that own the i2c channel bus.
- * @bus: The owned channel bus.
- * @enabled: Is this channel active?
- */
-typedef struct Pca954xChannel {
-    SysBusDevice parent;
-
-    I2CBus       *bus;
-
-    bool         enabled;
-} Pca954xChannel;
-
-#define TYPE_PCA954X_CHANNEL "pca954x-channel"
-#define PCA954X_CHANNEL(obj) \
-    OBJECT_CHECK(Pca954xChannel, (obj), TYPE_PCA954X_CHANNEL)
-
 /*
  * struct Pca954xState - The pca954x state object.
  * @control: The value written to the mux control.
@@ -59,8 +41,8 @@ typedef struct Pca954xState {
 
     uint8_t control;
 
-    /* The channel i2c buses. */
-    Pca954xChannel channel[PCA9548_CHANNEL_COUNT];
+    bool enabled[PCA9548_CHANNEL_COUNT];
+    I2CBus *bus[PCA9548_CHANNEL_COUNT];
 } Pca954xState;
 
 /*
@@ -98,11 +80,11 @@ static bool pca954x_match(I2CSlave *candidate, uint8_t address,
     }
 
     for (i = 0; i < mc->nchans; i++) {
-        if (!mux->channel[i].enabled) {
+        if (!mux->enabled[i]) {
             continue;
         }
 
-        if (i2c_scan_bus(mux->channel[i].bus, address, broadcast,
+        if (i2c_scan_bus(mux->bus[i], address, broadcast,
                          current_devs)) {
             if (!broadcast) {
                 return true;
@@ -125,9 +107,9 @@ static void pca954x_enable_channel(Pca954xState *s, uint8_t enable_mask)
      */
     for (i = 0; i < mc->nchans; i++) {
         if (enable_mask & (1 << i)) {
-            s->channel[i].enabled = true;
+            s->enabled[i] = true;
         } else {
-            s->channel[i].enabled = false;
+            s->enabled[i] = false;
         }
     }
 }
@@ -184,23 +166,7 @@ I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel)
     Pca954xState *pca954x = PCA954X(mux);
 
     g_assert(channel < pc->nchans);
-    return I2C_BUS(qdev_get_child_bus(DEVICE(&pca954x->channel[channel]),
-                                      "i2c-bus"));
-}
-
-static void pca954x_channel_init(Object *obj)
-{
-    Pca954xChannel *s = PCA954X_CHANNEL(obj);
-    s->bus = i2c_init_bus(DEVICE(s), "i2c-bus");
-
-    /* Start all channels as disabled. */
-    s->enabled = false;
-}
-
-static void pca954x_channel_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    dc->desc = "Pca954x Channel";
+    return pca954x->bus[channel];
 }
 
 static void pca9546_class_init(ObjectClass *klass, void *data)
@@ -215,28 +181,17 @@ static void pca9548_class_init(ObjectClass *klass, void *data)
     s->nchans = PCA9548_CHANNEL_COUNT;
 }
 
-static void pca954x_realize(DeviceState *dev, Error **errp)
-{
-    Pca954xState *s = PCA954X(dev);
-    Pca954xClass *c = PCA954X_GET_CLASS(s);
-    int i;
-
-    /* SMBus modules. Cannot fail. */
-    for (i = 0; i < c->nchans; i++) {
-        sysbus_realize(SYS_BUS_DEVICE(&s->channel[i]), &error_abort);
-    }
-}
-
 static void pca954x_init(Object *obj)
 {
     Pca954xState *s = PCA954X(obj);
     Pca954xClass *c = PCA954X_GET_CLASS(obj);
     int i;
 
-    /* Only initialize the children we expect. */
+    /* SMBus modules. Cannot fail. */
     for (i = 0; i < c->nchans; i++) {
-        object_initialize_child(obj, "channel[*]", &s->channel[i],
-                                TYPE_PCA954X_CHANNEL);
+        /* start all channels as disabled. */
+        s->enabled[i] = false;
+        s->bus[i] = i2c_init_bus(DEVICE(s), "channel[*]");
     }
 }
 
@@ -252,7 +207,6 @@ static void pca954x_class_init(ObjectClass *klass, void *data)
     rc->phases.enter = pca954x_enter_reset;
 
     dc->desc = "Pca954x i2c-mux";
-    dc->realize = pca954x_realize;
 
     k->write_data = pca954x_write_data;
     k->receive_byte = pca954x_read_byte;
@@ -278,13 +232,6 @@ static const TypeInfo pca954x_info[] = {
         .parent        = TYPE_PCA954X,
         .class_init    = pca9548_class_init,
     },
-    {
-        .name = TYPE_PCA954X_CHANNEL,
-        .parent = TYPE_SYS_BUS_DEVICE,
-        .class_init = pca954x_channel_class_init,
-        .instance_size = sizeof(Pca954xChannel),
-        .instance_init = pca954x_channel_init,
-    }
 };
 
 DEFINE_TYPES(pca954x_info)
-- 
2.35.0.rc2.247.g8bbb082509-goog


