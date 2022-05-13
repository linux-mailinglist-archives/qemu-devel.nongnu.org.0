Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9B05268EB
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:02:35 +0200 (CEST)
Received: from localhost ([::1]:50170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZcX-0001VX-Sx
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZVI-0008EB-MW; Fri, 13 May 2022 13:55:04 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZVG-0004jc-E1; Fri, 13 May 2022 13:55:04 -0400
Received: by mail-ej1-x62c.google.com with SMTP id g6so17708159ejw.1;
 Fri, 13 May 2022 10:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A1yyBpizKMCGcb3fhqNS4fuitTkria8ssvztwvpY8mY=;
 b=RJtgbqxqWeZu6zo0rzw1xyfoi9ktNXJ1pLJvGvXll5cpgj3WhfHbin5AQddZrpnTQJ
 QnUoHGs3AkL5A3seCCqXM6p2rd3pggSOhaTOTYFelm8NrnAYOjUmkChDl3DGtQev8csy
 mI1Ehc76OEiltEnhH6w2B03+tkSvP09/e9KazBwPcEdICpOel2LENVCidgQkVPFXjaft
 tsiOuUs2rSgUxWSC23xJL4W3XV6mqw2i6qoYnyf1wVFchErzpDHao/IIK4yFMLt9Gg4C
 UhziGqV86GZi6rFhuRE2bY5XHN/x/00lvgpHvoo7l6sW2NHhSJH/PLkGLUQSVXpTVjE1
 pr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A1yyBpizKMCGcb3fhqNS4fuitTkria8ssvztwvpY8mY=;
 b=A5v4zJuY4pYQGtFsTlM1prG0uDybuuxCl6SIPdPt6oNt+1HCTWG5tihFmHUIuNuour
 CDaxr4+L/UF5n6+4/XFSZca232dXDT0LVKseRZTT/o1csnW5njG+N5bFNcKXEwNLuata
 K8kLB3z4fXWEaKYwroiaUZ50ZIeKU8PxHAK3a/CVI5Hr9ju5bSLXvnVXqE0a+7R0j24G
 7DSJ0Ja+OKkivGmKQ+kn3LvJ5E6DFjyu0zoDsR4sC11w5kc6ReEYA+sUP/26s1+FBjem
 RJyCe+GfE2mKxD+U6fzcw1hNtgbXIjMBJQr//dJEhLR6Qe4yEt47u6AnyOkNEAzSsqI7
 KZIA==
X-Gm-Message-State: AOAM532h+Qvr+rfjO9VU9R43VvW9M9q/hMQtw66FE9FI79+Bmy5fre3r
 WS8EPSo2ptahniAQo84T0Dd4M0eGtmg=
X-Google-Smtp-Source: ABdhPJyGVwZK/pKVzu/8q+GuQ/E2gR3BJS3eli2FaZDbQZTNrBski/0T4aXZclIEfJZuawpgtDiarQ==
X-Received: by 2002:a17:906:fad6:b0:6f3:9ea7:1d49 with SMTP id
 lu22-20020a170906fad600b006f39ea71d49mr5176790ejb.635.1652464500495; 
 Fri, 13 May 2022 10:55:00 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-014-181-123.89.14.pool.telefonica.de. [89.14.181.123])
 by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b006f3ef214e3esm953874ejc.164.2022.05.13.10.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 10:55:00 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH 4/6] hw/isa/piix{3,
 4}: Factor out ISABus retrieval from create() functions
Date: Fri, 13 May 2022 19:54:43 +0200
Message-Id: <20220513175445.89616-5-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513175445.89616-1-shentey@gmail.com>
References: <20220513175445.89616-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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

Modernizes the code and even saves a few lines.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c             | 3 ++-
 hw/isa/piix3.c                | 3 +--
 hw/isa/piix4.c                | 6 +-----
 hw/mips/malta.c               | 3 ++-
 include/hw/southbridge/piix.h | 4 ++--
 5 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index f843dd906f..47932448fd 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -206,9 +206,10 @@ static void pc_init1(MachineState *machine,
                               pci_memory, ram_memory);
         pcms->bus = pci_bus;
 
-        piix3 = piix3_create(pci_bus, &isa_bus);
+        piix3 = piix3_create(pci_bus);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
+        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
     } else {
         pci_bus = NULL;
         i440fx_state = NULL;
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index d15117a7c7..6eacb22dd0 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -403,7 +403,7 @@ static void piix3_register_types(void)
 
 type_init(piix3_register_types)
 
-PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
+PIIX3State *piix3_create(PCIBus *pci_bus)
 {
     PIIX3State *piix3;
     PCIDevice *pci_dev;
@@ -412,7 +412,6 @@ PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
 
     pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
     piix3 = PIIX3_PCI_DEVICE(pci_dev);
-    *isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
 
     return piix3;
 }
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 134d23aea7..4968c69da9 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -301,7 +301,7 @@ static void piix4_register_types(void)
 
 type_init(piix4_register_types)
 
-DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
+DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
 {
     PCIDevice *pci;
     DeviceState *dev;
@@ -311,10 +311,6 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                           TYPE_PIIX4_PCI_DEVICE);
     dev = DEVICE(pci);
 
-    if (isa_bus) {
-        *isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
-    }
-
     if (smbus) {
         *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
                                qdev_get_gpio_in_named(dev, "isa", 9),
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9ffdc5b8f1..e446b25ad0 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1399,7 +1399,8 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    dev = piix4_create(pci_bus, &isa_bus, &smbus);
+    dev = piix4_create(pci_bus, &smbus);
+    isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
 
     /* Interrupt controller */
     qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index a304fc6041..b768109f30 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -72,8 +72,8 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
 
 #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
 
-PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
+PIIX3State *piix3_create(PCIBus *pci_bus);
 
-DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus);
+DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus);
 
 #endif
-- 
2.36.1


