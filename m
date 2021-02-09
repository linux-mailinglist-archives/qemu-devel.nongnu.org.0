Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8B4314AD8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:55:19 +0100 (CET)
Received: from localhost ([::1]:59574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Onm-0006cN-Ku
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:55:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWJ-0005kb-G1; Tue, 09 Feb 2021 02:33:11 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:39245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NWH-0005zr-La; Tue, 09 Feb 2021 02:33:11 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B6C88CB9;
 Tue,  9 Feb 2021 02:32:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=3giZ9o9s9z4Y0
 owNE6DKwUe5RyNSA+eZzLvwWgwnVGQ=; b=nX7Hv9vWR+gmJ4VEg5UHvgQB81E9o
 HG49cHrcj3OGgTlmTLCHpqKyqfGIwjxclimhF14yvMzsAy7gJy5O/OX7CX8Eeanh
 OXEdp4u9sfvAfmRuKvwQdViWmiUCDPW+JK0xOVF7eg68L/OpUQwTZqwFZWFWgNaM
 Lw0StjSRh52JBstaalvofTPkfhHlsPaeMOtxU0y6AHVbVXrgqB+ZGpnxI1q90IWc
 fgG12zaOqWXIoFzpL3gXmUy6n6gVozzAJLUpQLM1SjWZ01hC04yqxjWWrfhRY1zS
 rJJNrErtLPvTBiIiIpNHQqawd86PVwuUbVBmoYOF9OvdVvi3avYXVqizA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=3giZ9o9s9z4Y0owNE6DKwUe5RyNSA+eZzLvwWgwnVGQ=; b=pzU+ByDS
 34wW9emek6IXpHknNa+u6Glo5ziRwI16yckmdWMlYTB0MbUzpNA6nDttiJTAGK6E
 Z8sKwFNq9lq8XGwJ1W/ca0Ps79pfZ2CV6KjlQORaahuNEzWZu9z05FXe6wzfuQv/
 uqnXiuxRGmoM+ZFKLqnBg2prktZFj72rFlCJl9LaKW+q5gLyUkDW5nAp+Oaywe7/
 sYdmD0gn9hTSsifYiPd64eU4yOvDfWV9bZkENbjvK9icigKGV9LCfkoq1mYCEr3w
 qT8LFjrs523AXPgIvv98LanTD/wHIlTMGktq+e3ABGRzr2goki2XOwnrqv7q2WA7
 ibBvRCWtb8R1RQ==
X-ME-Sender: <xms:lzoiYP6PT8D_u-ydnUvOMrij_-9A5WAd4x1ZkVzD0Rdvt53Q7lavpg>
 <xme:lzoiYE6fXKdMXPnLNwIBiafHRkLO5NejwvZa8_CgX137f7Lw9PJTFk6MsUKH76BHJ
 BKXA6vX_VQ25ig7Mac>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedule
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:lzoiYGdA2PDdSlNiypMP55VVbY__wiiJcI7NrBrH8SlaqHFGUU_NcQ>
 <xmx:lzoiYAJix8vnup0fTyxrmp3Ift9pPYM-IlEi_9wjuKhqKpsqB17FQw>
 <xmx:lzoiYDJLDjjzZaQO1ZhPZkst0pFzhs96zqDRN1Js_gNAREVjK0Ga4g>
 <xmx:lzoiYK8QxN31ltuMWXgXr9WuXFtjMGUonOLxg2sfx9Uud8DqMzKabYidvHU>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E03FB108005F;
 Tue,  9 Feb 2021 02:32:37 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 49/56] hw/block/nvme: lift cmb restrictions
Date: Tue,  9 Feb 2021 08:30:54 +0100
Message-Id: <20210209073101.548811-50-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The controller now implements v1.4 and we can lift the restrictions on
CMB Data Pointer and Command Independent Locations Support (CDPCILS) and
CMB Data Pointer Mixed Locations Support (CDPMLS) since the device
really does not care about mixed host/cmb pointers in those cases.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 33 ++-------------------------------
 1 file changed, 2 insertions(+), 31 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index c4c968f5951e..40784bd908fb 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -509,7 +509,6 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
     trans_len = MIN(len, trans_len);
     int num_prps = (len >> n->page_bits) + 1;
     uint16_t status;
-    bool prp_list_in_cmb = false;
     int ret;
 
     QEMUSGList *qsg = &req->qsg;
@@ -535,10 +534,6 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
             uint32_t nents, prp_trans;
             int i = 0;
 
-            if (nvme_addr_is_cmb(n, prp2)) {
-                prp_list_in_cmb = true;
-            }
-
             nents = (len + n->page_size - 1) >> n->page_bits;
             prp_trans = MIN(n->max_prp_ents, nents) * sizeof(uint64_t);
             ret = nvme_addr_read(n, prp2, (void *)prp_list, prp_trans);
@@ -555,10 +550,6 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, uint64_t prp1, uint64_t prp2,
                         return NVME_INVALID_PRP_OFFSET | NVME_DNR;
                     }
 
-                    if (prp_list_in_cmb != nvme_addr_is_cmb(n, prp_ent)) {
-                        return NVME_INVALID_USE_OF_CMB | NVME_DNR;
-                    }
-
                     i = 0;
                     nents = (len + n->page_size - 1) >> n->page_bits;
                     prp_trans = MIN(n->max_prp_ents, nents) * sizeof(uint64_t);
@@ -692,7 +683,6 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
     uint64_t nsgld;
     uint32_t seg_len;
     uint16_t status;
-    bool sgl_in_cmb = false;
     hwaddr addr;
     int ret;
 
@@ -714,18 +704,6 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
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
@@ -814,15 +792,6 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov,
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
@@ -3777,6 +3746,8 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
 static void nvme_cmb_enable_regs(NvmeCtrl *n)
 {
+    NVME_CMBLOC_SET_CDPCILS(n->bar.cmbloc, 1);
+    NVME_CMBLOC_SET_CDPMLS(n->bar.cmbloc, 1);
     NVME_CMBLOC_SET_BIR(n->bar.cmbloc, NVME_CMB_BIR);
 
     NVME_CMBSZ_SET_SQS(n->bar.cmbsz, 1);
-- 
2.30.0


