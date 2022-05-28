Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE44536C28
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 11:51:23 +0200 (CEST)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nut6Q-000832-5C
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 05:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusch-00067W-6L
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:45 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusce-00041Y-8B
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6RW4+LpQIBRwxhqKEMtgnB9w1VEX2lSmh6semwwmIQ4=; b=iZNUDtETiAijrBKchOK8+sYiRS
 3aorvJFDsOfJuBq/Xv5M/b9bPzi3NNflJTqABT2FXS1fJimj7foDkyHRhE+O5GnePILldPpNrEG0Z
 4qpYMjlUoEL2WW04e9aGmxDPK29WQA26f727+UZ9cTtC0ClGPWCXxz3t10F2UMXcAB1KcOWjLN+Bm
 IvijNtKLsS/CjwzAcaEjtF9XW3cwcWBEUYPkeFvcaRh0layoMbbBFMEMDsaQN5mL3VNIr2ImPJRYM
 0UOw6UdDRscQVupHAVVcaZ/Kxoz7z8jMKvo+D055vNgxVnsREUnXeiQVGhcPGTwqRM8uT54SMm9wx
 6wa2Z0zYiisY2LXBAuE2xUK6SAwSS4GGn2UvDafooouRxxJEawQFKxbIN/p6gNhanD8AQvr6j8cJY
 wmwZgfon0vlsszsxeXJ6bFKftDN7tz/ShzEvkXXsh4IlDO9hlIA4Dpzg9frDUYrar04fqpGPQrouW
 rdgHjvxne6Pd2Yb80j375+l4SN52icUr8TQOPXV9tpWPdovjs35lIiHYfUMp1juCOyVD4s55CD0GN
 yfNlgMuYY7HdwGxTX9F57gECvwc1HH/hn6EVjSplT91jWqiv2KK9/WuDBK5+eMqxCl1X+s0EMzlfF
 ajQ2hRO62WFW3GL/eArI5pEl5m0331Y3vVilvE3BI=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusbN-0003JL-Pa; Sat, 28 May 2022 10:19:21 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, hpoussin@reactos.org, qemu-devel@nongnu.org
Date: Sat, 28 May 2022 10:19:34 +0100
Message-Id: <20220528091934.15520-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 12/12] hw/acpi/piix4: remove unused piix4_pm_initfn() function
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

This function is now unused and so can be completely removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/acpi/piix4.c               | 19 -------------------
 include/hw/southbridge/piix.h |  4 ----
 2 files changed, 23 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index fd20e1eccc..0a81f1ad93 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -505,25 +505,6 @@ static void piix4_pm_init(Object *obj)
     qdev_init_gpio_out_named(DEVICE(obj), &s->smi_irq, "smi-irq", 1);
 }
 
-PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                              int smm_enabled)
-{
-    PCIDevice *pci_dev;
-    DeviceState *dev;
-    PIIX4PMState *s;
-
-    pci_dev = pci_new(devfn, TYPE_PIIX4_PM);
-    dev = DEVICE(pci_dev);
-    qdev_prop_set_uint32(dev, "smb_io_base", smb_io_base);
-    qdev_prop_set_bit(dev, "smm-enabled", smm_enabled);
-
-    s = PIIX4_PM(dev);
-
-    pci_realize_and_unref(pci_dev, bus, &error_fatal);
-
-    return s;
-}
-
 static uint64_t gpe_readb(void *opaque, hwaddr addr, unsigned width)
 {
     PIIX4PMState *s = opaque;
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index d284475f07..976b4da582 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -14,10 +14,6 @@
 
 #include "hw/pci/pci.h"
 #include "qom/object.h"
-#include "hw/acpi/piix4.h"
-
-PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                              int smm_enabled);
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
-- 
2.20.1


