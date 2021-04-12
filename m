Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE91535BAA6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 09:13:06 +0200 (CEST)
Received: from localhost ([::1]:56844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVqkr-0007ZP-Ql
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 03:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lVqa0-0001J7-LC; Mon, 12 Apr 2021 03:01:52 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:36081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lVqZx-0000wT-JL; Mon, 12 Apr 2021 03:01:52 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A38205C00A5;
 Mon, 12 Apr 2021 03:01:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 12 Apr 2021 03:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=QLONTOFIWkVp7
 yK8a1EuNcdrv1jRQLPcI61rtcjCcxE=; b=UnCZBNE8ib2rZKfdd9atV+5JNJYKJ
 YDkJiDwRbXktBW+p2wlCuBvQFRu/sEcIS9LdDfhJX3bZCoVxjX8DqaamCgIdscCq
 BL7ggH+sPM/qFBLYdnDv5oDVeeTlA8m+KpaNDwRyG01Z6HHw5sjoX+cAndj62iRJ
 JWCt7I5IZTG6e3VN3V8xIUcMQb5LE9FZP5tT1S84qGfcl0jundiurWSZxrwryG5t
 BsrBVXqL72wq7dXw3/+451+mmkoPpihjGv5oo2fflbQMpYRCLN0h7/lPhcbxycYf
 VNnRjrspbODPJ6gIStTU+52Umn2c5f0QZ5Z/KDaN8LzxANdz42ZJJaQiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=QLONTOFIWkVp7yK8a1EuNcdrv1jRQLPcI61rtcjCcxE=; b=nu/Bgeso
 bQ5NqkzN6GiFiZ4OK/zpaFrsUnjetU3bF5Uz3mGASsHtbR1PJI0OhhAurYb3WmsO
 MBngSQZvgYmlwtPItckdkxPRrBQp7y9dIJPzSiyK/l5MISZ/HINfJNpVdgMsUYW9
 5Tq1XpYcBe3uWwYOWPhUGAEni556LM6nITmgwj0hmmExXgQtp2+wXJ9Z9MtWJhRV
 RgmdpPBYzl1qMLInJ3p+yDJa3hOfxRwOX6EPFZ54vC6fqNvBBvOipLZRe87TxwBP
 u5a2p2PeKoyDWl6piS0ttg31C8R4vSpygkVpoPxHaXxI6sASYYYOZzmmSHN0+7K5
 aLkE7iromSgwyw==
X-ME-Sender: <xms:XPBzYB0ugWMRaV_JWpaH-QHgVgInsgtEwirKCgzFAtHQdjLK3x9OwQ>
 <xme:XPBzYIHMIF5tTP9ZpWXswqkRcBkHSVUMp2q3GWv6dtLU91oNfzgfLrRIxehCcXbu5
 EvDdo7cXRzHIGO1ab4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekiedguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:XPBzYB5R_-e9MOfcjsVu4L3Ao5vVaF9kN2i7kmV2sZAdXKnTE6QpoQ>
 <xmx:XPBzYO3pITu28bTmwH36Q60o0MsRgz1_vJod12EM7U4R8rD-y5xAfA>
 <xmx:XPBzYEFMWw4tuHu6b_kY7OLwyENfyaywYwYsyqDZiUdkGA-zxNCVDA>
 <xmx:XPBzYP14yiQbNZ9GjO-pcqAw7sYgnCn7yUC9e8YarCOfnnbaVMo15w>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 420B0240057;
 Mon, 12 Apr 2021 03:01:47 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL for-6.0 3/4] hw/block/nvme: store aiocb in compare
Date: Mon, 12 Apr 2021 09:01:40 +0200
Message-Id: <20210412070141.521593-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412070141.521593-1-its@irrelevant.dk>
References: <20210412070141.521593-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Keith Busch <kbusch@kernel.org>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

nvme_compare() fails to store the aiocb from the blk_aio_preadv() call.
Fix this.

Fixes: 0a384f923f51 ("hw/block/nvme: add compare command")
Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 86336152a378..65bb2cfc21d7 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2843,7 +2843,8 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
 
     block_acct_start(blk_get_stats(blk), &req->acct, data_len,
                      BLOCK_ACCT_READ);
-    blk_aio_preadv(blk, offset, &ctx->data.iov, 0, nvme_compare_data_cb, req);
+    req->aiocb = blk_aio_preadv(blk, offset, &ctx->data.iov, 0,
+                                nvme_compare_data_cb, req);
 
     return NVME_NO_COMPLETE;
 }
-- 
2.31.1


