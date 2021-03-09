Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD8533258B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:37:09 +0100 (CET)
Received: from localhost ([::1]:41614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbbn-00060l-VA
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:37:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJapA-0000o9-NB; Tue, 09 Mar 2021 06:46:52 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:51689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJap0-0000oO-CU; Tue, 09 Mar 2021 06:46:52 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 52C67275A;
 Tue,  9 Mar 2021 06:46:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:46:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Q3iFoLigSf9g5
 OGZglzxMkSArBgsjbBQ5O8hEKtgtUA=; b=w9JJEWLSWEqxDiyVCSOjVrcOWMNDq
 n0RtGPEYVN/CSc3QtG4Jw4snsikmZuerxgNPXlF9KDBqLKG5sgi2b1Z8RaI4LatG
 EM0LBjOrQnnj2aLj3rfaDlqhm2MIR64eCnuCAhqwhLxWiOi8KhgfdL7Jrzqh69rd
 E4przod8I2+R8gNsvAhrzOmsRBAwxtrGJG5znk08Vh9fROF2YwSv5ONywBb6TV1W
 sH7VPEGyGKNFosQ3adE0ul2jm0/ctj3Y3+R3TZWwfoaj98uMZxUpV6is3RMt/bT4
 sRK5miVCIQFmt1bgEVHcheul9TMGn2xk6G2Vqxs1gI68yFz49YlR4QIlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Q3iFoLigSf9g5OGZglzxMkSArBgsjbBQ5O8hEKtgtUA=; b=szK5yVFs
 ISJy9JRfBDDVVikZfKPG2lpi9O52yfQseYWyzYTTW+JMRnmgLyz26fXNioRegkHp
 TTVAD1TpGoiuHJ/XQ4VpZz6/2r/MfR2Bq9PAnOxQq5Px5fXvrZ1QbXVYabqYwCAo
 DBX8fPlLba0FuHf2b6WHds1ht3lDlOcdLGjSmkVAyL0LjXHzE0jWlv5ZTJFP6pIX
 24hCZUQ3fteZMCyIYLGUQ3/sNh4C7hz2FNMxj+Hc4d86fJncyzQ7DVctp3T3dkOe
 dsADOS2KW9hhnbmkfoYkjZh2UGGhXIEk8bLCNvYEblzsXODRSEzgysIsWB8jVugJ
 oQnQXllQZXG0ZA==
X-ME-Sender: <xms:_19HYDQ-HXF8TEFBsiSzZdQ8RJoXY9-K0JWnodkHtWDukkei1pjmKg>
 <xme:_19HYExQPCdDBMd9q2wlrF7ISN8f8j9g7WVaUotJw6EDeav4l11KJymilG2z3Wbap
 Gsn5-9Oki0Td6fYsQc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvvd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:_19HYI3QQspJTcmrbTw6uNgQZakiEgH_my1hRiNix0cWYGuGOWs-zQ>
 <xmx:_19HYDDmsPKl3EMe6mA2qd5eXzBVBz-0K97-nFB5Ar37Vn9fwxdYnQ>
 <xmx:_19HYMjmpFQRaVQrxAxfdflH5lO6l_D4kKHWF9yTHjslts5LHOvBjw>
 <xmx:_19HYFX2KnglJTI2zjQe1ul18qLdXFyoZ5LFUtmT1Qb_q9DC91vQtA6WzSQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7AFDB240054;
 Tue,  9 Mar 2021 06:46:06 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 33/38] hw/block/nvme: fix allocated namespace list to 256
Date: Tue,  9 Mar 2021 12:45:07 +0100
Message-Id: <20210309114512.536489-34-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

Expand allocated namespace list (subsys->namespaces) to have 256 entries
which is a value lager than at least NVME_MAX_NAMESPACES which is for
attached namespace list in a controller.

Allocated namespace list should at least larger than attached namespace
list.

	n->num_namespaces = NVME_MAX_NAMESPACES;

The above line will set the NN field by id->nn so that the subsystem
should also prepare at least this number of namespace list entries.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-subsys.h | 2 +-
 hw/block/nvme.h        | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 20d34004c677..65a8bcda030d 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -14,7 +14,7 @@
     OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
 
 #define NVME_SUBSYS_MAX_CTRLS   32
-#define NVME_SUBSYS_MAX_NAMESPACES  32
+#define NVME_SUBSYS_MAX_NAMESPACES  256
 
 typedef struct NvmeCtrl NvmeCtrl;
 typedef struct NvmeNamespace NvmeNamespace;
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index cd8d40634411..85a7b5a14f4e 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -10,6 +10,12 @@
 #define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
 #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
 
+/*
+ * Subsystem namespace list for allocated namespaces should be larger than
+ * attached namespace list in a controller.
+ */
+QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_SUBSYS_MAX_NAMESPACES);
+
 typedef struct NvmeParams {
     char     *serial;
     uint32_t num_queues; /* deprecated since 5.1 */
-- 
2.30.1


