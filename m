Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A200B649DEF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 12:33:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4h31-0000WO-08; Mon, 12 Dec 2022 06:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4h2m-0000VQ-MI; Mon, 12 Dec 2022 06:32:25 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4h2k-0000KB-FL; Mon, 12 Dec 2022 06:32:24 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id ABA945C0082;
 Mon, 12 Dec 2022 06:32:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 12 Dec 2022 06:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1670844741; x=
 1670931141; bh=oa/gM116xDbWZ1Ao4T7XNAdlSC9fmaj8i8z7O8Wx7mk=; b=V
 HdF6YA3F90c2A0JgLocrk81y8vUMYfD7wI/e3u5UvQF0t0C85Vf6hUrehsyHbrbz
 fG8ODSiapyMKxvQqf4dhL0jZrcgIyboUlEx6HVE8v3KUq59bO6acL1+eNF39cWXj
 6+Xx8kohrlwu4rFZZORYf37zIKvyDTmeUfq/JzaOGHRsl7yxpp9uwUwF/tw8PsuC
 PA5s2a+LfcI9aRM7EA4KDYSxdOF+OJfSLXqGneuM/c+rShlBr/RkM+bEZyzeA5Lt
 GNczx+BaIECjf66/mksa2RVZz/wwjstNeOH0KCtDky4eOcmtb00mJXNc04OTGnFo
 Q+XqD/XwAP/lBLI1MXZCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670844741; x=
 1670931141; bh=oa/gM116xDbWZ1Ao4T7XNAdlSC9fmaj8i8z7O8Wx7mk=; b=O
 FbCcTP1MLjPU3290f5yL8/NqrklzJPyXdBEK1DN+8IIjaAobKYyyjdSg3fnYc+YP
 kZ5wSCU4wcvnJdCKPx0ctp+itbyZ0cSFcINf8SP6e5HSylQNa0fuQctvtROhaCX5
 kHz3tBz/nNbya54gitwufUOR212eeD2YtsPoNYfdM4M9Pp2Q2vbLtH62YqksEtBE
 Tn2jhaLWUUKBdgI+IyhqkQ6V9fIefY/jGaT9d56sWDvnpXZYiJH9Db1oXyjgmcNg
 kkGbUtcpeVyb8AZZJQNIZytXjVnRRaXQTYroIb3GI8+8j5OB9Apk+qcIyxLQvstE
 9XBSiNainCXJ2+evsKIxw==
X-ME-Sender: <xms:RRGXY2KlzkYTy9sxhycsuT0dn-V2aHfdZ_360BAD1jZGvKt7hVFJng>
 <xme:RRGXY-KS4IjURPXXbMUz9Xdko1xgc76qKGWTZt98mMCRl2fB0J_Wcvl532FFPsav5
 j4erhQ56kJoNUOGm2Q>
X-ME-Received: <xmr:RRGXY2vuTWc6lYC9iqbPCXGOvNwQx4J0_qbhiZs8CaS3wc_orZP8mETHNGiKtqsw8eMR7c9KIQ52ksXT9MFqp_lwJ3kOV-desGEcdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeeijeejvdeitdegheeiveeugffhgfejhfdvtdeludeftddvtdfhhfeileek
 ueelnecuffhomhgrihhnpehquggvvhdrihgunecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:RRGXY7YR6tmBlve3PGOh2dpPkz-DiO0S-pYlk9I4tg-F5WUi7ELjmA>
 <xmx:RRGXY9bSnnjRTeQGrPI2JpG7LieMnFgMCTwyDkert8C6XYxVm6OZ8g>
 <xmx:RRGXY3ClOn_R-U-nYAxopbcLN5tU5FbEb5RwFBuag1gNjf3Q0vPE3w>
 <xmx:RRGXYyMnmPNQftYcZ1VU_B2vqE15jom4CG7O1O0NUwAg0vtUkSjZPw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Dec 2022 06:32:19 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Klaus Jensen <its@irrelevant.dk>,
 Guenter Roeck <linux@roeck-us.net>, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 1/4] hw/nvme: use QOM accessors
Date: Mon, 12 Dec 2022 12:32:12 +0100
Message-Id: <20221212113215.33135-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212113215.33135-1-its@irrelevant.dk>
References: <20221212113215.33135-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=14730; i=k.jensen@samsung.com;
 h=from:subject; bh=UZobSTYj1I9QyUOqHFfLSvRkdW+crCTvRo9kkJ9fHBE=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGOXET6sP0zHgsW4rYZw2lBjYuITSYidcqpGQlfu
 Ji/3tZqTkokBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjlxE+AAoJEE3hrzFtTw3pyq
 UH/iKUrzjTjzgq2pAHlmmcoRt2RJBTkJwnVlgnOZaGjR/nKoG3HZavRjyNyNvfVF9PNYTQ7dzD8Xil
 /Bwu7ubmMrYYuYkPNa+KIW5IQufKwB9TdlftKJe9x/ALQPWkuBMwOuk0F572ijcHIDoyf4dO6mFNyu
 9I00djZ7jKT6hCFX237eIMY+CJF2vl/V5FymfgPZRnsnjZW83e3bZniQw7lQ8r02AQMNLOjjImFMWf
 cK5b2hlBQpQBjA72NTGaOh2EgFYcASo7eTTujs5f/nsug0JnzRVZZYng9ojnuSAj3+bcLYwM6iwBmc
 mq1m7VkJn15KrdNGSk8cq8m7bRrSXJxUYiF6o6
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Replace various ->parent_obj use with the equivalent QOM accessors.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 89 +++++++++++++++++++++++++++-----------------------
 1 file changed, 48 insertions(+), 41 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index e54276dc1dc7..6b70c1e39831 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -449,7 +449,7 @@ static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
         return 0;
     }
 
-    return pci_dma_read(&n->parent_obj, addr, buf, size);
+    return pci_dma_read(PCI_DEVICE(n), addr, buf, size);
 }
 
 static int nvme_addr_write(NvmeCtrl *n, hwaddr addr, const void *buf, int size)
@@ -469,7 +469,7 @@ static int nvme_addr_write(NvmeCtrl *n, hwaddr addr, const void *buf, int size)
         return 0;
     }
 
-    return pci_dma_write(&n->parent_obj, addr, buf, size);
+    return pci_dma_write(PCI_DEVICE(n), addr, buf, size);
 }
 
 static bool nvme_nsid_valid(NvmeCtrl *n, uint32_t nsid)
@@ -514,24 +514,27 @@ static uint8_t nvme_sq_empty(NvmeSQueue *sq)
 
 static void nvme_irq_check(NvmeCtrl *n)
 {
+    PCIDevice *pci = PCI_DEVICE(n);
     uint32_t intms = ldl_le_p(&n->bar.intms);
 
-    if (msix_enabled(&(n->parent_obj))) {
+    if (msix_enabled(pci)) {
         return;
     }
     if (~intms & n->irq_status) {
-        pci_irq_assert(&n->parent_obj);
+        pci_irq_assert(pci);
     } else {
-        pci_irq_deassert(&n->parent_obj);
+        pci_irq_deassert(pci);
     }
 }
 
 static void nvme_irq_assert(NvmeCtrl *n, NvmeCQueue *cq)
 {
+    PCIDevice *pci = PCI_DEVICE(n);
+
     if (cq->irq_enabled) {
-        if (msix_enabled(&(n->parent_obj))) {
+        if (msix_enabled(pci)) {
             trace_pci_nvme_irq_msix(cq->vector);
-            msix_notify(&(n->parent_obj), cq->vector);
+            msix_notify(pci, cq->vector);
         } else {
             trace_pci_nvme_irq_pin();
             assert(cq->vector < 32);
@@ -546,7 +549,7 @@ static void nvme_irq_assert(NvmeCtrl *n, NvmeCQueue *cq)
 static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue *cq)
 {
     if (cq->irq_enabled) {
-        if (msix_enabled(&(n->parent_obj))) {
+        if (msix_enabled(PCI_DEVICE(n))) {
             return;
         } else {
             assert(cq->vector < 32);
@@ -570,7 +573,7 @@ static void nvme_req_clear(NvmeRequest *req)
 static inline void nvme_sg_init(NvmeCtrl *n, NvmeSg *sg, bool dma)
 {
     if (dma) {
-        pci_dma_sglist_init(&sg->qsg, &n->parent_obj, 0);
+        pci_dma_sglist_init(&sg->qsg, PCI_DEVICE(n), 0);
         sg->flags = NVME_SG_DMA;
     } else {
         qemu_iovec_init(&sg->iov, 0);
@@ -1333,7 +1336,7 @@ static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
 
 static void nvme_update_cq_head(NvmeCQueue *cq)
 {
-    pci_dma_read(&cq->ctrl->parent_obj, cq->db_addr, &cq->head,
+    pci_dma_read(PCI_DEVICE(cq->ctrl), cq->db_addr, &cq->head,
             sizeof(cq->head));
     trace_pci_nvme_shadow_doorbell_cq(cq->cqid, cq->head);
 }
@@ -1363,7 +1366,7 @@ static void nvme_post_cqes(void *opaque)
         req->cqe.sq_id = cpu_to_le16(sq->sqid);
         req->cqe.sq_head = cpu_to_le16(sq->head);
         addr = cq->dma_addr + cq->tail * n->cqe_size;
-        ret = pci_dma_write(&n->parent_obj, addr, (void *)&req->cqe,
+        ret = pci_dma_write(PCI_DEVICE(n), addr, (void *)&req->cqe,
                             sizeof(req->cqe));
         if (ret) {
             trace_pci_nvme_err_addr_write(addr);
@@ -4615,6 +4618,7 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 
 static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
 {
+    PCIDevice *pci = PCI_DEVICE(n);
     uint16_t offset = (cq->cqid << 3) + (1 << 2);
 
     n->cq[cq->cqid] = NULL;
@@ -4625,8 +4629,8 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
         event_notifier_set_handler(&cq->notifier, NULL);
         event_notifier_cleanup(&cq->notifier);
     }
-    if (msix_enabled(&n->parent_obj)) {
-        msix_vector_unuse(&n->parent_obj, cq->vector);
+    if (msix_enabled(pci)) {
+        msix_vector_unuse(pci, cq->vector);
     }
     if (cq->cqid) {
         g_free(cq);
@@ -4664,8 +4668,10 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
                          uint16_t cqid, uint16_t vector, uint16_t size,
                          uint16_t irq_enabled)
 {
-    if (msix_enabled(&n->parent_obj)) {
-        msix_vector_use(&n->parent_obj, vector);
+    PCIDevice *pci = PCI_DEVICE(n);
+
+    if (msix_enabled(pci)) {
+        msix_vector_use(pci, vector);
     }
     cq->ctrl = n;
     cq->cqid = cqid;
@@ -4716,7 +4722,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
         trace_pci_nvme_err_invalid_create_cq_addr(prp1);
         return NVME_INVALID_PRP_OFFSET | NVME_DNR;
     }
-    if (unlikely(!msix_enabled(&n->parent_obj) && vector)) {
+    if (unlikely(!msix_enabled(PCI_DEVICE(n)) && vector)) {
         trace_pci_nvme_err_invalid_create_cq_vector(vector);
         return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
     }
@@ -5959,6 +5965,7 @@ static uint16_t nvme_assign_virt_res_to_sec(NvmeCtrl *n, NvmeRequest *req,
 
 static uint16_t nvme_virt_set_state(NvmeCtrl *n, uint16_t cntlid, bool online)
 {
+    PCIDevice *pci = PCI_DEVICE(n);
     NvmeCtrl *sn = NULL;
     NvmeSecCtrlEntry *sctrl;
     int vf_index;
@@ -5968,9 +5975,9 @@ static uint16_t nvme_virt_set_state(NvmeCtrl *n, uint16_t cntlid, bool online)
         return NVME_INVALID_CTRL_ID | NVME_DNR;
     }
 
-    if (!pci_is_vf(&n->parent_obj)) {
+    if (!pci_is_vf(pci)) {
         vf_index = le16_to_cpu(sctrl->vfn) - 1;
-        sn = NVME(pcie_sriov_get_vf_at_index(&n->parent_obj, vf_index));
+        sn = NVME(pcie_sriov_get_vf_at_index(pci, vf_index));
     }
 
     if (online) {
@@ -6028,6 +6035,7 @@ static uint16_t nvme_virt_mngmt(NvmeCtrl *n, NvmeRequest *req)
 
 static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
 {
+    PCIDevice *pci = PCI_DEVICE(n);
     uint64_t dbs_addr = le64_to_cpu(req->cmd.dptr.prp1);
     uint64_t eis_addr = le64_to_cpu(req->cmd.dptr.prp2);
     int i;
@@ -6054,8 +6062,7 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
              */
             sq->db_addr = dbs_addr + (i << 3);
             sq->ei_addr = eis_addr + (i << 3);
-            pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
-                    sizeof(sq->tail));
+            pci_dma_write(pci, sq->db_addr, &sq->tail, sizeof(sq->tail));
 
             if (n->params.ioeventfd && sq->sqid != 0) {
                 if (!nvme_init_sq_ioeventfd(sq)) {
@@ -6068,8 +6075,7 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
             /* CAP.DSTRD is 0, so offset of ith cq db_addr is (i<<3)+(1<<2) */
             cq->db_addr = dbs_addr + (i << 3) + (1 << 2);
             cq->ei_addr = eis_addr + (i << 3) + (1 << 2);
-            pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
-                    sizeof(cq->head));
+            pci_dma_write(pci, cq->db_addr, &cq->head, sizeof(cq->head));
 
             if (n->params.ioeventfd && cq->cqid != 0) {
                 if (!nvme_init_cq_ioeventfd(cq)) {
@@ -6141,14 +6147,14 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 
 static void nvme_update_sq_eventidx(const NvmeSQueue *sq)
 {
-    pci_dma_write(&sq->ctrl->parent_obj, sq->ei_addr, &sq->tail,
+    pci_dma_write(PCI_DEVICE(sq->ctrl), sq->ei_addr, &sq->tail,
                   sizeof(sq->tail));
     trace_pci_nvme_eventidx_sq(sq->sqid, sq->tail);
 }
 
 static void nvme_update_sq_tail(NvmeSQueue *sq)
 {
-    pci_dma_read(&sq->ctrl->parent_obj, sq->db_addr, &sq->tail,
+    pci_dma_read(PCI_DEVICE(sq->ctrl), sq->db_addr, &sq->tail,
                  sizeof(sq->tail));
     trace_pci_nvme_shadow_doorbell_sq(sq->sqid, sq->tail);
 }
@@ -6216,7 +6222,7 @@ static void nvme_update_msixcap_ts(PCIDevice *pci_dev, uint32_t table_size)
 
 static void nvme_activate_virt_res(NvmeCtrl *n)
 {
-    PCIDevice *pci_dev = &n->parent_obj;
+    PCIDevice *pci_dev = PCI_DEVICE(n);
     NvmePriCtrlCap *cap = &n->pri_ctrl_cap;
     NvmeSecCtrlEntry *sctrl;
 
@@ -6239,7 +6245,7 @@ static void nvme_activate_virt_res(NvmeCtrl *n)
 
 static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
 {
-    PCIDevice *pci_dev = &n->parent_obj;
+    PCIDevice *pci_dev = PCI_DEVICE(n);
     NvmeSecCtrlEntry *sctrl;
     NvmeNamespace *ns;
     int i;
@@ -6356,7 +6362,7 @@ static int nvme_start_ctrl(NvmeCtrl *n)
     uint32_t page_size = 1 << page_bits;
     NvmeSecCtrlEntry *sctrl = nvme_sctrl(n);
 
-    if (pci_is_vf(&n->parent_obj) && !sctrl->scs) {
+    if (pci_is_vf(PCI_DEVICE(n)) && !sctrl->scs) {
         trace_pci_nvme_err_startfail_virt_state(le16_to_cpu(sctrl->nvi),
                                                 le16_to_cpu(sctrl->nvq),
                                                 sctrl->scs ? "ONLINE" :
@@ -6471,6 +6477,7 @@ static void nvme_cmb_enable_regs(NvmeCtrl *n)
 static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
                            unsigned size)
 {
+    PCIDevice *pci = PCI_DEVICE(n);
     uint64_t cap = ldq_le_p(&n->bar.cap);
     uint32_t cc = ldl_le_p(&n->bar.cc);
     uint32_t intms = ldl_le_p(&n->bar.intms);
@@ -6494,7 +6501,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
 
     switch (offset) {
     case NVME_REG_INTMS:
-        if (unlikely(msix_enabled(&(n->parent_obj)))) {
+        if (unlikely(msix_enabled(pci))) {
             NVME_GUEST_ERR(pci_nvme_ub_mmiowr_intmask_with_msix,
                            "undefined access to interrupt mask set"
                            " when MSI-X is enabled");
@@ -6507,7 +6514,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         nvme_irq_check(n);
         break;
     case NVME_REG_INTMC:
-        if (unlikely(msix_enabled(&(n->parent_obj)))) {
+        if (unlikely(msix_enabled(pci))) {
             NVME_GUEST_ERR(pci_nvme_ub_mmiowr_intmask_with_msix,
                            "undefined access to interrupt mask clr"
                            " when MSI-X is enabled");
@@ -6732,7 +6739,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
         return 0;
     }
 
-    if (pci_is_vf(&n->parent_obj) && !nvme_sctrl(n)->scs &&
+    if (pci_is_vf(PCI_DEVICE(n)) && !nvme_sctrl(n)->scs &&
         addr != NVME_REG_CSTS) {
         trace_pci_nvme_err_ignored_mmio_vf_offline(addr, size);
         return 0;
@@ -6753,6 +6760,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
 
 static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
 {
+    PCIDevice *pci = PCI_DEVICE(n);
     uint32_t qid;
 
     if (unlikely(addr & ((1 << 2) - 1))) {
@@ -6820,8 +6828,7 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
         start_sqs = nvme_cq_full(cq) ? 1 : 0;
         cq->head = new_head;
         if (!qid && n->dbbuf_enabled) {
-            pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
-                          sizeof(cq->head));
+            pci_dma_write(pci, cq->db_addr, &cq->head, sizeof(cq->head));
         }
         if (start_sqs) {
             NvmeSQueue *sq;
@@ -6894,8 +6901,7 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
              * including ones that run on Linux, are not updating Admin Queues,
              * so we can't trust reading it for an appropriate sq tail.
              */
-            pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
-                          sizeof(sq->tail));
+            pci_dma_write(pci, sq->db_addr, &sq->tail, sizeof(sq->tail));
         }
 
         qemu_bh_schedule(sq->bh);
@@ -6909,7 +6915,7 @@ static void nvme_mmio_write(void *opaque, hwaddr addr, uint64_t data,
 
     trace_pci_nvme_mmio_write(addr, data, size);
 
-    if (pci_is_vf(&n->parent_obj) && !nvme_sctrl(n)->scs &&
+    if (pci_is_vf(PCI_DEVICE(n)) && !nvme_sctrl(n)->scs &&
         addr != NVME_REG_CSTS) {
         trace_pci_nvme_err_ignored_mmio_vf_offline(addr, size);
         return;
@@ -7093,10 +7099,11 @@ static void nvme_init_state(NvmeCtrl *n)
     NvmePriCtrlCap *cap = &n->pri_ctrl_cap;
     NvmeSecCtrlList *list = &n->sec_ctrl_list;
     NvmeSecCtrlEntry *sctrl;
+    PCIDevice *pci = PCI_DEVICE(n);
     uint8_t max_vfs;
     int i;
 
-    if (pci_is_vf(&n->parent_obj)) {
+    if (pci_is_vf(pci)) {
         sctrl = nvme_sctrl(n);
         max_vfs = 0;
         n->conf_ioqpairs = sctrl->nvq ? le16_to_cpu(sctrl->nvq) - 1 : 0;
@@ -7125,7 +7132,7 @@ static void nvme_init_state(NvmeCtrl *n)
     cap->cntlid = cpu_to_le16(n->cntlid);
     cap->crt = NVME_CRT_VQ | NVME_CRT_VI;
 
-    if (pci_is_vf(&n->parent_obj)) {
+    if (pci_is_vf(pci)) {
         cap->vqprt = cpu_to_le16(1 + n->conf_ioqpairs);
     } else {
         cap->vqprt = cpu_to_le16(1 + n->params.max_ioqpairs -
@@ -7138,7 +7145,7 @@ static void nvme_init_state(NvmeCtrl *n)
                         cap->vqfrt / MAX(max_vfs, 1);
     }
 
-    if (pci_is_vf(&n->parent_obj)) {
+    if (pci_is_vf(pci)) {
         cap->viprt = cpu_to_le16(n->conf_msix_qsize);
     } else {
         cap->viprt = cpu_to_le16(n->params.msix_qsize -
@@ -7445,7 +7452,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     stl_le_p(&n->bar.vs, NVME_SPEC_VER);
     n->bar.intmc = n->bar.intms = 0;
 
-    if (pci_is_vf(&n->parent_obj) && !sctrl->scs) {
+    if (pci_is_vf(pci_dev) && !sctrl->scs) {
         stl_le_p(&n->bar.csts, NVME_CSTS_FAILED);
     }
 }
@@ -7483,6 +7490,7 @@ void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns)
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
     NvmeCtrl *n = NVME(pci_dev);
+    DeviceState *dev = DEVICE(pci_dev);
     NvmeNamespace *ns;
     Error *local_err = NULL;
     NvmeCtrl *pn = NVME(pcie_sriov_get_pf(pci_dev));
@@ -7502,8 +7510,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         return;
     }
 
-    qbus_init(&n->bus, sizeof(NvmeBus), TYPE_NVME_BUS,
-              &pci_dev->qdev, n->parent_obj.qdev.id);
+    qbus_init(&n->bus, sizeof(NvmeBus), TYPE_NVME_BUS, dev, dev->id);
 
     if (nvme_init_subsys(n, errp)) {
         error_propagate(errp, local_err);
-- 
2.38.1


