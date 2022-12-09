Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8118B6484D0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 16:16:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3f6Q-0004sm-5K; Fri, 09 Dec 2022 10:15:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3f6M-0004rP-UR
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:15:51 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3f6L-00086s-9W
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:15:50 -0500
Received: by mail-wr1-x432.google.com with SMTP id h11so5485796wrw.13
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 07:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ThW5+Wf0+J6ixaduZ5MXdZ1ToXWPPCl2Uxce3Xr1xo=;
 b=rTBjjLsTgxgK8Gkv9CIloj/UEIBWRyw+Nujo4WKrR9zdOb9dgkPWzJ/aPvaCxlvegv
 yPVKnSvp2RvtRuWoJSL9AeL329J4JGIXmqkWf9u8pLDzNZIF3Y/O5Fa/IWyoH+wzXK9X
 JT84gUSoN2WCq26IWOuMxGd0Kwc7q7NlgMxMsgTuV7Ucqlkcsb9Z4cUeejCxzgcIxKgB
 XSnq6PBO/oy3xr3J1KzvHk3/W3p38A7XxP8SqCAKmVPzRBTbB0LnxPvuwzlJ6ICqwuDq
 SyLRuaMefUYV1VQUJ594W/AN/mfSUM7Zy9ZWtr5GKiM9z8jcIqHvgD524GLu4oo0WEho
 xRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ThW5+Wf0+J6ixaduZ5MXdZ1ToXWPPCl2Uxce3Xr1xo=;
 b=UDGAo3LUt9jQlTPH3jRLbJQMEqMPHUaml2WRXwABjN/uQGm4ev3d36RHyIMOOLgG7m
 AnaZnApElz45VRIbpAuKV/+AJmcTp3K/FWWsMc0pXUhoVfRm/WOECOe4fXKRH1BhJ59i
 nUMzpVtBj8Gko9FStVDhYGls3aXepCTgssQBrooqtj6kKarioYxyRuj0XLUFpYbUoWmx
 MHtB+m5W+Pu2HuayITo8y96gTihwkD1mXDeG9kQiW298fiXbj1i2eVJ9w09bMI545DRf
 cjoiUc8ZQ/9/zbPSknntvd3cOOGpX/6qZeQL/EXqJ18dm3YnjnJRehOBVU9mMc7VqUFS
 Cdeg==
X-Gm-Message-State: ANoB5pnE6PDmk72utvnpjYvJ1PduO0sH7rSMb6gOMKQYHBokaty4Hvz6
 9yA6SyN2zOWDWYJSehvhAMMhg5mlCbKd78iOM1I=
X-Google-Smtp-Source: AA0mqf4xtbDEcvLRsZ2AFoPahDUBx3CshXYiz9zkist1CeJXUxdCdH/2RBEA74tkZuTPszXVxVmoGA==
X-Received: by 2002:a05:6000:38b:b0:242:69f4:cb6a with SMTP id
 u11-20020a056000038b00b0024269f4cb6amr4985097wrf.9.1670598945416; 
 Fri, 09 Dec 2022 07:15:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z17-20020adfdf91000000b00241d544c9b1sm1927674wrl.90.2022.12.09.07.15.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 07:15:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH-for-8.0 2/7] hw/mips/gt64xxx_pci: Let the GT64120 manage the
 lower 512MiB hole
Date: Fri,  9 Dec 2022 16:15:28 +0100
Message-Id: <20221209151533.69516-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209151533.69516-1-philmd@linaro.org>
References: <20221209151533.69516-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Per the comment in the Malta board, the [0x0000.0000-0x2000.0000]
range is decoded by the GT64120, so move the "empty_slot" there.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configs/devices/mips-softmmu/common.mak | 1 -
 hw/mips/Kconfig                         | 1 +
 hw/mips/gt64xxx_pci.c                   | 8 ++++++++
 hw/mips/malta.c                         | 7 -------
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index 416161f833..c2b5f322fc 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -26,7 +26,6 @@ CONFIG_IDE_ISA=y
 CONFIG_PFLASH_CFI01=y
 CONFIG_I8259=y
 CONFIG_MC146818RTC=y
-CONFIG_EMPTY_SLOT=y
 CONFIG_MIPS_CPS=y
 CONFIG_MIPS_ITU=y
 CONFIG_MALTA=y
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index d6bbbe7069..8f7bce38fb 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -64,4 +64,5 @@ config FW_CFG_MIPS
 config GT64120
     bool
     select PCI
+    select EMPTY_SLOT
     select I8259
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 19d0d9889f..1b9ac7f792 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -28,6 +28,7 @@
 #include "qemu/log.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
+#include "hw/misc/empty_slot.h"
 #include "migration/vmstate.h"
 #include "hw/intc/i8259.h"
 #include "hw/irq.h"
@@ -1162,6 +1163,13 @@ static void gt64120_realize(DeviceState *dev, Error **errp)
                                 PCI_DEVFN(18, 0), TYPE_PCI_BUS);
 
     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
+
+    /*
+     * The whole address space decoded by the GT-64120A doesn't generate
+     * exception when accessing invalid memory. Create an empty slot to
+     * emulate this feature.
+     */
+    empty_slot_init("GT64120", 0, 0x20000000);
 }
 
 static void gt64120_pci_realize(PCIDevice *d, Error **errp)
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index c0a2e0ab04..ba92022f87 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -53,7 +53,6 @@
 #include "sysemu/runstate.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "hw/misc/empty_slot.h"
 #include "sysemu/kvm.h"
 #include "semihosting/semihost.h"
 #include "hw/mips/cps.h"
@@ -1393,12 +1392,6 @@ void mips_malta_init(MachineState *machine)
     /* Northbridge */
     dev = sysbus_create_simple("gt64120", -1, NULL);
     pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
-    /*
-     * The whole address space decoded by the GT-64120A doesn't generate
-     * exception when accessing invalid memory. Create an empty slot to
-     * emulate this feature.
-     */
-    empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
     piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
-- 
2.38.1


