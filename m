Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828584A772B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 18:57:29 +0100 (CET)
Received: from localhost ([::1]:41236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFJsk-0001K4-US
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 12:57:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3MbX6YQcKCpwRAJPQNACKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--venture.bounces.google.com>)
 id 1nFIsh-0001WC-MX
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 11:53:19 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=37577
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3MbX6YQcKCpwRAJPQNACKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--venture.bounces.google.com>)
 id 1nFIsg-0008Ss-0e
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 11:53:19 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 v70-20020a25c549000000b006130de5790aso316829ybe.4
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 08:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=MQ2S156eOgRWeJiqeIsSamn7bmB1bOc4oCVgdMb1WJw=;
 b=h6s6Pph4rHX0aJOw065G+3XZwMuvGZP16yIICXlstOQrXW05kWd2ZyLLrgyI3lbVS1
 ASGIbj/Uoq6EvZmPXUrRsgqVhe/JlWYUW8MIAscSruL3RvObsYclZFg+93/w8OlrZKwO
 YHSe4KjXKOMTtYitt+UIm/5D0ThKMpXHv5zcP4NnmBvyjN+btSCO9kqwF/FMsLJaUDG4
 l9v+cLv0awhHXz62gzzGNSJQj2lkltHzEa82dNCgOd5thM3XOMgNJJrbeDU6pYeopdjG
 ylOdZgCNLo3Nriy4vGKoQKi9W7nLRS9k6LBacX+6F+GwWVkJUlfFOO08UvplHywSOPUj
 82sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=MQ2S156eOgRWeJiqeIsSamn7bmB1bOc4oCVgdMb1WJw=;
 b=WxdsdpqsstsBI6TboswukopRGMKa4K97K+lOczk3HxV5Mo0tf4BKfFZY3QPbdw7rKK
 8GP8Vh2vge+6G1z4vwvc8AdbjN9ISduTOUIMAINMszSLPiAZsz2BwH+/Cx7xCjdInKyW
 2E5wIIU2MdiEsQfZQqtMdixqQFNx13g2TjZbRSBAhbkOAzzcucCzICi2mwWIYQTn8UAX
 SbhFED9eczl+4XtDjtM22XrWevBR8npnjoE3KAE3G9XD6LaVCAm1tmzaNLOJqyAyiP7X
 V44yFIYv4s8uegM4DuhwK3y7ciAGcWbfyopdK/w8cRPhEmD0B5sZDWX7A2DrP5Eiof4W
 MlCg==
X-Gm-Message-State: AOAM5307fgXeMZ+8An+NbcxH5iOgPFqn2FHfxY7poQIP+5ohnNiAl6l1
 N4grWm6SFJ1DzxkN87v283H6q7ACgh78
X-Google-Smtp-Source: ABdhPJyM6iJs6+I434Ltdnhhg5eSUcBL+YxRhdP+gAOq8akzXZlkY4ed6hf/ekUbPjTw0JmibZzBAEheSQrr
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:2897:f5c5:6f11:c159])
 (user=venture job=sendgmr) by 2002:a81:1051:: with SMTP id
 78mr1632185ywq.527.1643820337634; Wed, 02 Feb 2022 08:45:37 -0800 (PST)
Date: Wed,  2 Feb 2022 08:45:33 -0800
Message-Id: <20220202164533.1283668-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH v2] hw/i2c: flatten pca954x mux device
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, f4bug@amsat.org
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3MbX6YQcKCpwRAJPQNACKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--venture.bounces.google.com;
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
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
v2: explicitly create an incrementing name for the i2c busses (channels).
---
 hw/i2c/i2c_mux_pca954x.c | 77 +++++++---------------------------------
 1 file changed, 13 insertions(+), 64 deletions(-)

diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index 847c59921c..a9517b612a 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -30,24 +30,6 @@
 #define PCA9548_CHANNEL_COUNT 8
 #define PCA9546_CHANNEL_COUNT 4
=20
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
=20
     uint8_t control;
=20
-    /* The channel i2c buses. */
-    Pca954xChannel channel[PCA9548_CHANNEL_COUNT];
+    bool enabled[PCA9548_CHANNEL_COUNT];
+    I2CBus *bus[PCA9548_CHANNEL_COUNT];
 } Pca954xState;
=20
 /*
@@ -98,11 +80,11 @@ static bool pca954x_match(I2CSlave *candidate, uint8_t =
address,
     }
=20
     for (i =3D 0; i < mc->nchans; i++) {
-        if (!mux->channel[i].enabled) {
+        if (!mux->enabled[i]) {
             continue;
         }
=20
-        if (i2c_scan_bus(mux->channel[i].bus, address, broadcast,
+        if (i2c_scan_bus(mux->bus[i], address, broadcast,
                          current_devs)) {
             if (!broadcast) {
                 return true;
@@ -125,9 +107,9 @@ static void pca954x_enable_channel(Pca954xState *s, uin=
t8_t enable_mask)
      */
     for (i =3D 0; i < mc->nchans; i++) {
         if (enable_mask & (1 << i)) {
-            s->channel[i].enabled =3D true;
+            s->enabled[i] =3D true;
         } else {
-            s->channel[i].enabled =3D false;
+            s->enabled[i] =3D false;
         }
     }
 }
@@ -184,23 +166,7 @@ I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t cha=
nnel)
     Pca954xState *pca954x =3D PCA954X(mux);
=20
     g_assert(channel < pc->nchans);
-    return I2C_BUS(qdev_get_child_bus(DEVICE(&pca954x->channel[channel]),
-                                      "i2c-bus"));
-}
-
-static void pca954x_channel_init(Object *obj)
-{
-    Pca954xChannel *s =3D PCA954X_CHANNEL(obj);
-    s->bus =3D i2c_init_bus(DEVICE(s), "i2c-bus");
-
-    /* Start all channels as disabled. */
-    s->enabled =3D false;
-}
-
-static void pca954x_channel_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc =3D DEVICE_CLASS(klass);
-    dc->desc =3D "Pca954x Channel";
+    return pca954x->bus[channel];
 }
=20
 static void pca9546_class_init(ObjectClass *klass, void *data)
@@ -215,28 +181,19 @@ static void pca9548_class_init(ObjectClass *klass, vo=
id *data)
     s->nchans =3D PCA9548_CHANNEL_COUNT;
 }
=20
-static void pca954x_realize(DeviceState *dev, Error **errp)
-{
-    Pca954xState *s =3D PCA954X(dev);
-    Pca954xClass *c =3D PCA954X_GET_CLASS(s);
-    int i;
-
-    /* SMBus modules. Cannot fail. */
-    for (i =3D 0; i < c->nchans; i++) {
-        sysbus_realize(SYS_BUS_DEVICE(&s->channel[i]), &error_abort);
-    }
-}
-
 static void pca954x_init(Object *obj)
 {
     Pca954xState *s =3D PCA954X(obj);
     Pca954xClass *c =3D PCA954X_GET_CLASS(obj);
     int i;
=20
-    /* Only initialize the children we expect. */
+    /* SMBus modules. Cannot fail. */
     for (i =3D 0; i < c->nchans; i++) {
-        object_initialize_child(obj, "channel[*]", &s->channel[i],
-                                TYPE_PCA954X_CHANNEL);
+        g_autofree gchar *bus_name =3D g_strdup_printf("i2c.%d", i);
+
+        /* start all channels as disabled. */
+        s->enabled[i] =3D false;
+        s->bus[i] =3D i2c_init_bus(DEVICE(s), bus_name);
     }
 }
=20
@@ -252,7 +209,6 @@ static void pca954x_class_init(ObjectClass *klass, void=
 *data)
     rc->phases.enter =3D pca954x_enter_reset;
=20
     dc->desc =3D "Pca954x i2c-mux";
-    dc->realize =3D pca954x_realize;
=20
     k->write_data =3D pca954x_write_data;
     k->receive_byte =3D pca954x_read_byte;
@@ -278,13 +234,6 @@ static const TypeInfo pca954x_info[] =3D {
         .parent        =3D TYPE_PCA954X,
         .class_init    =3D pca9548_class_init,
     },
-    {
-        .name =3D TYPE_PCA954X_CHANNEL,
-        .parent =3D TYPE_SYS_BUS_DEVICE,
-        .class_init =3D pca954x_channel_class_init,
-        .instance_size =3D sizeof(Pca954xChannel),
-        .instance_init =3D pca954x_channel_init,
-    }
 };
=20
 DEFINE_TYPES(pca954x_info)
--=20
2.35.0.rc2.247.g8bbb082509-goog


