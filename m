Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D838575DC9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 10:49:03 +0200 (CEST)
Received: from localhost ([::1]:49248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCH0Q-0006js-KI
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 04:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oCGvP-0000XU-H5; Fri, 15 Jul 2022 04:43:51 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:43247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oCGvM-0004JZ-JN; Fri, 15 Jul 2022 04:43:51 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id D713B5C013A;
 Fri, 15 Jul 2022 04:43:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 15 Jul 2022 04:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1657874627; x=
 1657961027; bh=wrwoJdUXOlo/1LLUc5sdWNIyOZu1kw7IocOw7UGXdzQ=; b=m
 kMLtn6bgLoQ6oefAR/s8Yvi6nVG7zQP8ALGs812e4Pt1mmFHO8XAqrqhmH4/u/3U
 j96AyCSeF4ij02d47twma+xBZ2Quf1808pFCQri7FcTpVkDBTgM32l4WIcGby8vX
 k+djRbCSyXpOBd2haiBjUf6cs30W/97MuOX8ICXyExX3w+lN394MTTPpuYad1Z75
 HRvpJCp1jbhFKyCorc/2BZAOBNuq2elstczSHjDfhL+1pSQuU8bwOxGGoq6iBV/Y
 w7RiLo4GskaoilJ33LIPxthSXAdcQYcG5aZl68pyf8Jq5+/qKqm7jw6OZP9bgpcZ
 yDRUPEVjwTtKuFMJeIrbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657874627; x=1657961027; bh=wrwoJdUXOlo/1
 LLUc5sdWNIyOZu1kw7IocOw7UGXdzQ=; b=RgHyEtvPBXK2gbYQc14vUpM6dmkOR
 0DWoB6K+jr4ns9EmvQ7ksOEeZw8L3N6NWIc6L4m873go22jKFzGEBZ+CbfBRaDDo
 qzHdDWKvXI/K9B9h1Xt5f3L3N7PYibuhpPPVWMudJ8wdDU2prJFJKzfWPSykUaRU
 fPYdCEdSPFwK3iCRf17YoyCke3NfFOntE/Cw4QtIgPbVCmLE2jti23GM4NGHhvRy
 ohY53Xh69YAJy/A0lny2MFMQzklIkJe/xGzehCQ7Zxwt7ZYxsnpHkE6L27nyP59L
 JWOp5Fv6jhMKDAn6wJdQH4Iuz/meB0i6bi4tCkI3mRhR0IehRheiQ4xjg==
X-ME-Sender: <xms:wijRYnlIqLfDvO5DACCzDeq9HJGfaxHh3uwLB6BRRz78b766_P0WSQ>
 <xme:wijRYq2tRWk1ErfUCn6ycm-weWgBPoeVNsEgNZgCt7jxoQjLCFSsqAP4sJZ3ILkNT
 wKd7Pd2MjmduSeK1Ts>
X-ME-Received: <xmr:wijRYtq4kIWxPWbqqPTeKYO8FOC7nU1AhiyPM6abIeMhBvoXtMAKvf-oflP51RXtHUAsf6RL8o4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:wijRYvn8jZ6FGLgvp0nugwT9to06--e2VDsf9VrlHfoTiSP7ScHyCg>
 <xmx:wijRYl0wjHNKY-yIaSQBUQc1vZ06ry6hif2F3MXmRavoozmkukGmDA>
 <xmx:wijRYuvBxuK_bm2jNv_dNW4ioBNFGEOjNymSjmJAwGckGrTyEaRzSQ>
 <xmx:wyjRYuuTg8mPwX0GIYrC61E3AYSeP8ygPcNcdKS8vrIO_hurSSGr0A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 04:43:44 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 1/6] hw/nvme: Implement shadow doorbell buffer support
Date: Fri, 15 Jul 2022 10:43:35 +0200
Message-Id: <20220715084340.1128455-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715084340.1128455-1-its@irrelevant.dk>
References: <20220715084340.1128455-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Jinhao Fan <fanjinhao21s@ict.ac.cn>

Implement Doorbel Buffer Config command (Section 5.7 in NVMe Spec 1.3)
and Shadow Doorbel buffer & EventIdx buffer handling logic (Section 7.13
in NVMe Spec 1.3). For queues created before the Doorbell Buffer Config
command, the nvme_dbbuf_config function tries to associate each existing
SQ and CQ with its Shadow Doorbel buffer and EventIdx buffer address.
Queues created after the Doorbell Buffer Config command will have the
doorbell buffers associated with them when they are initialized.

In nvme_process_sq and nvme_post_cqe, proactively check for Shadow
Doorbell buffer changes instead of wait for doorbell register changes.
This reduces the number of MMIOs.

In nvme_process_db(), update the shadow doorbell buffer value with
the doorbell register value if it is the admin queue. This is a hack
since hosts like Linux NVMe driver and SPDK do not use shadow
doorbell buffer for the admin queue. Copying the doorbell register
value to the shadow doorbell buffer allows us to support these hosts
as well as spec-compliant hosts that use shadow doorbell buffer for
the admin queue.

Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
[k.jensen: rebased]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 115 ++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/nvme.h       |   8 +++
 include/block/nvme.h |   2 +
 3 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index ca335dd7da6d..46e8d54ef07a 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -264,6 +264,7 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_NS_ATTACHMENT]    = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,
     [NVME_ADM_CMD_VIRT_MNGMT]       = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_DBBUF_CONFIG]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_FORMAT_NVM]       = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
 };
 
@@ -1330,6 +1331,12 @@ static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
     }
 }
 
+static void nvme_update_cq_head(NvmeCQueue *cq)
+{
+    pci_dma_read(&cq->ctrl->parent_obj, cq->db_addr, &cq->head,
+            sizeof(cq->head));
+}
+
 static void nvme_post_cqes(void *opaque)
 {
     NvmeCQueue *cq = opaque;
@@ -1342,6 +1349,10 @@ static void nvme_post_cqes(void *opaque)
         NvmeSQueue *sq;
         hwaddr addr;
 
+        if (n->dbbuf_enabled) {
+            nvme_update_cq_head(cq);
+        }
+
         if (nvme_cq_full(cq)) {
             break;
         }
@@ -4287,6 +4298,11 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
     }
     sq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, sq);
 
+    if (n->dbbuf_enabled) {
+        sq->db_addr = n->dbbuf_dbs + (sqid << 3);
+        sq->ei_addr = n->dbbuf_eis + (sqid << 3);
+    }
+
     assert(n->cq[cqid]);
     cq = n->cq[cqid];
     QTAILQ_INSERT_TAIL(&(cq->sq_list), sq, entry);
@@ -4645,6 +4661,10 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
     cq->head = cq->tail = 0;
     QTAILQ_INIT(&cq->req_list);
     QTAILQ_INIT(&cq->sq_list);
+    if (n->dbbuf_enabled) {
+        cq->db_addr = n->dbbuf_dbs + (cqid << 3) + (1 << 2);
+        cq->ei_addr = n->dbbuf_eis + (cqid << 3) + (1 << 2);
+    }
     n->cq[cqid] = cq;
     cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
 }
@@ -5988,6 +6008,50 @@ static uint16_t nvme_virt_mngmt(NvmeCtrl *n, NvmeRequest *req)
     }
 }
 
+static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
+{
+    uint64_t dbs_addr = le64_to_cpu(req->cmd.dptr.prp1);
+    uint64_t eis_addr = le64_to_cpu(req->cmd.dptr.prp2);
+    int i;
+
+    /* Address should be page aligned */
+    if (dbs_addr & (n->page_size - 1) || eis_addr & (n->page_size - 1)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    /* Save shadow buffer base addr for use during queue creation */
+    n->dbbuf_dbs = dbs_addr;
+    n->dbbuf_eis = eis_addr;
+    n->dbbuf_enabled = true;
+
+    for (i = 0; i < n->params.max_ioqpairs + 1; i++) {
+        NvmeSQueue *sq = n->sq[i];
+        NvmeCQueue *cq = n->cq[i];
+
+        if (sq) {
+            /*
+             * CAP.DSTRD is 0, so offset of ith sq db_addr is (i<<3)
+             * nvme_process_db() uses this hard-coded way to calculate
+             * doorbell offsets. Be consistent with that here.
+             */
+            sq->db_addr = dbs_addr + (i << 3);
+            sq->ei_addr = eis_addr + (i << 3);
+            pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
+                    sizeof(sq->tail));
+        }
+
+        if (cq) {
+            /* CAP.DSTRD is 0, so offset of ith cq db_addr is (i<<3)+(1<<2) */
+            cq->db_addr = dbs_addr + (i << 3) + (1 << 2);
+            cq->ei_addr = eis_addr + (i << 3) + (1 << 2);
+            pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
+                    sizeof(cq->head));
+        }
+    }
+
+    return NVME_SUCCESS;
+}
+
 static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opcode,
@@ -6032,6 +6096,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_ns_attachment(n, req);
     case NVME_ADM_CMD_VIRT_MNGMT:
         return nvme_virt_mngmt(n, req);
+    case NVME_ADM_CMD_DBBUF_CONFIG:
+        return nvme_dbbuf_config(n, req);
     case NVME_ADM_CMD_FORMAT_NVM:
         return nvme_format(n, req);
     default:
@@ -6041,6 +6107,18 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
     return NVME_INVALID_OPCODE | NVME_DNR;
 }
 
+static void nvme_update_sq_eventidx(const NvmeSQueue *sq)
+{
+    pci_dma_write(&sq->ctrl->parent_obj, sq->ei_addr, &sq->tail,
+                  sizeof(sq->tail));
+}
+
+static void nvme_update_sq_tail(NvmeSQueue *sq)
+{
+    pci_dma_read(&sq->ctrl->parent_obj, sq->db_addr, &sq->tail,
+                 sizeof(sq->tail));
+}
+
 static void nvme_process_sq(void *opaque)
 {
     NvmeSQueue *sq = opaque;
@@ -6052,6 +6130,10 @@ static void nvme_process_sq(void *opaque)
     NvmeCmd cmd;
     NvmeRequest *req;
 
+    if (n->dbbuf_enabled) {
+        nvme_update_sq_tail(sq);
+    }
+
     while (!(nvme_sq_empty(sq) || QTAILQ_EMPTY(&sq->req_list))) {
         addr = sq->dma_addr + sq->head * n->sqe_size;
         if (nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd))) {
@@ -6075,6 +6157,11 @@ static void nvme_process_sq(void *opaque)
             req->status = status;
             nvme_enqueue_req_completion(cq, req);
         }
+
+        if (n->dbbuf_enabled) {
+            nvme_update_sq_eventidx(sq);
+            nvme_update_sq_tail(sq);
+        }
     }
 }
 
@@ -6184,6 +6271,10 @@ static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst)
     stl_le_p(&n->bar.intms, 0);
     stl_le_p(&n->bar.intmc, 0);
     stl_le_p(&n->bar.cc, 0);
+
+    n->dbbuf_dbs = 0;
+    n->dbbuf_eis = 0;
+    n->dbbuf_enabled = false;
 }
 
 static void nvme_ctrl_shutdown(NvmeCtrl *n)
@@ -6694,6 +6785,10 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
 
         start_sqs = nvme_cq_full(cq) ? 1 : 0;
         cq->head = new_head;
+        if (!qid && n->dbbuf_enabled) {
+            pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
+                          sizeof(cq->head));
+        }
         if (start_sqs) {
             NvmeSQueue *sq;
             QTAILQ_FOREACH(sq, &cq->sq_list, entry) {
@@ -6751,6 +6846,23 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
         trace_pci_nvme_mmio_doorbell_sq(sq->sqid, new_tail);
 
         sq->tail = new_tail;
+        if (!qid && n->dbbuf_enabled) {
+            /*
+             * The spec states "the host shall also update the controller's
+             * corresponding doorbell property to match the value of that entry
+             * in the Shadow Doorbell buffer."
+             *
+             * Since this context is currently a VM trap, we can safely enforce
+             * the requirement from the device side in case the host is
+             * misbehaving.
+             *
+             * Note, we shouldn't have to do this, but various drivers
+             * including ones that run on Linux, are not updating Admin Queues,
+             * so we can't trust reading it for an appropriate sq tail.
+             */
+            pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
+                          sizeof(sq->tail));
+        }
         timer_mod(sq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
     }
 }
@@ -7231,7 +7343,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
-    id->oacs = cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT);
+    id->oacs =
+        cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT | NVME_OACS_DBBUF);
     id->cntrltype = 0x1;
 
     /*
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 99437d39bb51..0711b9748c28 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -341,6 +341,7 @@ static inline const char *nvme_adm_opc_str(uint8_t opc)
     case NVME_ADM_CMD_ASYNC_EV_REQ:     return "NVME_ADM_CMD_ASYNC_EV_REQ";
     case NVME_ADM_CMD_NS_ATTACHMENT:    return "NVME_ADM_CMD_NS_ATTACHMENT";
     case NVME_ADM_CMD_VIRT_MNGMT:       return "NVME_ADM_CMD_VIRT_MNGMT";
+    case NVME_ADM_CMD_DBBUF_CONFIG:     return "NVME_ADM_CMD_DBBUF_CONFIG";
     case NVME_ADM_CMD_FORMAT_NVM:       return "NVME_ADM_CMD_FORMAT_NVM";
     default:                            return "NVME_ADM_CMD_UNKNOWN";
     }
@@ -372,6 +373,8 @@ typedef struct NvmeSQueue {
     uint32_t    tail;
     uint32_t    size;
     uint64_t    dma_addr;
+    uint64_t    db_addr;
+    uint64_t    ei_addr;
     QEMUTimer   *timer;
     NvmeRequest *io_req;
     QTAILQ_HEAD(, NvmeRequest) req_list;
@@ -389,6 +392,8 @@ typedef struct NvmeCQueue {
     uint32_t    vector;
     uint32_t    size;
     uint64_t    dma_addr;
+    uint64_t    db_addr;
+    uint64_t    ei_addr;
     QEMUTimer   *timer;
     QTAILQ_HEAD(, NvmeSQueue) sq_list;
     QTAILQ_HEAD(, NvmeRequest) req_list;
@@ -445,6 +450,9 @@ typedef struct NvmeCtrl {
     uint8_t     smart_critical_warning;
     uint32_t    conf_msix_qsize;
     uint32_t    conf_ioqpairs;
+    uint64_t    dbbuf_dbs;
+    uint64_t    dbbuf_eis;
+    bool        dbbuf_enabled;
 
     struct {
         MemoryRegion mem;
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 373c70b5ca7f..351fd44ca8ca 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -596,6 +596,7 @@ enum NvmeAdminCommands {
     NVME_ADM_CMD_DOWNLOAD_FW    = 0x11,
     NVME_ADM_CMD_NS_ATTACHMENT  = 0x15,
     NVME_ADM_CMD_VIRT_MNGMT     = 0x1c,
+    NVME_ADM_CMD_DBBUF_CONFIG   = 0x7c,
     NVME_ADM_CMD_FORMAT_NVM     = 0x80,
     NVME_ADM_CMD_SECURITY_SEND  = 0x81,
     NVME_ADM_CMD_SECURITY_RECV  = 0x82,
@@ -1141,6 +1142,7 @@ enum NvmeIdCtrlOacs {
     NVME_OACS_FORMAT    = 1 << 1,
     NVME_OACS_FW        = 1 << 2,
     NVME_OACS_NS_MGMT   = 1 << 3,
+    NVME_OACS_DBBUF     = 1 << 8,
 };
 
 enum NvmeIdCtrlOncs {
-- 
2.36.1


