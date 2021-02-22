Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517E3321F67
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 19:53:44 +0100 (CET)
Received: from localhost ([::1]:39456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEGL1-0008IB-8E
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 13:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEGFm-0004tS-Sj; Mon, 22 Feb 2021 13:48:18 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:55039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEGFc-0003iV-8S; Mon, 22 Feb 2021 13:48:18 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2198D5803BF;
 Mon, 22 Feb 2021 13:48:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Feb 2021 13:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=pkg977ggyoOoq
 p0d2YOw3d3d/n6U9MKG5m3VsJtGcD0=; b=Ip1S6AsI7q43YZXFyKR2ZsIjI0L5O
 f3qYikr3pRkVyuIHoi4zZ/eamqvBxf0eCvpBuWoyphvKsBsqRPVbmjzq8Lbsrl3h
 lQDkbtJ53KB6hWZ9KfI97KzT52Wnzqj7kgC/zeaMaQLh1dl4mCNX7W6zzpr3EquN
 QTSW+wiI7AHNvPMnQ6KqGr6YtMbHYRGIGKiJL67564GsXfhC6PgpYZ70hBg+3snj
 XFKml1lKTqfWt9qvRaneV4imEwpeCaRiWEqsFci//vOAlPUy4Q71x3lZFkrSZdBH
 66cll7skSd7kFcotFe5q1y6WqB1DEHyB5JzUvOEvwKhZ2ElEr7IwkME9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=pkg977ggyoOoqp0d2YOw3d3d/n6U9MKG5m3VsJtGcD0=; b=AW0C6TV5
 IxuosIvlJkplnbdsDMKhQXJWZrvczOjx7KONdWgZjqHPTevVbIWvOzV3JtPwyyUT
 Hoqfew6cE56WuqXJIv/TskNWW0eoyhgX00i8cwLg2LpBjOXxAg17gpe9EY2lO+a8
 NXpqRdWqJr74d+AYnYi817r7Z10z2zzSEjM+EqEuYYLvPaL3DNrbuTa9eIuf6PGw
 i+gzKCeZTQSOpOQC/2jJA3CMSeKbL7SIN5zg7L1AaaKPAHIK9kcQWS83gUoUyctC
 CwOT4ecdB+z0LOa9IwdoMvck1NgvqiY6aFMWPP2t1/vYWxas7IyQd7Cw4BGH8CZ5
 wKNKrohhg5xX9g==
X-ME-Sender: <xms:ZvwzYDCUNMdb6AbQ_sS45l_wYxomaaXt97HL6hRkBQIJFLgnglxJcg>
 <xme:ZvwzYGYN5NFQI8T79A3URtY-OVJpDgcTuOiuzvp-Q6JWokSrXQZX6sQAcjPyEPsH5
 7JYh2bMM_WZIhK673c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ZvwzYOUNuB0Ob8BXpZptbSJw7McpMHk0faGaXiE3-tW9VgxwCI259w>
 <xmx:ZvwzYFPYdeo8ZYnZ4f4nXxf13yUbgwmtUutiEJo6kE6qMftOOeGWGw>
 <xmx:ZvwzYIZjrSyvO2ljf5qMQokCg31noZpNZDXK91NxSuv2wkO3m_caXg>
 <xmx:ZvwzYMIkMHIC96uaIsD39N2PPVKNlN_1tPZRf-57LOYk7Y67WvarIw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id A5CD3240066;
 Mon, 22 Feb 2021 13:48:04 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] hw/block/nvme: add identify trace event
Date: Mon, 22 Feb 2021 19:47:56 +0100
Message-Id: <20210222184759.65041-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222184759.65041-1-its@irrelevant.dk>
References: <20210222184759.65041-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
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
 Klaus Jensen <its@irrelevant.dk>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
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
index c0b349dfab0d..ddc83f7f7a19 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3415,6 +3415,9 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
 
+    trace_pci_nvme_identify(nvme_cid(req), c->cns, le16_to_cpu(c->ctrlid),
+                            c->csi);
+
     switch (c->cns) {
     case NVME_ID_CNS_NS:
          /* fall through */
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


