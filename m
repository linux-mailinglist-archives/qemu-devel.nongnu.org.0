Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAA6558AE4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:43:25 +0200 (CEST)
Received: from localhost ([::1]:39230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Ubk-0004kd-30
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UTY-0004D8-LX; Thu, 23 Jun 2022 17:35:02 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:33415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UTW-0006Pa-JE; Thu, 23 Jun 2022 17:34:56 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id AC65A3200926;
 Thu, 23 Jun 2022 17:34:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 23 Jun 2022 17:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656020091; x=
 1656106491; bh=KIBEtfUDjmhyDepSen6nNzMmoNLsXbyhIc3MTolSxrM=; b=f
 tu6EkiCpjwMyBZxarg8kGUIl3mq4upIVOE5/QWYOPPW7dXTXBHnSgnQM4eJ9ue2n
 dJ1uPdRpzFg8Ptm9SJhd+3YXMM9GHtpLQMzyRUfIsy3SWvEdNP48yvUQ+6KpuuEZ
 mfg3xiHBQdwfTQlrzdS836SuS5mNgUVmx/0WC7jB8VtSrQM3gUPDB6kc9K34qL7d
 nO+Re35D8lQAwO4xh3Kf2EuuOLa+WfIEnjhnLrUXkIHX0b0430jE2lqE4JjkDA0J
 TPgaomORa1X/fg9wP+PHfnKAXy9DNZTTLYxx9JckEiSIWZ+D8n4yLaenqFElEgh7
 bjnGquMFF1lY12fGd/hkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656020091; x=1656106491; bh=KIBEtfUDjmhyD
 epSen6nNzMmoNLsXbyhIc3MTolSxrM=; b=LPSC41cneLyLOL3XveICD6Z7qw7Ob
 oeiTShe2/pPRi30OTHZJst+ZYY3nsqpwi0zvJ0yvKtoeFWnubAbUiStLW5luY4vx
 Qg5lrGmgD2GDXqDgUjrZdwJC0JJgtpYElOeRl9mlw+YrV2Bk0PZ9rIvTSOLERGBr
 xsdaBwuhAFv+qRFfQfZqKNsglcQbP6oOMwyAWfniIsUZ+52gws4BG25/Yi4Rdda/
 lOiNuQ0siy0MwHgyvUydc5tZ/+VhvYAculItJOlwxdkx/uIy5IUbU6IGZ+WQbaxi
 3kn/jN4Dx6mGA6I/xAWRW5kMK93DP7Qv27nbp1fvuNfUz5uX0ZiFyA43A==
X-ME-Sender: <xms:ety0Yix4pIHHeM4KlTds_fDXOUtJRDUVoXPgpMEXIzj2Jyxf9F776Q>
 <xme:ety0YuTOhC-5h5aqpbB00pYFcDb2KTzfoJIRMLQVX3CJyqnJmNmSTCypOk0JcOd9y
 aV4Ythrms9UqgA2yzE>
X-ME-Received: <xmr:ety0YkVH_fZTW1neFDL77aUnQOMR0KJDKnexVgQUirr_9pkMJlKRrGGCR6KrZBtux1xwn4md-OT_Req6Ubi6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeigecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ety0YojCXoZp7vsQ7FYz56IOmsQfEgjX_wW_8jeuKBk-bUarTEW_-g>
 <xmx:ety0YkDIwtp1C-PV2qyWFtUmMWFiSdiOSStzI9OBlAfe0ujgKLGp1A>
 <xmx:ety0YpJfv8DY0WVOvsBBoWc8Ql7XIBez01xBx1-9I7I5wtAaX7e12g>
 <xmx:e9y0Ysboz30yb3YfVdtA_PoLCEgZq7TguJ8E8WJrsEqQjCLE1Xk4JQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:34:48 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 01/15] hw/nvme: Add support for SR-IOV
Date: Thu, 23 Jun 2022 23:34:28 +0200
Message-Id: <20220623213442.67789-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623213442.67789-1-its@irrelevant.dk>
References: <20220623213442.67789-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Lukasz Maniak <lukasz.maniak@linux.intel.com>

This patch implements initial support for Single Root I/O Virtualization
on an NVMe device.

Essentially, it allows to define the maximum number of virtual functions
supported by the NVMe controller via sriov_max_vfs parameter.

Passing a non-zero value to sriov_max_vfs triggers reporting of SR-IOV
capability by a physical controller and ARI capability by both the
physical and virtual function devices.

NVMe controllers created via virtual functions mirror functionally
the physical controller, which may not entirely be the case, thus
consideration would be needed on the way to limit the capabilities of
the VF.

NVMe subsystem is required for the use of SR-IOV.

Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c           | 85 ++++++++++++++++++++++++++++++++++++++--
 hw/nvme/nvme.h           |  3 +-
 include/hw/pci/pci_ids.h |  1 +
 3 files changed, 85 insertions(+), 4 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 1e6e0fcad918..855ab55aa46b 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -35,6 +35,7 @@
  *              mdts=<N[optional]>,vsl=<N[optional]>, \
  *              zoned.zasl=<N[optional]>, \
  *              zoned.auto_transition=<on|off[optional]>, \
+ *              sriov_max_vfs=<N[optional]> \
  *              subsys=<subsys_id>
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
@@ -106,6 +107,12 @@
  *   transitioned to zone state closed for resource management purposes.
  *   Defaults to 'on'.
  *
+ * - `sriov_max_vfs`
+ *   Indicates the maximum number of PCIe virtual functions supported
+ *   by the controller. The default value is 0. Specifying a non-zero value
+ *   enables reporting of both SR-IOV and ARI capabilities by the NVMe device.
+ *   Virtual function controllers will not report SR-IOV capability.
+ *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  * - `shared`
@@ -160,6 +167,7 @@
 #include "sysemu/block-backend.h"
 #include "sysemu/hostmem.h"
 #include "hw/pci/msix.h"
+#include "hw/pci/pcie_sriov.h"
 #include "migration/vmstate.h"
 
 #include "nvme.h"
@@ -176,6 +184,9 @@
 #define NVME_TEMPERATURE_CRITICAL 0x175
 #define NVME_NUM_FW_SLOTS 1
 #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
+#define NVME_MAX_VFS 127
+#define NVME_VF_OFFSET 0x1
+#define NVME_VF_STRIDE 1
 
 #define NVME_GUEST_ERR(trace, fmt, ...) \
     do { \
@@ -5888,6 +5899,10 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
         g_free(event);
     }
 
+    if (!pci_is_vf(&n->parent_obj) && n->params.sriov_max_vfs) {
+        pcie_sriov_pf_disable_vfs(&n->parent_obj);
+    }
+
     n->aer_queued = 0;
     n->outstanding_aers = 0;
     n->qs_created = false;
@@ -6569,6 +6584,29 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
         error_setg(errp, "vsl must be non-zero");
         return;
     }
+
+    if (params->sriov_max_vfs) {
+        if (!n->subsys) {
+            error_setg(errp, "subsystem is required for the use of SR-IOV");
+            return;
+        }
+
+        if (params->sriov_max_vfs > NVME_MAX_VFS) {
+            error_setg(errp, "sriov_max_vfs must be between 0 and %d",
+                       NVME_MAX_VFS);
+            return;
+        }
+
+        if (params->cmb_size_mb) {
+            error_setg(errp, "CMB is not supported with SR-IOV");
+            return;
+        }
+
+        if (n->pmr.dev) {
+            error_setg(errp, "PMR is not supported with SR-IOV");
+            return;
+        }
+    }
 }
 
 static void nvme_init_state(NvmeCtrl *n)
@@ -6626,6 +6664,20 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
     memory_region_set_enabled(&n->pmr.dev->mr, false);
 }
 
+static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset,
+                            uint64_t bar_size)
+{
+    uint16_t vf_dev_id = n->params.use_intel_id ?
+                         PCI_DEVICE_ID_INTEL_NVME : PCI_DEVICE_ID_REDHAT_NVME;
+
+    pcie_sriov_pf_init(pci_dev, offset, "nvme", vf_dev_id,
+                       n->params.sriov_max_vfs, n->params.sriov_max_vfs,
+                       NVME_VF_OFFSET, NVME_VF_STRIDE);
+
+    pcie_sriov_pf_init_vf_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
+                              PCI_BASE_ADDRESS_MEM_TYPE_64, bar_size);
+}
+
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
     uint8_t *pci_conf = pci_dev->config;
@@ -6640,7 +6692,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 
     if (n->params.use_intel_id) {
         pci_config_set_vendor_id(pci_conf, PCI_VENDOR_ID_INTEL);
-        pci_config_set_device_id(pci_conf, 0x5845);
+        pci_config_set_device_id(pci_conf, PCI_DEVICE_ID_INTEL_NVME);
     } else {
         pci_config_set_vendor_id(pci_conf, PCI_VENDOR_ID_REDHAT);
         pci_config_set_device_id(pci_conf, PCI_DEVICE_ID_REDHAT_NVME);
@@ -6648,6 +6700,9 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 
     pci_config_set_class(pci_conf, PCI_CLASS_STORAGE_EXPRESS);
     pcie_endpoint_cap_init(pci_dev, 0x80);
+    if (n->params.sriov_max_vfs) {
+        pcie_ari_init(pci_dev, 0x100, 1);
+    }
 
     bar_size = QEMU_ALIGN_UP(n->reg_size, 4 * KiB);
     msix_table_offset = bar_size;
@@ -6666,8 +6721,12 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
                           n->reg_size);
     memory_region_add_subregion(&n->bar0, 0, &n->iomem);
 
-    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
-                     PCI_BASE_ADDRESS_MEM_TYPE_64, &n->bar0);
+    if (pci_is_vf(pci_dev)) {
+        pcie_sriov_vf_register_bar(pci_dev, 0, &n->bar0);
+    } else {
+        pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
+                         PCI_BASE_ADDRESS_MEM_TYPE_64, &n->bar0);
+    }
     ret = msix_init(pci_dev, n->params.msix_qsize,
                     &n->bar0, 0, msix_table_offset,
                     &n->bar0, 0, msix_pba_offset, 0, &err);
@@ -6688,6 +6747,10 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
         nvme_init_pmr(n, pci_dev);
     }
 
+    if (!pci_is_vf(pci_dev) && n->params.sriov_max_vfs) {
+        nvme_init_sriov(n, pci_dev, 0x120, bar_size);
+    }
+
     return 0;
 }
 
@@ -6838,6 +6901,16 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     NvmeCtrl *n = NVME(pci_dev);
     NvmeNamespace *ns;
     Error *local_err = NULL;
+    NvmeCtrl *pn = NVME(pcie_sriov_get_pf(pci_dev));
+
+    if (pci_is_vf(pci_dev)) {
+        /*
+         * VFs derive settings from the parent. PF's lifespan exceeds
+         * that of VF's, so it's safe to share params.serial.
+         */
+        memcpy(&n->params, &pn->params, sizeof(NvmeParams));
+        n->subsys = pn->subsys;
+    }
 
     nvme_check_constraints(n, &local_err);
     if (local_err) {
@@ -6902,6 +6975,11 @@ static void nvme_exit(PCIDevice *pci_dev)
     if (n->pmr.dev) {
         host_memory_backend_set_mapped(n->pmr.dev, false);
     }
+
+    if (!pci_is_vf(pci_dev) && n->params.sriov_max_vfs) {
+        pcie_sriov_pf_exit(pci_dev);
+    }
+
     msix_uninit(pci_dev, &n->bar0, &n->bar0);
     memory_region_del_subregion(&n->bar0, &n->iomem);
 }
@@ -6926,6 +7004,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
     DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
                      params.auto_transition_zones, true),
+    DEFINE_PROP_UINT8("sriov_max_vfs", NvmeCtrl, params.sriov_max_vfs, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index e41771604f59..7e4bbd5606a0 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -24,7 +24,7 @@
 
 #include "block/nvme.h"
 
-#define NVME_MAX_CONTROLLERS 32
+#define NVME_MAX_CONTROLLERS 256
 #define NVME_MAX_NAMESPACES  256
 #define NVME_EUI64_DEFAULT ((uint64_t)0x5254000000000000)
 
@@ -406,6 +406,7 @@ typedef struct NvmeParams {
     uint8_t  zasl;
     bool     auto_transition_zones;
     bool     legacy_cmb;
+    uint8_t  sriov_max_vfs;
 } NvmeParams;
 
 typedef struct NvmeCtrl {
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 898083b86f87..d5ddea558bf6 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -238,6 +238,7 @@
 #define PCI_DEVICE_ID_INTEL_82801BA_11   0x244e
 #define PCI_DEVICE_ID_INTEL_82801D       0x24CD
 #define PCI_DEVICE_ID_INTEL_ESB_9        0x25ab
+#define PCI_DEVICE_ID_INTEL_NVME         0x5845
 #define PCI_DEVICE_ID_INTEL_82371SB_0    0x7000
 #define PCI_DEVICE_ID_INTEL_82371SB_1    0x7010
 #define PCI_DEVICE_ID_INTEL_82371SB_2    0x7020
-- 
2.36.1


