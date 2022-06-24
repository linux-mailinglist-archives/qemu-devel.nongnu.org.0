Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3A85595DD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:57:52 +0200 (CEST)
Received: from localhost ([::1]:36658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4f8R-0003l6-Cp
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0X-0002D2-BU; Fri, 24 Jun 2022 04:49:41 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:44629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0V-0000Bv-Fa; Fri, 24 Jun 2022 04:49:41 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 c24-20020a9d4818000000b0060c2372addeso1375704otf.11; 
 Fri, 24 Jun 2022 01:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/zeb7F0dScJPWG8mltCQf0oIHgDYYs0J5eA59rKGNpc=;
 b=RlVCAgzJJyhw2dWkmpNZtJuSHvS9PhAdFwExT8EoLLCn1wa6EanbrDHlJUVKZZACyi
 z0AMUUjg3pI3AFxjoTSgcyODAFGiIYiFAFq1ibA9p8/Ctb4Ss1CxWYDThBTO26in6KJt
 w6/UHj1iAfggLmzpfh2eRUuUL9C/8GQf7E4L4w9jcgYxQyNFP3WZTqnwvuLt2WedypWe
 PXfKcwcxjT3YTZk9C7TJJOPUow79lh+/vubviVYQdeFjydh3wnTko+TQzVfCIhCT8kbL
 IFagWrHrNhYgJ3H3pA2rFd90MTdHT/hvJH7TtSOu98aR8np7Fku4gFwXRXrwokD/iEgn
 22gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/zeb7F0dScJPWG8mltCQf0oIHgDYYs0J5eA59rKGNpc=;
 b=a79IrE61MEGnmhH0eaTtjo8IEsXkVIb/FLoAeVdC3zkJeFuUxQ5YQYr/QijBTtRkWd
 lnN3iinUUtHWcI7xKnXyxYssRKdSoJiGPXi/nZcGpoyb5LX7M8aCtwH6eg5Jeui1AAk+
 x7KhWbys1WNwISDHTh9uDKMBJ5tSWHPEQVnl6OYOHTdyZPO7fvLSv5A7kHTwGWnAqgy+
 t7apanyV7ooXuwY5JYkf4BCgRf+mxDr0wE3rt3L2Essvv9ZN4MLFipsGhF6Tgz++mLBN
 xvl+kjUFZ5QZQOlJEq0yslrjEEUM8oNMrKIFb8Zx/46wG9brCbnUw4JkAQWa8Mw/CSl8
 PPYw==
X-Gm-Message-State: AJIora8qqzk/iG+Z//NE9Gp79SwHQSCrv7ZYFR4D1kAgZCFBP+UG06f3
 v8QYi8qAgj6BEM7UubiEHdauznqZXoE=
X-Google-Smtp-Source: AGRyM1tCUzF9FxtYoU+TO0n60e6hdvoCLcUAX1eiMVXoqqOixREdpnrXVc2YS6elabNPvcNkxw/Q9A==
X-Received: by 2002:a9d:76d0:0:b0:60b:53e5:6640 with SMTP id
 p16-20020a9d76d0000000b0060b53e56640mr5539757otl.241.1656060577550; 
 Fri, 24 Jun 2022 01:49:37 -0700 (PDT)
Received: from balboa.ibmmodules.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a056830230800b0061698ef90e5sm1192768ote.31.2022.06.24.01.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:49:37 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 05/12] ppc/pnv: turn PnvPHB4 into a PnvPHB backend
Date: Fri, 24 Jun 2022 05:49:14 -0300
Message-Id: <20220624084921.399219-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624084921.399219-1-danielhb413@gmail.com>
References: <20220624084921.399219-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
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

Change the parent type of the PnvPHB4 device to TYPE_PARENT since the
PCI bus is going to be initialized by the PnvPHB parent. Functions that
needs to access the bus via a PnvPHB4 object can do so via the
phb4->phb_base pointer.

pnv_phb4_pec now creates a PnvPHB object.

The powernv9 machine class will create PnvPHB devices with version '4'.
powernv10 will create using version '5'. Both are using global machine
properties in their class_init() to do that.

These changes will benefit us when adding PnvPHB user creatable devices
for powernv9 and powernv10.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 30 +++++-------------------------
 hw/pci-host/pnv_phb4_pec.c     |  3 +--
 hw/ppc/pnv.c                   | 20 +++++++++++++++++++-
 include/hw/pci-host/pnv_phb4.h |  5 ++++-
 4 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index a7a4519f30..74cf62dc1a 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -49,7 +49,7 @@ static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
 
 static PCIDevice *pnv_phb4_find_cfg_dev(PnvPHB4 *phb)
 {
-    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
+    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
     uint64_t addr = phb->regs[PHB_CONFIG_ADDRESS >> 3];
     uint8_t bus, devfn;
 
@@ -145,7 +145,7 @@ static uint64_t pnv_phb4_config_read(PnvPHB4 *phb, unsigned off,
 static void pnv_phb4_rc_config_write(PnvPHB4 *phb, unsigned off,
                                      unsigned size, uint64_t val)
 {
-    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
+    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
     PCIDevice *pdev;
 
     if (size != 4) {
@@ -166,7 +166,7 @@ static void pnv_phb4_rc_config_write(PnvPHB4 *phb, unsigned off,
 static uint64_t pnv_phb4_rc_config_read(PnvPHB4 *phb, unsigned off,
                                         unsigned size)
 {
-    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
+    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
     PCIDevice *pdev;
     uint64_t val;
 
@@ -1574,8 +1574,6 @@ void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb)
 static void pnv_phb4_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB4 *phb = PNV_PHB4(dev);
-    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
-    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
     XiveSource *xsrc = &phb->xsrc;
     int nr_irqs;
     char name[32];
@@ -1589,12 +1587,6 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&phb->mr_regs, OBJECT(phb), &pnv_phb4_reg_ops, phb,
                           name, 0x2000);
 
-    pnv_phb4_bus_init(dev, phb);
-
-    /* Add a single Root port if running with defaults */
-    pnv_phb_attach_root_port(pci, pecc->rp_model,
-                             phb->phb_id, phb->chip_id);
-
     /* Setup XIVE Source */
     if (phb->big_phb) {
         nr_irqs = PNV_PHB4_MAX_INTs;
@@ -1614,16 +1606,6 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     pnv_phb4_xscom_realize(phb);
 }
 
-static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
-                                          PCIBus *rootbus)
-{
-    PnvPHB4 *phb = PNV_PHB4(host_bridge);
-
-    snprintf(phb->bus_path, sizeof(phb->bus_path), "00%02x:%02x",
-             phb->chip_id, phb->phb_id);
-    return phb->bus_path;
-}
-
 /*
  * Address base trigger mode (POWER10)
  *
@@ -1708,19 +1690,17 @@ static Property pnv_phb4_properties[] = {
     DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
     DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
                      PnvPhb4PecState *),
+    DEFINE_PROP_LINK("phb-base", PnvPHB4, phb_base, TYPE_PNV_PHB, PnvPHB *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
 static void pnv_phb4_class_init(ObjectClass *klass, void *data)
 {
-    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
     XiveNotifierClass *xfc = XIVE_NOTIFIER_CLASS(klass);
 
-    hc->root_bus_path   = pnv_phb4_root_bus_path;
     dc->realize         = pnv_phb4_realize;
     device_class_set_props(dc, pnv_phb4_properties);
-    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->user_creatable  = false;
 
     xfc->notify         = pnv_phb4_xive_notify;
@@ -1728,7 +1708,7 @@ static void pnv_phb4_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo pnv_phb4_type_info = {
     .name          = TYPE_PNV_PHB4,
-    .parent        = TYPE_PCIE_HOST_BRIDGE,
+    .parent        = TYPE_DEVICE,
     .instance_init = pnv_phb4_instance_init,
     .instance_size = sizeof(PnvPHB4),
     .class_init    = pnv_phb4_class_init,
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index c9aaf1c28e..4a0a9fbe8b 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -115,8 +115,7 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
                                         int stack_no,
                                         Error **errp)
 {
-    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
-    PnvPHB4 *phb = PNV_PHB4(qdev_new(pecc->phb_type));
+    PnvPHB *phb = PNV_PHB(qdev_new(TYPE_PNV_PHB));
     int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
 
     object_property_add_child(OBJECT(pec), "phb[*]", OBJECT(phb));
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 1df91971b8..b7273f386e 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -672,7 +672,14 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
 static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)
 {
     Monitor *mon = opaque;
-    PnvPHB4 *phb4 = (PnvPHB4 *) object_dynamic_cast(child, TYPE_PNV_PHB4);
+    PnvPHB *phb =  (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);
+    PnvPHB4 *phb4;
+
+    if (!phb) {
+        return 0;
+    }
+
+    phb4 = (PnvPHB4 *)phb->backend;
 
     if (phb4) {
         pnv_phb4_pic_print_info(phb4, mon);
@@ -2122,8 +2129,14 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
     PnvMachineClass *pmc = PNV_MACHINE_CLASS(oc);
     static const char compat[] = "qemu,powernv9\0ibm,powernv";
 
+    static GlobalProperty phb_compat[] = {
+        { TYPE_PNV_PHB, "version", "4" },
+    };
+
     mc->desc = "IBM PowerNV (Non-Virtualized) POWER9";
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power9_v2.0");
+    compat_props_add(mc->compat_props, phb_compat, G_N_ELEMENTS(phb_compat));
+
     xfc->match_nvt = pnv_match_nvt;
 
     mc->alias = "powernv";
@@ -2140,8 +2153,13 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
     XiveFabricClass *xfc = XIVE_FABRIC_CLASS(oc);
     static const char compat[] = "qemu,powernv10\0ibm,powernv";
 
+    static GlobalProperty phb_compat[] = {
+        { TYPE_PNV_PHB, "version", "5" },
+    };
+
     mc->desc = "IBM PowerNV (Non-Virtualized) POWER10";
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power10_v2.0");
+    compat_props_add(mc->compat_props, phb_compat, G_N_ELEMENTS(phb_compat));
 
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 90843ac3a9..f22253358f 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -18,6 +18,7 @@
 typedef struct PnvPhb4PecState PnvPhb4PecState;
 typedef struct PnvPhb4PecStack PnvPhb4PecStack;
 typedef struct PnvPHB4 PnvPHB4;
+typedef struct PnvPHB PnvPHB;
 typedef struct PnvChip PnvChip;
 
 /*
@@ -78,7 +79,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4, PNV_PHB4)
 #define PCI_MMIO_TOTAL_SIZE        (0x1ull << 60)
 
 struct PnvPHB4 {
-    PCIExpressHost parent_obj;
+    DeviceState parent;
+
+    PnvPHB *phb_base;
 
     uint32_t chip_id;
     uint32_t phb_id;
-- 
2.36.1


