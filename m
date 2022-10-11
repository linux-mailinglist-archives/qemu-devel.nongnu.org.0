Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4645F5FB7DB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 17:59:24 +0200 (CEST)
Received: from localhost ([::1]:36090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiHf7-000689-PE
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 11:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <34Y9FYwcKCjgpYhnolYaiiafY.WigkYgo-XYpYfhihaho.ila@flex--venture.bounces.google.com>)
 id 1oiHSv-0000LZ-L9
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:46:45 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:49752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <34Y9FYwcKCjgpYhnolYaiiafY.WigkYgo-XYpYfhihaho.ila@flex--venture.bounces.google.com>)
 id 1oiHSt-0005fX-Cl
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:46:44 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 a2-20020a5b0002000000b006b48689da76so13787502ybp.16
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 08:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CZ3k1SLfFmUEjk+3ZnDSRBaEoZBUuBiFPw8PLhOQgNQ=;
 b=CWneG8+mmY/y1rEUfLtrD7TABr82gnZoX/VPC+XmSeHkWqfjzN2m9Ze+y2bHggwt/r
 /eeEh5LemEXVgz4lDJ6r0tSbD8C1iLjEPdm2I/m4L/rpKdEk6+Dmo1/4hvYKjlUkv1+0
 KE7gsgNbEeSoyPwIH8n/oEde9bF9pV7pj1dOJVYRiqtVnKolLfs26ZM6pwzATWuGZpA8
 fxRJ6Ka0go3f0DzX2JakeFcGbWrJsw0GhaKpL/llUWbKXyOJkkGJkQ7qRvk9jYzg0wli
 drMUQL4RllO2a3YkHvRtw7pl2XB29heGrxSqKIcqxK0pCnmbo8fV4xAcYLusPGPttvEH
 fP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CZ3k1SLfFmUEjk+3ZnDSRBaEoZBUuBiFPw8PLhOQgNQ=;
 b=ZP2Bi9dN+VLjdSJRORtgvRYOTE0gs4e9YveC34dJ3bmL7QU6rsirgSOT6fzj6s8fNh
 4LTmzCojV5QgJ06CNK2lIndClag6wToWyHpj1m0hwUznTmB6t61xJ/mPp65OeovPuuBL
 uBk4MyrVi6F12bt+dA+PME9Mo0Fd0Q57HjchS4kzAI+fSbrnuyCM5UdMJSTb6uRUxfSA
 yi4U/AV+QrQKsGF9FQfwTs+iAbenFEP4Hr3mnjkiMAQTGGSWcfFHVKRAqjTxrhciCve0
 OnFCEf/NgAh5XwI6uyQzgfUWSyPZrutQVKCHJpYNt9dDooHrhO+QLE9dHGHeXKg8Iuas
 d5hw==
X-Gm-Message-State: ACrzQf1LquZqo8is4WWMbw2Ele0kTsyn3k3o/ZcZ33PpjP7Stb3N/YQo
 2GtEDAqeaX+cwmcYaiiObzdTWI7l4tTy
X-Google-Smtp-Source: AMsMyM4kaipPI059B1SOopLMhG98DiDJ+e+NN252BLZOVGU9AYYbu0O8w1EYxuHPtfqiwrbSa85U/IEIJOK0
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:201:bf11:a252:e4fc:5281])
 (user=venture job=sendgmr) by 2002:a81:148c:0:b0:360:db30:c1e5 with SMTP id
 134-20020a81148c000000b00360db30c1e5mr8806251ywu.230.1665503201446; Tue, 11
 Oct 2022 08:46:41 -0700 (PDT)
Date: Tue, 11 Oct 2022 08:46:37 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221011154637.1383553-1-venture@google.com>
Subject: [PATCH RESEND] hw/i2c: Enable an id for the pca954x devices
From: Patrick Venture <venture@google.com>
To: f4bug@amsat.org, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=34Y9FYwcKCjgpYhnolYaiiafY.WigkYgo-XYpYfhihaho.ila@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows the devices to be more readily found and specified.
Without setting the id field, they can only be found by device type
name, which doesn't let you specify the second of the same device type
behind a bus.

Tested: Verified that by default the device was findable with the id
'pca954x[77]', for an instance attached at that address.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/i2c/i2c_mux_pca954x.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index a9517b612a..4f8c2d6ae1 100644
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
 
     bool enabled[PCA9548_CHANNEL_COUNT];
     I2CBus *bus[PCA9548_CHANNEL_COUNT];
+
+    char *id;
 } Pca954xState;
 
 /*
@@ -181,6 +184,17 @@ static void pca9548_class_init(ObjectClass *klass, void *data)
     s->nchans = PCA9548_CHANNEL_COUNT;
 }
 
+static void pca954x_realize(DeviceState *dev, Error **errp)
+{
+    Pca954xState *s = PCA954X(dev);
+    DeviceState *d = DEVICE(s);
+    if (s->id) {
+        d->id = g_strdup(s->id);
+    } else {
+        d->id = g_strdup_printf("pca954x[%x]", s->parent.i2c.address);
+    }
+}
+
 static void pca954x_init(Object *obj)
 {
     Pca954xState *s = PCA954X(obj);
@@ -197,6 +211,11 @@ static void pca954x_init(Object *obj)
     }
 }
 
+static Property pca954x_props[] = {
+    DEFINE_PROP_STRING("id", Pca954xState, id),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void pca954x_class_init(ObjectClass *klass, void *data)
 {
     I2CSlaveClass *sc = I2C_SLAVE_CLASS(klass);
@@ -209,9 +228,12 @@ static void pca954x_class_init(ObjectClass *klass, void *data)
     rc->phases.enter = pca954x_enter_reset;
 
     dc->desc = "Pca954x i2c-mux";
+    dc->realize = pca954x_realize;
 
     k->write_data = pca954x_write_data;
     k->receive_byte = pca954x_read_byte;
+
+    device_class_set_props(dc, pca954x_props);
 }
 
 static const TypeInfo pca954x_info[] = {
-- 
2.35.1.894.gb6a874cedc-goog


