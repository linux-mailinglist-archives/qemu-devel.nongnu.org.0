Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E61623C6A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 08:09:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot1d6-0003pD-Rg; Thu, 10 Nov 2022 02:05:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot1cz-0003lc-Do; Thu, 10 Nov 2022 02:05:33 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot1cx-0007Qs-52; Thu, 10 Nov 2022 02:05:33 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 585AB5C01BE;
 Thu, 10 Nov 2022 02:05:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Nov 2022 02:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1668063930; x=
 1668150330; bh=m27MvJoRFmWAtQFcI6sig9pik+Inj8DqQ/00wBbTiws=; b=a
 Ysq7d05S1A68AcKrJdOAQXkUhsUSUfcnZQN9WbdCUfZuqlmWewIYMMqqX4/pykp+
 yEYA1hbgYdBXhfHmdC+B+kaWN6PjpWCVVOp2/muGA7hUNeBCRdkZCvWFbMdEsje7
 VUAzBywZBKjiLQxR8mV/N5UntP3KE99coN7OwFZVH8yWvCszUQ3hq426KU4gX/y7
 tarYPnC9VVWXAE0pIIJ1UEtKafb/DBzWGP+4THr+O/tKdkeh7XESpKAwKvBGuBAg
 VUVR6JB8kSpCi4Q+kphXzYNRYeY9q96J0B5spcl1Ay3M8xuOPR/ZGeVlzRahStj2
 Jnx2FNs2sog0rIsExElaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668063930; x=1668150330; bh=m27MvJoRFmWAt
 QFcI6sig9pik+Inj8DqQ/00wBbTiws=; b=D/CNVCRMrcBHaaEU8uQZdA5sSQ5Mb
 oXt6d3MNxCsGFc6GBaZ0YeLAjNs3a1pgeaPlu641EIjask6fimiBPFJp5qKiJJyp
 vn/SFKR5Vv2FBrIFETzNryqjkyKkJrqRsMnd3CxeAZZ8jR/suoxKNDkBuebqjrTS
 BBoE3bW7XE5/e8OBMKjHGiTLjktfVBAvEeG0ZpOT1L/k6J90bes9+kJawT1q0iR4
 jyzbvqLtXt6aYYOghqqg0IAobl0N3ZA5CA13z1a+gs9ug72PiH7mKlG5IvbXzv20
 QBVpsoyuPnGSO1+/xcpHuiSmSJkH8BCCUpk/7tEW0rANxcsnAQMFiSsAA==
X-ME-Sender: <xms:uqJsYz7JkQiBQtSUWicfovm3L_GhlPDocBMAbZdNwXMuH-EpSWVkJA>
 <xme:uqJsY45__jGNosg78kjYdJaTyBypO3MLQ9vo2u8HUTWBIHSh2XSRGi8rXBjSGut4_
 xWAabA0Irs0uCoIT1Q>
X-ME-Received: <xmr:uqJsY6c7PqK_j32igWzQqF2VVQFMLx54sKU4UiJm-bxbil9haoNy4Q1DujkvIqmDbt7uVPVTDWO1NruOMVN2XejWN2GYkZhKdoN3rA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeefgddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:uqJsY0Lc7hL_eAEi-kRxUzr2nWX80-t-JaWWGzcKYxf1AbQ9-0FnTA>
 <xmx:uqJsY3LYsi5uXtDAmeipyM4vHqDIJbA_RR-ZB_pmv6QxIlxMJqsTqw>
 <xmx:uqJsY9wwm3YIALG0-MIHSG3Xtls9lzmwwmrlJnRI6hyuqdfY-vKxUg>
 <xmx:uqJsY_1VzkZnHhYoBgBX6Lo8msk8XDe8Fj3ST8U09Qm8ESbSiK09pw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 02:05:28 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH for-7.2 v2 2/6] hw/nvme: fix cancellation of format operations
Date: Thu, 10 Nov 2022 08:05:19 +0100
Message-Id: <20221110070523.36290-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110070523.36290-1-its@irrelevant.dk>
References: <20221110070523.36290-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=794; i=k.jensen@samsung.com;
 h=from:subject; bh=sIQGrip7/wT+D8iG6kE80FBYmznll9TCCzlVCVoEgvA=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNsorKCS8FuVAvuPC9kHui5ZjbcoGgQwEMw8vBO
 NJbnLe6c7YkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjbKKyAAoJEE3hrzFtTw3ph4
 QH/3oPJxwFdurEw7g5tU5bAHcdzq+z5jjSruJt7MlPd5UDYoGhDAQX2Z7HxwEumP/ZvFnuhddMusJr
 N7P9nM6hFXCGx/3fgy9LBvE1fHuQ2KPX2zHXoWps09afi1PbZhew9Y2hAXbJpc8EAmI2VhGog2sj0w
 RCdR4R04FXWXrhILpJYUx5bmQDFY42gA5Rcq9gwxrG5WvIVwzUwOZyGOAjhnK0mQ3byREDM+mM3wtp
 nwPupo8Nt+66D9UzWlS4lSQCxwwSirdv7OoD/glxcf6h1n3NepGsmfgIYVIZtD5U69TTxNdNA5XNdL
 uE9VOK8QPYN6Zf4pMzRFFocDIAi//LJK/1AKtH
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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

Cancelling a format operation neglects to set iocb->ret as well as
clearing the iocb->aiocb after cancelling the underlying aiocb.

Fix this.

Fixes: 3bcf26d3d619 ("hw/nvme: reimplement format nvm to allow cancellation")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 918af03d32be..819c02067191 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5762,8 +5762,11 @@ static void nvme_format_cancel(BlockAIOCB *aiocb)
 {
     NvmeFormatAIOCB *iocb = container_of(aiocb, NvmeFormatAIOCB, common);
 
+    iocb->ret = -ECANCELED;
+
     if (iocb->aiocb) {
         blk_aio_cancel_async(iocb->aiocb);
+        iocb->aiocb = NULL;
     }
 }
 
-- 
2.38.1


