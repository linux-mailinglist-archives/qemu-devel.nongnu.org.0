Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6DC53D1E9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 20:54:10 +0200 (CEST)
Received: from localhost ([::1]:49176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxCR0-0001TX-1o
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 14:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCO7-00078d-Tu
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:12 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCO5-000493-4q
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:11 -0400
Received: by mail-ej1-x629.google.com with SMTP id v1so6921289ejg.13
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 11:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hiYBO+N7jIAM2+stGie02AILzVrsGsOeOjsOm9ex25w=;
 b=qcSFa+CjdyGMu4BtneDS1h2fU58B07eDFJ8rHYvMuk2JngrnshtBe1WcDw2WQSLR82
 rhsis1SnnBUYeAghSPQcj/yQPBUdqWQH7oW7hPr25mDctykVfEGVjXSh98m3Plh2qjqK
 pOtpxVD6xmIEXKrBTQAdmzJ7phVw7VI7JoHLo/+pv+tgyF36dtWjqRAfjtDDFqlBAiiJ
 jDUTgpnYNeKlOqib1qv9j1sei6SNYM7Up+U6MVOrABFwzFT+tBYp523xK6clC/BwuuUI
 7H+xYsMRPRNluKKKVdhFAD5cRLiiVE6s6m0g/GlBh6Ja5SFHvcfQUwdwsIOXBb2c8WY3
 nE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hiYBO+N7jIAM2+stGie02AILzVrsGsOeOjsOm9ex25w=;
 b=PxbUlXIFklixBImtkM1OevK2l27zF2ogsubZZd32o6SShjD1miTOLImdFphX7EebRR
 B7vJftXJ6wqg0DWpzViMsOI6YcK0hfExGwiGh55thuHrJsyo0XggXmKISrufQ1X6qZ0D
 3n4+iy0tTGlrFwhECd6QxktJA6SFd/DsK0oqM/11creRed39KAD10KP1mXD6zp3s/ZZp
 7wb9Au0XSXuSCt8ACfTQOE8akQuYDVcIPjN/IbJ1GTmjfslu0UheyRcEmrQKrrPqpaGw
 NokgnuoU5WCQMnZ4J4kFUkQGT6ir44Wh/BDdSAWwKVOEGOxQ6uKGT8rGe8o3r6XsE8Ov
 kDxw==
X-Gm-Message-State: AOAM532IwYry8EXn1WPflrY7uTkGOHvGEsTXFK8/K6AKSr3OImStasfT
 PtU38Mn44SKoBRnaP6wv9er+YT7ukM2daw==
X-Google-Smtp-Source: ABdhPJxwqmGSFJq0Ksy9kB/6+H3mzMyjmReuUgs3RU/fOaN3pMJTr3y7s0KimZMCALYxoMKWdQ1K6w==
X-Received: by 2002:a17:907:3c81:b0:6e6:cf3e:6e14 with SMTP id
 gl1-20020a1709073c8100b006e6cf3e6e14mr10038017ejc.181.1654282267662; 
 Fri, 03 Jun 2022 11:51:07 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 f25-20020a170906139900b006fe8c831632sm3066160ejc.73.2022.06.03.11.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 11:51:07 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v4 05/11] hw/isa/piix4: Factor out ISABus retrieval from
 piix4_create()
Date: Fri,  3 Jun 2022 20:50:39 +0200
Message-Id: <20220603185045.143789-6-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603185045.143789-1-shentey@gmail.com>
References: <20220603185045.143789-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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

Modernizes the code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c                | 6 +-----
 hw/mips/malta.c               | 3 ++-
 include/hw/southbridge/piix.h | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 058bebb5e2..96df21a610 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -312,7 +312,7 @@ static void piix4_register_types(void)
 
 type_init(piix4_register_types)
 
-DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
+DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
 {
     PCIDevice *pci;
     DeviceState *dev;
@@ -322,10 +322,6 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                           TYPE_PIIX4_PCI_DEVICE);
     dev = DEVICE(pci);
 
-    if (isa_bus) {
-        *isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
-    }
-
     if (smbus) {
         pci = pci_new(devfn + 3, TYPE_PIIX4_PM);
         qdev_prop_set_uint32(DEVICE(pci), "smb_io_base", 0x1100);
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
index 3b97186f75..dab5c9704e 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -70,6 +70,6 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
 
 PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
 
-DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus);
+DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus);
 
 #endif
-- 
2.36.1


