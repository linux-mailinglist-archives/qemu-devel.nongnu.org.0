Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA82364AF3
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:03:01 +0200 (CEST)
Received: from localhost ([::1]:41442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYa6m-00077V-6G
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZ9-0000Lp-UO; Mon, 19 Apr 2021 15:28:21 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:35157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZ7-0005Hd-An; Mon, 19 Apr 2021 15:28:15 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6BA5A21DD;
 Mon, 19 Apr 2021 15:28:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 19 Apr 2021 15:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=sVxu0jbTQzBvC
 dMoFOnqDnMeP6EYr6hv5hqGyuVN31A=; b=FXS0Wez7nRM46IUgZDiyKBHRBX+ty
 ABy3TCrQJ0S1xCYxivL8i4WtJMOnrgxpB93i7FeWYm2/Niz9D1YGE7yxJvetwMY2
 gga/M66Z3OgwvKWHsMxBI3g9ZpdJtR3BLpXEPw8a7JjMWnwoHu/pmSvMjo5cdWS4
 CILvSaB3Y8jpMtoV0MKxAR66XRCAwl8rNhAANUU284zr/zqvf0PNPNmiM9W+ykt0
 vVZFOq6pMbaiW05M7eLNCAptz/pWEJN++yaJ49YNRCOgaOC8Dyg9i/bap4Tc++ME
 HwUPo+wT1DapLbzVkfW6JxrlOxiaxHYfk14LsJO255Ks995quWltzkdBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=sVxu0jbTQzBvCdMoFOnqDnMeP6EYr6hv5hqGyuVN31A=; b=Q2YTi8qp
 gMC2ai834AxJj107x0D/c4YlLbwp0C/aVOEvjgqAI4MiBlHZi0IW1zjNhPixIBmT
 GFPwCS7mzFz8lf6DJa0qO1tO2JPqX6af7P3k+u5nrY3bJxAix1+DxcrYToRbekAv
 E7bsGlfSPxuqi9kw86WwHg+niJi320ehaXz6ea/rQTdTLg+R39yWHp7DvchFdbhd
 r7KvS1gfHF7a+EMiEaSetk1wI29Om8uabn3F0IFVuIq69yZlfLQ4kaZmDLF/hDge
 1+6dkiUHXtK6fr4lZssAgAVJxJw8o+lmvqlTyaaLkNdkIPBsY+C+iTCGR0m030r/
 gBCN6WFmuc9CfQ==
X-ME-Sender: <xms:y9l9YNAQHKENHm13u4aSgcdZI2LVWMRanr3WHlfdbjVBgoQPIqybtQ>
 <xme:y9l9YNEE1XjweJWsoOqY69ZXLJlDK7t7XYDUueTsXWY2QeHfqok5o4rIoKZBpEFkd
 bInf1sfyl901ruMtEs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:y9l9YO65fvsFTrlQzf3sVIvuv_Io2Ff1ZkLBQ_VRyN_oO8mMnGDcGw>
 <xmx:y9l9YDk3Dy-k31ug5ldAEJy7Swj8Ch6mpWbWUjzvJ9mxasqDX-W33g>
 <xmx:y9l9YJ66GDx7nlUD1TAx4XmXIhq1EPhha40n50NnEl42hJ-lzzTK-Q>
 <xmx:y9l9YPycoerzv1SEUV7kgAGK4toHXRR1QDUUNPVVnjaG8LmV1NWmVg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 17D791080057;
 Mon, 19 Apr 2021 15:28:09 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/14] hw/block/nvme: cleanup includes
Date: Mon, 19 Apr 2021 21:27:52 +0200
Message-Id: <20210419192801.62255-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192801.62255-1-its@irrelevant.dk>
References: <20210419192801.62255-1-its@irrelevant.dk>
MIME-Version: 1.0
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Clean up includes.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-dif.c    |  7 +++----
 hw/block/nvme-ns.c     | 11 ++---------
 hw/block/nvme-subsys.c | 12 +-----------
 hw/block/nvme.c        | 22 +++++++++-------------
 4 files changed, 15 insertions(+), 37 deletions(-)

diff --git a/hw/block/nvme-dif.c b/hw/block/nvme-dif.c
index 25e5a90854fa..e269d275ebed 100644
--- a/hw/block/nvme-dif.c
+++ b/hw/block/nvme-dif.c
@@ -9,12 +9,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/block/block.h"
-#include "sysemu/dma.h"
-#include "sysemu/block-backend.h"
 #include "qapi/error.h"
-#include "trace.h"
+#include "sysemu/block-backend.h"
+
 #include "nvme.h"
+#include "trace.h"
 
 uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint16_t ctrl, uint64_t slba,
                            uint32_t reftag)
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index b538c4c4a13c..aae06987e49a 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -14,20 +14,13 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
-#include "qemu/cutils.h"
-#include "qemu/log.h"
 #include "qemu/error-report.h"
-#include "hw/block/block.h"
-#include "hw/pci/pci.h"
+#include "qapi/error.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/block-backend.h"
-#include "qapi/error.h"
 
-#include "hw/qdev-properties.h"
-#include "hw/qdev-core.h"
-
-#include "trace.h"
 #include "nvme.h"
+#include "trace.h"
 
 #define MIN_DISCARD_GRANULARITY (4 * KiB)
 
diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
index b81067f7b0d3..192223d17ca1 100644
--- a/hw/block/nvme-subsys.c
+++ b/hw/block/nvme-subsys.c
@@ -6,19 +6,9 @@
  * This code is licensed under the GNU GPL v2.  Refer COPYING.
  */
 
-#include "qemu/units.h"
 #include "qemu/osdep.h"
-#include "qemu/uuid.h"
-#include "qemu/iov.h"
-#include "qemu/cutils.h"
 #include "qapi/error.h"
-#include "hw/qdev-properties.h"
-#include "hw/qdev-core.h"
-#include "hw/block/block.h"
-#include "block/aio.h"
-#include "block/accounting.h"
-#include "sysemu/sysemu.h"
-#include "hw/pci/pci.h"
+
 #include "nvme.h"
 
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index c51de480d9fd..f7c5e83e6800 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -135,24 +135,20 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/units.h"
+#include "qemu/cutils.h"
 #include "qemu/error-report.h"
-#include "hw/block/block.h"
-#include "hw/pci/msix.h"
-#include "hw/pci/pci.h"
-#include "hw/qdev-properties.h"
-#include "migration/vmstate.h"
-#include "sysemu/sysemu.h"
+#include "qemu/log.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
-#include "sysemu/hostmem.h"
+#include "sysemu/sysemu.h"
 #include "sysemu/block-backend.h"
-#include "exec/memory.h"
-#include "qemu/log.h"
-#include "qemu/module.h"
-#include "qemu/cutils.h"
-#include "trace.h"
+#include "sysemu/hostmem.h"
+#include "hw/pci/msix.h"
+#include "migration/vmstate.h"
+
 #include "nvme.h"
+#include "trace.h"
 
 #define NVME_MAX_IOQPAIRS 0xffff
 #define NVME_DB_SIZE  4
-- 
2.31.1


