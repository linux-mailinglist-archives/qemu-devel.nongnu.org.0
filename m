Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B914CB057
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 21:55:21 +0100 (CET)
Received: from localhost ([::1]:38890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPW0G-0000O0-Qs
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 15:55:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxg-0005dN-6o
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:41 -0500
Received: from [2a00:1450:4864:20::32f] (port=51113
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxe-00085x-Br
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:39 -0500
Received: by mail-wm1-x32f.google.com with SMTP id y5so1977160wmi.0
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1l2NOv9OwvipekROpdxjCaOFOo+1t/8TzNdjQpxDeL4=;
 b=XRPSAMbjjP8tP7nmhtOZiMab+AaJs17RNOoPiZs8H8d8Ru+klWxZkPACQUJ4lLtzus
 1+bwaMob5YHsCIGHNR6M5GSzNnGI74VP38El+b7wCKX8NNKTTXSnlI+Oegt0UDR0S/GU
 QJJaVkIWLrpEOgNezSkGMqOxs5JEwVxtH4a3RsTLZGlUl2ufeVKLOFJt/mRjTjQJrvZr
 XfPOqH1SCheiwYjq+O1bu4sM16/ff19MgF47beXqXB/ldrwYsgOUxFQicNlpMr8iyiMf
 5OtarqNPjKAlSZcVNvAgLr6nuuaibx7+SqLJkWkdBYLe4bYEX1NXwZNIBWugPqkiXbFB
 Pu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1l2NOv9OwvipekROpdxjCaOFOo+1t/8TzNdjQpxDeL4=;
 b=V28ejyXyjFQ0D15vquL/dgaA3I9AflJPe4vgDW2C3N/4GsidTxIQKl4sqBgZVZ28DL
 Tt6vrHAPnknpv8/Yi7804YWk8dhpUg5DTf5rH8u35Qa9hf7lgnbfd1uJxGBvmo16aX2v
 mRICGAYqGk63jj27RgL8t1muV9/12Qxm0S9drc1Ag2LV6Bs7o1+BAoTKVoNeWxcwcRHW
 UP9L3ZciTXzRZklz0V35yIBgtwbZfWoQQJ2SHWP+tqgKBI2ph37911AqNUlneqBK75pi
 nvO5Mr+Aut4dp/3LMgYSIZtCSvqFH69igXEcqyLg0H4zvdQSbwlxQTHy4SZAlQwsKenL
 gvog==
X-Gm-Message-State: AOAM530YnKwNR7cqyhuxbLM941BOGFX54q4NyL6mWr0Fgi4HyCrnWZw8
 rKhpinhPz0OBhR6gmoSGXxDDWtYHbQqMgg==
X-Google-Smtp-Source: ABdhPJzC3VSZfVif4Qr5cCds2ZPqC0JMLNiKtRtLSHcxbEH0tHu2RedXIRdPShbWHNhC5/YvO0WpvA==
X-Received: by 2002:a7b:c954:0:b0:385:6e61:aea6 with SMTP id
 i20-20020a7bc954000000b003856e61aea6mr1334360wml.91.1646254356387; 
 Wed, 02 Mar 2022 12:52:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/26] hw/i2c: flatten pca954x mux device
Date: Wed,  2 Mar 2022 20:52:08 +0000
Message-Id: <20220302205230.2122390-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Patrick Venture <venture@google.com>

Previously this device created N subdevices which each owned an i2c bus.
Now this device simply owns the N i2c busses directly.

Tested: Verified devices behind mux are still accessible via qmp and i2c
from within an arm32 SoC.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220202164533.1283668-1-venture@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i2c/i2c_mux_pca954x.c | 77 +++++++---------------------------------
 1 file changed, 13 insertions(+), 64 deletions(-)

diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index 847c59921cf..a9517b612ae 100644
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
@@ -215,28 +181,19 @@ static void pca9548_class_init(ObjectClass *klass, void *data)
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
+        g_autofree gchar *bus_name = g_strdup_printf("i2c.%d", i);
+
+        /* start all channels as disabled. */
+        s->enabled[i] = false;
+        s->bus[i] = i2c_init_bus(DEVICE(s), bus_name);
     }
 }
 
@@ -252,7 +209,6 @@ static void pca954x_class_init(ObjectClass *klass, void *data)
     rc->phases.enter = pca954x_enter_reset;
 
     dc->desc = "Pca954x i2c-mux";
-    dc->realize = pca954x_realize;
 
     k->write_data = pca954x_write_data;
     k->receive_byte = pca954x_read_byte;
@@ -278,13 +234,6 @@ static const TypeInfo pca954x_info[] = {
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
2.25.1


