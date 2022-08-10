Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6304A58EA5C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 12:17:14 +0200 (CEST)
Received: from localhost ([::1]:46272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLim1-0000Nc-F2
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 06:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLiaz-0006o7-Mn; Wed, 10 Aug 2022 06:05:49 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a]:39583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLiax-0000s2-Ub; Wed, 10 Aug 2022 06:05:49 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id q191so7146436vkb.6;
 Wed, 10 Aug 2022 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=u503m2SCRYm6s6XAxPT5+3oWEmQoe2DCrk66kmZCz14=;
 b=mVQmq6NSZ40P5cP+1Fi1F1N1MTgVcqKPJw9M+yQv0yET29NEzat7SUt6MskmR0L20O
 ju6Vv4UKswzV0EOgXrGa5CKsOiHI9CvAvr6KfdYDNq/FfQt96PsDH5jvVVvb6mRU+9WI
 SGZ+plmgk1sd5uIlgUsW4o0EFNPY0/OKdgI2O2sh/5UMXykZtjGX9mBAdhVznoxcepKT
 z+KxoQEi1FxEcnVX+hJuniDqyUzhkC03q3lYui+f0rVMnL2uQ/bB6Fk6nxwf6qTSea3Q
 hw41z5Gpa1Yd+CBKf3CCpy0iZjbkanC9Rr/dHtrsGht307LD+QK9wUN+xDDjkVIA+BPo
 yn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=u503m2SCRYm6s6XAxPT5+3oWEmQoe2DCrk66kmZCz14=;
 b=rHfrAX/E9w0L7OxksE2mJC+aHCG+LTo00tmcPUzkYgi+PVHokiyzIYeInD1ZCVPenL
 bb6IFV51KS0IDSR4hCJoIlKNn7NJEj76+yhP4YpUZCHnj8Y6Q2GC7o0izXJziGQ9I3re
 p24kyITPRUGo/AXuTDVmnCg61rPP8Cq1SSg1OkdjZQzazZo0CaxxliIXTstMIuk1G6n0
 nPwYNx011BVodc+UTf7yxPKniJ2dpLIK6IR+RXr/TNOcUd+O1t0Q1TV/Ujx/t5OkwRtY
 ocKeN+B6hUtbpmyEs+18vjd4Orbv/hSpHWz2aYxg5/39zI1weMa9dCnI/mHZXfRZ5fWb
 QQrw==
X-Gm-Message-State: ACgBeo07xISKmTz05l21UfFo/Cz8Eejb6F4hK962g2IiGUXprmUMD/nG
 Tj9Os7t4j0qIMCD94DSSj+k6VFdWtWo=
X-Google-Smtp-Source: AA6agR4nJCSoweMQwmpIEVtbgCyBeyNkPGUVpJpLgf3XfsH6nE4H77p90wc3VLp55C6XjkBcMEmkuQ==
X-Received: by 2002:a1f:30cb:0:b0:376:486a:7cb6 with SMTP id
 w194-20020a1f30cb000000b00376486a7cb6mr11097960vkw.29.1660125946474; 
 Wed, 10 Aug 2022 03:05:46 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 2-20020a1f1602000000b0037613541b27sm12277919vkw.39.2022.08.10.03.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 03:05:46 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 02/11] ppc/pnv: add phb-id/chip-id PnvPHB4RootBus
 properties
Date: Wed, 10 Aug 2022 07:05:27 -0300
Message-Id: <20220810100536.473859-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220810100536.473859-1-danielhb413@gmail.com>
References: <20220810100536.473859-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2a.google.com
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

The same rationale provided in the PHB3 bus case applies here.

Note: we could have merged both buses in a single object, like we did
with the root ports, and spare some boilerplate. The reason we opted to
preserve both buses objects is twofold:

- there's not user side advantage in doing so. Unifying the root ports
presents a clear user QOL change when we enable user created devices back.
The buses objects, aside from having a different QOM name, is transparent
to the user;

- we leave a door opened in case we want to increase the root port limit
for phb4/5 later on without having to deal with phb3 code.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 51 ++++++++++++++++++++++++++++++++++
 include/hw/pci-host/pnv_phb4.h | 10 +++++++
 2 files changed, 61 insertions(+)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index b98c394713..824e1a73fb 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1551,6 +1551,12 @@ void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb)
                                      pnv_phb4_set_irq, pnv_phb4_map_irq, phb,
                                      &phb->pci_mmio, &phb->pci_io,
                                      0, 4, TYPE_PNV_PHB4_ROOT_BUS);
+
+    object_property_set_int(OBJECT(pci->bus), "phb-id", phb->phb_id,
+                            &error_abort);
+    object_property_set_int(OBJECT(pci->bus), "chip-id", phb->chip_id,
+                            &error_abort);
+
     pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
     pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
 }
@@ -1708,10 +1714,55 @@ static const TypeInfo pnv_phb5_type_info = {
     .instance_size = sizeof(PnvPHB4),
 };
 
+static void pnv_phb4_root_bus_get_prop(Object *obj, Visitor *v,
+                                       const char *name,
+                                       void *opaque, Error **errp)
+{
+    PnvPHB4RootBus *bus = PNV_PHB4_ROOT_BUS(obj);
+    uint64_t value = 0;
+
+    if (strcmp(name, "phb-id") == 0) {
+        value = bus->phb_id;
+    } else {
+        value = bus->chip_id;
+    }
+
+    visit_type_size(v, name, &value, errp);
+}
+
+static void pnv_phb4_root_bus_set_prop(Object *obj, Visitor *v,
+                                       const char *name,
+                                       void *opaque, Error **errp)
+
+{
+    PnvPHB4RootBus *bus = PNV_PHB4_ROOT_BUS(obj);
+    uint64_t value;
+
+    if (!visit_type_size(v, name, &value, errp)) {
+        return;
+    }
+
+    if (strcmp(name, "phb-id") == 0) {
+        bus->phb_id = value;
+    } else {
+        bus->chip_id = value;
+    }
+}
+
 static void pnv_phb4_root_bus_class_init(ObjectClass *klass, void *data)
 {
     BusClass *k = BUS_CLASS(klass);
 
+    object_class_property_add(klass, "phb-id", "int",
+                              pnv_phb4_root_bus_get_prop,
+                              pnv_phb4_root_bus_set_prop,
+                              NULL, NULL);
+
+    object_class_property_add(klass, "chip-id", "int",
+                              pnv_phb4_root_bus_get_prop,
+                              pnv_phb4_root_bus_set_prop,
+                              NULL, NULL);
+
     /*
      * PHB4 has only a single root complex. Enforce the limit on the
      * parent bus
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 20aa4819d3..50d4faa001 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -45,7 +45,17 @@ typedef struct PnvPhb4DMASpace {
     QLIST_ENTRY(PnvPhb4DMASpace) list;
 } PnvPhb4DMASpace;
 
+/*
+ * PHB4 PCIe Root Bus
+ */
 #define TYPE_PNV_PHB4_ROOT_BUS "pnv-phb4-root"
+struct PnvPHB4RootBus {
+    PCIBus parent;
+
+    uint32_t chip_id;
+    uint32_t phb_id;
+};
+OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4RootBus, PNV_PHB4_ROOT_BUS)
 
 /*
  * PHB4 PCIe Host Bridge for PowerNV machines (POWER9)
-- 
2.36.1


