Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205A02C5E50
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 00:51:01 +0100 (CET)
Received: from localhost ([::1]:48724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiR2S-00013w-04
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 18:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxx-0007Pz-5u; Thu, 26 Nov 2020 18:46:21 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:54733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxm-0003tG-Dq; Thu, 26 Nov 2020 18:46:20 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 56CF35C0203;
 Thu, 26 Nov 2020 18:46:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Nov 2020 18:46:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=j2k9HpTrV3TkL
 6eRFBEngDJVE7jcAkCbhkcm19svwDg=; b=voFziL87mlMuHQraZFHPGo7ODxLJ4
 5C0OcxbM6NdeROpUXnPwp6FOtBDI3i7PMHaW+ohZJpQEWnlTpAfCZv4EDtb8LuJZ
 RrXYHmb9W+IGkvat5xM1S+lW3+MUXEO9eBi5Xl1bNHpdplADkaONtD6FoccJyYCY
 AaiKDP6lrta+nTukKjp4OfEjWQj2ZRNY2tNvNsS3VD3L8jRpvV54zeDGGEQ1bQu2
 wDbbuAvy2YTvesEfkleYRVNDqqWGfNX1L9GQLnduRTRWhLCFMwARMYfUW08ZghdF
 7EltxKum73FvNY4Uxax1cFrAujoiW41kH6kvGWkAKSEZEbnQ/PrMIjXYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=j2k9HpTrV3TkL6eRFBEngDJVE7jcAkCbhkcm19svwDg=; b=mn7gIkqK
 MeDyrqaSzySgg3YmVfigLsaOj4vbYuOaYbM2XhtjS6dsNaSPh0F4VEnboyhoiSdE
 DvOvBWdLE7Aq8nlkC4mb2l0p7ooSsws/MNXSLQlRBrlFvaoUsFtM9JmNaUyLfY0l
 LspN9C48mOjZMM60xOU9+FHr2wmDL1PJoXahrGiabs8c/MQygAsCQ5uEv28+jYg2
 44a70VvGchleKFbBbUl9RbBxkWMljkH16aeGwhk9BZ2vDjyrxW+NEWB/lylsps4m
 5tkgRK5wObL6ljbuq9hS8iS2+/6gd1MONxG62N4Ihe1IWbY++ivd5gnJGqXQZEyT
 O73gehfrHZIPnA==
X-ME-Sender: <xms:QT7AX84XCwLfzAxrlr2425HBcclCUt3eTvU8KACFjiFvLMmFpe8ogw>
 <xme:QT7AX95S-rPwy67cXWQRdXawGi0QgzG2Gkxv1QcbZQI8NuNIEHmlcfZCvAIyLDqBH
 RP7EjY9Ewi7XjceyjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehfedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:QT7AX7cUEWiKxqgpjkv-N_Qnfrc7kXXLkrl7rwOROp48Pf7YtPDqcQ>
 <xmx:QT7AXxKoebcbE9BdDuJCBOXJzMkp3PuPM_nKCpOSGPMyJYVkzVwR5A>
 <xmx:QT7AXwKAqDTMUWwqiFu26YzOdf6ydFaaQphFrr-DU7eVKV2Mg5YKPQ>
 <xmx:QT7AX5pQNmacjdk5hg9zzwTnP_EDm112QE206EwEqik-sUc8JYKCvw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D80B63064AB3;
 Thu, 26 Nov 2020 18:46:07 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/12] hw/block/nvme: add commands supported and effects
 log page
Date: Fri, 27 Nov 2020 00:45:52 +0100
Message-Id: <20201126234601.689714-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126234601.689714-1-its@irrelevant.dk>
References: <20201126234601.689714-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

This is to support for the Commands Supported and Effects log page. See
NVM Express Spec 1.3d, sec. 5.14.1.5 ("Commands Supported and Effects")

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 25 ++++++++++++++++--
 hw/block/nvme.c      | 61 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 83 insertions(+), 3 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 6ea435fd34ab..ffc65dc25f90 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -773,6 +773,24 @@ typedef struct QEMU_PACKED NvmeSmartLog {
     uint8_t     reserved2[320];
 } NvmeSmartLog;
 
+typedef struct NvmeEffectsLog {
+    uint32_t acs[256];
+    uint32_t iocs[256];
+    uint8_t  rsvd2048[2048];
+} NvmeEffectsLog;
+
+enum {
+    NVME_EFFECTS_CSUPP      = 1 <<  0,
+    NVME_EFFECTS_LBCC       = 1 <<  1,
+    NVME_EFFECTS_NCC        = 1 <<  2,
+    NVME_EFFECTS_NIC        = 1 <<  3,
+    NVME_EFFECTS_CCC        = 1 <<  4,
+    NVME_EFFECTS_CSE_SINGLE = 1 << 16,
+    NVME_EFFECTS_CSE_MULTI  = 1 << 17,
+    NVME_EFFECTS_CSE_MASK   = 3 << 16,
+    NVME_EFFECTS_UUID_SEL   = 1 << 19,
+};
+
 enum NvmeSmartWarn {
     NVME_SMART_SPARE                  = 1 << 0,
     NVME_SMART_TEMPERATURE            = 1 << 1,
@@ -785,6 +803,7 @@ enum NvmeLogIdentifier {
     NVME_LOG_ERROR_INFO     = 0x01,
     NVME_LOG_SMART_INFO     = 0x02,
     NVME_LOG_FW_SLOT_INFO   = 0x03,
+    NVME_LOG_EFFECTS        = 0x05,
 };
 
 typedef struct QEMU_PACKED NvmePSD {
@@ -901,8 +920,9 @@ enum NvmeIdCtrlFrmw {
 };
 
 enum NvmeIdCtrlLpa {
-    NVME_LPA_NS_SMART = 1 << 0,
-    NVME_LPA_EXTENDED = 1 << 2,
+    NVME_LPA_NS_SMART     = 1 << 0,
+    NVME_LPA_EFFECTS_LOG  = 1 << 1,
+    NVME_LPA_EXTENDED     = 1 << 2,
 };
 
 #define NVME_CTRL_SQES_MIN(sqes) ((sqes) & 0xf)
@@ -1119,5 +1139,6 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNs) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSglDescriptor) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) != 4);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeEffectsLog) != 4096);
 }
 #endif
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 0050ef87cb92..7a5ec843d567 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1782,6 +1782,63 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
                     DMA_DIRECTION_FROM_DEVICE, req);
 }
 
+static void nvme_effects_nvm(NvmeEffectsLog *effects)
+{
+    effects->iocs[NVME_CMD_FLUSH] = NVME_EFFECTS_CSUPP | NVME_EFFECTS_LBCC;
+    effects->iocs[NVME_CMD_WRITE] = NVME_EFFECTS_CSUPP | NVME_EFFECTS_LBCC;
+    effects->iocs[NVME_CMD_READ] = NVME_EFFECTS_CSUPP;
+    effects->iocs[NVME_CMD_COMPARE] = NVME_EFFECTS_CSUPP;
+    effects->iocs[NVME_CMD_WRITE_ZEROES] = NVME_EFFECTS_CSUPP |
+                                           NVME_EFFECTS_LBCC;
+    effects->iocs[NVME_CMD_DSM] = NVME_EFFECTS_CSUPP | NVME_EFFECTS_LBCC;
+    effects->iocs[NVME_CMD_COPY] = NVME_EFFECTS_CSUPP | NVME_EFFECTS_LBCC;
+}
+
+static uint16_t nvme_effects_log(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
+                                 NvmeRequest *req)
+{
+    NvmeEffectsLog effects = (NvmeEffectsLog) {
+        .acs = {
+            [NVME_ADM_CMD_DELETE_SQ]    = NVME_EFFECTS_CSUPP,
+            [NVME_ADM_CMD_CREATE_SQ]    = NVME_EFFECTS_CSUPP,
+            [NVME_ADM_CMD_GET_LOG_PAGE] = NVME_EFFECTS_CSUPP,
+            [NVME_ADM_CMD_DELETE_CQ]    = NVME_EFFECTS_CSUPP,
+            [NVME_ADM_CMD_CREATE_CQ]    = NVME_EFFECTS_CSUPP,
+            [NVME_ADM_CMD_IDENTIFY]     = NVME_EFFECTS_CSUPP,
+            [NVME_ADM_CMD_ABORT]        = NVME_EFFECTS_CSUPP,
+            [NVME_ADM_CMD_SET_FEATURES] = NVME_EFFECTS_CSUPP |
+                                          NVME_EFFECTS_CCC |
+                                          NVME_EFFECTS_NIC |
+                                          NVME_EFFECTS_NCC,
+            [NVME_ADM_CMD_GET_FEATURES] = NVME_EFFECTS_CSUPP,
+            [NVME_ADM_CMD_ASYNC_EV_REQ] = NVME_EFFECTS_CSUPP
+        },
+    };
+
+    uint32_t trans_len;
+
+    if (off >= sizeof(NvmeEffectsLog)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    switch (NVME_CC_CSS(n->bar.cc)) {
+    case NVME_CC_CSS_ADMIN_ONLY:
+        break;
+
+    case NVME_CC_CSS_NVM:
+        nvme_effects_nvm(&effects);
+        break;
+
+    default:
+        return NVME_INTERNAL_DEV_ERROR | NVME_DNR;
+    }
+
+    trans_len = MIN(sizeof(effects) - off, buf_len);
+
+    return nvme_dma(n, (uint8_t *)&effects + off, trans_len,
+                    DMA_DIRECTION_FROM_DEVICE, req);
+}
+
 static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = &req->cmd;
@@ -1825,6 +1882,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
         return nvme_smart_info(n, rae, len, off, req);
     case NVME_LOG_FW_SLOT_INFO:
         return nvme_fw_log_info(n, len, off, req);
+    case NVME_LOG_EFFECTS:
+        return nvme_effects_log(n, len, off, req);
     default:
         trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -3286,7 +3345,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->acl = 3;
     id->aerl = n->params.aerl;
     id->frmw = (NVME_NUM_FW_SLOTS << 1) | NVME_FRMW_SLOT1_RO;
-    id->lpa = NVME_LPA_NS_SMART | NVME_LPA_EXTENDED;
+    id->lpa = NVME_LPA_NS_SMART | NVME_LPA_EXTENDED | NVME_LPA_EFFECTS_LOG;
 
     /* recommended default value (~70 C) */
     id->wctemp = cpu_to_le16(NVME_TEMPERATURE_WARNING);
-- 
2.29.2


