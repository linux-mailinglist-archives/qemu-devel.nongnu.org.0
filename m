Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047773C7767
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 21:44:29 +0200 (CEST)
Received: from localhost ([::1]:52670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3OKR-0005GM-PE
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 15:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3O1O-0007SI-Sc; Tue, 13 Jul 2021 15:24:46 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:40469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3O1L-0003T6-MH; Tue, 13 Jul 2021 15:24:46 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E661F580AC9;
 Tue, 13 Jul 2021 15:24:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 13 Jul 2021 15:24:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=+uaKnA6yhGbmq
 1Ep2/pf7Gog3DnJ2R3eu82WvkkhLpc=; b=M1BhFU7ZkeEkeJiEck3ehprqZFSiN
 AiS038Z2nBrqn+82MfKzSDpWrElawaKSbTGbmQDObPf8AIqFDVCGJCir74GIyc9x
 YpOgzC8cvpnU4M/wybzPINnIT8jtKoVzZkU+gRpTGDOZNYXgA/jqcRranm8zJHB5
 DlSZEZqd+lKIyrSiFjWn7iEJO8QDil2W1MeS2wqDTK6ggS/p42iWuWGZPWHt7Bom
 FEMyGpaBrQOneBN4RHJxsSC4ZbHYxSIcvKNx4tPJ+6V41kTCwFXfmRLrQJcTD8b0
 gTJYNESiMosNFE77CFyMAcYvzib0vw73jNW1rz11AskGFhDreVlqoz5eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+uaKnA6yhGbmq1Ep2/pf7Gog3DnJ2R3eu82WvkkhLpc=; b=DHumfIar
 Ojc+TEk9jCInSNv6vPVPnCl7K82rIMUZFuxTAkhLvsJ12oSXSkuKipoZfzlzdagK
 0vSzEzYv1739VZnHivR3bDyw8yhAkpzft1kpu1CA1HzgygOlhWcK25yiNJYYx4zG
 255k6ZcEyXLOQbrtWEYR4lusWr6SxJWwVoSjU+3ScK6HFZmadJFY9aPvBTlzkbaA
 RE/A4NVeQm6z17lAmUBEuYW66wSGZ7jqLrft8tQaH+cxqX2J3rfqiO0o0C2vmFKf
 OgT3QZPS3La1EEzXI7gCHwUK6TYhtQSmhsXsLRdLJQTUsYah/xzQ/J1GchibmC1K
 vfxDhh83UrmUGw==
X-ME-Sender: <xms:eujtYE7J6RwOWwprqX3EgfJjs5s1M_VaGQJ8AqXKrygn4HGq18gU7g>
 <xme:eujtYF7mRNrMkap2e1xoZV9dRcViCzneQwN2Q7hyscRH8f5ndf7Ab_w_zKFGKJ7tO
 edEY_BmUliIGrZWnGM>
X-ME-Received: <xmr:eujtYDfiVrCEqpt-7WamlxUW3o4DLJ_EtRg1_HLYlAobeJn9sW4tuKiUnzoqZfWG9lTX-RtaSBYThourjLSXBeDlpd6z765ihwwoe8rzXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefhieetudeuudehgfegudfhieevhefglefgfeevtdefleefieegudetvedthfdt
 feenucffohhmrghinhepphhmrhdruggvvhenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:eujtYJIn06V_vPYDkWhFFG--43vGIfdqhap0OzJVp95CiJ9rfBfxog>
 <xmx:eujtYILJUKOfSLxub-zperKbjs8zyO9jOTW5dOoxDyI8c9jcV4eyog>
 <xmx:eujtYKw0Lx9iK91JDN1oFPIAUOufbvo8Al40kuDd285BsRfI7wJmQA>
 <xmx:eujtYKC7nOm7XRvnxrbDeMu0f4UZLiMrSbuD1XH7a36UxyUF-uinKg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jul 2021 15:24:40 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] hw/nvme: fix mmio read
Date: Tue, 13 Jul 2021 21:24:27 +0200
Message-Id: <20210713192428.950160-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713192428.950160-1-its@irrelevant.dk>
References: <20210713192428.950160-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
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
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The new PMR test unearthed a long-standing issue with MMIO reads on
big-endian hosts.

Fix this by unconditionally storing all controller registers in little
endian.

Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 304 ++++++++++++++++++++++++++++---------------------
 1 file changed, 174 insertions(+), 130 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 0449cc4dee9b..ddac9344a74e 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -439,10 +439,12 @@ static uint8_t nvme_sq_empty(NvmeSQueue *sq)
 
 static void nvme_irq_check(NvmeCtrl *n)
 {
+    uint32_t intms = le32_to_cpu(n->bar.intms);
+
     if (msix_enabled(&(n->parent_obj))) {
         return;
     }
-    if (~n->bar.intms & n->irq_status) {
+    if (~intms & n->irq_status) {
         pci_irq_assert(&n->parent_obj);
     } else {
         pci_irq_deassert(&n->parent_obj);
@@ -1289,7 +1291,7 @@ static void nvme_post_cqes(void *opaque)
         if (ret) {
             trace_pci_nvme_err_addr_write(addr);
             trace_pci_nvme_err_cfs();
-            n->bar.csts = NVME_CSTS_FAILED;
+            n->bar.csts = cpu_to_le64(NVME_CSTS_FAILED);
             break;
         }
         QTAILQ_REMOVE(&cq->req_list, req, entry);
@@ -4022,7 +4024,7 @@ static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeRequest *req)
         trace_pci_nvme_err_invalid_create_sq_sqid(sqid);
         return NVME_INVALID_QID | NVME_DNR;
     }
-    if (unlikely(!qsize || qsize > NVME_CAP_MQES(n->bar.cap))) {
+    if (unlikely(!qsize || qsize > NVME_CAP_MQES(le64_to_cpu(n->bar.cap)))) {
         trace_pci_nvme_err_invalid_create_sq_size(qsize);
         return NVME_MAX_QSIZE_EXCEEDED | NVME_DNR;
     }
@@ -4208,7 +4210,7 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    switch (NVME_CC_CSS(n->bar.cc)) {
+    switch (NVME_CC_CSS(le32_to_cpu(n->bar.cc))) {
     case NVME_CC_CSS_NVM:
         src_iocs = nvme_cse_iocs_nvm;
         /* fall through */
@@ -4370,7 +4372,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
         trace_pci_nvme_err_invalid_create_cq_cqid(cqid);
         return NVME_INVALID_QID | NVME_DNR;
     }
-    if (unlikely(!qsize || qsize > NVME_CAP_MQES(n->bar.cap))) {
+    if (unlikely(!qsize || qsize > NVME_CAP_MQES(le64_to_cpu(n->bar.cap)))) {
         trace_pci_nvme_err_invalid_create_cq_size(qsize);
         return NVME_MAX_QSIZE_EXCEEDED | NVME_DNR;
     }
@@ -5163,17 +5165,19 @@ static void nvme_update_dmrsl(NvmeCtrl *n)
 
 static void nvme_select_iocs_ns(NvmeCtrl *n, NvmeNamespace *ns)
 {
+    uint32_t cc = le32_to_cpu(n->bar.cc);
+
     ns->iocs = nvme_cse_iocs_none;
     switch (ns->csi) {
     case NVME_CSI_NVM:
-        if (NVME_CC_CSS(n->bar.cc) != NVME_CC_CSS_ADMIN_ONLY) {
+        if (NVME_CC_CSS(cc) != NVME_CC_CSS_ADMIN_ONLY) {
             ns->iocs = nvme_cse_iocs_nvm;
         }
         break;
     case NVME_CSI_ZONED:
-        if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_CSI) {
+        if (NVME_CC_CSS(cc) == NVME_CC_CSS_CSI) {
             ns->iocs = nvme_cse_iocs_zoned;
-        } else if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_NVM) {
+        } else if (NVME_CC_CSS(cc) == NVME_CC_CSS_NVM) {
             ns->iocs = nvme_cse_iocs_nvm;
         }
         break;
@@ -5510,7 +5514,7 @@ static void nvme_process_sq(void *opaque)
         if (nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd))) {
             trace_pci_nvme_err_addr_read(addr);
             trace_pci_nvme_err_cfs();
-            n->bar.csts = NVME_CSTS_FAILED;
+            n->bar.csts = cpu_to_le32(NVME_CSTS_FAILED);
             break;
         }
         nvme_inc_sq_head(sq);
@@ -5565,8 +5569,6 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
     n->aer_queued = 0;
     n->outstanding_aers = 0;
     n->qs_created = false;
-
-    n->bar.cc = 0;
 }
 
 static void nvme_ctrl_shutdown(NvmeCtrl *n)
@@ -5605,7 +5607,12 @@ static void nvme_select_iocs(NvmeCtrl *n)
 
 static int nvme_start_ctrl(NvmeCtrl *n)
 {
-    uint32_t page_bits = NVME_CC_MPS(n->bar.cc) + 12;
+    uint64_t cap = le64_to_cpu(n->bar.cap);
+    uint32_t cc = le32_to_cpu(n->bar.cc);
+    uint32_t aqa = le32_to_cpu(n->bar.aqa);
+    uint64_t asq = le64_to_cpu(n->bar.asq);
+    uint64_t acq = le64_to_cpu(n->bar.acq);
+    uint32_t page_bits = NVME_CC_MPS(cc) + 12;
     uint32_t page_size = 1 << page_bits;
 
     if (unlikely(n->cq[0])) {
@@ -5616,73 +5623,72 @@ static int nvme_start_ctrl(NvmeCtrl *n)
         trace_pci_nvme_err_startfail_sq();
         return -1;
     }
-    if (unlikely(!n->bar.asq)) {
+    if (unlikely(!asq)) {
         trace_pci_nvme_err_startfail_nbarasq();
         return -1;
     }
-    if (unlikely(!n->bar.acq)) {
+    if (unlikely(!acq)) {
         trace_pci_nvme_err_startfail_nbaracq();
         return -1;
     }
-    if (unlikely(n->bar.asq & (page_size - 1))) {
-        trace_pci_nvme_err_startfail_asq_misaligned(n->bar.asq);
+    if (unlikely(asq & (page_size - 1))) {
+        trace_pci_nvme_err_startfail_asq_misaligned(asq);
         return -1;
     }
-    if (unlikely(n->bar.acq & (page_size - 1))) {
-        trace_pci_nvme_err_startfail_acq_misaligned(n->bar.acq);
+    if (unlikely(acq & (page_size - 1))) {
+        trace_pci_nvme_err_startfail_acq_misaligned(acq);
         return -1;
     }
-    if (unlikely(!(NVME_CAP_CSS(n->bar.cap) & (1 << NVME_CC_CSS(n->bar.cc))))) {
-        trace_pci_nvme_err_startfail_css(NVME_CC_CSS(n->bar.cc));
+    if (unlikely(!(NVME_CAP_CSS(cap) & (1 << NVME_CC_CSS(cc))))) {
+        trace_pci_nvme_err_startfail_css(NVME_CC_CSS(cc));
         return -1;
     }
-    if (unlikely(NVME_CC_MPS(n->bar.cc) <
-                 NVME_CAP_MPSMIN(n->bar.cap))) {
+    if (unlikely(NVME_CC_MPS(cc) < NVME_CAP_MPSMIN(cap))) {
         trace_pci_nvme_err_startfail_page_too_small(
-                    NVME_CC_MPS(n->bar.cc),
-                    NVME_CAP_MPSMIN(n->bar.cap));
+                    NVME_CC_MPS(cc),
+                    NVME_CAP_MPSMIN(cap));
         return -1;
     }
-    if (unlikely(NVME_CC_MPS(n->bar.cc) >
-                 NVME_CAP_MPSMAX(n->bar.cap))) {
+    if (unlikely(NVME_CC_MPS(cc) >
+                 NVME_CAP_MPSMAX(cap))) {
         trace_pci_nvme_err_startfail_page_too_large(
-                    NVME_CC_MPS(n->bar.cc),
-                    NVME_CAP_MPSMAX(n->bar.cap));
+                    NVME_CC_MPS(cc),
+                    NVME_CAP_MPSMAX(cap));
         return -1;
     }
-    if (unlikely(NVME_CC_IOCQES(n->bar.cc) <
+    if (unlikely(NVME_CC_IOCQES(cc) <
                  NVME_CTRL_CQES_MIN(n->id_ctrl.cqes))) {
         trace_pci_nvme_err_startfail_cqent_too_small(
-                    NVME_CC_IOCQES(n->bar.cc),
-                    NVME_CTRL_CQES_MIN(n->bar.cap));
+                    NVME_CC_IOCQES(cc),
+                    NVME_CTRL_CQES_MIN(cap));
         return -1;
     }
-    if (unlikely(NVME_CC_IOCQES(n->bar.cc) >
+    if (unlikely(NVME_CC_IOCQES(cc) >
                  NVME_CTRL_CQES_MAX(n->id_ctrl.cqes))) {
         trace_pci_nvme_err_startfail_cqent_too_large(
-                    NVME_CC_IOCQES(n->bar.cc),
-                    NVME_CTRL_CQES_MAX(n->bar.cap));
+                    NVME_CC_IOCQES(cc),
+                    NVME_CTRL_CQES_MAX(cap));
         return -1;
     }
-    if (unlikely(NVME_CC_IOSQES(n->bar.cc) <
+    if (unlikely(NVME_CC_IOSQES(cc) <
                  NVME_CTRL_SQES_MIN(n->id_ctrl.sqes))) {
         trace_pci_nvme_err_startfail_sqent_too_small(
-                    NVME_CC_IOSQES(n->bar.cc),
-                    NVME_CTRL_SQES_MIN(n->bar.cap));
+                    NVME_CC_IOSQES(cc),
+                    NVME_CTRL_SQES_MIN(cap));
         return -1;
     }
-    if (unlikely(NVME_CC_IOSQES(n->bar.cc) >
+    if (unlikely(NVME_CC_IOSQES(cc) >
                  NVME_CTRL_SQES_MAX(n->id_ctrl.sqes))) {
         trace_pci_nvme_err_startfail_sqent_too_large(
-                    NVME_CC_IOSQES(n->bar.cc),
-                    NVME_CTRL_SQES_MAX(n->bar.cap));
+                    NVME_CC_IOSQES(cc),
+                    NVME_CTRL_SQES_MAX(cap));
         return -1;
     }
-    if (unlikely(!NVME_AQA_ASQS(n->bar.aqa))) {
+    if (unlikely(!NVME_AQA_ASQS(aqa))) {
         trace_pci_nvme_err_startfail_asqent_sz_zero();
         return -1;
     }
-    if (unlikely(!NVME_AQA_ACQS(n->bar.aqa))) {
+    if (unlikely(!NVME_AQA_ACQS(aqa))) {
         trace_pci_nvme_err_startfail_acqent_sz_zero();
         return -1;
     }
@@ -5690,12 +5696,10 @@ static int nvme_start_ctrl(NvmeCtrl *n)
     n->page_bits = page_bits;
     n->page_size = page_size;
     n->max_prp_ents = n->page_size / sizeof(uint64_t);
-    n->cqe_size = 1 << NVME_CC_IOCQES(n->bar.cc);
-    n->sqe_size = 1 << NVME_CC_IOSQES(n->bar.cc);
-    nvme_init_cq(&n->admin_cq, n, n->bar.acq, 0, 0,
-                 NVME_AQA_ACQS(n->bar.aqa) + 1, 1);
-    nvme_init_sq(&n->admin_sq, n, n->bar.asq, 0, 0,
-                 NVME_AQA_ASQS(n->bar.aqa) + 1);
+    n->cqe_size = 1 << NVME_CC_IOCQES(cc);
+    n->sqe_size = 1 << NVME_CC_IOSQES(cc);
+    nvme_init_cq(&n->admin_cq, n, acq, 0, 0, NVME_AQA_ACQS(aqa) + 1, 1);
+    nvme_init_sq(&n->admin_sq, n, asq, 0, 0, NVME_AQA_ASQS(aqa) + 1);
 
     nvme_set_timestamp(n, 0ULL);
 
@@ -5708,22 +5712,38 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
 static void nvme_cmb_enable_regs(NvmeCtrl *n)
 {
-    NVME_CMBLOC_SET_CDPCILS(n->bar.cmbloc, 1);
-    NVME_CMBLOC_SET_CDPMLS(n->bar.cmbloc, 1);
-    NVME_CMBLOC_SET_BIR(n->bar.cmbloc, NVME_CMB_BIR);
+    uint32_t cmbloc = 0, cmbsz = 0;
 
-    NVME_CMBSZ_SET_SQS(n->bar.cmbsz, 1);
-    NVME_CMBSZ_SET_CQS(n->bar.cmbsz, 0);
-    NVME_CMBSZ_SET_LISTS(n->bar.cmbsz, 1);
-    NVME_CMBSZ_SET_RDS(n->bar.cmbsz, 1);
-    NVME_CMBSZ_SET_WDS(n->bar.cmbsz, 1);
-    NVME_CMBSZ_SET_SZU(n->bar.cmbsz, 2); /* MBs */
-    NVME_CMBSZ_SET_SZ(n->bar.cmbsz, n->params.cmb_size_mb);
+    NVME_CMBLOC_SET_CDPCILS(cmbloc, 1);
+    NVME_CMBLOC_SET_CDPMLS(cmbloc, 1);
+    NVME_CMBLOC_SET_BIR(cmbloc, NVME_CMB_BIR);
+    n->bar.cmbloc = cpu_to_le32(cmbloc);
+
+    NVME_CMBSZ_SET_SQS(cmbsz, 1);
+    NVME_CMBSZ_SET_CQS(cmbsz, 0);
+    NVME_CMBSZ_SET_LISTS(cmbsz, 1);
+    NVME_CMBSZ_SET_RDS(cmbsz, 1);
+    NVME_CMBSZ_SET_WDS(cmbsz, 1);
+    NVME_CMBSZ_SET_SZU(cmbsz, 2); /* MBs */
+    NVME_CMBSZ_SET_SZ(cmbsz, n->params.cmb_size_mb);
+    n->bar.cmbsz = cpu_to_le32(cmbsz);
 }
 
 static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
                            unsigned size)
 {
+    uint64_t cap = le64_to_cpu(n->bar.cap);
+    uint32_t cc = le32_to_cpu(n->bar.cc);
+    uint32_t intms = le32_to_cpu(n->bar.intms);
+    uint32_t csts = le32_to_cpu(n->bar.csts);
+    uint64_t asq = le64_to_cpu(n->bar.asq);
+    uint64_t acq = le64_to_cpu(n->bar.acq);
+    uint64_t cmbmsc = le64_to_cpu(n->bar.cmbmsc);
+    uint32_t cmbsts = le32_to_cpu(n->bar.cmbsts);
+    uint32_t pmrsts = le32_to_cpu(n->bar.pmrsts);
+    uint32_t pmrmscl = le32_to_cpu(n->bar.pmrmscl);
+    uint32_t pmrmscu = le32_to_cpu(n->bar.pmrmscu);
+
     if (unlikely(offset & (sizeof(uint32_t) - 1))) {
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_misaligned32,
                        "MMIO write not 32-bit aligned,"
@@ -5747,9 +5767,9 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
                            " when MSI-X is enabled");
             /* should be ignored, fall through for now */
         }
-        n->bar.intms |= data & 0xffffffff;
-        n->bar.intmc = n->bar.intms;
-        trace_pci_nvme_mmio_intm_set(data & 0xffffffff, n->bar.intmc);
+        intms |= data & 0xffffffff;
+        n->bar.intmc = n->bar.intms = cpu_to_le32(intms);
+        trace_pci_nvme_mmio_intm_set(data & 0xffffffff, intms);
         nvme_irq_check(n);
         break;
     case NVME_REG_INTMC:
@@ -5759,44 +5779,54 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
                            " when MSI-X is enabled");
             /* should be ignored, fall through for now */
         }
-        n->bar.intms &= ~(data & 0xffffffff);
-        n->bar.intmc = n->bar.intms;
-        trace_pci_nvme_mmio_intm_clr(data & 0xffffffff, n->bar.intmc);
+        intms &= ~(data & 0xffffffff);
+        n->bar.intmc = n->bar.intms = cpu_to_le32(intms);
+        trace_pci_nvme_mmio_intm_clr(data & 0xffffffff, intms);
         nvme_irq_check(n);
         break;
     case NVME_REG_CC:
         trace_pci_nvme_mmio_cfg(data & 0xffffffff);
+
         /* Windows first sends data, then sends enable bit */
-        if (!NVME_CC_EN(data) && !NVME_CC_EN(n->bar.cc) &&
-            !NVME_CC_SHN(data) && !NVME_CC_SHN(n->bar.cc))
+        if (!NVME_CC_EN(data) && !NVME_CC_EN(cc) &&
+            !NVME_CC_SHN(data) && !NVME_CC_SHN(cc))
         {
-            n->bar.cc = data;
+            cc = data;
         }
 
-        if (NVME_CC_EN(data) && !NVME_CC_EN(n->bar.cc)) {
-            n->bar.cc = data;
+        if (NVME_CC_EN(data) && !NVME_CC_EN(cc)) {
+            cc = data;
+
+            /* flush CC since nvme_start_ctrl() needs the value */
+            n->bar.cc = cpu_to_le32(cc);
             if (unlikely(nvme_start_ctrl(n))) {
                 trace_pci_nvme_err_startfail();
-                n->bar.csts = NVME_CSTS_FAILED;
+                csts = NVME_CSTS_FAILED;
             } else {
                 trace_pci_nvme_mmio_start_success();
-                n->bar.csts = NVME_CSTS_READY;
+                csts = NVME_CSTS_READY;
             }
-        } else if (!NVME_CC_EN(data) && NVME_CC_EN(n->bar.cc)) {
+        } else if (!NVME_CC_EN(data) && NVME_CC_EN(cc)) {
             trace_pci_nvme_mmio_stopped();
             nvme_ctrl_reset(n);
-            n->bar.csts &= ~NVME_CSTS_READY;
+            cc = 0;
+            csts &= ~NVME_CSTS_READY;
         }
-        if (NVME_CC_SHN(data) && !(NVME_CC_SHN(n->bar.cc))) {
+
+        if (NVME_CC_SHN(data) && !(NVME_CC_SHN(cc))) {
             trace_pci_nvme_mmio_shutdown_set();
             nvme_ctrl_shutdown(n);
-            n->bar.cc = data;
-            n->bar.csts |= NVME_CSTS_SHST_COMPLETE;
-        } else if (!NVME_CC_SHN(data) && NVME_CC_SHN(n->bar.cc)) {
+            cc = data;
+            csts |= NVME_CSTS_SHST_COMPLETE;
+        } else if (!NVME_CC_SHN(data) && NVME_CC_SHN(cc)) {
             trace_pci_nvme_mmio_shutdown_cleared();
-            n->bar.csts &= ~NVME_CSTS_SHST_COMPLETE;
-            n->bar.cc = data;
+            csts &= ~NVME_CSTS_SHST_COMPLETE;
+            cc = data;
         }
+
+        n->bar.cc = cpu_to_le32(cc);
+        n->bar.csts = cpu_to_le32(csts);
+
         break;
     case NVME_REG_CSTS:
         if (data & (1 << 4)) {
@@ -5818,26 +5848,30 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         }
         break;
     case NVME_REG_AQA:
-        n->bar.aqa = data & 0xffffffff;
-        trace_pci_nvme_mmio_aqattr(data & 0xffffffff);
+        n->bar.aqa = cpu_to_le32(data & 0xffffffff);
+        trace_pci_nvme_mmio_aqattr(cpu_to_le32(data & 0xffffffff));
         break;
     case NVME_REG_ASQ:
-        n->bar.asq = size == 8 ? data :
-            (n->bar.asq & ~0xffffffffULL) | (data & 0xffffffff);
+        asq = size == 8 ? data :
+            (asq & ~0xffffffffULL) | (data & 0xffffffff);
+        n->bar.asq = cpu_to_le64(asq);
         trace_pci_nvme_mmio_asqaddr(data);
         break;
     case NVME_REG_ASQ + 4:
-        n->bar.asq = (n->bar.asq & 0xffffffff) | (data << 32);
-        trace_pci_nvme_mmio_asqaddr_hi(data, n->bar.asq);
+        asq = (asq & 0xffffffff) | (data << 32);
+        n->bar.asq = cpu_to_le64(asq);
+        trace_pci_nvme_mmio_asqaddr_hi(data, asq);
         break;
     case NVME_REG_ACQ:
         trace_pci_nvme_mmio_acqaddr(data);
-        n->bar.acq = size == 8 ? data :
-            (n->bar.acq & ~0xffffffffULL) | (data & 0xffffffff);
+        acq = size == 8 ? data :
+            (acq & ~0xffffffffULL) | (data & 0xffffffff);
+        n->bar.acq = cpu_to_le64(acq);
         break;
     case NVME_REG_ACQ + 4:
-        n->bar.acq = (n->bar.acq & 0xffffffff) | (data << 32);
-        trace_pci_nvme_mmio_acqaddr_hi(data, n->bar.acq);
+        acq = (acq & 0xffffffff) | (data << 32);
+        n->bar.acq = cpu_to_le64(acq);
+        trace_pci_nvme_mmio_acqaddr_hi(data, acq);
         break;
     case NVME_REG_CMBLOC:
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_cmbloc_reserved,
@@ -5849,12 +5883,13 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
                        "invalid write to read only CMBSZ, ignored");
         return;
     case NVME_REG_CMBMSC:
-        if (!NVME_CAP_CMBS(n->bar.cap)) {
+        if (!NVME_CAP_CMBS(cap)) {
             return;
         }
 
-        n->bar.cmbmsc = size == 8 ? data :
-            (n->bar.cmbmsc & ~0xffffffff) | (data & 0xffffffff);
+        cmbmsc = size == 8 ? data :
+            (cmbmsc & ~0xffffffff) | (data & 0xffffffff);
+        n->bar.cmbmsc = cpu_to_le64(cmbmsc);
         n->cmb.cmse = false;
 
         if (NVME_CMBMSC_CRE(data)) {
@@ -5863,7 +5898,8 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             if (NVME_CMBMSC_CMSE(data)) {
                 hwaddr cba = NVME_CMBMSC_CBA(data) << CMBMSC_CBA_SHIFT;
                 if (cba + int128_get64(n->cmb.mem.size) < cba) {
-                    NVME_CMBSTS_SET_CBAI(n->bar.cmbsts, 1);
+                    NVME_CMBSTS_SET_CBAI(cmbsts, 1);
+                    n->bar.cmbsts = cpu_to_le32(cmbsts);
                     return;
                 }
 
@@ -5877,7 +5913,8 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
 
         return;
     case NVME_REG_CMBMSC + 4:
-        n->bar.cmbmsc = (n->bar.cmbmsc & 0xffffffff) | (data << 32);
+        cmbmsc = (cmbmsc & 0xffffffff) | (data << 32);
+        n->bar.cmbmsc = cpu_to_le64(cmbmsc);
         return;
 
     case NVME_REG_PMRCAP:
@@ -5885,19 +5922,20 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
                        "invalid write to PMRCAP register, ignored");
         return;
     case NVME_REG_PMRCTL:
-        if (!NVME_CAP_PMRS(n->bar.cap)) {
+        if (!NVME_CAP_PMRS(cap)) {
             return;
         }
 
-        n->bar.pmrctl = data;
+        n->bar.pmrctl = cpu_to_le32(data);
         if (NVME_PMRCTL_EN(data)) {
             memory_region_set_enabled(&n->pmr.dev->mr, true);
-            n->bar.pmrsts = 0;
+            pmrsts = 0;
         } else {
             memory_region_set_enabled(&n->pmr.dev->mr, false);
-            NVME_PMRSTS_SET_NRDY(n->bar.pmrsts, 1);
+            NVME_PMRSTS_SET_NRDY(pmrsts, 1);
             n->pmr.cmse = false;
         }
+        n->bar.pmrsts = cpu_to_le32(pmrsts);
         return;
     case NVME_REG_PMRSTS:
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrsts_readonly,
@@ -5912,18 +5950,20 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
                        "invalid write to PMRSWTP register, ignored");
         return;
     case NVME_REG_PMRMSCL:
-        if (!NVME_CAP_PMRS(n->bar.cap)) {
+        if (!NVME_CAP_PMRS(cap)) {
             return;
         }
 
-        n->bar.pmrmscl = data & 0xffffffff;
+        pmrmscl = data & 0xffffffff;
+        n->bar.pmrmscl = cpu_to_le32(pmrmscl);
         n->pmr.cmse = false;
 
-        if (NVME_PMRMSCL_CMSE(n->bar.pmrmscl)) {
-            hwaddr cba = n->bar.pmrmscu |
-                (NVME_PMRMSCL_CBA(n->bar.pmrmscl) << PMRMSCL_CBA_SHIFT);
+        if (NVME_PMRMSCL_CMSE(data)) {
+            hwaddr cba = pmrmscu |
+                (NVME_PMRMSCL_CBA(pmrmscl) << PMRMSCL_CBA_SHIFT);
             if (cba + int128_get64(n->pmr.dev->mr.size) < cba) {
-                NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 1);
+                NVME_PMRSTS_SET_CBAI(pmrsts, 1);
+                n->bar.pmrsts = cpu_to_le32(pmrsts);
                 return;
             }
 
@@ -5933,11 +5973,11 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
 
         return;
     case NVME_REG_PMRMSCU:
-        if (!NVME_CAP_PMRS(n->bar.cap)) {
+        if (!NVME_CAP_PMRS(cap)) {
             return;
         }
 
-        n->bar.pmrmscu = data & 0xffffffff;
+        n->bar.pmrmscu = cpu_to_le32(data & 0xffffffff);
         return;
     default:
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_invalid,
@@ -5952,7 +5992,6 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
 {
     NvmeCtrl *n = (NvmeCtrl *)opaque;
     uint8_t *ptr = (uint8_t *)&n->bar;
-    uint64_t val = 0;
 
     trace_pci_nvme_mmio_read(addr, size);
 
@@ -5982,13 +6021,11 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
      * made it to persistent media
      */
     if (addr == NVME_REG_PMRSTS &&
-        (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
+        (NVME_PMRCAP_PMRWBM(le32_to_cpu(n->bar.pmrcap)) & 0x02)) {
         memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
     }
 
-    memcpy(&val, ptr + addr, size);
-
-    return val;
+    return ldn_le_p(ptr + addr, size);
 }
 
 static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
@@ -6246,6 +6283,7 @@ static void nvme_init_state(NvmeCtrl *n)
 static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 {
     uint64_t cmb_size = n->params.cmb_size_mb * MiB;
+    uint64_t cap = le64_to_cpu(n->bar.cap);
 
     n->cmb.buf = g_malloc0(cmb_size);
     memory_region_init_io(&n->cmb.mem, OBJECT(n), &nvme_cmb_ops, n,
@@ -6255,7 +6293,8 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
                      PCI_BASE_ADDRESS_MEM_TYPE_64 |
                      PCI_BASE_ADDRESS_MEM_PREFETCH, &n->cmb.mem);
 
-    NVME_CAP_SET_CMBS(n->bar.cap, 1);
+    NVME_CAP_SET_CMBS(cap, 1);
+    n->bar.cap = cpu_to_le64(cap);
 
     if (n->params.legacy_cmb) {
         nvme_cmb_enable_regs(n);
@@ -6265,14 +6304,17 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 
 static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
 {
-    NVME_PMRCAP_SET_RDS(n->bar.pmrcap, 1);
-    NVME_PMRCAP_SET_WDS(n->bar.pmrcap, 1);
-    NVME_PMRCAP_SET_BIR(n->bar.pmrcap, NVME_PMR_BIR);
-    /* Turn on bit 1 support */
-    NVME_PMRCAP_SET_PMRWBM(n->bar.pmrcap, 0x02);
-    NVME_PMRCAP_SET_CMSS(n->bar.pmrcap, 1);
+    uint32_t pmrcap = 0;
 
-    pci_register_bar(pci_dev, NVME_PMRCAP_BIR(n->bar.pmrcap),
+    NVME_PMRCAP_SET_RDS(pmrcap, 1);
+    NVME_PMRCAP_SET_WDS(pmrcap, 1);
+    NVME_PMRCAP_SET_BIR(pmrcap, NVME_PMR_BIR);
+    /* Turn on bit 1 support */
+    NVME_PMRCAP_SET_PMRWBM(pmrcap, 0x02);
+    NVME_PMRCAP_SET_CMSS(pmrcap, 1);
+    n->bar.pmrcap = cpu_to_le32(pmrcap);
+
+    pci_register_bar(pci_dev, NVME_PMR_BIR,
                      PCI_BASE_ADDRESS_SPACE_MEMORY |
                      PCI_BASE_ADDRESS_MEM_TYPE_64 |
                      PCI_BASE_ADDRESS_MEM_PREFETCH, &n->pmr.dev->mr);
@@ -6362,6 +6404,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 {
     NvmeIdCtrl *id = &n->id_ctrl;
     uint8_t *pci_conf = pci_dev->config;
+    uint64_t cap = 0;
 
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
@@ -6440,17 +6483,18 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
         id->cmic |= NVME_CMIC_MULTI_CTRL;
     }
 
-    NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
-    NVME_CAP_SET_CQR(n->bar.cap, 1);
-    NVME_CAP_SET_TO(n->bar.cap, 0xf);
-    NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_NVM);
-    NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_CSI_SUPP);
-    NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_ADMIN_ONLY);
-    NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
-    NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
-    NVME_CAP_SET_PMRS(n->bar.cap, n->pmr.dev ? 1 : 0);
+    NVME_CAP_SET_MQES(cap, 0x7ff);
+    NVME_CAP_SET_CQR(cap, 1);
+    NVME_CAP_SET_TO(cap, 0xf);
+    NVME_CAP_SET_CSS(cap, NVME_CAP_CSS_NVM);
+    NVME_CAP_SET_CSS(cap, NVME_CAP_CSS_CSI_SUPP);
+    NVME_CAP_SET_CSS(cap, NVME_CAP_CSS_ADMIN_ONLY);
+    NVME_CAP_SET_MPSMAX(cap, 4);
+    NVME_CAP_SET_CMBS(cap, n->params.cmb_size_mb ? 1 : 0);
+    NVME_CAP_SET_PMRS(cap, n->pmr.dev ? 1 : 0);
+    n->bar.cap = cpu_to_le64(cap);
 
-    n->bar.vs = NVME_SPEC_VER;
+    n->bar.vs = cpu_to_le32(NVME_SPEC_VER);
     n->bar.intmc = n->bar.intms = 0;
 }
 
@@ -6601,7 +6645,7 @@ static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *name,
 
     cap = NVME_SMART_SPARE | NVME_SMART_TEMPERATURE | NVME_SMART_RELIABILITY
           | NVME_SMART_MEDIA_READ_ONLY | NVME_SMART_FAILED_VOLATILE_MEDIA;
-    if (NVME_CAP_PMRS(n->bar.cap)) {
+    if (NVME_CAP_PMRS(le64_to_cpu(n->bar.cap))) {
         cap |= NVME_SMART_PMR_UNRELIABLE;
     }
 
-- 
2.32.0


