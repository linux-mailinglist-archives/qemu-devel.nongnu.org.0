Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DFC321F74
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 19:56:02 +0100 (CET)
Received: from localhost ([::1]:43098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEGNE-0001ih-Up
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 13:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEGFp-0004uv-C6; Mon, 22 Feb 2021 13:48:21 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:54791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEGFc-0003jC-Dq; Mon, 22 Feb 2021 13:48:21 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9C7285C01E9;
 Mon, 22 Feb 2021 13:48:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Feb 2021 13:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=pzxVJ9YSiEjZf
 jkT1kG8vMvk0JakKH9RYYr54alCiPU=; b=uMVwAPZwI3A2omD/ZugrCj/P6KujO
 FNfkKyJUxePi5YWICt7aBan3LIzsEtQ5+XraDo04QF2CEINBSGBABvNDe2uKPaVS
 JJEf7HTIbY2Cs/yrqPgOb+Zte6bIG8Lrw4eKAqN0pjhcxkLcf1KiV847uh0YNO1L
 BkOwqPbSx8/X6hf60p6RAd0mgg485sZ0mT/E9ac/ALH4GCBoGHAzW1xHhZmQIdjK
 YY7AWF/kBrZU1RW1YgQ4eRidnXNjbgbijBhij6Jxz7WtSGNeRos2OGrRHRdHCSpL
 CCEVjH2NEQ2L08lM099NYU9112KRKiMUfmoD/CM5d983DBadbHeOYlX4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=pzxVJ9YSiEjZfjkT1kG8vMvk0JakKH9RYYr54alCiPU=; b=pHUTk8bY
 6MCr9aURx3fjSr9VTn2gsLdgPa0wkomw4VMCcdndhhXEaQverEwLGXb+jz8GXmqv
 rZPQTItkiSwMEOkWNxp1ZA+XeddCHOp05a98jxZh73gftinrL9xW1LtO2dJgIdSd
 +E3zSCWIFqFXkRwLSPit1ru35ztXgmTaojomrIJES5AIqMSePb/Wje4NYv7j8kOO
 BQs/8jsxWstyAWRTW01FXq+RNpZdkhSGEQQUPW/3dwBKdZ4TZLBqfrP3yA6KN7sJ
 jHy7RbrjMqmyd6HQ6D79Hg2IB9vH/aFLg8fZJDip/nKI0ocOU4xYto0T/D1GxT2V
 a8Mh/+QVjxZ2qA==
X-ME-Sender: <xms:Z_wzYFu30ncBXDEIi-fpdbzHi8WwNyNeWVlF01A4dlWh7Dl_f3XPpQ>
 <xme:Z_wzYOfvTY-qKENLSc9uRZPqIfZVAmA8hYJhnkGjoaq0BRS_pcTzAnK4M9TpSz4Ge
 BQO9ZoNJYqu3XyloDU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Z_wzYIwHDXyl3PaMPd5uRB1US2fETwLZ7yEoMLy4sD845BGr6QCDWg>
 <xmx:Z_wzYMNqRyjMVGgNJXjEsR253fo3ZShIlnIx6O_thdkQJlIlMiHTyA>
 <xmx:Z_wzYF9rWxLLgrqKdyF07ffklRrG8KWx4i0ApCW_MzKfWvk8u79Z6w>
 <xmx:Z_wzYONBv0Xrz6WDrUlBo78X3uyXeuCi406OEY4WLHa4lAM2fw0epw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3874D24005B;
 Mon, 22 Feb 2021 13:48:06 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] hw/block/nvme: fix potential compilation error
Date: Mon, 22 Feb 2021 19:47:57 +0100
Message-Id: <20210222184759.65041-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222184759.65041-1-its@irrelevant.dk>
References: <20210222184759.65041-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

assert may be compiled to a noop and we could end up returning an
uninitialized status.

Fix this by always returning Internal Device Error as a fallback.

Note that, as pointed out by Philippe, per commit 262a69f4282 ("osdep.h:
Prohibit disabling assert() in supported builds") this shouldn't be
possible. But clean it up so we don't worry about it again.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
[k.jensen: split commit]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index ddc83f7f7a19..dcd51a52951c 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1232,8 +1232,6 @@ static uint16_t nvme_check_zone_write(NvmeNamespace *ns, NvmeZone *zone,
 
 static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
 {
-    uint16_t status;
-
     switch (nvme_get_zone_state(zone)) {
     case NVME_ZONE_STATE_EMPTY:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
@@ -1241,16 +1239,14 @@ static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
     case NVME_ZONE_STATE_FULL:
     case NVME_ZONE_STATE_CLOSED:
     case NVME_ZONE_STATE_READ_ONLY:
-        status = NVME_SUCCESS;
-        break;
+        return NVME_SUCCESS;
     case NVME_ZONE_STATE_OFFLINE:
-        status = NVME_ZONE_OFFLINE;
-        break;
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


