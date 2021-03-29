Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2745634D5FC
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 19:26:06 +0200 (CEST)
Received: from localhost ([::1]:51576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQveP-0000j2-1a
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 13:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lQvJz-0003P8-To; Mon, 29 Mar 2021 13:04:59 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:38197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lQvJw-00033E-U4; Mon, 29 Mar 2021 13:04:59 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 27E015C014D;
 Mon, 29 Mar 2021 13:04:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 29 Mar 2021 13:04:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=kKx4g7Byamc73
 tDohNq7+68NWOhzh3b0kjWEapAwPFk=; b=HgaFloAgtM4Bi/0JsWIfmR1VTjwSR
 /MrXikuVwMmJ+KSbxiBU/i4SGmLTDHNVLsP2CIVeGKAhEgvaxhwMZ0JDkNgKMxXS
 EmkmZCkSLYksd8pKn2o6MRtGpkZNDdzc7GsZzNcifNEeiT+5aPdxPR0SdAnagKfU
 1bLLVyo7aTqZXSiAVQ+UL8YZLZB+1/z7tKchmxTVcw9DfeSqnN5f4ZeaIcuicUKq
 E58kw6rmx04rvC30IZhKlyoLUOXLhatFFA2uYqtBkUY1iOcUkO/U1W+z0RhsudXR
 g9T3MNX6OS7sRZ5zyK8eb2yHPp44GYLeemvdEb1hBD9w7eFLZkGNkJoQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=kKx4g7Byamc73tDohNq7+68NWOhzh3b0kjWEapAwPFk=; b=ujE3hxAL
 r7cke01huV/J3APtA2wrQilQakdQW10Eh33zoSWIZ+lrpbOlyOw8HN4beHp5kJAP
 g11Mzm4XHsuhw6Mxla2Y7shBraYVw5xJX51R4YuCclLVLnjrevqOybbD94AxsMdY
 7LzYxZQPI24q4P4Yxy3K0pnBN2oIB7O3G3b5jXzcsJQaJkRmSX8MF6/zkYfCNX45
 lFuezufHIksqsQyo64NMXpX1ssRYD77ttccXCO04UisQCdHCoLxOaELkLSBohMN6
 Y6rm0uvcFmo6RTzvB99/l1XZk2SKZzIeVHIyrBMp+qtO5fQwkxmWUps/4HWsVXTz
 ZSc/ny+XhF2DYg==
X-ME-Sender: <xms:uAhiYCUQYynSV0W8dq3d26Yz-AIzvZn3XqD8scF-2elk3aFkiSEEtQ>
 <xme:uAhiYOk5wd8nx1PcRldQO15iQHDHETS9DglWkd1D-FARjxP9TQN9F1uGMfoTWwO3x
 VR_tz2HTf86PfFBtZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehkedguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:uAhiYGZWeUeLwS-KJwtkhhYDmp7u3bvBNCH3gd8u_84gpjuzXlT0jQ>
 <xmx:uAhiYJXZNNFUsHSzHwlFuLnPizJo8bgznrOtWVBXnxdYHqvY1njc0A>
 <xmx:uAhiYMlGnJa2MtTVvtsi3M7At2Cinmmek96OWKlUkYKUGf3jaA7WhQ>
 <xmx:uAhiYKbIeCRiTkX8s6IIyLaIhHx3jE58L9nJK062U9AOaGBqowmwuQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id CAC621080054;
 Mon, 29 Mar 2021 13:04:54 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-6.0 2/2] hw/block/nvme: fix ref counting in nvme_format_ns
Date: Mon, 29 Mar 2021 19:04:49 +0200
Message-Id: <20210329170449.125958-3-its@irrelevant.dk>
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

Max noticed that since blk_aio_pwrite_zeroes() may invoke the callback
before returning, the callbacks will never see *count == 0 and thus
never free the count variable or decrement num_formats causing a CQE to
never be posted.

Coverity (CID 1451082) also picked up on the fact that count would not
be free'ed if the namespace was of zero size.

Fix both of these issues by explicitly checking *count and finalize for
the given namespace if --(*count) is zero. Enqueing a CQE if there are
no AIOs outstanding after this case is already handled by nvme_format()
by inspecting *num_formats.

Reported-by: Max Reitz <mreitz@redhat.com>
Reported-by: Coverity (CID 1451082)
Fixes: dc04d25e2f3f ("hw/block/nvme: add support for the format nvm command")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6842b01ab58b..c54ec3c9523c 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -5009,9 +5009,15 @@ static uint16_t nvme_format_ns(NvmeCtrl *n, NvmeNamespace *ns, uint8_t lbaf,
 
     }
 
-    (*count)--;
+    if (--(*count)) {
+        return NVME_NO_COMPLETE;
+    }
 
-    return NVME_NO_COMPLETE;
+    g_free(count);
+    ns->status = 0x0;
+    (*num_formats)--;
+
+    return NVME_SUCCESS;
 }
 
 static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
-- 
2.31.0


