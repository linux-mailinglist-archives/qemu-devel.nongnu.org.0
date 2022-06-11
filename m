Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EB5547427
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:15:41 +0200 (CEST)
Received: from localhost ([::1]:32986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzz5f-0006z2-20
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySQ-0004nk-2m
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:06 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySO-0006Re-EV
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:05 -0400
Received: by mail-wr1-x433.google.com with SMTP id o8so1497575wro.3
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QtthewnhJjnvXmzUB1KbViQi6psKm9rJ21+vAD8TbEc=;
 b=TnzrWe2krVmv+X5UzXs5qgOtbCoFhVdgxXHbwoeteCFIGPoAuirZkEQ7tLJGcluMqr
 QvGCduqUqzBCZ6trausNQRHCqBOtXe5QVTyScEQQ6RSPk3IXiwR66cUca5DLW+e270hl
 g0mF1riqyG6eNNrjEXUGosQacqBvsuMfI3Fr2BOpTw82wYatmaU/mC/DoJTnJxUiI83g
 9RQ//P9x/FDpvxbEcFTpJOgXKKYi9O3q+xiV0gvl3bXFeA2orT81sy4bUHL3DY5+MQNs
 9OPsDRCzONoO41pmE96J5JCvEv/NbNdzM5IEfeiErLRlAZQC95VZ6oydaBRiqQEcWqng
 dQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QtthewnhJjnvXmzUB1KbViQi6psKm9rJ21+vAD8TbEc=;
 b=6KNyDLfW220AEqdl3uEzECKgamOrTFhJa08VXD2SJHJnKZAjsWXqo23tN7JuTrqMRF
 IWWvMXAx6MxWhoitauACZDpqMkkl6+V9nL4VnvCfyNIX7FoE8/rl8a6gv+SxTYApcnUy
 qFjsV1VUYGqF//ffhaSKOoN6vaFsCWZe6vGz06xkPJBT3W8ALwp0hfbAG9qs00lB7rBn
 2h6Dr/+ToqE1zJVO5vGMDKuGgyJEkxZ4o7Ycaa4xFG/ZmJe6twye4/DFOGlEHmsT51aT
 WkSEec9B96WpQlrGQuPioa5qDhAHd9hbrb+ggelQqywtrW5iyRPrrEswa/kLEtzjnZOW
 mAfQ==
X-Gm-Message-State: AOAM532QCFACYOzPEwcrOLfue1V+MwrEc6SvAq9LNGpg4b+XuMsdLKCc
 O6Ro7nPiBHBk/MEtRZ9E9hSnJycnFf4=
X-Google-Smtp-Source: ABdhPJxmBezNh2ieXx0WeR8/dbTlwu/Oj74HVzmA66tspPFWvipcpGoLJ87YjWVX79tyGO4hE20MJg==
X-Received: by 2002:adf:ea87:0:b0:211:68d:7c93 with SMTP id
 s7-20020adfea87000000b00211068d7c93mr47285080wrm.412.1654943702864; 
 Sat, 11 Jun 2022 03:35:02 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 i7-20020a1c3b07000000b0039744bd664esm6346760wma.13.2022.06.11.03.35.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:35:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 21/49] hw/acpi/piix4: rename piix4_pm_init() to
 piix4_pm_initfn()
Date: Sat, 11 Jun 2022 12:32:44 +0200
Message-Id: <20220611103312.67773-22-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

When QOMifying a device it is typical to use _init() as the suffix for an
instance_init function, however this name is already in use by the legacy
piix4_pm_init() wrapper function. Eventually the wrapper function will be
removed, but for now rename it to piix4_pm_initfn() to avoid a naming
collision.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220528091934.15520-7-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/piix4.c               | 6 +++---
 hw/i386/pc_piix.c             | 6 +++---
 hw/isa/piix4.c                | 6 +++---
 include/hw/southbridge/piix.h | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index c4cfb75020..418ec4ee56 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -497,9 +497,9 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
     piix4_pm_add_properties(s);
 }
 
-PIIX4PMState *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                            qemu_irq sci_irq, qemu_irq smi_irq,
-                            bool smm_enabled)
+PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
+                              qemu_irq sci_irq, qemu_irq smi_irq,
+                              bool smm_enabled)
 {
     PCIDevice *pci_dev;
     DeviceState *dev;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 3359b40f54..fde0fdc088 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -283,9 +283,9 @@ static void pc_init1(MachineState *machine,
         PIIX4PMState *piix4_pm;
 
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
-        piix4_pm = piix4_pm_init(pci_bus, piix3_devfn + 3, 0xb100,
-                                 x86ms->gsi[9], smi_irq,
-                                 x86_machine_is_smm_enabled(x86ms));
+        piix4_pm = piix4_pm_initfn(pci_bus, piix3_devfn + 3, 0xb100,
+                                   x86ms->gsi[9], smi_irq,
+                                   x86_machine_is_smm_enabled(x86ms));
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         /* TODO: Populate SPD eeprom data.  */
         smbus_eeprom_init(pcms->smbus, 8, NULL, 0);
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 7d9bedd1bb..33a7015ea3 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -311,9 +311,9 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 
     pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
     if (smbus) {
-        pms = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
-                            qdev_get_gpio_in_named(dev, "isa", 9),
-                            NULL, 0);
+        pms = piix4_pm_initfn(pci_bus, devfn + 3, 0x1100,
+                              qdev_get_gpio_in_named(dev, "isa", 9),
+                              NULL, 0);
         *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pms), "i2c"));
     }
 
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index a362ec7484..f75a4adf5f 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -16,9 +16,9 @@
 #include "qom/object.h"
 #include "hw/acpi/piix4.h"
 
-PIIX4PMState *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                            qemu_irq sci_irq, qemu_irq smi_irq,
-                            bool smm_enabled);
+PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
+                              qemu_irq sci_irq, qemu_irq smi_irq,
+                              bool smm_enabled);
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
-- 
2.36.1


