Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DBC40B990
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 23:03:25 +0200 (CEST)
Received: from localhost ([::1]:50722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQFaO-0005tx-RL
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 17:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFC3-0005nO-Ng; Tue, 14 Sep 2021 16:38:15 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:58135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFBz-0004qx-5J; Tue, 14 Sep 2021 16:38:15 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 15C5332009E4;
 Tue, 14 Sep 2021 16:38:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 14 Sep 2021 16:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=f27lOTSg5N0OP
 TgCDhuCqfD01V2geFi5vNEn9zraqdQ=; b=TyTZ0ObsQEn+bZnE8MM0GrussGIzc
 bLVuQEcgRfDZT23OUKP//frYLGHMsiUowV4PWSWTQysYks0cWPPj7VIDSEKdtHiy
 qEOzR/S3wA0paB8pEu2PdELvt/s0SKoWaKBhhigVoZMsWXDbYrKykJ2cNjtSXJPZ
 Qx5w/4BcP8SmEoZbb488sKU8PYEgHu+zHnkt/Erg7z1QGzfvVqfY0AMf5rj5uMBB
 8DmufByZwrdb3qTNB3Olkd311x6d0RKOJsbdkMlNmBdrp5UECub9u+SQes1QWkPJ
 okZ/6pGQNFHVM00iiRcLIZMPP+YuS96bQkLmBqnjlX38nEZyTdcyogQVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=f27lOTSg5N0OPTgCDhuCqfD01V2geFi5vNEn9zraqdQ=; b=UpTEqpgV
 yySrlE2Qu4EmouOkR8tQ3xefJenapD1p7TB2LfNbufr8iRgN95OZZEvO2cha68IR
 tdDXWWn7lmuaYwvdNKQmCt8vCaxd7p6yd3xCHrIqUt/Y3+cFSH2pFo02C54ddUm3
 y/+0JICjoByzYrlq6hJJr8sx50/6ERhhEoG8K55DH4RzA5E8PWj333RSCyXj8z1p
 bhpnZXmkKm+/9dhCnOLiAja0lFBZQznxdFpIdMnZB+VcC24xfH4eRIrSyxG7xzJp
 /1scVg9ctFF1o5acHKrW4wmXLK7iyA93lXYkW5AkALsRX9BBewjWNBG4xrJSyUpG
 hdrW6yl06UCuQw==
X-ME-Sender: <xms:MAhBYfHwHnLCEQ5RKFQGVNSizVPIlw_9YKMHialMFr8AW7wSCh3UJA>
 <xme:MAhBYcU4x8dbdrHzAcolWCprpNu0HTkUNLNp3V6CrYTa0om2nHcvs2yeP13Yd-F9X
 eCcpsY8K_8JfBAZTqA>
X-ME-Received: <xmr:MAhBYRKC0C_Lq8VqPPep_8_w_nrIbTq_r-Hc2e9jVzTGMGIpZo1zp1UFR9OshUjkQSSXDzawog2UENtjJ_jV31TPB1PdY8noJiKFRUKV0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudegkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepudeiteefjeejgeevhfejuedvueeigfffgfdvteetveetjeejueegudfhheeg
 ffeknecuffhomhgrihhnpehquggvvhdrihgunecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:MAhBYdH5HnoZlEOpkfJnmM6p8N1W0j5rUA2vjeeF2ElncBeT-KRotQ>
 <xmx:MAhBYVXokZrdh51H6dAJ4SJsORfFf-pmvW_xCjgWFVKDp60u0fC5Dw>
 <xmx:MAhBYYPmHkzjqwZaIMWtfrtSazHDJBHCQuxA9_RPGeKuAUlOjGRFzQ>
 <xmx:MAhBYRoTzKymzohGZlLXc6qiSSAbbFPgRoKFM8eA6KuxdztXopQ4Bg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 16:38:06 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 08/13] hw/nvme: hoist qdev state from controller
Date: Tue, 14 Sep 2021 22:37:32 +0200
Message-Id: <20210914203737.182571-9-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914203737.182571-1-its@irrelevant.dk>
References: <20210914203737.182571-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Markus Armbruster <armbru@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add an abstract object NvmeState.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c   | 382 +++++++++++++++++++++++++----------------------
 hw/nvme/dif.c    |   4 +-
 hw/nvme/dif.h    |   2 +-
 hw/nvme/ns.c     |   4 +-
 hw/nvme/nvme.h   |  52 ++++---
 hw/nvme/subsys.c |   4 +-
 6 files changed, 239 insertions(+), 209 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 966fba605d79..6a4f07b8d114 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -323,7 +323,7 @@ static int nvme_ns_zoned_aor_check(NvmeNamespaceZoned *zoned, uint32_t act,
     return NVME_SUCCESS;
 }
 
-static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
+static bool nvme_addr_is_cmb(NvmeState *n, hwaddr addr)
 {
     hwaddr hi, lo;
 
@@ -337,13 +337,13 @@ static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
     return addr >= lo && addr < hi;
 }
 
-static inline void *nvme_addr_to_cmb(NvmeCtrl *n, hwaddr addr)
+static inline void *nvme_addr_to_cmb(NvmeState *n, hwaddr addr)
 {
     hwaddr base = n->params.legacy_cmb ? n->cmb.mem.addr : n->cmb.cba;
     return &n->cmb.buf[addr - base];
 }
 
-static bool nvme_addr_is_pmr(NvmeCtrl *n, hwaddr addr)
+static bool nvme_addr_is_pmr(NvmeState *n, hwaddr addr)
 {
     hwaddr hi;
 
@@ -356,12 +356,12 @@ static bool nvme_addr_is_pmr(NvmeCtrl *n, hwaddr addr)
     return addr >= n->pmr.cba && addr < hi;
 }
 
-static inline void *nvme_addr_to_pmr(NvmeCtrl *n, hwaddr addr)
+static inline void *nvme_addr_to_pmr(NvmeState *n, hwaddr addr)
 {
     return memory_region_get_ram_ptr(&n->pmr.dev->mr) + (addr - n->pmr.cba);
 }
 
-static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
+static int nvme_addr_read(NvmeState *n, hwaddr addr, void *buf, int size)
 {
     hwaddr hi = addr + size - 1;
     if (hi < addr) {
@@ -381,7 +381,7 @@ static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
     return pci_dma_read(&n->parent_obj, addr, buf, size);
 }
 
-static int nvme_addr_write(NvmeCtrl *n, hwaddr addr, void *buf, int size)
+static int nvme_addr_write(NvmeState *n, hwaddr addr, void *buf, int size)
 {
     hwaddr hi = addr + size - 1;
     if (hi < addr) {
@@ -401,18 +401,18 @@ static int nvme_addr_write(NvmeCtrl *n, hwaddr addr, void *buf, int size)
     return pci_dma_write(&n->parent_obj, addr, buf, size);
 }
 
-static bool nvme_nsid_valid(NvmeCtrl *n, uint32_t nsid)
+static bool nvme_nsid_valid(NvmeState *n, uint32_t nsid)
 {
     return nsid &&
         (nsid == NVME_NSID_BROADCAST || nsid <= NVME_MAX_NAMESPACES);
 }
 
-static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)
+static int nvme_check_sqid(NvmeState *n, uint16_t sqid)
 {
     return sqid < n->params.max_ioqpairs + 1 && n->sq[sqid] != NULL ? 0 : -1;
 }
 
-static int nvme_check_cqid(NvmeCtrl *n, uint16_t cqid)
+static int nvme_check_cqid(NvmeState *n, uint16_t cqid)
 {
     return cqid < n->params.max_ioqpairs + 1 && n->cq[cqid] != NULL ? 0 : -1;
 }
@@ -441,7 +441,7 @@ static uint8_t nvme_sq_empty(NvmeSQueue *sq)
     return sq->head == sq->tail;
 }
 
-static void nvme_irq_check(NvmeCtrl *n)
+static void nvme_irq_check(NvmeState *n)
 {
     uint32_t intms = ldl_le_p(&n->bar.intms);
 
@@ -455,7 +455,7 @@ static void nvme_irq_check(NvmeCtrl *n)
     }
 }
 
-static void nvme_irq_assert(NvmeCtrl *n, NvmeCQueue *cq)
+static void nvme_irq_assert(NvmeState *n, NvmeCQueue *cq)
 {
     if (cq->irq_enabled) {
         if (msix_enabled(&(n->parent_obj))) {
@@ -472,7 +472,7 @@ static void nvme_irq_assert(NvmeCtrl *n, NvmeCQueue *cq)
     }
 }
 
-static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue *cq)
+static void nvme_irq_deassert(NvmeState *n, NvmeCQueue *cq)
 {
     if (cq->irq_enabled) {
         if (msix_enabled(&(n->parent_obj))) {
@@ -496,7 +496,7 @@ static void nvme_req_clear(NvmeRequest *req)
     req->status = NVME_SUCCESS;
 }
 
-static inline void nvme_sg_init(NvmeCtrl *n, NvmeSg *sg, bool dma)
+static inline void nvme_sg_init(NvmeState *n, NvmeSg *sg, bool dma)
 {
     if (dma) {
         pci_dma_sglist_init(&sg->qsg, &n->parent_obj, 0);
@@ -574,7 +574,7 @@ static void nvme_sg_split(NvmeSg *sg, NvmeNamespaceNvm *nvm, NvmeSg *data,
     }
 }
 
-static uint16_t nvme_map_addr_cmb(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
+static uint16_t nvme_map_addr_cmb(NvmeState *n, QEMUIOVector *iov, hwaddr addr,
                                   size_t len)
 {
     if (!len) {
@@ -592,7 +592,7 @@ static uint16_t nvme_map_addr_cmb(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_map_addr_pmr(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
+static uint16_t nvme_map_addr_pmr(NvmeState *n, QEMUIOVector *iov, hwaddr addr,
                                   size_t len)
 {
     if (!len) {
@@ -608,7 +608,7 @@ static uint16_t nvme_map_addr_pmr(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_map_addr(NvmeCtrl *n, NvmeSg *sg, hwaddr addr, size_t len)
+static uint16_t nvme_map_addr(NvmeState *n, NvmeSg *sg, hwaddr addr, size_t len)
 {
     bool cmb = false, pmr = false;
 
@@ -658,12 +658,12 @@ max_mappings_exceeded:
     return NVME_INTERNAL_DEV_ERROR | NVME_DNR;
 }
 
-static inline bool nvme_addr_is_dma(NvmeCtrl *n, hwaddr addr)
+static inline bool nvme_addr_is_dma(NvmeState *n, hwaddr addr)
 {
     return !(nvme_addr_is_cmb(n, addr) || nvme_addr_is_pmr(n, addr));
 }
 
-static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, uint64_t prp1,
+static uint16_t nvme_map_prp(NvmeState *n, NvmeSg *sg, uint64_t prp1,
                              uint64_t prp2, uint32_t len)
 {
     hwaddr trans_len = n->page_size - (prp1 % n->page_size);
@@ -764,7 +764,7 @@ unmap:
  * Map 'nsgld' data descriptors from 'segment'. The function will subtract the
  * number of bytes mapped in len.
  */
-static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
+static uint16_t nvme_map_sgl_data(NvmeState *n, NvmeSg *sg,
                                   NvmeSglDescriptor *segment, uint64_t nsgld,
                                   size_t *len, NvmeCmd *cmd)
 {
@@ -834,7 +834,7 @@ next:
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
+static uint16_t nvme_map_sgl(NvmeState *n, NvmeSg *sg, NvmeSglDescriptor sgl,
                              size_t len, NvmeCmd *cmd)
 {
     /*
@@ -977,7 +977,7 @@ unmap:
     return status;
 }
 
-uint16_t nvme_map_dptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
+uint16_t nvme_map_dptr(NvmeState *n, NvmeSg *sg, size_t len,
                        NvmeCmd *cmd)
 {
     uint64_t prp1, prp2;
@@ -996,7 +996,7 @@ uint16_t nvme_map_dptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
     }
 }
 
-static uint16_t nvme_map_mptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
+static uint16_t nvme_map_mptr(NvmeState *n, NvmeSg *sg, size_t len,
                               NvmeCmd *cmd)
 {
     int psdt = NVME_CMD_FLAGS_PSDT(cmd->flags);
@@ -1027,7 +1027,7 @@ static uint16_t nvme_map_mptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
     return status;
 }
 
-static uint16_t nvme_map_data(NvmeCtrl *n, uint32_t nlb, NvmeRequest *req)
+static uint16_t nvme_map_data(NvmeState *n, uint32_t nlb, NvmeRequest *req)
 {
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(req->ns);
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
@@ -1056,7 +1056,7 @@ static uint16_t nvme_map_data(NvmeCtrl *n, uint32_t nlb, NvmeRequest *req)
     return nvme_map_dptr(n, &req->sg, len, &req->cmd);
 }
 
-static uint16_t nvme_map_mdata(NvmeCtrl *n, uint32_t nlb, NvmeRequest *req)
+static uint16_t nvme_map_mdata(NvmeState *n, uint32_t nlb, NvmeRequest *req)
 {
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(req->ns);
     size_t len = nvme_m2b(nvm, nlb);
@@ -1082,7 +1082,7 @@ static uint16_t nvme_map_mdata(NvmeCtrl *n, uint32_t nlb, NvmeRequest *req)
     return nvme_map_mptr(n, &req->sg, len, &req->cmd);
 }
 
-static uint16_t nvme_tx_interleaved(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr,
+static uint16_t nvme_tx_interleaved(NvmeState *n, NvmeSg *sg, uint8_t *ptr,
                                     uint32_t len, uint32_t bytes,
                                     int32_t skip_bytes, int64_t offset,
                                     NvmeTxDirection dir)
@@ -1144,7 +1144,7 @@ static uint16_t nvme_tx_interleaved(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr,
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
+static uint16_t nvme_tx(NvmeState *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
                         NvmeTxDirection dir)
 {
     assert(sg->flags & NVME_SG_ALLOC);
@@ -1180,7 +1180,7 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
     return NVME_SUCCESS;
 }
 
-static inline uint16_t nvme_c2h(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+static inline uint16_t nvme_c2h(NvmeState *n, uint8_t *ptr, uint32_t len,
                                 NvmeRequest *req)
 {
     uint16_t status;
@@ -1193,7 +1193,7 @@ static inline uint16_t nvme_c2h(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
     return nvme_tx(n, &req->sg, ptr, len, NVME_TX_DIRECTION_FROM_DEVICE);
 }
 
-static inline uint16_t nvme_h2c(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+static inline uint16_t nvme_h2c(NvmeState *n, uint8_t *ptr, uint32_t len,
                                 NvmeRequest *req)
 {
     uint16_t status;
@@ -1206,7 +1206,7 @@ static inline uint16_t nvme_h2c(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
     return nvme_tx(n, &req->sg, ptr, len, NVME_TX_DIRECTION_TO_DEVICE);
 }
 
-uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+uint16_t nvme_bounce_data(NvmeState *n, uint8_t *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req)
 {
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(req->ns);
@@ -1222,7 +1222,7 @@ uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
     return nvme_tx(n, &req->sg, ptr, len, dir);
 }
 
-uint16_t nvme_bounce_mdata(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+uint16_t nvme_bounce_mdata(NvmeState *n, uint8_t *ptr, uint32_t len,
                            NvmeTxDirection dir, NvmeRequest *req)
 {
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(req->ns);
@@ -1272,7 +1272,7 @@ static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
 static void nvme_post_cqes(void *opaque)
 {
     NvmeCQueue *cq = opaque;
-    NvmeCtrl *n = cq->ctrl;
+    NvmeState *n = cq->ctrl;
     NvmeRequest *req, *next;
     bool pending = cq->head != cq->tail;
     int ret;
@@ -1332,7 +1332,7 @@ static void nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
 
 static void nvme_process_aers(void *opaque)
 {
-    NvmeCtrl *n = opaque;
+    NvmeState *n = opaque;
     NvmeAsyncEvent *event, *next;
 
     trace_pci_nvme_process_aers(n->aer_queued);
@@ -1374,7 +1374,7 @@ static void nvme_process_aers(void *opaque)
     }
 }
 
-static void nvme_enqueue_event(NvmeCtrl *n, uint8_t event_type,
+static void nvme_enqueue_event(NvmeState *n, uint8_t event_type,
                                uint8_t event_info, uint8_t log_page)
 {
     NvmeAsyncEvent *event;
@@ -1399,7 +1399,7 @@ static void nvme_enqueue_event(NvmeCtrl *n, uint8_t event_type,
     nvme_process_aers(n);
 }
 
-static void nvme_smart_event(NvmeCtrl *n, uint8_t event)
+static void nvme_smart_event(NvmeState *n, uint8_t event)
 {
     uint8_t aer_info;
 
@@ -1428,7 +1428,7 @@ static void nvme_smart_event(NvmeCtrl *n, uint8_t event)
     nvme_enqueue_event(n, NVME_AER_TYPE_SMART, aer_info, NVME_LOG_SMART_INFO);
 }
 
-static void nvme_clear_events(NvmeCtrl *n, uint8_t event_type)
+static void nvme_clear_events(NvmeState *n, uint8_t event_type)
 {
     n->aer_mask &= ~(1 << event_type);
     if (!QTAILQ_EMPTY(&n->aer_queue)) {
@@ -1436,7 +1436,7 @@ static void nvme_clear_events(NvmeCtrl *n, uint8_t event_type)
     }
 }
 
-static inline uint16_t nvme_check_mdts(NvmeCtrl *n, size_t len)
+static inline uint16_t nvme_check_mdts(NvmeState *n, size_t len)
 {
     uint8_t mdts = n->params.mdts;
 
@@ -1745,7 +1745,7 @@ enum {
     NVME_ZRM_AUTO = 1 << 0,
 };
 
-static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespaceZoned *zoned,
+static uint16_t nvme_zrm_open_flags(NvmeState *n, NvmeNamespaceZoned *zoned,
                                     NvmeZone *zone, int flags)
 {
     int act = 0;
@@ -1796,13 +1796,13 @@ static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespaceZoned *zoned,
     }
 }
 
-static inline uint16_t nvme_zrm_auto(NvmeCtrl *n, NvmeNamespaceZoned *zoned,
+static inline uint16_t nvme_zrm_auto(NvmeState *n, NvmeNamespaceZoned *zoned,
                                      NvmeZone *zone)
 {
     return nvme_zrm_open_flags(n, zoned, zone, NVME_ZRM_AUTO);
 }
 
-static inline uint16_t nvme_zrm_open(NvmeCtrl *n, NvmeNamespaceZoned *zoned,
+static inline uint16_t nvme_zrm_open(NvmeState *n, NvmeNamespaceZoned *zoned,
                                      NvmeZone *zone)
 {
     return nvme_zrm_open_flags(n, zoned, zone, 0);
@@ -1918,7 +1918,7 @@ static void nvme_rw_cb(void *opaque, int ret)
             uint16_t status;
 
             nvme_sg_unmap(&req->sg);
-            status = nvme_map_mdata(nvme_ctrl(req), nlb, req);
+            status = nvme_map_mdata(nvme_state(req), nlb, req);
             if (status) {
                 ret = -EFAULT;
                 goto out;
@@ -2038,7 +2038,7 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
     NvmeRequest *req = opaque;
     NvmeNamespace *ns = req->ns;
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
-    NvmeCtrl *n = nvme_ctrl(req);
+    NvmeState *n = nvme_state(req);
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
     uint16_t apptag = le16_to_cpu(rw->apptag);
@@ -2123,7 +2123,7 @@ out:
 static void nvme_compare_data_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
-    NvmeCtrl *n = nvme_ctrl(req);
+    NvmeState *n = nvme_state(req);
     NvmeNamespace *ns = req->ns;
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     BlockBackend *blk = nvme_blk(ns);
@@ -2286,7 +2286,7 @@ static void nvme_dsm_cb(void *opaque, int ret)
 {
     NvmeDSMAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
-    NvmeCtrl *n = nvme_ctrl(req);
+    NvmeState *n = nvme_state(req);
     NvmeNamespace *ns = req->ns;
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeDsmRange *range;
@@ -2330,7 +2330,7 @@ done:
     qemu_bh_schedule(iocb->bh);
 }
 
-static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_dsm(NvmeState *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
     NvmeDsmCmd *dsm = (NvmeDsmCmd *) &req->cmd;
@@ -2366,7 +2366,7 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
     return status;
 }
 
-static uint16_t nvme_verify(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_verify(NvmeState *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
@@ -2774,8 +2774,7 @@ done:
     }
 }
 
-
-static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_copy(NvmeState *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
@@ -2863,7 +2862,7 @@ invalid:
     return status;
 }
 
-static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_compare(NvmeState *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
@@ -2984,7 +2983,7 @@ static void nvme_flush_bh(void *opaque)
 {
     NvmeFlushAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
-    NvmeCtrl *n = nvme_ctrl(req);
+    NvmeState *n = nvme_state(req);
     int i;
 
     if (iocb->ret < 0) {
@@ -3019,7 +3018,7 @@ done:
     return;
 }
 
-static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_flush(NvmeState *n, NvmeRequest *req)
 {
     NvmeFlushAIOCB *iocb;
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
@@ -3062,7 +3061,7 @@ out:
     return status;
 }
 
-static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_read(NvmeState *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
@@ -3136,7 +3135,7 @@ invalid:
     return status | NVME_DNR;
 }
 
-static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
+static uint16_t nvme_do_write(NvmeState *n, NvmeRequest *req, bool append,
                               bool wrz)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
@@ -3272,17 +3271,17 @@ invalid:
     return status | NVME_DNR;
 }
 
-static inline uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req)
+static inline uint16_t nvme_write(NvmeState *n, NvmeRequest *req)
 {
     return nvme_do_write(n, req, false, false);
 }
 
-static inline uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeRequest *req)
+static inline uint16_t nvme_write_zeroes(NvmeState *n, NvmeRequest *req)
 {
     return nvme_do_write(n, req, false, true);
 }
 
-static inline uint16_t nvme_zone_append(NvmeCtrl *n, NvmeRequest *req)
+static inline uint16_t nvme_zone_append(NvmeState *n, NvmeRequest *req)
 {
     return nvme_do_write(n, req, true, false);
 }
@@ -3330,7 +3329,7 @@ enum NvmeZoneProcessingMask {
 static uint16_t nvme_open_zone(NvmeNamespaceZoned *zoned, NvmeZone *zone,
                                NvmeZoneState state, NvmeRequest *req)
 {
-    return nvme_zrm_open(nvme_ctrl(req), zoned, zone);
+    return nvme_zrm_open(nvme_state(req), zoned, zone);
 }
 
 static uint16_t nvme_close_zone(NvmeNamespaceZoned *zoned, NvmeZone *zone,
@@ -3609,7 +3608,7 @@ done:
     }
 }
 
-static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_zone_mgmt_send(NvmeState *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = (NvmeCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
@@ -3758,7 +3757,7 @@ static bool nvme_zone_matches_filter(uint32_t zafs, NvmeZone *zl)
     }
 }
 
-static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_zone_mgmt_recv(NvmeState *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = (NvmeCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
@@ -3866,7 +3865,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
     return status;
 }
 
-static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_io_cmd(NvmeState *n, NvmeRequest *req)
 {
     NvmeNamespace *ns;
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
@@ -3945,7 +3944,7 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
     return NVME_INVALID_OPCODE | NVME_DNR;
 }
 
-static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
+static void nvme_free_sq(NvmeSQueue *sq, NvmeState *n)
 {
     n->sq[sq->sqid] = NULL;
     timer_free(sq->timer);
@@ -3955,7 +3954,7 @@ static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
     }
 }
 
-static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_del_sq(NvmeState *n, NvmeRequest *req)
 {
     NvmeDeleteQ *c = (NvmeDeleteQ *)&req->cmd;
     NvmeRequest *r, *next;
@@ -3996,7 +3995,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
     return NVME_SUCCESS;
 }
 
-static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
+static void nvme_init_sq(NvmeSQueue *sq, NvmeState *n, uint64_t dma_addr,
                          uint16_t sqid, uint16_t cqid, uint16_t size)
 {
     int i;
@@ -4024,7 +4023,7 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
     n->sq[sqid] = sq;
 }
 
-static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_create_sq(NvmeState *n, NvmeRequest *req)
 {
     NvmeSQueue *sq;
     NvmeCreateSq *c = (NvmeCreateSq *)&req->cmd;
@@ -4080,7 +4079,7 @@ static void nvme_set_blk_stats(NvmeNamespace *ns, struct nvme_stats *stats)
     stats->write_commands += s->nr_ops[BLOCK_ACCT_WRITE];
 }
 
-static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
+static uint16_t nvme_smart_info(NvmeState *n, uint8_t rae, uint32_t buf_len,
                                 uint64_t off, NvmeRequest *req)
 {
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
@@ -4140,7 +4139,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     return nvme_c2h(n, (uint8_t *) &smart + off, trans_len, req);
 }
 
-static uint16_t nvme_fw_log_info(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
+static uint16_t nvme_fw_log_info(NvmeState *n, uint32_t buf_len, uint64_t off,
                                  NvmeRequest *req)
 {
     uint32_t trans_len;
@@ -4158,7 +4157,7 @@ static uint16_t nvme_fw_log_info(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
     return nvme_c2h(n, (uint8_t *) &fw_log + off, trans_len, req);
 }
 
-static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
+static uint16_t nvme_error_info(NvmeState *n, uint8_t rae, uint32_t buf_len,
                                 uint64_t off, NvmeRequest *req)
 {
     uint32_t trans_len;
@@ -4178,7 +4177,7 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     return nvme_c2h(n, (uint8_t *)&errlog, trans_len, req);
 }
 
-static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
+static uint16_t nvme_changed_nslist(NvmeState *n, uint8_t rae, uint32_t buf_len,
                                     uint64_t off, NvmeRequest *req)
 {
     uint32_t nslist[1024];
@@ -4220,7 +4219,7 @@ static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     return nvme_c2h(n, ((uint8_t *)nslist) + off, trans_len, req);
 }
 
-static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
+static uint16_t nvme_cmd_effects(NvmeState *n, uint8_t csi, uint32_t buf_len,
                                  uint64_t off, NvmeRequest *req)
 {
     NvmeEffectsLog log = {};
@@ -4260,7 +4259,7 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
     return nvme_c2h(n, ((uint8_t *)&log) + off, trans_len, req);
 }
 
-static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_get_log(NvmeState *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = &req->cmd;
 
@@ -4313,7 +4312,7 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
     }
 }
 
-static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
+static void nvme_free_cq(NvmeCQueue *cq, NvmeState *n)
 {
     n->cq[cq->cqid] = NULL;
     timer_free(cq->timer);
@@ -4325,7 +4324,7 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
     }
 }
 
-static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_del_cq(NvmeState *n, NvmeRequest *req)
 {
     NvmeDeleteQ *c = (NvmeDeleteQ *)&req->cmd;
     NvmeCQueue *cq;
@@ -4352,7 +4351,7 @@ static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeRequest *req)
     return NVME_SUCCESS;
 }
 
-static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
+static void nvme_init_cq(NvmeCQueue *cq, NvmeState *n, uint64_t dma_addr,
                          uint16_t cqid, uint16_t vector, uint16_t size,
                          uint16_t irq_enabled)
 {
@@ -4376,7 +4375,7 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
     cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
 }
 
-static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_create_cq(NvmeState *n, NvmeRequest *req)
 {
     NvmeCQueue *cq;
     NvmeCreateCq *c = (NvmeCreateCq *)&req->cmd;
@@ -4428,21 +4427,21 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_rpt_empty_id_struct(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_rpt_empty_id_struct(NvmeState *n, NvmeRequest *req)
 {
     uint8_t id[NVME_IDENTIFY_DATA_SIZE] = {};
 
     return nvme_c2h(n, id, sizeof(id), req);
 }
 
-static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_ctrl(NvmeState *n, NvmeRequest *req)
 {
     trace_pci_nvme_identify_ctrl();
 
     return nvme_c2h(n, (uint8_t *)&n->id_ctrl, sizeof(n->id_ctrl), req);
 }
 
-static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_ctrl_csi(NvmeState *n, NvmeRequest *req)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
     uint8_t id[NVME_IDENTIFY_DATA_SIZE] = {};
@@ -4467,7 +4466,7 @@ static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
     return nvme_c2h(n, id, sizeof(id), req);
 }
 
-static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
+static uint16_t nvme_identify_ns(NvmeState *n, NvmeRequest *req, bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -4499,7 +4498,7 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
     return NVME_INVALID_CMD_SET | NVME_DNR;
 }
 
-static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
+static uint16_t nvme_identify_ctrl_list(NvmeState *n, NvmeRequest *req,
                                         bool attached)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -4508,7 +4507,7 @@ static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
     uint16_t list[NVME_CONTROLLER_LIST_SIZE] = {};
     uint16_t *ids = &list[1];
     NvmeNamespace *ns;
-    NvmeCtrl *ctrl;
+    NvmeState *ctrl;
     int cntlid, nr_ids = 0;
 
     trace_pci_nvme_identify_ctrl_list(c->cns, min_id);
@@ -4546,7 +4545,7 @@ static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
     return nvme_c2h(n, (uint8_t *)list, sizeof(list), req);
 }
 
-static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
+static uint16_t nvme_identify_ns_csi(NvmeState *n, NvmeRequest *req,
                                      bool active)
 {
     NvmeNamespace *ns;
@@ -4581,7 +4580,7 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
     return NVME_INVALID_FIELD | NVME_DNR;
 }
 
-static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
+static uint16_t nvme_identify_nslist(NvmeState *n, NvmeRequest *req,
                                      bool active)
 {
     NvmeNamespace *ns;
@@ -4628,7 +4627,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
     return nvme_c2h(n, list, data_len, req);
 }
 
-static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
+static uint16_t nvme_identify_nslist_csi(NvmeState *n, NvmeRequest *req,
                                          bool active)
 {
     NvmeNamespace *ns;
@@ -4676,7 +4675,7 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
     return nvme_c2h(n, list, data_len, req);
 }
 
-static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_ns_descr_list(NvmeState *n, NvmeRequest *req)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -4735,7 +4734,7 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
     return nvme_c2h(n, list, sizeof(list), req);
 }
 
-static uint16_t nvme_identify_cmd_set(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_cmd_set(NvmeState *n, NvmeRequest *req)
 {
     uint8_t list[NVME_IDENTIFY_DATA_SIZE] = {};
     static const int data_len = sizeof(list);
@@ -4748,7 +4747,7 @@ static uint16_t nvme_identify_cmd_set(NvmeCtrl *n, NvmeRequest *req)
     return nvme_c2h(n, list, data_len, req);
 }
 
-static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify(NvmeState *n, NvmeRequest *req)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
 
@@ -4790,7 +4789,7 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
     }
 }
 
-static uint16_t nvme_abort(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_abort(NvmeState *n, NvmeRequest *req)
 {
     uint16_t sqid = le32_to_cpu(req->cmd.cdw10) & 0xffff;
 
@@ -4802,7 +4801,7 @@ static uint16_t nvme_abort(NvmeCtrl *n, NvmeRequest *req)
     return NVME_SUCCESS;
 }
 
-static inline void nvme_set_timestamp(NvmeCtrl *n, uint64_t ts)
+static inline void nvme_set_timestamp(NvmeState *n, uint64_t ts)
 {
     trace_pci_nvme_setfeat_timestamp(ts);
 
@@ -4810,7 +4809,7 @@ static inline void nvme_set_timestamp(NvmeCtrl *n, uint64_t ts)
     n->timestamp_set_qemu_clock_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
 }
 
-static inline uint64_t nvme_get_timestamp(const NvmeCtrl *n)
+static inline uint64_t nvme_get_timestamp(const NvmeState *n)
 {
     uint64_t current_time = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     uint64_t elapsed_time = current_time - n->timestamp_set_qemu_clock_ms;
@@ -4837,14 +4836,14 @@ static inline uint64_t nvme_get_timestamp(const NvmeCtrl *n)
     return cpu_to_le64(ts.all);
 }
 
-static uint16_t nvme_get_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_get_feature_timestamp(NvmeState *n, NvmeRequest *req)
 {
     uint64_t timestamp = nvme_get_timestamp(n);
 
     return nvme_c2h(n, (uint8_t *)&timestamp, sizeof(timestamp), req);
 }
 
-static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_get_feature(NvmeState *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = &req->cmd;
     uint32_t dw10 = le32_to_cpu(cmd->cdw10);
@@ -4994,7 +4993,7 @@ out:
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_set_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_set_feature_timestamp(NvmeState *n, NvmeRequest *req)
 {
     uint16_t ret;
     uint64_t timestamp;
@@ -5009,7 +5008,7 @@ static uint16_t nvme_set_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_set_feature(NvmeState *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = NULL;
     NvmeNamespaceNvm *nvm;
@@ -5156,7 +5155,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_aer(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_aer(NvmeState *n, NvmeRequest *req)
 {
     trace_pci_nvme_aer(nvme_cid(req));
 
@@ -5175,7 +5174,7 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeRequest *req)
     return NVME_NO_COMPLETE;
 }
 
-static void nvme_update_dmrsl(NvmeCtrl *n)
+static void nvme_update_dmrsl(NvmeState *n)
 {
     int nsid;
 
@@ -5193,7 +5192,7 @@ static void nvme_update_dmrsl(NvmeCtrl *n)
     }
 }
 
-static void nvme_select_iocs_ns(NvmeCtrl *n, NvmeNamespace *ns)
+static void nvme_select_iocs_ns(NvmeState *n, NvmeNamespace *ns)
 {
     uint32_t cc = ldl_le_p(&n->bar.cc);
 
@@ -5214,10 +5213,10 @@ static void nvme_select_iocs_ns(NvmeCtrl *n, NvmeNamespace *ns)
     }
 }
 
-static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_ns_attachment(NvmeState *n, NvmeRequest *req)
 {
     NvmeNamespace *ns;
-    NvmeCtrl *ctrl;
+    NvmeState *ctrl;
     uint16_t list[NVME_CONTROLLER_LIST_SIZE] = {};
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
     uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
@@ -5409,7 +5408,7 @@ static void nvme_format_bh(void *opaque)
 {
     NvmeFormatAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
-    NvmeCtrl *n = nvme_ctrl(req);
+    NvmeState *n = nvme_state(req);
     uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
     uint8_t lbaf = dw10 & 0xf;
     uint8_t pi = (dw10 >> 5) & 0x7;
@@ -5453,7 +5452,7 @@ done:
     qemu_aio_unref(iocb);
 }
 
-static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_format(NvmeState *n, NvmeRequest *req)
 {
     NvmeFormatAIOCB *iocb;
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
@@ -5494,7 +5493,7 @@ out:
     return status;
 }
 
-static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_admin_cmd(NvmeState *n, NvmeRequest *req)
 {
     trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opcode,
                              nvme_adm_opc_str(req->cmd.opcode));
@@ -5544,7 +5543,7 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 static void nvme_process_sq(void *opaque)
 {
     NvmeSQueue *sq = opaque;
-    NvmeCtrl *n = sq->ctrl;
+    NvmeState *n = sq->ctrl;
     NvmeCQueue *cq = n->cq[sq->cqid];
 
     uint16_t status;
@@ -5578,7 +5577,7 @@ static void nvme_process_sq(void *opaque)
     }
 }
 
-static void nvme_ctrl_reset(NvmeCtrl *n)
+static void nvme_ctrl_reset(NvmeState *n)
 {
     NvmeNamespace *ns;
     int i;
@@ -5614,7 +5613,7 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
     n->qs_created = false;
 }
 
-static void nvme_ctrl_shutdown(NvmeCtrl *n)
+static void nvme_ctrl_shutdown(NvmeState *n)
 {
     NvmeNamespace *ns;
     int i;
@@ -5633,7 +5632,7 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
     }
 }
 
-static void nvme_select_iocs(NvmeCtrl *n)
+static void nvme_select_iocs(NvmeState *n)
 {
     NvmeNamespace *ns;
     int i;
@@ -5648,7 +5647,7 @@ static void nvme_select_iocs(NvmeCtrl *n)
     }
 }
 
-static int nvme_start_ctrl(NvmeCtrl *n)
+static int nvme_start_ctrl(NvmeState *n)
 {
     uint64_t cap = ldq_le_p(&n->bar.cap);
     uint32_t cc = ldl_le_p(&n->bar.cc);
@@ -5745,7 +5744,7 @@ static int nvme_start_ctrl(NvmeCtrl *n)
     return 0;
 }
 
-static void nvme_cmb_enable_regs(NvmeCtrl *n)
+static void nvme_cmb_enable_regs(NvmeState *n)
 {
     uint32_t cmbloc = ldl_le_p(&n->bar.cmbloc);
     uint32_t cmbsz = ldl_le_p(&n->bar.cmbsz);
@@ -5765,7 +5764,7 @@ static void nvme_cmb_enable_regs(NvmeCtrl *n)
     stl_le_p(&n->bar.cmbsz, cmbsz);
 }
 
-static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
+static void nvme_write_bar(NvmeState *n, hwaddr offset, uint64_t data,
                            unsigned size)
 {
     uint64_t cap = ldq_le_p(&n->bar.cap);
@@ -6015,7 +6014,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
 
 static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
 {
-    NvmeCtrl *n = (NvmeCtrl *)opaque;
+    NvmeState *n = (NvmeState *)opaque;
     uint8_t *ptr = (uint8_t *)&n->bar;
 
     trace_pci_nvme_mmio_read(addr, size);
@@ -6053,7 +6052,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
     return ldn_le_p(ptr + addr, size);
 }
 
-static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
+static void nvme_process_db(NvmeState *n, hwaddr addr, int val)
 {
     uint32_t qid;
 
@@ -6185,7 +6184,7 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
 static void nvme_mmio_write(void *opaque, hwaddr addr, uint64_t data,
                             unsigned size)
 {
-    NvmeCtrl *n = (NvmeCtrl *)opaque;
+    NvmeState *n = (NvmeState *)opaque;
 
     trace_pci_nvme_mmio_write(addr, data, size);
 
@@ -6209,13 +6208,13 @@ static const MemoryRegionOps nvme_mmio_ops = {
 static void nvme_cmb_write(void *opaque, hwaddr addr, uint64_t data,
                            unsigned size)
 {
-    NvmeCtrl *n = (NvmeCtrl *)opaque;
+    NvmeState *n = (NvmeState *)opaque;
     stn_le_p(&n->cmb.buf[addr], size, data);
 }
 
 static uint64_t nvme_cmb_read(void *opaque, hwaddr addr, unsigned size)
 {
-    NvmeCtrl *n = (NvmeCtrl *)opaque;
+    NvmeState *n = (NvmeState *)opaque;
     return ldn_le_p(&n->cmb.buf[addr], size);
 }
 
@@ -6229,7 +6228,7 @@ static const MemoryRegionOps nvme_cmb_ops = {
     },
 };
 
-static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
+static int nvme_check_constraints(NvmeState *n, Error **errp)
 {
     NvmeParams *params = &n->params;
 
@@ -6240,41 +6239,35 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
         params->max_ioqpairs = params->num_queues - 1;
     }
 
-    if (n->namespace.blkconf.blk && n->subsys) {
-        error_setg(errp, "subsystem support is unavailable with legacy "
-                   "namespace ('drive' property)");
-        return;
-    }
-
     if (params->max_ioqpairs < 1 ||
         params->max_ioqpairs > NVME_MAX_IOQPAIRS) {
         error_setg(errp, "max_ioqpairs must be between 1 and %d",
                    NVME_MAX_IOQPAIRS);
-        return;
+        return -1;
     }
 
     if (params->msix_qsize < 1 ||
         params->msix_qsize > PCI_MSIX_FLAGS_QSIZE + 1) {
         error_setg(errp, "msix_qsize must be between 1 and %d",
                    PCI_MSIX_FLAGS_QSIZE + 1);
-        return;
+        return -1;
     }
 
     if (!params->serial) {
         error_setg(errp, "serial property not set");
-        return;
+        return -1;
     }
 
     if (n->pmr.dev) {
         if (host_memory_backend_is_mapped(n->pmr.dev)) {
             error_setg(errp, "can't use already busy memdev: %s",
                        object_get_canonical_path_component(OBJECT(n->pmr.dev)));
-            return;
+            return -1;
         }
 
         if (!is_power_of_2(n->pmr.dev->size)) {
             error_setg(errp, "pmr backend size needs to be power of 2 in size");
-            return;
+            return -1;
         }
 
         host_memory_backend_set_mapped(n->pmr.dev, true);
@@ -6283,16 +6276,18 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
     if (n->params.zasl > n->params.mdts) {
         error_setg(errp, "zoned.zasl (Zone Append Size Limit) must be less "
                    "than or equal to mdts (Maximum Data Transfer Size)");
-        return;
+        return -1;
     }
 
     if (!n->params.vsl) {
         error_setg(errp, "vsl must be non-zero");
-        return;
+        return -1;
     }
+
+    return 0;
 }
 
-static void nvme_init_state(NvmeCtrl *n)
+static void nvme_init_state(NvmeState *n)
 {
     /* add one to max_ioqpairs to account for the admin queue pair */
     n->reg_size = pow2ceil(sizeof(NvmeBar) +
@@ -6305,7 +6300,7 @@ static void nvme_init_state(NvmeCtrl *n)
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
 }
 
-static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
+static void nvme_init_cmb(NvmeState *n, PCIDevice *pci_dev)
 {
     uint64_t cmb_size = n->params.cmb_size_mb * MiB;
     uint64_t cap = ldq_le_p(&n->bar.cap);
@@ -6327,7 +6322,7 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
     }
 }
 
-static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
+static void nvme_init_pmr(NvmeState *n, PCIDevice *pci_dev)
 {
     uint32_t pmrcap = ldl_le_p(&n->bar.pmrcap);
 
@@ -6347,7 +6342,7 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
     memory_region_set_enabled(&n->pmr.dev->mr, false);
 }
 
-static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
+static int nvme_init_pci(NvmeState *n, PCIDevice *pci_dev, Error **errp)
 {
     uint8_t *pci_conf = pci_dev->config;
     uint64_t bar_size, msix_table_size, msix_pba_size;
@@ -6412,7 +6407,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     return 0;
 }
 
-static void nvme_init_subnqn(NvmeCtrl *n)
+static void nvme_init_subnqn(NvmeState *n)
 {
     NvmeSubsystem *subsys = n->subsys;
     NvmeIdCtrl *id = &n->id_ctrl;
@@ -6425,7 +6420,7 @@ static void nvme_init_subnqn(NvmeCtrl *n)
     }
 }
 
-static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
+static void nvme_init_ctrl(NvmeState *n, PCIDevice *pci_dev)
 {
     NvmeIdCtrl *id = &n->id_ctrl;
     uint8_t *pci_conf = pci_dev->config;
@@ -6523,7 +6518,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     n->bar.intmc = n->bar.intms = 0;
 }
 
-static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
+static int nvme_init_subsys(NvmeState *n, Error **errp)
 {
     int cntlid;
 
@@ -6541,7 +6536,7 @@ static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
     return 0;
 }
 
-void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns)
+void nvme_attach_ns(NvmeState *n, NvmeNamespace *ns)
 {
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     uint32_t nsid = ns->nsid;
@@ -6556,16 +6551,20 @@ void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns)
 
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
-    NvmeCtrl *n = NVME(pci_dev);
-    Error *local_err = NULL;
+    NvmeCtrl *ctrl = NVME_DEVICE(pci_dev);
+    NvmeState *n = NVME_STATE(ctrl);
 
-    nvme_check_constraints(n, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (ctrl->namespace.blkconf.blk && n->subsys) {
+        error_setg(errp, "subsystem support is unavailable with legacy "
+                   "namespace ('drive' property)");
         return;
     }
 
-    qbus_create_inplace(&n->bus, sizeof(NvmeBus), TYPE_NVME_BUS,
+    if (nvme_check_constraints(n, errp)) {
+        return;
+    }
+
+    qbus_create_inplace(&ctrl->bus, sizeof(NvmeBus), TYPE_NVME_BUS,
                         &pci_dev->qdev, n->parent_obj.qdev.id);
 
     nvme_init_state(n);
@@ -6574,14 +6573,13 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     }
 
     if (nvme_init_subsys(n, errp)) {
-        error_propagate(errp, local_err);
         return;
     }
     nvme_init_ctrl(n, pci_dev);
 
     /* setup a namespace if the controller drive property was given */
-    if (n->namespace.blkconf.blk) {
-        NvmeNamespaceDevice *nsdev = &n->namespace;
+    if (ctrl->namespace.blkconf.blk) {
+        NvmeNamespaceDevice *nsdev = &ctrl->namespace;
         NvmeNamespace *ns = &nsdev->ns;
         ns->nsid = 1;
 
@@ -6593,7 +6591,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 
 static void nvme_exit(PCIDevice *pci_dev)
 {
-    NvmeCtrl *n = NVME(pci_dev);
+    NvmeState *n = NVME_STATE(pci_dev);
     NvmeNamespace *ns;
     int i;
 
@@ -6625,33 +6623,37 @@ static void nvme_exit(PCIDevice *pci_dev)
     memory_region_del_subregion(&n->bar0, &n->iomem);
 }
 
+static Property nvme_state_props[] = {
+    DEFINE_PROP_LINK("pmrdev", NvmeState, pmr.dev, TYPE_MEMORY_BACKEND,
+                     HostMemoryBackend *),
+    DEFINE_PROP_LINK("subsys", NvmeState, subsys, TYPE_NVME_SUBSYS,
+                     NvmeSubsystem *),
+    DEFINE_PROP_STRING("serial", NvmeState, params.serial),
+    DEFINE_PROP_UINT32("cmb_size_mb", NvmeState, params.cmb_size_mb, 0),
+    DEFINE_PROP_UINT32("num_queues", NvmeState, params.num_queues, 0),
+    DEFINE_PROP_UINT32("max_ioqpairs", NvmeState, params.max_ioqpairs, 64),
+    DEFINE_PROP_UINT16("msix_qsize", NvmeState, params.msix_qsize, 65),
+    DEFINE_PROP_UINT8("aerl", NvmeState, params.aerl, 3),
+    DEFINE_PROP_UINT32("aer_max_queued", NvmeState, params.aer_max_queued, 64),
+    DEFINE_PROP_UINT8("mdts", NvmeState, params.mdts, 7),
+    DEFINE_PROP_UINT8("vsl", NvmeState, params.vsl, 7),
+    DEFINE_PROP_BOOL("use-intel-id", NvmeState, params.use_intel_id, false),
+    DEFINE_PROP_BOOL("legacy-cmb", NvmeState, params.legacy_cmb, false),
+    DEFINE_PROP_UINT8("zoned.zasl", NvmeState, params.zasl, 0),
+    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeState,
+                     params.auto_transition_zones, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static Property nvme_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeCtrl, namespace.blkconf),
-    DEFINE_PROP_LINK("pmrdev", NvmeCtrl, pmr.dev, TYPE_MEMORY_BACKEND,
-                     HostMemoryBackend *),
-    DEFINE_PROP_LINK("subsys", NvmeCtrl, subsys, TYPE_NVME_SUBSYS,
-                     NvmeSubsystem *),
-    DEFINE_PROP_STRING("serial", NvmeCtrl, params.serial),
-    DEFINE_PROP_UINT32("cmb_size_mb", NvmeCtrl, params.cmb_size_mb, 0),
-    DEFINE_PROP_UINT32("num_queues", NvmeCtrl, params.num_queues, 0),
-    DEFINE_PROP_UINT32("max_ioqpairs", NvmeCtrl, params.max_ioqpairs, 64),
-    DEFINE_PROP_UINT16("msix_qsize", NvmeCtrl, params.msix_qsize, 65),
-    DEFINE_PROP_UINT8("aerl", NvmeCtrl, params.aerl, 3),
-    DEFINE_PROP_UINT32("aer_max_queued", NvmeCtrl, params.aer_max_queued, 64),
-    DEFINE_PROP_UINT8("mdts", NvmeCtrl, params.mdts, 7),
-    DEFINE_PROP_UINT8("vsl", NvmeCtrl, params.vsl, 7),
-    DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
-    DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
-    DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
-    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
-                     params.auto_transition_zones, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
 static void nvme_get_smart_warning(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
-    NvmeCtrl *n = NVME(obj);
+    NvmeState *n = NVME_STATE(obj);
     uint8_t value = n->smart_critical_warning;
 
     visit_type_uint8(v, name, &value, errp);
@@ -6660,7 +6662,7 @@ static void nvme_get_smart_warning(Object *obj, Visitor *v, const char *name,
 static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
-    NvmeCtrl *n = NVME(obj);
+    NvmeState *n = NVME_STATE(obj);
     uint8_t value, old_value, cap = 0, index, event;
 
     if (!visit_type_uint8(v, name, &value, errp)) {
@@ -6695,7 +6697,7 @@ static const VMStateDescription nvme_vmstate = {
     .unmigratable = 1,
 };
 
-static void nvme_class_init(ObjectClass *oc, void *data)
+static void nvme_state_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
@@ -6707,35 +6709,54 @@ static void nvme_class_init(ObjectClass *oc, void *data)
 
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->desc = "Non-Volatile Memory Express";
-    device_class_set_props(dc, nvme_props);
+    device_class_set_props(dc, nvme_state_props);
     dc->vmsd = &nvme_vmstate;
 }
 
-static void nvme_instance_init(Object *obj)
+static void nvme_state_instance_init(Object *obj)
 {
-    NvmeCtrl *n = NVME(obj);
-
-    device_add_bootindex_property(obj, &n->namespace.blkconf.bootindex,
-                                  "bootindex", "/namespace@1,0",
-                                  DEVICE(obj));
-
     object_property_add(obj, "smart_critical_warning", "uint8",
                         nvme_get_smart_warning,
                         nvme_set_smart_warning, NULL, NULL);
 }
 
-static const TypeInfo nvme_info = {
-    .name          = TYPE_NVME,
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(NvmeCtrl),
-    .instance_init = nvme_instance_init,
-    .class_init    = nvme_class_init,
+static const TypeInfo nvme_state_info = {
+    .name = TYPE_NVME_STATE,
+    .parent = TYPE_PCI_DEVICE,
+    .abstract = true,
+    .class_init = nvme_state_class_init,
+    .instance_size = sizeof(NvmeState),
+    .instance_init = nvme_state_instance_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_PCIE_DEVICE },
-        { }
+        { },
     },
 };
 
+static void nvme_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    device_class_set_props(dc, nvme_props);
+}
+
+static void nvme_instance_init(Object *obj)
+{
+    NvmeCtrl *ctrl = NVME_DEVICE(obj);
+
+    device_add_bootindex_property(obj, &ctrl->namespace.blkconf.bootindex,
+                                  "bootindex", "/namespace@1,0",
+                                  DEVICE(obj));
+}
+
+static const TypeInfo nvme_info = {
+    .name = TYPE_NVME_DEVICE,
+    .parent = TYPE_NVME_STATE,
+    .class_init = nvme_class_init,
+    .instance_size = sizeof(NvmeCtrl),
+    .instance_init = nvme_instance_init,
+    .class_init = nvme_class_init,
+};
+
 static const TypeInfo nvme_bus_info = {
     .name = TYPE_NVME_BUS,
     .parent = TYPE_BUS,
@@ -6744,6 +6765,7 @@ static const TypeInfo nvme_bus_info = {
 
 static void nvme_register_types(void)
 {
+    type_register_static(&nvme_state_info);
     type_register_static(&nvme_info);
     type_register_static(&nvme_bus_info);
 }
diff --git a/hw/nvme/dif.c b/hw/nvme/dif.c
index 1b8f9ba2fb44..8ad517232c1d 100644
--- a/hw/nvme/dif.c
+++ b/hw/nvme/dif.c
@@ -248,7 +248,7 @@ static void nvme_dif_rw_check_cb(void *opaque, int ret)
     NvmeRequest *req = ctx->req;
     NvmeNamespace *ns = req->ns;
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
-    NvmeCtrl *n = nvme_ctrl(req);
+    NvmeState *n = nvme_state(req);
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     uint64_t slba = le64_to_cpu(rw->slba);
     uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
@@ -357,7 +357,7 @@ out:
     nvme_dif_rw_cb(ctx, ret);
 }
 
-uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
+uint16_t nvme_dif_rw(NvmeState *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
diff --git a/hw/nvme/dif.h b/hw/nvme/dif.h
index 7d47299252ae..53a22bc7c78e 100644
--- a/hw/nvme/dif.h
+++ b/hw/nvme/dif.h
@@ -48,6 +48,6 @@ uint16_t nvme_dif_check(NvmeNamespaceNvm *nvm, uint8_t *buf, size_t len,
                         uint8_t *mbuf, size_t mlen, uint8_t prinfo,
                         uint64_t slba, uint16_t apptag,
                         uint16_t appmask, uint32_t *reftag);
-uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req);
+uint16_t nvme_dif_rw(NvmeState *n, NvmeRequest *req);
 
 #endif /* HW_NVME_DIF_H */
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index b411b184c253..bdd41a3d1fc3 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -493,7 +493,7 @@ static void nvme_nsdev_realize(DeviceState *dev, Error **errp)
     NvmeNamespaceDevice *nsdev = NVME_NAMESPACE_DEVICE(dev);
     NvmeNamespace *ns = &nsdev->ns;
     BusState *s = qdev_get_parent_bus(dev);
-    NvmeCtrl *n = NVME(s->parent);
+    NvmeState *n = NVME_STATE(s->parent);
     NvmeSubsystem *subsys = n->subsys;
     uint32_t nsid = nsdev->params.nsid;
     int i;
@@ -558,7 +558,7 @@ static void nvme_nsdev_realize(DeviceState *dev, Error **errp)
 
         if (nsdev->params.shared) {
             for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
-                NvmeCtrl *ctrl = subsys->ctrls[i];
+                NvmeState *ctrl = subsys->ctrls[i];
 
                 if (ctrl) {
                     nvme_attach_ns(ctrl, ns);
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 4ae4b4e5ffe1..980a471e195f 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -30,9 +30,14 @@
 
 QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_NSID_BROADCAST - 1);
 
-typedef struct NvmeCtrl NvmeCtrl;
 typedef struct NvmeNamespace NvmeNamespace;
 
+#define TYPE_NVME_STATE "nvme-state"
+OBJECT_DECLARE_SIMPLE_TYPE(NvmeState, NVME_STATE)
+
+#define TYPE_NVME_DEVICE "nvme"
+OBJECT_DECLARE_SIMPLE_TYPE(NvmeCtrl, NVME_DEVICE)
+
 #define TYPE_NVME_BUS "nvme-bus"
 OBJECT_DECLARE_SIMPLE_TYPE(NvmeBus, NVME_BUS)
 
@@ -49,7 +54,7 @@ typedef struct NvmeSubsystem {
     NvmeBus     bus;
     uint8_t     subnqn[256];
 
-    NvmeCtrl      *ctrls[NVME_MAX_CONTROLLERS];
+    NvmeState     *ctrls[NVME_MAX_CONTROLLERS];
     NvmeNamespace *namespaces[NVME_MAX_NAMESPACES + 1];
 
     struct {
@@ -57,11 +62,11 @@ typedef struct NvmeSubsystem {
     } params;
 } NvmeSubsystem;
 
-int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
-void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeCtrl *n);
+int nvme_subsys_register_ctrl(NvmeState *n, Error **errp);
+void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeState *n);
 
-static inline NvmeCtrl *nvme_subsys_ctrl(NvmeSubsystem *subsys,
-                                         uint32_t cntlid)
+static inline NvmeState *nvme_subsys_ctrl(NvmeSubsystem *subsys,
+                                          uint32_t cntlid)
 {
     if (!subsys || cntlid >= NVME_MAX_CONTROLLERS) {
         return NULL;
@@ -338,7 +343,7 @@ static inline const char *nvme_io_opc_str(uint8_t opc)
 }
 
 typedef struct NvmeSQueue {
-    struct NvmeCtrl *ctrl;
+    NvmeState   *ctrl;
     uint16_t    sqid;
     uint16_t    cqid;
     uint32_t    head;
@@ -353,7 +358,7 @@ typedef struct NvmeSQueue {
 } NvmeSQueue;
 
 typedef struct NvmeCQueue {
-    struct NvmeCtrl *ctrl;
+    NvmeState   *ctrl;
     uint8_t     phase;
     uint16_t    cqid;
     uint16_t    irq_enabled;
@@ -367,10 +372,6 @@ typedef struct NvmeCQueue {
     QTAILQ_HEAD(, NvmeRequest) req_list;
 } NvmeCQueue;
 
-#define TYPE_NVME "nvme"
-#define NVME(obj) \
-        OBJECT_CHECK(NvmeCtrl, (obj), TYPE_NVME)
-
 typedef struct NvmeParams {
     char     *serial;
     uint32_t num_queues; /* deprecated since 5.1 */
@@ -387,13 +388,12 @@ typedef struct NvmeParams {
     bool     legacy_cmb;
 } NvmeParams;
 
-typedef struct NvmeCtrl {
+typedef struct NvmeState {
     PCIDevice    parent_obj;
     MemoryRegion bar0;
     MemoryRegion iomem;
     NvmeBar      bar;
     NvmeParams   params;
-    NvmeBus      bus;
 
     uint16_t    cntlid;
     bool        qs_created;
@@ -439,7 +439,6 @@ typedef struct NvmeCtrl {
 
     NvmeSubsystem   *subsys;
 
-    NvmeNamespaceDevice namespace;
     NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES + 1];
     NvmeSQueue      **sq;
     NvmeCQueue      **cq;
@@ -454,9 +453,18 @@ typedef struct NvmeCtrl {
         };
         uint32_t    async_config;
     } features;
+} NvmeState;
+
+typedef struct NvmeCtrl {
+    NvmeState parent_obj;
+
+    NvmeBus bus;
+
+    /* for use with legacy single namespace (-device nvme,drive=...) setups */
+    NvmeNamespaceDevice namespace;
 } NvmeCtrl;
 
-static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
+static inline NvmeNamespace *nvme_ns(NvmeState *n, uint32_t nsid)
 {
     if (!nsid || nsid > NVME_MAX_NAMESPACES) {
         return NULL;
@@ -468,12 +476,12 @@ static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
 static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
 {
     NvmeSQueue *sq = req->sq;
-    NvmeCtrl *n = sq->ctrl;
+    NvmeState *n = sq->ctrl;
 
     return n->cq[sq->cqid];
 }
 
-static inline NvmeCtrl *nvme_ctrl(NvmeRequest *req)
+static inline NvmeState *nvme_state(NvmeRequest *req)
 {
     NvmeSQueue *sq = req->sq;
     return sq->ctrl;
@@ -488,13 +496,13 @@ static inline uint16_t nvme_cid(NvmeRequest *req)
     return le16_to_cpu(req->cqe.cid);
 }
 
-void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
-uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+void nvme_attach_ns(NvmeState *n, NvmeNamespace *ns);
+uint16_t nvme_bounce_data(NvmeState *n, uint8_t *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req);
-uint16_t nvme_bounce_mdata(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+uint16_t nvme_bounce_mdata(NvmeState *n, uint8_t *ptr, uint32_t len,
                            NvmeTxDirection dir, NvmeRequest *req);
 void nvme_rw_complete_cb(void *opaque, int ret);
-uint16_t nvme_map_dptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
+uint16_t nvme_map_dptr(NvmeState *n, NvmeSg *sg, size_t len,
                        NvmeCmd *cmd);
 
 #endif /* HW_NVME_INTERNAL_H */
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 93c35950d69d..2442ae83b744 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -11,7 +11,7 @@
 
 #include "nvme.h"
 
-int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
+int nvme_subsys_register_ctrl(NvmeState *n, Error **errp)
 {
     NvmeSubsystem *subsys = n->subsys;
     int cntlid;
@@ -32,7 +32,7 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
     return cntlid;
 }
 
-void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeCtrl *n)
+void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeState *n)
 {
     subsys->ctrls[n->cntlid] = NULL;
 }
-- 
2.33.0


