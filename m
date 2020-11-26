Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C7E2C5E63
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 01:01:50 +0100 (CET)
Received: from localhost ([::1]:38480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiRCv-0000U3-Tn
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 19:01:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxz-0007TB-Uj; Thu, 26 Nov 2020 18:46:23 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:41739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxw-0003vy-7F; Thu, 26 Nov 2020 18:46:23 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 17AAC5C021A;
 Thu, 26 Nov 2020 18:46:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Nov 2020 18:46:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=zqITmz4AkPdWb
 YCNCexqMVl0qhCfrEAejpyDPbeLevY=; b=anU0f6HzEK71afs7ndMkAjS3OoXOo
 0LbUZ3WT16xdK6DjNHpsJ+NB5k5FiiyAt05EIior+CZsdgiEPlM3gtedC17uxdug
 2c3i62U+RO2VjTzH9LXat4ot8FftQQlyKTc4KotfSNL60E94WWlDYEBNpbsxdurY
 MXwifDS+Pi4ti1c9Qs6MLm9Z/8yy5taxQjl+TFocUoJZBY7PpEfV/D9AoXJrikbr
 pXPDPDqOL+sKMg5lpuomqfu+Z86dvcDr3obRqvL2uizV18I0rzf/mQJsdXMDksSz
 ghCgW0jo0QYxPf5OIiJMw5ZHmIPuwvrZnFvfhAn2WtPaWfccFzDKEmiEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=zqITmz4AkPdWbYCNCexqMVl0qhCfrEAejpyDPbeLevY=; b=aB7/ew6M
 UYlNhpq4DhG+rmY0IaEPRy+39drN3NWognRq0KRP3UUtuw9MdUZMwfq75Igd/8u8
 1OnldnZ9WzY6c3O19xKVfka3Bmzrvp5HbtJC/vccKTISsjYRTdXKOQkGl2K0pxG2
 WPlYKriMTOb2QwpMk52MuCI2IV/68pWVnwa60nzilPywGRzQBdazOnqmbT0yZc+6
 xjOVNV9Np519dvACo5LQQVba7jKeQ89bs1CkiqB5VDtzEPyNnCo2TQD1Fbv393RX
 rIE822xSXoRYMtOje3W2HQjHbaKeFn7i2pRmBmmg8hW9MJkbc1zchN7t46LTffnw
 54HTSgehYZmxAA==
X-ME-Sender: <xms:ST7AX1leqqBGg5ywpX1EyjCh8IxOyDiQGEKvzrFKRQo_sfj_7krJrw>
 <xme:ST7AXw0-UOlKONpoJZl573uzZ2YozMMpEeie8PLBauysaNoJFYY2mbnqFT3ZlQAGS
 FSnDj_o13hEYUE6MfI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehfedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeefne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ST7AX7pxRuBxea6iBFJ7E9eTfGECHICzxqJeSKkFkrk41yP9adDejA>
 <xmx:ST7AX1n0hjCoG6VCGUPQcYd1yFumNEMX428uSnrUXaeBKAyvL1CY0w>
 <xmx:ST7AXz3ETZXu9Ddw6UZoAbhxJ1gi4wIYDx4t6lNzjIWi4wCn-Je1_g>
 <xmx:Sj7AX9oLwOti2uqbAUfGbe9T56IvnTgTsJ6pzkf-rCKoQczxh0fGEA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id AF1113064AB0;
 Thu, 26 Nov 2020 18:46:16 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/12] hw/block/nvme: add the zone append command
Date: Fri, 27 Nov 2020 00:45:58 +0100
Message-Id: <20201126234601.689714-10-its@irrelevant.dk>
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add the Zone Append command.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h       |  5 ++++
 include/block/nvme.h  |  7 ++++++
 hw/block/nvme.c       | 53 +++++++++++++++++++++++++++++++++++++++++++
 hw/block/trace-events |  1 +
 4 files changed, 66 insertions(+)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 0cf3b303e34e..65d3070dec8c 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -16,6 +16,10 @@ typedef struct NvmeParams {
     uint32_t aer_max_queued;
     uint8_t  mdts;
     bool     use_intel_id;
+
+    struct {
+        uint8_t zasl;
+    } zns;
 } NvmeParams;
 
 typedef struct NvmeAsyncEvent {
@@ -65,6 +69,7 @@ static inline const char *nvme_io_opc_str(uint8_t opc)
     case NVME_CMD_COPY:             return "NVME_NVM_CMD_COPY";
     case NVME_CMD_ZONE_MGMT_SEND:   return "NVME_ZONED_CMD_ZONE_MGMT_SEND";
     case NVME_CMD_ZONE_MGMT_RECV:   return "NVME_ZONED_CMD_ZONE_MGMT_RECV";
+    case NVME_CMD_ZONE_APPEND:      return "NVME_ZONED_CMD_ZONE_APPEND";
     default:                        return "NVME_NVM_CMD_UNKNOWN";
     }
 }
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 4c2b6fbb799a..9ea7dfc40cc6 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -487,6 +487,7 @@ enum NvmeIoCommands {
     NVME_CMD_COPY               = 0x19,
     NVME_CMD_ZONE_MGMT_SEND     = 0x79,
     NVME_CMD_ZONE_MGMT_RECV     = 0x7a,
+    NVME_CMD_ZONE_APPEND        = 0x7d,
 };
 
 typedef struct QEMU_PACKED NvmeDeleteQ {
@@ -1059,6 +1060,11 @@ enum NvmeIdCtrlLpa {
     NVME_LPA_EXTENDED     = 1 << 2,
 };
 
+typedef struct QEMU_PACKED NvmeIdCtrlZns {
+    uint8_t zasl;
+    uint8_t rsvd1[4095];
+} NvmeIdCtrlZns;
+
 #define NVME_CTRL_SQES_MIN(sqes) ((sqes) & 0xf)
 #define NVME_CTRL_SQES_MAX(sqes) (((sqes) >> 4) & 0xf)
 #define NVME_CTRL_CQES_MIN(cqes) ((cqes) & 0xf)
@@ -1293,6 +1299,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeFwSlotInfoLog) != 512);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSmartLog) != 512);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrl) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrlZns) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsNvm) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsZns) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSglDescriptor) != 16);
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f0f4d72266bf..3c2b255294d3 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -953,6 +953,21 @@ static inline uint16_t nvme_check_mdts(NvmeCtrl *n, size_t len)
     return NVME_SUCCESS;
 }
 
+static inline uint16_t nvme_check_zasl(NvmeCtrl *n, size_t len)
+{
+    uint8_t zasl = n->params.zns.zasl;
+
+    if (!zasl) {
+        return nvme_check_mdts(n, len);
+    }
+
+    if (len > n->page_size << zasl) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
 static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
                                          uint32_t nlb)
 {
@@ -1169,6 +1184,7 @@ static void nvme_aio_err(NvmeRequest *req, int ret, NvmeZone *zone)
     case NVME_CMD_FLUSH:
     case NVME_CMD_WRITE:
     case NVME_CMD_WRITE_ZEROES:
+    case NVME_CMD_ZONE_APPEND:
         status = NVME_WRITE_FAULT;
         break;
     default:
@@ -1228,6 +1244,7 @@ static void nvme_rw_cb(void *opaque, int ret)
             switch (req->cmd.opcode) {
             case NVME_CMD_WRITE:
             case NVME_CMD_WRITE_ZEROES:
+            case NVME_CMD_ZONE_APPEND:
                 nvme_zns_advance_wp(req);
             default:
                 break;
@@ -2308,8 +2325,13 @@ static uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req)
     uint64_t data_offset;
     BlockBackend *blk = ns->blkconf.blk;
     bool wrz = rw->opcode == NVME_CMD_WRITE_ZEROES;
+    bool append = rw->opcode == NVME_CMD_ZONE_APPEND;
     uint16_t status;
 
+    if (append && !nvme_ns_zoned(ns)) {
+        return NVME_INVALID_OPCODE | NVME_DNR;
+    }
+
     trace_pci_nvme_write(nvme_cid(req), nvme_io_opc_str(rw->opcode),
                          nvme_nsid(ns), nlb, data_size, slba);
 
@@ -2331,6 +2353,24 @@ static uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req)
         NvmeZone *zone = nvme_ns_zone(ns, slba);
         assert(zone);
 
+        if (append) {
+            uint64_t wp = zone->wp_staging;
+
+            if (slba != nvme_zslba(zone)) {
+                trace_pci_nvme_err_invalid_zslba(slba);
+                return NVME_INVALID_FIELD | NVME_DNR;
+            }
+
+            status = nvme_check_zasl(n, data_size);
+            if (status) {
+                trace_pci_nvme_err_zasl(nvme_cid(req), data_size);
+                goto invalid;
+            }
+
+            slba = wp;
+            rw->slba = req->cqe.qw0 = cpu_to_le64(wp);
+        }
+
         status = nvme_check_zone_write(slba, nlb, zone);
         if (status) {
             goto invalid;
@@ -2408,6 +2448,7 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_flush(n, req);
     case NVME_CMD_WRITE_ZEROES:
     case NVME_CMD_WRITE:
+    case NVME_CMD_ZONE_APPEND:
         return nvme_write(n, req);
     case NVME_CMD_READ:
         return nvme_read(n, req);
@@ -2677,6 +2718,8 @@ static void nvme_effects_zoned(NvmeEffectsLog *effects)
     effects->iocs[NVME_CMD_ZONE_MGMT_RECV] = NVME_EFFECTS_CSUPP;
     effects->iocs[NVME_CMD_ZONE_MGMT_SEND] = NVME_EFFECTS_CSUPP |
                                              NVME_EFFECTS_LBCC;
+    effects->iocs[NVME_CMD_ZONE_APPEND] = NVME_EFFECTS_CSUPP |
+                                          NVME_EFFECTS_LBCC;
 }
 
 static uint16_t nvme_effects_log(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
@@ -4169,6 +4212,11 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
         return;
     }
 
+    if (params->zns.zasl && params->zns.zasl > params->mdts) {
+        error_setg(errp, "zns.zasl must be less than or equal to mdts");
+        return;
+    }
+
     if (n->pmrdev) {
         if (host_memory_backend_is_mapped(n->pmrdev)) {
             error_setg(errp, "can't use already busy memdev: %s",
@@ -4364,12 +4412,16 @@ static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 {
     NvmeIdCtrl *id = &n->id_ctrl;
+    NvmeIdCtrlZns *id_zns;
     uint8_t *pci_conf = pci_dev->config;
     char *subnqn;
 
     n->id_ctrl_iocss[NVME_IOCS_NVM] = g_new0(NvmeIdCtrl, 1);
     n->id_ctrl_iocss[NVME_IOCS_ZONED] = g_new0(NvmeIdCtrl, 1);
 
+    id_zns = n->id_ctrl_iocss[NVME_IOCS_ZONED];
+    id_zns->zasl = n->params.zns.zasl;
+
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
     strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
@@ -4511,6 +4563,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT32("aer_max_queued", NvmeCtrl, params.aer_max_queued, 64),
     DEFINE_PROP_UINT8("mdts", NvmeCtrl, params.mdts, 7),
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
+    DEFINE_PROP_UINT8("zns.zasl", NvmeCtrl, params.zns.zasl, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/trace-events b/hw/block/trace-events
index f62dfda279cd..221dc1af36c9 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -114,6 +114,7 @@ pci_nvme_mmio_shutdown_cleared(void) "shutdown bit cleared"
 
 # nvme traces for error conditions
 pci_nvme_err_mdts(uint16_t cid, size_t len) "cid %"PRIu16" len %zu"
+pci_nvme_err_zasl(uint16_t cid, size_t len) "cid %"PRIu16" len %zu"
 pci_nvme_err_req_status(uint16_t cid, uint32_t nsid, uint16_t status, uint8_t opc) "cid %"PRIu16" nsid %"PRIu32" status 0x%"PRIx16" opc 0x%"PRIx8""
 pci_nvme_err_addr_read(uint64_t addr) "addr 0x%"PRIx64""
 pci_nvme_err_addr_write(uint64_t addr) "addr 0x%"PRIx64""
-- 
2.29.2


