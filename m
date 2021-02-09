Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC86314A56
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:33:22 +0100 (CET)
Received: from localhost ([::1]:40338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OSX-0003lW-4a
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVz-0005U8-9l; Tue, 09 Feb 2021 02:32:51 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:39671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVp-0005oA-3r; Tue, 09 Feb 2021 02:32:51 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id C5D22C18;
 Tue,  9 Feb 2021 02:32:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=KNXtMkkWvFtMy
 AmmS36ABNVZu3UV2AC5DlGj7Ivf8fQ=; b=I7Y8X30vuSdVI2/onsnGTB6YHLnql
 9YIi6M/F3cciBtodVfRE1a6KtsGqibpW2swRes++/WN8OO2Go7999aEahDnMUSrI
 78TA4Oa7rVg4+CuuUHVzez9Uh5jtaBWjJjrWJMn23eVIQm4892x3KiB39aV7sxrt
 9dPLgnGIOCWEu2+aU7K3fEEoAbnPFQf3HiAJsDUn8GmIOLwK/yT+vaBhZikKNsik
 a2dckhVLJmla+zposjz+wiFwGTNNdPDoIz+Ksd1Y4hz/yMIIbnexxbvK9d+kOBjR
 JUiGe7229+DTJXb6k7TzJJvVuYLy/r6FaWfXsevoN4LjfL+3Kj+0KTpTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=KNXtMkkWvFtMyAmmS36ABNVZu3UV2AC5DlGj7Ivf8fQ=; b=oT5rYzUR
 2/vSkIBS9nFxnP57iYb+kfw+sn46PoX1tVRKfoGE3TdJL4NBIWLBt+63GOFoUo3E
 3kaIxlGh3fVehUSWets5n2upLjuJFdtceu98N9ufZ0P35Z59Ms1h5/x1onqCQ/Lp
 sKU36Uava2A7qT3vZpLbiW1lxW2XW/YhmbBsH8Jw4iD82dtyCITPhsoR3mHlYqkz
 X4RcvYGAonJalN/hzPP2JrK9YfeX3Zch97/pOekLBXnvfpinPXV3nxAD4QXC2R7q
 UCIfB9699x3WwqOgXAcAsFtOiuOWevnHCaplaLuS+BFZ+DFfPOedU/UxvumMxYg7
 6xBH1P9W4SnO8w==
X-ME-Sender: <xms:eToiYNMcOwOCaLs2QCjtG_DuqQb5i1UZ3CMwtvEUTq7613LoHk_uFA>
 <xme:eToiYP_zilBRv3gBGeJs0GfkuNSXqxFqFTtg7LzbetQyg0f0QqTPZUNZU9pYxQ6Zy
 j7r9BmZU-x8qscWAe8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:eToiYMRV1Srstdokd0Rh5fZAK3QCfeSg8v6tDaZm-G_QWUuQ3wnxVg>
 <xmx:eToiYJsIdzXqdwAMlsQrGAUwQyRjldrPJH4_rnUZ2vzRfli6VE0MiA>
 <xmx:eToiYFewkUrWKdN27JnG_XuzQSvO71ak2uL2LOh5XDKXnxNSJrDvXw>
 <xmx:eToiYEw3VR_jxxGd9tgQmLAmtmbJJSGujXw0185D1y8Xw_E4QYNs55GQ-hI>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id ED07C108005B;
 Tue,  9 Feb 2021 02:32:07 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 30/56] hw/block/nvme: open code for volatile write cache
Date: Tue,  9 Feb 2021 08:30:35 +0100
Message-Id: <20210209073101.548811-31-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

Volatile Write Cache(VWC) feature is set in nvme_ns_setup() in the
initial time.  This feature is related to block device backed,  but this
feature is controlled in controller level via Set/Get Features command.

This patch removed dependency between nvme and nvme-ns to manage the VWC
flag value.  Also, it open coded the Get Features for VWC to check all
namespaces attached to the controller, and if false detected, return
directly false.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
[k.jensen: report write cache preset if present on ANY namespace]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h    |  1 -
 hw/block/nvme-ns.c |  4 ----
 hw/block/nvme.c    | 15 ++++++++++++---
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 65540b650e1d..347c149e7905 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -121,7 +121,6 @@ typedef struct NvmeFeatureVal {
         uint16_t temp_thresh_low;
     };
     uint32_t    async_config;
-    uint32_t    vwc;
 } NvmeFeatureVal;
 
 typedef struct NvmeCtrl {
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index d35c2925ecb8..7a5a77983798 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -90,10 +90,6 @@ static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
-    if (blk_enable_write_cache(ns->blkconf.blk)) {
-        n->features.vwc = 0x1;
-    }
-
     return 0;
 }
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 35f39ecd9559..0b002cb2beab 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3097,6 +3097,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
     NvmeGetFeatureSelect sel = NVME_GETFEAT_SELECT(dw10);
     uint16_t iv;
     NvmeNamespace *ns;
+    int i;
 
     static const uint32_t nvme_feature_default[NVME_FID_MAX] = {
         [NVME_ARBITRATION] = NVME_ARB_AB_NOLIMIT,
@@ -3172,7 +3173,17 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
         result = ns->features.err_rec;
         goto out;
     case NVME_VOLATILE_WRITE_CACHE:
-        result = n->features.vwc;
+        for (i = 1; i <= n->num_namespaces; i++) {
+            ns = nvme_ns(n, i);
+            if (!ns) {
+                continue;
+            }
+
+            result = blk_enable_write_cache(ns->blkconf.blk);
+            if (result) {
+                break;
+            }
+        }
         trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
         goto out;
     case NVME_ASYNCHRONOUS_EVENT_CONF:
@@ -3335,8 +3346,6 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
         ns->features.err_rec = dw11;
         break;
     case NVME_VOLATILE_WRITE_CACHE:
-        n->features.vwc = dw11 & 0x1;
-
         for (i = 1; i <= n->num_namespaces; i++) {
             ns = nvme_ns(n, i);
             if (!ns) {
-- 
2.30.0


