Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D5F649E36
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 12:55:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4hEP-00061s-F4; Mon, 12 Dec 2022 06:44:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4hEL-0005y3-Ke; Mon, 12 Dec 2022 06:44:22 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4hEK-0003MP-3R; Mon, 12 Dec 2022 06:44:21 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 03DE15C012A;
 Mon, 12 Dec 2022 06:44:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 12 Dec 2022 06:44:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1670845458; x=
 1670931858; bh=MieW4e/zUymEmOAMJmAKy6sogL2DORGK0S7L8IsmVsI=; b=J
 7TPBWCG3znR2jC3xcLiWn5vUxSXY1ZcUlScJZ1VuudEMX4+ytEBBXBujyb991z63
 6k2jBO6WmTj7MWmfMG5FgDFRh0/jDFjsRBlr/gtRMbqpLFE5iNJI7MoyUcSfLJiG
 6PA9xUC5F8W77p+UK2Q9u+oSyEY5RgvQy6/5puDVGwTJ21+KevHy9aQzdtvekrQB
 fNb8Tj6lhrkBezAuws5RBOcDSLoF57N9lfDoBjg8T/WGgXZS/dlAmdiQ8FdK74UA
 H00wzZZNGD0yJL2v8Tf4EGg5QvsGSFImzuuP4HOohU1TEdCV814kVRPKbHP24rTd
 1QxHKJ+cce+gNifQdMlow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1670845458; x=1670931858; bh=MieW4e/zUymEm
 OAMJmAKy6sogL2DORGK0S7L8IsmVsI=; b=BNgJ0wNhz2iWkFL14Kqc8aSb9FiHd
 nr0tjI/Bcw1VGlgmP7dtgbhAqZX0i7y6qARDmv2BASLW85NMgXjSx1IfXzCc4ki0
 BMpNK1k/uYRaVba8bwf+KtNJamZE0WvL8JyYtiTfw0huMY8v+I0+zZ6UhlrIcWz/
 ZlwyqqBXZ4ZTWMQ5M5XWUxSrHjndHZ3mQIDQkXH//VBvPoVj/eTBt6ZfH7J0lrRA
 tWc7gU9/tM8jA+yEe/dH6oV2+KWR93jGZ1YBbvbHR6fg2pU9Ak0iPG6nakFx9Hdd
 bR5/W4gY0FvIhK2sXTeMPTLPh0eoR6dbQ5r6h8GEd9Wc+s27gycQsuBag==
X-ME-Sender: <xms:EhSXY5V_EqEjyg91L7f9T16AG2TF4WsH4m2efu-lY2ZOxMgUjXmFbg>
 <xme:EhSXY5lM0k7gaBfdPdDjU_HwVIV-3sTt49sApZDTohDd7yqSHfD5mkD-_u8D9mReh
 78SjCcazK33uTMJms8>
X-ME-Received: <xmr:EhSXY1ZryMJe2f-L41uZC1Hc1q8rIOR2Q_DLKCLQAWy3zvVJn6a36BELsSZytvwzdGX661J3teMD_BJlQAcq-pRDid5gQcq_Y9M4ew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedujedu
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:EhSXY8Vj8MvuIBVx-0UFuir9x9e9fycf7mOGt7XumGb3sJZxQvekmQ>
 <xmx:EhSXYzk93do_YvWAvNdbttSkBnaISgeBwo7ioOnS6adO4cEzUjPuSg>
 <xmx:EhSXY5fjplTw5nK0cd5PXUGl3wtP1czHZ4HI3d9uEtMSOfg5YuBeSg>
 <xmx:EhSXYxb0omVw49JWxDYX6Ey88eNzCl7UR6zDbxH4QQHJBhcIHv3bHw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Dec 2022 06:44:17 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 Guenter Roeck <linux@roeck-us.net>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-stable@nongnu.org
Subject: [PATCH v4 3/4] hw/nvme: fix missing endian conversions for doorbell
 buffers
Date: Mon, 12 Dec 2022 12:44:08 +0100
Message-Id: <20221212114409.34972-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212114409.34972-1-its@irrelevant.dk>
References: <20221212114409.34972-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1771; i=k.jensen@samsung.com;
 h=from:subject; bh=UGO0tQzSAcPY/fhLFF5RrdpYwEmDgTGctLdgH52GF3w=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGOXFAhDdQL0UIhd++XvDT7Hai2DArn13926Z1XT
 thIWoLi14IkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjlxQIAAoJEE3hrzFtTw3pG9
 QH+wRlxyLCZUbGqKbngR3lf7RZKEPnkEdLO3A/U0BOdHmc2voVJncBMFd4StzQim+Q+KysOIR6BxHk
 szyrh9N7238q7+ylaYP+eYLNKz/3wKMs7RYtDf8xqduZeKgbPa2ths3a+8qggy2nRUIxeWte4G6sDW
 XtDTQG/NupkERvl/XqSTlbMHK2kisHs6Cg74sw73A7u7OufpqWNuWJiPKM1AnbkGXtnqgtjzASd/EP
 DF1QPcV2kAlUjGtKHM493cbIUWmoJH8+iiSH92f3MZNVo2Gn6uCZthhW1AoliTv6Norneg0mZw9Usy
 oV5/it5rIgKm929X78r52LMsm3hLMuK6wD/Ksn
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

The eventidx and doorbell value are not handling endianness correctly.
Fix this.

Fixes: 3f7fe8de3d49 ("hw/nvme: Implement shadow doorbell buffer support")
Cc: qemu-stable@nongnu.org
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index cfab21b3436e..bb505131f5f9 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1336,8 +1336,11 @@ static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
 
 static void nvme_update_cq_head(NvmeCQueue *cq)
 {
-    pci_dma_read(PCI_DEVICE(cq->ctrl), cq->db_addr, &cq->head,
-                 sizeof(cq->head));
+    uint32_t v;
+
+    pci_dma_read(PCI_DEVICE(cq->ctrl), cq->db_addr, &v, sizeof(v));
+
+    cq->head = le32_to_cpu(v);
 
     trace_pci_nvme_update_cq_head(cq->cqid, cq->head);
 }
@@ -6148,16 +6151,20 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 
 static void nvme_update_sq_eventidx(const NvmeSQueue *sq)
 {
+    uint32_t v = cpu_to_le32(sq->tail);
+
     trace_pci_nvme_update_sq_eventidx(sq->sqid, sq->tail);
 
-    pci_dma_write(PCI_DEVICE(sq->ctrl), sq->ei_addr, &sq->tail,
-                  sizeof(sq->tail));
+    pci_dma_write(PCI_DEVICE(sq->ctrl), sq->ei_addr, &v, sizeof(v));
 }
 
 static void nvme_update_sq_tail(NvmeSQueue *sq)
 {
-    pci_dma_read(PCI_DEVICE(sq->ctrl), sq->db_addr, &sq->tail,
-                 sizeof(sq->tail));
+    uint32_t v;
+
+    pci_dma_read(PCI_DEVICE(sq->ctrl), sq->db_addr, &v, sizeof(v));
+
+    sq->tail = le32_to_cpu(v);
 
     trace_pci_nvme_update_sq_tail(sq->sqid, sq->tail);
 }
-- 
2.38.1


