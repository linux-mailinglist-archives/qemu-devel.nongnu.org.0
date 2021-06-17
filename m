Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A503ABCAC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:26:28 +0200 (CEST)
Received: from localhost ([::1]:35002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltxek-000453-Vs
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxM4-0002PW-KI; Thu, 17 Jun 2021 15:07:08 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:48431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxM2-0002wX-46; Thu, 17 Jun 2021 15:07:08 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 61D495C0163;
 Thu, 17 Jun 2021 15:07:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 17 Jun 2021 15:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=+FNOeI7fQoDKI
 wskRsFqxijv/G4Fvdc/vDZEjum4WgA=; b=Z6JWwnvC/Jb1Qzp2hK4eVepivor3/
 uvqYX1Ys1Y6BT3mF4/vTYSVxuH8waFqSnXCrA6Gjo0MhBV9XLg8OsiwvZ74e4cOs
 2pFpBOkG+nbjzoNBLgk4xYGw7+apcdAeAqwYJ9mUnFM2yCOMch75b8M3KEXBqobx
 Ql2FKWmkAvOo+uwwtjRdxQ/01D13EGzmxXqTw9hhaQg8PVETBZ3gd2aAD/T0LldI
 a7Bf9d5FqcPWDUYxrdKR2zbMM8tQE3EXGOBoBWFb82/oOTZxIwk9RsgGVD512E7R
 bz9ckCj64l+MYzDpbaM8TmlRRtNshUgnCtWoRfvDYrxTvujng3ighIo9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+FNOeI7fQoDKIwskRsFqxijv/G4Fvdc/vDZEjum4WgA=; b=VXPlBbjT
 pEdVEYI7gDhaD5TR80k6D1Dmemca8oVbpBgkZR5SgBN3pHu69R1E5GbOMZj4Nx+d
 /hnUfyMM90GiFP1pH37+iroVr4zgmqS9IKBRRH7Q1zbHpWYwlB7xreuxMv/Z1/Lj
 xc0/pvi+aCS5Onah7uF5xqlAgw1L/rzeS+12md9YVAdkqTni3BzcAC4SXL9PPGHK
 MK068yrXQUPRNVJX8SqBU0XycuD1Auc+rCA8QWWmhjX833hoAhUSIDB13HZwiol0
 Ovw7gaFx8k3X5Q7DQvCe9DaLTNPcRlgFPWEx+RhH23HLoH56s5dr2m2hG/YtCKgh
 vlDQ8tqSdlAkEw==
X-ME-Sender: <xms:WJ3LYJmGDjZ-YbfsqfbWai9Wggj-wXtZD7_inWUjN3SndpaSHrt38g>
 <xme:WJ3LYE3hHhyJszaxAes581LNitUlbKAiyJCgPWH7J9EI_kGKlUNtQTRh07R72zAT7
 uInAw_HF8gAYHZ8QA0>
X-ME-Received: <xmr:WJ3LYPpz7SfhBxyccRSfMrLiTsfVkPB14146Hej4_j9jA0szL5nhKYLTTcwFso-oruKRRn_rMslwzlNdqgtXXDRnjuLnw5AAhKsjB67opA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefuddgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:WZ3LYJlpqFHXJFyOUVtozmXS05RIeuGZbu6FFiDzrvyctJUram6LLQ>
 <xmx:WZ3LYH0w5Fa0DwBhFr-6gfnIzotM6sjfHgY7QEWOpUffC7siDbXMYw>
 <xmx:WZ3LYIuP25zRDoyxm9gth9dtZyr-cPikn6eKtAXykoNWbeLuMKwhBg>
 <xmx:WZ3LYAJPKYPIKon3psDywtEY28gR4IhD97ECGh5ytO7KjW2dDv7H0w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 15:07:03 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/11] hw/nvme: add nvme_block_status_all helper
Date: Thu, 17 Jun 2021 21:06:48 +0200
Message-Id: <20210617190657.110823-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210617190657.110823-1-its@irrelevant.dk>
References: <20210617190657.110823-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Pull the gist of nvme_check_dulbe() into a helper function. This is in
preparation for dsm refactoring.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 41 ++++++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 9f81ab99d484..2e36349ced28 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1438,18 +1438,15 @@ static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_check_dulbe(NvmeNamespace *ns, uint64_t slba,
-                                 uint32_t nlb)
+static int nvme_block_status_all(NvmeNamespace *ns, uint64_t slba,
+                                 uint32_t nlb, int flags)
 {
     BlockDriverState *bs = blk_bs(ns->blkconf.blk);
 
     int64_t pnum = 0, bytes = nvme_l2b(ns, nlb);
     int64_t offset = nvme_l2b(ns, slba);
-    bool zeroed;
     int ret;
 
-    Error *local_err = NULL;
-
     /*
      * `pnum` holds the number of bytes after offset that shares the same
      * allocation status as the byte at offset. If `pnum` is different from
@@ -1461,23 +1458,41 @@ static uint16_t nvme_check_dulbe(NvmeNamespace *ns, uint64_t slba,
 
         ret = bdrv_block_status(bs, offset, bytes, &pnum, NULL, NULL);
         if (ret < 0) {
-            error_setg_errno(&local_err, -ret, "unable to get block status");
-            error_report_err(local_err);
-
-            return NVME_INTERNAL_DEV_ERROR;
+            return ret;
         }
 
-        zeroed = !!(ret & BDRV_BLOCK_ZERO);
 
-        trace_pci_nvme_block_status(offset, bytes, pnum, ret, zeroed);
+        trace_pci_nvme_block_status(offset, bytes, pnum, ret,
+                                    !!(ret & BDRV_BLOCK_ZERO));
 
-        if (zeroed) {
-            return NVME_DULB;
+        if (!(ret & flags)) {
+            return 1;
         }
 
         offset += pnum;
     } while (pnum != bytes);
 
+    return 0;
+}
+
+static uint16_t nvme_check_dulbe(NvmeNamespace *ns, uint64_t slba,
+                                 uint32_t nlb)
+{
+    int ret;
+    Error *err = NULL;
+
+    ret = nvme_block_status_all(ns, slba, nlb, BDRV_BLOCK_DATA);
+    if (ret) {
+        if (ret < 0) {
+            error_setg_errno(&err, -ret, "unable to get block status");
+            error_report_err(err);
+
+            return NVME_INTERNAL_DEV_ERROR;
+        }
+
+        return NVME_DULB;
+    }
+
     return NVME_SUCCESS;
 }
 
-- 
2.32.0


