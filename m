Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934FD547431
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:21:21 +0200 (CEST)
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzBA-0000vm-CL
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTb-0006Au-H1
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:26 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTO-0006kM-CU
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:18 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so764395wms.3
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EKw8dkFk83kf19j0PuBQx7qP2J6aT8xObisTpd5mA4Q=;
 b=Wk/CsJdVWWDwweJ+HwGmCbdrY2Lm+Yrj+e65BzHPtWwPRmn58kJhCvvZlhNZALgHC3
 YKrOQib9IDAnN5I4P9CPEVm321jo4N0bxFsOb0nXBBdL+93oZkV19EULnXk5C6OzRTEm
 QJuQ1Pyjas2d/g+UkSqEQ/vDWv5g97cY+1ZYw/3eEz+P8P/hMxQHoekMLmHoFBlWzNpt
 3fK4t7WjIjVjN+F+GhC/WiMzoYAddh9y/nlN/3Fv65WiszHNmMYrWINC2YY6ua5zMccY
 tSX7/WDk4rk3tibj1WsHBFuResMXFxhy0yEx/o6ldtL4OlQAKOP7VJTxDtoynr1uFxYe
 Twbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EKw8dkFk83kf19j0PuBQx7qP2J6aT8xObisTpd5mA4Q=;
 b=rgr1qeWTBNEyoZQNDt5E92dwefp/VA/Kd9n8P/+fL6k9tJQoZcBv5Mngz588eKUchz
 9MtslE6tCweAKCZ9ABHQ6qCiseC7Ly/Gr3NEtOxQMZ2M/U8J93hNze9vycnj8vycfeIM
 93UYfVgfhOjCvWZqwLhG8QTcB+1YPaNRKpUY/sE2Ntft8u8eX65lAhheN/QN/iTsfszi
 sZkVAbcXdjDTyl296mHBFzln8JSjTyrm1RIN2fX8FdSJraj+2nWdQ+Z5ovX0hhsj5i56
 gVIRLvGD0GEHj88XnRq+OritiSTLqLdbMYbJx8IR4JoK+cm+yKZpg+xv1ZUVFk1boHyE
 UYmA==
X-Gm-Message-State: AOAM533NEalJ/rGQuxA/wMTUhvXxRRPriIsY8nGBxDCDZ/DBNNT8NFLd
 5cVTXJ4oO7W8tWbX2Rn6yNU2GpBApcU=
X-Google-Smtp-Source: ABdhPJzAEZWn6v4DYWCvPF5GoBKI//1lVXpdbOqMnbvhuFbu26luUfKJot56nY5UZKOJHV3yhjTO8A==
X-Received: by 2002:a05:600c:646:b0:397:77ab:5eb7 with SMTP id
 p6-20020a05600c064600b0039777ab5eb7mr4283524wmm.166.1654943764479; 
 Sat, 11 Jun 2022 03:36:04 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 m5-20020a056000008500b00213d75491b0sm2134922wrx.48.2022.06.11.03.36.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:36:04 -0700 (PDT)
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
Subject: [PULL 33/49] hw/isa/piix4: Inline and remove piix4_create()
Date: Sat, 11 Jun 2022 12:32:56 +0200
Message-Id: <20220611103312.67773-34-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

During the previous changesets piix4_create() became a trivial
wrapper around more generic functions. Modernize the code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220603185045.143789-8-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c                | 13 -------------
 hw/mips/malta.c               |  5 ++++-
 include/hw/southbridge/piix.h |  2 --
 3 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index d97b245df3..15f344dbb7 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -323,16 +323,3 @@ static void piix4_register_types(void)
 }
 
 type_init(piix4_register_types)
-
-DeviceState *piix4_create(PCIBus *pci_bus)
-{
-    PCIDevice *pci;
-    DeviceState *dev;
-    int devfn = PCI_DEVFN(10, 0);
-
-    pci = pci_create_simple_multifunction(pci_bus, devfn,  true,
-                                          TYPE_PIIX4_PCI_DEVICE);
-    dev = DEVICE(pci);
-
-    return dev;
-}
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index be9f26d841..7a0ec513b0 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1237,6 +1237,7 @@ void mips_malta_init(MachineState *machine)
     int fl_idx = 0;
     int be;
     MaltaState *s;
+    PCIDevice *piix4;
     DeviceState *dev;
     DeviceState *pm_dev;
 
@@ -1400,7 +1401,9 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    dev = piix4_create(pci_bus);
+    piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
+                                            TYPE_PIIX4_PCI_DEVICE);
+    dev = DEVICE(piix4);
     isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
     pm_dev = DEVICE(object_resolve_path_component(OBJECT(dev), "pm"));
     smbus = I2C_BUS(qdev_get_child_bus(pm_dev, "i2c"));
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 2357ce0287..9a2dd93c2d 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -70,6 +70,4 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
 
 PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
 
-DeviceState *piix4_create(PCIBus *pci_bus);
-
 #endif
-- 
2.36.1


