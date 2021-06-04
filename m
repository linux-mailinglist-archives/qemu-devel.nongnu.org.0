Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3120639B3B4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 09:19:56 +0200 (CEST)
Received: from localhost ([::1]:33570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp47W-00007q-Lq
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 03:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hM-0005cA-Eh; Fri, 04 Jun 2021 02:52:52 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:38749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lp3hK-0007MX-SF; Fri, 04 Jun 2021 02:52:52 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1E5BD5C0172;
 Fri,  4 Jun 2021 02:52:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 04 Jun 2021 02:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=DBTNGxX3O4Kll
 rsCnUxfIiC2hm6LTdtecwxe3Q+YYII=; b=iNn0sqepPGpibmEXR8RnDKBavxNFx
 pq8kU/+UtYod25EHG/ZVx8PvCfj2l6nRxaOPrQtDTwfq9WLwGzHOPXE8Zh7j1EKp
 nA45GC9w5cYoNKDTKjAGCjY62EeF8L14veb3iPnSBElijHDocHDBmFLWI5BjEQd3
 jo5ogEs1LqfINuC3fSWK5kPo5v2Ip4PNPrq9Q6uajNRfhfWvP6poJvuwsJ/xP0/Q
 mmowp493w27wn4tP6HPW4Hp9Y+mIo86rhc+DWZ4YLRFqDKLc8OH2P3T3Ssz5Noqu
 zCDAV10u9j3Mcey2QiWrUzm3bv+OfhpdYgLMiRKB9Dr1cWw6nUR4xYqwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=DBTNGxX3O4KllrsCnUxfIiC2hm6LTdtecwxe3Q+YYII=; b=N8MIn7k5
 /CnzpOqpeoyGG5CBDG5w1pdRqBUGhVPJ2yxZst+Emeo+KNysQvl5MmzKOIOFlgnF
 ugOvbsFPUaH/pAG1OUT8BkhonKoNLM+crMniupjHqUX0/ysK4jQ8msiS6VNkeNQ8
 j74WRTTtDi5S7YZ1tqolA5qPcpeYXR8KSOipuh3jEkvRrhV6ageWbWVejvSCqnca
 ovTwy6RJb+nLvycKxt+TllkH2g24fhVH3qz1zzGKK89x/aN9dO6PhXlRulqHp/2j
 yb7Pzfv2lq/HWHWsQ0iYlMlG0jBsfoeMR17AxobazHSK4tuHJQ9WsH/jmOmWXL5R
 MoEP62KJ2iyFgQ==
X-ME-Sender: <xms:ws25YHLSd5-sAfvFhPMSFjedsvtypxKM87axpgrVPlHm2_2GxoMuzg>
 <xme:ws25YLIiJbJT4xmu4sg5rgPlID2gE7Hz0usvioaKmcIeVnzAj6QKL_TDMt4ieryQ3
 5cO2OjBVJ1i5oloxT4>
X-ME-Received: <xmr:ws25YPsJdIYw7v2zQLzjVDm9X-FXsYkwILOOntQfzGGU6-BJncot_wE1mud1vvZ8_LkbDPqIHOqydFz9t6WOQHXNIkm6bQnQ1_hPLIT5UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedttddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ws25YAYup6LHvNyM5_ILULiSeE7RVRGdE5ffQSBmJYFAx4WNUPClRA>
 <xmx:ws25YObAU1JVBuvB0PTtHxC_XTMnHyedI0BMtkC1I0ikglOj2rYZZA>
 <xmx:ws25YEBi5hUfTz4DsyCDF0Tc-riQkot-M-pTn5J__lAhyHkU9irnzQ>
 <xmx:ws25YG69xPAnQXCCr7jCpn-QEwaVYMkRd-yk2xJq457tXOCQ4Pt1ow>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jun 2021 02:52:48 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 05/11] hw/nvme: remove assert from nvme_get_zone_by_slba
Date: Fri,  4 Jun 2021 08:52:31 +0200
Message-Id: <20210604065237.873228-6-its@irrelevant.dk>
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

Make nvme_get_zone_by_slba() return NULL if the slba is out of range.
This allows the function to be used without guarding the call with a
call to nvme_check_bounds(), in preparation for the next patch.

Add asserts after calling nvme_get_zone_by_slba() instead.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 0dc86f7b603c..0895faaa0724 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1536,7 +1536,10 @@ static inline NvmeZone *nvme_get_zone_by_slba(NvmeNamespace *ns, uint64_t slba)
 {
     uint32_t zone_idx = nvme_zone_idx(ns, slba);
 
-    assert(zone_idx < ns->num_zones);
+    if (zone_idx >= ns->num_zones) {
+        return NULL;
+    }
+
     return &ns->zone_array[zone_idx];
 }
 
@@ -1613,11 +1616,16 @@ static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
 static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
                                      uint32_t nlb)
 {
-    NvmeZone *zone = nvme_get_zone_by_slba(ns, slba);
-    uint64_t bndry = nvme_zone_rd_boundary(ns, zone);
-    uint64_t end = slba + nlb;
+    NvmeZone *zone;
+    uint64_t bndry, end;
     uint16_t status;
 
+    zone = nvme_get_zone_by_slba(ns, slba);
+    assert(zone);
+
+    bndry = nvme_zone_rd_boundary(ns, zone);
+    end = slba + nlb;
+
     status = nvme_check_zone_state_for_read(zone);
     if (status) {
         ;
@@ -1780,6 +1788,7 @@ static void nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *req)
     slba = le64_to_cpu(rw->slba);
     nlb = le16_to_cpu(rw->nlb) + 1;
     zone = nvme_get_zone_by_slba(ns, slba);
+    assert(zone);
 
     nvme_advance_zone_wp(ns, zone, nlb);
 }
@@ -3175,6 +3184,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
 
     if (ns->params.zoned) {
         zone = nvme_get_zone_by_slba(ns, slba);
+        assert(zone);
 
         if (append) {
             bool piremap = !!(ctrl & NVME_RW_PIREMAP);
-- 
2.31.1


