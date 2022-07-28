Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75871583AA8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 10:51:31 +0200 (CEST)
Received: from localhost ([::1]:56110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGzEw-00020h-DK
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 04:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oGypo-0006lG-GI; Thu, 28 Jul 2022 04:25:32 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:59607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oGypl-00056K-NN; Thu, 28 Jul 2022 04:25:32 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8E9025C012E;
 Thu, 28 Jul 2022 04:25:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 28 Jul 2022 04:25:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1658996728; x=
 1659083128; bh=nYqfJ7+crZM6z3I641lq7GZ6e+yrbv2WVMTmsY1y7FY=; b=a
 LVO3FmIZDF9PG6thJoAnd5R7ISaT5Psax2UNHXSXJNTps/geZLpzdTWeA/VfvDQL
 Dt6+nc6GnQijWL612+kF5udtvYlATSOJz6lQt0WsKHj4TpBpE7rgrcyI0vExkc3P
 glRb8I6ng09TbW+sq6w90CgzcxPHnD9qXAxjxgdKTLPMb3vZ6eItYMSeQCVcmdZj
 rkQECFnYLqcUcQ1W9M6nmSgza/yKArtJdwklO4MU3ONBtnA0xncvpbDX5XDRx1l4
 x2vuZbwHVx15MYT+JkFTyn6qP1YA67jc+1V/nUcy2qJEI3s9rMx0JkLHF7T8g7VM
 xEcOwGpGA5/r9gOfxxfsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1658996728; x=1659083128; bh=nYqfJ7+crZM6z
 3I641lq7GZ6e+yrbv2WVMTmsY1y7FY=; b=22tUAkJTSTSET+sSQ3DHu3v6l52Qk
 P4bK2xSxbJMHad2+HmKdWJqnI4VqJrlhuzRA5WCDdL9+TbSZjZwudnJZgAHnNOgw
 kKeiVbMW5tmdvHNawfY8gDqCP/jaFq7jMJsxwsur8EXgreDAccnMKKcS/m0rChfD
 wo2Ew3ZUf6QkCttjxap7EwYcIoxDO6G1aZrfHSAzfb9jLH0134PllN9qqhhhKP1M
 /1A1qemylVAIfhtk51hUWVNV7Z7tlKs/Wc+3niRaRQJsDemAFq8N7d6S70BOPPq8
 6mBHMlFUsa3NIWvFZV1UzSywrqv/WRpnzir5li069lzM/5AovVFgo+4PA==
X-ME-Sender: <xms:-EfiYpw9y6w8skNbsUSebfIluzIHor-Nsv0VlvaNhQd3rL_pt8ajdA>
 <xme:-EfiYpR_qYfXj2Rd4JcqgXAZrnaZFtXA9VCBj6kzfKpZ5XVZ3MZoG1tCBbx2ki6tk
 089NgT91aFN_n0mP2g>
X-ME-Received: <xmr:-EfiYjWimvcgRsX6PvQB29KeRw5L8Aps4F5OT8rP4mH7Fth1DW_UcGOxulX955cAeH1dNA8NpQm1pcQH-Px7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddufedgudeffecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:-EfiYrgaUh7jrM5oE4uyYOqUQc9TYD6nCJz_GCJ8iEK5EmZRIX7oZw>
 <xmx:-EfiYrB02hoZQq49-AH4rcqH9ZA7jX0cgy_wtEMFCOveQ4orcWqVpQ>
 <xmx:-EfiYkJrAGej92KJCe_0Gw6ODau58k3FhEJxzScodfV1qUhHP7Ti8g>
 <xmx:-EfiYm-L_vMlE9BEuo-TuNYLshprdYHKMyCCtfMPP2S_NnPzYDNJ2g>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Jul 2022 04:25:27 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH for-7.1 2/3] hw/nvme: unregister the event notifier handler on
 the main loop
Date: Thu, 28 Jul 2022 10:25:21 +0200
Message-Id: <20220728082522.3161739-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220728082522.3161739-1-its@irrelevant.dk>
References: <20220728082522.3161739-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Make sure the notifier handler is unregistered in the main loop prior to
cleaning it up.

Fixes: 2e53b0b45024 ("hw/nvme: Use ioeventfd to handle doorbell updates")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 8aa73b048d51..70b454eedbd8 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4311,6 +4311,7 @@ static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
     if (sq->ioeventfd_enabled) {
         memory_region_del_eventfd(&n->iomem,
                                   0x1000 + offset, 4, false, 0, &sq->notifier);
+        event_notifier_set_handler(&sq->notifier, NULL);
         event_notifier_cleanup(&sq->notifier);
     }
     g_free(sq->io_req);
@@ -4701,6 +4702,7 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
     if (cq->ioeventfd_enabled) {
         memory_region_del_eventfd(&n->iomem,
                                   0x1000 + offset, 4, false, 0, &cq->notifier);
+        event_notifier_set_handler(&cq->notifier, NULL);
         event_notifier_cleanup(&cq->notifier);
     }
     if (msix_enabled(&n->parent_obj)) {
-- 
2.36.1


