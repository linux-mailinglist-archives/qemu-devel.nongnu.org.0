Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40F5332491
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:57:47 +0100 (CET)
Received: from localhost ([::1]:42746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJazi-00075r-Rm
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:57:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJanw-0008JC-9I; Tue, 09 Mar 2021 06:45:36 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:56649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJans-0000DL-ON; Tue, 09 Mar 2021 06:45:35 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 85D062705;
 Tue,  9 Mar 2021 06:45:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:45:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=uFb8yBQj3snFT
 6siiehYDGiWZqmzLiYnBeb/W4SacCo=; b=vUNESlEGEX7q9lOqkMGBS8Xf1pVO/
 GqDnpz8TaZzFypNPsI2OPgnBM3YxRqcYqbz5GvfnMbjjlSrNcZ+ocCWVZwvBGWTV
 DcoWDs97CM9sGwf23UrrlEMplVoi3Ljs0NmOEr/qVGvw65DbRL+9R0AJD56Ha/V0
 ediKY9k6p4TnujZ7bc7TIxQAg8pkQJ/p+1Z4DSW/mQIvMZ0SGGMvcnNXdS3/lS5j
 rjDByQ6wxdxBnvgXGNWKCnh7NGblobT1qBzf/Tr5il+5buRr274eL+iam5e6hKIQ
 sfPjgOj/IRTcWOpsUVnrKL76rD1A5sxbieAZ2wH01F0HEEDvU60onWemA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=uFb8yBQj3snFT6siiehYDGiWZqmzLiYnBeb/W4SacCo=; b=n+4Ii3pj
 QewV9OZfdhfwsZHB5EpADUHy4Lyhwm3mIcZ9xdu1UBT7mrHTctA+AISTZoktfcGw
 iX4YcJcT8mPbD59QMP3Js7Y7MIoRCOMBmGrBEHhQs/JgmDAFTRvblxgfXnt4B9ub
 vhC2/EXeV1JSeIog6f+DE9QkxTnjbI1FHvqj0Z71gKRqdq/PnKCMjNMv291v3/gw
 emnS1wTW6pc14fCB3yZJHLDTF+81dTbREgZvcN4HCCDgx3cVJS0iHSvfP6R0E3M5
 7zmiHRFYk7KUlsQ6irotdpR2CSYm+UX7/OU9IdvOCVa39fUp6wBx0CXABx9KUxSY
 /d1bZa+SzSII2A==
X-ME-Sender: <xms:2l9HYLMEunBg1TFJa1AerEU5lAYW8Y72RJF5aqD_wZRWlCkpWmxpOg>
 <xme:2l9HYF_uZvbyS_E1TPqLq9JPSHeDvXyJyIj3lBV5VfTaxJEakpLWjJDHqjimtYl6X
 yoQkplh3_vT0bUA4LM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeehne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:2l9HYKQw8Xz9qnOtXYu4u3kQ6qJSI2bbv78sr3wlhyq0LdEWndbsZw>
 <xmx:2l9HYPt5eDis3WMsRFVq3HGAvwtQ-OeYiQonhFI4_AlpVvNdOijkDw>
 <xmx:2l9HYDc2i6JIfYHpMRKCXt-rxdlWdoph-N2DcL3DFh7qZeMTQVGM5g>
 <xmx:2l9HYFvOdPOmBXuf5c379eaUrlujRBEw2f7iJtykP8z47DrlKYmdGQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C6B3824005A;
 Tue,  9 Mar 2021 06:45:28 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 09/38] hw/block/nvme: pull write pointer advancement to
 separate function
Date: Tue,  9 Mar 2021 12:44:43 +0100
Message-Id: <20210309114512.536489-10-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

In preparation for Simple Copy, pull write pointer advancement into a
separate function that is independent off an NvmeRequest.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 7897390b6d74..44129f8e8bb8 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1407,6 +1407,16 @@ static inline uint16_t nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone)
     return __nvme_zrm_open(ns, zone, false);
 }
 
+static void __nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
+                                   uint32_t nlb)
+{
+    zone->d.wp += nlb;
+
+    if (zone->d.wp == nvme_zone_wr_boundary(zone)) {
+        nvme_zrm_finish(ns, zone);
+    }
+}
+
 static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
@@ -1418,11 +1428,7 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req)
     nlb = le16_to_cpu(rw->nlb) + 1;
     zone = nvme_get_zone_by_slba(ns, slba);
 
-    zone->d.wp += nlb;
-
-    if (zone->d.wp == nvme_zone_wr_boundary(zone)) {
-        nvme_zrm_finish(ns, zone);
-    }
+    __nvme_advance_zone_wp(ns, zone, nlb);
 }
 
 static inline bool nvme_is_write(NvmeRequest *req)
-- 
2.30.1


