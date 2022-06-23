Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1B9558B0C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 00:01:56 +0200 (CEST)
Received: from localhost ([::1]:53568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Utf-0000Cs-Uu
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 18:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UUY-0005CD-6J; Thu, 23 Jun 2022 17:35:59 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:53561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UUW-0006i3-CE; Thu, 23 Jun 2022 17:35:57 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9368D320094C;
 Thu, 23 Jun 2022 17:35:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 23 Jun 2022 17:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656020153; x=
 1656106553; bh=CV5ims5Ilnsvzmzz5PZpmfcmMDgX/DT20i9wIjCax3A=; b=I
 qnaKSZ2LKbQg4aJZgjlma/LxnuVmoFhnNDOFFcKp4Jto9pRljAUQm5OsaGk6uEFk
 k3wnwdtATJTes4iyo62wzq9oQD8SXW/MJ7BwZiUf0/mgoTc0lhpn9fdGlLvX4A9x
 Fya0S4Uxb7mtd8NsXCDaObrydS1aGv6Yv0cCbAnuRkyW0Nf8bPMFOcWw4xePeqCN
 tXwPLvawaTezlROl5e96g6Y4rj2elWdwJdbdB6QpokhsQS25DT6AL3tDtM1ok0XR
 zhkkbVptEcfMEgqLeNG/qLtLIaRJZJt4fV04ZQcSvpSyz3+TRzQFKRKR5KvNHGaz
 Jm6k3GYEMZBYZMnuKhKiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656020153; x=1656106553; bh=CV5ims5Ilnsvz
 mzz5PZpmfcmMDgX/DT20i9wIjCax3A=; b=H3k+rEcDLmaz433lrECKRgfxK7lr+
 gTL/DgPyLYsYgNWVJdafFh8B+MnFDsSxlGDXiHDmskD/Ni1+udgXRTphIShIImSW
 BpIJKqYKkXUQ2Tg/2sQO1vCcI/GCP5FuZOZ8Ag2AsJ0xnLrPoN5yb595EJw1hEa4
 p5wC8CKPN2dOrAFIeEPWZnTU9KbqM5EmDIvb73b4OG97KuLPuIXmTUoSVgl0X3dH
 AUZL2lc0Rgn8ip7xPCScayusFnt3b2zCly8ajiv2lZsSx61DLQfPNJi5D4iy9pPa
 Ca3IxteIxkaDdKhd5QVj/hDQk+Lf+fgeSV+bvfFkJqtx6Ed7dzkUjvrPg==
X-ME-Sender: <xms:uNy0YhNCA9AUPXZ6hpkAdfNik8lr0ZSOfcwKT3WCsXiGj4s3XQWItA>
 <xme:uNy0Yj9QOiroQXHqVXHVoSoDCwnchLuqIepmLeTnF0iNwCFkdhZ6y7kB-Rg9TAzeg
 gRcDe9oypXbFGHErzA>
X-ME-Received: <xmr:uNy0YgQdYfICFutT-O-nSO17s1LEosTStBXvj3o_z_YrHkuGnpkNt7MvW8C-S-ws7kKj_PhLcJe-BtApXOvX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeifecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:uNy0Ytte_u88e1HZnxG6ChHSvoI0H-5yTW58rE2GLfieDd6kzq5b9Q>
 <xmx:uNy0YpfprlBDHEN8juUH2ddb83DIpFKQdFouknG-mZVniNvjF014Fw>
 <xmx:uNy0Yp27cUqmyesARMLnmNZfNn5Ky3heI8Yhivg0d2r1gpajNWyzjw>
 <xmx:udy0Ys9JqNNqDXLoazCN8l5uLYSbsw3OW9wlzd2m1FDYBWZxBKnwNg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:35:50 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 14/15] Revert "hw/block/nvme: add support for sgl bit bucket
 descriptor"
Date: Thu, 23 Jun 2022 23:34:41 +0200
Message-Id: <20220623213442.67789-15-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623213442.67789-1-its@irrelevant.dk>
References: <20220623213442.67789-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

This reverts commit d97eee64fef35655bd06f5c44a07fdb83a6274ae.

The emulated controller correctly accounts for not including bit buckets
in the controller-to-host data transfer, however it doesn't correctly
account for the holes for the on-disk data offsets.

Reported-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index a558f5cb29c1..15d580a904ef 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -850,10 +850,6 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
         uint8_t type = NVME_SGL_TYPE(segment[i].type);
 
         switch (type) {
-        case NVME_SGL_DESCR_TYPE_BIT_BUCKET:
-            if (cmd->opcode == NVME_CMD_WRITE) {
-                continue;
-            }
         case NVME_SGL_DESCR_TYPE_DATA_BLOCK:
             break;
         case NVME_SGL_DESCR_TYPE_SEGMENT:
@@ -886,10 +882,6 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
 
         trans_len = MIN(*len, dlen);
 
-        if (type == NVME_SGL_DESCR_TYPE_BIT_BUCKET) {
-            goto next;
-        }
-
         addr = le64_to_cpu(segment[i].addr);
 
         if (UINT64_MAX - addr < dlen) {
@@ -901,7 +893,6 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
             return status;
         }
 
-next:
         *len -= trans_len;
     }
 
@@ -959,8 +950,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
         seg_len = le32_to_cpu(sgld->len);
 
         /* check the length of the (Last) Segment descriptor */
-        if ((!seg_len || seg_len & 0xf) &&
-            (NVME_SGL_TYPE(sgld->type) != NVME_SGL_DESCR_TYPE_BIT_BUCKET)) {
+        if (!seg_len || seg_len & 0xf) {
             return NVME_INVALID_SGL_SEG_DESCR | NVME_DNR;
         }
 
@@ -998,26 +988,20 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
         last_sgld = &segment[nsgld - 1];
 
         /*
-         * If the segment ends with a Data Block or Bit Bucket Descriptor Type,
-         * then we are done.
+         * If the segment ends with a Data Block, then we are done.
          */
-        switch (NVME_SGL_TYPE(last_sgld->type)) {
-        case NVME_SGL_DESCR_TYPE_DATA_BLOCK:
-        case NVME_SGL_DESCR_TYPE_BIT_BUCKET:
+        if (NVME_SGL_TYPE(last_sgld->type) == NVME_SGL_DESCR_TYPE_DATA_BLOCK) {
             status = nvme_map_sgl_data(n, sg, segment, nsgld, &len, cmd);
             if (status) {
                 goto unmap;
             }
 
             goto out;
-
-        default:
-            break;
         }
 
         /*
-         * If the last descriptor was not a Data Block or Bit Bucket, then the
-         * current segment must not be a Last Segment.
+         * If the last descriptor was not a Data Block, then the current
+         * segment must not be a Last Segment.
          */
         if (NVME_SGL_TYPE(sgld->type) == NVME_SGL_DESCR_TYPE_LAST_SEGMENT) {
             status = NVME_INVALID_SGL_SEG_DESCR | NVME_DNR;
@@ -7286,8 +7270,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->vwc = NVME_VWC_NSID_BROADCAST_SUPPORT | NVME_VWC_PRESENT;
 
     id->ocfs = cpu_to_le16(NVME_OCFS_COPY_FORMAT_0 | NVME_OCFS_COPY_FORMAT_1);
-    id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
-                           NVME_CTRL_SGLS_BITBUCKET);
+    id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN);
 
     nvme_init_subnqn(n);
 
-- 
2.36.1


