Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743C5586742
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 12:15:32 +0200 (CEST)
Received: from localhost ([::1]:44492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oISSR-0000hl-Fr
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 06:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oISJO-0001Ch-FE; Mon, 01 Aug 2022 06:06:10 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:57999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oISJM-0000Wv-Pu; Mon, 01 Aug 2022 06:06:10 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id B511C320091B;
 Mon,  1 Aug 2022 06:06:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 01 Aug 2022 06:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659348366; x=
 1659434766; bh=LgPzmVkdIvrOCWDn7ND8OkxWypGN7bdT3A7dXh2bPwQ=; b=t
 5EcFJnJnyGRmBhSoaNbZdbL7ZsztCjDt95wT/JMQ/D6jNwdygRfBuU7IKyq6z6Ry
 7KLL+HJvRJewQDhXQm/KTiqQWyB8za47QhEwuKLbw2UFtQaIHJv6xkV5CJ9zljVe
 eVBTYsTK81cAAPPgaYBQILo2e/Hjl7g0TMAxCWHUahHu8/+k0fu+4Z4hYkbLxHR/
 yBQ4N/H4mGBniaO1dj8iLd0uMfIBQ0QjQJGvnlHUYjpSaFzJGSKtEXdj3KZitD5H
 y9SuECaP1+Lmvs5ZBJTlX5ufP78vM41sIUc3wU/ZwSgBCyqJi3rxB3MC2qYOGiUA
 SbmrCJrG0H2j3LVxS2o7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1659348366; x=1659434766; bh=LgPzmVkdIvrOC
 WDn7ND8OkxWypGN7bdT3A7dXh2bPwQ=; b=G1q7UJpKy/1OtfY5mZmySqfO7p/Rr
 W0PGAsADCQlDjQ3ENw5z3a2asLOfMuOvalqtQYEJclPcwhePITAv7FikbE3WUJtB
 6v9kBX8szoqwRJJYJmNWu6rrzrwTM5oRTk8BXbAQbMsrNgJSimizED/hQ4TPS20w
 7sRc4JFWA2t6avBIXmjPUsX2Vx+98BnSc73QfCs9TRVGJ/heu4Ao8A6ae1Q8nS8x
 VLA2wu/d7fCmWpJI3+NbfwU3uFENjI25B6QbHNrS/khB31rj3pjMo9Isr7WnrHW9
 PiDGOeszbQby1D65NdhdJbcBFFJXv45/bxp2EITH6ogVAweRPSH4S9XFg==
X-ME-Sender: <xms:jqXnYq7sX-dhwKyszjiJJonQ6h-pdABBYR8yjCZgNNfPgLA4LH0hUA>
 <xme:jqXnYj422g7kFTUjwkk6TGdYITJBlovYzlZEik6kDITgjUMOYb2mr5cB0dnfi40z7
 M-CehHjSdwwEUH0gPc>
X-ME-Received: <xmr:jqXnYpckLRyq5Wh1cpF122v_bZCI8qt6K85-oFbOOUowN4_2SF11ge9eOXez9ArgDvdBz9g6Ei00tymLOFix>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvfedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:jqXnYnKqL4CNE7dIF12wzTr90-PwcPs9DfYehJe3k19QQAtwVatdGQ>
 <xmx:jqXnYuLCyaB_MoCCAjz4xX205NCx2QDVvvZqALMHrCWDRe1cI0ys5g>
 <xmx:jqXnYoyiPeAE2eZnBWWRBd3uCbqSR7TP01fZT3eRBlFpOpmW9CK1Lg>
 <xmx:jqXnYgixI3Z1N9Jn4EchsGu8IPVq1yAeolQpZ_fzZh8_5nuHKZ6f7Q>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Aug 2022 06:06:04 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>
Subject: [PULL for-7.1 2/3] hw/nvme: unregister the event notifier handler on
 the main loop
Date: Mon,  1 Aug 2022 12:05:55 +0200
Message-Id: <20220801100556.2217492-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220801100556.2217492-1-its@irrelevant.dk>
References: <20220801100556.2217492-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
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


