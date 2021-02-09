Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692B7314A21
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:19:19 +0100 (CET)
Received: from localhost ([::1]:51592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OEw-0004u3-8h
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVx-0005Rz-No; Tue, 09 Feb 2021 02:32:49 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:34551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVn-0005ns-8B; Tue, 09 Feb 2021 02:32:49 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id A9F2CC55;
 Tue,  9 Feb 2021 02:32:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=6+pcpx4pBI8uk
 rSuy2ttlmHr1kb4cFh+LVOroKS83zE=; b=09wOn0iXWivdrcP2Zc4aQnGsJwEe+
 YOlCKaAPkEgJ13zU1cpScRR9oGjOPvG41o9EmmNZ//q4+hyXefGkXRn557NtSryN
 ok3cfLpaHdx/XULOhLj4hbe8bARsgBcdclw56ro1IKF0vlMPL2yRRy/PQWzYiDxL
 ZWcxt9jA9BcDnHi6GXFuKgw3xlM9jr9vU/ghUWvx1gXbDK8qrPp4bFbWwhds0SO1
 0QnvAURibEAflKnT/7yzRuDTjCj5KB2sy76MAToPK/iUbTc4PWi8Aj9BcCSvb9vt
 7ruQ13sq2XS5KCRR3HKT0Xh13fsACXfMsDten3nSwMQFQAilSaLaiiBcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=6+pcpx4pBI8ukrSuy2ttlmHr1kb4cFh+LVOroKS83zE=; b=fyBPr/oX
 rvqJaVqFF+cY2LTHW94um8rvRsXIkg6aRlKZVH2MGUqYpymIk051ANUzooa6NQXD
 MY4KLv3cJMA+bywkrqcZf3EhHG4FuIZOBbQ7N4XHsVEtwxkoi0TNp4/Uul009HPC
 DATrCZhCc6uNyXp2T/HIFj0CKkKywVatLvPZCHKLH9+cnhH75UIpJi9g7BwMQWrf
 cLCYumy8ON0TJkl4Xkhs4kwE6fGmii+H2EtPMOg/saCF7cBSIbrx5Wn+YGI4gaul
 PL1QMFQcaGB/Y2y3jf/Mh7utTVFoTOsrXwoQ8/JJdH66ki8Q1yffyOkWyEIyP1bs
 dOt6h5LoHrPxpg==
X-ME-Sender: <xms:djoiYJE2Oy1IqdfJuPgVDXZuHVJ_kvvZfHGKGaEswhWRbOlAKrAiuQ>
 <xme:djoiYOWd3shM2AjYRuGpzRStfuJGsHOtVWQVc7oHtGPeI-y7zWqmcvEu1DMZ9O-cj
 ivQ4Y_rQJFNhctg_0s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:djoiYLJQIaVZyqXaVhmNRtByb7M4WyKAPzd7Z96JZYP08WJhtq_f4A>
 <xmx:djoiYPGzqkKWxZUTYBG1KlHfnpKr8zZXuT7qZNWgi5lhWLY0_qd3dA>
 <xmx:djoiYPXnyNwmrIjv1Zncb8xEfwpngQyEFyCwTMvpQGq87sSlROx87A>
 <xmx:djoiYLrJbbihdDLk3U-yPijwagtGdHoxxh4skVWm8P6-cwep7Dl1dxDSPCs>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D336D108005F;
 Tue,  9 Feb 2021 02:32:04 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 28/56] hw/block/nvme: Correct error status for unaligned ZA
Date: Tue,  9 Feb 2021 08:30:33 +0100
Message-Id: <20210209073101.548811-29-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Fomichev <dmitry.fomichev@wdc.com>

TP 4053 says (in section 2.3.1.1) -
... if a Zone Append command specifies a ZSLBA that is not the lowest
logical block address in that zone, then the controller shall abort
that command with a status code of Invalid Field In Command.

In the code, Zone Invalid Write is returned instead, fix this.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index c73afdf8054f..35f39ecd9559 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1150,7 +1150,7 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
         if (append) {
             if (unlikely(slba != zone->d.zslba)) {
                 trace_pci_nvme_err_append_not_at_start(slba, zone->d.zslba);
-                status = NVME_ZONE_INVALID_WRITE;
+                status = NVME_INVALID_FIELD;
             }
             if (nvme_l2b(ns, nlb) > (n->page_size << n->zasl)) {
                 trace_pci_nvme_err_append_too_large(slba, nlb, n->zasl);
-- 
2.30.0


