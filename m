Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5152C5E5D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 00:56:34 +0100 (CET)
Received: from localhost ([::1]:59580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiR7p-0005eb-0h
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 18:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQy2-0007XO-Q4; Thu, 26 Nov 2020 18:46:26 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:45893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxz-0003x4-2v; Thu, 26 Nov 2020 18:46:26 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A61A5C01FE;
 Thu, 26 Nov 2020 18:46:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Nov 2020 18:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=T1xCuj03YegiT
 nv6u+2mv2W49KKWdZNfqOgXE+BHTY4=; b=Gr4M7oj+PaFJqEMIjl/UZTiCxjr56
 a9GIIRzYci8v7dfWqrJOo+mQjePJIMh76qOFcV61fsaf+r61AEfftHLYX7tpqSxU
 om6XFztNH2UORCSNMI3SMr/8WacFsJWD5FE2swZlXWOl2eGiQftRy7VqsAqlIGc9
 lmYHMtgeLMeeP0gakkV1a1NImCGeYvXF3CMUsaY3hCEzCkei3XfWf3+1S+uhN8HJ
 duZixj6NFT595q6DJLNSE5K9MiN63auyfqt/QaJ5/Fu+burr6jpdos8OGeRuyE+i
 fGuQImGjrWWdUUkoG6t3rMnwrSHIQ1vMwD4KhuJfqAxqNNouJXM1+SXcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=T1xCuj03YegiTnv6u+2mv2W49KKWdZNfqOgXE+BHTY4=; b=X4e5MhsF
 xlua6SdTIb4Z0GlsGsgiDZ5xsHD6+SHTBZkt5ETtqzNIBkExRn+CLOMMFSDKOusE
 dTI61mmJ+TKK1fxqpkX2gfES/y5F352GfEhZ2YU1MzhXHG1EJf93wxDRbFSKmhUt
 v+oYRR1SxTxUwgsAaBzB65KmaVg6zKNbzW7/Ed1SVl3WqO4WYmrS16YzO9pYAPmg
 W2jrazLO0kGUEl3mZiiQjBEsfhY5oz8ywhqKoOxUUNdYCNiK3plPEEtdhWlcdKV5
 P7i4uT5MMkkxtYzhWLJmO5hxcPsMn3zapgC8MjX0nvnQ4aBJudj3+IuK2Fp5VmLC
 /+Cdfr+XQfatVQ==
X-ME-Sender: <xms:Tj7AXyMvseg2b2OlmKbKbyRBWvRh4NnRZzvt8KeC7XPSYGNiy2Uymw>
 <xme:Tj7AXw-gBFoSOaOx2ugw--hjA8u5msDCbx1yBn6AhF4M36FxTQqV5skcaxXnDXELD
 Ptx0_MNDGJ3Hzj9vkE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehfedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeefgefhledtfeekvedthfeuveeghfefledukedugfeiudfgveeiieelhfeufedt
 ieenucffohhmrghinheprhgvshhouhhrtggvshdrrggtthhivhgvnecukfhppeektddrud
 eijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Tj7AX5T4-QIG7tWVxRVoNt_DqW5SIpzXTAYevzInKr_xrXrAYJ9_Eg>
 <xmx:Tj7AXys7F59eYYqLS_EgDCqf_H-Gn_vAJ8DdS4gIRQyT_N9yh4izkw>
 <xmx:Tj7AX6eX9K0BS_yjIAC0xIMYU5dF2SfUc9733F_m7pma8yQgiq2xEw>
 <xmx:Tj7AXySjpJ6IvvkXX2DGlw2uz9rFnksFfLst1GzcKi0hmo6yAcJIBQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E26BB3064AAF;
 Thu, 26 Nov 2020 18:46:20 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v5 12/12] hw/block/nvme: add persistence for zone info
Date: Fri, 27 Nov 2020 00:46:01 +0100
Message-Id: <20201126234601.689714-13-its@irrelevant.dk>
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

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/specs/nvme.txt   |  15 +++
 hw/block/nvme-ns.h    |  16 ++++
 hw/block/nvme-ns.c    | 212 +++++++++++++++++++++++++++++++++++++++++-
 hw/block/nvme.c       |  87 +++++++++++++++++
 hw/block/trace-events |   2 +
 5 files changed, 331 insertions(+), 1 deletion(-)

diff --git a/docs/specs/nvme.txt b/docs/specs/nvme.txt
index 03bb4d9516b4..05d81c88ad4e 100644
--- a/docs/specs/nvme.txt
+++ b/docs/specs/nvme.txt
@@ -20,6 +20,21 @@ The nvme device (-device nvme) emulates an NVM Express Controller.
   `zns.mor`; Specifies the number of open resources available. This is a 0s
      based value.
 
+  `zns.pstate`; This parameter specifies another blockdev to be used for
+     storing zone state persistently.
+
+       -drive id=zns-pstate,file=zns-pstate.img,format=raw
+       -device nvme-ns,zns.pstate=zns-pstate,...
+
+     To reset (or initialize) state, the blockdev image should be of zero size:
+
+       qemu-img create -f raw zns-pstate.img 0
+
+     The image will be intialized with a file format header and truncated to
+     the required size. If the pstate given is of non-zero size, it will be
+     assumed to already contain zone state information and the header will be
+     checked.
+
 
 Reference Specifications
 ------------------------
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 05a79a214605..5cb4c1da59ce 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -19,6 +19,15 @@
 #define NVME_NS(obj) \
     OBJECT_CHECK(NvmeNamespace, (obj), TYPE_NVME_NS)
 
+#define NVME_ZONE_PSTATE_MAGIC ((0x00 << 24) | ('S' << 16) | ('N' << 8) | 'Z')
+#define NVME_ZONE_PSTATE_V1 1
+
+typedef struct NvmeZonePStateHeader {
+    uint32_t magic;
+    uint32_t version;
+    uint8_t  rsvd8[4088];
+} QEMU_PACKED NvmeZonePStateHeader;
+
 typedef struct NvmeNamespaceParams {
     uint32_t nsid;
     uint8_t  iocs;
@@ -74,6 +83,8 @@ typedef struct NvmeNamespace {
             QTAILQ_HEAD(, NvmeZone) lru_open;
             QTAILQ_HEAD(, NvmeZone) lru_active;
         } resources;
+
+        BlockBackend *pstate;
     } zns;
 } NvmeNamespace;
 
@@ -186,4 +197,9 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_flush(NvmeNamespace *ns);
 
+static inline void _nvme_ns_check_size(void)
+{
+    QEMU_BUILD_BUG_ON(sizeof(NvmeZonePStateHeader) != 4096);
+}
+
 #endif /* NVME_NS_H */
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index cd0f075dd281..4f311dd704c0 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -50,6 +50,31 @@ const char *nvme_zs_to_str(NvmeZoneState zs)
     return "UNKNOWN";
 }
 
+static int nvme_blk_truncate(BlockBackend *blk, size_t len, Error **errp)
+{
+    int ret;
+    uint64_t perm, shared_perm;
+
+    blk_get_perm(blk, &perm, &shared_perm);
+
+    ret = blk_set_perm(blk, perm | BLK_PERM_RESIZE, shared_perm, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    ret = blk_truncate(blk, len, false, PREALLOC_MODE_OFF, 0, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    ret = blk_set_perm(blk, perm, shared_perm, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    return 0;
+}
+
 static void nvme_ns_zns_init_zones(NvmeNamespace *ns)
 {
     NvmeZone *zone;
@@ -153,6 +178,176 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     return 0;
 }
 
+static int nvme_ns_zns_restore_zone_state(NvmeNamespace *ns, Error **errp)
+{
+    for (int i = 0; i < ns->zns.num_zones; i++) {
+        NvmeZone *zone = &ns->zns.zones[i];
+        zone->zd = &ns->zns.zd[i];
+        if (ns->params.zns.zdes) {
+            zone->zde = &ns->zns.zde[i];
+        }
+
+        switch (nvme_zs(zone)) {
+        case NVME_ZS_ZSE:
+        case NVME_ZS_ZSF:
+        case NVME_ZS_ZSRO:
+        case NVME_ZS_ZSO:
+            break;
+
+        case NVME_ZS_ZSC:
+            if (nvme_wp(zone) == nvme_zslba(zone) &&
+                !(zone->zd->za & NVME_ZA_ZDEV)) {
+                nvme_zs_set(zone, NVME_ZS_ZSE);
+                break;
+            }
+
+            if (ns->zns.resources.active) {
+                ns->zns.resources.active--;
+                QTAILQ_INSERT_TAIL(&ns->zns.resources.lru_active, zone,
+                                   lru_entry);
+                break;
+            }
+
+            /* fallthrough */
+
+        case NVME_ZS_ZSIO:
+        case NVME_ZS_ZSEO:
+            zone->zd->wp = zone->zd->zslba;
+            nvme_zs_set(zone, NVME_ZS_ZSF);
+            break;
+
+        default:
+            error_setg(errp, "invalid zone state");
+            return -1;
+        }
+
+        zone->wp_staging = nvme_wp(zone);
+    }
+
+    return 0;
+}
+
+static int nvme_ns_zns_init_pstate(NvmeNamespace *ns, Error **errp)
+{
+    BlockBackend *blk = ns->zns.pstate;
+    NvmeZonePStateHeader header;
+    size_t zd_len, zde_len;
+    int ret;
+
+    zd_len = ns->zns.num_zones * sizeof(NvmeZoneDescriptor);
+    zde_len = ns->zns.num_zones * nvme_ns_zdes_bytes(ns);
+
+    ret = nvme_blk_truncate(blk, zd_len + zde_len + sizeof(header), errp);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "could not truncate zone pstate");
+        return ret;
+    }
+
+    nvme_ns_zns_init_zones(ns);
+
+    ret = blk_pwrite(blk, 0, ns->zns.zd, zd_len, 0);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "could not write zone descriptors to "
+                         "zone pstate");
+        return ret;
+    }
+
+    header = (NvmeZonePStateHeader) {
+        .magic = cpu_to_le32(NVME_ZONE_PSTATE_MAGIC),
+        .version = cpu_to_le32(NVME_ZONE_PSTATE_V1),
+    };
+
+    ret = blk_pwrite(blk, zd_len + zde_len, &header, sizeof(header), 0);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "could not write zone pstate header");
+        return ret;
+    }
+
+    return 0;
+}
+
+static int nvme_ns_zns_load_pstate(NvmeNamespace *ns, size_t len, Error **errp)
+{
+    BlockBackend *blk = ns->zns.pstate;
+    NvmeZonePStateHeader header;
+    size_t zd_len, zde_len;
+    int ret;
+
+    ret = blk_pread(blk, len - sizeof(header), &header, sizeof(header));
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "could not read zone pstate header");
+        return ret;
+    }
+
+    if (le32_to_cpu(header.magic) != NVME_ZONE_PSTATE_MAGIC) {
+        error_setg(errp, "invalid zone pstate header");
+        return -1;
+    } else if (le32_to_cpu(header.version) > NVME_ZONE_PSTATE_V1) {
+        error_setg(errp, "unsupported zone pstate version");
+        return -1;
+    }
+
+    zd_len = ns->zns.num_zones * sizeof(NvmeZoneDescriptor);
+    zde_len = ns->zns.num_zones * nvme_ns_zdes_bytes(ns);
+
+    ret = blk_pread(blk, 0, ns->zns.zd, zd_len);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "could not read zone descriptors from "
+                         "zone pstate");
+        return ret;
+    }
+
+    if (zde_len) {
+        ret = blk_pread(blk, zd_len, ns->zns.zde, zde_len);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "could not read zone descriptor "
+                             "extensions from zone pstate");
+            return ret;
+        }
+    }
+
+    if (nvme_ns_zns_restore_zone_state(ns, errp)) {
+        return -1;
+    }
+
+    ret = blk_pwrite(blk, 0, ns->zns.zd, zd_len, 0);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "could not write zone descriptors to "
+                         "zone pstate");
+        return ret;
+    }
+
+    return 0;
+}
+
+static int nvme_ns_zns_setup_pstate(NvmeNamespace *ns, Error **errp)
+{
+    BlockBackend *blk = ns->zns.pstate;
+    uint64_t perm, shared_perm;
+    ssize_t len;
+    int ret;
+
+    perm = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
+    shared_perm = BLK_PERM_ALL;
+
+    ret = blk_set_perm(blk, perm, shared_perm, errp);
+    if (ret) {
+        return ret;
+    }
+
+    len = blk_getlength(blk);
+    if (len < 0) {
+        error_setg_errno(errp, -len, "could not determine zone pstate size");
+        return len;
+    }
+
+    if (!len) {
+        return nvme_ns_zns_init_pstate(ns, errp);
+    }
+
+    return nvme_ns_zns_load_pstate(ns, len, errp);
+}
+
 static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 {
     if (!blkconf_blocksizes(&ns->blkconf, errp)) {
@@ -236,7 +431,13 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
     }
 
     if (nvme_ns_zoned(ns)) {
-        nvme_ns_zns_init_zones(ns);
+        if (ns->zns.pstate) {
+            if (nvme_ns_zns_setup_pstate(ns, errp)) {
+                return -1;
+            }
+        } else {
+            nvme_ns_zns_init_zones(ns);
+        }
     }
 
     if (nvme_register_namespace(n, ns, errp)) {
@@ -249,11 +450,19 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 void nvme_ns_drain(NvmeNamespace *ns)
 {
     blk_drain(ns->blkconf.blk);
+
+    if (ns->zns.pstate) {
+        blk_drain(ns->zns.pstate);
+    }
 }
 
 void nvme_ns_flush(NvmeNamespace *ns)
 {
     blk_flush(ns->blkconf.blk);
+
+    if (ns->zns.pstate) {
+        blk_flush(ns->zns.pstate);
+    }
 }
 
 static void nvme_ns_realize(DeviceState *dev, Error **errp)
@@ -283,6 +492,7 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_UINT8("zns.zdes", NvmeNamespace, params.zns.zdes, 0),
     DEFINE_PROP_UINT32("zns.mar", NvmeNamespace, params.zns.mar, 0xffffffff),
     DEFINE_PROP_UINT32("zns.mor", NvmeNamespace, params.zns.mor, 0xffffffff),
+    DEFINE_PROP_DRIVE("zns.pstate", NvmeNamespace, zns.pstate),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index e62efd7cf0c4..04ad9f20223d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1023,6 +1023,46 @@ static uint16_t nvme_check_dulbe(NvmeNamespace *ns, uint64_t slba,
     return NVME_SUCCESS;
 }
 
+static int nvme_zns_commit_zone(NvmeNamespace *ns, NvmeZone *zone)
+{
+    uint64_t zslba;
+    int64_t offset;
+
+    if (!ns->zns.pstate) {
+        return 0;
+    }
+
+    trace_pci_nvme_zns_commit_zone(nvme_nsid(ns), nvme_zslba(zone));
+
+    zslba = nvme_zslba(zone);
+    offset = nvme_ns_zone_idx(ns, zslba) * sizeof(NvmeZoneDescriptor);
+
+    return blk_pwrite(ns->zns.pstate, offset, zone->zd,
+                      sizeof(NvmeZoneDescriptor), 0);
+}
+
+static int nvme_zns_commit_zde(NvmeNamespace *ns, NvmeZone *zone)
+{
+    uint64_t zslba;
+    int zidx;
+    size_t zd_len, zdes_bytes;
+    int64_t offset;
+
+    if (!ns->zns.pstate) {
+        return 0;
+    }
+
+    trace_pci_nvme_zns_commit_zde(nvme_nsid(ns), nvme_zslba(zone));
+
+    zd_len = ns->zns.num_zones * sizeof(NvmeZoneDescriptor);
+    zslba = nvme_zslba(zone);
+    zidx = nvme_ns_zone_idx(ns, zslba);
+    zdes_bytes = nvme_ns_zdes_bytes(ns);
+    offset = zd_len + zidx * zdes_bytes;
+
+    return blk_pwrite(ns->zns.pstate, offset, zone->zde, zdes_bytes, 0);
+}
+
 static inline void nvme_zone_reset_wp(NvmeZone *zone)
 {
     zone->zd->wp = zone->zd->zslba;
@@ -1058,6 +1098,10 @@ static uint16_t nvme_zrm_release_open(NvmeNamespace *ns)
             return status;
         }
 
+        if (nvme_zns_commit_zone(ns, candidate) < 0) {
+            return NVME_INTERNAL_DEV_ERROR;
+        }
+
         return NVME_SUCCESS;
     }
 
@@ -1252,6 +1296,10 @@ static uint16_t __nvme_zns_advance_wp(NvmeNamespace *ns, NvmeZone *zone,
         if (status) {
             return status;
         }
+
+        if (nvme_zns_commit_zone(ns, zone) < 0) {
+            return NVME_INTERNAL_DEV_ERROR;
+        }
     }
 
     return NVME_SUCCESS;
@@ -1307,6 +1355,10 @@ static void nvme_aio_err(NvmeRequest *req, int ret, NvmeZone *zone)
             NVME_ZS_ZSRO : NVME_ZS_ZSO;
 
         nvme_zrm_transition(ns, zone, zs);
+
+        if (nvme_zns_commit_zone(req->ns, zone) < 0) {
+            req->status = NVME_INTERNAL_DEV_ERROR;
+        }
     }
 
     /*
@@ -1618,6 +1670,10 @@ static void nvme_aio_zone_reset_cb(void *opaque, int ret)
         nvme_aio_err(req, ret, zone);
     }
 
+    if (nvme_zns_commit_zone(req->ns, zone) < 0) {
+        req->status = NVME_INTERNAL_DEV_ERROR;
+    }
+
     (*resets)--;
 
     if (*resets) {
@@ -1657,6 +1713,10 @@ static uint16_t nvme_zone_mgmt_send_close(NvmeCtrl *n, NvmeRequest *req,
         return status;
     }
 
+    if (nvme_zns_commit_zone(ns, zone) < 0) {
+        return NVME_INTERNAL_DEV_ERROR;
+    }
+
     return NVME_SUCCESS;
 }
 
@@ -1678,6 +1738,10 @@ static uint16_t nvme_zone_mgmt_send_finish(NvmeCtrl *n, NvmeRequest *req,
         return status;
     }
 
+    if (nvme_zns_commit_zone(ns, zone) < 0) {
+        return NVME_INTERNAL_DEV_ERROR;
+    }
+
     return NVME_SUCCESS;
 }
 
@@ -1699,6 +1763,10 @@ static uint16_t nvme_zone_mgmt_send_open(NvmeCtrl *n, NvmeRequest *req,
         return status;
     }
 
+    if (nvme_zns_commit_zone(ns, zone) < 0) {
+        return NVME_INTERNAL_DEV_ERROR;
+    }
+
     return NVME_SUCCESS;
 }
 
@@ -1754,6 +1822,10 @@ static uint16_t nvme_zone_mgmt_send_offline(NvmeCtrl *n, NvmeRequest *req,
     case NVME_ZS_ZSRO:
         nvme_zrm_transition(ns, zone, NVME_ZS_ZSO);
 
+        if (nvme_zns_commit_zone(ns, zone) < 0) {
+            return NVME_INTERNAL_DEV_ERROR;
+        }
+
         /* fallthrough */
 
     case NVME_ZS_ZSO:
@@ -1793,6 +1865,10 @@ static uint16_t nvme_zone_mgmt_send_set_zde(NvmeCtrl *n, NvmeRequest *req,
         return status;
     }
 
+    if (nvme_zns_commit_zde(ns, zone) < 0) {
+        return NVME_INTERNAL_DEV_ERROR;
+    }
+
     status = nvme_zrm_transition(ns, zone, NVME_ZS_ZSC);
     if (status) {
         return status;
@@ -1800,6 +1876,10 @@ static uint16_t nvme_zone_mgmt_send_set_zde(NvmeCtrl *n, NvmeRequest *req,
 
     NVME_ZA_SET(zone->zd->za, NVME_ZA_ZDEV);
 
+    if (nvme_zns_commit_zone(ns, zone) < 0) {
+        return NVME_INTERNAL_DEV_ERROR;
+    }
+
     return NVME_SUCCESS;
 }
 
@@ -2502,6 +2582,11 @@ static uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req)
                 goto invalid;
             }
 
+            if (nvme_zns_commit_zone(ns, zone) < 0) {
+                status = NVME_INTERNAL_DEV_ERROR;
+                goto invalid;
+            }
+
             break;
         }
 
@@ -3778,6 +3863,8 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
                         nvme_zrm_transition(ns, zone, NVME_ZS_ZSE);
                     }
 
+                    nvme_zns_commit_zone(ns, zone);
+
                     /* fallthrough */
 
                 default:
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 31482bfba1fe..aa5491c398b9 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -96,6 +96,8 @@ pci_nvme_enqueue_req_completion(uint16_t cid, uint16_t cqid, uint16_t status) "c
 pci_nvme_zrm_transition(uint32_t nsid, uint64_t zslba, const char *s_from, uint8_t from, const char *s_to, uint8_t to) "nsid %"PRIu32" zslba 0x%"PRIx64" from '%s' (%"PRIu8") to '%s' (%"PRIu8")"
 pci_nvme_zrm_release_open(uint32_t nsid) "nsid %"PRIu32""
 pci_nvme_zns_advance_wp(uint32_t nsid, uint64_t zslba, uint64_t wp_orig, uint32_t nlb) "nsid 0x%"PRIx32" zslba 0x%"PRIx64" wp_orig 0x%"PRIx64" nlb %"PRIu32""
+pci_nvme_zns_commit_zone(uint32_t nsid, uint64_t zslba) "nsid 0x%"PRIx32" zslba 0x%"PRIx64""
+pci_nvme_zns_commit_zde(uint32_t nsid, uint64_t zslba) "nsid 0x%"PRIx32" zslba 0x%"PRIx64""
 pci_nvme_mmio_read(uint64_t addr) "addr 0x%"PRIx64""
 pci_nvme_mmio_write(uint64_t addr, uint64_t data) "addr 0x%"PRIx64" data 0x%"PRIx64""
 pci_nvme_mmio_doorbell_cq(uint16_t cqid, uint16_t new_head) "cqid %"PRIu16" new_head %"PRIu16""
-- 
2.29.2


