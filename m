Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBFE6639CB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 08:19:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF8tX-0006oV-3d; Tue, 10 Jan 2023 02:18:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pF8tU-0006lk-GX; Tue, 10 Jan 2023 02:18:00 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pF8tT-0003Lr-0E; Tue, 10 Jan 2023 02:18:00 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8F6103200989;
 Tue, 10 Jan 2023 02:17:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 10 Jan 2023 02:17:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1673335076; x=
 1673421476; bh=v+pwZ7Xj3smDj+yWBJfTO38yRtfwHhoOqV+E+YskYOM=; b=Z
 n5W8z4EbnUZI3eODPAIbMF2dcZdeZuHMsdQIUSXKkslgipbrrEdMkDDINpln4ohT
 mHQQ2sdT6MMBXwEugdGF6I4l6iiQq2RX2QUIlkCoWj6d5N18fAQDRFnajd3m+Tsj
 5tg4mkyhd/K9Bos2sgUfdEsU5Q0GKOcPkjp7mw1TMHPb4cbMygpv6iK4Pu2M02Wn
 GIn897ao7xBF9SYvoCBd1WuHF5813nCJd8xIy/SEEfrslPy5gjwA6nevpMXkvVBp
 T1ZaR5BSj3O0xoY386EqvgZ8PN0pR+RBSpxTriESctcUeDwADszxu7SBstJ5ZseR
 CMvvTHD0MDarKUbubweGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673335076; x=1673421476; bh=v+pwZ7Xj3smDj
 +yWBJfTO38yRtfwHhoOqV+E+YskYOM=; b=Fm02Q+8UXQS2/HtFwUN3EUPPUCUnq
 Cjc17Y42C2FJO/JD4YEvJAVMI+sNO9REdwDCuDUxGWREbwD6pcLmCZDc/p+nM9/H
 ynDntbo0AqWYsw5Sr8Guws9QMovl209x8wivX6SQ6IgL+BLWMNmNkxqXjfrhm5BH
 qkEQV5EXCR8LjT6Jym56hFm+2ZlwL5cHTyovBmcdShYfX53YgawMHghVu7OJuMvf
 prTd66sG1Fi4wJF4mbIPOAcuQvfLzTBuH3oO6yTi/3MhPxtb4z7CzMVI8Gh6qqq4
 5rJ3uBemtYLUmQ4WxwhKYyqpTYh0k+2+mUTrawMna+KXrzVE5RE9PrFWA==
X-ME-Sender: <xms:IxG9YxTd23KnsHmeqco_08EfVxBABpMotnhn5GpTAbV6xfjprL_isg>
 <xme:IxG9Y6w1o941TmCzi9Pbk-R4a0TeyvPOW8TcKK-9b4f1Hvt-vYy6qchxA2Q-C4OGs
 3I1MYJ2EzLrM5W_Eko>
X-ME-Received: <xmr:IxG9Y226pgeB9hkz-xpQTthdUVqLNY5WBq5qi2GUvZweAGnnSwQWKJyvVvXOxDc_uGZymfg2qx2ma5NqyXZYBCJBFv9vkLDbQfFZqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeejgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:JBG9Y5C62rTI_LbwG_IP4yXWLMfpt04Sjh6ig3_XcRhfTsd6gEMWSw>
 <xmx:JBG9Y6iTwp3ulqn21NV8hpsjvB81dAR7BxqZ8uUXNhakZYchCVV6Kw>
 <xmx:JBG9Y9pqSExTyWcRNN-FOQgbPuM5Nunw4Qo6J2K4DIGjQLLzgCy-mQ>
 <xmx:JBG9Y1WvCjol-QWCsOi8WBfAeUuZGLGfe_JCTAVe5dEGDv4olo2_sw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jan 2023 02:17:54 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-stable@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PULL 3/4] hw/nvme: fix missing endian conversions for doorbell
 buffers
Date: Tue, 10 Jan 2023 08:17:42 +0100
Message-Id: <20230110071743.63507-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110071743.63507-1-its@irrelevant.dk>
References: <20230110071743.63507-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817; i=k.jensen@samsung.com;
 h=from:subject; bh=X14mTLElADuOBbLWP/86wawuglEhbJ8qpNIESqKJWFQ=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGO9ERdljUACEbfXwlH42GNC3uq0bDKo7lwUFLV5
 ELJcP0EhpokBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjvREXAAoJEE3hrzFtTw3pHv
 YIAJrLzqp6Uq8M5cACjdTxqL5R9YLutsT2jpiPWEnSnp1L7GquHNS+7Fy+Rw9xhfiornOGaOM2aaQL
 ccwnYgFoWFIYQhpH7lBiLE2aOUUZm5YNOr2c0jHXfHcB3lSLTWpA2zvyKHCyVbSw3bCzGeM6GWpUTf
 e9sxqfZOOMdjv4qx/VdGCYtI/mh3X3J8EzgqxIOeurw6vPaorbp8tdE8Y2AZlGeHGB9JnP50unS5eu
 mSKCgQIHhffdL/VT49WJNxmEbIVJ1lUTJP51w44Jr1EQR+xYS4ug86CRKyBDJc+kIarGiARj1wAdDM
 B5sq5oKi8q+WLaj07zuOa/3ykIc24Gor8lT6l2
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index cfe16476f0a4..28e02ec7baa6 100644
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
2.39.0


