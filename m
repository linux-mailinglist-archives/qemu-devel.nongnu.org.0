Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29B3314ACF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:51:31 +0100 (CET)
Received: from localhost ([::1]:50588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ok6-0002xj-NU
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWI-0005ig-86; Tue, 09 Feb 2021 02:33:10 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:42341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWD-0005yI-0D; Tue, 09 Feb 2021 02:33:09 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 160C2B5B;
 Tue,  9 Feb 2021 02:32:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=FqnJcDBlHWXSM
 cMRWky1ZUdn6yLgXMBbALnFOZ3i2rs=; b=iNW0qgX1jxF2qACm4B2IPq/T3DShT
 J9SRXuViwwCzD48iNxFvSJjhfHNZ6+L910LvTtzSoMuir8hR/pbZyTuX3vncej1c
 Qm8z+vmGIWdbwkMs5L/t09ryvkRSslBg49gZcefP5D8ab3bKsNfWuV95HXi74p8o
 KkQNxthp8LGMOlUhA91dy2LyPNs89d0WQ7hQGzsPCqjlgBPfaVsupdJqjeV94YFB
 FPKloouxyeEXryBYQom3RaaLJ4ahMs49ASYx1pqFAY3hnXQqi2tK+SKgbZ/r+ctk
 OO9JJUuM3Bk1+QSsT1gyIE45eFWVrgB1WnkiINwJvP2j1BYMv1VLPSBfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=FqnJcDBlHWXSMcMRWky1ZUdn6yLgXMBbALnFOZ3i2rs=; b=amUgsJFP
 KCYKrHOXg6L+x1JehOXNNW2pfxhUCBBs/AFEIpo3PFTe5kwGH9q2nTJopWh0zngS
 6xR1VW/EJd0SBPHyetuQl0MGX9xCllRHBA8teUe3sz+MCVn3ZplZ8tCq/mbqZP6/
 h99MCy/dXP6cnQ2Q6GspkxNflNEn9Cc53AWeWmoN31P93QZr6CvpPl8zPw1T1oB+
 ck+K/sjgwx+obswP/8YITzgg/lgFdwRxVfijcJXRa7W8MIAO22XQbf3fimZxUlql
 jgAQuYXIPx8lOJ3DdOkGzxJwHB1FaD+d5HlpAc25GuG7SO8JQEGilAPKfWmqI0uZ
 5oGMl0o3IGCRAQ==
X-ME-Sender: <xms:kjoiYOgpbv5Mvzqbnn7EGOiV9aSWfneLlcLcmkTu7zIXVXvv3PyA6w>
 <xme:kjoiYPBjZGgwwO1RNDeUpWI1lQdJ_KGFZtWvv9gDWvlf-pqxpEZk7Oz3GgbkEJNh-
 yuhg6U5XYPD4KN6N0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefhieetudeuudehgfegudfhieevhefglefgfeevtdefleefieegudetvedthfdt
 feenucffohhmrghinhepphhmrhdruggvvhenucfkphepkedtrdduieejrdelkedrudeltd
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhs
 sehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:kjoiYGGFKN23LE72OFmjf98HfYXlIBYoMCupU9xRgrKy3ssskrNsLw>
 <xmx:kjoiYHRcZeouHZBoZ4Rc57UZfBIYCqXrxYaHyipaME6HoBNNrdm60w>
 <xmx:kjoiYLxZbO1HMl5iwU7SoWeH4eAGwjx5sy0u_HdwWcQjchhlAhs30w>
 <xmx:kjoiYCmI939-yeqcOF7N0uOF4-c5w9fGSnBEwLtkswTKFz8NkRRPHaaFOv8>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 40B8F108005B;
 Tue,  9 Feb 2021 02:32:33 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 46/56] hw/block/nvme: add PMR RDS/WDS support
Date: Tue,  9 Feb 2021 08:30:51 +0100
Message-Id: <20210209073101.548811-47-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Naveen Nagar <naveen.n1@samsung.com>

Add support for the PMRMSCL and PMRMSCU MMIO registers. This allows
adding RDS/WDS support for PMR as well.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Naveen Nagar <naveen.n1@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h |   6 ++-
 hw/block/nvme.c | 122 +++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 106 insertions(+), 22 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 1cdb360bc549..b7702e937e56 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -151,7 +151,11 @@ typedef struct NvmeCtrl {
     uint16_t    temperature;
     uint8_t     smart_critical_warning;
 
-    HostMemoryBackend *pmrdev;
+    struct {
+        HostMemoryBackend *dev;
+        bool              cmse;
+        hwaddr            cba;
+    } pmr;
 
     uint8_t     aer_mask;
     NvmeRequest **aer_reqs;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d773796051d6..7f1c8dd7751c 100644
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
@@ -3561,8 +3612,8 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
     NvmeNamespace *ns;
     int i;
 
-    if (n->pmrdev) {
-        memory_region_msync(&n->pmrdev->mr, 0, n->pmrdev->size);
+    if (n->pmr.dev) {
+        memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
     }
 
     for (i = 1; i <= n->num_namespaces; i++) {
@@ -3851,11 +3902,12 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
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
@@ -3870,8 +3922,33 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
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
@@ -3909,7 +3986,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
          */
         if (addr == 0xE08 &&
             (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
-            memory_region_msync(&n->pmrdev->mr, 0, n->pmrdev->size);
+            memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
         }
         memcpy(&val, ptr + addr, size);
     } else {
@@ -4128,19 +4205,19 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
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
@@ -4225,16 +4302,19 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 
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
@@ -4295,7 +4375,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
         nvme_init_cmb(n, pci_dev);
     }
 
-    if (n->pmrdev) {
+    if (n->pmr.dev) {
         nvme_init_pmr(n, pci_dev);
     }
 
@@ -4368,7 +4448,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_ADMIN_ONLY);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
     NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
-    NVME_CAP_SET_PMRS(n->bar.cap, n->pmrdev ? 1 : 0);
+    NVME_CAP_SET_PMRS(n->bar.cap, n->pmr.dev ? 1 : 0);
 
     n->bar.vs = NVME_SPEC_VER;
     n->bar.intmc = n->bar.intms = 0;
@@ -4432,15 +4512,15 @@ static void nvme_exit(PCIDevice *pci_dev)
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


