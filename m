Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA50558ABC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:29:44 +0200 (CEST)
Received: from localhost ([::1]:46564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UOV-0006eC-IC
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDt-00067O-2Z; Thu, 23 Jun 2022 17:18:45 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:36895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDr-00045h-GR; Thu, 23 Jun 2022 17:18:44 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 91DB73200901;
 Thu, 23 Jun 2022 17:18:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 23 Jun 2022 17:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656019120; x=
 1656105520; bh=rtJSyEain9X10ZJ9y4MMHJr4bL5seuQJHeojW/t6nqc=; b=k
 DyfzyZbQDjf7MByM+vzw9avgWKLdMDei0CQkYgrYRwxwZrbDSWtXQGMNucQ0Jm6J
 PZTadDI8UsfesjLYeV40lOz9NZ8cF7GHZB7yrnGGfxYrBPbC/OLVKITDzgnbrJnX
 oXUdW+uExeH8Oi0bVtNm4Nc+Kbuj4GBGle3WVusghBSUrbMxgW8ztezBHvqoInhY
 4Iw7ZUNdakM967UtCdPO29CkNLssvZac8lwvbVZ1FV68vr6gw8TG45GYJMDdRPK+
 k7C8u1/aBCdEd+B5EnYkTAMKXJd2vcxuveMi9bOh4w/XLRA7zj7M7QVOuYgepRa3
 0ldFxiPPQrETpbSaWNYOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656019120; x=1656105520; bh=rtJSyEain9X10
 ZJ9y4MMHJr4bL5seuQJHeojW/t6nqc=; b=ih4v7UhyNpPUiu4B+8joiRaIA6pIZ
 OqC1/QGrb1s/IwmcfkTlSbfnIzVDQG2nmNg0oYuv8euyjq0KlvVDLdSgvZcHoo21
 L/gFB7o0kBe8296Zkg5ph2KbGTedgF7t23oyoExUe1EA+ZtRzG86OL7aEoxUMJNY
 YGHeUpBfDYWBMK81sY9J2Q13d57At0tHdMaNMZZsEq13sS8Yt1c4QmpGsBq3Wk5j
 B8CDsYtYGjpqsQ6QxLCnqSZUeN/GMkoh5tSvMV/OSRPszYUMMmXeC4C+aNN0raLf
 nEK8D7DGiSC5QoYqtqb0ad/m6NU5JAqUQvALysbxNRHrjc8lfOg0K6kVA==
X-ME-Sender: <xms:r9i0YqvBSCEmw7aPl5Uu2LGb3RAzIrlXh4U-RSjjAi4jF3or9KU42w>
 <xme:r9i0YvczlKVrRygq6dzDA0ykBsQYBsU41zjil_Dg_aeIHu8cb1NpwNQsdgRnmLN7z
 uJZN4phcAb8_XdKLtI>
X-ME-Received: <xmr:r9i0Ylxi3reJWk4k24tOsLf4Y_Nt02veQaasUUP7USN9mYP99dHlPOqHxAn7M_bHz68_ydmQ7wGFDtEdxfzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeiudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:r9i0YlP1wc8VHBTFF1N2EwLTDUG2g3FFgKYdjW1Eaf0MsCbbOojFPA>
 <xmx:r9i0Yq_KxRZywDVzP2kQgd1GttrLBuAvRLDVOFySOnIJsRICbFyCNQ>
 <xmx:r9i0YtUii4K6s8mXbANgcpadZeb1YzS_nBSGcvmf1SF7mRLxEeGOHA>
 <xmx:sNi0YhYuA3igy8iRukHoodv0odRevCXAp49LGR40NrDOTaddA8_frw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:18:38 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 06/12] hw/nvme: fix cancellation of format operations
Date: Thu, 23 Jun 2022 23:18:15 +0200
Message-Id: <20220623211821.50534-7-its@irrelevant.dk>
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

Cancelling a format operation neglects to set iocb->ret as well as
clearing the iocb->aiocb after cancelling the underlying aiocb.

Fix this.

Fixes: 3bcf26d3d619 ("hw/nvme: reimplement format nvm to allow cancellation")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index f10334fc1d3f..a85eabfa8bfd 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5640,8 +5640,11 @@ static void nvme_format_cancel(BlockAIOCB *aiocb)
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
2.36.1


