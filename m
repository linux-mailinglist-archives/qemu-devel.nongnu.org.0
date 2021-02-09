Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD3D314DF6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 12:14:00 +0100 (CET)
Received: from localhost ([::1]:43520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Qxz-0002WD-S2
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 06:14:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9Qsn-0000mM-SV; Tue, 09 Feb 2021 06:08:37 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:49155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9Qsl-0002lu-KW; Tue, 09 Feb 2021 06:08:37 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C7D0046D;
 Tue,  9 Feb 2021 06:08:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 06:08:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=QLVY2kHkW5e1Z
 ysTWNsY6NzumMcF2rl3A7fPHh+3lMs=; b=g+tdt4G8mu64zedNmkoWWuXFxc7pV
 KMHBr9L+V9w8VYmeZFe8zuZ3cKfrAWhYk8yjhxV/HKafADAjXPq2/cIyFb6Foe2T
 PktBfZCDTrH7G0fOty6vZO/7w/qqIQiUIseldsvDpA6OSPYLH/WF16oD+Ky0UTtT
 ehRMwqDeX2S+s2eIGdqa1gE/S5vfyIaYmLkqFoVEBeBk23xpmI7BXnW1nKI7rbyM
 VaGc1x4lAwpjK2qNn1t1APs6ZmYKEhwSuAhga/n6/bZAH/4KPKpmnH3wUpBIgAUl
 Z5hjLUtvapPJyna4mRXdF/asyC/BMzXhfP26R4BXWQJImKIpUBE5YG1HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=QLVY2kHkW5e1ZysTWNsY6NzumMcF2rl3A7fPHh+3lMs=; b=YfrGnjGl
 bniySvLtso57rZGQl3n/987QgZGm3XVLfgyjkVaihfCEJ86iuTdoqefawLB6hbPx
 384alnwek51XeR+MdPJm5yR3PM/5q1FUZtO106+MsiKMWUF/QTI+WuR+it6dZU8J
 3IAxH5wnOeGgm3TsU7VxAU9IN0nR12jz9QEMK04Ve8XnL8f/42zvE2pFp6jqIXsF
 K8X9HmcsONiQsMfDogX/IgTEl+XNvjdffdmFeyvYsr6cAgsDlB0DCIo+uLjKlj1+
 MjLakWjnoYIGE9+q6NdkflJbmCJmA0M0C/UBY+Rsu+nmuDp6KvigQDmDayVytKU0
 GnT4eAFHTbfbjA==
X-ME-Sender: <xms:MG0iYPGUx0tz54PuhcyDOhBeQJ3vS6ks-1Rdp85pb3o6gppK2iKpWA>
 <xme:MG0iYMUM7Sc2UtHQ_vT_1ndR05erbGpF35bmteCESM-rf9jyiLfddHbbFeedPhxc5
 8KTXJzvh8lyGgcqRA8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheehgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:MG0iYBLGY4ylI9GlVM1YlYYU2Sy6fUBajrHlBMvT17lyOfIBfaHccw>
 <xmx:MG0iYNHt6uMf__GUQZgjaKpqPDBG2pOqhMdh9YZAb54pvkMK0x4b-Q>
 <xmx:MG0iYFXMoNO5rHeNSBqYcUlJlDXdp8OR04hwLcOBtH1oR8HYURNQ4Q>
 <xmx:MG0iYLz4-Quw6aCKirqirtt3GUpr71GJZJ_Qk7uXnUiB3T8nrPpfRA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5FC94240057;
 Tue,  9 Feb 2021 06:08:31 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/nvme: move device-scoped functions
Date: Tue,  9 Feb 2021 12:08:26 +0100
Message-Id: <20210209110826.585987-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209110826.585987-1-its@irrelevant.dk>
References: <20210209110826.585987-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Move a bunch of functions that are internal to a device out of the
shared header.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/nvme.h | 110 +------------------------------------------------
 hw/nvme/ctrl.c |  90 +++++++++++++++++++++++++++++++++++++++-
 hw/nvme/ns.c   |   7 +++-
 3 files changed, 97 insertions(+), 110 deletions(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 452a64499b1b..929c6c553ca2 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -96,36 +96,13 @@ static inline uint32_t nvme_nsid(NvmeNamespace *ns)
     return -1;
 }
 
-static inline bool nvme_ns_shared(NvmeNamespace *ns)
-{
-    return !!ns->subsys;
-}
-
-static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
-{
-    NvmeIdNs *id_ns = &ns->id_ns;
-    return &id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
-}
-
 static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
 {
-    return nvme_ns_lbaf(ns)->ds;
-}
+    NvmeLBAF lbaf = ns->id_ns.lbaf[NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas)];
 
-/* calculate the number of LBAs that the namespace can accomodate */
-static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
-{
-    return ns->size >> nvme_ns_lbads(ns);
+    return lbaf.ds;
 }
 
-/* convert an LBA to the equivalent in bytes */
-static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
-{
-    return lba << nvme_ns_lbads(ns);
-}
-
-typedef struct NvmeCtrl NvmeCtrl;
-
 static inline NvmeZoneState nvme_get_zone_state(NvmeZone *zone)
 {
     return zone->d.zs >> 4;
@@ -136,31 +113,6 @@ static inline void nvme_set_zone_state(NvmeZone *zone, NvmeZoneState state)
     zone->d.zs = state << 4;
 }
 
-static inline uint64_t nvme_zone_rd_boundary(NvmeNamespace *ns, NvmeZone *zone)
-{
-    return zone->d.zslba + ns->zone_size;
-}
-
-static inline uint64_t nvme_zone_wr_boundary(NvmeZone *zone)
-{
-    return zone->d.zslba + zone->d.zcap;
-}
-
-static inline bool nvme_wp_is_valid(NvmeZone *zone)
-{
-    uint8_t st = nvme_get_zone_state(zone);
-
-    return st != NVME_ZONE_STATE_FULL &&
-           st != NVME_ZONE_STATE_READ_ONLY &&
-           st != NVME_ZONE_STATE_OFFLINE;
-}
-
-static inline uint8_t *nvme_get_zd_extension(NvmeNamespace *ns,
-                                             uint32_t zone_idx)
-{
-    return &ns->zd_extensions[zone_idx * ns->params.zd_extension_size];
-}
-
 static inline void nvme_aor_inc_open(NvmeNamespace *ns)
 {
     assert(ns->nr_open_zones >= 0);
@@ -203,7 +155,6 @@ void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
 void nvme_ns_cleanup(NvmeNamespace *ns);
 
-
 typedef struct NvmeParams {
     char     *serial;
     uint32_t num_queues; /* deprecated since 5.1 */
@@ -237,40 +188,6 @@ typedef struct NvmeRequest {
     QTAILQ_ENTRY(NvmeRequest)entry;
 } NvmeRequest;
 
-static inline const char *nvme_adm_opc_str(uint8_t opc)
-{
-    switch (opc) {
-    case NVME_ADM_CMD_DELETE_SQ:        return "NVME_ADM_CMD_DELETE_SQ";
-    case NVME_ADM_CMD_CREATE_SQ:        return "NVME_ADM_CMD_CREATE_SQ";
-    case NVME_ADM_CMD_GET_LOG_PAGE:     return "NVME_ADM_CMD_GET_LOG_PAGE";
-    case NVME_ADM_CMD_DELETE_CQ:        return "NVME_ADM_CMD_DELETE_CQ";
-    case NVME_ADM_CMD_CREATE_CQ:        return "NVME_ADM_CMD_CREATE_CQ";
-    case NVME_ADM_CMD_IDENTIFY:         return "NVME_ADM_CMD_IDENTIFY";
-    case NVME_ADM_CMD_ABORT:            return "NVME_ADM_CMD_ABORT";
-    case NVME_ADM_CMD_SET_FEATURES:     return "NVME_ADM_CMD_SET_FEATURES";
-    case NVME_ADM_CMD_GET_FEATURES:     return "NVME_ADM_CMD_GET_FEATURES";
-    case NVME_ADM_CMD_ASYNC_EV_REQ:     return "NVME_ADM_CMD_ASYNC_EV_REQ";
-    default:                            return "NVME_ADM_CMD_UNKNOWN";
-    }
-}
-
-static inline const char *nvme_io_opc_str(uint8_t opc)
-{
-    switch (opc) {
-    case NVME_CMD_FLUSH:            return "NVME_NVM_CMD_FLUSH";
-    case NVME_CMD_WRITE:            return "NVME_NVM_CMD_WRITE";
-    case NVME_CMD_READ:             return "NVME_NVM_CMD_READ";
-    case NVME_CMD_COMPARE:          return "NVME_NVM_CMD_COMPARE";
-    case NVME_CMD_WRITE_ZEROES:     return "NVME_NVM_CMD_WRITE_ZEROES";
-    case NVME_CMD_DSM:              return "NVME_NVM_CMD_DSM";
-    case NVME_CMD_COPY:             return "NVME_NVM_CMD_COPY";
-    case NVME_CMD_ZONE_MGMT_SEND:   return "NVME_ZONED_CMD_MGMT_SEND";
-    case NVME_CMD_ZONE_MGMT_RECV:   return "NVME_ZONED_CMD_MGMT_RECV";
-    case NVME_CMD_ZONE_APPEND:      return "NVME_ZONED_CMD_ZONE_APPEND";
-    default:                        return "NVME_NVM_CMD_UNKNOWN";
-    }
-}
-
 typedef struct NvmeSQueue {
     struct NvmeCtrl *ctrl;
     uint16_t    sqid;
@@ -379,29 +296,6 @@ typedef struct NvmeCtrl {
     NvmeFeatureVal  features;
 } NvmeCtrl;
 
-static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
-{
-    if (!nsid || nsid > n->num_namespaces) {
-        return NULL;
-    }
-
-    return n->namespaces[nsid - 1];
-}
-
-static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
-{
-    NvmeSQueue *sq = req->sq;
-    NvmeCtrl *n = sq->ctrl;
-
-    return n->cq[sq->cqid];
-}
-
-static inline NvmeCtrl *nvme_ctrl(NvmeRequest *req)
-{
-    NvmeSQueue *sq = req->sq;
-    return sq->ctrl;
-}
-
 int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
 
 #endif /* HW_NVME_H */
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 262c20c1cba7..c245339be9da 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -204,6 +204,40 @@ static const uint32_t nvme_cse_iocs_zoned[256] = {
 
 static void nvme_process_sq(void *opaque);
 
+static inline const char *nvme_adm_opc_str(uint8_t opc)
+{
+    switch (opc) {
+    case NVME_ADM_CMD_DELETE_SQ:        return "NVME_ADM_CMD_DELETE_SQ";
+    case NVME_ADM_CMD_CREATE_SQ:        return "NVME_ADM_CMD_CREATE_SQ";
+    case NVME_ADM_CMD_GET_LOG_PAGE:     return "NVME_ADM_CMD_GET_LOG_PAGE";
+    case NVME_ADM_CMD_DELETE_CQ:        return "NVME_ADM_CMD_DELETE_CQ";
+    case NVME_ADM_CMD_CREATE_CQ:        return "NVME_ADM_CMD_CREATE_CQ";
+    case NVME_ADM_CMD_IDENTIFY:         return "NVME_ADM_CMD_IDENTIFY";
+    case NVME_ADM_CMD_ABORT:            return "NVME_ADM_CMD_ABORT";
+    case NVME_ADM_CMD_SET_FEATURES:     return "NVME_ADM_CMD_SET_FEATURES";
+    case NVME_ADM_CMD_GET_FEATURES:     return "NVME_ADM_CMD_GET_FEATURES";
+    case NVME_ADM_CMD_ASYNC_EV_REQ:     return "NVME_ADM_CMD_ASYNC_EV_REQ";
+    default:                            return "NVME_ADM_CMD_UNKNOWN";
+    }
+}
+
+static inline const char *nvme_io_opc_str(uint8_t opc)
+{
+    switch (opc) {
+    case NVME_CMD_FLUSH:            return "NVME_NVM_CMD_FLUSH";
+    case NVME_CMD_WRITE:            return "NVME_NVM_CMD_WRITE";
+    case NVME_CMD_READ:             return "NVME_NVM_CMD_READ";
+    case NVME_CMD_COMPARE:          return "NVME_NVM_CMD_COMPARE";
+    case NVME_CMD_WRITE_ZEROES:     return "NVME_NVM_CMD_WRITE_ZEROES";
+    case NVME_CMD_DSM:              return "NVME_NVM_CMD_DSM";
+    case NVME_CMD_COPY:             return "NVME_NVM_CMD_COPY";
+    case NVME_CMD_ZONE_MGMT_SEND:   return "NVME_ZONED_CMD_MGMT_SEND";
+    case NVME_CMD_ZONE_MGMT_RECV:   return "NVME_ZONED_CMD_MGMT_RECV";
+    case NVME_CMD_ZONE_APPEND:      return "NVME_ZONED_CMD_ZONE_APPEND";
+    default:                        return "NVME_NVM_CMD_UNKNOWN";
+    }
+}
+
 static uint16_t nvme_cid(NvmeRequest *req)
 {
     if (!req) {
@@ -213,11 +247,65 @@ static uint16_t nvme_cid(NvmeRequest *req)
     return le16_to_cpu(req->cqe.cid);
 }
 
+static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
+{
+    NvmeSQueue *sq = req->sq;
+    NvmeCtrl *n = sq->ctrl;
+
+    return n->cq[sq->cqid];
+}
+
+static inline NvmeCtrl *nvme_ctrl(NvmeRequest *req)
+{
+    NvmeSQueue *sq = req->sq;
+    return sq->ctrl;
+}
+
 static uint16_t nvme_sqid(NvmeRequest *req)
 {
     return le16_to_cpu(req->sq->sqid);
 }
 
+static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
+{
+    if (!nsid || nsid > n->num_namespaces) {
+        return NULL;
+    }
+
+    return n->namespaces[nsid - 1];
+}
+
+/* convert an LBA to the equivalent in bytes */
+static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
+{
+    return lba << nvme_ns_lbads(ns);
+}
+
+static inline uint64_t nvme_zone_rd_boundary(NvmeNamespace *ns, NvmeZone *zone)
+{
+    return zone->d.zslba + ns->zone_size;
+}
+
+static inline uint64_t nvme_zone_wr_boundary(NvmeZone *zone)
+{
+    return zone->d.zslba + zone->d.zcap;
+}
+
+static inline bool nvme_wp_is_valid(NvmeZone *zone)
+{
+    uint8_t st = nvme_get_zone_state(zone);
+
+    return st != NVME_ZONE_STATE_FULL &&
+           st != NVME_ZONE_STATE_READ_ONLY &&
+           st != NVME_ZONE_STATE_OFFLINE;
+}
+
+static inline uint8_t *nvme_get_zd_extension(NvmeNamespace *ns,
+                                             uint32_t zone_idx)
+{
+    return &ns->zd_extensions[zone_idx * ns->params.zd_extension_size];
+}
+
 static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
                                    NvmeZoneState state)
 {
@@ -2487,7 +2575,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
     uint32_t zone_idx, zra, zrasf, partial;
     uint64_t max_zones, nr_zones = 0;
     uint16_t status;
-    uint64_t slba, capacity = nvme_ns_nlbas(ns);
+    uint64_t slba, capacity = le64_to_cpu(ns->id_ns.nsze);
     NvmeZoneDescr *z;
     NvmeZone *zone;
     NvmeZoneReportHeader *header;
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index a7d55d71d9de..d0810523172c 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -31,6 +31,11 @@
 
 #define MIN_DISCARD_GRANULARITY (4 * KiB)
 
+static inline bool nvme_ns_shared(NvmeNamespace *ns)
+{
+    return !!ns->subsys;
+}
+
 static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 {
     BlockDriverInfo bdi;
@@ -42,7 +47,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 
     id_ns->lbaf[lba_index].ds = 31 - clz32(ns->blkconf.logical_block_size);
 
-    id_ns->nsze = cpu_to_le64(nvme_ns_nlbas(ns));
+    id_ns->nsze = cpu_to_le64(ns->size >> nvme_ns_lbads(ns));
 
     ns->csi = NVME_CSI_NVM;
 
-- 
2.30.0


