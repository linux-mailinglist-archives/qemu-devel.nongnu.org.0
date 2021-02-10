Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02450315FE1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 08:13:50 +0100 (CET)
Received: from localhost ([::1]:49540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9jh6-0008Te-U8
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 02:13:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9jaV-0006aH-B0; Wed, 10 Feb 2021 02:06:59 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:50189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9jaR-0003Al-Ir; Wed, 10 Feb 2021 02:06:59 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9EB7DB61;
 Wed, 10 Feb 2021 02:06:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 10 Feb 2021 02:06:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=dV9A4OAfZi5wc
 o1Mc9RuKZ+es+AxdMteWINYVa3wROg=; b=z+OCCfrWtb5tZiqQUXMyzVsrbh5Ui
 ml5+kf+LzUAwWK47JeC54i4lOIQrFDSs3CcPVPWCthHHOqE6cuPylxNg1PulMcMS
 1bXGQCQ6fSZu+EiQ5vCtUCeWfl5rpm/cWsv4YYF+VbTqhphQow4Fgigc0WtaWY+8
 CGGdIhWT521okUKoOaGSVFi/9jCDIHZ7NXLCooTSpAd+vQKu0T9zZ5ndBGCGBIQO
 lpyU061oP81QV+Iy4EJelrYoeckzZYkejhfDmWi2tass5F93U8gbzvsf5vVGeBQ4
 chiA3ux5YAo6gVCgOQYDdsgU4rgw51H1l/KMV32eNI58hfSGXuZa6+L1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=dV9A4OAfZi5wco1Mc9RuKZ+es+AxdMteWINYVa3wROg=; b=D0/fn9J4
 4zfhABqLpRwgagz8C043xRx9gsSNvVSo0cqkZbAXqrw5VS6Tv08qtuII5fW5KOVq
 YaGrKBD+CAyl82/o5fXv6jyAf38BW9E5+95GG711YCEeL1yjMvmENMKttp5bDaFl
 9X0SoS/cpRgVBClKO6qDnNS3Ovl0EUqmyCZLQQTWidgIaomlOuqIjyzILbwMpGQx
 YC93Gsq1ZY/dB3p/uzrozYqAesJliSdwItKqR7cc0dSTdBZYizmVubaQKByxbfz9
 ifL3mn9kLmKYjgtSdEVB+cQIHUUvOqhrdHvxV+F4IkSWJnZNQPStgQws1lmfS6p6
 9kWqolDhH3cVqw==
X-ME-Sender: <xms:DYYjYIwY01aVY_oqnsIvbznsOTs88nSANoKhOkFCjLLNfeiukt5uKg>
 <xme:DYYjYMRX9fAhl_XhnvQE3AKMrQVfjj7u7bmVcthI4Tbgyx3P4XBv-iwdscVcUBIiA
 i6n6Mbv1Acg7lOvDFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeigddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:DYYjYKXOYN0LB0-78AQ-fE6DhQ-abzqtbpUzy4fhF0-qLCsUNQAhvw>
 <xmx:DYYjYGim3xbBp1RKoplHAQJKI9DPSUsrKwW5qf8OKoNiAReHXBRYyQ>
 <xmx:DYYjYKAO34BgDWogGyfpKAG1jOaQB5O0zvVbY4E1snuWTgdGRLG-LA>
 <xmx:DYYjYB7LWjiWz4RxzTStdnPEkqEWiPKLOCTjazpm_4O3AprKXYCMng>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1E9CF1080064;
 Wed, 10 Feb 2021 02:06:52 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/block/nvme: add write uncorrectable command
Date: Wed, 10 Feb 2021 08:06:46 +0100
Message-Id: <20210210070646.730110-3-its@irrelevant.dk>
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

Add support for marking blocks invalid with the Write Uncorrectable
command. Block status is tracked in a (non-persistent) bitmap that is
checked on all reads and written to on all writes. This is potentially
expensive, so keep Write Uncorrectable disabled by default.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/specs/nvme.txt   |  3 ++
 hw/block/nvme-ns.h    |  2 ++
 hw/block/nvme.h       |  1 +
 hw/block/nvme-ns.c    |  2 ++
 hw/block/nvme.c       | 65 +++++++++++++++++++++++++++++++++++++------
 hw/block/trace-events |  1 +
 6 files changed, 66 insertions(+), 8 deletions(-)

diff --git a/docs/specs/nvme.txt b/docs/specs/nvme.txt
index 56d393884e7a..88f9cc278d4c 100644
--- a/docs/specs/nvme.txt
+++ b/docs/specs/nvme.txt
@@ -19,5 +19,8 @@ Known issues
 
 * The accounting numbers in the SMART/Health are reset across power cycles
 
+* Marking blocks invalid with the Write Uncorrectable is not persisted across
+  power cycles.
+
 * Interrupt Coalescing is not supported and is disabled by default in volation
   of the specification.
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 7af6884862b5..15fa422ded03 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -72,6 +72,8 @@ typedef struct NvmeNamespace {
     struct {
         uint32_t err_rec;
     } features;
+
+    unsigned long *uncorrectable;
 } NvmeNamespace;
 
 static inline uint32_t nvme_nsid(NvmeNamespace *ns)
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 98082b2dfba3..9b8f85b9cf16 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -68,6 +68,7 @@ static inline const char *nvme_io_opc_str(uint8_t opc)
     case NVME_CMD_FLUSH:            return "NVME_NVM_CMD_FLUSH";
     case NVME_CMD_WRITE:            return "NVME_NVM_CMD_WRITE";
     case NVME_CMD_READ:             return "NVME_NVM_CMD_READ";
+    case NVME_CMD_WRITE_UNCOR:      return "NVME_CMD_WRITE_UNCOR";
     case NVME_CMD_COMPARE:          return "NVME_NVM_CMD_COMPARE";
     case NVME_CMD_WRITE_ZEROES:     return "NVME_NVM_CMD_WRITE_ZEROES";
     case NVME_CMD_DSM:              return "NVME_NVM_CMD_DSM";
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index ade46e2f3739..742bbc4b4b62 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -72,6 +72,8 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     id_ns->mcl = cpu_to_le32(ns->params.mcl);
     id_ns->msrc = ns->params.msrc;
 
+    ns->uncorrectable = bitmap_new(id_ns->nsze);
+
     return 0;
 }
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index e5f6666725d7..56048046c193 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1112,6 +1112,20 @@ static uint16_t nvme_check_dulbe(NvmeNamespace *ns, uint64_t slba,
     return NVME_SUCCESS;
 }
 
+static inline uint16_t nvme_check_uncor(NvmeNamespace *ns, uint64_t slba,
+                                        uint32_t nlb)
+{
+    uint64_t elba = nlb + slba;
+
+    if (ns->uncorrectable) {
+        if (find_next_bit(ns->uncorrectable, elba, slba) < elba) {
+            return NVME_UNRECOVERED_READ | NVME_DNR;
+        }
+    }
+
+    return NVME_SUCCESS;
+}
+
 static void nvme_aio_err(NvmeRequest *req, int ret)
 {
     uint16_t status = NVME_SUCCESS;
@@ -1423,14 +1437,24 @@ static void nvme_rw_cb(void *opaque, int ret)
     BlockAcctCookie *acct = &req->acct;
     BlockAcctStats *stats = blk_get_stats(blk);
 
+    bool is_write = nvme_is_write(req);
+
     trace_pci_nvme_rw_cb(nvme_cid(req), blk_name(blk));
 
-    if (ns->params.zoned && nvme_is_write(req)) {
+    if (ns->params.zoned && is_write) {
         nvme_finalize_zoned_write(ns, req);
     }
 
     if (!ret) {
         block_acct_done(stats, acct);
+
+        if (is_write) {
+            NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+            uint64_t slba = le64_to_cpu(rw->slba);
+            uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
+
+            bitmap_clear(ns->uncorrectable, slba, nlb);
+        }
     } else {
         block_acct_failed(stats, acct);
         nvme_aio_err(req, ret);
@@ -1521,13 +1545,13 @@ static void nvme_copy_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
     NvmeNamespace *ns = req->ns;
+    NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
+    uint64_t sdlba = le64_to_cpu(copy->sdlba);
     struct nvme_copy_ctx *ctx = req->opaque;
 
     trace_pci_nvme_copy_cb(nvme_cid(req));
 
     if (ns->params.zoned) {
-        NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
-        uint64_t sdlba = le64_to_cpu(copy->sdlba);
         NvmeZone *zone = nvme_get_zone_by_slba(ns, sdlba);
 
         __nvme_advance_zone_wp(ns, zone, ctx->nlb);
@@ -1535,6 +1559,7 @@ static void nvme_copy_cb(void *opaque, int ret)
 
     if (!ret) {
         block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
+        bitmap_clear(ns->uncorrectable, sdlba, ctx->nlb);
     } else {
         block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
         nvme_aio_err(req, ret);
@@ -1953,6 +1978,12 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
+    status = nvme_check_uncor(ns, slba, nlb);
+    if (status) {
+        trace_pci_nvme_err_unrecoverable_read(slba, nlb);
+        return status;
+    }
+
     if (ns->params.zoned) {
         status = nvme_check_zone_read(ns, slba, nlb);
         if (status) {
@@ -1992,7 +2023,7 @@ invalid:
 }
 
 static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
-                              bool wrz)
+                              bool wrz, bool uncor)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
@@ -2008,7 +2039,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
     trace_pci_nvme_write(nvme_cid(req), nvme_io_opc_str(rw->opcode),
                          nvme_nsid(ns), nlb, data_size, slba);
 
-    if (!wrz) {
+    if (!wrz && !uncor) {
         status = nvme_check_mdts(n, data_size);
         if (status) {
             trace_pci_nvme_err_mdts(nvme_cid(req), data_size);
@@ -2055,6 +2086,11 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
         zone->w_ptr += nlb;
     }
 
+    if (uncor) {
+        bitmap_set(ns->uncorrectable, slba, nlb);
+        return NVME_SUCCESS;
+    }
+
     data_offset = nvme_l2b(ns, slba);
 
     if (!wrz) {
@@ -2087,17 +2123,22 @@ invalid:
 
 static inline uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req)
 {
-    return nvme_do_write(n, req, false, false);
+    return nvme_do_write(n, req, false, false, false);
 }
 
 static inline uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeRequest *req)
 {
-    return nvme_do_write(n, req, false, true);
+    return nvme_do_write(n, req, false, true, false);
 }
 
 static inline uint16_t nvme_zone_append(NvmeCtrl *n, NvmeRequest *req)
 {
-    return nvme_do_write(n, req, true, false);
+    return nvme_do_write(n, req, true, false, false);
+}
+
+static inline uint16_t nvme_write_uncor(NvmeCtrl *n, NvmeRequest *req)
+{
+    return nvme_do_write(n, req, false, false, true);
 }
 
 static uint16_t nvme_get_mgmt_zone_slba_idx(NvmeNamespace *ns, NvmeCmd *c,
@@ -2596,6 +2637,8 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_flush(n, req);
     case NVME_CMD_WRITE_ZEROES:
         return nvme_write_zeroes(n, req);
+    case NVME_CMD_WRITE_UNCOR:
+        return nvme_write_uncor(n, req);
     case NVME_CMD_ZONE_APPEND:
         return nvme_zone_append(n, req);
     case NVME_CMD_WRITE:
@@ -4514,6 +4557,11 @@ static void nvme_init_cse_iocs(NvmeCtrl *n)
     n->iocs.nvm[NVME_CMD_WRITE] = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC;
     n->iocs.nvm[NVME_CMD_READ]  = NVME_CMD_EFF_CSUPP;
 
+    if (oncs & NVME_ONCS_WRITE_UNCORR) {
+        n->iocs.nvm[NVME_CMD_WRITE_UNCOR] = NVME_CMD_EFF_CSUPP |
+            NVME_CMD_EFF_LBCC;
+    }
+
     if (oncs & NVME_ONCS_WRITE_ZEROES) {
         n->iocs.nvm[NVME_CMD_WRITE_ZEROES] = NVME_CMD_EFF_CSUPP |
             NVME_CMD_EFF_LBCC;
@@ -4853,6 +4901,7 @@ static void nvme_exit(PCIDevice *pci_dev)
         }
 
         nvme_ns_cleanup(ns);
+        g_free(ns->uncorrectable);
     }
 
     g_free(n->cq);
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 4b5ee04024f4..f30ef220c26a 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -128,6 +128,7 @@ pci_nvme_err_invalid_prp2_align(uint64_t prp2) "PRP2 is not page aligned: 0x%"PR
 pci_nvme_err_invalid_opc(uint8_t opc) "invalid opcode 0x%"PRIx8""
 pci_nvme_err_invalid_admin_opc(uint8_t opc) "invalid admin opcode 0x%"PRIx8""
 pci_nvme_err_invalid_lba_range(uint64_t start, uint64_t len, uint64_t limit) "Invalid LBA start=%"PRIu64" len=%"PRIu64" limit=%"PRIu64""
+pci_nvme_err_unrecoverable_read(uint64_t start, uint32_t nlb) "islba 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_err_invalid_log_page_offset(uint64_t ofs, uint64_t size) "must be <= %"PRIu64", got %"PRIu64""
 pci_nvme_err_cmb_invalid_cba(uint64_t cmbmsc) "cmbmsc 0x%"PRIx64""
 pci_nvme_err_cmb_not_enabled(uint64_t cmbmsc) "cmbmsc 0x%"PRIx64""
-- 
2.30.0


