Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395A039B38F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 09:07:03 +0200 (CEST)
Received: from localhost ([::1]:46242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp3v4-000620-2U
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 03:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hQ-0005iq-RL; Fri, 04 Jun 2021 02:52:56 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:56017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hP-0007Pq-5G; Fri, 04 Jun 2021 02:52:56 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 65F525C0183;
 Fri,  4 Jun 2021 02:52:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 04 Jun 2021 02:52:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Q/0qnVVl7CIW3
 dW2yuv9PiozFO0AVjnXIgsgjBDKUFM=; b=Ns7Jo5ADW5KN8AvnWT4tsbysQ+LdU
 W4K/nN2s3lmpguipcu84Ls/2b/VbCiGqCfTmfu1hRsS6kmlJf1ZbXf7QicKaYhDB
 kBPoihDlHxBXYbuBaTeHThm+IQhSBx2hOOXxpvDwkVSS5Rv83I33EpM6ZZJqPeO/
 LyVN2KUJlPia8owBB9PF3kzWNQg1VV5DIuiaRMXeiDMX7oHRaFtPDTL9KV1G4pRJ
 tp9awpr9aq1CcF2VL1EmtbZHG363ucU/3X+SIgo3npiMzmIBTGknn8XkUI52xnUm
 4xAHVfSsed6LKnajunbVS1qXXtFQvbgI2wqb76nhgjZNhzqkwE6OPhVPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Q/0qnVVl7CIW3dW2yuv9PiozFO0AVjnXIgsgjBDKUFM=; b=r6A7pIo4
 25fucMa5IAilhzYy1OQEvlFKLLg3IAlCJAna3BlJYK4XNDxIm2oBpKMKKIUx4IR8
 ffBpginhHiJSDfs8ngOww9WTKgyPkD4gg3DTJFyOR7eQiAeciZ9XZtSSNYlemYqM
 mHj3NOYEAbhN1WWVJ/AMPh6QaDjK6rFBRZKPpn79htFd5JZemS8j5CWwtWu3Y1Hs
 ubGpRLvFJgUS8aOftow3HmYhb41JlMkJUYYutOteaA1V3MYQzp7RJtMDIIVPwpgC
 qbQH+liU+xzBdrElJ/f+HPm0pxyu5iF3KjVCzBUeEk0kNkU0qdwWlq95QVV7VR4S
 cI1XEzPLSe6FAg==
X-ME-Sender: <xms:xs25YBd7OhgWid27pY9e9ulbVJkDHE9I2PamoIMMWuvPCUojQIQSmQ>
 <xme:xs25YPMup448HFGjsvoSXRUhxVfWHMuJKZ27hzJzYhE_TYtF1enS_c-WfvaJ7XX85
 Z3Y7ugNyo2CB6Wj3uM>
X-ME-Received: <xmr:xs25YKinwepz5W8RTrZfHs5Z5rG9YAtZf7Fpt4gs1qLJo3JmOSszy2KKdkFAVvKSL-1Nm4zJW-1tfL4aI85TEXuxNswh_zZ6rtfPg-hqBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedttddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:xs25YK--2HTZ6ulgAYyxLa-TwzdxTQgQ6rI1y8-9CfXWjsRi0BpHew>
 <xmx:xs25YNsuMkMTYf9XqX4sTfizT845_ySDNpFlTZRLayNz9W_WaQUCjw>
 <xmx:xs25YJFRQU87qEMISMhub6VaCEL9a2bVPuWDdgntOJECbJR4NA9GJw>
 <xmx:xs25YO9bVt-OeiB-LFZE7MyH6cVv6f7rH23yqsGW3PB3Xdbi2I4qKg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jun 2021 02:52:52 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 07/11] hw/nvme: add dw0/1 to the req completion trace event
Date: Fri,  4 Jun 2021 08:52:33 +0200
Message-Id: <20210604065237.873228-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604065237.873228-1-its@irrelevant.dk>
References: <20210604065237.873228-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
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
index 527c38c0cf82..04027c80ad90 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1284,6 +1284,8 @@ static void nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
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
2.31.1


