Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17673364AE2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:59:46 +0200 (CEST)
Received: from localhost ([::1]:34790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYa3d-0004TX-0e
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZ6-0000Gs-1g; Mon, 19 Apr 2021 15:28:12 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:57171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZ3-0005FU-5i; Mon, 19 Apr 2021 15:28:11 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1507421C6;
 Mon, 19 Apr 2021 15:28:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 19 Apr 2021 15:28:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 Gj4lzynoXEvzGR1FErSY20W68A25AXO+LeASPiFmMCk=; b=y/Q3euSodSCs63Gv
 W2ms+2PuvAjDYzdSvSETadWk6Dl8kCDw+yM7annSbV1fKXrY8GNmx2VYFjdUKVrz
 pn86aAv0sV2G4waBD9jbwXtUg6DGh3mVbMsqO0/ksphwFqPE1+ZlkY0aI/AB76jJ
 sV7iqAW75PiFgwOTJhGSgE3I7D2CvlTRsLc6X0HbXzyNXoqNBb98gDlj978jDr2K
 /bMvtJx9hmWu8Tdi931X+e9pAndtO9AyiY/qg0oypiij/BtpFnuDyBU/WxuebFdV
 Q22FhYqXwKXCbY75CdkWDouhrFTv9I4AqxKk1PKHxZla43IDBGcet4cbMPEjqghZ
 eMbAww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Gj4lzynoXEvzGR1FErSY20W68A25AXO+LeASPiFmM
 Ck=; b=sB7ew2qd0IKKGjO6V8G67JgaE9WRNXy04jSFky245Yt98qLUOGXS1zasW
 X2rFJoJB2jqwSYnXTMpPPGvcR9Mehcm4o4ENu6qjlW+XqZ0UzuDQyZZmNTgLBW4B
 jX74Wm701x7yJw6slaijwoJD1fxqdUOgtNItGe5hjP0r1R/Ijso+285dWvle3G4r
 xsnu0+zTQa+0Bw4cIZYno6CC2NxAIB7GnJaRfwef/5+dO2MsefGxtuNoXto44Zo8
 hw7OkP88SEc6YhNjoTV7SJyZaLRWbQgFNpApMtohEwTcixr3BfaC8J4vJLBm753k
 JYbgMX48JJ1a6b+mTgAJMSkxZsMfQ==
X-ME-Sender: <xms:xdl9YMolvFjt83A_bpMCevgq5hMO_qH3GW7WKJA4znMD2MozT59FEw>
 <xme:xdl9YBuOsGJ5QlcNpIGHHYnlyn_DpJiTY6h6h6ZqyZ_2HLLP5zB3LSeOB5tX-BAc8
 lfkoUQMV4Lp2qgkYJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeetveeuudegveeiheegieelueeftedvtdekteefleegheduhfejueelvdfh
 ffdtgeenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:xdl9YHaBSaMRymbaLyXZba99jOHWVH_xDE9Ve6tJPu5HHUDu9OUkQQ>
 <xmx:xdl9YAZBTbIpQSLOFb3Baoowkj919wTc2pWRSTGdCRT9NA0F-DFb-Q>
 <xmx:xdl9YAmiFqG2VlWzu_gh30Q3k-nYV8eE18GxM8mR4jBVQVcz8U1AjQ>
 <xmx:xtl9YETkb8JKWQW_4aTP89XxnI2xPha4JkWY_ikIz4Bos77GxzNWwA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C1C041080064;
 Mon, 19 Apr 2021 15:28:04 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/14] hw/block/nvme: rename __nvme_zrm_open
Date: Mon, 19 Apr 2021 21:27:48 +0200
Message-Id: <20210419192801.62255-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192801.62255-1-its@irrelevant.dk>
References: <20210419192801.62255-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Get rid of the (reserved) double underscore use.

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 624a1431d072..002c0672b397 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1682,8 +1682,12 @@ static void nvme_zrm_auto_transition_zone(NvmeNamespace *ns)
     }
 }
 
-static uint16_t __nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone,
-                                bool implicit)
+enum {
+    NVME_ZRM_AUTO = 1 << 0,
+};
+
+static uint16_t nvme_zrm_open_flags(NvmeNamespace *ns, NvmeZone *zone,
+                                    int flags)
 {
     int act = 0;
     uint16_t status;
@@ -1707,7 +1711,7 @@ static uint16_t __nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone,
 
         nvme_aor_inc_open(ns);
 
-        if (implicit) {
+        if (flags & NVME_ZRM_AUTO) {
             nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_IMPLICITLY_OPEN);
             return NVME_SUCCESS;
         }
@@ -1715,7 +1719,7 @@ static uint16_t __nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone,
         /* fallthrough */
 
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
-        if (implicit) {
+        if (flags & NVME_ZRM_AUTO) {
             return NVME_SUCCESS;
         }
 
@@ -1733,12 +1737,12 @@ static uint16_t __nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone,
 
 static inline uint16_t nvme_zrm_auto(NvmeNamespace *ns, NvmeZone *zone)
 {
-    return __nvme_zrm_open(ns, zone, true);
+    return nvme_zrm_open_flags(ns, zone, NVME_ZRM_AUTO);
 }
 
 static inline uint16_t nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone)
 {
-    return __nvme_zrm_open(ns, zone, false);
+    return nvme_zrm_open_flags(ns, zone, 0);
 }
 
 static void __nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
-- 
2.31.1


