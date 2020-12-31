Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF452E829F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 00:02:55 +0100 (CET)
Received: from localhost ([::1]:53484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6xn-0000vs-0c
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 18:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6mG-0002r4-6n
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:40 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6mE-0006y4-Ic
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:39 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d26so20998513wrb.12
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UF9C9rlsBDCs9WWqG2eWdP7HydEgcGaCKsEyc6/esyM=;
 b=droiYmEKIwW90N4e0qmB2pejDtiNvETQkmpurJ7uSetyKPyLsOQTklmjdSkiHU8frO
 nImJvu1bYzBY6iTEv0KO03zpf04lWCW0Bou+d38IsScsYfnreH8V2BSV3mwtFBkQQB0v
 Mi6pjU+MnsZeocrjdX/ouk3S2Oz0FomXRIiVT2acU+xLgv4yFcphJZxytnTVcD3nw2FO
 ZqyuXtRkJFe1YRJksBq7Lbjilt8xAcL+lg/um8yIw/1nHG7OjKNxNDD2JGBRy/DB8DTc
 j0BjbOMle/bBjIdkz7DvXnbAwyFYWpVpwdVVB5i8iT+w7FqItiPuidRyVDlcO8CMlzLB
 vV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UF9C9rlsBDCs9WWqG2eWdP7HydEgcGaCKsEyc6/esyM=;
 b=FtaHoRdIYgGrYBsGq9ZOsGnve8rzavJGpBYa9ZJZEKEq6nDfuwkUq9zwrQXtGy42Es
 hkGPQTpv+sXu+bowabRu4Py0T6Ysl8Ai8eFEKH5pXdKPGpuvmKhV/PZilzJ+FTOFenQN
 jW0fHnNUbsvNZ7MQgdj38MU5iIeUhmtI/YscBS6XaEPnb4yu8KxaC8PSwPNKutxg5FKW
 80dx/k5FpbOavClWZ8WT48YTtta4P8WNolVYHMAxyY6W4yu9RxGFv2FiAodPLQrP8GPt
 aPi3Ys66B7nokoqJjfaQ4IGwUn3QyWS68pEXGcVTwiCq3Kq208IlkHFq45h7Gl6L9R/L
 k6wA==
X-Gm-Message-State: AOAM531NvNScLCH2OUl6v1+xdQqFa7GE0UpK4gbJ2KNAl0euTNGd2+6j
 Yu0xzh/kU9J4JLtXZ9kLovFm8Y1CedE=
X-Google-Smtp-Source: ABdhPJy01jgWHtQHWS6xsNSy6BAxU0CySc87Nr0u66dRpC5Nk+FddIpBrq9eYqoQcw+BSsxP28Ez/g==
X-Received: by 2002:adf:f58f:: with SMTP id f15mr66717570wro.388.1609455036959; 
 Thu, 31 Dec 2020 14:50:36 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id v4sm71421865wrw.42.2020.12.31.14.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:50:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/18] hw/pci-host/bonito: Declare TYPE_BONITO_PCI_HOST_BRIDGE
 in include/
Date: Thu, 31 Dec 2020 23:49:10 +0100
Message-Id: <20201231224911.1467352-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Declare TYPE_BONITO_PCI_HOST_BRIDGE in the new "hw/pci-host/bonito.h"
header, so we can inline the bonito_init() call in the next commit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/pci-host/bonito.h | 34 ++++++++++++++++++++++++++++++++++
 hw/pci-host/bonito.c         | 16 +---------------
 MAINTAINERS                  |  1 +
 3 files changed, 36 insertions(+), 15 deletions(-)
 create mode 100644 include/hw/pci-host/bonito.h

diff --git a/include/hw/pci-host/bonito.h b/include/hw/pci-host/bonito.h
new file mode 100644
index 00000000000..d0264f34783
--- /dev/null
+++ b/include/hw/pci-host/bonito.h
@@ -0,0 +1,34 @@
+/*
+ * Algorithmics Bonito64 'north bridge' controller
+ *
+ * Copyright (c) 2008 yajin (yajin@vm-kernel.org)
+ * Copyright (c) 2010 Huacai Chen (zltjiangshi@gmail.com)
+ * Copyright (c) 2020 Philippe Mathieu-Daudé <f4bug@amsat.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef HW_PCI_HOST_BONITO_H
+#define HW_PCI_HOST_BONITO_H
+
+#include "exec/memory.h"
+#include "hw/pci/pci_host.h"
+#include "qom/object.h"
+
+typedef struct BonitoPciState BonitoPciState;
+
+#define TYPE_BONITO_PCI_HOST_BRIDGE "Bonito-pcihost"
+OBJECT_DECLARE_SIMPLE_TYPE(BonitoState, BONITO_PCI_HOST_BRIDGE)
+
+typedef struct BonitoState BonitoState;
+
+struct BonitoState {
+    /*< private >*/
+    PCIHostState parent_obj;
+    /*< public >*/
+    qemu_irq *pic;
+    BonitoPciState *pci_dev;
+    MemoryRegion pci_mem;
+    MemoryRegion pcimem_lo_alias[3];
+};
+
+#endif
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 5a8a85ae443..b959b353854 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -45,6 +45,7 @@
 #include "hw/pci/pci.h"
 #include "hw/irq.h"
 #include "hw/mips/mips.h"
+#include "hw/pci-host/bonito.h"
 #include "hw/pci/pci_host.h"
 #include "migration/vmstate.h"
 #include "sysemu/reset.h"
@@ -198,8 +199,6 @@ FIELD(PCIMAP, 2G,               18, 1)
     ((((busno) << 16) & 0xff0000) + (((devno) << 11) & 0xf800) + \
     (((funno) << 8) & 0x700) + (regno))
 
-typedef struct BonitoState BonitoState;
-
 struct BonitoPciState {
     PCIDevice dev;
 
@@ -227,20 +226,7 @@ struct BonitoPciState {
     MemoryRegion iomem_cop;
     MemoryRegion bonito_pciio;
     MemoryRegion bonito_localio;
-
 };
-typedef struct BonitoPciState BonitoPciState;
-
-struct BonitoState {
-    PCIHostState parent_obj;
-    qemu_irq *pic;
-    BonitoPciState *pci_dev;
-    MemoryRegion pci_mem;
-    MemoryRegion pcimem_lo_alias[3];
-};
-
-#define TYPE_BONITO_PCI_HOST_BRIDGE "Bonito-pcihost"
-OBJECT_DECLARE_SIMPLE_TYPE(BonitoState, BONITO_PCI_HOST_BRIDGE)
 
 #define TYPE_PCI_BONITO "Bonito"
 OBJECT_DECLARE_SIMPLE_TYPE(BonitoPciState, PCI_BONITO)
diff --git a/MAINTAINERS b/MAINTAINERS
index 1e7c8f04885..2e22830efba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1153,6 +1153,7 @@ F: hw/mips/fuloong2e.c
 F: hw/isa/vt82c686.c
 F: hw/pci-host/bonito.c
 F: include/hw/isa/vt82c686.h
+F: include/hw/pci-host/bonito.h
 
 Loongson-3 virtual platforms
 M: Huacai Chen <chenhuacai@kernel.org>
-- 
2.26.2


