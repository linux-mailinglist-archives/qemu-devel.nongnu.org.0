Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF7C2986BE
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 07:11:40 +0100 (CET)
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWvjH-0007JO-9N
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 02:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kWvZD-0002yq-0x; Mon, 26 Oct 2020 02:01:15 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:44051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kWvZ8-0000Fr-Qr; Mon, 26 Oct 2020 02:01:14 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6087FD6A;
 Mon, 26 Oct 2020 02:01:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 26 Oct 2020 02:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=VHIsv0NFJGtN1
 9poYc8W/sbEfEfYcBxGt4XYiODq9W0=; b=YfWDO9vUj0wehG/k+Q3wHPibk+RRs
 oP+EOWJ2COrnvqa4T3pRtbHDNFCTOZkTfV6SXvKN4Fklq38gMuz65VDWM5LM+ET+
 6ts3oO6ZWOy3ToqiYO5dA22FpjmztYHvL1Nz9OmU8mOYmMHw63SlmnzhmDmWExu6
 qLxPB1HUht+UAlq54K0ErGDq3CqpUpbmiskzrHWyvNviWRBrKw8a70+w4JB3mRTx
 TWo+ezD+/rwKR8aZql16jeJ5iMKvJvsyMa7QuWxTZhotdopAVU0CTSFkSfgCNsB6
 6N+JuWVCVHPUmeaZRdOef4826+04eVUUbMQliO/pHnX8fy0jQajaA12Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=VHIsv0NFJGtN19poYc8W/sbEfEfYcBxGt4XYiODq9W0=; b=g9WkKSGl
 1Jv6ITovcWQ7BavGqC4URZ4DsrjN4CQFzyHq2GryavT0e9Jqq4Iq0tOvqXwsiWFW
 EMbErD4Eqq6CcXRI/Tv8DQXdYXUFtyqv5ths5yL4+gKzBB5h7W3t4ALwF9vkYSZp
 fEpwlLzvQ8Q6H1Z7qyKrrPGHHXj2rIEiqFCLYwLnXAhe0cCAhbf03nBELFJI60dZ
 tty2QGUHZVz/O3K6SHuEcR32QCf8KkdBWD6UPmV1Hp9rSTL98bJCDMtxtgzU16q1
 W5GwTMpDQmyPHCGDrxaydJn3W5kC2IRKWXKLRPLzcr/tXTHTXuhZq06U2QHq86JH
 LRH0T8BejcMLCw==
X-ME-Sender: <xms:ImaWX-0BA5XM7QICLJ9ex1mN1U3WHg-IPXhj30k7AbeMAhuV6bizIw>
 <xme:ImaWXxHcdLq-qDvsmTdUvx4i7zYvUoFdhFNi6x3MEWSDvhG_FVNG94cbP1ryA8_rU
 M57lRdypeoMVh8zWq8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeehgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ImaWX25RhfYSSlpB_llcpOqOXyT7_ZBTsNcdRQifpVoUE1_qfIvZGg>
 <xmx:ImaWX_3rN3jlzr_naNTibn9ds9RRvJu1Sec6QuBJ5OWAAaOR9DIpHg>
 <xmx:ImaWXxGNVJ2gGzGxj9WXg8d6EorIQlv-Gts8A4DW5L-7YLGROXJ5-w>
 <xmx:ImaWX1hlwDkU6LNa4yc0GDL3mlCYFt7s8r8yFzNKZyUgpJh5BDaG1w>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2394B328005E;
 Mon, 26 Oct 2020 02:01:04 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/3] hw/block/nvme: add dulbe support
Date: Mon, 26 Oct 2020 07:00:59 +0100
Message-Id: <20201026060101.371900-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026060101.371900-1-its@irrelevant.dk>
References: <20201026060101.371900-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 02:01:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add support for reporting the Deallocated or Unwritten Logical Block
Error (DULBE).

Rely on the block status flags reported by the block layer and consider
any block with the BDRV_BLOCK_ZERO flag to be deallocated.

Multiple factors affect when a Write Zeroes command result in
deallocation of blocks.

  * the underlying file system block size
  * the blockdev format
  * the 'discard' and 'logical_block_size' parameters

     format | discard | wz (512B)  wz (4KiB)  wz (64KiB)
    -----------------------------------------------------
      qcow2    ignore   n          n          y
      qcow2    unmap    n          n          y
      raw      ignore   n          y          y
      raw      unmap    n          y          y

So, this works best with an image in raw format and 4KiB LBAs, since
holes can then be punched on a per-block basis (this assumes a file
system with a 4kb block size, YMMV). A qcow2 image, uses a cluster size
of 64KiB by default and blocks will only be marked deallocated if a full
cluster is zeroed or discarded. However, this *is* consistent with the
spec since Write Zeroes "should" deallocate the block if the Deallocate
attribute is set and "may" deallocate if the Deallocate attribute is not
set. Thus, we always try to deallocate (the BDRV_REQ_MAY_UNMAP flag is
always set).

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme-ns.h    |  4 +++
 include/block/nvme.h  |  5 +++
 hw/block/nvme-ns.c    |  8 +++--
 hw/block/nvme.c       | 83 +++++++++++++++++++++++++++++++++++++++++--
 hw/block/trace-events |  4 +++
 5 files changed, 99 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 83734f4606e1..44bf6271b744 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -31,6 +31,10 @@ typedef struct NvmeNamespace {
     NvmeIdNs     id_ns;
 
     NvmeNamespaceParams params;
+
+    struct {
+        uint32_t err_rec;
+    } features;
 } NvmeNamespace;
 
 static inline uint32_t nvme_nsid(NvmeNamespace *ns)
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 8a46d9cf015f..966c3bb304bd 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -687,6 +687,7 @@ enum NvmeStatusCodes {
     NVME_E2E_REF_ERROR          = 0x0284,
     NVME_CMP_FAILURE            = 0x0285,
     NVME_ACCESS_DENIED          = 0x0286,
+    NVME_DULB                   = 0x0287,
     NVME_MORE                   = 0x2000,
     NVME_DNR                    = 0x4000,
     NVME_NO_COMPLETE            = 0xffff,
@@ -903,6 +904,9 @@ enum NvmeIdCtrlLpa {
 #define NVME_AEC_NS_ATTR(aec)       ((aec >> 8) & 0x1)
 #define NVME_AEC_FW_ACTIVATION(aec) ((aec >> 9) & 0x1)
 
+#define NVME_ERR_REC_TLER(err_rec)  (err_rec & 0xffff)
+#define NVME_ERR_REC_DULBE(err_rec) (err_rec & 0x10000)
+
 enum NvmeFeatureIds {
     NVME_ARBITRATION                = 0x1,
     NVME_POWER_MANAGEMENT           = 0x2,
@@ -1023,6 +1027,7 @@ enum NvmeNsIdentifierType {
 
 
 #define NVME_ID_NS_NSFEAT_THIN(nsfeat)      ((nsfeat & 0x1))
+#define NVME_ID_NS_NSFEAT_DULBE(nsfeat)     ((nsfeat >> 2) & 0x1)
 #define NVME_ID_NS_FLBAS_EXTENDED(flbas)    ((flbas >> 4) & 0x1)
 #define NVME_ID_NS_FLBAS_INDEX(flbas)       ((flbas & 0xf))
 #define NVME_ID_NS_MC_SEPARATE(mc)          ((mc >> 1) & 0x1)
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 31c80cdf5b5f..f1cc734c60f5 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -33,9 +33,7 @@ static void nvme_ns_init(NvmeNamespace *ns)
     NvmeIdNs *id_ns = &ns->id_ns;
     int lba_index = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
 
-    if (blk_get_flags(ns->blkconf.blk) & BDRV_O_UNMAP) {
-        ns->id_ns.dlfeat = 0x9;
-    }
+    ns->id_ns.dlfeat = 0x9;
 
     id_ns->lbaf[lba_index].ds = 31 - clz32(ns->blkconf.logical_block_size);
 
@@ -44,6 +42,9 @@ static void nvme_ns_init(NvmeNamespace *ns)
     /* no thin provisioning */
     id_ns->ncap = id_ns->nsze;
     id_ns->nuse = id_ns->ncap;
+
+    /* support DULBE */
+    id_ns->nsfeat |= 0x4;
 }
 
 static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
@@ -92,6 +93,7 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
     }
 
     nvme_ns_init(ns);
+
     if (nvme_register_namespace(n, ns, errp)) {
         return -1;
     }
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index fa2cba744b57..4ab0705f5a92 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -105,6 +105,7 @@ static const bool nvme_feature_support[NVME_FID_MAX] = {
 
 static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
     [NVME_TEMPERATURE_THRESHOLD]    = NVME_FEAT_CAP_CHANGE,
+    [NVME_ERROR_RECOVERY]           = NVME_FEAT_CAP_CHANGE | NVME_FEAT_CAP_NS,
     [NVME_VOLATILE_WRITE_CACHE]     = NVME_FEAT_CAP_CHANGE,
     [NVME_NUMBER_OF_QUEUES]         = NVME_FEAT_CAP_CHANGE,
     [NVME_ASYNCHRONOUS_EVENT_CONF]  = NVME_FEAT_CAP_CHANGE,
@@ -878,6 +879,41 @@ static inline uint16_t nvme_check_bounds(NvmeCtrl *n, NvmeNamespace *ns,
     return NVME_SUCCESS;
 }
 
+static uint16_t nvme_check_dulbe(NvmeNamespace *ns, uint64_t slba,
+                                 uint32_t nlb)
+{
+    BlockDriverState *bs = blk_bs(ns->blkconf.blk);
+
+    int64_t pnum = 0, bytes = nvme_l2b(ns, nlb);
+    int64_t offset = nvme_l2b(ns, slba);
+    bool zeroed;
+    int ret;
+
+    /*
+     * `pnum` holds the number of bytes after offset that shares the same
+     * allocation status as the byte at offset. If `pnum` is different from
+     * `bytes`, we should check the allocation status of the next range and
+     * continue this until all bytes have been checked.
+     */
+    do {
+        bytes -= pnum;
+
+        ret = bdrv_block_status(bs, offset, bytes, &pnum, NULL, NULL);
+
+        zeroed = !!(ret & BDRV_BLOCK_ZERO);
+
+        trace_pci_nvme_block_status(offset, bytes, pnum, ret, zeroed);
+
+        if (zeroed) {
+            return NVME_DULB;
+        }
+
+        offset += pnum;
+    } while (pnum != bytes);
+
+    return NVME_SUCCESS;
+}
+
 static void nvme_rw_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
@@ -985,6 +1021,15 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
+    if (acct == BLOCK_ACCT_READ) {
+        if (NVME_ERR_REC_DULBE(ns->features.err_rec)) {
+            status = nvme_check_dulbe(ns, slba, nlb);
+            if (status) {
+                goto invalid;
+            }
+        }
+    }
+
     status = nvme_map_dptr(n, data_size, req);
     if (status) {
         goto invalid;
@@ -1632,6 +1677,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
     uint8_t fid = NVME_GETSETFEAT_FID(dw10);
     NvmeGetFeatureSelect sel = NVME_GETFEAT_SELECT(dw10);
     uint16_t iv;
+    NvmeNamespace *ns;
 
     static const uint32_t nvme_feature_default[NVME_FID_MAX] = {
         [NVME_ARBITRATION] = NVME_ARB_AB_NOLIMIT,
@@ -1694,6 +1740,18 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
         }
 
         return NVME_INVALID_FIELD | NVME_DNR;
+    case NVME_ERROR_RECOVERY:
+        if (!nvme_nsid_valid(n, nsid)) {
+            return NVME_INVALID_NSID | NVME_DNR;
+        }
+
+        ns = nvme_ns(n, nsid);
+        if (unlikely(!ns)) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+
+        result = ns->features.err_rec;
+        goto out;
     case NVME_VOLATILE_WRITE_CACHE:
         result = n->features.vwc;
         trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
@@ -1766,7 +1824,7 @@ static uint16_t nvme_set_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
 
 static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
 {
-    NvmeNamespace *ns;
+    NvmeNamespace *ns = NULL;
 
     NvmeCmd *cmd = &req->cmd;
     uint32_t dw10 = le32_to_cpu(cmd->cdw10);
@@ -1774,6 +1832,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
     uint32_t nsid = le32_to_cpu(cmd->nsid);
     uint8_t fid = NVME_GETSETFEAT_FID(dw10);
     uint8_t save = NVME_SETFEAT_SAVE(dw10);
+    int i;
 
     trace_pci_nvme_setfeat(nvme_cid(req), nsid, fid, save, dw11);
 
@@ -1833,11 +1892,31 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
                                NVME_LOG_SMART_INFO);
         }
 
+        break;
+    case NVME_ERROR_RECOVERY:
+        if (nsid == NVME_NSID_BROADCAST) {
+            for (i = 1; i <= n->num_namespaces; i++) {
+                ns = nvme_ns(n, i);
+
+                if (!ns) {
+                    continue;
+                }
+
+                if (NVME_ID_NS_NSFEAT_DULBE(ns->id_ns.nsfeat)) {
+                    ns->features.err_rec = dw11;
+                }
+            }
+
+            break;
+        }
+
+        assert(ns);
+        ns->features.err_rec = dw11;
         break;
     case NVME_VOLATILE_WRITE_CACHE:
         n->features.vwc = dw11 & 0x1;
 
-        for (int i = 1; i <= n->num_namespaces; i++) {
+        for (i = 1; i <= n->num_namespaces; i++) {
             ns = nvme_ns(n, i);
             if (!ns) {
                 continue;
diff --git a/hw/block/trace-events b/hw/block/trace-events
index c1537e3ac0b0..1ffe0b3f76b5 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -43,6 +43,10 @@ pci_nvme_admin_cmd(uint16_t cid, uint16_t sqid, uint8_t opcode, const char *opna
 pci_nvme_rw(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" opname '%s' nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_write_zeroes(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
+pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%x zeroed %d"
+pci_nvme_dsm(uint16_t cid, uint32_t nsid, uint32_t nr, uint32_t attr) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu32" attr 0x%"PRIx32""
+pci_nvme_dsm_deallocate(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
+pci_nvme_aio_discard_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t qsize, uint16_t qflags) "create submission queue, addr=0x%"PRIx64", sqid=%"PRIu16", cqid=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16""
 pci_nvme_create_cq(uint64_t addr, uint16_t cqid, uint16_t vector, uint16_t size, uint16_t qflags, int ien) "create completion queue, addr=0x%"PRIx64", cqid=%"PRIu16", vector=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16", ien=%d"
 pci_nvme_del_sq(uint16_t qid) "deleting submission queue sqid=%"PRIu16""
-- 
2.29.1


