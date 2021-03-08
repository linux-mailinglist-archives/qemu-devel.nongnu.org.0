Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423AD330EC0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:57:51 +0100 (CET)
Received: from localhost ([::1]:55770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFSI-0005sa-4f
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvU-0003Qi-DY; Mon, 08 Mar 2021 07:23:56 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:41673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvP-000728-86; Mon, 08 Mar 2021 07:23:56 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4AEC836C8;
 Mon,  8 Mar 2021 07:23:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=9wW2xg3xwzRaG
 Hsq5DPf18rqGq7aMukjO3Oasu830dU=; b=FDlj7ULqmFr3hvninqCG+gDW7TU43
 wnLczUS5ZzFeF2WVe+5X77tDHgg1GDihRIM/AOITdhKukn8E95HNvebKpPflfjDH
 C/kg8mtW8/dQYf8O7p4PJLcg/XTNbUl2DSFUqNeS5NjatsZFiY3Dh8w2RjRguCH+
 JSGBvkt36D5JRmuC1yLb7X5HMp383zAeKN2XT1uJIfEB7aeW/k/Fnk+6ozhFdpgP
 gqedrUded0kdm0lvRJfwhH4D3Z5yT+rN9Q5IzxGp0xz8wTqzkLOUMoMI5YKaXOV3
 IciDxmVyfRHMw/bH8C42tbnFqi2G566r/MI3syLgcfcIfoL3AwuKpU+6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=9wW2xg3xwzRaGHsq5DPf18rqGq7aMukjO3Oasu830dU=; b=J1FSlK2p
 k+CMlD3FOdc59KMI9wRoh3z5sVGLHGUw1DUjYvkVYecIE9nEkESInP1wJzBglrGX
 WcfHFVy7NS62QfAl8hA/ur5s2jEFh6fnn6rVLrOvCXnhnInbdM+VdFu3hd9Rnb7y
 Pml5+9GJY3Xvgqt5ndWDcXFhfpDncoNb8Lcm/kMdMdagvMejtu0X+5Ro6Xh/ZZPK
 c+P8kNsJlXJ+vtKM2rJ3KCVCpbR9YXOKvyHg8KTxKEgayr7hckOCyYLG0m7nBDoq
 jBhAFiVjlj8XERq5mV2G+FiHl5dVN8FCurJuUox6fk9xQiAwOZpqffNGMoeN9c4e
 8hbZUaIqhwX4Gg==
X-ME-Sender: <xms:URdGYBuEDcTiHMI_GYrRCDfMdM2-IJgitqZI1rM9KM7QN0ELb7s3WQ>
 <xme:URdGYKedSxm42EKvqkZJwQ5MZ3e4SdtHQJ-RCTiYBF2FpQAMJkbAKT8x1QErh8cMF
 P1nxWdM6MyHwIxZi00>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduvd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:URdGYEyCKtQhRZ1tetyp4EFBJE7XTsIhsjmmlfsilDnPoYqvQhypxQ>
 <xmx:URdGYIMuHdKBi6ryVrghPyDyKOLe2zqKOzx_E75BVTm4fiuHWDvkdg>
 <xmx:URdGYB9EPmUeARptXL_ikA3o4--FJX5u0En9wseU1mFMNeOp32EtIg>
 <xmx:URdGYKPfgwWBPp7cFZQ9F-wWuYBKbFHqSl_uNt2c6TVIH2qm5y8b8Q>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 88CC01080063;
 Mon,  8 Mar 2021 07:23:44 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 19/38] hw/block/nvme: align zoned.zasl with mdts
Date: Mon,  8 Mar 2021 13:22:54 +0100
Message-Id: <20210308122313.286938-20-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
index 25a7726ca05b..01be8a1620be 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -21,8 +21,8 @@
  *              cmb_size_mb=<cmb_size_mb[optional]>, \
  *              [pmrdev=<mem_backend_file_id>,] \
  *              max_ioqpairs=<N[optional]>, \
- *              aerl=<N[optional]>, aer_max_queued=<N[optional]>, \
- *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]>, \
+ *              aerl=<N[optional]>,aer_max_queued=<N[optional]>, \
+ *              mdts=<N[optional]>,zoned.zasl=<N[optional]>, \
  *              subsys=<subsys_id> \
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
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


