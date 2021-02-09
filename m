Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541FA314A7F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:41:35 +0100 (CET)
Received: from localhost ([::1]:58914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OaU-0003AO-C4
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NW0-0005Wj-TA; Tue, 09 Feb 2021 02:32:53 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:45543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVu-0005q9-Tb; Tue, 09 Feb 2021 02:32:52 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id F0BC2C57;
 Tue,  9 Feb 2021 02:32:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=bVXonVYw0HHda
 /05oYEykY+gyQ2uoBMbVLu5NqHgPeQ=; b=FNJFCnLdWp9jvNlVA83AKcAN5MZ5+
 G6i2RxBoSJHJZwGInGb+agXMwHbmxdlkxfHj2NbZYmeU9Hb3gQqcoOBape3/taCa
 7JYJHFNTg/idlJ+oFa0OlWyUCJDXPOBu5oTxGpaIm7kBf1n5Z+tcSbHjQz37oRCc
 NEQBX90EidX+H7IBw/YJVxBIgr/3sRv9Kgdv5uiXR0nAJVf3DC5wlm7E0/bae8Pv
 iGy1NANbyCO3Ta1s9KLfNtyv8rg8+X6hnysxBSl3U2sc6Vs2t23ZfNetAdbMXUJ+
 VQf4VL7NkOZkhdq+jiWdvMybGBLM9wXUiZE5xiekisfzRzuDSLRGCG7Hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=bVXonVYw0HHda/05oYEykY+gyQ2uoBMbVLu5NqHgPeQ=; b=mC7FC7LF
 CG+0/EzRxgA3r7eg1brjjyRGuhd7/dHb5noW/SzY/U1opa/3nuum5RHHKvTQw7in
 TFojol4r9Z84LVE7rbw1LWf74d+AjabUfXvOwDOxXWcgz7sNlxNMRFrooS8VnaSk
 B69Rv3D4JU/EwvIzWeiq4j1tjPa//zvgxfkwbH2Z/YJnR9PtYH0JnmJUJMnBqTFa
 Z9Mo2p3tGvFCqdurWwubdEv/Q6nl+LCZm6wy6dgqCqTnsORBQjy1tk1Oba4TfS7q
 69cPQHSjcU6B53PEJkY7dRbM8rlRKHlxD98OUWzTj0ly52RnKDp7sGqwrFKlUGyB
 F/xqrc+f2YdZVQ==
X-ME-Sender: <xms:fzoiYN-mcL2toXGniBnH-VKAmeEbKAnO2R7iQwccHvigLhTIwpcmeg>
 <xme:fzoiYBuDbV7Y8lxRhKAEeTgUyMoBgHu65FYKsnjn7W-eAR3yZ-37tCGdvye3GczYy
 i1J9FLfYlLUHRHwxUU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeeine
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:fzoiYLBsr9Z5NJ4qzqzXdiBYPvw5acFMuLvAhGVVWwkr7F0mxfShRQ>
 <xmx:fzoiYBfTehsI7mBwH2n1zULyhdIC0i8CD-_DlkumN_Md87VYsLbXKA>
 <xmx:fzoiYCNPatQ0zuzeZhcpkyPrS4YFXfPgVOMVPOlZ7ZVVxKTtoF1xyg>
 <xmx:fzoiYDjh0lj6-Bj9JVixBw2s89ZRqe-mVT82JUE4VBh54MVRGr_YG-JBEz8>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 29563108005C;
 Tue,  9 Feb 2021 02:32:14 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 34/56] hw/block/nvme: fix zone write finalize
Date: Tue,  9 Feb 2021 08:30:39 +0100
Message-Id: <20210209073101.548811-35-its@irrelevant.dk>
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

From: Klaus Jensen <k.jensen@samsung.com>

The zone write pointer is unconditionally advanced, even for write
faults. Make sure that the zone is always transitioned to Full if the
write pointer reaches zone capacity.

Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 30bd70fd5b07..4d73398798f1 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1268,10 +1268,13 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req,
     nlb = le16_to_cpu(rw->nlb) + 1;
     zone = nvme_get_zone_by_slba(ns, slba);
 
+    zone->d.wp += nlb;
+
     if (failed) {
         res->slba = 0;
-        zone->d.wp += nlb;
-    } else if (zone->w_ptr == nvme_zone_wr_boundary(zone)) {
+    }
+
+    if (zone->d.wp == nvme_zone_wr_boundary(zone)) {
         switch (nvme_get_zone_state(zone)) {
         case NVME_ZONE_STATE_IMPLICITLY_OPEN:
         case NVME_ZONE_STATE_EXPLICITLY_OPEN:
@@ -1288,9 +1291,6 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req,
         default:
             assert(false);
         }
-        zone->d.wp = zone->w_ptr;
-    } else {
-        zone->d.wp += nlb;
     }
 }
 
-- 
2.30.0


