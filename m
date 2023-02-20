Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B1C69CA67
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 13:01:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4pd-0001Oe-Hr; Mon, 20 Feb 2023 06:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pU4pb-0001O3-KZ; Mon, 20 Feb 2023 06:59:43 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pU4pZ-0006dI-NR; Mon, 20 Feb 2023 06:59:43 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 8C64B3200D77;
 Mon, 20 Feb 2023 06:59:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 20 Feb 2023 06:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defmacro.it; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1676894379; x=1676980779; bh=gx
 oQHwKCGlQ2NW/1RTnLhM3oud7LDWcviubdtjL0jhs=; b=u7JAgtq0jS+ATeJurX
 pOI/Ln2VfTLLpxI8hRxd4aspJ8Do/LhltDMXbCCqK7pEMJNP6lFoPDv0/+Hoxa9i
 H6OPrIrJWhnDL7hJyBN+VPFSSjC4YCnL7r3snJN+uL8/qo4xzcmukwEU77oO33qn
 j2oRjK2BOuS9KfIyTklACUR4j1Fe8Gdd2GD4EIH07vjf2ISkL37fH9Cbhu3UGzsY
 PMkY3sNhSDgUl1Qv+VtxbShNCUNFHqdmDfSZxeitrD1y3Clq4cuyuGuEHES7ISiA
 WH4UJ+oPvZraE3oLfLdc7MHHTT+BPnDa/vdVkarmKa5GMkwXs2LeCTHkvwwlVNPU
 fHxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1676894379; x=1676980779; bh=gxoQHwKCGlQ2N
 W/1RTnLhM3oud7LDWcviubdtjL0jhs=; b=hESA3RTXHedpVRQH1pul6KPIDrwF/
 HVyHFvb9rEmb36ki9TgWjNfAqMaK2wudHtcFTemeAgCWXAZ1xmILEmyvB0m/c2t1
 1HGWfKBuIULtbLGW7g60uJBTbry4Vc1VjUe19HOjH+6pCGVGeenuoVlMmrZ5//Wk
 UytImu4S/Ybumbh8+6uxJElpJW6z5vRzpOI1mEF0vvgjkUcgFX3t2TFoiTdZMdfo
 GEHQj+yMG3DODFgqa5fl5KQBA3ZeF9vXpZUTapbbHtdKzwJRIUU924IIcweTf9+C
 9JWuefMADJocp/EGtijJ9xbLY/cTLm9nnU+jzkUI8L8KmcLU8FE9poMLQ==
X-ME-Sender: <xms:q2DzY1V8Sl77zFFJ9FTtEUcJbGRR1P3cakajm7LEj-hvKQm0qfjCpg>
 <xme:q2DzY1lqva1Z74l3y0SkuMN7IkvcpJ8wkTIAKaxJOKU1icgJNJE98T9nOREMyqPYR
 fmIq7CHaLAP1AV4yzM>
X-ME-Received: <xmr:q2DzYxaWnlYfR9uVoHDaqpdqNIHdWZ3XkMKT6k1w7Q0BJRQanEKl-xZAvTkV-hmbOUJTwyLvYCsf1EKa>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejhedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfgvshhp
 vghrucffvghvrghnthhivghruceojhifugesuggvfhhmrggtrhhordhitheqnecuggftrf
 grthhtvghrnhepvddvtefhtdeugfetfeeukedtfeeitddugfffleehkeelveektdevteef
 leduueevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epjhifugesuggvfhhmrggtrhhordhith
X-ME-Proxy: <xmx:q2DzY4UXiRGRVp9nJPgt1lu8Y4mJw3QBhrCV3OqWiuXwAmmo2JqbRw>
 <xmx:q2DzY_lFYOP6B1uvE_NlgA8yxkD9ramrnREefSwekM_2fVfK025GfQ>
 <xmx:q2DzY1cdTj9mJPGR7_5Uqx_rKquSubCl_GX6sB46SYL8i7b7pBM4iQ>
 <xmx:q2DzY4gjVyt5X_x-CUssLTJgRq2nsJJP4b6zzqPcxIB4_8W9hcFQIg>
Feedback-ID: i0f41475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Feb 2023 06:59:37 -0500 (EST)
From: Jesper Devantier <jwd@defmacro.it>
To: jwd@defmacro.it,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v3 3/5] hw/nvme: add basic endurance group support
Date: Mon, 20 Feb 2023 12:59:24 +0100
Message-Id: <20230220115926.54623-4-jwd@defmacro.it>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230220115926.54623-1-jwd@defmacro.it>
References: <20230220115926.54623-1-jwd@defmacro.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=jwd@defmacro.it;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Add the mandatory Endurance Group identify data structures and log
pages.

For now, all namespaces in a subsystem belongs to a single Endurance
Group.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 48 +++++++++++++++++++++++++++++++++++++++++++-
 hw/nvme/ns.c         |  3 +++
 hw/nvme/nvme.h       |  4 ++++
 include/block/nvme.h | 42 +++++++++++++++++++++++++++++++-------
 4 files changed, 89 insertions(+), 8 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 99b92ff20b..729ed9adc5 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4454,6 +4454,44 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     return nvme_c2h(n, (uint8_t *) &smart + off, trans_len, req);
 }
 
+static uint16_t nvme_endgrp_info(NvmeCtrl *n,  uint8_t rae, uint32_t buf_len,
+                                 uint64_t off, NvmeRequest *req)
+{
+    uint32_t dw11 = le32_to_cpu(req->cmd.cdw11);
+    uint16_t endgrpid = (dw11 >> 16) & 0xffff;
+    struct nvme_stats stats = {};
+    NvmeEndGrpLog info = {};
+    int i;
+
+    if (!n->subsys || endgrpid != 0x1) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    if (off >= sizeof(info)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
+        NvmeNamespace *ns = nvme_subsys_ns(n->subsys, i);
+        if (!ns) {
+            continue;
+        }
+
+        nvme_set_blk_stats(ns, &stats);
+    }
+
+    info.data_units_read[0] = cpu_to_le64(stats.units_read / 1000000000);
+    info.data_units_written[0] = cpu_to_le64(stats.units_written / 1000000000);
+    info.media_units_written[0] = cpu_to_le64(stats.units_written / 1000000000);
+    info.host_read_commands[0] = cpu_to_le64(stats.read_commands);
+    info.host_write_commands[0] = cpu_to_le64(stats.write_commands);
+
+    buf_len = MIN(sizeof(info) - off, buf_len);
+
+    return nvme_c2h(n, (uint8_t *)&info + off, buf_len, req);
+}
+
+
 static uint16_t nvme_fw_log_info(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
                                  NvmeRequest *req)
 {
@@ -4626,6 +4664,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
         return nvme_changed_nslist(n, rae, len, off, req);
     case NVME_LOG_CMD_EFFECTS:
         return nvme_cmd_effects(n, csi, len, off, req);
+    case NVME_LOG_ENDGRP:
+        return nvme_endgrp_info(n, rae, len, off, req);
     default:
         trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -7382,6 +7422,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     uint8_t *pci_conf = pci_dev->config;
     uint64_t cap = ldq_le_p(&n->bar.cap);
     NvmeSecCtrlEntry *sctrl = nvme_sctrl(n);
+    uint32_t ctratt;
 
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
@@ -7392,7 +7433,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->cntlid = cpu_to_le16(n->cntlid);
 
     id->oaes = cpu_to_le32(NVME_OAES_NS_ATTR);
-    id->ctratt |= cpu_to_le32(NVME_CTRATT_ELBAS);
+    ctratt = NVME_CTRATT_ELBAS;
 
     id->rab = 6;
 
@@ -7459,8 +7500,13 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     if (n->subsys) {
         id->cmic |= NVME_CMIC_MULTI_CTRL;
+        ctratt |= NVME_CTRATT_ENDGRPS;
+
+        id->endgidmax = cpu_to_le16(0x1);
     }
 
+    id->ctratt = cpu_to_le32(ctratt);
+
     NVME_CAP_SET_MQES(cap, 0x7ff);
     NVME_CAP_SET_CQR(cap, 1);
     NVME_CAP_SET_TO(cap, 0xf);
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 8ebab4fbce..23872a174c 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -592,6 +592,8 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
     if (subsys) {
         subsys->namespaces[nsid] = ns;
 
+        ns->id_ns.endgid = cpu_to_le16(0x1);
+
         if (ns->params.detached) {
             return;
         }
@@ -607,6 +609,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
 
             return;
         }
+
     }
 
     nvme_attach_ns(n, ns);
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 5d221073ac..a88e0dea5c 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -45,6 +45,10 @@ typedef struct NvmeBus {
     OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
 #define SUBSYS_SLOT_RSVD (void *)0xFFFF
 
+typedef struct NvmeEnduranceGroup {
+    uint8_t event_conf;
+} NvmeEnduranceGroup;
+
 typedef struct NvmeSubsystem {
     DeviceState parent_obj;
     NvmeBus     bus;
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 8027b7126b..4abc1bbfa5 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -58,6 +58,24 @@ enum NvmeBarRegs {
     NVME_REG_PMRMSCU = offsetof(NvmeBar, pmrmscu),
 };
 
+typedef struct QEMU_PACKED NvmeEndGrpLog {
+    uint8_t  critical_warning;
+    uint8_t  rsvd[2];
+    uint8_t  avail_spare;
+    uint8_t  avail_spare_thres;
+    uint8_t  percet_used;
+    uint8_t  rsvd1[26];
+    uint64_t end_estimate[2];
+    uint64_t data_units_read[2];
+    uint64_t data_units_written[2];
+    uint64_t media_units_written[2];
+    uint64_t host_read_commands[2];
+    uint64_t host_write_commands[2];
+    uint64_t media_integrity_errors[2];
+    uint64_t no_err_info_log_entries[2];
+    uint8_t rsvd2[352];
+} NvmeEndGrpLog;
+
 enum NvmeCapShift {
     CAP_MQES_SHIFT     = 0,
     CAP_CQR_SHIFT      = 16,
@@ -1005,11 +1023,12 @@ enum {
 };
 
 enum NvmeLogIdentifier {
-    NVME_LOG_ERROR_INFO     = 0x01,
-    NVME_LOG_SMART_INFO     = 0x02,
-    NVME_LOG_FW_SLOT_INFO   = 0x03,
-    NVME_LOG_CHANGED_NSLIST = 0x04,
-    NVME_LOG_CMD_EFFECTS    = 0x05,
+    NVME_LOG_ERROR_INFO                 = 0x01,
+    NVME_LOG_SMART_INFO                 = 0x02,
+    NVME_LOG_FW_SLOT_INFO               = 0x03,
+    NVME_LOG_CHANGED_NSLIST             = 0x04,
+    NVME_LOG_CMD_EFFECTS                = 0x05,
+    NVME_LOG_ENDGRP                     = 0x09,
 };
 
 typedef struct QEMU_PACKED NvmePSD {
@@ -1091,7 +1110,10 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
     uint16_t    mntmt;
     uint16_t    mxtmt;
     uint32_t    sanicap;
-    uint8_t     rsvd332[180];
+    uint8_t     rsvd332[6];
+    uint16_t    nsetidmax;
+    uint16_t    endgidmax;
+    uint8_t     rsvd342[170];
     uint8_t     sqes;
     uint8_t     cqes;
     uint16_t    maxcmd;
@@ -1134,6 +1156,7 @@ enum NvmeIdCtrlOaes {
 };
 
 enum NvmeIdCtrlCtratt {
+    NVME_CTRATT_ENDGRPS = 1 <<  4,
     NVME_CTRATT_ELBAS   = 1 << 15,
 };
 
@@ -1227,6 +1250,7 @@ enum NvmeNsAttachmentOperation {
 #define NVME_AEC_SMART(aec)         (aec & 0xff)
 #define NVME_AEC_NS_ATTR(aec)       ((aec >> 8) & 0x1)
 #define NVME_AEC_FW_ACTIVATION(aec) ((aec >> 9) & 0x1)
+#define NVME_AEC_ENDGRP_NOTICE(aec) ((aec >> 14) & 0x1)
 
 #define NVME_ERR_REC_TLER(err_rec)  (err_rec & 0xffff)
 #define NVME_ERR_REC_DULBE(err_rec) (err_rec & 0x10000)
@@ -1338,7 +1362,10 @@ typedef struct QEMU_PACKED NvmeIdNs {
     uint16_t    mssrl;
     uint32_t    mcl;
     uint8_t     msrc;
-    uint8_t     rsvd81[23];
+    uint8_t     rsvd81[18];
+    uint8_t     nsattr;
+    uint16_t    nvmsetid;
+    uint16_t    endgid;
     uint8_t     nguid[16];
     uint64_t    eui64;
     NvmeLBAF    lbaf[NVME_MAX_NLBAF];
@@ -1655,5 +1682,6 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmePriCtrlCap) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSecCtrlEntry) != 32);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSecCtrlList) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeEndGrpLog) != 512);
 }
 #endif
-- 
2.39.2


