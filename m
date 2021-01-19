Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AF42FB546
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:22:31 +0100 (CET)
Received: from localhost ([::1]:42160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1o9e-0004F1-4h
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2d-0001z9-35; Tue, 19 Jan 2021 05:15:15 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:49045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2a-0004Ew-6n; Tue, 19 Jan 2021 05:15:14 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 5C90BF62;
 Tue, 19 Jan 2021 05:15:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 Jan 2021 05:15:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=+tAmzpCvx42xi
 yZfm5yP1gMSWDtVv8bpPH0xcCQrIGY=; b=hAD+ELdTVv1j3smqJnEo8Piqj4pQv
 AuvPt1/TTJ5EnyoSDAYDYZWc4pabehPmYr+HedtlYiKVuLmUYffn0Eyaw/YbpaUu
 lA6wPJTwytgGje1eZQDWp4YbLUd+PDZ690Cn6DMWzSuE76dJVYvHoS2TAfA56LBr
 rhSj9lwKVgBsB6ErxguYneJmq8rdNTdjzuzKGC6iDhnEuctRoibhoxhIlL6hqr8H
 AJfuEJRpY5qGdgoN4a+0dBy5prU62kFZcJZ6CawtpfvwTCYs4s3IvPTeN4WZby2a
 NslIwZJTJFrm0RzzJR6L1AUaIuG46lNQBGfZWRF3dtv/ZG5WoJAz8Pl0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=+tAmzpCvx42xiyZfm5yP1gMSWDtVv8bpPH0xcCQrIGY=; b=lnD14BZw
 Htfh70ZSj0ab5qQB7rNZTxfIncxGUWCa+DmCOfliXFW97bIiGm2IlI6TtUFY3kea
 806pDb13LkVTdC/mm5ji81TcTjS1Ay9QeRJoJhZp9JgirmC9dmtEREBV9lTOJPOs
 mXuPIGSZl13QFSi29pzGRnO1lwmvsVePIxMp2lP/T0YcGHU3Idhh0lHY91CeSyGe
 tUHtVpKYO+3wH3VV9k8qVNGG2cl0jQvvluBzCiAT6FyKKDehtxtJwAonuaAIGi3y
 t32KFoh/44W+nUuEpbX4sCs3nuVBFlQsFoAvL8cEzDymodNEw0fKDG5JHxoZ2SJg
 lNI7rh4ua1j+YQ==
X-ME-Sender: <xms:LLEGYPHblEWNrvdwHvbphSNRhwc_sTGTEcFuggsoHywoPNbFoGpdKw>
 <xme:LLEGYIKWWdtrUFGcvFYi_aztJ1gfZakQAx6iNPrfKTz89-L9yctLK7udBIpAzcGh1
 6sNoX5rv3ityyXyWh0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:LLEGYMgahyZXz1BK6cboEQRNugIUZFQ6rR3v8PhwuwP_dnauK_2-Dg>
 <xmx:LLEGYGlUpBzgbz15wwBet3fSyfM-U3bPJxpfvqUg5TFd6Xo4ZKq-ow>
 <xmx:LLEGYDXdJPtNu8ZbUiDwXfqNlL-xh42lzP-788WjYyvWdpYRHr5D8w>
 <xmx:LbEGYPqFFJsApko2_ddS896C_DGTeVsZAswjxpu6qBYBIfBYZreVjA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id ACAF2240062;
 Tue, 19 Jan 2021 05:15:07 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/12] hw/block/nvme: add size to mmio read/write trace
 events
Date: Tue, 19 Jan 2021 11:14:53 +0100
Message-Id: <20210119101504.231259-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119101504.231259-1-its@irrelevant.dk>
References: <20210119101504.231259-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add the size of the mmio read/write to the trace event.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c       | 4 ++--
 hw/block/trace-events | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 309c26db8ff7..c1211b298603 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3849,7 +3849,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
     uint8_t *ptr = (uint8_t *)&n->bar;
     uint64_t val = 0;
 
-    trace_pci_nvme_mmio_read(addr);
+    trace_pci_nvme_mmio_read(addr, size);
 
     if (unlikely(addr & (sizeof(uint32_t) - 1))) {
         NVME_GUEST_ERR(pci_nvme_ub_mmiord_misaligned32,
@@ -4013,7 +4013,7 @@ static void nvme_mmio_write(void *opaque, hwaddr addr, uint64_t data,
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


