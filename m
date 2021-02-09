Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB0C314A94
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:46:11 +0100 (CET)
Received: from localhost ([::1]:39162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Oew-0006f9-52
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:46:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NW1-0005XV-VZ; Tue, 09 Feb 2021 02:32:54 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:52827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVw-0005qw-7F; Tue, 09 Feb 2021 02:32:53 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 39ED0C97;
 Tue,  9 Feb 2021 02:32:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=HGxSt6U+uKi+4
 OlVqNqIh/LH4iIl1f/rn8Oht/qfBmo=; b=XXMnb1FbO15KCdn17USXUdXSN08vj
 wCHG3voAOavWWr95hQM5PRT/zbrZQP3bPYu8IDEULoQOdMgOU9RszFNO922aa96U
 wRUEDQTRuqlRyuj5beACd9axr//AVH5cuLOzwtbiNRxAgfXKVIukTOTuq6wuZu1n
 WOG/p9HFsmtW9FdF70wN4NpbQtKlD9m73UyJ0+0yojbIIq50SGqKwF/FNVCggDp1
 iGi/zgamYIFuJFrqKrhJvzPvYTvb5tLyWLNg8+A4JiDRhNo6tiDFG+RXBCrFF0Et
 qlEAabX/T0HNt+dWzOWgOwNSmgv0B+e7nbfzY28a/63nI9zjPjRY6XFYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=HGxSt6U+uKi+4OlVqNqIh/LH4iIl1f/rn8Oht/qfBmo=; b=AI0zoQTc
 4CQB4kFT+0YUZUaPydsODzkzlJ02N2jhjImh7nEDDtIUeGPR+0uz6xdyYhF0ZEBD
 gAMLOHFrc+QlOc4fKJfIppSFN0nJMJ9c8QoDnqcwX9c8MQja7A1io2ZwkqZc/kbZ
 5QTLv4SjQsaKFupj8lvqwHI8q5WlJoS5rcjrpA9Jdo00X26Wch7ZCcJspog7zFbJ
 CQ+MAuwogUOrSHrYx3YCixogpyZAO7wNkA4hyel4mS6SrKctTwBSfuAi3Iy+qVgi
 UvKcQUUD2/5yDrdJxVr64A8Bp3TV7A6myZ784kqrvj7V0a+WNa2F2eZhmYH6P+9O
 r/uWW6udodGzeg==
X-ME-Sender: <xms:hToiYKHy0DJbqG_2sxPNu5pejyxpw0Fa8aiFiD5SGdfMObv97XtU1w>
 <xme:hToiYCzsMVnIClrTNUKePQvNnDQ2mjdW_duPYzl6n_jDf0n5QiLXHy5ri-2HZ_jLS
 yugjmJGjjPr0cnj54s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedutd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:hToiYBgff-kH7GaHVDBg7vXGIuIN38Ph3g2vsNU8YzuTVXWFOC6Urg>
 <xmx:hToiYNxQ-gNMieGE7ZDs_1wZV4CGWVV2yB1oNafz24th7Ma_lnWvnA>
 <xmx:hToiYEKRa1NqmQdI0DMCXiZVKAyFQo74gmjNFhczoFxoI5LAux7Efw>
 <xmx:hToiYB7_5qEBooqy31me6qC1TaLhXEPhuML6hmYhJ_ixBdyBZxnsPV7gW-c>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 776AB108005B;
 Tue,  9 Feb 2021 02:32:20 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 38/56] hw/block/nvme: add size to mmio read/write trace events
Date: Tue,  9 Feb 2021 08:30:43 +0100
Message-Id: <20210209073101.548811-39-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add the size of the mmio read/write to the trace event.

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 4 ++--
 hw/block/trace-events | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 09eb1f06e8b1..2407b6578abc 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3878,7 +3878,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
     uint8_t *ptr = (uint8_t *)&n->bar;
     uint64_t val = 0;
 
-    trace_pci_nvme_mmio_read(addr);
+    trace_pci_nvme_mmio_read(addr, size);
 
     if (unlikely(addr & (sizeof(uint32_t) - 1))) {
         NVME_GUEST_ERR(pci_nvme_ub_mmiord_misaligned32,
@@ -4042,7 +4042,7 @@ static void nvme_mmio_write(void *opaque, hwaddr addr, uint64_t data,
 {
     NvmeCtrl *n = (NvmeCtrl *)opaque;
 
-    trace_pci_nvme_mmio_write(addr, data);
+    trace_pci_nvme_mmio_write(addr, data, size);
 
     if (addr < sizeof(n->bar)) {
         nvme_write_bar(n, addr, data, size);
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 6d1686e6dc9d..3772502033af 100644
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


