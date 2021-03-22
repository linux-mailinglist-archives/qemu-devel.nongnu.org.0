Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA868343970
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 07:27:22 +0100 (CET)
Received: from localhost ([::1]:33838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOE25-0005pk-Ao
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 02:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lODv1-00042e-K4; Mon, 22 Mar 2021 02:20:03 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:57435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lODuz-0007Gu-AE; Mon, 22 Mar 2021 02:20:03 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E12DE12BA;
 Mon, 22 Mar 2021 02:19:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Mar 2021 02:19:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ZypO/r3ZlL80/
 jeomDE8lGw5+jhPTLfOsFJbqgJ4nJ8=; b=Xnf2Nlt7XU1FkTjzTLKyjz8Y/4P/M
 RlXiw05M2B9z2MKu1JNJm/VlluxVeoQnQ444f23o/k8KXpMvb2Vh7QZE1TKzGoDp
 QRSUe+hWmLsTDJwDD4hmCTj1a9ycp87rLP4sf8tdN7YyzNr9GPEqUmMujIcVJxpm
 lO0ekj9RklL8m55POUPGGJ8OvITaAPFx/CleMQFZ4c1t6fgRbHlQ9l6GPr4qF7UM
 q4hFqsA7S3doaaV57vgZGE6H6fjukhTD1Ircyv4TLJUepqqPZYiR4lwhJanYKEni
 CfAZkj4XFq4jy7OK/nlrxbLjqX6hfmzkKAVllnSSlJU+DzcT92zTNJemQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ZypO/r3ZlL80/jeomDE8lGw5+jhPTLfOsFJbqgJ4nJ8=; b=IIY68NCL
 H8jGRYYSrzaB6eUr71WQCaodHRVcXCcM9VBSbc0vml9nlSgQkuDSrgBtVDsQQYsF
 aBCPSoadpGwNbmfnfUMeeUltyVllVo2brSnkYvW3/HdiekhjMOlubHYYA13FFt6P
 iEgWMm6uPBDj1wPwXcnaz/zBmbBtOKCj63w6LFhrdXTpyJBd9qsBvyayZhqGahmi
 4yKJXgY/gO834PGOxi9aaIdO9fieQ9SQNi88lOCyWUVmEUGzE3/YRaJBYnQCb3JQ
 05IQhldwiA9KTwFwkEzu3KBpGHp6JaTTW99d75vY4R5F4p0Rw3trIkfQ6UlShUxp
 jCYqcL6NVSKIog==
X-ME-Sender: <xms:DTdYYDo2WGXdiTQZBe0SU3icdD2oJJJB_BKpxLkj7ksy31DMJ4R6gg>
 <xme:DTdYYNpOtfggosmKBxurubwEtxyROSLyq8Q6hM75rH7p_is0R1zb13IVBI9igkoqY
 7_kHLWLtXssoQv6twM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegfedgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:DTdYYAPHYn6aju1ucIN90kKZ5zY0LJHogZg-CKIOsNW8PjmgwbU0OQ>
 <xmx:DTdYYG7aguReATYq61KDPKXrJ45nmfYYiOoJYnun881IJt39sFIvRA>
 <xmx:DTdYYC6Zodld_7YQPcqNeVDAb7CIr27FKF9oPNiw_SDorehJy3PrcA>
 <xmx:DTdYYN32RHv-XVAmu0jwZL6F0FocAyZX6_P5Uoyt_1drH8t1pg6HAQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7D8E824033F;
 Mon, 22 Mar 2021 02:19:56 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/block/nvme: fix resource leak in nvme_format_ns
Date: Mon, 22 Mar 2021 07:19:51 +0100
Message-Id: <20210322061951.186748-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322061951.186748-1-its@irrelevant.dk>
References: <20210322061951.186748-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

In nvme_format_ns(), if the namespace is of zero size (which might be
useless, but not invalid), the `count` variable will leak. Fix this by
returning early in that case.

Reported-by: Coverity (CID 1451082)
Fixes: dc04d25e2f3f ("hw/block/nvme: add support for the format nvm command")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6842b01ab58b..dad275971a84 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4984,6 +4984,11 @@ static uint16_t nvme_format_ns(NvmeCtrl *n, NvmeNamespace *ns, uint8_t lbaf,
     ns->status = NVME_FORMAT_IN_PROGRESS;
 
     len = ns->size;
+
+    if (!len) {
+        return NVME_SUCCESS;
+    }
+
     offset = 0;
 
     count = g_new(int, 1);
-- 
2.31.0


