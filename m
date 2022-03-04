Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50AE4CCE20
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 07:52:35 +0100 (CET)
Received: from localhost ([::1]:49712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ1nm-000264-7l
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 01:52:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nQ1NC-0005lZ-KC; Fri, 04 Mar 2022 01:25:06 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:39795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nQ1N7-0002S6-V8; Fri, 04 Mar 2022 01:25:06 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4C3A0580632;
 Fri,  4 Mar 2022 01:25:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 04 Mar 2022 01:25:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=K0Hm0O9p+6vIwK
 T0GZMyPmaJzvVfa1rgCCbqmehTVJE=; b=TpiWV1gE/fhwCXBG9gWnbsJzATGDTv
 TlkyGC+VvoquBm1jJL4IoicO9MqFSGHuMafKIpLb51PX1Jio/1i0keHVz2NZrmUn
 Pti+DiwZMP1nGrDuL+/eDzLsDd7c4VrCwKaFADfxZP463A5gDChwT/+Ve1gOzUs7
 4pPfAIEQKheh0Ni515p0XcDpU8qe2HBng33mXmTS+CSAjY66vI+6JLTAPPvt1aU9
 sH373nr4lMCxGHIPDf4GM8uHdfV5dE5ke8x2W6UK1gW8v1uT8YmMZ330q+CvKARn
 PykXUhYIf/DH++tYTMbFNpTCgiqRJmlSnDTbJrbHEBDZcWn8RyegAvIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=K0Hm0O
 9p+6vIwKT0GZMyPmaJzvVfa1rgCCbqmehTVJE=; b=VU3A+y1haPQPTGg+hTWYdY
 YwumhG6MNbQvJFXAqfIZxyvEvebGrA7b51Xew50pNfAWeJosmaqvwp3NTmY79Mmm
 G+ARwqB9NV5mNYn80I60c9QdTA9wvghWa23fF+DWQmy8E/3q6p5XlOuj+oTukXDc
 UxKDFgddGeNRGFyN1etfZOuSH8IWG2Hpd+NsfiM5ibVG7bMTgN1g7V+MhgikmX0l
 tYs+aZ12Ra0pbU7pPmWT05JX80O1T1/KSPmFrAegBLJNgvmRoa3S3hCa463WxFQ3
 uKk1a05YgcmrvAykjjeMJnZILb8R+PQTlkO8q9FiGxqN0gdEpDa4Fg+0Frt+O/Fw
 ==
X-ME-Sender: <xms:vLAhYtoi1oMu4b_lui10EDLj51y4PZwG3k9txtAYmK4p1S2tB8pGdg>
 <xme:vLAhYvrOavoRbsAaxlqkYWhe7pUua7DTJ2IZxlOwhVECnjafOasxQLRT1vkp3cWkj
 qrzjnhFARr5K84_63U>
X-ME-Received: <xmr:vLAhYqMURydTsGukFNznic5alOHOEb57-HCJfbNAiuww0h_wZDZtP_c0QCJg5E2L9IJIxC5ZLp3zZSQVjIsrgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtjedgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefgvdetkeetudefffefkefhjeefueelveekudeiieeffeevfffhgeeujedvteef
 udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:vLAhYo6n9Tp2KHSwl881CvldRD1AGYCmOxl2m_KEHst6GqTX0IbZXA>
 <xmx:vLAhYs6vTaacJGnnrx5L6CL_9xHaSMMmdY7dbbHQSlzxGkr1c-j97g>
 <xmx:vLAhYgiL1dGR9ox-HAtRGz5Oqr8yPj7sLTWfX1Z5jOw4zainLbpzKQ>
 <xmx:vLAhYpzR106NiIPV4O3SoE-VWAiOE9fngRDlu93EAKoZMVGibrLwHw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Mar 2022 01:24:58 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/6] hw/nvme: 64-bit pi support
Date: Fri,  4 Mar 2022 07:24:43 +0100
Message-Id: <20220304062443.352515-7-its@irrelevant.dk>
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
 Naveen Nagar <naveen.n1@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Naveen Nagar <naveen.n1@samsung.com>

This adds support for one possible new protection information format
introduced in TP4068 (and integrated in NVMe 2.0): the 64-bit CRC guard
and 48-bit reference tag. This version does not support storage tags.

Like the CRC16 support already present, this uses a software
implementation of CRC64 (so it is naturally pretty slow). But its good
enough for verification purposes.

This may go nicely hand-in-hand with the support that Keith submitted
for the Linux kernel[1].

  [1]: https://lore.kernel.org/linux-nvme/20220126165214.GA1782352@dhcp-10-100-145-180.wdc.com/T/

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Naveen Nagar <naveen.n1@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 163 +++++++++++++++----
 hw/nvme/dif.c        | 363 +++++++++++++++++++++++++++++++++----------
 hw/nvme/dif.h        | 143 ++++++++++++++++-
 hw/nvme/ns.c         |  35 ++++-
 hw/nvme/nvme.h       |   3 +
 hw/nvme/trace-events |  12 +-
 include/block/nvme.h |  67 ++++++--
 7 files changed, 648 insertions(+), 138 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index f1683960b87e..03760ddeae8c 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2050,9 +2050,12 @@ static void nvme_verify_cb(void *opaque, int ret)
     uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
     uint16_t apptag = le16_to_cpu(rw->apptag);
     uint16_t appmask = le16_to_cpu(rw->appmask);
-    uint32_t reftag = le32_to_cpu(rw->reftag);
+    uint64_t reftag = le32_to_cpu(rw->reftag);
+    uint64_t cdw3 = le32_to_cpu(rw->cdw3);
     uint16_t status;
 
+    reftag |= cdw3 << 32;
+
     trace_pci_nvme_verify_cb(nvme_cid(req), prinfo, apptag, appmask, reftag);
 
     if (ret) {
@@ -2141,7 +2144,8 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
     uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
     uint16_t apptag = le16_to_cpu(rw->apptag);
     uint16_t appmask = le16_to_cpu(rw->appmask);
-    uint32_t reftag = le32_to_cpu(rw->reftag);
+    uint64_t reftag = le32_to_cpu(rw->reftag);
+    uint64_t cdw3 = le32_to_cpu(rw->cdw3);
     struct nvme_compare_ctx *ctx = req->opaque;
     g_autofree uint8_t *buf = NULL;
     BlockBackend *blk = ns->blkconf.blk;
@@ -2149,6 +2153,8 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
     BlockAcctStats *stats = blk_get_stats(blk);
     uint16_t status = NVME_SUCCESS;
 
+    reftag |= cdw3 << 32;
+
     trace_pci_nvme_compare_mdata_cb(nvme_cid(req));
 
     if (ret) {
@@ -2527,7 +2533,8 @@ typedef struct NvmeCopyAIOCB {
     QEMUBH *bh;
     int ret;
 
-    NvmeCopySourceRange *ranges;
+    void *ranges;
+    unsigned int format;
     int nr;
     int idx;
 
@@ -2538,7 +2545,7 @@ typedef struct NvmeCopyAIOCB {
         BlockAcctCookie write;
     } acct;
 
-    uint32_t reftag;
+    uint64_t reftag;
     uint64_t slba;
 
     NvmeZone *zone;
@@ -2592,13 +2599,101 @@ static void nvme_copy_bh(void *opaque)
 
 static void nvme_copy_cb(void *opaque, int ret);
 
+static void nvme_copy_source_range_parse_format0(void *ranges, int idx,
+                                                 uint64_t *slba, uint32_t *nlb,
+                                                 uint16_t *apptag,
+                                                 uint16_t *appmask,
+                                                 uint64_t *reftag)
+{
+    NvmeCopySourceRangeFormat0 *_ranges = ranges;
+
+    if (slba) {
+        *slba = le64_to_cpu(_ranges[idx].slba);
+    }
+
+    if (nlb) {
+        *nlb = le16_to_cpu(_ranges[idx].nlb) + 1;
+    }
+
+    if (apptag) {
+        *apptag = le16_to_cpu(_ranges[idx].apptag);
+    }
+
+    if (appmask) {
+        *appmask = le16_to_cpu(_ranges[idx].appmask);
+    }
+
+    if (reftag) {
+        *reftag = le32_to_cpu(_ranges[idx].reftag);
+    }
+}
+
+static void nvme_copy_source_range_parse_format1(void *ranges, int idx,
+                                                 uint64_t *slba, uint32_t *nlb,
+                                                 uint16_t *apptag,
+                                                 uint16_t *appmask,
+                                                 uint64_t *reftag)
+{
+    NvmeCopySourceRangeFormat1 *_ranges = ranges;
+
+    if (slba) {
+        *slba = le64_to_cpu(_ranges[idx].slba);
+    }
+
+    if (nlb) {
+        *nlb = le16_to_cpu(_ranges[idx].nlb) + 1;
+    }
+
+    if (apptag) {
+        *apptag = le16_to_cpu(_ranges[idx].apptag);
+    }
+
+    if (appmask) {
+        *appmask = le16_to_cpu(_ranges[idx].appmask);
+    }
+
+    if (reftag) {
+        *reftag = 0;
+
+        *reftag |= (uint64_t)_ranges[idx].sr[4] << 40;
+        *reftag |= (uint64_t)_ranges[idx].sr[5] << 32;
+        *reftag |= (uint64_t)_ranges[idx].sr[6] << 24;
+        *reftag |= (uint64_t)_ranges[idx].sr[7] << 16;
+        *reftag |= (uint64_t)_ranges[idx].sr[8] << 8;
+        *reftag |= (uint64_t)_ranges[idx].sr[9];
+    }
+}
+
+static void nvme_copy_source_range_parse(void *ranges, int idx, uint8_t format,
+                                         uint64_t *slba, uint32_t *nlb,
+                                         uint16_t *apptag, uint16_t *appmask,
+                                         uint64_t *reftag)
+{
+    switch (format) {
+    case NVME_COPY_FORMAT_0:
+        nvme_copy_source_range_parse_format0(ranges, idx, slba, nlb, apptag,
+                                             appmask, reftag);
+        break;
+
+    case NVME_COPY_FORMAT_1:
+        nvme_copy_source_range_parse_format1(ranges, idx, slba, nlb, apptag,
+                                             appmask, reftag);
+        break;
+
+    default:
+        abort();
+    }
+}
+
 static void nvme_copy_out_completed_cb(void *opaque, int ret)
 {
     NvmeCopyAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
-    NvmeCopySourceRange *range = &iocb->ranges[iocb->idx];
-    uint32_t nlb = le32_to_cpu(range->nlb) + 1;
+    uint32_t nlb;
+
+    nvme_copy_source_range_parse(iocb->ranges, iocb->idx, iocb->format, NULL,
+                                 &nlb, NULL, NULL, NULL);
 
     if (ret < 0) {
         iocb->ret = ret;
@@ -2622,7 +2717,6 @@ static void nvme_copy_out_cb(void *opaque, int ret)
     NvmeCopyAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
-    NvmeCopySourceRange *range;
     uint32_t nlb;
     size_t mlen;
     uint8_t *mbounce;
@@ -2639,8 +2733,8 @@ static void nvme_copy_out_cb(void *opaque, int ret)
         return;
     }
 
-    range = &iocb->ranges[iocb->idx];
-    nlb = le32_to_cpu(range->nlb) + 1;
+    nvme_copy_source_range_parse(iocb->ranges, iocb->idx, iocb->format, NULL,
+                                 &nlb, NULL, NULL, NULL);
 
     mlen = nvme_m2b(ns, nlb);
     mbounce = iocb->bounce + nvme_l2b(ns, nlb);
@@ -2663,8 +2757,10 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
     NvmeCopyAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
-    NvmeCopySourceRange *range;
     uint32_t nlb;
+    uint64_t slba;
+    uint16_t apptag, appmask;
+    uint64_t reftag;
     size_t len;
     uint16_t status;
 
@@ -2675,8 +2771,8 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
         goto out;
     }
 
-    range = &iocb->ranges[iocb->idx];
-    nlb = le32_to_cpu(range->nlb) + 1;
+    nvme_copy_source_range_parse(iocb->ranges, iocb->idx, iocb->format, &slba,
+                                 &nlb, &apptag, &appmask, &reftag);
     len = nvme_l2b(ns, nlb);
 
     trace_pci_nvme_copy_out(iocb->slba, nlb);
@@ -2687,11 +2783,6 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
         uint16_t prinfor = ((copy->control[0] >> 4) & 0xf);
         uint16_t prinfow = ((copy->control[2] >> 2) & 0xf);
 
-        uint16_t apptag = le16_to_cpu(range->apptag);
-        uint16_t appmask = le16_to_cpu(range->appmask);
-        uint32_t reftag = le32_to_cpu(range->reftag);
-
-        uint64_t slba = le64_to_cpu(range->slba);
         size_t mlen = nvme_m2b(ns, nlb);
         uint8_t *mbounce = iocb->bounce + nvme_l2b(ns, nlb);
 
@@ -2764,7 +2855,6 @@ static void nvme_copy_in_cb(void *opaque, int ret)
     NvmeCopyAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
-    NvmeCopySourceRange *range;
     uint64_t slba;
     uint32_t nlb;
 
@@ -2780,9 +2870,8 @@ static void nvme_copy_in_cb(void *opaque, int ret)
         return;
     }
 
-    range = &iocb->ranges[iocb->idx];
-    slba = le64_to_cpu(range->slba);
-    nlb = le32_to_cpu(range->nlb) + 1;
+    nvme_copy_source_range_parse(iocb->ranges, iocb->idx, iocb->format, &slba,
+                                 &nlb, NULL, NULL, NULL);
 
     qemu_iovec_reset(&iocb->iov);
     qemu_iovec_add(&iocb->iov, iocb->bounce + nvme_l2b(ns, nlb),
@@ -2802,7 +2891,6 @@ static void nvme_copy_cb(void *opaque, int ret)
     NvmeCopyAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeNamespace *ns = req->ns;
-    NvmeCopySourceRange *range;
     uint64_t slba;
     uint32_t nlb;
     size_t len;
@@ -2819,9 +2907,8 @@ static void nvme_copy_cb(void *opaque, int ret)
         goto done;
     }
 
-    range = &iocb->ranges[iocb->idx];
-    slba = le64_to_cpu(range->slba);
-    nlb = le32_to_cpu(range->nlb) + 1;
+    nvme_copy_source_range_parse(iocb->ranges, iocb->idx, iocb->format, &slba,
+                                 &nlb, NULL, NULL, NULL);
     len = nvme_l2b(ns, nlb);
 
     trace_pci_nvme_copy_source_range(slba, nlb);
@@ -2877,6 +2964,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     uint8_t format = copy->control[0] & 0xf;
     uint16_t prinfor = ((copy->control[0] >> 4) & 0xf);
     uint16_t prinfow = ((copy->control[2] >> 2) & 0xf);
+    size_t len = sizeof(NvmeCopySourceRangeFormat0);
 
     uint16_t status;
 
@@ -2902,10 +2990,18 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
-    iocb->ranges = g_new(NvmeCopySourceRange, nr);
+    if (ns->pif && format != 0x1) {
+        status = NVME_INVALID_FORMAT | NVME_DNR;
+        goto invalid;
+    }
 
-    status = nvme_h2c(n, (uint8_t *)iocb->ranges,
-                      sizeof(NvmeCopySourceRange) * nr, req);
+    if (ns->pif) {
+        len = sizeof(NvmeCopySourceRangeFormat1);
+    }
+
+    iocb->format = format;
+    iocb->ranges = g_malloc_n(nr, len);
+    status = nvme_h2c(n, (uint8_t *)iocb->ranges, len * nr, req);
     if (status) {
         goto invalid;
     }
@@ -2931,6 +3027,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     iocb->nr = nr;
     iocb->idx = 0;
     iocb->reftag = le32_to_cpu(copy->reftag);
+    iocb->reftag |= (uint64_t)le32_to_cpu(copy->cdw3) << 32;
     iocb->bounce = g_malloc_n(le16_to_cpu(ns->id_ns.mssrl),
                               ns->lbasz + ns->lbaf.ms);
 
@@ -4717,7 +4814,8 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
     }
 
     if (c->csi == NVME_CSI_NVM) {
-        return nvme_rpt_empty_id_struct(n, req);
+        return nvme_c2h(n, (uint8_t *)&ns->id_ns_nvm, sizeof(NvmeIdNsNvm),
+                        req);
     } else if (c->csi == NVME_CSI_ZONED && ns->csi == NVME_CSI_ZONED) {
         return nvme_c2h(n, (uint8_t *)ns->id_ns_zoned, sizeof(NvmeIdNsZoned),
                         req);
@@ -5571,6 +5669,9 @@ static void nvme_format_bh(void *opaque)
     NvmeFormatAIOCB *iocb = opaque;
     NvmeRequest *req = iocb->req;
     NvmeCtrl *n = nvme_ctrl(req);
+    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
+    uint8_t lbaf = dw10 & 0xf;
+    uint8_t pi = (dw10 >> 5) & 0x7;
     uint16_t status;
     int i;
 
@@ -5592,7 +5693,7 @@ static void nvme_format_bh(void *opaque)
         goto done;
     }
 
-    status = nvme_format_check(iocb->ns, iocb->lbaf, iocb->pi);
+    status = nvme_format_check(iocb->ns, lbaf, pi);
     if (status) {
         req->status = status;
         goto done;
@@ -6671,7 +6772,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
      */
     id->vwc = NVME_VWC_NSID_BROADCAST_SUPPORT | NVME_VWC_PRESENT;
 
-    id->ocfs = cpu_to_le16(NVME_OCFS_COPY_FORMAT_0);
+    id->ocfs = cpu_to_le16(NVME_OCFS_COPY_FORMAT_0 | NVME_OCFS_COPY_FORMAT_1);
     id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
                            NVME_CTRL_SGLS_BITBUCKET);
 
diff --git a/hw/nvme/dif.c b/hw/nvme/dif.c
index 891385f33f20..62d885f83ea4 100644
--- a/hw/nvme/dif.c
+++ b/hw/nvme/dif.c
@@ -17,10 +17,12 @@
 #include "trace.h"
 
 uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint8_t prinfo, uint64_t slba,
-                           uint32_t reftag)
+                           uint64_t reftag)
 {
+    uint64_t mask = ns->pif ? 0xffffffffffff : 0xffffffff;
+
     if ((NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) == NVME_ID_NS_DPS_TYPE_1) &&
-        (prinfo & NVME_PRINFO_PRCHK_REF) && (slba & 0xffffffff) != reftag) {
+        (prinfo & NVME_PRINFO_PRCHK_REF) && (slba & mask) != reftag) {
         return NVME_INVALID_PROT_INFO | NVME_DNR;
     }
 
@@ -28,114 +30,270 @@ uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint8_t prinfo, uint64_t slba,
 }
 
 /* from Linux kernel (crypto/crct10dif_common.c) */
-static uint16_t crc_t10dif(uint16_t crc, const unsigned char *buffer,
-                           size_t len)
+static uint16_t crc16_t10dif(uint16_t crc, const unsigned char *buffer,
+                             size_t len)
 {
     unsigned int i;
 
     for (i = 0; i < len; i++) {
-        crc = (crc << 8) ^ t10_dif_crc_table[((crc >> 8) ^ buffer[i]) & 0xff];
+        crc = (crc << 8) ^ crc16_t10dif_table[((crc >> 8) ^ buffer[i]) & 0xff];
     }
 
     return crc;
 }
 
+/* from Linux kernel (lib/crc64.c) */
+static uint64_t crc64_nvme(uint64_t crc, const unsigned char *buffer,
+                           size_t len)
+{
+    size_t i;
+
+    for (i = 0; i < len; i++) {
+        crc = (crc >> 8) ^ crc64_nvme_table[(crc & 0xff) ^ buffer[i]];
+    }
+
+    return crc ^ (uint64_t)~0;
+}
+
+static void nvme_dif_pract_generate_dif_crc16(NvmeNamespace *ns, uint8_t *buf,
+                                              size_t len, uint8_t *mbuf,
+                                              size_t mlen, uint16_t apptag,
+                                              uint64_t *reftag)
+{
+    uint8_t *end = buf + len;
+    int16_t pil = 0;
+
+    if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
+        pil = ns->lbaf.ms - nvme_pi_tuple_size(ns);
+    }
+
+    trace_pci_nvme_dif_pract_generate_dif_crc16(len, ns->lbasz,
+                                                ns->lbasz + pil, apptag,
+                                                *reftag);
+
+    for (; buf < end; buf += ns->lbasz, mbuf += ns->lbaf.ms) {
+        NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf + pil);
+        uint16_t crc = crc16_t10dif(0x0, buf, ns->lbasz);
+
+        if (pil) {
+            crc = crc16_t10dif(crc, mbuf, pil);
+        }
+
+        dif->g16.guard = cpu_to_be16(crc);
+        dif->g16.apptag = cpu_to_be16(apptag);
+        dif->g16.reftag = cpu_to_be32(*reftag);
+
+        if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) != NVME_ID_NS_DPS_TYPE_3) {
+            (*reftag)++;
+        }
+    }
+}
+
+static void nvme_dif_pract_generate_dif_crc64(NvmeNamespace *ns, uint8_t *buf,
+                                              size_t len, uint8_t *mbuf,
+                                              size_t mlen, uint16_t apptag,
+                                              uint64_t *reftag)
+{
+    uint8_t *end = buf + len;
+    int16_t pil = 0;
+
+    if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
+        pil = ns->lbaf.ms - 16;
+    }
+
+    trace_pci_nvme_dif_pract_generate_dif_crc64(len, ns->lbasz,
+                                                ns->lbasz + pil, apptag,
+                                                *reftag);
+
+    for (; buf < end; buf += ns->lbasz, mbuf += ns->lbaf.ms) {
+        NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf + pil);
+        uint64_t crc = crc64_nvme(~0ULL, buf, ns->lbasz);
+
+        if (pil) {
+            crc = crc64_nvme(crc, mbuf, pil);
+        }
+
+        dif->g64.guard = cpu_to_be64(crc);
+        dif->g64.apptag = cpu_to_be16(apptag);
+
+        dif->g64.sr[0] = *reftag >> 40;
+        dif->g64.sr[1] = *reftag >> 32;
+        dif->g64.sr[2] = *reftag >> 24;
+        dif->g64.sr[3] = *reftag >> 16;
+        dif->g64.sr[4] = *reftag >> 8;
+        dif->g64.sr[5] = *reftag;
+
+        if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) != NVME_ID_NS_DPS_TYPE_3) {
+            (*reftag)++;
+        }
+    }
+}
+
 void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
                                  uint8_t *mbuf, size_t mlen, uint16_t apptag,
-                                 uint32_t *reftag)
+                                 uint64_t *reftag)
 {
-    uint8_t *end = buf + len;
-    int16_t pil = 0;
+    switch (ns->pif) {
+    case NVME_PI_GUARD_16:
+        return nvme_dif_pract_generate_dif_crc16(ns, buf, len, mbuf, mlen,
+                                                 apptag, reftag);
+    case NVME_PI_GUARD_64:
+        return nvme_dif_pract_generate_dif_crc64(ns, buf, len, mbuf, mlen,
+                                                 apptag, reftag);
+    }
+
+    abort();
+}
+
+static uint16_t nvme_dif_prchk_crc16(NvmeNamespace *ns, NvmeDifTuple *dif,
+                                     uint8_t *buf, uint8_t *mbuf, size_t pil,
+                                     uint8_t prinfo, uint16_t apptag,
+                                     uint16_t appmask, uint64_t reftag)
+{
+    switch (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+    case NVME_ID_NS_DPS_TYPE_3:
+        if (be32_to_cpu(dif->g16.reftag) != 0xffffffff) {
+            break;
+        }
+
+        /* fallthrough */
+    case NVME_ID_NS_DPS_TYPE_1:
+    case NVME_ID_NS_DPS_TYPE_2:
+        if (be16_to_cpu(dif->g16.apptag) != 0xffff) {
+            break;
+        }
+
+        trace_pci_nvme_dif_prchk_disabled_crc16(be16_to_cpu(dif->g16.apptag),
+                                                be32_to_cpu(dif->g16.reftag));
+
+        return NVME_SUCCESS;
+    }
+
+    if (prinfo & NVME_PRINFO_PRCHK_GUARD) {
+        uint16_t crc = crc16_t10dif(0x0, buf, ns->lbasz);
 
-    if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
-        pil = ns->lbaf.ms - nvme_pi_tuple_size(ns);
+        if (pil) {
+            crc = crc16_t10dif(crc, mbuf, pil);
+        }
+
+        trace_pci_nvme_dif_prchk_guard_crc16(be16_to_cpu(dif->g16.guard), crc);
+
+        if (be16_to_cpu(dif->g16.guard) != crc) {
+            return NVME_E2E_GUARD_ERROR;
+        }
     }
 
-    trace_pci_nvme_dif_pract_generate_dif(len, ns->lbasz, ns->lbasz + pil,
-                                          apptag, *reftag);
+    if (prinfo & NVME_PRINFO_PRCHK_APP) {
+        trace_pci_nvme_dif_prchk_apptag(be16_to_cpu(dif->g16.apptag), apptag,
+                                        appmask);
 
-    for (; buf < end; buf += ns->lbasz, mbuf += ns->lbaf.ms) {
-        NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf + pil);
-        uint16_t crc = crc_t10dif(0x0, buf, ns->lbasz);
+        if ((be16_to_cpu(dif->g16.apptag) & appmask) != (apptag & appmask)) {
+            return NVME_E2E_APP_ERROR;
+        }
+    }
+
+    if (prinfo & NVME_PRINFO_PRCHK_REF) {
+        trace_pci_nvme_dif_prchk_reftag_crc16(be32_to_cpu(dif->g16.reftag),
+                                              reftag);
+
+        if (be32_to_cpu(dif->g16.reftag) != reftag) {
+            return NVME_E2E_REF_ERROR;
+        }
+    }
+
+    return NVME_SUCCESS;
+}
+
+static uint16_t nvme_dif_prchk_crc64(NvmeNamespace *ns, NvmeDifTuple *dif,
+                                     uint8_t *buf, uint8_t *mbuf, size_t pil,
+                                     uint8_t prinfo, uint16_t apptag,
+                                     uint16_t appmask, uint64_t reftag)
+{
+    uint64_t r = 0;
+
+    r |= (uint64_t)dif->g64.sr[0] << 40;
+    r |= (uint64_t)dif->g64.sr[1] << 32;
+    r |= (uint64_t)dif->g64.sr[2] << 24;
+    r |= (uint64_t)dif->g64.sr[3] << 16;
+    r |= (uint64_t)dif->g64.sr[4] << 8;
+    r |= (uint64_t)dif->g64.sr[5];
+
+    switch (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+    case NVME_ID_NS_DPS_TYPE_3:
+        if (r != 0xffffffffffff) {
+            break;
+        }
+
+        /* fallthrough */
+    case NVME_ID_NS_DPS_TYPE_1:
+    case NVME_ID_NS_DPS_TYPE_2:
+        if (be16_to_cpu(dif->g64.apptag) != 0xffff) {
+            break;
+        }
+
+        trace_pci_nvme_dif_prchk_disabled_crc64(be16_to_cpu(dif->g16.apptag),
+                                                r);
+
+        return NVME_SUCCESS;
+    }
+
+    if (prinfo & NVME_PRINFO_PRCHK_GUARD) {
+        uint64_t crc = crc64_nvme(~0ULL, buf, ns->lbasz);
 
         if (pil) {
-            crc = crc_t10dif(crc, mbuf, pil);
+            crc = crc64_nvme(crc, mbuf, pil);
+        }
+
+        trace_pci_nvme_dif_prchk_guard_crc64(be64_to_cpu(dif->g64.guard), crc);
+
+        if (be64_to_cpu(dif->g64.guard) != crc) {
+            return NVME_E2E_GUARD_ERROR;
+        }
+    }
+
+    if (prinfo & NVME_PRINFO_PRCHK_APP) {
+        trace_pci_nvme_dif_prchk_apptag(be16_to_cpu(dif->g64.apptag), apptag,
+                                        appmask);
+
+        if ((be16_to_cpu(dif->g64.apptag) & appmask) != (apptag & appmask)) {
+            return NVME_E2E_APP_ERROR;
         }
+    }
 
-        dif->guard = cpu_to_be16(crc);
-        dif->apptag = cpu_to_be16(apptag);
-        dif->reftag = cpu_to_be32(*reftag);
+    if (prinfo & NVME_PRINFO_PRCHK_REF) {
+        trace_pci_nvme_dif_prchk_reftag_crc64(r, reftag);
 
-        if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) != NVME_ID_NS_DPS_TYPE_3) {
-            (*reftag)++;
+        if (r != reftag) {
+            return NVME_E2E_REF_ERROR;
         }
     }
+
+    return NVME_SUCCESS;
 }
 
 static uint16_t nvme_dif_prchk(NvmeNamespace *ns, NvmeDifTuple *dif,
                                uint8_t *buf, uint8_t *mbuf, size_t pil,
                                uint8_t prinfo, uint16_t apptag,
-                               uint16_t appmask, uint32_t reftag)
+                               uint16_t appmask, uint64_t reftag)
 {
-    switch (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
-    case NVME_ID_NS_DPS_TYPE_3:
-        if (be32_to_cpu(dif->reftag) != 0xffffffff) {
-            break;
-        }
-
-        /* fallthrough */
-    case NVME_ID_NS_DPS_TYPE_1:
-    case NVME_ID_NS_DPS_TYPE_2:
-        if (be16_to_cpu(dif->apptag) != 0xffff) {
-            break;
-        }
-
-        trace_pci_nvme_dif_prchk_disabled(be16_to_cpu(dif->apptag),
-                                          be32_to_cpu(dif->reftag));
-
-        return NVME_SUCCESS;
-    }
-
-    if (prinfo & NVME_PRINFO_PRCHK_GUARD) {
-        uint16_t crc = crc_t10dif(0x0, buf, ns->lbasz);
-
-        if (pil) {
-            crc = crc_t10dif(crc, mbuf, pil);
-        }
-
-        trace_pci_nvme_dif_prchk_guard(be16_to_cpu(dif->guard), crc);
-
-        if (be16_to_cpu(dif->guard) != crc) {
-            return NVME_E2E_GUARD_ERROR;
-        }
-    }
-
-    if (prinfo & NVME_PRINFO_PRCHK_APP) {
-        trace_pci_nvme_dif_prchk_apptag(be16_to_cpu(dif->apptag), apptag,
-                                        appmask);
-
-        if ((be16_to_cpu(dif->apptag) & appmask) != (apptag & appmask)) {
-            return NVME_E2E_APP_ERROR;
-        }
-    }
-
-    if (prinfo & NVME_PRINFO_PRCHK_REF) {
-        trace_pci_nvme_dif_prchk_reftag(be32_to_cpu(dif->reftag), reftag);
-
-        if (be32_to_cpu(dif->reftag) != reftag) {
-            return NVME_E2E_REF_ERROR;
-        }
+    switch (ns->pif) {
+    case NVME_PI_GUARD_16:
+        return nvme_dif_prchk_crc16(ns, dif, buf, mbuf, pil, prinfo, apptag,
+                                    appmask, reftag);
+    case NVME_PI_GUARD_64:
+        return nvme_dif_prchk_crc64(ns, dif, buf, mbuf, pil, prinfo, apptag,
+                                    appmask, reftag);
     }
 
-    return NVME_SUCCESS;
+    abort();
 }
 
 uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
                         uint8_t *mbuf, size_t mlen, uint8_t prinfo,
                         uint64_t slba, uint16_t apptag,
-                        uint16_t appmask, uint32_t *reftag)
+                        uint16_t appmask, uint64_t *reftag)
 {
-    uint8_t *end = buf + len;
+    uint8_t *bufp, *end = buf + len;
     int16_t pil = 0;
     uint16_t status;
 
@@ -150,13 +308,29 @@ uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
 
     trace_pci_nvme_dif_check(prinfo, ns->lbasz + pil);
 
-    for (; buf < end; buf += ns->lbasz, mbuf += ns->lbaf.ms) {
+    for (bufp = buf; bufp < end; bufp += ns->lbasz, mbuf += ns->lbaf.ms) {
         NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf + pil);
-
-        status = nvme_dif_prchk(ns, dif, buf, mbuf, pil, prinfo, apptag,
+        status = nvme_dif_prchk(ns, dif, bufp, mbuf, pil, prinfo, apptag,
                                 appmask, *reftag);
         if (status) {
-            return status;
+            /*
+             * The first block of a 'raw' image is always allocated, so we
+             * cannot reliably know if the block is all zeroes or not. For
+             * CRC16 this works fine because the T10 CRC16 is 0x0 for all
+             * zeroes, but the Rocksoft CRC64 is not. Thus, if a guard error is
+             * detected for the first block, check if it is zeroed and manually
+             * set the protection information to all ones to disable protection
+             * information checking.
+             */
+            if (status == NVME_E2E_GUARD_ERROR && slba == 0x0 && bufp == buf) {
+                g_autofree uint8_t *zeroes = g_malloc0(ns->lbasz);
+
+                if (memcmp(bufp, zeroes, ns->lbasz) == 0) {
+                    memset(mbuf + pil, 0xff, nvme_pi_tuple_size(ns));
+                }
+            } else {
+                return status;
+            }
         }
 
         if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) != NVME_ID_NS_DPS_TYPE_3) {
@@ -252,9 +426,12 @@ static void nvme_dif_rw_check_cb(void *opaque, int ret)
     uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
     uint16_t apptag = le16_to_cpu(rw->apptag);
     uint16_t appmask = le16_to_cpu(rw->appmask);
-    uint32_t reftag = le32_to_cpu(rw->reftag);
+    uint64_t reftag = le32_to_cpu(rw->reftag);
+    uint64_t cdw3 = le32_to_cpu(rw->cdw3);
     uint16_t status;
 
+    reftag |= cdw3 << 32;
+
     trace_pci_nvme_dif_rw_check_cb(nvme_cid(req), prinfo, apptag, appmask,
                                    reftag);
 
@@ -368,11 +545,14 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
     uint8_t prinfo = NVME_RW_PRINFO(le16_to_cpu(rw->control));
     uint16_t apptag = le16_to_cpu(rw->apptag);
     uint16_t appmask = le16_to_cpu(rw->appmask);
-    uint32_t reftag = le32_to_cpu(rw->reftag);
+    uint64_t reftag = le32_to_cpu(rw->reftag);
+    uint64_t cdw3 = le32_to_cpu(rw->cdw3);
     bool pract = !!(prinfo & NVME_PRINFO_PRACT);
     NvmeBounceContext *ctx;
     uint16_t status;
 
+    reftag |= cdw3 << 32;
+
     trace_pci_nvme_dif_rw(pract, prinfo);
 
     ctx = g_new0(NvmeBounceContext, 1);
@@ -412,8 +592,29 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
             for (; mbuf < end; mbuf += ns->lbaf.ms) {
                 NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf + pil);
 
-                dif->apptag = cpu_to_be16(apptag);
-                dif->reftag = cpu_to_be32(reftag);
+                switch (ns->pif) {
+                case NVME_PI_GUARD_16:
+                    dif->g16.apptag = cpu_to_be16(apptag);
+                    dif->g16.reftag = cpu_to_be32(reftag);
+
+                    break;
+
+                case NVME_PI_GUARD_64:
+                    dif->g64.guard = cpu_to_be64(0x6482d367eb22b64e);
+                    dif->g64.apptag = cpu_to_be16(apptag);
+
+                    dif->g64.sr[0] = reftag >> 40;
+                    dif->g64.sr[1] = reftag >> 32;
+                    dif->g64.sr[2] = reftag >> 24;
+                    dif->g64.sr[3] = reftag >> 16;
+                    dif->g64.sr[4] = reftag >> 8;
+                    dif->g64.sr[5] = reftag;
+
+                    break;
+
+                default:
+                    abort();
+                }
 
                 switch (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
                 case NVME_ID_NS_DPS_TYPE_1:
diff --git a/hw/nvme/dif.h b/hw/nvme/dif.h
index ab6dbb09463e..f12e312250bb 100644
--- a/hw/nvme/dif.h
+++ b/hw/nvme/dif.h
@@ -2,7 +2,7 @@
 #define HW_NVME_DIF_H
 
 /* from Linux kernel (crypto/crct10dif_common.c) */
-static const uint16_t t10_dif_crc_table[256] = {
+static const uint16_t crc16_t10dif_table[256] = {
     0x0000, 0x8BB7, 0x9CD9, 0x176E, 0xB205, 0x39B2, 0x2EDC, 0xA56B,
     0xEFBD, 0x640A, 0x7364, 0xF8D3, 0x5DB8, 0xD60F, 0xC161, 0x4AD6,
     0x54CD, 0xDF7A, 0xC814, 0x43A3, 0xE6C8, 0x6D7F, 0x7A11, 0xF1A6,
@@ -37,22 +37,155 @@ static const uint16_t t10_dif_crc_table[256] = {
     0xF0D8, 0x7B6F, 0x6C01, 0xE7B6, 0x42DD, 0xC96A, 0xDE04, 0x55B3
 };
 
+#define CRC64_NVME_POLY 0x9A6C9329AC4BC9B5ULL
+
+static const uint64_t crc64_nvme_table[] = {
+    0x0000000000000000ULL, 0x7F6EF0C830358979ULL,
+    0xFEDDE190606B12F2ULL, 0x81B31158505E9B8BULL,
+    0xC962E5739841B68FULL, 0xB60C15BBA8743FF6ULL,
+    0x37BF04E3F82AA47DULL, 0x48D1F42BC81F2D04ULL,
+    0xA61CECB46814FE75ULL, 0xD9721C7C5821770CULL,
+    0x58C10D24087FEC87ULL, 0x27AFFDEC384A65FEULL,
+    0x6F7E09C7F05548FAULL, 0x1010F90FC060C183ULL,
+    0x91A3E857903E5A08ULL, 0xEECD189FA00BD371ULL,
+    0x78E0FF3B88BE6F81ULL, 0x078E0FF3B88BE6F8ULL,
+    0x863D1EABE8D57D73ULL, 0xF953EE63D8E0F40AULL,
+    0xB1821A4810FFD90EULL, 0xCEECEA8020CA5077ULL,
+    0x4F5FFBD87094CBFCULL, 0x30310B1040A14285ULL,
+    0xDEFC138FE0AA91F4ULL, 0xA192E347D09F188DULL,
+    0x2021F21F80C18306ULL, 0x5F4F02D7B0F40A7FULL,
+    0x179EF6FC78EB277BULL, 0x68F0063448DEAE02ULL,
+    0xE943176C18803589ULL, 0x962DE7A428B5BCF0ULL,
+    0xF1C1FE77117CDF02ULL, 0x8EAF0EBF2149567BULL,
+    0x0F1C1FE77117CDF0ULL, 0x7072EF2F41224489ULL,
+    0x38A31B04893D698DULL, 0x47CDEBCCB908E0F4ULL,
+    0xC67EFA94E9567B7FULL, 0xB9100A5CD963F206ULL,
+    0x57DD12C379682177ULL, 0x28B3E20B495DA80EULL,
+    0xA900F35319033385ULL, 0xD66E039B2936BAFCULL,
+    0x9EBFF7B0E12997F8ULL, 0xE1D10778D11C1E81ULL,
+    0x606216208142850AULL, 0x1F0CE6E8B1770C73ULL,
+    0x8921014C99C2B083ULL, 0xF64FF184A9F739FAULL,
+    0x77FCE0DCF9A9A271ULL, 0x08921014C99C2B08ULL,
+    0x4043E43F0183060CULL, 0x3F2D14F731B68F75ULL,
+    0xBE9E05AF61E814FEULL, 0xC1F0F56751DD9D87ULL,
+    0x2F3DEDF8F1D64EF6ULL, 0x50531D30C1E3C78FULL,
+    0xD1E00C6891BD5C04ULL, 0xAE8EFCA0A188D57DULL,
+    0xE65F088B6997F879ULL, 0x9931F84359A27100ULL,
+    0x1882E91B09FCEA8BULL, 0x67EC19D339C963F2ULL,
+    0xD75ADABD7A6E2D6FULL, 0xA8342A754A5BA416ULL,
+    0x29873B2D1A053F9DULL, 0x56E9CBE52A30B6E4ULL,
+    0x1E383FCEE22F9BE0ULL, 0x6156CF06D21A1299ULL,
+    0xE0E5DE5E82448912ULL, 0x9F8B2E96B271006BULL,
+    0x71463609127AD31AULL, 0x0E28C6C1224F5A63ULL,
+    0x8F9BD7997211C1E8ULL, 0xF0F5275142244891ULL,
+    0xB824D37A8A3B6595ULL, 0xC74A23B2BA0EECECULL,
+    0x46F932EAEA507767ULL, 0x3997C222DA65FE1EULL,
+    0xAFBA2586F2D042EEULL, 0xD0D4D54EC2E5CB97ULL,
+    0x5167C41692BB501CULL, 0x2E0934DEA28ED965ULL,
+    0x66D8C0F56A91F461ULL, 0x19B6303D5AA47D18ULL,
+    0x980521650AFAE693ULL, 0xE76BD1AD3ACF6FEAULL,
+    0x09A6C9329AC4BC9BULL, 0x76C839FAAAF135E2ULL,
+    0xF77B28A2FAAFAE69ULL, 0x8815D86ACA9A2710ULL,
+    0xC0C42C4102850A14ULL, 0xBFAADC8932B0836DULL,
+    0x3E19CDD162EE18E6ULL, 0x41773D1952DB919FULL,
+    0x269B24CA6B12F26DULL, 0x59F5D4025B277B14ULL,
+    0xD846C55A0B79E09FULL, 0xA72835923B4C69E6ULL,
+    0xEFF9C1B9F35344E2ULL, 0x90973171C366CD9BULL,
+    0x1124202993385610ULL, 0x6E4AD0E1A30DDF69ULL,
+    0x8087C87E03060C18ULL, 0xFFE938B633338561ULL,
+    0x7E5A29EE636D1EEAULL, 0x0134D92653589793ULL,
+    0x49E52D0D9B47BA97ULL, 0x368BDDC5AB7233EEULL,
+    0xB738CC9DFB2CA865ULL, 0xC8563C55CB19211CULL,
+    0x5E7BDBF1E3AC9DECULL, 0x21152B39D3991495ULL,
+    0xA0A63A6183C78F1EULL, 0xDFC8CAA9B3F20667ULL,
+    0x97193E827BED2B63ULL, 0xE877CE4A4BD8A21AULL,
+    0x69C4DF121B863991ULL, 0x16AA2FDA2BB3B0E8ULL,
+    0xF86737458BB86399ULL, 0x8709C78DBB8DEAE0ULL,
+    0x06BAD6D5EBD3716BULL, 0x79D4261DDBE6F812ULL,
+    0x3105D23613F9D516ULL, 0x4E6B22FE23CC5C6FULL,
+    0xCFD833A67392C7E4ULL, 0xB0B6C36E43A74E9DULL,
+    0x9A6C9329AC4BC9B5ULL, 0xE50263E19C7E40CCULL,
+    0x64B172B9CC20DB47ULL, 0x1BDF8271FC15523EULL,
+    0x530E765A340A7F3AULL, 0x2C608692043FF643ULL,
+    0xADD397CA54616DC8ULL, 0xD2BD67026454E4B1ULL,
+    0x3C707F9DC45F37C0ULL, 0x431E8F55F46ABEB9ULL,
+    0xC2AD9E0DA4342532ULL, 0xBDC36EC59401AC4BULL,
+    0xF5129AEE5C1E814FULL, 0x8A7C6A266C2B0836ULL,
+    0x0BCF7B7E3C7593BDULL, 0x74A18BB60C401AC4ULL,
+    0xE28C6C1224F5A634ULL, 0x9DE29CDA14C02F4DULL,
+    0x1C518D82449EB4C6ULL, 0x633F7D4A74AB3DBFULL,
+    0x2BEE8961BCB410BBULL, 0x548079A98C8199C2ULL,
+    0xD53368F1DCDF0249ULL, 0xAA5D9839ECEA8B30ULL,
+    0x449080A64CE15841ULL, 0x3BFE706E7CD4D138ULL,
+    0xBA4D61362C8A4AB3ULL, 0xC52391FE1CBFC3CAULL,
+    0x8DF265D5D4A0EECEULL, 0xF29C951DE49567B7ULL,
+    0x732F8445B4CBFC3CULL, 0x0C41748D84FE7545ULL,
+    0x6BAD6D5EBD3716B7ULL, 0x14C39D968D029FCEULL,
+    0x95708CCEDD5C0445ULL, 0xEA1E7C06ED698D3CULL,
+    0xA2CF882D2576A038ULL, 0xDDA178E515432941ULL,
+    0x5C1269BD451DB2CAULL, 0x237C997575283BB3ULL,
+    0xCDB181EAD523E8C2ULL, 0xB2DF7122E51661BBULL,
+    0x336C607AB548FA30ULL, 0x4C0290B2857D7349ULL,
+    0x04D364994D625E4DULL, 0x7BBD94517D57D734ULL,
+    0xFA0E85092D094CBFULL, 0x856075C11D3CC5C6ULL,
+    0x134D926535897936ULL, 0x6C2362AD05BCF04FULL,
+    0xED9073F555E26BC4ULL, 0x92FE833D65D7E2BDULL,
+    0xDA2F7716ADC8CFB9ULL, 0xA54187DE9DFD46C0ULL,
+    0x24F29686CDA3DD4BULL, 0x5B9C664EFD965432ULL,
+    0xB5517ED15D9D8743ULL, 0xCA3F8E196DA80E3AULL,
+    0x4B8C9F413DF695B1ULL, 0x34E26F890DC31CC8ULL,
+    0x7C339BA2C5DC31CCULL, 0x035D6B6AF5E9B8B5ULL,
+    0x82EE7A32A5B7233EULL, 0xFD808AFA9582AA47ULL,
+    0x4D364994D625E4DAULL, 0x3258B95CE6106DA3ULL,
+    0xB3EBA804B64EF628ULL, 0xCC8558CC867B7F51ULL,
+    0x8454ACE74E645255ULL, 0xFB3A5C2F7E51DB2CULL,
+    0x7A894D772E0F40A7ULL, 0x05E7BDBF1E3AC9DEULL,
+    0xEB2AA520BE311AAFULL, 0x944455E88E0493D6ULL,
+    0x15F744B0DE5A085DULL, 0x6A99B478EE6F8124ULL,
+    0x224840532670AC20ULL, 0x5D26B09B16452559ULL,
+    0xDC95A1C3461BBED2ULL, 0xA3FB510B762E37ABULL,
+    0x35D6B6AF5E9B8B5BULL, 0x4AB846676EAE0222ULL,
+    0xCB0B573F3EF099A9ULL, 0xB465A7F70EC510D0ULL,
+    0xFCB453DCC6DA3DD4ULL, 0x83DAA314F6EFB4ADULL,
+    0x0269B24CA6B12F26ULL, 0x7D0742849684A65FULL,
+    0x93CA5A1B368F752EULL, 0xECA4AAD306BAFC57ULL,
+    0x6D17BB8B56E467DCULL, 0x12794B4366D1EEA5ULL,
+    0x5AA8BF68AECEC3A1ULL, 0x25C64FA09EFB4AD8ULL,
+    0xA4755EF8CEA5D153ULL, 0xDB1BAE30FE90582AULL,
+    0xBCF7B7E3C7593BD8ULL, 0xC399472BF76CB2A1ULL,
+    0x422A5673A732292AULL, 0x3D44A6BB9707A053ULL,
+    0x759552905F188D57ULL, 0x0AFBA2586F2D042EULL,
+    0x8B48B3003F739FA5ULL, 0xF42643C80F4616DCULL,
+    0x1AEB5B57AF4DC5ADULL, 0x6585AB9F9F784CD4ULL,
+    0xE436BAC7CF26D75FULL, 0x9B584A0FFF135E26ULL,
+    0xD389BE24370C7322ULL, 0xACE74EEC0739FA5BULL,
+    0x2D545FB4576761D0ULL, 0x523AAF7C6752E8A9ULL,
+    0xC41748D84FE75459ULL, 0xBB79B8107FD2DD20ULL,
+    0x3ACAA9482F8C46ABULL, 0x45A459801FB9CFD2ULL,
+    0x0D75ADABD7A6E2D6ULL, 0x721B5D63E7936BAFULL,
+    0xF3A84C3BB7CDF024ULL, 0x8CC6BCF387F8795DULL,
+    0x620BA46C27F3AA2CULL, 0x1D6554A417C62355ULL,
+    0x9CD645FC4798B8DEULL, 0xE3B8B53477AD31A7ULL,
+    0xAB69411FBFB21CA3ULL, 0xD407B1D78F8795DAULL,
+    0x55B4A08FDFD90E51ULL, 0x2ADA5047EFEC8728ULL,
+};
+
 static inline size_t nvme_pi_tuple_size(NvmeNamespace *ns)
 {
-    return sizeof(NvmeDifTuple);
+    return ns->pif ? 16 : 8;
 }
 
 uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint8_t prinfo, uint64_t slba,
-                           uint32_t reftag);
+                           uint64_t reftag);
 uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
                                uint64_t slba);
 void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
                                  uint8_t *mbuf, size_t mlen, uint16_t apptag,
-                                 uint32_t *reftag);
+                                 uint64_t *reftag);
 uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
                         uint8_t *mbuf, size_t mlen, uint8_t prinfo,
                         uint64_t slba, uint16_t apptag,
-                        uint16_t appmask, uint32_t *reftag);
+                        uint16_t appmask, uint64_t *reftag);
 uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req);
 
 #endif /* HW_NVME_DIF_H */
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 8dfb55130beb..8a3613d9ab0e 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -58,6 +58,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 {
     static uint64_t ns_count;
     NvmeIdNs *id_ns = &ns->id_ns;
+    NvmeIdNsNvm *id_ns_nvm = &ns->id_ns_nvm;
     uint8_t ds;
     uint16_t ms;
     int i;
@@ -101,6 +102,8 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
         id_ns->dps |= NVME_ID_NS_DPS_FIRST_EIGHT;
     }
 
+    ns->pif = ns->params.pif;
+
     static const NvmeLBAF lbaf[16] = {
         [0] = { .ds =  9           },
         [1] = { .ds =  9, .ms =  8 },
@@ -133,7 +136,9 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 
     id_ns->flbas |= i;
 
+
 lbaf_found:
+    id_ns_nvm->elbaf[i] = (ns->pif & 0x3) << 7;
     id_ns->nlbaf = ns->nlbaf - 1;
     nvme_ns_init_format(ns);
 
@@ -373,15 +378,36 @@ static void nvme_zoned_ns_shutdown(NvmeNamespace *ns)
 
 static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
 {
+    unsigned int pi_size;
+
     if (!ns->blkconf.blk) {
         error_setg(errp, "block backend not configured");
         return -1;
     }
 
-    if (ns->params.pi && ns->params.ms < 8) {
-        error_setg(errp, "at least 8 bytes of metadata required to enable "
-                   "protection information");
-        return -1;
+    if (ns->params.pi) {
+        if (ns->params.pi > NVME_ID_NS_DPS_TYPE_3) {
+            error_setg(errp, "invalid 'pi' value");
+            return -1;
+        }
+
+        switch (ns->params.pif) {
+        case NVME_PI_GUARD_16:
+            pi_size = 8;
+            break;
+        case NVME_PI_GUARD_64:
+            pi_size = 16;
+            break;
+        default:
+            error_setg(errp, "invalid 'pif'");
+            return -1;
+        }
+
+        if (ns->params.ms < pi_size) {
+            error_setg(errp, "at least %u bytes of metadata required to "
+                       "enable protection information", pi_size);
+            return -1;
+        }
     }
 
     if (ns->params.nsid > NVME_MAX_NAMESPACES) {
@@ -593,6 +619,7 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_UINT8("mset", NvmeNamespace, params.mset, 0),
     DEFINE_PROP_UINT8("pi", NvmeNamespace, params.pi, 0),
     DEFINE_PROP_UINT8("pil", NvmeNamespace, params.pil, 0),
+    DEFINE_PROP_UINT8("pif", NvmeNamespace, params.pif, 0),
     DEFINE_PROP_UINT16("mssrl", NvmeNamespace, params.mssrl, 128),
     DEFINE_PROP_UINT32("mcl", NvmeNamespace, params.mcl, 128),
     DEFINE_PROP_UINT8("msrc", NvmeNamespace, params.msrc, 127),
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index e715c3255a29..739c8b8f7962 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -102,6 +102,7 @@ typedef struct NvmeNamespaceParams {
     uint8_t  mset;
     uint8_t  pi;
     uint8_t  pil;
+    uint8_t  pif;
 
     uint16_t mssrl;
     uint32_t mcl;
@@ -127,6 +128,7 @@ typedef struct NvmeNamespace {
     int64_t      size;
     int64_t      moff;
     NvmeIdNs     id_ns;
+    NvmeIdNsNvm  id_ns_nvm;
     NvmeLBAF     lbaf;
     unsigned int nlbaf;
     size_t       lbasz;
@@ -134,6 +136,7 @@ typedef struct NvmeNamespace {
     uint8_t      csi;
     uint16_t     status;
     int          attached;
+    uint8_t      pif;
 
     struct {
         uint16_t zrwas;
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index 90730d802fe3..ff1b4589692b 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -20,12 +20,16 @@ pci_nvme_dif_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_dif_rw_mdata_in_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_dif_rw_mdata_out_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
 pci_nvme_dif_rw_check_cb(uint16_t cid, uint8_t prinfo, uint16_t apptag, uint16_t appmask, uint32_t reftag) "cid %"PRIu16" prinfo 0x%"PRIx8" apptag 0x%"PRIx16" appmask 0x%"PRIx16" reftag 0x%"PRIx32""
-pci_nvme_dif_pract_generate_dif(size_t len, size_t lba_size, size_t chksum_len, uint16_t apptag, uint32_t reftag) "len %zu lba_size %zu chksum_len %zu apptag 0x%"PRIx16" reftag 0x%"PRIx32""
+pci_nvme_dif_pract_generate_dif_crc16(size_t len, size_t lba_size, size_t chksum_len, uint16_t apptag, uint32_t reftag) "len %zu lba_size %zu chksum_len %zu apptag 0x%"PRIx16" reftag 0x%"PRIx32""
+pci_nvme_dif_pract_generate_dif_crc64(size_t len, size_t lba_size, size_t chksum_len, uint16_t apptag, uint64_t reftag) "len %zu lba_size %zu chksum_len %zu apptag 0x%"PRIx16" reftag 0x%"PRIx64""
 pci_nvme_dif_check(uint8_t prinfo, uint16_t chksum_len) "prinfo 0x%"PRIx8" chksum_len %"PRIu16""
-pci_nvme_dif_prchk_disabled(uint16_t apptag, uint32_t reftag) "apptag 0x%"PRIx16" reftag 0x%"PRIx32""
-pci_nvme_dif_prchk_guard(uint16_t guard, uint16_t crc) "guard 0x%"PRIx16" crc 0x%"PRIx16""
+pci_nvme_dif_prchk_disabled_crc16(uint16_t apptag, uint32_t reftag) "apptag 0x%"PRIx16" reftag 0x%"PRIx32""
+pci_nvme_dif_prchk_disabled_crc64(uint16_t apptag, uint64_t reftag) "apptag 0x%"PRIx16" reftag 0x%"PRIx64""
+pci_nvme_dif_prchk_guard_crc16(uint16_t guard, uint16_t crc) "guard 0x%"PRIx16" crc 0x%"PRIx16""
+pci_nvme_dif_prchk_guard_crc64(uint64_t guard, uint64_t crc) "guard 0x%"PRIx64" crc 0x%"PRIx64""
 pci_nvme_dif_prchk_apptag(uint16_t apptag, uint16_t elbat, uint16_t elbatm) "apptag 0x%"PRIx16" elbat 0x%"PRIx16" elbatm 0x%"PRIx16""
-pci_nvme_dif_prchk_reftag(uint32_t reftag, uint32_t elbrt) "reftag 0x%"PRIx32" elbrt 0x%"PRIx32""
+pci_nvme_dif_prchk_reftag_crc16(uint32_t reftag, uint32_t elbrt) "reftag 0x%"PRIx32" elbrt 0x%"PRIx32""
+pci_nvme_dif_prchk_reftag_crc64(uint64_t reftag, uint64_t elbrt) "reftag 0x%"PRIx64" elbrt 0x%"PRIx64""
 pci_nvme_copy(uint16_t cid, uint32_t nsid, uint16_t nr, uint8_t format) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu16" format 0x%"PRIx8""
 pci_nvme_copy_source_range(uint64_t slba, uint32_t nlb) "slba 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_copy_out(uint64_t slba, uint32_t nlb) "slba 0x%"PRIx64" nlb %"PRIu32""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 37afc9be9b18..3737351cc815 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -695,7 +695,8 @@ typedef struct QEMU_PACKED NvmeRwCmd {
     uint8_t     flags;
     uint16_t    cid;
     uint32_t    nsid;
-    uint64_t    rsvd2;
+    uint32_t    cdw2;
+    uint32_t    cdw3;
     uint64_t    mptr;
     NvmeCmdDptr dptr;
     uint64_t    slba;
@@ -731,7 +732,6 @@ enum {
     NVME_RW_PRINFO_PRCHK_APP    = 1 << 11,
     NVME_RW_PRINFO_PRCHK_REF    = 1 << 10,
     NVME_RW_PRINFO_PRCHK_MASK   = 7 << 10,
-
 };
 
 #define NVME_RW_PRINFO(control) ((control >> 10) & 0xf)
@@ -770,6 +770,7 @@ typedef struct QEMU_PACKED NvmeDsmRange {
 
 enum {
     NVME_COPY_FORMAT_0 = 0x0,
+    NVME_COPY_FORMAT_1 = 0x1,
 };
 
 typedef struct QEMU_PACKED NvmeCopyCmd {
@@ -777,7 +778,9 @@ typedef struct QEMU_PACKED NvmeCopyCmd {
     uint8_t     flags;
     uint16_t    cid;
     uint32_t    nsid;
-    uint32_t    rsvd2[4];
+    uint32_t    cdw2;
+    uint32_t    cdw3;
+    uint32_t    rsvd2[2];
     NvmeCmdDptr dptr;
     uint64_t    sdlba;
     uint8_t     nr;
@@ -789,7 +792,7 @@ typedef struct QEMU_PACKED NvmeCopyCmd {
     uint16_t    appmask;
 } NvmeCopyCmd;
 
-typedef struct QEMU_PACKED NvmeCopySourceRange {
+typedef struct QEMU_PACKED NvmeCopySourceRangeFormat0 {
     uint8_t  rsvd0[8];
     uint64_t slba;
     uint16_t nlb;
@@ -797,7 +800,17 @@ typedef struct QEMU_PACKED NvmeCopySourceRange {
     uint32_t reftag;
     uint16_t apptag;
     uint16_t appmask;
-} NvmeCopySourceRange;
+} NvmeCopySourceRangeFormat0;
+
+typedef struct QEMU_PACKED NvmeCopySourceRangeFormat1 {
+    uint8_t  rsvd0[8];
+    uint64_t slba;
+    uint16_t nlb;
+    uint8_t  rsvd18[8];
+    uint8_t  sr[10];
+    uint16_t apptag;
+    uint16_t appmask;
+} NvmeCopySourceRangeFormat1;
 
 enum NvmeAsyncEventRequest {
     NVME_AER_TYPE_ERROR                     = 0,
@@ -908,6 +921,7 @@ enum NvmeStatusCodes {
     NVME_CMP_FAILURE            = 0x0285,
     NVME_ACCESS_DENIED          = 0x0286,
     NVME_DULB                   = 0x0287,
+    NVME_E2E_STORAGE_TAG_ERROR  = 0x0288,
     NVME_MORE                   = 0x2000,
     NVME_DNR                    = 0x4000,
     NVME_NO_COMPLETE            = 0xffff,
@@ -1135,7 +1149,8 @@ enum NvmeIdCtrlOncs {
 };
 
 enum NvmeIdCtrlOcfs {
-    NVME_OCFS_COPY_FORMAT_0 = 1 << 0,
+    NVME_OCFS_COPY_FORMAT_0 = 1 << NVME_COPY_FORMAT_0,
+    NVME_OCFS_COPY_FORMAT_1 = 1 << NVME_COPY_FORMAT_1,
 };
 
 enum NvmeIdctrlVwc {
@@ -1282,6 +1297,7 @@ typedef struct QEMU_PACKED NvmeLBAFE {
 } NvmeLBAFE;
 
 #define NVME_NSID_BROADCAST 0xffffffff
+#define NVME_MAX_NLBAF 64
 
 typedef struct QEMU_PACKED NvmeIdNs {
     uint64_t    nsze;
@@ -1316,10 +1332,20 @@ typedef struct QEMU_PACKED NvmeIdNs {
     uint8_t     rsvd81[23];
     uint8_t     nguid[16];
     uint64_t    eui64;
-    NvmeLBAF    lbaf[64];
+    NvmeLBAF    lbaf[NVME_MAX_NLBAF];
     uint8_t     vs[3712];
 } NvmeIdNs;
 
+#define NVME_ID_NS_NVM_ELBAF_PIF(elbaf) (((elbaf) >> 7) & 0x3)
+
+typedef struct QEMU_PACKED NvmeIdNsNvm {
+    uint64_t    lbstm;
+    uint8_t     pic;
+    uint8_t     rsvd9[3];
+    uint32_t    elbaf[NVME_MAX_NLBAF];
+    uint8_t     rsvd268[3828];
+} NvmeIdNsNvm;
+
 typedef struct QEMU_PACKED NvmeIdNsDescr {
     uint8_t nidt;
     uint8_t nidl;
@@ -1421,10 +1447,23 @@ enum NvmeIdNsMc {
 
 #define NVME_ID_NS_DPS_TYPE(dps) (dps & NVME_ID_NS_DPS_TYPE_MASK)
 
-typedef struct NvmeDifTuple {
-    uint16_t guard;
-    uint16_t apptag;
-    uint32_t reftag;
+enum NvmePIFormat {
+    NVME_PI_GUARD_16                 = 0,
+    NVME_PI_GUARD_64                 = 2,
+};
+
+typedef union NvmeDifTuple {
+    struct {
+        uint16_t guard;
+        uint16_t apptag;
+        uint32_t reftag;
+    } g16;
+
+    struct {
+        uint64_t guard;
+        uint16_t apptag;
+        uint8_t  sr[6];
+    } g64;
 } NvmeDifTuple;
 
 enum NvmeZoneAttr {
@@ -1521,7 +1560,8 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeZonedResult) != 8);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCqe) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDsmRange) != 16);
-    QEMU_BUILD_BUG_ON(sizeof(NvmeCopySourceRange) != 32);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeCopySourceRangeFormat0) != 32);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeCopySourceRangeFormat1) != 40);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDeleteQ) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCreateCq) != 64);
@@ -1542,10 +1582,11 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeLBAF) != 4);
     QEMU_BUILD_BUG_ON(sizeof(NvmeLBAFE) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNs) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsNvm) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsZoned) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSglDescriptor) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) != 4);
     QEMU_BUILD_BUG_ON(sizeof(NvmeZoneDescr) != 64);
-    QEMU_BUILD_BUG_ON(sizeof(NvmeDifTuple) != 8);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeDifTuple) != 16);
 }
 #endif
-- 
2.35.1


