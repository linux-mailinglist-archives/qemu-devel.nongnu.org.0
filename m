Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6404427DCB2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 01:31:10 +0200 (CEST)
Received: from localhost ([::1]:56158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNP59-0006ua-OR
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 19:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kNOuI-0000jK-Td; Tue, 29 Sep 2020 19:19:38 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:41005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kNOuF-00009K-9L; Tue, 29 Sep 2020 19:19:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 518F5EAD;
 Tue, 29 Sep 2020 19:19:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 29 Sep 2020 19:19:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=sAsp3uvhvuIl8
 ag4Y4oHp+LMFTT42Z4taNVnJwmaTr8=; b=Wrbr9APqKqBlXDz+55KX2eWCzj8bf
 xoAsnoA95X5ArCABcuRA+y6UNuOEUp4Xd2HPs+4Dp20R6uWsvo0bNyJLUz1P+rMr
 XLOQzosP+Q6/5Max6pPe/Uc70rq4rBscmJ5SOi6Mokpws8DiGTYcMpjKguLjzhEE
 7GfOrn7Qn8FOGgGmZJ/8uFrMH/lkNkkGWx/7PsENeEwqhMZT1W5KqZiykfUrfbEd
 W8lNyFyzSuM1fCjUhLEKIWPIex5aLkRuCt98y/2VjiDg9TT4SVDwtkxklyS5mruz
 DgFuxjkHiyFxK2HO5SefvaOBK1W8seuh7UQnLLw/STGm+ElRs4a0BKrFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=sAsp3uvhvuIl8ag4Y4oHp+LMFTT42Z4taNVnJwmaTr8=; b=nJ2ETPO+
 P+B/VcPDWp5XzHCPQ88IWt4yYyjxzfYrCJEOyUVzy6/0a38ojUbVimMWJMVjRwhw
 wMfsrLovyd+Xzi3IMO+IH26sNKrnDe7phTpgggdcZ5n2lA7191iDPj3iEmrhRTnT
 XZuYfFeTYdKjD5pn+EC/OpJpIJXnoJEh6vnxsjJ/X4mvG5S7bY1S4u16jxgyf5YY
 JJ11Z7Rs+xZCq4aACJXfTOpTGpX1pGj8GVCNKbv3NUNt+nw/dBbP58OIY5yYF3UQ
 BmokeqbsuzzwwsGAu7vbiGhQZUKcVKBdlPyXNzjFZ04tK1O0QhMH9O7RQhPmB2l4
 YLJPtAMVWHo9Zg==
X-ME-Sender: <xms:BMFzX8_2u2r4hmWy9cJo5qIra_xO84X_AH9ZZ5fajQHXQMm8o-SZFg>
 <xme:BMFzX0sskKKlXreYxDeo6vRu5iaWLTVR2yTaxLWxTHmsix66_N032iGkUNBw-bwbm
 OV5_W5274YG4GNaP4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfedtgddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepkeduheeftefhvddvgeeiffehkeeugeehhfdugffhhffhveejjeffueehudeguddu
 necuffhomhgrihhnpehuthhilhhiiigrthhiohhnrdhmrghpnecukfhppeektddrudeije
 drleekrdduledtnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhf
 rhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:BMFzXyCWspXlk6jMWHOeKkRRGJHilfkpRdYn4qZ7C2VThvMC90XsxA>
 <xmx:BMFzX8cXTpo5nmqLm7MyW6LOS3WtwoqJPujuD1y2_YTvKZmZYf0dOg>
 <xmx:BMFzXxOuVJZbUJLse2ZDz4FmNVBgiVByJjUNlmKA0RHpLxOPYOwlpQ>
 <xmx:BMFzX02uY7FTbBFoJJNYhtCpiOu1KoVWUUs_YhXjmJP9FITLUMN0X4Xi8Oc>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 274FA328005A;
 Tue, 29 Sep 2020 19:19:31 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/14] hw/block/nvme: add basic read/write for zoned
 namespaces
Date: Wed, 30 Sep 2020 01:19:12 +0200
Message-Id: <20200929231917.433586-10-its@irrelevant.dk>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929231917.433586-1-its@irrelevant.dk>
References: <20200929231917.433586-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.27; envelope-from=its@irrelevant.dk;
 helo=wnew2-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 17:46:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>
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

If the namespace has an associated 'pstate' blockdev it will be used to
store the zone states persistently. Only zone state changes are
persisted, that is, zone write pointer updates are only persistent if
the zone is explicitly closed. On boot up, any zones that were in an
Opened state will be transitioned to Full.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/specs/nvme.txt   |   7 ++
 hw/block/nvme-ns.h    | 116 +++++++++++++++++++-
 include/block/nvme.h  |  59 ++++++++++-
 hw/block/nvme-ns.c    | 184 +++++++++++++++++++++++++++++++-
 hw/block/nvme.c       | 239 +++++++++++++++++++++++++++++++++++++++++-
 hw/block/trace-events |   8 ++
 6 files changed, 604 insertions(+), 9 deletions(-)

diff --git a/docs/specs/nvme.txt b/docs/specs/nvme.txt
index a13c7a5dbe86..b23e59dd3075 100644
--- a/docs/specs/nvme.txt
+++ b/docs/specs/nvme.txt
@@ -34,6 +34,13 @@ nvme-ns Options
      values (such as lbads) differs from those specified for the nvme-ns
      device an error is produced.
 
+  `zns.zcap`; If `iocs` is 0x2, this specifies the zone capacity. It is
+     specified in units of logical blocks.
+
+  `zns.zsze`; If `iocs` is 0x2, this specifies the zone size. It is specified
+     in units of the logical blocks. If not specified, the value depends on
+     zns.zcap; if the zone capacity is a power of two, the zone size will be
+     set to that, otherwise it will default to the next power of two.
 
 Reference Specifications
 ------------------------
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index d39fa79fa682..e16f50dc4bb8 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -31,15 +31,34 @@ typedef struct NvmePstateHeader {
     uint8_t  lbads;
     uint8_t  iocs;
 
-    uint8_t  rsvd18[4078];
+    uint8_t  rsvd18[3054];
+
+    /* offset 0xc00 */
+    struct {
+        uint64_t zcap;
+        uint64_t zsze;
+    } QEMU_PACKED zns;
+
+    uint8_t  rsvd3088[1008];
 } QEMU_PACKED NvmePstateHeader;
 
 typedef struct NvmeNamespaceParams {
     uint32_t nsid;
     uint8_t  iocs;
     uint8_t  lbads;
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
@@ -55,6 +74,10 @@ typedef struct NvmeNamespace {
             unsigned long *map;
             int64_t       offset;
         } utilization;
+
+        struct {
+            int64_t offset;
+        } zns;
     } pstate;
 
     NvmeNamespaceParams params;
@@ -62,8 +85,20 @@ typedef struct NvmeNamespace {
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
@@ -78,17 +113,39 @@ static inline NvmeIdNsNvm *nvme_ns_id_nvm(NvmeNamespace *ns)
     return ns->id_ns[NVME_IOCS_NVM];
 }
 
+static inline NvmeIdNsZns *nvme_ns_id_zoned(NvmeNamespace *ns)
+{
+    return ns->id_ns[NVME_IOCS_ZONED];
+}
+
 static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
 {
     NvmeIdNsNvm *id_ns = nvme_ns_id_nvm(ns);
     return &id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
 }
 
+static inline NvmeLBAFE *nvme_ns_lbafe(NvmeNamespace *ns)
+{
+    NvmeIdNsNvm *id_ns = nvme_ns_id_nvm(ns);
+    NvmeIdNsZns *id_ns_zns = nvme_ns_id_zoned(ns);
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
+static inline uint64_t nvme_ns_zsze_bytes(NvmeNamespace *ns)
+{
+    return nvme_ns_zsze(ns) << nvme_ns_lbads(ns);
+}
+
 /* calculate the number of LBAs that the namespace can accomodate */
 static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
 {
@@ -101,12 +158,69 @@ static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
     return lba << nvme_ns_lbads(ns);
 }
 
+static inline int nvme_ns_zone_idx(NvmeNamespace *ns, uint64_t lba)
+{
+    return lba / nvme_ns_zsze(ns);
+}
+
+static inline NvmeZone *nvme_ns_get_zone(NvmeNamespace *ns, uint64_t lba)
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
+static inline bool nvme_ns_zone_wp_valid(NvmeZone *zone)
+{
+    switch (nvme_zs(zone)) {
+    case NVME_ZS_ZSF:
+    case NVME_ZS_ZSRO:
+    case NVME_ZS_ZSO:
+        return false;
+    default:
+        return false;
+    }
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
 
+void nvme_ns_zns_init_zone_state(NvmeNamespace *ns);
+
 static inline void _nvme_ns_check_size(void)
 {
     QEMU_BUILD_BUG_ON(sizeof(NvmePstateHeader) != 4096);
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 792fccf8c81f..2e523c9d97b4 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -390,8 +390,9 @@ enum NvmePmrmscMask {
     (pmrmsc |= (uint64_t)(val & PMRMSC_CBA_MASK) << PMRMSC_CBA_SHIFT)
 
 enum NvmeCommandSet {
-    NVME_IOCS_NVM = 0x0,
-    NVME_IOCS_MAX = 0x1,
+    NVME_IOCS_NVM   = 0x0,
+    NVME_IOCS_ZONED = 0x2,
+    NVME_IOCS_MAX   = 0x3,
 };
 
 enum NvmeSglDescriptorType {
@@ -703,6 +704,11 @@ enum NvmeStatusCodes {
     NVME_CONFLICTING_ATTRS      = 0x0180,
     NVME_INVALID_PROT_INFO      = 0x0181,
     NVME_WRITE_TO_RO            = 0x0182,
+    NVME_ZONE_BOUNDARY_ERROR    = 0x01b8,
+    NVME_ZONE_IS_FULL           = 0x01b9,
+    NVME_ZONE_IS_READ_ONLY      = 0x01ba,
+    NVME_ZONE_IS_OFFLINE        = 0x01bb,
+    NVME_ZONE_INVALID_WRITE     = 0x01bc,
     NVME_WRITE_FAULT            = 0x0280,
     NVME_UNRECOVERED_READ       = 0x0281,
     NVME_E2E_GUARD_ERROR        = 0x0282,
@@ -781,6 +787,31 @@ enum {
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
@@ -794,6 +825,7 @@ enum NvmeLogIdentifier {
     NVME_LOG_SMART_INFO     = 0x02,
     NVME_LOG_FW_SLOT_INFO   = 0x03,
     NVME_LOG_EFFECTS        = 0x05,
+    NVME_LOG_CHANGED_ZONE_LIST = 0xbf,
 };
 
 typedef struct QEMU_PACKED NvmePSD {
@@ -1099,9 +1131,27 @@ enum NvmeIdNsDps {
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
@@ -1118,8 +1168,11 @@ static inline void _nvme_check_size(void)
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
index 9eabab29f32c..ba32ea6d1326 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -30,6 +30,26 @@
 #include "nvme.h"
 #include "nvme-ns.h"
 
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
+    return NULL;
+}
+
 static int nvme_blk_truncate(BlockBackend *blk, size_t len, Error **errp)
 {
     int ret;
@@ -55,6 +75,47 @@ static int nvme_blk_truncate(BlockBackend *blk, size_t len, Error **errp)
     return 0;
 }
 
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
+    NvmeIdNsNvm *id_ns = nvme_ns_id_nvm(ns);
+    NvmeIdNsZns *id_ns_zns = nvme_ns_id_zoned(ns);
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
 static void nvme_ns_init(NvmeNamespace *ns)
 {
     NvmeIdNsNvm *id_ns;
@@ -72,6 +133,11 @@ static void nvme_ns_init(NvmeNamespace *ns)
 
     id_ns->nsze = cpu_to_le64(nvme_ns_nlbas(ns));
 
+    if (nvme_ns_zoned(ns)) {
+        ns->id_ns[NVME_IOCS_ZONED] = g_new0(NvmeIdNsZns, 1);
+        nvme_ns_init_zoned(ns);
+    }
+
     /* no thin provisioning */
     id_ns->ncap = id_ns->nsze;
     id_ns->nuse = id_ns->ncap;
@@ -82,7 +148,7 @@ static int nvme_ns_pstate_init(NvmeNamespace *ns, Error **errp)
     BlockBackend *blk = ns->pstate.blk;
     NvmePstateHeader header;
     uint64_t nlbas = nvme_ns_nlbas(ns);
-    size_t bitmap_len, pstate_len;
+    size_t bitmap_len, pstate_len, zd_len = 0;
     int ret;
 
     ret = nvme_blk_truncate(blk, sizeof(NvmePstateHeader), errp);
@@ -98,6 +164,14 @@ static int nvme_ns_pstate_init(NvmeNamespace *ns, Error **errp)
         .iocs    = ns->params.iocs,
     };
 
+    if (nvme_ns_zoned(ns)) {
+        /* zns specific; offset 0xc00 */
+        header.zns.zcap = cpu_to_le64(ns->params.zns.zcap);
+        header.zns.zsze = ns->params.zns.zsze ?
+            cpu_to_le64(ns->params.zns.zsze) :
+            cpu_to_le64(pow2ceil(ns->params.zns.zcap));
+    }
+
     ret = blk_pwrite(blk, 0, &header, sizeof(header), 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "could not write pstate header");
@@ -105,7 +179,10 @@ static int nvme_ns_pstate_init(NvmeNamespace *ns, Error **errp)
     }
 
     bitmap_len = DIV_ROUND_UP(nlbas, sizeof(unsigned long));
-    pstate_len = ROUND_UP(sizeof(NvmePstateHeader) + bitmap_len,
+    if (nvme_ns_zoned(ns)) {
+        zd_len = ns->zns.num_zones * sizeof(NvmeZoneDescriptor);
+    }
+    pstate_len = ROUND_UP(sizeof(NvmePstateHeader) + bitmap_len + zd_len,
                           BDRV_SECTOR_SIZE);
 
     ret = nvme_blk_truncate(blk, pstate_len, errp);
@@ -115,15 +192,58 @@ static int nvme_ns_pstate_init(NvmeNamespace *ns, Error **errp)
 
     ns->pstate.utilization.map = bitmap_new(nlbas);
 
+    if (zd_len) {
+        ns->pstate.zns.offset = ns->pstate.utilization.offset + bitmap_len,
+
+        nvme_ns_zns_init_zones(ns);
+
+        ret = blk_pwrite(blk, ns->pstate.zns.offset, ns->zns.zd, zd_len, 0);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret,
+                             "could not write zone descriptors to pstate");
+            return ret;
+        }
+    }
+
     return 0;
 }
 
+void nvme_ns_zns_init_zone_state(NvmeNamespace *ns)
+{
+    for (int i = 0; i < ns->zns.num_zones; i++) {
+        NvmeZone *zone = &ns->zns.zones[i];
+        zone->zd = &ns->zns.zd[i];
+
+        zone->wp_staging = nvme_wp(zone);
+
+        switch (nvme_zs(zone)) {
+        case NVME_ZS_ZSE:
+        case NVME_ZS_ZSF:
+        case NVME_ZS_ZSRO:
+        case NVME_ZS_ZSO:
+            continue;
+
+        case NVME_ZS_ZSC:
+            if (nvme_wp(zone) == nvme_zslba(zone)) {
+                nvme_zs_set(zone, NVME_ZS_ZSE);
+            }
+
+            continue;
+
+        case NVME_ZS_ZSIO:
+        case NVME_ZS_ZSEO:
+            zone->zd->wp = zone->zd->zslba;
+            nvme_zs_set(zone, NVME_ZS_ZSF);
+        }
+    }
+}
+
 static int nvme_ns_pstate_load(NvmeNamespace *ns, size_t len, Error **errp)
 {
     BlockBackend *blk = ns->pstate.blk;
     NvmePstateHeader header;
     uint64_t nlbas = nvme_ns_nlbas(ns);
-    size_t bitmap_len, pstate_len;
+    size_t bitmap_len, pstate_len, zd_len = 0;
     unsigned long *map;
     int ret;
 
@@ -160,8 +280,25 @@ static int nvme_ns_pstate_load(NvmeNamespace *ns, size_t len, Error **errp)
         return -1;
     }
 
+    if (header.zns.zcap != ns->params.zns.zcap) {
+        error_setg(errp, "zns.zcap parameter inconsistent with pstate "
+                   "(pstate %"PRIu64"; parameter %"PRIu64")",
+                   header.zns.zcap, ns->params.zns.zcap);
+        return -1;
+    }
+
+    if (ns->params.zns.zsze && header.zns.zsze != ns->params.zns.zsze) {
+        error_setg(errp, "zns.zsze parameter inconsistent with pstate "
+                   "(pstate %"PRIu64"; parameter %"PRIu64")",
+                   header.zns.zsze, ns->params.zns.zsze);
+        return -1;
+    }
+
     bitmap_len = DIV_ROUND_UP(nlbas, sizeof(unsigned long));
-    pstate_len = ROUND_UP(sizeof(NvmePstateHeader) + bitmap_len,
+    if (nvme_ns_zoned(ns)) {
+        zd_len = ns->zns.num_zones * sizeof(NvmeZoneDescriptor);
+    }
+    pstate_len = ROUND_UP(sizeof(NvmePstateHeader) + bitmap_len + zd_len,
                           BDRV_SECTOR_SIZE);
 
     if (len != pstate_len) {
@@ -188,6 +325,27 @@ static int nvme_ns_pstate_load(NvmeNamespace *ns, size_t len, Error **errp)
     ns->pstate.utilization.map = map;
 #endif
 
+    if (zd_len) {
+        ns->pstate.zns.offset = ns->pstate.utilization.offset + bitmap_len,
+
+        ret = blk_pread(blk, ns->pstate.zns.offset, ns->zns.zd, zd_len);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret,
+                             "could not read zone descriptors from pstate");
+            return ret;
+        }
+
+        nvme_ns_zns_init_zone_state(ns);
+
+        ret = blk_pwrite(blk, ns->pstate.utilization.offset + bitmap_len,
+                         ns->zns.zd, zd_len, 0);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret,
+                             "could not write zone descriptors to pstate");
+            return ret;
+        }
+    }
+
     return 0;
 
 }
@@ -262,6 +420,20 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
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
@@ -293,6 +465,8 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
          */
         NvmeIdNsNvm *id_ns = nvme_ns_id_nvm(ns);
         id_ns->nsfeat |= 0x4;
+    } else if (nvme_ns_zoned(ns)) {
+        nvme_ns_zns_init_zones(ns);
     }
 
     if (nvme_register_namespace(n, ns, errp)) {
@@ -340,6 +514,8 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_UINT8("lbads", NvmeNamespace, params.lbads, BDRV_SECTOR_BITS),
     DEFINE_PROP_DRIVE("pstate", NvmeNamespace, pstate.blk),
     DEFINE_PROP_UINT8("iocs", NvmeNamespace, params.iocs, NVME_IOCS_NVM),
+    DEFINE_PROP_UINT64("zns.zcap", NvmeNamespace, params.zns.zcap, 0),
+    DEFINE_PROP_UINT64("zns.zsze", NvmeNamespace, params.zns.zsze, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 53cb8c2ed4a7..0c7d269c1b5a 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -155,6 +155,16 @@ static const NvmeEffectsLog nvme_effects[NVME_IOCS_MAX] = {
             NVME_EFFECTS_NVM_INITIALIZER,
         },
     },
+
+    [NVME_IOCS_ZONED] = {
+        .acs = {
+            NVME_EFFECTS_ADMIN_INITIALIZER,
+        },
+
+        .iocs = {
+            NVME_EFFECTS_NVM_INITIALIZER,
+        },
+    },
 };
 
 static void nvme_process_sq(void *opaque);
@@ -911,6 +921,112 @@ static void nvme_clear_events(NvmeCtrl *n, uint8_t event_type)
     }
 }
 
+static uint16_t nvme_check_zone_readable(NvmeCtrl *n, NvmeRequest *req,
+                                         NvmeZone *zone)
+{
+    NvmeZoneState zs = nvme_zs(zone);
+    uint64_t zslba = nvme_zslba(zone);
+
+    if (zs == NVME_ZS_ZSO) {
+        trace_pci_nvme_err_invalid_zone_condition(nvme_cid(req), zslba,
+                                                  NVME_ZS_ZSO);
+        return NVME_ZONE_IS_OFFLINE | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
+static uint16_t nvme_check_zone_read(NvmeCtrl *n, uint64_t slba, uint32_t nlb,
+                                     NvmeRequest *req, NvmeZone *zone)
+{
+    NvmeNamespace *ns = req->ns;
+    uint64_t zslba = nvme_zslba(zone);
+    uint64_t zsze = nvme_ns_zsze(ns);
+    uint16_t status;
+
+    status = nvme_check_zone_readable(n, req, zone);
+    if (status) {
+        return status;
+    }
+
+    if ((slba + nlb) > (zslba + zsze)) {
+        trace_pci_nvme_err_zone_boundary(nvme_cid(req), slba, nlb, zsze);
+        return NVME_ZONE_BOUNDARY_ERROR | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
+static uint16_t nvme_check_zone_writeable(NvmeCtrl *n, NvmeRequest *req,
+                                          NvmeZone *zone)
+{
+    NvmeZoneState zs = nvme_zs(zone);
+    uint64_t zslba = nvme_zslba(zone);
+
+    if (zs == NVME_ZS_ZSO) {
+        trace_pci_nvme_err_invalid_zone_condition(nvme_cid(req), zslba,
+                                                  NVME_ZS_ZSO);
+        return NVME_ZONE_IS_OFFLINE | NVME_DNR;
+    }
+
+    switch (zs) {
+    case NVME_ZS_ZSE:
+    case NVME_ZS_ZSC:
+    case NVME_ZS_ZSIO:
+    case NVME_ZS_ZSEO:
+        return NVME_SUCCESS;
+    case NVME_ZS_ZSF:
+        trace_pci_nvme_err_zone_is_full(nvme_cid(req), zslba);
+        return NVME_ZONE_IS_FULL | NVME_DNR;
+    case NVME_ZS_ZSRO:
+        trace_pci_nvme_err_zone_is_read_only(nvme_cid(req), zslba);
+        return NVME_ZONE_IS_READ_ONLY | NVME_DNR;
+    default:
+        break;
+    }
+
+    trace_pci_nvme_err_invalid_zone_condition(nvme_cid(req), zslba, zs);
+    return NVME_INTERNAL_DEV_ERROR | NVME_DNR;
+}
+
+static uint16_t nvme_check_zone_write(NvmeCtrl *n, uint64_t slba, uint32_t nlb,
+                                      NvmeRequest *req, NvmeZone *zone)
+{
+    uint64_t zslba, wp, zcap;
+    uint16_t status;
+
+    zslba = nvme_zslba(zone);
+    wp = zone->wp_staging;
+    zcap = nvme_zcap(zone);
+
+    status = nvme_check_zone_writeable(n, req, zone);
+    if (status) {
+        return status;
+    }
+
+    if ((wp - zslba) + nlb > zcap) {
+        trace_pci_nvme_err_zone_boundary(nvme_cid(req), slba, nlb, zcap);
+        return NVME_ZONE_BOUNDARY_ERROR | NVME_DNR;
+    }
+
+    if (slba != wp) {
+        trace_pci_nvme_err_zone_invalid_write(nvme_cid(req), slba, wp);
+        return NVME_ZONE_INVALID_WRITE | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
+static inline uint16_t nvme_check_zone(NvmeCtrl *n, uint64_t slba,
+                                       uint32_t nlb, NvmeRequest *req,
+                                       NvmeZone *zone) {
+    if (nvme_req_is_write(req)) {
+        return nvme_check_zone_write(n, slba, nlb, req, zone);
+    }
+
+    return nvme_check_zone_read(n, slba, nlb, req, zone);
+}
+
 static inline uint16_t nvme_check_mdts(NvmeCtrl *n, size_t len)
 {
     uint8_t mdts = n->params.mdts;
@@ -1006,6 +1122,42 @@ static int nvme_allocate(NvmeNamespace *ns, uint64_t slba, uint32_t nlb)
     return ret;
 }
 
+static int nvme_zns_commit_zone(NvmeNamespace *ns, NvmeZone *zone)
+{
+    uint64_t zslba;
+    int64_t offset;
+
+    if (!ns->pstate.blk) {
+        return 0;
+    }
+
+    trace_pci_nvme_zns_commit_zone(nvme_nsid(ns), nvme_zslba(zone));
+
+    zslba = nvme_zslba(zone);
+    offset = ns->pstate.zns.offset +
+        nvme_ns_zone_idx(ns, zslba) * sizeof(NvmeZoneDescriptor);
+
+    return blk_pwrite(ns->pstate.blk, offset, zone->zd,
+                      sizeof(NvmeZoneDescriptor), 0);
+}
+
+static void nvme_zns_advance_wp(NvmeRequest *req)
+{
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint64_t slba = le64_to_cpu(rw->slba);
+    uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
+    NvmeZone *zone = nvme_ns_get_zone(req->ns, slba);
+    uint64_t wp = nvme_wp(zone);
+
+    wp += nlb;
+    zone->zd->wp = cpu_to_le64(wp);
+    if (wp == nvme_zslba(zone) + nvme_zcap(zone)) {
+        nvme_zs_set(zone, NVME_ZS_ZSF);
+        if (nvme_zns_commit_zone(req->ns, zone) < 0) {
+            req->status = NVME_INTERNAL_DEV_ERROR;
+        }
+    }
+}
 
 static void nvme_rw_cb(void *opaque, int ret)
 {
@@ -1022,6 +1174,10 @@ static void nvme_rw_cb(void *opaque, int ret)
 
     if (!ret) {
         block_acct_done(stats, acct);
+
+        if (nvme_ns_zoned(ns) && nvme_req_is_write(req)) {
+            nvme_zns_advance_wp(req);
+        }
     } else {
         uint16_t status;
 
@@ -1047,6 +1203,26 @@ static void nvme_rw_cb(void *opaque, int ret)
         error_report_err(local_err);
 
         req->status = status;
+
+        if (nvme_ns_zoned(ns)) {
+            NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+            uint64_t slba = le64_to_cpu(rw->slba);
+
+            NvmeZone *zone = nvme_ns_get_zone(ns, slba);
+
+            /*
+             * Transition the zone to read-only on write fault and offline
+             * on unrecovered read.
+             */
+            NvmeZoneState zs = status == NVME_WRITE_FAULT ?
+                NVME_ZS_ZSRO : NVME_ZS_ZSO;
+
+            nvme_zs_set(zone, zs);
+
+            if (nvme_zns_commit_zone(ns, zone) < 0) {
+                req->status = NVME_INTERNAL_DEV_ERROR;
+            }
+        }
     }
 
     nvme_enqueue_req_completion(nvme_cq(req), req);
@@ -1120,6 +1296,7 @@ static uint16_t nvme_rwz(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
+    NvmeZone *zone = NULL;
 
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
@@ -1138,6 +1315,20 @@ static uint16_t nvme_rwz(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
+    if (nvme_ns_zoned(ns)) {
+        zone = nvme_ns_get_zone(ns, slba);
+        if (!zone) {
+            trace_pci_nvme_err_invalid_zone(nvme_cid(req), slba);
+            status = NVME_INVALID_FIELD | NVME_DNR;
+            goto invalid;
+        }
+
+        status = nvme_check_zone(n, slba, nlb, req, zone);
+        if (status) {
+            goto invalid;
+        }
+    }
+
     if (!is_write) {
         if (NVME_ERR_REC_DULBE(ns->features.err_rec)) {
             status = nvme_check_dulbe(ns, slba, nlb);
@@ -1162,6 +1353,31 @@ static uint16_t nvme_rwz(NvmeCtrl *n, NvmeRequest *req)
     }
 
     if (is_write) {
+        if (zone) {
+            if (zone->wp_staging != nvme_wp(zone)) {
+                trace_pci_nvme_err_zone_pending_writes(nvme_cid(req),
+                                                       nvme_zslba(zone),
+                                                       nvme_wp(zone),
+                                                       zone->wp_staging);
+            }
+
+            switch (nvme_zs(zone)) {
+            case NVME_ZS_ZSE:
+            case NVME_ZS_ZSC:
+                nvme_zs_set(zone, NVME_ZS_ZSIO);
+
+                if (nvme_zns_commit_zone(req->ns, zone) < 0) {
+                    status = NVME_INTERNAL_DEV_ERROR;
+                    goto invalid;
+                }
+
+            default:
+                break;
+            }
+
+            zone->wp_staging += nlb;
+        }
+
         if (nvme_allocate(ns, slba, nlb) < 0) {
             status = NVME_INTERNAL_DEV_ERROR;
             goto invalid;
@@ -2365,6 +2581,24 @@ static void nvme_clear_ctrl(NvmeCtrl *n)
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
+                    nvme_zs_set(zone, NVME_ZS_ZSC);
+                    nvme_zns_commit_zone(ns, zone);
+                    break;
+                default:
+                    continue;
+                }
+            }
+
+            nvme_ns_zns_init_zone_state(ns);
+        }
     }
 
     n->bar.cc = 0;
@@ -2898,7 +3132,7 @@ static void nvme_init_state(NvmeCtrl *n)
     n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
-    n->iocscs[0] = 1 << NVME_IOCS_NVM;
+    n->iocscs[0] = (1 << NVME_IOCS_NVM) | (1 << NVME_IOCS_ZONED);
     n->features.iocsci = 0;
 }
 
@@ -3049,6 +3283,9 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     uint8_t *pci_conf = pci_dev->config;
     char *subnqn;
 
+    n->id_ctrl_iocss[NVME_IOCS_NVM] = g_new0(NvmeIdCtrl, 1);
+    n->id_ctrl_iocss[NVME_IOCS_ZONED] = g_new0(NvmeIdCtrl, 1);
+
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
     strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
diff --git a/hw/block/trace-events b/hw/block/trace-events
index b002eb7c8a5c..d46a7a4942bb 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -72,6 +72,7 @@ pci_nvme_enqueue_event_noqueue(int queued) "queued %d"
 pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
 pci_nvme_no_outstanding_aers(void) "ignoring event; no outstanding AERs"
 pci_nvme_enqueue_req_completion(uint16_t cid, uint16_t cqid, uint16_t status) "cid %"PRIu16" cqid %"PRIu16" status 0x%"PRIx16""
+pci_nvme_zns_commit_zone(uint32_t nsid, uint64_t zslba) "nsid 0x%"PRIx32" zslba 0x%"PRIx64""
 pci_nvme_mmio_read(uint64_t addr) "addr 0x%"PRIx64""
 pci_nvme_mmio_write(uint64_t addr, uint64_t data) "addr 0x%"PRIx64" data 0x%"PRIx64""
 pci_nvme_mmio_doorbell_cq(uint16_t cqid, uint16_t new_head) "cqid %"PRIu16" new_head %"PRIu16""
@@ -97,6 +98,11 @@ pci_nvme_err_addr_read(uint64_t addr) "addr 0x%"PRIx64""
 pci_nvme_err_addr_write(uint64_t addr) "addr 0x%"PRIx64""
 pci_nvme_err_cfs(void) "controller fatal status"
 pci_nvme_err_aio(uint16_t cid, const char *errname, uint16_t status) "cid %"PRIu16" err '%s' status 0x%"PRIx16""
+pci_nvme_err_zone_is_full(uint16_t cid, uint64_t slba) "cid %"PRIu16" lba 0x%"PRIx64""
+pci_nvme_err_zone_is_read_only(uint16_t cid, uint64_t slba) "cid %"PRIu16" lba 0x%"PRIx64""
+pci_nvme_err_zone_invalid_write(uint16_t cid, uint64_t slba, uint64_t wp) "cid %"PRIu16" lba 0x%"PRIx64" wp 0x%"PRIx64""
+pci_nvme_err_zone_boundary(uint16_t cid, uint64_t slba, uint32_t nlb, uint64_t zcap) "cid %"PRIu16" lba 0x%"PRIx64" nlb %"PRIu32" zcap 0x%"PRIx64""
+pci_nvme_err_zone_pending_writes(uint16_t cid, uint64_t zslba, uint64_t wp, uint64_t wp_staging) "cid %"PRIu16" zslba 0x%"PRIx64" wp 0x%"PRIx64" wp_staging 0x%"PRIx64""
 pci_nvme_err_invalid_sgld(uint16_t cid, uint8_t typ) "cid %"PRIu16" type 0x%"PRIx8""
 pci_nvme_err_invalid_num_sgld(uint16_t cid, uint8_t typ) "cid %"PRIu16" type 0x%"PRIx8""
 pci_nvme_err_invalid_sgl_excess_length(uint16_t cid) "cid %"PRIu16""
@@ -125,6 +131,8 @@ pci_nvme_err_invalid_identify_cns(uint16_t cns) "identify, invalid cns=0x%"PRIx1
 pci_nvme_err_invalid_getfeat(int dw10) "invalid get features, dw10=0x%"PRIx32""
 pci_nvme_err_invalid_setfeat(uint32_t dw10) "invalid set features, dw10=0x%"PRIx32""
 pci_nvme_err_invalid_log_page(uint16_t cid, uint16_t lid) "cid %"PRIu16" lid 0x%"PRIx16""
+pci_nvme_err_invalid_zone(uint16_t cid, uint64_t lba) "cid %"PRIu16" lba 0x%"PRIx64""
+pci_nvme_err_invalid_zone_condition(uint16_t cid, uint64_t zslba, uint8_t condition) "cid %"PRIu16" zslba 0x%"PRIx64" condition 0x%"PRIx8""
 pci_nvme_err_startfail_cq(void) "nvme_start_ctrl failed because there are non-admin completion queues"
 pci_nvme_err_startfail_sq(void) "nvme_start_ctrl failed because there are non-admin submission queues"
 pci_nvme_err_startfail_nbarasq(void) "nvme_start_ctrl failed because the admin submission queue address is null"
-- 
2.28.0


