Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E09D51E953
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:09:47 +0200 (CEST)
Received: from localhost ([::1]:60814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnPoI-0008SF-7y
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlN-000507-6f; Sat, 07 May 2022 15:06:45 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:35617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlL-0001Y0-7k; Sat, 07 May 2022 15:06:44 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 z5-20020a9d62c5000000b00606041d11f1so7238323otk.2; 
 Sat, 07 May 2022 12:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WNdXdxrL+6oruFfs4RMH79bNef2ZwDlHNs1lrvwqaXg=;
 b=LZjkVS0/Dzgy7awoWMYRRcPneiaaWb1wo1PHm257/lKOe5BzG4ZHCVmoXF6RCdhpQV
 q4WVuLDLV7r49rncaG53SkXD3aV6d/qkEBrbTjTQ9bc4o0amzTwixDY3pLWjh15YRAaC
 3dTiwUtbiovyQ/9A4VQxdfXSbhxfzQUr+d0FkHTLGJ3uISNnQB2Tvrn9TcEYXykPc8J5
 I/J+UfO+w0k78UK/LnMSbTgeAEDQ2EpAuhJJq3kbdbkt33Pbi6sIRzPjnx2qZA10DWGx
 qv6YbI5iuMfL0VP9Ifc2cMQF+kwOgoIvl4+Fckk1LPSuIZLr5y/Llo9PqxsCIticbpkZ
 JHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WNdXdxrL+6oruFfs4RMH79bNef2ZwDlHNs1lrvwqaXg=;
 b=KOGKH5TVsRLGCQtGPrMGVzqRmXRwDj4rL76szzpluijBn/fUy6PUJWuwYqXybRu3TA
 lc9TIgLsN7iO4I7SS4s/eStPu8g5Y31I7PnHRPU20bN7/WRmHBbDpkpHgjVoI1kQaVa7
 HY44+ZOIBUQMmsO8ZWgeMlclUexPrAwr+2MPm0Y3lnHEqNUWDxXtrwQgVxfdQPjdxrzR
 XZQpgLfzYqtG/4W2GB7XaTxjVnHzq2I5BOVjTl5YwX+jR8+BlGy507Fm+psO8JxDlCJX
 iyt+vf8sow6Vg/Ap4KM3FeO5GjXUUK81CsdKJSOKYX5gLkNLNkIaAmVv38IPlruPCuUp
 R6gA==
X-Gm-Message-State: AOAM533sgZjTci0/iCeQ3ojcI76hY0Gz9EhFgh8cniPfM1tBYNK5QYtR
 f1U1l5yDyGSvYC11Wm5FMI1ft2vXTAg=
X-Google-Smtp-Source: ABdhPJy7ZGGgkwYCobeq73Ygx2YrKgnSdJu49MJXYrotvLstCUm6N85eQztrJbz8zSefP9cWzbNlYA==
X-Received: by 2002:a9d:58c3:0:b0:605:9fa7:f5b6 with SMTP id
 s3-20020a9d58c3000000b006059fa7f5b6mr3167019oth.230.1651950401678; 
 Sat, 07 May 2022 12:06:41 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:06:41 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 04/17] ppc/pnv: add unified pnv-phb header
Date: Sat,  7 May 2022 16:06:11 -0300
Message-Id: <20220507190624.507419-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507190624.507419-1-danielhb413@gmail.com>
References: <20220507190624.507419-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
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

This patch adds the pnv_phb.h header with the declarations we're going
to use in this soon to be added device.

It consists of an union between all attributes of PnvPHB3 and PnvPHB4
devices. This will allow for the same PnvPHB device to be used for PHB3
and PHB4 code.

Some struct definitions from PnvPHB3 had to be moved to the new header
due to scope constraints.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/hw/pci-host/pnv_phb.h  | 211 +++++++++++++++++++++++++++++++++
 include/hw/pci-host/pnv_phb3.h |  65 +---------
 2 files changed, 212 insertions(+), 64 deletions(-)
 create mode 100644 include/hw/pci-host/pnv_phb.h

diff --git a/include/hw/pci-host/pnv_phb.h b/include/hw/pci-host/pnv_phb.h
new file mode 100644
index 0000000000..2a8bf9a66d
--- /dev/null
+++ b/include/hw/pci-host/pnv_phb.h
@@ -0,0 +1,211 @@
+/*
+ * QEMU PowerPC PowerNV Unified PHB model
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
+#include "hw/ppc/xics.h"
+#include "hw/ppc/xive.h"
+#include "qom/object.h"
+
+/* pnv_phb3.h types */
+#define PNV_PHB3_NUM_M64      16
+#define PNV_PHB3_NUM_REGS     (0x1000 >> 3)
+#define PHB3_MAX_MSI     2048
+
+typedef struct PnvPHB3 PnvPHB3;
+typedef struct PnvChip PnvChip;
+
+typedef struct Phb3MsiState {
+    ICSState ics;
+    qemu_irq *qirqs;
+
+    PnvPHB3 *phb;
+    uint64_t rba[PHB3_MAX_MSI / 64];
+    uint32_t rba_sum;
+} Phb3MsiState;
+
+typedef struct PnvPBCQState {
+    DeviceState parent;
+
+    uint32_t nest_xbase;
+    uint32_t spci_xbase;
+    uint32_t pci_xbase;
+#define PBCQ_NEST_REGS_COUNT    0x46
+#define PBCQ_PCI_REGS_COUNT     0x15
+#define PBCQ_SPCI_REGS_COUNT    0x5
+
+    uint64_t nest_regs[PBCQ_NEST_REGS_COUNT];
+    uint64_t spci_regs[PBCQ_SPCI_REGS_COUNT];
+    uint64_t pci_regs[PBCQ_PCI_REGS_COUNT];
+    MemoryRegion mmbar0;
+    MemoryRegion mmbar1;
+    MemoryRegion phbbar;
+    uint64_t mmio0_base;
+    uint64_t mmio0_size;
+    uint64_t mmio1_base;
+    uint64_t mmio1_size;
+    PnvPHB3 *phb;
+
+    MemoryRegion xscom_nest_regs;
+    MemoryRegion xscom_pci_regs;
+    MemoryRegion xscom_spci_regs;
+} PnvPBCQState;
+
+/*
+ * We have one such address space wrapper per possible device under
+ * the PHB since they need to be assigned statically at qemu device
+ * creation time. The relationship to a PE is done later dynamically.
+ * This means we can potentially create a lot of these guys. Q35
+ * stores them as some kind of radix tree but we never really need to
+ * do fast lookups so instead we simply keep a QLIST of them for now,
+ * we can add the radix if needed later on.
+ *
+ * We do cache the PE number to speed things up a bit though.
+ */
+typedef struct PnvPhb3DMASpace {
+    PCIBus *bus;
+    uint8_t devfn;
+    int pe_num;         /* Cached PE number */
+#define PHB_INVALID_PE (-1)
+    PnvPHB3 *phb;
+    AddressSpace dma_as;
+    IOMMUMemoryRegion dma_mr;
+    MemoryRegion msi32_mr;
+    MemoryRegion msi64_mr;
+    QLIST_ENTRY(PnvPhb3DMASpace) list;
+} PnvPhb3DMASpace;
+
+/* pnv_phb4.h types */
+#define PNV_PHB4_MAX_LSIs          8
+#define PNV_PHB4_MAX_INTs          4096
+#define PNV_PHB4_MAX_MIST          (PNV_PHB4_MAX_INTs >> 2)
+#define PNV_PHB4_MAX_MMIO_WINDOWS  32
+#define PNV_PHB4_MIN_MMIO_WINDOWS  16
+#define PNV_PHB4_NUM_REGS          (0x3000 >> 3)
+#define PNV_PHB4_MAX_PEs           512
+#define PNV_PHB4_MAX_TVEs          (PNV_PHB4_MAX_PEs * 2)
+#define PNV_PHB4_MAX_PEEVs         (PNV_PHB4_MAX_PEs / 64)
+#define PNV_PHB4_MAX_MBEs          (PNV_PHB4_MAX_MMIO_WINDOWS * 2)
+typedef struct PnvPhb4PecState PnvPhb4PecState;
+
+/*
+ * Unified PHB PCIe Host Bridge for PowerNV machines
+ */
+typedef struct PnvPHB PnvPHB;
+#define TYPE_PNV_PHB "pnv-phb"
+OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB, PNV_PHB)
+
+struct PnvPHB {
+    PCIExpressHost parent_obj;
+
+    uint32_t chip_id;
+    uint32_t phb_id;
+    char bus_path[8];
+    MemoryRegion pci_mmio;
+    MemoryRegion pci_io;
+    qemu_irq *qirqs;
+
+    /*
+     * PnvPHB3 attributes
+     */
+    uint64_t regs3[PNV_PHB3_NUM_REGS];
+    MemoryRegion mr_regs3;
+
+    MemoryRegion mr_m32;
+    MemoryRegion mr_m64[PNV_PHB3_NUM_M64];
+
+    uint64_t ioda2_LIST[8];
+    uint64_t ioda2_LXIVT[8];
+    uint64_t ioda2_TVT[512];
+    uint64_t ioda2_M64BT[16];
+    uint64_t ioda2_MDT[256];
+    uint64_t ioda2_PEEV[4];
+
+    uint32_t total_irq;
+    ICSState lsis;
+    Phb3MsiState msis;
+
+    PnvPBCQState pbcq;
+
+    QLIST_HEAD(, PnvPhb3DMASpace) v3_dma_spaces;
+
+    PnvChip *chip;
+
+    /*
+     * PnvPHB4 attributes
+     */
+    uint64_t version;
+
+    /* The owner PEC */
+    PnvPhb4PecState *pec;
+
+    /* Main register images */
+    uint64_t regs[PNV_PHB4_NUM_REGS];
+    MemoryRegion mr_regs;
+
+    /* Extra SCOM-only register */
+    uint64_t scom_hv_ind_addr_reg;
+
+    /*
+     * Geometry of the PHB. There are two types, small and big PHBs, a
+     * number of resources (number of PEs, windows etc...) are doubled
+     * for a big PHB
+     */
+    bool big_phb;
+
+    /* Memory regions for MMIO space */
+    MemoryRegion mr_mmio[PNV_PHB4_MAX_MMIO_WINDOWS];
+
+    /* PCI registers (excluding pass-through) */
+#define PHB4_PEC_PCI_STK_REGS_COUNT  0xf
+    uint64_t pci_regs[PHB4_PEC_PCI_STK_REGS_COUNT];
+    MemoryRegion pci_regs_mr;
+
+    /* Nest registers */
+#define PHB4_PEC_NEST_STK_REGS_COUNT  0x17
+    uint64_t nest_regs[PHB4_PEC_NEST_STK_REGS_COUNT];
+    MemoryRegion nest_regs_mr;
+
+    /* PHB pass-through XSCOM */
+    MemoryRegion phb_regs_mr;
+
+    /* Memory windows from PowerBus to PHB */
+    MemoryRegion phbbar;
+    MemoryRegion intbar;
+    MemoryRegion mmbar0;
+    MemoryRegion mmbar1;
+    uint64_t mmio0_base;
+    uint64_t mmio0_size;
+    uint64_t mmio1_base;
+    uint64_t mmio1_size;
+
+    /* On-chip IODA tables */
+    uint64_t ioda_LIST[PNV_PHB4_MAX_LSIs];
+    uint64_t ioda_MIST[PNV_PHB4_MAX_MIST];
+    uint64_t ioda_TVT[PNV_PHB4_MAX_TVEs];
+    uint64_t ioda_MBT[PNV_PHB4_MAX_MBEs];
+    uint64_t ioda_MDT[PNV_PHB4_MAX_PEs];
+    uint64_t ioda_PEEV[PNV_PHB4_MAX_PEEVs];
+
+    /*
+     * The internal PESTA/B is 2 bits per PE split into two tables, we
+     * store them in a single array here to avoid wasting space.
+     */
+    uint8_t  ioda_PEST_AB[PNV_PHB4_MAX_PEs];
+
+    /* P9 Interrupt generation */
+    XiveSource xsrc;
+
+    QLIST_HEAD(, PnvPhb4DMASpace) dma_spaces;
+};
+
+#endif /* PCI_HOST_PNV_PHB_H */
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index 35483e59c3..b6b5f91684 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -12,6 +12,7 @@
 
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pcie_port.h"
+#include "hw/pci-host/pnv_phb.h"
 #include "hw/ppc/xics.h"
 #include "qom/object.h"
 
@@ -22,21 +23,9 @@ typedef struct PnvChip PnvChip;
  * PHB3 XICS Source for MSIs
  */
 #define TYPE_PHB3_MSI "phb3-msi"
-typedef struct Phb3MsiState Phb3MsiState;
 DECLARE_INSTANCE_CHECKER(Phb3MsiState, PHB3_MSI,
                          TYPE_PHB3_MSI)
 
-#define PHB3_MAX_MSI     2048
-
-struct Phb3MsiState {
-    ICSState ics;
-    qemu_irq *qirqs;
-
-    PnvPHB3 *phb;
-    uint64_t rba[PHB3_MAX_MSI / 64];
-    uint32_t rba_sum;
-};
-
 void pnv_phb3_msi_update_config(Phb3MsiState *msis, uint32_t base,
                                 uint32_t count);
 void pnv_phb3_msi_send(Phb3MsiState *msis, uint64_t addr, uint16_t data,
@@ -44,64 +33,12 @@ void pnv_phb3_msi_send(Phb3MsiState *msis, uint64_t addr, uint16_t data,
 void pnv_phb3_msi_ffi(Phb3MsiState *msis, uint64_t val);
 void pnv_phb3_msi_pic_print_info(Phb3MsiState *msis, Monitor *mon);
 
-
-/*
- * We have one such address space wrapper per possible device under
- * the PHB since they need to be assigned statically at qemu device
- * creation time. The relationship to a PE is done later dynamically.
- * This means we can potentially create a lot of these guys. Q35
- * stores them as some kind of radix tree but we never really need to
- * do fast lookups so instead we simply keep a QLIST of them for now,
- * we can add the radix if needed later on.
- *
- * We do cache the PE number to speed things up a bit though.
- */
-typedef struct PnvPhb3DMASpace {
-    PCIBus *bus;
-    uint8_t devfn;
-    int pe_num;         /* Cached PE number */
-#define PHB_INVALID_PE (-1)
-    PnvPHB3 *phb;
-    AddressSpace dma_as;
-    IOMMUMemoryRegion dma_mr;
-    MemoryRegion msi32_mr;
-    MemoryRegion msi64_mr;
-    QLIST_ENTRY(PnvPhb3DMASpace) list;
-} PnvPhb3DMASpace;
-
 /*
  * PHB3 Power Bus Common Queue
  */
 #define TYPE_PNV_PBCQ "pnv-pbcq"
 OBJECT_DECLARE_SIMPLE_TYPE(PnvPBCQState, PNV_PBCQ)
 
-struct PnvPBCQState {
-    DeviceState parent;
-
-    uint32_t nest_xbase;
-    uint32_t spci_xbase;
-    uint32_t pci_xbase;
-#define PBCQ_NEST_REGS_COUNT    0x46
-#define PBCQ_PCI_REGS_COUNT     0x15
-#define PBCQ_SPCI_REGS_COUNT    0x5
-
-    uint64_t nest_regs[PBCQ_NEST_REGS_COUNT];
-    uint64_t spci_regs[PBCQ_SPCI_REGS_COUNT];
-    uint64_t pci_regs[PBCQ_PCI_REGS_COUNT];
-    MemoryRegion mmbar0;
-    MemoryRegion mmbar1;
-    MemoryRegion phbbar;
-    uint64_t mmio0_base;
-    uint64_t mmio0_size;
-    uint64_t mmio1_base;
-    uint64_t mmio1_size;
-    PnvPHB3 *phb;
-
-    MemoryRegion xscom_nest_regs;
-    MemoryRegion xscom_pci_regs;
-    MemoryRegion xscom_spci_regs;
-};
-
 /*
  * PHB3 PCIe Root port
  */
-- 
2.32.0


