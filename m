Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 935013149E6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:03:33 +0100 (CET)
Received: from localhost ([::1]:59714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Nzg-0004Ne-AD
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:03:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUx-00059J-DJ; Tue, 09 Feb 2021 02:31:47 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:57287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUv-0005cZ-P4; Tue, 09 Feb 2021 02:31:47 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5893398E;
 Tue,  9 Feb 2021 02:31:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:31:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Jn+qG7gwinv5q
 71CZJxObJTC9+4z8QOj9Af8RJ+hvqg=; b=KRkkB2f8yAKtguPiNX2NdCCILFbEI
 9sjEbovFKe9ilEpuXQqWeK5GNRLyQk+VNTz644hIffFfZD6vSFckZjNg6OuYKl3/
 ZkqO6TLX4TkC3ZTkoSqR7TYMoMsv8LvSc5w0Xicin5sfGkgnGVGhzycCXvyrG4at
 P+1OF9tVw4F3DTWQEv8gJjmZK9IIP0NRq8kXhM+7DjYJV5Jdu8J3Gx6E5c5tvR3v
 AkXYbOUB+DxJO+0dg96Yjn/RJKDGnAUl0k6MVWdWGt8Sz9AS0ZiOpeeBsg1FjMlu
 ecIOYtberAdHxvVNp6kGA3NeNJUXFqAVt7jIphkRvAt56Fz09j3esS6YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Jn+qG7gwinv5q71CZJxObJTC9+4z8QOj9Af8RJ+hvqg=; b=UmiajgJB
 y2AZjEdb+nRmVVU5AO27BCGUXglF1FCehZxNzQQ5wajvGybXuGA0GAUgDw/UpoHE
 /JjKhZkJml9ZUgWFZJX8EmcxXfFV3WRKf1jOKyXjRoMEFuwgWe3a+66esLVfQ871
 wndiXb0RT7yteEUy58qu3cGZ6ucwqoIIpyET09u9KVRHK9oP4VuR1lpB0D6Y14gp
 GC9rVVeAtFWmPnhuX5qBnmu50o1pJ/FxYIsUAP7h8wbHBTDiAIGTpX18bHkEesCa
 lLv/eEpz20V+feeyqzzBpPIGiHaFPgh88VafxVy2EhsJMu7Clmf2j2ogF4WypLOb
 0D+W4sRcGT25Hg==
X-ME-Sender: <xms:XjoiYDvLrSPiewiQk5BV2sNhv5VmrFhP7-ud_3bZtn2iFnV4gvP8yw>
 <xme:XjoiYHuSeA4-bFk1kUch2ZIcXdy_ZTGQY_3LVtguS6ORqRgN9fAo_-poZGYoCsh8y
 ZjCM4HUeqpn84vTa_U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:XjoiYANkHxkZ_nFMaXThP9Zyz43sCsoQ1QQQJmW3oJaYWTz8wBkpWQ>
 <xmx:XjoiYN3CXR2dci2zbExyQelWIVC85MopZoD2QskogKRXtyoTHIFi4w>
 <xmx:XjoiYEMHTBJKYvhb0LS3Ktee2afQzOFAHklyueybg-axj2vdNrl0sQ>
 <xmx:XzoiYH_BEnyIcVF1qnV0goxzgIBcO5QsV71Abt2ChzPQs4pgaW8ApJIGmfs>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7F4211080057;
 Tue,  9 Feb 2021 02:31:41 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 14/56] hw/block/nvme: Support allocated CNS command variants
Date: Tue,  9 Feb 2021 08:30:19 +0100
Message-Id: <20210209073101.548811-15-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Niklas Cassel <niklas.cassel@wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Niklas Cassel <niklas.cassel@wdc.com>

Many CNS commands have "allocated" command variants. These include
a namespace as long as it is allocated, that is a namespace is
included regardless if it is active (attached) or not.

While these commands are optional (they are mandatory for controllers
supporting the namespace attachment command), our QEMU implementation
is more complete by actually providing support for these CNS values.

However, since our QEMU model currently does not support the namespace
attachment command, these new allocated CNS commands will return the
same result as the active CNS command variants.

The reason for not hooking up this command completely is because the
NVMe specification requires the namespace management command to be
supported if the namespace attachment command is supported.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 20 ++++++++++++--------
 hw/block/nvme.c      |  8 ++++++++
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 19347cf69e52..adb5806365a3 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -813,14 +813,18 @@ typedef struct QEMU_PACKED NvmePSD {
 #define NVME_IDENTIFY_DATA_SIZE 4096
 
 enum NvmeIdCns {
-    NVME_ID_CNS_NS                = 0x00,
-    NVME_ID_CNS_CTRL              = 0x01,
-    NVME_ID_CNS_NS_ACTIVE_LIST    = 0x02,
-    NVME_ID_CNS_NS_DESCR_LIST     = 0x03,
-    NVME_ID_CNS_CS_NS             = 0x05,
-    NVME_ID_CNS_CS_CTRL           = 0x06,
-    NVME_ID_CNS_CS_NS_ACTIVE_LIST = 0x07,
-    NVME_ID_CNS_IO_COMMAND_SET    = 0x1c,
+    NVME_ID_CNS_NS                    = 0x00,
+    NVME_ID_CNS_CTRL                  = 0x01,
+    NVME_ID_CNS_NS_ACTIVE_LIST        = 0x02,
+    NVME_ID_CNS_NS_DESCR_LIST         = 0x03,
+    NVME_ID_CNS_CS_NS                 = 0x05,
+    NVME_ID_CNS_CS_CTRL               = 0x06,
+    NVME_ID_CNS_CS_NS_ACTIVE_LIST     = 0x07,
+    NVME_ID_CNS_NS_PRESENT_LIST       = 0x10,
+    NVME_ID_CNS_NS_PRESENT            = 0x11,
+    NVME_ID_CNS_CS_NS_PRESENT_LIST    = 0x1a,
+    NVME_ID_CNS_CS_NS_PRESENT         = 0x1b,
+    NVME_ID_CNS_IO_COMMAND_SET        = 0x1c,
 };
 
 typedef struct QEMU_PACKED NvmeIdCtrl {
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 27679c8be816..f1cc66d381a1 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2008,16 +2008,24 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
 
     switch (le32_to_cpu(c->cns)) {
     case NVME_ID_CNS_NS:
+         /* fall through */
+    case NVME_ID_CNS_NS_PRESENT:
         return nvme_identify_ns(n, req);
     case NVME_ID_CNS_CS_NS:
+         /* fall through */
+    case NVME_ID_CNS_CS_NS_PRESENT:
         return nvme_identify_ns_csi(n, req);
     case NVME_ID_CNS_CTRL:
         return nvme_identify_ctrl(n, req);
     case NVME_ID_CNS_CS_CTRL:
         return nvme_identify_ctrl_csi(n, req);
     case NVME_ID_CNS_NS_ACTIVE_LIST:
+         /* fall through */
+    case NVME_ID_CNS_NS_PRESENT_LIST:
         return nvme_identify_nslist(n, req);
     case NVME_ID_CNS_CS_NS_ACTIVE_LIST:
+         /* fall through */
+    case NVME_ID_CNS_CS_NS_PRESENT_LIST:
         return nvme_identify_nslist_csi(n, req);
     case NVME_ID_CNS_NS_DESCR_LIST:
         return nvme_identify_ns_descr_list(n, req);
-- 
2.30.0


