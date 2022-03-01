Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092484C8A34
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 12:00:55 +0100 (CET)
Received: from localhost ([::1]:47984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP0FR-0007nx-T5
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 06:00:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nOzzl-0006Jp-Kq; Tue, 01 Mar 2022 05:44:41 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:44215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nOzzk-0005ht-24; Tue, 01 Mar 2022 05:44:41 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4E5DF580305;
 Tue,  1 Mar 2022 05:44:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 01 Mar 2022 05:44:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=eD3Z//acc0TvIT
 txQb1V0sCgfRK79UyKYNr/ltUVJfY=; b=MTXxVFQnfKRlIC3lI6iWAYLo2S2doj
 okepOZbcM/eZ4oOK5nZjzpSh7SUE9J1DSPRROuDtmU+QUYUAEksC49ViuyUqVZo9
 5XILVdOo0gdwCFmTH/koF9WVFRwRPby1h37/94VgMjR+1ZJtMBQ18ZV99zW2u5Dp
 kPktlQMewcJwsts8l+f6nOO0J9vyTliLDIADuCqXwRTq9nrolzHbebdQv99lu7oL
 75V1dMDPo3X/cSWi4GpPNB7QGK4cgTKK3bdY5ctHKtPTlKm6BCNt3VpDhA6aT+CJ
 M1TlwqFg2F42FWodK90AHqHkOuvh/XNeuSAeQZ3/9930p3Xmt4K12nEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eD3Z//
 acc0TvITtxQb1V0sCgfRK79UyKYNr/ltUVJfY=; b=NsOFMw5sArBSZjK8ltE/L3
 o3vkpC5rTvq0drcg3VpgCB5SVbxicLZHmVH/7syI4lEBXNL153oycQSiYa1aZw72
 xgvJGQJCUdYDARx0MIgJ3jGYKTKLQ0xsIwkuUfRTXAkUMzA1wwvmk+cYf2guvUnB
 cu2k5M2Weu3gFh1RvM889crP7MXzf2UzXkSErJ5HZTC6mlxlfLA+KJ+/kvEF9HXn
 YD13qgMHafOx2AloezhidnqcDY4Znth5nFPBjwW2QrQbReFebKLU3NL9v2kQKBZT
 aOrIcGd8OFKNmdpWBnu8RCV6pXIFDbBRte7VEoJBynSUV0GJHJ6xig+WHdpwvEWQ
 ==
X-ME-Sender: <xms:F_kdYiCPfUVIoOxlH8KxjUIlcN6_3hTMPiXkzsP8E7jwRO9DAAfj7w>
 <xme:F_kdYsjMgl7Hdf86e4Cf9Jxs3GTotrJXKFkqAua2da9K-mUfZWvln7y_w6Lp4V9hQ
 5VE9O7kr-rnJbHk1Lk>
X-ME-Received: <xmr:F_kdYlk5bfH4JmIgzB8MnF61L2Q8X2MPEBe3PxadcWWXN6xaTjT1kZvBI7adQ1-nJ7AMDVhypHYyVaKn_8U-BA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:F_kdYgzN9j3urXCJ7esuwg_OOk5zo4BvfTPgdOqwIhBun2A2RQT9WA>
 <xmx:F_kdYnTaocnhQOmfbB6zfc9sU8I5BT2R4fKM8etLhyuU0xddHrFgxQ>
 <xmx:F_kdYrbXBMAE5KBrj0Wk2tpZB8QAoblV9qbmsOIj5CZXHR98Nl4egg>
 <xmx:F_kdYs9IyS-Hy78bT6FP1zIL1euQLndlHOJwS0NoKTvCwFKGmW2IzQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Mar 2022 05:44:37 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Keith Busch <kbusch@kernel.org>
Subject: [PATCH v2 3/6] hw/nvme: move format parameter parsing
Date: Tue,  1 Mar 2022 11:44:25 +0100
Message-Id: <20220301104428.160017-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301104428.160017-1-its@irrelevant.dk>
References: <20220301104428.160017-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Naveen Nagar <naveen.n1@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

There is no need to extract the format command parameters for each
namespace. Move it to the entry point.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 71c60482c75f..d8701ebf2fa8 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5452,6 +5452,11 @@ typedef struct NvmeFormatAIOCB {
     uint32_t nsid;
     bool broadcast;
     int64_t offset;
+
+    uint8_t lbaf;
+    uint8_t mset;
+    uint8_t pi;
+    uint8_t pil;
 } NvmeFormatAIOCB;
 
 static void nvme_format_bh(void *opaque);
@@ -5471,14 +5476,9 @@ static const AIOCBInfo nvme_format_aiocb_info = {
     .get_aio_context = nvme_get_aio_context,
 };
 
-static void nvme_format_set(NvmeNamespace *ns, NvmeCmd *cmd)
+static void nvme_format_set(NvmeNamespace *ns, uint8_t lbaf, uint8_t mset,
+                            uint8_t pi, uint8_t pil)
 {
-    uint32_t dw10 = le32_to_cpu(cmd->cdw10);
-    uint8_t lbaf = dw10 & 0xf;
-    uint8_t pi = (dw10 >> 5) & 0x7;
-    uint8_t mset = (dw10 >> 4) & 0x1;
-    uint8_t pil = (dw10 >> 8) & 0x1;
-
     trace_pci_nvme_format_set(ns->params.nsid, lbaf, mset, pi, pil);
 
     ns->id_ns.dps = (pil << 3) | pi;
@@ -5490,7 +5490,6 @@ static void nvme_format_set(NvmeNamespace *ns, NvmeCmd *cmd)
 static void nvme_format_ns_cb(void *opaque, int ret)
 {
     NvmeFormatAIOCB *iocb = opaque;
-    NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = iocb->ns;
     int bytes;
 
@@ -5512,7 +5511,7 @@ static void nvme_format_ns_cb(void *opaque, int ret)
         return;
     }
 
-    nvme_format_set(ns, &req->cmd);
+    nvme_format_set(ns, iocb->lbaf, iocb->mset, iocb->pi, iocb->pil);
     ns->status = 0x0;
     iocb->ns = NULL;
     iocb->offset = 0;
@@ -5548,9 +5547,6 @@ static void nvme_format_bh(void *opaque)
     NvmeFormatAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeCtrl *n = nvme_ctrl(req);
-    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
-    uint8_t lbaf = dw10 & 0xf;
-    uint8_t pi = (dw10 >> 5) & 0x7;
     uint16_t status;
     int i;
 
@@ -5572,7 +5568,7 @@ static void nvme_format_bh(void *opaque)
         goto done;
     }
 
-    status = nvme_format_check(iocb->ns, lbaf, pi);
+    status = nvme_format_check(iocb->ns, iocb->lbaf, iocb->pi);
     if (status) {
         req->status = status;
         goto done;
@@ -5595,6 +5591,11 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeFormatAIOCB *iocb;
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
+    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
+    uint8_t lbaf = dw10 & 0xf;
+    uint8_t mset = (dw10 >> 4) & 0x1;
+    uint8_t pi = (dw10 >> 5) & 0x7;
+    uint8_t pil = (dw10 >> 8) & 0x1;
     uint16_t status;
 
     iocb = qemu_aio_get(&nvme_format_aiocb_info, NULL, nvme_misc_cb, req);
@@ -5604,6 +5605,10 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
     iocb->ret = 0;
     iocb->ns = NULL;
     iocb->nsid = 0;
+    iocb->lbaf = lbaf;
+    iocb->mset = mset;
+    iocb->pi = pi;
+    iocb->pil = pil;
     iocb->broadcast = (nsid == NVME_NSID_BROADCAST);
     iocb->offset = 0;
 
-- 
2.35.1


