Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE2A3440BD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:20:26 +0100 (CET)
Received: from localhost ([::1]:50066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJXk-00020d-Sh
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lOJNc-0007NP-QS; Mon, 22 Mar 2021 08:09:56 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:36991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lOJNZ-0005xN-Ja; Mon, 22 Mar 2021 08:09:56 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 841111687;
 Mon, 22 Mar 2021 08:09:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 22 Mar 2021 08:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=8R+6fypkk9NqC
 8iq/W3FBFK+qJhM25Gah7l+8xTCQ3Q=; b=J8mlDRv3lSdlusmNVuVHOxeKEOpKE
 DW04GMVtz2CwfBTQKzFZ5b7PiT/rUBm9hRkj2QnYJBcKZMAVbCZcRl09xzyJMd87
 DdiW6SkucpZiB2du8KdblcxVVBNGI5JqNWB9H6Vk7J5wyvMzHZYyCyVamHfUA3ca
 dWlGSpqOYTRPwGx2z/SaPULbK8VQQfRyvcF8zt9dXtAflx5tin6jhJY877yOVa7+
 0e+ouQ3ahv+sQ9LBtxUYXhf4anv9J13l5yzNfeT5yQqJLk5WOf4AylPuNocgvho4
 WEZUMloPF2QYfi+aJkmHhc7PExrRwDRuhoB+LBn9cxUYlYj4IPc5nhbFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=8R+6fypkk9NqC8iq/W3FBFK+qJhM25Gah7l+8xTCQ3Q=; b=SzavBE/C
 kh+1DEnRdSofFHkA9C/SbywMqw3r6mQnSes9ZNuTPgT7k+vXSq76PMmCvccx/9Em
 A5m7gKdwbpi1Epsd4Ph51cVDI4nfV28z8k2QhI22To1+5NjId+wtRYEyfBldY/Pg
 NiN2198Wo6sQLDaz/MUmN5F5y44KpJPchPlWy3hG5+NDXMWILjZa71LRFmWuWbW4
 nrwkSkPJizmRMF+cPebORssekIV6cjR6vJLfCLmuUf/03/a8XuVH/CJaOzfvD8LV
 tbqzs03VVqKbCPKygpYI8lrEVncDUTlTS2oV7OSwOSKEPq9VNvCylUlBekXFNske
 HvKf0ujMkq+esg==
X-ME-Sender: <xms:DolYYK_d3KvQZC0pX7ZTSWIgBuMdPyUcn1fb0ypG62dJG3TAkexJtA>
 <xme:DolYYKZfBEWCnWUh1WhkELwx6SUyS8cidbLD_Yf258ec7F7QfcDAMBw2V_XJDI39K
 LUZAAwmv26fxovW98w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggedgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:DolYYLpjTNTd3_jlAf3KGulObZcJPH45-7tUY4WYgV1dgk2MmG0IuA>
 <xmx:DolYYOTV5TiUw3vR5e2vehAUtYEQgi_49ei0zYO57FEo-SN0t6IBPg>
 <xmx:DolYYPq8G5VFvSwyyAEYKVf6WhYQy5Q8LwT1caDdzzZxtibtaIWJWg>
 <xmx:D4lYYHtE9Vtv_Xx7X4asVU2n2qpNESIFzq3pnq5utUDuuJRo2Eq6eA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C57BD24042F;
 Mon, 22 Mar 2021 08:09:49 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] hw/block/nvme: fix ref counting in nvme_format_ns
Date: Mon, 22 Mar 2021 13:09:44 +0100
Message-Id: <20210322120944.225643-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322120944.225643-1-its@irrelevant.dk>
References: <20210322120944.225643-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
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


