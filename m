Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1470853062E
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 23:29:36 +0200 (CEST)
Received: from localhost ([::1]:39090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nst8p-00079A-5v
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 17:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nst4S-0002u0-A9; Sun, 22 May 2022 17:25:04 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nst4Q-0005Rp-LP; Sun, 22 May 2022 17:25:04 -0400
Received: by mail-ed1-x533.google.com with SMTP id j28so16824269eda.13;
 Sun, 22 May 2022 14:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W3cFt3WUVMFye0KlqibqKVNwjrCZEijZ5s2jCoU+df0=;
 b=Ec04YkNAayxxb76oeSPAUOfWxeS5TOwCyqn/kKwNOx1wkeXRFY04BUUv4J+07WxUnV
 lA0JGOrj/KKzSZD8by1Hr7lwUHx+PKJ75rzkKpvfOELIUIp2YabfO80JfT9figgJVHrD
 SOjyWKQx5xVnk68GBCwnIr2oE9rlMYY++ddNoQjzN6zoWe2T8siARSu8IqX/IRISB1ln
 d6mDw2XwkElWkkyhE7MSMlmb/Epl0j6w+8EMKX2DHafTZa2cOWB3a928dd+WRTmNzhpK
 xJ/LWJ06aQkv26eZz+moPzaV6bO1wkgCRUsqdFFWxzkvMj/rWbDQN9xmPFbXWKhGhPIe
 M/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W3cFt3WUVMFye0KlqibqKVNwjrCZEijZ5s2jCoU+df0=;
 b=h0b7/REgX9q/6s+t6LSI5zHW2E2MGlP3K5uQdylPHiKVKxwU9jrCsmoeFoc9I6fCVF
 JhNRvAY3nXB1ESEGSyAEj71+am/pUQ0E/NYLMq+9UXL3uhZN6V68K5Y6X9Tq1Mq+mQ/r
 M7tlpzCcT+Gw9x/GjQujBp9Ee88xYyHzHl6hnjoXd7PwascB3j7DTt/r9CKM0OLy1JQf
 BKH/eRYfkduS31/H1ShUdWjUU4Ov6kvrct6+UxKcARgrfqqkpS6Xe9ZCzxDKd74NlYo0
 H8ZicWnOsjof17sw5haTzjinMG3aiPMwD6uPtWKhaxVVhXfmsk6VKd/QKia1Mf3GPSmA
 bEiA==
X-Gm-Message-State: AOAM530BXskfkA9XQfQdy9grqaOw+sqLgFGIwcs5HeeGX4BN+8w3r5Ce
 K5xWOTg11cq1opjgb2OOvafCPgVSAQM=
X-Google-Smtp-Source: ABdhPJw/QPZ7Z9czTMlZorSEP7EvLU7Q3egmRAHbnF4bMJRN2ruXDeIcd11i27EvNI4bXafn9H115g==
X-Received: by 2002:a05:6402:2713:b0:42b:7127:8614 with SMTP id
 y19-20020a056402271300b0042b71278614mr721373edd.317.1653254700767; 
 Sun, 22 May 2022 14:25:00 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-075-232.78.54.pool.telefonica.de. [78.54.75.232])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a170907270400b006f3ef214e22sm5418768ejk.136.2022.05.22.14.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 14:25:00 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH v2 2/6] hw/isa/piix{3,
 4}: Move pci_map_irq_fn's near pci_set_irq_fn's
Date: Sun, 22 May 2022 23:24:27 +0200
Message-Id: <20220522212431.14598-3-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220522212431.14598-1-shentey@gmail.com>
References: <20220522212431.14598-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The pci_map_irq_fn's were implemented below type_init() which made them
inaccessible to QOM functions. So move them up.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/isa/piix3.c | 22 +++++++++++-----------
 hw/isa/piix4.c | 50 +++++++++++++++++++++++++-------------------------
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index d96ce2b788..c7a9014c3f 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -78,6 +78,17 @@ static void piix3_set_irq(void *opaque, int pirq, int level)
     piix3_set_irq_level(piix3, pirq, level);
 }
 
+/*
+ * Return the global irq number corresponding to a given device irq
+ * pin. We could also use the bus number to have a more precise mapping.
+ */
+static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
+{
+    int slot_addend;
+    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
+    return (pci_intx + slot_addend) & 3;
+}
+
 static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 {
     PIIX3State *piix3 = opaque;
@@ -350,17 +361,6 @@ static void piix3_register_types(void)
 
 type_init(piix3_register_types)
 
-/*
- * Return the global irq number corresponding to a given device irq
- * pin. We could also use the bus number to have a more precise mapping.
- */
-static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
-{
-    int slot_addend;
-    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
-    return (pci_intx + slot_addend) & 3;
-}
-
 PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
 {
     PIIX3State *piix3;
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 8607e0ac36..a223b69e24 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -73,6 +73,31 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
     }
 }
 
+static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
+{
+    int slot;
+
+    slot = PCI_SLOT(pci_dev->devfn);
+
+    switch (slot) {
+    /* PIIX4 USB */
+    case 10:
+        return 3;
+    /* AMD 79C973 Ethernet */
+    case 11:
+        return 1;
+    /* Crystal 4281 Sound */
+    case 12:
+        return 2;
+    /* PCI slot 1 to 4 */
+    case 18 ... 21:
+        return ((slot - 18) + irq_num) & 0x03;
+    /* Unknown device, don't do any translation */
+    default:
+        return irq_num;
+    }
+}
+
 static void piix4_isa_reset(DeviceState *dev)
 {
     PIIX4State *d = PIIX4_PCI_DEVICE(dev);
@@ -265,31 +290,6 @@ static void piix4_register_types(void)
 
 type_init(piix4_register_types)
 
-static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
-{
-    int slot;
-
-    slot = PCI_SLOT(pci_dev->devfn);
-
-    switch (slot) {
-    /* PIIX4 USB */
-    case 10:
-        return 3;
-    /* AMD 79C973 Ethernet */
-    case 11:
-        return 1;
-    /* Crystal 4281 Sound */
-    case 12:
-        return 2;
-    /* PCI slot 1 to 4 */
-    case 18 ... 21:
-        return ((slot - 18) + irq_num) & 0x03;
-    /* Unknown device, don't do any translation */
-    default:
-        return irq_num;
-    }
-}
-
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 {
     PIIX4State *s;
-- 
2.36.1


