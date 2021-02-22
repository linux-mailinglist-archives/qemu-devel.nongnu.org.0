Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1883220D8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 21:34:48 +0100 (CET)
Received: from localhost ([::1]:44496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEHup-0007ut-7N
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 15:34:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEHpl-0006BV-7s; Mon, 22 Feb 2021 15:29:33 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:59125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEHpi-0007JO-Mn; Mon, 22 Feb 2021 15:29:33 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B698F5C01C9;
 Mon, 22 Feb 2021 15:29:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 22 Feb 2021 15:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Y0v696S6ADZXr
 LR5wRJs4zl0XUpa+y3LXPTwR84oOaU=; b=MZY3CaX62zdLdRMUIpFLCYFFOPa3l
 4LA88jfHx4lREn8tSPiVS+bPvY4iBcUVwL2ss0zTTKEJ1gWkzep/SlMq7wlzoWQY
 MLg48H9KwZ6/fyNgZ6Kt6dexq0ryOG5E3hR0M++4I6itGQC3/iVrMwMF4V2kTPpg
 mFBbxDfO1HOYfA5Y9edC58RJ8+Eez/J/ZCGYR8/yqZmpqZ5d96spzdvcrvgH304F
 I8elBbS53F0mQPvIDfJqJJ8VOe89mmuEttM78+GirMfwux1H8faK48hledq88tIB
 yohn04s0BprOELiTUFFYblCS95rlK6EgND6YNaL5ZF/U8/dX6ZtmbeE2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Y0v696S6ADZXrLR5wRJs4zl0XUpa+y3LXPTwR84oOaU=; b=Iw8P1o5v
 sp+XJbF8ydAAvBwX+0onr2pskP17ZDo1PgEvceHxTf07uKP65j+6J38cocy/rivt
 uf/ndNYanB/pf9awQbJLJ7nkG8dm0o4PUcsWYZRxUiBmxV8tlWk50MRh8WLf831f
 j4YYs0LDviCsuF+rEbRt+cWIJrEI1eytuJFWm+fob5khurEE8AkSHNxW/+ti9XHe
 Hux43Xr9x24iReBaefVG2DR2K4XIAT/J5y12O7P+9nwscN4APlgEQ2z7PxyW74vF
 waxgulSOf9LwJy9x2/ZGCabMOOBhsdi7C81nVYR8O2jOLWeBzeMHgFldaL59alsa
 0NivHM4YBVcMXA==
X-ME-Sender: <xms:KRQ0YG8nJdwJCpJLdN60iYtteuz4VCWViPjO94ozJMY6hH2ETFf34Q>
 <xme:KRQ0YIvvtTW7DplI4EYYjBx-PNTgDq8igOVn8JVqQIMAYORRO6sT8_5DEXzts25mX
 ZJJInXSE-YA8vf1h5I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgddufeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:KRQ0YFZhRxqwKG7H1obS_gib5pUrSxzAvJ9FD0QNDg8fp3UZgTXr1Q>
 <xmx:KRQ0YAqrREJqf7BifWxB2RSnVeOloObLreBVEfIXRn3EDcocgWxaqQ>
 <xmx:KRQ0YC-8ygPGkvQr-M971uSQaLNv_Ve5IHJ5PYJUTmLPJobbxYC2mw>
 <xmx:KRQ0YKo1oKzVXa5N-Xq79jBr0j8q6dhvaUeMhQaICmIgL7ovxyPl_A>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B5F4E240062;
 Mon, 22 Feb 2021 15:29:28 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/block/nvme: align zoned.zasl with mdts
Date: Mon, 22 Feb 2021 21:29:21 +0100
Message-Id: <20210222202921.92774-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222202921.92774-1-its@irrelevant.dk>
References: <20210222202921.92774-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
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
---
 hw/block/nvme.h       |  4 +---
 hw/block/nvme.c       | 55 ++++++++++++-------------------------------
 hw/block/trace-events |  2 +-
 3 files changed, 17 insertions(+), 44 deletions(-)

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
index 25a7726ca05b..edd0b85c10ce 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -69,13 +69,11 @@
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
@@ -2135,10 +2133,9 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
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
@@ -3212,9 +3209,8 @@ static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
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
@@ -4088,19 +4084,6 @@ static int nvme_start_ctrl(NvmeCtrl *n)
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
@@ -4609,17 +4592,10 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
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
 
@@ -4988,8 +4964,7 @@ static Property nvme_props[] = {
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


