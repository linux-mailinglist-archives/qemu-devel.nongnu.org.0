Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4923B558AAB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:23:10 +0200 (CEST)
Received: from localhost ([::1]:59370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UI9-0004ZS-Cn
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDq-00060M-I9; Thu, 23 Jun 2022 17:18:42 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:41257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UDp-00045O-2O; Thu, 23 Jun 2022 17:18:42 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2329B320091E;
 Thu, 23 Jun 2022 17:18:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 23 Jun 2022 17:18:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656019117; x=
 1656105517; bh=OwfQlYYQ1qwecaHdTXnsn9x20hUfPTiXgdnaRcXv18w=; b=D
 j5M/Qm/TgctsHjNKyYMJL7yia7VGIo0ZQ0/QM+WcZIKnAMaIN4p95X9jUyO6NzjP
 SmSKPSunm6Jcz05wRfmtf0raoOXPLt1iEScju06cZze5t9PddQPzrm96dF5IRK3h
 qqpvQH5Huyo7XeDTkGVFYORxK0985qoWMIopuB2A7RJAv1wL0JF5BnPozK++86LI
 yN/vbpg8G1md18bUAHZw53FoDOXsSMp7b1NuNYp64hxSdgzxyZTf+scew0EWag2j
 JhQCPmNa0ujomylwMdK7vCcpAedp7oIjR/+gUI768AhI3m7iCMBX/cZE431rJ2ku
 C7ip5xJgQKvmC+HYXOGfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656019117; x=1656105517; bh=OwfQlYYQ1qwec
 aHdTXnsn9x20hUfPTiXgdnaRcXv18w=; b=bF0QKekyQUyjy0J+OXqZJOHQaw8UN
 89vPrPCnnoB0rdP96LXWtop3hLeRtgoc61QnDFNGHs8apeUvliI0CEUStRWxccjh
 KgZx1M2rUveKArN6gcr139um1jM2koW060YG9ONvU9fRURTOte+KWY9uIzYPduKn
 Ff7k3yMD6KrT62rFvr6JBY6Rhu959QgEv9w7vjiC0druMOAT/aYezyNIjwEpkijy
 RynThdO9Z4jXQjHd7jLJg/IHZVcZpvKKfx75OnTifPXqaUB5Gc26QJYOwquyEogx
 JViEdWABEfznBqFx1Rel+tnHJEJoOwqlD1bHlaw4uN/yq+spsSjBUNHTw==
X-ME-Sender: <xms:rdi0YrWQWp4V4mTrUtTvDCyDl1Q5NypG9bd-m-SX30XjDYImu6LN0Q>
 <xme:rdi0YjlXZG-zaV_RcGXrvCatxlyKJs7XIh9wSKXc5w4sl2J2soZgt8k0Cp8yw5xpg
 W7P_U5vLlKt3SUSR4o>
X-ME-Received: <xmr:rdi0YnaxAmIuGytz_QqGZ_8aS02IYLAm12lzeK6yJ2AjgK2ZflOQiZg5v1pXSKvdlnO8hUpY_xWR6CJLPXfl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeitdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:rdi0YmX_QFjLtXL1ZeHr9zZpNeXl0AKNkrQOVw9JZm65C5eqpQkcPQ>
 <xmx:rdi0YllAgTwvkie7RReG5XNnKLZiiaOt_69kYCOclzZ2oYXRbsR8dQ>
 <xmx:rdi0Yjf4yuMBCm4AEbc6Uj9hVE1CabHmITklMNPEsDpukYlypAwHQQ>
 <xmx:rdi0YriN71txoRtV6c6NNFXEXUSezudniEAwA519GsUqMOEWh08OaA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:18:36 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 05/12] hw/nvme: fix accidental reintroduction of redundant code
Date: Thu, 23 Jun 2022 23:18:14 +0200
Message-Id: <20220623211821.50534-6-its@irrelevant.dk>
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
index a09700455c02..f10334fc1d3f 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5725,9 +5725,6 @@ static void nvme_format_bh(void *opaque)
     NvmeFormatAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeCtrl *n = nvme_ctrl(req);
-    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
-    uint8_t lbaf = dw10 & 0xf;
-    uint8_t pi = (dw10 >> 5) & 0x7;
     uint16_t status;
     int i;
 
@@ -5749,7 +5746,7 @@ static void nvme_format_bh(void *opaque)
         goto done;
     }
 
-    status = nvme_format_check(iocb->ns, lbaf, pi);
+    status = nvme_format_check(iocb->ns, iocb->lbaf, iocb->pi);
     if (status) {
         req->status = status;
         goto done;
-- 
2.36.1


