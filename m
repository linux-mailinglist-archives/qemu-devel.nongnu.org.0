Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ACB2DE06F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 10:35:31 +0100 (CET)
Received: from localhost ([::1]:41752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCAc-0001vM-6y
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 04:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqBz2-0005W2-2A; Fri, 18 Dec 2020 04:23:32 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:39239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqByy-0002ba-Og; Fri, 18 Dec 2020 04:23:31 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 04D985C00DA;
 Fri, 18 Dec 2020 04:23:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 18 Dec 2020 04:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=nbYYYyegDfhtW
 KwgTYEkPIcmuu1KBLskaOCuM8x4MnM=; b=TLOfDlL8ZfLB4JEnd8X3ds68ygf2l
 PQ5haPOdqvsLiL6auynnGz97UMlXnmNQucijMlaxZgmOhKRK9bMzm5SMIwlmVsNH
 OO2XY0qCNtrZz3MKNEaXoW++Yw0axxY6jv2p9boobahqrAQo9wB6bnvGh6rIiY+5
 hcxgcxBGhzstIUnss11CXfjjxrZjvB/cKFFPqZSk9+0DGVH26T3vbgYr9R+x+uIW
 q5CxM5xVMOgtJldaSniAAfzl8cxTaYYSZWdBjaII7TwH+KcvL9QI6ricauNOmQCc
 Yed97z73ofIszF5Vd7ufjZkmf9tMIY8wYncJ/jd1FimfdZKz/LAIq20nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=nbYYYyegDfhtWKwgTYEkPIcmuu1KBLskaOCuM8x4MnM=; b=CkbCQCG9
 8VMsvoQWSRu+57vviusgxH9YhB1wmPXVpOmzIdicuJctLiLroTEiL5nVdgCn5Lh5
 p8IYpAcps7qVYDOLcwqAt5Y0F7T7nQANj4DwwYbm4xLEg6T6g3hskudoqoiteOT2
 Rxy60rc85G22LJCJbPcGl/ag/sviqFreY1SMvXqlXDM6t0HvC8mZBh2Y+YWVhDte
 spU/3V/5F3Q1gGHQIJV/oQwp2lqxTeJCyQDFhNK4RxqRvXsiz5gUO/ihTzDhDDGP
 tx2Sw9UqOLqd3NXHDp24/3B5NXByLMVBIVRaTqA2IFo4dLFV4fmF1nS41GLDRxRX
 ez503zrdx1LLXA==
X-ME-Sender: <xms:D3XcX6rFG0fCm34inwCXt0U_ek4hHG-AHCr6ncbdFv5NdOJ5WulzFQ>
 <xme:D3XcX4oBGCcTS1EN4wwSDLW24AJHz1F26awYFU8Qyz0BJuruoIlD82nAmmQlkox37
 SoTv2SuNW1EZhkplMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:D3XcX_P7MkVAlZmQJQ8rIoE9yXifI2rRtn9_ag4yzBpIxiGnAvMNRg>
 <xmx:D3XcX54E-YevuPp9SmU_nTLyWimncyEypW8RqRmUOzNLzm9aC058_A>
 <xmx:D3XcX56vGCHII3-Ns6lInhImfTIIdN8fKD-CA6U-KUGg7TgoLQndhQ>
 <xmx:EHXcX2vpDUIf0KKyaAUVXCOCCBfWvjd5zeOb8x_lCSIL9ns6qYYP2g>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4E59E108005F;
 Fri, 18 Dec 2020 04:23:25 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/block/nvme: lift cmb restrictions
Date: Fri, 18 Dec 2020 10:23:07 +0100
Message-Id: <20201218092308.894367-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218092308.894367-1-its@irrelevant.dk>
References: <20201218092308.894367-1-its@irrelevant.dk>
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The controller now implements v1.4 and we can lift the restrictions on
CMB Data Pointer and Command Independent Locations Support (CDPCILS) and
CMB Data Pointer Mixed Locations Support (CDPMLS) since the device
really does not care about mixed host/cmb pointers in those cases.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 33 ++-------------------------------
 1 file changed, 2 insertions(+), 31 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 16bf05638bf6..bd1de8453cfa 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -336,7 +336,6 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
     trans_len = MIN(len, trans_len);
     int num_prps = (len >> n->page_bits) + 1;
     uint16_t status;
-    bool prp_list_in_cmb = false;
     int ret;
 
     QEMUSGList *qsg = &req->qsg;
@@ -362,10 +361,6 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
             uint32_t nents, prp_trans;
             int i = 0;
 
-            if (nvme_addr_is_cmb(n, prp2)) {
-                prp_list_in_cmb = true;
-            }
-
             nents = (len + n->page_size - 1) >> n->page_bits;
             prp_trans = MIN(n->max_prp_ents, nents) * sizeof(uint64_t);
             ret = nvme_addr_read(n, prp2, (void *)prp_list, prp_trans);
@@ -382,10 +377,6 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
                         return NVME_INVALID_PRP_OFFSET | NVME_DNR;
                     }
 
-                    if (prp_list_in_cmb != nvme_addr_is_cmb(n, prp_ent)) {
-                        return NVME_INVALID_USE_OF_CMB | NVME_DNR;
-                    }
-
                     i = 0;
                     nents = (len + n->page_size - 1) >> n->page_bits;
                     prp_trans = MIN(n->max_prp_ents, nents) * sizeof(uint64_t);
@@ -519,7 +510,6 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
     uint64_t nsgld;
     uint32_t seg_len;
     uint16_t status;
-    bool sgl_in_cmb = false;
     hwaddr addr;
     int ret;
 
@@ -541,18 +531,6 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
         goto out;
     }
 
-    /*
-     * If the segment is located in the CMB, the submission queue of the
-     * request must also reside there.
-     */
-    if (nvme_addr_is_cmb(n, addr)) {
-        if (!nvme_addr_is_cmb(n, req->sq->dma_addr)) {
-            return NVME_INVALID_USE_OF_CMB | NVME_DNR;
-        }
-
-        sgl_in_cmb = true;
-    }
-
     for (;;) {
         switch (NVME_SGL_TYPE(sgld->type)) {
         case NVME_SGL_DESCR_TYPE_SEGMENT:
@@ -641,15 +619,6 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
         if (status) {
             goto unmap;
         }
-
-        /*
-         * If the next segment is in the CMB, make sure that the sgl was
-         * already located there.
-         */
-        if (sgl_in_cmb != nvme_addr_is_cmb(n, addr)) {
-            status = NVME_INVALID_USE_OF_CMB | NVME_DNR;
-            goto unmap;
-        }
     }
 
 out:
@@ -2428,6 +2397,8 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
 static void nvme_cmb_enable_regs(NvmeCtrl *n)
 {
+    NVME_CMBLOC_SET_CDPCILS(n->bar.cmbloc, 1);
+    NVME_CMBLOC_SET_CDPMLS(n->bar.cmbloc, 1);
     NVME_CMBLOC_SET_BIR(n->bar.cmbloc, NVME_CMB_BIR);
 
     NVME_CMBSZ_SET_SQS(n->bar.cmbsz, 1);
-- 
2.29.2


