Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7BF3127C4
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 23:07:40 +0100 (CET)
Received: from localhost ([::1]:42142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8sDT-0000pb-AT
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 17:07:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l8rwM-0000hM-2Z; Sun, 07 Feb 2021 16:50:00 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:46043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l8rwI-0004Si-Qk; Sun, 07 Feb 2021 16:49:57 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0C9ED5C009F;
 Sun,  7 Feb 2021 16:49:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 07 Feb 2021 16:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=iANOqhzw96sQp
 MtzfQxXb34YyEoJ96u8ZQC0IFiJRGI=; b=kz+kn+lNY/GxXd6B7YX7X7MpHQpYP
 NzdU6JfHhZ9GgZg8PCwEe1uqrr7QaGtVtZKNlRNF2VZwqLwh5IWW2H0xSyELhzpL
 BeRZM1/J/0hTRdbh0L7q4PIBp/Eijh/HTqS9+CHMdti5a01OhvEuOVULTU049HA0
 6uSKAuoxDltZr+BxBC47ypwJgTrviVTcf7vHi2t2EIugThl+7LPbgaPuTnJ5uVhz
 /5t+8gQRtLT9YD0zoitK7t2M9MwV51z8DzPb6uzUA9iBJJDSJhtE8SaBDAzPndZ1
 unUUOAH3OxDfMHVG/qJJt6HS8xZyxLu8taBXWE6Ls1c8zTJA0iccvfjYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=iANOqhzw96sQpMtzfQxXb34YyEoJ96u8ZQC0IFiJRGI=; b=hAmH2ieH
 EFrBcvA0B2KLyswV0IHUfNWvt62RHvy16gPvawopprFw3sTdjH+non0MDo3OGPgn
 CihxlYAbdedo+B4a1V/omFrYTlmQyW2AZaND77DyMMK8pljXt+H/+VLRblCeNlnS
 lv2JrHBrYfZkLnJX6BDi645waoJvUzRTDNMliEfFWJnJXm1fRreZZjSkoPCa1w25
 dZwViuoN1Fo5ycAnQwn/p8qTxTxNvsXO9le8kG+9dMIDOE8Bpg9+GRdLZth3BxIk
 nJ4DBNpB8vxYE01lZcifIB09pBqCVPEKHBYB6khmR4Y/vq7clRBPFZCmpnQjgvnF
 TlsCFOhiRQWB3g==
X-ME-Sender: <xms:gWAgYKeKvSr1RwhZBu-YJu9hgpt3Q1Ya8Oc3usWYiBtzoRkzbVjRMQ>
 <xme:gWAgYEMvMGn5NQjmvQy--OcHi8xJ35CH8ePXJpAui1uXZve0OCdu6MKrNGJ0Ksl-3
 q3wsZ7W0cv4QS9dkXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrhedugdduheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeefne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:gWAgYLipHrek6qFgn1V3OyIjMMpupacIIS15ikphlqzYqQqBwb-1RA>
 <xmx:gWAgYH__DM8apCBZqDaa-YgzpkgluiswtJUTilIwYuyYNV8579Agfg>
 <xmx:gWAgYGunbL0YI-CIX2LLwE6Wtd9TZz9ahqTTL3V0hvKIsfX037YQQA>
 <xmx:gmAgYD8QYJIrvbaYd4RwAUw0F5Ia9OdJ5tdT7fwgQ7SMVXLSBri26Q>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 860BA1080066;
 Sun,  7 Feb 2021 16:49:52 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 7/8] hw/block/nvme: add metadata support
Date: Sun,  7 Feb 2021 22:49:39 +0100
Message-Id: <20210207214940.281889-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210207214940.281889-1-its@irrelevant.dk>
References: <20210207214940.281889-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add support for metadata in the form of extended logical blocks as well
as a separate buffer of data. The new `ms` nvme-ns device parameter
specifies the size of metadata per logical block in bytes. The `mset`
nvme-ns device parameter controls whether metadata is transfered as part
of an extended lba (set to '1') or in a separate buffer (set to '0',
the default).

Regardsless of the scheme chosen with `mset`, metadata is stored at the
end of the namespace backing block device. This requires the user
provided PRP/SGLs to be walked and "split" into data and metadata
scatter/gather lists if the extended logical block scheme is used, but
has the advantage of not breaking the deallocated blocks support.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme-ns.h    |  39 ++-
 hw/block/nvme-ns.c    |  18 +-
 hw/block/nvme.c       | 652 ++++++++++++++++++++++++++++++++++++------
 hw/block/trace-events |   4 +-
 4 files changed, 618 insertions(+), 95 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 7af6884862b5..2281fd39930a 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -29,6 +29,9 @@ typedef struct NvmeNamespaceParams {
     uint32_t nsid;
     QemuUUID uuid;
 
+    uint16_t ms;
+    uint8_t  mset;
+
     uint16_t mssrl;
     uint32_t mcl;
     uint8_t  msrc;
@@ -47,6 +50,7 @@ typedef struct NvmeNamespace {
     BlockConf    blkconf;
     int32_t      bootindex;
     int64_t      size;
+    int64_t      mdata_offset;
     NvmeIdNs     id_ns;
     const uint32_t *iocs;
     uint8_t      csi;
@@ -99,18 +103,41 @@ static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
     return nvme_ns_lbaf(ns)->ds;
 }
 
-/* calculate the number of LBAs that the namespace can accomodate */
-static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
-{
-    return ns->size >> nvme_ns_lbads(ns);
-}
-
 /* convert an LBA to the equivalent in bytes */
 static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
 {
     return lba << nvme_ns_lbads(ns);
 }
 
+static inline size_t nvme_lsize(NvmeNamespace *ns)
+{
+    return 1 << nvme_ns_lbads(ns);
+}
+
+static inline uint16_t nvme_msize(NvmeNamespace *ns)
+{
+    return nvme_ns_lbaf(ns)->ms;
+}
+
+static inline size_t nvme_m2b(NvmeNamespace *ns, uint64_t lba)
+{
+    return nvme_msize(ns) * lba;
+}
+
+static inline bool nvme_ns_ext(NvmeNamespace *ns)
+{
+    return !!NVME_ID_NS_FLBAS_EXTENDED(ns->id_ns.flbas);
+}
+
+/* calculate the number of LBAs that the namespace can accomodate */
+static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
+{
+    if (ns->params.ms) {
+        return ns->size / (nvme_lsize(ns) + nvme_msize(ns));
+    }
+    return ns->size >> nvme_ns_lbads(ns);
+}
+
 typedef struct NvmeCtrl NvmeCtrl;
 
 static inline NvmeZoneState nvme_get_zone_state(NvmeZone *zone)
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index c3b513b0fc78..7a662c170428 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -37,13 +37,25 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     BlockDriverInfo bdi;
     NvmeIdNs *id_ns = &ns->id_ns;
     int lba_index = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
-    int npdg;
+    int npdg, nlbas;
 
     ns->id_ns.dlfeat = 0x9;
 
     id_ns->lbaf[lba_index].ds = 31 - clz32(ns->blkconf.logical_block_size);
+    id_ns->lbaf[lba_index].ms = ns->params.ms;
 
-    id_ns->nsze = cpu_to_le64(nvme_ns_nlbas(ns));
+    if (ns->params.ms) {
+        id_ns->mc = 0x3;
+
+        if (ns->params.mset) {
+            id_ns->flbas |= 0x10;
+        }
+    }
+
+    nlbas = nvme_ns_nlbas(ns);
+
+    id_ns->nsze = cpu_to_le64(nlbas);
+    ns->mdata_offset = nvme_l2b(ns, nlbas);
 
     ns->csi = NVME_CSI_NVM;
 
@@ -395,6 +407,8 @@ static Property nvme_ns_props[] = {
                      NvmeSubsystem *),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
+    DEFINE_PROP_UINT16("ms", NvmeNamespace, params.ms, 0),
+    DEFINE_PROP_UINT8("mset", NvmeNamespace, params.mset, 0),
     DEFINE_PROP_UINT16("mssrl", NvmeNamespace, params.mssrl, 128),
     DEFINE_PROP_UINT32("mcl", NvmeNamespace, params.mcl, 128),
     DEFINE_PROP_UINT8("msrc", NvmeNamespace, params.msrc, 127),
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 2752e5d8572a..8aa892ec3106 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -339,6 +339,26 @@ static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
     return pci_dma_read(&n->parent_obj, addr, buf, size);
 }
 
+static int nvme_addr_write(NvmeCtrl *n, hwaddr addr, void *buf, int size)
+{
+    hwaddr hi = addr + size - 1;
+    if (hi < addr) {
+        return 1;
+    }
+
+    if (n->bar.cmbsz && nvme_addr_is_cmb(n, addr) && nvme_addr_is_cmb(n, hi)) {
+        memcpy(nvme_addr_to_cmb(n, addr), buf, size);
+        return 0;
+    }
+
+    if (nvme_addr_is_pmr(n, addr) && nvme_addr_is_pmr(n, hi)) {
+        memcpy(nvme_addr_to_pmr(n, addr), buf, size);
+        return 0;
+    }
+
+    return pci_dma_write(&n->parent_obj, addr, buf, size);
+}
+
 static bool nvme_nsid_valid(NvmeCtrl *n, uint32_t nsid)
 {
     return nsid && (nsid == NVME_NSID_BROADCAST || nsid <= n->num_namespaces);
@@ -445,6 +465,64 @@ static inline void nvme_sg_unmap(NvmeSg *sg)
     }
 }
 
+/*
+ * When metadata is transfered as extended LBAs, the DPTR mapped into `sg`
+ * holds both data and metadata. This function splits the data and metadata
+ * into two separate QSG/IOVs.
+ */
+static void nvme_sg_split(NvmeSg *sg, NvmeNamespace *ns, NvmeSg *data,
+                          NvmeSg *mdata)
+{
+    NvmeSg *dst = data;
+    size_t size = nvme_lsize(ns);
+    size_t msize = nvme_msize(ns);
+    uint32_t trans_len, count = size;
+    uint64_t offset = 0;
+    bool dma = sg->qsg.nsg > 0;
+    size_t sge_len;
+    size_t sg_len = dma ? sg->qsg.size : sg->iov.size;
+    int sg_idx = 0;
+    hwaddr addr;
+
+    /* assert that exactly one of qsg and iov carries data */
+    assert((sg->qsg.nsg > 0) != (sg->iov.niov > 0));
+
+    while (sg_len) {
+        sge_len = dma ? sg->qsg.sg[sg_idx].len : sg->iov.iov[sg_idx].iov_len;
+
+        trans_len = MIN(sg_len, count);
+        trans_len = MIN(trans_len, sge_len - offset);
+
+        if (dma) {
+            addr = sg->qsg.sg[sg_idx].base + offset;
+        } else {
+            addr = (hwaddr)sg->iov.iov[sg_idx].iov_base + offset;
+        }
+
+        if (dst) {
+            if (dma) {
+                qemu_sglist_add(&dst->qsg, addr, trans_len);
+            } else {
+                qemu_iovec_add(&dst->iov, (void *)addr, trans_len);
+            }
+        }
+
+        sg_len -= trans_len;
+        count -= trans_len;
+        offset += trans_len;
+
+        if (count == 0) {
+            dst = (dst == data) ? mdata : data;
+            count = (dst == data) ? size : msize;
+        }
+
+        if (sge_len == offset) {
+            offset = 0;
+            sg_idx++;
+        }
+    }
+}
+
 static uint16_t nvme_map_addr_cmb(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
                                   size_t len)
 {
@@ -843,11 +921,157 @@ static uint16_t nvme_map_dptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
     }
 }
 
+static uint16_t nvme_map_mptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
+                              NvmeCmd *cmd)
+{
+    int psdt = NVME_CMD_FLAGS_PSDT(cmd->flags);
+    hwaddr mptr = le64_to_cpu(cmd->mptr);
+    uint16_t status;
+
+    if (psdt == NVME_PSDT_SGL_MPTR_SGL) {
+        NvmeSglDescriptor sgl;
+
+        if (nvme_addr_read(n, mptr, &sgl, sizeof(sgl))) {
+            return NVME_DATA_TRAS_ERROR;
+        }
+
+        status = nvme_map_sgl(n, sg, sgl, len, cmd);
+        if (status && (status & 0x7ff) == NVME_DATA_SGL_LEN_INVALID) {
+            status = NVME_MD_SGL_LEN_INVALID | NVME_DNR;
+        }
+
+        return status;
+    }
+
+    nvme_sg_init(n, sg);
+    status = nvme_map_addr(n, sg, mptr, len);
+    if (status) {
+        nvme_sg_unmap(sg);
+    }
+
+    return status;
+}
+
+static uint16_t nvme_map_data(NvmeCtrl *n, uint32_t nlb, NvmeRequest *req)
+{
+    NvmeNamespace *ns = req->ns;
+    size_t len = nvme_l2b(ns, nlb);
+    uint16_t status;
+
+    if (nvme_ns_ext(ns)) {
+        NvmeSg sg;
+
+        len += nvme_m2b(ns, nlb);
+
+        status = nvme_map_dptr(n, &sg, len, &req->cmd);
+        if (status) {
+            return status;
+        }
+
+        nvme_sg_init(n, &req->sg);
+        nvme_sg_split(&sg, ns, &req->sg, NULL);
+        nvme_sg_unmap(&sg);
+
+        return NVME_SUCCESS;
+    }
+
+    return nvme_map_dptr(n, &req->sg, len, &req->cmd);
+}
+
+static uint16_t nvme_map_mdata(NvmeCtrl *n, uint32_t nlb, NvmeRequest *req)
+{
+    NvmeNamespace *ns = req->ns;
+    size_t len = nvme_m2b(ns, nlb);
+    uint16_t status;
+
+    if (nvme_ns_ext(ns)) {
+        NvmeSg sg;
+
+        len += nvme_l2b(ns, nlb);
+
+        status = nvme_map_dptr(n, &sg, len, &req->cmd);
+        if (status) {
+            return status;
+        }
+
+        nvme_sg_init(n, &req->sg);
+        nvme_sg_split(&sg, ns, NULL, &req->sg);
+        nvme_sg_unmap(&sg);
+
+        return NVME_SUCCESS;
+    }
+
+    return nvme_map_mptr(n, &req->sg, len, &req->cmd);
+}
+
 typedef enum NvmeTxDirection {
     NVME_TX_DIRECTION_TO_DEVICE   = 0,
     NVME_TX_DIRECTION_FROM_DEVICE = 1,
 } NvmeTxDirection;
 
+static uint16_t nvme_tx_interleaved(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr,
+                                    uint32_t len, uint32_t bytes,
+                                    int32_t skip_bytes, int64_t offset,
+                                    NvmeTxDirection dir)
+{
+    hwaddr addr;
+    uint32_t trans_len, count = bytes;
+    bool dma = sg->qsg.nsg > 0;
+    int64_t sge_len;
+    int sg_idx = 0;
+    int ret;
+
+    /* assert that exactly one of qsg and iov carries data */
+    assert((sg->qsg.nsg > 0) != (sg->iov.niov > 0));
+
+    while (len) {
+        sge_len = dma ? sg->qsg.sg[sg_idx].len : sg->iov.iov[sg_idx].iov_len;
+
+        if (sge_len - offset < 0) {
+            offset -= sge_len;
+            sg_idx++;
+            continue;
+        }
+
+        if (sge_len == offset) {
+            offset = 0;
+            sg_idx++;
+            continue;
+        }
+
+        trans_len = MIN(len, count);
+        trans_len = MIN(trans_len, sge_len - offset);
+
+        if (dma) {
+            addr = sg->qsg.sg[sg_idx].base + offset;
+        } else {
+            addr = (hwaddr)sg->iov.iov[sg_idx].iov_base + offset;
+        }
+
+        if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
+            ret = nvme_addr_read(n, addr, ptr, trans_len);
+        } else {
+            ret = nvme_addr_write(n, addr, ptr, trans_len);
+        }
+
+        if (ret) {
+            return NVME_DATA_TRAS_ERROR;
+        }
+
+        ptr += trans_len;
+        len -= trans_len;
+        count -= trans_len;
+        offset += trans_len;
+
+        if (count == 0) {
+            count = bytes;
+            offset += skip_bytes;
+        }
+    }
+
+    return NVME_SUCCESS;
+}
+
 static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
                         NvmeTxDirection dir)
 {
@@ -911,6 +1135,46 @@ static inline uint16_t nvme_h2c(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
     return nvme_tx(n, &req->sg, ptr, len, NVME_TX_DIRECTION_TO_DEVICE);
 }
 
+static uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+                                 NvmeTxDirection dir, NvmeRequest *req)
+{
+    NvmeNamespace *ns = req->ns;
+
+    if (nvme_ns_ext(ns)) {
+        size_t lsize = nvme_lsize(ns);
+        size_t msize = nvme_msize(ns);
+
+        return nvme_tx_interleaved(n, &req->sg, ptr, len, lsize, msize, 0,
+                                   dir);
+    }
+
+    return nvme_tx(n, &req->sg, ptr, len, dir);
+}
+
+static uint16_t nvme_bounce_mdata(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+                                  NvmeTxDirection dir, NvmeRequest *req)
+{
+    NvmeNamespace *ns = req->ns;
+    uint16_t status;
+
+    if (nvme_ns_ext(ns)) {
+        size_t lsize = nvme_lsize(ns);
+        size_t msize = nvme_msize(ns);
+
+        return nvme_tx_interleaved(n, &req->sg, ptr, len, msize, lsize, lsize,
+                                   dir);
+    }
+
+    nvme_sg_unmap(&req->sg);
+
+    status = nvme_map_mptr(n, &req->sg, len, &req->cmd);
+    if (status) {
+        return status;
+    }
+
+    return nvme_tx(n, &req->sg, ptr, len, dir);
+}
+
 static inline void nvme_blk_read(BlockBackend *blk, int64_t offset,
                                  BlockCompletionFunc *cb, NvmeRequest *req)
 {
@@ -1460,29 +1724,78 @@ static inline bool nvme_is_write(NvmeRequest *req)
            rw->opcode == NVME_CMD_WRITE_ZEROES;
 }
 
+static void nvme_rw_complete_cb(void *opaque, int ret)
+{
+    NvmeRequest *req = opaque;
+    NvmeNamespace *ns = req->ns;
+    BlockBackend *blk = ns->blkconf.blk;
+    BlockAcctCookie *acct = &req->acct;
+    BlockAcctStats *stats = blk_get_stats(blk);
+
+    trace_pci_nvme_rw_complete_cb(nvme_cid(req), blk_name(blk));
+
+    if (ret) {
+        block_acct_failed(stats, acct);
+        nvme_aio_err(req, ret);
+    } else {
+        block_acct_done(stats, acct);
+    }
+
+    if (ns->params.zoned && nvme_is_write(req)) {
+        nvme_finalize_zoned_write(ns, req);
+    }
+
+    nvme_enqueue_req_completion(nvme_cq(req), req);
+}
+
 static void nvme_rw_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
     NvmeNamespace *ns = req->ns;
 
     BlockBackend *blk = ns->blkconf.blk;
-    BlockAcctCookie *acct = &req->acct;
-    BlockAcctStats *stats = blk_get_stats(blk);
 
     trace_pci_nvme_rw_cb(nvme_cid(req), blk_name(blk));
 
-    if (ns->params.zoned && nvme_is_write(req)) {
-        nvme_finalize_zoned_write(ns, req);
+    if (ret) {
+        goto out;
     }
 
-    if (!ret) {
-        block_acct_done(stats, acct);
-    } else {
-        block_acct_failed(stats, acct);
-        nvme_aio_err(req, ret);
+    if (nvme_msize(ns)) {
+        NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+        uint64_t slba = le64_to_cpu(rw->slba);
+        uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
+        uint64_t offset = ns->mdata_offset + nvme_m2b(ns, slba);
+
+        if (req->cmd.opcode == NVME_CMD_WRITE_ZEROES) {
+            size_t mlen = nvme_m2b(ns, nlb);
+
+            req->aiocb = blk_aio_pwrite_zeroes(blk, offset, mlen,
+                                               BDRV_REQ_MAY_UNMAP,
+                                               nvme_rw_complete_cb, req);
+            return;
+        }
+
+        if (nvme_ns_ext(ns) || req->cmd.mptr) {
+            uint16_t status;
+
+            nvme_sg_unmap(&req->sg);
+            status = nvme_map_mdata(nvme_ctrl(req), nlb, req);
+            if (status) {
+                ret = -EFAULT;
+                goto out;
+            }
+
+            if (req->cmd.opcode == NVME_CMD_READ) {
+                return nvme_blk_read(blk, offset, nvme_rw_complete_cb, req);
+            }
+
+            return nvme_blk_write(blk, offset, nvme_rw_complete_cb, req);
+        }
     }
 
-    nvme_enqueue_req_completion(nvme_cq(req), req);
+out:
+    nvme_rw_complete_cb(req, ret);
 }
 
 static void nvme_aio_discard_cb(void *opaque, int ret)
@@ -1510,7 +1823,7 @@ struct nvme_zone_reset_ctx {
     NvmeZone    *zone;
 };
 
-static void nvme_aio_zone_reset_cb(void *opaque, int ret)
+static void nvme_aio_zone_reset_complete_cb(void *opaque, int ret)
 {
     struct nvme_zone_reset_ctx *ctx = opaque;
     NvmeRequest *req = ctx->req;
@@ -1518,31 +1831,31 @@ static void nvme_aio_zone_reset_cb(void *opaque, int ret)
     NvmeZone *zone = ctx->zone;
     uintptr_t *resets = (uintptr_t *)&req->opaque;
 
-    g_free(ctx);
-
-    trace_pci_nvme_aio_zone_reset_cb(nvme_cid(req), zone->d.zslba);
-
-    if (!ret) {
-        switch (nvme_get_zone_state(zone)) {
-        case NVME_ZONE_STATE_EXPLICITLY_OPEN:
-        case NVME_ZONE_STATE_IMPLICITLY_OPEN:
-            nvme_aor_dec_open(ns);
-            /* fall through */
-        case NVME_ZONE_STATE_CLOSED:
-            nvme_aor_dec_active(ns);
-            /* fall through */
-        case NVME_ZONE_STATE_FULL:
-            zone->w_ptr = zone->d.zslba;
-            zone->d.wp = zone->w_ptr;
-            nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_EMPTY);
-            /* fall through */
-        default:
-            break;
-        }
-    } else {
+    if (ret) {
         nvme_aio_err(req, ret);
+        goto out;
     }
 
+    switch (nvme_get_zone_state(zone)) {
+    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
+    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
+        nvme_aor_dec_open(ns);
+        /* fall through */
+    case NVME_ZONE_STATE_CLOSED:
+        nvme_aor_dec_active(ns);
+        /* fall through */
+    case NVME_ZONE_STATE_FULL:
+        zone->w_ptr = zone->d.zslba;
+        zone->d.wp = zone->w_ptr;
+        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_EMPTY);
+        /* fall through */
+    default:
+        break;
+    }
+
+out:
+    g_free(ctx);
+
     (*resets)--;
 
     if (*resets) {
@@ -1552,9 +1865,36 @@ static void nvme_aio_zone_reset_cb(void *opaque, int ret)
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
+static void nvme_aio_zone_reset_cb(void *opaque, int ret)
+{
+    struct nvme_zone_reset_ctx *ctx = opaque;
+    NvmeRequest *req = ctx->req;
+    NvmeNamespace *ns = req->ns;
+    NvmeZone *zone = ctx->zone;
+
+    trace_pci_nvme_aio_zone_reset_cb(nvme_cid(req), zone->d.zslba);
+
+    if (ret) {
+        goto out;
+    }
+
+    if (nvme_msize(ns)) {
+        int64_t offset = ns->mdata_offset + nvme_m2b(ns, zone->d.zslba);
+
+        blk_aio_pwrite_zeroes(ns->blkconf.blk, offset,
+                              nvme_m2b(ns, ns->zone_size), BDRV_REQ_MAY_UNMAP,
+                              nvme_aio_zone_reset_complete_cb, ctx);
+        return;
+    }
+
+out:
+    nvme_aio_zone_reset_complete_cb(opaque, ret);
+}
+
 struct nvme_copy_ctx {
     int copies;
     uint8_t *bounce;
+    uint8_t *mbounce;
     uint32_t nlb;
 };
 
@@ -1563,6 +1903,36 @@ struct nvme_copy_in_ctx {
     QEMUIOVector iov;
 };
 
+static void nvme_copy_complete_cb(void *opaque, int ret)
+{
+    NvmeRequest *req = opaque;
+    NvmeNamespace *ns = req->ns;
+    struct nvme_copy_ctx *ctx = req->opaque;
+
+    if (ret) {
+        block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
+        nvme_aio_err(req, ret);
+        goto out;
+    }
+
+    block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
+
+out:
+    if (ns->params.zoned) {
+        NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
+        uint64_t sdlba = le64_to_cpu(copy->sdlba);
+        NvmeZone *zone = nvme_get_zone_by_slba(ns, sdlba);
+
+        __nvme_advance_zone_wp(ns, zone, ctx->nlb);
+    }
+
+    g_free(ctx->bounce);
+    g_free(ctx->mbounce);
+    g_free(ctx);
+
+    nvme_enqueue_req_completion(nvme_cq(req), req);
+}
+
 static void nvme_copy_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
@@ -1571,25 +1941,25 @@ static void nvme_copy_cb(void *opaque, int ret)
 
     trace_pci_nvme_copy_cb(nvme_cid(req));
 
-    if (ns->params.zoned) {
+    if (ret) {
+        goto out;
+    }
+
+    if (nvme_msize(ns)) {
         NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
         uint64_t sdlba = le64_to_cpu(copy->sdlba);
-        NvmeZone *zone = nvme_get_zone_by_slba(ns, sdlba);
+        int64_t offset = ns->mdata_offset + nvme_m2b(ns, sdlba);
 
-        __nvme_advance_zone_wp(ns, zone, ctx->nlb);
+        qemu_iovec_reset(&req->sg.iov);
+        qemu_iovec_add(&req->sg.iov, ctx->mbounce, nvme_m2b(ns, ctx->nlb));
+
+        req->aiocb = blk_aio_pwritev(ns->blkconf.blk, offset, &req->sg.iov, 0,
+                                     nvme_copy_complete_cb, req);
+        return;
     }
 
-    if (!ret) {
-        block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
-    } else {
-        block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
-        nvme_aio_err(req, ret);
-    }
-
-    g_free(ctx->bounce);
-    g_free(ctx);
-
-    nvme_enqueue_req_completion(nvme_cq(req), req);
+out:
+    nvme_copy_complete_cb(opaque, ret);
 }
 
 static void nvme_copy_in_complete(NvmeRequest *req)
@@ -1672,6 +2042,7 @@ static void nvme_aio_copy_in_cb(void *opaque, int ret)
         block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
 
         g_free(ctx->bounce);
+        g_free(ctx->mbounce);
         g_free(ctx);
 
         nvme_enqueue_req_completion(nvme_cq(req), req);
@@ -1683,43 +2054,110 @@ static void nvme_aio_copy_in_cb(void *opaque, int ret)
 }
 
 struct nvme_compare_ctx {
-    QEMUIOVector iov;
-    uint8_t *bounce;
+    struct {
+        QEMUIOVector iov;
+        uint8_t *bounce;
+    } data;
+
+    struct {
+        QEMUIOVector iov;
+        uint8_t *bounce;
+    } mdata;
 };
 
-static void nvme_compare_cb(void *opaque, int ret)
+static void nvme_compare_mdata_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
-    NvmeNamespace *ns = req->ns;
+    NvmeCtrl *n = nvme_ctrl(req);
     struct nvme_compare_ctx *ctx = req->opaque;
     g_autofree uint8_t *buf = NULL;
-    uint16_t status;
+    uint16_t status = NVME_SUCCESS;
 
-    trace_pci_nvme_compare_cb(nvme_cid(req));
+    trace_pci_nvme_compare_mdata_cb(nvme_cid(req));
 
-    if (!ret) {
-        block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
-    } else {
-        block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
-        nvme_aio_err(req, ret);
-        goto out;
-    }
+    buf = g_malloc(ctx->mdata.iov.size);
 
-    buf = g_malloc(ctx->iov.size);
-
-    status = nvme_h2c(nvme_ctrl(req), buf, ctx->iov.size, req);
+    status = nvme_bounce_mdata(n, buf, ctx->mdata.iov.size,
+                               NVME_TX_DIRECTION_TO_DEVICE, req);
     if (status) {
         req->status = status;
         goto out;
     }
 
-    if (memcmp(buf, ctx->bounce, ctx->iov.size)) {
+    if (memcmp(buf, ctx->mdata.bounce, ctx->mdata.iov.size)) {
         req->status = NVME_CMP_FAILURE;
+        goto out;
     }
 
 out:
-    qemu_iovec_destroy(&ctx->iov);
-    g_free(ctx->bounce);
+    qemu_iovec_destroy(&ctx->data.iov);
+    g_free(ctx->data.bounce);
+
+    qemu_iovec_destroy(&ctx->mdata.iov);
+    g_free(ctx->mdata.bounce);
+
+    g_free(ctx);
+
+    nvme_enqueue_req_completion(nvme_cq(req), req);
+}
+
+static void nvme_compare_data_cb(void *opaque, int ret)
+{
+    NvmeRequest *req = opaque;
+    NvmeCtrl *n = nvme_ctrl(req);
+    NvmeNamespace *ns = req->ns;
+    BlockBackend *blk = ns->blkconf.blk;
+    BlockAcctCookie *acct = &req->acct;
+    BlockAcctStats *stats = blk_get_stats(blk);
+
+    struct nvme_compare_ctx *ctx = req->opaque;
+    g_autofree uint8_t *buf = NULL;
+    uint16_t status;
+
+    trace_pci_nvme_compare_data_cb(nvme_cid(req));
+
+    if (ret) {
+        block_acct_failed(stats, acct);
+        nvme_aio_err(req, ret);
+        goto out;
+    }
+
+    buf = g_malloc(ctx->data.iov.size);
+
+    status = nvme_bounce_data(n, buf, ctx->data.iov.size,
+                              NVME_TX_DIRECTION_TO_DEVICE, req);
+    if (status) {
+        req->status = status;
+        goto out;
+    }
+
+    if (memcmp(buf, ctx->data.bounce, ctx->data.iov.size)) {
+        req->status = NVME_CMP_FAILURE;
+        goto out;
+    }
+
+    if (nvme_msize(ns)) {
+        NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+        uint64_t slba = le64_to_cpu(rw->slba);
+        uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
+        size_t mlen = nvme_m2b(ns, nlb);
+        uint64_t offset = ns->mdata_offset + nvme_m2b(ns, slba);
+
+        ctx->mdata.bounce = g_malloc(mlen);
+
+        qemu_iovec_init(&ctx->mdata.iov, 1);
+        qemu_iovec_add(&ctx->mdata.iov, ctx->mdata.bounce, mlen);
+
+        req->aiocb = blk_aio_preadv(blk, offset, &ctx->mdata.iov, 0,
+                                    nvme_compare_mdata_cb, req);
+        return;
+    }
+
+    block_acct_done(stats, acct);
+
+out:
+    qemu_iovec_destroy(&ctx->data.iov);
+    g_free(ctx->data.bounce);
     g_free(ctx);
 
     nvme_enqueue_req_completion(nvme_cq(req), req);
@@ -1808,6 +2246,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     uint32_t nlb = 0;
 
     uint8_t *bounce = NULL, *bouncep = NULL;
+    uint8_t *mbounce = NULL, *mbouncep = NULL;
     struct nvme_copy_ctx *ctx;
     uint16_t status;
     int i;
@@ -1867,6 +2306,9 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     }
 
     bounce = bouncep = g_malloc(nvme_l2b(ns, nlb));
+    if (nvme_msize(ns)) {
+        mbounce = mbouncep = g_malloc(nvme_m2b(ns, nlb));
+    }
 
     block_acct_start(blk_get_stats(ns->blkconf.blk), &req->acct, 0,
                      BLOCK_ACCT_READ);
@@ -1874,6 +2316,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     ctx = g_new(struct nvme_copy_ctx, 1);
 
     ctx->bounce = bounce;
+    ctx->mbounce = mbounce;
     ctx->nlb = nlb;
     ctx->copies = 1;
 
@@ -1900,6 +2343,24 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
                        nvme_aio_copy_in_cb, in_ctx);
 
         bouncep += len;
+
+        if (nvme_msize(ns)) {
+            len = nvme_m2b(ns, nlb);
+            offset = ns->mdata_offset + nvme_m2b(ns, slba);
+
+            in_ctx = g_new(struct nvme_copy_in_ctx, 1);
+            in_ctx->req = req;
+
+            qemu_iovec_init(&in_ctx->iov, 1);
+            qemu_iovec_add(&in_ctx->iov, mbouncep, len);
+
+            ctx->copies++;
+
+            blk_aio_preadv(ns->blkconf.blk, offset, &in_ctx->iov, 0,
+                           nvme_aio_copy_in_cb, in_ctx);
+
+            mbouncep += len;
+        }
     }
 
     /* account for the 1-initialization */
@@ -1919,14 +2380,18 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
     BlockBackend *blk = ns->blkconf.blk;
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
-    size_t len = nvme_l2b(ns, nlb);
+    size_t data_len = nvme_l2b(ns, nlb);
+    size_t len = data_len;
     int64_t offset = nvme_l2b(ns, slba);
-    uint8_t *bounce = NULL;
     struct nvme_compare_ctx *ctx = NULL;
     uint16_t status;
 
     trace_pci_nvme_compare(nvme_cid(req), nvme_nsid(ns), slba, nlb);
 
+    if (nvme_ns_ext(ns)) {
+        len += nvme_m2b(ns, nlb);
+    }
+
     status = nvme_check_mdts(n, len);
     if (status) {
         trace_pci_nvme_err_mdts(nvme_cid(req), len);
@@ -1946,18 +2411,22 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    bounce = g_malloc(len);
+    status = nvme_map_dptr(n, &req->sg, len, &req->cmd);
+    if (status) {
+        return status;
+    }
 
     ctx = g_new(struct nvme_compare_ctx, 1);
-    ctx->bounce = bounce;
+    ctx->data.bounce = g_malloc(data_len);
 
     req->opaque = ctx;
 
-    qemu_iovec_init(&ctx->iov, 1);
-    qemu_iovec_add(&ctx->iov, bounce, len);
+    qemu_iovec_init(&ctx->data.iov, 1);
+    qemu_iovec_add(&ctx->data.iov, ctx->data.bounce, data_len);
 
-    block_acct_start(blk_get_stats(blk), &req->acct, len, BLOCK_ACCT_READ);
-    blk_aio_preadv(blk, offset, &ctx->iov, 0, nvme_compare_cb, req);
+    block_acct_start(blk_get_stats(blk), &req->acct, data_len,
+                     BLOCK_ACCT_READ);
+    blk_aio_preadv(blk, offset, &ctx->data.iov, 0, nvme_compare_data_cb, req);
 
     return NVME_NO_COMPLETE;
 }
@@ -1977,15 +2446,20 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
     uint64_t data_size = nvme_l2b(ns, nlb);
+    uint64_t mapped_size = data_size;
     uint64_t data_offset;
     BlockBackend *blk = ns->blkconf.blk;
     uint16_t status;
 
-    trace_pci_nvme_read(nvme_cid(req), nvme_nsid(ns), nlb, data_size, slba);
+    if (nvme_ns_ext(ns)) {
+        mapped_size += nvme_m2b(ns, nlb);
+    }
 
-    status = nvme_check_mdts(n, data_size);
+    trace_pci_nvme_read(nvme_cid(req), nvme_nsid(ns), nlb, mapped_size, slba);
+
+    status = nvme_check_mdts(n, mapped_size);
     if (status) {
-        trace_pci_nvme_err_mdts(nvme_cid(req), data_size);
+        trace_pci_nvme_err_mdts(nvme_cid(req), mapped_size);
         goto invalid;
     }
 
@@ -2003,11 +2477,6 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
-    status = nvme_map_dptr(n, &req->sg, data_size, &req->cmd);
-    if (status) {
-        goto invalid;
-    }
-
     if (NVME_ERR_REC_DULBE(ns->features.err_rec)) {
         status = nvme_check_dulbe(ns, slba, nlb);
         if (status) {
@@ -2015,6 +2484,11 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
+    status = nvme_map_data(n, nlb, req);
+    if (status) {
+        goto invalid;
+    }
+
     data_offset = nvme_l2b(ns, slba);
 
     block_acct_start(blk_get_stats(blk), &req->acct, data_size,
@@ -2035,19 +2509,24 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
     uint64_t data_size = nvme_l2b(ns, nlb);
+    uint64_t mapped_size = data_size;
     uint64_t data_offset;
     NvmeZone *zone;
     NvmeZonedResult *res = (NvmeZonedResult *)&req->cqe;
     BlockBackend *blk = ns->blkconf.blk;
     uint16_t status;
 
+    if (nvme_ns_ext(ns)) {
+        mapped_size += nvme_m2b(ns, nlb);
+    }
+
     trace_pci_nvme_write(nvme_cid(req), nvme_io_opc_str(rw->opcode),
-                         nvme_nsid(ns), nlb, data_size, slba);
+                         nvme_nsid(ns), nlb, mapped_size, slba);
 
     if (!wrz) {
-        status = nvme_check_mdts(n, data_size);
+        status = nvme_check_mdts(n, mapped_size);
         if (status) {
-            trace_pci_nvme_err_mdts(nvme_cid(req), data_size);
+            trace_pci_nvme_err_mdts(nvme_cid(req), mapped_size);
             goto invalid;
         }
     }
@@ -2094,7 +2573,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
     data_offset = nvme_l2b(ns, slba);
 
     if (!wrz) {
-        status = nvme_map_dptr(n, &req->sg, data_size, &req->cmd);
+        status = nvme_map_data(n, nlb, req);
         if (status) {
             goto invalid;
         }
@@ -2107,6 +2586,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
                                            BDRV_REQ_MAY_UNMAP, nvme_rw_cb,
                                            req);
     }
+
     return NVME_NO_COMPLETE;
 
 invalid:
diff --git a/hw/block/trace-events b/hw/block/trace-events
index fe4a6c24306d..1c76c9583fd5 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -47,11 +47,13 @@ pci_nvme_copy(uint16_t cid, uint32_t nsid, uint16_t nr, uint8_t format) "cid %"P
 pci_nvme_copy_source_range(uint64_t slba, uint32_t nlb) "slba 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_copy_in_complete(uint16_t cid) "cid %"PRIu16""
 pci_nvme_copy_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_rw_complete_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%x zeroed %d"
 pci_nvme_dsm(uint16_t cid, uint32_t nsid, uint32_t nr, uint32_t attr) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu32" attr 0x%"PRIx32""
 pci_nvme_dsm_deallocate(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
 pci_nvme_compare(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba 0x%"PRIx64" nlb %"PRIu32""
-pci_nvme_compare_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_compare_data_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_compare_mdata_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_discard_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_copy_in_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_zone_reset_cb(uint16_t cid, uint64_t zslba) "cid %"PRIu16" zslba 0x%"PRIx64""
-- 
2.30.0


