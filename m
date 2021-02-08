Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA073140F4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:53:30 +0100 (CET)
Received: from localhost ([::1]:39868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DXF-0001Go-H2
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l97FZ-0007Gu-Vq; Mon, 08 Feb 2021 09:10:52 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:45529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l97FA-0004N1-9i; Mon, 08 Feb 2021 09:10:41 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id EDFF545C;
 Mon,  8 Feb 2021 09:10:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 08 Feb 2021 09:10:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=EzR1v0Er/laZY
 oa4ce2ovHvM21lXv+BPTE55Z8/HZn4=; b=XwfUaHZWJ5ICqsnvIxAefVi5CWBDN
 foIU8/QOF/P9r8nL/RALjURTkb57Z67qqT7Bx/40tMnFdQdmU3mw3zHGOL+Uakp/
 9RWv9+0GJjiCepS/bUi21zY1pUu1RkikqxeCWT7YN4eEo5YOyOxZPsHut5c0CfIf
 pTUgdZVlNbT5IncYyd6cuJObiwlJtz4uGcB1X4yhr8nVBdX9PQ0MvKY94DRtKOIM
 /FCHWWlABslOuTozCab3XRQXM74hjfwoQATnf7jrQFFyFr9/ZzdS04C+gDWMz8WA
 LgMjuc1962RFGJu89RtbxrOBTc4t1MliD9U9c2SRHRkIyWYDdipDMc0SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=EzR1v0Er/laZYoa4ce2ovHvM21lXv+BPTE55Z8/HZn4=; b=ccqMaa6G
 I2UbpnT1HGtOz3SOQnNKqFI3MNrD0N8q3vLl8nNa8eQ0dl4uQKGhfpkBBy5Pz9XG
 Vj1h6rzpjcgo6CUzuskKdphoNtbqOpclGj1NSCtvo86YLyJizMIV562WZThWBSAD
 EAx7Wo1llPyk5CgdtJAIyQaf/XXC6xxUHDbC/nZImsj7ut4H+DrqkGptt1b0m1ZD
 Z3oVRgSDpA0CcnBXbAoX9DOAiW/3mEaWrMtg6mem351E+N8NWNJsxjRWtwSsX1ar
 QFm8M1QfhcWauzE2w8UG4DFTDAIqAzdLLkYIPvUqOB+Xt8Ww6EEH06hQaENSeGB0
 3RQnkT2oIkXpbg==
X-ME-Sender: <xms:S0YhYOt8Cl7TTS0Sv202OjFnIY1L1de6aps75GwnsN9MHfQ4BDRWZg>
 <xme:S0YhYNEE60Qrze26gJlxiMue07uWMEMoxQj00Wgl-HXQuFecP36Mb_P0vAf3WWcBN
 aKLBu9Ad5ygYR_f_kk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheefgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:S0YhYJzK4t61rMRc5NbC9ADqQEk5pW9FvvrH3mTI-CvoMMJQbME9mA>
 <xmx:S0YhYMh05uzRrI3H8PNQZ0FhHqUaE5Xy_RsyMqVHYt1uhHTdPsMWVA>
 <xmx:S0YhYMzsNezdqcbP3EBsSf3ct49ztUSrcprCjMxP7L2plZDSPULSZg>
 <xmx:S0YhYHyJzo2yX0cLIJuJM75xI2Ka2JSCo39_taKp3azOpCImbuYBFQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 48F5F240064;
 Mon,  8 Feb 2021 09:10:18 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/block/nvme: add nvme telemetry log support
Date: Mon,  8 Feb 2021 15:10:12 +0100
Message-Id: <20210208141012.377500-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210208141012.377500-1-its@irrelevant.dk>
References: <20210208141012.377500-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This adds basic support for Telemetry Host Initiated and Controller
Initiated log pages. The controller does not record any telemetry but
provides the log pages.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h  | 23 ++++++++++++++++++++---
 hw/block/nvme.c       | 33 ++++++++++++++++++++++++++++++++-
 hw/block/trace-events |  1 +
 3 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index f82b5ffc2c1d..95ffe4412679 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -922,6 +922,19 @@ typedef struct NvmeEffectsLog {
     uint8_t     resv[2048];
 } NvmeEffectsLog;
 
+typedef struct NvmeTelemetry {
+    uint8_t     lid;
+    uint8_t     rsvd1[4];
+    uint8_t     ieee[3];
+    uint16_t    tda1lb;
+    uint16_t    tda2lb;
+    uint16_t    tda3lb;
+    uint8_t     rsvd14[368];
+    uint8_t     tda;
+    uint8_t     tdgn;
+    uint8_t     ri[128];
+} NvmeTelemetry;
+
 enum {
     NVME_CMD_EFF_CSUPP      = 1 << 0,
     NVME_CMD_EFF_LBCC       = 1 << 1,
@@ -937,6 +950,8 @@ enum NvmeLogIdentifier {
     NVME_LOG_SMART_INFO     = 0x02,
     NVME_LOG_FW_SLOT_INFO   = 0x03,
     NVME_LOG_CMD_EFFECTS    = 0x05,
+    NVME_LOG_TEL_HOST_INIT  = 0x07,
+    NVME_LOG_TEL_CTRL_INIT  = 0x08,
 };
 
 typedef struct QEMU_PACKED NvmePSD {
@@ -1067,9 +1082,10 @@ enum NvmeIdCtrlFrmw {
 };
 
 enum NvmeIdCtrlLpa {
-    NVME_LPA_NS_SMART = 1 << 0,
-    NVME_LPA_CSE      = 1 << 1,
-    NVME_LPA_EXTENDED = 1 << 2,
+    NVME_LPA_NS_SMART   = 1 << 0,
+    NVME_LPA_CSE        = 1 << 1,
+    NVME_LPA_EXTENDED   = 1 << 2,
+    NVME_LPA_TELEMETRY  = 1 << 3,
 };
 
 enum NvmeIdCtrlCmic {
@@ -1395,5 +1411,6 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeSglDescriptor) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) != 4);
     QEMU_BUILD_BUG_ON(sizeof(NvmeZoneDescr) != 64);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeTelemetry) != 512);
 }
 #endif
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 547a3073ef1b..01b92a6f66c8 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2908,6 +2908,33 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
                     DMA_DIRECTION_FROM_DEVICE, req);
 }
 
+static uint16_t nvme_telemetry(NvmeCtrl *n, uint8_t lid, uint32_t buf_len,
+                               uint64_t off, NvmeRequest *req)
+{
+    NvmeTelemetry telemetry = {
+        .lid     = lid,
+        .ieee[0] = 0x00,
+        .ieee[1] = 0x54,
+        .ieee[2] = 0x52,
+    };
+
+    uint32_t trans_len;
+
+    if (buf_len & 0x1ff || off & 0x1ff) {
+        trace_pci_nvme_telemetry_log_invalid(buf_len, off);
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    if (off >= sizeof(telemetry)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    trans_len = MIN(sizeof(telemetry) - off, buf_len);
+
+    return nvme_dma(n, (uint8_t *)&telemetry + off, trans_len,
+                    DMA_DIRECTION_FROM_DEVICE, req);
+}
+
 static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = &req->cmd;
@@ -2954,6 +2981,9 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
         return nvme_fw_log_info(n, len, off, req);
     case NVME_LOG_CMD_EFFECTS:
         return nvme_cmd_effects(n, csi, len, off, req);
+    case NVME_LOG_TEL_HOST_INIT:
+    case NVME_LOG_TEL_CTRL_INIT:
+        return nvme_telemetry(n, lid, len, off, req);
     default:
         trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -4707,7 +4737,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->acl = 3;
     id->aerl = n->params.aerl;
     id->frmw = (NVME_NUM_FW_SLOTS << 1) | NVME_FRMW_SLOT1_RO;
-    id->lpa = NVME_LPA_NS_SMART | NVME_LPA_CSE | NVME_LPA_EXTENDED;
+    id->lpa = NVME_LPA_NS_SMART | NVME_LPA_CSE | NVME_LPA_EXTENDED |
+        NVME_LPA_TELEMETRY;
 
     /* recommended default value (~70 C) */
     id->wctemp = cpu_to_le16(NVME_TEMPERATURE_WARNING);
diff --git a/hw/block/trace-events b/hw/block/trace-events
index b6e972d733a6..500d991a0a14 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -110,6 +110,7 @@ pci_nvme_set_descriptor_extension(uint64_t slba, uint32_t zone_idx) "set zone de
 pci_nvme_zd_extension_set(uint32_t zone_idx) "set descriptor extension for zone_idx=%"PRIu32""
 pci_nvme_clear_ns_close(uint32_t state, uint64_t slba) "zone state=%"PRIu32", slba=%"PRIu64" transitioned to Closed state"
 pci_nvme_clear_ns_reset(uint32_t state, uint64_t slba) "zone state=%"PRIu32", slba=%"PRIu64" transitioned to Empty state"
+pci_nvme_telemetry_log_invalid(size_t len, uint64_t offset) "len %zu offset %"PRIu64""
 
 # nvme traces for error conditions
 pci_nvme_err_mdts(uint16_t cid, size_t len) "cid %"PRIu16" len %zu"
-- 
2.30.0


