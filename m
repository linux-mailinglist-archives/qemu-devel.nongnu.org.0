Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA680558AC7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:33:04 +0200 (CEST)
Received: from localhost ([::1]:50038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4URj-0000hg-Ug
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDv-0006CN-B9; Thu, 23 Jun 2022 17:18:47 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:50003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDt-00045y-GB; Thu, 23 Jun 2022 17:18:47 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 0E26D320025E;
 Thu, 23 Jun 2022 17:18:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 23 Jun 2022 17:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656019122; x=
 1656105522; bh=BwX9+a3mmIjl5tKgXuuhWLJER3Iee/pH50sfjWa/OWg=; b=K
 e291IdIhgcSnfYlkwYR8HgWPzCQhzbhe6FPRd3C8CUGl3w7zlS9t9Hs9XZBXNqWO
 U8ty4UI4vadD5FINxs/GvyVKNw0/0/8TOhJ2bCyyr7ySPSHMLX9LX4LukZAi+vN2
 AA70Fqp8pdOrMKO456Oo9pLldZH+sbuuzCKStubo3/pTFNcdCWQUG27Xx7uK5kMa
 gXPTyeEzBXBKt+3D41paIZSx8UTKzj+4dbPAgx2cRkmERlHlSRdPrbDKmm9zYM5i
 +R+X/qukzDrXaAE2Uitprn9LokMNZv9WtlVkFyX9x39ikVWyFW3AmvYkNd+0TFXc
 hCpgubekArUXkcsVka6Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656019122; x=1656105522; bh=BwX9+a3mmIjl5
 tKgXuuhWLJER3Iee/pH50sfjWa/OWg=; b=cpV5dFLBYDyJyJg7ul5P4xfA/UkcL
 TfQChWF62nYsU6oisqbHjs4F1UZPUXJivtNR8VXGbNdrp1sEjli44czi/kOVDUDz
 dJ0ZXISoUevGmwiLZcXVMldnwmXVyTerWoZWB36m1hPfD0Cv9y1Qyudex9ir9jgG
 e/KroqYEyxjzlgTAg9UEUqPngAywuL74K0V69T2H431ddmYVghXrZoA8FcL5akWe
 F6L9WOXE2FhmUPBE9wrmpupB1WDhmsoHO8nq0rW4smCnLbw8gPyRFP0Rgk49p6s9
 n2U7gu3MICoHi25s8DKCi3m+Stc2tHmsg7gy7bPbxP8n3kWPuR9IyiF3A==
X-ME-Sender: <xms:sti0Yt8VL2PdWwf_JKRGmtxjfVvgxIgq3i0CVvrzBoglp93VsRxSHg>
 <xme:sti0YhvGPFxmLdOmham_GjojZIEdwFClNps04q97qprMuoVoQBZJmknha1s3totm-
 pQzFSFACdIe2OTrKow>
X-ME-Received: <xmr:sti0YrDzIOLlS5H1dMQ4TqUcqdtvvm7mxw2WeKm99ettySNsc9rfyd31OAWUT_Pdp7TyjhxeMXdhPboIRSFu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeiudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:sti0YhdOG26_gXq5wxv_-_N5U2TVwUAtKgSuyOBNtMjC0PRdO9sEVQ>
 <xmx:sti0YiOuQJX6Hf7jefJksGiyGn1ExZx9CYQQdSWMUlaOBoriE4frEQ>
 <xmx:sti0YjkzKAy4AkX51ApTXUOH8SgYZ5SGJp67cJfWphgiO_2IgLUkVg>
 <xmx:sti0Yvpm5DwRZ5qmVxsya-bqx91JBgUCg9x5ZsK6Tr5TL4j3IN581A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:18:41 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 07/12] hw/nvme: fix flush cancel
Date: Thu, 23 Jun 2022 23:18:16 +0200
Message-Id: <20220623211821.50534-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623211821.50534-1-its@irrelevant.dk>
References: <20220623211821.50534-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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

Make sure that iocb->aiocb is NULL'ed when cancelling.

Fixes: 38f4ac65ac88 ("hw/nvme: reimplement flush to allow cancellation")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index a85eabfa8bfd..cea90cf65ce8 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3158,6 +3158,7 @@ static void nvme_flush_cancel(BlockAIOCB *acb)
 
     if (iocb->aiocb) {
         blk_aio_cancel_async(iocb->aiocb);
+        iocb->aiocb = NULL;
     }
 }
 
-- 
2.36.1


