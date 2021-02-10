Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D14315FE0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 08:12:56 +0100 (CET)
Received: from localhost ([::1]:48540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9jgD-00080A-Lp
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 02:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9jaT-0006aB-Ti; Wed, 10 Feb 2021 02:06:59 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:49695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9jaQ-00039V-PQ; Wed, 10 Feb 2021 02:06:57 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 541BAC0C;
 Wed, 10 Feb 2021 02:06:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 10 Feb 2021 02:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=KF8rzgGk4n3EK
 RjtZZKcvBBD3kaplxgriNHq5Zr6fsg=; b=LDgY0nuehJSe3aCi6OTd9OZSjByMZ
 FyYtn+mhie/msBvT8XZozzTYQ4QbVyGJ5Q+caIa48IQSnKWgDcWUh5+krf8u0/nZ
 tmfHXkAOlznshigX9npv9mTtq4q/uchywcV/UI4gPqXSW7nPJzuW6v7DcRtKg7fZ
 YICRzKU3MqZYGQeiOX29gcPGjoT4JZg1GkHYrvkX9lgDaL2PXnNwUIgCHMc7E5EG
 rw7o0ZvpiwC5h6EhvlkuGCCby2eJ+3gR9XqaY4IvlkqL3VvrXkdvleF79zu5sgJ7
 1hszL2KIqvHJTSvur3A4NWuYVB62fLSsr+AWwbXjL9CBr7BkQNkZ4ZeLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=KF8rzgGk4n3EKRjtZZKcvBBD3kaplxgriNHq5Zr6fsg=; b=R4rEe2bQ
 uMBdwyYLQf3KTtxWZr6WthvRv/fCiOqn6noYo8CUFziRCWZYhoeDGcfuEeI9sBLu
 fa0GMzP4q+wl3RAn9GW9CVhTo1c6b1gKGelBBU/kmUJZn2wp6eFrW71O5McIBlin
 a9fWaFVCNH2iUTFxXTrEJ27PfrOE3kJ+hRksv3O2a4VzGCjdEys0BdgXD83wTxic
 bg6e4TQlzYdKZW7EJGmB75PfpvRpx3j2mLGHaMZnImJILKAP823pxVgUNZZkinTM
 KiWx7EAXVTtcJUwxsog+YLc68YTH5yGBSRJAqXF2hiYY/eY87cSu72a5WbZyBLxa
 GkYPWJa/NtbSGw==
X-ME-Sender: <xms:C4YjYAPVRvhzH9xp5QHh5Ymxd-aaqIP6WhAzJbLpLF1JR5tKbzUYqA>
 <xme:C4YjYG-AQ5rjicOM5M5viWjFSvH6QulrpP7kx36plyOSo-kqg4QaNXoGwB1c0ig3k
 MJkEdMRa8jVpKeyIWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeigddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:C4YjYHTB1fM09nVHPs0BlLWncoRX_vSNFMIwuSwtMeHrh3wABpMHSA>
 <xmx:C4YjYIsCpREaEjqybRRehETPtty3JDNQoRagRRd2cB-NvAxEgTjBBA>
 <xmx:C4YjYIe78uEazG8DQegw1yMKn8w96kXo_ktWWUzrsMv2JJjDTnMkpQ>
 <xmx:C4YjYNHdpWK0Mx0hL8Vmt-bk6261xJ4036WPnm09hO21y20W1O1Jtw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D6C54108005F;
 Wed, 10 Feb 2021 02:06:50 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/block/nvme: add oncs device parameter
Date: Wed, 10 Feb 2021 08:06:45 +0100
Message-Id: <20210210070646.730110-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210210070646.730110-1-its@irrelevant.dk>
References: <20210210070646.730110-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
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
index cb2b5175f1a1..98082b2dfba3 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -9,6 +9,7 @@
 
 #define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
 #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
+#define NVME_MAX_COMMANDS 0x100
 
 typedef struct NvmeParams {
     char     *serial;
@@ -22,6 +23,7 @@ typedef struct NvmeParams {
     bool     use_intel_id;
     uint32_t zasl_bs;
     bool     legacy_cmb;
+    uint16_t oncs;
 } NvmeParams;
 
 typedef struct NvmeAsyncEvent {
@@ -183,6 +185,11 @@ typedef struct NvmeCtrl {
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
index 93345bf3c1fc..e5f6666725d7 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -71,6 +71,11 @@
  *   data size being in effect. By setting this property to 0, users can make
  *   ZASL to be equal to MDTS. This property only affects zoned namespaces.
  *
+ * - `oncs`
+ *   This field indicates the optional NVM commands and features supported
+ *   by the controller. To add support for the optional feature, needs to
+ *   set the corresponding support indicated bit.
+ *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  * - `subsys`
@@ -165,7 +170,7 @@ static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
     [NVME_TIMESTAMP]                = NVME_FEAT_CAP_CHANGE,
 };
 
-static const uint32_t nvme_cse_acs[256] = {
+static const uint32_t nvme_cse_acs[NVME_MAX_COMMANDS] = {
     [NVME_ADM_CMD_DELETE_SQ]        = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_CREATE_SQ]        = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_GET_LOG_PAGE]     = NVME_CMD_EFF_CSUPP,
@@ -178,30 +183,7 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
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
 
@@ -2884,17 +2866,17 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
 
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
@@ -3422,6 +3404,10 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
+    if (!(le16_to_cpu(n->id_ctrl.oncs) & NVME_ONCS_FEATURES) && sel) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
     if (nvme_feature_cap[fid] & NVME_FEAT_CAP_NS) {
         if (!nvme_nsid_valid(n, nsid) || nsid == NVME_NSID_BROADCAST) {
             /*
@@ -3503,6 +3489,9 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
         result = n->features.async_config;
         goto out;
     case NVME_TIMESTAMP:
+        if (!(le16_to_cpu(n->id_ctrl.oncs) & NVME_ONCS_TIMESTAMP)) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
         return nvme_get_feature_timestamp(n, req);
     default:
         break;
@@ -3585,6 +3574,10 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
         return NVME_FID_NOT_SAVEABLE | NVME_DNR;
     }
 
+    if (!(le16_to_cpu(n->id_ctrl.oncs) & NVME_ONCS_FEATURES) && save) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
     if (!nvme_feature_support[fid]) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
@@ -3697,6 +3690,9 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
         n->features.async_config = dw11;
         break;
     case NVME_TIMESTAMP:
+        if (!(le16_to_cpu(n->id_ctrl.oncs) & NVME_ONCS_TIMESTAMP)) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
         return nvme_set_feature_timestamp(n, req);
     case NVME_COMMAND_SET_PROFILE:
         if (dw11 & 0x1ff) {
@@ -3875,14 +3871,14 @@ static void nvme_select_ns_iocs(NvmeCtrl *n)
         switch (ns->csi) {
         case NVME_CSI_NVM:
             if (NVME_CC_CSS(n->bar.cc) != NVME_CC_CSS_ADMIN_ONLY) {
-                ns->iocs = nvme_cse_iocs_nvm;
+                ns->iocs = n->iocs.nvm;
             }
             break;
         case NVME_CSI_ZONED:
             if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_CSI) {
-                ns->iocs = nvme_cse_iocs_zoned;
+                ns->iocs = n->iocs.zoned;
             } else if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_NVM) {
-                ns->iocs = nvme_cse_iocs_nvm;
+                ns->iocs = n->iocs.nvm;
             }
             break;
         }
@@ -4510,6 +4506,40 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
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
+    memcpy(n->iocs.zoned,  n->iocs.nvm, sizeof(n->iocs.nvm));
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
@@ -4522,6 +4552,8 @@ static void nvme_init_state(NvmeCtrl *n)
     n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
+
+    nvme_init_cse_iocs(n);
 }
 
 int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
@@ -4720,9 +4752,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->sqes = (0x6 << 4) | 0x6;
     id->cqes = (0x4 << 4) | 0x4;
     id->nn = cpu_to_le32(n->num_namespaces);
-    id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROES | NVME_ONCS_TIMESTAMP |
-                           NVME_ONCS_FEATURES | NVME_ONCS_DSM |
-                           NVME_ONCS_COMPARE | NVME_ONCS_COPY);
+    id->oncs = cpu_to_le16(n->params.oncs);
 
     id->vwc = (0x2 << 1) | 0x1;
     id->ocfs = cpu_to_le16(NVME_OCFS_COPY_FORMAT_0);
@@ -4857,6 +4887,9 @@ static Property nvme_props[] = {
     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
     DEFINE_PROP_SIZE32("zoned.append_size_limit", NvmeCtrl, params.zasl_bs,
                        NVME_DEFAULT_MAX_ZA_SIZE),
+    DEFINE_PROP_UINT16("oncs", NvmeCtrl, params.oncs, NVME_ONCS_WRITE_ZEROES |
+                       NVME_ONCS_TIMESTAMP | NVME_ONCS_DSM |
+                       NVME_ONCS_COMPARE | NVME_ONCS_FEATURES | NVME_ONCS_COPY),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.30.0


