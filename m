Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A113314A04
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:11:39 +0100 (CET)
Received: from localhost ([::1]:41170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9O7W-00008d-F6
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVP-0005FI-2J; Tue, 09 Feb 2021 02:32:15 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:35999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVA-0005he-7I; Tue, 09 Feb 2021 02:32:14 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 21309B5B;
 Tue,  9 Feb 2021 02:31:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 09 Feb 2021 02:31:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=LMfIxJ2sLmsLD
 4YQS18gURCQlBkFfzEZ9KxYTmO7Wn0=; b=F4KnoO8hmyqFj7i+WKigkVuttp7FX
 I7udfIGiT66Tgy+om8aolQoP4cSP16mZfA/Tn7dx5IC60DTNPeSFoYT0XHPM38wb
 ydoqrEuLf8waO67Yz3BfgqmqXV+MoAXStfC9jSoeMUvNDirQIqE1QnD/U8Vuih79
 ZATtkCughLz0/P2oZ5hrpa/cWQ9J2q+481w+EZlj+29GRcvvmy+Bb8fc/T9LhFjK
 rCrbStj9GkmPOezVAWrHyVjGUu4Pm3HRG86lgvdiQ6msyEXIpNFceY7vcZ6dkI9G
 L0zN95WDTjIm1NliWDziACnrNc4uA5h7iRD4sLjnyk6rNy+k9gc+cSOrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=LMfIxJ2sLmsLD4YQS18gURCQlBkFfzEZ9KxYTmO7Wn0=; b=jMrK96se
 eTgjN83lzBP304cZSrCC5fVhSG7Tc3GyKD2I0TFfalwMvnwL2HOMuqnnW23/iUTR
 U2REGUYQ7q26HH3/A5FkPTN3IFIyTRB+nCkkpgtg7g/nWk8bGZZWAPw7YSYMR2xB
 xmSPc/0q6rfxTOF5pOykiaune+bupPRdF8mIljEfIhqAwgXntF44cmS6LvSRjYPI
 XxwwsH3f4IM0Cy/1uZrAl6+Y8KYJSsd9uaA8x20vhLB2zhcxjDOeoj70XR86cn3O
 UNCvRzZB9B6b3HwKP2pc7ZzxED45Bp2tAk5MF2R0E1nvVm+ouwzKqVDso8eIDqzX
 KZK0cEWtezauJQ==
X-ME-Sender: <xms:azoiYOUBt84PQCk2fv7ba7P-MYo57PFj4N7eL5Svy35nVxvGq-yJHQ>
 <xme:azoiYO53U2Lcu2EYS-LlU1ZT6wYLcaP5xHJzg-DPvqGUxW62a8IKrIJjSidr77uQN
 ORb-nmdRXOSAiwRSUk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:azoiYBiXRqo2mthFJGxYk6gd9LXnWOqXRTWWT99RTfHnrW0H9dDqSA>
 <xmx:azoiYNfcv7dXu551sC65VKOEHK6i5U5obPdeHnh1dXVrS2BR0f6ETQ>
 <xmx:azoiYOc5zNmKepGlUXitM4y7UpbVHJrK5UUzT1zRFKBMpNh33ILpsA>
 <xmx:bDoiYA0XBp8gxFHfz5iqw3I1LM9BMi9LMZddeX7hqQ3xWY_L4Bu_Aw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 17E511080057;
 Tue,  9 Feb 2021 02:31:53 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 21/56] hw/block/nvme: conditionally enable DULBE for zoned
 namespaces
Date: Tue,  9 Feb 2021 08:30:26 +0100
Message-Id: <20210209073101.548811-22-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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

The device uses the BDRV_BLOCK_ZERO flag to determine the "deallocated"
status of logical blocks. Since the zoned namespaces command set
specification defines that logical blocks SHALL be marked as deallocated
when the zone is in the Empty or Offline states, DULBE can only be
supported if the zone size is a multiple of the calculated deallocation
granularity (reported in NPDG) which depends on the underlying block
device cluster size (if applicable) or the configured
discard_granularity.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 838b15c064f5..9be170abb78d 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -16,6 +16,7 @@
 #include "qemu/units.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
+#include "qemu/error-report.h"
 #include "hw/block/block.h"
 #include "hw/pci/pci.h"
 #include "sysemu/sysemu.h"
@@ -227,6 +228,22 @@ static void nvme_ns_init_zoned(NvmeCtrl *n, NvmeNamespace *ns, int lba_index)
     ns->id_ns.ncap = ns->id_ns.nsze;
     ns->id_ns.nuse = ns->id_ns.ncap;
 
+    /*
+     * The device uses the BDRV_BLOCK_ZERO flag to determine the "deallocated"
+     * status of logical blocks. Since the spec defines that logical blocks
+     * SHALL be deallocated when then zone is in the Empty or Offline states,
+     * we can only support DULBE if the zone size is a multiple of the
+     * calculated NPDG.
+     */
+    if (ns->zone_size % (ns->id_ns.npdg + 1)) {
+        warn_report("the zone size (%"PRIu64" blocks) is not a multiple of "
+                    "the calculated deallocation granularity (%d blocks); "
+                    "DULBE support disabled",
+                    ns->zone_size, ns->id_ns.npdg + 1);
+
+        ns->id_ns.nsfeat &= ~0x4;
+    }
+
     ns->id_ns_zoned = id_ns_z;
 }
 
-- 
2.30.0


