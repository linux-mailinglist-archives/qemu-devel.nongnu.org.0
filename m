Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40162DDAA4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 22:14:03 +0100 (CET)
Received: from localhost ([::1]:35434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq0b4-0007H7-I7
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 16:14:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kq0Q0-00025m-9B; Thu, 17 Dec 2020 16:02:36 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:35499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kq0Pw-0002DL-6h; Thu, 17 Dec 2020 16:02:36 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 0FCBD5CD;
 Thu, 17 Dec 2020 16:02:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 17 Dec 2020 16:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=BX2e0Wp+MlEL1
 n2HYuh/vceVCaIgtr14nGxbl0HHHGI=; b=AXBZCSvtqodK/qay/EFUSIyV5ZVto
 v9eNkihGj9fWEi9DKGnng2LwSovzHkXrB7ck1Xl3RcczrPEk8UIMTrPjPKJPRmRA
 D8ibybDEPUor/Cl7xyeFb75VKyncN37iLAnaCnTGXVppAEs+sEcbXylUUxNT1uSa
 THS1B4IvQl1be6bmWAC3jX6kRvKXqyRYU52NyE3MuCDELwIADRh9Lkw735FzNhrY
 lqDomB+8jRq1muHdUktoe+sJR6SKqr/fzOTToIiW5b+kH9MxRAxK0dl527Y5VT2Y
 wioHcTYOTS7ivYyH0I+vgpU/UQStJLvQChg7mwKo7vVcLjxr31dXRLM1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=BX2e0Wp+MlEL1n2HYuh/vceVCaIgtr14nGxbl0HHHGI=; b=eTu3bON2
 /h/WzpN/sQHB6Y5vimBXaM+pjszV1jMkDKnwddWnhMMLJmyNz61U69iXfxZvVGtd
 jDt63LmQjEcx2/29Ea0gCmrBY60kpCEGG7szP6ABAHvsWhJdDJE4dN1cj2FSE9qZ
 Uxg3cDEElYNWwdY4AVcU4ADqvvilJm1r1EsEEQZLiGoJfIf8SNt3k8f89kr4C1KX
 shJcqQbaVGkwZssowcm2JQQjaIlsN2GM03fMT8Xu1GCJYfXDRE+iJYr5Tkvrcm4U
 k13hdekcY1x5BDqywyHv3vVFHd+qFgrhQvtJKBPQaQ31uSI9iyqVeO2ePQ/2bEoB
 9AJzk4BNPeQOVg==
X-ME-Sender: <xms:ZcfbX7_kHykSF1NGLAXJIWFyvohYO8aXVi-NckRT7jfh34lnd0vQhA>
 <xme:ZcfbX3qAoRSGlszrwPIZJj-xJLhiioSwI0N0hadRLC6TJogyTkq2nymaPQ8wU6OFz
 ZRkA5owgRI7NmSxn6k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelgedgudegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ZcfbX15Fzr__gXhTWwTHAr_FPSjCiN3Vxv5ki4K59Mmdc_rTGDl5Qw>
 <xmx:ZcfbX_PpeDWXASah7h96bQKRIrAspVTV_nVNBHeL6EIsJz3WA28ZTw>
 <xmx:ZcfbX_P3rtvJDTu6lSx9KaAYaMe5H1aGdygp1wPiQHPAXcX9EJ5niw>
 <xmx:ZcfbX2ziPtm74Bs-3mHUzBb7e85Hnt3w_P5i8OshVn0bGxU-voX2dA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C0888240064;
 Thu, 17 Dec 2020 16:02:27 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 3/3] hw/block/nvme: end-to-end data protection
Date: Thu, 17 Dec 2020 22:02:22 +0100
Message-Id: <20201217210222.779619-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217210222.779619-1-its@irrelevant.dk>
References: <20201217210222.779619-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Add support for namespaces formatted with protection information in the
form of the Data Integrity Field (DIF) where the protection information
is contiguous with the logical block data (extended logical blocks). The
type of end-to-end data protection (i.e. Type 1, Type 2 or Type 3) is
selected with the `pi` nvme-ns device parameter. By defalt, the 8 bytes
of protection information is transferred as the last eight bytes of the
metadata. The `pil` nvme-ns device parameter can be set to 1 to store
this in the first eight bytes instead.

With extended logical blocks, there is no way of reliably determining
that a block is deallocated or unwritten so this implementation requires
the Application and Reference Tag field values to be initialized to
0xffff and 0xffffffff respectively, indicating that the protection
information shall not be checked. To instruct the device to perform this
initialization, the `pi_init` boolean nvme-ns device parameter is used.

The interleaved memory transfer function and using the T10 DIF CRC
lookup table from the Linux kernel is resurrected ideas from Keith's old
dev tree.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h    |   3 +
 hw/block/nvme.h       |  36 ++++
 include/block/nvme.h  |  24 ++-
 hw/block/nvme-ns.c    |  45 ++++
 hw/block/nvme.c       | 477 +++++++++++++++++++++++++++++++++++++++++-
 hw/block/trace-events |  10 +
 6 files changed, 587 insertions(+), 8 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 1e621fb130a3..5cd39c859472 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -22,6 +22,9 @@
 typedef struct NvmeNamespaceParams {
     uint32_t nsid;
     uint16_t ms;
+    uint8_t  pi;
+    uint8_t  pil;
+    bool     pi_init;
 } NvmeNamespaceParams;
 
 typedef struct NvmeNamespace {
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 574333caa3f9..38f7609207b3 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -182,6 +182,42 @@ static inline NvmeCtrl *nvme_ctrl(NvmeRequest *req)
     return sq->ctrl;
 }
 
+/* from Linux kernel (crypto/crct10dif_common.c) */
+static const uint16_t t10_dif_crc_table[256] = {
+    0x0000, 0x8BB7, 0x9CD9, 0x176E, 0xB205, 0x39B2, 0x2EDC, 0xA56B,
+    0xEFBD, 0x640A, 0x7364, 0xF8D3, 0x5DB8, 0xD60F, 0xC161, 0x4AD6,
+    0x54CD, 0xDF7A, 0xC814, 0x43A3, 0xE6C8, 0x6D7F, 0x7A11, 0xF1A6,
+    0xBB70, 0x30C7, 0x27A9, 0xAC1E, 0x0975, 0x82C2, 0x95AC, 0x1E1B,
+    0xA99A, 0x222D, 0x3543, 0xBEF4, 0x1B9F, 0x9028, 0x8746, 0x0CF1,
+    0x4627, 0xCD90, 0xDAFE, 0x5149, 0xF422, 0x7F95, 0x68FB, 0xE34C,
+    0xFD57, 0x76E0, 0x618E, 0xEA39, 0x4F52, 0xC4E5, 0xD38B, 0x583C,
+    0x12EA, 0x995D, 0x8E33, 0x0584, 0xA0EF, 0x2B58, 0x3C36, 0xB781,
+    0xD883, 0x5334, 0x445A, 0xCFED, 0x6A86, 0xE131, 0xF65F, 0x7DE8,
+    0x373E, 0xBC89, 0xABE7, 0x2050, 0x853B, 0x0E8C, 0x19E2, 0x9255,
+    0x8C4E, 0x07F9, 0x1097, 0x9B20, 0x3E4B, 0xB5FC, 0xA292, 0x2925,
+    0x63F3, 0xE844, 0xFF2A, 0x749D, 0xD1F6, 0x5A41, 0x4D2F, 0xC698,
+    0x7119, 0xFAAE, 0xEDC0, 0x6677, 0xC31C, 0x48AB, 0x5FC5, 0xD472,
+    0x9EA4, 0x1513, 0x027D, 0x89CA, 0x2CA1, 0xA716, 0xB078, 0x3BCF,
+    0x25D4, 0xAE63, 0xB90D, 0x32BA, 0x97D1, 0x1C66, 0x0B08, 0x80BF,
+    0xCA69, 0x41DE, 0x56B0, 0xDD07, 0x786C, 0xF3DB, 0xE4B5, 0x6F02,
+    0x3AB1, 0xB106, 0xA668, 0x2DDF, 0x88B4, 0x0303, 0x146D, 0x9FDA,
+    0xD50C, 0x5EBB, 0x49D5, 0xC262, 0x6709, 0xECBE, 0xFBD0, 0x7067,
+    0x6E7C, 0xE5CB, 0xF2A5, 0x7912, 0xDC79, 0x57CE, 0x40A0, 0xCB17,
+    0x81C1, 0x0A76, 0x1D18, 0x96AF, 0x33C4, 0xB873, 0xAF1D, 0x24AA,
+    0x932B, 0x189C, 0x0FF2, 0x8445, 0x212E, 0xAA99, 0xBDF7, 0x3640,
+    0x7C96, 0xF721, 0xE04F, 0x6BF8, 0xCE93, 0x4524, 0x524A, 0xD9FD,
+    0xC7E6, 0x4C51, 0x5B3F, 0xD088, 0x75E3, 0xFE54, 0xE93A, 0x628D,
+    0x285B, 0xA3EC, 0xB482, 0x3F35, 0x9A5E, 0x11E9, 0x0687, 0x8D30,
+    0xE232, 0x6985, 0x7EEB, 0xF55C, 0x5037, 0xDB80, 0xCCEE, 0x4759,
+    0x0D8F, 0x8638, 0x9156, 0x1AE1, 0xBF8A, 0x343D, 0x2353, 0xA8E4,
+    0xB6FF, 0x3D48, 0x2A26, 0xA191, 0x04FA, 0x8F4D, 0x9823, 0x1394,
+    0x5942, 0xD2F5, 0xC59B, 0x4E2C, 0xEB47, 0x60F0, 0x779E, 0xFC29,
+    0x4BA8, 0xC01F, 0xD771, 0x5CC6, 0xF9AD, 0x721A, 0x6574, 0xEEC3,
+    0xA415, 0x2FA2, 0x38CC, 0xB37B, 0x1610, 0x9DA7, 0x8AC9, 0x017E,
+    0x1F65, 0x94D2, 0x83BC, 0x080B, 0xAD60, 0x26D7, 0x31B9, 0xBA0E,
+    0xF0D8, 0x7B6F, 0x6C01, 0xE7B6, 0x42DD, 0xC96A, 0xDE04, 0x55B3
+};
+
 int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
 
 #endif /* HW_NVME_H */
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 11ac1c2b7dfb..8888eb041ac0 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -583,8 +583,11 @@ enum {
     NVME_RW_PRINFO_PRCHK_GUARD  = 1 << 12,
     NVME_RW_PRINFO_PRCHK_APP    = 1 << 11,
     NVME_RW_PRINFO_PRCHK_REF    = 1 << 10,
+    NVME_RW_PRINFO_PRCHK_MASK   = 7 << 10,
 };
 
+#define NVME_RW_PRINFO(control) ((control >> 10) & 0xf)
+
 typedef struct QEMU_PACKED NvmeDsmCmd {
     uint8_t     opcode;
     uint8_t     flags;
@@ -1051,14 +1054,22 @@ enum NvmeNsIdentifierType {
 #define NVME_ID_NS_DPC_TYPE_MASK            0x7
 
 enum NvmeIdNsDps {
-    DPS_TYPE_NONE   = 0,
-    DPS_TYPE_1      = 1,
-    DPS_TYPE_2      = 2,
-    DPS_TYPE_3      = 3,
-    DPS_TYPE_MASK   = 0x7,
-    DPS_FIRST_EIGHT = 8,
+    NVME_ID_NS_DPS_TYPE_NONE   = 0,
+    NVME_ID_NS_DPS_TYPE_1      = 1,
+    NVME_ID_NS_DPS_TYPE_2      = 2,
+    NVME_ID_NS_DPS_TYPE_3      = 3,
+    NVME_ID_NS_DPS_TYPE_MASK   = 0x7,
+    NVME_ID_NS_DPS_FIRST_EIGHT = 8,
 };
 
+#define NVME_ID_NS_DPS_TYPE(dps) (dps & NVME_ID_NS_DPS_TYPE_MASK)
+
+typedef struct NvmeDifTuple {
+    uint16_t guard;
+    uint16_t apptag;
+    uint32_t reftag;
+} NvmeDifTuple;
+
 static inline void _nvme_check_size(void)
 {
     QEMU_BUILD_BUG_ON(sizeof(NvmeBar) != 4096);
@@ -1080,5 +1091,6 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNs) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSglDescriptor) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) != 4);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeDifTuple) != 8);
 }
 #endif
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index a9785a12eb13..0e519d42272c 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -25,11 +25,44 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-core.h"
 
+#include "trace.h"
+
 #include "nvme.h"
 #include "nvme-ns.h"
 
 #define MIN_DISCARD_GRANULARITY (4 * KiB)
 
+static int nvme_ns_init_pi(NvmeNamespace *ns, Error **errp)
+{
+    int nlbas = nvme_ns_nlbas(ns);
+    uint16_t pil = ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT ?
+        0 : nvme_ns_ms(ns) - sizeof(NvmeDifTuple);
+    int64_t offset = 1 << nvme_ns_lbads(ns), stride = nvme_l2b(ns, 1);
+    int i, ret;
+
+    NvmeDifTuple dif = {
+        .apptag = 0xffff,
+        .reftag = 0xffffffff,
+    };
+
+    for (i = 0; i < nlbas; i++) {
+        if (i && i % 0x1000 == 0) {
+            trace_pci_nvme_ns_init_pi(i, nlbas);
+        }
+
+        ret = blk_pwrite(ns->blkconf.blk, i * stride + offset + pil, &dif, sizeof(dif),
+                         0);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "could not write");
+            return -1;
+        }
+    }
+
+    trace_pci_nvme_ns_init_pi(nlbas, nlbas);
+
+    return 0;
+}
+
 static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 {
     BlockDriverInfo bdi;
@@ -54,6 +87,15 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     } else {
         id_ns->mc = 0x1;
         id_ns->flbas |= 0x10;
+
+        id_ns->dpc = 0x1f;
+        id_ns->dps = (ns->params.pil << 3) | ns->params.pi;
+
+        if (ns->params.pi_init) {
+            if (nvme_ns_init_pi(ns, errp)) {
+                return -1;
+            }
+        }
     }
 
     id_ns->nsze = cpu_to_le64(nvme_ns_nlbas(ns));
@@ -163,6 +205,9 @@ static Property nvme_ns_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
     DEFINE_PROP_UINT16("ms", NvmeNamespace, params.ms, 0),
+    DEFINE_PROP_UINT8("pi", NvmeNamespace, params.pi, 0),
+    DEFINE_PROP_UINT8("pil", NvmeNamespace, params.pil, 0),
+    DEFINE_PROP_BOOL("pi_init", NvmeNamespace, params.pi_init, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 8d580c121bcc..c60d24704b96 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -158,6 +158,22 @@ static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
     return pci_dma_read(&n->parent_obj, addr, buf, size);
 }
 
+static int nvme_addr_write(NvmeCtrl *n, hwaddr addr, void *buf, int size)
+{
+    hwaddr hi = addr + size - 1;
+    if (hi < addr) {
+        return 1;
+    }
+
+    if (n->bar.cmbsz && nvme_addr_is_cmb(n, addr) && nvme_addr_is_cmb(n, hi)) {
+        memcpy(nvme_addr_to_cmb(n, addr), buf, size);
+        return 0;
+    }
+
+    return pci_dma_write(&n->parent_obj, addr, buf, size);
+}
+
+
 static bool nvme_nsid_valid(NvmeCtrl *n, uint32_t nsid)
 {
     return nsid && (nsid == NVME_NSID_BROADCAST || nsid <= n->num_namespaces);
@@ -725,6 +741,60 @@ static uint16_t nvme_tx_iov(uint8_t *ptr, uint32_t len, QEMUIOVector *iov,
     return NVME_SUCCESS;
 }
 
+static uint16_t nvme_tx_interleaved(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+                                    uint32_t bytes, uint16_t skip_bytes,
+                                    NvmeTxDirection dir, NvmeRequest *req)
+{
+    hwaddr addr;
+    int i = 0;
+    int64_t offset = 0;
+    uint32_t trans_len, count = bytes;
+
+    /* assert that exactly one of qsg and iov carries data */
+    assert((req->qsg.nsg > 0) != (req->iov.niov > 0));
+
+    while (len) {
+        trans_len = MIN(len, count);
+
+        if (req->qsg.nsg > 0) {
+            trans_len = MIN(trans_len, req->qsg.sg[i].len - offset);
+            addr = req->qsg.sg[i].base + offset;
+        } else {
+            trans_len = MIN(trans_len, req->iov.iov[i].iov_len - offset);
+            addr = (hwaddr)req->iov.iov[i].iov_base + offset;
+        }
+
+        if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
+            if (nvme_addr_read(n, addr, ptr, trans_len)) {
+                return NVME_DATA_TRAS_ERROR;
+            }
+        } else {
+            if (nvme_addr_write(n, addr, ptr, trans_len)) {
+                return NVME_DATA_TRAS_ERROR;
+            }
+        }
+
+        ptr += trans_len;
+        len -= trans_len;
+        count -= trans_len;
+        offset += trans_len;
+
+        if (count == 0) {
+            count = bytes;
+            ptr += skip_bytes;
+            len -= skip_bytes;
+        }
+
+        if ((req->qsg.nsg > 0 && offset == req->qsg.sg[i].len) ||
+            (req->iov.niov > 0 && offset == req->iov.iov[i].iov_len)) {
+            offset = 0;
+            i++;
+        }
+    }
+
+    return NVME_SUCCESS;
+}
+
 static uint16_t nvme_tx(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
                         NvmeTxDirection dir, NvmeRequest *req)
 {
@@ -961,6 +1031,143 @@ static uint16_t nvme_check_dulbe(NvmeNamespace *ns, uint64_t slba,
     return NVME_SUCCESS;
 }
 
+static uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint16_t ctrl,
+                                  uint64_t slba, uint32_t reftag)
+{
+    if ((NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) == NVME_ID_NS_DPS_TYPE_1) &&
+        (slba & 0xffffffff) != reftag) {
+        return NVME_INVALID_PROT_INFO | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
+/* from Linux kernel (crypto/crct10dif_common.c) */
+static uint16_t crc_t10dif(const unsigned char *buffer, size_t len)
+{
+    uint16_t crc = 0;
+    unsigned int i;
+
+    for (i = 0; i < len; i++) {
+        crc = (crc << 8) ^ t10_dif_crc_table[((crc >> 8) ^ buffer[i]) & 0xff];
+    }
+
+    return crc;
+}
+
+static void nvme_e2e_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf,
+                                        size_t len, uint16_t apptag,
+                                        uint32_t reftag)
+{
+    uint8_t *end = buf + len;
+    size_t lba_size = nvme_l2b(ns, 1);
+    size_t chksum_len = 1 << nvme_ns_lbads(ns);
+
+    if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
+        chksum_len += nvme_ns_ms(ns) - sizeof(NvmeDifTuple);
+    }
+
+    trace_pci_nvme_e2e_pract_generate_dif(len, lba_size, chksum_len, apptag,
+                                          reftag);
+
+    for (; buf < end; buf += lba_size) {
+        NvmeDifTuple *dif = (NvmeDifTuple *)(buf + chksum_len);
+
+        dif->guard = cpu_to_be16(crc_t10dif(buf, chksum_len));
+        dif->apptag = cpu_to_be32(apptag);
+        dif->reftag = cpu_to_be32(reftag);
+
+        if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) != NVME_ID_NS_DPS_TYPE_3) {
+            reftag++;
+        }
+    }
+}
+
+static uint16_t nvme_e2e_prchk(NvmeNamespace *ns, NvmeDifTuple *dif,
+                               uint8_t *buf, size_t len, uint16_t ctrl,
+                               uint16_t apptag, uint16_t appmask,
+                               uint32_t reftag)
+{
+    switch (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+    case NVME_ID_NS_DPS_TYPE_3:
+        if (be32_to_cpu(dif->reftag) != 0xffffffff) {
+            break;
+        }
+
+        /* fallthrough */
+    case NVME_ID_NS_DPS_TYPE_1:
+    case NVME_ID_NS_DPS_TYPE_2:
+        if (be16_to_cpu(dif->apptag) != 0xffff) {
+            break;
+        }
+
+        trace_pci_nvme_e2e_prchk_disabled(be16_to_cpu(dif->apptag),
+                                          be32_to_cpu(dif->reftag));
+
+        return NVME_SUCCESS;
+    }
+
+    if (ctrl & NVME_RW_PRINFO_PRCHK_GUARD) {
+        uint16_t crc = crc_t10dif(buf, len);
+        trace_pci_nvme_e2e_prchk_guard(be16_to_cpu(dif->guard), crc);
+
+        if (be16_to_cpu(dif->guard) != crc) {
+            return NVME_E2E_GUARD_ERROR;
+        }
+    }
+
+    if (ctrl & NVME_RW_PRINFO_PRCHK_APP) {
+        trace_pci_nvme_e2e_prchk_apptag(be16_to_cpu(dif->apptag), apptag,
+                                        appmask);
+
+        if ((be16_to_cpu(dif->apptag) & appmask) != (apptag & appmask)) {
+            return NVME_E2E_APP_ERROR;
+        }
+    }
+
+    if (ctrl & NVME_RW_PRINFO_PRCHK_REF) {
+        trace_pci_nvme_e2e_prchk_reftag(be32_to_cpu(dif->reftag), reftag);
+
+        if (be32_to_cpu(dif->reftag) != reftag) {
+            return NVME_E2E_REF_ERROR;
+        }
+    }
+
+    return NVME_SUCCESS;
+}
+
+static uint16_t nvme_e2e_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
+                               uint16_t ctrl, uint16_t apptag,
+                               uint16_t appmask, uint32_t reftag)
+{
+    uint8_t *end = buf + len;
+    size_t lba_size = nvme_l2b(ns, 1);
+    size_t chksum_len = 1 << nvme_ns_lbads(ns);
+    uint16_t status;
+
+    if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
+        chksum_len += nvme_ns_ms(ns) - sizeof(NvmeDifTuple);
+    }
+
+    trace_pci_nvme_e2e_check(NVME_RW_PRINFO(ctrl), chksum_len);
+
+    for (; buf < end; buf += lba_size) {
+        NvmeDifTuple *dif = (NvmeDifTuple *)(buf + chksum_len);
+
+        status = nvme_e2e_prchk(ns, dif, buf, chksum_len, ctrl, apptag,
+                                appmask, reftag);
+        if (status) {
+            return status;
+        }
+
+        if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) != NVME_ID_NS_DPS_TYPE_3) {
+            reftag++;
+        }
+    }
+
+    return NVME_SUCCESS;
+}
+
 static void nvme_aio_err(NvmeRequest *req, int ret)
 {
     uint16_t status = NVME_SUCCESS;
@@ -980,7 +1187,7 @@ static void nvme_aio_err(NvmeRequest *req, int ret)
         break;
     }
 
-    trace_pci_nvme_err_aio(nvme_cid(req), strerror(ret), status);
+    trace_pci_nvme_err_aio(nvme_cid(req), strerror(-ret), status);
 
     error_setg_errno(&local_err, -ret, "aio failed");
     error_report_err(local_err);
@@ -1017,6 +1224,73 @@ static void nvme_rw_cb(void *opaque, int ret)
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
+struct nvme_e2e_ctx {
+    NvmeRequest *req;
+    QEMUIOVector iov;
+    uint8_t *bounce;
+};
+
+static void nvme_e2e_rw_cb(void *opaque, int ret)
+{
+    struct nvme_e2e_ctx *ctx = opaque;
+    NvmeRequest *req = ctx->req;
+
+    trace_pci_nvme_e2e_rw_cb(nvme_cid(req));
+
+    qemu_iovec_destroy(&ctx->iov);
+    g_free(ctx->bounce);
+    g_free(ctx);
+
+    nvme_rw_cb(req, ret);
+}
+
+static void nvme_e2e_rw_check_cb(void *opaque, int ret)
+{
+    struct nvme_e2e_ctx *ctx = opaque;
+    NvmeRequest *req = ctx->req;
+    NvmeNamespace *ns = req->ns;
+    NvmeCtrl *n = nvme_ctrl(req);
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
+    uint16_t ctrl = le16_to_cpu(rw->control);
+    uint16_t apptag = le16_to_cpu(rw->apptag);
+    uint16_t appmask = le16_to_cpu(rw->appmask);
+    uint32_t reftag = le32_to_cpu(rw->reftag);
+    uint16_t status;
+
+    trace_pci_nvme_e2e_rw_check_cb(nvme_cid(req), NVME_RW_PRINFO(ctrl), apptag,
+                                   appmask, reftag);
+
+    if (ret) {
+        goto out;
+    }
+
+    status = nvme_e2e_check(ns, ctx->bounce, ctx->iov.size, ctrl, apptag,
+                            appmask, reftag);
+    if (status) {
+        req->status = status;
+        goto out;
+    }
+
+    if (ctrl & NVME_RW_PRINFO_PRACT && nvme_ns_ms(ns) == 8) {
+        size_t lba_size = 1 << nvme_ns_lbads(ns);
+
+        status = nvme_tx_interleaved(n, ctx->bounce, nvme_l2b(ns, nlb),
+                                     lba_size, sizeof(NvmeDifTuple),
+                                     NVME_TX_DIRECTION_FROM_DEVICE, req);
+    } else {
+        status = nvme_tx(n, ctx->bounce, nvme_l2b(ns, nlb),
+                         NVME_TX_DIRECTION_FROM_DEVICE, req);
+    }
+
+    if (status) {
+        req->status = status;
+    }
+
+out:
+    nvme_e2e_rw_cb(ctx, ret);
+}
+
 static void nvme_aio_discard_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
@@ -1047,6 +1321,12 @@ static void nvme_compare_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
     NvmeNamespace *ns = req->ns;
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
+    uint16_t ctrl = le16_to_cpu(rw->control);
+    uint16_t apptag = le16_to_cpu(rw->apptag);
+    uint16_t appmask = le16_to_cpu(rw->appmask);
+    uint32_t reftag = le32_to_cpu(rw->reftag);
     struct nvme_compare_ctx *ctx = req->opaque;
     g_autofree uint8_t *buf = NULL;
     uint16_t status;
@@ -1061,6 +1341,15 @@ static void nvme_compare_cb(void *opaque, int ret)
         goto out;
     }
 
+    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+        status = nvme_e2e_check(ns, ctx->bounce, ctx->iov.size, ctrl,
+                                apptag, appmask, reftag);
+        if (status) {
+            req->status = status;
+            goto out;
+        }
+    }
+
     buf = g_malloc(ctx->len);
 
     status = nvme_h2c(nvme_ctrl(req), buf, ctx->len, req);
@@ -1069,6 +1358,50 @@ static void nvme_compare_cb(void *opaque, int ret)
         goto out;
     }
 
+    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+        size_t stride = nvme_l2b(ns, 1);
+        uint16_t ms = nvme_ns_ms(ns);
+        uint64_t pos = 0;
+        bool first = !!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT);
+        size_t cmp_len;
+
+        status = nvme_e2e_check(ns, buf, nlb, ctrl, apptag, appmask, reftag);
+        if (status) {
+            req->status = status;
+            goto out;
+        }
+
+        /*
+         * When formatted with protection information, do not compare the DIF
+         * tuple.
+         */
+        cmp_len = 1 << nvme_ns_lbads(ns);
+        if (!first) {
+            cmp_len += ms - sizeof(NvmeDifTuple);
+        }
+
+        for (int i = 0; i < nlb; i++) {
+            if (memcmp(buf + pos, ctx->bounce + pos, cmp_len)) {
+                req->status = NVME_CMP_FAILURE;
+                break;
+            }
+
+            if (!first) {
+                pos += stride;
+                continue;
+            }
+
+            pos += cmp_len + sizeof(NvmeDifTuple);
+            if (memcmp(buf + pos, ctx->bounce + pos,
+                       ms - sizeof(NvmeDifTuple))) {
+                req->status = NVME_CMP_FAILURE;
+                break;
+            }
+        }
+
+        goto out;
+    }
+
     if (memcmp(buf, ctx->bounce, ctx->len)) {
         req->status = NVME_CMP_FAILURE;
     }
@@ -1162,12 +1495,24 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
     size_t len = nvme_l2b(ns, nlb);
     int64_t offset = nvme_l2b(ns, slba);
+    uint16_t ctrl = le16_to_cpu(rw->control);
+    uint32_t reftag = le32_to_cpu(rw->reftag);
     uint8_t *bounce = NULL;
     struct nvme_compare_ctx *ctx = NULL;
     uint16_t status;
 
     trace_pci_nvme_compare(nvme_cid(req), nvme_nsid(ns), slba, nlb);
 
+    status = nvme_check_prinfo(ns, ctrl, slba, reftag);
+    if (status) {
+        return status;
+    }
+
+    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) &&
+        (ctrl & NVME_RW_PRINFO_PRACT)) {
+        return NVME_INVALID_PROT_INFO | NVME_DNR;
+    }
+
     status = nvme_check_mdts(n, len);
     if (status) {
         trace_pci_nvme_err_mdts(nvme_cid(req), len);
@@ -1220,10 +1565,23 @@ static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeRequest *req)
     uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
     uint64_t offset = nvme_l2b(ns, slba);
     uint32_t count = nvme_l2b(ns, nlb);
+    uint16_t ctrl = le16_to_cpu(rw->control);
+    uint16_t apptag = le16_to_cpu(rw->apptag);
+    uint32_t reftag = le32_to_cpu(rw->reftag);
+    struct nvme_e2e_ctx *ctx;
     uint16_t status;
 
     trace_pci_nvme_write_zeroes(nvme_cid(req), nvme_nsid(ns), slba, nlb);
 
+    if (ctrl & NVME_RW_PRINFO_PRCHK_MASK) {
+        return NVME_INVALID_PROT_INFO | NVME_DNR;
+    }
+
+    status = nvme_check_prinfo(ns, ctrl, slba, reftag);
+    if (status) {
+        return status;
+    }
+
     status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
         trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
@@ -1232,19 +1590,118 @@ static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeRequest *req)
 
     block_acct_start(blk_get_stats(req->ns->blkconf.blk), &req->acct, 0,
                      BLOCK_ACCT_WRITE);
+
+    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) && (ctrl & NVME_RW_PRINFO_PRACT)) {
+        ctx = g_new(struct nvme_e2e_ctx, 1);
+        ctx->req = req;
+        ctx->bounce = g_malloc0(count);
+
+        qemu_iovec_init(&ctx->iov, 1);
+        qemu_iovec_add(&ctx->iov, ctx->bounce, count);
+
+        /* splice generated protection information into the buffer */
+        nvme_e2e_pract_generate_dif(ns, ctx->bounce, count, apptag, reftag);
+
+        req->aiocb = blk_aio_pwritev(ns->blkconf.blk, offset, &ctx->iov, 0,
+                                     nvme_e2e_rw_cb, ctx);
+
+        return NVME_NO_COMPLETE;
+    }
+
     req->aiocb = blk_aio_pwrite_zeroes(req->ns->blkconf.blk, offset, count,
                                        BDRV_REQ_MAY_UNMAP, nvme_rw_cb, req);
     return NVME_NO_COMPLETE;
 }
 
+static uint16_t nvme_e2e_rw(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    NvmeNamespace *ns = req->ns;
+    uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
+    uint64_t slba = le64_to_cpu(rw->slba);
+    size_t len = nvme_l2b(ns, nlb);
+    size_t offset = nvme_l2b(ns, slba);
+    uint16_t ctrl = le16_to_cpu(rw->control);
+    uint16_t apptag = le16_to_cpu(rw->apptag);
+    uint16_t appmask = le16_to_cpu(rw->appmask);
+    uint32_t reftag = le32_to_cpu(rw->reftag);
+    struct nvme_e2e_ctx *ctx;
+    uint16_t status;
+
+    trace_pci_nvme_e2e_rw(!!(ctrl & NVME_RW_PRINFO_PRACT));
+
+    status = nvme_check_prinfo(ns, ctrl, slba, reftag);
+    if (status) {
+        return status;
+    }
+
+    ctx = g_new(struct nvme_e2e_ctx, 1);
+    ctx->req = req;
+    ctx->bounce = g_malloc(len);
+
+    qemu_iovec_init(&ctx->iov, 1);
+    qemu_iovec_add(&ctx->iov, ctx->bounce, len);
+
+    if (req->cmd.opcode == NVME_CMD_READ) {
+        req->aiocb = blk_aio_preadv(ns->blkconf.blk, offset, &ctx->iov, 0,
+                                    nvme_e2e_rw_check_cb, ctx);
+        return NVME_NO_COMPLETE;
+    }
+
+    if (ctrl & NVME_RW_PRINFO_PRACT && nvme_ns_ms(ns) == 8) {
+        size_t lba_size = 1 << nvme_ns_lbads(ns);
+
+        /*
+         * For writes, transfer logical block data interleaved into a metadata
+         * extended buffer and splice the generated protection information into
+         * it afterwards.
+         */
+        status = nvme_tx_interleaved(n, ctx->bounce, len, lba_size, 8,
+                                     NVME_TX_DIRECTION_TO_DEVICE, req);
+        if (status) {
+            goto err;
+        }
+    } else {
+        status = nvme_tx(n, ctx->bounce, len, NVME_TX_DIRECTION_TO_DEVICE,
+                         req);
+        if (status) {
+            goto err;
+        }
+    }
+
+    if (ctrl & NVME_RW_PRINFO_PRACT) {
+        /* splice generated protection information into the buffer */
+        nvme_e2e_pract_generate_dif(ns, ctx->bounce, len, apptag, reftag);
+    } else {
+        status = nvme_e2e_check(ns, ctx->bounce, len, ctrl, apptag, appmask,
+                                reftag);
+        if (status) {
+            goto err;
+        }
+    }
+
+    req->aiocb = blk_aio_pwritev(ns->blkconf.blk, offset, &ctx->iov, 0,
+                                 nvme_e2e_rw_cb, ctx);
+
+    return NVME_NO_COMPLETE;
+
+err:
+    g_free(ctx->bounce);
+    g_free(ctx);
+
+    return status;
+}
+
 static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
     uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
     uint64_t slba = le64_to_cpu(rw->slba);
+    uint16_t ctrl = le16_to_cpu(rw->control);
 
     uint64_t data_size = nvme_l2b(ns, nlb);
+    uint64_t real_data_size = data_size;
     uint64_t data_offset = nvme_l2b(ns, slba);
     enum BlockAcctType acct = req->cmd.opcode == NVME_CMD_WRITE ?
         BLOCK_ACCT_WRITE : BLOCK_ACCT_READ;
@@ -1252,6 +1709,17 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
     uint16_t status;
     uint32_t sector_size;
 
+    /*
+     * If the namespace is formatted with protecting information, the number of
+     * metadata bytes is exactly 8 and the PRACT field is set, then the
+     * metadata is not resident in the host buffer.
+     */
+    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) &&
+        (nvme_ns_ms(ns) == sizeof(NvmeDifTuple)) &&
+        (ctrl & NVME_RW_PRINFO_PRACT)) {
+        data_size -= nlb << 3;
+    }
+
     trace_pci_nvme_rw(nvme_cid(req), nvme_io_opc_str(rw->opcode),
                       nvme_nsid(ns), nlb, data_size, slba);
 
@@ -1281,7 +1749,12 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
-    block_acct_start(blk_get_stats(blk), &req->acct, data_size, acct);
+    block_acct_start(blk_get_stats(blk), &req->acct, real_data_size, acct);
+
+    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+        return nvme_e2e_rw(n, req);
+    }
+
     if (req->qsg.sg) {
         sector_size = nvme_l2b(ns, 1);
         if (acct == BLOCK_ACCT_WRITE) {
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 68a4c8ed35e0..0ae5676cc28a 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -30,6 +30,7 @@ hd_geometry_guess(void *blk, uint32_t cyls, uint32_t heads, uint32_t secs, int t
 # nvme.c
 # nvme traces for successful events
 pci_nvme_register_namespace(uint32_t nsid) "nsid %"PRIu32""
+pci_nvme_ns_init_pi(int blocks, int total) "blocks %d/%d"
 pci_nvme_irq_msix(uint32_t vector) "raising MSI-X IRQ vector %u"
 pci_nvme_irq_pin(void) "pulsing IRQ pin"
 pci_nvme_irq_masked(void) "IRQ is masked"
@@ -42,6 +43,15 @@ pci_nvme_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opcode, cons
 pci_nvme_admin_cmd(uint16_t cid, uint16_t sqid, uint8_t opcode, const char *opname) "cid %"PRIu16" sqid %"PRIu16" opc 0x%"PRIx8" opname '%s'"
 pci_nvme_rw(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" opname '%s' nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
+pci_nvme_e2e_rw(uint8_t pract) "pract 0x%"PRIx8""
+pci_nvme_e2e_rw_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_e2e_rw_check_cb(uint16_t cid, uint8_t prinfo, uint16_t apptag, uint16_t appmask, uint32_t reftag) "cid %"PRIu16" prinfo 0x%"PRIx8" apptag 0x%"PRIx16" appmask 0x%"PRIx16" reftag 0x%"PRIx32""
+pci_nvme_e2e_pract_generate_dif(size_t len, size_t lba_size, size_t chksum_len, uint16_t apptag, uint32_t reftag) "len %zu lba_size %zu chksum_len %zu apptag 0x%"PRIx16" reftag 0x%"PRIx32""
+pci_nvme_e2e_check(uint8_t prinfo, uint16_t chksum_len) "prinfo 0x%"PRIx8" chksum_len %"PRIu16""
+pci_nvme_e2e_prchk_disabled(uint16_t apptag, uint32_t reftag) "apptag 0x%"PRIx16" reftag 0x%"PRIx32""
+pci_nvme_e2e_prchk_guard(uint16_t guard, uint16_t crc) "guard 0x%"PRIx16" crc 0x%"PRIx16""
+pci_nvme_e2e_prchk_apptag(uint16_t apptag, uint16_t elbat, uint16_t elbatm) "apptag 0x%"PRIx16" elbat 0x%"PRIx16" elbatm 0x%"PRIx16""
+pci_nvme_e2e_prchk_reftag(uint32_t reftag, uint32_t elbrt) "reftag 0x%"PRIx32" elbrt 0x%"PRIx32""
 pci_nvme_write_zeroes(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
 pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%x zeroed %d"
 pci_nvme_dsm(uint16_t cid, uint32_t nsid, uint32_t nr, uint32_t attr) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu32" attr 0x%"PRIx32""
-- 
2.29.2


