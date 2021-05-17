Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DF13828A6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:45:00 +0200 (CEST)
Received: from localhost ([::1]:44836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZo2-0008T3-Vu
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOL-0003cV-4Z; Mon, 17 May 2021 05:18:25 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:54691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZOH-0005vZ-GX; Mon, 17 May 2021 05:18:24 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B5C0E245;
 Mon, 17 May 2021 05:18:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 17 May 2021 05:18:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=zNFmqvSBCk6PO
 GY56D88IfPoQkCsjbtO/Ssjh4efe48=; b=ACipFzK4brcP9GGhI22Pv5Ewexg1b
 aIG8d94xpnt5D94Fw34UIY85CZHwLtRAg3OmeUV7sf8r51IYRwA6UM4jINJO6klU
 oiVnh6k4CXx/odSP7J88enoRaghc6FgOfa9fWWRRCVP6/A2K0jERhskJpJougMCA
 OjATtO/nSI90N2JofOg10wx0pnb7I9OAsLtKcrMWsFkOh+HLOz8d7/XiAgjS+8qC
 VQhhbXckXw7WfQ5vEP9r76B7oSvFZ6gmdgfiVVp9/19QC/MJitA95G9Y3WLxovyk
 rXvGvYnOni2bXoja4mzt8qg3lDmQXOZCTGQWFLqfswnddhWL32r6yJxLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=zNFmqvSBCk6POGY56D88IfPoQkCsjbtO/Ssjh4efe48=; b=sNAM+3kM
 J6Pd/VqyecryqYZ+k/g7kWGoiy/FNsj84ZHrjhwLrC5qt5gKXq4KMPWuaZNbH5wt
 roPkcHN02Muq0fCSi61L+exNrL4606abxfauSAkAzrV6CAG5XkgwbzU4p72+rL2+
 CdPBiR7V7nl5gMyaRLQqNciDmWaPH4MO9cxNyEuHsiIO2hRiyZYM0GUNwebM7w6K
 8GHibvhaZoqbBRWLuPGksp1hHPTbJUOvVexavWfdFidF+X0Q9U/RWpNAgHkIuNHX
 +ZfzH6pEsfGwIacKcOJc8KXWZi13PbRoNOfWXt3NE1jeJsQlj/nt2VWsHvXRkYD0
 /Ngp9lCkvuFYDA==
X-ME-Sender: <xms:2jSiYBVkRskpACF0U3bYTf5qrqnwEa42cpPc3WkpJrEvha3VCHwBOQ>
 <xme:2jSiYBmXNbIpzc4rUBVT-LEdbZajsz98K5WZaZjNtNgbjYWb5NgPRK2xXw2KhccRJ
 X3HRYcnUCCfZU4XlxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:2jSiYNYj_vZhO7B_mh_yZL74gXVn2VpAiXdxNJcLprJ1ziHtHcQF9w>
 <xmx:2jSiYEXykmA6BQ05cpXkAdQYJ0b0saqDpKnZk2KugomuwBldhVOgkQ>
 <xmx:2jSiYLnpGo4TzRMz8ZSgFBmL7HhEG5JvkbYCoWePrqX1a8TeqOb35w>
 <xmx:2jSiYJUZh3RGunU_Rqmyc4ghBpLNWauUTtUsNRYFxNQ4uygSHu0q9A>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:18:16 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 11/20] hw/block/nvme: cleanup includes
Date: Mon, 17 May 2021 11:17:28 +0200
Message-Id: <20210517091737.841787-12-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
References: <20210517091737.841787-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Clean up includes.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme-dif.c    |  7 +++----
 hw/block/nvme-ns.c     | 11 ++---------
 hw/block/nvme-subsys.c | 11 +----------
 hw/block/nvme.c        | 22 +++++++++-------------
 4 files changed, 15 insertions(+), 36 deletions(-)

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
index 4d7103e78ff8..d91bf7bbbbbb 100644
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
index 3c404e3fcb78..192223d17ca1 100644
--- a/hw/block/nvme-subsys.c
+++ b/hw/block/nvme-subsys.c
@@ -6,18 +6,9 @@
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
-#include "hw/pci/pci.h"
+
 #include "nvme.h"
 
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 29f80d543903..e152c61adb76 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -144,24 +144,20 @@
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


