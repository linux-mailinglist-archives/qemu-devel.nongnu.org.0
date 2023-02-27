Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E5F6A43B0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:06:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe8D-0004Su-OM; Mon, 27 Feb 2023 09:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe84-0004M7-FZ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:24 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe82-0008IS-R4
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:24 -0500
Received: by mail-wr1-x432.google.com with SMTP id bt28so6343992wrb.8
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YtYDhCyGHt282L/1vIUrdhgyJAf4ZI3L5X+30y37+H8=;
 b=GY2QOl8hzK8Dh5rZ4XXkPnzYUnKF1XUuwr9aMVY8DPV5/21uZf49+bCyGY5qlY3SUx
 C60PFBcA+hiTb20NEHM7ZZMM13iwtj1jjJ9ENQLCpo8cX83WKjV7zAs1KP21w5rELYLd
 doL0IfTy+38pDK/HeZ0LREv6THrJkYIN0zC3yGdw2Ra3WbgJ6IcenV020ljE0ZmJMnVT
 p18SIxbayJfeMx6L0WThJpx7AvP5aUoRkNHju3ukiPs4QhJtx/BwxzDtXU3HpL6fBox/
 xNhf13dzvr6EXyZZCjuPuzKUxkNGXUPF/tFipQ7iA+uQqqezEXNCpYVzKUGU+SDdYM9E
 3cQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YtYDhCyGHt282L/1vIUrdhgyJAf4ZI3L5X+30y37+H8=;
 b=oX2Sc2ZUFvrbjRJueNHgfA7qe/UTXmexf/h0BUmnF02glL2AIUm+Of0nDeZX/b+Ufh
 s4KsIHIroDnptkE4ahxd543KNjoMJsWU5ON6zP/a/djEgFSnIYojMHQCaJDctMNIKgAX
 cO7M0q1AQZ+Mu+P+lNvZDl4I7ZMGU5JGcC3A82S+8yEkVB6AQP0t2qdycF6S2T74o2Zh
 /z+nLLK7dPCIhAQKd/Z19iVlSYWJHV0PIjW7m5K1zuHAaJgUJ/MXVVB/wPU8MKDpMU6P
 rjFIzDHlx/+ih9sOjaF9mWaXOIYznc2cjr4C1bOFYnFjhykTwJTHkdTAXkYJVSO2wVjr
 Ew+Q==
X-Gm-Message-State: AO0yUKWkhkzHod+pfgs8WGOvC8d1rv5OuFWEWyl1mu66N9IMLFpgRUB7
 plB/rwTTDsMxhLzXlUVK4pP4clCpdPiPgUe/
X-Google-Smtp-Source: AK7set/52kWRXt8cYNn/r+RxAmM78xNR59k+jbpWRJX10m00hUMj5dlppvZtuesuNkcfgqxECvSFTg==
X-Received: by 2002:adf:eacd:0:b0:2c7:107c:e172 with SMTP id
 o13-20020adfeacd000000b002c7107ce172mr12177639wrn.41.1677506720555; 
 Mon, 27 Feb 2023 06:05:20 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a5d6a41000000b002c70a68111asm7320333wrw.83.2023.02.27.06.05.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:05:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 044/126] hw/i2c/smbus_ich9: Inline ich9_smb_init() and remove it
Date: Mon, 27 Feb 2023 15:00:51 +0100
Message-Id: <20230227140213.35084-35-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bernhard Beschow <shentey@gmail.com>

ich9_smb_init() is a legacy init function, so modernize the code.

Note that the smb_io_base parameter was unused.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230213173033.98762-6-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/smbus_ich9.c    | 13 +++----------
 hw/i386/pc_q35.c       | 11 ++++++++---
 include/hw/i386/ich9.h |  1 -
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index d29c0f6ffa..f0dd3cb147 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -105,6 +105,9 @@ static void ich9_smbus_realize(PCIDevice *d, Error **errp)
     pm_smbus_init(&d->qdev, &s->smb, false);
     pci_register_bar(d, ICH9_SMB_SMB_BASE_BAR, PCI_BASE_ADDRESS_SPACE_IO,
                      &s->smb.io);
+
+    s->smb.set_irq = ich9_smb_set_irq;
+    s->smb.opaque = s;
 }
 
 static void build_ich9_smb_aml(AcpiDevAmlIf *adev, Aml *scope)
@@ -137,16 +140,6 @@ static void ich9_smb_class_init(ObjectClass *klass, void *data)
     adevc->build_dev_aml = build_ich9_smb_aml;
 }
 
-I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base)
-{
-    PCIDevice *d =
-        pci_create_simple_multifunction(bus, devfn, true, TYPE_ICH9_SMB_DEVICE);
-    ICH9SMBState *s = ICH9_SMB_DEVICE(d);
-    s->smb.set_irq = ich9_smb_set_irq;
-    s->smb.opaque = s;
-    return s->smb.smbus;
-}
-
 static const TypeInfo ich9_smb_info = {
     .name   = TYPE_ICH9_SMB_DEVICE,
     .parent = TYPE_PCI_DEVICE,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 5e3f7c7e86..7137c38846 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -315,10 +315,15 @@ static void pc_q35_init(MachineState *machine)
     }
 
     if (pcms->smbus_enabled) {
+        PCIDevice *smb;
+
         /* TODO: Populate SPD eeprom data.  */
-        pcms->smbus = ich9_smb_init(host_bus,
-                                    PCI_DEVFN(ICH9_SMB_DEV, ICH9_SMB_FUNC),
-                                    0xb100);
+        smb = pci_create_simple_multifunction(host_bus,
+                                              PCI_DEVFN(ICH9_SMB_DEV,
+                                                        ICH9_SMB_FUNC),
+                                              true, TYPE_ICH9_SMB_DEVICE);
+        pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(smb), "i2c"));
+
         smbus_eeprom_init(pcms->smbus, 8, NULL, 0);
     }
 
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 05464f6965..52ea116f44 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -9,7 +9,6 @@
 #include "qom/object.h"
 
 void ich9_lpc_pm_init(PCIDevice *pci_lpc, bool smm_enabled);
-I2CBus *ich9_smb_init(PCIBus *bus, int devfn, uint32_t smb_io_base);
 
 void ich9_generate_smi(void);
 
-- 
2.38.1


