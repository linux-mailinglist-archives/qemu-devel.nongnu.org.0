Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518804CFCC8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:27:44 +0100 (CET)
Received: from localhost ([::1]:41960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBWh-0004mP-Ds
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:27:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAMK-0004DA-8y
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:58 -0500
Received: from [2a00:1450:4864:20::432] (port=46669
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAMH-0004M1-SL
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:55 -0500
Received: by mail-wr1-x432.google.com with SMTP id x15so22336347wru.13
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zKnK2u0z+UoUHu8ipnwT4tgVhDExVvLYNczURL/a2ws=;
 b=N1iLoH2LvRvPDmbLHXhycA1nAGHQrLTCPXYStv2lcMQOPYmtDcjVcnb4zbWcdW76x+
 UFzLYwpZdJgI0W+5gfVkowh6Dm2QEn0Zq9f7O3zrqc6v9QnaP/Ed2Qkgu8pnYGI3OqpW
 CQQY43W33NiSdSgbuc0p0RAJaUZ0c2pzUgVe/NivJa5bBvWfcxkQaVRC9D333hwHVzFc
 EE1jVyMc6Mi4+ef8rnZTNCoDvdM54Z/SOtESvVX1v5XPQT7YttqyzFHnlaNba3m8LGuM
 TMvr/wXOlnUua7NiuDWQhoprAoU3q+6V2ZvWnlNH9VVaI/6UHUZQFG9soYdi8QzaOEAt
 9p0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zKnK2u0z+UoUHu8ipnwT4tgVhDExVvLYNczURL/a2ws=;
 b=tamWf9THXtgT2tHKnUfRpVd1hh83gr2DO7BFjMCYQF07ZtVZ9FvNeDdgKd4rKigCCE
 QhU19Qdxm+qBokFYn4CZJchdAPtPot2mxINUh11+KuMIAVgn0P+QnqlDtE5Na9R394Wq
 AhZ+Amfakolxv7ItUPNwRXGOHwknfmZqDJ3R7Rsofod7GznaYqw6P+BtEqxjl3k0E30H
 kePMEKcjUIdvr5QCxrV71CnN7di59fhqNGyK4NaVaNzY4QMbqNqlG71IBGM4kX6bioG0
 l/4bj0gp7++ae2MEIayl4hUHfEfKxwk1pnkuESw94f4op9qcN4LvMdAwaaiPRMKUEsEt
 r7zQ==
X-Gm-Message-State: AOAM530543oI09xQNu9Lw/HYbQ6q3ROnohIrK0Rxq2dmwn5ffaJSzat6
 iQ18i3K6V6WI/Hpj4uDGqRMU+VbnlMc=
X-Google-Smtp-Source: ABdhPJwpztNz1mOPF67FXyEGR2rnIZ17JjlJ+Qj3P8ygRq9ZdWNu+NdsbGVjEHuX5MqlYVty0/MS/Q==
X-Received: by 2002:a5d:6a4a:0:b0:1f1:2457:a7eb with SMTP id
 t10-20020a5d6a4a000000b001f12457a7ebmr7828952wrw.523.1646647972442; 
 Mon, 07 Mar 2022 02:12:52 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o11-20020adf9d4b000000b001f0077ea337sm11338767wre.22.2022.03.07.02.12.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 02:12:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/16] hw/mips/gt64xxx_pci: Resolve gt64120_register()
Date: Mon,  7 Mar 2022 11:12:00 +0100
Message-Id: <20220307101207.90369-10-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Now that gt64120_register() lost its pic parameter, there is an
opportunity to remove it. gt64120_register() is old style by wrapping
qdev API, and the new style is to use qdev directly. So take the
opportunity and modernize the code.

Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20220217101924.15347-8-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/gt64xxx_pci.c  | 21 ++++-----------------
 hw/mips/malta.c        |  3 ++-
 include/hw/mips/mips.h |  3 ---
 3 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index eb205d6d70..e0ff1b5566 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -26,7 +26,6 @@
 #include "qapi/error.h"
 #include "qemu/units.h"
 #include "qemu/log.h"
-#include "hw/mips/mips.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
 #include "migration/vmstate.h"
@@ -1151,30 +1150,18 @@ static void gt64120_reset(DeviceState *dev)
 static void gt64120_realize(DeviceState *dev, Error **errp)
 {
     GT64120State *s = GT64120_PCI_HOST_BRIDGE(dev);
+    PCIHostState *phb = PCI_HOST_BRIDGE(dev);
 
     memory_region_init_io(&s->ISD_mem, OBJECT(dev), &isd_mem_ops, s,
                           "gt64120-isd", 0x1000);
-}
-
-PCIBus *gt64120_register(void)
-{
-    GT64120State *d;
-    PCIHostState *phb;
-    DeviceState *dev;
-
-    dev = qdev_new(TYPE_GT64120_PCI_HOST_BRIDGE);
-    d = GT64120_PCI_HOST_BRIDGE(dev);
-    phb = PCI_HOST_BRIDGE(dev);
-    memory_region_init(&d->pci0_mem, OBJECT(dev), "pci0-mem", 4 * GiB);
-    address_space_init(&d->pci0_mem_as, &d->pci0_mem, "pci0-mem");
+    memory_region_init(&s->pci0_mem, OBJECT(dev), "pci0-mem", 4 * GiB);
+    address_space_init(&s->pci0_mem_as, &s->pci0_mem, "pci0-mem");
     phb->bus = pci_root_bus_new(dev, "pci",
-                                &d->pci0_mem,
+                                &s->pci0_mem,
                                 get_system_io(),
                                 PCI_DEVFN(18, 0), TYPE_PCI_BUS);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
-    return phb->bus;
 }
 
 static void gt64120_pci_realize(PCIDevice *d, Error **errp)
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 13254dbc89..55037eb90f 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1390,7 +1390,8 @@ void mips_malta_init(MachineState *machine)
     stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);
 
     /* Northbridge */
-    pci_bus = gt64120_register();
+    dev = sysbus_create_simple("gt64120", -1, NULL);
+    pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
     /*
      * The whole address space decoded by the GT-64120A doesn't generate
      * exception when accessing invalid memory. Create an empty slot to
diff --git a/include/hw/mips/mips.h b/include/hw/mips/mips.h
index ff88942e63..101799f7d3 100644
--- a/include/hw/mips/mips.h
+++ b/include/hw/mips/mips.h
@@ -9,9 +9,6 @@
 
 #include "exec/memory.h"
 
-/* gt64xxx.c */
-PCIBus *gt64120_register(void);
-
 /* bonito.c */
 PCIBus *bonito_init(qemu_irq *pic);
 
-- 
2.34.1


