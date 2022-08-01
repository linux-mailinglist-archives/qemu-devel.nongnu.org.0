Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC65258673C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 12:11:19 +0200 (CEST)
Received: from localhost ([::1]:39136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oISOM-0005OR-Jy
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 06:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oISJN-0001Bc-1h; Mon, 01 Aug 2022 06:06:09 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:59409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oISJJ-0000Wh-VX; Mon, 01 Aug 2022 06:06:08 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id DCEBC3200258;
 Mon,  1 Aug 2022 06:06:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 01 Aug 2022 06:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659348363; x=
 1659434763; bh=8GsZ2n0clzxDVX154HAXrQ6e/Ug5JtURfvpd8uglFHU=; b=p
 i2Vq4NpaIjjroPSLwQOmZ1QvaSmfffE6+Y/EpCQiaSAurI/R6nvRSKK0qRlegDCy
 /vATIJcn9eQuHvJzkT+3YSCh1zTWrPQpQg/umiYWIf5prI6B2wGLT9s0ZYmG6xbV
 UVi9gJYH7/w/Yau5vBxt4i48ZmjZfGi+q/Jawb+8aUqOM0Je1Pink4nCcCcYk/6g
 F3KCnaoPGrSjS46xHM0paWEh8MwiA9W0D8KnxwWX4yfvyEIVwqwdjeHsBLx3xmqW
 GrB3fgfXQNhEm2Cq6dRfAkkGXq5CXNSoDCiw8Uw49QHGxkvZzmNvcOKK0GnjpNH3
 7idM/qpTeQRYWALVuFSHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1659348363; x=1659434763; bh=8GsZ2n0clzxDV
 X154HAXrQ6e/Ug5JtURfvpd8uglFHU=; b=t22oXb3PAHprNJeyXVUWkH0Ui7w2K
 SIxP8Hfs+rExHnaE3SRyOCk6Eg4gML3yk/GTVhKxDZiC+yys1DmYZ5yrLTrqzAM4
 bOTNtbjKHchPusKALNRN+M6GTqU5bOo5QHuWOe7yLIrz9mVe+AeozpWLdOQa7xbY
 xEEHY3JI0oc7WcLkkiS2ADGTop+z/MgP5tU+pZIJXTSBE4ajNEm7mEqi/G6JV9dL
 1OuvEotE/vLdfIETPn9o+4kodOvwNzarzS0SHenGFzAU7so4PMBIf8k1PFyOp10l
 8gSIA37BaGV4zwBtLyXZFezj9jPAmuWDrv9YPBpmdc2YzEX/menwOt4qw==
X-ME-Sender: <xms:iaXnYtwTLCAcqQv6enkdMyPLVwXy4VVkzCnYGPGNTNTGm3tusjGDxQ>
 <xme:iaXnYtQ4Yqu8Og4OpIaJ44HpRC0-JJecdCJk_7FtN8LCF8RNHMbmnmUKTjxuAccAS
 DNjC_rkVBRt8bxNeCA>
X-ME-Received: <xmr:iaXnYnUCsWqN7lGNYRTij786O7zFa8stf2fXq9aOAZ3iLzhxy_yNaiKbI7nLDAMV9Ps2_A79qyguQnB3t4YA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvfedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:iqXnYviVUnSFtSq2BgRMwEjGY-KVL2hA6XOI4zOMA-VuM_31FS_Y_g>
 <xmx:iqXnYvBuykZxUqpbrjHrplXyxpLqSYPh8uyvMyz_ORtCMsfADimddg>
 <xmx:iqXnYoJ4A-riW-AxlKZR1ojGeGEzc8l8z4rAB7Hhdqm4cuIAk6zVnA>
 <xmx:i6XnYq6lf2WpHpAq3GIzKxt_P-gfYRlrgjAmiEsjHnnaB1By-G07dg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Aug 2022 06:06:00 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>
Subject: [PULL for-7.1 1/3] hw/nvme: skip queue processing if notifier is
 cleared
Date: Mon,  1 Aug 2022 12:05:54 +0200
Message-Id: <20220801100556.2217492-2-its@irrelevant.dk>
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

While it is safe to process the queues when they are empty, skip it if
the event notifier callback was invoked spuriously.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 533ad14e7a61..8aa73b048d51 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4238,7 +4238,9 @@ static void nvme_cq_notifier(EventNotifier *e)
     NvmeCQueue *cq = container_of(e, NvmeCQueue, notifier);
     NvmeCtrl *n = cq->ctrl;
 
-    event_notifier_test_and_clear(&cq->notifier);
+    if (!event_notifier_test_and_clear(e)) {
+        return;
+    }
 
     nvme_update_cq_head(cq);
 
@@ -4275,7 +4277,9 @@ static void nvme_sq_notifier(EventNotifier *e)
 {
     NvmeSQueue *sq = container_of(e, NvmeSQueue, notifier);
 
-    event_notifier_test_and_clear(&sq->notifier);
+    if (!event_notifier_test_and_clear(e)) {
+        return;
+    }
 
     nvme_process_sq(sq);
 }
-- 
2.36.1


