Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8D42C5E59
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 00:55:46 +0100 (CET)
Received: from localhost ([::1]:57816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiR73-0004vP-3P
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 18:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxy-0007Qr-B5; Thu, 26 Nov 2020 18:46:22 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:53671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxs-0003ug-Gt; Thu, 26 Nov 2020 18:46:22 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4C7505C01FC;
 Thu, 26 Nov 2020 18:46:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Nov 2020 18:46:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=qnUU2lOqvT7/v
 /Hed/S2MvdLIpUGXX97YuIOZRmdD0o=; b=b2bS9y1iNQiumKXAyQmzrSYA+tIsi
 tKYsAl0g8rxIwvhclfn2LAj0cVa7BOt5S84cMJ/lLwMkptXupJWv6QzWKcOUUDAe
 5yRLnzt9nlGYOE+t84+EQXyIvMAwo7Yw5bVHn9/Q07PFO89K6/tRmih9nYLf4gGh
 7RvtumsvlNbwcKu00J0Po3+6HwWqEW0VaaSYG9mkfbZJ8CzgQuqvVhtDX4PU3FQl
 R2C6p5IKRTRSuOluLdfAKpF/oVXElGmUidpyB3Q0xR+D/1dfu6D3hiatpb+mWP2t
 N8cF3FrWNFXm4E5DFtoZ6WB2aJKOZGkkUgWKGkSHMHygCKqF6pZP75AIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=qnUU2lOqvT7/v/Hed/S2MvdLIpUGXX97YuIOZRmdD0o=; b=M1DzdnHc
 KgcjxLxD4V+8M8K8CtIw45RWb180nMrIOKMTTkkIqNipnLqHj1WZnzUWUeSn/UQV
 Ly2+LJHok1ys//YMyk82CnlQq03QA3LL0sgh6sgA+0LsivqHOALoQXliJw+sJOrB
 8/pjk2M7Ra6PZ77cPf+S8tnS1QF0X/YYxVEGokYry9GxXN+kwLfS618/iBvta76b
 gnSoI8tkuZ9mlr78dpzjj9uK7feOZRCEYbs4xFHsnuQVTPq/vEj0+K7a2amKcVfT
 6MYZQNhfp6k8GNW+vGm0yqqRqdzU9/e4NWEyL1PbO4JRFGx/A1uFnsN96tBeMiBd
 MkIc6B4wP9Vr9A==
X-ME-Sender: <xms:Rz7AX0sNwu-MsQAO6d8lH3BIGP80laLWLct_ojSx7WjuQXGTRbvcIw>
 <xme:Rz7AXxcnqwACggj3AwW1yfMFGeVKmltd574OHZZ9zDc9sD4LPGY5YjffNq9aUd-ov
 af0pdvkMxSqgMoFT-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehfedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Rz7AX_ymkgCLx6eXs4ZBH7VQWLAcm99lZTmeIv69uN8MrSH6BfcbPQ>
 <xmx:Rz7AX3Ptqr3LosyLTQz-yZMEUbFSF0MjujQkGmXQyDSiwgRKwzRyJQ>
 <xmx:Rz7AX08wZC8zWuDWThmvnTj2ss7rxvgNSyvLuaugn0qFDdS7xYd1SA>
 <xmx:Rz7AX0xbyTXUTLFj3-f33F3HgfcCJWebyW11RYTJXs4ifZ6UgiL99Q>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E4BE73064AB2;
 Thu, 26 Nov 2020 18:46:13 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/12] hw/block/nvme: add the zone management receive
 command
Date: Fri, 27 Nov 2020 00:45:56 +0100
Message-Id: <20201126234601.689714-8-its@irrelevant.dk>
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

Add the Zone Management Receive command.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h    |   8 +++
 hw/block/nvme.h       |   1 +
 include/block/nvme.h  |  46 +++++++++++++
 hw/block/nvme-ns.c    |   8 +++
 hw/block/nvme.c       | 150 ++++++++++++++++++++++++++++++++++++++++++
 hw/block/trace-events |   1 +
 6 files changed, 214 insertions(+)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index e373d62c5873..6370ef1a162b 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -31,11 +31,13 @@ typedef struct NvmeNamespaceParams {
     struct {
         uint64_t zcap;
         uint64_t zsze;
+        uint8_t  zdes;
     } zns;
 } NvmeNamespaceParams;
 
 typedef struct NvmeZone {
     NvmeZoneDescriptor *zd;
+    uint8_t            *zde;
 
     uint64_t wp_staging;
 } NvmeZone;
@@ -59,6 +61,7 @@ typedef struct NvmeNamespace {
 
         NvmeZone           *zones;
         NvmeZoneDescriptor *zd;
+        uint8_t            *zde;
     } zns;
 } NvmeNamespace;
 
@@ -99,6 +102,11 @@ static inline uint64_t nvme_ns_zsze(NvmeNamespace *ns)
     return nvme_ns_lbafe(ns)->zsze;
 }
 
+static inline size_t nvme_ns_zdes_bytes(NvmeNamespace *ns)
+{
+    return ns->params.zns.zdes << 6;
+}
+
 /* calculate the number of LBAs that the namespace can accomodate */
 static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
 {
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index b1616ba79733..97f9f543c9dd 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -63,6 +63,7 @@ static inline const char *nvme_io_opc_str(uint8_t opc)
     case NVME_CMD_WRITE_ZEROES:     return "NVME_NVM_CMD_WRITE_ZEROES";
     case NVME_CMD_DSM:              return "NVME_NVM_CMD_DSM";
     case NVME_CMD_COPY:             return "NVME_NVM_CMD_COPY";
+    case NVME_CMD_ZONE_MGMT_RECV:   return "NVME_ZONED_CMD_ZONE_MGMT_RECV";
     default:                        return "NVME_NVM_CMD_UNKNOWN";
     }
 }
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 6a5616bb9304..e000e79bb12b 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -485,6 +485,7 @@ enum NvmeIoCommands {
     NVME_CMD_WRITE_ZEROES       = 0x08,
     NVME_CMD_DSM                = 0x09,
     NVME_CMD_COPY               = 0x19,
+    NVME_CMD_ZONE_MGMT_RECV     = 0x7a,
 };
 
 typedef struct QEMU_PACKED NvmeDeleteQ {
@@ -597,6 +598,44 @@ enum {
     NVME_RW_PRINFO_PRCHK_REF    = 1 << 10,
 };
 
+typedef struct QEMU_PACKED NvmeZoneMgmtRecvCmd {
+    uint8_t     opcode;
+    uint8_t     flags;
+    uint16_t    cid;
+    uint32_t    nsid;
+    uint8_t     rsvd8[16];
+    NvmeCmdDptr dptr;
+    uint64_t    slba;
+    uint32_t    numdw;
+    uint8_t     zra;
+    uint8_t     zrasf;
+    uint8_t     pr;
+    uint8_t     rsvd55[9];
+} NvmeZoneMgmtRecvCmd;
+
+enum {
+    NVME_ZMR_REPORT          = 0x0,
+    NVME_ZMR_EXTENDED_REPORT = 0x1,
+
+    NVME_ZMR_PARTIAL         = 0x1,
+};
+
+enum {
+    NVME_ZMR_LIST_ALL  = 0x0,
+    NVME_ZMR_LIST_ZSE  = 0x1,
+    NVME_ZMR_LIST_ZSIO = 0x2,
+    NVME_ZMR_LIST_ZSEO = 0x3,
+    NVME_ZMR_LIST_ZSC  = 0x4,
+    NVME_ZMR_LIST_ZSF  = 0x5,
+    NVME_ZMR_LIST_ZSRO = 0x6,
+    NVME_ZMR_LIST_ZSO  = 0x7,
+};
+
+typedef struct QEMU_PACKED NvmeZoneReportHeader {
+    uint64_t num_zones;
+    uint8_t  rsvd[56];
+} NvmeZoneReportHeader;
+
 typedef struct QEMU_PACKED NvmeDsmCmd {
     uint8_t     opcode;
     uint8_t     flags;
@@ -846,6 +885,12 @@ typedef struct QEMU_PACKED NvmeZoneDescriptor {
     uint8_t  rsvd32[32];
 } NvmeZoneDescriptor;
 
+#define NVME_ZA_ZDEV (1 << 7)
+
+#define NVME_ZA_SET(za, attrs)   ((za) |= (attrs))
+#define NVME_ZA_CLEAR(za, attrs) ((za) &= ~(attrs))
+#define NVME_ZA_CLEAR_ALL(za)    ((za) = 0x0)
+
 enum NvmeSmartWarn {
     NVME_SMART_SPARE                  = 1 << 0,
     NVME_SMART_TEMPERATURE            = 1 << 1,
@@ -1212,6 +1257,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeRwCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDsmCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCopyCmd) != 64);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeZoneMgmtRecvCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeRangeType) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeErrorLog) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeFwSlotInfoLog) != 512);
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 1f3d0644ba42..f2e8ee80b606 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -61,6 +61,9 @@ static void nvme_ns_zns_init_zones(NvmeNamespace *ns)
 
         zone = &ns->zns.zones[i];
         zone->zd = &ns->zns.zd[i];
+        if (ns->params.zns.zdes) {
+            zone->zde = &ns->zns.zde[i];
+        }
         zone->wp_staging = zslba;
 
         zd = zone->zd;
@@ -81,11 +84,15 @@ static void nvme_ns_init_zoned(NvmeNamespace *ns)
         id_ns_zns->lbafe[i].zsze = ns->params.zns.zsze ?
             cpu_to_le64(ns->params.zns.zsze) :
             cpu_to_le64(pow2ceil(ns->params.zns.zcap));
+        id_ns_zns->lbafe[i].zdes = ns->params.zns.zdes;
     }
 
     ns->zns.num_zones = nvme_ns_nlbas(ns) / nvme_ns_zsze(ns);
     ns->zns.zones = g_malloc0_n(ns->zns.num_zones, sizeof(NvmeZone));
     ns->zns.zd = g_malloc0_n(ns->zns.num_zones, sizeof(NvmeZoneDescriptor));
+    if (ns->params.zns.zdes) {
+        ns->zns.zde = g_malloc0_n(ns->zns.num_zones, nvme_ns_zdes_bytes(ns));
+    }
 
     id_ns_zns->mar = 0xffffffff;
     id_ns_zns->mor = 0xffffffff;
@@ -259,6 +266,7 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_UINT8("msrc", NvmeNamespace, params.msrc, 255),
     DEFINE_PROP_UINT64("zns.zcap", NvmeNamespace, params.zns.zcap, 0),
     DEFINE_PROP_UINT64("zns.zsze", NvmeNamespace, params.zns.zsze, 0),
+    DEFINE_PROP_UINT8("zns.zdes", NvmeNamespace, params.zns.zdes, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 60a467d5df62..8dc6b565a4a0 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1012,6 +1012,7 @@ static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
                                     NvmeZoneState to)
 {
     NvmeZoneState from = nvme_zs(zone);
+    NvmeZoneDescriptor *zd = zone->zd;
 
     trace_pci_nvme_zrm_transition(ns->params.nsid, nvme_zslba(zone),
                                   nvme_zs_to_str(from), from,
@@ -1030,6 +1031,10 @@ static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
         switch (to) {
         case NVME_ZS_ZSE:
         case NVME_ZS_ZSO:
+            NVME_ZA_CLEAR_ALL(zd->za);
+
+            /* fallthrough */
+
         case NVME_ZS_ZSEO:
         case NVME_ZS_ZSF:
         case NVME_ZS_ZSRO:
@@ -1046,6 +1051,10 @@ static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
         switch (to) {
         case NVME_ZS_ZSE:
         case NVME_ZS_ZSO:
+            NVME_ZA_CLEAR_ALL(zd->za);
+
+            /* fallthrough */
+
         case NVME_ZS_ZSF:
         case NVME_ZS_ZSRO:
         case NVME_ZS_ZSIO:
@@ -1061,6 +1070,7 @@ static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
     case NVME_ZS_ZSRO:
         switch (to) {
         case NVME_ZS_ZSO:
+            NVME_ZA_CLEAR_ALL(zd->za);
             break;
 
         default:
@@ -1073,6 +1083,10 @@ static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
         switch (to) {
         case NVME_ZS_ZSE:
         case NVME_ZS_ZSO:
+            NVME_ZA_CLEAR_ALL(zd->za);
+
+            /* fallthrough */
+
         case NVME_ZS_ZSRO:
             break;
 
@@ -1446,6 +1460,123 @@ out:
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
+static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeZoneMgmtRecvCmd *recv = (NvmeZoneMgmtRecvCmd *)&req->cmd;
+    NvmeNamespace *ns = req->ns;
+    NvmeZone *zone;
+    uint8_t zra = recv->zra;
+    uint8_t zrasf = recv->zrasf;
+    uint8_t pr = recv->pr & 0x1;
+    uint64_t slba = le64_to_cpu(recv->slba);
+    size_t len = (le32_to_cpu(recv->numdw) + 1) << 2;
+    int num_zones = 0, zidx = 0, zidx_begin, i;
+    uint16_t zes, status;
+    uint8_t *buf, *bufp, zs_list;
+
+    if (!nvme_ns_zoned(ns)) {
+        return NVME_INVALID_OPCODE | NVME_DNR;
+    }
+
+    trace_pci_nvme_zone_mgmt_recv(nvme_cid(req), nvme_nsid(ns), slba, len,
+                                  zra, zrasf, pr);
+
+    if (!(len && nvme_ns_zone(ns, slba))) {
+        return NVME_SUCCESS;
+    }
+
+    status = nvme_check_mdts(n, len);
+    if (status) {
+        return status;
+    }
+
+    switch (zrasf) {
+    case NVME_ZMR_LIST_ALL:
+        zs_list = 0;
+        break;
+
+    case NVME_ZMR_LIST_ZSE:
+        zs_list = NVME_ZS_ZSE;
+        break;
+
+    case NVME_ZMR_LIST_ZSIO:
+        zs_list = NVME_ZS_ZSIO;
+        break;
+
+    case NVME_ZMR_LIST_ZSEO:
+        zs_list = NVME_ZS_ZSEO;
+        break;
+
+    case NVME_ZMR_LIST_ZSC:
+        zs_list = NVME_ZS_ZSC;
+        break;
+
+    case NVME_ZMR_LIST_ZSF:
+        zs_list = NVME_ZS_ZSF;
+        break;
+
+    case NVME_ZMR_LIST_ZSRO:
+        zs_list = NVME_ZS_ZSRO;
+        break;
+
+    case NVME_ZMR_LIST_ZSO:
+        zs_list = NVME_ZS_ZSO;
+        break;
+    default:
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    zidx_begin = zidx = slba / nvme_ns_zsze(ns);
+    zes = sizeof(NvmeZoneDescriptor);
+    if (zra == NVME_ZMR_EXTENDED_REPORT) {
+        zes += nvme_ns_zdes_bytes(ns);
+    }
+
+    buf = bufp = g_malloc0(len);
+    bufp += sizeof(NvmeZoneReportHeader);
+
+    while ((bufp + zes) - buf <= len && zidx < ns->zns.num_zones) {
+        zone = &ns->zns.zones[zidx++];
+
+        if (zs_list && zs_list != nvme_zs(zone)) {
+            continue;
+        }
+
+        num_zones++;
+
+        memcpy(bufp, zone->zd, sizeof(NvmeZoneDescriptor));
+
+        if (zra == NVME_ZMR_EXTENDED_REPORT) {
+            memcpy(bufp + sizeof(NvmeZoneDescriptor), zone->zde,
+                   nvme_ns_zdes_bytes(ns));
+        }
+
+        bufp += zes;
+    }
+
+    if (!(pr & NVME_ZMR_PARTIAL)) {
+        if (!zs_list) {
+            num_zones = ns->zns.num_zones - zidx_begin;
+        } else {
+            num_zones = 0;
+            for (i = 0; i < ns->zns.num_zones; i++) {
+                zone = &ns->zns.zones[i];
+
+                if (zs_list == nvme_zs(zone)) {
+                    num_zones++;
+                }
+            }
+        }
+    }
+
+    stq_le_p(buf, (uint64_t)num_zones);
+
+    status = nvme_dma(n, buf, len, DMA_DIRECTION_FROM_DEVICE, req);
+    g_free(buf);
+
+    return status;
+}
+
 static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
@@ -1907,6 +2038,8 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_dsm(n, req);
     case NVME_CMD_COPY:
         return nvme_copy(n, req);
+    case NVME_CMD_ZONE_MGMT_RECV:
+        return nvme_zone_mgmt_recv(n, req);
     default:
         trace_pci_nvme_err_invalid_opc(req->cmd.opcode);
         return NVME_INVALID_OPCODE | NVME_DNR;
@@ -2158,6 +2291,11 @@ static void nvme_effects_nvm(NvmeEffectsLog *effects)
     effects->iocs[NVME_CMD_COPY] = NVME_EFFECTS_CSUPP | NVME_EFFECTS_LBCC;
 }
 
+static void nvme_effects_zoned(NvmeEffectsLog *effects)
+{
+    effects->iocs[NVME_CMD_ZONE_MGMT_RECV] = NVME_EFFECTS_CSUPP;
+}
+
 static uint16_t nvme_effects_log(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
                                  NvmeRequest *req)
 {
@@ -2201,6 +2339,10 @@ static uint16_t nvme_effects_log(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
 
         switch (csi) {
         case NVME_IOCS_ZONED:
+            nvme_effects_zoned(&effects);
+
+            /* fallthrough */
+
         case NVME_IOCS_NVM:
             nvme_effects_nvm(&effects);
             break;
@@ -3088,6 +3230,14 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
 
                     /* fallthrough */
 
+                case NVME_ZS_ZSC:
+                    if (nvme_wp(zone) == nvme_zslba(zone) &&
+                        !(zone->zd->za & NVME_ZA_ZDEV)) {
+                        nvme_zrm_transition(ns, zone, NVME_ZS_ZSE);
+                    }
+
+                    /* fallthrough */
+
                 default:
                     break;
                 }
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 8b4533f99000..429b4849d2dc 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -54,6 +54,7 @@ pci_nvme_compare(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid
 pci_nvme_compare_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_discard_cb(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aio_copy_in_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_zone_mgmt_recv(uint16_t cid, uint32_t nsid, uint64_t slba, uint64_t len, uint8_t zra, uint8_t zfeat, uint8_t zflags) "cid %"PRIu16" nsid %"PRIu32" slba 0x%"PRIx64" len %"PRIu64" zra 0x%"PRIx8" zrasf 0x%"PRIx8" pr 0x%"PRIx8""
 pci_nvme_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t qsize, uint16_t qflags) "create submission queue, addr=0x%"PRIx64", sqid=%"PRIu16", cqid=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16""
 pci_nvme_create_cq(uint64_t addr, uint16_t cqid, uint16_t vector, uint16_t size, uint16_t qflags, int ien) "create completion queue, addr=0x%"PRIx64", cqid=%"PRIu16", vector=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16", ien=%d"
 pci_nvme_del_sq(uint16_t qid) "deleting submission queue sqid=%"PRIu16""
-- 
2.29.2


