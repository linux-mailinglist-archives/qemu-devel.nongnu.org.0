Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF532FB55F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:33:58 +0100 (CET)
Received: from localhost ([::1]:32772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1oKj-0003vt-So
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2p-0002EO-AA; Tue, 19 Jan 2021 05:15:27 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:36589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2m-0004Lq-FW; Tue, 19 Jan 2021 05:15:27 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6BF9DF4B;
 Tue, 19 Jan 2021 05:15:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 19 Jan 2021 05:15:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=qezV6R8KYnxPr
 IyG9NpCzWLgY1+aBxR4fkxZDdXsPUo=; b=hIuRazR0kzvCjBkHsbJdnESRxGCzm
 VmSPUf0S/yvqbC4i08nYEybyPP+ln8PFSB7eOWI4qr+qA4ZeSeMbeX9QaGx9OGMP
 AxE1ST9JUw2YZ5yOwwgo4titrxrRJynHnmTjVSxcwnSJ76/pGcEioe2isLNKIRn4
 wsVxJofehr01U0iLaba0hVt5HmhkOYqzfGsVx7z8PyqS1Vpyz2ZfcG/IaP/wYbAS
 lnfrwTIprpllr1JhxNhukTmg0oVv8aO4FJqnpYMQ/Pep8OrwxQmDcpARWnAU5krw
 GTEmgwDKhs3tWt6X897LiBjrfvYTJp1axvEvhWNoZhVTWC6ZWwSjsq3Sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=qezV6R8KYnxPrIyG9NpCzWLgY1+aBxR4fkxZDdXsPUo=; b=T7MIOxx1
 MDJrutDu3O0jFMHj8Tu1Vywl64ULoVLm1sf6UBhfQ/FENS/wo2MXCjW/lRTY0aCJ
 bCnH0wMkd65agQzrzGjHPf8eOSgM4YuAG70xs7JFV2Wmo1OgeNAGdW23suLWKxLF
 2VAyIyhLqvs/v85odt0EVh76PhK/Ad2CelMYTyhQFFPwUJoll2efrsx1VLxFj22e
 S6ZYBvsf5+yT/gDxO8dWNWg+fdCwtUARF5HaqvcC+Dlu7XHF5wrrJjygyTEUTFa3
 IZ4uC2EBUNWg3AM/H294hdVAArGJEvoT1yl0WJqBx91DB7W9o364H1G6RyOdsHBb
 isWiTvRsm4D/Qg==
X-ME-Sender: <xms:ObEGYPwYmE5hce5TUyQeL2Xx14m8lUBHh0rWk_XgXQ3emjrkEWezpg>
 <xme:ObEGYOsCV1-6ni8ST6dd3Z1PEnKVIw5hVPNnx1j3Y9SI3AuylHiXjuYL5sB9_ZiPe
 6eAw13RACjWKoi1fjs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ObEGYGtozXP6LB--YkLSRt5a7zGW0jOsLzI0R5G5Asj8bDa0wL7vZQ>
 <xmx:ObEGYDMbtM_AafCKWEpv0AVbP23vWn-ds33eLrGv7UqrEFV46F7FaA>
 <xmx:ObEGYE3ihPcmxOmgUBXsvrFuVQHx3S9gOS0SCm3bPCxFWXLunBB2IA>
 <xmx:OrEGYJI1geSYWE2djtlV4lw3qC4ABoNey28xTCFEuSYJ-I9On_ejdQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id ADC7124005A;
 Tue, 19 Jan 2021 05:15:20 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/12] hw/block/nvme: move cmb logic to v1.4
Date: Tue, 19 Jan 2021 11:15:02 +0100
Message-Id: <20210119101504.231259-11-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119101504.231259-1-its@irrelevant.dk>
References: <20210119101504.231259-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>

Implement v1.4 logic for configuring the Controller Memory Buffer. This
is not backward compatible with v1.3, so drivers that only support v1.3
will not be able to use the CMB anymore.

Signed-off-by: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h       |  10 +++-
 include/block/nvme.h  | 107 +++++++++++++++++++++++++++++++++++++-----
 hw/block/nvme.c       | 101 +++++++++++++++++++++++++++++----------
 hw/block/trace-events |   2 +
 4 files changed, 182 insertions(+), 38 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index e431474fa5ca..ec95c44efe79 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -20,6 +20,7 @@ typedef struct NvmeParams {
     uint8_t  mdts;
     bool     use_intel_id;
     uint32_t zasl_bs;
+    bool     legacy_cmb;
 } NvmeParams;
 
 typedef struct NvmeAsyncEvent {
@@ -127,7 +128,6 @@ typedef struct NvmeCtrl {
     PCIDevice    parent_obj;
     MemoryRegion bar0;
     MemoryRegion iomem;
-    MemoryRegion ctrl_mem;
     NvmeBar      bar;
     NvmeParams   params;
     NvmeBus      bus;
@@ -143,13 +143,19 @@ typedef struct NvmeCtrl {
     uint32_t    num_namespaces;
     uint32_t    max_q_ents;
     uint8_t     outstanding_aers;
-    uint8_t     *cmbuf;
     uint32_t    irq_status;
     uint64_t    host_timestamp;                 /* Timestamp sent by the host */
     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
     uint64_t    starttime_ms;
     uint16_t    temperature;
 
+    struct {
+        MemoryRegion mem;
+        uint8_t      *buf;
+        bool         cmse;
+        hwaddr       cba;
+    } cmb;
+
     struct {
         HostMemoryBackend *dev;
         bool              cmse;
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 183dc5c0ecf6..7dcd8f9b4e78 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -15,14 +15,19 @@ typedef struct QEMU_PACKED NvmeBar {
     uint64_t    acq;
     uint32_t    cmbloc;
     uint32_t    cmbsz;
-    uint8_t     padding[3520]; /* not used by QEMU */
+    uint32_t    bpinfo;
+    uint32_t    bprsel;
+    uint64_t    bpmbl;
+    uint64_t    cmbmsc;
+    uint32_t    cmbsts;
+    uint8_t     rsvd92[3492];
     uint32_t    pmrcap;
     uint32_t    pmrctl;
     uint32_t    pmrsts;
     uint32_t    pmrebs;
     uint32_t    pmrswtp;
     uint64_t    pmrmsc;
-    uint8_t     reserved[484];
+    uint8_t     css[484];
 } NvmeBar;
 
 enum NvmeCapShift {
@@ -63,6 +68,7 @@ enum NvmeCapMask {
 #define NVME_CAP_MPSMIN(cap)(((cap) >> CAP_MPSMIN_SHIFT) & CAP_MPSMIN_MASK)
 #define NVME_CAP_MPSMAX(cap)(((cap) >> CAP_MPSMAX_SHIFT) & CAP_MPSMAX_MASK)
 #define NVME_CAP_PMRS(cap)  (((cap) >> CAP_PMRS_SHIFT)   & CAP_PMRS_MASK)
+#define NVME_CAP_CMBS(cap)  (((cap) >> CAP_CMBS_SHIFT)   & CAP_CMBS_MASK)
 
 #define NVME_CAP_SET_MQES(cap, val)   (cap |= (uint64_t)(val & CAP_MQES_MASK)  \
                                                            << CAP_MQES_SHIFT)
@@ -184,25 +190,64 @@ enum NvmeAqaMask {
 #define NVME_AQA_ACQS(aqa) ((aqa >> AQA_ACQS_SHIFT) & AQA_ACQS_MASK)
 
 enum NvmeCmblocShift {
-    CMBLOC_BIR_SHIFT  = 0,
-    CMBLOC_OFST_SHIFT = 12,
+    CMBLOC_BIR_SHIFT     = 0,
+    CMBLOC_CQMMS_SHIFT   = 3,
+    CMBLOC_CQPDS_SHIFT   = 4,
+    CMBLOC_CDPMLS_SHIFT  = 5,
+    CMBLOC_CDPCILS_SHIFT = 6,
+    CMBLOC_CDMMMS_SHIFT  = 7,
+    CMBLOC_CQDA_SHIFT    = 8,
+    CMBLOC_OFST_SHIFT    = 12,
 };
 
 enum NvmeCmblocMask {
-    CMBLOC_BIR_MASK  = 0x7,
-    CMBLOC_OFST_MASK = 0xfffff,
+    CMBLOC_BIR_MASK     = 0x7,
+    CMBLOC_CQMMS_MASK   = 0x1,
+    CMBLOC_CQPDS_MASK   = 0x1,
+    CMBLOC_CDPMLS_MASK  = 0x1,
+    CMBLOC_CDPCILS_MASK = 0x1,
+    CMBLOC_CDMMMS_MASK  = 0x1,
+    CMBLOC_CQDA_MASK    = 0x1,
+    CMBLOC_OFST_MASK    = 0xfffff,
 };
 
-#define NVME_CMBLOC_BIR(cmbloc) ((cmbloc >> CMBLOC_BIR_SHIFT)  & \
-                                 CMBLOC_BIR_MASK)
-#define NVME_CMBLOC_OFST(cmbloc)((cmbloc >> CMBLOC_OFST_SHIFT) & \
-                                 CMBLOC_OFST_MASK)
+#define NVME_CMBLOC_BIR(cmbloc) \
+    ((cmbloc >> CMBLOC_BIR_SHIFT) & CMBLOC_BIR_MASK)
+#define NVME_CMBLOC_CQMMS(cmbloc) \
+    ((cmbloc >> CMBLOC_CQMMS_SHIFT) & CMBLOC_CQMMS_MASK)
+#define NVME_CMBLOC_CQPDS(cmbloc) \
+    ((cmbloc >> CMBLOC_CQPDS_SHIFT) & CMBLOC_CQPDS_MASK)
+#define NVME_CMBLOC_CDPMLS(cmbloc) \
+    ((cmbloc >> CMBLOC_CDPMLS_SHIFT) & CMBLOC_CDPMLS_MASK)
+#define NVME_CMBLOC_CDPCILS(cmbloc) \
+    ((cmbloc >> CMBLOC_CDPCILS_SHIFT) & CMBLOC_CDPCILS_MASK)
+#define NVME_CMBLOC_CDMMMS(cmbloc) \
+    ((cmbloc >> CMBLOC_CDMMMS_SHIFT) & CMBLOC_CDMMMS_MASK)
+#define NVME_CMBLOC_CQDA(cmbloc) \
+    ((cmbloc >> CMBLOC_CQDA_SHIFT) & CMBLOC_CQDA_MASK)
+#define NVME_CMBLOC_OFST(cmbloc) \
+    ((cmbloc >> CMBLOC_OFST_SHIFT) & CMBLOC_OFST_MASK)
 
-#define NVME_CMBLOC_SET_BIR(cmbloc, val)  \
+#define NVME_CMBLOC_SET_BIR(cmbloc, val) \
     (cmbloc |= (uint64_t)(val & CMBLOC_BIR_MASK) << CMBLOC_BIR_SHIFT)
+#define NVME_CMBLOC_SET_CQMMS(cmbloc, val) \
+    (cmbloc |= (uint64_t)(val & CMBLOC_CQMMS_MASK) << CMBLOC_CQMMS_SHIFT)
+#define NVME_CMBLOC_SET_CQPDS(cmbloc, val) \
+    (cmbloc |= (uint64_t)(val & CMBLOC_CQPDS_MASK) << CMBLOC_CQPDS_SHIFT)
+#define NVME_CMBLOC_SET_CDPMLS(cmbloc, val) \
+    (cmbloc |= (uint64_t)(val & CMBLOC_CDPMLS_MASK) << CMBLOC_CDPMLS_SHIFT)
+#define NVME_CMBLOC_SET_CDPCILS(cmbloc, val) \
+    (cmbloc |= (uint64_t)(val & CMBLOC_CDPCILS_MASK) << CMBLOC_CDPCILS_SHIFT)
+#define NVME_CMBLOC_SET_CDMMMS(cmbloc, val) \
+    (cmbloc |= (uint64_t)(val & CMBLOC_CDMMMS_MASK) << CMBLOC_CDMMMS_SHIFT)
+#define NVME_CMBLOC_SET_CQDA(cmbloc, val) \
+    (cmbloc |= (uint64_t)(val & CMBLOC_CQDA_MASK) << CMBLOC_CQDA_SHIFT)
 #define NVME_CMBLOC_SET_OFST(cmbloc, val) \
     (cmbloc |= (uint64_t)(val & CMBLOC_OFST_MASK) << CMBLOC_OFST_SHIFT)
 
+#define NVME_CMBMSMC_SET_CRE (cmbmsc, val) \
+    (cmbmsc |= (uint64_t)(val & CMBLOC_OFST_MASK) << CMBMSC_CRE_SHIFT)
+
 enum NvmeCmbszShift {
     CMBSZ_SQS_SHIFT   = 0,
     CMBSZ_CQS_SHIFT   = 1,
@@ -249,6 +294,46 @@ enum NvmeCmbszMask {
 #define NVME_CMBSZ_GETSIZE(cmbsz) \
     (NVME_CMBSZ_SZ(cmbsz) * (1 << (12 + 4 * NVME_CMBSZ_SZU(cmbsz))))
 
+enum NvmeCmbmscShift {
+    CMBMSC_CRE_SHIFT  = 0,
+    CMBMSC_CMSE_SHIFT = 1,
+    CMBMSC_CBA_SHIFT  = 12,
+};
+
+enum NvmeCmbmscMask {
+    CMBMSC_CRE_MASK  = 0x1,
+    CMBMSC_CMSE_MASK = 0x1,
+    CMBMSC_CBA_MASK   = ((1L << 52) - 1),
+};
+
+#define NVME_CMBMSC_CRE(cmbmsc) \
+    ((cmbmsc >> CMBMSC_CRE_SHIFT)  & CMBMSC_CRE_MASK)
+#define NVME_CMBMSC_CMSE(cmbmsc) \
+    ((cmbmsc >> CMBMSC_CMSE_SHIFT) & CMBMSC_CMSE_MASK)
+#define NVME_CMBMSC_CBA(cmbmsc) \
+    ((cmbmsc >> CMBMSC_CBA_SHIFT) & CMBMSC_CBA_MASK)
+
+
+#define NVME_CMBMSC_SET_CRE(cmbmsc, val)  \
+    (cmbmsc |= (uint64_t)(val & CMBMSC_CRE_MASK) << CMBMSC_CRE_SHIFT)
+#define NVME_CMBMSC_SET_CMSE(cmbmsc, val) \
+    (cmbmsc |= (uint64_t)(val & CMBMSC_CMSE_MASK) << CMBMSC_CMSE_SHIFT)
+#define NVME_CMBMSC_SET_CBA(cmbmsc, val) \
+    (cmbmsc |= (uint64_t)(val & CMBMSC_CBA_MASK) << CMBMSC_CBA_SHIFT)
+
+enum NvmeCmbstsShift {
+    CMBSTS_CBAI_SHIFT = 0,
+};
+enum NvmeCmbstsMask {
+    CMBSTS_CBAI_MASK = 0x1,
+};
+
+#define NVME_CMBSTS_CBAI(cmbsts) \
+    ((cmbsts >> CMBSTS_CBAI_SHIFT) & CMBSTS_CBAI_MASK)
+
+#define NVME_CMBSTS_SET_CBAI(cmbsts, val)  \
+    (cmbsts |= (uint64_t)(val & CMBSTS_CBAI_MASK) << CMBSTS_CBAI_SHIFT)
+
 enum NvmePmrcapShift {
     PMRCAP_RDS_SHIFT      = 3,
     PMRCAP_WDS_SHIFT      = 4,
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 2e0e11174c79..4bcc3cd71c9f 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -27,7 +27,9 @@
  *              zoned=<true|false[optional]>
  *
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
- * offset 0 in BAR2 and supports only WDS, RDS and SQS for now.
+ * offset 0 in BAR2 and supports only WDS, RDS and SQS for now. By default, the
+ * device will use the "v1.4 CMB scheme" - use the `legacy-cmb` parameter to
+ * always enable the CMBLOC and CMBSZ registers (v1.3 behavior).
  *
  * Enabling pmr emulation can be achieved by pointing to memory-backend-file.
  * For example:
@@ -260,17 +262,22 @@ static int nvme_aor_check(NvmeNamespace *ns, uint32_t act, uint32_t opn)
 
 static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
 {
-    hwaddr low = n->ctrl_mem.addr;
-    hwaddr hi  = n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size);
+    hwaddr hi, lo;
 
-    return addr >= low && addr < hi;
+    if (!n->cmb.cmse) {
+        return false;
+    }
+
+    lo = n->params.legacy_cmb ? n->cmb.mem.addr : n->cmb.cba;
+    hi = lo + int128_get64(n->cmb.mem.size);
+
+    return addr >= lo && addr < hi;
 }
 
 static inline void *nvme_addr_to_cmb(NvmeCtrl *n, hwaddr addr)
 {
-    assert(nvme_addr_is_cmb(n, addr));
-
-    return &n->cmbuf[addr - n->ctrl_mem.addr];
+    hwaddr base = n->params.legacy_cmb ? n->cmb.mem.addr : n->cmb.cba;
+    return &n->cmb.buf[addr - base];
 }
 
 static bool nvme_addr_is_pmr(NvmeCtrl *n, hwaddr addr)
@@ -3739,6 +3746,19 @@ static int nvme_start_ctrl(NvmeCtrl *n)
     return 0;
 }
 
+static void nvme_cmb_enable_regs(NvmeCtrl *n)
+{
+    NVME_CMBLOC_SET_BIR(n->bar.cmbloc, NVME_CMB_BIR);
+
+    NVME_CMBSZ_SET_SQS(n->bar.cmbsz, 1);
+    NVME_CMBSZ_SET_CQS(n->bar.cmbsz, 0);
+    NVME_CMBSZ_SET_LISTS(n->bar.cmbsz, 1);
+    NVME_CMBSZ_SET_RDS(n->bar.cmbsz, 1);
+    NVME_CMBSZ_SET_WDS(n->bar.cmbsz, 1);
+    NVME_CMBSZ_SET_SZU(n->bar.cmbsz, 2); /* MBs */
+    NVME_CMBSZ_SET_SZ(n->bar.cmbsz, n->params.cmb_size_mb);
+}
+
 static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
                            unsigned size)
 {
@@ -3866,6 +3886,38 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_cmbsz_readonly,
                        "invalid write to read only CMBSZ, ignored");
         return;
+    case 0x50:  /* CMBMSC */
+        if (!NVME_CAP_CMBS(n->bar.cap)) {
+            return;
+        }
+
+        n->bar.cmbmsc = size == 8 ? data :
+            (n->bar.cmbmsc & ~0xffffffff) | (data & 0xffffffff);
+        n->cmb.cmse = false;
+
+        if (NVME_CMBMSC_CRE(data)) {
+            nvme_cmb_enable_regs(n);
+
+            if (NVME_CMBMSC_CMSE(data)) {
+                hwaddr cba = NVME_CMBMSC_CBA(data) << CMBMSC_CBA_SHIFT;
+                if (cba + int128_get64(n->cmb.mem.size) < cba) {
+                    NVME_CMBSTS_SET_CBAI(n->bar.cmbsts, 1);
+                    return;
+                }
+
+                n->cmb.cba = cba;
+                n->cmb.cmse = true;
+            }
+        } else {
+            n->bar.cmbsz = 0;
+            n->bar.cmbloc = 0;
+        }
+
+        return;
+    case 0x54:  /* CMBMSC hi */
+        n->bar.cmbmsc = (n->bar.cmbmsc & 0xffffffff) | (data << 32);
+        return;
+
     case 0xE00: /* PMRCAP */
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrcap_readonly,
                        "invalid write to PMRCAP register, ignored");
@@ -4122,13 +4174,13 @@ static void nvme_cmb_write(void *opaque, hwaddr addr, uint64_t data,
                            unsigned size)
 {
     NvmeCtrl *n = (NvmeCtrl *)opaque;
-    stn_le_p(&n->cmbuf[addr], size, data);
+    stn_le_p(&n->cmb.buf[addr], size, data);
 }
 
 static uint64_t nvme_cmb_read(void *opaque, hwaddr addr, unsigned size)
 {
     NvmeCtrl *n = (NvmeCtrl *)opaque;
-    return ldn_le_p(&n->cmbuf[addr], size);
+    return ldn_le_p(&n->cmb.buf[addr], size);
 }
 
 static const MemoryRegionOps nvme_cmb_ops = {
@@ -4251,24 +4303,22 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 
 static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 {
-    NVME_CMBLOC_SET_BIR(n->bar.cmbloc, NVME_CMB_BIR);
-    NVME_CMBLOC_SET_OFST(n->bar.cmbloc, 0);
+    uint64_t cmb_size = n->params.cmb_size_mb * MiB;
 
-    NVME_CMBSZ_SET_SQS(n->bar.cmbsz, 1);
-    NVME_CMBSZ_SET_CQS(n->bar.cmbsz, 0);
-    NVME_CMBSZ_SET_LISTS(n->bar.cmbsz, 1);
-    NVME_CMBSZ_SET_RDS(n->bar.cmbsz, 1);
-    NVME_CMBSZ_SET_WDS(n->bar.cmbsz, 1);
-    NVME_CMBSZ_SET_SZU(n->bar.cmbsz, 2); /* MBs */
-    NVME_CMBSZ_SET_SZ(n->bar.cmbsz, n->params.cmb_size_mb);
-
-    n->cmbuf = g_malloc0(NVME_CMBSZ_GETSIZE(n->bar.cmbsz));
-    memory_region_init_io(&n->ctrl_mem, OBJECT(n), &nvme_cmb_ops, n,
-                          "nvme-cmb", NVME_CMBSZ_GETSIZE(n->bar.cmbsz));
-    pci_register_bar(pci_dev, NVME_CMBLOC_BIR(n->bar.cmbloc),
+    n->cmb.buf = g_malloc0(cmb_size);
+    memory_region_init_io(&n->cmb.mem, OBJECT(n), &nvme_cmb_ops, n,
+                          "nvme-cmb", cmb_size);
+    pci_register_bar(pci_dev, NVME_CMB_BIR,
                      PCI_BASE_ADDRESS_SPACE_MEMORY |
                      PCI_BASE_ADDRESS_MEM_TYPE_64 |
-                     PCI_BASE_ADDRESS_MEM_PREFETCH, &n->ctrl_mem);
+                     PCI_BASE_ADDRESS_MEM_PREFETCH, &n->cmb.mem);
+
+    NVME_CAP_SET_CMBS(n->bar.cap, 1);
+
+    if (n->params.legacy_cmb) {
+        nvme_cmb_enable_regs(n);
+        n->cmb.cmse = true;
+    }
 }
 
 static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
@@ -4480,7 +4530,7 @@ static void nvme_exit(PCIDevice *pci_dev)
     g_free(n->aer_reqs);
 
     if (n->params.cmb_size_mb) {
-        g_free(n->cmbuf);
+        g_free(n->cmb.buf);
     }
 
     if (n->pmr.dev) {
@@ -4502,6 +4552,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT32("aer_max_queued", NvmeCtrl, params.aer_max_queued, 64),
     DEFINE_PROP_UINT8("mdts", NvmeCtrl, params.mdts, 7),
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
+    DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
     DEFINE_PROP_SIZE32("zoned.append_size_limit", NvmeCtrl, params.zasl_bs,
                        NVME_DEFAULT_MAX_ZA_SIZE),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/block/trace-events b/hw/block/trace-events
index a104d7f4da80..8e249ea910aa 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -123,6 +123,8 @@ pci_nvme_err_invalid_opc(uint8_t opc) "invalid opcode 0x%"PRIx8""
 pci_nvme_err_invalid_admin_opc(uint8_t opc) "invalid admin opcode 0x%"PRIx8""
 pci_nvme_err_invalid_lba_range(uint64_t start, uint64_t len, uint64_t limit) "Invalid LBA start=%"PRIu64" len=%"PRIu64" limit=%"PRIu64""
 pci_nvme_err_invalid_log_page_offset(uint64_t ofs, uint64_t size) "must be <= %"PRIu64", got %"PRIu64""
+pci_nvme_err_cmb_invalid_cba(uint64_t cmbmsc) "cmbmsc 0x%"PRIx64""
+pci_nvme_err_cmb_not_enabled(uint64_t cmbmsc) "cmbmsc 0x%"PRIx64""
 pci_nvme_err_unaligned_zone_cmd(uint8_t action, uint64_t slba, uint64_t zslba) "unaligned zone op 0x%"PRIx32", got slba=%"PRIu64", zslba=%"PRIu64""
 pci_nvme_err_invalid_zone_state_transition(uint8_t action, uint64_t slba, uint8_t attrs) "action=0x%"PRIx8", slba=%"PRIu64", attrs=0x%"PRIx32""
 pci_nvme_err_write_not_at_wp(uint64_t slba, uint64_t zone, uint64_t wp) "writing at slba=%"PRIu64", zone=%"PRIu64", but wp=%"PRIu64""
-- 
2.30.0


