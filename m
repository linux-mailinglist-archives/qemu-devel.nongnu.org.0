Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99536D8BD0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 02:25:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkDR5-0004qX-Rp; Wed, 05 Apr 2023 20:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UxEuZAcKClY8CA9C164CC492.0CAE2AI-12J29BCB4BI.CF4@flex--komlodi.bounces.google.com>)
 id 1pkDR2-0004mm-Px
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 20:25:05 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UxEuZAcKClY8CA9C164CC492.0CAE2AI-12J29BCB4BI.CF4@flex--komlodi.bounces.google.com>)
 id 1pkDR0-0005Cc-E9
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 20:25:04 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 s4-20020a170902ea0400b001a1f4137086so21844550plg.14
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 17:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680740691;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=dY4FZ+4q6pxfE+emsEHrGl/ogs55mlHFZRbO9QfgZgE=;
 b=gSU3fTOzl2PenK54NlHb6Np5J7vWHItVx2RIWS/lUOB90yZUe16jVVvV4dtzAEqG7B
 H8vcXOkvmPVvojeb6sZ5bGdBib9wWqd+7B/D/ArDBPbFXdYNI8IgPI2Ngaxxg7YJrNsg
 ktVF4Dp0HBzSpQIojLhe/a0NT49IhYwd0qHccEmdQsmAsmuR/xHFyCMmF3+53MWZCAJL
 N6cV8xEvhrn7dJ/0hyoc+z7vluu0aMLiBHRTtJTQHnwxMS4ta1sA5d1aEXFLEzzziriF
 5RaCNxJkdLRkCy3XaeUoJm1B67F9p0gV+pp2mZ5LcWGTXzJgPtufYuL6bsB7D+gkQ8Cw
 Chsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740691;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dY4FZ+4q6pxfE+emsEHrGl/ogs55mlHFZRbO9QfgZgE=;
 b=gDr8wbIsEqjj5PAUB0hpsYdipF325xVbwsoZPDTt5PWC9IU8sOKG9QA95g8kTnJNCI
 N1NqlAO6Dl5ib9x9eHEF17ErsZCPhJO4gfxOenMNrzv0nkeEQ730AUOGrsX6NjuzgEJ4
 QYrQZzs8487rmf86kQwuMlVngNhyClQa5ZyvivuFuR5vIDszIPcMuSDBn1a7OclITUB+
 koSG1ovMTtEVWTEbuooHbVbB8HojgfzJwF4/10yt+FjVhtwvNqhuFLCYUaviVBnLFXaY
 VYLy7s/H4AQdlgFFtxoOZ89C2sNirp6WG1OP8mZba/jYP1PB6SQ1c1UZgjUqHz+5h464
 Sdrw==
X-Gm-Message-State: AAQBX9cwsqmzoXM+td7ygz3kYC9sJ8w2NFR0fjzYkGA9zMfSu/MAGqZf
 VjO7GUUZIejPFYz+MRDys3eZBu5OuZCmBjpVtgMKWtSOVb7DTGtnL71C5PaoVfHv2o7SknlpETk
 jMVtWfi8yu8NLLilhucYx/Jr+LDLliMQchQHDSi1rzFMAIodqtpGh6nNZh30HzHI=
X-Google-Smtp-Source: AKy350bLxBjBmOWAv0Cvqv8MlcB5T/iJBnzTZKCTYWONHIQnWKD2hIiKs4Dcwaca2k+cjNvQdHKaUXj78gpX
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a65:52c1:0:b0:514:1a94:b2ba with SMTP id
 z1-20020a6552c1000000b005141a94b2bamr2424612pgp.12.1680740691290; Wed, 05 Apr
 2023 17:24:51 -0700 (PDT)
Date: Thu,  6 Apr 2023 00:24:46 +0000
In-Reply-To: <20230406002447.4046378-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230406002447.4046378-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230406002447.4046378-2-komlodi@google.com>
Subject: [PATCH 1/2] hw/gpio/npcm7xx: Add GPIO DIN object property
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: komlodi@google.com, wuhaotsh@google.com, kfting@nuvoton.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3UxEuZAcKClY8CA9C164CC492.0CAE2AI-12J29BCB4BI.CF4@flex--komlodi.bounces.google.com;
 helo=mail-pl1-x649.google.com
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

In cases where the input pin is driven by an entity outside of the
machine, such as a machine the BMC is managing, we need a way to
update the pin state when the external machine drives it.

This allows us to do it via QMP.
For example, to set pin 20 on GPIO controller 0:
{"execute":"qom-set","arguments": {
   "path":"/machine/soc/gpio[0]",
   "property":"gpio-pins-in",
   "value":1048576
}}

1048576 == 0x100000, JSON does not support hex.

Signed-off-by: Joe Komlodi <komlodi@google.com>
---
 hw/gpio/npcm7xx_gpio.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/gpio/npcm7xx_gpio.c b/hw/gpio/npcm7xx_gpio.c
index 3376901ab1..2a7be60d8d 100644
--- a/hw/gpio/npcm7xx_gpio.c
+++ b/hw/gpio/npcm7xx_gpio.c
@@ -20,6 +20,7 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
+#include "qapi/visitor.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/units.h"
@@ -340,6 +341,29 @@ static void npcm7xx_gpio_set_input(void *opaque, int line, int level)
     npcm7xx_gpio_update_pins(s, BIT(line));
 }
 
+static void npcm7xx_gpio_get_pins_in(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    uint32_t *pins_in = (uint32_t *)opaque;
+
+    visit_type_uint32(v, name, pins_in, errp);
+}
+
+static void npcm7xx_gpio_set_pins_in(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    NPCM7xxGPIOState *s = NPCM7XX_GPIO(obj);
+    uint32_t new_pins_in;
+
+    if (!visit_type_uint32(v, name, &new_pins_in, errp)) {
+        return;
+    }
+
+    s->ext_driven = new_pins_in;
+    s->ext_level = new_pins_in;
+    npcm7xx_gpio_update_pins(s, new_pins_in);
+}
+
 static void npcm7xx_gpio_enter_reset(Object *obj, ResetType type)
 {
     NPCM7xxGPIOState *s = NPCM7XX_GPIO(obj);
@@ -371,6 +395,10 @@ static void npcm7xx_gpio_init(Object *obj)
 
     qdev_init_gpio_in(dev, npcm7xx_gpio_set_input, NPCM7XX_GPIO_NR_PINS);
     qdev_init_gpio_out(dev, s->output, NPCM7XX_GPIO_NR_PINS);
+
+    object_property_add(obj, "gpio-pins-in", "uint32",
+                        npcm7xx_gpio_get_pins_in,  npcm7xx_gpio_set_pins_in,
+                        NULL, &s->regs[NPCM7XX_GPIO_DIN]);
 }
 
 static const VMStateDescription vmstate_npcm7xx_gpio = {
-- 
2.40.0.348.gf938b09366-goog


