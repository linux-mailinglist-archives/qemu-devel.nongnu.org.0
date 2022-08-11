Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE77590416
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 18:42:59 +0200 (CEST)
Received: from localhost ([::1]:38146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBGq-0006eh-0n
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 12:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBE2-0001Eq-VN; Thu, 11 Aug 2022 12:40:03 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a]:36852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBE1-0003VU-6D; Thu, 11 Aug 2022 12:40:02 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id o123so18824382vsc.3;
 Thu, 11 Aug 2022 09:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=u503m2SCRYm6s6XAxPT5+3oWEmQoe2DCrk66kmZCz14=;
 b=F2FBnKSS9bY53VykAvkTLtljBEFzPHaItkPrsFvSvbF3FauEIhWCOCu4HnVy21xXV1
 w/UK/cXQCj5/WNz4h9a4uXk8d4cfH3MmypIE5oBin6udX6j55eBs6Nyxze8pcIZ18eu2
 mDcDY7meDdnV3IHWtpdOJVbg+wwebAH/I6piFZyu+hzO3Q19Elgna/vYk0pCSSXVB6gf
 FX/w+RbE28thU5BejO7FH+g/hPXe4+Qm+opAH+yDmn3n8mz5m/fPIYXsZE7sykupM8Yu
 6N4moJ6EMMQfWCloRoiGez+rsU92y7a5t44ku7t0Q2SDwGBhyvaY5Pye6sdMir+C6c8X
 Oisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=u503m2SCRYm6s6XAxPT5+3oWEmQoe2DCrk66kmZCz14=;
 b=J61Z9FcSxobXE7B0GLvRpceNRCubjR/0vKg4BviSEsvuLWNlP9xe8yKiJeJ4SXbUki
 SJ6vaC19RiBEhy/9zmF6UB1Ni8SgHKKDAIoreVgu3PKrPVWECgbhVb3O/q9cYymszfFI
 XZddsiW4SPFEAevz916Cn2MFaxB04B7tYoZVw28QHTYyHidYKJdgfXcdFzNvDYj2bbVl
 kgJUmk7XXBFkGRbITmtWl9xk2twhcyDNeHiL+WsZne5ooLxbQFbKNfstNC0mTiVboOD0
 52qUtHfFpNGwpL+63M08hueOhrKaJuI0vfKmrFAJDa8OGSl6EPwXZYhkqgXeQwQywAOT
 Ae7Q==
X-Gm-Message-State: ACgBeo2vn547JoYbw7Tbjvk2CHH5Cj4QzJpsWyx3qmrJrFW5hIcO+i+k
 OXiyVKRHi3Ab+rzouNBq3gEY4sRZCRw=
X-Google-Smtp-Source: AA6agR63Fhfw5m+hgv+4UXyAPYWM5SQdbrPXs249DT5FZOZNudDZd010elbizfYGB7hXIsIs3W1YOw==
X-Received: by 2002:a05:6102:149c:b0:388:a8ab:5328 with SMTP id
 d28-20020a056102149c00b00388a8ab5328mr9414952vsv.78.1660235999778; 
 Thu, 11 Aug 2022 09:39:59 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 j9-20020a67fa49000000b00373d697e3e2sm1755013vsq.19.2022.08.11.09.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:39:59 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 02/11] ppc/pnv: add phb-id/chip-id PnvPHB4RootBus
 properties
Date: Thu, 11 Aug 2022 13:39:41 -0300
Message-Id: <20220811163950.578927-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220811163950.578927-1-danielhb413@gmail.com>
References: <20220811163950.578927-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2a.google.com
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


