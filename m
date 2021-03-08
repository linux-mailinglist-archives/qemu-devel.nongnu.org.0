Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE024330F79
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:37:35 +0100 (CET)
Received: from localhost ([::1]:33882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJG4k-0000MZ-Dq
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEw1-0003mS-Aq; Mon, 08 Mar 2021 07:24:30 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:52269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvn-00072g-1p; Mon, 08 Mar 2021 07:24:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D20A2360D;
 Mon,  8 Mar 2021 07:23:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=dYkrPhI8vlFGs
 Y94J2A9nUcxro1847H8wt3MQSSxHkQ=; b=sLyfa3mFF2GKmiTkWTUb3ENBQc2Fw
 cny5acnL/xyoK/NDfBd6yJH++ZWWjiAgIf/QWWHjp6aEpJeIIsiSKFsKFrjOVopv
 H1eUb9dOnZfw702pTK4PWhM/SeUZPbD5EQTY7uDRHKXGk5u2yazZRXxs1z1yo3MW
 rvfJ8d8dI7cG/hZl0XgK8x5ZoXx/vhUC0FaIgPWNxN6BmgUrbvywMAGyvalSs+4K
 yYJ6mhIubRsj8nNyqEAQaH89PJUYIeV0nkWMChGAgvum3sKf1TRRvGeVKYSvgP9F
 r/aNchX834BnBq7xz6bzeLnokI2JDIo+W6rH4FIy5YjzxF7A3s2lp77dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=dYkrPhI8vlFGsY94J2A9nUcxro1847H8wt3MQSSxHkQ=; b=f93B9m5I
 hC3CfjuwR2n1QBhmxBvLDxVUYWjSBkw0J6sL3i/pMnL+kuVWsuwXbyj4OFtvqP02
 aVlVw8ypHgfO5Lqcgovek/N/JHZQkJ7AnHH63fvqd/0OKk+YTV4EvVHIP7IyHur1
 zI5uIyOIf2a7UXXGTlAwL40fZU1RjdUUshgYCQjLpYGTNDKpDBJRt/TS+d6sMSPU
 jiWr6ROWuD+ZCI9R+MUmpU/9v6mnas8zELZdMBgfXJ/Lgtlsg+WUCM5yInl8f19L
 slJnanCvqtihKLVBDIQo0F7oghtXOsm3sYidOdILx+m161rozOp8DitYhAn9n+5s
 FVbIpyMUPgRUCQ==
X-ME-Sender: <xms:WBdGYKv9gxHey21YDfifYTb4SjO-b-FnGAmsZlIgHrFJhOPLE2SBJQ>
 <xme:WBdGYPe_tHYqWKBLOJuwosqIQ08MdX5BnMb1D-CRBZgtLDPltRoCnq5nE_vQxFb7i
 5eHcZZ7AaVDYkkfc98>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedule
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:WBdGYFz-gRDBK6oMUBqDpEH0SrgKABHHnD6TO_p-_f7JbLYuPJ_Qgw>
 <xmx:WBdGYFNhk1uyyUUc8mkE8ovgdWVYYbNumYIhrQYamCZqxOybowuqVQ>
 <xmx:WBdGYK_G-FVLSGAFBqWj1Jlu0ZheFJsvXgqeabj7cn3YvOoxLe3yqA>
 <xmx:WBdGYOQ1XS5yf3dAeYxoBrvoRSVCRD2w-q7_gafY096qMzZuFZ66LEr8PJY>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id F03CD1080059;
 Mon,  8 Mar 2021 07:23:50 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 23/38] hw/block/nvme: add trace event for zone read check
Date: Mon,  8 Mar 2021 13:22:58 +0100
Message-Id: <20210308122313.286938-24-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Add a trace event for the offline zone condition when checking zone
read.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
[k.jensen: split commit]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 7b4adb906fb4..961507cae28a 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1246,6 +1246,7 @@ static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
     case NVME_ZONE_STATE_READ_ONLY:
         return NVME_SUCCESS;
     case NVME_ZONE_STATE_OFFLINE:
+        trace_pci_nvme_err_zone_is_offline(zone->d.zslba);
         return NVME_ZONE_OFFLINE;
     default:
         assert(false);
-- 
2.30.1


