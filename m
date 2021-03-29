Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B1E34D5D9
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 19:15:34 +0200 (CEST)
Received: from localhost ([::1]:58810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQvUD-0008IM-Mg
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 13:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lQvJy-0003Nj-Vd; Mon, 29 Mar 2021 13:04:58 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:44167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lQvJw-00032Q-Ql; Mon, 29 Mar 2021 13:04:58 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BAB3C5C0148;
 Mon, 29 Mar 2021 13:04:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 29 Mar 2021 13:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Bhaa0XjHd5seE
 ge+uM76ngbV08DmpAR9qY8xsxMPQJk=; b=Wk3aZLCVeROJSTtMyeFFJgVRvvj/w
 eZQQh/8/025ByebBucRHTzPq15tCGURAVQkQNtRaekruZAAAtSq+lD6G8EoE6m74
 oPJx+o83Ti25cDaLVilzqw/UvAFBiRTdh5p1hhd57BdLt82q41VbLDmDNkMVHtmw
 +f7Io+pa8netChLqeB9GvhyMVCSEg8ZWM/3C7bYDdmNt/+vkzulliwu2dcxltzwF
 Nh2XIyX92EVR10xNcBvlAPp3iCpEfN0rmCbK1PqH3puKZrexpOPnzgVgBhu/JmLI
 +kDyEqtBfAKpNoD2hIIt8KkV82w02VsTC5z0YttImNgi4LIpeu7F+L+RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Bhaa0XjHd5seEge+uM76ngbV08DmpAR9qY8xsxMPQJk=; b=Je3xUggf
 EFqIZwPa6/zuYiPIoUyEUctA7oBJQx2IHkI/JjcbUozJc/AQcJv5UaT5IqwyZpWb
 LPdNBoduo7ooGuK2ek1JPJ/dCMDzTT3ZMzZl7mwt/FUImqTIZ+8meotTWjF3urpa
 xQm4wncRhDJoyiZEyCwRft5dvHiPf78VU/LpeAmAXtJ4YcNIA7jJ1moaaVUKa7v/
 qZgz7XHJaAUj/NvKX23T51RkJRPaWSuPZQXm3p+3z7PArWKDeLtCjOlWKR5VGGJ7
 4ht1etxa9hC83y9ojVuzZ+K9cwW80vBWxPMNFEPcv3jqKWycZKiUrjArvoZSPlGS
 WTmbDVwq0yMnwg==
X-ME-Sender: <xms:tghiYHQSSORPV0fQAy1vadBOhIBM1v15NuBHyp4Yrp3HEKX5G0zmnw>
 <xme:tghiYIwvKtZqvThJcKg5iZsa9m9y-O2h1cy_r-mKwBqYA7pAzdY9nJz54IGxRK97m
 rp4HY7KfeXAnxhKLz0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehkedguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:tghiYM1eHksWE6iyu-WAsWaFOrtdCrnFdsZMiwQzB1ESOKazqI7DGQ>
 <xmx:tghiYHD3-bQhP8mUTFXALM4wtt-Y9Ww5TtpPE9L7jhSUlDSCPvcGag>
 <xmx:tghiYAi_QBp8XXp4kIyknCQM9l3DMaJ56yV39WBElpgjGfCe_CQXLw>
 <xmx:tghiYLX8bg4EbM3qvYsQjCZUnxNF1kNXRKO2DD2C8gsXqnOcoFH4Dw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6B6C4108005F;
 Mon, 29 Mar 2021 13:04:53 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-6.0 1/2] hw/block/nvme: fix resource leak in nvme_dif_rw
Date: Mon, 29 Mar 2021 19:04:48 +0200
Message-Id: <20210329170449.125958-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210329170449.125958-1-its@irrelevant.dk>
References: <20210329170449.125958-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

If nvme_map_dptr() fails, nvme_dif_rw() will leak the bounce context.
Fix this by using the same error handling as everywhere else in the
function.

Reported-by: Coverity (CID 1451080)
Fixes: 146f720c5563 ("hw/block/nvme: end-to-end data protection")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme-dif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme-dif.c b/hw/block/nvme-dif.c
index 2038d724bda5..e6f04faafb5f 100644
--- a/hw/block/nvme-dif.c
+++ b/hw/block/nvme-dif.c
@@ -432,7 +432,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
 
     status = nvme_map_dptr(n, &req->sg, mapped_len, &req->cmd);
     if (status) {
-        return status;
+        goto err;
     }
 
     ctx->data.bounce = g_malloc(len);
-- 
2.31.0


