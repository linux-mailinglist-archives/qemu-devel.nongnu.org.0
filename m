Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190FE3482E4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:29:29 +0100 (CET)
Received: from localhost ([::1]:46764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPA87-0003bW-Pq
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lP9om-0007tq-Kh; Wed, 24 Mar 2021 16:09:28 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:46523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lP9og-0008PY-8T; Wed, 24 Mar 2021 16:09:28 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2C437BEF;
 Wed, 24 Mar 2021 16:09:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 24 Mar 2021 16:09:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=y6r7vAdmAcJ5A
 IuBEwc9pd0kG8fYkoWfxo1US67nP4M=; b=2thCjqz6bHIWOEysnuBd2ZclSLEWO
 SG2BDGwTzzg8R0vngbvJhpT75cEbBVWVOQem0MT28P1eze7hyiKPvugeu2nfvsW6
 JLpLUoTdz6CGVcETktwg/od/3mG0Ro3wjS1sfpaK4JVronVhiegYNw+quV0BynqR
 IOFsJivQ8zjzG3fb0cl3h/RbupToPlYoY3QO0mVCZw/xNglYg4JL/DFEwEK/ZXRv
 WlI+xx91F6+0gueRy/8Q/1TCEC2LbfNFk/Z9yJQLToyr21PiCk+t/7ITE8iq9i73
 gF14V2drYQUqflgAUTLUq6U6vvTrhdffjbpOyi9vHl8V0NY70XHLMLcIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=y6r7vAdmAcJ5AIuBEwc9pd0kG8fYkoWfxo1US67nP4M=; b=uIunNqdw
 vvxF1Jh8cZ0Cuz3OOcWytvk45ZlL9P4Aaq30JjVPq0Lf8myZYk4WWjCEmjiGK/UM
 dNJirqCLMdh1nYQlhaBCX/xaP3ZNpWiM64xAm2Skrz6zCfwna20HnhMLBVhMoqLf
 /HROxjkxODgtfrsK+PIUC+jhmXb/PncuFpxeGRzC7W99efpTlGamEm2F5dFx/lEU
 L1/LBbZvevYZFRqREh5lBlr9U5+01LXwxZruH1I3AoPV0WaQupsSKyldQHFyzOfQ
 IPdYWnNnq0sxDLikOx6Hq0zEKX+sQEXFh5bTuCSlzlH8cEh4cxZXa/dC42x76Uuw
 J0O9hePAPowTdw==
X-ME-Sender: <xms:b5xbYC2EIFcMjOwViWZbVBIrSr6ItV_kQ_aJvtspqoc_Gmg1_jca8g>
 <xme:b5xbYI6JyXYvCr9INSFK-TNVMPCbjdBuVda_PhAxB1-o70QCdI7o4J7ISqdB0lrSm
 tPGlrYcsP9DeKezs14>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegkedgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepvd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:b5xbYD-FmurHtGAaJLBVKAaQQHHv5peM59DhK5n5yA77wOb9VXutsQ>
 <xmx:b5xbYHWxb6NmmjR21SguWswh3SyVnL4zzy0FHTwVu-goYOm8fGzUpw>
 <xmx:b5xbYOqnQozzk0c5CJsPdDzMXVxMio1tIgfnYodAFqrxuyV_IRJdGw>
 <xmx:b5xbYI3RbGmgZrlQIj5jhPxsa-qsWRKxZflW7Jw7tpOJsPLK1plP1Q>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9AFCE108005C;
 Wed, 24 Mar 2021 16:09:18 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 6/7] hw/block/nvme: update dmsrl limit on namespace
 detachment
Date: Wed, 24 Mar 2021 21:09:06 +0100
Message-Id: <20210324200907.408996-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210324200907.408996-1-its@irrelevant.dk>
References: <20210324200907.408996-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The Non-MDTS DMSRL limit must be recomputed when namespaces are
detached.

Fixes: 645ce1a70cb6 ("hw/block/nvme: support namespace attachment command")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 403c8381a498..e84e43b2692d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4876,6 +4876,21 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeRequest *req)
     return NVME_NO_COMPLETE;
 }
 
+static void __nvme_update_dmrsl(NvmeCtrl *n)
+{
+    int nsid;
+
+    for (nsid = 1; nsid <= NVME_MAX_NAMESPACES; nsid++) {
+        NvmeNamespace *ns = nvme_ns(n, nsid);
+        if (!ns) {
+            continue;
+        }
+
+        n->dmrsl = MIN_NON_ZERO(n->dmrsl,
+                                BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
+    }
+}
+
 static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns);
 static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
 {
@@ -4925,6 +4940,8 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
             }
 
             nvme_ns_detach(ctrl, ns);
+
+            __nvme_update_dmrsl(ctrl);
         }
 
         /*
-- 
2.31.0


