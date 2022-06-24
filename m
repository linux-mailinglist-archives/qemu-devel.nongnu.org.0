Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6D355963E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:16:43 +0200 (CEST)
Received: from localhost ([::1]:41796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fQg-0001xY-JJ
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0Q-00029I-HO; Fri, 24 Jun 2022 04:49:35 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:34511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0O-0000Ax-LE; Fri, 24 Jun 2022 04:49:34 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-101ab23ff3fso2943779fac.1; 
 Fri, 24 Jun 2022 01:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rLvchfMykXdOFtRg5yznDY/E14nVvlePhDQyhMWooUk=;
 b=aerh1ha20vdQQwxmNtNs7SzW3iR0XR8U1bmR47fz3T2QLmDvzM1rBA58sHllVDqfMt
 o0Q1vqbF8K3/Mcj5wggJwJ2OHAIQzySKBT9DKeSMBmcI9Qhp0bwJPRWhTkmNzLVKzmiF
 F22hll3f0SdnRAJjAP6u9CRyT8uS37C3S8SCZHbvFmfNSHqZffjfzO3gYPQgnmb80KSF
 ojtsUbL/SA8M1afUUYlvHqQRdRI+KZaahJ0e7BWcAQ2fZrkQJ1NDKuBnlZFxxVqzoeF1
 oB2qrgJoP19wXEtW6BtcegVrTc92CfNZRxkb+cCFG3OW/u8/osLw5Bxp8dd2x/cFZWPi
 6EOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rLvchfMykXdOFtRg5yznDY/E14nVvlePhDQyhMWooUk=;
 b=y9pDq9Db5hnk5rmV172EDi1e5t6vcG51UdhgF1yWAj8IRoD9+1nmLkCXtSGde6GAAI
 LY53+kOBYrz+WZHouGyzXewK0QCP+nuNsIKcommxwcZsNXTAMXg54Ffb0DhNZJZxWbkg
 nGs2xeYrQURQYv1KfqoaLz9n3+bx7vHUkldcbVx/vP2dbgREtl9g9LNj6m9izUQImmH5
 NlwaLql/n+zO7pF43QlgM8chOoP9ThwWSc4IUATuBY/V3W4T1KkEVN1tFmoMrrnjVtEg
 sHK4RSNs1OroZRGbGcHcYumtsm3lsKFY8w3J/+BFnRoQg87ahFqFonb6PHs7uGblAUYv
 XOgA==
X-Gm-Message-State: AJIora+q99n8DvUavqFEPkqfNlSFnelgBzjqxRyZyHFiVUnHMEctT2Ft
 qW1kbdBKSxtIulbKJGwiPqPqNsiWRUk=
X-Google-Smtp-Source: AGRyM1sST8QfQwvyuiaycrOwpCXprGGnsq36B0gIjb6ukWzcrx3tMhSWQBoias3/D4AfxplTyfOvFQ==
X-Received: by 2002:a05:6871:460f:b0:108:51e2:4545 with SMTP id
 nf15-20020a056871460f00b0010851e24545mr297207oab.280.1656060571040; 
 Fri, 24 Jun 2022 01:49:31 -0700 (PDT)
Received: from balboa.ibmmodules.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a056830230800b0061698ef90e5sm1192768ote.31.2022.06.24.01.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:49:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 02/12] ppc/pnv: add PnvPHB base/proxy device
Date: Fri, 24 Jun 2022 05:49:11 -0300
Message-Id: <20220624084921.399219-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624084921.399219-1-danielhb413@gmail.com>
References: <20220624084921.399219-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
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

The PnvPHB device is going to be the base device for all other powernv
PHBs. It consists of a device that has the same user API as the other
PHB, namely being a PCIHostBridge and having chip-id and index
properties. It also has a 'backend' pointer that will be initialized
with the PHB implementation that the device is going to use.

The initialization of the PHB backend is done by checking the PHB
version via a 'version' attribute that can be set via a global machine
property.  The 'version' field will be used to make adjustments based on
the running version, e.g. PHB3 uses a 'chip' reference while PHB4 uses
'pec'. To init the PnvPHB bus we'll rely on helpers for each version.
The version 3 helper is already added (pnv_phb3_bus_init), the PHB4
helper will be added later on.

For now let's add the basic logic of the PnvPHB object, which consists
mostly of pnv_phb_realize() doing all the work of checking the
phb->version set, initializing the proper backend, passing through its
attributes to the chosen backend, finalizing the backend realize and
adding a root port in the end.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/meson.build |   3 +-
 hw/pci-host/pnv_phb.c   | 124 ++++++++++++++++++++++++++++++++++++++++
 hw/pci-host/pnv_phb.h   |  39 +++++++++++++
 3 files changed, 165 insertions(+), 1 deletion(-)
 create mode 100644 hw/pci-host/pnv_phb.c
 create mode 100644 hw/pci-host/pnv_phb.h

diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
index c07596d0d1..e832babc9d 100644
--- a/hw/pci-host/meson.build
+++ b/hw/pci-host/meson.build
@@ -35,5 +35,6 @@ specific_ss.add(when: 'CONFIG_PCI_POWERNV', if_true: files(
   'pnv_phb3_msi.c',
   'pnv_phb3_pbcq.c',
   'pnv_phb4.c',
-  'pnv_phb4_pec.c'
+  'pnv_phb4_pec.c',
+  'pnv_phb.c',
 ))
diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
new file mode 100644
index 0000000000..6fefff7d44
--- /dev/null
+++ b/hw/pci-host/pnv_phb.c
@@ -0,0 +1,124 @@
+/*
+ * QEMU PowerPC PowerNV Proxy PHB model
+ *
+ * Copyright (c) 2022, IBM Corporation.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/visitor.h"
+#include "qapi/error.h"
+#include "hw/pci-host/pnv_phb.h"
+#include "hw/pci-host/pnv_phb3.h"
+#include "hw/pci-host/pnv_phb4.h"
+#include "hw/ppc/pnv.h"
+#include "hw/qdev-properties.h"
+#include "qom/object.h"
+
+
+static void pnv_phb_realize(DeviceState *dev, Error **errp)
+{
+    PnvPHB *phb = PNV_PHB(dev);
+    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
+    g_autofree char *phb_typename = NULL;
+    g_autofree char *phb_rootport_typename = NULL;
+
+    if (!phb->version) {
+        error_setg(errp, "version not specified");
+        return;
+    }
+
+    switch (phb->version) {
+    case 3:
+        phb_typename = g_strdup(TYPE_PNV_PHB3);
+        phb_rootport_typename = g_strdup(TYPE_PNV_PHB3_ROOT_PORT);
+        break;
+    case 4:
+        phb_typename = g_strdup(TYPE_PNV_PHB4);
+        phb_rootport_typename = g_strdup(TYPE_PNV_PHB4_ROOT_PORT);
+        break;
+    case 5:
+        phb_typename = g_strdup(TYPE_PNV_PHB5);
+        phb_rootport_typename = g_strdup(TYPE_PNV_PHB5_ROOT_PORT);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    phb->backend = object_new(phb_typename);
+    object_property_add_child(OBJECT(dev), "phb-backend", phb->backend);
+
+    /* Passthrough child device properties to the proxy device */
+    object_property_set_uint(phb->backend, "index", phb->phb_id, errp);
+    object_property_set_uint(phb->backend, "chip-id", phb->chip_id, errp);
+    object_property_set_link(phb->backend, "phb-base", OBJECT(phb), errp);
+
+    if (phb->version == 3) {
+        object_property_set_link(phb->backend, "chip",
+                                 OBJECT(phb->chip), errp);
+    } else {
+        object_property_set_link(phb->backend, "pec", OBJECT(phb->pec), errp);
+    }
+
+    if (!qdev_realize(DEVICE(phb->backend), NULL, errp)) {
+        return;
+    }
+
+    if (phb->version == 3) {
+        pnv_phb3_bus_init(dev, PNV_PHB3(phb->backend));
+    }
+
+    pnv_phb_attach_root_port(pci, phb_rootport_typename,
+                             phb->phb_id, phb->chip_id);
+}
+
+static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
+                                         PCIBus *rootbus)
+{
+    PnvPHB *phb = PNV_PHB(host_bridge);
+
+    snprintf(phb->bus_path, sizeof(phb->bus_path), "00%02x:%02x",
+             phb->chip_id, phb->phb_id);
+    return phb->bus_path;
+}
+
+static Property pnv_phb_properties[] = {
+    DEFINE_PROP_UINT32("index", PnvPHB, phb_id, 0),
+    DEFINE_PROP_UINT32("chip-id", PnvPHB, chip_id, 0),
+    DEFINE_PROP_UINT32("version", PnvPHB, version, 0),
+
+    DEFINE_PROP_LINK("chip", PnvPHB, chip, TYPE_PNV_CHIP, PnvChip *),
+
+    DEFINE_PROP_LINK("pec", PnvPHB, pec, TYPE_PNV_PHB4_PEC,
+                     PnvPhb4PecState *),
+
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void pnv_phb_class_init(ObjectClass *klass, void *data)
+{
+    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    hc->root_bus_path = pnv_phb_root_bus_path;
+    dc->realize = pnv_phb_realize;
+    device_class_set_props(dc, pnv_phb_properties);
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->user_creatable = false;
+}
+
+static void pnv_phb_register_type(void)
+{
+    static const TypeInfo pnv_phb_type_info = {
+        .name          = TYPE_PNV_PHB,
+        .parent        = TYPE_PCIE_HOST_BRIDGE,
+        .instance_size = sizeof(PnvPHB),
+        .class_init    = pnv_phb_class_init,
+    };
+
+    type_register_static(&pnv_phb_type_info);
+}
+type_init(pnv_phb_register_type)
diff --git a/hw/pci-host/pnv_phb.h b/hw/pci-host/pnv_phb.h
new file mode 100644
index 0000000000..a7cc8610e2
--- /dev/null
+++ b/hw/pci-host/pnv_phb.h
@@ -0,0 +1,39 @@
+/*
+ * QEMU PowerPC PowerNV Proxy PHB model
+ *
+ * Copyright (c) 2022, IBM Corporation.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+
+#ifndef PCI_HOST_PNV_PHB_H
+#define PCI_HOST_PNV_PHB_H
+
+#include "hw/pci/pcie_host.h"
+#include "hw/pci/pcie_port.h"
+#include "qom/object.h"
+
+typedef struct PnvChip PnvChip;
+typedef struct PnvPhb4PecState PnvPhb4PecState;
+
+struct PnvPHB {
+    PCIExpressHost parent_obj;
+
+    uint32_t chip_id;
+    uint32_t phb_id;
+    uint32_t version;
+    char bus_path[8];
+
+    PnvChip *chip;
+
+    PnvPhb4PecState *pec;
+
+    /* The PHB backend (PnvPHB3, PnvPHB4 ...) being used */
+    Object *backend;
+};
+
+#define TYPE_PNV_PHB "pnv-phb"
+OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB, PNV_PHB)
+
+#endif /* PCI_HOST_PNV_PHB_H */
-- 
2.36.1


