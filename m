Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3354DD1E6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 01:22:23 +0100 (CET)
Received: from localhost ([::1]:35516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV0Nq-0002hQ-Hh
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 20:22:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3HMozYgcKCpcM5EKLI57FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--venture.bounces.google.com>)
 id 1nV02E-000369-Nf
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 20:00:07 -0400
Received: from [2607:f8b0:4864:20::34a] (port=43576
 helo=mail-ot1-x34a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3HMozYgcKCpcM5EKLI57FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--venture.bounces.google.com>)
 id 1nV02C-0007LW-Rz
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 20:00:02 -0400
Received: by mail-ot1-x34a.google.com with SMTP id
 o17-20020a9d5c11000000b005b24a70c275so3618651otk.10
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 16:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=CZ3k1SLfFmUEjk+3ZnDSRBaEoZBUuBiFPw8PLhOQgNQ=;
 b=hhqngyTXy9OjZPm9xUhjZ+g+acH6cW5CrW98Q0h1eCUPMqJSIe/tFNYQ2Qsn6roZcW
 yZp94Np49w1hCnFm39PmgK4jvCuSHq+3hEmbjSiDhIwbtQlhBwaM0z+kKERTlriUGv1e
 hyq5zHULe5Alx2G1cXNjSdsZMGnFdD+vFzyJNvDGBHw6SLmqPF7PK9OMTUasiJV0btrT
 ydoPQAQWleJENNzNuE74T+bplQqSCywGNL23xgSCJ8YnEzNH5cWdqA3jJ8m58J5QPbI4
 FmixJt957ZkEWbdN2KdhR+xV6GZCOz6oWlVQDKF5QgnnF1EHFq9fAxBFjb2daZCYJlh6
 KO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=CZ3k1SLfFmUEjk+3ZnDSRBaEoZBUuBiFPw8PLhOQgNQ=;
 b=JvkuhS9poqK6N+WVsegb3WRnsq5GlrWbfarHnapij7N9BHTz/oo6KUBlD6ChnGMHjv
 gQgJGmhomeVlENtphfdUHgDZKHvb4RxfAKcrJSMsG47CFDTyynI2ZgcozhkF6lMWHyrj
 Z09Z5GkQtUiULcklIe1NXUxPJaaSHavtMPkPqIXvy85pCEwbQGgoc8R248Hb8pB5ZNn8
 y85PQwHvbHLJwnmPZ1tDJ9ODW2Jc1iTMvtyJXiriVpqyQvxdHy8MHewUXxi2Xvge1eRH
 mQav+au3m5PtLmTavUjWMbH9vWHOLT357TF2UzzbxG3VAVZfCsxG/yzcD1WTT4s9UNm7
 IKvg==
X-Gm-Message-State: AOAM532d3d5uNMw9ytutzyIOt1WTGyMJEsDxEUTC/4cn4U/bWhlJ9VAz
 lZidEEaOT4RsG9qSvt3vuUIWcJxNdCjz
X-Google-Smtp-Source: ABdhPJwC/5XRA185zdyPr0WHUrK2cQgiGYpLdlK1e8PxBaidUhMgeFyHjPoUZEcRzHsMFhJLkv/kispRG1J7
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:b296:d1f:c179:c0da])
 (user=venture job=sendgmr) by 2002:a81:508b:0:b0:2e5:9904:8655 with SMTP id
 e133-20020a81508b000000b002e599048655mr8829510ywb.196.1647561244323; Thu, 17
 Mar 2022 16:54:04 -0700 (PDT)
Date: Thu, 17 Mar 2022 16:53:54 -0700
Message-Id: <20220317235354.94009-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
Subject: [PATCH] hw/i2c: Enable an id for the pca954x devices
From: Patrick Venture <venture@google.com>
To: f4bug@amsat.org, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::34a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::34a;
 envelope-from=3HMozYgcKCpcM5EKLI57FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--venture.bounces.google.com;
 helo=mail-ot1-x34a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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


