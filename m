Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0398547441
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:31:51 +0200 (CEST)
Received: from localhost ([::1]:47214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzLK-0004Mx-2Z
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTk-0006DU-Q1
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:29 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTj-0006m9-1U
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:28 -0400
Received: by mail-wm1-x332.google.com with SMTP id e5so644128wma.0
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFhGkxlpRDZVPZOcBcovih+c/cb+eSa7SfXQerC0nSE=;
 b=aluCOOmWl557lOq1G5jNvnXZxTPero1MrJWT5ZolSANgIg/33TBTbVMHtHvV+pePe8
 Xc3tjE5a/DW85Bg8Mm0HVEDSL0sy0BS1R6i8Bco7MTeJwXgTbJzbolFLVbZx2ZPuMuT8
 mWSKJW9ntoDq1LMboxc9gIid8/QjInM7aGAZMNKAACWe44V9n1lEltbxiikSBDBtQVQ4
 rs5tJqDVKBqOLHDlLg3uTPk3GWHBbexc2LiAxBpJdM0C7PCaVnvbckVWcIkTwJIfrLNd
 VngmRWd2WCOHlNVs3rAwX2m6EjEyDKjrEbkhaGEwPggx7RNXXsYN/dgqFW7GcTBMjR4K
 Az9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OFhGkxlpRDZVPZOcBcovih+c/cb+eSa7SfXQerC0nSE=;
 b=H387QcuYFcXlXIky953+KnO1XYH8FLjXr3X/bxXqMq/jf1rZfjMONPTg4NcuARm+vQ
 j6AamMHrNkHtFlxYGWEJloJdqkcaWPmbAHyp2O8tO5EC7G9H0FvMEV3TSpDu+OVzeUne
 W4gKdZ3Vfu80OKe+FqQ9KW9qIBUstCGWhySMNsC0RnQO/Bj/6EnE/FG122b2FkxJ20Q9
 n+gVdXjLZvdLk2aJMjgxkCKJib8TUoDqLUzQmftazIRhmHc96AgXDWtQRP+PMrW1vge5
 x7TDeeGRZi1jucZ+eufSUnfCUuVccGkY41VRajHoSv63Tcwv58TyInOM6PW+Ii8lyzFb
 fQhA==
X-Gm-Message-State: AOAM532+gtFTIgr4S7VDFxblRL2OUdwZNFJdrXF4IiQnH9AWm8A0rBhu
 lYf71CqjsDUSMWaIzPR7eQadJSbSfC0=
X-Google-Smtp-Source: ABdhPJyE237ArsyrgFF1HhDtuKTWkEMt1tLnAP9Yt0mq2SO8HQc4sWikurt5EKkHIFy7Blg/cu5SHQ==
X-Received: by 2002:a05:600c:5011:b0:397:6e41:f6ec with SMTP id
 n17-20020a05600c501100b003976e41f6ecmr4312933wmr.190.1654943784888; 
 Sat, 11 Jun 2022 03:36:24 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 u2-20020a056000038200b0020ff3a2a925sm2552912wrf.63.2022.06.11.03.36.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:36:24 -0700 (PDT)
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
Subject: [PULL 37/49] hw/isa/piix3: Inline and remove piix3_create()
Date: Sat, 11 Jun 2022 12:33:00 +0200
Message-Id: <20220611103312.67773-38-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

During the previous changesets piix3_create() became a trivial
wrapper around more generic functions. Modernize the code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220603185045.143789-12-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/pc_piix.c             |  6 +++++-
 hw/isa/piix3.c                | 13 -------------
 include/hw/southbridge/piix.h |  2 --
 3 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 70c337c44b..0fc2361ffe 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -197,6 +197,9 @@ static void pc_init1(MachineState *machine,
 
     if (pcmc->pci_enabled) {
         PIIX3State *piix3;
+        PCIDevice *pci_dev;
+        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
+                                         : TYPE_PIIX3_DEVICE;
 
         pci_bus = i440fx_init(host_type,
                               pci_type,
@@ -207,7 +210,8 @@ static void pc_init1(MachineState *machine,
                               pci_memory, ram_memory);
         pcms->bus = pci_bus;
 
-        piix3 = piix3_create(pci_bus);
+        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+        piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index d57a7fe6d6..6388558f92 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -416,16 +416,3 @@ static void piix3_register_types(void)
 }
 
 type_init(piix3_register_types)
-
-PIIX3State *piix3_create(PCIBus *pci_bus)
-{
-    PIIX3State *piix3;
-    PCIDevice *pci_dev;
-    const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
-                                     : TYPE_PIIX3_DEVICE;
-
-    pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
-    piix3 = PIIX3_PCI_DEVICE(pci_dev);
-
-    return piix3;
-}
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index f805fb8683..2693778b23 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -68,6 +68,4 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
 #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
 #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
 
-PIIX3State *piix3_create(PCIBus *pci_bus);
-
 #endif
-- 
2.36.1


