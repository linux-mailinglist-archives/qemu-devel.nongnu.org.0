Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C62699B43
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:28:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSi1x-0002f9-47; Thu, 16 Feb 2023 12:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pShQi-0000RY-QA; Thu, 16 Feb 2023 11:48:20 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pShQh-0004Fo-1y; Thu, 16 Feb 2023 11:48:20 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 44F265C0263;
 Thu, 16 Feb 2023 11:48:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 16 Feb 2023 11:48:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defmacro.it; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1676566098; x=1676652498; bh=0l
 tIsspxDvfvW1P5rTu1fFjU5Ss6EeLqifX5d8gGq7M=; b=sMyMuRA2ei8Mc4OPJ+
 QX0E0uCIo4PxClhE8cEUtD+0G8d/M//pqUGEQj3pGp5v+Mcfc7bufSfYGA5viVpE
 BU+n4dyP/fW5SokDgOHc5DENVcJk4tHc5IGL/5wzjJq+e/SkjmjaQPiK36+QaXU2
 2u2gTYyvBbGFpuIno/g5nd3nC5MXtPpoLcR1RhSIyEy/LMZQOrxKHzPhrVtoIIsC
 1rb8udskW7iab8CUq6PaH4VDaXxwbrLa2QOGCtb0otd/Y0uCyI65lvJV56HnDN0y
 aud+QeTYze48JNxTzKi4HPOsNjZwow8txQ6gNRzMOR6zmxrT4R1UbMm6yyX9V5Zg
 lZqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1676566098; x=1676652498; bh=0ltIsspxDvfvW
 1P5rTu1fFjU5Ss6EeLqifX5d8gGq7M=; b=oBlLutn+8SUyJYg1lwnDFIkObm6z/
 tbudVaH7d8gjJHzD9zTi9twQ3QopmvOMnPFEH/JZl1G6agufIvk4qLSKNcz/Oplh
 nM+E/4T590SKWM2zZec0lqe4oshycKKxik2Bw6lBOZY1SdFq0XHQD5QvCYRsh1WG
 wZj+7cijMII30jEZEIYAlN/5Q7PZaQuTmkZlwZVlE9arhBz5e6agvzQ9+4cbvCHv
 TjdCqRUHmTBzDr4qjcS4vR4WnkkJ8yXKJ7gF82ORv6IIo+sKD/fvj+TETCPdU1rY
 8kgDDL/ppwyTUsTwDHxlkFdDFqAjvx1qizczdgosdxSSegRztwycdu6Qw==
X-ME-Sender: <xms:Ul7uY5X3Hie-jdC8DVP9ZyeMQ9UVpmyoZ3TpHwfMuIQHdnOq83R-Ig>
 <xme:Ul7uY5lk8TVkKS5BW_qDOadjyuIq2B0HdU9ItrdcCnVTza_5CMbJnWVkbMOo-V4_Z
 GkjNRAdfrkZQDWZfT0>
X-ME-Received: <xmr:Ul7uY1ajlTrKCBtcHuVPgetp0J81qaxaUEmZUc5d606yxYwq6DmwWAI-woFeKihjIFxeLPeZZIMPcFN6IbG5Yb_Si0_AKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfgvshhp
 vghrucffvghvrghnthhivghruceojhifugesuggvfhhmrggtrhhordhitheqnecuggftrf
 grthhtvghrnhepvddvtefhtdeugfetfeeukedtfeeitddugfffleehkeelveektdevteef
 leduueevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epjhifugesuggvfhhmrggtrhhordhith
X-ME-Proxy: <xmx:Ul7uY8U7oc4W-SBvURaF3cjmm94bakrBo3YWCNHkOhNRoJz7v98O7Q>
 <xmx:Ul7uYzk1OQLiRt090bZiFkbx8GlwcYzRi5YARGAd2w0BCr4h4Fq3yg>
 <xmx:Ul7uY5d7n1dGjAOSWRcxWPRyjdjaWimOnBiVvPUo-qQblF6iLsxMdg>
 <xmx:Ul7uY8jXwMvF3SLUaP9Iq3pDIqb626zZlhPk5f6Qgcrh5zqlvxAEfg>
Feedback-ID: i0f41475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Feb 2023 11:48:16 -0500 (EST)
From: Jesper Devantier <jwd@defmacro.it>
To: jwd@defmacro.it,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Fam Zheng <fam@euphon.net>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 3/5] hw/nvme: add basic endurance group support
Date: Thu, 16 Feb 2023 17:48:04 +0100
Message-Id: <20230216164806.233533-4-jwd@defmacro.it>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216164806.233533-1-jwd@defmacro.it>
References: <20230216164806.233533-1-jwd@defmacro.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jwd@defmacro.it;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 16 Feb 2023 12:26:45 -0500
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
2.39.1


