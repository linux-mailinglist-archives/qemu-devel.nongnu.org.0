Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C013B783F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:07:52 +0200 (CEST)
Received: from localhost ([::1]:38932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJ5L-0005Ds-4d
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyInA-0001pc-VX; Tue, 29 Jun 2021 14:49:05 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:44517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyIn5-0005YP-VD; Tue, 29 Jun 2021 14:49:03 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id C72862B00AC0;
 Tue, 29 Jun 2021 14:48:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 29 Jun 2021 14:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=krTi4Np9R9E1E
 NkCDypGPP5veZX6hElvbdXVL6mBm4U=; b=AktEw5lNUuh3XhQmSvtQSnU83JT0c
 07fgU/ilZx+WdeDLXbw0wmnA7J2G98wtV4oCY1IB6MFaLMWHtRWblZdrkhWCIGfr
 RLqy0AuSewhxYRx5/Rza9RVp3YFa0S1X59dWbOnkSURxmI6ziyz5AepnTo5m4JSA
 n2wlwGoxXofNyh2OtKkW1Gl/qLfyVmJHTpPqQIT349s9UKt1DY5Lje1mH2mLYRzd
 fF7W1V6XlWXkSsTkJQthiIZgiJHMicvtt7MnBwlpQKfqfOO9Ha/hejq4K2RA60cb
 v7+zcb2xvRKDKaShYK2V7PFKIr24zu1Bzwa7NoCbMwlxFW5crcEdpGSmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=krTi4Np9R9E1ENkCDypGPP5veZX6hElvbdXVL6mBm4U=; b=Ifyd/6sJ
 Ls5Jo+SgFF+Al6N07qcLxdGsglbR/j3dFIO44V+xCmsrbJ+5xlyPnLbGq3LrBdbY
 EN1WGKltyvIx5EnLJsTWCMUKN+89y0FgsMDaf7gixn54YuaJAv6xJxeJoW3LtLi4
 aH4Npqy+REEnC/n4FXOsLcl/X2jv7/LCxc6h0Eg3izPvjcgImKDBhGDBjrl6WE9t
 8uZKtSgwuBixSL5qrrnVU4n7DcK6LdruT4yxTCfovwzSf1nfKL3Spfv09xkjZ+AA
 vcKnUPsemVbpTKqqiOIdyObk1YxLF+NT5pFuwmZpiy8iswEElZ1kSXvogv9XNr6Y
 6xcpzSEXg0fX7g==
X-ME-Sender: <xms:BWvbYF-hQkUW-yoUgjezmwHu-MClf7gJghRSkxnxnwp7NoOS2aH2Fg>
 <xme:BWvbYJsr5MfekiSrTfeutkFhr6C2aSwTRfGpSkPjI4tWPVA9sOlhSGdkUbeUOMM4M
 UckTZAbNDeXlpDsRHo>
X-ME-Received: <xmr:BWvbYDArmK_c4d44plCxWYOXKIc1wCtiNw7qHtgr3dkMNZPmJaDzap7SM5PBzThU3RNCPyBCzrZAsQ-2qnHCoJojEJkyrMd1r56U0UpKvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:BWvbYJfvui9LjBXDDvnbbNSDY23BPK1IKD6vqo6kGaE-nyPOaWBwKQ>
 <xmx:BWvbYKNxUVPkzL6QMGH8YGn7Ix8CvhFPGYnmX9sEHlgdJe3Z2SQ63g>
 <xmx:BWvbYLlw8ELaEiBkkMPiA50BWXct4_AA7xxsJSOlWWJ9jkANmKR2Cw>
 <xmx:BWvbYLGy0_h-kqoWUJKh9jpeRxSx_sx9RYQeX1KXLanwjlLrLzhBQji70XI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:48:35 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 14/23] hw/nvme: add dw0/1 to the req completion trace event
Date: Tue, 29 Jun 2021 20:47:34 +0200
Message-Id: <20210629184743.230173-15-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629184743.230173-1-its@irrelevant.dk>
References: <20210629184743.230173-1-its@irrelevant.dk>
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
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
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/nvme/ctrl.c       | 2 ++
 hw/nvme/trace-events | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 589aad52531e..c1d95e98cbf1 100644
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


