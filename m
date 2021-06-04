Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8E139B38E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 09:06:31 +0200 (CEST)
Received: from localhost ([::1]:45636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp3uY-0005dM-Db
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 03:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hI-0005XS-59; Fri, 04 Jun 2021 02:52:48 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:54773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hG-0007IR-AW; Fri, 04 Jun 2021 02:52:47 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 871A45C0067;
 Fri,  4 Jun 2021 02:52:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 04 Jun 2021 02:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=K5gI+EaXNm47F
 mPdUufpQ9KRH5EtD4ZsVPCHVQ2k9Kg=; b=TtJ9qTPl3sepuMbvDqkgrymXFGrc7
 Ug/9h9GYgQKkHf0GAwX3l1AVV56mLpqXnBlS8DpwdfIaYhTGqd2EGIV7a2UACiSj
 E8u7kl0FY7pJUSwWjzKOJLC16Iij9fijPo4sAumVkNruai9Z5CTfhHATKpGyeqPA
 +ZxwLwMA7ZxdDbx4nc09is9GnzdUBSDW/BOlkBnRapNuq0e4p9hKbjFTOnAaGWiw
 Oy54aA6EuXc1hK7U9t7YgQAptQagtKIHFuO5GPxuYNuzC82jk5s9AVejN2WZ8GJH
 D3rBrjRoUYJBwqhxZP049Ca/rSpW8qDzoPctcV6aKpnbykH5NVF6pz5mQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=K5gI+EaXNm47FmPdUufpQ9KRH5EtD4ZsVPCHVQ2k9Kg=; b=V+54WOQI
 pkcZXBVTbQ8JGNF3V1jT9bq+Kq6jBFflVchcs70pTiFHYG02VP4YcT9jx0qyUZ8Y
 uw9Ac+C9JOTK8QYuep60imXItA/TWyT7CGmCK2rJOhQpuhG3QssJrqpJXGXlr1gw
 A5Ppegy9thFPQ3TZLXt5QkTWR//WYNlYid/AtFNgN3CjxroB0uv0czhKQpZoyIQG
 vUBYRCvZtZcPutKp1vp24cdDhgIWnHqMJGw7SWTOa98JaQZVbLTncKHHHzzx4iiP
 k8sa6VPpSabXRRlKU/jiM1N5AWPfNcim/DNrQgzmbVDcgRTIE/eDVabchw6KjSPX
 CWAbsySc4u68cg==
X-ME-Sender: <xms:vc25YGmgcOIbBbbIFg9nXkMwRsBL9ufnsAuAAAGNmXAUuqA5Tlz9xQ>
 <xme:vc25YN2-1NAiK0Z6eGPCKB3jRVBAozs8V-u3r6k_4DLhB7tv8WfUM5ECg6D5w5aVt
 VZxPbnzwUj8e45-rFU>
X-ME-Received: <xmr:vc25YEoqLJ9zV4zMEL_8lmPJgV0CZ8vYIzGxP6VctzEVf5MLu3nwBb4hFXFsB61Mh7EHvaOFmceoWZapnw4CUOdTW6kXBF_GuiJZx0lTsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedttddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:vc25YKnp5-Ao1C6MTJF7NnhY-ZYJQByTD5uPwNj31VcBu3UHnLApkg>
 <xmx:vc25YE0XvFBwrMKNe7TWQA6GLvu0PkO1YYUIsSmLbcYC-KUS5Yfotw>
 <xmx:vc25YBu25x6VQ9KFykWrOUYT9s6g_RLsUWna83kh5VCViX5zgdhGkg>
 <xmx:vc25YFm6D_4z1yq7juy9t2MShrljELGCwdylgQC4XI4kd0SRB3xgeQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jun 2021 02:52:44 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 02/11] hw/nvme: add nvme_block_status_all helper
Date: Fri,  4 Jun 2021 08:52:28 +0200
Message-Id: <20210604065237.873228-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604065237.873228-1-its@irrelevant.dk>
References: <20210604065237.873228-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Pull the gist of nvme_check_dulbe() into a helper function. This is in
preparation for dsm refactoring.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 41 ++++++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index f49268741427..0278f256e534 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1432,18 +1432,15 @@ static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
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
@@ -1455,23 +1452,41 @@ static uint16_t nvme_check_dulbe(NvmeNamespace *ns, uint64_t slba,
 
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
2.31.1


