Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701A4355D4B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 22:56:55 +0200 (CEST)
Received: from localhost ([::1]:44204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTsko-00089Q-F9
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 16:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTsau-0002Bd-Hc; Tue, 06 Apr 2021 16:46:40 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:51483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTsas-0001YO-RQ; Tue, 06 Apr 2021 16:46:40 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 69A7B1425;
 Tue,  6 Apr 2021 16:46:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 06 Apr 2021 16:46:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Crc5lY8+8kAgy
 fg0VFPjqfXIPSIUBFx9BFUoUUZKTVo=; b=hjc0IefsIj9eMOx+YKpH+2aO9hEOi
 YN6mQEvCD0+6TKWt1KVahHQ1kgfwS7r2Wix9V60EAsVcxrzNa43eIEcfvSauXDrB
 ifEYFN7F+2/lAQScv/zi3i6Wp8H48Zhdwn3qIgrnED3yAGTLG/K/keWomj0DIUTt
 8a+FeUhyV0Xu3AsKzBW8HmvpuD3sW6duPW6ptWnR0+iEOZP50zOPWMAaflZQp8Ew
 01dkjhxhnFuaN6s/GqWSrxa1nXHjp8omfyFmgS1A6GpC6YSacRmE+JqoCbm3toVr
 YIsyhM//URhIMMcRlnXtXqe/yqDH4LL2m+swmLi5J7Z0uL7TuX7y62+kA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Crc5lY8+8kAgyfg0VFPjqfXIPSIUBFx9BFUoUUZKTVo=; b=PydOXuOx
 DjULXqsxUeztUGzKb8aZsVPjvQwad3sbtB1aALmw/upf0hiaQhCAk24vHrWrQSWG
 1UoC/u0/lVep8/0hQEC/e0ToMOZmwPeo8JU3vkEiCHeLVviIvdybKVgNVSKMn5AQ
 1ElMiA2WPpoqeGwVFOM5huYs2NFLxoryectCSqpJ55FcrXVYpS/qL/reVkR4X8sz
 /mnjDQRfnvY5gjq6HpTuBVhU0x5+BFZbRjeebW7C3sedWakt2aNhEatpMJgkqNdJ
 MJjCARRWXOKXP1fgUCZZEdDU/BB4vkbIflUk+yazZwrpkbMtSszs2jetPEPU69J0
 Yb7KIWGX0NR+Sw==
X-ME-Sender: <xms:rMhsYNDrOdoCqwpQnDj2tUUoxvtrnwnPletR5_B8DKtxHgjJFm5Uxw>
 <xme:rMhsYOlIu-jk7vGa75kRp3pJfTN9_YY099Od2RjUmbqNFnbCsnXUExH1TOJZIWLWb
 dqudYBKCPg5U4FlyJk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejhedguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:rMhsYDM5KfwpEnfB8JGT6QIMgxm2NbezJpikXPZNOOdQkEXFGD4FxA>
 <xmx:rMhsYD-k9zSr_mPkZ50RxsnUXMPxHabUXG3yU9GsMN3IrP6RjYjGBA>
 <xmx:rMhsYNHx1apnUHMR8etV2hGPewpPgg9xTn81qo5hnyNB9vgHac-G_w>
 <xmx:rMhsYKwotBiHHuJN2HPXtEfY3Nh8EHuCGXEaH7f0zk4cXnX1TvBLFjpfQGg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9DAAB240057;
 Tue,  6 Apr 2021 16:46:34 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.0 3/7] hw/block/nvme: fix the nsid 'invalid' value
Date: Tue,  6 Apr 2021 22:46:23 +0200
Message-Id: <20210406204627.140812-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406204627.140812-1-its@irrelevant.dk>
References: <20210406204627.140812-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.27; envelope-from=its@irrelevant.dk;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The `nvme_nsid()` function returns '-1' (FFFFFFFFh) when the given
namespace is NULL. Since FFFFFFFFh is actually a valid namespace
identifier (the "broadcast" value), change this to be '0' since that
actually *is* the invalid value.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme-ns.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 9ab7894fc83e..82340c4b2574 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -96,7 +96,7 @@ static inline uint32_t nvme_nsid(NvmeNamespace *ns)
         return ns->params.nsid;
     }
 
-    return -1;
+    return 0;
 }
 
 static inline bool nvme_ns_shared(NvmeNamespace *ns)
-- 
2.31.1


