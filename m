Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A9133255D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:22:21 +0100 (CET)
Received: from localhost ([::1]:49850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbNS-0005rh-7y
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaoF-0000FJ-QI; Tue, 09 Mar 2021 06:45:56 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:55011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJao8-0000Wc-5O; Tue, 09 Mar 2021 06:45:54 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0E764277D;
 Tue,  9 Mar 2021 06:45:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:45:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=sutYCGjlvLUxW
 TbCNN8K+RVTXbb/J4WzRLvRbkHGppI=; b=k8+hyKRFaLxpmlcH1cab4NZ+cke3G
 Sv2ikZTx8UTkwSTuoxGbNTVNWo9DyQPaoTfKjPV6vtToa8PUpt81+NMXb9oGOWiH
 yKTHpeLK/Dqdrm+DSSbHUso1RNUbcTg7BYm2MZjHCvCQU4ZPcnNt9y4bFxKpVSNu
 04lYYQbcy4uLfq9fSiCjcRwSD1x4ryfOmeLK/GKpTBzHwczPaVXt+NnazbYzAsxT
 5/VdNg9ktI+GSM8T8YsmZwgqinzucxkqYUOtKWaYUa+bRNKsci8/vpXom7eEPkPh
 ZlxsrOAkUcB70in9AEpvKf/ue36ZP2Qr+2apnlNVJJicXt1lmbWQK9Zkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=sutYCGjlvLUxWTbCNN8K+RVTXbb/J4WzRLvRbkHGppI=; b=UmK9DOvC
 LEIlhDEceWrW34NFFyMOYEi/7tuLFImua3lUklaqWiIsJwdKfzxkg8CzKn7BZI69
 wP187K4zsUhIy4ipmkJzkmIlf7m+3+FY8BKRtt2NlFwReyzx2hSjGLR3fXplmgHf
 6+FP6pcnRt5ZK8d3GD5ehCS12ELZnHAszmsDEt5OtvsffbG3J6SJ7DwP0DzK9RFY
 ose+b6eoLkeQ8qMQIqY9RroaR1FNUt72CRBPGLv7zMG23F0HxPbjfr7pcORpH8gz
 FATU3I1HOoPDtRkHM/zmjtk7wSrVuMXzFyxNJQrzW1wds687DPDZVev0qBI+Ln7m
 n+2CnS99UDi4MQ==
X-ME-Sender: <xms:6V9HYNUEZJbEZ2UZ_hI9hKyvhXhVQ2T3SvIxE_FLIS-J_5V0O5vdvA>
 <xme:6V9HYNmIP1cg2y8ELS1zywFJKsqVv1S7Sa0cti2BM2mK-sRYBVeGwLD4Ye9n8loh5
 NPjo3_chzZQysL11Uo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:6V9HYJaSbIig8-6ve3BfQnuyTYchHXWYeTXfdyzmONbulCn8EBrMrA>
 <xmx:6V9HYAWaGB0vj3l2jFyblAZ-58IeZOZ42903ADZivXoBeU17pfmycg>
 <xmx:6V9HYHnWuQwzX-QF-VSk7uQTxmDNrMWU_5c31aKpWRlTFpR9r5plXg>
 <xmx:6V9HYFX78PpS2-pG-NFDuCT78QrAMaO_JFhB-vnFzmBdePin_b4cpg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4D00224005A;
 Tue,  9 Mar 2021 06:45:44 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 19/38] hw/block/nvme: align zoned.zasl with mdts
Date: Tue,  9 Mar 2021 12:44:53 +0100
Message-Id: <20210309114512.536489-20-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

ZASL (Zone Append Size Limit) is defined exactly like MDTS (Maximum Data
Transfer Size), that is, it is a value in units of the minimum memory
page size (CAP.MPSMIN) and is reported as a power of two.

The 'mdts' nvme device parameter is specified as in the spec, but the
'zoned.append_size_limit' parameter is specified in bytes. This is
suboptimal for a number of reasons:

  1. It is just plain confusing wrt. the definition of mdts.
  2. There is a lot of complexity involved in validating the value; it
     must be a power of two, it should be larger than 4k, if it is zero
     we set it internally to mdts, but still report it as zero.
  3. While "hw/block/nvme: improve invalid zasl value reporting"
     slightly improved the handling of the parameter, the validation is
     still wrong; it does not depend on CC.MPS, it depends on
     CAP.MPSMIN. And we are not even checking that it is actually less
     than or equal to MDTS, which is kinda the *one* condition it must
     satisfy.

Fix this by defining zasl exactly like mdts and checking the one thing
that it must satisfy (that it is less than or equal to mdts). Also,
change the default value from 128KiB to 0 (aka, whatever mdts is).

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.h       |  4 +--
 hw/block/nvme.c       | 59 +++++++++++++------------------------------
 hw/block/trace-events |  2 +-
 3 files changed, 19 insertions(+), 46 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index cb2b5175f1a1..f45ace0cff5b 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -20,7 +20,7 @@ typedef struct NvmeParams {
     uint32_t aer_max_queued;
     uint8_t  mdts;
     bool     use_intel_id;
-    uint32_t zasl_bs;
+    uint8_t  zasl;
     bool     legacy_cmb;
 } NvmeParams;
 
@@ -171,8 +171,6 @@ typedef struct NvmeCtrl {
     QTAILQ_HEAD(, NvmeAsyncEvent) aer_queue;
     int         aer_queued;
 
-    uint8_t     zasl;
-
     NvmeSubsystem   *subsys;
 
     NvmeNamespace   namespace;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index b7ec9dccc0fa..23e1c91ed258 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -22,8 +22,8 @@
  *              cmb_size_mb=<cmb_size_mb[optional]>, \
  *              [pmrdev=<mem_backend_file_id>,] \
  *              max_ioqpairs=<N[optional]>, \
- *              aerl=<N[optional]>, aer_max_queued=<N[optional]>, \
- *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]>, \
+ *              aerl=<N[optional]>,aer_max_queued=<N[optional]>, \
+ *              mdts=<N[optional]>,zoned.zasl=<N[optional]>, \
  *              subsys=<subsys_id>
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
@@ -78,13 +78,11 @@
  *   as a power of two (2^n) and is in units of the minimum memory page size
  *   (CAP.MPSMIN). The default value is 7 (i.e. 512 KiB).
  *
- * - `zoned.append_size_limit`
- *   The maximum I/O size in bytes that is allowed in Zone Append command.
- *   The default is 128KiB. Since internally this this value is maintained as
- *   ZASL = log2(<maximum append size> / <page size>), some values assigned
- *   to this property may be rounded down and result in a lower maximum ZA
- *   data size being in effect. By setting this property to 0, users can make
- *   ZASL to be equal to MDTS. This property only affects zoned namespaces.
+ * - `zoned.zasl`
+ *   Indicates the maximum data transfer size for the Zone Append command. Like
+ *   `mdts`, the value is specified as a power of two (2^n) and is in units of
+ *   the minimum memory page size (CAP.MPSMIN). The default value is 0 (i.e.
+ *   defaulting to the value of `mdts`).
  *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -2144,10 +2142,9 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
                 goto invalid;
             }
 
-            if (nvme_l2b(ns, nlb) > (n->page_size << n->zasl)) {
-                trace_pci_nvme_err_append_too_large(slba, nlb, n->zasl);
-                status = NVME_INVALID_FIELD;
-                goto invalid;
+            if (n->params.zasl && data_size > n->page_size << n->params.zasl) {
+                trace_pci_nvme_err_zasl(data_size);
+                return NVME_INVALID_FIELD | NVME_DNR;
             }
 
             slba = zone->w_ptr;
@@ -3221,9 +3218,8 @@ static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
     if (c->csi == NVME_CSI_NVM) {
         return nvme_rpt_empty_id_struct(n, req);
     } else if (c->csi == NVME_CSI_ZONED) {
-        if (n->params.zasl_bs) {
-            id.zasl = n->zasl;
-        }
+        id.zasl = n->params.zasl;
+
         return nvme_dma(n, (uint8_t *)&id, sizeof(id),
                         DMA_DIRECTION_FROM_DEVICE, req);
     }
@@ -4097,19 +4093,6 @@ static int nvme_start_ctrl(NvmeCtrl *n)
     nvme_init_sq(&n->admin_sq, n, n->bar.asq, 0, 0,
                  NVME_AQA_ASQS(n->bar.aqa) + 1);
 
-    if (!n->params.zasl_bs) {
-        n->zasl = n->params.mdts;
-    } else {
-        if (n->params.zasl_bs < n->page_size) {
-            NVME_GUEST_ERR(pci_nvme_err_startfail_zasl_too_small,
-                           "Zone Append Size Limit (ZASL) of %d bytes is too "
-                           "small; must be at least %d bytes",
-                           n->params.zasl_bs, n->page_size);
-            return -1;
-        }
-        n->zasl = 31 - clz32(n->params.zasl_bs / n->page_size);
-    }
-
     nvme_set_timestamp(n, 0ULL);
 
     QTAILQ_INIT(&n->aer_queue);
@@ -4618,17 +4601,10 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
         host_memory_backend_set_mapped(n->pmr.dev, true);
     }
 
-    if (n->params.zasl_bs) {
-        if (!is_power_of_2(n->params.zasl_bs)) {
-            error_setg(errp, "zone append size limit has to be a power of 2");
-            return;
-        }
-
-        if (n->params.zasl_bs < 4096) {
-            error_setg(errp, "zone append size limit must be at least "
-                       "4096 bytes");
-            return;
-        }
+    if (n->params.zasl > n->params.mdts) {
+        error_setg(errp, "zoned.zasl (Zone Append Size Limit) must be less "
+                   "than or equal to mdts (Maximum Data Transfer Size)");
+        return;
     }
 }
 
@@ -4997,8 +4973,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT8("mdts", NvmeCtrl, params.mdts, 7),
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
-    DEFINE_PROP_SIZE32("zoned.append_size_limit", NvmeCtrl, params.zasl_bs,
-                       NVME_DEFAULT_MAX_ZA_SIZE),
+    DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/trace-events b/hw/block/trace-events
index e1a85661cf3f..25ba51ea5405 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -115,6 +115,7 @@ pci_nvme_clear_ns_reset(uint32_t state, uint64_t slba) "zone state=%"PRIu32", sl
 
 # nvme traces for error conditions
 pci_nvme_err_mdts(size_t len) "len %zu"
+pci_nvme_err_zasl(size_t len) "len %zu"
 pci_nvme_err_req_status(uint16_t cid, uint32_t nsid, uint16_t status, uint8_t opc) "cid %"PRIu16" nsid %"PRIu32" status 0x%"PRIx16" opc 0x%"PRIx8""
 pci_nvme_err_addr_read(uint64_t addr) "addr 0x%"PRIx64""
 pci_nvme_err_addr_write(uint64_t addr) "addr 0x%"PRIx64""
@@ -144,7 +145,6 @@ pci_nvme_err_zone_boundary(uint64_t slba, uint32_t nlb, uint64_t zcap) "lba 0x%"
 pci_nvme_err_zone_invalid_write(uint64_t slba, uint64_t wp) "lba 0x%"PRIx64" wp 0x%"PRIx64""
 pci_nvme_err_zone_write_not_ok(uint64_t slba, uint32_t nlb, uint16_t status) "slba=%"PRIu64", nlb=%"PRIu32", status=0x%"PRIx16""
 pci_nvme_err_zone_read_not_ok(uint64_t slba, uint32_t nlb, uint16_t status) "slba=%"PRIu64", nlb=%"PRIu32", status=0x%"PRIx16""
-pci_nvme_err_append_too_large(uint64_t slba, uint32_t nlb, uint8_t zasl) "slba=%"PRIu64", nlb=%"PRIu32", zasl=%"PRIu8""
 pci_nvme_err_insuff_active_res(uint32_t max_active) "max_active=%"PRIu32" zone limit exceeded"
 pci_nvme_err_insuff_open_res(uint32_t max_open) "max_open=%"PRIu32" zone limit exceeded"
 pci_nvme_err_zd_extension_map_error(uint32_t zone_idx) "can't map descriptor extension for zone_idx=%"PRIu32""
-- 
2.30.1


