Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5F8553902
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 19:37:51 +0200 (CEST)
Received: from localhost ([::1]:40150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3hp0-00077E-U0
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 13:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hm7-0002xG-DX; Tue, 21 Jun 2022 13:34:51 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:40666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hm5-0002Ln-HZ; Tue, 21 Jun 2022 13:34:51 -0400
Received: by mail-oi1-x229.google.com with SMTP id i25so17955543oii.7;
 Tue, 21 Jun 2022 10:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4CmgoMB3Shkp28H9b7m3CMHpdU8T5H538qsF+/3DIrs=;
 b=pvVH2ajD1Z9nWhfwpGsVLhGT7p3jk460HLvALGWOOGQJtYrRWh8uwjGqkhyB94s2qC
 sCV/Dhsfo3LnE+XXZL2Mz8pzc5/RCUyxUp5awd2aYUv5NCCmILyRuuNPUPcbATM+D/TP
 NWEXJ+is8tIDFHlFbRzQpOxfH0zX1eluqJoKT0uF56HXviehLhvshHpw/GBZ+RA9V4Yr
 RPYYQUFjEpA5IRQ2HC47JZc9R3OlfvKstfeX+TvMz1iFcVZdUkSxYRNwgl1B18c+jeI4
 ypDtxCPp1bKBGuv+WfzVSgsDuXSH5s+FVze2utF1r6kg5Pf2Fgb+2c8TnfLvSKif3xpK
 w/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4CmgoMB3Shkp28H9b7m3CMHpdU8T5H538qsF+/3DIrs=;
 b=DhvJ2ycJO+MD7PvmPR3seTR/u3s5FJqzBuvryHQhiC4T7pxhvqxNqvePklh/+9uRTI
 dNw/4lzTwjLa5lkwqA6auYLyXmAOXU9kuojtzPGCwLZ4nGBvzla/Afxmk6AKw9+r3Jt7
 ADM3nFPnrZckZQKyZ77TgIIHi/zEc4bY1I/RbCYW5vqDUwaGYa/Avz5yba6R6ElpJWCn
 cy2qUydTwyUktMOM5QuhB3kMLhz2UFS6WXIMULScxh0FBHDYByvfuLpSIzfWYMaIqTD5
 ahdAQ4NzU1OE9GjXJlVOjFIVOYJXMolHxuJqH0CeyCTTPPC3S/2pQA83SkXMpryxK+kg
 4+4A==
X-Gm-Message-State: AOAM530VGdv1vsRhoNBZ2xNoY3Naop5SepdODOrEwh3k0Vc8ZAkpS2VW
 KY4O0uFyqHyHEHffBE6uUEpR6LnHhkYmAw==
X-Google-Smtp-Source: ABdhPJybtKeTp2zLHhV7xp+UntE8pdiiFx0Ha9+dxilIqQNpugqZSbgQ9iWcBkDMkgedOHRe9SnCvg==
X-Received: by 2002:a05:6808:ecc:b0:322:319c:cd3 with SMTP id
 q12-20020a0568080ecc00b00322319c0cd3mr19728334oiv.148.1655832887867; 
 Tue, 21 Jun 2022 10:34:47 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a056870385600b0010200e2828fsm2886556oal.30.2022.06.21.10.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 10:34:47 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 3/8] ppc/pnv: assign pnv-phb-root-port chassis/slot earlier
Date: Tue, 21 Jun 2022 14:34:31 -0300
Message-Id: <20220621173436.165912-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621173436.165912-1-danielhb413@gmail.com>
References: <20220621173436.165912-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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

It is not advisable to execute an object_dynamic_cast() to poke into
bus->qbus.parent and follow it up with a C cast into the PnvPHB type we
think we got.

In fact this is not needed. There is nothing sophisticated being done
with the PHB object retrieved during root_port_realize() for both
PHB3 and PHB4. We're retrieving a PHB reference PHB just to access
phb->chip_id and phb->phb_id and use them to define the chassis/slot
of the root port.

phb->phb_id is already being passed to pnv_phb_attach_root_port() via
the 'index' parameter. Let's also add a 'chip_id' parameter to this
function and assign chassis and slot right there. This will spare us
from the hassle of accessing the PHB object inside realize().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c | 18 ++----------------
 hw/pci-host/pnv_phb4.c | 18 ++----------------
 hw/ppc/pnv.c           | 15 +++++++++++++--
 include/hw/ppc/pnv.h   |  3 ++-
 4 files changed, 19 insertions(+), 35 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 4ba660f8b9..afe5698167 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1052,7 +1052,8 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
 
     pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
 
-    pnv_phb_attach_root_port(pci, TYPE_PNV_PHB3_ROOT_PORT, phb->phb_id);
+    pnv_phb_attach_root_port(pci, TYPE_PNV_PHB3_ROOT_PORT,
+                             phb->phb_id, phb->chip_id);
 }
 
 void pnv_phb3_update_regions(PnvPHB3 *phb)
@@ -1139,23 +1140,8 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
 {
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
     PCIDevice *pci = PCI_DEVICE(dev);
-    PCIBus *bus = pci_get_bus(pci);
-    PnvPHB3 *phb = NULL;
     Error *local_err = NULL;
 
-    phb = (PnvPHB3 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
-                                          TYPE_PNV_PHB3);
-
-    if (!phb) {
-        error_setg(errp,
-"pnv_phb3_root_port devices must be connected to pnv-phb3 buses");
-        return;
-    }
-
-    /* Set unique chassis/slot values for the root port */
-    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
-    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
-
     rpc->parent_realize(dev, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index ffd9d8a947..725b3d740b 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1585,7 +1585,8 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
 
     /* Add a single Root port if running with defaults */
-    pnv_phb_attach_root_port(pci, pecc->rp_model, phb->phb_id);
+    pnv_phb_attach_root_port(pci, pecc->rp_model,
+                             phb->phb_id, phb->chip_id);
 
     /* Setup XIVE Source */
     if (phb->big_phb) {
@@ -1781,23 +1782,8 @@ static void pnv_phb4_root_port_reset(DeviceState *dev)
 static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
 {
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
-    PCIDevice *pci = PCI_DEVICE(dev);
-    PCIBus *bus = pci_get_bus(pci);
-    PnvPHB4 *phb = NULL;
     Error *local_err = NULL;
 
-    phb = (PnvPHB4 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
-                                          TYPE_PNV_PHB4);
-
-    if (!phb) {
-        error_setg(errp, "%s must be connected to pnv-phb4 buses", dev->id);
-        return;
-    }
-
-    /* Set unique chassis/slot values for the root port */
-    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
-    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
-
     rpc->parent_realize(dev, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 40e0cbd84d..c5e63bede7 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1189,8 +1189,15 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
     }
 }
 
-/* Attach a root port device */
-void pnv_phb_attach_root_port(PCIHostState *pci, const char *name, int index)
+/*
+ * Attach a root port device.
+ *
+ * 'index' will be used both as a PCIE slot value and to calculate
+ * QOM id. 'chip_id' is going to be used as PCIE chassis for the
+ * root port.
+ */
+void pnv_phb_attach_root_port(PCIHostState *pci, const char *name,
+                              int index, int chip_id)
 {
     PCIDevice *root = pci_new(PCI_DEVFN(0, 0), name);
     g_autofree char *default_id = g_strdup_printf("%s[%d]", name, index);
@@ -1199,6 +1206,10 @@ void pnv_phb_attach_root_port(PCIHostState *pci, const char *name, int index)
     object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
                               OBJECT(root));
 
+    /* Set unique chassis/slot values for the root port */
+    qdev_prop_set_uint8(DEVICE(root), "chassis", chip_id);
+    qdev_prop_set_uint16(DEVICE(root), "slot", index);
+
     pci_realize_and_unref(root, pci->bus, &error_fatal);
 }
 
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 033890a23f..b991194223 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -189,7 +189,8 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
                          TYPE_PNV_CHIP_POWER10)
 
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
-void pnv_phb_attach_root_port(PCIHostState *pci, const char *name, int index);
+void pnv_phb_attach_root_port(PCIHostState *pci, const char *name,
+                              int index, int chip_id);
 
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
 typedef struct PnvMachineClass PnvMachineClass;
-- 
2.36.1


