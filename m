Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C32D52F9C09
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:52:25 +0100 (CET)
Received: from localhost ([::1]:49484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RCv-0002mi-3X
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R7x-0000ec-6I; Mon, 18 Jan 2021 04:47:13 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:45701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R7v-0000yf-CQ; Mon, 18 Jan 2021 04:47:12 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 664E35C00A0;
 Mon, 18 Jan 2021 04:47:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 04:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=40lOPKzGxWkNR
 Li97YOjQbMFv+AuqOBOEQtZXeWvoeM=; b=L0YAd0pGEaJOMTc7AMPEIZICg04Lu
 8NOTxLSz4Eu5EH7dUFfmHH10Uqp81F9AqTstc5PF1Vmut6OGDK32tdtXjZZYY7+h
 xhBQmCIlPl8Q/IJMIJYRczM6ONfqoL3iKq+g4LGSE8BXTfgDUxe4pegO34o4dcu0
 uG87KTp/An2K2Z8fk63e+GgK/QQrK7uWeFmP4dzTD3GL1JJH76W0m0a8ePTKhuXV
 0U/aiLHLqNrIcEt4G46mlD/otlrpBBra9KjZd+QrKVu1r8atA/a/+xd1VLuzgS4y
 CC+72uXL9RMImXi+tmh/sF08MUnwUXLsdX7l7Q0AT9ilPvwf5AhaIZMTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=40lOPKzGxWkNRLi97YOjQbMFv+AuqOBOEQtZXeWvoeM=; b=mrEC7IVX
 HInoTopoIsI4aObknRqTCvjOJTCmGo/il08S9ROSft0YobYAdcYDK8W4a65HSYcY
 L0mVYkjdgqhiMrltn1FoukgZ64rvuEmvZYvrR8xsTdR6dDzzSQFtQuRCgRIbzmZf
 YtykEyBT8S9YcVpw2iPg0KU4AG8rBFP0kB6AM0lXmjgSxepMxjfUxRKGaB7Vo8BP
 Qurvt8HkCdJKhzgmK+zpk4UrpjADfF84+7f7mz7h+Cu4D1D9inY0DMHD8IB3oBP1
 t0c/yrkCWh13HLdKaq7bDAKGGtwn8F57eMJcYOw2MednPzYqX8DhuSqReDwGGkp2
 ghd0S2RA+JAxEA==
X-ME-Sender: <xms:HlkFYADFUUVLlr-FGUlmDzOCkcOTDQHtRGhWXlvq0iHIJfmYC8oR0g>
 <xme:HlkFYCj9xN7rdE2bWu9TyPWzs0alU4g8vh9TVFSsGxw4Le1PwKevAe1RK3zxeq-4a
 6uiLgfui2quRBXTw8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:HlkFYDkSkt1qqoAB5HVyrnbYUjSigFr5zyTAiCTZNuL4sQ_drKBJkQ>
 <xmx:HlkFYGxkABMeeNJKNM_QL88m8NEEaioHYzWMBGapQPUPKvJSqrVYNg>
 <xmx:HlkFYFSON-lbK8-49f5PmriX57tLcp2lQ8lda0bMAGssRMweSoZvhg>
 <xmx:HlkFYEFquizMajBi4tAXLlCibe6MG5zQjPXOExa5EFlOjkQqZD_ogg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 23A91240062;
 Mon, 18 Jan 2021 04:47:09 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/12] hw/block/nvme: add size to mmio read/write trace
 events
Date: Mon, 18 Jan 2021 10:46:54 +0100
Message-Id: <20210118094705.56772-2-its@irrelevant.dk>
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add the size of the mmio read/write to the trace event.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 4 ++--
 hw/block/trace-events | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 47da73ce2364..bd7e258c3c26 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3840,7 +3840,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
     uint8_t *ptr = (uint8_t *)&n->bar;
     uint64_t val = 0;
 
-    trace_pci_nvme_mmio_read(addr);
+    trace_pci_nvme_mmio_read(addr, size);
 
     if (unlikely(addr & (sizeof(uint32_t) - 1))) {
         NVME_GUEST_ERR(pci_nvme_ub_mmiord_misaligned32,
@@ -4004,7 +4004,7 @@ static void nvme_mmio_write(void *opaque, hwaddr addr, uint64_t data,
 {
     NvmeCtrl *n = (NvmeCtrl *)opaque;
 
-    trace_pci_nvme_mmio_write(addr, data);
+    trace_pci_nvme_mmio_write(addr, data, size);
 
     if (addr < sizeof(n->bar)) {
         nvme_write_bar(n, addr, data, size);
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 78d76b0a71c1..a104d7f4da80 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -80,8 +80,8 @@ pci_nvme_enqueue_event_noqueue(int queued) "queued %d"
 pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
 pci_nvme_no_outstanding_aers(void) "ignoring event; no outstanding AERs"
 pci_nvme_enqueue_req_completion(uint16_t cid, uint16_t cqid, uint16_t status) "cid %"PRIu16" cqid %"PRIu16" status 0x%"PRIx16""
-pci_nvme_mmio_read(uint64_t addr) "addr 0x%"PRIx64""
-pci_nvme_mmio_write(uint64_t addr, uint64_t data) "addr 0x%"PRIx64" data 0x%"PRIx64""
+pci_nvme_mmio_read(uint64_t addr, unsigned size) "addr 0x%"PRIx64" size %d"
+pci_nvme_mmio_write(uint64_t addr, uint64_t data, unsigned size) "addr 0x%"PRIx64" data 0x%"PRIx64" size %d"
 pci_nvme_mmio_doorbell_cq(uint16_t cqid, uint16_t new_head) "cqid %"PRIu16" new_head %"PRIu16""
 pci_nvme_mmio_doorbell_sq(uint16_t sqid, uint16_t new_tail) "sqid %"PRIu16" new_tail %"PRIu16""
 pci_nvme_mmio_intm_set(uint64_t data, uint64_t new_mask) "wrote MMIO, interrupt mask set, data=0x%"PRIx64", new_mask=0x%"PRIx64""
-- 
2.30.0


