Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776003C2772
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:22:15 +0200 (CEST)
Received: from localhost ([::1]:58656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tGY-0008FG-7L
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t54-0001W1-B5
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:22 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t4x-0000vl-OE
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:22 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so9393266wmb.3
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aHRaVWqPn2HCxCJuZ+zjdoZsyhFaWY2cM+MNuYOv0sg=;
 b=gDD4+lQr6ivR7RbLcQkQ7EXJgA5OT03URLGTVBDLVD3CcJYjLrVxqfHyJuKE6iCkzD
 mxz1hCDx5XSXqfMS92TKy5Dof4EipkkW68CilRUa8yzpvyu0YACNKbLU+fQa9KMI/Xot
 VmrpLUQca9iQKtxx3twK5CopGE1FwrASebDmBOjMQoiGkvVUGpUWSU3aczGPRv9dajWp
 IaL7jb3cqBHhFOQhXCXRVEBJO/wZvky8IdoitOyNYNy1j6dJ4YS6kd0M1urQ/jneqjLQ
 A73g0fwEWXNWWnsc1lfgFYb8D9z5SeATGLDWXYd+JgWRWJEbsgtZZ1QHhj+EgHVaFEPT
 t+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aHRaVWqPn2HCxCJuZ+zjdoZsyhFaWY2cM+MNuYOv0sg=;
 b=BFSPwABV7cx1CGvWalf6ZyLPNhBA+bDzhKMasLyXls3tHW0MMqygjEML+6MkpSzdk7
 qQYWwqoLlBay0INmqb05FGWEkv9ZbUH13az2Q3yN+7e4jpSDODbMUNIVTjcug0raHFY2
 XNgLgV2UcRvwLlZKTL18OwjnQxzCOt3FH0RT+Bv1HggPUmln1v+6CnfzRYPCu0igC6cF
 ch/5pMJb9CEhCghG6woFHJ9N0y6wDEZA3HLZNCWLDMWYNWhmnLYLJ6e2fNHAjBilaPud
 Cy7X6k1BIdhvlRUsmCPRVaF1eaVLLgIMxWHWOUy4wu6GIwAe+yRGJX3SNYXoFEhQP2rV
 hXuA==
X-Gm-Message-State: AOAM5320QH1wmshO1yWO5oS43C7B3noBi5zLj0IfO40ItFvH0adp5RLo
 b+wF1Ni4HyxPPW4R7lKKz7ZA4X29vcNDclRc
X-Google-Smtp-Source: ABdhPJy75iZgD47RFitS4T9yo2w0PSEIngdgkhGseye2HSlBJyn2vRDDRKHqnS9wSpD2wy/UI3VpLQ==
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr10666590wmh.89.1625847013236; 
 Fri, 09 Jul 2021 09:10:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x19sm5232277wmi.10.2021.07.09.09.10.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:10:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/17] hw/gpio/pl061: Make pullup/pulldown of outputs
 configurable
Date: Fri,  9 Jul 2021 17:09:57 +0100
Message-Id: <20210709161003.25874-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709161003.25874-1-peter.maydell@linaro.org>
References: <20210709161003.25874-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PL061 GPIO does not itself include pullup or pulldown resistors
to set the value of a GPIO line treated as an output when it is
configured as an input (ie when the PL061 itself is not driving it).
In real hardware it is up to the board to add suitable pullups or
pulldowns.  Currently our implementation hardwires this to "outputs
pulled high", which is correct for some boards (eg the realview ones:
see figure 3-29 in the "RealView Platform Baseboard for ARM926EJ-S
User Guide" DUI0224I), but wrong for others.

In particular, the wiring in the 'virt' board and the gpio-pwr device
assumes that wires should be pulled low, because otherwise the
pull-to-high will trigger a shutdown or reset action.  (The only
reason this doesn't happen immediately on startup is due to another
bug in the PL061, where we don't assert the GPIOs to the correct
value on reset, but will do so as soon as the guest touches a
register and pl061_update() gets called.)

Add properties to the pl061 so the board can configure whether it
wants GPIO lines to have pullup, pulldown, or neither.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/gpio/pl061.c | 51 +++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 9360c143eef..5ba398fcd42 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -13,12 +13,28 @@
  *  + unnamed GPIO inputs 0..7: inputs to connect to the emulated GPIO lines
  *  + unnamed GPIO outputs 0..7: the emulated GPIO lines, considered as
  *    outputs
+ *  + QOM property "pullups": an integer defining whether non-floating lines
+ *    configured as inputs should be pulled up to logical 1 (ie whether in
+ *    real hardware they have a pullup resistor on the line out of the PL061).
+ *    This should be an 8-bit value, where bit 0 is 1 if GPIO line 0 should
+ *    be pulled high, bit 1 configures line 1, and so on. The default is 0xff,
+ *    indicating that all GPIO lines are pulled up to logical 1.
+ *  + QOM property "pulldowns": an integer defining whether non-floating lines
+ *    configured as inputs should be pulled down to logical 0 (ie whether in
+ *    real hardware they have a pulldown resistor on the line out of the PL061).
+ *    This should be an 8-bit value, where bit 0 is 1 if GPIO line 0 should
+ *    be pulled low, bit 1 configures line 1, and so on. The default is 0x0.
+ *    It is an error to set a bit in both "pullups" and "pulldowns". If a bit
+ *    is 0 in both, then the line is considered to be floating, and it will
+ *    not have qemu_set_irq() called on it when it is configured as an input.
  */
 
 #include "qemu/osdep.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
+#include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qom/object.h"
@@ -62,6 +78,9 @@ struct PL061State {
     qemu_irq irq;
     qemu_irq out[N_GPIOS];
     const unsigned char *id;
+    /* Properties, for non-Luminary PL061 */
+    uint32_t pullups;
+    uint32_t pulldowns;
 };
 
 static const VMStateDescription vmstate_pl061 = {
@@ -109,8 +128,7 @@ static uint8_t pl061_floating(PL061State *s)
          */
         floating = ~(s->pur | s->pdr);
     } else {
-        /* Assume outputs are pulled high. FIXME: this is board dependent. */
-        floating = 0;
+        floating = ~(s->pullups | s->pulldowns);
     }
     return floating & ~s->dir;
 }
@@ -131,8 +149,7 @@ static uint8_t pl061_pullups(PL061State *s)
          */
         pullups = s->pur;
     } else {
-        /* Assume outputs are pulled high. FIXME: this is board dependent. */
-        pullups = 0xff;
+        pullups = s->pullups;
     }
     return pullups & ~s->dir;
 }
@@ -499,12 +516,38 @@ static void pl061_init(Object *obj)
     qdev_init_gpio_out(dev, s->out, N_GPIOS);
 }
 
+static void pl061_realize(DeviceState *dev, Error **errp)
+{
+    PL061State *s = PL061(dev);
+
+    if (s->pullups > 0xff) {
+        error_setg(errp, "pullups property must be between 0 and 0xff");
+        return;
+    }
+    if (s->pulldowns > 0xff) {
+        error_setg(errp, "pulldowns property must be between 0 and 0xff");
+        return;
+    }
+    if (s->pullups & s->pulldowns) {
+        error_setg(errp, "no bit may be set both in pullups and pulldowns");
+        return;
+    }
+}
+
+static Property pl061_props[] = {
+    DEFINE_PROP_UINT32("pullups", PL061State, pullups, 0xff),
+    DEFINE_PROP_UINT32("pulldowns", PL061State, pulldowns, 0x0),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void pl061_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->vmsd = &vmstate_pl061;
     dc->reset = &pl061_reset;
+    dc->realize = pl061_realize;
+    device_class_set_props(dc, pl061_props);
 }
 
 static const TypeInfo pl061_info = {
-- 
2.20.1


