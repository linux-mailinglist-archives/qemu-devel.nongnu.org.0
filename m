Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1B75A6DB2
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:45:00 +0200 (CEST)
Received: from localhost ([::1]:55740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT7AR-00021s-Ll
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6U7-0002z5-Oi; Tue, 30 Aug 2022 15:01:15 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6U5-0008Px-8K; Tue, 30 Aug 2022 15:01:15 -0400
Received: by mail-wr1-x434.google.com with SMTP id m16so15416081wru.9;
 Tue, 30 Aug 2022 12:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=tfjpe0kq5Hqkrre7mfBlqhm29F5/cPJTQ5XTLa09A84=;
 b=eOeNsH8K41tkz/6zpSHEsRuQy4gmv0LLrFaaQPD4kJgok53EenZjKGW5U7kIGPZKG6
 2wbSkXBStMjDrH0B8PiW2rKMmF3iCl5MZXSa1UK5+nZCifRsOzgSGRBd1Pd9Psw8T6VY
 jllAjBjEBEsF47Fg80iBT2qeXLVEq3LKMbF/OUQYNmR0gBME/RooGE+TgeeSkM6YmqpY
 4SlYiJd+4xo5mNiP25xq6csWEq6dmUmukaBpzrflKACOgO/kFzOJBiJFPF4hl1aj277a
 gETCrpuF+6anPsA/EoyIDPRMFMYLBe4KQ8Lm4QdBvn6cdI/itXHXWI4fICIO+Y+i7O31
 bz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=tfjpe0kq5Hqkrre7mfBlqhm29F5/cPJTQ5XTLa09A84=;
 b=7B7qPXQnYXzUX0ArDrjPLnXMK+LrFE0aT6E8zBwhZtn9aUchetgeLOzftiwe0QoTfg
 RpPF0MXa+hJVTFlB3Px8CFLqIIF9yb6j09UFICpyBBgXsEfauBIuP3tSme33aHwqUFu+
 Ft/OtOcaLpFUAz+3dIEwrRtAEjUxyyPTRUtjHBqV9rCgmPW+db8Ag90tKPZ4cxmsIxwl
 yFwWfDnkPPkUGMobNpZyBIW53oLxY/uNL2KrRQVcPfVLQH0p4g+fnsAGMlQJyYTutR5a
 Sg8BHq/YBC47sOZTv32p03wW1x3XuguAf2Xp6bh3Dh/HgNJENbCw8N3PBUEIaINgkoNJ
 6dCw==
X-Gm-Message-State: ACgBeo0hEZhixeYQ+1/XD0TincZYo1y8rNa5daq2S3giBc4j7/bh1gj1
 bYvsk51yC0x7RMjvTEIJ/dgGuQKHslU=
X-Google-Smtp-Source: AA6agR5DPe59namO6iGM/LMidoCsi741yv94jjOmPI7z+8Idi+NebIWdVxEe7h+teafVyhCQuVIq8Q==
X-Received: by 2002:a05:6000:68c:b0:226:e12f:6ec8 with SMTP id
 bo12-20020a056000068c00b00226e12f6ec8mr2977434wrb.681.1661886069449; 
 Tue, 30 Aug 2022 12:01:09 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adfea52000000b002206203ed3dsm9821285wrn.29.2022.08.30.12.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 12:01:08 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 02/10] hw/isa/vt82c686: Resolve unneeded attribute
Date: Tue, 30 Aug 2022 21:00:40 +0200
Message-Id: <20220830190048.67448-3-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830190048.67448-1-shentey@gmail.com>
References: <20220830190048.67448-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x434.google.com
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

Now that also the super io device is realized in the common realize method,
the isa_bus attribute can be turned into a temporary.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 0217c98fe4..9d12e1cae4 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -543,7 +543,6 @@ struct ViaISAState {
     PCIDevice dev;
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs;
-    ISABus *isa_bus;
     ViaSuperIOState via_sio;
 };
 
@@ -585,17 +584,18 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     ViaISAState *s = VIA_ISA(d);
     DeviceState *dev = DEVICE(d);
     qemu_irq *isa_irq;
+    ISABus *isa_bus;
     int i;
 
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
-    s->isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
+    isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
                           &error_fatal);
-    s->isa_irqs = i8259_init(s->isa_bus, *isa_irq);
-    isa_bus_irqs(s->isa_bus, s->isa_irqs);
-    i8254_pit_init(s->isa_bus, 0x40, 0, NULL);
-    i8257_dma_init(s->isa_bus, 0);
-    mc146818_rtc_init(s->isa_bus, 2000, NULL);
+    s->isa_irqs = i8259_init(isa_bus, *isa_irq);
+    isa_bus_irqs(isa_bus, s->isa_irqs);
+    i8254_pit_init(isa_bus, 0x40, 0, NULL);
+    i8257_dma_init(isa_bus, 0);
+    mc146818_rtc_init(isa_bus, 2000, NULL);
 
     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
         if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
@@ -604,7 +604,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     }
 
     /* Super I/O */
-    if (!qdev_realize(DEVICE(&s->via_sio), BUS(s->isa_bus), errp)) {
+    if (!qdev_realize(DEVICE(&s->via_sio), BUS(isa_bus), errp)) {
         return;
     }
 }
-- 
2.37.2


