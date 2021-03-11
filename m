Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB24336C78
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 07:51:18 +0100 (CET)
Received: from localhost ([::1]:47692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKFAD-0007ri-I4
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 01:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lKEyL-0005hK-HH; Thu, 11 Mar 2021 01:39:01 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lKEyJ-0008Cm-BI; Thu, 11 Mar 2021 01:39:01 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A0C855C00AA;
 Thu, 11 Mar 2021 01:38:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 11 Mar 2021 01:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=pt+6vM9le9ie/
 FElty80/C9S2l5Coce/eCBWMxX5p/s=; b=SbpZgfu7Sre5ad1F/R6Li4DiiM70t
 ugGwOJjSb0HyQ670I8RR/WZ4byQ3Ayk/+iLS5PoiVXZSGMv1rnIrQJRjnt4ssho6
 S6AvUpSNVAePsmpmTzCNHITBJBPHV9wOKLUKdgKt+PhTS3Sg2Gl2eYd7z4OG47/R
 cgpTXaonQiB1+taeFUu5QIHCEOIPWqi4+7IZ9CGipAzg2eZpYjiEGatJ3f96uZIt
 2HhKre7FzAu5D0E9p3ijQdyapZZvw/ZUe6Wb83u+G/77xqS25Hw7xVRvAUG9ajmU
 w17tIQGEPoNdQcqf4uKFyaoGSUT9LgliYUxz5wBd5yzYtJ67Da2oi+teg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=pt+6vM9le9ie/FElty80/C9S2l5Coce/eCBWMxX5p/s=; b=k67nvxZM
 fYDmZyNPhcoIVJYOP22NGwz9tMBgYkaYNoNJFX4d6hIZXy+DMvfzMZ/CQbFIPlq2
 a+ZOlGlwoap5neYhIMOc2wIt4kM4lU8eGHXMKw42U3HvTsXBxJQdIct3amLjpf30
 wUr0Vw62nYIbrE5ycw03awUzlYRuZtsylHVQj7f3k9aefEJM1DaUNV+HPjhNa2Xn
 kL7vAg8mMXZfo7rA01KnIGqL+nunpcgfKebxm6dCAxzCFVgab8MkR0sMQaeyAQbT
 Nm8wK9eah3kb+u8aaUxs2pCd17349m7KAPt/t5+GIWxup3C9nH4xQISS4GB7AkWJ
 bFR74w5wKeJa9g==
X-ME-Sender: <xms:ALtJYN2G9AsFzmMTgIreULU7euF49-XE4L4uTZnoO1qHVFLCgmsHug>
 <xme:ALtJYExos1A9xitxf8aolkaP7n_-FTQC5TYOW_ybnXz0dBig3SAxsTgrt8STwWY_b
 ou_BO_J7a_s74xXPlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ALtJYMGE3OFxLDwUKydLk5g-aV-Do-nbnvpYITVD8KyeA5F4hUFyGg>
 <xmx:ALtJYPZLY1yAVx7ZbHOw9ROzIqomtUyfhdW7wnWSVRXPQcSMxzca2w>
 <xmx:ALtJYGC3KFunWqmLeEkUyJwUCFCq4jjDHV8ZT4eF5v5A5IhXKcyd0g>
 <xmx:ALtJYIc1O_aOvdr7in4DfX9Vq_EilR24fDmL2rA_RVtiuspxNMTD1w>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 58F4A1080067;
 Thu, 11 Mar 2021 01:38:55 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/block/nvme: add oacs device parameter
Date: Thu, 11 Mar 2021 07:38:50 +0100
Message-Id: <20210311063851.757481-3-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Add the 'oacs' nvme device parameter to allow optional features to be
enabled/disabled explicitly. Since most of these are optional commands,
make the CSE log pages dynamic to account for the value of OACS once the
optional commands supported added to device.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme.h |  3 +++
 hw/block/nvme.c | 46 +++++++++++++++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 65c80cfaef62..cebe6018a234 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -30,6 +30,7 @@ typedef struct NvmeParams {
     uint8_t  zasl;
     bool     legacy_cmb;
     uint16_t oncs;
+    uint16_t oacs;
 } NvmeParams;
 
 typedef struct NvmeAsyncEvent {
@@ -213,6 +214,8 @@ typedef struct NvmeCtrl {
     NvmeIdCtrl      id_ctrl;
     NvmeFeatureVal  features;
 
+    uint32_t acs[NVME_MAX_COMMANDS];
+
     struct {
         uint32_t nvm[NVME_MAX_COMMANDS];
         uint32_t zoned[NVME_MAX_COMMANDS];
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index fbb578a6e669..8b8be3b5f121 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -89,6 +89,11 @@
  *   by the controller. To add support for the optional feature, needs to
  *   set the corresponding support indicated bit.
  *
+ * - `oacs`
+ *   This field indicates the optional Admin commands and features supported
+ *   by the controller. To add support for the optional feature, needs to
+ *   set the corresponding support indicated bit.
+ *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  * - `subsys`
@@ -190,20 +195,6 @@ static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
     [NVME_TIMESTAMP]                = NVME_FEAT_CAP_CHANGE,
 };
 
-static const uint32_t nvme_cse_acs[NVME_MAX_COMMANDS] = {
-    [NVME_ADM_CMD_DELETE_SQ]        = NVME_CMD_EFF_CSUPP,
-    [NVME_ADM_CMD_CREATE_SQ]        = NVME_CMD_EFF_CSUPP,
-    [NVME_ADM_CMD_GET_LOG_PAGE]     = NVME_CMD_EFF_CSUPP,
-    [NVME_ADM_CMD_DELETE_CQ]        = NVME_CMD_EFF_CSUPP,
-    [NVME_ADM_CMD_CREATE_CQ]        = NVME_CMD_EFF_CSUPP,
-    [NVME_ADM_CMD_IDENTIFY]         = NVME_CMD_EFF_CSUPP,
-    [NVME_ADM_CMD_ABORT]            = NVME_CMD_EFF_CSUPP,
-    [NVME_ADM_CMD_SET_FEATURES]     = NVME_CMD_EFF_CSUPP,
-    [NVME_ADM_CMD_GET_FEATURES]     = NVME_CMD_EFF_CSUPP,
-    [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
-    [NVME_ADM_CMD_NS_ATTACHMENT]    = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,
-};
-
 static const uint32_t nvme_cse_iocs_none[NVME_MAX_COMMANDS];
 
 static void nvme_process_sq(void *opaque);
@@ -3068,7 +3059,7 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
         }
     }
 
-    memcpy(log.acs, nvme_cse_acs, sizeof(nvme_cse_acs));
+    memcpy(log.acs, n->acs, sizeof(n->acs));
 
     if (src_iocs) {
         memcpy(log.iocs, src_iocs, sizeof(log.iocs));
@@ -4057,7 +4048,7 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
     trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opcode,
                              nvme_adm_opc_str(req->cmd.opcode));
 
-    if (!(nvme_cse_acs[req->cmd.opcode] & NVME_CMD_EFF_CSUPP)) {
+    if (!(n->acs[req->cmd.opcode] & NVME_CMD_EFF_CSUPP)) {
         trace_pci_nvme_err_invalid_admin_opc(req->cmd.opcode);
         return NVME_INVALID_OPCODE | NVME_DNR;
     }
@@ -4868,6 +4859,25 @@ static void nvme_init_cse_iocs(NvmeCtrl *n)
     n->iocs.zoned[NVME_CMD_ZONE_MGMT_RECV] = NVME_CMD_EFF_CSUPP;
 }
 
+static void nvme_init_cse_acs(NvmeCtrl *n)
+{
+    n->acs[NVME_ADM_CMD_DELETE_SQ] = NVME_CMD_EFF_CSUPP;
+    n->acs[NVME_ADM_CMD_CREATE_SQ] = NVME_CMD_EFF_CSUPP;
+    n->acs[NVME_ADM_CMD_GET_LOG_PAGE] = NVME_CMD_EFF_CSUPP;
+    n->acs[NVME_ADM_CMD_DELETE_CQ] = NVME_CMD_EFF_CSUPP;
+    n->acs[NVME_ADM_CMD_CREATE_CQ] = NVME_CMD_EFF_CSUPP;
+    n->acs[NVME_ADM_CMD_IDENTIFY] = NVME_CMD_EFF_CSUPP;
+    n->acs[NVME_ADM_CMD_ABORT] = NVME_CMD_EFF_CSUPP;
+    n->acs[NVME_ADM_CMD_SET_FEATURES] = NVME_CMD_EFF_CSUPP;
+    n->acs[NVME_ADM_CMD_GET_FEATURES] = NVME_CMD_EFF_CSUPP;
+    n->acs[NVME_ADM_CMD_ASYNC_EV_REQ] = NVME_CMD_EFF_CSUPP;
+
+    if (n->params.oacs & NVME_OACS_NS_MGMT) {
+        n->acs[NVME_ADM_CMD_NS_ATTACHMENT] =
+            NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC;
+    }
+}
+
 static void nvme_init_state(NvmeCtrl *n)
 {
     n->num_namespaces = NVME_MAX_NAMESPACES;
@@ -4881,6 +4891,7 @@ static void nvme_init_state(NvmeCtrl *n)
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
 
+    nvme_init_cse_acs(n);
     nvme_init_cse_iocs(n);
 }
 
@@ -5097,7 +5108,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
-    id->oacs = cpu_to_le16(NVME_OACS_NS_MGMT);
+    id->oacs = cpu_to_le16(n->params.oacs);
     id->cntrltype = 0x1;
 
     /*
@@ -5272,6 +5283,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT16("oncs", NvmeCtrl, params.oncs, NVME_ONCS_WRITE_ZEROES |
                        NVME_ONCS_TIMESTAMP | NVME_ONCS_DSM |
                        NVME_ONCS_COMPARE | NVME_ONCS_FEATURES | NVME_ONCS_COPY),
+    DEFINE_PROP_UINT16("oacs", NvmeCtrl, params.oacs, NVME_OACS_NS_MGMT),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.30.1


