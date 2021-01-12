Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C717A2F2CB6
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:26:11 +0100 (CET)
Received: from localhost ([::1]:38030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGsM-0000ou-Iz
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kzGCM-0005Ih-IR; Tue, 12 Jan 2021 04:42:46 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:58699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kzGCK-0007wd-7J; Tue, 12 Jan 2021 04:42:46 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id EBBD91D1E;
 Tue, 12 Jan 2021 04:42:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 12 Jan 2021 04:42:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=HLAQQIA8GM2FmwKmkjh+WE5cKc
 BjpRwoaSU6jxVpDjA=; b=YLDbBQAV5MryJUGGmiO51MyCYJhhjvWX9U1kMjo4WD
 E785pn8nPlwCo6NJY3XXkbLssi987FIBa1E2OnHLj5ejum7o7N+5Xei2sTMQbXge
 zaTajbrs5ugXR6xRr0T6urWjcUkKW7mz1k+i9cvpk+eTY1mpwsG/TFngtZbrID4p
 sLnbpfa/Y8Lx3ICxGAsENlsn8fHfhXVI8jte3QUToQn4bSUgNSeyWKyJ1yhh9g6a
 nG3Yhd1znLYKOo/Bsnp1NtSONz+p9dCpC23nRTrT0NSk0nSg5dGOEC+V79kal6ip
 R8EA4jNl6HPdn/dSVtDVkWev6V2wv7s9EJ57MYSqhG2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HLAQQIA8GM2FmwKmk
 jh+WE5cKcBjpRwoaSU6jxVpDjA=; b=Hanq3dIlMVWThrnXGvJTdR2CyH80EFRCQ
 dfDTugQI+CS4irjuM6XJoJCwdKGoux0UxiAtI/NQI3NG79z9V2l2xwkNl4ZltTt7
 VBQPQ740JAbo13HZc8/lGMwEjZR8VPiVSUqZ0zAaWHImUQCaLwWXOpJLzq+iC6Qq
 ZwnmHaAShPjrW1BwAdgNJN7fN1kHDJQka+XtOolSExYHDqXsQskEAHWc1ebk9s8j
 InH5N+SZXnZmCNoMx61+ojXMVv4JENFH8s7gRCZ5+zpXcQoJZ12mOuN0B+kcXatJ
 XnCi+Ni4UhSpAejKYKJKHv7QbiK+D2mW1qA3EP5MXDkBEKmeb8S2w==
X-ME-Sender: <xms:D2_9XxgLNZisdmOrM_PYpsMBQW8Vjh8AtmljE3Jn4Y3AnEqw_drldQ>
 <xme:D2_9X2Blo8irmqA6ldNFeEa93ru8zRNaw_yZ_E03O6JJwoUJHSp433MuS_wswAdkD
 Ze5mnEsQeGUZYfA3Ts>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehgedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpeefveelvdeikeduueffteeggeefhedvffffjeeuueeludehvdegjeevjefhtdetheen
 ucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:D2_9XxHChuYjJOS5C4gDtyJ3044s0fylUYtBo3iW9mAkYfaLvAAYXA>
 <xmx:D2_9X2RTSyQCGjsANlEIfpzjdW3exTGhHsOs1MYWx1xwG1lNJCIfjA>
 <xmx:D2_9X-wdcvUSki3hhk1MSmm3ByyAFjVOR0jzqpq3XO1UWRkMhH-UAg>
 <xmx:D2_9X1qnoz2et4PNX_hQ9wbl-WQjPLqCSeu6W2deRl350euExmHu_w>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 02A14108005C;
 Tue, 12 Jan 2021 04:42:37 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: fix zone write finalize
Date: Tue, 12 Jan 2021 10:42:35 +0100
Message-Id: <20210112094235.188686-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The zone write pointer is unconditionally advanced, even for write
faults. Make sure that the zone is always transitioned to Full if the
write pointer reaches zone capacity.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 0854ee307227..280b31b4459d 100644
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


