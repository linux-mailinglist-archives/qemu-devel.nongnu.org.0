Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0159C336C9D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 08:00:07 +0100 (CET)
Received: from localhost ([::1]:55970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKFIk-0003fr-I7
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 02:00:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lKEyO-0005iM-0D; Thu, 11 Mar 2021 01:39:04 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:39213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lKEyJ-0008DZ-H3; Thu, 11 Mar 2021 01:39:03 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2CE92580BBF;
 Thu, 11 Mar 2021 01:38:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 01:38:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=jIrmriLD7n7uG
 GHBv7UG1gnryWKvPJ04VZMm+gJvINQ=; b=XCUpvZfXIjrVx/jrCOB5ZflcrfQhU
 LJCzBse+3zJRlt6YRvBMXgkCvfwqYzdF+tXHXUSyfPghRI4jWmhEQQByESToW2RR
 zLjdbHkOqaT73fubwHbAE5h61ORfWlOAJX1qhSlSnYK8ymPKCI7NguXSQtNmokG9
 ixOq+of72yA6SyX5Zxq8LDgx7QMWEKYtHSKfPg2MuEaFxzIt4Vhl+pQ3Bqs3Pggr
 Mm0Uc+IzHBXVVw1B9qD0ms2LIercCrEtLge4yO37JEx/lpNKpIONsiL08GS9TDhi
 Ap8zg4TVKa9+A8lZYacfsEYnCPb908z2Ly2u6heU+yfVcuB72rB+YqIfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=jIrmriLD7n7uGGHBv7UG1gnryWKvPJ04VZMm+gJvINQ=; b=SZsLuc36
 oKWhwc5PqBTJB00zhbp0IzGOQ9KAK1IB7T6Ijk9T8lbzq01mqRboUkuS9d9igB8d
 c+3hEsTiglFqh1nfZJ62G6WnDYG9odQoqnVJJ/Mlg53G8LgvmOenPsn2OLuV1w0L
 8YRkAZvMGm0JSYRF62u6e7G+UPlq3hR2u03HZePK7kdtRR3ituMey4OQ+5Eidk/z
 l1BTeyuT0iVg1VWilnhwGVCUngU7f3wbnK1SkNsf8azxz6Lfvhrs/vgmYE1nLN0A
 9f4KsW5IwA62E5sTDtIoFrw1Ifv8g/WAoISD1VbBjZGHpujMhEXClEUSAhRVZ7Gj
 yDsR+nV4XGHpXw==
X-ME-Sender: <xms:ArtJYCOPpuvsD6GSJbfLZAeMuNVZ-4EOERYpaF_UuxnGAo4C15Fo_g>
 <xme:ArtJYA-AvpByPitGBJS3zf781NxCnLn-M0XkMFPLIDPW0dihiKiMO2asdmkeRkO8o
 HoZXCWfrztU9lmbqV8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ArtJYJRYXs_ybJ9TsFT60UDK2UpL8_IORnqyZKMQpBD92QpPa0wa6A>
 <xmx:ArtJYCsbFFSX3CydMQpRt52A0L7_W3dN3ivv8NutQ3FMFCCDBxJwKw>
 <xmx:ArtJYKf3326SjMiwA2HTjxZ9i8W0E0Tolv6Sa-Jlgq4vWnfveCYzjQ>
 <xmx:ArtJYByOZD7NpQHRVKkV5gd3VyWVIlEwYwhSu0xk5DpU4d3h6SB97A>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id ADEB8108005F;
 Thu, 11 Mar 2021 01:38:56 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/block/nvme: add administrative controller type
Date: Thu, 11 Mar 2021 07:38:51 +0100
Message-Id: <20210311063851.757481-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311063851.757481-1-its@irrelevant.dk>
References: <20210311063851.757481-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
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
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>

Add the 'administrative' nvme device parameter. This causes the
controller to behave as an Administrative Controller.

See NVM Express v1.4b, Section 7.1.2 ("Administrative Controller").

Signed-off-by: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h        |  1 +
 include/block/nvme.h   |  8 ++++
 hw/block/nvme-subsys.c |  6 ++-
 hw/block/nvme.c        | 86 ++++++++++++++++++++++++++++++------------
 4 files changed, 76 insertions(+), 25 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index cebe6018a234..364edb82b60e 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -31,6 +31,7 @@ typedef struct NvmeParams {
     bool     legacy_cmb;
     uint16_t oncs;
     uint16_t oacs;
+    bool     administrative;
 } NvmeParams;
 
 typedef struct NvmeAsyncEvent {
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 372d0f2799fb..907cd5a9cf62 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -586,6 +586,11 @@ enum NvmeIoCommands {
     NVME_CMD_ZONE_APPEND        = 0x7d,
 };
 
+enum NvmeIdCtrlCntrlType {
+    NVME_CNTRL_TYPE_IO          = 0x1,
+    NVME_CNTRL_TYPE_ADMIN       = 0x3,
+};
+
 typedef struct QEMU_PACKED NvmeDeleteQ {
     uint8_t     opcode;
     uint8_t     flags;
@@ -944,6 +949,8 @@ enum NvmeLogIdentifier {
     NVME_LOG_FW_SLOT_INFO   = 0x03,
     NVME_LOG_CHANGED_NSLIST = 0x04,
     NVME_LOG_CMD_EFFECTS    = 0x05,
+
+    NVME_LID_MAX            = 0x100,
 };
 
 typedef struct QEMU_PACKED NvmePSD {
@@ -1165,6 +1172,7 @@ enum NvmeFeatureIds {
     NVME_TIMESTAMP                  = 0xe,
     NVME_COMMAND_SET_PROFILE        = 0x19,
     NVME_SOFTWARE_PROGRESS_MARKER   = 0x80,
+
     NVME_FID_MAX                    = 0x100,
 };
 
diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
index af4804a819ee..051ef0f32b3f 100644
--- a/hw/block/nvme-subsys.c
+++ b/hw/block/nvme-subsys.c
@@ -60,7 +60,11 @@ int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp)
     for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
         n = subsys->ctrls[i];
 
-        if (n && nvme_register_namespace(n, ns, errp)) {
+        if (!n || n->params.administrative) {
+            continue;
+        }
+
+        if (nvme_register_namespace(n, ns, errp)) {
             return -1;
         }
     }
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 8b8be3b5f121..f56748962e3f 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -94,6 +94,10 @@
  *   by the controller. To add support for the optional feature, needs to
  *   set the corresponding support indicated bit.
  *
+ * - 'administrative'
+ *   Set to true/on to make this an Administrative Controller. By default, the
+ *   controller will present itself as an I/O Controller.
+ *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  * - `subsys`
@@ -186,6 +190,15 @@ static const bool nvme_feature_support[NVME_FID_MAX] = {
     [NVME_TIMESTAMP]                = true,
 };
 
+static const bool nvme_admin_ctrl_feature_support[NVME_FID_MAX] = {
+    [NVME_POWER_MANAGEMENT]         = true,
+    [NVME_TEMPERATURE_THRESHOLD]    = true,
+    [NVME_INTERRUPT_COALESCING]     = true,
+    [NVME_INTERRUPT_VECTOR_CONF]    = true,
+    [NVME_ASYNCHRONOUS_EVENT_CONF]  = true,
+    [NVME_TIMESTAMP]                = true,
+};
+
 static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
     [NVME_TEMPERATURE_THRESHOLD]    = NVME_FEAT_CAP_CHANGE,
     [NVME_ERROR_RECOVERY]           = NVME_FEAT_CAP_CHANGE | NVME_FEAT_CAP_NS,
@@ -3634,6 +3647,12 @@ static uint16_t nvme_get_feature_timestamp(NvmeCtrl *n, NvmeRequest *req)
     return nvme_c2h(n, (uint8_t *)&timestamp, sizeof(timestamp), req);
 }
 
+static inline bool nvme_check_fid_support(NvmeCtrl *n, uint8_t fid)
+{
+    return n->params.administrative ?
+        nvme_admin_ctrl_feature_support[fid] : nvme_feature_support[fid];
+}
+
 static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = &req->cmd;
@@ -3653,7 +3672,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
 
     trace_pci_nvme_getfeat(nvme_cid(req), nsid, fid, sel, dw11);
 
-    if (!nvme_feature_support[fid]) {
+    if (!nvme_check_fid_support(n, fid)) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
@@ -3831,7 +3850,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
         return NVME_FID_NOT_SAVEABLE | NVME_DNR;
     }
 
-    if (!nvme_feature_support[fid]) {
+    if (!nvme_check_fid_support(n, fid)) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
@@ -4829,25 +4848,27 @@ static void nvme_init_cse_iocs(NvmeCtrl *n)
 {
     uint16_t oncs = n->params.oncs;
 
-    n->iocs.nvm[NVME_CMD_FLUSH] = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC;
-    n->iocs.nvm[NVME_CMD_WRITE] = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC;
-    n->iocs.nvm[NVME_CMD_READ]  = NVME_CMD_EFF_CSUPP;
+    if (!n->params.administrative) {
+        n->iocs.nvm[NVME_CMD_FLUSH] = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC;
+        n->iocs.nvm[NVME_CMD_WRITE] = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC;
+        n->iocs.nvm[NVME_CMD_READ]  = NVME_CMD_EFF_CSUPP;
 
-    if (oncs & NVME_ONCS_WRITE_ZEROES) {
-        n->iocs.nvm[NVME_CMD_WRITE_ZEROES] = NVME_CMD_EFF_CSUPP |
-            NVME_CMD_EFF_LBCC;
-    }
+        if (oncs & NVME_ONCS_WRITE_ZEROES) {
+            n->iocs.nvm[NVME_CMD_WRITE_ZEROES] = NVME_CMD_EFF_CSUPP |
+                NVME_CMD_EFF_LBCC;
+        }
 
-    if (oncs & NVME_ONCS_COMPARE) {
-        n->iocs.nvm[NVME_CMD_COMPARE] = NVME_CMD_EFF_CSUPP;
-    }
+        if (oncs & NVME_ONCS_COMPARE) {
+            n->iocs.nvm[NVME_CMD_COMPARE] = NVME_CMD_EFF_CSUPP;
+        }
 
-    if (oncs & NVME_ONCS_DSM) {
-        n->iocs.nvm[NVME_CMD_DSM] = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC;
-    }
+        if (oncs & NVME_ONCS_DSM) {
+            n->iocs.nvm[NVME_CMD_DSM] = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC;
+        }
 
-    if (oncs & NVME_ONCS_COPY) {
-        n->iocs.nvm[NVME_CMD_COPY] = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC;
+        if (oncs & NVME_ONCS_COPY) {
+            n->iocs.nvm[NVME_CMD_COPY] = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC;
+        }
     }
 
     memcpy(n->iocs.zoned, n->iocs.nvm, sizeof(n->iocs.nvm));
@@ -4861,11 +4882,14 @@ static void nvme_init_cse_iocs(NvmeCtrl *n)
 
 static void nvme_init_cse_acs(NvmeCtrl *n)
 {
-    n->acs[NVME_ADM_CMD_DELETE_SQ] = NVME_CMD_EFF_CSUPP;
-    n->acs[NVME_ADM_CMD_CREATE_SQ] = NVME_CMD_EFF_CSUPP;
+    if (!n->params.administrative) {
+        n->acs[NVME_ADM_CMD_DELETE_SQ] = NVME_CMD_EFF_CSUPP;
+        n->acs[NVME_ADM_CMD_CREATE_SQ] = NVME_CMD_EFF_CSUPP;
+        n->acs[NVME_ADM_CMD_DELETE_CQ] = NVME_CMD_EFF_CSUPP;
+        n->acs[NVME_ADM_CMD_CREATE_CQ] = NVME_CMD_EFF_CSUPP;
+    }
+
     n->acs[NVME_ADM_CMD_GET_LOG_PAGE] = NVME_CMD_EFF_CSUPP;
-    n->acs[NVME_ADM_CMD_DELETE_CQ] = NVME_CMD_EFF_CSUPP;
-    n->acs[NVME_ADM_CMD_CREATE_CQ] = NVME_CMD_EFF_CSUPP;
     n->acs[NVME_ADM_CMD_IDENTIFY] = NVME_CMD_EFF_CSUPP;
     n->acs[NVME_ADM_CMD_ABORT] = NVME_CMD_EFF_CSUPP;
     n->acs[NVME_ADM_CMD_SET_FEATURES] = NVME_CMD_EFF_CSUPP;
@@ -4913,6 +4937,12 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 {
     uint32_t nsid = nvme_nsid(ns);
 
+    if (n->params.administrative) {
+        error_setg(errp,
+                   "cannot attach namespace to administrative controller");
+        return -1;
+    }
+
     if (nsid > NVME_MAX_NAMESPACES) {
         error_setg(errp, "invalid namespace id (must be between 0 and %d)",
                    NVME_MAX_NAMESPACES);
@@ -5006,12 +5036,13 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     uint8_t *pci_conf = pci_dev->config;
     uint64_t bar_size, msix_table_size, msix_pba_size;
     unsigned msix_table_offset, msix_pba_offset;
+    uint8_t prog_interface = n->params.administrative ? 0x3 : 0x2;
     int ret;
 
     Error *err = NULL;
 
     pci_conf[PCI_INTERRUPT_PIN] = 1;
-    pci_config_set_prog_interface(pci_conf, 0x2);
+    pci_config_set_prog_interface(pci_conf, prog_interface);
 
     if (n->params.use_intel_id) {
         pci_config_set_vendor_id(pci_conf, PCI_VENDOR_ID_INTEL);
@@ -5109,7 +5140,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
     id->oacs = cpu_to_le16(n->params.oacs);
-    id->cntrltype = 0x1;
+    id->cntrltype = n->params.administrative ?
+        NVME_CNTRL_TYPE_ADMIN : NVME_CNTRL_TYPE_IO;
 
     /*
      * Because the controller always completes the Abort command immediately,
@@ -5159,7 +5191,12 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
         id->cmic |= NVME_CMIC_MULTI_CTRL;
     }
 
-    NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
+    if (n->params.administrative) {
+        NVME_CAP_SET_MQES(n->bar.cap, 0);
+    } else {
+        NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
+    }
+
     NVME_CAP_SET_CQR(n->bar.cap, 1);
     NVME_CAP_SET_TO(n->bar.cap, 0xf);
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_NVM);
@@ -5284,6 +5321,7 @@ static Property nvme_props[] = {
                        NVME_ONCS_TIMESTAMP | NVME_ONCS_DSM |
                        NVME_ONCS_COMPARE | NVME_ONCS_FEATURES | NVME_ONCS_COPY),
     DEFINE_PROP_UINT16("oacs", NvmeCtrl, params.oacs, NVME_OACS_NS_MGMT),
+    DEFINE_PROP_BOOL("administrative", NvmeCtrl, params.administrative, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.30.1


