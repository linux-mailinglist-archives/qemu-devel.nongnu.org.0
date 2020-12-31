Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D712E8293
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 23:56:35 +0100 (CET)
Received: from localhost ([::1]:36428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6rz-0001T3-12
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 17:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6mB-0002dN-5H
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:35 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6m9-0006uj-LU
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:34 -0500
Received: by mail-wr1-x433.google.com with SMTP id y17so21025385wrr.10
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bRQj82c2dJ/rqcosZjZiHFbNtmid7e/8/vWsz4qrKdU=;
 b=dZFm8j+1d+3sYs3D7TjZklBb2QYT/Ree7TerLC35X/83Rm0x+1Pq0ygi2TqsPnEOwX
 yGzezJv10J+WwzdYIcGoNV1BwZl/u+PTP6xX6qM7ZSaCPD+6Cr18gCV1i9jYS6Rsuxwe
 4paQV/3PS7iibRQm+6N28ZWmFULWIaXaymrjfMC1MbYqwE3A6dGBsutMBQym9gzadE3h
 sVNBqwmvaFayanshiQTR07rOanTTxB1OQxrRIRP09TJUWn5NvE7pioqnu2oxIOfUhbJw
 8oB0pygtLGBWZGGTn/OueneAoUJbD7248g1i4Bm85yDY5t9jm3BNGEVDZncAWbmOgWmm
 /BbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bRQj82c2dJ/rqcosZjZiHFbNtmid7e/8/vWsz4qrKdU=;
 b=fBKk73ceZZ3mh/YEomCrPVr6pr0nSKO1N+f1Kgi+TChS00k4EPDmvBEzV9EPBVqvNL
 NWqXdZB/t/jFdQfWhMrTbDtCBZ+iAJ/I8WILlGeCSdjgds/BaIg+4aN7szwgtj8zNJmD
 8ms1vEaIpMFr4RMSsrqvo62EIkNuva54nQI4XUdVZDNFdT9AActoVgaVbUqwfDhJFQ//
 8a4dM8aJ0GTrZMNiEDEksrQfi7HtHvHGWl0ukCyPzeE+Tc5DPpzDdCwohGhlW8TVqMOQ
 RH4E9kn91N1pYlkLwwmvKoDyWxxKyy3MFi6cyIhsEW1nMxvcNnThnIb4Jf1dV8XVkZNN
 QbXw==
X-Gm-Message-State: AOAM531+3l06WAhYCLCjMz/lSHZxJlsxPIIyIQqSthrUvaRnDwW1O+VS
 l0elFXLXIgMmjpsqFy2DdFEj87VE4Dk=
X-Google-Smtp-Source: ABdhPJzPg9G1rBCCh+xp8a/lzp24DhPTbZ92h2DGvfrSWfMUJFNlN/IdGN12qgYHZ5jW4NGWCxhNOw==
X-Received: by 2002:a5d:4b44:: with SMTP id w4mr65873135wrs.155.1609455032099; 
 Thu, 31 Dec 2020 14:50:32 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id u205sm15462023wme.42.2020.12.31.14.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:50:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/18] hw/pci-host/bonito: Create TYPE_PCI_BONITO in
 bonito_host_realize()
Date: Thu, 31 Dec 2020 23:49:09 +0100
Message-Id: <20201231224911.1467352-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

As it doesn't make sens to create the TYPE_BONITO_PCI_HOST_BRIDGE
PCI function device without its host side, create it in the host
realize(). This will allow to inline bonito_init() in few commits.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 099bb737c77..5a8a85ae443 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -622,6 +622,7 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
     PCIHostState *phb = PCI_HOST_BRIDGE(dev);
     BonitoState *bs = BONITO_PCI_HOST_BRIDGE(dev);
     MemoryRegion *pcimem_alias = g_new(MemoryRegion, 1);
+    PCIDevice *pci_dev;
 
     memory_region_init(&bs->pci_mem, OBJECT(dev), "pci.mem", BONITO_PCIHI_SIZE);
     phb->bus = pci_register_root_bus(dev, "pci",
@@ -645,6 +646,11 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
                           "north-bridge-pci-config", BONITO_PCICONFIG_SIZE);
     memory_region_add_subregion(get_system_memory(), BONITO_PCICONFIG_BASE,
                                 &phb->conf_mem);
+
+    pci_dev = pci_new(PCI_DEVFN(0, 0), TYPE_PCI_BONITO);
+    PCI_BONITO(pci_dev)->pcihost = bs;
+    bs->pci_dev = PCI_BONITO(pci_dev);
+    pci_realize_and_unref(pci_dev, phb->bus, &error_fatal);
 }
 
 static void bonito_pci_realize(PCIDevice *dev, Error **errp)
@@ -727,8 +733,6 @@ PCIBus *bonito_init(qemu_irq *pic)
     DeviceState *dev;
     BonitoState *pcihost;
     PCIHostState *phb;
-    BonitoPciState *s;
-    PCIDevice *d;
 
     dev = qdev_new(TYPE_BONITO_PCI_HOST_BRIDGE);
     phb = PCI_HOST_BRIDGE(dev);
@@ -736,12 +740,6 @@ PCIBus *bonito_init(qemu_irq *pic)
     pcihost->pic = pic;
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
-    d = pci_new(PCI_DEVFN(0, 0), TYPE_PCI_BONITO);
-    s = PCI_BONITO(d);
-    s->pcihost = pcihost;
-    pcihost->pci_dev = s;
-    pci_realize_and_unref(d, phb->bus, &error_fatal);
-
     return phb->bus;
 }
 
-- 
2.26.2


