Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601F852927D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:10:45 +0200 (CEST)
Received: from localhost ([::1]:46702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqhzI-00045E-FQ
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhgT-00058v-MO
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:51:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhgR-0006KP-8q
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Etje5IWKZkJ0TXvFG5ZOQ2dwSxLyOrSYa8UJ14x7l8c=;
 b=izklWZ1x/WpTlEi07NAUzxoOxf/Bw2qVePvgpuMi019qrjzOY1+IRboqMhLhUZQBYko/aK
 +Er81rH80R4IKho4l40GMnE+wNEKSnGd0O1dprYAb3NIWFz9U/EamhKuXnNXm2MxwJS/eF
 ngN8+ehJ0uBIRJKeHZe+cTzQ4TckTOs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-FYN4ZDS7OU2t3yIJkUQp0w-1; Mon, 16 May 2022 16:51:13 -0400
X-MC-Unique: FYN4ZDS7OU2t3yIJkUQp0w-1
Received: by mail-ed1-f70.google.com with SMTP id
 w14-20020a50fa8e000000b0042ab142d677so2643195edr.11
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Etje5IWKZkJ0TXvFG5ZOQ2dwSxLyOrSYa8UJ14x7l8c=;
 b=5Ol3vxCmGoY2nLIYWrI4ge78J0shj1rArWDmNAOfSEXBzWkenP0cddDKLN4EZcxsfc
 h9P0W9LtdWvCytq6vDN57COzVSVJvoO7ssrXP9Jm4Pn2AM736Vzg8ZepmoiwV9xYCTKw
 1vLmO0HrOE8Eingk2Kttott0DoodqS2e2hw6KQcw0WC9a67eo/51nH8TVGRRGxuzcVIh
 e+uCceU841nNX06bqzigFFRufIINsPaiFqCBCQkFmd5yU3+AmZI1n/ciNm5p9BMDGVZs
 C7G4RrNMCFNXbWeS2GBwaxnaOQTa/Bf0y0tyVtAv9kKvL0MW4E10S0Lqt7ZfOOVxXRkg
 mBzw==
X-Gm-Message-State: AOAM533kx3xXTWO/hE/eqBJfGPjp62BCQfqTYkPCZmfhpvLDbJY5BzL1
 0/KuEh5buUeqTTdkbMfWmXuV1PavTsZHoBx6dJe+hl4V4QFS/1o8TT9OgOOFR+qljAywKrTiGe0
 FhPfmlaHVTiJQPC5ey6ULalbhZS269do5NATfFMSYIstkHH3W/Ss3hXXjBuWn
X-Received: by 2002:a17:906:2319:b0:6f3:ad55:8fee with SMTP id
 l25-20020a170906231900b006f3ad558feemr16705070eja.26.1652734270912; 
 Mon, 16 May 2022 13:51:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg5PyocsmuAbb9sOtCS9zE1p6RLbYlsKKBr/4NndxUnR7XO8NNbiJqE/isw4YyiCZGy5OjpQ==
X-Received: by 2002:a17:906:2319:b0:6f3:ad55:8fee with SMTP id
 l25-20020a170906231900b006f3ad558feemr16705047eja.26.1652734270568; 
 Mon, 16 May 2022 13:51:10 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 j13-20020a508a8d000000b0042617ba63cbsm5653325edj.85.2022.05.16.13.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:51:10 -0700 (PDT)
Date: Mon, 16 May 2022 16:51:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 18/86] hw/cxl/rp: Add a root port
Message-ID: <20220516204913.542894-19-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Ben Widawsky <ben.widawsky@intel.com>

This adds just enough of a root port implementation to be able to
enumerate root ports (creating the required DVSEC entries). What's not
here yet is the MMIO nor the ability to write some of the DVSEC entries.

This can be added with the qemu commandline by adding a rootport to a
specific CXL host bridge. For example:
  -device cxl-rp,id=rp0,bus="cxl.0",addr=0.0,chassis=4

Like the host bridge patch, the ACPI tables aren't generated at this
point and so system software cannot use it.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-17-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-bridge/cxl_root_port.c  | 236 +++++++++++++++++++++++++++++++++
 hw/pci-bridge/pcie_root_port.c |   6 +-
 hw/pci/pci.c                   |   4 +-
 hw/pci-bridge/Kconfig          |   5 +
 hw/pci-bridge/meson.build      |   1 +
 5 files changed, 250 insertions(+), 2 deletions(-)
 create mode 100644 hw/pci-bridge/cxl_root_port.c

diff --git a/hw/pci-bridge/cxl_root_port.c b/hw/pci-bridge/cxl_root_port.c
new file mode 100644
index 0000000000..fb213fa06e
--- /dev/null
+++ b/hw/pci-bridge/cxl_root_port.c
@@ -0,0 +1,236 @@
+/*
+ * CXL 2.0 Root Port Implementation
+ *
+ * Copyright(C) 2020 Intel Corporation.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/range.h"
+#include "hw/pci/pci_bridge.h"
+#include "hw/pci/pcie_port.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "qapi/error.h"
+#include "hw/cxl/cxl.h"
+
+#define CXL_ROOT_PORT_DID 0x7075
+
+/* Copied from the gen root port which we derive */
+#define GEN_PCIE_ROOT_PORT_AER_OFFSET 0x100
+#define GEN_PCIE_ROOT_PORT_ACS_OFFSET \
+    (GEN_PCIE_ROOT_PORT_AER_OFFSET + PCI_ERR_SIZEOF)
+#define CXL_ROOT_PORT_DVSEC_OFFSET \
+    (GEN_PCIE_ROOT_PORT_ACS_OFFSET + PCI_ACS_SIZEOF)
+
+typedef struct CXLRootPort {
+    /*< private >*/
+    PCIESlot parent_obj;
+
+    CXLComponentState cxl_cstate;
+    PCIResReserve res_reserve;
+} CXLRootPort;
+
+#define TYPE_CXL_ROOT_PORT "cxl-rp"
+DECLARE_INSTANCE_CHECKER(CXLRootPort, CXL_ROOT_PORT, TYPE_CXL_ROOT_PORT)
+
+static void latch_registers(CXLRootPort *crp)
+{
+    uint32_t *reg_state = crp->cxl_cstate.crb.cache_mem_registers;
+    uint32_t *write_msk = crp->cxl_cstate.crb.cache_mem_regs_write_mask;
+
+    cxl_component_register_init_common(reg_state, write_msk, CXL2_ROOT_PORT);
+}
+
+static void build_dvsecs(CXLComponentState *cxl)
+{
+    uint8_t *dvsec;
+
+    dvsec = (uint8_t *)&(CXLDVSECPortExtensions){ 0 };
+    cxl_component_create_dvsec(cxl, CXL2_ROOT_PORT,
+                               EXTENSIONS_PORT_DVSEC_LENGTH,
+                               EXTENSIONS_PORT_DVSEC,
+                               EXTENSIONS_PORT_DVSEC_REVID, dvsec);
+
+    dvsec = (uint8_t *)&(CXLDVSECPortGPF){
+        .rsvd        = 0,
+        .phase1_ctrl = 1, /* 1μs timeout */
+        .phase2_ctrl = 1, /* 1μs timeout */
+    };
+    cxl_component_create_dvsec(cxl, CXL2_ROOT_PORT,
+                               GPF_PORT_DVSEC_LENGTH, GPF_PORT_DVSEC,
+                               GPF_PORT_DVSEC_REVID, dvsec);
+
+    dvsec = (uint8_t *)&(CXLDVSECPortFlexBus){
+        .cap                     = 0x26, /* IO, Mem, non-MLD */
+        .ctrl                    = 0x2,
+        .status                  = 0x26, /* same */
+        .rcvd_mod_ts_data_phase1 = 0xef,
+    };
+    cxl_component_create_dvsec(cxl, CXL2_ROOT_PORT,
+                               PCIE_FLEXBUS_PORT_DVSEC_LENGTH_2_0,
+                               PCIE_FLEXBUS_PORT_DVSEC,
+                               PCIE_FLEXBUS_PORT_DVSEC_REVID_2_0, dvsec);
+
+    dvsec = (uint8_t *)&(CXLDVSECRegisterLocator){
+        .rsvd         = 0,
+        .reg0_base_lo = RBI_COMPONENT_REG | CXL_COMPONENT_REG_BAR_IDX,
+        .reg0_base_hi = 0,
+    };
+    cxl_component_create_dvsec(cxl, CXL2_ROOT_PORT,
+                               REG_LOC_DVSEC_LENGTH, REG_LOC_DVSEC,
+                               REG_LOC_DVSEC_REVID, dvsec);
+}
+
+static void cxl_rp_realize(DeviceState *dev, Error **errp)
+{
+    PCIDevice *pci_dev     = PCI_DEVICE(dev);
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
+    CXLRootPort *crp       = CXL_ROOT_PORT(dev);
+    CXLComponentState *cxl_cstate = &crp->cxl_cstate;
+    ComponentRegisters *cregs = &cxl_cstate->crb;
+    MemoryRegion *component_bar = &cregs->component_registers;
+    Error *local_err = NULL;
+
+    rpc->parent_realize(dev, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    int rc =
+        pci_bridge_qemu_reserve_cap_init(pci_dev, 0, crp->res_reserve, errp);
+    if (rc < 0) {
+        rpc->parent_class.exit(pci_dev);
+        return;
+    }
+
+    if (!crp->res_reserve.io || crp->res_reserve.io == -1) {
+        pci_word_test_and_clear_mask(pci_dev->wmask + PCI_COMMAND,
+                                     PCI_COMMAND_IO);
+        pci_dev->wmask[PCI_IO_BASE]  = 0;
+        pci_dev->wmask[PCI_IO_LIMIT] = 0;
+    }
+
+    cxl_cstate->dvsec_offset = CXL_ROOT_PORT_DVSEC_OFFSET;
+    cxl_cstate->pdev = pci_dev;
+    build_dvsecs(&crp->cxl_cstate);
+
+    cxl_component_register_block_init(OBJECT(pci_dev), cxl_cstate,
+                                      TYPE_CXL_ROOT_PORT);
+
+    pci_register_bar(pci_dev, CXL_COMPONENT_REG_BAR_IDX,
+                     PCI_BASE_ADDRESS_SPACE_MEMORY |
+                         PCI_BASE_ADDRESS_MEM_TYPE_64,
+                     component_bar);
+}
+
+static void cxl_rp_reset(DeviceState *dev)
+{
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
+    CXLRootPort *crp = CXL_ROOT_PORT(dev);
+
+    rpc->parent_reset(dev);
+
+    latch_registers(crp);
+}
+
+static Property gen_rp_props[] = {
+    DEFINE_PROP_UINT32("bus-reserve", CXLRootPort, res_reserve.bus, -1),
+    DEFINE_PROP_SIZE("io-reserve", CXLRootPort, res_reserve.io, -1),
+    DEFINE_PROP_SIZE("mem-reserve", CXLRootPort, res_reserve.mem_non_pref, -1),
+    DEFINE_PROP_SIZE("pref32-reserve", CXLRootPort, res_reserve.mem_pref_32,
+                     -1),
+    DEFINE_PROP_SIZE("pref64-reserve", CXLRootPort, res_reserve.mem_pref_64,
+                     -1),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void cxl_rp_dvsec_write_config(PCIDevice *dev, uint32_t addr,
+                                      uint32_t val, int len)
+{
+    CXLRootPort *crp = CXL_ROOT_PORT(dev);
+
+    if (range_contains(&crp->cxl_cstate.dvsecs[EXTENSIONS_PORT_DVSEC], addr)) {
+        uint8_t *reg = &dev->config[addr];
+        addr -= crp->cxl_cstate.dvsecs[EXTENSIONS_PORT_DVSEC].lob;
+        if (addr == PORT_CONTROL_OFFSET) {
+            if (pci_get_word(reg) & PORT_CONTROL_UNMASK_SBR) {
+                /* unmask SBR */
+                qemu_log_mask(LOG_UNIMP, "SBR mask control is not supported\n");
+            }
+            if (pci_get_word(reg) & PORT_CONTROL_ALT_MEMID_EN) {
+                /* Alt Memory & ID Space Enable */
+                qemu_log_mask(LOG_UNIMP,
+                              "Alt Memory & ID space is not supported\n");
+            }
+        }
+    }
+}
+
+static void cxl_rp_write_config(PCIDevice *d, uint32_t address, uint32_t val,
+                                int len)
+{
+    uint16_t slt_ctl, slt_sta;
+
+    pcie_cap_slot_get(d, &slt_ctl, &slt_sta);
+    pci_bridge_write_config(d, address, val, len);
+    pcie_cap_flr_write_config(d, address, val, len);
+    pcie_cap_slot_write_config(d, slt_ctl, slt_sta, address, val, len);
+    pcie_aer_write_config(d, address, val, len);
+
+    cxl_rp_dvsec_write_config(d, address, val, len);
+}
+
+static void cxl_root_port_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc        = DEVICE_CLASS(oc);
+    PCIDeviceClass *k      = PCI_DEVICE_CLASS(oc);
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(oc);
+
+    k->vendor_id = PCI_VENDOR_ID_INTEL;
+    k->device_id = CXL_ROOT_PORT_DID;
+    dc->desc     = "CXL Root Port";
+    k->revision  = 0;
+    device_class_set_props(dc, gen_rp_props);
+    k->config_write = cxl_rp_write_config;
+
+    device_class_set_parent_realize(dc, cxl_rp_realize, &rpc->parent_realize);
+    device_class_set_parent_reset(dc, cxl_rp_reset, &rpc->parent_reset);
+
+    rpc->aer_offset = GEN_PCIE_ROOT_PORT_AER_OFFSET;
+    rpc->acs_offset = GEN_PCIE_ROOT_PORT_ACS_OFFSET;
+
+    dc->hotpluggable = false;
+}
+
+static const TypeInfo cxl_root_port_info = {
+    .name = TYPE_CXL_ROOT_PORT,
+    .parent = TYPE_PCIE_ROOT_PORT,
+    .instance_size = sizeof(CXLRootPort),
+    .class_init = cxl_root_port_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CXL_DEVICE },
+        { }
+    },
+};
+
+static void cxl_register(void)
+{
+    type_register_static(&cxl_root_port_info);
+}
+
+type_init(cxl_register);
diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_port.c
index f1cfe9d14a..460e48269d 100644
--- a/hw/pci-bridge/pcie_root_port.c
+++ b/hw/pci-bridge/pcie_root_port.c
@@ -67,7 +67,11 @@ static void rp_realize(PCIDevice *d, Error **errp)
     int rc;
 
     pci_config_set_interrupt_pin(d->config, 1);
-    pci_bridge_initfn(d, TYPE_PCIE_BUS);
+    if (d->cap_present & QEMU_PCIE_CAP_CXL) {
+        pci_bridge_initfn(d, TYPE_CXL_BUS);
+    } else {
+        pci_bridge_initfn(d, TYPE_PCIE_BUS);
+    }
     pcie_port_init_reg(d);
 
     rc = pci_bridge_ssvid_init(d, rpc->ssvid_offset, dc->vendor_id,
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 6c0656f604..a9b37f8000 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2762,7 +2762,9 @@ static void pci_device_class_base_init(ObjectClass *klass, void *data)
             object_class_dynamic_cast(klass, INTERFACE_CONVENTIONAL_PCI_DEVICE);
         ObjectClass *pcie =
             object_class_dynamic_cast(klass, INTERFACE_PCIE_DEVICE);
-        assert(conventional || pcie);
+        ObjectClass *cxl =
+            object_class_dynamic_cast(klass, INTERFACE_CXL_DEVICE);
+        assert(conventional || pcie || cxl);
     }
 }
 
diff --git a/hw/pci-bridge/Kconfig b/hw/pci-bridge/Kconfig
index f8df4315ba..02614f49aa 100644
--- a/hw/pci-bridge/Kconfig
+++ b/hw/pci-bridge/Kconfig
@@ -27,3 +27,8 @@ config DEC_PCI
 
 config SIMBA
     bool
+
+config CXL
+    bool
+    default y if PCI_EXPRESS && PXB
+    depends on PCI_EXPRESS && MSI_NONBROKEN && PXB
diff --git a/hw/pci-bridge/meson.build b/hw/pci-bridge/meson.build
index daab8acf2a..b6d26a03d5 100644
--- a/hw/pci-bridge/meson.build
+++ b/hw/pci-bridge/meson.build
@@ -5,6 +5,7 @@ pci_ss.add(when: 'CONFIG_IOH3420', if_true: files('ioh3420.c'))
 pci_ss.add(when: 'CONFIG_PCIE_PORT', if_true: files('pcie_root_port.c', 'gen_pcie_root_port.c', 'pcie_pci_bridge.c'))
 pci_ss.add(when: 'CONFIG_PXB', if_true: files('pci_expander_bridge.c'))
 pci_ss.add(when: 'CONFIG_XIO3130', if_true: files('xio3130_upstream.c', 'xio3130_downstream.c'))
+pci_ss.add(when: 'CONFIG_CXL', if_true: files('cxl_root_port.c'))
 
 # NewWorld PowerMac
 pci_ss.add(when: 'CONFIG_DEC_PCI', if_true: files('dec.c'))
-- 
MST


