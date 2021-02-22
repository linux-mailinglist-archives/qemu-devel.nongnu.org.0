Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44153321141
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 08:16:40 +0100 (CET)
Received: from localhost ([::1]:58272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE5SR-0001sz-3u
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 02:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lE5J7-0006fw-QO; Mon, 22 Feb 2021 02:07:01 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:37599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lE5J1-00030d-LQ; Mon, 22 Feb 2021 02:07:01 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9F2FC5C00FB;
 Mon, 22 Feb 2021 02:06:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Feb 2021 02:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=VI393SK7a20Uz
 pl4ceRURsxlhnDBbb01vgkiJjlgaFM=; b=dlFRG1z2OTOHWGNLhvLj/B3cb7rCZ
 p0yMtw/rC2RQdlOLmIjNUBasyX6jCQJgQFWTRTBneqKZI/08cMktHa7tddWFyU3D
 guHq9TEtw4Zlv3C8LPkbXpma2uUK0fqmCUEpCmnj4jK6SQBRECBZW7LBdytL/ge8
 9IyTMIrX2Gkfm18dOG7FhelF86a1q4SKuvVko5Wbuw0NUBdny38MqQmCkydfglnW
 7k+QEQuyfjjAoNS5nVgzZg4fY+oTdEjusE6YYxCXqaxENe6H7VtPa91/7ZV6kgur
 Ou58knw5yc0ZxVyUQcjAx3YqbcesWaj663C/ywiRENCc44D+4OnkS6xRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=VI393SK7a20Uzpl4ceRURsxlhnDBbb01vgkiJjlgaFM=; b=RMNsD7Mt
 gP4iFwn7c9gsaSYPthzWr8Wj7XY1uW0htvIUjhOIy1yWNvNeQS3v9FOKzXqYctId
 oUMcLJfHHVAkHnIpFPtjecTdc4YWm6YBnPUio+dFpzWOUubWuLxzyRW05/RAci+Q
 WhPRe0E0AlPDysbjNAmx76jC7hm7KXI/9s3J0tuG7x0CYguMafd9GAz8iulDcsuk
 7cCWOOXeFGWJ0ZSxcFn+Q4CEqyQz432hL2yhjQFfV4aWJ8R0du7pkfQNWKK7slDR
 tHVvyt/Tz8KcMb/S1RYnKF7ahkKY2+f0EeCBgBN/bN/2d0HIJb/Q4Hza7R2SkUdY
 eIjh5VmTyINP+g==
X-ME-Sender: <xms:DFgzYDleYX2_FNrliyxi_JU2pn6RKV5YiZbE3BbdSX9n-f7IbR4vgw>
 <xme:DFgzYG1wnm-EEIJOvsgl8oH6E709W1SNngXpMlehv4GDZRmjTRyUoiG9R7hgrlQ3q
 aNMwMzCXf_ZZsoX0f0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkedvgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:DFgzYJokVAHrWgsly6-UnzkZkW8UDn9J76dZu-FZO2VHVo2MchQbxA>
 <xmx:DFgzYLldkbg5bOx0hDJ65nSjpUCzT7uGE5XmUWLq_MP2wNnENPAn6g>
 <xmx:DFgzYB3i6EBm7tWwXuZIIUlaOMBBwU3Vb-50NtirwRXMWe82P-g36A>
 <xmx:DFgzYOnv6FcZdlQdTDuarjSTinQ1jR7ZayoAxspU6G2ahiFs5Vmo8g>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5531724005D;
 Mon, 22 Feb 2021 02:06:50 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/block/nvme: nvme_identify fixes
Date: Mon, 22 Feb 2021 08:06:13 +0100
Message-Id: <20210222070615.9177-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222070615.9177-1-its@irrelevant.dk>
References: <20210222070615.9177-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Remove an unnecessary le_to_cpu conversion and add trace event for
Identify.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 5 ++++-
 hw/block/trace-events | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 1cd82fa3c9fe..ddc83f7f7a19 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3415,7 +3415,10 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
 
-    switch (le32_to_cpu(c->cns)) {
+    trace_pci_nvme_identify(nvme_cid(req), c->cns, le16_to_cpu(c->ctrlid),
+                            c->csi);
+
+    switch (c->cns) {
     case NVME_ID_CNS_NS:
          /* fall through */
     case NVME_ID_CNS_NS_PRESENT:
diff --git a/hw/block/trace-events b/hw/block/trace-events
index b04f7a3e1890..1f958d09d2a9 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -61,6 +61,7 @@ pci_nvme_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t qsize,
 pci_nvme_create_cq(uint64_t addr, uint16_t cqid, uint16_t vector, uint16_t size, uint16_t qflags, int ien) "create completion queue, addr=0x%"PRIx64", cqid=%"PRIu16", vector=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16", ien=%d"
 pci_nvme_del_sq(uint16_t qid) "deleting submission queue sqid=%"PRIu16""
 pci_nvme_del_cq(uint16_t cqid) "deleted completion queue, cqid=%"PRIu16""
+pci_nvme_identify(uint16_t cid, uint8_t cns, uint16_t ctrlid, uint8_t csi) "cid %"PRIu16" cns 0x%"PRIx8" ctrlid %"PRIu16" csi 0x%"PRIx8""
 pci_nvme_identify_ctrl(void) "identify controller"
 pci_nvme_identify_ctrl_csi(uint8_t csi) "identify controller, csi=0x%"PRIx8""
 pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
-- 
2.30.1


