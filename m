Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4813339CE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:18:26 +0100 (CET)
Received: from localhost ([::1]:53958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvv6-0003zZ-U5
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXZ-0007av-5G; Wed, 10 Mar 2021 04:54:05 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:42233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXW-00059Z-4L; Wed, 10 Mar 2021 04:54:04 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5039B5C0143;
 Wed, 10 Mar 2021 04:54:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Mar 2021 04:54:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=i40kluUep3MRg
 yO0mjv2mKZ0t1c6G7kMDepxeE8+Bu4=; b=pVlH9Jcc1oL0X+kOWGwPCHzlpPlCK
 Rmt/qgk7de5Hr/NHyyIgVrj2nUjF3Mexi11wtBygNbHyPHFtfktTD9BhpZB0lCkC
 MEWSGZfO1raesAVvSCs5WcnuDlxmHA2PWQt6f0co6TPx3bK8p91WM4PiYed9Nt5Y
 ml99rp6FsSSHLp9aCsZtR1aR2HoutIF0FdIF6plO84kFelW7NtqsKx0EwDTnD6Dm
 Eo2uz+fX8MenoCL0ikCUDavGXByqnivpSDLuRgfyu74zrFHOr2mQAx4+iavi06q1
 TAPTfZDonMIbbgwg79wsFWKxYvtD3YfEgmNbgDzHKTCdrOsZZnDEmcDDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=i40kluUep3MRgyO0mjv2mKZ0t1c6G7kMDepxeE8+Bu4=; b=cEenBf7j
 Qkot8pV6ysFcjtplLLEwkWZ857+/sX1I6p8ILl++OhhmXXVePBwPMs8ZxlZCgJPL
 AkJq5DjGnt73SBcDvIwn0Z7ZKN+ZxPTFBEU2dHcImLSPGADqb0w24bYN0ursv+n1
 4fb2Xtlu1rInmCvZ1/h8WakL+7Q9bMKI47Q6ifot0QbVRHV8odQT1ihaR1oauond
 kvknFLUD/rD8VOnG2Nin4nSBSa3fSpakO8KlhOpMwle87MqWQroWaIHQDwNE1JZX
 RIVBwEqGrPAy8whv0ZLTOaGa+IeiP8zRk3Mp30+fiR2OoQcgv2hbqXlb73w0eZnd
 SWKcmfjbaIEdwg==
X-ME-Sender: <xms:OZdIYGQ7Z7yMoSCa7zeUUJilLUAnU9Zrt9YDYoZj_qtifFV2QlJ6Ag>
 <xme:OZdIYLw9drdcKAHDOMDY6YthDi3zkh8c79iKEjcNwUO0hBb8_7HRrqa11PN8M2RpJ
 FY0ZiMweP6ltGUbez4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeegne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:OZdIYD2Jf0Grdujs78BJSdbqsU1PNOX0kYnD_7ioQbU0I_95PGOcaA>
 <xmx:OZdIYCCpuSc3o3U7DKJLy8d1sbucWQIvB9rQseYw1-ZsDVcgWfloaQ>
 <xmx:OZdIYPiGw53uiBJ8DQWkwT6j1QLiy9QA_IrWe1x9JtNEQFnW1ltRCw>
 <xmx:OZdIYPiuGu2SERX-2e2H9S6hYr7O2M_0PpMpjaWnmN71Hhk3FsldOg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E662724005E;
 Wed, 10 Mar 2021 04:53:59 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/13] hw/block/nvme: prefer runtime helpers instead of
 device parameters
Date: Wed, 10 Mar 2021 10:53:41 +0100
Message-Id: <20210310095347.682395-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210310095347.682395-1-its@irrelevant.dk>
References: <20210310095347.682395-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

In preparation for Format NVM support, use runtime helpers instead of
the constant device parameters when getting lba size information etc.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h | 2 +-
 hw/block/nvme-ns.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index e2f53d999699..07e16880801d 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -138,7 +138,7 @@ static inline bool nvme_ns_ext(NvmeNamespace *ns)
 /* calculate the number of LBAs that the namespace can accomodate */
 static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
 {
-    if (ns->params.ms) {
+    if (nvme_msize(ns)) {
         return ns->size / (nvme_lsize(ns) + nvme_msize(ns));
     }
     return ns->size >> nvme_ns_lbads(ns);
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 00e8f6af2162..7e3cba55e4db 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -110,11 +110,11 @@ lbaf_found:
     /* support DULBE and I/O optimization fields */
     id_ns->nsfeat |= (0x4 | 0x10);
 
-    npdg = ns->blkconf.discard_granularity / ns->blkconf.logical_block_size;
+    npdg = ns->blkconf.discard_granularity / nvme_lsize(ns);
 
     if (bdrv_get_info(blk_bs(ns->blkconf.blk), &bdi) >= 0 &&
         bdi.cluster_size > ns->blkconf.discard_granularity) {
-        npdg = bdi.cluster_size / ns->blkconf.logical_block_size;
+        npdg = bdi.cluster_size / nvme_lsize(ns);
     }
 
     id_ns->npda = id_ns->npdg = npdg - 1;
@@ -161,7 +161,7 @@ static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
 static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
 {
     uint64_t zone_size, zone_cap;
-    uint32_t lbasz = ns->blkconf.logical_block_size;
+    uint32_t lbasz = nvme_lsize(ns);
 
     /* Make sure that the values of ZNS properties are sane */
     if (ns->params.zone_size_bs) {
-- 
2.30.1


