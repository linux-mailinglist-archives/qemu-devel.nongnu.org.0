Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9679C4CFCE5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:30:09 +0100 (CET)
Received: from localhost ([::1]:50322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBZ2-000296-Id
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:30:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAMY-0004S7-6y
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:13:10 -0500
Received: from [2a00:1450:4864:20::42e] (port=42598
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAMW-0004NG-LZ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:13:09 -0500
Received: by mail-wr1-x42e.google.com with SMTP id u10so20729421wra.9
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iq/phndxmXP1fEuqNLg+aeoAruQ+H73qFUXnPncUnqs=;
 b=VdCC+a0QgJmee/46IWVDsw+5jgqwUJfdl2JjpA9RlBMIyKNE8hSgLSdg1a74Gjplr2
 tSjT1tDYEtQllk68SKuy4p4uJSDhsFIivnnQMS58CdywzAcm/IWaHhbWOZ61ZCP65WfY
 E4zvPnxHvLvGha7s6xh4vvYjHvCqKtWp6h3fUBnCwsgUq5x+J9/vVTBcsPIZPYdRxDv/
 aZpUqps2BXYx2IAPH6nnB+U+P3FHlwoFzPlrZzArunjl03AHHyoYMk/6rJdof3kBBc7X
 s8W0YuRQKKojFNw15nV9rsv3oa87VPTDyxFGr6WBYGzrUzkIAzn1Oijep4E6xdA0jFnA
 FIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iq/phndxmXP1fEuqNLg+aeoAruQ+H73qFUXnPncUnqs=;
 b=ZIHZ/tTOeAvVNFtFfsN7gC+G3by5s8WQCQZ9K3iYTUCxqY2/4OyecOY+mmZJWzc5Ml
 t00F0W+BWxXc1MehWxZ7chp2cEPkgXYpRUZVhaT/ctr/9ty/nnykRoUOSNJPPIwPNnNE
 CTvey9OSGdoQuLzeqroIHr8qM43m5nFsJIkQWXLNLzAVyVxWqyAsT1QNeJy/zQb6yLRa
 NsmeWbBDoS1fP/z6GA+B27v3WfCJA9joN4+ZlOsiZMH5xw5Ab5XjGE4FluZzVgiAGWK+
 TbMignFrG3cVyu+su7uKiTXKspyn8UiJbUvW6y3ZzZGaUPe/YARVSmKAjNbmfot6wTvN
 VT/Q==
X-Gm-Message-State: AOAM531npTEsPKDdz475MjE5wzQSN18kOsvvBgX0DqpSH03eVNPJ1Uaf
 zlyqYDsvmn9IhtBeRJHcoF2dPZ/zhro=
X-Google-Smtp-Source: ABdhPJx2WwpPRx9RQJjN7ZfhKUg/rAa7Mersc4pnCLsFHD9DOTa/8l8Q6WRxepSzNaTQgbR5gRPvpQ==
X-Received: by 2002:adf:eb81:0:b0:1e3:2bf5:132 with SMTP id
 t1-20020adfeb81000000b001e32bf50132mr7720494wrn.246.1646647987143; 
 Mon, 07 Mar 2022 02:13:07 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a5d548c000000b001f1f99e7792sm1804411wrv.111.2022.03.07.02.13.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 02:13:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/16] hw/input/pckbd: QOM'ify IRQ numbers
Date: Mon,  7 Mar 2022 11:12:03 +0100
Message-Id: <20220307101207.90369-13-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Exposing the IRQ numbers as QOM properties not only allows them to be
configurable but also to be printed by standard QOM mechanisms. This
allows isabus_dev_print() to be retired eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220301220037.76555-4-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pckbd.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index baba62f357..eb77e12f6f 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -26,6 +26,7 @@
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/timer.h"
+#include "qapi/error.h"
 #include "hw/isa/isa.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/aml-build.h"
@@ -671,6 +672,8 @@ struct ISAKBDState {
     KBDState kbd;
     bool kbd_throttle;
     MemoryRegion io[2];
+    uint8_t kbd_irq;
+    uint8_t mouse_irq;
 };
 
 void i8042_isa_mouse_fake_event(ISAKBDState *isa)
@@ -734,8 +737,20 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
     ISAKBDState *isa_s = I8042(dev);
     KBDState *s = &isa_s->kbd;
 
-    isa_init_irq(isadev, &s->irq_kbd, 1);
-    isa_init_irq(isadev, &s->irq_mouse, 12);
+    if (isa_s->kbd_irq >= ISA_NUM_IRQS) {
+        error_setg(errp, "Maximum value for \"kbd-irq\" is: %u",
+                   ISA_NUM_IRQS - 1);
+        return;
+    }
+
+    if (isa_s->mouse_irq >= ISA_NUM_IRQS) {
+        error_setg(errp, "Maximum value for \"mouse-irq\" is: %u",
+                   ISA_NUM_IRQS - 1);
+        return;
+    }
+
+    isa_init_irq(isadev, &s->irq_kbd, isa_s->kbd_irq);
+    isa_init_irq(isadev, &s->irq_mouse, isa_s->mouse_irq);
 
     isa_register_ioport(isadev, isa_s->io + 0, 0x60);
     isa_register_ioport(isadev, isa_s->io + 1, 0x64);
@@ -754,6 +769,7 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
 
 static void i8042_build_aml(ISADevice *isadev, Aml *scope)
 {
+    ISAKBDState *isa_s = I8042(isadev);
     Aml *kbd;
     Aml *mou;
     Aml *crs;
@@ -761,7 +777,7 @@ static void i8042_build_aml(ISADevice *isadev, Aml *scope)
     crs = aml_resource_template();
     aml_append(crs, aml_io(AML_DECODE16, 0x0060, 0x0060, 0x01, 0x01));
     aml_append(crs, aml_io(AML_DECODE16, 0x0064, 0x0064, 0x01, 0x01));
-    aml_append(crs, aml_irq_no_flags(1));
+    aml_append(crs, aml_irq_no_flags(isa_s->kbd_irq));
 
     kbd = aml_device("KBD");
     aml_append(kbd, aml_name_decl("_HID", aml_eisaid("PNP0303")));
@@ -769,7 +785,7 @@ static void i8042_build_aml(ISADevice *isadev, Aml *scope)
     aml_append(kbd, aml_name_decl("_CRS", crs));
 
     crs = aml_resource_template();
-    aml_append(crs, aml_irq_no_flags(12));
+    aml_append(crs, aml_irq_no_flags(isa_s->mouse_irq));
 
     mou = aml_device("MOU");
     aml_append(mou, aml_name_decl("_HID", aml_eisaid("PNP0F13")));
@@ -783,6 +799,8 @@ static void i8042_build_aml(ISADevice *isadev, Aml *scope)
 static Property i8042_properties[] = {
     DEFINE_PROP_BOOL("extended-state", ISAKBDState, kbd.extended_state, true),
     DEFINE_PROP_BOOL("kbd-throttle", ISAKBDState, kbd_throttle, false),
+    DEFINE_PROP_UINT8("kbd-irq", ISAKBDState, kbd_irq, 1),
+    DEFINE_PROP_UINT8("mouse-irq", ISAKBDState, mouse_irq, 12),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.34.1


