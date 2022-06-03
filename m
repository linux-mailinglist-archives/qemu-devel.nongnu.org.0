Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C9253D1E6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 20:54:09 +0200 (CEST)
Received: from localhost ([::1]:49142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxCQx-0001S5-NM
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 14:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCO7-00078J-NI
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:11 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCO5-00048p-2F
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:11 -0400
Received: by mail-ej1-x633.google.com with SMTP id q21so17644467ejm.1
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 11:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w+VBxhxh0gSBVm9fr937VMDDWJs7ypGS7SXewGU/qvQ=;
 b=nMBcEmvzYazMSmOM+6PchFb6GHzW4PR+GwBeOLg/ec4KyuXvazUlVwesC3IL+dsqKA
 FuqRDJcxyqZ5geAFCGVy9HEuakns9XjnT3edMdNedW9fx4h4AZnk8Nwo3RBbqRgnO8rp
 gnjKnEkfv32jeuYQkKE1kQn7bbMDIrG+NXH36bf0foC2PJJsBfI+jQ0iPwnxGG3HJW8t
 j9K8+EMFUhayUlWUDR6gQ/fjj/KT+qroWUvLmTQfKqTsbXTcHQFNaSkZpFW6DfspS4zK
 VwvpiJVwFz/RDwsOMkkhYDlEjilfiSx8HV+1mAgy6WwOG08as/QC+6PlXwZjZMI1SZDu
 ThPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+VBxhxh0gSBVm9fr937VMDDWJs7ypGS7SXewGU/qvQ=;
 b=xYiKjhCtuo3edKRzs3xaXUs9J7VPqinSIFzW2GcZqxAZx6qUlhzsJA/y0l0QMsDFhD
 MQvBgoIoMgnyx93FSqG4qJjqAztRazMn3znMqEHvz9uvff54DeOxW0C0o6PVLuux+p9U
 owL9DXAJ7tEtMB9TjtMVoYkCoqYjD+0dMF5KourySjZ7Ic0h8OrNeiaWqKdbQmDnuYv2
 CZSn4y32E7zoWNQyjpBVZv7MyhHk0Akd3d8n4G4OXwQDwd9unfZwK6DHSDByo8+t8dEs
 c4Pj7+kbf1EKnrOr+ZSXjYDQlqd54z3n8LGpZS/PdONXVuQkE1VLeVxy8wL9sbyQYO91
 RPpg==
X-Gm-Message-State: AOAM531l2emVqkzdJJCdpopQA4I2XWuZ8pK0pLX4i0Q6e9lJA88ReGfv
 HPln1IYe0B3KDwMAP5BYSw2E0+TWcw5wIA==
X-Google-Smtp-Source: ABdhPJysHlDfP9FYhPKp2znJhlxn4OFCjLsNlBQznkSoblZy7z8Rb3GhGGY9fNEQnDO8jyJRSDDMhg==
X-Received: by 2002:a17:907:868c:b0:6fe:fd7a:e0d7 with SMTP id
 qa12-20020a170907868c00b006fefd7ae0d7mr9880899ejc.90.1654282265505; 
 Fri, 03 Jun 2022 11:51:05 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 f25-20020a170906139900b006fe8c831632sm3066160ejc.73.2022.06.03.11.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 11:51:04 -0700 (PDT)
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
Subject: [PATCH v4 03/11] hw/isa/piix4: Move pci_map_irq_fn' near
 pci_set_irq_fn
Date: Fri,  3 Jun 2022 20:50:37 +0200
Message-Id: <20220603185045.143789-4-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603185045.143789-1-shentey@gmail.com>
References: <20220603185045.143789-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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

The pci_map_irq_fn was implemented below type_init() which made it
inaccessible to QOM functions. So move it up.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 50 +++++++++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 1d04fb6a55..18aa24424f 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -74,6 +74,31 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
     }
 }
 
+static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
+{
+    int slot;
+
+    slot = PCI_SLOT(pci_dev->devfn);
+
+    switch (slot) {
+    /* PIIX4 USB */
+    case 10:
+        return 3;
+    /* AMD 79C973 Ethernet */
+    case 11:
+        return 1;
+    /* Crystal 4281 Sound */
+    case 12:
+        return 2;
+    /* PCI slot 1 to 4 */
+    case 18 ... 21:
+        return ((slot - 18) + irq_num) & 0x03;
+    /* Unknown device, don't do any translation */
+    default:
+        return irq_num;
+    }
+}
+
 static void piix4_isa_reset(DeviceState *dev)
 {
     PIIX4State *d = PIIX4_PCI_DEVICE(dev);
@@ -266,31 +291,6 @@ static void piix4_register_types(void)
 
 type_init(piix4_register_types)
 
-static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
-{
-    int slot;
-
-    slot = PCI_SLOT(pci_dev->devfn);
-
-    switch (slot) {
-    /* PIIX4 USB */
-    case 10:
-        return 3;
-    /* AMD 79C973 Ethernet */
-    case 11:
-        return 1;
-    /* Crystal 4281 Sound */
-    case 12:
-        return 2;
-    /* PCI slot 1 to 4 */
-    case 18 ... 21:
-        return ((slot - 18) + irq_num) & 0x03;
-    /* Unknown device, don't do any translation */
-    default:
-        return irq_num;
-    }
-}
-
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 {
     PIIX4State *s;
-- 
2.36.1


