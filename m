Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAC4354688
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 20:07:47 +0200 (CEST)
Received: from localhost ([::1]:52670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTTdZ-0007hu-CN
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 14:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTTRG-00010s-9k; Mon, 05 Apr 2021 13:55:02 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:50515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTTRE-0000HR-9B; Mon, 05 Apr 2021 13:55:02 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6989C5C00D3;
 Mon,  5 Apr 2021 13:54:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 05 Apr 2021 13:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=8iIZGMHdQqlSi
 rN5venvR9XOEQjrVpmHq0C4xJBTKAU=; b=YiZYzq197mfJZJOJtO87xhEE080XV
 KrcmvB6m8nDi+RBgkPOitg1XW6DVAbnl5mGAQuY1zeb64kk709qfrH8amOlYzTZB
 9HTOsF1y96sR09ULBmKnEiwS3rln6nFzbfgWLjO9M557B1qIZTWq9zYrbXjJmQwb
 CVtAFet/FkB18eakTZClh7i0XIkHKtf2NYPU7mn+cwwxS1Xpahw31f1Kbk9Rv47c
 grKmapM9mHEO/vlJAVO5Gqn0/SaB3VenpeUoqij7JlygKsaTAN5e7HF7PWfHBVnA
 tzVTMuvBIe/CNcrlmFNv1cfgjccS3exM61SoCOp9JID6a/pr2vzLHNY+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=8iIZGMHdQqlSirN5venvR9XOEQjrVpmHq0C4xJBTKAU=; b=YImcLvWM
 Q9tSiWHTZaF+/a1sLJrz5RmAJNbgsZ0G8OW0W6NouWDwNEvOf9BTvYJW4wxIZTGk
 rnSwF3/j7WIDl3Ap78ehBBxlLzpZmYUy5DH+04F9FS1AADqTi3GYXNjqkGyEoXWS
 KQKGdfFEJX89ttw6dmq9fp7PMD8BIos9oGal76Afd8SRo4Hnmwvz175ekKlu/X4j
 7OMLeYqSq/dP0UkMmQPtmPrFsryulRjF9F9fyPBjhqeQlz2+1k2q0uuanMhRClVc
 tV8U+L72TNznoOoOeeq1XNKeRxY764/EgIWfUBmHTuznvgmwYW5tdNER6kc0tweG
 xyZw/u97XrJrJA==
X-ME-Sender: <xms:805rYD6XUkeNw-u5deWyIus5-rVrWde2LWkQ4JcwOOJ3l4Mpt94Y9A>
 <xme:805rYI41KgvFaQJ9WMmRPB_O0cJczIEl4KI3pWsy0FKqoJKDAZtEHA522aRHfrov5
 2uzaJdlcbgHl9QIgTs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejvddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:805rYKe5XidHtPAnyqEBb3GcIau2QXAvXbgAfLVX6dioXidd4NGqFQ>
 <xmx:805rYEKC-Bp-O8PERjt8Lmk_6pTeia9u3ur2aPJ3EZPesBY-8gBo2g>
 <xmx:805rYHKG8k3X1nKR6U2Jek-oUugAG0pMZn6S5Vq6yIDkeR11MBd0JQ>
 <xmx:805rYEo_5KBQ23vvHfpocyd4BsJGboJ0Z97dXyUDS4QQwbO1nr_Vrw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E5981240054;
 Mon,  5 Apr 2021 13:54:56 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 1/8] hw/block/nvme: fix pi constraint check
Date: Mon,  5 Apr 2021 19:54:45 +0200
Message-Id: <20210405175452.37578-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210405175452.37578-1-its@irrelevant.dk>
References: <20210405175452.37578-1-its@irrelevant.dk>
MIME-Version: 1.0
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Protection Information can only be enabled if there is at least 8 bytes
of metadata.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme-ns.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 7f8d139a8663..ca04ee1bacfb 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -394,7 +394,7 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
-    if (ns->params.pi && !ns->params.ms) {
+    if (ns->params.pi && ns->params.ms < 8) {
         error_setg(errp, "at least 8 bytes of metadata required to enable "
                    "protection information");
         return -1;
-- 
2.31.1


