Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6487C336C79
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 07:51:19 +0100 (CET)
Received: from localhost ([::1]:47762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKFAE-000803-85
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 01:51:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lKEyN-0005iG-RW; Thu, 11 Mar 2021 01:39:03 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:49783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lKEyJ-0008BW-Ba; Thu, 11 Mar 2021 01:39:02 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C181A5C00A7;
 Thu, 11 Mar 2021 01:38:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 11 Mar 2021 01:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=qqYFSI8mwDYOx
 SJ+iJlBUmBMEirl5i8ijNKPETsNelg=; b=VNnsHe0n6XGHkLmTi2+DlUiyq7FAT
 1pvNM8eXCQWQ0SXgQQQ0I1LFxRhi1pPK8gQIj65T9PD4Yz0saLq/Wouf31meTq24
 0fUjhngqir9qJwYMFBUvDqKE8m7r1KSmUXJ3d8fNWxRz+ndvTkA8IHIm2jM5DaEi
 F6xurhKYp4y8YSrmPBZzfZ+7CEnbXm1etsJ7cFVLEJLih2FacISLUAso7UNJ9oXE
 S1FwN+sR3QUdLV1AG54PKigTPQw+8Qi10P5OoRBLWOEeUqjDoethXzq31KZu8ixG
 9nTjk0V6NIu6/CEaBpyvUFDFImEEmyv8YBxze3FFGfoXyc8oqF3cfnwzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=qqYFSI8mwDYOxSJ+iJlBUmBMEirl5i8ijNKPETsNelg=; b=PVLQavrP
 8rwKRbU5XgJKWpHv4QVlkqdpBPXaYsMjIinNLe96lVBkyxQQJxGAybbhb251+afQ
 2aa5T5FQSO2YuwbV2m+VZZOk5vwzmEGMODFUaUH5rocB7ZEik6Kkt1M85CHIZ7mm
 c2lHI+v7c336NVGxoSkbq+ftiCcZQ95HQwSdcNvUTk/MCYz/B1WsoAeiM1nvQwc9
 WxirGWfli66KEQaDdwVaxsWUYZ98j4W5d39dXc7PYewnokRkiNGwRVoY6ww9bVC5
 FNDCExDTaoSG2gCo93kvlReqS28zmI9YaFr3vy9Acmh/HWegLDIUxWGcCCoqKsHT
 Nq7STBuCvR9vOQ==
X-ME-Sender: <xms:_7pJYF-LJ6YmfH6DtZsBc_dvqIBKjAZFw840QWC9_3rX0j0mJxjJAg>
 <xme:_7pJYBKpc9Vds9xCG341OFjURJDIfbfTJ8_SsqCvfQMYBtjxjnAqg3A9WQjanCOIL
 yvGmK0r4SY0VwobDKo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:_7pJYAYxO3mSgUyj6dyjyWTbZ4Bh4y54ufx0wkm6IAyCksPAoh2UCw>
 <xmx:_7pJYDLHkRpeNm4uHu2_WX_y6aRNvpKAX_N0LROpygf9mLpXxpcukQ>
 <xmx:_7pJYOA3grHSeMmwYXIaOLoRq3nxl658NMEjS4VcLCyG7PZ4TqqC1Q>
 <xmx:_7pJYHmzvwQs_nR1-pzQlPVZW8knxvG_XBkB3WIAaIxDQushh4NNEw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id DE39C108005F;
 Thu, 11 Mar 2021 01:38:53 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/block/nvme: add oncs device parameter
Date: Thu, 11 Mar 2021 07:38:49 +0100
Message-Id: <20210311063851.757481-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311063851.757481-1-its@irrelevant.dk>
References: <20210311063851.757481-1-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Add the 'oncs' nvme device parameter to allow optional features to be
enabled/disabled explicitly. Since most of these are optional commands,
make the CSE log pages dynamic to account for the value of ONCS.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h |   7 ++++
 hw/block/nvme.c | 101 ++++++++++++++++++++++++++++++++----------------
 2 files changed, 74 insertions(+), 34 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 4955d649c7d4..65c80cfaef62 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -9,6 +9,7 @@
 
 #define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
 #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
+#define NVME_MAX_COMMANDS 0x100
 
 /*
  * Subsystem namespace list for allocated namespaces should be larger than
@@ -28,6 +29,7 @@ typedef struct NvmeParams {
     bool     use_intel_id;
     uint8_t  zasl;
     bool     legacy_cmb;
+    uint16_t oncs;
 } NvmeParams;
 
 typedef struct NvmeAsyncEvent {
@@ -210,6 +212,11 @@ typedef struct NvmeCtrl {
     NvmeCQueue      admin_cq;
     NvmeIdCtrl      id_ctrl;
     NvmeFeatureVal  features;
+
+    struct {
+        uint32_t nvm[NVME_MAX_COMMANDS];
+        uint32_t zoned[NVME_MAX_COMMANDS];
+    } iocs;
 } NvmeCtrl;
 
 static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d439e44db839..fbb578a6e669 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -84,6 +84,11 @@
  *   the minimum memory page size (CAP.MPSMIN). The default value is 0 (i.e.
  *   defaulting to the value of `mdts`).
  *
+ * - `oncs`
+ *   This field indicates the optional NVM commands and features supported
+ *   by the controller. To add support for the optional feature, needs to
+ *   set the corresponding support indicated bit.
+ *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  * - `subsys`
@@ -185,7 +190,7 @@ static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
     [NVME_TIMESTAMP]                = NVME_FEAT_CAP_CHANGE,
 };
 
-static const uint32_t nvme_cse_acs[256] = {
+static const uint32_t nvme_cse_acs[NVME_MAX_COMMANDS] = {
     [NVME_ADM_CMD_DELETE_SQ]        = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_CREATE_SQ]        = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_GET_LOG_PAGE]     = NVME_CMD_EFF_CSUPP,
@@ -199,30 +204,7 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_NS_ATTACHMENT]    = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,
 };
 
-static const uint32_t nvme_cse_iocs_none[256];
-
-static const uint32_t nvme_cse_iocs_nvm[256] = {
-    [NVME_CMD_FLUSH]                = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
-    [NVME_CMD_WRITE_ZEROES]         = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
-    [NVME_CMD_WRITE]                = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
-    [NVME_CMD_READ]                 = NVME_CMD_EFF_CSUPP,
-    [NVME_CMD_DSM]                  = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
-    [NVME_CMD_COPY]                 = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
-    [NVME_CMD_COMPARE]              = NVME_CMD_EFF_CSUPP,
-};
-
-static const uint32_t nvme_cse_iocs_zoned[256] = {
-    [NVME_CMD_FLUSH]                = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
-    [NVME_CMD_WRITE_ZEROES]         = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
-    [NVME_CMD_WRITE]                = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
-    [NVME_CMD_READ]                 = NVME_CMD_EFF_CSUPP,
-    [NVME_CMD_DSM]                  = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
-    [NVME_CMD_COPY]                 = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
-    [NVME_CMD_COMPARE]              = NVME_CMD_EFF_CSUPP,
-    [NVME_CMD_ZONE_APPEND]          = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
-    [NVME_CMD_ZONE_MGMT_SEND]       = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
-    [NVME_CMD_ZONE_MGMT_RECV]       = NVME_CMD_EFF_CSUPP,
-};
+static const uint32_t nvme_cse_iocs_none[NVME_MAX_COMMANDS];
 
 static void nvme_process_sq(void *opaque);
 
@@ -3071,17 +3053,17 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
 
     switch (NVME_CC_CSS(n->bar.cc)) {
     case NVME_CC_CSS_NVM:
-        src_iocs = nvme_cse_iocs_nvm;
+        src_iocs = n->iocs.nvm;
         /* fall through */
     case NVME_CC_CSS_ADMIN_ONLY:
         break;
     case NVME_CC_CSS_CSI:
         switch (csi) {
         case NVME_CSI_NVM:
-            src_iocs = nvme_cse_iocs_nvm;
+            src_iocs = n->iocs.nvm;
             break;
         case NVME_CSI_ZONED:
-            src_iocs = nvme_cse_iocs_zoned;
+            src_iocs = n->iocs.zoned;
             break;
         }
     }
@@ -3684,6 +3666,10 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
+    if (!(le16_to_cpu(n->id_ctrl.oncs) & NVME_ONCS_FEATURES) && sel) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
     if (nvme_feature_cap[fid] & NVME_FEAT_CAP_NS) {
         if (!nvme_nsid_valid(n, nsid) || nsid == NVME_NSID_BROADCAST) {
             /*
@@ -3766,6 +3752,9 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
         result = n->features.async_config;
         goto out;
     case NVME_TIMESTAMP:
+        if (!(le16_to_cpu(n->id_ctrl.oncs) & NVME_ONCS_TIMESTAMP)) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
         return nvme_get_feature_timestamp(n, req);
     default:
         break;
@@ -3843,6 +3832,10 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
 
     trace_pci_nvme_setfeat(nvme_cid(req), nsid, fid, save, dw11);
 
+    if (save && !(le16_to_cpu(n->id_ctrl.oncs) & NVME_ONCS_FEATURES)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
     if (save && !(nvme_feature_cap[fid] & NVME_FEAT_CAP_SAVE)) {
         return NVME_FID_NOT_SAVEABLE | NVME_DNR;
     }
@@ -3959,6 +3952,9 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
         n->features.async_config = dw11;
         break;
     case NVME_TIMESTAMP:
+        if (!(le16_to_cpu(n->id_ctrl.oncs) & NVME_ONCS_TIMESTAMP)) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
         return nvme_set_feature_timestamp(n, req);
     case NVME_COMMAND_SET_PROFILE:
         if (dw11 & 0x1ff) {
@@ -4201,14 +4197,14 @@ static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns)
     switch (ns->csi) {
     case NVME_CSI_NVM:
         if (NVME_CC_CSS(n->bar.cc) != NVME_CC_CSS_ADMIN_ONLY) {
-            ns->iocs = nvme_cse_iocs_nvm;
+            ns->iocs = n->iocs.nvm;
         }
         break;
     case NVME_CSI_ZONED:
         if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_CSI) {
-            ns->iocs = nvme_cse_iocs_zoned;
+            ns->iocs = n->iocs.zoned;
         } else if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_NVM) {
-            ns->iocs = nvme_cse_iocs_nvm;
+            ns->iocs = n->iocs.nvm;
         }
         break;
     }
@@ -4838,6 +4834,40 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
     }
 }
 
+static void nvme_init_cse_iocs(NvmeCtrl *n)
+{
+    uint16_t oncs = n->params.oncs;
+
+    n->iocs.nvm[NVME_CMD_FLUSH] = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC;
+    n->iocs.nvm[NVME_CMD_WRITE] = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC;
+    n->iocs.nvm[NVME_CMD_READ]  = NVME_CMD_EFF_CSUPP;
+
+    if (oncs & NVME_ONCS_WRITE_ZEROES) {
+        n->iocs.nvm[NVME_CMD_WRITE_ZEROES] = NVME_CMD_EFF_CSUPP |
+            NVME_CMD_EFF_LBCC;
+    }
+
+    if (oncs & NVME_ONCS_COMPARE) {
+        n->iocs.nvm[NVME_CMD_COMPARE] = NVME_CMD_EFF_CSUPP;
+    }
+
+    if (oncs & NVME_ONCS_DSM) {
+        n->iocs.nvm[NVME_CMD_DSM] = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC;
+    }
+
+    if (oncs & NVME_ONCS_COPY) {
+        n->iocs.nvm[NVME_CMD_COPY] = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC;
+    }
+
+    memcpy(n->iocs.zoned, n->iocs.nvm, sizeof(n->iocs.nvm));
+
+    n->iocs.zoned[NVME_CMD_ZONE_APPEND] = NVME_CMD_EFF_CSUPP |
+        NVME_CMD_EFF_LBCC;
+    n->iocs.zoned[NVME_CMD_ZONE_MGMT_SEND] = NVME_CMD_EFF_CSUPP |
+        NVME_CMD_EFF_LBCC;
+    n->iocs.zoned[NVME_CMD_ZONE_MGMT_RECV] = NVME_CMD_EFF_CSUPP;
+}
+
 static void nvme_init_state(NvmeCtrl *n)
 {
     n->num_namespaces = NVME_MAX_NAMESPACES;
@@ -4850,6 +4880,8 @@ static void nvme_init_state(NvmeCtrl *n)
     n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
+
+    nvme_init_cse_iocs(n);
 }
 
 static int nvme_attach_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
@@ -5091,9 +5123,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->sqes = (0x6 << 4) | 0x6;
     id->cqes = (0x4 << 4) | 0x4;
     id->nn = cpu_to_le32(n->num_namespaces);
-    id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROES | NVME_ONCS_TIMESTAMP |
-                           NVME_ONCS_FEATURES | NVME_ONCS_DSM |
-                           NVME_ONCS_COMPARE | NVME_ONCS_COPY);
+    id->oncs = cpu_to_le16(n->params.oncs);
 
     /*
      * NOTE: If this device ever supports a command set that does NOT use 0x0
@@ -5239,6 +5269,9 @@ static Property nvme_props[] = {
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
+    DEFINE_PROP_UINT16("oncs", NvmeCtrl, params.oncs, NVME_ONCS_WRITE_ZEROES |
+                       NVME_ONCS_TIMESTAMP | NVME_ONCS_DSM |
+                       NVME_ONCS_COMPARE | NVME_ONCS_FEATURES | NVME_ONCS_COPY),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.30.1


