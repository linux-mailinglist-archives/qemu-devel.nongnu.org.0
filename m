Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66208536E2F
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 21:28:44 +0200 (CEST)
Received: from localhost ([::1]:41384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nv279-00043D-D1
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 15:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv203-0003SP-KP; Sat, 28 May 2022 15:21:23 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv201-00021p-Vw; Sat, 28 May 2022 15:21:23 -0400
Received: by mail-wr1-x429.google.com with SMTP id t6so9900175wra.4;
 Sat, 28 May 2022 12:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yzNaTx0aMgeccdyf67H0y2ITcxtYJ5Qs4It2ffMqzsQ=;
 b=dYBW74+GzLXQNSAG6FnM0TktQoanoh6KPN4K84JMFDT1DXaOK2inTKlifRoXnQfRtP
 1e/0M274jqguBdlClpXHDRVYqW0XqJs0a9e9UrfxpcML0SYEubhFMEMPO67C6bcCRdy/
 tMEjRt8oXap3LraDFZFWgSGi24/v/b5+VMu5k0RxUzpB4eZYXgfvDHUkUGVP9spAzBOE
 5GxKsErzDaJrb0vKD56t5wSrERYhd4CXveNieIunYvKJBJdI/wopRuhUx7MbYvxYlBvY
 JpwFcFDrhE2v+f/V6Do4vWxMLRO70YBWmEW8I+tz4FxL1nLJwMDsepuQ+xa7yUDsdfAD
 otUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yzNaTx0aMgeccdyf67H0y2ITcxtYJ5Qs4It2ffMqzsQ=;
 b=lpgOxwik1JUOWEy0L785yqjcenS3cSKocLwFE4pW9Bz07jzrOLuMLnY2dBH6xm8k1e
 1Gq35cUrMN1PDq+x+kBHeb7H74v5SRgfKajru6hzuhiUy786IP4fb8wlo/m0curFAu4V
 231mTZdi44aqATnHN1lH8fCfh74cghP9JtqPtS8mxxBOwwfIfeEaJlmsj/QFyTZqrial
 +vbcS3JxhshCJDArfu9Y6T3zjN3jm6bN9YKU8BycAQ1Zvi7tDhKAT07wxpkLVn34E1Kh
 bRg2MzkF7R0abfeEr7iIZVe5C5/TOmAF+K0xryHtNzzdcClevkrF79RJhwjWFEi0yi94
 PsLA==
X-Gm-Message-State: AOAM532fPiC06lRMIWuNFpRU3NZ4BhgxWe9aR9QNLj76yGL+la++243s
 auu3ZGqD8BaOSEzrk7GdOn6QvCdfrUdXg8Tbpys=
X-Google-Smtp-Source: ABdhPJz4fM2o0gCR56xTfRMtF8Vfkcin9mgZlTJYhBXv/YoPGCxEg6kRPXs9a+hLA3nSK3lF41VZug==
X-Received: by 2002:adf:f905:0:b0:20f:ca3e:387f with SMTP id
 b5-20020adff905000000b0020fca3e387fmr31311581wrr.362.1653765680012; 
 Sat, 28 May 2022 12:21:20 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c069500b003942a244ed7sm5341022wmn.28.2022.05.28.12.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 May 2022 12:21:19 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v3 3/7] hw/isa/piix{3,
 4}: Move pci_map_irq_fn's near pci_set_irq_fn's
Date: Sat, 28 May 2022 21:20:52 +0200
Message-Id: <20220528192057.30910-4-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220528192057.30910-1-shentey@gmail.com>
References: <20220528192057.30910-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x429.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 1d04fb6a55..18aa24424f 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -74,6 +74,31 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
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
@@ -266,31 +291,6 @@ static void piix4_register_types(void)
 
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


