Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE3035467A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 20:01:42 +0200 (CEST)
Received: from localhost ([::1]:44278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTTXh-00040i-PT
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 14:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTTRa-000180-CQ; Mon, 05 Apr 2021 13:55:22 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:43255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTTRS-0000MC-If; Mon, 05 Apr 2021 13:55:21 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 06C715C00A4;
 Mon,  5 Apr 2021 13:55:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 05 Apr 2021 13:55:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=2d5xahzmmzHId
 arku98LESPCSmunOCpxJpVTR5xlWrI=; b=CbddhhOAe/N5HIDIw3D5n2kGuTykW
 ynqZWRrhpxE+NHh3JqhicZgZJ6Y5AmG5bU2/DETtai/FVUHj+S0lwZXpZH/Z2SEu
 yjr3JE0dgiDGH+sdOp1npfQ3l/5w1ybEEQi7md7Jn36O1JfTCs3acJhv3aZBHFmN
 Nwgrecemqjg8/2ZGF7QoDmVZSrvL0/eieU3oCex0Q07fYiotf5GbRfLclBhLg+I1
 79f1AJw4K4HlfX9VofLtW36z0KQM61f2pqIgUiHv9gtOTGhTvuyQ8q3D0dgr+AQR
 LVsjRRvUCK5n9pQZE7Ci9ZR32EsGHyGtHVNIZVatLCns637X3C7ikmmmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=2d5xahzmmzHIdarku98LESPCSmunOCpxJpVTR5xlWrI=; b=MLQScvHG
 xvyuQEKiO9bRi59NpyiqSLAJzQqXzs+iFWAFYi8VkwWUlVz1P+CSgwsGbfVrAXQB
 83h+duP7cRJFssHOawz1zxLJ3vFgRpTVAvmPd1YYBjYv5ZgIlPH3XzLCrdp/PH5q
 UoiVO3qIVjEPxFYL9CFKYN7peFy8uddRNyc24SQuJtsGFg4iruINpbW+pYcjUCxE
 /XQbZUmGyE33fC0jFuIj3FmQPNWCt8I4dkNscLuhyB+gf2z0zEAlnKp4WAyrnIbr
 fcuUXkQTnlOjtr4GaKQ+P5qKQ3rqHL3OAYqA9bSgax4oiWu9r7GxoaVmoa493hlq
 1JHvXItsow58tQ==
X-ME-Sender: <xms:_05rYIySkWYLbk1v-qguarpqaU5Yrgcq3mtlfYus6STBtf7YD4CN7Q>
 <xme:_05rYMRJqz7c3IPC7r8IAYfKN10noRCoYRAf-pVJPNBdXrFPOLs_sabZs89t60vpM
 n0XbNS-KRjU6FDQrBY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejvddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepfe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:_05rYKXYRIOk_VvffRAOq2n-TG6frprrq9LFsJ3z1SKpaP7uCvyNaA>
 <xmx:_05rYGjo89HBkCDSi1HbMOGdMSApknBDSkcBMSZF8FkOdwBzLpmsqA>
 <xmx:_05rYKAoyzML7QZfmkBHzDHd4eWlldTtTMAWnlMbntVyO8mUcNZIPA>
 <xmx:AE9rYADNSh9LROAV71pdTsmnvMlqeOYOYkzrb6oI4lGeaX_C7B97iA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id F25AE240057;
 Mon,  5 Apr 2021 13:55:09 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 6/8] hw/block/nvme: update dmsrl limit on namespace
 detachment
Date: Mon,  5 Apr 2021 19:54:50 +0200
Message-Id: <20210405175452.37578-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210405175452.37578-1-its@irrelevant.dk>
References: <20210405175452.37578-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The Non-MDTS DMSRL limit must be recomputed when namespaces are
detached.

Fixes: 645ce1a70cb6 ("hw/block/nvme: support namespace attachment command")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index de0e726dfdd8..3dc51f407671 100644
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
2.31.1


