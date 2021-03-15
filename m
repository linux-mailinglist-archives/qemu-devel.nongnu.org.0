Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4B933B0AE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:10:36 +0100 (CET)
Received: from localhost ([::1]:48670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLl7L-00064S-J6
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lLl1A-0004Fw-QC; Mon, 15 Mar 2021 07:04:12 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:48783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lLl17-0006RW-GX; Mon, 15 Mar 2021 07:04:12 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2AF282199;
 Mon, 15 Mar 2021 07:04:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 15 Mar 2021 07:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=lGPxTMZn8A6XF
 1MXAYyg7rGrO8x4Ph6lfkznHh5vIFI=; b=iJiEqo3h7em2r8JhttawUzqa/u5Qw
 4fFWIgwj3QwTdmZkSD9YYxqfQgDkk1fQAnrIE8m32GzPStfztBIxMdL0ubgPXdS/
 pMRTWY37awFOOVmrGlEKfSdTZyDr/Nm3Xn9fFlIkUzcZcfTZU4LeuUIa6pdroT9M
 slLGCBU2a0AS86EEtwtj4jbVfP7Ox3zaU/kH34Bg8ovVN4arvQMUB/uG6aQxzEIt
 4lelOGCV24XvBH34rhmDs+EIBt6C/KkOaOZLzOGOeD3T+H/Q/iZySJ/77iakN/Cv
 dQV2055Vu5eal3+AbbGyqDQhFt5USoFORDwsqmA0zrn+PAIwlBdu6QPTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=lGPxTMZn8A6XF1MXAYyg7rGrO8x4Ph6lfkznHh5vIFI=; b=QEtOwdFH
 RBFkK4e5t+BR1tRT/EyfDuyBFb8GdPPRnNW4SXkMsto1UaTGdheGlTRzMLk6GBOJ
 hemNhGg4mxQUuZ+zIfcdjfEMEMmlER65UvKmz9bO8FQ2ZztEHdKxugqEjClIEdKa
 fHt/SIS+L7COgFs1fX65M3DA+QjsXzS7Q0ZqczLvokAIILcVhJbZpyZ/Ytu2NI5w
 bwHKR7GaazIGkl2VdjPmOcdRzhxDhfB84KjBwUT/M0l9HYWi/nyGanem4I0WmeP9
 mLXGrwhTcCbUcNxcZ6+7+jRYgoJBIObR5oG3GZWSfFPu5TlKFRvFbaAhp/gbNLQa
 9+ud7qdguv8qCw==
X-ME-Sender: <xms:Iz9PYK9NYlNtuyupw1ZkK_1ntKisk86nWKoeHmU4B8uGqiqzY4Gn9w>
 <xme:Iz9PYKtp8Hk7IW1ImdAidEAUeJUPExGBB3spvdps7vipK67xROq6wvTNzyCyepBfC
 8A2EW7tjvFy87jzrUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvledgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Iz9PYAD4UJW0zv0kO3MzBeH_ZZGPVV-E7dtkViK_P8zgxY89oC4TcA>
 <xmx:Iz9PYCcELTffdKmHTNt_cPitk5fgKLOJAX4MiIcbIWynflbupge4fg>
 <xmx:Iz9PYPOSHdJBxB4skOVoXqfD-NNc89wBhRhdWNB3XOlRdeNpC97DXg>
 <xmx:Iz9PYErnAXZ1-Ov0DQllzNuhHjbtfTSgYqHCRIYL5iVrznmR1mseoQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id BFE2E24005B;
 Mon, 15 Mar 2021 07:04:02 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/block/nvme: fix potential overflow
Date: Mon, 15 Mar 2021 12:03:58 +0100
Message-Id: <20210315110359.51450-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210315110359.51450-1-its@irrelevant.dk>
References: <20210315110359.51450-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

page_size is a uint32_t, and zasl is a uint8_t, so the expression
`page_size << zasl` is done using 32-bit arithmetic and might overflow.
Since we then compare this against a 64 bit data_size value, Coverity
complains that we might overflow unintentionally. An MDTS/ZASL value in
excess of 4GiB is probably impractical, but it is not entirely
unrealistic, so add a cast such that we handle that case properly.

Fixes: 578d914b263c ("hw/block/nvme: align zoned.zasl with mdts")
Fixes: CID 1450756
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d439e44db839..f8ad34077000 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2188,7 +2188,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
                 goto invalid;
             }
 
-            if (n->params.zasl && data_size > n->page_size << n->params.zasl) {
+            if (n->params.zasl && data_size > (uint64_t)n->page_size << n->params.zasl) {
                 trace_pci_nvme_err_zasl(data_size);
                 return NVME_INVALID_FIELD | NVME_DNR;
             }
-- 
2.30.1


