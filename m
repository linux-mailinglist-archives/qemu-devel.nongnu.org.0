Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619E83324A0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:03:16 +0100 (CET)
Received: from localhost ([::1]:51450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJb51-0002Y4-9t
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJanx-0008KD-Dp; Tue, 09 Mar 2021 06:45:37 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:37325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJanu-0000G6-NS; Tue, 09 Mar 2021 06:45:37 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 161062728;
 Tue,  9 Mar 2021 06:45:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Gxa+cCNcTkUW5
 DYNNCZFwX7JlwxNThZDoMMiVNJPyDc=; b=QHjKU4E46vOurs+rVS4ZuHcH593xG
 GF6oKR9Gbti+cLq+oRLdBxv1EDPRDOec5ztqcKYF0WxVoHoX1iCy68EF6v6Kjv4x
 EqA4yAPPW6EeZ1a4hFVMf56PeXME4ux3Dd/lVw+BRqHjs/sXKasLDqQqrB5FkcJd
 CIEOXbbJqOfIn66LW3oz6EFLhBKKBOHhx5+dvFcABhxuvgc137KHtT0b76Y0CceC
 DIRHSjwxWe2iRaSW9LoYaRkWm1b/DlXz2yKfHPCsbcejXt4o2SuULGReh4P7qTbI
 wrv9n8Da1sEGMa6l2+DjsyApBFLf9jgqHSuLqh4PY1LkB68oWSYZ9/BKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Gxa+cCNcTkUW5DYNNCZFwX7JlwxNThZDoMMiVNJPyDc=; b=vOPxrjuk
 7F/5Tbl9e14O+AKc9PiaL1joYZXkwAv99JyBYlRR1RfdqJT7/BkxzIsLh+lSkgWQ
 jkCuCX7XfugOTTeTxAYVAVu5LC6qWcrfKC2ps5IJzN5pJShFzZs6XZHFKKsb+nSD
 cuO9z/7Au2sERkfielnGtix6E2NwFp+9bCXLJjN6Uhlz83lnAOYLvqJo5txyvVxU
 Tb5fXBNXX9jDjVFwGeV4idQObgBA0FS0dxdUDehIw3n1LV/kgWuWtMgHWua1V4GC
 yigqd8yJPeOjGfb0pgkmdtKhlwd671dr/G8qnH4JGV08VhN5wy25omosN2KOi+dz
 YgA9Kyg9si20yw==
X-ME-Sender: <xms:219HYKl00LLoX0jCAEg2JxneUFqIljdmK9V3XPs9pIAsyQrk1DNrlw>
 <xme:219HYB2eU83at972UBjyMOLG5q8RIEgWxrWKKFct5nOglez_RpULazeeS_YJnTUQ5
 rDN6B1PYqMIIWLVp1U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeehne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:219HYIq4xGyoM_46t4RH62zL48RmOPVMHgCR10paUVpsTagDApSbGg>
 <xmx:219HYOn6qR3P1t8FsdZ_SMhAWX9h5T8H7qaH9jaELBAoeXdcG2_dVg>
 <xmx:219HYI3v3PHXJn0HwBnfrCNL73BvIA0vZwE61MwmqEfdEaeGQe3SQw>
 <xmx:219HYJLXmr0LUP4UvqJN2SkF_pDTCAcnRK-bPAiPw5qtG2BLeHV_1BtSQmw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 405B2240057;
 Tue,  9 Mar 2021 06:45:30 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 10/38] nvme: updated shared header for copy command
Date: Tue,  9 Mar 2021 12:44:44 +0100
Message-Id: <20210309114512.536489-11-its@irrelevant.dk>
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

From: Klaus Jensen <k.jensen@samsung.com>

Add new data structures and types for the Simple Copy command.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 include/block/nvme.h | 47 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 3db2b9b4cba7..9f8eb3988c0e 100644
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
@@ -724,6 +725,37 @@ typedef struct QEMU_PACKED NvmeDsmRange {
     uint64_t    slba;
 } NvmeDsmRange;
 
+enum {
+    NVME_COPY_FORMAT_0 = 0x0,
+};
+
+typedef struct QEMU_PACKED NvmeCopyCmd {
+    uint8_t     opcode;
+    uint8_t     flags;
+    uint16_t    cid;
+    uint32_t    nsid;
+    uint32_t    rsvd2[4];
+    NvmeCmdDptr dptr;
+    uint64_t    sdlba;
+    uint8_t     nr;
+    uint8_t     control[3];
+    uint16_t    rsvd13;
+    uint16_t    dspec;
+    uint32_t    reftag;
+    uint16_t    apptag;
+    uint16_t    appmask;
+} NvmeCopyCmd;
+
+typedef struct QEMU_PACKED NvmeCopySourceRange {
+    uint8_t  rsvd0[8];
+    uint64_t slba;
+    uint16_t nlb;
+    uint8_t  rsvd18[6];
+    uint32_t reftag;
+    uint16_t apptag;
+    uint16_t appmask;
+} NvmeCopySourceRange;
+
 enum NvmeAsyncEventRequest {
     NVME_AER_TYPE_ERROR                     = 0,
     NVME_AER_TYPE_SMART                     = 1,
@@ -807,6 +839,7 @@ enum NvmeStatusCodes {
     NVME_CONFLICTING_ATTRS      = 0x0180,
     NVME_INVALID_PROT_INFO      = 0x0181,
     NVME_WRITE_TO_RO            = 0x0182,
+    NVME_CMD_SIZE_LIMIT         = 0x0183,
     NVME_ZONE_BOUNDARY_ERROR    = 0x01b8,
     NVME_ZONE_FULL              = 0x01b9,
     NVME_ZONE_READ_ONLY         = 0x01ba,
@@ -994,7 +1027,7 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
     uint8_t     nvscc;
     uint8_t     rsvd531;
     uint16_t    acwu;
-    uint8_t     rsvd534[2];
+    uint16_t    ocfs;
     uint32_t    sgls;
     uint8_t     rsvd540[228];
     uint8_t     subnqn[256];
@@ -1022,6 +1055,11 @@ enum NvmeIdCtrlOncs {
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
@@ -1175,7 +1213,10 @@ typedef struct QEMU_PACKED NvmeIdNs {
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
@@ -1331,6 +1372,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeZonedResult) != 8);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCqe) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDsmRange) != 16);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeCopySourceRange) != 32);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDeleteQ) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCreateCq) != 64);
@@ -1338,6 +1380,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdentify) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeRwCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDsmCmd) != 64);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeCopyCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeRangeType) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeErrorLog) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeFwSlotInfoLog) != 512);
-- 
2.30.1


