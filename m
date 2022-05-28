Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EE4536E30
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 21:29:00 +0200 (CEST)
Received: from localhost ([::1]:41682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nv27O-0004FN-KO
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 15:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv207-0003dy-RQ; Sat, 28 May 2022 15:21:31 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv205-00022m-2w; Sat, 28 May 2022 15:21:27 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 v4-20020a1cac04000000b00397001398c0so6319899wme.5; 
 Sat, 28 May 2022 12:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PwnwYB4z8vFCQUSHuvjEku5cFceBNsmjPR2koNRZLUY=;
 b=f14xpZcdJyIz4Z9Lo2kP/oYYEzxaPGpYKTpZkgjRdO/n9OEY5nFnqJRvDZ/ZKpR7Dg
 op6Hy5xyxVLD5XIv434LT5Bs/Wi2ELsO4Np77mSxT6D0+g4E26+h/ycmQi2TH71k5otd
 e0DEQ6BkDMoc247RMFZBaSz7kKw+aLGMzCJ8pb/4hf8rju3PDTTyufy5cdDV+aalrFRj
 Jt7XIY0CC/z/LhR4wk4Wz2eU9b9hoeS/KQBkvPsXHeTnSzetUd1Cv422iPsjt+9ko8TE
 g6nZS2P7ckkWQSWAUcipxvl4SL/JZUEPwuoElIBRNebSQKFsrXa/0nqW/wxAkgk5iHQ7
 0WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PwnwYB4z8vFCQUSHuvjEku5cFceBNsmjPR2koNRZLUY=;
 b=ZReVvj8+l2tVMj4vY9fPh7GW+tV1lQr89IVaHwWUveTOBJ/rN/In1IySk6rKiN+x3F
 fqkA97V8wPF836Ax4Y+Hv5wetCutZrT1NizKdarnE/A13uqFVkbnHi54hDhtceXeaZhC
 CWPks/lN85upnmxPXqrD6BOnqizEiUePAEJ7cvWI23U9VoXr6uxNw1x6gBTvXfnsHvxG
 db2YHmzPWU1fAHyVp31lAUG262fzWyNWpgyNamtx4q1L1MgzUNvzK/sWSEbdg9FD34qi
 dzhi7247QFZqHYKiCZEyyxxMFLazSlCod7s57iAiof0+MWp8jglpSszpTbXCE01sEHHr
 Qjxg==
X-Gm-Message-State: AOAM532rbtHdD3evVzF0o1raTMzT6JBZTiTru+4tSZXIu83XNA8xKf4w
 CpctRfAJfcbblwnGtKsMaV6O7UEfwLnd7KrBJXU=
X-Google-Smtp-Source: ABdhPJxOFxpiQOXPW6ZcEJoO7WO75UItxuDLy0WvZdbpBJjwVy4988ROVBrjwo0++Fj+ggQlzmuM/g==
X-Received: by 2002:a1c:f710:0:b0:394:1960:e8a1 with SMTP id
 v16-20020a1cf710000000b003941960e8a1mr12301307wmh.154.1653765683325; 
 Sat, 28 May 2022 12:21:23 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c069500b003942a244ed7sm5341022wmn.28.2022.05.28.12.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 May 2022 12:21:22 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v3 5/7] hw/isa/piix{3,
 4}: Factor out ISABus retrieval from create() functions
Date: Sat, 28 May 2022 21:20:54 +0200
Message-Id: <20220528192057.30910-6-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220528192057.30910-1-shentey@gmail.com>
References: <20220528192057.30910-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32a.google.com
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
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/pc_piix.c             | 3 ++-
 hw/isa/piix3.c                | 3 +--
 hw/isa/piix4.c                | 6 +-----
 hw/mips/malta.c               | 3 ++-
 include/hw/southbridge/piix.h | 4 ++--
 5 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 4120fd52e5..9d2076a7ca 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -207,9 +207,10 @@ static void pc_init1(MachineState *machine,
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
index de532cc692..c6ff7795f4 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -400,7 +400,7 @@ static void piix3_register_types(void)
 
 type_init(piix3_register_types)
 
-PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
+PIIX3State *piix3_create(PCIBus *pci_bus)
 {
     PIIX3State *piix3;
     PCIDevice *pci_dev;
@@ -409,7 +409,6 @@ PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
 
     pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
     piix3 = PIIX3_PCI_DEVICE(pci_dev);
-    *isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
 
     return piix3;
 }
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
index 3b97186f75..0a2ef0c7b6 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -68,8 +68,8 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
 #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
 #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
 
-PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
+PIIX3State *piix3_create(PCIBus *pci_bus);
 
-DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus);
+DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus);
 
 #endif
-- 
2.36.1


