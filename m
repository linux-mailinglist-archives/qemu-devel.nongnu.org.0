Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 472BD53D2D8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 22:34:19 +0200 (CEST)
Received: from localhost ([::1]:41276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxDzt-0007b8-Ul
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 16:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDw3-0005cg-10; Fri, 03 Jun 2022 16:30:19 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:39149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDw1-0005yf-72; Fri, 03 Jun 2022 16:30:18 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id EE8E5320046E;
 Fri,  3 Jun 2022 16:30:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 03 Jun 2022 16:30:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1654288214; x=1654374614; bh=RSS/i1h/n9
 oSSeqUjfFeGcgeycBs7veS8/CKJb5kkqs=; b=MLZPoH644hkJrvSv77h73N8Ht6
 AeOUwFMh0LRNhF/Bn7zhIEEYp5TSJ73JJfflosAOuCw5JtaKq5bfjnnK27EpdxWc
 aSpw4sux3wSvfh0t55xJ3qiLvuVpEkVRg/6e1HfFm7Jmol9G3ckyYVPoDhHVesEn
 h679wCY7jK/wsy2CRNGTQNNiPcOqfSbQucnsmmMCCql14pypRhWQlTCfrfVyBxp6
 FBRzCVgolRYkICvCnYqtGH+oU2vRWXJwkaGCwrkkXfmBxKnuqACyF9mbeKchdPXZ
 6yyRvqJZKEvn81dA7XcRu15JzOEWX5MMm609bjRk5YFYMBbY978DnupU4Xdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1654288214; x=1654374614; bh=RSS/i1h/n9oSSeqUjfFeGcgeycBs7veS8/C
 KJb5kkqs=; b=undbMOwMZ8eROiEMh/JTLfCOiN5ZviCT8HVWZhnRU2dp8gJQuIo
 8TdV44dtBytd5Dg0w++nWmQlDIvYF85yP6XxnmN87UgWzbdhDi8UTWz4DBjYTLcA
 juSefcZhv185vPCOT4wxAvZZV66Qqn8XpaZfRHQr/akg5vsoYNfiUKCg+GaurYHA
 WPMEl0Uciq+5+gzbkgBCisaJwGjxl91EJSy81zgnZgNyWwaiEagKkC3KL5r2CIiK
 cAzmsPdB0gQ8qKE0P4UsNeC6XqF2cS+Yi8WCXSHF/CsLFmreURHkP2xb1QfpUeFz
 Bmmez+6L90l5hS5RphHmzk9yv/dObcFhsDQ==
X-ME-Sender: <xms:VW-aYv1K0h7266qBDyuqI6zzzsbiegP0tQ1UtpY85n1r0ivkl0_zWQ>
 <xme:VW-aYuFXG95z7NeKBA3ZbmpQvC_MI8XS1bZkqUSbjZNmwaOhax22Ffn2w6aza6cXd
 HJhj6cwr2Qho5_dycg>
X-ME-Received: <xmr:VW-aYv7oZDuTRYMibiaJ394fzP6h1CONM-5ithpJXYU3guY96I4BfDBrPYKjmhkFnKNo06WnNikZdtRdPaFu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddugeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnheptdeludfhgeelheelledtjefffeejtdeluedvgfetveffgeetvdevkeehieeikeet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Vm-aYk3UVkYYtUKpLt-O6i6hiwzGqekqrR_7vRFcpmN5QQ4Jhcz4rQ>
 <xmx:Vm-aYiFX9a6xjKNASG6D0O1zhjDzlhE-LqQBTlUkmzxG_jHWBQHRpA>
 <xmx:Vm-aYl9bEFxbMQ6tOLsfqt2kH273owDlAm3ndw4gxUqcOzeh-aSBxA>
 <xmx:Vm-aYuAtPyKnkKPelDMcjYVxIccTVORdc5AsTWCL1fijfDhfB622tw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 16:30:12 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH] Revert "hw/block/nvme: add support for sgl bit bucket
 descriptor"
Date: Fri,  3 Jun 2022 22:30:11 +0200
Message-Id: <20220603203011.711585-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
index 03760ddeae8c..958363e70cfe 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -808,10 +808,6 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
         uint8_t type = NVME_SGL_TYPE(segment[i].type);
 
         switch (type) {
-        case NVME_SGL_DESCR_TYPE_BIT_BUCKET:
-            if (cmd->opcode == NVME_CMD_WRITE) {
-                continue;
-            }
         case NVME_SGL_DESCR_TYPE_DATA_BLOCK:
             break;
         case NVME_SGL_DESCR_TYPE_SEGMENT:
@@ -844,10 +840,6 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
 
         trans_len = MIN(*len, dlen);
 
-        if (type == NVME_SGL_DESCR_TYPE_BIT_BUCKET) {
-            goto next;
-        }
-
         addr = le64_to_cpu(segment[i].addr);
 
         if (UINT64_MAX - addr < dlen) {
@@ -859,7 +851,6 @@ static uint16_t nvme_map_sgl_data(NvmeCtrl *n, NvmeSg *sg,
             return status;
         }
 
-next:
         *len -= trans_len;
     }
 
@@ -917,8 +908,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
         seg_len = le32_to_cpu(sgld->len);
 
         /* check the length of the (Last) Segment descriptor */
-        if ((!seg_len || seg_len & 0xf) &&
-            (NVME_SGL_TYPE(sgld->type) != NVME_SGL_DESCR_TYPE_BIT_BUCKET)) {
+        if (!seg_len || seg_len & 0xf) {
             return NVME_INVALID_SGL_SEG_DESCR | NVME_DNR;
         }
 
@@ -956,26 +946,20 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
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
@@ -6773,8 +6757,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->vwc = NVME_VWC_NSID_BROADCAST_SUPPORT | NVME_VWC_PRESENT;
 
     id->ocfs = cpu_to_le16(NVME_OCFS_COPY_FORMAT_0 | NVME_OCFS_COPY_FORMAT_1);
-    id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
-                           NVME_CTRL_SGLS_BITBUCKET);
+    id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN);
 
     nvme_init_subnqn(n);
 
-- 
2.36.1


