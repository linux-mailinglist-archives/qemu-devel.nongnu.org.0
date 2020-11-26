Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D7F2C5E67
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 01:07:07 +0100 (CET)
Received: from localhost ([::1]:44186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiRI2-0003FL-Tk
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 19:07:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQy0-0007UX-Mz; Thu, 26 Nov 2020 18:46:24 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:48785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxu-0003vM-9D; Thu, 26 Nov 2020 18:46:24 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B174C5C0214;
 Thu, 26 Nov 2020 18:46:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Nov 2020 18:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=RjaO5b/MNMKXE
 99teDtfmvRiUhkYxRLHT8EjxPhx/uI=; b=MhxUWRzuK+48B64gp5+7Gr7F+q8Pw
 il0r9GofWItwJ6w9vAYcqjg3CkV51I8pCpBd8BoLZcPJYQKdP8F04vpmkxRD53Eh
 IaTP/Dy/KPgCfrbLPATgw0YoQVyF81WaGCzusCLHfDEd8VwX8Zk6py0s560quvf/
 PmP9QzGtvIJH4BAiBGY7Pbdk0qcQTJ53CaxZ1prAgWz777L8vO4fX+FDB+Ji2zGY
 bV1l8dHjsZCuJN8icgYSiZcKzxagPMS7efXk1yvU/B2TF16M9W8A6wFiCEmhLhYJ
 NAMaWmB2hpH62fQ6wdZdXmYdqwXmB014+VkMWJpuudccF6OMZhnXNOSVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=RjaO5b/MNMKXE99teDtfmvRiUhkYxRLHT8EjxPhx/uI=; b=YSNVCF53
 Y6aXX0uGOMsFexGE7Fhr5cbZAm4bT/RRFcqq+hkuTlC7gU7DW6O3AMm7qZjTqH7F
 E0s7pm3h2CY0bl8KIkNTxh9ENBSZbzll6yTar7JT+dsegkShdOXF3ZQDy7o94BAQ
 EtLZXAiUXPqLEN/utpJDGRUGZspYkGHcTIyGxDO/t6+CNx2w48XVBpy32Nghz0zT
 Thbxel8GzqG7kHbmQxeBY9QXpZdCnqgf99oo5VrEf0r1QlWAKQEqPFKBaxzjVk7C
 zOYiDUTgdQXTOPx7UHPzgny+YfdpfCMZn0RINJo8ik604KktJ0ohs4LvWA8nQKyz
 KvbiUxNzAlxEAw==
X-ME-Sender: <xms:SD7AXzl-opGRDeSVun5te95kSxhZgHiTVKTqZOE3kOK-1vJg1VktZw>
 <xme:SD7AX20QGRKAe57qE6Uxyi7xrKVEwnOwwTu2mjaHlpvooXUv5qxJ6mGGQQSEvrNez
 hPlCtCcyQPSHn_yIB8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehfedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SD7AX5pEStvFHCr3U6UdXBjiFNcBSSu29j7oCIrC8Q76YnjcyqybIA>
 <xmx:SD7AX7n9HCfrLCrCUtVpMkOoc7uG27KXfC4WamYF4ErNkzUefGNsjA>
 <xmx:SD7AXx0CHESXOjNA99_-Y9m7d0qLd9Xct7H5j7J7DFvM8VExzBCKsQ>
 <xmx:SD7AX7rjf3zGk1b-C9m3O7gORacfmEdC7bPqZ5N-jPhvGY7OwVltEw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 506603064AAE;
 Thu, 26 Nov 2020 18:46:15 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/12] hw/block/nvme: add the zone management send command
Date: Fri, 27 Nov 2020 00:45:57 +0100
Message-Id: <20201126234601.689714-9-its@irrelevant.dk>
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

Add the Zone Management Send command.

The spec specifies that "All logical blocks in a zone *shall* be marked
as deallocated when [the zone is reset]". Since the device guarantees
0x00 to be read from deallocated blocks we have to issue a pwrite_zeroes
since we cannot be sure that a discard actually does anything.
Typically, this will be converted to an unmap/discard operation, but if
the underlying blockdev doesn't support that a reset can be pretty
expensive.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h       |   1 +
 include/block/nvme.h  |  30 ++++
 hw/block/nvme.c       | 383 ++++++++++++++++++++++++++++++++++++++++++
 hw/block/trace-events |  12 ++
 4 files changed, 426 insertions(+)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 97f9f543c9dd..0cf3b303e34e 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -63,6 +63,7 @@ static inline const char *nvme_io_opc_str(uint8_t opc)
     case NVME_CMD_WRITE_ZEROES:     return "NVME_NVM_CMD_WRITE_ZEROES";
     case NVME_CMD_DSM:              return "NVME_NVM_CMD_DSM";
     case NVME_CMD_COPY:             return "NVME_NVM_CMD_COPY";
+    case NVME_CMD_ZONE_MGMT_SEND:   return "NVME_ZONED_CMD_ZONE_MGMT_SEND";
     case NVME_CMD_ZONE_MGMT_RECV:   return "NVME_ZONED_CMD_ZONE_MGMT_RECV";
     default:                        return "NVME_NVM_CMD_UNKNOWN";
     }
diff --git a/include/block/nvme.h b/include/block/nvme.h
index e000e79bb12b..4c2b6fbb799a 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -485,6 +485,7 @@ enum NvmeIoCommands {
     NVME_CMD_WRITE_ZEROES       = 0x08,
     NVME_CMD_DSM                = 0x09,
     NVME_CMD_COPY               = 0x19,
+    NVME_CMD_ZONE_MGMT_SEND     = 0x79,
     NVME_CMD_ZONE_MGMT_RECV     = 0x7a,
 };
 
@@ -598,6 +599,34 @@ enum {
     NVME_RW_PRINFO_PRCHK_REF    = 1 << 10,
 };
 
+typedef struct QEMU_PACKED NvmeZoneMgmtSendCmd {
+    uint8_t     opcode;
+    uint8_t     flags;
+    uint16_t    cid;
+    uint32_t    nsid;
+    uint32_t    rsvd8[4];
+    NvmeCmdDptr dptr;
+    uint64_t    slba;
+    uint32_t    rsvd48;
+    uint8_t     zsa;
+    uint8_t     select_all;
+    uint8_t     rsvd54[2];
+    uint32_t    rsvd56[2];
+} NvmeZoneMgmtSendCmd;
+
+enum {
+    NVME_ZMS_SELECT_ALL = 0x1,
+};
+
+enum {
+    NVME_ZMS_CLOSE   = 0x1,
+    NVME_ZMS_FINISH  = 0x2,
+    NVME_ZMS_OPEN    = 0x3,
+    NVME_ZMS_RESET   = 0x4,
+    NVME_ZMS_OFFLINE = 0x5,
+    NVME_ZMS_SET_ZDE = 0x10,
+};
+
 typedef struct QEMU_PACKED NvmeZoneMgmtRecvCmd {
     uint8_t     opcode;
     uint8_t     flags;
@@ -1257,6 +1286,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeRwCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDsmCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCopyCmd) != 64);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeZoneMgmtSendCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeZoneMgmtRecvCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeRangeType) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeErrorLog) != 64);
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 8dc6b565a4a0..f0f4d72266bf 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1008,6 +1008,12 @@ static uint16_t nvme_check_dulbe(NvmeNamespace *ns, uint64_t slba,
     return NVME_SUCCESS;
 }
 
+static inline void nvme_zone_reset_wp(NvmeZone *zone)
+{
+    zone->zd->wp = zone->zd->zslba;
+    zone->wp_staging = nvme_zslba(zone);
+}
+
 static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
                                     NvmeZoneState to)
 {
@@ -1030,6 +1036,10 @@ static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
     case NVME_ZS_ZSEO:
         switch (to) {
         case NVME_ZS_ZSE:
+            nvme_zone_reset_wp(zone);
+
+            /* fallthrough */
+
         case NVME_ZS_ZSO:
             NVME_ZA_CLEAR_ALL(zd->za);
 
@@ -1050,6 +1060,10 @@ static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
     case NVME_ZS_ZSC:
         switch (to) {
         case NVME_ZS_ZSE:
+            nvme_zone_reset_wp(zone);
+
+            /* fallthrough */
+
         case NVME_ZS_ZSO:
             NVME_ZA_CLEAR_ALL(zd->za);
 
@@ -1082,6 +1096,10 @@ static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
     case NVME_ZS_ZSF:
         switch (to) {
         case NVME_ZS_ZSE:
+            nvme_zone_reset_wp(zone);
+
+            /* fallthrough */
+
         case NVME_ZS_ZSO:
             NVME_ZA_CLEAR_ALL(zd->za);
 
@@ -1460,6 +1478,367 @@ out:
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
+struct nvme_zone_reset_ctx {
+    NvmeRequest *req;
+    NvmeZone    *zone;
+};
+
+static void nvme_aio_zone_reset_cb(void *opaque, int ret)
+{
+    struct nvme_zone_reset_ctx *ctx = opaque;
+    NvmeRequest *req = ctx->req;
+    NvmeZone *zone = ctx->zone;
+    uintptr_t *resets = (uintptr_t *)&req->opaque;
+
+    g_free(ctx);
+
+    trace_pci_nvme_aio_zone_reset_cb(nvme_cid(req), nvme_zslba(zone));
+
+    if (!ret) {
+        nvme_zrm_transition(req->ns, zone, NVME_ZS_ZSE);
+    } else {
+        nvme_aio_err(req, ret, zone);
+    }
+
+    (*resets)--;
+
+    if (*resets) {
+        return;
+    }
+
+    nvme_enqueue_req_completion(nvme_cq(req), req);
+}
+
+static uint16_t nvme_zone_mgmt_send_close(NvmeCtrl *n, NvmeRequest *req,
+                                          NvmeZone *zone)
+{
+    NvmeNamespace *ns = req->ns;
+    uint16_t status;
+
+    trace_pci_nvme_zone_mgmt_send_close(nvme_cid(req), nvme_nsid(ns),
+                                        nvme_zslba(zone), nvme_zs_str(zone));
+
+    switch (nvme_zs(zone)) {
+    case NVME_ZS_ZSC:
+        return NVME_SUCCESS;
+
+    case NVME_ZS_ZSE:
+        /*
+         * The state machine in nvme_zrm_transition allows zones to transition
+         * from ZSE to ZSC. That transition is only valid if done as part Set
+         * Zone Descriptor, so do an early check here.
+         */
+        return NVME_INVALID_ZONE_STATE_TRANSITION | NVME_DNR;
+
+    default:
+        break;
+    }
+
+    status = nvme_zrm_transition(ns, zone, NVME_ZS_ZSC);
+    if (status) {
+        return status;
+    }
+
+    return NVME_SUCCESS;
+}
+
+static uint16_t nvme_zone_mgmt_send_finish(NvmeCtrl *n, NvmeRequest *req,
+                                           NvmeZone *zone)
+{
+    NvmeNamespace *ns = req->ns;
+    uint16_t status;
+
+    trace_pci_nvme_zone_mgmt_send_finish(nvme_cid(req), nvme_nsid(ns),
+                                         nvme_zslba(zone), nvme_zs_str(zone));
+
+    if (nvme_zs(zone) == NVME_ZS_ZSF) {
+        return NVME_SUCCESS;
+    }
+
+    status = nvme_zrm_transition(ns, zone, NVME_ZS_ZSF);
+    if (status) {
+        return status;
+    }
+
+    return NVME_SUCCESS;
+}
+
+static uint16_t nvme_zone_mgmt_send_open(NvmeCtrl *n, NvmeRequest *req,
+                                         NvmeZone *zone)
+{
+    NvmeNamespace *ns = req->ns;
+    uint16_t status;
+
+    trace_pci_nvme_zone_mgmt_send_open(nvme_cid(req), nvme_nsid(ns),
+                                       nvme_zslba(zone), nvme_zs_str(zone));
+
+    if (nvme_zs(zone) == NVME_ZS_ZSEO) {
+        return NVME_SUCCESS;
+    }
+
+    status = nvme_zrm_transition(ns, zone, NVME_ZS_ZSEO);
+    if (status) {
+        return status;
+    }
+
+    return NVME_SUCCESS;
+}
+
+static void __nvme_zone_mgmt_send_reset(NvmeCtrl *n, NvmeRequest *req,
+                                        NvmeZone *zone)
+{
+    NvmeNamespace *ns = req->ns;
+    uint64_t zslba = nvme_zslba(zone);
+    uint64_t zsze = nvme_ns_zsze(ns);
+    uintptr_t *resets = (uintptr_t *)&req->opaque;
+    struct nvme_zone_reset_ctx *ctx = g_new(struct nvme_zone_reset_ctx, 1);
+
+    trace_pci_nvme_zone_mgmt_send_reset(nvme_cid(req), nvme_nsid(ns),
+                                        nvme_zslba(zone), nvme_zs_str(zone));
+
+    /*
+     * The zone reset callback needs to know the zone that is being reset in
+     * order to transition the zone.
+     */
+    ctx->req = req;
+    ctx->zone = zone;
+
+    (*resets)++;
+
+    blk_aio_pwrite_zeroes(ns->blkconf.blk, nvme_l2b(ns, zslba),
+                          nvme_l2b(ns, zsze), BDRV_REQ_MAY_UNMAP,
+                          nvme_aio_zone_reset_cb, ctx);
+}
+
+static uint16_t nvme_zone_mgmt_send_reset(NvmeCtrl *n, NvmeRequest *req,
+                                          NvmeZone *zone)
+{
+    uintptr_t *resets = (uintptr_t *)&req->opaque;
+
+    *resets = 1;
+
+    __nvme_zone_mgmt_send_reset(n, req, zone);
+
+    (*resets)--;
+
+    return *resets ? NVME_NO_COMPLETE : req->status;
+}
+
+static uint16_t nvme_zone_mgmt_send_offline(NvmeCtrl *n, NvmeRequest *req,
+                                            NvmeZone *zone)
+{
+    NvmeNamespace *ns = req->ns;
+
+    trace_pci_nvme_zone_mgmt_send_offline(nvme_cid(req), nvme_nsid(ns),
+                                          nvme_zslba(zone), nvme_zs_str(zone));
+
+    switch (nvme_zs(zone)) {
+    case NVME_ZS_ZSRO:
+        nvme_zrm_transition(ns, zone, NVME_ZS_ZSO);
+
+        /* fallthrough */
+
+    case NVME_ZS_ZSO:
+        return NVME_SUCCESS;
+
+    default:
+        break;
+    }
+
+    return NVME_INVALID_ZONE_STATE_TRANSITION | NVME_DNR;
+}
+
+static uint16_t nvme_zone_mgmt_send_set_zde(NvmeCtrl *n, NvmeRequest *req,
+                                            NvmeZone *zone)
+{
+    NvmeNamespace *ns = req->ns;
+    uint16_t status;
+
+    trace_pci_nvme_zone_mgmt_send_set_zde(nvme_cid(req), nvme_nsid(ns),
+                                          nvme_zslba(zone), nvme_zs_str(zone));
+
+    if (nvme_zs(zone) != NVME_ZS_ZSE) {
+        trace_pci_nvme_err_invalid_zone_state(nvme_zslba(zone),
+                                              nvme_zs_str(zone),
+                                              nvme_zs(zone));
+        return NVME_INVALID_ZONE_STATE_TRANSITION | NVME_DNR;
+    }
+
+    status = nvme_check_mdts(n, nvme_ns_zdes_bytes(ns));
+    if (status) {
+        return status;
+    }
+
+    status = nvme_dma(n, zone->zde, nvme_ns_zdes_bytes(ns),
+                      DMA_DIRECTION_TO_DEVICE, req);
+    if (status) {
+        return status;
+    }
+
+    status = nvme_zrm_transition(ns, zone, NVME_ZS_ZSC);
+    if (status) {
+        return status;
+    }
+
+    NVME_ZA_SET(zone->zd->za, NVME_ZA_ZDEV);
+
+    return NVME_SUCCESS;
+}
+
+static uint16_t nvme_zone_mgmt_send_all(NvmeCtrl *n, NvmeNamespace *ns,
+                                        uint8_t zsa, NvmeRequest *req)
+{
+    NvmeZone *zone;
+    uintptr_t *resets = (uintptr_t *)&req->opaque;
+    uint16_t status = NVME_SUCCESS;
+
+    trace_pci_nvme_zone_mgmt_send_all(nvme_cid(req), nvme_nsid(ns), zsa);
+
+    switch (zsa) {
+    case NVME_ZMS_SET_ZDE:
+        return NVME_INVALID_FIELD | NVME_DNR;
+
+    case NVME_ZMS_CLOSE:
+        for (int i = 0; i < ns->zns.num_zones; i++) {
+            zone = &ns->zns.zones[i];
+
+            switch (nvme_zs(zone)) {
+            case NVME_ZS_ZSIO:
+            case NVME_ZS_ZSEO:
+                status = nvme_zone_mgmt_send_close(n, req, zone);
+                if (status) {
+                    return status;
+                }
+
+            default:
+                continue;
+            }
+        }
+
+        break;
+
+    case NVME_ZMS_FINISH:
+        for (int i = 0; i < ns->zns.num_zones; i++) {
+            zone = &ns->zns.zones[i];
+
+            switch (nvme_zs(zone)) {
+            case NVME_ZS_ZSIO:
+            case NVME_ZS_ZSEO:
+            case NVME_ZS_ZSC:
+                status = nvme_zone_mgmt_send_finish(n, req, zone);
+                if (status) {
+                    return status;
+                }
+
+            default:
+                continue;
+            }
+        }
+
+        break;
+
+    case NVME_ZMS_OPEN:
+        for (int i = 0; i < ns->zns.num_zones; i++) {
+            zone = &ns->zns.zones[i];
+
+            if (nvme_zs(zone) == NVME_ZS_ZSC) {
+                status = nvme_zone_mgmt_send_open(n, req, zone);
+                if (status) {
+                    return status;
+                }
+            }
+        }
+
+        break;
+
+    case NVME_ZMS_RESET:
+        *resets = 1;
+
+        for (int i = 0; i < ns->zns.num_zones; i++) {
+            zone = &ns->zns.zones[i];
+
+            switch (nvme_zs(zone)) {
+            case NVME_ZS_ZSIO:
+            case NVME_ZS_ZSEO:
+            case NVME_ZS_ZSC:
+            case NVME_ZS_ZSF:
+                __nvme_zone_mgmt_send_reset(n, req, zone);
+            default:
+                continue;
+            }
+        }
+
+        (*resets)--;
+
+        return *resets ? NVME_NO_COMPLETE : req->status;
+
+    case NVME_ZMS_OFFLINE:
+        for (int i = 0; i < ns->zns.num_zones; i++) {
+            zone = &ns->zns.zones[i];
+
+            if (nvme_zs(zone) == NVME_ZS_ZSRO) {
+                status = nvme_zone_mgmt_send_offline(n, req, zone);
+                if (status) {
+                    return status;
+                }
+            }
+        }
+
+        break;
+    }
+
+    return status;
+}
+
+static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeZoneMgmtSendCmd *send = (NvmeZoneMgmtSendCmd *)&req->cmd;
+    NvmeNamespace *ns = req->ns;
+    NvmeZone *zone;
+    uint8_t zsa = send->zsa;
+    uint8_t select_all = send->select_all & 0x1;
+    uint64_t zslba = le64_to_cpu(send->slba);
+
+    if (!nvme_ns_zoned(ns)) {
+        return NVME_INVALID_OPCODE | NVME_DNR;
+    }
+
+    trace_pci_nvme_zone_mgmt_send(nvme_cid(req), ns->params.nsid, zslba, zsa,
+                                  select_all);
+
+    if (select_all) {
+        return nvme_zone_mgmt_send_all(n, ns, zsa, req);
+    }
+
+    zone = nvme_ns_zone(ns, zslba);
+    if (!zone) {
+        trace_pci_nvme_err_invalid_zone(zslba);
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    if (zslba != nvme_zslba(zone)) {
+        trace_pci_nvme_err_invalid_zslba(zslba);
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    switch (zsa) {
+    case NVME_ZMS_CLOSE:
+        return nvme_zone_mgmt_send_close(n, req, zone);
+    case NVME_ZMS_FINISH:
+        return nvme_zone_mgmt_send_finish(n, req, zone);
+    case NVME_ZMS_OPEN:
+        return nvme_zone_mgmt_send_open(n, req, zone);
+    case NVME_ZMS_RESET:
+        return nvme_zone_mgmt_send_reset(n, req, zone);
+    case NVME_ZMS_OFFLINE:
+        return nvme_zone_mgmt_send_offline(n, req, zone);
+    case NVME_ZMS_SET_ZDE:
+        return nvme_zone_mgmt_send_set_zde(n, req, zone);
+    }
+
+    return NVME_INVALID_FIELD | NVME_DNR;
+}
+
 static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeZoneMgmtRecvCmd *recv = (NvmeZoneMgmtRecvCmd *)&req->cmd;
@@ -2038,6 +2417,8 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_dsm(n, req);
     case NVME_CMD_COPY:
         return nvme_copy(n, req);
+    case NVME_CMD_ZONE_MGMT_SEND:
+        return nvme_zone_mgmt_send(n, req);
     case NVME_CMD_ZONE_MGMT_RECV:
         return nvme_zone_mgmt_recv(n, req);
     default:
@@ -2294,6 +2675,8 @@ static void nvme_effects_nvm(NvmeEffectsLog *effects)
 static void nvme_effects_zoned(NvmeEffectsLog *effects)
 {
     effects->iocs[NVME_CMD_ZONE_MGMT_RECV] = NVME_EFFECTS_CSUPP;
+    effects->iocs[NVME_CMD_ZONE_MGMT_SEND] = NVME_EFFECTS_CSUPP |
+                                             NVME_EFFECTS_LBCC;
 }
 
 static uint16_t nvme_effects_log(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 429b4849d2dc..f62dfda279cd 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -54,6 +54,16 @@ pci_nvme_compare(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid
 pci_nvme_compare_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_discard_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_copy_in_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_aio_zone_reset_cb(uint16_t cid, uint64_t zslba) "cid %"PRIu16" zslba 0x%"PRIx64""
+pci_nvme_zone_mgmt_send(uint16_t cid, uint32_t nsid, uint64_t zslba, uint8_t zsa, uint8_t select_all) "cid %"PRIu16" nsid %"PRIu32" zslba 0x%"PRIx64" zsa 0x%"PRIx8" select_all 0x%"PRIx8""
+pci_nvme_zone_mgmt_send_all(uint16_t cid, uint32_t nsid, uint8_t za) "cid %"PRIu16" nsid %"PRIu32" za 0x%"PRIx8""
+pci_nvme_zone_mgmt_send_close(uint16_t cid, uint32_t nsid, uint64_t zslba, const char *zc) "cid %"PRIu16" nsid %"PRIu32" zslba 0x%"PRIx64" zc \"%s\""
+pci_nvme_zone_mgmt_send_finish(uint16_t cid, uint32_t nsid, uint64_t zslba, const char *zc) "cid %"PRIu16" nsid %"PRIu32" zslba 0x%"PRIx64" zc \"%s\""
+pci_nvme_zone_mgmt_send_open(uint16_t cid, uint32_t nsid, uint64_t zslba, const char *zc) "cid %"PRIu16" nsid %"PRIu32" zslba 0x%"PRIx64" zc \"%s\""
+pci_nvme_zone_mgmt_send_reset(uint16_t cid, uint32_t nsid, uint64_t zslba, const char *zc) "cid %"PRIu16" nsid %"PRIu32" zslba 0x%"PRIx64" zc \"%s\""
+pci_nvme_zone_mgmt_send_reset_cb(uint16_t cid, uint32_t nsid) "cid %"PRIu16" nsid %"PRIu32""
+pci_nvme_zone_mgmt_send_offline(uint16_t cid, uint32_t nsid, uint64_t zslba, const char *zc) "cid %"PRIu16" nsid %"PRIu32" zslba 0x%"PRIx64" zc \"%s\""
+pci_nvme_zone_mgmt_send_set_zde(uint16_t cid, uint32_t nsid, uint64_t zslba, const char *zc) "cid %"PRIu16" nsid %"PRIu32" zslba 0x%"PRIx64" zc \"%s\""
 pci_nvme_zone_mgmt_recv(uint16_t cid, uint32_t nsid, uint64_t slba, uint64_t len, uint8_t zra, uint8_t zfeat, uint8_t zflags) "cid %"PRIu16" nsid %"PRIu32" slba 0x%"PRIx64" len %"PRIu64" zra 0x%"PRIx8" zrasf 0x%"PRIx8" pr 0x%"PRIx8""
 pci_nvme_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t qsize, uint16_t qflags) "create submission queue, addr=0x%"PRIx64", sqid=%"PRIu16", cqid=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16""
 pci_nvme_create_cq(uint64_t addr, uint16_t cqid, uint16_t vector, uint16_t size, uint16_t qflags, int ien) "create completion queue, addr=0x%"PRIx64", cqid=%"PRIu16", vector=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16", ien=%d"
@@ -142,6 +152,8 @@ pci_nvme_err_invalid_getfeat(int dw10) "invalid get features, dw10=0x%"PRIx32""
 pci_nvme_err_invalid_setfeat(uint32_t dw10) "invalid set features, dw10=0x%"PRIx32""
 pci_nvme_err_invalid_log_page(uint16_t cid, uint16_t lid) "cid %"PRIu16" lid 0x%"PRIx16""
 pci_nvme_err_invalid_zone_state(uint64_t zslba, const char *zs_str, uint8_t zs) "zslba 0x%"PRIx64" zs '%s' (%"PRIu8")"
+pci_nvme_err_invalid_zone(uint64_t lba) "lba 0x%"PRIx64""
+pci_nvme_err_invalid_zslba(uint64_t lba) "lba 0x%"PRIx64""
 pci_nvme_err_startfail_cq(void) "nvme_start_ctrl failed because there are non-admin completion queues"
 pci_nvme_err_startfail_sq(void) "nvme_start_ctrl failed because there are non-admin submission queues"
 pci_nvme_err_startfail_nbarasq(void) "nvme_start_ctrl failed because the admin submission queue address is null"
-- 
2.29.2


