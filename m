Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1872C5E61
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 01:01:19 +0100 (CET)
Received: from localhost ([::1]:37942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiRCP-0000Cz-Vi
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 19:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxz-0007SO-GX; Thu, 26 Nov 2020 18:46:23 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:34617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxq-0003uM-Ny; Thu, 26 Nov 2020 18:46:23 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E4F525C021C;
 Thu, 26 Nov 2020 18:46:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Nov 2020 18:46:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=xBNEy9TY+OjnW
 BspJwQp2WIA7m5CiTOGu7hT46Et+zk=; b=lkJ6pQGjETHGfP2YaBBXXfP6e3st+
 y74b/Gxo4KPKz8pg7xE1GqKzqbgWeQ5PMxGIHPB6pNY56OseQ5pUph2PCgWmadAh
 t86fU9WFqZJpfjurddCtcD7EtnbaNRFFqhSM/Tb3VYEjkDFr9cFYdIe6AVHyLPcx
 lZiHIMIQ56adFVi0L/BshEkKWTHS8ybhnEEiu2f+NiDylFXdeW0zrotGfEaUJlVa
 gjnLVzRHPqUPozzaS71DN+NQ+SzRPy/0aW3L0C4rtfe0yIA/2LOcNf74QrzWnsED
 DU+wlFzz9BpUK7fIlY3NW346AKIewIzWqPbenvwExHXJ1RZzxZbYqYYgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=xBNEy9TY+OjnWBspJwQp2WIA7m5CiTOGu7hT46Et+zk=; b=eom7yWsy
 oGJi5KBStniaGfbyIykeEB73vi01J1F7ph9wukXjuhmSzma2dOmoeteHggEW9t+Q
 JueRGb0Ihf44ijt5bfLY9mVGC9zpfeFiO+yHPEZ2UA4Ij1mRoay5lyFZKmy6NoYr
 M2HV9fVAlKW55mZj0rq0N0sAIbEsoCFwmSKJdRPvURh/Mu5sqVTTxwmN0qRH3Mvw
 vzDY4PEJgqkJf3EgX4hUwdiRR8ao/2aM9K+XZe3y4vnVl2OJiZsmKFvifz7l8zbm
 lCtD4JK7dEqovvu8TkBsbnnkpN0JzreTkWqJaLwwrFwZ40EtgwJIvNkmKVF9hAEx
 eTyoRBXWV1pdlQ==
X-ME-Sender: <xms:RT7AX0E7p3EtCRg2JrTexGRfapccGEeGSBrIXOxBhCu9Vv63hwFehw>
 <xme:RT7AX9W8Uuln6zepg2SobQsBRR6JSEnLJszYdoWHdODlDl1mM7ZrP1bypJ0weGzXH
 txXuVpptc1K3cynGMs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehfedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:RT7AX-Icnm-nuWKlUdSVPLT6vttSbZjCzskPgDmw9s_8Zrs5qSvnYA>
 <xmx:RT7AX2HEgHV8htZjIKTMvfrz3Vw2igjeVAV2P2TRgbQk_mTJKkAE9A>
 <xmx:RT7AX6WH8hucq5edJ1-qrbQuaOzXZnPgepxs2zj6pn0gHjZnqWit7A>
 <xmx:RT7AX8LyzQ5b18RWigqo4IQmX4rMEyWOf6lnxQRIESSp6N_QgfprTg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8447D3064AB0;
 Thu, 26 Nov 2020 18:46:12 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/12] hw/block/nvme: add basic read/write for zoned
 namespaces
Date: Fri, 27 Nov 2020 00:45:55 +0100
Message-Id: <20201126234601.689714-7-its@irrelevant.dk>
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

This adds basic read and write for zoned namespaces.

A zoned namespace is created by setting the iocs namespace parameter to
0x2 and specifying the zns.zcap parameter (zone capacity) in number of
logical blocks per zone. If a zone size (zns.zsze) is not specified, the
namespace device will set the zone size to be the next power of two and
fit in as many zones as possible on the underlying namespace blockdev.
This behavior is not required by the specification, but ensures that the
device can be initialized by the Linux kernel nvme driver, which
requires a power of two zone size.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/specs/nvme.txt   |   8 +
 hw/block/nvme-ns.h    |  78 ++++++++
 include/block/nvme.h  |  60 +++++-
 hw/block/nvme-ns.c    |  86 +++++++++
 hw/block/nvme.c       | 415 ++++++++++++++++++++++++++++++++++++++++--
 hw/block/trace-events |   8 +
 6 files changed, 635 insertions(+), 20 deletions(-)

diff --git a/docs/specs/nvme.txt b/docs/specs/nvme.txt
index 619bd9ce4378..80cb34406255 100644
--- a/docs/specs/nvme.txt
+++ b/docs/specs/nvme.txt
@@ -6,6 +6,14 @@ The nvme device (-device nvme) emulates an NVM Express Controller.
   `iocs`; The "I/O Command Set" associated with the namespace. E.g. 0x0 for the
      NVM Command Set (the default), or 0x2 for the Zoned Namespace Command Set.
 
+  `zns.zcap`; If `iocs` is 0x2, this specifies the zone capacity. It is
+     specified in units of logical blocks.
+
+  `zns.zsze`; If `iocs` is 0x2, this specifies the zone size. It is specified
+     in units of the logical blocks. If not specified, the value depends on
+     zns.zcap; if the zone capacity is a power of two, the zone size will be
+     set to that, otherwise it will default to the next power of two.
+
 
 Reference Specifications
 ------------------------
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 3b095423cf52..e373d62c5873 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -27,8 +27,19 @@ typedef struct NvmeNamespaceParams {
     uint16_t mssrl;
     uint32_t mcl;
     uint8_t  msrc;
+
+    struct {
+        uint64_t zcap;
+        uint64_t zsze;
+    } zns;
 } NvmeNamespaceParams;
 
+typedef struct NvmeZone {
+    NvmeZoneDescriptor *zd;
+
+    uint64_t wp_staging;
+} NvmeZone;
+
 typedef struct NvmeNamespace {
     DeviceState  parent_obj;
     BlockConf    blkconf;
@@ -42,8 +53,20 @@ typedef struct NvmeNamespace {
     struct {
         uint32_t err_rec;
     } features;
+
+    struct {
+        int num_zones;
+
+        NvmeZone           *zones;
+        NvmeZoneDescriptor *zd;
+    } zns;
 } NvmeNamespace;
 
+static inline bool nvme_ns_zoned(NvmeNamespace *ns)
+{
+    return ns->iocs == NVME_IOCS_ZONED;
+}
+
 static inline uint32_t nvme_nsid(NvmeNamespace *ns)
 {
     if (ns) {
@@ -59,11 +82,23 @@ static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
     return &id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
 }
 
+static inline NvmeLBAFE *nvme_ns_lbafe(NvmeNamespace *ns)
+{
+    NvmeIdNsNvm *id_ns = ns->id_ns[NVME_IOCS_NVM];
+    NvmeIdNsZns *id_ns_zns = ns->id_ns[NVME_IOCS_ZONED];
+    return &id_ns_zns->lbafe[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
+}
+
 static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
 {
     return nvme_ns_lbaf(ns)->ds;
 }
 
+static inline uint64_t nvme_ns_zsze(NvmeNamespace *ns)
+{
+    return nvme_ns_lbafe(ns)->zsze;
+}
+
 /* calculate the number of LBAs that the namespace can accomodate */
 static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
 {
@@ -82,8 +117,51 @@ static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
     return lba << nvme_ns_lbads(ns);
 }
 
+static inline int nvme_ns_zone_idx(NvmeNamespace *ns, uint64_t lba)
+{
+    return lba / nvme_ns_zsze(ns);
+}
+
+static inline NvmeZone *nvme_ns_zone(NvmeNamespace *ns, uint64_t lba)
+{
+    int idx = nvme_ns_zone_idx(ns, lba);
+    if (unlikely(idx >= ns->zns.num_zones)) {
+        return NULL;
+    }
+
+    return &ns->zns.zones[idx];
+}
+
+static inline NvmeZoneState nvme_zs(NvmeZone *zone)
+{
+    return (zone->zd->zs >> 4) & 0xf;
+}
+
+static inline void nvme_zs_set(NvmeZone *zone, NvmeZoneState zs)
+{
+    zone->zd->zs = zs << 4;
+}
+
+static inline uint64_t nvme_zslba(NvmeZone *zone)
+{
+    return le64_to_cpu(zone->zd->zslba);
+}
+
+static inline uint64_t nvme_zcap(NvmeZone *zone)
+{
+    return le64_to_cpu(zone->zd->zcap);
+}
+
+static inline uint64_t nvme_wp(NvmeZone *zone)
+{
+    return le64_to_cpu(zone->zd->wp);
+}
+
 typedef struct NvmeCtrl NvmeCtrl;
 
+const char *nvme_zs_str(NvmeZone *zone);
+const char *nvme_zs_to_str(NvmeZoneState zs);
+
 int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_flush(NvmeNamespace *ns);
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 53c051d52c53..6a5616bb9304 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -395,8 +395,9 @@ enum NvmePmrmscMask {
     (pmrmsc |= (uint64_t)(val & PMRMSC_CBA_MASK) << PMRMSC_CBA_SHIFT)
 
 enum NvmeCommandSet {
-    NVME_IOCS_NVM = 0x0,
-    NVME_IOCS_MAX = 0x1,
+    NVME_IOCS_NVM   = 0x0,
+    NVME_IOCS_ZONED = 0x2,
+    NVME_IOCS_MAX   = 0x3,
 };
 
 enum NvmeSglDescriptorType {
@@ -738,6 +739,12 @@ enum NvmeStatusCodes {
     NVME_INVALID_PROT_INFO      = 0x0181,
     NVME_WRITE_TO_RO            = 0x0182,
     NVME_CMD_SIZE_LIMIT         = 0x0183,
+    NVME_ZONE_BOUNDARY_ERROR    = 0x01b8,
+    NVME_ZONE_IS_FULL           = 0x01b9,
+    NVME_ZONE_IS_READ_ONLY      = 0x01ba,
+    NVME_ZONE_IS_OFFLINE        = 0x01bb,
+    NVME_ZONE_INVALID_WRITE     = 0x01bc,
+    NVME_INVALID_ZONE_STATE_TRANSITION = 0x01bf,
     NVME_WRITE_FAULT            = 0x0280,
     NVME_UNRECOVERED_READ       = 0x0281,
     NVME_E2E_GUARD_ERROR        = 0x0282,
@@ -814,6 +821,31 @@ enum {
     NVME_EFFECTS_UUID_SEL   = 1 << 19,
 };
 
+typedef enum NvmeZoneType {
+    NVME_ZT_SEQ = 0x2,
+} NvmeZoneType;
+
+typedef enum NvmeZoneState {
+    NVME_ZS_ZSE  = 0x1,
+    NVME_ZS_ZSIO = 0x2,
+    NVME_ZS_ZSEO = 0x3,
+    NVME_ZS_ZSC  = 0x4,
+    NVME_ZS_ZSRO = 0xd,
+    NVME_ZS_ZSF  = 0xe,
+    NVME_ZS_ZSO  = 0xf,
+} NvmeZoneState;
+
+typedef struct QEMU_PACKED NvmeZoneDescriptor {
+    uint8_t  zt;
+    uint8_t  zs;
+    uint8_t  za;
+    uint8_t  rsvd3[5];
+    uint64_t zcap;
+    uint64_t zslba;
+    uint64_t wp;
+    uint8_t  rsvd32[32];
+} NvmeZoneDescriptor;
+
 enum NvmeSmartWarn {
     NVME_SMART_SPARE                  = 1 << 0,
     NVME_SMART_TEMPERATURE            = 1 << 1,
@@ -827,6 +859,7 @@ enum NvmeLogIdentifier {
     NVME_LOG_SMART_INFO     = 0x02,
     NVME_LOG_FW_SLOT_INFO   = 0x03,
     NVME_LOG_EFFECTS        = 0x05,
+    NVME_LOG_CHANGED_ZONE_LIST = 0xbf,
 };
 
 typedef struct QEMU_PACKED NvmePSD {
@@ -1146,9 +1179,27 @@ enum NvmeIdNsDps {
     DPS_FIRST_EIGHT = 8,
 };
 
+typedef struct QEMU_PACKED NvmeLBAFE {
+    uint64_t    zsze;
+    uint8_t     zdes;
+    uint8_t     rsvd9[7];
+} NvmeLBAFE;
+
+typedef struct QEMU_PACKED NvmeIdNsZns {
+    uint16_t    zoc;
+    uint16_t    ozcs;
+    uint32_t    mar;
+    uint32_t    mor;
+    uint32_t    rrl;
+    uint32_t    frl;
+    uint8_t     rsvd20[2796];
+    NvmeLBAFE   lbafe[16];
+    uint8_t     rsvd3072[768];
+    uint8_t     vs[256];
+} NvmeIdNsZns;
+
 static inline void _nvme_check_size(void)
 {
-    QEMU_BUILD_BUG_ON(sizeof(NvmeBar) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeAerResult) != 4);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCqe) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDsmRange) != 16);
@@ -1167,8 +1218,11 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeSmartLog) != 512);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrl) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsNvm) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsZns) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSglDescriptor) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) != 4);
     QEMU_BUILD_BUG_ON(sizeof(NvmeEffectsLog) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeZoneDescriptor) != 64);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeLBAFE) != 16);
 }
 #endif
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 7d70095439b6..1f3d0644ba42 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -30,6 +30,67 @@
 
 #define MIN_DISCARD_GRANULARITY (4 * KiB)
 
+const char *nvme_zs_str(NvmeZone *zone)
+{
+    return nvme_zs_to_str(nvme_zs(zone));
+}
+
+const char *nvme_zs_to_str(NvmeZoneState zs)
+{
+    switch (zs) {
+    case NVME_ZS_ZSE:  return "ZSE";
+    case NVME_ZS_ZSIO: return "ZSIO";
+    case NVME_ZS_ZSEO: return "ZSEO";
+    case NVME_ZS_ZSC:  return "ZSC";
+    case NVME_ZS_ZSRO: return "ZSRO";
+    case NVME_ZS_ZSF:  return "ZSF";
+    case NVME_ZS_ZSO:  return "ZSO";
+    }
+
+    return "UNKNOWN";
+}
+
+static void nvme_ns_zns_init_zones(NvmeNamespace *ns)
+{
+    NvmeZone *zone;
+    NvmeZoneDescriptor *zd;
+    uint64_t zslba, zsze = nvme_ns_zsze(ns);
+
+    for (int i = 0; i < ns->zns.num_zones; i++) {
+        zslba = i * zsze;
+
+        zone = &ns->zns.zones[i];
+        zone->zd = &ns->zns.zd[i];
+        zone->wp_staging = zslba;
+
+        zd = zone->zd;
+        zd->zt = NVME_ZT_SEQ;
+        zd->zcap = cpu_to_le64(ns->params.zns.zcap);
+        zd->wp = zd->zslba = cpu_to_le64(zslba);
+
+        nvme_zs_set(zone, NVME_ZS_ZSE);
+    }
+}
+
+static void nvme_ns_init_zoned(NvmeNamespace *ns)
+{
+    NvmeIdNsNvm *id_ns = ns->id_ns[NVME_IOCS_NVM];
+    NvmeIdNsZns *id_ns_zns = ns->id_ns[NVME_IOCS_ZONED];
+
+    for (int i = 0; i <= id_ns->nlbaf; i++) {
+        id_ns_zns->lbafe[i].zsze = ns->params.zns.zsze ?
+            cpu_to_le64(ns->params.zns.zsze) :
+            cpu_to_le64(pow2ceil(ns->params.zns.zcap));
+    }
+
+    ns->zns.num_zones = nvme_ns_nlbas(ns) / nvme_ns_zsze(ns);
+    ns->zns.zones = g_malloc0_n(ns->zns.num_zones, sizeof(NvmeZone));
+    ns->zns.zd = g_malloc0_n(ns->zns.num_zones, sizeof(NvmeZoneDescriptor));
+
+    id_ns_zns->mar = 0xffffffff;
+    id_ns_zns->mor = 0xffffffff;
+}
+
 static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 {
     BlockDriverInfo bdi;
@@ -48,6 +109,11 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 
     id_ns->nsze = cpu_to_le64(nvme_ns_nlbas(ns));
 
+    if (nvme_ns_zoned(ns)) {
+        ns->id_ns[NVME_IOCS_ZONED] = g_new0(NvmeIdNsZns, 1);
+        nvme_ns_init_zoned(ns);
+    }
+
     /* no thin provisioning */
     id_ns->ncap = id_ns->nsze;
     id_ns->nuse = id_ns->ncap;
@@ -112,6 +178,20 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
     switch (ns->params.iocs) {
     case NVME_IOCS_NVM:
         break;
+
+    case NVME_IOCS_ZONED:
+        if (!ns->params.zns.zcap) {
+            error_setg(errp, "zns.zcap must be specified");
+            return -1;
+        }
+
+        if (ns->params.zns.zsze && ns->params.zns.zsze < ns->params.zns.zcap) {
+            error_setg(errp, "zns.zsze cannot be less than zns.zcap");
+            return -1;
+        }
+
+        break;
+
     default:
         error_setg(errp, "unsupported iocs");
         return -1;
@@ -134,6 +214,10 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
+    if (nvme_ns_zoned(ns)) {
+        nvme_ns_zns_init_zones(ns);
+    }
+
     if (nvme_register_namespace(n, ns, errp)) {
         return -1;
     }
@@ -173,6 +257,8 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_UINT16("mssrl", NvmeNamespace, params.mssrl, 128),
     DEFINE_PROP_UINT32("mcl", NvmeNamespace, params.mcl, 128),
     DEFINE_PROP_UINT8("msrc", NvmeNamespace, params.msrc, 255),
+    DEFINE_PROP_UINT64("zns.zcap", NvmeNamespace, params.zns.zcap, 0),
+    DEFINE_PROP_UINT64("zns.zsze", NvmeNamespace, params.zns.zsze, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 5df7c9598b13..60a467d5df62 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -858,6 +858,90 @@ static void nvme_clear_events(NvmeCtrl *n, uint8_t event_type)
     }
 }
 
+static uint16_t nvme_check_zone_readable(NvmeZone *zone)
+{
+    if (nvme_zs(zone) == NVME_ZS_ZSO) {
+        trace_pci_nvme_err_zone_is_offline(nvme_zslba(zone));
+        return NVME_ZONE_IS_OFFLINE | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
+static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
+                                     uint32_t nlb, NvmeZone *zone)
+{
+    uint64_t zslba = nvme_zslba(zone);
+    uint64_t zsze = nvme_ns_zsze(ns);
+    uint16_t status;
+
+    status = nvme_check_zone_readable(zone);
+    if (status) {
+        return status;
+    }
+
+    if ((slba + nlb) > (zslba + zsze)) {
+        trace_pci_nvme_err_zone_boundary(slba, nlb, zsze);
+        return NVME_ZONE_BOUNDARY_ERROR | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
+static uint16_t nvme_check_zone_writable(NvmeZone *zone)
+{
+    NvmeZoneState zs = nvme_zs(zone);
+    uint64_t zslba = nvme_zslba(zone);
+
+    switch (zs) {
+    case NVME_ZS_ZSE:
+    case NVME_ZS_ZSIO:
+    case NVME_ZS_ZSEO:
+    case NVME_ZS_ZSC:
+        return NVME_SUCCESS;
+    case NVME_ZS_ZSRO:
+        trace_pci_nvme_err_zone_is_read_only(zslba);
+        return NVME_ZONE_IS_READ_ONLY | NVME_DNR;
+    case NVME_ZS_ZSF:
+        trace_pci_nvme_err_zone_is_full(zslba);
+        return NVME_ZONE_IS_FULL;
+    case NVME_ZS_ZSO:
+        trace_pci_nvme_err_zone_is_offline(zslba);
+        return NVME_ZONE_IS_OFFLINE | NVME_DNR;
+    }
+
+    trace_pci_nvme_err_invalid_zone_state(zslba, nvme_zs_to_str(zs), zs);
+    return NVME_INTERNAL_DEV_ERROR | NVME_DNR;
+}
+
+static uint16_t nvme_check_zone_write(uint64_t slba, uint32_t nlb,
+                                      NvmeZone *zone)
+{
+    uint64_t zslba, wp, zcap;
+    uint16_t status;
+
+    zslba = nvme_zslba(zone);
+    wp = zone->wp_staging;
+    zcap = nvme_zcap(zone);
+
+    status = nvme_check_zone_writable(zone);
+    if (status) {
+        return status;
+    }
+
+    if ((wp - zslba) + nlb > zcap) {
+        trace_pci_nvme_err_zone_boundary(slba, nlb, zcap);
+        return NVME_ZONE_BOUNDARY_ERROR | NVME_DNR;
+    }
+
+    if (slba != wp) {
+        trace_pci_nvme_err_zone_invalid_write(slba, wp);
+        return NVME_ZONE_INVALID_WRITE;
+    }
+
+    return NVME_SUCCESS;
+}
+
 static inline uint16_t nvme_check_mdts(NvmeCtrl *n, size_t len)
 {
     uint8_t mdts = n->params.mdts;
@@ -924,8 +1008,125 @@ static uint16_t nvme_check_dulbe(NvmeNamespace *ns, uint64_t slba,
     return NVME_SUCCESS;
 }
 
-static void nvme_aio_err(NvmeRequest *req, int ret)
+static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
+                                    NvmeZoneState to)
 {
+    NvmeZoneState from = nvme_zs(zone);
+
+    trace_pci_nvme_zrm_transition(ns->params.nsid, nvme_zslba(zone),
+                                  nvme_zs_to_str(from), from,
+                                  nvme_zs_to_str(to), to);
+
+    if (from == to) {
+        return NVME_SUCCESS;
+    }
+
+    switch (from) {
+    case NVME_ZS_ZSE:
+        break;
+
+    case NVME_ZS_ZSIO:
+    case NVME_ZS_ZSEO:
+        switch (to) {
+        case NVME_ZS_ZSE:
+        case NVME_ZS_ZSO:
+        case NVME_ZS_ZSEO:
+        case NVME_ZS_ZSF:
+        case NVME_ZS_ZSRO:
+        case NVME_ZS_ZSC:
+            break;
+
+        default:
+            return NVME_INVALID_ZONE_STATE_TRANSITION | NVME_DNR;
+        }
+
+        break;
+
+    case NVME_ZS_ZSC:
+        switch (to) {
+        case NVME_ZS_ZSE:
+        case NVME_ZS_ZSO:
+        case NVME_ZS_ZSF:
+        case NVME_ZS_ZSRO:
+        case NVME_ZS_ZSIO:
+        case NVME_ZS_ZSEO:
+            break;
+
+        default:
+            return NVME_INVALID_ZONE_STATE_TRANSITION | NVME_DNR;
+        }
+
+        break;
+
+    case NVME_ZS_ZSRO:
+        switch (to) {
+        case NVME_ZS_ZSO:
+            break;
+
+        default:
+            return NVME_INVALID_ZONE_STATE_TRANSITION | NVME_DNR;
+        }
+
+        break;
+
+    case NVME_ZS_ZSF:
+        switch (to) {
+        case NVME_ZS_ZSE:
+        case NVME_ZS_ZSO:
+        case NVME_ZS_ZSRO:
+            break;
+
+        default:
+            return NVME_INVALID_ZONE_STATE_TRANSITION | NVME_DNR;
+        }
+
+        break;
+
+    case NVME_ZS_ZSO:
+        return NVME_INVALID_ZONE_STATE_TRANSITION | NVME_DNR;
+    }
+
+    nvme_zs_set(zone, to);
+    return NVME_SUCCESS;
+}
+
+static uint16_t __nvme_zns_advance_wp(NvmeNamespace *ns, NvmeZone *zone,
+                                      uint32_t nlb)
+{
+    uint64_t wp = nvme_wp(zone);
+
+    trace_pci_nvme_zns_advance_wp(nvme_nsid(ns), nvme_zslba(zone), wp, nlb);
+
+    wp += nlb;
+    zone->zd->wp = cpu_to_le64(wp);
+    if (wp == nvme_zslba(zone) + nvme_zcap(zone)) {
+        uint16_t status = nvme_zrm_transition(ns, zone, NVME_ZS_ZSF);
+        if (status) {
+            return status;
+        }
+    }
+
+    return NVME_SUCCESS;
+}
+
+static void nvme_zns_advance_wp(NvmeRequest *req)
+{
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint64_t slba = le64_to_cpu(rw->slba);
+    uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
+    NvmeZone *zone = nvme_ns_zone(req->ns, slba);
+    uint16_t status;
+
+    status = __nvme_zns_advance_wp(req->ns, zone, nlb);
+    if (status) {
+        req->status = status;
+    }
+}
+
+static void nvme_aio_err(NvmeRequest *req, int ret, NvmeZone *zone)
+{
+    NvmeNamespace *ns = req->ns;
+
     uint16_t status = NVME_SUCCESS;
     Error *local_err = NULL;
 
@@ -948,6 +1149,17 @@ static void nvme_aio_err(NvmeRequest *req, int ret)
     error_setg_errno(&local_err, -ret, "aio failed");
     error_report_err(local_err);
 
+    if (zone) {
+        /*
+         * Transition the zone to read-only on write fault and offline
+         * on unrecovered read or internal dev error.
+         */
+        NvmeZoneState zs = status == NVME_WRITE_FAULT ?
+            NVME_ZS_ZSRO : NVME_ZS_ZSO;
+
+        nvme_zrm_transition(ns, zone, zs);
+    }
+
     /*
      * Set the command status code to the first encountered error but allow a
      * subsequent Internal Device Error to trump it.
@@ -963,6 +1175,7 @@ static void nvme_rw_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
     NvmeNamespace *ns = req->ns;
+    NvmeZone *zone = NULL;
 
     BlockBackend *blk = ns->blkconf.blk;
     BlockAcctCookie *acct = &req->acct;
@@ -970,25 +1183,53 @@ static void nvme_rw_cb(void *opaque, int ret)
 
     trace_pci_nvme_rw_cb(nvme_cid(req), blk_name(blk));
 
+    if (nvme_ns_zoned(ns)) {
+        NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+        uint64_t slba = le64_to_cpu(rw->slba);
+        zone = nvme_ns_zone(ns, slba);
+    }
+
     if (!ret) {
         block_acct_done(stats, acct);
+
+        if (zone) {
+            switch (req->cmd.opcode) {
+            case NVME_CMD_WRITE:
+            case NVME_CMD_WRITE_ZEROES:
+                nvme_zns_advance_wp(req);
+            default:
+                break;
+            }
+        }
     } else {
         block_acct_failed(stats, acct);
-        nvme_aio_err(req, ret);
+        nvme_aio_err(req, ret, zone);
     }
 
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
+struct nvme_discard_ctx {
+    NvmeRequest *req;
+    uint64_t slba;
+};
+
 static void nvme_aio_discard_cb(void *opaque, int ret)
 {
-    NvmeRequest *req = opaque;
+    struct nvme_discard_ctx *ctx = opaque;
+    NvmeRequest *req = ctx->req;
+    NvmeNamespace *ns = req->ns;
     uintptr_t *discards = (uintptr_t *)&req->opaque;
 
     trace_pci_nvme_aio_discard_cb(nvme_cid(req));
 
     if (ret) {
-        nvme_aio_err(req, ret);
+        NvmeZone *zone = NULL;
+        if (nvme_ns_zoned(ns)) {
+            zone = nvme_ns_zone(ns, ctx->slba);
+        }
+
+        nvme_aio_err(req, ret, zone);
     }
 
     (*discards)--;
@@ -1009,21 +1250,38 @@ struct nvme_copy_ctx {
 struct nvme_copy_in_ctx {
     NvmeRequest *req;
     QEMUIOVector iov;
+    uint64_t slba;
 };
 
 static void nvme_copy_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
     NvmeNamespace *ns = req->ns;
+    NvmeZone *zone = NULL;
     struct nvme_copy_ctx *ctx = req->opaque;
 
     trace_pci_nvme_copy_cb(nvme_cid(req));
 
+    if (nvme_ns_zoned(ns)) {
+        NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
+        uint64_t sdlba = le64_to_cpu(copy->sdlba);
+        zone = nvme_ns_zone(ns, sdlba);
+    }
+
     if (!ret) {
         block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
+
+        if (zone) {
+            uint16_t status;
+
+            status = __nvme_zns_advance_wp(ns, zone, ctx->nlb);
+            if (status) {
+                req->status = status;
+            }
+        }
     } else {
         block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
-        nvme_aio_err(req, ret);
+        nvme_aio_err(req, ret, zone);
     }
 
     g_free(ctx->bounce);
@@ -1048,14 +1306,32 @@ static void nvme_copy_in_complete(NvmeRequest *req)
     if (status) {
         trace_pci_nvme_err_invalid_lba_range(sdlba, ctx->nlb,
                                              nvme_ns_nsze(ns));
-        req->status = status;
+        goto invalid;
+    }
 
-        g_free(ctx->bounce);
-        g_free(ctx);
+    if (nvme_ns_zoned(ns)) {
+        NvmeZone *zone = nvme_ns_zone(ns, sdlba);
+        assert(zone);
 
-        nvme_enqueue_req_completion(nvme_cq(req), req);
+        status = nvme_check_zone_write(sdlba, ctx->nlb, zone);
+        if (status) {
+            goto invalid;
+        }
 
-        return;
+        switch (nvme_zs(zone)) {
+        case NVME_ZS_ZSIO:
+        case NVME_ZS_ZSEO:
+            break;
+        default:
+            status = nvme_zrm_transition(ns, zone, NVME_ZS_ZSIO);
+            if (status) {
+                goto invalid;
+            }
+
+            break;
+        }
+
+        zone->wp_staging += ctx->nlb;
     }
 
     qemu_iovec_init(&req->iov, 1);
@@ -1066,6 +1342,16 @@ static void nvme_copy_in_complete(NvmeRequest *req)
 
     req->aiocb = blk_aio_pwritev(ns->blkconf.blk, nvme_l2b(ns, sdlba),
                                  &req->iov, 0, nvme_copy_cb, req);
+
+    return;
+
+invalid:
+    req->status = status;
+
+    g_free(ctx->bounce);
+    g_free(ctx);
+
+    nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
 static void nvme_aio_copy_in_cb(void *opaque, int ret)
@@ -1073,17 +1359,22 @@ static void nvme_aio_copy_in_cb(void *opaque, int ret)
     struct nvme_copy_in_ctx *in_ctx = opaque;
     NvmeRequest *req = in_ctx->req;
     NvmeNamespace *ns = req->ns;
+    NvmeZone *zone = NULL;
     struct nvme_copy_ctx *ctx = req->opaque;
 
-    qemu_iovec_destroy(&in_ctx->iov);
-    g_free(in_ctx);
-
     trace_pci_nvme_aio_copy_in_cb(nvme_cid(req));
 
     if (ret) {
-        nvme_aio_err(req, ret);
+        if (nvme_ns_zoned(ns)) {
+            zone = nvme_ns_zone(ns, in_ctx->slba);
+        }
+
+        nvme_aio_err(req, ret, zone);
     }
 
+    qemu_iovec_destroy(&in_ctx->iov);
+    g_free(in_ctx);
+
     ctx->copies--;
 
     if (ctx->copies) {
@@ -1114,6 +1405,7 @@ static void nvme_compare_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
     NvmeNamespace *ns = req->ns;
+    NvmeZone *zone = NULL;
     struct nvme_compare_ctx *ctx = req->opaque;
     g_autofree uint8_t *buf = NULL;
     uint16_t status;
@@ -1123,8 +1415,13 @@ static void nvme_compare_cb(void *opaque, int ret)
     if (!ret) {
         block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
     } else {
+        if (nvme_ns_zoned(ns)) {
+            NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+            zone = nvme_ns_zone(ns, le64_to_cpu(rw->slba));
+        }
+
         block_acct_failed(blk_get_stats(ns->blkconf.blk), &req->acct);
-        nvme_aio_err(req, ret);
+        nvme_aio_err(req, ret, zone);
         goto out;
     }
 
@@ -1198,11 +1495,16 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
 
             while (len) {
                 size_t bytes = MIN(BDRV_REQUEST_MAX_BYTES, len);
+                struct nvme_discard_ctx *ctx;
+
+                ctx = g_new0(struct nvme_discard_ctx, 1);
+                ctx->req = req;
+                ctx->slba = slba;
 
                 (*discards)++;
 
                 blk_aio_pdiscard(ns->blkconf.blk, offset, bytes,
-                                 nvme_aio_discard_cb, req);
+                                 nvme_aio_discard_cb, ctx);
 
                 offset += bytes;
                 len -= bytes;
@@ -1289,6 +1591,16 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
                 goto free_bounce;
             }
         }
+
+        if (nvme_ns_zoned(ns)) {
+            NvmeZone *zone = nvme_ns_zone(ns, slba);
+            assert(zone);
+
+            status = nvme_check_zone_read(ns, slba, nlb, zone);
+            if (status) {
+                goto free_bounce;
+            }
+        }
     }
 
     block_acct_start(blk_get_stats(ns->blkconf.blk), &req->acct,
@@ -1313,6 +1625,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 
         struct nvme_copy_in_ctx *in_ctx = g_new(struct nvme_copy_in_ctx, 1);
         in_ctx->req = req;
+        in_ctx->slba = slba;
 
         qemu_iovec_init(&in_ctx->iov, 1);
         qemu_iovec_add(&in_ctx->iov, bouncep, len);
@@ -1374,6 +1687,17 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
+    if (nvme_ns_zoned(ns)) {
+        NvmeZone *zone = nvme_ns_zone(ns, slba);
+        assert(zone);
+
+        status = nvme_check_zone_read(ns, slba, nlb, zone);
+        if (status) {
+            return status;
+        }
+    }
+
+
     bounce = g_malloc(len);
 
     ctx = g_new(struct nvme_compare_ctx, 1);
@@ -1424,6 +1748,16 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
+    if (nvme_ns_zoned(ns)) {
+        NvmeZone *zone = nvme_ns_zone(ns, slba);
+        assert(zone);
+
+        status = nvme_check_zone_read(ns, slba, nlb, zone);
+        if (status) {
+            goto invalid;
+        }
+    }
+
     if (NVME_ERR_REC_DULBE(ns->features.err_rec)) {
         status = nvme_check_dulbe(ns, slba, nlb);
         if (status) {
@@ -1483,6 +1817,31 @@ static uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
+    if (nvme_ns_zoned(ns)) {
+        NvmeZone *zone = nvme_ns_zone(ns, slba);
+        assert(zone);
+
+        status = nvme_check_zone_write(slba, nlb, zone);
+        if (status) {
+            goto invalid;
+        }
+
+        switch (nvme_zs(zone)) {
+        case NVME_ZS_ZSIO:
+        case NVME_ZS_ZSEO:
+            break;
+        default:
+            status = nvme_zrm_transition(ns, zone, NVME_ZS_ZSIO);
+            if (status) {
+                goto invalid;
+            }
+
+            break;
+        }
+
+        zone->wp_staging += nlb;
+    }
+
     data_offset = nvme_l2b(ns, slba);
 
     if (!wrz) {
@@ -1841,6 +2200,7 @@ static uint16_t nvme_effects_log(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
         }
 
         switch (csi) {
+        case NVME_IOCS_ZONED:
         case NVME_IOCS_NVM:
             nvme_effects_nvm(&effects);
             break;
@@ -2716,6 +3076,23 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
         }
 
         nvme_ns_flush(ns);
+
+        if (nvme_ns_zoned(ns)) {
+            for (int i = 0; i < ns->zns.num_zones; i++) {
+                NvmeZone *zone = &ns->zns.zones[i];
+
+                switch (nvme_zs(zone)) {
+                case NVME_ZS_ZSIO:
+                case NVME_ZS_ZSEO:
+                    nvme_zrm_transition(ns, zone, NVME_ZS_ZSC);
+
+                    /* fallthrough */
+
+                default:
+                    break;
+                }
+            }
+        }
     }
 }
 
@@ -3287,7 +3664,8 @@ static void nvme_init_state(NvmeCtrl *n)
     n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
-    n->iocscs[0] = 1 << NVME_IOCS_NVM;
+    n->iocscs[0] = (1 << NVME_IOCS_NVM) | (1 << NVME_IOCS_ZONED);
+    n->iocscs[1] = 1 << NVME_IOCS_NVM;
     n->features.iocsci = 0;
 }
 
@@ -3456,6 +3834,9 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     uint8_t *pci_conf = pci_dev->config;
     char *subnqn;
 
+    n->id_ctrl_iocss[NVME_IOCS_NVM] = g_new0(NvmeIdCtrl, 1);
+    n->id_ctrl_iocss[NVME_IOCS_ZONED] = g_new0(NvmeIdCtrl, 1);
+
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
     strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 1f1aef719301..8b4533f99000 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -82,6 +82,8 @@ pci_nvme_enqueue_event_noqueue(int queued) "queued %d"
 pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
 pci_nvme_no_outstanding_aers(void) "ignoring event; no outstanding AERs"
 pci_nvme_enqueue_req_completion(uint16_t cid, uint16_t cqid, uint16_t status) "cid %"PRIu16" cqid %"PRIu16" status 0x%"PRIx16""
+pci_nvme_zrm_transition(uint32_t nsid, uint64_t zslba, const char *s_from, uint8_t from, const char *s_to, uint8_t to) "nsid %"PRIu32" zslba 0x%"PRIx64" from '%s' (%"PRIu8") to '%s' (%"PRIu8")"
+pci_nvme_zns_advance_wp(uint32_t nsid, uint64_t zslba, uint64_t wp_orig, uint32_t nlb) "nsid 0x%"PRIx32" zslba 0x%"PRIx64" wp_orig 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_mmio_read(uint64_t addr) "addr 0x%"PRIx64""
 pci_nvme_mmio_write(uint64_t addr, uint64_t data) "addr 0x%"PRIx64" data 0x%"PRIx64""
 pci_nvme_mmio_doorbell_cq(uint16_t cqid, uint16_t new_head) "cqid %"PRIu16" new_head %"PRIu16""
@@ -107,6 +109,11 @@ pci_nvme_err_addr_write(uint64_t addr) "addr 0x%"PRIx64""
 pci_nvme_err_cfs(void) "controller fatal status"
 pci_nvme_err_aio(uint16_t cid, const char *errname, uint16_t status) "cid %"PRIu16" err '%s' status 0x%"PRIx16""
 pci_nvme_err_copy_invalid_format(uint8_t format) "format 0x%"PRIx8""
+pci_nvme_err_zone_is_full(uint64_t zslba) "zslba 0x%"PRIx64""
+pci_nvme_err_zone_is_read_only(uint64_t zslba) "zslba 0x%"PRIx64""
+pci_nvme_err_zone_is_offline(uint64_t zslba) "zslba 0x%"PRIx64""
+pci_nvme_err_zone_invalid_write(uint64_t slba, uint64_t wp) "lba 0x%"PRIx64" wp 0x%"PRIx64""
+pci_nvme_err_zone_boundary(uint64_t slba, uint32_t nlb, uint64_t zcap) "lba 0x%"PRIx64" nlb %"PRIu32" zcap 0x%"PRIx64""
 pci_nvme_err_invalid_sgld(uint16_t cid, uint8_t typ) "cid %"PRIu16" type 0x%"PRIx8""
 pci_nvme_err_invalid_num_sgld(uint16_t cid, uint8_t typ) "cid %"PRIu16" type 0x%"PRIx8""
 pci_nvme_err_invalid_sgl_excess_length(uint16_t cid) "cid %"PRIu16""
@@ -133,6 +140,7 @@ pci_nvme_err_invalid_identify_cns(uint16_t cns) "identify, invalid cns=0x%"PRIx1
 pci_nvme_err_invalid_getfeat(int dw10) "invalid get features, dw10=0x%"PRIx32""
 pci_nvme_err_invalid_setfeat(uint32_t dw10) "invalid set features, dw10=0x%"PRIx32""
 pci_nvme_err_invalid_log_page(uint16_t cid, uint16_t lid) "cid %"PRIu16" lid 0x%"PRIx16""
+pci_nvme_err_invalid_zone_state(uint64_t zslba, const char *zs_str, uint8_t zs) "zslba 0x%"PRIx64" zs '%s' (%"PRIu8")"
 pci_nvme_err_startfail_cq(void) "nvme_start_ctrl failed because there are non-admin completion queues"
 pci_nvme_err_startfail_sq(void) "nvme_start_ctrl failed because there are non-admin submission queues"
 pci_nvme_err_startfail_nbarasq(void) "nvme_start_ctrl failed because the admin submission queue address is null"
-- 
2.29.2


