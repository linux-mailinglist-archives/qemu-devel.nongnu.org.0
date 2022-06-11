Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6934754742B
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:18:32 +0200 (CEST)
Received: from localhost ([::1]:38264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzz8R-0003ex-Gu
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTF-0005nw-UO
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:57 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:41210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTE-0006jp-Dl
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:57 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 m125-20020a1ca383000000b0039c63fe5f64so785523wme.0
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NfeUOaEJG6DdO/79c/Jn/BCpB94zA5Bzp4nNGpsCT54=;
 b=RJPoFCIBe6OWOiehp1bmqhJFYmkckeKG2/TMVr0lPY/uEFWdBL+W0sZ2GYaVWU3TQk
 VTqFGIaRF3mmbSMu043K1X5NlP1t0JtDq+lojkoHiCnyLjoLQDLKJ/x1gpnOyUtDoz6c
 RnsPtgkCQOjCxNl5r8yUuobsW70eLs2LqAQRhe5N/q1fZvUiZg2CTQO8E5s1vH2mPRa8
 /ZUVd692X4M+kgpK5toCljLqeB0HGPIpYVNZeXh1OuHWpXF+z6OWlWW2MdG+lfpXlI1h
 NYoR4y5o8tG/0BlKI5L1oWZHt1NrHLds0VJuqovBCX+9PUOsfZNtQ366yNNbCWMdr6ov
 Kgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NfeUOaEJG6DdO/79c/Jn/BCpB94zA5Bzp4nNGpsCT54=;
 b=cQ+5HoaNquGTQwm7Fs5ncWjrsaSPx4dV70IbICrDolBJgBf7GNxjYAFzXqyHtz1s1l
 4UGSlOEFX4zYtrHWhAXI9bYutAaiw6hUFQFnkLiLMtSnDoUVx4v3ZciTKGCTpWoqW7o8
 qOnbgXhpZ+4B4jUNYytsvT5q8n7TepRT4ceviL6pQhmItVXqf4bkgi/cYAVMsXcA5grs
 8qPe7C/ck1Yu5wm0LjRTD0sQEouWaFZi5/oFl4RmxXCymaUeiTgrai41QAUrhNROuu1g
 yxUI9z1N+5uCpqdVC4MVGXSxU6+CTn0YEsqsRK8+JyVQ7RcvreOJ0kzA6oPOm5kJWBzZ
 dUuA==
X-Gm-Message-State: AOAM530mMutA0i2Qqc8uJRsSpiZOq38H+1GFsIGc/Ypio/4dFIjgfKQn
 pwaRyRTZkoxjxjNRBhT8ZYKK8FvufdI=
X-Google-Smtp-Source: ABdhPJzMm95nO6gKRkl/GJK69vb/IjT8PLN/lFwV1Rdj3o0HBPpD/yu4Ug3yqu9LObGOuwl8UA8cvw==
X-Received: by 2002:a1c:ed08:0:b0:39c:80b1:b0b3 with SMTP id
 l8-20020a1ced08000000b0039c80b1b0b3mr4187828wmh.134.1654943754273; 
 Sat, 11 Jun 2022 03:35:54 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 bg23-20020a05600c3c9700b0039c15861001sm7085454wmb.21.2022.06.11.03.35.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:35:53 -0700 (PDT)
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
Subject: [PULL 31/49] hw/isa/piix4: Factor out ISABus retrieval from
 piix4_create()
Date: Sat, 11 Jun 2022 12:32:54 +0200
Message-Id: <20220611103312.67773-32-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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

Modernizes the code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220603185045.143789-6-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


