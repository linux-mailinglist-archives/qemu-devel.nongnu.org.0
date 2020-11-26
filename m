Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4E72C5E5B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 00:56:08 +0100 (CET)
Received: from localhost ([::1]:58542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiR7O-0005Dv-Uk
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 18:56:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxz-0007Rf-0u; Thu, 26 Nov 2020 18:46:23 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:44761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxq-0003tY-CU; Thu, 26 Nov 2020 18:46:22 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 81A985C0213;
 Thu, 26 Nov 2020 18:46:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Nov 2020 18:46:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ENwZJt1MfSZJS
 DKphDFhCxwUnw4t/EzBhqNWygkefss=; b=iAToZEZeqCzYMb5Y0fE6ZRGN3vV1u
 uT4vekpFJP2gsCr3+z3y+LIvIR/ggLLb0BE8wPVxVkSMRQXqucopea8KG8udAA2J
 jI6MgiR3HT1r2fAiQiGozue7Lz/4dwtyl38OSvfBmHokohEVSRvetmJSpmOZSiGD
 CWyMHgr3GdsQ8ZXHHTVKyHOkQJM6php4clY9dXBRruPaW43ykdX4VCcXiOXM2NMJ
 9lbn9VHKEFmguWpD590O+1RDtwb0eqismG3IvjpaXmugTh6+URGqfPVjv3KeqbSV
 ypPDog/HcH2HQqGFzUuPx7o98cuAeAxN0ZHBYXbmbuvwZO8PeIukvv5Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ENwZJt1MfSZJSDKphDFhCxwUnw4t/EzBhqNWygkefss=; b=I39OFV+Y
 l00b6/0qYE00ARJ4cMzalBfB1zrsMJ6XR5uoK5/c5TpNeWhbwsFUl62FLpENFSTv
 TSrgYY5jjJdHLwRnlT+gJLVc6D3cKGYD+A7Bj/9eVnbG8+egnCyHnSt2DZjIRkq+
 VlPf58EZjClA7SIzdeYOIxWNO00nSMcR6pMy3mq4/8TObmu7MHUCsWUqov4Mos0O
 dJU/NuF8NhoxBO6h3kb8S2jLIf1u6PA6d+nMM4yEAiYshBfiwrHMIOGCLwlIDlBE
 PYBusUlDmgrusvLsgdBARhwWrOIK9gMLhmYwtNHQ3DsiT5u2EWIhKMZIVGuUSyb9
 bk6Krob35pwn6w==
X-ME-Sender: <xms:RD7AX-wTrSYFgQaRaD36_DZh9d3u9NsFE1_cmUeF07kKSCCejVIdjA>
 <xme:RD7AX6SfHUWkLqF17szwSLnsSWPnjV1Yv6p3LGdbka1PU9-v6BIEhPymmiFbMQ8tm
 ttqFKHUMgLvovZyjgo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehfedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeiudehfeejteegueeffeekhfelgfekheetfffgteejgeekuefgtddujeeuudeg
 ieenucffohhmrghinhepuhhuihgurdgurghtrgenucfkphepkedtrdduieejrdelkedrud
 eltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehi
 thhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:RD7AXwWpmmVvC2AhSNkaRh-6mHDkeHwgU-G1tzY2mq0tzztO3aWE8w>
 <xmx:RD7AX0jhM6KKpIfsdofF6aRgno6YUlEhNQtMdjrmh7gY8HhID0SD8A>
 <xmx:RD7AXwBgIQdguL36k0kv6yjUzkLugthr82DI73c6F6V0ILu5jQuoKA>
 <xmx:RD7AXy1Md17cJYvcDvC4LW7rjA8exwzEfn2SKZJNHq0_AynCz0jxhA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 02CD03064AAE;
 Thu, 26 Nov 2020 18:46:10 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/12] hw/block/nvme: support namespace types
Date: Fri, 27 Nov 2020 00:45:54 +0100
Message-Id: <20201126234601.689714-6-its@irrelevant.dk>
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

Implement support for TP 4056 ("Namespace Types"). This adds the 'iocs'
(I/O Command Set) device parameter to the nvme-ns device.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/specs/nvme.txt   |   3 +
 hw/block/nvme-ns.h    |  12 ++-
 hw/block/nvme.h       |   3 +
 include/block/nvme.h  |  52 ++++++++---
 block/nvme.c          |   4 +-
 hw/block/nvme-ns.c    |  20 +++-
 hw/block/nvme.c       | 209 +++++++++++++++++++++++++++++++++++-------
 hw/block/trace-events |   6 +-
 8 files changed, 256 insertions(+), 53 deletions(-)

diff --git a/docs/specs/nvme.txt b/docs/specs/nvme.txt
index 56d393884e7a..619bd9ce4378 100644
--- a/docs/specs/nvme.txt
+++ b/docs/specs/nvme.txt
@@ -3,6 +3,9 @@ NVM Express Controller
 
 The nvme device (-device nvme) emulates an NVM Express Controller.
 
+  `iocs`; The "I/O Command Set" associated with the namespace. E.g. 0x0 for the
+     NVM Command Set (the default), or 0x2 for the Zoned Namespace Command Set.
+
 
 Reference Specifications
 ------------------------
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 1f8c9c0a92ad..3b095423cf52 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -21,6 +21,7 @@
 
 typedef struct NvmeNamespaceParams {
     uint32_t nsid;
+    uint8_t  iocs;
     QemuUUID uuid;
 
     uint16_t mssrl;
@@ -33,7 +34,8 @@ typedef struct NvmeNamespace {
     BlockConf    blkconf;
     int32_t      bootindex;
     int64_t      size;
-    NvmeIdNs     id_ns;
+    uint8_t      iocs;
+    void         *id_ns[NVME_IOCS_MAX];
 
     NvmeNamespaceParams params;
 
@@ -53,7 +55,7 @@ static inline uint32_t nvme_nsid(NvmeNamespace *ns)
 
 static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
 {
-    NvmeIdNs *id_ns = &ns->id_ns;
+    NvmeIdNsNvm *id_ns = ns->id_ns[NVME_IOCS_NVM];
     return &id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
 }
 
@@ -68,6 +70,12 @@ static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
     return ns->size >> nvme_ns_lbads(ns);
 }
 
+static inline uint64_t nvme_ns_nsze(NvmeNamespace *ns)
+{
+    NvmeIdNsNvm *id_ns = ns->id_ns[NVME_IOCS_NVM];
+    return le64_to_cpu(id_ns->nsze);
+}
+
 /* convert an LBA to the equivalent in bytes */
 static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
 {
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 079807272ae7..b1616ba79733 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -115,6 +115,7 @@ typedef struct NvmeFeatureVal {
     };
     uint32_t    async_config;
     uint32_t    vwc;
+    uint32_t    iocsci;
 } NvmeFeatureVal;
 
 typedef struct NvmeCtrl {
@@ -143,6 +144,7 @@ typedef struct NvmeCtrl {
     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
     uint64_t    starttime_ms;
     uint16_t    temperature;
+    uint64_t    iocscs[512];
 
     HostMemoryBackend *pmrdev;
 
@@ -158,6 +160,7 @@ typedef struct NvmeCtrl {
     NvmeSQueue      admin_sq;
     NvmeCQueue      admin_cq;
     NvmeIdCtrl      id_ctrl;
+    void            *id_ctrl_iocss[NVME_IOCS_MAX];
     NvmeFeatureVal  features;
 } NvmeCtrl;
 
diff --git a/include/block/nvme.h b/include/block/nvme.h
index ffc65dc25f90..53c051d52c53 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -88,6 +88,7 @@ enum NvmeCapMask {
 
 enum NvmeCapCss {
     NVME_CAP_CSS_NVM        = 1 << 0,
+    NVME_CAP_CSS_CSI        = 1 << 6,
     NVME_CAP_CSS_ADMIN_ONLY = 1 << 7,
 };
 
@@ -121,6 +122,7 @@ enum NvmeCcMask {
 
 enum NvmeCcCss {
     NVME_CC_CSS_NVM        = 0x0,
+    NVME_CC_CSS_ALL        = 0x6,
     NVME_CC_CSS_ADMIN_ONLY = 0x7,
 };
 
@@ -392,6 +394,11 @@ enum NvmePmrmscMask {
 #define NVME_PMRMSC_SET_CBA(pmrmsc, val)   \
     (pmrmsc |= (uint64_t)(val & PMRMSC_CBA_MASK) << PMRMSC_CBA_SHIFT)
 
+enum NvmeCommandSet {
+    NVME_IOCS_NVM = 0x0,
+    NVME_IOCS_MAX = 0x1,
+};
+
 enum NvmeSglDescriptorType {
     NVME_SGL_DESCR_TYPE_DATA_BLOCK          = 0x0,
     NVME_SGL_DESCR_TYPE_BIT_BUCKET          = 0x1,
@@ -539,8 +546,13 @@ typedef struct QEMU_PACKED NvmeIdentify {
     uint64_t    rsvd2[2];
     uint64_t    prp1;
     uint64_t    prp2;
-    uint32_t    cns;
-    uint32_t    rsvd11[5];
+    uint8_t     cns;
+    uint8_t     rsvd3;
+    uint16_t    cntid;
+    uint16_t    nvmsetid;
+    uint8_t     rsvd4;
+    uint8_t     csi;
+    uint32_t    rsvd11[4];
 } NvmeIdentify;
 
 typedef struct QEMU_PACKED NvmeRwCmd {
@@ -661,8 +673,15 @@ typedef struct QEMU_PACKED NvmeAerResult {
 } NvmeAerResult;
 
 typedef struct QEMU_PACKED NvmeCqe {
-    uint32_t    result;
-    uint32_t    rsvd;
+    union {
+        struct {
+            uint32_t    dw0;
+            uint32_t    dw1;
+        };
+
+        uint64_t qw0;
+    };
+
     uint16_t    sq_head;
     uint16_t    sq_id;
     uint16_t    cid;
@@ -711,6 +730,10 @@ enum NvmeStatusCodes {
     NVME_FEAT_NOT_CHANGEABLE    = 0x010e,
     NVME_FEAT_NOT_NS_SPEC       = 0x010f,
     NVME_FW_REQ_SUSYSTEM_RESET  = 0x0110,
+    NVME_IOCS_NOT_SUPPORTED     = 0x0129,
+    NVME_IOCS_NOT_ENABLED       = 0x012a,
+    NVME_IOCS_COMB_REJECTED     = 0x012b,
+    NVME_INVALID_IOCS           = 0x012c,
     NVME_CONFLICTING_ATTRS      = 0x0180,
     NVME_INVALID_PROT_INFO      = 0x0181,
     NVME_WRITE_TO_RO            = 0x0182,
@@ -821,10 +844,14 @@ typedef struct QEMU_PACKED NvmePSD {
 #define NVME_IDENTIFY_DATA_SIZE 4096
 
 enum {
-    NVME_ID_CNS_NS             = 0x0,
-    NVME_ID_CNS_CTRL           = 0x1,
-    NVME_ID_CNS_NS_ACTIVE_LIST = 0x2,
-    NVME_ID_CNS_NS_DESCR_LIST  = 0x3,
+    NVME_ID_CNS_NS                  = 0x00,
+    NVME_ID_CNS_CTRL                = 0x01,
+    NVME_ID_CNS_NS_ACTIVE_LIST      = 0x02,
+    NVME_ID_CNS_NS_DESCR_LIST       = 0x03,
+    NVME_ID_CNS_NS_IOCS             = 0x05,
+    NVME_ID_CNS_CTRL_IOCS           = 0x06,
+    NVME_ID_CNS_NS_ACTIVE_LIST_IOCS = 0x07,
+    NVME_ID_CNS_IOCS                = 0x1c,
 };
 
 typedef struct QEMU_PACKED NvmeIdCtrl {
@@ -980,6 +1007,7 @@ enum NvmeFeatureIds {
     NVME_WRITE_ATOMICITY            = 0xa,
     NVME_ASYNCHRONOUS_EVENT_CONF    = 0xb,
     NVME_TIMESTAMP                  = 0xe,
+    NVME_COMMAND_SET_PROFILE        = 0x19,
     NVME_SOFTWARE_PROGRESS_MARKER   = 0x80,
     NVME_FID_MAX                    = 0x100,
 };
@@ -1028,7 +1056,7 @@ typedef struct QEMU_PACKED NvmeLBAF {
 
 #define NVME_NSID_BROADCAST 0xffffffff
 
-typedef struct QEMU_PACKED NvmeIdNs {
+typedef struct QEMU_PACKED NvmeIdNsNvm {
     uint64_t    nsze;
     uint64_t    ncap;
     uint64_t    nuse;
@@ -1064,7 +1092,7 @@ typedef struct QEMU_PACKED NvmeIdNs {
     NvmeLBAF    lbaf[16];
     uint8_t     rsvd192[192];
     uint8_t     vs[3712];
-} NvmeIdNs;
+} NvmeIdNsNvm;
 
 typedef struct QEMU_PACKED NvmeIdNsDescr {
     uint8_t nidt;
@@ -1076,12 +1104,14 @@ enum {
     NVME_NIDT_EUI64_LEN =  8,
     NVME_NIDT_NGUID_LEN = 16,
     NVME_NIDT_UUID_LEN  = 16,
+    NVME_NIDT_CSI_LEN   =  1,
 };
 
 enum NvmeNsIdentifierType {
     NVME_NIDT_EUI64 = 0x1,
     NVME_NIDT_NGUID = 0x2,
     NVME_NIDT_UUID  = 0x3,
+    NVME_NIDT_CSI   = 0x4,
 };
 
 /*Deallocate Logical Block Features*/
@@ -1136,7 +1166,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeFwSlotInfoLog) != 512);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSmartLog) != 512);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrl) != 4096);
-    QEMU_BUILD_BUG_ON(sizeof(NvmeIdNs) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsNvm) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSglDescriptor) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) != 4);
     QEMU_BUILD_BUG_ON(sizeof(NvmeEffectsLog) != 4096);
diff --git a/block/nvme.c b/block/nvme.c
index 739a0a700cb8..4048ac10a0f4 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -337,7 +337,7 @@ static inline int nvme_translate_error(const NvmeCqe *c)
 {
     uint16_t status = (le16_to_cpu(c->status) >> 1) & 0xFF;
     if (status) {
-        trace_nvme_error(le32_to_cpu(c->result),
+        trace_nvme_error(le32_to_cpu(c->dw0),
                          le16_to_cpu(c->sq_head),
                          le16_to_cpu(c->sq_id),
                          le16_to_cpu(c->cid),
@@ -507,7 +507,7 @@ static void nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
     BDRVNVMeState *s = bs->opaque;
     union {
         NvmeIdCtrl ctrl;
-        NvmeIdNs ns;
+        NvmeIdNsNvm ns;
     } *id;
     NvmeLBAF *lbaf;
     uint16_t oncs;
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 505f6fb0a654..7d70095439b6 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -33,11 +33,16 @@
 static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 {
     BlockDriverInfo bdi;
-    NvmeIdNs *id_ns = &ns->id_ns;
-    int lba_index = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
+    NvmeIdNsNvm *id_ns;
+    int lba_index;
     int npdg;
 
-    ns->id_ns.dlfeat = 0x9;
+    id_ns = ns->id_ns[NVME_IOCS_NVM] = g_new0(NvmeIdNsNvm, 1);
+
+    ns->iocs = ns->params.iocs;
+    lba_index = NVME_ID_NS_FLBAS_INDEX(id_ns->flbas);
+
+    id_ns->dlfeat = 0x9;
 
     id_ns->lbaf[lba_index].ds = 31 - clz32(ns->blkconf.logical_block_size);
 
@@ -104,6 +109,14 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
+    switch (ns->params.iocs) {
+    case NVME_IOCS_NVM:
+        break;
+    default:
+        error_setg(errp, "unsupported iocs");
+        return -1;
+    }
+
     return 0;
 }
 
@@ -155,6 +168,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
 static Property nvme_ns_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
+    DEFINE_PROP_UINT8("iocs", NvmeNamespace, params.iocs, NVME_IOCS_NVM),
     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
     DEFINE_PROP_UINT16("mssrl", NvmeNamespace, params.mssrl, 128),
     DEFINE_PROP_UINT32("mcl", NvmeNamespace, params.mcl, 128),
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 4f732c13c7e9..5df7c9598b13 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -100,6 +100,7 @@ static const bool nvme_feature_support[NVME_FID_MAX] = {
     [NVME_WRITE_ATOMICITY]          = true,
     [NVME_ASYNCHRONOUS_EVENT_CONF]  = true,
     [NVME_TIMESTAMP]                = true,
+    [NVME_COMMAND_SET_PROFILE]      = true,
 };
 
 static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
@@ -109,6 +110,7 @@ static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
     [NVME_NUMBER_OF_QUEUES]         = NVME_FEAT_CAP_CHANGE,
     [NVME_ASYNCHRONOUS_EVENT_CONF]  = NVME_FEAT_CAP_CHANGE,
     [NVME_TIMESTAMP]                = NVME_FEAT_CAP_CHANGE,
+    [NVME_COMMAND_SET_PROFILE]      = NVME_FEAT_CAP_CHANGE,
 };
 
 static void nvme_process_sq(void *opaque);
@@ -810,7 +812,7 @@ static void nvme_process_aers(void *opaque)
 
         req = n->aer_reqs[n->outstanding_aers];
 
-        result = (NvmeAerResult *) &req->cqe.result;
+        result = (NvmeAerResult *) &req->cqe.dw0;
         result->event_type = event->result.event_type;
         result->event_info = event->result.event_info;
         result->log_page = event->result.log_page;
@@ -870,7 +872,7 @@ static inline uint16_t nvme_check_mdts(NvmeCtrl *n, size_t len)
 static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
                                          uint32_t nlb)
 {
-    uint64_t nsze = le64_to_cpu(ns->id_ns.nsze);
+    uint64_t nsze = nvme_ns_nsze(ns);
 
     if (unlikely(UINT64_MAX - slba < nlb || slba + nlb > nsze)) {
         return NVME_LBA_RANGE | NVME_DNR;
@@ -1044,7 +1046,8 @@ static void nvme_copy_in_complete(NvmeRequest *req)
 
     status = nvme_check_bounds(ns, sdlba, ctx->nlb);
     if (status) {
-        trace_pci_nvme_err_invalid_lba_range(sdlba, ctx->nlb, ns->id_ns.nsze);
+        trace_pci_nvme_err_invalid_lba_range(sdlba, ctx->nlb,
+                                             nvme_ns_nsze(ns));
         req->status = status;
 
         g_free(ctx->bounce);
@@ -1183,7 +1186,7 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
 
             if (nvme_check_bounds(ns, slba, nlb)) {
                 trace_pci_nvme_err_invalid_lba_range(slba, nlb,
-                                                     ns->id_ns.nsze);
+                                                     nvme_ns_nsze(ns));
                 continue;
             }
 
@@ -1222,6 +1225,7 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
 static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
+    NvmeIdNsNvm *id_ns = ns->id_ns[NVME_IOCS_NVM];
     NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
     g_autofree NvmeCopySourceRange *range = NULL;
 
@@ -1242,7 +1246,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    if (nr > ns->id_ns.msrc + 1) {
+    if (nr > id_ns->msrc + 1) {
         return NVME_CMD_SIZE_LIMIT | NVME_DNR;
     }
 
@@ -1256,14 +1260,14 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 
     for (i = 0; i < nr; i++) {
         uint32_t _nlb = le16_to_cpu(range[i].nlb) + 1;
-        if (_nlb > le16_to_cpu(ns->id_ns.mssrl)) {
+        if (_nlb > le16_to_cpu(id_ns->mssrl)) {
             return NVME_CMD_SIZE_LIMIT | NVME_DNR;
         }
 
         nlb += _nlb;
     }
 
-    if (nlb > le32_to_cpu(ns->id_ns.mcl)) {
+    if (nlb > le32_to_cpu(id_ns->mcl)) {
         return NVME_CMD_SIZE_LIMIT | NVME_DNR;
     }
 
@@ -1275,7 +1279,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 
         status = nvme_check_bounds(ns, slba, nlb);
         if (status) {
-            trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
+            trace_pci_nvme_err_invalid_lba_range(slba, nlb, id_ns->nsze);
             goto free_bounce;
         }
 
@@ -1339,6 +1343,7 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
+    NvmeIdNsNvm *id_ns = ns->id_ns[NVME_IOCS_NVM];
     BlockBackend *blk = ns->blkconf.blk;
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
@@ -1358,7 +1363,7 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
 
     status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
-        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
+        trace_pci_nvme_err_invalid_lba_range(slba, nlb, id_ns->nsze);
         return status;
     }
 
@@ -1415,7 +1420,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
 
     status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
-        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
+        trace_pci_nvme_err_invalid_lba_range(slba, nlb, nvme_ns_nsze(ns));
         goto invalid;
     }
 
@@ -1474,7 +1479,7 @@ static uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req)
 
     status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
-        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
+        trace_pci_nvme_err_invalid_lba_range(slba, nlb, nvme_ns_nsze(ns));
         goto invalid;
     }
 
@@ -1816,6 +1821,7 @@ static uint16_t nvme_effects_log(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
     };
 
     uint32_t trans_len;
+    uint8_t csi = le32_to_cpu(req->cmd.cdw14) >> 24;
 
     if (off >= sizeof(NvmeEffectsLog)) {
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -1829,6 +1835,21 @@ static uint16_t nvme_effects_log(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
         nvme_effects_nvm(&effects);
         break;
 
+    case NVME_CC_CSS_ALL:
+        if (!(n->iocscs[n->features.iocsci] & (1 << csi))) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+
+        switch (csi) {
+        case NVME_IOCS_NVM:
+            nvme_effects_nvm(&effects);
+            break;
+        default:
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+
+        break;
+
     default:
         return NVME_INTERNAL_DEV_ERROR | NVME_DNR;
     }
@@ -1997,39 +2018,94 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_ctrl(NvmeCtrl *n, uint8_t cns, uint8_t csi,
+                                   NvmeRequest *req)
 {
+    NvmeIdCtrl empty = { 0 };
+    NvmeIdCtrl *id_ctrl = &empty;
+
     trace_pci_nvme_identify_ctrl();
 
-    return nvme_dma(n, (uint8_t *)&n->id_ctrl, sizeof(n->id_ctrl),
+    switch (cns) {
+    case NVME_ID_CNS_CTRL:
+        id_ctrl = &n->id_ctrl;
+
+        break;
+
+    case NVME_ID_CNS_CTRL_IOCS:
+        if (!(n->iocscs[n->features.iocsci] & (1 << csi))) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+
+        assert(csi < NVME_IOCS_MAX);
+
+        if (n->id_ctrl_iocss[csi]) {
+            id_ctrl = n->id_ctrl_iocss[csi];
+        }
+
+        break;
+
+    default:
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    return nvme_dma(n, (uint8_t *)id_ctrl, sizeof(*id_ctrl),
                     DMA_DIRECTION_FROM_DEVICE, req);
 }
 
-static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_ns(NvmeCtrl *n, uint8_t cns, uint8_t csi,
+                                 NvmeRequest *req)
 {
+    NvmeIdNsNvm empty = { 0 };
+    void *id_ns = &empty;
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
-    NvmeIdNs *id_ns, inactive = { 0 };
     uint32_t nsid = le32_to_cpu(c->nsid);
 
-    trace_pci_nvme_identify_ns(nsid);
+    trace_pci_nvme_identify_ns(nsid, csi);
 
     if (!nvme_nsid_valid(n, nsid) || nsid == NVME_NSID_BROADCAST) {
         return NVME_INVALID_NSID | NVME_DNR;
     }
 
     ns = nvme_ns(n, nsid);
-    if (unlikely(!ns)) {
-        id_ns = &inactive;
-    } else {
-        id_ns = &ns->id_ns;
+    if (ns) {
+        switch (cns) {
+        case NVME_ID_CNS_NS:
+            id_ns = ns->id_ns[NVME_IOCS_NVM];
+            if (!id_ns) {
+                return NVME_INVALID_IOCS | NVME_DNR;
+            }
+
+            break;
+
+        case NVME_ID_CNS_NS_IOCS:
+            if (csi == NVME_IOCS_NVM) {
+                break;
+            }
+
+            if (csi >= NVME_IOCS_MAX) {
+                return NVME_INVALID_FIELD | NVME_DNR;
+            }
+
+            id_ns = ns->id_ns[csi];
+            if (!id_ns) {
+                return NVME_INVALID_FIELD | NVME_DNR;
+            }
+
+            break;
+
+        default:
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
     }
 
-    return nvme_dma(n, (uint8_t *)id_ns, sizeof(NvmeIdNs),
+    return nvme_dma(n, (uint8_t *)id_ns, NVME_IDENTIFY_DATA_SIZE,
                     DMA_DIRECTION_FROM_DEVICE, req);
 }
 
-static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_nslist(NvmeCtrl *n, uint8_t cns, uint8_t csi,
+                                     NvmeRequest *req)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
     static const int data_len = NVME_IDENTIFY_DATA_SIZE;
@@ -2038,7 +2114,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
     uint16_t ret;
     int j = 0;
 
-    trace_pci_nvme_identify_nslist(min_nsid);
+    trace_pci_nvme_identify_nslist(min_nsid, csi);
 
     /*
      * Both 0xffffffff (NVME_NSID_BROADCAST) and 0xfffffffe are invalid values
@@ -2050,11 +2126,21 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_NSID | NVME_DNR;
     }
 
+    if (cns == NVME_ID_CNS_NS_ACTIVE_LIST_IOCS && !csi) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
     list = g_malloc0(data_len);
     for (int i = 1; i <= n->num_namespaces; i++) {
-        if (i <= min_nsid || !nvme_ns(n, i)) {
+        NvmeNamespace *ns = nvme_ns(n, i);
+        if (i <= min_nsid || !ns) {
             continue;
         }
+
+        if (cns == NVME_ID_CNS_NS_ACTIVE_LIST_IOCS && csi && csi != ns->iocs) {
+            continue;
+        }
+
         list[j++] = cpu_to_le32(i);
         if (j == data_len / sizeof(uint32_t)) {
             break;
@@ -2078,6 +2164,11 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
             NvmeIdNsDescr hdr;
             uint8_t v[16];
         } uuid;
+
+        struct {
+            NvmeIdNsDescr hdr;
+            uint8_t v;
+        } iocs;
     };
 
     struct data *ns_descrs = (struct data *)list;
@@ -2104,25 +2195,45 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
     ns_descrs->uuid.hdr.nidl = NVME_NIDT_UUID_LEN;
     memcpy(&ns_descrs->uuid.v, ns->params.uuid.data, NVME_NIDT_UUID_LEN);
 
+    ns_descrs->iocs.hdr.nidt = NVME_NIDT_CSI;
+    ns_descrs->iocs.hdr.nidl = NVME_NIDT_CSI_LEN;
+    stb_p(&ns_descrs->iocs.v, ns->iocs);
+
     return nvme_dma(n, list, NVME_IDENTIFY_DATA_SIZE,
                     DMA_DIRECTION_FROM_DEVICE, req);
 }
 
+static uint16_t nvme_identify_iocs(NvmeCtrl *n, uint16_t cntid,
+                                   NvmeRequest *req)
+{
+    return nvme_dma(n, (uint8_t *) n->iocscs, sizeof(n->iocscs),
+                    DMA_DIRECTION_FROM_DEVICE, req);
+}
+
 static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
 
+    trace_pci_nvme_identify(nvme_cid(req), le32_to_cpu(c->nsid),
+                            le16_to_cpu(c->cntid), c->cns, c->csi,
+                            le16_to_cpu(c->nvmsetid));
+
     switch (le32_to_cpu(c->cns)) {
     case NVME_ID_CNS_NS:
-        return nvme_identify_ns(n, req);
+    case NVME_ID_CNS_NS_IOCS:
+        return nvme_identify_ns(n, c->cns, c->csi, req);
     case NVME_ID_CNS_CTRL:
-        return nvme_identify_ctrl(n, req);
+    case NVME_ID_CNS_CTRL_IOCS:
+        return nvme_identify_ctrl(n, c->cns, c->csi, req);
     case NVME_ID_CNS_NS_ACTIVE_LIST:
-        return nvme_identify_nslist(n, req);
+    case NVME_ID_CNS_NS_ACTIVE_LIST_IOCS:
+        return nvme_identify_nslist(n, c->cns, c->csi, req);
     case NVME_ID_CNS_NS_DESCR_LIST:
         return nvme_identify_ns_descr_list(n, req);
+    case NVME_ID_CNS_IOCS:
+        return nvme_identify_iocs(n, c->cntid, req);
     default:
-        trace_pci_nvme_err_invalid_identify_cns(le32_to_cpu(c->cns));
+        trace_pci_nvme_err_invalid_identify_cns(c->cns);
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 }
@@ -2131,7 +2242,7 @@ static uint16_t nvme_abort(NvmeCtrl *n, NvmeRequest *req)
 {
     uint16_t sqid = le32_to_cpu(req->cmd.cdw10) & 0xffff;
 
-    req->cqe.result = 1;
+    req->cqe.dw0 = 1;
     if (nvme_check_sqid(n, sqid)) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
@@ -2310,6 +2421,9 @@ defaults:
             result |= NVME_INTVC_NOCOALESCING;
         }
 
+        break;
+    case NVME_COMMAND_SET_PROFILE:
+        result = cpu_to_le32(n->features.iocsci & 0x1ff);
         break;
     default:
         result = nvme_feature_default[fid];
@@ -2317,7 +2431,8 @@ defaults:
     }
 
 out:
-    req->cqe.result = cpu_to_le32(result);
+    req->cqe.dw0 = cpu_to_le32(result);
+
     return NVME_SUCCESS;
 }
 
@@ -2417,7 +2532,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
                     continue;
                 }
 
-                if (NVME_ID_NS_NSFEAT_DULBE(ns->id_ns.nsfeat)) {
+                if (ns->id_ns[NVME_IOCS_NVM]) {
                     ns->features.err_rec = dw11;
                 }
             }
@@ -2463,14 +2578,34 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
                                     ((dw11 >> 16) & 0xFFFF) + 1,
                                     n->params.max_ioqpairs,
                                     n->params.max_ioqpairs);
-        req->cqe.result = cpu_to_le32((n->params.max_ioqpairs - 1) |
-                                      ((n->params.max_ioqpairs - 1) << 16));
+        req->cqe.dw0 = cpu_to_le32((n->params.max_ioqpairs - 1) |
+                                   ((n->params.max_ioqpairs - 1) << 16));
         break;
     case NVME_ASYNCHRONOUS_EVENT_CONF:
         n->features.async_config = dw11;
         break;
     case NVME_TIMESTAMP:
         return nvme_set_feature_timestamp(n, req);
+    case NVME_COMMAND_SET_PROFILE:
+        if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_ALL) {
+            uint16_t iocsci = dw11 & 0x1ff;
+            uint64_t iocsc = n->iocscs[iocsci];
+
+            for (int i = 1; i <= n->num_namespaces; i++) {
+                ns = nvme_ns(n, i);
+                if (!ns) {
+                    continue;
+                }
+
+                if (!(iocsc & (1 << ns->iocs))) {
+                    return NVME_IOCS_COMB_REJECTED | NVME_DNR;
+                }
+            }
+
+            n->features.iocsci = iocsci;
+        }
+
+        break;
     default:
         return NVME_FEAT_NOT_CHANGEABLE | NVME_DNR;
     }
@@ -3152,6 +3287,8 @@ static void nvme_init_state(NvmeCtrl *n)
     n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
+    n->iocscs[0] = 1 << NVME_IOCS_NVM;
+    n->features.iocsci = 0;
 }
 
 int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
@@ -3377,6 +3514,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_CQR(n->bar.cap, 1);
     NVME_CAP_SET_TO(n->bar.cap, 0xf);
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_NVM);
+    NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_CSI);
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_ADMIN_ONLY);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
     NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
@@ -3438,6 +3576,11 @@ static void nvme_exit(PCIDevice *pci_dev)
     if (n->pmrdev) {
         host_memory_backend_set_mapped(n->pmrdev, false);
     }
+
+    for (int i = 0; i < NVME_IOCS_MAX; i++) {
+        g_free(n->id_ctrl_iocss[i]);
+    }
+
     msix_uninit_exclusive_bar(pci_dev);
 }
 
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 35ea40c49169..1f1aef719301 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -58,10 +58,12 @@ pci_nvme_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t qsize,
 pci_nvme_create_cq(uint64_t addr, uint16_t cqid, uint16_t vector, uint16_t size, uint16_t qflags, int ien) "create completion queue, addr=0x%"PRIx64", cqid=%"PRIu16", vector=%"PRIu16", qsize=%"PRIu16", qflags=%"PRIu16", ien=%d"
 pci_nvme_del_sq(uint16_t qid) "deleting submission queue sqid=%"PRIu16""
 pci_nvme_del_cq(uint16_t cqid) "deleted completion queue, cqid=%"PRIu16""
+pci_nvme_identify(uint16_t cid, uint32_t nsid, uint16_t cntid, uint8_t cns, uint8_t csi, uint16_t nvmsetid) "cid %"PRIu16" nsid %"PRIu32" cntid 0x%"PRIx16" cns 0x%"PRIx8" csi 0x%"PRIx8" nvmsetid %"PRIu16""
 pci_nvme_identify_ctrl(void) "identify controller"
-pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
-pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
+pci_nvme_identify_ns(uint32_t ns, uint8_t csi) "nsid %"PRIu32" csi 0x%"PRIx8""
+pci_nvme_identify_nslist(uint32_t ns, uint8_t csi) "nsid %"PRIu32" csi 0x%"PRIx8""
 pci_nvme_identify_ns_descr_list(uint32_t ns) "nsid %"PRIu32""
+pci_nvme_identify_io_cmd_set(uint16_t cid) "cid %"PRIu16""
 pci_nvme_get_log(uint16_t cid, uint8_t lid, uint8_t lsp, uint8_t rae, uint32_t len, uint64_t off) "cid %"PRIu16" lid 0x%"PRIx8" lsp 0x%"PRIx8" rae 0x%"PRIx8" len %"PRIu32" off %"PRIu64""
 pci_nvme_getfeat(uint16_t cid, uint32_t nsid, uint8_t fid, uint8_t sel, uint32_t cdw11) "cid %"PRIu16" nsid 0x%"PRIx32" fid 0x%"PRIx8" sel 0x%"PRIx8" cdw11 0x%"PRIx32""
 pci_nvme_setfeat(uint16_t cid, uint32_t nsid, uint8_t fid, uint8_t save, uint32_t cdw11) "cid %"PRIu16" nsid 0x%"PRIx32" fid 0x%"PRIx8" save 0x%"PRIx8" cdw11 0x%"PRIx32""
-- 
2.29.2


