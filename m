Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB793149DB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:01:49 +0100 (CET)
Received: from localhost ([::1]:57058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ny0-0003BA-Ks
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:01:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUu-00055X-FM; Tue, 09 Feb 2021 02:31:44 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:35065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUs-0005ax-6m; Tue, 09 Feb 2021 02:31:44 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 12E505DB;
 Tue,  9 Feb 2021 02:31:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:31:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=N7OmbGXE8qqP3
 9ND4RppYGl99P718JX+6S2b7QjVyC0=; b=n1K8hGYSa/l11vTxg8MChDNW0dacj
 PYqR4Ni2bPNK+PpevR0fRvbOakR9S47SBn8Jhf3bAbfGHBsLA/09MeAv1gBlhj2a
 kOqwikkITRVG6RE/rEzraKuw9hFoN/eskinJ1imm2o/CRMKrEHFNKTn2hHflG4et
 0gNZ3+z3I7IKMCrCOJwUsRrpoq1C/upI+mhLaV2Z3CBEANl+fVpzMqmj6zdWENRh
 hRE3RBawUPRc5Fmri+R2pBOS6c4cSPTB/sRI0Q2y8TCnBZF0T5dl2rzVfDGJLEFP
 cEtcWoTg0y1klYu8oZnmPEaTu+pRuq2H5rdFaNcKD3GOFfsT2tI/bFEcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=N7OmbGXE8qqP39ND4RppYGl99P718JX+6S2b7QjVyC0=; b=EkQEoQ5L
 3emC7RkNfJYLE4IIT+g+uIDx2uRyqArwpmAxDxYTrBIhr1Cor8zMcSmvRNkkeStI
 uaFK8jHXNyJCPeQAqY/WfdEJz3CfDzDHcuM+M0wBMlu3kC4lxEt1T9LF+RY3Ftli
 Zjd6MBpPxudJrothtXVjTGA4ociYJls+pk7jTmYeNLIXyp6QZUbRf+c7E0FTW+sP
 H/0fn6FUE8xpylJ9iaV8DMq9wG0OIbHBGPyeqMr4gBJYt60e024QgeML2T4PzPl0
 /w4EYTloo8q9gYtTrNJ8Qg/0SBoTt/Ytk+IF0I6sQ5rLE4b6a0eeEanHmzi0Hxmo
 L6cgD1C/TsG4Qw==
X-ME-Sender: <xms:WzoiYMl2aHxzLx4Q21XgdbTwFhRiqLYMFWVhv8pvrFoYh3OirwOnKA>
 <xme:WzoiYL1FdepxkrLyYxzCCPMQDRCYk9M9QJZ8DCO2UlDoaCqRtlNvcIdumuRpdBjy-
 uqMBK_AxEvHxBlLs9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeekne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:WzoiYKrXMlg9Ul6-RtOLvAC-Xuowjlri-OVGPlYhc4KEUB6gdLB75g>
 <xmx:WzoiYIn7A71-zEkZsI28pmouhg4K2Mw4ReUtas293YWOsiIGdzHwjA>
 <xmx:WzoiYK3zPvuKv_3S9kS-gW2uffXQiygUW5iUIzs5YWxe-aj7x3T9hw>
 <xmx:WzoiYIwQI31LivSg6fm427x-2K2geK93sZ35z8QVY_yUjhcv4NgWcDlgays>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1B1DD1080057;
 Tue,  9 Feb 2021 02:31:38 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 12/56] hw/block/nvme: Add Commands Supported and Effects log
Date: Tue,  9 Feb 2021 08:30:17 +0100
Message-Id: <20210209073101.548811-13-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Niklas Cassel <Niklas.Cassel@wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Fomichev <dmitry.fomichev@wdc.com>

This log page becomes necessary to implement to allow checking for
Zone Append command support in Zoned Namespace Command Set.

This commit adds the code to report this log page for NVM Command
Set only. The parts that are specific to zoned operation will be
added later in the series.

All incoming admin and i/o commands are now only processed if their
corresponding support bits are set in this log. This provides an
easy way to control what commands to support and what not to
depending on set CC.CSS.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Niklas Cassel <Niklas.Cassel@wdc.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h    |   1 +
 include/block/nvme.h  |  19 ++++++++
 hw/block/nvme.c       | 102 ++++++++++++++++++++++++++++++++++++++----
 hw/block/trace-events |   1 +
 4 files changed, 114 insertions(+), 9 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index aeca810fc7a8..bdeaf1c0de84 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -30,6 +30,7 @@ typedef struct NvmeNamespace {
     int32_t      bootindex;
     int64_t      size;
     NvmeIdNs     id_ns;
+    const uint32_t *iocs;
 
     NvmeNamespaceParams params;
 
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 11ac1c2b7dfb..397f7ca3b5cb 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -752,10 +752,27 @@ enum NvmeSmartWarn {
     NVME_SMART_FAILED_VOLATILE_MEDIA  = 1 << 4,
 };
 
+typedef struct NvmeEffectsLog {
+    uint32_t    acs[256];
+    uint32_t    iocs[256];
+    uint8_t     resv[2048];
+} NvmeEffectsLog;
+
+enum {
+    NVME_CMD_EFF_CSUPP      = 1 << 0,
+    NVME_CMD_EFF_LBCC       = 1 << 1,
+    NVME_CMD_EFF_NCC        = 1 << 2,
+    NVME_CMD_EFF_NIC        = 1 << 3,
+    NVME_CMD_EFF_CCC        = 1 << 4,
+    NVME_CMD_EFF_CSE_MASK   = 3 << 16,
+    NVME_CMD_EFF_UUID_SEL   = 1 << 19,
+};
+
 enum NvmeLogIdentifier {
     NVME_LOG_ERROR_INFO     = 0x01,
     NVME_LOG_SMART_INFO     = 0x02,
     NVME_LOG_FW_SLOT_INFO   = 0x03,
+    NVME_LOG_CMD_EFFECTS    = 0x05,
 };
 
 typedef struct QEMU_PACKED NvmePSD {
@@ -868,6 +885,7 @@ enum NvmeIdCtrlFrmw {
 
 enum NvmeIdCtrlLpa {
     NVME_LPA_NS_SMART = 1 << 0,
+    NVME_LPA_CSE      = 1 << 1,
     NVME_LPA_EXTENDED = 1 << 2,
 };
 
@@ -1076,6 +1094,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeErrorLog) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeFwSlotInfoLog) != 512);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSmartLog) != 512);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeEffectsLog) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrl) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNs) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSglDescriptor) != 16);
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 4d1ca8c466c5..05e799623c41 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -112,6 +112,30 @@ static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
     [NVME_TIMESTAMP]                = NVME_FEAT_CAP_CHANGE,
 };
 
+static const uint32_t nvme_cse_acs[256] = {
+    [NVME_ADM_CMD_DELETE_SQ]        = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_CREATE_SQ]        = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_GET_LOG_PAGE]     = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_DELETE_CQ]        = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_CREATE_CQ]        = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_IDENTIFY]         = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_ABORT]            = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_SET_FEATURES]     = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_GET_FEATURES]     = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
+};
+
+static const uint32_t nvme_cse_iocs_none[256];
+
+static const uint32_t nvme_cse_iocs_nvm[256] = {
+    [NVME_CMD_FLUSH]                = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
+    [NVME_CMD_WRITE_ZEROES]         = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
+    [NVME_CMD_WRITE]                = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
+    [NVME_CMD_READ]                 = NVME_CMD_EFF_CSUPP,
+    [NVME_CMD_DSM]                  = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
+    [NVME_CMD_COMPARE]              = NVME_CMD_EFF_CSUPP,
+};
+
 static void nvme_process_sq(void *opaque);
 
 static uint16_t nvme_cid(NvmeRequest *req)
@@ -1306,10 +1330,6 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
     trace_pci_nvme_io_cmd(nvme_cid(req), nsid, nvme_sqid(req),
                           req->cmd.opcode, nvme_io_opc_str(req->cmd.opcode));
 
-    if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_ADMIN_ONLY) {
-        return NVME_INVALID_OPCODE | NVME_DNR;
-    }
-
     if (!nvme_nsid_valid(n, nsid)) {
         return NVME_INVALID_NSID | NVME_DNR;
     }
@@ -1319,6 +1339,11 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
+    if (!(req->ns->iocs[req->cmd.opcode] & NVME_CMD_EFF_CSUPP)) {
+        trace_pci_nvme_err_invalid_opc(req->cmd.opcode);
+        return NVME_INVALID_OPCODE | NVME_DNR;
+    }
+
     switch (req->cmd.opcode) {
     case NVME_CMD_FLUSH:
         return nvme_flush(n, req);
@@ -1333,9 +1358,10 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
     case NVME_CMD_DSM:
         return nvme_dsm(n, req);
     default:
-        trace_pci_nvme_err_invalid_opc(req->cmd.opcode);
-        return NVME_INVALID_OPCODE | NVME_DNR;
+        assert(false);
     }
+
+    return NVME_INVALID_OPCODE | NVME_DNR;
 }
 
 static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
@@ -1570,6 +1596,37 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
                     DMA_DIRECTION_FROM_DEVICE, req);
 }
 
+static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint32_t buf_len,
+                                 uint64_t off, NvmeRequest *req)
+{
+    NvmeEffectsLog log = {};
+    const uint32_t *src_iocs = NULL;
+    uint32_t trans_len;
+
+    if (off >= sizeof(log)) {
+        trace_pci_nvme_err_invalid_log_page_offset(off, sizeof(log));
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    switch (NVME_CC_CSS(n->bar.cc)) {
+    case NVME_CC_CSS_NVM:
+        src_iocs = nvme_cse_iocs_nvm;
+    case NVME_CC_CSS_ADMIN_ONLY:
+        break;
+    }
+
+    memcpy(log.acs, nvme_cse_acs, sizeof(nvme_cse_acs));
+
+    if (src_iocs) {
+        memcpy(log.iocs, src_iocs, sizeof(log.iocs));
+    }
+
+    trans_len = MIN(sizeof(log) - off, buf_len);
+
+    return nvme_dma(n, ((uint8_t *)&log) + off, trans_len,
+                    DMA_DIRECTION_FROM_DEVICE, req);
+}
+
 static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = &req->cmd;
@@ -1613,6 +1670,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
         return nvme_smart_info(n, rae, len, off, req);
     case NVME_LOG_FW_SLOT_INFO:
         return nvme_fw_log_info(n, len, off, req);
+    case NVME_LOG_CMD_EFFECTS:
+        return nvme_cmd_effects(n, len, off, req);
     default:
         trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -2229,6 +2288,11 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
     trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opcode,
                              nvme_adm_opc_str(req->cmd.opcode));
 
+    if (!(nvme_cse_acs[req->cmd.opcode] & NVME_CMD_EFF_CSUPP)) {
+        trace_pci_nvme_err_invalid_admin_opc(req->cmd.opcode);
+        return NVME_INVALID_OPCODE | NVME_DNR;
+    }
+
     switch (req->cmd.opcode) {
     case NVME_ADM_CMD_DELETE_SQ:
         return nvme_del_sq(n, req);
@@ -2251,9 +2315,10 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
     case NVME_ADM_CMD_ASYNC_EV_REQ:
         return nvme_aer(n, req);
     default:
-        trace_pci_nvme_err_invalid_admin_opc(req->cmd.opcode);
-        return NVME_INVALID_OPCODE | NVME_DNR;
+        assert(false);
     }
+
+    return NVME_INVALID_OPCODE | NVME_DNR;
 }
 
 static void nvme_process_sq(void *opaque)
@@ -2352,6 +2417,23 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
     }
 }
 
+static void nvme_select_ns_iocs(NvmeCtrl *n)
+{
+    NvmeNamespace *ns;
+    int i;
+
+    for (i = 1; i <= n->num_namespaces; i++) {
+        ns = nvme_ns(n, i);
+        if (!ns) {
+            continue;
+        }
+        ns->iocs = nvme_cse_iocs_none;
+        if (NVME_CC_CSS(n->bar.cc) != NVME_CC_CSS_ADMIN_ONLY) {
+            ns->iocs = nvme_cse_iocs_nvm;
+        }
+    }
+}
+
 static int nvme_start_ctrl(NvmeCtrl *n)
 {
     uint32_t page_bits = NVME_CC_MPS(n->bar.cc) + 12;
@@ -2450,6 +2532,8 @@ static int nvme_start_ctrl(NvmeCtrl *n)
 
     QTAILQ_INIT(&n->aer_queue);
 
+    nvme_select_ns_iocs(n);
+
     return 0;
 }
 
@@ -3057,7 +3141,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->acl = 3;
     id->aerl = n->params.aerl;
     id->frmw = (NVME_NUM_FW_SLOTS << 1) | NVME_FRMW_SLOT1_RO;
-    id->lpa = NVME_LPA_NS_SMART | NVME_LPA_EXTENDED;
+    id->lpa = NVME_LPA_NS_SMART | NVME_LPA_CSE | NVME_LPA_EXTENDED;
 
     /* recommended default value (~70 C) */
     id->wctemp = cpu_to_le16(NVME_TEMPERATURE_WARNING);
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 60262b03c901..9e1a17e62711 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -108,6 +108,7 @@ pci_nvme_err_invalid_prp2_align(uint64_t prp2) "PRP2 is not page aligned: 0x%"PR
 pci_nvme_err_invalid_opc(uint8_t opc) "invalid opcode 0x%"PRIx8""
 pci_nvme_err_invalid_admin_opc(uint8_t opc) "invalid admin opcode 0x%"PRIx8""
 pci_nvme_err_invalid_lba_range(uint64_t start, uint64_t len, uint64_t limit) "Invalid LBA start=%"PRIu64" len=%"PRIu64" limit=%"PRIu64""
+pci_nvme_err_invalid_log_page_offset(uint64_t ofs, uint64_t size) "must be <= %"PRIu64", got %"PRIu64""
 pci_nvme_err_invalid_del_sq(uint16_t qid) "invalid submission queue deletion, sid=%"PRIu16""
 pci_nvme_err_invalid_create_sq_cqid(uint16_t cqid) "failed creating submission queue, invalid cqid=%"PRIu16""
 pci_nvme_err_invalid_create_sq_sqid(uint16_t sqid) "failed creating submission queue, invalid sqid=%"PRIu16""
-- 
2.30.0


