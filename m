Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4523A646A92
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 09:32:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3CIs-0004Nq-JB; Thu, 08 Dec 2022 03:30:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p3CID-0004Kd-JG; Thu, 08 Dec 2022 03:30:11 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p3CI8-0003Ny-MF; Thu, 08 Dec 2022 03:30:09 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 69DA25C018A;
 Thu,  8 Dec 2022 03:30:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 08 Dec 2022 03:30:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1670488202; x=
 1670574602; bh=yyBlsw3QjJoCjXvneksFSzbrwL8vgDCQkPldRiqetms=; b=U
 GyYt/byJMqq52JJ3jtlVwm0uafcA016IXGYU0xRy64B3TVVpzF4mSc+IAOBkQYEt
 e5wuY1dsS6F8tRWOOEY4jbVLYhG+gkcUUP1nvVf/1qJX38zopSqe3zdm4h28GTCf
 oZi4VINB5yVHkk3l0UvlqV9akzoX3T8UdtEb0rHdgVUto6IpsCmLeRdB8Gtw55px
 NvnKvuDshj0W78jn5ADh0EuYBcGXRNDPbBmreqwURdb0m9Vth4DckR83TwxL4Y4X
 sNjf8Q/2FYTe0yw+AsZySufgEQscR64EoMzg44V49Mna6V4kYI1p2gtnaDU4BK8t
 SfF/p91ejJUmkkYJHjuGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1670488202; x=1670574602; bh=yyBlsw3QjJoCj
 XvneksFSzbrwL8vgDCQkPldRiqetms=; b=e35ZOih/cWq2AlircLgrEzIbg/kdF
 lf+/vKA4BPWH1kMtODPUKIUanEMebgGhnPIEczzCwIPXuHZgyQ+xU5GZoH7+sID8
 UT24p5f2fOl2WuWj1CNJb0vDCWWox8FWJhfPnCrCJAXx3ynVKsDoXasv5FaR4SSf
 7wQ0s1m+ho0l4THwMBZ8whgS86oV4EGcGbwehIR7BfzfTDX+Ge7szbBaZviVnvct
 ed5L+dEoDE5EuXv0ptnv77r5lzcDTNCVmXorFHfDLgRnr0yk3U3PY3r1NbbOOnXr
 aTQG/9VmAn4n6AsGervlu4MdaH9QJdl0GwiG9gwJgEJWEJqVNMILhCbZw==
X-ME-Sender: <xms:iqCRYxyaRGfy_xH6aAe_VWufgCqBfn_ugU6_IDgfK_IEBCMclJ4qjg>
 <xme:iqCRYxTicDw5OpRqCMJczk7bVtLicFZJaQIoC6Ibqnio-lUaQCAqpFaoaEuzCdnzz
 9ZLGgUVghi5DqEU990>
X-ME-Received: <xmr:iqCRY7WS_uBAcDASTeHAB1Zr0vdS-zUcBNzFzX5IwzrPAAKns4LlEVqQoo121H9dPflnqRG54qxxCHdAg0MMncEZKcYvl6Be6ucBnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelgdduvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:iqCRYziB8v0_xkFb54vz8P5_GoONup5eG5w_mPZkujRORLFxK0u3zg>
 <xmx:iqCRYzAZPewFqp7Ai9HLdngg1dg2Hky6Bf1jZKTvCw-ft7ig9DCzGg>
 <xmx:iqCRY8J1y9OoICWPmLUYMgHxYAZLMq66Lcscke2uruzp5nAfZlDnrg>
 <xmx:iqCRY-6sPyIr6Q_bYL2E-YgUDYW0OF1vBb6ixVKDrChYI2bJpxNVVg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 03:30:00 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Klaus Jensen <its@irrelevant.dk>,
 Guenter Roeck <linux@roeck-us.net>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 1/1] hw/nvme: fix missing cq eventidx update
Date: Thu,  8 Dec 2022 09:29:55 +0100
Message-Id: <20221208082955.51732-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208082955.51732-1-its@irrelevant.dk>
References: <20221208082955.51732-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337; i=k.jensen@samsung.com;
 h=from:subject; bh=ICJlvNeOLywMzp2ti35M5ymPYHZk/BKrmQ1hNddaLWU=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGORoIN9IHLWHD9jN99YUNKM4dUzJeg6bCfosu4s
 oNKSajY0iYkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjkaCDAAoJEE3hrzFtTw3pvM
 QH+gPKiCgNqllpnqUrxrZyrd0W+uHYcHSY/k5WDifGh2cnolSid9b3LEzVs75gIwx9J1LIHgcJ/rKY
 nR2Ll8CrUz/iNo33rzm8bYAajd6nkE6hp4i5sA2TSH84gJYOmnE2K6rVTjd+wuM6+O3gGit3HQK63I
 kfh6v+3J/6fY+KQQPAeeIRVBg8E2ISNJUppgiLG3uiZvEqI4z6hhrVYnSi1b3GooNFEBRIiRUl4mN/
 poIz6jLDC5fzEkzOomaptm4KMkuzoVh4h16mDtn7W5aS7YDAZ98TnQtgDyUjgzQuKJxBOcsIyQ2pNc
 57rRxKnuuydkE94dscy7pVn8sKiCtR6LaMiqWQ
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Prior to reading the shadow doorbell cq head, we have to update the
eventidx. Otherwise, we risk that the driver will skip an mmio doorbell
write. This happens on riscv64, as reported by Guenter.

Adding the missing update to the cq eventidx fixes the issue.

Fixes: 3f7fe8de3d49 ("hw/nvme: Implement shadow doorbell buffer support")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index e54276dc1dc7..1192919b4869 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1331,6 +1331,13 @@ static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
     }
 }
 
+static void nvme_update_cq_eventidx(const NvmeCQueue *cq)
+{
+    pci_dma_write(&cq->ctrl->parent_obj, cq->ei_addr, &cq->head,
+                  sizeof(cq->head));
+    trace_pci_nvme_eventidx_cq(cq->cqid, cq->head);
+}
+
 static void nvme_update_cq_head(NvmeCQueue *cq)
 {
     pci_dma_read(&cq->ctrl->parent_obj, cq->db_addr, &cq->head,
@@ -1351,6 +1358,7 @@ static void nvme_post_cqes(void *opaque)
         hwaddr addr;
 
         if (n->dbbuf_enabled) {
+            nvme_update_cq_eventidx(cq);
             nvme_update_cq_head(cq);
         }
 
-- 
2.38.1


