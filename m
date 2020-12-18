Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FA32DE35F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:38:59 +0100 (CET)
Received: from localhost ([::1]:38948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqFyE-0006Bv-9U
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFp3-0003Y8-TX; Fri, 18 Dec 2020 08:29:29 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:37829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFox-0002yG-9F; Fri, 18 Dec 2020 08:29:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 0E49390F;
 Fri, 18 Dec 2020 08:29:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 18 Dec 2020 08:29:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=CHosVz7wDL0jI
 rN2brZWFzDkPR7DRtDfUFuuzgG3sGM=; b=cHnEl2bHKXZqk6CzXoTAzm7gKO0V2
 uXDXbDr03HOuWKcrZV0Snw9oaKi/Z7ki0XRPHi64prDNErq4SrxaH79XK1W6ocVk
 l3AHoMMMTvfEazu6CxsL07YwGjIzF/+rkCxmiSbL/AdaE1hhxWQ8xsOXbYyyHxiB
 7gZD5k4xeYnQRBYo/M26dIdx5iu5wtGvRC3DQzfF4XjSh1Z7T+rpakDA9Ul/djqW
 0UtCS8fhlTKNP6FQFKt0OY3cyEh4wwr/eM7WnQODvsr7G/0S0qO06q6/EVv2RT6h
 6nvuxPNE2Osk1bXxIL6OKt8PhpIFY6zW7jF7DBq+DQpCUuKvtyoElqOjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=CHosVz7wDL0jIrN2brZWFzDkPR7DRtDfUFuuzgG3sGM=; b=N/3UFGdX
 zgsXCLjQ2dQOCqKfZZBN+HdxjqyhMnNFsTE9u8dw0qzqhe6T4Y2ZVH6RY9RBux9l
 qg1bqTvNblH+fDgoaQTNU6Xg6BQ//RUygfKxdNoOK5DgST0gZY2Yt90IdarCujKr
 ZWdjxwafOFoZfHosnzbQR++olvPusdQU9xhBq6yiHhpZyR7nB0w8QmfFxhVdqUud
 Rs5CwsmmyjksfjG5fBaY5dm1cF8BE5BCgZi3d9hYJPbCLZf+YO/82/URNYQ+qqzj
 k1ACM2i4h3EPHXFk57pABVWnJeaSs8sskjDFz6AVT4E83ngo1Ay/5GRhzsielkLR
 SH4447fMuWMEZw==
X-ME-Sender: <xms:sK7cX7dJWMn3y3hF5gqmdAfBxt8L_ZtLHo0PIXn5sZWytfDZoF38ew>
 <xme:sK7cXxPpe_uC967d4ZjCUISXZU1c_UUSHTzFI7MM7VP0-a-bdHX25VQ9kI-MWWULg
 w2aRqzd2VwO5ghZj58>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:sK7cX0inDbZJXVv_vwiFaJm0-Q88Rell-i7ytsEU1_tPLBkgbgSMNA>
 <xmx:sK7cX89VXrNjAZRUs3__fb3TLT-oftr2BOrXEEWKD-soDnJQBudeXA>
 <xmx:sK7cX3tHWvnuG720qdilyqcCpUDz886X3d_sSrwYmPVXgq8qfFqJ-w>
 <xmx:sK7cX9DxFFljvHWDbXDor5onLetqKgqAlSvrMhlA18pdx_VF0sLwBQiVGEc>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 28ACB24005A;
 Fri, 18 Dec 2020 08:29:19 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] hw/block/nvme: add PMR RDS/WDS support
Date: Fri, 18 Dec 2020 14:29:05 +0100
Message-Id: <20201218132905.967326-9-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218132905.967326-1-its@irrelevant.dk>
References: <20201218132905.967326-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
 Keith Busch <kbusch@kernel.org>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Naveen Nagar <naveen.n1@samsung.com>

Add support for the PMRMSCL and PMRMSCU MMIO registers. This allows
adding RDS/WDS support for PMR as well.

Signed-off-by: Naveen Nagar <naveen.n1@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h      |  1 +
 include/block/nvme.h |  1 +
 hw/block/nvme.c      | 88 ++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index b1b273ce535e..0dc119dedc00 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -142,6 +142,7 @@ typedef struct NvmeCtrl {
     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
     uint64_t    starttime_ms;
     uint16_t    temperature;
+    bool        pmr_cmse;
 
     HostMemoryBackend *pmrdev;
 
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 686e2541a587..ed645b6cb4f2 100644
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
index c04d6e69e4df..055b9c69bafb 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -142,6 +142,31 @@ static inline void *nvme_addr_to_cmb(NvmeCtrl *n, hwaddr addr)
     return &n->cmbuf[addr - n->ctrl_mem.addr];
 }
 
+static inline bool nvme_addr_is_pmr(NvmeCtrl *n, hwaddr addr)
+{
+    hwaddr hi, low;
+
+    if (!n->pmrdev || !n->pmrdev->mr.enabled) {
+        return false;
+    }
+
+    low = NVME_PMRMSC_CBA(n->bar.pmrmsc) << PMRMSC_CBA_SHIFT;
+    hi  = low + int128_get64(n->pmrdev->mr.size);
+
+    return addr >= low && addr < hi;
+}
+
+static inline void *nvme_addr_to_pmr(NvmeCtrl *n, hwaddr addr)
+{
+    hwaddr cba;
+
+    assert(nvme_addr_is_pmr(n, addr));
+
+    cba = NVME_PMRMSC_CBA(n->bar.pmrmsc) << PMRMSC_CBA_SHIFT;
+
+    return memory_region_get_ram_ptr(&n->pmrdev->mr) + (addr - cba);
+}
+
 static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
 {
     hwaddr hi = addr + size - 1;
@@ -154,6 +179,11 @@ static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
         return 0;
     }
 
+    if (nvme_addr_is_pmr(n, addr) && nvme_addr_is_pmr(n, hi)) {
+        memcpy(buf, nvme_addr_to_pmr(n, addr), size);
+        return 0;
+    }
+
     return pci_dma_read(&n->parent_obj, addr, buf, size);
 }
 
@@ -275,6 +305,22 @@ static uint16_t nvme_map_addr_cmb(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
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
@@ -297,6 +343,19 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
 
         return nvme_map_addr_cmb(n, iov, addr, len);
     }
+    if (nvme_addr_is_pmr(n, addr)) {
+        if (qsg && qsg->sg) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+
+        assert(iov);
+
+        if (!iov->iov) {
+            qemu_iovec_init(iov, 1);
+        }
+
+        return nvme_map_addr_pmr(n, iov, addr, len);
+    }
 
     if (iov && iov->iov) {
         return NVME_INVALID_USE_OF_CMB | NVME_DNR;
@@ -328,7 +387,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
 
     trace_pci_nvme_map_prp(trans_len, len, prp1, prp2, num_prps);
 
-    if (nvme_addr_is_cmb(n, prp1)) {
+    if (nvme_addr_is_cmb(n, prp1) || (nvme_addr_is_pmr(n, prp1))) {
         qemu_iovec_init(iov, num_prps);
     } else {
         pci_dma_sglist_init(qsg, &n->parent_obj, num_prps);
@@ -2571,8 +2630,28 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
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
+        n->bar.pmrmsc |= data & 0xffffffff;
+
+        if (NVME_PMRMSC_CMSE(n->bar.pmrmsc)) {
+            hwaddr cba = NVME_PMRMSC_CBA(n->bar.pmrmsc) << PMRMSC_CBA_SHIFT;
+            if (cba + int128_get64(n->pmrdev->mr.size) < cba) {
+                NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 1);
+            }
+        }
+
+        return;
+    case 0xE18: /* PMRMSCU */
+        if (!NVME_CAP_PMRS(n->bar.cap)) {
+            return;
+        }
+
+        n->bar.pmrmsc |= data << 32;
+        return;
     default:
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_invalid,
                        "invalid MMIO write,"
@@ -2919,8 +2998,11 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 
 static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
 {
+    NVME_PMRCAP_SET_RDS(n->bar.pmrcap, 1);
+    NVME_PMRCAP_SET_WDS(n->bar.pmrcap, 1);
     NVME_PMRCAP_SET_BIR(n->bar.pmrcap, NVME_PMR_BIR);
     NVME_PMRCAP_SET_PMRWBM(n->bar.pmrcap, 0x02);
+    NVME_PMRCAP_SET_CMSS(n->bar.pmrcap, 1);
 
     pci_register_bar(pci_dev, NVME_PMRCAP_BIR(n->bar.pmrcap),
                      PCI_BASE_ADDRESS_SPACE_MEMORY |
-- 
2.29.2


