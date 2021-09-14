Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3699540B982
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 22:52:44 +0200 (CEST)
Received: from localhost ([::1]:41442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQFQ3-0007su-4D
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 16:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFC2-0005lX-94; Tue, 14 Sep 2021 16:38:14 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:34101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFBy-0004q8-M9; Tue, 14 Sep 2021 16:38:14 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B58E532009E0;
 Tue, 14 Sep 2021 16:38:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 14 Sep 2021 16:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=jq9RQoG8ltUtD
 HuGGelTxw1+wvJRYlWGKhGVu9ljr3s=; b=iaLDKHx30usfxon7+QkI7qAaEDd9I
 Ii1uEgf8oZNPjOjW7WnTU3rNw0Z+HLTTnGX0pID0X7bpKl0c4IMNN2/Db76ZL4u7
 0oXVoMGfA5FiRvMI8YkaQzntJT3b80yoE7NarEZfYDBpDHwupYYlwFPao3QO9nei
 YxaxomZ1nuv1IGWBJT6OvY5QOKzfp2RfSGnpeA2K3oiCCnnzWx9tROQAUzjXAcRs
 Dkw3rl4k8GFRRWG8MXQ4p8X1xZQEJwlsaSITKqmZ6QDJbVT7O0AqVhduc4mUjQss
 xGczSr3QnyTiqucDwVtmJIQ6htQKXc136IBS8PJbm+mR8PFqnrX3RHUrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=jq9RQoG8ltUtDHuGGelTxw1+wvJRYlWGKhGVu9ljr3s=; b=hoos0z8Z
 OxG03/J+c6cB154pnTVBUYKsaEEDL15bBcXYPr0i5rhz0k9L5Nqf1EWMe/nU+JmZ
 dG4+XyAnUwafHqUigHVqt31nbjSrBuypavTYR4T8cdDZpc/ReTbeWr5MivonbGCi
 pjjG/TCGAxDp/dt11VY7wqb/M8rOgEf3b5EXV0p3vSJtfC7ekStL9RsSdZ9O0+KB
 8TVY8+/bVUlAY0n+l8IBT0CVRxThvqxtisR4jmo0LMKWlRXFiWIrIGwY07hixZwP
 ugcOMec0f3eupufPIM6bajigyFVcZWO7eSwaRedSaOkT+zrBihbRwSdqa4gRwlEv
 Sc+L6tG0z/E4tA==
X-ME-Sender: <xms:LAhBYe03QWoG-rHbrXwbQXy77KxphC8C75mjDEpf-kzLuoiGEkCpPw>
 <xme:LAhBYRHadTI_MU68BHaz5jDot2WRP7EqLuHRdZj62z2opSuJ0wyfp3fXCzWBqGICG
 pstvdZXk4cCBdcZrIw>
X-ME-Received: <xmr:LAhBYW53JRtTpJrbBNYhOueQZqNhYbC0H-xTxMOWDx-Nln0-YE_XPStmhBZdHzMoukvIXylBYscr32iS_4biDuAUxV2kgSo9NHXmbOS4Eg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudegkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepieduheefjeetgeeufeefkefhlefgkeehteffgfetjeegkeeugfdtudejuedu
 geeinecuffhomhgrihhnpehuuhhiugdruggrthgrnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:LAhBYf0ZjPrF5F0WO3_5DQU0CilX1l7GdpsNUf7P7Rklwa4iq0FX8g>
 <xmx:LAhBYREjgCS6KNL49DSuZAwolWheiMOcyUU0_3K6lMg8YBMyFmwAlQ>
 <xmx:LAhBYY_QojzR4-PEKIuiNPRgLQ-kqLCCd7rxIHw7WY7KB8Y70bthyQ>
 <xmx:LQhBYXYX-cTgPL-K0NQktdjXQKR2XjC68ravkBj3HuWutsIZXYT_vg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 16:38:02 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 07/13] hw/nvme: hoist qdev state from namespace
Date: Tue, 14 Sep 2021 22:37:31 +0200
Message-Id: <20210914203737.182571-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914203737.182571-1-its@irrelevant.dk>
References: <20210914203737.182571-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
 Klaus Jensen <k.jensen@samsung.com>, Markus Armbruster <armbru@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c |  32 +++---
 hw/nvme/ns.c   | 265 ++++++++++++++++++++++++++-----------------------
 hw/nvme/nvme.h |  45 ++++++---
 3 files changed, 187 insertions(+), 155 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index f05d85075f08..966fba605d79 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4616,10 +4616,10 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
                 continue;
             }
         }
-        if (ns->params.nsid <= min_nsid) {
+        if (ns->nsid <= min_nsid) {
             continue;
         }
-        list_ptr[j++] = cpu_to_le32(ns->params.nsid);
+        list_ptr[j++] = cpu_to_le32(ns->nsid);
         if (j == data_len / sizeof(uint32_t)) {
             break;
         }
@@ -4664,10 +4664,10 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
                 continue;
             }
         }
-        if (ns->params.nsid <= min_nsid || c->csi != ns->csi) {
+        if (ns->nsid <= min_nsid || c->csi != ns->csi) {
             continue;
         }
-        list_ptr[j++] = cpu_to_le32(ns->params.nsid);
+        list_ptr[j++] = cpu_to_le32(ns->nsid);
         if (j == data_len / sizeof(uint32_t)) {
             break;
         }
@@ -4714,14 +4714,14 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
      */
     uuid.hdr.nidt = NVME_NIDT_UUID;
     uuid.hdr.nidl = NVME_NIDL_UUID;
-    memcpy(uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
+    memcpy(uuid.v, ns->uuid.data, NVME_NIDL_UUID);
     memcpy(pos, &uuid, sizeof(uuid));
     pos += sizeof(uuid);
 
-    if (ns->params.eui64) {
+    if (ns->eui64.v) {
         eui64.hdr.nidt = NVME_NIDT_EUI64;
         eui64.hdr.nidl = NVME_NIDL_EUI64;
-        eui64.v = cpu_to_be64(ns->params.eui64);
+        eui64.v = cpu_to_be64(ns->eui64.v);
         memcpy(pos, &eui64, sizeof(eui64));
         pos += sizeof(eui64);
     }
@@ -5260,7 +5260,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
                 return NVME_NS_ALREADY_ATTACHED | NVME_DNR;
             }
 
-            if (ns->attached && !ns->params.shared) {
+            if (ns->attached && !(ns->flags & NVME_NS_SHARED)) {
                 return NVME_NS_PRIVATE | NVME_DNR;
             }
 
@@ -5338,12 +5338,12 @@ static void nvme_format_set(NvmeNamespace *ns, NvmeCmd *cmd)
     uint8_t mset = (dw10 >> 4) & 0x1;
     uint8_t pil = (dw10 >> 8) & 0x1;
 
-    trace_pci_nvme_format_set(ns->params.nsid, lbaf, mset, pi, pil);
+    trace_pci_nvme_format_set(ns->nsid, lbaf, mset, pi, pil);
 
     nvm->id_ns.dps = (pil << 3) | pi;
     nvm->id_ns.flbas = lbaf | (mset << 4);
 
-    nvme_ns_init_format(ns);
+    nvme_ns_nvm_init_format(nvm);
 }
 
 static void nvme_format_ns_cb(void *opaque, int ret)
@@ -6544,7 +6544,7 @@ static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
 void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns)
 {
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
-    uint32_t nsid = ns->params.nsid;
+    uint32_t nsid = ns->nsid;
     assert(nsid && nsid <= NVME_MAX_NAMESPACES);
 
     n->namespaces[nsid] = ns;
@@ -6557,7 +6557,6 @@ void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns)
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
     NvmeCtrl *n = NVME(pci_dev);
-    NvmeNamespace *ns;
     Error *local_err = NULL;
 
     nvme_check_constraints(n, &local_err);
@@ -6582,12 +6581,11 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 
     /* setup a namespace if the controller drive property was given */
     if (n->namespace.blkconf.blk) {
-        ns = &n->namespace;
-        ns->params.nsid = 1;
+        NvmeNamespaceDevice *nsdev = &n->namespace;
+        NvmeNamespace *ns = &nsdev->ns;
+        ns->nsid = 1;
 
-        if (nvme_ns_setup(ns, errp)) {
-            return;
-        }
+        nvme_ns_init(ns);
 
         nvme_attach_ns(n, ns);
     }
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 0e231102c475..b411b184c253 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -26,9 +26,8 @@
 
 #define MIN_DISCARD_GRANULARITY (4 * KiB)
 
-void nvme_ns_init_format(NvmeNamespace *ns)
+void nvme_ns_nvm_init_format(NvmeNamespaceNvm *nvm)
 {
-    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeIdNs *id_ns = &nvm->id_ns;
     BlockDriverInfo bdi;
     int npdg, nlbas, ret;
@@ -48,7 +47,7 @@ void nvme_ns_init_format(NvmeNamespace *ns)
 
     npdg = nvm->discard_granularity / nvm->lbasz;
 
-    ret = bdrv_get_info(blk_bs(ns->blkconf.blk), &bdi);
+    ret = bdrv_get_info(blk_bs(nvm->blk), &bdi);
     if (ret >= 0 && bdi.cluster_size > nvm->discard_granularity) {
         npdg = bdi.cluster_size / nvm->lbasz;
     }
@@ -56,53 +55,39 @@ void nvme_ns_init_format(NvmeNamespace *ns)
     id_ns->npda = id_ns->npdg = npdg - 1;
 }
 
-static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
+void nvme_ns_init(NvmeNamespace *ns)
 {
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
-    static uint64_t ns_count;
     NvmeIdNs *id_ns = &nvm->id_ns;
     uint8_t ds;
     uint16_t ms;
     int i;
 
-    ns->csi = NVME_CSI_NVM;
-    ns->status = 0x0;
-
-    nvm->id_ns.dlfeat = 0x1;
+    id_ns->dlfeat = 0x1;
 
     /* support DULBE and I/O optimization fields */
     id_ns->nsfeat |= (0x4 | 0x10);
 
-    if (ns->params.shared) {
+    if (ns->flags & NVME_NS_SHARED) {
         id_ns->nmic |= NVME_NMIC_NS_SHARED;
     }
 
-    /* Substitute a missing EUI-64 by an autogenerated one */
-    ++ns_count;
-    if (!ns->params.eui64 && ns->params.eui64_default) {
-        ns->params.eui64 = ns_count + NVME_EUI64_DEFAULT;
-    }
-
     /* simple copy */
     id_ns->mssrl = cpu_to_le16(nvm->mssrl);
     id_ns->mcl = cpu_to_le32(nvm->mcl);
     id_ns->msrc = nvm->msrc;
-    id_ns->eui64 = cpu_to_be64(ns->params.eui64);
+    id_ns->eui64 = cpu_to_be64(ns->eui64.v);
 
     ds = 31 - clz32(nvm->lbasz);
-    ms = ns->params.ms;
+    ms = nvm->lbaf.ms;
 
     id_ns->mc = NVME_ID_NS_MC_EXTENDED | NVME_ID_NS_MC_SEPARATE;
 
-    if (ms && ns->params.mset) {
+    if (ms && nvm->flags & NVME_NS_NVM_EXTENDED_LBA) {
         id_ns->flbas |= NVME_ID_NS_FLBAS_EXTENDED;
     }
 
     id_ns->dpc = 0x1f;
-    id_ns->dps = ns->params.pi;
-    if (ns->params.pi && ns->params.pil) {
-        id_ns->dps |= NVME_ID_NS_DPS_FIRST_EIGHT;
-    }
 
     static const NvmeLBAF lbaf[16] = {
         [0] = { .ds =  9           },
@@ -135,59 +120,63 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     id_ns->flbas |= id_ns->nlbaf;
 
 lbaf_found:
-    nvme_ns_init_format(ns);
-
-    return 0;
+    nvme_ns_nvm_init_format(nvm);
 }
 
-static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
+static int nvme_nsdev_init_blk(NvmeNamespaceDevice *nsdev,
+                               Error **errp)
 {
+    NvmeNamespace *ns = &nsdev->ns;
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
+    BlockConf *blkconf = &nsdev->blkconf;
     bool read_only;
 
-    if (!blkconf_blocksizes(&ns->blkconf, errp)) {
+    if (!blkconf_blocksizes(blkconf, errp)) {
         return -1;
     }
 
-    read_only = !blk_supports_write_perm(ns->blkconf.blk);
-    if (!blkconf_apply_backend_options(&ns->blkconf, read_only, false, errp)) {
+    read_only = !blk_supports_write_perm(blkconf->blk);
+    if (!blkconf_apply_backend_options(blkconf, read_only, false, errp)) {
         return -1;
     }
 
-    if (ns->blkconf.discard_granularity == -1) {
-        ns->blkconf.discard_granularity =
-            MAX(ns->blkconf.logical_block_size, MIN_DISCARD_GRANULARITY);
+    if (blkconf->discard_granularity == -1) {
+        blkconf->discard_granularity =
+            MAX(blkconf->logical_block_size, MIN_DISCARD_GRANULARITY);
     }
 
-    nvm->lbasz = ns->blkconf.logical_block_size;
-    nvm->discard_granularity = ns->blkconf.discard_granularity;
+    nvm->lbasz = blkconf->logical_block_size;
+    nvm->discard_granularity = blkconf->discard_granularity;
     nvm->lbaf.ds = 31 - clz32(nvm->lbasz);
-    nvm->lbaf.ms = ns->params.ms;
+    nvm->lbaf.ms = nsdev->params.ms;
+    nvm->blk = blkconf->blk;
 
-    nvm->size = blk_getlength(ns->blkconf.blk);
+    nvm->size = blk_getlength(nvm->blk);
     if (nvm->size < 0) {
-        error_setg_errno(errp, -nvm->size, "could not get blockdev size");
+        error_setg_errno(errp, -(nvm->size), "could not get blockdev size");
         return -1;
     }
 
     return 0;
 }
 
-static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
+static int nvme_nsdev_zoned_check_calc_geometry(NvmeNamespaceDevice *nsdev,
+                                                Error **errp)
 {
+    NvmeNamespace *ns = &nsdev->ns;
     NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(ns);
     NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
 
     uint64_t zone_size, zone_cap;
 
     /* Make sure that the values of ZNS properties are sane */
-    if (ns->params.zone_size_bs) {
-        zone_size = ns->params.zone_size_bs;
+    if (nsdev->params.zone_size_bs) {
+        zone_size = nsdev->params.zone_size_bs;
     } else {
         zone_size = NVME_DEFAULT_ZONE_SIZE;
     }
-    if (ns->params.zone_cap_bs) {
-        zone_cap = ns->params.zone_cap_bs;
+    if (nsdev->params.zone_cap_bs) {
+        zone_cap = nsdev->params.zone_cap_bs;
     } else {
         zone_cap = zone_size;
     }
@@ -359,46 +348,47 @@ static void nvme_ns_zoned_shutdown(NvmeNamespaceZoned *zoned)
     assert(zoned->nr_open_zones == 0);
 }
 
-static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
+static int nvme_nsdev_check_constraints(NvmeNamespaceDevice *nsdev,
+                                        Error **errp)
 {
-    if (!ns->blkconf.blk) {
+    if (!nsdev->blkconf.blk) {
         error_setg(errp, "block backend not configured");
         return -1;
     }
 
-    if (ns->params.pi && ns->params.ms < 8) {
+    if (nsdev->params.pi && nsdev->params.ms < 8) {
         error_setg(errp, "at least 8 bytes of metadata required to enable "
                    "protection information");
         return -1;
     }
 
-    if (ns->params.nsid > NVME_MAX_NAMESPACES) {
+    if (nsdev->params.nsid > NVME_MAX_NAMESPACES) {
         error_setg(errp, "invalid namespace id (must be between 0 and %d)",
                    NVME_MAX_NAMESPACES);
         return -1;
     }
 
-    if (ns->params.zoned) {
-        if (ns->params.max_active_zones) {
-            if (ns->params.max_open_zones > ns->params.max_active_zones) {
+    if (nsdev->params.zoned) {
+        if (nsdev->params.max_active_zones) {
+            if (nsdev->params.max_open_zones > nsdev->params.max_active_zones) {
                 error_setg(errp, "max_open_zones (%u) exceeds "
-                           "max_active_zones (%u)", ns->params.max_open_zones,
-                           ns->params.max_active_zones);
+                           "max_active_zones (%u)", nsdev->params.max_open_zones,
+                           nsdev->params.max_active_zones);
                 return -1;
             }
 
-            if (!ns->params.max_open_zones) {
-                ns->params.max_open_zones = ns->params.max_active_zones;
+            if (!nsdev->params.max_open_zones) {
+                nsdev->params.max_open_zones = nsdev->params.max_active_zones;
             }
         }
 
-        if (ns->params.zd_extension_size) {
-            if (ns->params.zd_extension_size & 0x3f) {
+        if (nsdev->params.zd_extension_size) {
+            if (nsdev->params.zd_extension_size & 0x3f) {
                 error_setg(errp, "zone descriptor extension size must be a "
                            "multiple of 64B");
                 return -1;
             }
-            if ((ns->params.zd_extension_size >> 6) > 0xff) {
+            if ((nsdev->params.zd_extension_size >> 6) > 0xff) {
                 error_setg(errp,
                            "zone descriptor extension size is too large");
                 return -1;
@@ -409,35 +399,57 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
     return 0;
 }
 
-int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
+static int nvme_nsdev_setup(NvmeNamespaceDevice *nsdev, Error **errp)
 {
-    if (nvme_ns_check_constraints(ns, errp)) {
+    NvmeNamespaceNvm *nvm = NVME_NAMESPACE_NVM(&nsdev->ns);
+    static uint64_t ns_count;
+
+    if (nvme_nsdev_check_constraints(nsdev, errp)) {
         return -1;
     }
 
-    if (nvme_ns_init_blk(ns, errp)) {
-        return -1;
+    if (nsdev->params.shared) {
+        nsdev->ns.flags |= NVME_NS_SHARED;
     }
 
-    if (nvme_ns_init(ns, errp)) {
-        return -1;
-    }
-    if (ns->params.zoned) {
-        NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(ns);
+    nsdev->ns.nsid = nsdev->params.nsid;
+    memcpy(&nsdev->ns.uuid, &nsdev->params.uuid, sizeof(nsdev->ns.uuid));
 
-        if (nvme_ns_zoned_check_calc_geometry(ns, errp) != 0) {
+    if (nsdev->params.eui64) {
+        stq_be_p(&nsdev->ns.eui64.v, nsdev->params.eui64);
+    }
+
+    /* Substitute a missing EUI-64 by an autogenerated one */
+    ++ns_count;
+    if (!nsdev->ns.eui64.v && nsdev->params.eui64_default) {
+        nsdev->ns.eui64.v = ns_count + NVME_EUI64_DEFAULT;
+    }
+
+    nvm->id_ns.dps = nsdev->params.pi;
+    if (nsdev->params.pi && nsdev->params.pil) {
+        nvm->id_ns.dps |= NVME_ID_NS_DPS_FIRST_EIGHT;
+    }
+
+    nsdev->ns.csi = NVME_CSI_NVM;
+
+    nvme_ns_init(&nsdev->ns);
+
+    if (nsdev->params.zoned) {
+        NvmeNamespaceZoned *zoned = NVME_NAMESPACE_ZONED(&nsdev->ns);
+
+        if (nvme_nsdev_zoned_check_calc_geometry(nsdev, errp) != 0) {
             return -1;
         }
 
         /* copy device parameters */
-        zoned->zd_extension_size = ns->params.zd_extension_size;
-        zoned->max_open_zones = ns->params.max_open_zones;
-        zoned->max_active_zones = ns->params.max_open_zones;
-        if (ns->params.cross_zone_read) {
+        zoned->zd_extension_size = nsdev->params.zd_extension_size;
+        zoned->max_open_zones = nsdev->params.max_open_zones;
+        zoned->max_active_zones = nsdev->params.max_open_zones;
+        if (nsdev->params.cross_zone_read) {
             zoned->flags |= NVME_NS_ZONED_CROSS_READ;
         }
 
-        nvme_ns_zoned_init(ns);
+        nvme_ns_zoned_init(&nsdev->ns);
     }
 
     return 0;
@@ -445,12 +457,12 @@ int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
 
 void nvme_ns_drain(NvmeNamespace *ns)
 {
-    blk_drain(ns->blkconf.blk);
+    blk_drain(nvme_blk(ns));
 }
 
 void nvme_ns_shutdown(NvmeNamespace *ns)
 {
-    blk_flush(ns->blkconf.blk);
+    blk_flush(nvme_blk(ns));
     if (nvme_ns_zoned(ns)) {
         nvme_ns_zoned_shutdown(NVME_NAMESPACE_ZONED(ns));
     }
@@ -466,32 +478,34 @@ void nvme_ns_cleanup(NvmeNamespace *ns)
     }
 }
 
-static void nvme_ns_unrealize(DeviceState *dev)
+static void nvme_nsdev_unrealize(DeviceState *dev)
 {
-    NvmeNamespace *ns = NVME_NS(dev);
+    NvmeNamespaceDevice *nsdev = NVME_NAMESPACE_DEVICE(dev);
+    NvmeNamespace *ns = &nsdev->ns;
 
     nvme_ns_drain(ns);
     nvme_ns_shutdown(ns);
     nvme_ns_cleanup(ns);
 }
 
-static void nvme_ns_realize(DeviceState *dev, Error **errp)
+static void nvme_nsdev_realize(DeviceState *dev, Error **errp)
 {
-    NvmeNamespace *ns = NVME_NS(dev);
+    NvmeNamespaceDevice *nsdev = NVME_NAMESPACE_DEVICE(dev);
+    NvmeNamespace *ns = &nsdev->ns;
     BusState *s = qdev_get_parent_bus(dev);
     NvmeCtrl *n = NVME(s->parent);
     NvmeSubsystem *subsys = n->subsys;
-    uint32_t nsid = ns->params.nsid;
+    uint32_t nsid = nsdev->params.nsid;
     int i;
 
     if (!n->subsys) {
-        if (ns->params.detached) {
+        if (nsdev->params.detached) {
             error_setg(errp, "detached requires that the nvme device is "
                        "linked to an nvme-subsys device");
             return;
         }
 
-        if (ns->params.shared) {
+        if (nsdev->params.shared) {
             error_setg(errp, "shared requires that the nvme device is "
                        "linked to an nvme-subsys device");
             return;
@@ -506,7 +520,11 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (nvme_ns_setup(ns, errp)) {
+    if (nvme_nsdev_init_blk(nsdev, errp)) {
+        return;
+    }
+
+    if (nvme_nsdev_setup(nsdev, errp)) {
         return;
     }
 
@@ -516,7 +534,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
                 continue;
             }
 
-            nsid = ns->params.nsid = i;
+            nsid = ns->nsid = i;
             break;
         }
 
@@ -534,11 +552,11 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
     if (subsys) {
         subsys->namespaces[nsid] = ns;
 
-        if (ns->params.detached) {
+        if (nsdev->params.detached) {
             return;
         }
 
-        if (ns->params.shared) {
+        if (nsdev->params.shared) {
             for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
                 NvmeCtrl *ctrl = subsys->ctrls[i];
 
@@ -554,73 +572,74 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
     nvme_attach_ns(n, ns);
 }
 
-static Property nvme_ns_props[] = {
-    DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
-    DEFINE_PROP_BOOL("detached", NvmeNamespace, params.detached, false),
-    DEFINE_PROP_BOOL("shared", NvmeNamespace, params.shared, false),
-    DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
-    DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
-    DEFINE_PROP_UINT64("eui64", NvmeNamespace, params.eui64, 0),
-    DEFINE_PROP_UINT16("ms", NvmeNamespace, params.ms, 0),
-    DEFINE_PROP_UINT8("mset", NvmeNamespace, params.mset, 0),
-    DEFINE_PROP_UINT8("pi", NvmeNamespace, params.pi, 0),
-    DEFINE_PROP_UINT8("pil", NvmeNamespace, params.pil, 0),
-    DEFINE_PROP_UINT16("mssrl", NvmeNamespace, params.mssrl, 128),
-    DEFINE_PROP_UINT32("mcl", NvmeNamespace, params.mcl, 128),
-    DEFINE_PROP_UINT8("msrc", NvmeNamespace, params.msrc, 127),
-    DEFINE_PROP_BOOL("zoned", NvmeNamespace, params.zoned, false),
-    DEFINE_PROP_SIZE("zoned.zone_size", NvmeNamespace, params.zone_size_bs,
+static Property nvme_nsdev_props[] = {
+    DEFINE_BLOCK_PROPERTIES(NvmeNamespaceDevice, blkconf),
+    DEFINE_PROP_BOOL("detached", NvmeNamespaceDevice, params.detached, false),
+    DEFINE_PROP_BOOL("shared", NvmeNamespaceDevice, params.shared, false),
+    DEFINE_PROP_UINT32("nsid", NvmeNamespaceDevice, params.nsid, 0),
+    DEFINE_PROP_UUID("uuid", NvmeNamespaceDevice, params.uuid),
+    DEFINE_PROP_UINT64("eui64", NvmeNamespaceDevice, params.eui64, 0),
+    DEFINE_PROP_UINT16("ms", NvmeNamespaceDevice, params.ms, 0),
+    DEFINE_PROP_UINT8("mset", NvmeNamespaceDevice, params.mset, 0),
+    DEFINE_PROP_UINT8("pi", NvmeNamespaceDevice, params.pi, 0),
+    DEFINE_PROP_UINT8("pil", NvmeNamespaceDevice, params.pil, 0),
+    DEFINE_PROP_UINT16("mssrl", NvmeNamespaceDevice, params.mssrl, 128),
+    DEFINE_PROP_UINT32("mcl", NvmeNamespaceDevice, params.mcl, 128),
+    DEFINE_PROP_UINT8("msrc", NvmeNamespaceDevice, params.msrc, 127),
+    DEFINE_PROP_BOOL("zoned", NvmeNamespaceDevice, params.zoned, false),
+    DEFINE_PROP_SIZE("zoned.zone_size", NvmeNamespaceDevice, params.zone_size_bs,
                      NVME_DEFAULT_ZONE_SIZE),
-    DEFINE_PROP_SIZE("zoned.zone_capacity", NvmeNamespace, params.zone_cap_bs,
+    DEFINE_PROP_SIZE("zoned.zone_capacity", NvmeNamespaceDevice, params.zone_cap_bs,
                      0),
-    DEFINE_PROP_BOOL("zoned.cross_read", NvmeNamespace,
+    DEFINE_PROP_BOOL("zoned.cross_read", NvmeNamespaceDevice,
                      params.cross_zone_read, false),
-    DEFINE_PROP_UINT32("zoned.max_active", NvmeNamespace,
+    DEFINE_PROP_UINT32("zoned.max_active", NvmeNamespaceDevice,
                        params.max_active_zones, 0),
-    DEFINE_PROP_UINT32("zoned.max_open", NvmeNamespace,
+    DEFINE_PROP_UINT32("zoned.max_open", NvmeNamespaceDevice,
                        params.max_open_zones, 0),
-    DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespace,
+    DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespaceDevice,
                        params.zd_extension_size, 0),
-    DEFINE_PROP_BOOL("eui64-default", NvmeNamespace, params.eui64_default,
+    DEFINE_PROP_BOOL("eui64-default", NvmeNamespaceDevice, params.eui64_default,
                      true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void nvme_ns_class_init(ObjectClass *oc, void *data)
+static void nvme_nsdev_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 
     dc->bus_type = TYPE_NVME_BUS;
-    dc->realize = nvme_ns_realize;
-    dc->unrealize = nvme_ns_unrealize;
-    device_class_set_props(dc, nvme_ns_props);
+    dc->realize = nvme_nsdev_realize;
+    dc->unrealize = nvme_nsdev_unrealize;
+    device_class_set_props(dc, nvme_nsdev_props);
     dc->desc = "Virtual NVMe namespace";
 }
 
-static void nvme_ns_instance_init(Object *obj)
+static void nvme_nsdev_instance_init(Object *obj)
 {
-    NvmeNamespace *ns = NVME_NS(obj);
-    char *bootindex = g_strdup_printf("/namespace@%d,0", ns->params.nsid);
+    NvmeNamespaceDevice *nsdev = NVME_NAMESPACE_DEVICE(obj);
+    char *bootindex = g_strdup_printf("/namespace@%d,0",
+                                      nsdev->params.nsid);
 
-    device_add_bootindex_property(obj, &ns->bootindex, "bootindex",
+    device_add_bootindex_property(obj, &nsdev->bootindex, "bootindex",
                                   bootindex, DEVICE(obj));
 
     g_free(bootindex);
 }
 
-static const TypeInfo nvme_ns_info = {
-    .name = TYPE_NVME_NS,
+static const TypeInfo nvme_nsdev_info = {
+    .name = TYPE_NVME_NAMESPACE_DEVICE,
     .parent = TYPE_DEVICE,
-    .class_init = nvme_ns_class_init,
-    .instance_size = sizeof(NvmeNamespace),
-    .instance_init = nvme_ns_instance_init,
+    .class_init = nvme_nsdev_class_init,
+    .instance_size = sizeof(NvmeNamespaceDevice),
+    .instance_init = nvme_nsdev_instance_init,
 };
 
-static void nvme_ns_register_types(void)
+static void register_types(void)
 {
-    type_register_static(&nvme_ns_info);
+    type_register_static(&nvme_nsdev_info);
 }
 
-type_init(nvme_ns_register_types)
+type_init(register_types)
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 525bfd0ca831..4ae4b4e5ffe1 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -80,9 +80,8 @@ static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsystem *subsys,
     return subsys->namespaces[nsid];
 }
 
-#define TYPE_NVME_NS "nvme-ns"
-#define NVME_NS(obj) \
-    OBJECT_CHECK(NvmeNamespace, (obj), TYPE_NVME_NS)
+#define TYPE_NVME_NAMESPACE_DEVICE "nvme-ns"
+OBJECT_DECLARE_SIMPLE_TYPE(NvmeNamespaceDevice, NVME_NAMESPACE_DEVICE)
 
 typedef struct NvmeNamespaceParams {
     bool     detached;
@@ -170,19 +169,26 @@ typedef struct NvmeNamespaceNvm {
     unsigned long flags;
 } NvmeNamespaceNvm;
 
+enum NvmeNamespaceFlags {
+    NVME_NS_SHARED = 1 << 0,
+};
+
 typedef struct NvmeNamespace {
-    DeviceState  parent_obj;
-    BlockConf    blkconf;
-    int32_t      bootindex;
+    uint32_t nsid;
+    uint8_t  csi;
+    QemuUUID uuid;
+    union {
+        uint64_t v;
+        uint8_t  a[8];
+    } eui64;
+    NvmeNGUID nguid;
+
+    unsigned long flags;
+
     const uint32_t *iocs;
-    uint8_t      csi;
     uint16_t     status;
     int          attached;
 
-    QTAILQ_ENTRY(NvmeNamespace) entry;
-
-    NvmeNamespaceParams params;
-
     struct {
         uint32_t err_rec;
     } features;
@@ -199,10 +205,19 @@ static inline BlockBackend *nvme_blk(NvmeNamespace *ns)
     return NVME_NAMESPACE_NVM(ns)->blk;
 }
 
+typedef struct NvmeNamespaceDevice {
+    DeviceState  parent_obj;
+    BlockConf    blkconf;
+    int32_t      bootindex;
+
+    NvmeNamespace       ns;
+    NvmeNamespaceParams params;
+} NvmeNamespaceDevice;
+
 static inline uint32_t nvme_nsid(NvmeNamespace *ns)
 {
     if (ns) {
-        return ns->params.nsid;
+        return ns->nsid;
     }
 
     return 0;
@@ -228,8 +243,8 @@ static inline bool nvme_ns_ext(NvmeNamespaceNvm *nvm)
     return !!NVME_ID_NS_FLBAS_EXTENDED(nvm->id_ns.flbas);
 }
 
-void nvme_ns_init_format(NvmeNamespace *ns);
-int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
+void nvme_ns_nvm_init_format(NvmeNamespaceNvm *nvm);
+void nvme_ns_init(NvmeNamespace *ns);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
 void nvme_ns_cleanup(NvmeNamespace *ns);
@@ -424,7 +439,7 @@ typedef struct NvmeCtrl {
 
     NvmeSubsystem   *subsys;
 
-    NvmeNamespace   namespace;
+    NvmeNamespaceDevice namespace;
     NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES + 1];
     NvmeSQueue      **sq;
     NvmeCQueue      **cq;
-- 
2.33.0


