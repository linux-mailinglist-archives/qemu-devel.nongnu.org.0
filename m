Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4502C536BE1
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 11:25:11 +0200 (CEST)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nush4-0000Tl-3W
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 05:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscV-00062s-Vf
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:31 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscP-0003zy-K4
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KQg+1970Y2PfkdMya/hg3Fz13291p17BdTvgXxy/6Lk=; b=y9UaZmgauIYT3g4kuOtIDHgoVM
 wXktZqetThRxbQFh3TQKvUElRXR1wBSSdAYCzw/95xp/mYUP6mVY3bszWVCua3h9I3pzIWiK19HbO
 47Y9bVbs6nO3tMukc+18WKDEEMyOaIhEVtALLFVKs7rMWdSSOf6DvvbmhXA2639gF+h0Brim0Ip4d
 AZ3zl6ibXMa4Uv/L3B/EpFxX570WO51b4Jnmk15W8G2yEKmjlcWqdt4l7R3RLAhHJYjkxSj/xZdiW
 zoBbzPzQ+nBA3H2KwWWRjYNQHe15BpVT1wal64E0jTYQbWJkzMGIWePVwYyXf9a9YPA5mB0BvvdHY
 muShTAf2q+FfcAhYdbjXLO1Gh8Gtsmz+o5Sw/c28F8k5FD1LLCr1zEdvjAayezDpLvk0hj8SsYo/e
 BSUBoFfGG8yLXBguQMCanJ4bDrs573efdMSY403PWhKKIGCDweu1M+Aahcf+Ln3EEQ79YVOntqKXu
 aHlLvhg+2rXWPFBs3L8vs6DmkfC6AZ6fnRmkFjjm+B3cpPFWLnjcfaT47YHz2UfwFZfhTQAnyPGpY
 C7fyiTfbuYS1QCYxZsmYYnbxyuUjL9eGslGvVe7AyWx8Qq/OCZOpFztzgWTk7IvkZclbhmgHvx4uD
 5BVFGcc68nuOPYdMlz0hWUxdgsxN/+GEXP9A/XqRU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusb8-0003JL-Fp; Sat, 28 May 2022 10:19:06 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, hpoussin@reactos.org, qemu-devel@nongnu.org
Date: Sat, 28 May 2022 10:19:28 +0100
Message-Id: <20220528091934.15520-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 06/12] hw/acpi/piix4: rename piix4_pm_init() to
 piix4_pm_initfn()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When QOMifying a device it is typical to use _init() as the suffix for an
instance_init function, however this name is already in use by the legacy
piix4_pm_init() wrapper function. Eventually the wrapper function will be
removed, but for now rename it to piix4_pm_initfn() to avoid a naming
collision.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/acpi/piix4.c               | 6 +++---
 hw/i386/pc_piix.c             | 6 +++---
 hw/isa/piix4.c                | 6 +++---
 include/hw/southbridge/piix.h | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 05c129b6af..d897d2dee6 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -497,9 +497,9 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
     piix4_pm_add_properties(s);
 }
 
-PIIX4PMState *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                            qemu_irq sci_irq, qemu_irq smi_irq,
-                            int smm_enabled)
+PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
+                              qemu_irq sci_irq, qemu_irq smi_irq,
+                              int smm_enabled)
 {
     PCIDevice *pci_dev;
     DeviceState *dev;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0300be5ef4..ae21946981 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -285,9 +285,9 @@ static void pc_init1(MachineState *machine,
 
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
         /* TODO: Populate SPD eeprom data.  */
-        piix4_pm = piix4_pm_init(pci_bus, piix3_devfn + 3, 0xb100,
-                                 x86ms->gsi[9], smi_irq,
-                                 x86_machine_is_smm_enabled(x86ms));
+        piix4_pm = piix4_pm_initfn(pci_bus, piix3_devfn + 3, 0xb100,
+                                   x86ms->gsi[9], smi_irq,
+                                   x86_machine_is_smm_enabled(x86ms));
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
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
index 108800ab06..479d88e242 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -16,9 +16,9 @@
 #include "qom/object.h"
 #include "hw/acpi/piix4.h"
 
-PIIX4PMState *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                            qemu_irq sci_irq, qemu_irq smi_irq,
-                            int smm_enabled);
+PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
+                              qemu_irq sci_irq, qemu_irq smi_irq,
+                              int smm_enabled);
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
-- 
2.20.1


