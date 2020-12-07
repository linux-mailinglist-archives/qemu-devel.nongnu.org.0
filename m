Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA0D2D0B78
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 09:06:30 +0100 (CET)
Received: from localhost ([::1]:51212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmBXR-00044y-4Y
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 03:06:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmBQv-0002ZQ-L2; Mon, 07 Dec 2020 02:59:45 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:44413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmBQs-0005Ek-GE; Mon, 07 Dec 2020 02:59:45 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BE2BF5C0164;
 Mon,  7 Dec 2020 02:59:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 07 Dec 2020 02:59:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=XWSkIOq0ba1eY
 TUG7cxvZ7Stv0m5aUspv8OHOLQ5kHA=; b=OozpVFb+hjw5/ubiNQtUADOc+G3YX
 /l6eA7ayVpKv1W8LA1a573qAtl5ckY6K2CmX2NI8VcszqcJQiYQy+BxLUTD9lReO
 vdt3+xphjnK0lE8Szm0XpC+LfSqMRtAjJ6+C2s4vQsbliERjQfi4nLLuPVVsBZoK
 H+bxsAsSGZ0SJyUnQMQu2GyTXqOVlwSYYYlv3SilJXX15P/dRQBFb6CYJfljPdNg
 sYOBg9HrkRBjkfC8+wJL4IGWWnJq9FbmBSDavG4goV5rFTxIk+GZ1TjgjHonEe02
 hmxpyB9ztetDwkNRevudHB1HyQS7PL9sOj+xPi583KZKzqk6ehIA9Fi3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=XWSkIOq0ba1eYTUG7cxvZ7Stv0m5aUspv8OHOLQ5kHA=; b=YAHeB+oh
 IkwLL1PSwA65uRqXpSzGl4e0aO+zFXyJLca42DloDPY+VniLMkb32r3q7KMqx4V/
 o0CYYXrZqUZkSsWy/eaB5oVW3z0dan4cNKKRKBG5uvg3wAAPeI1jribZy9cm1+qw
 3N3mvvk1ghDhYR1fdiwPI3qGgUKN/ZrOTXeX/6EQjYJIFDC+D0FovCLOjCFQT+ls
 I0gAnDWZy7dDyyXoqDFiPVjZJ+x8ykSPgeOIfr/ZQ29+FUxWCuJ01inTNb1qoTIW
 F8UsEkbY8TzxcXyELCfVRPdGv9toKhrdjN8ys0SuIaUcVJs3oWQIiDGsXhd3VtGs
 D4fkrznGzfK1zg==
X-ME-Sender: <xms:7eDNX6sYYpZARlIr5u3B3G5kzVTwVLZy8htx4e5i0wW2nUzOR66ghg>
 <xme:7eDNX_c-iHkXAs2GgWLm7QVzpKeDNs5U1tC4lIc06uPVdkCvGehYgmSQBV77JSywy
 GdoNkmVDRe6TBgMEJ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejfedguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:7eDNX1wRqVxWoiwhITGKjmlErhy2tvbHRlJonDqouLDxusD_2G3VkA>
 <xmx:7eDNX1N4SGcq8LRPSRonZhRBmkz37XHvK_v88yU_pHC40vE-HMHHrw>
 <xmx:7eDNX6-RvTiB4EpH8OjFBaN9QDVIoHuQGlHd5VcI8HtYxyOtkAwuIw>
 <xmx:7eDNX_N0awbzyXVSeHlDwUlzBLwuGKxXnzoB-w7svAJcNJkImK8jrg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2B23124005E;
 Mon,  7 Dec 2020 02:59:38 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] nvme: updated shared header for copy command
Date: Mon,  7 Dec 2020 08:59:34 +0100
Message-Id: <20201207075935.238638-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207075935.238638-1-its@irrelevant.dk>
References: <20201207075935.238638-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add new data structures and types for the Simple Copy command.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Fam Zheng <fam@euphon.net>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/nvme.h | 45 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index e95ff6ca9b37..be3aca913a1d 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -472,6 +472,7 @@ enum NvmeIoCommands {
     NVME_CMD_COMPARE            = 0x05,
     NVME_CMD_WRITE_ZEROES       = 0x08,
     NVME_CMD_DSM                = 0x09,
+    NVME_CMD_COPY               = 0x19,
 };
 
 typedef struct QEMU_PACKED NvmeDeleteQ {
@@ -603,6 +604,35 @@ typedef struct QEMU_PACKED NvmeDsmRange {
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
@@ -680,6 +710,7 @@ enum NvmeStatusCodes {
     NVME_CONFLICTING_ATTRS      = 0x0180,
     NVME_INVALID_PROT_INFO      = 0x0181,
     NVME_WRITE_TO_RO            = 0x0182,
+    NVME_CMD_SIZE_LIMIT         = 0x0183,
     NVME_WRITE_FAULT            = 0x0280,
     NVME_UNRECOVERED_READ       = 0x0281,
     NVME_E2E_GUARD_ERROR        = 0x0282,
@@ -831,7 +862,7 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
     uint8_t     nvscc;
     uint8_t     rsvd531;
     uint16_t    acwu;
-    uint8_t     rsvd534[2];
+    uint16_t    ocfs;
     uint32_t    sgls;
     uint8_t     rsvd540[228];
     uint8_t     subnqn[256];
@@ -854,6 +885,11 @@ enum NvmeIdCtrlOncs {
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
@@ -995,7 +1031,10 @@ typedef struct QEMU_PACKED NvmeIdNs {
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
@@ -1059,6 +1098,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeAerResult) != 4);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCqe) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDsmRange) != 16);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeCopySourceRange) != 32);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDeleteQ) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCreateCq) != 64);
@@ -1066,6 +1106,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdentify) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeRwCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDsmCmd) != 64);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeCopyCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeRangeType) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeErrorLog) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeFwSlotInfoLog) != 512);
-- 
2.29.2


