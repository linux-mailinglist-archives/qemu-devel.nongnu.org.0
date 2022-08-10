Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B9F58EA72
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 12:28:41 +0200 (CEST)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLix6-0000r1-Bo
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 06:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLibL-0006sd-N3; Wed, 10 Aug 2022 06:06:13 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:44773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLibJ-0000vc-42; Wed, 10 Aug 2022 06:06:11 -0400
Received: by mail-ua1-x934.google.com with SMTP id b4so5597949uaw.11;
 Wed, 10 Aug 2022 03:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Hfuw5RzBkMbXsmj+o423gKdtHcBJZMl3x+2reeWvekQ=;
 b=drKNLLT7mz+saQGmqfCXqO6Klhtv67qyP6rGvgK4FnjK0bbM1MaMD7A/Oi04PsiqSO
 WYPY7VbkJRlDb8GXDtX3KHkT0gyqRwh8uc3yyHTjgmMsZGV6RtNUvosTaF5eOkkiKVw2
 4IStEsh6qoLhl3vO0TCltCOZd7ZCLKZi/zl7HSFB/EbijheBvofiTw3M5aPYRipuQ59A
 nPDsy3vkAGIUk9Nrv8yH0fPQdP64Q9z8AqVRF650p63DfEyyH1SDr6FJRmwaP/YqPLHm
 eno3YXqqTqBtgzx4I2lRRgXupHpSfcSmPv7IIIxi0Ra11vdYBKuea/Z00CQfkjuNwpK2
 bdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Hfuw5RzBkMbXsmj+o423gKdtHcBJZMl3x+2reeWvekQ=;
 b=CNV++jcY+26w39Q2JgruC4ufAnFra3XUUfp6V3bS1BSJ/unFFj08jvDujcOiJ91dAe
 vb8wPgUwNAAWZco59YvKQf088gwm/66TybAX4kr8OXpscWMLeFrNGyn/SwdMhcRfoo1j
 KaAIfxsnzKusI5pHZC/aiEtIqQsr5s36pK6POO2f6bpl6mty75CHd0H9R/GlrHBx+LZ8
 Ua1AWcRyvLQyuDZ9g3GtmKaslG6eNK7iZhtjDDnkVMp+4kCxkb+4E5bijtwRN5DZXvMu
 M1iEMu8xWO/W9otOa9Pl1qm+5lougqaRS12y8LZ/AhfNQA0hdl8IzcwjfZ5z0c4gzTVg
 DyKg==
X-Gm-Message-State: ACgBeo2B/7sSUb+W8gcLSb+CLhDkl0u7Nj6WBeVNXsFehz7ylgRN3240
 49RyF+Q4EKPXimSZQfdeV98hs20id3M=
X-Google-Smtp-Source: AA6agR7m3cOgLCdUYy2NiIxOfHVaTzqGdUzNTXPhw2UR9OPk7XpUlY4CK1eYhDx0m1x4F02pE4TMQg==
X-Received: by 2002:a05:6130:1102:b0:38c:49b4:bbc3 with SMTP id
 ce2-20020a056130110200b0038c49b4bbc3mr11324276uab.107.1660125966504; 
 Wed, 10 Aug 2022 03:06:06 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 2-20020a1f1602000000b0037613541b27sm12277919vkw.39.2022.08.10.03.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 03:06:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 11/11] ppc/pnv: fix QOM parenting of user creatable
 root ports
Date: Wed, 10 Aug 2022 07:05:36 -0300
Message-Id: <20220810100536.473859-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220810100536.473859-1-danielhb413@gmail.com>
References: <20220810100536.473859-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

User creatable root ports are being parented by the 'peripheral' or the
'peripheral-anon' container. This happens because this is the regular
QOM schema for sysbus devices that are added via the command line.

Let's make this QOM hierarchy similar to what we have with default root
ports, i.e. the root port must be parented by the pnv-root-bus. To do
that we change the qom and bus parent of the root port during
root_port_realize(). The realize() is shared by the default root port
code path, so we can remove the code inside pnv_phb_attach_root_port()
that was adding the root port as a child of the bus as well.

While we're at it, change pnv_phb_attach_root_port() to receive a PCIBus
instead of a PCIHostState to make it clear that the function does not
make use of the PHB.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index feaef8137f..09cea12091 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -91,27 +91,11 @@ static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
     return NULL;
 }
 
-/*
- * Attach a root port device.
- *
- * 'index' will be used both as a PCIE slot value and to calculate
- * QOM id. 'chip_id' is going to be used as PCIE chassis for the
- * root port.
- */
-static void pnv_phb_attach_root_port(PCIHostState *pci)
+static void pnv_phb_attach_root_port(PCIBus *bus)
 {
     PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
-    const char *dev_id = DEVICE(root)->id;
-    g_autofree char *default_id = NULL;
-    int index;
 
-    index = object_property_get_int(OBJECT(pci->bus), "phb-id", &error_fatal);
-    default_id = g_strdup_printf("%s[%d]", TYPE_PNV_PHB_ROOT_PORT, index);
-
-    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
-                              OBJECT(root));
-
-    pci_realize_and_unref(root, pci->bus, &error_fatal);
+    pci_realize_and_unref(root, bus, &error_fatal);
 }
 
 /*
@@ -228,7 +212,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    pnv_phb_attach_root_port(pci);
+    pnv_phb_attach_root_port(pci->bus);
 }
 
 static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
@@ -297,12 +281,19 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
 {
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
     PnvPHBRootPort *phb_rp = PNV_PHB_ROOT_PORT(dev);
-    PCIBus *bus = PCI_BUS(qdev_get_parent_bus(dev));
+    BusState *qbus = qdev_get_parent_bus(dev);
+    PCIBus *bus = PCI_BUS(qbus);
     PCIDevice *pci = PCI_DEVICE(dev);
     uint16_t device_id = 0;
     Error *local_err = NULL;
     int chip_id, index;
 
+
+    /*
+     * 'index' will be used both as a PCIE slot value and to calculate
+     * QOM id. 'chip_id' is going to be used as PCIE chassis for the
+     * root port.
+     */
     chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
     index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
 
@@ -310,6 +301,11 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
     qdev_prop_set_uint8(dev, "chassis", chip_id);
     qdev_prop_set_uint16(dev, "slot", index);
 
+    pnv_parent_qom_fixup(OBJECT(bus), OBJECT(dev), index);
+    if (!qdev_set_parent_bus(dev, qbus, &error_fatal)) {
+        return;
+    }
+
     rpc->parent_realize(dev, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-- 
2.36.1


