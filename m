Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D02338283C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:24:13 +0200 (CEST)
Received: from localhost ([::1]:47322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZTw-0007BS-5A
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZO5-0003Nd-Mj; Mon, 17 May 2021 05:18:09 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:43957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZO3-0005mp-56; Mon, 17 May 2021 05:18:09 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id EDB1277A;
 Mon, 17 May 2021 05:18:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 17 May 2021 05:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=/y8i46iYJT6RH
 CZt8Eq5sG/BchLAXcCGf/hXMjzqnzM=; b=Bqo8nQOLU9k14yPd0p3vxJr8+GGi/
 rKgxThi81U/57x2nZvEc6OsklPlxNglX7GcimHS4PFb2BQCrYEjHK0Y4Qw9zaJMK
 a3f/9QUzk/Y1Dg4QyJmuHQfNRLjeQY9skRSmHGgGtlkb+zdRxZgobTjfKYDGRs2H
 FGxk2gRp6eF5yrVKntV99MYmNIeWubHLUJyfbtgsYXBOhZtzUgS0BHPLIwWIETTq
 NVavO04Vks9Ac1BCFcfuIMJq7IWu5kzhd3Fj6kXAK6McGn9ICItS0+3wX9BQYYY6
 ocU5LgoBnXQpX51oLxaIbWXMdDAjUzsFimfq1pANIeLi/GJixXJ1lFr1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=/y8i46iYJT6RHCZt8Eq5sG/BchLAXcCGf/hXMjzqnzM=; b=eud6NNto
 QhUd0uAeEKOyxANzatyHUbvPnYQ6Lh4190b6Wj91f5DB78+qX/5VytbF78xiD7wF
 YAlGlkzR5dIGWX4Piq8aPRQN2czB25n9JmoQC3pei4Ad8Pp0EOSdqKA6GF3T3HBg
 pL+DJIwrj0oIXDTl/XbmGgUUtUfgpUV/11N04SMb9j4S63hFfoo2p8tlv0MVlk6I
 WDlXSBkza64+sTllNJ/C1xG7c8wbdR1Yf3ROHjwn4UrRDZLsdtGPtN3mXrpvs7mR
 Wd8NGm3liYZsVv3m/FzFQloIx2c+gFHWvpf+cKfP2yckoZ7g2in+ca+j7IeDjM+G
 psYICqywSQguvA==
X-ME-Sender: <xms:yjSiYJhIae2_4veYL-Z-QPQrP_EPXvALt9oJRmVM0cFVwueegNuB3w>
 <xme:yjSiYOCUIrEFff45JNUQpIjxCV_pFpnbiCIFQ_JwBrGkmvsuzYZqyM0GPmQYVUU6g
 P4M7rn4W61NnGcnjHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeggeettdeufefhvefgudehjeevgeekkeetuefhieegveduleegfedvveegjeeg
 ueenucffohhmrghinhepnhhvmhgvgihprhgvshhsrdhorhhgnecukfhppeektddrudeije
 drleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:yjSiYJH7WvNuiGkDV6sgJxv98F2KvhnNvYe0_Hr0zO9-WDWVCpZoQw>
 <xmx:yjSiYOTOUEgvyLSwBiim9UFUr-wcjXJ4z-n6RRZ6yXUa_i7oTCLtzg>
 <xmx:yjSiYGyzvBJsmvx74DIIvYCTZNbhlCHfVoRAIxQT_CTYaRrDrdg4MQ>
 <xmx:yjSiYFnqcxWzsum_55YBWnYU__3y9xUkai0FdxZ6gwvZu2RllxuCOD6Vfbw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:18:00 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 06/20] hw/block/nvme: align with existing style
Date: Mon, 17 May 2021 11:17:23 +0200
Message-Id: <20210517091737.841787-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
References: <20210517091737.841787-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

While QEMU coding style prefers lowercase hexadecimals in constants, the
NVMe subsystem uses the format from the NVMe specifications in comments,
i.e. 'h' suffix instead of '0x' prefix.

Fix this up across the code base.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
[k.jensen: updated message; added conversion in a couple of missing comments]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 10 +++----
 hw/block/nvme-ns.c   |  2 +-
 hw/block/nvme.c      | 67 +++++++++++++++++++++++++-------------------
 3 files changed, 44 insertions(+), 35 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index e7fc119adb24..0ff9ce17a99e 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -848,8 +848,8 @@ enum NvmeStatusCodes {
     NVME_FW_REQ_SUSYSTEM_RESET  = 0x0110,
     NVME_NS_ALREADY_ATTACHED    = 0x0118,
     NVME_NS_PRIVATE             = 0x0119,
-    NVME_NS_NOT_ATTACHED        = 0x011A,
-    NVME_NS_CTRL_LIST_INVALID   = 0x011C,
+    NVME_NS_NOT_ATTACHED        = 0x011a,
+    NVME_NS_CTRL_LIST_INVALID   = 0x011c,
     NVME_CONFLICTING_ATTRS      = 0x0180,
     NVME_INVALID_PROT_INFO      = 0x0181,
     NVME_WRITE_TO_RO            = 0x0182,
@@ -1409,9 +1409,9 @@ typedef enum NvmeZoneState {
     NVME_ZONE_STATE_IMPLICITLY_OPEN  = 0x02,
     NVME_ZONE_STATE_EXPLICITLY_OPEN  = 0x03,
     NVME_ZONE_STATE_CLOSED           = 0x04,
-    NVME_ZONE_STATE_READ_ONLY        = 0x0D,
-    NVME_ZONE_STATE_FULL             = 0x0E,
-    NVME_ZONE_STATE_OFFLINE          = 0x0F,
+    NVME_ZONE_STATE_READ_ONLY        = 0x0d,
+    NVME_ZONE_STATE_FULL             = 0x0e,
+    NVME_ZONE_STATE_OFFLINE          = 0x0f,
 } NvmeZoneState;
 
 static inline void _nvme_check_size(void)
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 7bb618f18209..a0895614d9c3 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -303,7 +303,7 @@ static void nvme_ns_init_zoned(NvmeNamespace *ns)
 
     id_ns_z = g_malloc0(sizeof(NvmeIdNsZoned));
 
-    /* MAR/MOR are zeroes-based, 0xffffffff means no limit */
+    /* MAR/MOR are zeroes-based, FFFFFFFFFh means no limit */
     id_ns_z->mar = cpu_to_le32(ns->params.max_active_zones - 1);
     id_ns_z->mor = cpu_to_le32(ns->params.max_open_zones - 1);
     id_ns_z->zoc = 0;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 79a087a41ce8..baba949660f2 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -12,10 +12,19 @@
  * Reference Specs: http://www.nvmexpress.org, 1.4, 1.3, 1.2, 1.1, 1.0e
  *
  *  https://nvmexpress.org/developers/nvme-specification/
- */
-
-/**
- * Usage: add options:
+ *
+ *
+ * Notes on coding style
+ * ---------------------
+ * While QEMU coding style prefers lowercase hexadecimals in constants, the
+ * NVMe subsystem use thes format from the NVMe specifications in the comments
+ * (i.e. 'h' suffix instead of '0x' prefix).
+ *
+ * Usage
+ * -----
+ * See docs/system/nvme.rst for extensive documentation.
+ *
+ * Add options:
  *      -drive file=<file>,if=none,id=<drive_id>
  *      -device nvme-subsys,id=<subsys_id>,nqn=<nqn_id>
  *      -device nvme,serial=<serial>,id=<bus_name>, \
@@ -3613,18 +3622,18 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
 
     /*
      * In the base NVM command set, Flush may apply to all namespaces
-     * (indicated by NSID being set to 0xFFFFFFFF). But if that feature is used
+     * (indicated by NSID being set to FFFFFFFFh). But if that feature is used
      * along with TP 4056 (Namespace Types), it may be pretty screwed up.
      *
-     * If NSID is indeed set to 0xFFFFFFFF, we simply cannot associate the
+     * If NSID is indeed set to FFFFFFFFh, we simply cannot associate the
      * opcode with a specific command since we cannot determine a unique I/O
-     * command set. Opcode 0x0 could have any other meaning than something
+     * command set. Opcode 0h could have any other meaning than something
      * equivalent to flushing and say it DOES have completely different
-     * semantics in some other command set - does an NSID of 0xFFFFFFFF then
+     * semantics in some other command set - does an NSID of FFFFFFFFh then
      * mean "for all namespaces, apply whatever command set specific command
-     * that uses the 0x0 opcode?" Or does it mean "for all namespaces, apply
-     * whatever command that uses the 0x0 opcode if, and only if, it allows
-     * NSID to be 0xFFFFFFFF"?
+     * that uses the 0h opcode?" Or does it mean "for all namespaces, apply
+     * whatever command that uses the 0h opcode if, and only if, it allows NSID
+     * to be FFFFFFFFh"?
      *
      * Anyway (and luckily), for now, we do not care about this since the
      * device only supports namespace types that includes the NVM Flush command
@@ -3940,7 +3949,7 @@ static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
             NVME_CHANGED_NSID_SIZE) {
         /*
          * If more than 1024 namespaces, the first entry in the log page should
-         * be set to 0xffffffff and the others to 0 as spec.
+         * be set to FFFFFFFFh and the others to 0 as spec.
          */
         if (i == ARRAY_SIZE(nslist)) {
             memset(nslist, 0x0, sizeof(nslist));
@@ -4338,7 +4347,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
     trace_pci_nvme_identify_nslist(min_nsid);
 
     /*
-     * Both 0xffffffff (NVME_NSID_BROADCAST) and 0xfffffffe are invalid values
+     * Both FFFFFFFFh (NVME_NSID_BROADCAST) and FFFFFFFFEh are invalid values
      * since the Active Namespace ID List should return namespaces with ids
      * *higher* than the NSID specified in the command. This is also specified
      * in the spec (NVM Express v1.3d, Section 5.15.4).
@@ -4385,7 +4394,7 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
     trace_pci_nvme_identify_nslist_csi(min_nsid, c->csi);
 
     /*
-     * Same as in nvme_identify_nslist(), 0xffffffff/0xfffffffe are invalid.
+     * Same as in nvme_identify_nslist(), FFFFFFFFh/FFFFFFFFEh are invalid.
      */
     if (min_nsid >= NVME_NSID_BROADCAST - 1) {
         return NVME_INVALID_NSID | NVME_DNR;
@@ -4452,7 +4461,7 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
 
     /*
      * Because the NGUID and EUI64 fields are 0 in the Identify Namespace data
-     * structure, a Namespace UUID (nidt = 0x3) must be reported in the
+     * structure, a Namespace UUID (nidt = 3h) must be reported in the
      * Namespace Identification Descriptor. Add the namespace UUID here.
      */
     ns_descrs->uuid.hdr.nidt = NVME_NIDT_UUID;
@@ -4601,7 +4610,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
             /*
              * The Reservation Notification Mask and Reservation Persistence
              * features require a status code of Invalid Field in Command when
-             * NSID is 0xFFFFFFFF. Since the device does not support those
+             * NSID is FFFFFFFFh. Since the device does not support those
              * features we can always return Invalid Namespace or Format as we
              * should do for all other features.
              */
@@ -4850,15 +4859,15 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
         }
 
         /*
-         * NVMe v1.3, Section 5.21.1.7: 0xffff is not an allowed value for NCQR
+         * NVMe v1.3, Section 5.21.1.7: FFFFh is not an allowed value for NCQR
          * and NSQR.
          */
         if ((dw11 & 0xffff) == 0xffff || ((dw11 >> 16) & 0xffff) == 0xffff) {
             return NVME_INVALID_FIELD | NVME_DNR;
         }
 
-        trace_pci_nvme_setfeat_numq((dw11 & 0xFFFF) + 1,
-                                    ((dw11 >> 16) & 0xFFFF) + 1,
+        trace_pci_nvme_setfeat_numq((dw11 & 0xffff) + 1,
+                                    ((dw11 >> 16) & 0xffff) + 1,
                                     n->params.max_ioqpairs,
                                     n->params.max_ioqpairs);
         req->cqe.result = cpu_to_le32((n->params.max_ioqpairs - 1) |
@@ -5496,7 +5505,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             n->bar.cc = data;
         }
         break;
-    case 0x1C:  /* CSTS */
+    case 0x1c:  /* CSTS */
         if (data & (1 << 4)) {
             NVME_GUEST_ERR(pci_nvme_ub_mmiowr_ssreset_w1c_unsupported,
                            "attempted to W1C CSTS.NSSRO"
@@ -5508,7 +5517,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         }
         break;
     case 0x20:  /* NSSR */
-        if (data == 0x4E564D65) {
+        if (data == 0x4e564d65) {
             trace_pci_nvme_ub_mmiowr_ssreset_unsupported();
         } else {
             /* The spec says that writes of other values have no effect */
@@ -5578,11 +5587,11 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         n->bar.cmbmsc = (n->bar.cmbmsc & 0xffffffff) | (data << 32);
         return;
 
-    case 0xE00: /* PMRCAP */
+    case 0xe00: /* PMRCAP */
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrcap_readonly,
                        "invalid write to PMRCAP register, ignored");
         return;
-    case 0xE04: /* PMRCTL */
+    case 0xe04: /* PMRCTL */
         n->bar.pmrctl = data;
         if (NVME_PMRCTL_EN(data)) {
             memory_region_set_enabled(&n->pmr.dev->mr, true);
@@ -5593,19 +5602,19 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             n->pmr.cmse = false;
         }
         return;
-    case 0xE08: /* PMRSTS */
+    case 0xe08: /* PMRSTS */
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrsts_readonly,
                        "invalid write to PMRSTS register, ignored");
         return;
-    case 0xE0C: /* PMREBS */
+    case 0xe0C: /* PMREBS */
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrebs_readonly,
                        "invalid write to PMREBS register, ignored");
         return;
-    case 0xE10: /* PMRSWTP */
+    case 0xe10: /* PMRSWTP */
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrswtp_readonly,
                        "invalid write to PMRSWTP register, ignored");
         return;
-    case 0xE14: /* PMRMSCL */
+    case 0xe14: /* PMRMSCL */
         if (!NVME_CAP_PMRS(n->bar.cap)) {
             return;
         }
@@ -5625,7 +5634,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         }
 
         return;
-    case 0xE18: /* PMRMSCU */
+    case 0xe18: /* PMRMSCU */
         if (!NVME_CAP_PMRS(n->bar.cap)) {
             return;
         }
@@ -5667,7 +5676,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
          * from PMRSTS should ensure prior writes
          * made it to persistent media
          */
-        if (addr == 0xE08 &&
+        if (addr == 0xe08 &&
             (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
             memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
         }
-- 
2.31.1


