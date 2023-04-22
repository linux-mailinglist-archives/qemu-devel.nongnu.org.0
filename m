Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EF56EB9DD
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 17:09:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqEq7-0001wq-4S; Sat, 22 Apr 2023 11:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq5-0001wD-5J; Sat, 22 Apr 2023 11:07:49 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq3-0005C3-Ap; Sat, 22 Apr 2023 11:07:48 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-504efe702d5so3919119a12.3; 
 Sat, 22 Apr 2023 08:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682176064; x=1684768064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HkLmNhZ+fhH8L3OAyZni6YveTovxdb3jktNHmfBvQ0c=;
 b=Yzj+XkBnq2EqUuDri3p+IM4L/5q3H57LAXvJm8j+slrup6SFa/rYhP0MSF/Y6q48sG
 /hwxq6nemZgH/HGtK94lhU5lLam1haTdqyAKiErnf944loYOFrBpF26Y7cPE2JTQSAfj
 kugjO2DMYTYo8AHUkbyZ1xwm1XLHdu7gn7PeK/osyon/3eL6I65YF/9jcN9mVX2Jpe+D
 euPiJrP2l2ZVc1s4FpUv9J8DK/lGFswul3o95O6l9HKF/PGwy1tA9DmHRtdL5i1LJ7jD
 tsfy5uXmpiO7Pqvr+QCBgKajsyySOKqhRzQsPyGRItpKGiGNGCBw9SM7z7E9+w10LiwK
 Ydcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682176064; x=1684768064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HkLmNhZ+fhH8L3OAyZni6YveTovxdb3jktNHmfBvQ0c=;
 b=bANfF7LKh1Ro/thUlQayBJDhn796mB89XTphN8UNCoSPzZ2CeqLONqz6xz0d6l5dps
 QC30mnT/4ERC9K6E9lt/5xIz9A3v0BtHEPxAxlaNFW/J2AKqkK9XaiBBnE1nkqMSXySX
 8RBBAWDwHYQHFU60R2aSri/xyGIlpAowPTObnK5617GZaqrE7KHfE0QCyxdMOklvAc+e
 HhELVTJhNoOBq5A0b3Szg/bFqOY6jiisVoaRTWcfZquK3VqDobqkan57WiWZfVJqAbxs
 PMMeWpkTg/PUYe0HKPlAiZsBaibRKW1cF4/1bjn1EQw2t2oNXOVyd5hiOdb0rdFnZC0o
 bZnw==
X-Gm-Message-State: AAQBX9fembHgynJdEpArtCWf5693nBTQSKcp7M+Tvwa49gehEhRTM5hQ
 6Bbi4YSiWzr1/UnUlYPkDqdLKB+Rufo=
X-Google-Smtp-Source: AKy350bdOUWH6+nkbcu8bgYon9HQoEOxjCSoW670CHnDzbQMmEPECLLG9oIoXOdog9UpRDhBn0CuEQ==
X-Received: by 2002:a17:907:9143:b0:953:7bb2:28d8 with SMTP id
 l3-20020a170907914300b009537bb228d8mr4585142ejs.21.1682176064614; 
 Sat, 22 Apr 2023 08:07:44 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-191-017-015.77.191.pool.telefonica.de. [77.191.17.15])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906844700b0094f7b713e40sm3300108ejy.126.2023.04.22.08.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 08:07:44 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 08/13] hw/ide: Rename PCIIDEState::*_bar attributes
Date: Sat, 22 Apr 2023 17:07:23 +0200
Message-Id: <20230422150728.176512-9-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422150728.176512-1-shentey@gmail.com>
References: <20230422150728.176512-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The attributes represent memory regions containing operations which are mapped
by the device models into PCI BARs. Reflect this by changing the suffic into
"_ops".

Note that in a few commits piix will also use the {cmd,data}_ops but won't map
them into BARs. This further suggests that the "_bar" suffix doesn't match
very well.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/ide/pci.h |  6 +++---
 hw/ide/cmd646.c      | 10 +++++-----
 hw/ide/pci.c         | 18 +++++++++---------
 hw/ide/piix.c        |  2 +-
 hw/ide/via.c         | 10 +++++-----
 5 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index 597c77c7ad..5025df5b82 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -51,9 +51,9 @@ struct PCIIDEState {
     BMDMAState bmdma[2];
     qemu_irq isa_irq[2];
     uint32_t secondary; /* used only for cmd646 */
-    MemoryRegion bmdma_bar;
-    MemoryRegion cmd_bar[2];
-    MemoryRegion data_bar[2];
+    MemoryRegion bmdma_ops;
+    MemoryRegion cmd_ops[2];
+    MemoryRegion data_ops[2];
 };
 
 void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index 85716aaf17..b9d005a357 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -251,13 +251,13 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
     dev->wmask[MRDMODE] = 0x0;
     dev->w1cmask[MRDMODE] = MRDMODE_INTR_CH0 | MRDMODE_INTR_CH1;
 
-    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[0]);
-    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[0]);
-    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[1]);
-    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
+    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_ops[0]);
+    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_ops[0]);
+    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_ops[1]);
+    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_ops[1]);
 
     bmdma_init_ops(d, &cmd646_bmdma_ops);
-    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
+    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_ops);
 
     /* TODO: RST# value should be 0 */
     pci_conf[PCI_INTERRUPT_PIN] = 0x01; // interrupt on pin 1
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index a9194313bd..b2fcc00a64 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -527,15 +527,15 @@ void bmdma_init_ops(PCIIDEState *d, const MemoryRegionOps *bmdma_ops)
 {
     size_t i;
 
-    memory_region_init(&d->bmdma_bar, OBJECT(d), "bmdma-container", 16);
+    memory_region_init(&d->bmdma_ops, OBJECT(d), "bmdma-container", 16);
     for (i = 0; i < ARRAY_SIZE(d->bmdma); i++) {
         BMDMAState *bm = &d->bmdma[i];
 
         memory_region_init_io(&bm->extra_io, OBJECT(d), bmdma_ops, bm, "bmdma-ops", 4);
-        memory_region_add_subregion(&d->bmdma_bar, i * 8, &bm->extra_io);
+        memory_region_add_subregion(&d->bmdma_ops, i * 8, &bm->extra_io);
         memory_region_init_io(&bm->addr_ioport, OBJECT(d), &bmdma_addr_ioport_ops, bm,
                               "bmdma-ioport-ops", 4);
-        memory_region_add_subregion(&d->bmdma_bar, i * 8 + 4, &bm->addr_ioport);
+        memory_region_add_subregion(&d->bmdma_ops, i * 8 + 4, &bm->addr_ioport);
     }
 }
 
@@ -543,14 +543,14 @@ static void pci_ide_init(Object *obj)
 {
     PCIIDEState *d = PCI_IDE(obj);
 
-    memory_region_init_io(&d->data_bar[0], OBJECT(d), &pci_ide_data_le_ops,
+    memory_region_init_io(&d->data_ops[0], OBJECT(d), &pci_ide_data_le_ops,
                           &d->bus[0], "pci-ide0-data-ops", 8);
-    memory_region_init_io(&d->cmd_bar[0], OBJECT(d), &pci_ide_cmd_le_ops,
+    memory_region_init_io(&d->cmd_ops[0], OBJECT(d), &pci_ide_cmd_le_ops,
                           &d->bus[0], "pci-ide0-cmd-ops", 4);
 
-    memory_region_init_io(&d->data_bar[1], OBJECT(d), &pci_ide_data_le_ops,
+    memory_region_init_io(&d->data_ops[1], OBJECT(d), &pci_ide_data_le_ops,
                           &d->bus[1], "pci-ide1-data-ops", 8);
-    memory_region_init_io(&d->cmd_bar[1], OBJECT(d), &pci_ide_cmd_le_ops,
+    memory_region_init_io(&d->cmd_ops[1], OBJECT(d), &pci_ide_cmd_le_ops,
                           &d->bus[1], "pci-ide1-cmd-ops", 4);
 
     qdev_init_gpio_out(DEVICE(d), d->isa_irq, ARRAY_SIZE(d->isa_irq));
@@ -562,8 +562,8 @@ static void pci_ide_exitfn(PCIDevice *dev)
     unsigned i;
 
     for (i = 0; i < ARRAY_SIZE(d->bmdma); ++i) {
-        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].extra_io);
-        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].addr_ioport);
+        memory_region_del_subregion(&d->bmdma_ops, &d->bmdma[i].extra_io);
+        memory_region_del_subregion(&d->bmdma_ops, &d->bmdma[i].addr_ioport);
     }
 }
 
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 5611473d37..6942b484f9 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -140,7 +140,7 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
 
     bmdma_init_ops(d, &piix_bmdma_ops);
-    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
+    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_ops);
 
     for (unsigned i = 0; i < 2; i++) {
         if (!pci_piix_init_bus(d, i, errp)) {
diff --git a/hw/ide/via.c b/hw/ide/via.c
index 704a8024cb..35dd97e49b 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -154,13 +154,13 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
     dev->wmask[PCI_INTERRUPT_LINE] = 0;
     dev->wmask[PCI_CLASS_PROG] = 5;
 
-    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[0]);
-    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[0]);
-    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[1]);
-    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
+    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_ops[0]);
+    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_ops[0]);
+    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_ops[1]);
+    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_ops[1]);
 
     bmdma_init_ops(d, &via_bmdma_ops);
-    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
+    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_ops);
 
     qdev_init_gpio_in(ds, via_ide_set_irq, ARRAY_SIZE(d->bus));
     for (i = 0; i < ARRAY_SIZE(d->bus); i++) {
-- 
2.40.0


