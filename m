Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4383038827D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 23:58:24 +0200 (CEST)
Received: from localhost ([::1]:58530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7jL-0001Ko-75
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 17:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7hA-00076J-8v
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7h7-00038x-1m
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621374964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gn9E3ldchIQVg6abwyiugztlAOCm9ATrI49DFupz98Y=;
 b=AgEFyE6zJHGCuBL8/d6D8VNbyIJzbxB1DM44ve8up0hbz3klsncikxq0ZJdPNQ0BK9RV+2
 5ROcEBrKsIIlQ2/Cb2vstR8JemdBqhJOk7zftVuQredyULiNAWA1hAk99Z01XzLAty+0kw
 aoc26iyOEeOyqXp3ACNj/C/w0LphnJE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-vPMh-Mr0Psqmto7hpXwBvQ-1; Tue, 18 May 2021 17:56:02 -0400
X-MC-Unique: vPMh-Mr0Psqmto7hpXwBvQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 x20-20020a1709061354b02903cff4894505so2926809ejb.14
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 14:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gn9E3ldchIQVg6abwyiugztlAOCm9ATrI49DFupz98Y=;
 b=V1niTXCtHWCbbBwIm+UQje0AaeStP8Sv4rOjnZdeEzw8WIdMHgFNBM7k8ESkC0bVFS
 L0vvtPPdYPC0/lhiV5mOAvlRDJOB4NJ2MCeRBedjuFy8KPZ1duT77u1bQOf+QkfPEXgF
 3XzShC6Vh1IeJz9Fui4X48zfZVrH7Q3rJRNOp0BWAZb3oRQNxH2+5bXrxzhiCEWt3zv1
 KyAMeLyv/xgOCCTdZyFT9wcd0An0nxpxmRzWlpheiMK4igiUuBhSjVfooria+TH0H/5Q
 VY6JrrY5Jq0ECEMOVFlyVgsoe6ennqYsDX1OD1Eo4OQ0N1ZDIl9TM5qvuUr4WzG2hfie
 iCEw==
X-Gm-Message-State: AOAM5332GEhVb2+J+A6+7LSZwAP0kCImyP7EwSNqWzkKW7m7m/HNAZUZ
 JcFf2v2CJluh2D0tknnTh7GK9N5GdJyt/u9EXoS5Rl1RoZNozTCZcHqUsM6GR3veKZ+ylmtxDbv
 uDguSJF0S/wp+DLI=
X-Received: by 2002:aa7:c789:: with SMTP id n9mr9670504eds.352.1621374961702; 
 Tue, 18 May 2021 14:56:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgc8iWE4iB6idJShlAeZwhnPROOUoOUE7+ks3AVxbdhNDGXzEmoj0aqRcNnCUWsppBXEOQ0A==
X-Received: by 2002:aa7:c789:: with SMTP id n9mr9670485eds.352.1621374961501; 
 Tue, 18 May 2021 14:56:01 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id zg18sm3285302ejb.41.2021.05.18.14.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 14:56:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 03/11] hw/ide/piix: Set the ISA-bus QOM link
Date: Tue, 18 May 2021 23:55:37 +0200
Message-Id: <20210518215545.1793947-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518215545.1793947-1-philmd@redhat.com>
References: <20210518215545.1793947-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set the ISA Bus link property on the PIIX IDE object from the
two unique users, the PC machine and the PIIX4 function.

Add a check in pci_piix_ide_realize() to be sure this property
is set.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/pc_piix.c |  2 ++
 hw/ide/piix.c     |  5 +++++
 hw/isa/piix4.c    | 10 +++++++---
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index fb606c14768..d799c8004df 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -246,6 +246,8 @@ static void pc_init1(MachineState *machine,
 
         dev = pci_new(piix3_devfn + 1,
                       xen_enabled() ? "piix3-ide-xen" : "piix3-ide");
+        object_property_set_link(OBJECT(dev), "isa-bus",
+                                 OBJECT(isa_bus), &error_abort);
         pci_realize_and_unref(dev, pci_bus, &error_abort);
         pci_ide_create_devs(dev);
         idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 48da68da37f..3aef9b1e21c 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -152,6 +152,11 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     PCIIDEState *d = PCI_IDE(dev);
     uint8_t *pci_conf = dev->config;
 
+    if (!d->isa_bus) {
+        error_setg(errp, "piix-ide: 'isa-bus' link not set");
+        return;
+    }
+
     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
 
     bmdma_setup_bar(d);
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index d60f161ecf4..ef11c2d1f8d 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -248,20 +248,24 @@ static void piix4_register_types(void)
 
 type_init(piix4_register_types)
 
-DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
+DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_busp, I2CBus **smbus)
 {
     PCIDevice *pci;
     DeviceState *dev;
+    ISABus *isa_bus;
     int devfn = PCI_DEVFN(10, 0);
 
     pci = pci_create_simple_multifunction(pci_bus, devfn,  true,
                                           TYPE_PIIX4_PCI_DEVICE);
     dev = DEVICE(pci);
-    if (isa_bus) {
-        *isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
+    isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
+    if (isa_busp) {
+        *isa_busp = isa_bus;
     }
 
     pci = pci_new(devfn + 1, "piix4-ide");
+    object_property_set_link(OBJECT(pci), "isa-bus",
+                             OBJECT(isa_bus), &error_abort);
     pci_realize_and_unref(pci, pci_bus, &error_abort);
     pci_ide_create_devs(pci);
 
-- 
2.26.3


