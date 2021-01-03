Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0D22E8E30
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 21:57:23 +0100 (CET)
Received: from localhost ([::1]:53100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwARG-0000tT-12
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 15:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAKo-0002QU-7q
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:50:42 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAKm-0005fV-L1
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:50:42 -0500
Received: by mail-wm1-x331.google.com with SMTP id 190so15947759wmz.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C4EjkfX/EFxfnrsxvvCHO1MOBBNeBx+9lsiUXY0oxBY=;
 b=M9ielLvxhirQLv/Y+w5NRoGlA6GkIftoHkwjhM9lnm/Qbd2uG7nBBvZ8Z4NZzmY+NK
 EBsiMH2CwudKA58g9b7Fdc5BWnn5qNZHYK58qsPzjfq3XeabHIQ08SoA+Tr5d11N7zSZ
 +M6VfT8hCi84wF7wYlmNPJoguY2GZ/s3MT0Ed7F9AIW9HCnX20b18cimfyCP2O5b7r9v
 erYdBLhaGejPd4rh/soc+zOTdvn9N5a7CFMbvrmhQmbsXhjeb9wiuwnIJZwHA4Z3Lfff
 b3uequalRsiZ6D6z/phw9kh/+FI+w0r4dWI4kAKJfpfv/nWvQnd0LmRQYGk1uSPhynWl
 EYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C4EjkfX/EFxfnrsxvvCHO1MOBBNeBx+9lsiUXY0oxBY=;
 b=QNcOvlXKzj+w9z/iHiE2A2ansl07vzJ10EyNLd1OHd30kGSihkGJ/QVVMaNI+qxeup
 rnT+SvIofJq0TsUhfyw2W0/dJEJs557js1IuY/zKkikuBJftKJCXh2n52wR1OMYy8+AV
 nwZADv5ncsbX6bU6p0UMvTW4h/GTf31HnjVwkCQMMdCAr58xpNmo2XuUPDh/jy+pM9Cd
 UjOCvZ0uisgdPOorfJ6EYH2OyyDkeQparMhdYPRCYem44VM2cCpGwqxJjVlk/Ldelnqq
 nRnynDPDvNYGVQtRePsYFemn9LKNNSxGZaHYj0frZS6sevkRRcg6pZmOocm1Au1Gh/44
 yiWw==
X-Gm-Message-State: AOAM532ubScPxVMuVPmRXxB+WJ3OdozzzGXJ1eFBZUiICTpjRaTFjK+X
 8s4PNIdPM6JqaIM9YKrSsKexMB4KRso=
X-Google-Smtp-Source: ABdhPJyxNdP6016x9Nm1dEXqiSpyXJpsbPhedFqdJ5qhWY57Udekz+W9Y6dnSunuedHDG4stxxyBWQ==
X-Received: by 2002:a1c:6654:: with SMTP id a81mr23525748wmc.113.1609707038899; 
 Sun, 03 Jan 2021 12:50:38 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id o74sm34756208wme.36.2021.01.03.12.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:50:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/35] hw: Use the PCI_SLOT() macro from 'hw/pci/pci.h'
Date: Sun,  3 Jan 2021 21:49:49 +0100
Message-Id: <20210103205021.2837760-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have a generic PCI_SLOT() macro in "hw/pci/pci.h"
to extract the PCI slot identifier, use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Paul Durrant <paul@xen.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20201012124506.3406909-5-philmd@redhat.com>
---
 hw/hppa/dino.c        | 2 +-
 hw/i386/xen/xen-hvm.c | 2 +-
 hw/isa/piix3.c        | 2 +-
 hw/mips/gt64xxx_pci.c | 2 +-
 hw/pci-host/bonito.c  | 2 +-
 hw/pci-host/ppce500.c | 2 +-
 hw/ppc/ppc4xx_pci.c   | 2 +-
 hw/sh4/sh_pci.c       | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 81053b5fb64..5b82c9440d1 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -496,7 +496,7 @@ static void dino_set_irq(void *opaque, int irq, int level)
 
 static int dino_pci_map_irq(PCIDevice *d, int irq_num)
 {
-    int slot = d->devfn >> 3;
+    int slot = PCI_SLOT(d->devfn);
 
     assert(irq_num >= 0 && irq_num <= 3);
 
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 096c46fef15..68821d90f52 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -140,7 +140,7 @@ typedef struct XenIOState {
 
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 {
-    return irq_num + ((pci_dev->devfn >> 3) << 2);
+    return irq_num + (PCI_SLOT(pci_dev->devfn) << 2);
 }
 
 void xen_piix3_set_irq(void *opaque, int irq_num, int level)
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 587850b8881..f46ccae25cf 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -361,7 +361,7 @@ type_init(piix3_register_types)
 static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
 {
     int slot_addend;
-    slot_addend = (pci_dev->devfn >> 3) - 1;
+    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
     return (pci_intx + slot_addend) & 3;
 }
 
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index e091bc4ed55..588e6f99301 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -982,7 +982,7 @@ static int gt64120_pci_map_irq(PCIDevice *pci_dev, int irq_num)
 {
     int slot;
 
-    slot = (pci_dev->devfn >> 3);
+    slot = PCI_SLOT(pci_dev->devfn);
 
     switch (slot) {
     /* PIIX4 USB */
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index b05295639a6..ee8b193e15b 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -570,7 +570,7 @@ static int pci_bonito_map_irq(PCIDevice *pci_dev, int irq_num)
 {
     int slot;
 
-    slot = (pci_dev->devfn >> 3);
+    slot = PCI_SLOT(pci_dev->devfn);
 
     switch (slot) {
     case 5:   /* FULOONG2E_VIA_SLOT, SouthBridge, IDE, USB, ACPI, AC97, MC97 */
diff --git a/hw/pci-host/ppce500.c b/hw/pci-host/ppce500.c
index 9517aab913e..5ad1424b31a 100644
--- a/hw/pci-host/ppce500.c
+++ b/hw/pci-host/ppce500.c
@@ -342,7 +342,7 @@ static const MemoryRegionOps e500_pci_reg_ops = {
 
 static int mpc85xx_pci_map_irq(PCIDevice *pci_dev, int pin)
 {
-    int devno = pci_dev->devfn >> 3;
+    int devno = PCI_SLOT(pci_dev->devfn);
     int ret;
 
     ret = ppce500_pci_map_irq_slot(devno, pin);
diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index 28724c06f88..e8789f64e80 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -243,7 +243,7 @@ static void ppc4xx_pci_reset(void *opaque)
  * may need further refactoring for other boards. */
 static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int irq_num)
 {
-    int slot = pci_dev->devfn >> 3;
+    int slot = PCI_SLOT(pci_dev->devfn);
 
     trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
 
diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
index 73d2d0bccb0..734892f47c7 100644
--- a/hw/sh4/sh_pci.c
+++ b/hw/sh4/sh_pci.c
@@ -109,7 +109,7 @@ static const MemoryRegionOps sh_pci_reg_ops = {
 
 static int sh_pci_map_irq(PCIDevice *d, int irq_num)
 {
-    return (d->devfn >> 3);
+    return PCI_SLOT(d->devfn);
 }
 
 static void sh_pci_set_irq(void *opaque, int irq_num, int level)
-- 
2.26.2


