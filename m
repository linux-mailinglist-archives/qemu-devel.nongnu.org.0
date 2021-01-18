Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BCF2F9C34
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:12:42 +0100 (CET)
Received: from localhost ([::1]:53532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RWb-0008S2-3B
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R88-0000qQ-1M; Mon, 18 Jan 2021 04:47:24 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:59247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R86-00018o-7s; Mon, 18 Jan 2021 04:47:23 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7C7E15C00A0;
 Mon, 18 Jan 2021 04:47:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 04:47:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=2WhTxBRiYxHob
 QcLpgdGVlJDjvlJYoBYYJbKVpnKa/U=; b=HgWNtu4TgXSNGsejGNiS0lqEqmAkn
 HjCzYgbU7kcR8G0dTqfuaZ28rkX9CVXAvZ+2fia5kh6M1erRvWU/cvl6hBiD1Uj8
 PdnI+8dLeFbThajw/+ZbVX9wksZ7QeatOTTUoBJ6tNG4aIuOLXS2GzfE0Twcim7w
 qhKfm1b91a7UlSSnt2cVnUk7IKM59v1luOrEFLSGKlsaX64EaTJ0a1snVpeHly9l
 gcfekUKqhZsDSGK3GW/VJlx9S1ZjDLnCq65lycYMX5448iAbVWlIiJJ/Arvpawjc
 XLiJwDUQoM9R7fGPgn6isQtr+gEHbx8KKfOAF8+8rN31jShnV/lM0nNRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=2WhTxBRiYxHobQcLpgdGVlJDjvlJYoBYYJbKVpnKa/U=; b=Qzm5sLc7
 KM2AkVYYj8YaT8LsEktRrMI7kI1kwfk9/Y/ibcORBThR2XniijLPax5PrzivFQPG
 6nqmzxiktUu+IAuDmUzPfTrB2yhWRP4C2Wb784GFOLy6tvAxSojfHPrg6LXad1Hk
 FrKo9snC/mYz0EQmgltUWttZsJe1vUYrou1FcAAKiTHM9xgtRKuaPpnmL+jtqcC8
 pihZxYlM9bxxEh/1WmwYkhUEG2HZmA0ulQAXtcWDaszXkNTx5koFcFr9Q3Zx2jtB
 Nq+D8Rqe55H3X/6fpzEKqiGR81HWczm1xq/tZzvXa6802zvXCgit+3+2fPCHS5aV
 qszIk9vgsGgQxQ==
X-ME-Sender: <xms:KVkFYAMjsRioYLu7QsK5m3BRC_kuufJAsDdDRLMY4bxf0i97QawQMg>
 <xme:KVkFYG-2mtEzRMDsI651Np56zm7PTwqFh8Fz-36TXHD-FhvevXWqDEzUSihbqOCGG
 Oj5m_pU3lHW5k1WHKc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepjeenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:KVkFYHS_e6aBsFxddjEHkWKr405irbkIGgsl8xfyXgMCwMj82beq8Q>
 <xmx:KVkFYIsohmxldW5bxjZcj4R5XFxmlfl0_4FeJJ_j8mwmSBWxZcKSyw>
 <xmx:KVkFYIfp8-PA7bhzEZHbHRJhiY0hKdC9I8hqUvyi_HFCKR3sTtSnQw>
 <xmx:KVkFYGu6aqrImgCZoKtdSSbaG3hgxhAlp5dyjbL-3higj0K5OMcy6Q>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1B27224005A;
 Mon, 18 Jan 2021 04:47:20 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/12] hw/block/nvme: add PMR RDS/WDS support
Date: Mon, 18 Jan 2021 10:47:02 +0100
Message-Id: <20210118094705.56772-10-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210118094705.56772-1-its@irrelevant.dk>
References: <20210118094705.56772-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
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
 hw/block/nvme.c      | 89 ++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 87 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 2a25bc84f3f9..5988d9b36e12 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -152,6 +152,7 @@ typedef struct NvmeCtrl {
     uint16_t    temperature;
 
     HostMemoryBackend *pmrdev;
+    bool              pmr_cmse;
 
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
index 937a6ed0a70d..cbc2b32f7c87 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -273,6 +273,26 @@ static inline void *nvme_addr_to_cmb(NvmeCtrl *n, hwaddr addr)
     return &n->cmbuf[addr - n->ctrl_mem.addr];
 }
 
+static bool nvme_addr_is_pmr(NvmeCtrl *n, hwaddr addr)
+{
+    hwaddr hi, low;
+
+    if (!n->pmr_cmse) {
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
+    hwaddr cba = NVME_PMRMSC_CBA(n->bar.pmrmsc) << PMRMSC_CBA_SHIFT;
+    return memory_region_get_ram_ptr(&n->pmrdev->mr) + (addr - cba);
+}
+
 static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
 {
     hwaddr hi = addr + size - 1;
@@ -285,6 +305,11 @@ static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
         return 0;
     }
 
+    if (nvme_addr_is_pmr(n, addr) && nvme_addr_is_pmr(n, hi)) {
+        memcpy(buf, nvme_addr_to_pmr(n, addr), size);
+        return 0;
+    }
+
     return pci_dma_read(&n->parent_obj, addr, buf, size);
 }
 
@@ -406,9 +431,27 @@ static uint16_t nvme_map_addr_cmb(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
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
@@ -416,6 +459,12 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
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
@@ -426,7 +475,11 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
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
@@ -459,7 +512,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
 
     trace_pci_nvme_map_prp(trans_len, len, prp1, prp2, num_prps);
 
-    if (nvme_addr_is_cmb(n, prp1)) {
+    if (nvme_addr_is_cmb(n, prp1) || (nvme_addr_is_pmr(n, prp1))) {
         qemu_iovec_init(iov, num_prps);
     } else {
         pci_dma_sglist_init(qsg, &n->parent_obj, num_prps);
@@ -3818,6 +3871,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         } else {
             memory_region_set_enabled(&n->pmrdev->mr, false);
             NVME_PMRSTS_SET_NRDY(n->bar.pmrsts, 1);
+            n->pmr_cmse = false;
         }
         return;
     case 0xE08: /* PMRSTS */
@@ -3832,8 +3886,32 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
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
+        n->pmr_cmse = false;
+
+        if (NVME_PMRMSC_CMSE(n->bar.pmrmsc)) {
+            hwaddr cba = NVME_PMRMSC_CBA(n->bar.pmrmsc) << PMRMSC_CBA_SHIFT;
+            if (cba + int128_get64(n->pmrdev->mr.size) < cba) {
+                NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 1);
+                return;
+            }
+
+            n->pmr_cmse = true;
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
@@ -4187,8 +4265,11 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 
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
2.30.0


