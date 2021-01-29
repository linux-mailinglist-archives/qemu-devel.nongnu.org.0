Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1091C308755
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:26:50 +0100 (CET)
Received: from localhost ([::1]:49918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Q3E-0003KZ-FN
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:26:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l5Psk-0006UX-8P; Fri, 29 Jan 2021 04:15:58 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:59091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l5Pse-0003eO-RE; Fri, 29 Jan 2021 04:15:58 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EE4785C01E6;
 Fri, 29 Jan 2021 04:15:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 29 Jan 2021 04:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=c+LeO7/8pdWiy
 PjLgE3efXsKeJsrYDFeUSL8Ql5GOuI=; b=n0rnHGYYpLQ6R3jYDgZrEBmS9L/1B
 t3CnXLginrQRQ4iWQiBTXHtCpuZOHkZ9TepJ+jB2u6AdVHwAcQsbppJ2ZkI0rpCI
 7mEgEX8Q3chzMJdMIdpF6AyyNyn2fPBYP3h5i2dhgMfIsGYilhJlfDQj5njDfkg1
 +A3Zj5I0lGHchpKrL/e0vG5F83/Bh/xwgJ4BsRT7aYmSG/5SddRqJo/UT4UIihmw
 6iyfsC2N4bMts7Hz4dY70YNTG2wnG00NlxjGJ4Fp87Mbs4Y71KRc4vKg8zrITkto
 yny4I/u9Kow5vTALQYD0vwJIKyawkye3+hCTfZicWdunx62U7PjIW+pZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=c+LeO7/8pdWiyPjLgE3efXsKeJsrYDFeUSL8Ql5GOuI=; b=MElYca93
 aRDgQ1EJzyk9YUA6zTffQheLBmCzclo6nst05woyvfYFy/NheY8PNhSsIxNp5ef5
 MqxHbchEV7zi26NNOibwkqN7/CijqLhay+CJpF4AMEoovRvJOqQ+RFoNSFyjTsIu
 Km9Gp8/GwmJrCN2OBq4bkhhs7WD9zVU/KuIfQl0wzXa9KgHbWlQLMXxoN9XnUQEr
 74ZgiUFxNwgu0Y3l5yJJyKdsrcMJ9lBx4+qPsZBOYqxeP9f17awz7Uz1Dzp5NnXH
 NbduzhI0CxvY1hFuuKtqJytXyPX2u3EJNrxhRPfIxrr5gST/RyZf9eeu2MfM30KU
 EnxW0jB24uv+Kg==
X-ME-Sender: <xms:RtITYEoq7NFNNiyZ6dG7T64bfVwqh6cls9aE3FxwH6SUzcQHtyAY1g>
 <xme:RtITYKqZuv_NRs2I-Hn-6QZhXYAPVC_EBbD7PDRsG3h-XIm7m1IDiCIut6PNguefl
 RBWVV4V4j417xkJOKE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhsucflvghn
 shgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrhhnpe
 euleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefgkeenucfk
 phepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:RtITYJOBmpSOjAy3nEzY-2n1mohhAV0JghYRqR5sQZQTrfnqXruJ9g>
 <xmx:RtITYL6pmkhEEXzaDMQJFdNZnbj_db6JUbmqduRGi0bTzt8en8lyDA>
 <xmx:RtITYD6-xln3lWpTLs4eg3TwSZl4TADupXuKORpAc-OJR2_XzkPkpg>
 <xmx:RtITYGbiBbf0NeTj9d5fsdFnbZEir9jdTej-FruFtVkl7opyl-PwIQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 946D324005B;
 Fri, 29 Jan 2021 04:15:49 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/5] nvme: updated shared header for copy command
Date: Fri, 29 Jan 2021 10:15:40 +0100
Message-Id: <20210129091541.566330-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129091541.566330-1-its@irrelevant.dk>
References: <20210129091541.566330-1-its@irrelevant.dk>
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add new data structures and types for the Simple Copy command.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/nvme.h | 45 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index e4b918064df9..5977bcf0308a 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -579,6 +579,7 @@ enum NvmeIoCommands {
     NVME_CMD_COMPARE            = 0x05,
     NVME_CMD_WRITE_ZEROES       = 0x08,
     NVME_CMD_DSM                = 0x09,
+    NVME_CMD_COPY               = 0x19,
     NVME_CMD_ZONE_MGMT_SEND     = 0x79,
     NVME_CMD_ZONE_MGMT_RECV     = 0x7a,
     NVME_CMD_ZONE_APPEND        = 0x7d,
@@ -724,6 +725,35 @@ typedef struct QEMU_PACKED NvmeDsmRange {
     uint64_t    slba;
 } NvmeDsmRange;
 
+enum {
+    NVME_COPY_FORMAT_0 = 0x0,
+};
+
+typedef struct NvmeCopyCmd {
+    uint8_t     opcode;
+    uint8_t     flags;
+    uint16_t    cid;
+    uint32_t    nsid;
+    uint32_t    rsvd2[4];
+    NvmeCmdDptr dptr;
+    uint64_t    sdlba;
+    uint32_t    cdw12;
+    uint32_t    cdw13;
+    uint32_t    ilbrt;
+    uint16_t    lbat;
+    uint16_t    lbatm;
+} NvmeCopyCmd;
+
+typedef struct NvmeCopySourceRange {
+    uint8_t  rsvd0[8];
+    uint64_t slba;
+    uint16_t nlb;
+    uint8_t  rsvd18[6];
+    uint32_t eilbrt;
+    uint16_t elbat;
+    uint16_t elbatm;
+} NvmeCopySourceRange;
+
 enum NvmeAsyncEventRequest {
     NVME_AER_TYPE_ERROR                     = 0,
     NVME_AER_TYPE_SMART                     = 1,
@@ -807,6 +837,7 @@ enum NvmeStatusCodes {
     NVME_CONFLICTING_ATTRS      = 0x0180,
     NVME_INVALID_PROT_INFO      = 0x0181,
     NVME_WRITE_TO_RO            = 0x0182,
+    NVME_CMD_SIZE_LIMIT         = 0x0183,
     NVME_ZONE_BOUNDARY_ERROR    = 0x01b8,
     NVME_ZONE_FULL              = 0x01b9,
     NVME_ZONE_READ_ONLY         = 0x01ba,
@@ -994,7 +1025,7 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
     uint8_t     nvscc;
     uint8_t     rsvd531;
     uint16_t    acwu;
-    uint8_t     rsvd534[2];
+    uint16_t    ocfs;
     uint32_t    sgls;
     uint8_t     rsvd540[228];
     uint8_t     subnqn[256];
@@ -1022,6 +1053,11 @@ enum NvmeIdCtrlOncs {
     NVME_ONCS_FEATURES      = 1 << 4,
     NVME_ONCS_RESRVATIONS   = 1 << 5,
     NVME_ONCS_TIMESTAMP     = 1 << 6,
+    NVME_ONCS_COPY          = 1 << 8,
+};
+
+enum NvmeIdCtrlOcfs {
+    NVME_OCFS_COPY_FORMAT_0 = 1 << 0,
 };
 
 enum NvmeIdCtrlFrmw {
@@ -1171,7 +1207,10 @@ typedef struct QEMU_PACKED NvmeIdNs {
     uint16_t    npdg;
     uint16_t    npda;
     uint16_t    nows;
-    uint8_t     rsvd74[30];
+    uint16_t    mssrl;
+    uint32_t    mcl;
+    uint8_t     msrc;
+    uint8_t     rsvd81[23];
     uint8_t     nguid[16];
     uint64_t    eui64;
     NvmeLBAF    lbaf[16];
@@ -1323,6 +1362,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeZonedResult) != 8);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCqe) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDsmRange) != 16);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeCopySourceRange) != 32);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDeleteQ) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCreateCq) != 64);
@@ -1330,6 +1370,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdentify) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeRwCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDsmCmd) != 64);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeCopyCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeRangeType) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeErrorLog) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeFwSlotInfoLog) != 512);
-- 
2.30.0


