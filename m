Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9B72FB567
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:40:55 +0100 (CET)
Received: from localhost ([::1]:40986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1oRS-0007f0-QS
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:40:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o3B-0002V4-SV; Tue, 19 Jan 2021 05:15:50 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:53981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o39-0004Ok-4e; Tue, 19 Jan 2021 05:15:49 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2C74AF68;
 Tue, 19 Jan 2021 05:15:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 19 Jan 2021 05:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=HDXjmpTWRbIWk
 XhO+Qo+QpguR8QWL9XXqi8ezvY73lI=; b=cmKBIBXEUScWkhxhhaSNRQprzDMYa
 Nu2+GBsnVlzjVaIbrnaNsHu1MecHsFAKsiTu53KijV/bq/JCXwZYV1dSy6e8vqR3
 J3h5lMkDlGBtzfLOCXqX6IZGiLuwWAIepIs0d6LRz4pLFpWnTWCXn24L4gvjtZE3
 A2rDYM0XQIYo4P1quse2f+nCVCmIHZk5YTKNRERaR3hwx+VFt5ET+UPB7LCnistX
 mqnVjTbBu5c/RvDJmG+zqlEmj4sW4HlKg9zid90C+Rygm8F8M31p0xEqit9TZ57n
 zxl/+cq3WOmj5lbNkbwDqMb0rvgKOnjFESV+5A85rhg00+BuP2P3RGrzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=HDXjmpTWRbIWkXhO+Qo+QpguR8QWL9XXqi8ezvY73lI=; b=izTlkd+8
 D3WTGeNki5GcplQVnGZg1DDmP4moo0EI8jwg+vAqi0QhRwWHSQJyCSyPPU2XhIDt
 2U1kG5wMjFVZEhY/nYA4ERLlM4g/dkmL0EEklC2guKcq4UcMdLuqMsplDdWc5JHy
 vQsbFVkiJ0AH8SKn/G/i20TSa+P8UWYuBUp/+cWdgo/OOQv6L2cHKXjIR5+0wlvd
 6ikiWs4j9rC6Z62fBNge0fqr0thY+q1coDWWfqKky2WGKFvSRqfsZ5gjNJH2UKK0
 0GahjPtBraKo5luNvk+7rNDMRRT22oFuZS3+QM8F1c7EuV8saWlYifVb/87X1PES
 ybzhcl2eOX2uvg==
X-ME-Sender: <xms:PLEGYIdg1QOdXKfGLwqr6LWbQBiPY_Mk5gAn5qBxfIrqJn4VhwWXVw>
 <xme:PLEGYKN__awqwwuN_ry6CLrkNhKOzmmsk6wNBtp6J3dWfwAVTv9Ev3al7pT9j41Jv
 _uNG2B2C0FxTqqHbXc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepgeenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:PLEGYJgiQGRrIv9qp1RFobslwcHpWTZTHh5Tu5vmgULuowdpKxYeJg>
 <xmx:PLEGYN-2ZkfTZhM3HHhdEHCMQ-oOY2dxgIVXqjehJ9Gp9KSZAoGyfQ>
 <xmx:PLEGYEv73-JtkRjXR-ccrcRqLnab6zkcFLAhF1pehk80hH3lPosIJg>
 <xmx:PLEGYIj1h6zWjkLf4uBGYB4z7Q5qT1xP5XKUJqJUGJ-vsqIUJ53Oew>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7D99B240062;
 Tue, 19 Jan 2021 05:15:23 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/12] hw/block/nvme: lift cmb restrictions
Date: Tue, 19 Jan 2021 11:15:04 +0100
Message-Id: <20210119101504.231259-13-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119101504.231259-1-its@irrelevant.dk>
References: <20210119101504.231259-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
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
index 2c158cf419b0..0e7d38bd35ae 100644
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
@@ -3748,6 +3717,8 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
 static void nvme_cmb_enable_regs(NvmeCtrl *n)
 {
+    NVME_CMBLOC_SET_CDPCILS(n->bar.cmbloc, 1);
+    NVME_CMBLOC_SET_CDPMLS(n->bar.cmbloc, 1);
     NVME_CMBLOC_SET_BIR(n->bar.cmbloc, NVME_CMB_BIR);
 
     NVME_CMBSZ_SET_SQS(n->bar.cmbsz, 1);
-- 
2.30.0


