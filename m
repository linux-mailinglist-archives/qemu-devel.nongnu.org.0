Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EC16D3E4C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 09:43:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjEp3-0001gK-62; Mon, 03 Apr 2023 03:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjEow-0001fX-OP
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:41:43 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjEov-0006dk-3V
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:41:42 -0400
Received: by mail-wr1-x435.google.com with SMTP id j24so28303056wrd.0
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 00:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680507699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MUDyOxROyX57/HeZfnPOMpR49OmyPgdDYS4l8CKR3oE=;
 b=R0zQZHS1SVM2nbqIZon4bg3J/Tgs443HdjKKqxyVKw/W6M8PKg6fF5HqP9chCuyiBZ
 HJkytr0cpW/VhAlTB3rKHnd519d/mvwUbFIWVLXIvNSr48AXF6vTFq6fJUcOUmUH1iyB
 ueVnC/xQZaZZHpFPSVhx5W9HBRQbsjok895nYAKptZCyOKoD4Ib82ypomuw9roljaWLe
 IbWXzVNtIq89BY8uwqhgoY21w0gcpO0L4vbRyFCz5FSL/pxc3tWZ8/gLXOuRE9RPqc0/
 6HjlOpoi2+VFwd5ZeD8MBrf7WTl2dA38nm35BVoLZzH5VWDCu+75pIfnCT84gtQ11hI1
 Ozwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680507699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MUDyOxROyX57/HeZfnPOMpR49OmyPgdDYS4l8CKR3oE=;
 b=GCqF6/ncCspSGhHszUxhSxgInaxLxrVHkSnuIX/cH1cSH87D8fWSkepc9pkT8Opw21
 q/V/q8/BzFdMm0k34d3rWOkZex7ohuMFRjID0iO8Wwp5OtZUgvioN923FdS7u7faYkkS
 cKH13V0T6yYavDdl8p84QIs91TTue+5YyOZ/Lc5xSKzVGrSj/h0+oz+qKHykIH2noUuB
 Y8ixRPBq3b42Z//tAyovELA7cNflUlCCp+sTaUpbMrh57IlZJmYifGWTlycIZzA9hYZj
 b+FHKTQrW315h7Zyx7FKgMuon+CN7q5c/JqMPQgvtHRyDc/97K/T51TiuIhPyhaTsjRF
 UUZQ==
X-Gm-Message-State: AAQBX9e0Q+M/c2qaCfvQCsoGp9mHDZoPm6VohRyXlwxoPTjOKNunM9tM
 mREMVR+bWmZSWaG0yk73bJPkOUwltmT3/g==
X-Google-Smtp-Source: AKy350Z1aIPseQR+1yV2swwLLDz0AEwlN4YYIJAKAq+O5S9egcGZLOBJfv2d/bu2tqMGfhvjE7XU2g==
X-Received: by 2002:adf:ed0e:0:b0:2d1:86e6:bd6 with SMTP id
 a14-20020adfed0e000000b002d186e60bd6mr26015599wro.22.1680507699461; 
 Mon, 03 Apr 2023 00:41:39 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-055-162-106.78.55.pool.telefonica.de. [78.55.162.106])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm8414960wrr.100.2023.04.03.00.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 00:41:38 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 4/7] hw/isa/piix3: Wire up Xen PCI IRQ handling outside of
 PIIX3
Date: Mon,  3 Apr 2023 09:41:21 +0200
Message-Id: <20230403074124.3925-5-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403074124.3925-1-shentey@gmail.com>
References: <20230403074124.3925-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

xen_intx_set_irq() doesn't depend on PIIX3State. In order to resolve
TYPE_PIIX3_XEN_DEVICE and in order to make Xen agnostic about the
precise south bridge being used, set up Xen's PCI IRQ handling of PIIX3
in the board.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Tested-by: Chuck Zmudzinski <brchuckz@aol.com>
Message-Id: <20230312120221.99183-4-shentey@gmail.com>
---
 hw/i386/pc_piix.c | 13 +++++++++++++
 hw/isa/piix3.c    | 24 +-----------------------
 2 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 30eedd62a3..99232701b1 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -69,6 +69,7 @@
 #include "kvm/kvm-cpu.h"
 
 #define MAX_IDE_BUS 2
+#define XEN_IOAPIC_NUM_PIRQS 128ULL
 
 #ifdef CONFIG_IDE_ISA
 static const int ide_iobase[MAX_IDE_BUS] = { 0x1f0, 0x170 };
@@ -236,6 +237,18 @@ static void pc_init1(MachineState *machine,
         pcms->bus = pci_bus;
 
         pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+
+        if (xen_enabled()) {
+            /*
+             * Xen supports additional interrupt routes from the PCI devices to
+             * the IOAPIC: the four pins of each PCI device on the bus are also
+             * connected to the IOAPIC directly.
+             * These additional routes can be discovered through ACPI.
+             */
+            pci_bus_irqs(pci_bus, xen_intx_set_irq, pci_dev,
+                         XEN_IOAPIC_NUM_PIRQS);
+        }
+
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index a86cd23ef4..7a31caf2b6 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -34,8 +34,6 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
 
-#define XEN_IOAPIC_NUM_PIRQS    128ULL
-
 static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
 {
     qemu_set_irq(piix3->pic[pic_irq],
@@ -388,32 +386,12 @@ static const TypeInfo piix3_info = {
     .class_init    = piix3_class_init,
 };
 
-static void piix3_xen_realize(PCIDevice *dev, Error **errp)
-{
-    ERRP_GUARD();
-    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
-    PCIBus *pci_bus = pci_get_bus(dev);
-
-    piix3_realize(dev, errp);
-    if (*errp) {
-        return;
-    }
-
-    /*
-     * Xen supports additional interrupt routes from the PCI devices to
-     * the IOAPIC: the four pins of each PCI device on the bus are also
-     * connected to the IOAPIC directly.
-     * These additional routes can be discovered through ACPI.
-     */
-    pci_bus_irqs(pci_bus, xen_intx_set_irq, piix3, XEN_IOAPIC_NUM_PIRQS);
-}
-
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->config_write = piix3_write_config_xen;
-    k->realize = piix3_xen_realize;
+    k->realize = piix3_realize;
 }
 
 static const TypeInfo piix3_xen_info = {
-- 
2.40.0


