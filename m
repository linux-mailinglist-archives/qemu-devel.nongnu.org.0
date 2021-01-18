Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDA42F9C14
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:57:56 +0100 (CET)
Received: from localhost ([::1]:58384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RIE-0006Z9-Uj
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R8A-0000tw-M9; Mon, 18 Jan 2021 04:47:26 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:46411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R89-0001BE-2r; Mon, 18 Jan 2021 04:47:26 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 46E285C0125;
 Mon, 18 Jan 2021 04:47:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 04:47:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=X4Jwa1ckrFpBs
 Yu8wEUv0zonuPbWKLS7/5vRg4ZFv6o=; b=gAPqJOro7UpWstrFjYST3Uc5kDY2O
 0VZUfiROf+6FZwnzje/C75lkpNflJ8O5OOT7F50wGNE/XaVij4qqXhQIXsWX3q3V
 LfIYLlUTcDjVMcchOkiY6PY9sPqwXmebv2XEH+vZ6KwGyxUv+DkESESCS3FQqAw1
 yfSvQYX7aorMQXzWq7BgbKqzOCPHtOSeixk+bkxrOGSPqde89akk8ubOeTKdgrCI
 cCIF/0n9H+oleyM44nMQqRvbwHJznhtgXoeU6IPUJCBV2GenCyaPQhHV4SrXkQGG
 gTkGGrQwhTLLpJyStIlZnNQocWR5utfWe3wuJr/Pau6lG+ObUriVAy8dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=X4Jwa1ckrFpBsYu8wEUv0zonuPbWKLS7/5vRg4ZFv6o=; b=CcY0/w4Y
 wBHatgr9I97sxze++1Fab96b9KRbhWHL0BOTY3jyLu522YpYIsKcrcs+DDro2btD
 KKIl/iT3lcPTK+OzfJTLDsD2PlNmB0Qq+8Plr0yCQLASnt8nb62HzHc0zbxBSpoi
 fGJ2f47AUOxXNdioDAkginPUlErQvfhUbz6d71QE8SGwB1vsPHFkfu8dByVM0Ejb
 cyZSKjaldkvxr4TRi0hl80RU42pVs6dOlzDAmWv8BMRQTW24PBKerVjzVUrWRuz2
 2L0x9IOYsDEfh2PxO3ojHI0om+El5hOpoUFZEcIRY461gCWTJcTFv+f0j4DNi//y
 DTuLY2qIl2bzfA==
X-ME-Sender: <xms:LFkFYLzlDb243bZFXhE33bLbDLikBbCqG_gYmtmubx8qAbzzi8sfLQ>
 <xme:LFkFYDTVlxR4-gWfFXQ59NeEB7Hj8GM4G_p0s7ITY3WpTt-5_zspS-D5399PCg0VO
 waRDuW6u3Iu2ZQrlKY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepjeenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:LFkFYFXXgsmeHhoPzh4GXn9cx60IiUnFYueSA5sAHj1Dr0DUAwwbQw>
 <xmx:LFkFYFh5a9djXFJNPk74DLih2rzys69VgHT0qUJuF1kWnXutAT3N5Q>
 <xmx:LFkFYNB-K7HwPRVILzzQfg_RE7QWSHSq6MTb4i6x38q2UQfldRSsEw>
 <xmx:LFkFYP0x8GBp0rxIY3lxUsqQFjYjeRe3WCfmOrQw0Z8jP1KjNsH8Hw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 02C6424005A;
 Mon, 18 Jan 2021 04:47:22 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/12] hw/block/nvme: bump to v1.4
Date: Mon, 18 Jan 2021 10:47:04 +0100
Message-Id: <20210118094705.56772-12-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210118094705.56772-1-its@irrelevant.dk>
References: <20210118094705.56772-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

With the new CMB logic in place, bump the implemented specification
version to v1.4.

This requires adding the setting the CNTRLTYPE field and modifying the
VWC field since 0x00 is no longer a valid value for bits 2:1.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 3 ++-
 hw/block/nvme.c      | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 7dcd8f9b4e78..c34343c13a3c 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -949,7 +949,8 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
     uint32_t    rtd3e;
     uint32_t    oaes;
     uint32_t    ctratt;
-    uint8_t     rsvd100[12];
+    uint8_t     rsvd100[11];
+    uint8_t     cntrltype;
     uint8_t     fguid[16];
     uint8_t     rsvd128[128];
     uint16_t    oacs;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index a9b11a193c59..992665376a71 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -106,7 +106,7 @@
 
 #define NVME_MAX_IOQPAIRS 0xffff
 #define NVME_DB_SIZE  4
-#define NVME_SPEC_VER 0x00010300
+#define NVME_SPEC_VER 0x00010400
 #define NVME_CMB_BIR 2
 #define NVME_PMR_BIR 4
 #define NVME_TEMPERATURE 0x143
@@ -4404,6 +4404,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
     id->oacs = cpu_to_le16(0);
+    id->cntrltype = 0x1;
 
     /*
      * Because the controller always completes the Abort command immediately,
@@ -4432,7 +4433,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
                            NVME_ONCS_FEATURES | NVME_ONCS_DSM |
                            NVME_ONCS_COMPARE);
 
-    id->vwc = 0x1;
+    id->vwc = (0x2 << 1) | 0x1;
     id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
                            NVME_CTRL_SGLS_BITBUCKET);
 
-- 
2.30.0


