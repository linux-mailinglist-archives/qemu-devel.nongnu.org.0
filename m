Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6876C525A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 18:22:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2AB-0004TO-5P; Wed, 22 Mar 2023 13:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3MDkbZAcKCjcoXgmnkXZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--venture.bounces.google.com>)
 id 1pf2A5-0004Rb-Ex
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:22:11 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3MDkbZAcKCjcoXgmnkXZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--venture.bounces.google.com>)
 id 1pf2A3-0007xc-Dw
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:22:09 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-536cb268ab8so196444397b3.17
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 10:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679505712;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=K3Xp0gg8kSZu4Y6dzKtggIPetKwn/QLmsDJsM58B3Gk=;
 b=U4IbeOeDBwdMkO16TKJH6jj6x0frAuj7/bewd80pHXj7RuTD3khcMj0XaBp3uJKdUY
 kTWAx7aposETq686/ZMvHpKvSbQ78qBqgFeaHDzztn1RqlCFNH+bd2sxZSifxdFjvSs9
 6dYxB09qLgPDgQacSRbB24aKcm97tvvrDR9CI2M585eiE3Im8mqzy1kj1IpF7gmjAKfn
 3wZKYB9sRBP3Yw+vvFhod298VzrtE9lpTy/6AhPsZ0GedHaxgkHqbgSGWvUVC2NORdYk
 Qie4+EPsDXQYw8NQpa8W5rtwFU0kT6OBHVOEWaaH7nIQZYkrT8Rj12h4x6RHi0UMvjgs
 RgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679505712;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K3Xp0gg8kSZu4Y6dzKtggIPetKwn/QLmsDJsM58B3Gk=;
 b=Rytj1hbZNX1Bxxmv8d2SIixDz6L6EnCzhRUzzfkEsfT3vxTV1Yj7nSoT0z0lzznd7G
 exPb9yNs7BNx7UuWYFFLT1WkHmv6oBj2Lwu7tHO7faZ+3N3wrfMqQtJ8AiGcQnQKf1kB
 d/zKzt2jqedYUlJW6qiWHvifCk0+gUM+nNtfpcbdDS9PTT+gT8rzK2WY+dJzhfSV4s2E
 lfZcEMkXp++tsvFfkxTxEO/s2i6dv1psbYo4DuAJjRPj1tH66Ee6qZiKwOL2x8OKNNLj
 vUrv2ak5nSJNlEtA7NtC46sTn0ZRCiKGw3k/HX0dmqZ29WYCZ4U0i2fHhBZje5LYXze9
 ipVw==
X-Gm-Message-State: AAQBX9cWRV72sJAogMcneXqDOljrj3vnfdyyWnylShVK8TtOSoGtn0lG
 YOgTNio8MlKDx0SbxWKkmbmj6UJFFrid
X-Google-Smtp-Source: AKy350YdlkRuWaOz3tcg/hNSh0IpnMKxCEILhO9pnkZKSifafW7gwvAMFm5c8hy3eJGQCAiafun9+hVEdxbi
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:201:5585:15f1:5eaf:5462])
 (user=venture job=sendgmr) by 2002:a05:6902:100e:b0:b39:b0d3:9a7f with SMTP
 id w14-20020a056902100e00b00b39b0d39a7fmr346991ybt.7.1679505712059; Wed, 22
 Mar 2023 10:21:52 -0700 (PDT)
Date: Wed, 22 Mar 2023 10:21:36 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230322172136.48010-1-venture@google.com>
Subject: [PATCH RESEND v2] hw/i2c: Enable an id for the pca954x devices
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>,
 Hao Wu <wuhaotsh@google.com>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3MDkbZAcKCjcoXgmnkXZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--venture.bounces.google.com;
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

This allows the devices to be more readily found and specified.
Without setting the name field, they can only be found by device type
name, which doesn't let you specify the second of the same device type
behind a bus.

Tested: Verified that by default the device was findable with the name
'pca954x[77]', for an instance attached at that address.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
---
v2: s/id/name/g to use name as the identifier field. left 'id' in subject f=
or email chain.
---
 hw/i2c/i2c_mux_pca954x.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index 3945de795c..76e69bebc5 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -20,6 +20,7 @@
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_slave.h"
 #include "hw/qdev-core.h"
+#include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
@@ -43,6 +44,8 @@ typedef struct Pca954xState {
=20
     bool enabled[PCA9548_CHANNEL_COUNT];
     I2CBus *bus[PCA9548_CHANNEL_COUNT];
+
+    char *name;
 } Pca954xState;
=20
 /*
@@ -181,6 +184,17 @@ static void pca9548_class_init(ObjectClass *klass, voi=
d *data)
     s->nchans =3D PCA9548_CHANNEL_COUNT;
 }
=20
+static void pca954x_realize(DeviceState *dev, Error **errp)
+{
+    Pca954xState *s =3D PCA954X(dev);
+    DeviceState *d =3D DEVICE(s);
+    if (s->name) {
+        d->id =3D g_strdup(s->name);
+    } else {
+        d->id =3D g_strdup_printf("pca954x[%x]", s->parent.i2c.address);
+    }
+}
+
 static void pca954x_init(Object *obj)
 {
     Pca954xState *s =3D PCA954X(obj);
@@ -197,6 +211,11 @@ static void pca954x_init(Object *obj)
     }
 }
=20
+static Property pca954x_props[] =3D {
+    DEFINE_PROP_STRING("nane", Pca954xState, name),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void pca954x_class_init(ObjectClass *klass, void *data)
 {
     I2CSlaveClass *sc =3D I2C_SLAVE_CLASS(klass);
@@ -209,9 +228,12 @@ static void pca954x_class_init(ObjectClass *klass, voi=
d *data)
     rc->phases.enter =3D pca954x_enter_reset;
=20
     dc->desc =3D "Pca954x i2c-mux";
+    dc->realize =3D pca954x_realize;
=20
     k->write_data =3D pca954x_write_data;
     k->receive_byte =3D pca954x_read_byte;
+
+    device_class_set_props(dc, pca954x_props);
 }
=20
 static const TypeInfo pca954x_info[] =3D {
--=20
2.40.0.rc1.284.g88254d51c5-goog


