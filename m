Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6572FB563
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:36:23 +0100 (CET)
Received: from localhost ([::1]:34780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1oN2-0004kB-Pe
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2n-0002Bk-DA; Tue, 19 Jan 2021 05:15:25 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:42777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2l-0004L9-2W; Tue, 19 Jan 2021 05:15:25 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0B6B1F5B;
 Tue, 19 Jan 2021 05:15:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 19 Jan 2021 05:15:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=fCIVtVr8iefwk
 L2tDqX1kev7gyFS/qzgYRu33l1LH/Q=; b=mz4cuCUMhGoJ4QPnnUmzZMxGCYglq
 IciueM/nuTzNopyVMLdBRyGtjqzEcFfYxEvpgFVQTgow2RzhHbOm8lbHimxiFWod
 E7eWZGRpw4oSQJGukuOUN23HAplj0EkeW1HV/fcYFogOPh4nCcTFjjylsXQBLZdU
 NGJRvMdZgHQlfHSWwVON7PCV6iBJ7KlnbtdY8bTOr0LhSa6Bnhwp4qNpgbIy5AyQ
 25YRfk+7KUxnkM14TeibpyABI5ejayej8P9nT0uUNsccxIor0t/yq1EtNg3iseIx
 yAOw5nfMMBFKSvx6HXDfX2NTaVhRlXXfwYDdUlF8AmOLvQ6HH5lCrWcRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=fCIVtVr8iefwkL2tDqX1kev7gyFS/qzgYRu33l1LH/Q=; b=c9+j2YyD
 xd8FSlD7+t37nlbD6e7rog/f8U4HP4kNFxDudRi0yY5jRDZPicXDYoAdl/QgV9cL
 Nx3yxyIv6lQsO9m6gJUy+nLRUmIuXpcOKhsXW7H8Yks/+TaPi4D7rbJlSCT97e6P
 uD8t1YNNEJ7GPDWP9BmeYp+Tpbv1gqc2bn7vhaocemtw99Dvt3KhEgYpwFEs0jzz
 PWfj+3JAylYAjDLCmmMdhUPDFRWsB1Si002kQqOkLNRnjQkOfbnHWWTtfoCEWpYh
 uTx5z0IOFTiS8iQ+Vbf+VWBcg1rpQgeadGWk+mnUd9eLDjqSqSCvDbBH9HewffJN
 do1fYVGawXtDPw==
X-ME-Sender: <xms:OLEGYBsC-oS5U_vXRDJxPs6NaKzBGOn3VYKV7aaa1xIMycMmllBUGg>
 <xme:OLEGYKdDMd-d4AuFTX4nD0j6Cs0ib9irLtOyHENEuhs2tBC1melDYVZkWDua9QlJq
 IOWZg00sv6qCr-kaKI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhephfeiteduueduhefggeduhfeiveehgfelgfefvedtfeelfeeigeduteevtdfhtdef
 necuffhomhgrihhnpehpmhhrrdguvghvnecukfhppeektddrudeijedrleekrdduledtne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshes
 ihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:OLEGYEwwFnK3KtRQnluwsl5ttr77QqUem7lJmXzJSlB3xxVlvHxAgQ>
 <xmx:OLEGYINEyjU8DN_-TvBUsXiY-ffyOMrCQpPRYe7nJ2r1LNsAbTpS3g>
 <xmx:OLEGYB-itJ8yBck7DZ6d0kdEyrq5q0-_x1hA8t5_hB2gjmED5GsmLA>
 <xmx:OLEGYKMFH0guHsZe0vCBTGj2jB8VZkPNO3ZBB6KJyuuWWm6rgojm6g>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3D1B8240062;
 Tue, 19 Jan 2021 05:15:19 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/12] hw/block/nvme: add PMR RDS/WDS support
Date: Tue, 19 Jan 2021 11:15:01 +0100
Message-Id: <20210119101504.231259-10-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119101504.231259-1-its@irrelevant.dk>
References: <20210119101504.231259-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Naveen Nagar <naveen.n1@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Naveen Nagar <naveen.n1@samsung.com>

Add support for the PMRMSCL and PMRMSCU MMIO registers. This allows
adding RDS/WDS support for PMR as well.

Signed-off-by: Naveen Nagar <naveen.n1@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h      |   6 ++-
 include/block/nvme.h |   1 +
 hw/block/nvme.c      | 122 +++++++++++++++++++++++++++++++++++--------
 3 files changed, 107 insertions(+), 22 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index e5d2cce207f4..e431474fa5ca 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -150,7 +150,11 @@ typedef struct NvmeCtrl {
     uint64_t    starttime_ms;
     uint16_t    temperature;
 
-    HostMemoryBackend *pmrdev;
+    struct {
+        HostMemoryBackend *dev;
+        bool              cmse;
+        hwaddr            cba;
+    } pmr;
 
     uint8_t     aer_mask;
     NvmeRequest **aer_reqs;
diff --git a/include/block/nvme.h b/include/block/nvme.h
index f3cbe17d0971..183dc5c0ecf6 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -62,6 +62,7 @@ enum NvmeCapMask {
 #define NVME_CAP_CSS(cap)   (((cap) >> CAP_CSS_SHIFT)    & CAP_CSS_MASK)
 #define NVME_CAP_MPSMIN(cap)(((cap) >> CAP_MPSMIN_SHIFT) & CAP_MPSMIN_MASK)
 #define NVME_CAP_MPSMAX(cap)(((cap) >> CAP_MPSMAX_SHIFT) & CAP_MPSMAX_MASK)
+#define NVME_CAP_PMRS(cap)  (((cap) >> CAP_PMRS_SHIFT)   & CAP_PMRS_MASK)
 
 #define NVME_CAP_SET_MQES(cap, val)   (cap |= (uint64_t)(val & CAP_MQES_MASK)  \
                                                            << CAP_MQES_SHIFT)
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 2a0d7e926bbf..2e0e11174c79 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -273,6 +273,24 @@ static inline void *nvme_addr_to_cmb(NvmeCtrl *n, hwaddr addr)
     return &n->cmbuf[addr - n->ctrl_mem.addr];
 }
 
+static bool nvme_addr_is_pmr(NvmeCtrl *n, hwaddr addr)
+{
+    hwaddr hi;
+
+    if (!n->pmr.cmse) {
+        return false;
+    }
+
+    hi = n->pmr.cba + int128_get64(n->pmr.dev->mr.size);
+
+    return addr >= n->pmr.cba && addr < hi;
+}
+
+static inline void *nvme_addr_to_pmr(NvmeCtrl *n, hwaddr addr)
+{
+    return memory_region_get_ram_ptr(&n->pmr.dev->mr) + (addr - n->pmr.cba);
+}
+
 static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
 {
     hwaddr hi = addr + size - 1;
@@ -285,6 +303,11 @@ static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
         return 0;
     }
 
+    if (nvme_addr_is_pmr(n, addr) && nvme_addr_is_pmr(n, hi)) {
+        memcpy(buf, nvme_addr_to_pmr(n, addr), size);
+        return 0;
+    }
+
     return pci_dma_read(&n->parent_obj, addr, buf, size);
 }
 
@@ -406,9 +429,27 @@ static uint16_t nvme_map_addr_cmb(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
     return NVME_SUCCESS;
 }
 
+static uint16_t nvme_map_addr_pmr(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
+    size_t len)
+{
+    if (!len) {
+        return NVME_SUCCESS;
+    }
+
+    if (!nvme_addr_is_pmr(n, addr) || !nvme_addr_is_pmr(n, addr + len - 1)) {
+        return NVME_DATA_TRAS_ERROR;
+    }
+
+    qemu_iovec_add(iov, nvme_addr_to_pmr(n, addr), len);
+
+    return NVME_SUCCESS;
+}
+
 static uint16_t nvme_map_addr(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
                               hwaddr addr, size_t len)
 {
+    bool cmb = false, pmr = false;
+
     if (!len) {
         return NVME_SUCCESS;
     }
@@ -416,6 +457,12 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
     trace_pci_nvme_map_addr(addr, len);
 
     if (nvme_addr_is_cmb(n, addr)) {
+        cmb = true;
+    } else if (nvme_addr_is_pmr(n, addr)) {
+        pmr = true;
+    }
+
+    if (cmb || pmr) {
         if (qsg && qsg->sg) {
             return NVME_INVALID_USE_OF_CMB | NVME_DNR;
         }
@@ -426,7 +473,11 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
             qemu_iovec_init(iov, 1);
         }
 
-        return nvme_map_addr_cmb(n, iov, addr, len);
+        if (cmb) {
+            return nvme_map_addr_cmb(n, iov, addr, len);
+        } else {
+            return nvme_map_addr_pmr(n, iov, addr, len);
+        }
     }
 
     if (iov && iov->iov) {
@@ -459,7 +510,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
 
     trace_pci_nvme_map_prp(trans_len, len, prp1, prp2, num_prps);
 
-    if (nvme_addr_is_cmb(n, prp1)) {
+    if (nvme_addr_is_cmb(n, prp1) || (nvme_addr_is_pmr(n, prp1))) {
         qemu_iovec_init(iov, num_prps);
     } else {
         pci_dma_sglist_init(qsg, &n->parent_obj, num_prps);
@@ -3532,8 +3583,8 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
     NvmeNamespace *ns;
     int i;
 
-    if (n->pmrdev) {
-        memory_region_msync(&n->pmrdev->mr, 0, n->pmrdev->size);
+    if (n->pmr.dev) {
+        memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
     }
 
     for (i = 1; i <= n->num_namespaces; i++) {
@@ -3822,11 +3873,12 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
     case 0xE04: /* PMRCTL */
         n->bar.pmrctl = data;
         if (NVME_PMRCTL_EN(data)) {
-            memory_region_set_enabled(&n->pmrdev->mr, true);
+            memory_region_set_enabled(&n->pmr.dev->mr, true);
             n->bar.pmrsts = 0;
         } else {
-            memory_region_set_enabled(&n->pmrdev->mr, false);
+            memory_region_set_enabled(&n->pmr.dev->mr, false);
             NVME_PMRSTS_SET_NRDY(n->bar.pmrsts, 1);
+            n->pmr.cmse = false;
         }
         return;
     case 0xE08: /* PMRSTS */
@@ -3841,8 +3893,33 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrswtp_readonly,
                        "invalid write to PMRSWTP register, ignored");
         return;
-    case 0xE14: /* TODO PMRMSC */
-        break;
+    case 0xE14: /* PMRMSCL */
+        if (!NVME_CAP_PMRS(n->bar.cap)) {
+            return;
+        }
+
+        n->bar.pmrmsc = (n->bar.pmrmsc & ~0xffffffff) | (data & 0xffffffff);
+        n->pmr.cmse = false;
+
+        if (NVME_PMRMSC_CMSE(n->bar.pmrmsc)) {
+            hwaddr cba = NVME_PMRMSC_CBA(n->bar.pmrmsc) << PMRMSC_CBA_SHIFT;
+            if (cba + int128_get64(n->pmr.dev->mr.size) < cba) {
+                NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 1);
+                return;
+            }
+
+            n->pmr.cmse = true;
+            n->pmr.cba = cba;
+        }
+
+        return;
+    case 0xE18: /* PMRMSCU */
+        if (!NVME_CAP_PMRS(n->bar.cap)) {
+            return;
+        }
+
+        n->bar.pmrmsc = (n->bar.pmrmsc & 0xffffffff) | (data << 32);
+        return;
     default:
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_invalid,
                        "invalid MMIO write,"
@@ -3880,7 +3957,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
          */
         if (addr == 0xE08 &&
             (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
-            memory_region_msync(&n->pmrdev->mr, 0, n->pmrdev->size);
+            memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
         }
         memcpy(&val, ptr + addr, size);
     } else {
@@ -4099,19 +4176,19 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
         return;
     }
 
-    if (n->pmrdev) {
-        if (host_memory_backend_is_mapped(n->pmrdev)) {
+    if (n->pmr.dev) {
+        if (host_memory_backend_is_mapped(n->pmr.dev)) {
             error_setg(errp, "can't use already busy memdev: %s",
-                       object_get_canonical_path_component(OBJECT(n->pmrdev)));
+                       object_get_canonical_path_component(OBJECT(n->pmr.dev)));
             return;
         }
 
-        if (!is_power_of_2(n->pmrdev->size)) {
+        if (!is_power_of_2(n->pmr.dev->size)) {
             error_setg(errp, "pmr backend size needs to be power of 2 in size");
             return;
         }
 
-        host_memory_backend_set_mapped(n->pmrdev, true);
+        host_memory_backend_set_mapped(n->pmr.dev, true);
     }
 
     if (n->params.zasl_bs) {
@@ -4196,16 +4273,19 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 
 static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
 {
+    NVME_PMRCAP_SET_RDS(n->bar.pmrcap, 1);
+    NVME_PMRCAP_SET_WDS(n->bar.pmrcap, 1);
     NVME_PMRCAP_SET_BIR(n->bar.pmrcap, NVME_PMR_BIR);
     /* Turn on bit 1 support */
     NVME_PMRCAP_SET_PMRWBM(n->bar.pmrcap, 0x02);
+    NVME_PMRCAP_SET_CMSS(n->bar.pmrcap, 1);
 
     pci_register_bar(pci_dev, NVME_PMRCAP_BIR(n->bar.pmrcap),
                      PCI_BASE_ADDRESS_SPACE_MEMORY |
                      PCI_BASE_ADDRESS_MEM_TYPE_64 |
-                     PCI_BASE_ADDRESS_MEM_PREFETCH, &n->pmrdev->mr);
+                     PCI_BASE_ADDRESS_MEM_PREFETCH, &n->pmr.dev->mr);
 
-    memory_region_set_enabled(&n->pmrdev->mr, false);
+    memory_region_set_enabled(&n->pmr.dev->mr, false);
 }
 
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
@@ -4266,7 +4346,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
         nvme_init_cmb(n, pci_dev);
     }
 
-    if (n->pmrdev) {
+    if (n->pmr.dev) {
         nvme_init_pmr(n, pci_dev);
     }
 
@@ -4339,7 +4419,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_ADMIN_ONLY);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
     NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
-    NVME_CAP_SET_PMRS(n->bar.cap, n->pmrdev ? 1 : 0);
+    NVME_CAP_SET_PMRS(n->bar.cap, n->pmr.dev ? 1 : 0);
 
     n->bar.vs = NVME_SPEC_VER;
     n->bar.intmc = n->bar.intms = 0;
@@ -4403,15 +4483,15 @@ static void nvme_exit(PCIDevice *pci_dev)
         g_free(n->cmbuf);
     }
 
-    if (n->pmrdev) {
-        host_memory_backend_set_mapped(n->pmrdev, false);
+    if (n->pmr.dev) {
+        host_memory_backend_set_mapped(n->pmr.dev, false);
     }
     msix_uninit_exclusive_bar(pci_dev);
 }
 
 static Property nvme_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeCtrl, namespace.blkconf),
-    DEFINE_PROP_LINK("pmrdev", NvmeCtrl, pmrdev, TYPE_MEMORY_BACKEND,
+    DEFINE_PROP_LINK("pmrdev", NvmeCtrl, pmr.dev, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
     DEFINE_PROP_STRING("serial", NvmeCtrl, params.serial),
     DEFINE_PROP_UINT32("cmb_size_mb", NvmeCtrl, params.cmb_size_mb, 0),
-- 
2.30.0


