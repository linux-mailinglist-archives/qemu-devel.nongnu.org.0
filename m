Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B1B330EE6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:11:28 +0100 (CET)
Received: from localhost ([::1]:46766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFfT-0005q2-HZ
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:11:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvm-0003jX-3u; Mon, 08 Mar 2021 07:24:14 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:46103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvk-00072R-Cl; Mon, 08 Mar 2021 07:24:13 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id AE33A36D0;
 Mon,  8 Mar 2021 07:23:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=3Vk0ZbtJJ/ut9
 /YyASUNg+ViwX72EGNTlzY6u4eXNh4=; b=yMrvtmorfnqeMpD71nNlvpVTELKf6
 GUGPhi53Gvxpq38aim3HqOa4sFM2abbFBYriARRiTDl2SPZeTZEKvGOvhplqSFr/
 ec09aNib/GuJiQSYlgKUxs41i2SY7gKHBr0Cl1TYY0nurgfAXlEkqy5xxZp77wUi
 Xci9APrxYOIPLIyIUTQ1wJJvNRj66ZAUjUeigZij6SUxdSqAxp7Jf7XGfmFHgtX4
 1PLILpXcrbGbvsiyft06I1+zxa1ymPNa+by4QPt5jrtgffg1Xf/V3qsOXITip/YQ
 uXfUrNUE59V05o1bhdkr+0B7yPoR5xUPA4Xhnyb7GVvzQvKKgowvS8P8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=3Vk0ZbtJJ/ut9/YyASUNg+ViwX72EGNTlzY6u4eXNh4=; b=HD2kDnHv
 S5KblJ2HyvX241jJv7aCl5aXGLNu/aiWHYrklhmLCnpueKmz+Jnxs3SnSK75Zbyh
 NWjOUwiG2yG+H3EdofTDwZHt+1r8kPXZh5i6Bsj27xJlGjfDd5KBvbCWO5y6LgKl
 OOEqXvd8bTrWcl+RkwNaY/O2SI/JTEfBCG0dVcBStBcRlH8XFIAKKLRzufGTtYJp
 6wyyqkACw6MDAsv+TdvpWe85fSqP6HKfJ5rtVCxZp6j3Jf0SrW3qUad60ljosDeY
 sEvlJ6Qzz3GWYVwMAj23FysnC8g69tWqpeG42YvDzyusJ0HMejMNmWvxy6IkFJFj
 W9xHhJMhKJFsLA==
X-ME-Sender: <xms:VRdGYDc-ZHL7yS80pn6EGaMOKsZfdXQvTiYLwnxqxKuS4y94xV4gzQ>
 <xme:VRdGYJMDPhlUGdaXI9CRDsPEIVW3hAO-NSLTUWdW-siNwGyl9-RIqmfCX41h7b-u0
 TcUu2cctyt4vbFXBJY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduie
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:VRdGYMjvgTP0IVNl6nT08SYYYsicxLdtcaP9FY5LfyiwCtd7lOMYGg>
 <xmx:VRdGYE80BG3909HOqlOTdYQbLd7j4FVL-nKVZBqQs_JZqH-RQ79V8Q>
 <xmx:VRdGYPsD4Sjv_8akGuhjKXG61LC79wCFCODJRRp6_K0e4jfgFYB9Og>
 <xmx:VRdGYNIGWydWqitIzwCcJleVSrsxtLA82tfrhufoQeUzyI8WpacAj_8mHWQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B43B1108005F;
 Mon,  8 Mar 2021 07:23:47 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 21/38] hw/block/nvme: add identify trace event
Date: Mon,  8 Mar 2021 13:22:56 +0100
Message-Id: <20210308122313.286938-22-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
index ba07e6deef5f..478168de6eab 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3413,6 +3413,9 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
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


