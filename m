Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4453C623C56
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 08:07:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot1d5-0003ma-NS; Thu, 10 Nov 2022 02:05:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot1cy-0003l5-4r; Thu, 10 Nov 2022 02:05:32 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot1cv-0007L5-Ks; Thu, 10 Nov 2022 02:05:31 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CDBFE5C0153;
 Thu, 10 Nov 2022 02:05:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Nov 2022 02:05:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1668063928; x=
 1668150328; bh=e8xLBh7tH8Wc1gPo7Oh7iH9Lht73cQ+aSGmxuBbdcTI=; b=e
 WAVv2b+UujVtb+2JOkcUmiEiecly7XOgszeDwHlOvFPKYlzb44kR8U21SnqmdsDI
 3BD2dLjmzynW/cbaKWL+yotv5FBfUWGHZ23OV0cr4g1+7947xe5WfUOo135fmI0X
 7I484vpY5JGxHu5n1KS5b3Ux3HNzm6Ey8+ISvxkItuFhJFLm372CWroM65V7fNFe
 RD1X6WhR3w7UMfqA6P37aPq1A84LsbEHR3E8jaqgsqurAngbontJOLypTR5g4h7c
 KCJ1qoPREHwjqK6jkR+1LfeR5yDMLGiUuk9yLR+z48d2mAsrHDk1ILhhH7AOPDjk
 dr/9TNotlh+Rzx7ZLW4rA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668063928; x=1668150328; bh=e8xLBh7tH8Wc1
 gPo7Oh7iH9Lht73cQ+aSGmxuBbdcTI=; b=XBa3fzC9SeILLWMmZY1znGv9azUpd
 aLc1h97zyPfih59S0Kw7KV4FSDz9xtYeZcDgiBsQaYG9bUwAFAnXYjz1x8zYCh66
 yTOVUYaBSCbJcTLy9QKoN8tC3F0LXp5aEkDvGQ/mr2rL3Brtmj+qwaITOn+L9BxH
 TvMSGgfYSuTkOgtfComegAswzz9LNcmIWTpGcxFjWIecG222/5jiDTzJ7X9QHshT
 rhIl7sQPX0D9nk1P1Nj6K3/WyVFX+LHMT2Q/xkcUwVh7zXLQH6hn2DH56oOk67nF
 rsxZUd5G6ZiQGAzG0jI8grEY9VVMJ/zh0yHriTuCRUEpjsq8s/+wLIlZw==
X-ME-Sender: <xms:uKJsY3um2eOAvylqtRQqnxNyxtNfLy8KHqs_Gu8agYQtSe_x_FAqbA>
 <xme:uKJsY4eAmPrrja5r-9iJ_fR2n6zKWCoqiBezR-iry2QP4u62ege-Nw7BQgjhnxKbP
 gylnAOwgg8pQkv2Dak>
X-ME-Received: <xmr:uKJsY6xbPDyrZkZfygJbHWLw2KFlu9qg4F_AmbFIyTdTGPUo6t6o6dwTy5lBzdewltX-OUHbREyvNH9xgVsR-sCh1OZxhB_VomfHOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeefgddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:uKJsY2P8gs9_OzwR7jepHVnlRZVJRu3GfvxN-flgmmvP9IRh20-hTA>
 <xmx:uKJsY38sDssLOSn8_cpJQpq71M0AYVwow4CyOfvWwv7DSGcaQ7T4Bw>
 <xmx:uKJsY2Wo_diVyyqF3GkR82qpWhZ-yKVSYN8d1e1piBFamUR-KSHhpw>
 <xmx:uKJsY6bVinsb1lxJmfE60DvuLGFc-h0mgDq-FKe1o8mIM9s0j3PUMg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 02:05:27 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH for-7.2 v2 1/6] hw/nvme: fix accidental reintroduction of
 redundant code
Date: Thu, 10 Nov 2022 08:05:18 +0100
Message-Id: <20221110070523.36290-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110070523.36290-1-its@irrelevant.dk>
References: <20221110070523.36290-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171; i=k.jensen@samsung.com;
 h=from:subject; bh=jwGNpzW+XsmCWGaJpPPnceSGuyeYbCOK0EUA0oTQGZE=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNsorK3FNnpq+BsuSl728PU+FQQpQ+GDAzVHKRG
 a4iIC615cIkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjbKKyAAoJEE3hrzFtTw3pO0
 AH/R6vsmgPVj5XLSiRZhEq0TRcY3eQyc5JnZRTFakPH3GMgRMWx5PkT04DQJt8KsZbM8w+dNKIUGNJ
 wA8/a0+zuGV7HQAtOcojaIF4eA05psptSFdgdd+rV6MZDAiqYrJJzJP54PelOtkKRh0Y2j7UeWC6Pi
 d2TjMfW7oujyRqAymcbbCD4UkvUQfi6aFlbwui599lb8oDqPmVrLnQN5wCB2SB/13R8aobhhru29+v
 1kcq/7Ynaqpmf6XP0TPfxohY8RIAOcUNqm3wqj8mC2i1EYmehByk1bYl5c+ldloUTUQVZev5JV1ceK
 farLHhPuGxi++xxKMQMCTkLVuXie07vrbAeqMf
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

Commit 44219b6029fc ("hw/nvme: 64-bit pi support") accidentially
reintroduced code that was removed in commit a6de6ed5092c ("hw/nvme:
move format parameter parsing").

It is beneign, but get rid of it anyway.

Fixes: 44219b6029fc ("hw/nvme: 64-bit pi support")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index e23af4db91ae..918af03d32be 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5847,9 +5847,6 @@ static void nvme_format_bh(void *opaque)
     NvmeFormatAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeCtrl *n = nvme_ctrl(req);
-    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
-    uint8_t lbaf = dw10 & 0xf;
-    uint8_t pi = (dw10 >> 5) & 0x7;
     uint16_t status;
     int i;
 
@@ -5871,7 +5868,7 @@ static void nvme_format_bh(void *opaque)
         goto done;
     }
 
-    status = nvme_format_check(iocb->ns, lbaf, pi);
+    status = nvme_format_check(iocb->ns, iocb->lbaf, iocb->pi);
     if (status) {
         req->status = status;
         goto done;
-- 
2.38.1


