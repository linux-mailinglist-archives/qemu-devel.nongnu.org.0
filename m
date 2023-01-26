Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7790A67D788
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 22:19:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9dK-000815-W0; Thu, 26 Jan 2023 16:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9d8-0007x5-1U; Thu, 26 Jan 2023 16:17:58 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9d6-0007jX-FH; Thu, 26 Jan 2023 16:17:57 -0500
Received: by mail-ej1-x633.google.com with SMTP id v6so8638139ejg.6;
 Thu, 26 Jan 2023 13:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o8JuCJ+MK8BSdi47hiI3ktQK7/lqejbuLuPqwQLbMvQ=;
 b=F2DImfWJINLLnKTzuAuSDKbCpo4DRQicKtocvpoq2HxJL354sDM0Mzxky13GqWwvzi
 xwRhNZR/MIdyMUwYYPIublC+IiD5eyP/Kk5HLMQ/l4fQW/Pr2hycGuJx1r7a4AmZWrHF
 chHaKcdEjR/f3kaUTKVaWx+fp3EV8f+RJp162wH+ixhKqVP1IHP6/2lLAKYnNsw6bzD/
 rssy4aZqQR4FIxMJOfofYpjFuDjBDmvJwS1SoZTAYtBaccu4x8nF3cPwinQpNe0fASlM
 8uYgC1bDOZ/eHF3qmlJjwiPBYYDhpD8SMm4ymmzjsw3WOEJLAehHHnkWEunA1wtMNVSv
 5dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o8JuCJ+MK8BSdi47hiI3ktQK7/lqejbuLuPqwQLbMvQ=;
 b=nrqeDvqG6glrbF6jKznf402k+dSwjCSynS9ceRxyKSd+QL5229Rll9V+Z0/EOzHGhl
 On9NYnskCZstJzMK17BIyS/rpwF0cJ5razYLD4B5+8ST9dU8i/metIFRuJYbUcysoujS
 g08Y/NTQAzMMy1Xv5PrGf4M/EItpfsdl+v7xiPTzjJHp7BnAgK7FVpWCHDuCCfQwkBxB
 aYI/uZEZqtGXTKqp5ahIJw5ee9QYTsBeuUVsFiowjo5SNx19Wjohe0dTjQIdEovc7MEK
 n8Yqcn5sbSzYB1SGBXHkhXt3sNKRo2h8cgnsvoPNQTtqr9uvqSq4RpCRmyVomfJGyB3X
 zsCg==
X-Gm-Message-State: AFqh2koQjiRAibNs7UAxWd5PGhys63sGFVnP44+Ve4X+tCaqG/9l0BmS
 pRKuxZyMM+6GM9w+CUPRbsy+a5tnlhQxYg==
X-Google-Smtp-Source: AMrXdXst8Higc9bV5z7c3cicO70+hC743R96fQwVzO/4xNwNfYX2A/6stZHPoWLuVkGinqmrrie90Q==
X-Received: by 2002:a17:907:2a07:b0:86f:4a4e:4853 with SMTP id
 fd7-20020a1709072a0700b0086f4a4e4853mr33236951ejc.49.1674767874176; 
 Thu, 26 Jan 2023 13:17:54 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170906384500b00878003adeeesm1117568ejc.23.2023.01.26.13.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 13:17:53 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 04/10] hw/ide/piix: Disuse isa_get_irq()
Date: Thu, 26 Jan 2023 22:17:34 +0100
Message-Id: <20230126211740.66874-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126211740.66874-1-shentey@gmail.com>
References: <20230126211740.66874-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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

isa_get_irq() asks for an ISADevice which piix-ide doesn't provide.
Passing a NULL pointer works but causes the isabus global to be used
then. By fishing out TYPE_ISA_BUS from the QOM tree it is possible to
achieve the same as isa_get_irq().

This is an alternative solution to commit 9405d87be25d 'hw/ide: Fix
crash when plugging a piix3-ide device into the x-remote machine' which
allows for cleaning up the ISA API while keeping PIIX IDE functions
user-createable.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/piix.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 267dbf37db..a6646d9657 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -126,7 +126,7 @@ static void piix_ide_reset(DeviceState *dev)
     pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
 }
 
-static int pci_piix_init_ports(PCIIDEState *d)
+static int pci_piix_init_ports(PCIIDEState *d, ISABus *isa_bus)
 {
     static const struct {
         int iobase;
@@ -145,7 +145,7 @@ static int pci_piix_init_ports(PCIIDEState *d)
         if (ret) {
             return ret;
         }
-        ide_init2(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
+        ide_init2(&d->bus[i], isa_bus->irqs[port_info[i].isairq]);
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
         d->bmdma[i].bus = &d->bus[i];
@@ -159,6 +159,8 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 {
     PCIIDEState *d = PCI_IDE(dev);
     uint8_t *pci_conf = dev->config;
+    ISABus *isa_bus;
+    bool ambiguous;
     int rc;
 
     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
@@ -168,7 +170,20 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
 
-    rc = pci_piix_init_ports(d);
+    isa_bus = ISA_BUS(object_resolve_path_type("", TYPE_ISA_BUS, &ambiguous));
+    if (ambiguous) {
+        error_setg(errp,
+                   "More than one ISA bus found while %s supports only one",
+                   object_get_typename(OBJECT(dev)));
+        return;
+    }
+    if (!isa_bus) {
+        error_setg(errp, "No ISA bus found while %s requires one",
+                   object_get_typename(OBJECT(dev)));
+        return;
+    }
+
+    rc = pci_piix_init_ports(d, isa_bus);
     if (rc) {
         error_setg_errno(errp, -rc, "Failed to realize %s",
                          object_get_typename(OBJECT(dev)));
-- 
2.39.1


