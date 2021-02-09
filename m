Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 922A63149C0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 08:52:54 +0100 (CET)
Received: from localhost ([::1]:46684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9NpN-0007Ec-GB
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 02:52:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUp-0004yV-Dr; Tue, 09 Feb 2021 02:31:39 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:32811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUn-0005YQ-9w; Tue, 09 Feb 2021 02:31:39 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 16646444;
 Tue,  9 Feb 2021 02:31:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:31:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=1lNUD6rRleo/T
 b9wni5OXGjqNYHbUeiadcIme3Jk/H8=; b=2eAyvlSV1cSLRyiAkxNQOSm8PNa8Y
 AIAXjgq/iaS20AIbHm9ckYFcQnmOcUib5qOgEmwghy2TnVHOU7qKlxMEZyJHZwh2
 JHflAEQCw0ugLyJStAWwRTCkYWhIk9GxDtJwKYU5hBAPdNXmwQxhp1pgktod8h3S
 /nUNGdFx6cFPO6HxP/zZ46owf4uI2CYDtv0iDgGsbD89xWaHKRJyUwZsQbs/wilT
 NaBDG3yNVnfOEOqJFtKpyoe8fNGAeQCJdtlbLDTZKy1Z46FwgxyQN3Xx2R0fc9/P
 yBE1u70E9d2Wuoe4uI+KjI+tmCVp7ti+LlIIBZWSvDXjNN9vVq6ZOysOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=1lNUD6rRleo/Tb9wni5OXGjqNYHbUeiadcIme3Jk/H8=; b=JqvOvlkB
 ZQrGtX86Wk/oegRL6lxqRrIBIK3ULlSzLjNe4SEii9IwzDrBBGPlealJn76Bea3+
 F+rteWw8Y+n5pTm3D1VOMJbIbm17RFwbSD1RBTpo1p5uNM8YadlxMJYPxke3jFZ/
 OaVnDYgcqOXWg3TwQTffJdgtQGzXJZ0VvvI1hi4YmRgV1qZwvlRv4ClixkvxGkdc
 UKA00Y4iIlBoP71/3fjy2lE6S37vrVr4w6e8oNTW/rHYZajhYz4qEvV5rBH5Tj5t
 Jjgoo5X2obPGXPZxdirAKIe1EgaFXBAMjGi746hWKS9C43DHb4/FdnIr8KBdVc97
 ILzHmA4zK5dNNA==
X-ME-Sender: <xms:VjoiYECFuYg9nj7yFPKa3hQHKn5ecTi1lf7NxbGqQyktkNkh6qJJvA>
 <xme:VjoiYGhYq4NNJ25Lo0iMX7ceYx5WoOet_4iG2MwYl6qTLOV0695DlxwkwKFKDMv0Y
 UzOvWd5CCsyeEKCWSY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeiudehfeejteegueeffeekhfelgfekheetfffgteejgeekuefgtddujeeuudeg
 ieenucffohhmrghinhepuhhuihgurdgurghtrgenucfkphepkedtrdduieejrdelkedrud
 eltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehi
 thhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:VjoiYHlsoqj-AAiQlfOpdqgs4CvIZzxCkFYJdSDFDMPsBLIZYCkULw>
 <xmx:VjoiYKxRDO0imJ2oK_rz4q5biAnyZDyU7iSJNUwRAQWQfLfuLhktqQ>
 <xmx:VjoiYJQSc66iQHo0TRE9Or0mYy-ye7ltCdxqXMzoKoswJD4pDvx7oA>
 <xmx:VjoiYG81yed3Z-biPNKpW0LsUQxIwtZwrl38A_1HZxhbfknbt3oJHJvLEkY>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 24D90108005B;
 Tue,  9 Feb 2021 02:31:33 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/56] hw/block/nvme: Generate namespace UUIDs
Date: Tue,  9 Feb 2021 08:30:14 +0100
Message-Id: <20210209073101.548811-10-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Niklas Cassel <Niklas.Cassel@wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Fomichev <dmitry.fomichev@wdc.com>

In NVMe 1.4, a namespace must report an ID descriptor of UUID type
if it doesn't support EUI64 or NGUID. Add a new namespace property,
"uuid", that provides the user the option to either specify the UUID
explicitly or have a UUID generated automatically every time a
namespace is initialized.

Suggested-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Niklas Cassel <Niklas.Cassel@wdc.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h | 1 +
 hw/block/nvme-ns.c | 1 +
 hw/block/nvme.c    | 9 +++++----
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index ed3d7e65d597..aeca810fc7a8 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -21,6 +21,7 @@
 
 typedef struct NvmeNamespaceParams {
     uint32_t nsid;
+    QemuUUID uuid;
 } NvmeNamespaceParams;
 
 typedef struct NvmeNamespace {
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index a0de53e71878..f6d752b71467 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -151,6 +151,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
 static Property nvme_ns_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
+    DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f54c5c6ea44d..7b243a56efdf 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1765,6 +1765,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
 
 static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
 {
+    NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
     uint32_t nsid = le32_to_cpu(c->nsid);
     uint8_t list[NVME_IDENTIFY_DATA_SIZE];
@@ -1784,7 +1785,8 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_NSID | NVME_DNR;
     }
 
-    if (unlikely(!nvme_ns(n, nsid))) {
+    ns = nvme_ns(n, nsid);
+    if (unlikely(!ns)) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
@@ -1793,12 +1795,11 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
     /*
      * Because the NGUID and EUI64 fields are 0 in the Identify Namespace data
      * structure, a Namespace UUID (nidt = 0x3) must be reported in the
-     * Namespace Identification Descriptor. Add a very basic Namespace UUID
-     * here.
+     * Namespace Identification Descriptor. Add the namespace UUID here.
      */
     ns_descrs->uuid.hdr.nidt = NVME_NIDT_UUID;
     ns_descrs->uuid.hdr.nidl = NVME_NIDT_UUID_LEN;
-    stl_be_p(&ns_descrs->uuid.v, nsid);
+    memcpy(&ns_descrs->uuid.v, ns->params.uuid.data, NVME_NIDT_UUID_LEN);
 
     return nvme_dma(n, list, NVME_IDENTIFY_DATA_SIZE,
                     DMA_DIRECTION_FROM_DEVICE, req);
-- 
2.30.0


