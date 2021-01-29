Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C32E30874B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:21:35 +0100 (CET)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PyA-0008NH-8A
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l5Psg-0006Tf-MI; Fri, 29 Jan 2021 04:15:54 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:40803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l5Psc-0003dp-A6; Fri, 29 Jan 2021 04:15:54 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 875F55C01E4;
 Fri, 29 Jan 2021 04:15:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 29 Jan 2021 04:15:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=QeqOkmn85Ngxe
 aAB8t61RjJSup7bz7+mg7fgZj7T5AE=; b=knrPcMK3I3qSftCKJOWCqNgkcZF+L
 n/B9Z4nxF1grbwqu8CGdD4vwMiIzfy/BtQ/SrpvUkreq0z345w6qylycy1xVcrfz
 VyEN9+yfxSU6271WGIybVbNUWeWC8ovslgrtIhoEWxaBoA91racriFMLQrB3vsTz
 SghKbRKZX7pTQJhkUo5i24eASm9QW0dvo/CqR9ra50rMRmNOU2+JrrwpqHX1kryU
 lX9PvxrLQdWz3hzFJ6Tt3rPp/CB6ZdaxM1YXbI1FzsoBBYMUY5Nxi5AZA7dHsfeG
 KNjy86PxXjHfqwGzLy6eaCk6d2RrCKXdDNRHRiIu46ZLOaEjosMzw0vvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=QeqOkmn85NgxeaAB8t61RjJSup7bz7+mg7fgZj7T5AE=; b=H5zWDPDf
 ALuUsa307rvVFIbiC1GcNZB2jxgULnWeiEpO6jxt5UKXEJdHAwzBlnpgcLVnBEBF
 jH14WRor3qGJQwQvvv34XH7pehcdcbDT4ddvHUCCG+epcy9wYTYy8AFYNvEsjGOI
 oz/QccnQDQUhkH9qnTvsIwLquORrb3zAD+vHHaBBu4ha8uTJy+etCZnnbRQnQOtx
 3Fa298RDtpwP+9rpMZUU/SGyxtjHEXxF8Tn3p94oXDni8e73w5wa3sZIpSRcI4PM
 IIz1+EYSRNwU+4H6W53ca8m9WeAm5XeYH6MhHxbSOKJXeT53Cq2M5mx5UYKnTV7d
 1ODLiIqhunAdLA==
X-ME-Sender: <xms:RdITYG9qPwSEuQ5PDQ_twsP6pmKuEMfdmqqtNpS7bo_k9F9yAQKjIg>
 <xme:RdITYGsn6nDKewsgEcvtzEHUi_wM5tosuXHCR7_mytkxNW8ChlHi0Y-IYs52zDfc0
 YeyMvawKRXxI6mwVkI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhsucflvghn
 shgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrhhnpe
 euleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefgkeenucfk
 phepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:RdITYMBCIYup--8mMEGkZAOBOIKu8j3yEHd2xSY3wlavb51jqolCrg>
 <xmx:RdITYOdXBW2Js4D5OuK_V5t3JptOmib0kqzuhY1ejxTNbB6fjI3Mvg>
 <xmx:RdITYLO7d8_AbKv4kbJwRU-HcPiqDXrrkv-R9WRB6NUS-yw6gSOnjg>
 <xmx:RdITYHBJqBgdRwxw5NSOt5WrYUdTbE26rSjEWyNfXUkqLcBw5icslA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3D4BA24005B;
 Fri, 29 Jan 2021 04:15:48 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/5] hw/block/nvme: pull write pointer advancement to
 separate function
Date: Fri, 29 Jan 2021 10:15:39 +0100
Message-Id: <20210129091541.566330-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129091541.566330-1-its@irrelevant.dk>
References: <20210129091541.566330-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

In preparation for Simple Copy, pull write pointer advancement into a
separate function that is independent on an NvmeRequest.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 01d3801a3cd2..6df285ecac03 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1377,6 +1377,16 @@ static inline uint16_t nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone)
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
@@ -1388,11 +1398,7 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req)
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
2.30.0


