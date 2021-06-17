Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63ED3ABCFD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:38:45 +0200 (CEST)
Received: from localhost ([::1]:59838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltxqe-0004HC-Iu
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxMF-0002fD-61; Thu, 17 Jun 2021 15:07:19 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxMC-00033w-HZ; Thu, 17 Jun 2021 15:07:18 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 9B0E95C01BC;
 Thu, 17 Jun 2021 15:07:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 17 Jun 2021 15:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=RhB+jyv3v5d2N
 B/7uZM3C6ff/2QKW1Dbf9yX5iFQ9VM=; b=HluJmd0SSA/fbbwrB0AVm1lNE5G+o
 fhkPvZ4M8dui+JsINm8LTUjrba6/8+1cU00VL6KXpcpiNUWX56KW0SnnyLxMqGmH
 ncQurKpU5InNmRQdf2FzgCXlKwdfNkFEGMmbkyA9UD+EaXA6ocMvPtwH+E7qIWzC
 d6MpWdrpYVYc9cVcjq84PY3daGQ0alJ71hPL071qnHjYjFWGKHTYb08yM/G3PUv7
 hRIJ7Lq3NNzRnTcJ1xdvS9C9EsPPn+ThgvedtKAJisj7MVh3hgXZxt+fS5pLFIv3
 J2ngS6jwXPoacmu4OsVGnl3RNYf98XSacWaLrpR+6aXO+O0Kfzm5Q2nng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=RhB+jyv3v5d2NB/7uZM3C6ff/2QKW1Dbf9yX5iFQ9VM=; b=FQ8zlW2x
 rJL5hfUAxAkwsUWqj/LXRDxh4/Ir1YCtFctybyRUheCMAZLx0e5a/E0j8sPksLUi
 wdHldpE1/tS14E3LJQLGanJ0IG2WvEwhKzH3TKYPT95lPXJROY8UPqVOnppRWn4q
 qIhnnOKhcAI3m22Ri0cuDy5OnV1a+AAmH07mhOHMq/R6GQ8OlN3Efpyhvusax9c+
 txrfbzgGiGAX4p0QahmoUX8PytJoHW4NW9sCaA3gZll1dOGwiuodG6wlj6PCfj22
 1zusnEdSAJ4isfvt/k8kEtGjDdju2BF0FKWmTAwHT2QaLkxFumyo3XA/wBppLFRa
 F4XwKLSQZBHk7g==
X-ME-Sender: <xms:Y53LYEsQ6-HtqtjUv8U6sFgX4ih4VAz1P-A3IH61q1MTR8CwA_jgQQ>
 <xme:Y53LYBdu07g3pwUD-SPaFk3XCobLTiO2OpBlsqsVER9hjo8m3DAhTVBwF0EJ_T168
 KfcyojNNoJ91bsc3xA>
X-ME-Received: <xmr:Y53LYPzhgg0LMs14_DrN64L2xTHDXSPauPgoIMCpcp_HBtQPda_VywDO00TM2T2vF9FMkgP2lJhi16XLhlhxIQE25KNn-pkZpRBQYA9h_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefuddgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Y53LYHMM9nh5CtwsfibGwVb-gkL9inNRODdao-1iz8svqUKeeueBmw>
 <xmx:Y53LYE9jOgDjC3p4lzZJG6e8O1oSykuGJkCS2r-ZIafpIeppZN-ISA>
 <xmx:Y53LYPXezx3Pc4R6w873JFt1ymAYkngLVEeFs0SN3Aax8CsQ4ukXHg>
 <xmx:Y53LYIRB3pGwOsuIba_KOx1808SRA1vXzEiRQ1DgWArDh7rqcmIsCQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 15:07:14 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/11] hw/nvme: add dw0/1 to the req completion trace event
Date: Thu, 17 Jun 2021 21:06:53 +0200
Message-Id: <20210617190657.110823-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210617190657.110823-1-its@irrelevant.dk>
References: <20210617190657.110823-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Some commands report additional useful information in dw0 and dw1 of the
completion queue entry.

Add them to the trace.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 2 ++
 hw/nvme/trace-events | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index aca6cf068e2b..cfacf70c1979 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1290,6 +1290,8 @@ static void nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
 {
     assert(cq->cqid == req->sq->cqid);
     trace_pci_nvme_enqueue_req_completion(nvme_cid(req), cq->cqid,
+                                          le32_to_cpu(req->cqe.result),
+                                          le32_to_cpu(req->cqe.dw1),
                                           req->status);
 
     if (req->status) {
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index eea4e31e46c4..a3e11346865e 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -80,7 +80,7 @@ pci_nvme_enqueue_event(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PR
 pci_nvme_enqueue_event_noqueue(int queued) "queued %d"
 pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
 pci_nvme_no_outstanding_aers(void) "ignoring event; no outstanding AERs"
-pci_nvme_enqueue_req_completion(uint16_t cid, uint16_t cqid, uint16_t status) "cid %"PRIu16" cqid %"PRIu16" status 0x%"PRIx16""
+pci_nvme_enqueue_req_completion(uint16_t cid, uint16_t cqid, uint32_t dw0, uint32_t dw1, uint16_t status) "cid %"PRIu16" cqid %"PRIu16" dw0 0x%"PRIx32" dw1 0x%"PRIx32" status 0x%"PRIx16""
 pci_nvme_mmio_read(uint64_t addr, unsigned size) "addr 0x%"PRIx64" size %d"
 pci_nvme_mmio_write(uint64_t addr, uint64_t data, unsigned size) "addr 0x%"PRIx64" data 0x%"PRIx64" size %d"
 pci_nvme_mmio_doorbell_cq(uint16_t cqid, uint16_t new_head) "cqid %"PRIu16" new_head %"PRIu16""
-- 
2.32.0


