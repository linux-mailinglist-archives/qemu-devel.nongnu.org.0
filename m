Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C652E332584
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:31:50 +0100 (CET)
Received: from localhost ([::1]:33352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbWf-0002U3-EK
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaob-0000U9-2s; Tue, 09 Mar 2021 06:46:17 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:57557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaoZ-0000Zw-9K; Tue, 09 Mar 2021 06:46:16 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 704522783;
 Tue,  9 Mar 2021 06:45:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 09 Mar 2021 06:45:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=9kfoo5LmIjYQU
 skPSybh7IJXb6p46qFOfRO7WxR1oZI=; b=PZM3tPsOoPPNWobyeZJQqqQdervqA
 DpmhhL+GUXKE8Ax06Yl+0K9l5VQD+sOYwfdidJfBSpSTGub9fJ40OirnLqVE8gGz
 OiJT/jNGbRQrPfAbgTH+LlQ4ogg7TF+nAJdEJValDwDhswiRenGdukM7moRZ8HG+
 WrBGTVKtFQqvFV2f71zZQHTyyLiqgby7zKe6OSTnT2pdeQCFJ3wxQW2ridYev86s
 Cug3hvUepOGwo8Kx08qr7ZuwWd8+bgUtkFZ38oK1yq5A6zpsCS5eAcugLt9dSbkt
 U4sBtR7pavmBehEG5rxc1KspGEF79YwyqVENK8nEXRbKV4tNWM12u2hcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=9kfoo5LmIjYQUskPSybh7IJXb6p46qFOfRO7WxR1oZI=; b=LKb3HwUi
 BrJ5vpmoyWSm52fqWqxBTVMXGpHWfSgWSkuISeTpUFLvndPy+u50lnsnHFRCQppt
 XwNd0N9FS/aVf5UaKbT74S2+RU86PjJ7+mtaJUHss83Y9sPPJ1AWt29/yoDCzD9A
 sDsJqRaZEvLvNUXzNvNW01B7GarbkjLyv73yfwhD3jnRr0hXxLNHNYbL80FEmtRw
 6f42dnhMoy7kUHAGgHG2vNyQZ8pptVPGZaWaddis7Vt7OF41rpr6VWTJPbDzDDry
 dLuDjgxOe3vPmFuDvMwcmHWrDgVJI4Tqq4P5Wznu0hCC7h2uOcT521Vq64qgEpcn
 nIENrr0I90X3iw==
X-ME-Sender: <xms:7F9HYEa0yUkYXPC6pnsq34Qr8t7tbzNHPTOIYBVO4UYb7sqZbIr8vw>
 <xme:7F9HYPUm1u-lX9UjXdNLzJBysda9thSrvOc3I4bBRkfB8wKarRCO0bGFJ68YCF1L8
 _IkUjAWaD08qnyjZYM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:7F9HYL2pL4Zle712PTV9vcAiApepeIdB62SXbwCDj9Xv01JRJbqSrA>
 <xmx:7F9HYGYAshZhvZQj_FN0lqdCPKC43mvlZsU2CIU0rI6gy8H16_hbRw>
 <xmx:7F9HYOrYLHf4LsNyAs5BXBOLl4N3WgQM6C2WagyAjupen-P2HAomiQ>
 <xmx:7V9HYIFlyD4bl3bQucsY7m86ZGmQwuKfbX8kuhBCBQUP4DTyLWJJBseBnLw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 713B924005D;
 Tue,  9 Mar 2021 06:45:47 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 21/38] hw/block/nvme: add identify trace event
Date: Tue,  9 Mar 2021 12:44:55 +0100
Message-Id: <20210309114512.536489-22-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Add a trace event for the Identify command.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c       | 3 +++
 hw/block/trace-events | 1 +
 2 files changed, 4 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 64340a00df4e..f5538fd00f49 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3422,6 +3422,9 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
 
+    trace_pci_nvme_identify(nvme_cid(req), c->cns, le16_to_cpu(c->ctrlid),
+                            c->csi);
+
     switch (c->cns) {
     case NVME_ID_CNS_NS:
          /* fall through */
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 25ba51ea5405..c165ee2a97c3 100644
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


