Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D320A2DE063
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 10:28:09 +0100 (CET)
Received: from localhost ([::1]:35568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqC3U-0007Ns-OU
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 04:28:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqByy-0005Tz-9Q; Fri, 18 Dec 2020 04:23:28 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:57409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqByt-0002ZQ-1Q; Fri, 18 Dec 2020 04:23:28 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0662C5C00EC;
 Fri, 18 Dec 2020 04:23:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 18 Dec 2020 04:23:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=xBRitQgbMhXEE
 XuHrb3Qdz6CEIxKB9P1+xT6yFKzfnk=; b=XE4epYwg/nYzPcKXGLiy3FZnSuzqH
 n3X94Y+uwAMs+bHnbQCAl5X8dbG/k7onRQCxMYjd3N5uLy2DaOXLaU/YxgFl/ven
 KUOGB51NAezClN8L62MbGpx7XvB5hlNC02YF6va8mBOKki6+HQ60Wg8wQGkgjcP3
 Bz3t0xaI4otLcCFL2gAIEjASEes7PaTk4L0qgTkdNGiIANqlDiKdFJVs/GS1c1x4
 /0FbSm52y7zMrXjn/bATtyXvigBAOnzo3jq+T4cB3rzsZG/AHo9O4+grmec7pFG+
 YQ2ZsCvY9g9JGlUlJOLmAkcJvPwP3+QiYUj92NM+1pr5CLBydsftUamfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=xBRitQgbMhXEEXuHrb3Qdz6CEIxKB9P1+xT6yFKzfnk=; b=BFhH+xDh
 nl4gTsa+2gz6iv/3Ki1nkrbzympPDMT2yVe0XfC9/H9FkcZ1c8GZDBhrEe+ZDyGT
 YuSXYoHn4KgyXETiAR6IWmWVewto+rBKyfQUr7v43lb1SoQAadurSsLf8lCvfcmF
 LvEk9EzQhsPi+zwMeUQPkXXZ6ftP+mU7GEJtWEtFaUy3J3p/xcBMQrlwVbRjFOgr
 keSUq5pXGGbgnnXJqAGGgxFoOVUhLjX/T94zj2SnpRCvZWV9TyQN1I+Wg7Escv5+
 6O6CxM8tHJplN3R8wtYUAfsYH0mhTss8qffIaxUPZao+xTUrU+RuK/JfDQJscgdB
 u+vos51Go7GhqQ==
X-ME-Sender: <xms:CXXcXwhoD_DWb6vEyKLY3Xe5eulb5MY6zB4vLHhKulZzZGip5zlimw>
 <xme:CXXcX5CXXC0lEdof4f6WnbxSrDaAqQvvtr5PmuuRUsWyxcaTOkguNqpWedPIRDCcV
 1R9aOby-8anb75xzGM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:CXXcX4FAuBA7xmzhSsCijsxm_QhIeDtvW247QgInD-OIcxTm9U171Q>
 <xmx:CXXcXxTJNkI8G6l-WAxV-dG5WOxpuFXZdKZyS_j7OAb0zJ_wMX3vWA>
 <xmx:CXXcX9xZr1wuO38EyzIjvF45wFk0Ro4A_T5z_dYkoyVp2ZU8lU8FPA>
 <xmx:CnXcX8wlW92KfOuQfMSihjXOghONcZlaNJsmi9vEz4Atejpk9Fz2MQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id A3C27108005F;
 Fri, 18 Dec 2020 04:23:19 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/block/nvme: cmb enhancements
Date: Fri, 18 Dec 2020 10:23:05 +0100
Message-Id: <20201218092308.894367-2-its@irrelevant.dk>
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
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>

Implement v1.4 logic for configuring the Controller Memory Buffer. The
x-legacy-cmb nvme device parameter can be set to revert to v1.3
behavior.

Signed-off-by: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h      |   1 +
 include/block/nvme.h | 106 +++++++++++++++++++++++++++++++++++++++----
 hw/block/nvme.c      |  86 ++++++++++++++++++++++++++++-------
 3 files changed, 167 insertions(+), 26 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 574333caa3f9..daeaa24eb2e4 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -16,6 +16,7 @@ typedef struct NvmeParams {
     uint32_t aer_max_queued;
     uint8_t  mdts;
     bool     use_intel_id;
+    bool     legacy_cmb;
 } NvmeParams;
 
 typedef struct NvmeAsyncEvent {
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 11ac1c2b7dfb..4700566a5017 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -15,7 +15,9 @@ typedef struct QEMU_PACKED NvmeBar {
     uint64_t    acq;
     uint32_t    cmbloc;
     uint32_t    cmbsz;
-    uint8_t     padding[3520]; /* not used by QEMU */
+    uint64_t    cmbmsc;
+    uint32_t    cmbsts;
+    uint8_t     padding[3508]; /* not used by QEMU */
     uint32_t    pmrcap;
     uint32_t    pmrctl;
     uint32_t    pmrsts;
@@ -36,6 +38,7 @@ enum NvmeCapShift {
     CAP_MPSMIN_SHIFT   = 48,
     CAP_MPSMAX_SHIFT   = 52,
     CAP_PMR_SHIFT      = 56,
+    CAP_CMBS_SHIFT     = 57,
 };
 
 enum NvmeCapMask {
@@ -49,6 +52,7 @@ enum NvmeCapMask {
     CAP_MPSMIN_MASK    = 0xf,
     CAP_MPSMAX_MASK    = 0xf,
     CAP_PMR_MASK       = 0x1,
+    CAP_CMBS_MASK      = 0x1,
 };
 
 #define NVME_CAP_MQES(cap)  (((cap) >> CAP_MQES_SHIFT)   & CAP_MQES_MASK)
@@ -60,6 +64,7 @@ enum NvmeCapMask {
 #define NVME_CAP_CSS(cap)   (((cap) >> CAP_CSS_SHIFT)    & CAP_CSS_MASK)
 #define NVME_CAP_MPSMIN(cap)(((cap) >> CAP_MPSMIN_SHIFT) & CAP_MPSMIN_MASK)
 #define NVME_CAP_MPSMAX(cap)(((cap) >> CAP_MPSMAX_SHIFT) & CAP_MPSMAX_MASK)
+#define NVME_CAP_CMBS(cap)  (((cap) >> CAP_CMBS_SHIFT)   & CAP_CMBS_MASK)
 
 #define NVME_CAP_SET_MQES(cap, val)   (cap |= (uint64_t)(val & CAP_MQES_MASK)  \
                                                            << CAP_MQES_SHIFT)
@@ -81,6 +86,8 @@ enum NvmeCapMask {
                                                             << CAP_MPSMAX_SHIFT)
 #define NVME_CAP_SET_PMRS(cap, val) (cap |= (uint64_t)(val & CAP_PMR_MASK)\
                                                             << CAP_PMR_SHIFT)
+#define NVME_CAP_SET_CMBS(cap, val)   (cap |= (uint64_t)(val & CAP_CMBS_MASK)\
+                                                            << CAP_CMBS_SHIFT)
 
 enum NvmeCapCss {
     NVME_CAP_CSS_NVM        = 1 << 0,
@@ -162,25 +169,64 @@ enum NvmeAqaMask {
 #define NVME_AQA_ACQS(aqa) ((aqa >> AQA_ACQS_SHIFT) & AQA_ACQS_MASK)
 
 enum NvmeCmblocShift {
-    CMBLOC_BIR_SHIFT  = 0,
-    CMBLOC_OFST_SHIFT = 12,
+    CMBLOC_BIR_SHIFT     = 0,
+    CMBLOC_CQMMS_SHIFT   = 3,
+    CMBLOC_CQPDS_SHIFT   = 4,
+    CMBLOC_CDPMLS_SHIFT  = 5,
+    CMBLOC_CDPCILS_SHIFT = 6,
+    CMBLOC_CDMMMS_SHIFT  = 7,
+    CMBLOC_CQDA_SHIFT    = 8,
+    CMBLOC_OFST_SHIFT    = 12,
 };
 
 enum NvmeCmblocMask {
-    CMBLOC_BIR_MASK  = 0x7,
-    CMBLOC_OFST_MASK = 0xfffff,
+    CMBLOC_BIR_MASK     = 0x7,
+    CMBLOC_CQMMS_MASK   = 0x1,
+    CMBLOC_CQPDS_MASK   = 0x1,
+    CMBLOC_CDPMLS_MASK  = 0x1,
+    CMBLOC_CDPCILS_MASK = 0x1,
+    CMBLOC_CDMMMS_MASK  = 0x1,
+    CMBLOC_CQDA_MASK    = 0x1,
+    CMBLOC_OFST_MASK    = 0xfffff,
 };
 
-#define NVME_CMBLOC_BIR(cmbloc) ((cmbloc >> CMBLOC_BIR_SHIFT)  & \
-                                 CMBLOC_BIR_MASK)
-#define NVME_CMBLOC_OFST(cmbloc)((cmbloc >> CMBLOC_OFST_SHIFT) & \
-                                 CMBLOC_OFST_MASK)
+#define NVME_CMBLOC_BIR(cmbloc) \
+    ((cmbloc >> CMBLOC_BIR_SHIFT) & CMBLOC_BIR_MASK)
+#define NVME_CMBLOC_CQMMS(cmbloc) \
+    ((cmbloc >> CMBLOC_CQMMS_SHIFT) & CMBLOC_CQMMS_MASK)
+#define NVME_CMBLOC_CQPDS(cmbloc) \
+    ((cmbloc >> CMBLOC_CQPDS_SHIFT) & CMBLOC_CQPDS_MASK)
+#define NVME_CMBLOC_CDPMLS(cmbloc) \
+    ((cmbloc >> CMBLOC_CDPMLS_SHIFT) & CMBLOC_CDPMLS_MASK)
+#define NVME_CMBLOC_CDPCILS(cmbloc) \
+    ((cmbloc >> CMBLOC_CDPCILS_SHIFT) & CMBLOC_CDPCILS_MASK)
+#define NVME_CMBLOC_CDMMMS(cmbloc) \
+    ((cmbloc >> CMBLOC_CDMMMS_SHIFT) & CMBLOC_CDMMMS_MASK)
+#define NVME_CMBLOC_CQDA(cmbloc) \
+    ((cmbloc >> CMBLOC_CQDA_SHIFT) & CMBLOC_CQDA_MASK)
+#define NVME_CMBLOC_OFST(cmbloc) \
+    ((cmbloc >> CMBLOC_OFST_SHIFT) & CMBLOC_OFST_MASK)
 
-#define NVME_CMBLOC_SET_BIR(cmbloc, val)  \
+#define NVME_CMBLOC_SET_BIR(cmbloc, val) \
     (cmbloc |= (uint64_t)(val & CMBLOC_BIR_MASK) << CMBLOC_BIR_SHIFT)
+#define NVME_CMBLOC_SET_CQMMS(cmbloc, val) \
+    (cmbloc |= (uint64_t)(val & CMBLOC_CQMMS_MASK) << CMBLOC_CQMMS_SHIFT)
+#define NVME_CMBLOC_SET_CQPDS(cmbloc, val) \
+    (cmbloc |= (uint64_t)(val & CMBLOC_CQPDS_MASK) << CMBLOC_CQPDS_SHIFT)
+#define NVME_CMBLOC_SET_CDPMLS(cmbloc, val) \
+    (cmbloc |= (uint64_t)(val & CMBLOC_CDPMLS_MASK) << CMBLOC_CDPMLS_SHIFT)
+#define NVME_CMBLOC_SET_CDPCILS(cmbloc, val) \
+    (cmbloc |= (uint64_t)(val & CMBLOC_CDPCILS_MASK) << CMBLOC_CDPCILS_SHIFT)
+#define NVME_CMBLOC_SET_CDMMMS(cmbloc, val) \
+    (cmbloc |= (uint64_t)(val & CMBLOC_CDMMMS_MASK) << CMBLOC_CDMMMS_SHIFT)
+#define NVME_CMBLOC_SET_CQDA(cmbloc, val) \
+    (cmbloc |= (uint64_t)(val & CMBLOC_CQDA_MASK) << CMBLOC_CQDA_SHIFT)
 #define NVME_CMBLOC_SET_OFST(cmbloc, val) \
     (cmbloc |= (uint64_t)(val & CMBLOC_OFST_MASK) << CMBLOC_OFST_SHIFT)
 
+#define NVME_CMBMSMC_SET_CRE (cmbmsc, val) \
+    (cmbmsc |= (uint64_t)(val & CMBLOC_OFST_MASK) << CMBMSC_CRE_SHIFT)
+
 enum NvmeCmbszShift {
     CMBSZ_SQS_SHIFT   = 0,
     CMBSZ_CQS_SHIFT   = 1,
@@ -227,6 +273,46 @@ enum NvmeCmbszMask {
 #define NVME_CMBSZ_GETSIZE(cmbsz) \
     (NVME_CMBSZ_SZ(cmbsz) * (1 << (12 + 4 * NVME_CMBSZ_SZU(cmbsz))))
 
+enum NvmeCmbmscShift {
+    CMBMSC_CRE_SHIFT  = 0,
+    CMBMSC_CMSE_SHIFT = 1,
+    CMBMSC_CBA_SHIFT  = 12,
+};
+
+enum NvmeCmbmscMask {
+    CMBMSC_CRE_MASK  = 0x1,
+    CMBMSC_CMSE_MASK = 0x1,
+    CMBMSC_CBA_MASK   = ((1L << 52) - 1),
+};
+
+#define NVME_CMBMSC_CRE(cmbmsc) \
+    ((cmbmsc >> CMBMSC_CRE_SHIFT)  & CMBMSC_CRE_MASK)
+#define NVME_CMBMSC_CMSE(cmbmsc) \
+    ((cmbmsc >> CMBMSC_CMSE_SHIFT) & CMBMSC_CMSE_MASK)
+#define NVME_CMBMSC_CBA(cmbmsc) \
+    ((cmbmsc >> CMBMSC_CBA_SHIFT) & CMBMSC_CBA_MASK)
+
+
+#define NVME_CMBMSC_SET_CRE(cmbmsc, val)  \
+    (cmbmsc |= (uint64_t)(val & CMBMSC_CRE_MASK) << CMBMSC_CRE_SHIFT)
+#define NVME_CMBMSC_SET_CMSE(cmbmsc, val) \
+    (cmbmsc |= (uint64_t)(val & CMBMSC_CMSE_MASK) << CMBMSC_CMSE_SHIFT)
+#define NVME_CMBMSC_SET_CBA(cmbmsc, val) \
+    (cmbmsc |= (uint64_t)(val & CMBMSC_CBA_MASK) << CMBMSC_CBA_SHIFT)
+
+enum NvmeCmbstsShift {
+    CMBSTS_CBAI_SHIFT = 0,
+};
+enum NvmeCmbstsMask {
+    CMBSTS_CBAI_MASK = 0x1,
+};
+
+#define NVME_CMBSTS_CBAI(cmbsts) \
+    ((cmbsts >> CMBSTS_CBAI_SHIFT) & CMBSTS_CBAI_MASK)
+
+#define NVME_CMBSTS_SET_CBAI(cmbsts, val)  \
+    (cmbsts |= (uint64_t)(val & CMBSTS_CBAI_MASK) << CMBSTS_CBAI_SHIFT)
+
 enum NvmePmrcapShift {
     PMRCAP_RDS_SHIFT      = 3,
     PMRCAP_WDS_SHIFT      = 4,
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 28416b18a5c0..f3c111ee0a5c 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -130,17 +130,32 @@ static uint16_t nvme_sqid(NvmeRequest *req)
 
 static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
 {
-    hwaddr low = n->ctrl_mem.addr;
-    hwaddr hi  = n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size);
+    hwaddr hi, low;
+
+    if (n->params.legacy_cmb) {
+        low = n->ctrl_mem.addr;
+    } else {
+        low = NVME_CMBMSC_CBA(n->bar.cmbmsc) << CMBMSC_CBA_SHIFT;
+    }
+
+    hi = low + int128_get64(n->ctrl_mem.size);
 
     return addr >= low && addr < hi;
 }
 
 static inline void *nvme_addr_to_cmb(NvmeCtrl *n, hwaddr addr)
 {
+    hwaddr cba;
+
     assert(nvme_addr_is_cmb(n, addr));
 
-    return &n->cmbuf[addr - n->ctrl_mem.addr];
+    if (n->params.legacy_cmb) {
+        cba = n->ctrl_mem.addr;
+    } else {
+        cba = NVME_CMBMSC_CBA(n->bar.cmbmsc) << CMBMSC_CBA_SHIFT;
+    }
+
+    return &n->cmbuf[addr - cba];
 }
 
 static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
@@ -2411,6 +2426,19 @@ static int nvme_start_ctrl(NvmeCtrl *n)
     return 0;
 }
 
+static void nvme_cmb_enable_regs(NvmeCtrl *n)
+{
+    NVME_CMBLOC_SET_BIR(n->bar.cmbloc, NVME_CMB_BIR);
+
+    NVME_CMBSZ_SET_SQS(n->bar.cmbsz, 1);
+    NVME_CMBSZ_SET_CQS(n->bar.cmbsz, 0);
+    NVME_CMBSZ_SET_LISTS(n->bar.cmbsz, 1);
+    NVME_CMBSZ_SET_RDS(n->bar.cmbsz, 1);
+    NVME_CMBSZ_SET_WDS(n->bar.cmbsz, 1);
+    NVME_CMBSZ_SET_SZU(n->bar.cmbsz, 2); /* MBs */
+    NVME_CMBSZ_SET_SZ(n->bar.cmbsz, n->params.cmb_size_mb);
+}
+
 static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
                            unsigned size)
 {
@@ -2536,6 +2564,34 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_cmbsz_readonly,
                        "invalid write to read only CMBSZ, ignored");
         return;
+    case 0x50:  /* CMBMSC */
+        exit(1);
+        if (!NVME_CAP_CMBS(n->bar.cap)) {
+            return;
+        }
+
+        n->bar.cmbmsc = data;
+
+        if (NVME_CMBMSC_CRE(data)) {
+            nvme_cmb_enable_regs(n);
+
+            if (NVME_CMBMSC_CMSE(data)) {
+                hwaddr cba = NVME_CMBMSC_CBA(data) << CMBMSC_CBA_SHIFT;
+                if (cba + int128_get64(n->ctrl_mem.size) < cba) {
+                    NVME_CMBSTS_SET_CBAI(n->bar.cmbsts, 1);
+                    return;
+                }
+            }
+        } else if (!NVME_CMBMSC_CRE(data)) {
+            n->bar.cmbsz = 0;
+            n->bar.cmbloc = 0;
+        }
+
+        return;
+    case 0x54:  /* CMBMSC hi */
+        n->bar.cmbmsc |= data << 32;
+        return;
+
     case 0xE00: /* PMRCAP */
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrcap_readonly,
                        "invalid write to PMRCAP register, ignored");
@@ -2880,24 +2936,21 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 
 static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 {
-    NVME_CMBLOC_SET_BIR(n->bar.cmbloc, NVME_CMB_BIR);
-    NVME_CMBLOC_SET_OFST(n->bar.cmbloc, 0);
+    uint64_t cmb_size = n->params.cmb_size_mb * MiB;
 
-    NVME_CMBSZ_SET_SQS(n->bar.cmbsz, 1);
-    NVME_CMBSZ_SET_CQS(n->bar.cmbsz, 0);
-    NVME_CMBSZ_SET_LISTS(n->bar.cmbsz, 1);
-    NVME_CMBSZ_SET_RDS(n->bar.cmbsz, 1);
-    NVME_CMBSZ_SET_WDS(n->bar.cmbsz, 1);
-    NVME_CMBSZ_SET_SZU(n->bar.cmbsz, 2); /* MBs */
-    NVME_CMBSZ_SET_SZ(n->bar.cmbsz, n->params.cmb_size_mb);
-
-    n->cmbuf = g_malloc0(NVME_CMBSZ_GETSIZE(n->bar.cmbsz));
+    n->cmbuf = g_malloc0(cmb_size);
     memory_region_init_io(&n->ctrl_mem, OBJECT(n), &nvme_cmb_ops, n,
-                          "nvme-cmb", NVME_CMBSZ_GETSIZE(n->bar.cmbsz));
-    pci_register_bar(pci_dev, NVME_CMBLOC_BIR(n->bar.cmbloc),
+                          "nvme-cmb", cmb_size);
+    pci_register_bar(pci_dev, NVME_CMB_BIR,
                      PCI_BASE_ADDRESS_SPACE_MEMORY |
                      PCI_BASE_ADDRESS_MEM_TYPE_64 |
                      PCI_BASE_ADDRESS_MEM_PREFETCH, &n->ctrl_mem);
+
+    if (n->params.legacy_cmb) {
+        nvme_cmb_enable_regs(n);
+    } else {
+        NVME_CAP_SET_CMBS(n->bar.cap, 1);
+    }
 }
 
 static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
@@ -3118,6 +3171,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT32("aer_max_queued", NvmeCtrl, params.aer_max_queued, 64),
     DEFINE_PROP_UINT8("mdts", NvmeCtrl, params.mdts, 7),
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
+    DEFINE_PROP_BOOL("x-legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.29.2


