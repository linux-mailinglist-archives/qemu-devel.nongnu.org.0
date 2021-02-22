Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF8F32112F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 08:11:04 +0100 (CET)
Received: from localhost ([::1]:53756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE5N0-00086W-KT
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 02:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lE5J7-0006fl-5F; Mon, 22 Feb 2021 02:07:01 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:34849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lE5J1-00031K-Uf; Mon, 22 Feb 2021 02:07:00 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3020A5C00ED;
 Mon, 22 Feb 2021 02:06:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Feb 2021 02:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=FaKz61CQe4yI+
 mSp9LjyJedEU/bcxO58+8qrQ/MKnpg=; b=RDWGmbZKUj7QsBy5wgfPv+tma5Cvv
 pqGPi7HdBHX+Yg+0dsL0s12PWhhS1TtawieT1mlbRkkKsT0J+tjGwAVoyQA1xNRf
 ONzvpjkIRifZ1c5H7Y3VYKiC+6aZtGYUUb8tnEOaqPwmvxViHaSdd+NfCDicXZfb
 mGHnHHfeLs+I7I4tRAt9t7qavG3GMVD2V0mjLw7k4Ti5PWcXQtNcUWwCpo9zP+DZ
 T9OTTgLWauCS6j/ntZh9QcdsYpxTnoJN0ZeAtECSpeypJSalC4n7l/m2atPUIH64
 p07rj/jRAx9n9uKbUFNJ4+indaBZGLWqmaR/b8RjFgY17tef32XhrPlXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=FaKz61CQe4yI+mSp9LjyJedEU/bcxO58+8qrQ/MKnpg=; b=G1Ry0aar
 fTt9sJxCw+ouGACMf94XbQokN4g443hYHMtavLYN1kNnIBrY8ETRfvZivwEe5B76
 tyDYaoU4eAm0qe1zOLsdf4rU2toLu1DeFPV1/7Jzx6ETrJ3R2p1JA4XKCZLB6oKD
 yCJkV9T5TbnpdP6i3UdJPilZZjFWFiExYuQ1IqQ2l+Z4wcRi//acHfW6WJr1sV6b
 ATnynfbpiylvnR3VJZlNDzXJjpO5X/rbBdF3DE/ScBxS7JZLvj8FuEUqbEN0/RZU
 WdhEC5NO6v5rFmbI231S9EcE9EdKjhzutWtzd3iugtRRQIw0YC/5fWAeSJ3akI/q
 PvKk6J7ox5u2TQ==
X-ME-Sender: <xms:D1gzYEo8gvq_qJQb27nLPUMo3QBjnNI67H39cjfnKXONuOTcpJY0lw>
 <xme:D1gzYKpDzLMqpRQxT93Pl1LH-Fz5isfUT4JJkEbVuSt3E677W0pQe1OPTRiE-k0z0
 mhGCX7z7kx5LGKMiUY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkedvgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:D1gzYJPj29YW1UzyFTbtSgpnj6p-GBd7k1p2Nft592RqaH8Kn5a5kA>
 <xmx:D1gzYL5jfZTnsxBOsHvNWcPXnR08-FpS-W5_aULMMtUjx0njQ9nMyA>
 <xmx:D1gzYD7wa9RFmhANC19GZBI9cmPKKsTkPCZLAhcii5t71xDY03zW4g>
 <xmx:D1gzYGYM1ppN0dA1I7JXM7Xjf4Jj802OSyMW5-z4TzuYTm7UsmSd1Q>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B1EC224005A;
 Mon, 22 Feb 2021 02:06:52 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/block/nvme: fix potential compilation error
Date: Mon, 22 Feb 2021 08:06:14 +0100
Message-Id: <20210222070615.9177-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222070615.9177-1-its@irrelevant.dk>
References: <20210222070615.9177-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

assert may be compiled to a noop and we could end up returning an
uninitialized status.

Fix this by always returning Internal Device Error as a fallback.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index ddc83f7f7a19..897b9ff0db91 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1232,7 +1232,7 @@ static uint16_t nvme_check_zone_write(NvmeNamespace *ns, NvmeZone *zone,
 
 static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
 {
-    uint16_t status;
+    uint64_t zslba = zone->d.zslba;
 
     switch (nvme_get_zone_state(zone)) {
     case NVME_ZONE_STATE_EMPTY:
@@ -1241,16 +1241,15 @@ static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
     case NVME_ZONE_STATE_FULL:
     case NVME_ZONE_STATE_CLOSED:
     case NVME_ZONE_STATE_READ_ONLY:
-        status = NVME_SUCCESS;
-        break;
+        return NVME_SUCCESS;
     case NVME_ZONE_STATE_OFFLINE:
-        status = NVME_ZONE_OFFLINE;
-        break;
+        trace_pci_nvme_err_zone_is_offline(zslba);
+        return NVME_ZONE_OFFLINE;
     default:
         assert(false);
     }
 
-    return status;
+    return NVME_INTERNAL_DEV_ERROR;
 }
 
 static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
-- 
2.30.1


