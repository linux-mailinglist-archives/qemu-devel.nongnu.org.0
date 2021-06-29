Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1153B7880
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:19:48 +0200 (CEST)
Received: from localhost ([::1]:38482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJGt-0007Qd-Dg
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImc-0001T4-Bs; Tue, 29 Jun 2021 14:48:30 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:58629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImW-0005Qm-0I; Tue, 29 Jun 2021 14:48:30 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id D29062B00AB1;
 Tue, 29 Jun 2021 14:48:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 29 Jun 2021 14:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=sayXcsn4DEb9/
 gACYLFIhgMEM0NU2CKj9XIdsqrahu4=; b=B6so6S1vONCZZGuVwMubtDDy1SLsV
 RNzqlcumX5aohbRCRCG2oWucN8jk9/Cv78b0VG2Pe7vv3tuS51xwPK5tYN9yCOfu
 DU3ODmZ0phCpzwmrUWYADOYm1Xxkp8mSYU6cQrHtZUrg5atKdmn0RyYe8ygcCXv8
 fElNLFHE7HnSJWVBq2B8Y3DLjM1/D78uKIiWJgKxsX8DqczS0tGW6LEbCui9GpW4
 ybSTkWiFKA6wsvUQeMMUX5A/LF9Ha/YZcVXV1GBjKtBNwUNS8UMYe9Ln88vgk7+N
 s74DrBMFmcNU6L7WUI9sUtzOndCaInycT0oI6lTfDLH8JVLw1Ud6f693g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=sayXcsn4DEb9/gACYLFIhgMEM0NU2CKj9XIdsqrahu4=; b=T9tgSc/S
 YW9Mehv4MU/ZkW/J1b3fBXAnFgLMQdzpogWP6mZwD+EOSktGOY0jZqME30rP9X6k
 pEcbX4r9JnkarUWohJvlbCY2LdxHJiZthIkoJowPgtS3e6nbUhEL3xnnl0fHVYun
 zmvVh18jWhnhOtoO4z5XTBzsmMkDMmtlTpVDlTODjHL2Ja4I3ZKCVSlsQlBSM8Ur
 Ys+GcZUB19YAXPFQv2mgWVGSzyA7PhJb2Hhm3mFM/ShichS54pd/k0sE9EJFK8wn
 /IoCS71OT7jB24fOvhNMTBIicBLj/Vjagr6Z2kkCNfyiOW1/7k5o+XVCq9P4f/oA
 z9GnBsOZ4p90jg==
X-ME-Sender: <xms:9GrbYMv3YnKsslpYl6dBplIzhTlFUopmqMyQL3PvMqhra7RFZmzDJA>
 <xme:9GrbYJf_3V-Qh2thWMJWA6DlmQw7rL88d-CtGCumBMl6eniGkdgDelGpIxalTJTK1
 H8gQvqo6KJkV_f_L5o>
X-ME-Received: <xmr:9GrbYHzVu829hvD7K6UquntVZ13mUEvK-8WHOT7E4ROTg9ami5cBSOikz9HhLwqWC5bmGtRZXpXGlG06l3hbQaXwuVjQe-jAq1_Jw2Pz3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:9GrbYPO5-vUQXVcZLjw7MzvzIa5DPlso3j8HcsSUXi6k-LXpey4YqA>
 <xmx:9GrbYM9CGWEpAzg-4DQTo2jNAJGG4l1hbjEoGtKPlOXULcrTSobnnw>
 <xmx:9GrbYHUIgqNItw1SU0T0J1jWpKiymyhUfwT3dS4y49wvJFdFkLji2A>
 <xmx:9WrbYN0mIlAsw2Ls9tXwtVLzYf2eswswUgyy0GA4g50TKkIVNWKGIU51PpM>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:48:18 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 09/23] hw/nvme: add nvme_block_status_all helper
Date: Tue, 29 Jun 2021 20:47:29 +0200
Message-Id: <20210629184743.230173-10-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629184743.230173-1-its@irrelevant.dk>
References: <20210629184743.230173-1-its@irrelevant.dk>
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Pull the gist of nvme_check_dulbe() into a helper function. This is in
preparation for dsm refactoring.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/nvme/ctrl.c | 41 ++++++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 26c65a12e80c..5777c7ea1704 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1438,18 +1438,15 @@ static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_check_dulbe(NvmeNamespace *ns, uint64_t slba,
-                                 uint32_t nlb)
+static int nvme_block_status_all(NvmeNamespace *ns, uint64_t slba,
+                                 uint32_t nlb, int flags)
 {
     BlockDriverState *bs = blk_bs(ns->blkconf.blk);
 
     int64_t pnum = 0, bytes = nvme_l2b(ns, nlb);
     int64_t offset = nvme_l2b(ns, slba);
-    bool zeroed;
     int ret;
 
-    Error *local_err = NULL;
-
     /*
      * `pnum` holds the number of bytes after offset that shares the same
      * allocation status as the byte at offset. If `pnum` is different from
@@ -1461,23 +1458,41 @@ static uint16_t nvme_check_dulbe(NvmeNamespace *ns, uint64_t slba,
 
         ret = bdrv_block_status(bs, offset, bytes, &pnum, NULL, NULL);
         if (ret < 0) {
-            error_setg_errno(&local_err, -ret, "unable to get block status");
-            error_report_err(local_err);
-
-            return NVME_INTERNAL_DEV_ERROR;
+            return ret;
         }
 
-        zeroed = !!(ret & BDRV_BLOCK_ZERO);
 
-        trace_pci_nvme_block_status(offset, bytes, pnum, ret, zeroed);
+        trace_pci_nvme_block_status(offset, bytes, pnum, ret,
+                                    !!(ret & BDRV_BLOCK_ZERO));
 
-        if (zeroed) {
-            return NVME_DULB;
+        if (!(ret & flags)) {
+            return 1;
         }
 
         offset += pnum;
     } while (pnum != bytes);
 
+    return 0;
+}
+
+static uint16_t nvme_check_dulbe(NvmeNamespace *ns, uint64_t slba,
+                                 uint32_t nlb)
+{
+    int ret;
+    Error *err = NULL;
+
+    ret = nvme_block_status_all(ns, slba, nlb, BDRV_BLOCK_DATA);
+    if (ret) {
+        if (ret < 0) {
+            error_setg_errno(&err, -ret, "unable to get block status");
+            error_report_err(err);
+
+            return NVME_INTERNAL_DEV_ERROR;
+        }
+
+        return NVME_DULB;
+    }
+
     return NVME_SUCCESS;
 }
 
-- 
2.32.0


