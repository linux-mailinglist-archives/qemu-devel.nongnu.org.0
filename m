Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673554CCDC0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 07:31:49 +0100 (CET)
Received: from localhost ([::1]:38334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ1Tg-00022Y-0z
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 01:31:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nQ1N6-0005hC-Rl; Fri, 04 Mar 2022 01:25:01 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:56403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nQ1N2-0002RF-4w; Fri, 04 Mar 2022 01:24:59 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2225458062C;
 Fri,  4 Mar 2022 01:24:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 04 Mar 2022 01:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=eD3Z//acc0TvIT
 txQb1V0sCgfRK79UyKYNr/ltUVJfY=; b=LFU5Ax14jql+I5fRKdfgsMxpPZJXC7
 vKxRg2qKlRU9F5zN2gYx4Hy9SxlFx/8FCqiDZrkEp4rd2+K9xfAqQomO1I50+Rwh
 wyvWzhdErCCMaxHaORQumPgnREAyuiIT2MS5de8Qmpr5dSwxO1vACNYsyZE4a+pZ
 +ppY7NLjb0N38b5pGsFPB8dpati26GP+gRaieRV7arfAtlYP01k7TESYnpfhhSlj
 AAgiDTKXu4ksUJkHzwfo+CwMOzyjlY3jbeE+EaxXU5NgUS2TbMpAnN9pvKpKjk7S
 YDVvnaKNYEO5HYvkJHbjFJZhiQ+WOnoGvJCkhvWduablt5titMpSlPPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eD3Z//
 acc0TvITtxQb1V0sCgfRK79UyKYNr/ltUVJfY=; b=TL4OSCqr9NK73Zc2TgHqIR
 z5bNAZ2ztJlbglA3lSef4Sthp7VWsLeawABT3Lr3T7wOlsUTCDDIzmERgeRci4L3
 dk1ArICeRp3w2Lv/TDq7aapdv4mLXaOfgVyagUAcGI43na5dkWFMvhFzlmv2I9R1
 RBYBxd4Nb+5k4B7qOiDSzVIY5et2yDTCmm+H0xj6RhH9yVLmtdSAroVZrPRUPrXN
 hzGtERYeS4w2Z33QQLc3gcv67XA+K4lWRNcf0gtItqvKLzph9GNldZe74x59Xlfc
 ZEZ+QyR4TZfzAAA7zXyepfrvEd/ciT95Vy9GrsTbVHrPDQ+Pez4eSWEY45jcMe/Q
 ==
X-ME-Sender: <xms:tbAhYntRcOPy1zuHbdPc6k-5eZ9zmBfyQKLwtFndCJec9Tau3gKDNA>
 <xme:tbAhYodPYc9bMpG67M3-261DNb9YMf9mlN3CohY5WrVsCwmK2gY3CgHYagWQdrcVV
 KLfOJZHPqXevsrFofg>
X-ME-Received: <xmr:tbAhYqx-thMrBFRRkMn_UGIqw4XbRVvPlv_C-A6al-btcsk20x5zELAj7uQO79ryHj99QDRHE21jCsvZJlAiYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtjedgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:trAhYmPj9Y2z3Zmg1VLQl7437v77lHNks3xjMNxHqjPU8OEUct6-DQ>
 <xmx:trAhYn-HhBGPTXr88zZ2pW3EoJp9MjwAcYqT2nm2OxXlSu08yA9f1Q>
 <xmx:trAhYmVnJBM_EbTTMChDo6fa4-GLbrsQrZtnuNwbVx71-nnq8s5kYg>
 <xmx:trAhYuaiJj2Nv6qYag1zAgaEkV8n_989Vq-GMvRVNlUnohjjDzIgCg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Mar 2022 01:24:52 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/6] hw/nvme: move format parameter parsing
Date: Fri,  4 Mar 2022 07:24:40 +0100
Message-Id: <20220304062443.352515-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304062443.352515-1-its@irrelevant.dk>
References: <20220304062443.352515-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
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


