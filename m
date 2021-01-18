Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCAF2F9C38
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:15:13 +0100 (CET)
Received: from localhost ([::1]:58396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RZ2-0001zY-Nj
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:15:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R8X-0001Ap-2W; Mon, 18 Jan 2021 04:47:49 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:54547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R8U-0001Bl-DE; Mon, 18 Jan 2021 04:47:48 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9EF4E5C0175;
 Mon, 18 Jan 2021 04:47:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 04:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=VgRp9IaFYkHOY
 EmojIbrUoJX3fRHam+GrGWeifIKBbo=; b=sweB5C1UbJwDp+2dS917S7T4mljEB
 EQ3YPGludZPfGIx+45lqPj6W3oAAm9wOPP/+0vj41TkxuyvTgS6MiZxKzFODAL43
 FWJEM12UPBazmopxa3NKBj+JX5BeDQH7goZZJgIHPLE8i6UodHGbCrXMBDgPI9LN
 Mm5Qk62FG0kQ/0x4qUIvMgAw10dD1RGzcmxb6GUwk2whs5E/AvoyJtigEVmn8yrM
 qNhnZqWA247ri+bDTsPL9oRmp3U+YzAoT0vd2D34S9KLkbAGdDShjfchdiIqEsEv
 3uX0nxx6ba6dGDnmQPJgdMe5wvPA4laHceOyhNbOdVEqOIPms4M80WXag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=VgRp9IaFYkHOYEmojIbrUoJX3fRHam+GrGWeifIKBbo=; b=LCLL6uLv
 R/5azlF38DmodSmQjtlLRR/8zuFNMtl1dm+R2V5WfOu1oymNIwFK0pYTD3NIUDqM
 cD33909IA7lyRxl5DEY8H+ipUJ7CqPFiQhWMUd1lZx448Qnnn5u2lLph+XyWlBVJ
 //b1YEUQvQwWXE5VLNJG6sptR9C0OPciy51Fz2+O2bTOaPJ2z25Et2eb7QA4z9/0
 Tvhxbb3sldHJJJJ3M0T42QBFk/9nm0olf8/QCB3NIWu+3cz35moGb1Y4+s1eC5Wc
 og8UsPR84S4T15GcLuieigLkXsvtLbAJkehJJY1eUiZ+ZiYFQFlTMv4P0kffURtZ
 tyN70yov9zZ65A==
X-ME-Sender: <xms:LVkFYCpXu_QJo7icDWrZorNbff5arrnvoMNefddq5YM0lfpfHFR4dQ>
 <xme:LVkFYAr1wZJQxIeR4ufHGwPSfUBRHCInFpNKt5hjXPr0U0FUTYG29pCmkhytbtKRD
 MLP1nNwdJ_wDSD1lvY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepjeenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:LVkFYHOpVEesTTbYi_i1gangRWAzDrpH2I2jU1SbkZzeJv72tp8dFw>
 <xmx:LVkFYB7kMKSCGv5FmdUs4HE4n-pZBfneKbkUFZsdhzijvOGWNv2iUg>
 <xmx:LVkFYB7Zr2GsgYz9lpM4W6ha9RH-52OfKlJq7P7gP8etL_zKmRF96Q>
 <xmx:LVkFYOvatISzhDaetoY36qZSluOMApDuMF60sx5AEBHqjNkegTfDpA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5AA7F24005A;
 Mon, 18 Jan 2021 04:47:24 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/12] hw/block/nvme: lift cmb restrictions
Date: Mon, 18 Jan 2021 10:47:05 +0100
Message-Id: <20210118094705.56772-13-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210118094705.56772-1-its@irrelevant.dk>
References: <20210118094705.56772-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

The controller now implements v1.4 and we can lift the restrictions on
CMB Data Pointer and Command Independent Locations Support (CDPCILS) and
CMB Data Pointer Mixed Locations Support (CDPMLS) since the device
really does not care about mixed host/cmb pointers in those cases.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 33 ++-------------------------------
 1 file changed, 2 insertions(+), 31 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 992665376a71..23a836a343e2 100644
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
@@ -3739,6 +3708,8 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
 static void nvme_cmb_enable_regs(NvmeCtrl *n)
 {
+    NVME_CMBLOC_SET_CDPCILS(n->bar.cmbloc, 1);
+    NVME_CMBLOC_SET_CDPMLS(n->bar.cmbloc, 1);
     NVME_CMBLOC_SET_BIR(n->bar.cmbloc, NVME_CMB_BIR);
 
     NVME_CMBSZ_SET_SQS(n->bar.cmbsz, 1);
-- 
2.30.0


