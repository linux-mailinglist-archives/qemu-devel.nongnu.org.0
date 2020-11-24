Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D59562C1EC0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 08:21:53 +0100 (CET)
Received: from localhost ([::1]:42100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khSe8-0008Pp-Oz
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 02:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1khSWz-0006pV-CF; Tue, 24 Nov 2020 02:14:29 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:33125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1khSWw-0001Je-FM; Tue, 24 Nov 2020 02:14:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 115EA5C01E1;
 Tue, 24 Nov 2020 02:14:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 24 Nov 2020 02:14:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=EXXDAKOyrZra0
 bOq7lul8TgtVYdiYsmmsQgpMFjoe+w=; b=ddVDsFeZQ1LVTm+HZwmDKJ3FGaJ0a
 FKL1K75SklqSMs4Ta0PvoDtrg5jFbJyMhsbAPo7W0RJaNrvR/iQOm92iuqzBxNZC
 DnZqWu0RasOeWCr6PH7RTv8A5JMde66LezyqBCrwhdagL8jizBEPbctd6wUx8mZI
 7P/Z6TFLJLHOPDHfnG+6F+CGm3du9o/s8sSmvHC8Vctga+xZT5inzfNBZ1EPBCD7
 kuBckT0E5SpSf/1grPWRbScI83a10JIG6onIRi7nkmN925/NJ/Qoq/dc+izny0+p
 hTUJVrVVnKpL5Khy8uigBGbIHn3V5zdK0ys9vhSumPeT7/pMsav7BiqMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=EXXDAKOyrZra0bOq7lul8TgtVYdiYsmmsQgpMFjoe+w=; b=fiZTsPx1
 VK5hr42FyjJIQQi9uakpGn1ZVhHBs0lV4YyoYX4AgfFh3EwKH5yAp92RLDWQqW8F
 GvUPzQTqeaSRLsQK00WaZP9DwKm5fEU9/+/h32wT18MbfDzn3U7fmCTHzG/ZOwxl
 mbH4UCKR5dxIiXm+56fmDPGp+ro4Yhn4Rfo66b16SRYY5omeeNSIX+hP8W/+SL2M
 glz0kb3ybSJezW90Wz0Wc7rP0yYt/Rkcqo16JV4qEh2EgisLSeHLUANPvoXME7DX
 msnpkmOaSsHrMDQpEtiAdREyeqdrjnIV+kg1Raj/hxmty2+VEw+4Nn6sfArEXyG5
 bfPNfMeqaxd6Pg==
X-ME-Sender: <xms:z7K8X5uqTEdY7hU1HEn2Jlze8jYcN2mpWE5fF0Gy71YW5_2VLAxVSw>
 <xme:z7K8XycCxjVLWTOfEYAzPc_MI8TnQxESncn7f6it07G2nz6Ii5kPlN9Peg7iFeKtN
 E5jWdYY9AAouexdvTo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegjedgudefvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:z7K8X8xMkpD0LXrjAI6MluQ1C68irEmDfCIzeTIRB0yMQqqZOD_qeg>
 <xmx:z7K8XwNnPfi4olB2UHEs-7OJe_A1ia3HmimZAEUbZG7hwgdjpRe-BA>
 <xmx:z7K8X59SuanX_KkvgHP8E6_h1Fw1FGoglLaJ_8cDycDtjBrSKqcaHg>
 <xmx:0LK8X5zsdc3xhKLurnxUcxEkxxQqewHhwZzaPyG2If7C1bvvMUcV4g>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 56FAC3064AB2;
 Tue, 24 Nov 2020 02:14:22 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] nvme: updated shared header for copy command
Date: Tue, 24 Nov 2020 08:14:17 +0100
Message-Id: <20201124071418.12160-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124071418.12160-1-its@irrelevant.dk>
References: <20201124071418.12160-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add new data structures and types for the Simple Copy command.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Fam Zheng <fam@euphon.net>
---
 include/block/nvme.h | 45 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index e95ff6ca9b37..b56efd6a89af 100644
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
+    uint16_t elbatm;
+    uint16_t elbat;
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
+    NVME_OCFS_COPY_FORMAT_0 = 1 << NVME_COPY_FORMAT_0,
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


