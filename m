Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7BF547432
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:22:24 +0200 (CEST)
Received: from localhost ([::1]:50104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzCB-0003AJ-Jz
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyT5-0005ZB-6C
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:50 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyT3-0006hp-L2
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:46 -0400
Received: by mail-wr1-x430.google.com with SMTP id p10so1450559wrg.12
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oZzVRGGAd0INWHy8SWgdbg6oLFPj3BVJRyqm8wOYtzI=;
 b=m0OV7QB3kfeiueXovHmtzRQr1gcPGgpyPmNgbxPz3kcXEc4/2+CPSaR+zWfrZIMiv7
 Fc+TWs/msITEJMicaoVUKeiVnCRWwipzKGhZ0Ry5KMTa8+JzMphAE1AL5OCCJAX5fQtV
 MDNb82mM/HkYMvQLseIaII9drgFSuNChF98TtCrNspbSQkI95sM2yJwwNLE9D2n9wXOv
 EOUMiAq/epg4Wd7BcWIpxzNhkA/jCCAJQhcbDyDRQZJGDa8yrYMv13jW0VdkD+ATpJwT
 R0fsvhk2MRVykEiXXuek3cE/0gnWd+HOMbA9Mhvg1s7g85mmOEKZPN54Hje2aoiFm19V
 3Fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oZzVRGGAd0INWHy8SWgdbg6oLFPj3BVJRyqm8wOYtzI=;
 b=Sigxn/79WrH7sn7QXcYPc6FSp4+gnLogg78VMneOt8VElGP5R5NUibfCqD9Q4gLpAc
 PeXeTeR13lmcwZ2r0orAqK5Gh9+JHoq/cwo93icQ0t35GGAvpM37aiHNGhQIHhZoczBo
 j+GJ0o4VWkirNF/SoDhS+NYPro9z1bJN1uVpbZ3R/Lhkj+rVpPOUHYU9mt7uJAjYZ+v+
 UU5BaeS4Nimisb91aM6kyzKtKLXfozN+tKl7X+Ed5AVFB1QQZYXkcnRm6tRKfBFuWmV3
 jc7XZ8hbWMnsapdlRB8yKRpcSvLA+Y3GTk2Lk3KJ44i4NAzgK0pEiHMZF0YuPkxuOHgf
 dVSQ==
X-Gm-Message-State: AOAM530oZuA0Fz69x6LlJZuXWsW00bd4yCo9QEuLOGUfai2SEc2Q/wz4
 k9Df3pztsI3PWwPrx284fCZF66Ik2BE=
X-Google-Smtp-Source: ABdhPJyTh8PU+MlL3+5yfFIXrwAXCtLKtdjxjtnyvsa2hqatFPtP8EAccUdVRIlrGBa1sqNOXBPJUA==
X-Received: by 2002:a5d:5984:0:b0:219:e396:d3d1 with SMTP id
 n4-20020a5d5984000000b00219e396d3d1mr9203073wri.701.1654943743919; 
 Sat, 11 Jun 2022 03:35:43 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 m185-20020a1c26c2000000b003974d0d981dsm5910951wmm.35.2022.06.11.03.35.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:35:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 29/49] hw/isa/piix4: Move pci_map_irq_fn' near pci_set_irq_fn
Date: Sat, 11 Jun 2022 12:32:52 +0200
Message-Id: <20220611103312.67773-30-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

The pci_map_irq_fn was implemented below type_init() which made it
inaccessible to QOM functions. So move it up.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220603185045.143789-4-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 50 +++++++++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

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


