Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7806A4421
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:18:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeEB-00088w-Ri; Mon, 27 Feb 2023 09:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeD7-0007GB-KZ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:39 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeD5-0000xB-S7
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:37 -0500
Received: by mail-wm1-x32c.google.com with SMTP id j3so4333053wms.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=s/VV8gMq+SwEfVdND04j3PKQUCL7nPvwuzVVhOpvlV0=;
 b=UVoWMWrIxct28PSvms5AUbv0LnO1h7vmkbHjfIotZ8ud/ne4/9rrTiOrCB0tq+wHbJ
 cnVptXBXr36X33t0g6Uo10IkFOpfmideOhTryzQrJ79Do2Qb2NPHd5lEgAbGlBqlymWl
 uRCrrtI4FLePKAQvuGT25UBgmso4kd6MNh9TsLzpA8khsUMfXsjA2DgNiTrdzZBX0SwU
 CKbZW2VFTGCnFcTsPkzxa/ta3ZcSFgCTf2GYblVcx7M8IC5mJ3pFXD6YtjSvMyE6hqi1
 8K51FJD/qt5PjSHJ3FUIfQWF2TpL01tuK/3WdU9PGf1pasLjMdvvHGE3QMJcsNMWlLcX
 8cqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s/VV8gMq+SwEfVdND04j3PKQUCL7nPvwuzVVhOpvlV0=;
 b=UTl+yysr6YSDsop9dgVWOqh+i+JhYNT43ycn5t/HDvooQP+2DZ2PTsQjQhHdDIj/xO
 pDwhsXVAfZPbVhNAzozNqb7oJhd1fhR+rGOPWq1YCdgsJ0+9FHxqEGfan3h4IqHUmHQG
 uWWYnXH1XJ8uZqEAG/UVFBFxia/fBY8Xd5dQOuAKGt6Du78JtP0a6cPLAN7qK2BzDQIN
 4xv8lBozeoUnOgXCllhRbmD0REmTjF3/gGS6Fn2YQ7Stzom9ttqTMxtYxV7AoQNvcDxh
 8tpHcm4q2k7/H3VqU2K1UGN9yI3AE7qyrwREJApMVve+ZqZkF35YvElSd2nz4yxyp4of
 cZPQ==
X-Gm-Message-State: AO0yUKXER/pvb1vES0ERp5ucYSe8POQbR6Rzfnaqip1XK/jEUFdJd7LN
 UaqcWTS5+3Hm215JM5IdTiALSBp7QPQRkr0D
X-Google-Smtp-Source: AK7set+KcE9A1lVrEAR1xPQBJa30uie8Fj9XqciH3Prn7tFSo/gCnJj3sMQRV9gm9uHXGghzbrxygA==
X-Received: by 2002:a7b:c8ce:0:b0:3eb:248f:a140 with SMTP id
 f14-20020a7bc8ce000000b003eb248fa140mr8641631wml.6.1677507034094; 
 Mon, 27 Feb 2023 06:10:34 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a1c7915000000b003e21ba8684dsm9059689wme.26.2023.02.27.06.10.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:10:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 101/126] hw/ide/isa: Extract TYPE_ISA_IDE declarations to
 'hw/ide/isa.h'
Date: Mon, 27 Feb 2023 15:01:48 +0100
Message-Id: <20230227140213.35084-92-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

"hw/ide.h" is a mixed bag of lost IDE declarations.

Extract isa_ide_init() and the TYPE_ISA_IDE QOM declarations
to a new "hw/ide/isa.h" header.

Rename ISAIDEState::isairq as 'irqnum' to emphasize this is
not a qemu_irq object but the number (index) of an ISA IRQ.

Message-Id: <20230215112712.23110-5-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_piix.c    |  1 +
 hw/ide/isa.c         | 14 ++++++--------
 include/hw/ide.h     |  5 -----
 include/hw/ide/isa.h | 20 ++++++++++++++++++++
 4 files changed, 27 insertions(+), 13 deletions(-)
 create mode 100644 include/hw/ide/isa.h

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 7c48ba30e0..126b6c11df 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -39,6 +39,7 @@
 #include "hw/pci/pci_ids.h"
 #include "hw/usb.h"
 #include "net/net.h"
+#include "hw/ide/isa.h"
 #include "hw/ide/pci.h"
 #include "hw/ide/piix.h"
 #include "hw/irq.h"
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 8bedbd13f1..5c3e83a0fc 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -31,22 +31,20 @@
 #include "qemu/module.h"
 #include "sysemu/dma.h"
 
+#include "hw/ide/isa.h"
 #include "hw/ide/internal.h"
 #include "qom/object.h"
 
 /***********************************************************/
 /* ISA IDE definitions */
 
-#define TYPE_ISA_IDE "isa-ide"
-OBJECT_DECLARE_SIMPLE_TYPE(ISAIDEState, ISA_IDE)
-
 struct ISAIDEState {
     ISADevice parent_obj;
 
     IDEBus    bus;
     uint32_t  iobase;
     uint32_t  iobase2;
-    uint32_t  isairq;
+    uint32_t  irqnum;
     qemu_irq  irq;
 };
 
@@ -75,13 +73,13 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
-    s->irq = isa_get_irq(isadev, s->isairq);
+    s->irq = isa_get_irq(isadev, s->irqnum);
     ide_init2(&s->bus, s->irq);
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
     ide_register_restart_cb(&s->bus);
 }
 
-ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
+ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int irqnum,
                         DriveInfo *hd0, DriveInfo *hd1)
 {
     DeviceState *dev;
@@ -92,7 +90,7 @@ ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
     dev = DEVICE(isadev);
     qdev_prop_set_uint32(dev, "iobase",  iobase);
     qdev_prop_set_uint32(dev, "iobase2", iobase2);
-    qdev_prop_set_uint32(dev, "irq",     isairq);
+    qdev_prop_set_uint32(dev, "irq",     irqnum);
     isa_realize_and_unref(isadev, bus, &error_fatal);
 
     s = ISA_IDE(dev);
@@ -108,7 +106,7 @@ ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
 static Property isa_ide_properties[] = {
     DEFINE_PROP_UINT32("iobase",  ISAIDEState, iobase,  0x1f0),
     DEFINE_PROP_UINT32("iobase2", ISAIDEState, iobase2, 0x3f6),
-    DEFINE_PROP_UINT32("irq",    ISAIDEState, isairq,  14),
+    DEFINE_PROP_UINT32("irq",     ISAIDEState, irqnum,  14),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/ide.h b/include/hw/ide.h
index 5f8c36b2aa..24a7aa2925 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -1,13 +1,8 @@
 #ifndef HW_IDE_H
 #define HW_IDE_H
 
-#include "hw/isa/isa.h"
 #include "exec/memory.h"
 
-/* ide-isa.c */
-ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
-                        DriveInfo *hd0, DriveInfo *hd1);
-
 int ide_get_geometry(BusState *bus, int unit,
                      int16_t *cyls, int8_t *heads, int8_t *secs);
 int ide_get_bios_chs_trans(BusState *bus, int unit);
diff --git a/include/hw/ide/isa.h b/include/hw/ide/isa.h
new file mode 100644
index 0000000000..1cd0ff1fa6
--- /dev/null
+++ b/include/hw/ide/isa.h
@@ -0,0 +1,20 @@
+/*
+ * QEMU IDE Emulation: ISA Bus support.
+ *
+ * Copyright (c) 2003 Fabrice Bellard
+ * Copyright (c) 2006 Openedhand Ltd.
+ *
+ * SPDX-License-Identifier: MIT
+ */
+#ifndef HW_IDE_ISA_H
+#define HW_IDE_ISA_H
+
+#include "qom/object.h"
+
+#define TYPE_ISA_IDE "isa-ide"
+OBJECT_DECLARE_SIMPLE_TYPE(ISAIDEState, ISA_IDE)
+
+ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int irqnum,
+                        DriveInfo *hd0, DriveInfo *hd1);
+
+#endif
-- 
2.38.1


