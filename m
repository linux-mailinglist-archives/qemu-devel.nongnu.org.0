Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B0131B342
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 00:21:37 +0100 (CET)
Received: from localhost ([::1]:51950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBQhr-0006cD-Ui
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 18:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lBQQ1-0004Q5-LW; Sun, 14 Feb 2021 18:03:10 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:42559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lBQPp-0001pQ-Mk; Sun, 14 Feb 2021 18:03:09 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CA7B35C0098;
 Sun, 14 Feb 2021 18:02:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 14 Feb 2021 18:02:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=uNNqZZQpI2H17
 c0oP5vYdCWGybywNbpcuWbkYbjnuyw=; b=1b7uaIV2TOSq7P80U6yDAjUJuq+GR
 Ev2xkRaWwG/yFWLgzO498B94aA9g8iqnhScUBwDaqJpTUNqcOIXnN2UMHzX+cBGC
 f41dkRGwexSbwJ5qS3UfhZovFVL6aiGflkPmzNUOrh1XHWbEeNyun8FZrvTeBWxz
 NKU6GvvNF0R4+ltQxAQwBLJWVYwiQRKaNhdzZSommgGcoQhJF0TR2VYBNSQZdrUe
 ClZu8wN3jj/BLIKLAc2VXdSHhx1syfcUSsPlb2+gedxWKpnLJ7joG+FN6VjQl/j5
 AwlJ3Uk1rsg5QwhuvQeeXIy7kE2wJM6RXyaCEGrkEmDVGqCNGbblkQeoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=uNNqZZQpI2H17c0oP5vYdCWGybywNbpcuWbkYbjnuyw=; b=F6K3VcZo
 qYKq/F6aRyr4VdGAR9p+c57OSwgxU7Uvv+rr6gD+Nx+XEFU8Et2EYFn0QeYnbFL/
 nBwDWGkwTq7sdJBoN5nDOxjc/d/wut02UJWqi37iW/AS9jiy/60bRior5Tv/OFaG
 bmJBmvG+9HBT7dyjFfdWHngQaiLSOUnNe3TAglqFnKWeyFq2n7LyfpK/nCbFgoit
 6kQ2V15oZ8ZlZ69hZGOH6cPg7h6gK8e9UeZ2jyoQx0N3zqzOWskMKNZr52F58LlA
 Tq+WTL/VZExgPr8roxQ4WLRzZDM+tVjHoi+db9YT+bXmsBY3TBS+IPdtkTAnqYxv
 51aSXQZdOf/m8w==
X-ME-Sender: <xms:IKwpYJFxZM9_Mja2JHVY4nhH7sne3JQGnYEqPTQk63bJbfqy8eCmXg>
 <xme:IKwpYOW8bkMsLGvQwib8_q9Ls9BxLc_5Ox-jJlU0ulYZ5wSHO4gV3_--I5aRJoNGC
 9MpqHy4t2gj5DnZf1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrieeigddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepgeenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:IKwpYLKDWOTxVaYw9i4WphDhL4tOnkNzr7NWAEaMMZfGkk4CLJWuDQ>
 <xmx:IKwpYPFq_ch5KIrvq1IS3d5tZk0zRluRhI2Ml5VMffkvrZnm0SFKtA>
 <xmx:IKwpYPXSahLcz9KKEwW_aKW9oiVgJmbccx0eVwvWeD9Y3MIWV4vxdQ>
 <xmx:IKwpYGFKxWZuiz8ChPd3VDyoY7ufMZUrw7OWr4fjiTiYmYOqZyqq2g>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6035F240057;
 Sun, 14 Feb 2021 18:02:55 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v3 08/12] hw/block/nvme: end-to-end data protection
Date: Mon, 15 Feb 2021 00:02:36 +0100
Message-Id: <20210214230240.301275-9-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210214230240.301275-1-its@irrelevant.dk>
References: <20210214230240.301275-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add support for namespaces formatted with protection information. The
type of end-to-end data protection (i.e. Type 1, Type 2 or Type 3) is
selected with the `pi` nvme-ns device parameter. If the number of
metadata bytes is larger than 8, the `pil` nvme-ns device parameter may
be used to control the location of the 8-byte DIF tuple. The default
`pil` value of '0', causes the DIF tuple to be transferred as the last
8 bytes of the metadata. Set to 1 to store this in the first eight bytes
instead.

Co-authored-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h    |   2 +
 hw/block/nvme.h       |  36 ++
 include/block/nvme.h  |  26 +-
 hw/block/nvme-ns.c    |  13 +-
 hw/block/nvme.c       | 742 +++++++++++++++++++++++++++++++++++++++++-
 hw/block/trace-events |  11 +
 6 files changed, 805 insertions(+), 25 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 2281fd39930a..e537bfba18b8 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -31,6 +31,8 @@ typedef struct NvmeNamespaceParams {
 
     uint16_t ms;
     uint8_t  mset;
+    uint8_t  pi;
+    uint8_t  pil;
 
     uint16_t mssrl;
     uint32_t mcl;
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index da96374a11e7..86f000235cf0 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -221,6 +221,42 @@ static inline NvmeCtrl *nvme_ctrl(NvmeRequest *req)
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
index b23f3ae2279f..a7debf29c644 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -695,12 +695,17 @@ enum {
     NVME_RW_DSM_LATENCY_LOW     = 3 << 4,
     NVME_RW_DSM_SEQ_REQ         = 1 << 6,
     NVME_RW_DSM_COMPRESSED      = 1 << 7,
+    NVME_RW_PIREMAP             = 1 << 9,
     NVME_RW_PRINFO_PRACT        = 1 << 13,
     NVME_RW_PRINFO_PRCHK_GUARD  = 1 << 12,
     NVME_RW_PRINFO_PRCHK_APP    = 1 << 11,
     NVME_RW_PRINFO_PRCHK_REF    = 1 << 10,
+    NVME_RW_PRINFO_PRCHK_MASK   = 7 << 10,
+
 };
 
+#define NVME_RW_PRINFO(control) ((control >> 10) & 0xf)
+
 typedef struct QEMU_PACKED NvmeDsmCmd {
     uint8_t     opcode;
     uint8_t     flags;
@@ -1300,14 +1305,22 @@ typedef struct QEMU_PACKED NvmeIdNsZoned {
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
 enum NvmeZoneAttr {
     NVME_ZA_FINISHED_BY_CTLR         = 1 << 0,
     NVME_ZA_FINISH_RECOMMENDED       = 1 << 1,
@@ -1403,5 +1416,6 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeSglDescriptor) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) != 4);
     QEMU_BUILD_BUG_ON(sizeof(NvmeZoneDescr) != 64);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeDifTuple) != 8);
 }
 #endif
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index d0c79318aad7..e4340bb675c9 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -39,7 +39,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     int lba_index = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
     int npdg, nlbas;
 
-    ns->id_ns.dlfeat = 0x9;
+    ns->id_ns.dlfeat = 0x1;
 
     id_ns->lbaf[lba_index].ds = 31 - clz32(ns->blkconf.logical_block_size);
     id_ns->lbaf[lba_index].ms = ns->params.ms;
@@ -50,6 +50,9 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
         if (ns->params.mset) {
             id_ns->flbas |= 0x10;
         }
+
+        id_ns->dpc = 0x1f;
+        id_ns->dps = (ns->params.pil << 3) | ns->params.pi;
     }
 
     nlbas = nvme_ns_nlbas(ns);
@@ -338,6 +341,12 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
+    if (ns->params.pi && !ns->params.ms) {
+        error_setg(errp, "at least 8 bytes of metadata required to enable "
+                   "protection information");
+        return -1;
+    }
+
     return 0;
 }
 
@@ -415,6 +424,8 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
     DEFINE_PROP_UINT16("ms", NvmeNamespace, params.ms, 0),
     DEFINE_PROP_UINT8("mset", NvmeNamespace, params.mset, 0),
+    DEFINE_PROP_UINT8("pi", NvmeNamespace, params.pi, 0),
+    DEFINE_PROP_UINT8("pil", NvmeNamespace, params.pil, 0),
     DEFINE_PROP_UINT16("mssrl", NvmeNamespace, params.mssrl, 128),
     DEFINE_PROP_UINT32("mcl", NvmeNamespace, params.mcl, 128),
     DEFINE_PROP_UINT8("msrc", NvmeNamespace, params.msrc, 127),
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 75cc077b2879..ab45e58b2a3b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -965,9 +965,16 @@ static uint16_t nvme_map_mptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
 static uint16_t nvme_map_data(NvmeCtrl *n, uint32_t nlb, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint16_t ctrl = le16_to_cpu(rw->control);
     size_t len = nvme_l2b(ns, nlb);
     uint16_t status;
 
+    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) &&
+        (ctrl & NVME_RW_PRINFO_PRACT && nvme_msize(ns) == 8)) {
+        goto out;
+    }
+
     if (nvme_ns_ext(ns)) {
         NvmeSg sg;
 
@@ -985,6 +992,7 @@ static uint16_t nvme_map_data(NvmeCtrl *n, uint32_t nlb, NvmeRequest *req)
         return NVME_SUCCESS;
     }
 
+out:
     return nvme_map_dptr(n, &req->sg, len, &req->cmd);
 }
 
@@ -1147,8 +1155,11 @@ static uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
                                  NvmeTxDirection dir, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint16_t ctrl = le16_to_cpu(rw->control);
 
-    if (nvme_ns_ext(ns)) {
+    if (nvme_ns_ext(ns) &&
+        !(ctrl & NVME_RW_PRINFO_PRACT && nvme_msize(ns) == 8)) {
         size_t lsize = nvme_lsize(ns);
         size_t msize = nvme_msize(ns);
 
@@ -1435,6 +1446,217 @@ static uint16_t nvme_check_dulbe(NvmeNamespace *ns, uint64_t slba,
     return NVME_SUCCESS;
 }
 
+static uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint16_t ctrl,
+                                  uint64_t slba, uint32_t reftag)
+{
+    if ((NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) == NVME_ID_NS_DPS_TYPE_1) &&
+        (ctrl & NVME_RW_PRINFO_PRCHK_REF) && (slba & 0xffffffff) != reftag) {
+        return NVME_INVALID_PROT_INFO | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
+/* from Linux kernel (crypto/crct10dif_common.c) */
+static uint16_t crc_t10dif(uint16_t crc, const unsigned char *buffer,
+                           size_t len)
+{
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
+                                        size_t len, uint8_t *mbuf, size_t mlen,
+                                        uint16_t apptag, uint32_t reftag)
+{
+    uint8_t *end = buf + len;
+    size_t lsize = nvme_lsize(ns);
+    size_t msize = nvme_msize(ns);
+    int16_t pil = 0;
+
+    if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
+        pil = nvme_msize(ns) - sizeof(NvmeDifTuple);
+    }
+
+    trace_pci_nvme_e2e_pract_generate_dif(len, lsize, lsize + pil, apptag,
+                                          reftag);
+
+    for (; buf < end; buf += lsize, mbuf += msize) {
+        NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf + pil);
+        uint16_t crc = crc_t10dif(0x0, buf, lsize);
+
+        if (pil) {
+            crc = crc_t10dif(crc, mbuf, pil);
+        }
+
+        dif->guard = cpu_to_be16(crc);
+        dif->apptag = cpu_to_be16(apptag);
+        dif->reftag = cpu_to_be32(reftag);
+
+        if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) != NVME_ID_NS_DPS_TYPE_3) {
+            reftag++;
+        }
+    }
+}
+
+static uint16_t nvme_e2e_prchk(NvmeNamespace *ns, NvmeDifTuple *dif,
+                               uint8_t *buf, uint8_t *mbuf, size_t pil,
+                               uint16_t ctrl, uint16_t apptag,
+                               uint16_t appmask, uint32_t reftag)
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
+        uint16_t crc = crc_t10dif(0x0, buf, nvme_lsize(ns));
+
+        if (pil) {
+            crc = crc_t10dif(crc, mbuf, pil);
+        }
+
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
+                               uint8_t *mbuf, size_t mlen, uint16_t ctrl,
+                               uint64_t slba, uint16_t apptag,
+                               uint16_t appmask, uint32_t reftag)
+{
+    uint8_t *end = buf + len;
+    size_t lsize = nvme_lsize(ns);
+    size_t msize = nvme_msize(ns);
+    int16_t pil = 0;
+    uint16_t status;
+
+    status = nvme_check_prinfo(ns, ctrl, slba, reftag);
+    if (status) {
+        return status;
+    }
+
+    if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
+        pil = nvme_msize(ns) - sizeof(NvmeDifTuple);
+    }
+
+    trace_pci_nvme_e2e_check(NVME_RW_PRINFO(ctrl), lsize + pil);
+
+    for (; buf < end; buf += lsize, mbuf += msize) {
+        NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf + pil);
+
+        status = nvme_e2e_prchk(ns, dif, buf, mbuf, pil, ctrl, apptag,
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
+static uint16_t nvme_e2e_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf,
+                                      size_t mlen, uint64_t slba)
+{
+    BlockBackend *blk = ns->blkconf.blk;
+    BlockDriverState *bs = blk_bs(blk);
+
+    size_t msize = nvme_msize(ns);
+    size_t lsize = nvme_lsize(ns);
+    int64_t moffset = 0, offset = nvme_l2b(ns, slba);
+    uint8_t *mbufp, *end;
+    bool zeroed;
+    int16_t pil = 0;
+    int64_t bytes = (mlen / msize) * lsize;
+    int64_t pnum = 0;
+
+    Error *err = NULL;
+
+
+    if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
+        pil = nvme_msize(ns) - sizeof(NvmeDifTuple);
+    }
+
+    do {
+        int ret;
+
+        bytes -= pnum;
+
+        ret = bdrv_block_status(bs, offset, bytes, &pnum, NULL, NULL);
+        if (ret < 0) {
+            error_setg_errno(&err, -ret, "unable to get block status");
+            error_report_err(err);
+
+            return NVME_INTERNAL_DEV_ERROR;
+        }
+
+        zeroed = !!(ret & BDRV_BLOCK_ZERO);
+
+        trace_pci_nvme_block_status(offset, bytes, pnum, ret, zeroed);
+
+        if (zeroed) {
+            mbufp = mbuf + moffset;
+            mlen = (pnum / lsize) * msize;
+            end = mbufp + mlen;
+
+            for (; mbufp < end; mbufp += msize) {
+                memset(mbufp + pil, 0xff, sizeof(NvmeDifTuple));
+            }
+        }
+
+        moffset += pnum / msize;
+        offset += pnum;
+    } while (pnum != bytes);
+
+    return NVME_SUCCESS;
+}
+
 static void nvme_aio_err(NvmeRequest *req, int ret)
 {
     uint16_t status = NVME_SUCCESS;
@@ -1471,6 +1693,15 @@ static void nvme_aio_err(NvmeRequest *req, int ret)
     req->status = status;
 }
 
+struct nvme_bounce_ctx {
+    NvmeRequest *req;
+
+    struct {
+        QEMUIOVector iov;
+        uint8_t *bounce;
+    } data, mdata;
+};
+
 static inline uint32_t nvme_zone_idx(NvmeNamespace *ns, uint64_t slba)
 {
     return ns->zone_size_log2 > 0 ? slba >> ns->zone_size_log2 :
@@ -1761,6 +1992,26 @@ static void nvme_rw_complete_cb(void *opaque, int ret)
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
+static void nvme_e2e_rw_cb(void *opaque, int ret)
+{
+    struct nvme_bounce_ctx *ctx = opaque;
+    NvmeRequest *req = ctx->req;
+    NvmeNamespace *ns = req->ns;
+    BlockBackend *blk = ns->blkconf.blk;
+
+    trace_pci_nvme_e2e_rw_cb(nvme_cid(req), blk_name(blk));
+
+    qemu_iovec_destroy(&ctx->data.iov);
+    g_free(ctx->data.bounce);
+
+    qemu_iovec_destroy(&ctx->mdata.iov);
+    g_free(ctx->mdata.bounce);
+
+    g_free(ctx);
+
+    nvme_rw_complete_cb(req, ret);
+}
+
 static void nvme_rw_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
@@ -1846,6 +2097,118 @@ static void nvme_aio_flush_cb(void *opaque, int ret)
     nvme_enqueue_req_completion(nvme_cq(req), req);
 }
 
+static void nvme_e2e_rw_check_cb(void *opaque, int ret)
+{
+    struct nvme_bounce_ctx *ctx = opaque;
+    NvmeRequest *req = ctx->req;
+    NvmeNamespace *ns = req->ns;
+    NvmeCtrl *n = nvme_ctrl(req);
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint64_t slba = le64_to_cpu(rw->slba);
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
+    status = nvme_e2e_mangle_mdata(ns, ctx->mdata.bounce, ctx->mdata.iov.size,
+                                   slba);
+    if (status) {
+        req->status = status;
+        goto out;
+    }
+
+    status = nvme_e2e_check(ns, ctx->data.bounce, ctx->data.iov.size,
+                            ctx->mdata.bounce, ctx->mdata.iov.size, ctrl,
+                            slba, apptag, appmask, reftag);
+    if (status) {
+        req->status = status;
+        goto out;
+    }
+
+    status = nvme_bounce_data(n, ctx->data.bounce, ctx->data.iov.size,
+                              NVME_TX_DIRECTION_FROM_DEVICE, req);
+    if (status) {
+        req->status = status;
+        goto out;
+    }
+
+    if (ctrl & NVME_RW_PRINFO_PRACT && nvme_msize(ns) == 8) {
+        goto out;
+    }
+
+    status = nvme_bounce_mdata(n, ctx->mdata.bounce, ctx->mdata.iov.size,
+                               NVME_TX_DIRECTION_FROM_DEVICE, req);
+    if (status) {
+        req->status = status;
+    }
+
+out:
+    nvme_e2e_rw_cb(ctx, ret);
+}
+
+static void nvme_e2e_rw_mdata_in_cb(void *opaque, int ret)
+{
+    struct nvme_bounce_ctx *ctx = opaque;
+    NvmeRequest *req = ctx->req;
+    NvmeNamespace *ns = req->ns;
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint64_t slba = le64_to_cpu(rw->slba);
+    uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
+    size_t mlen = nvme_m2b(ns, nlb);
+    uint64_t offset = ns->mdata_offset + nvme_m2b(ns, slba);
+    BlockBackend *blk = ns->blkconf.blk;
+
+    trace_pci_nvme_e2e_rw_mdata_in_cb(nvme_cid(req), blk_name(blk));
+
+    if (ret) {
+        goto out;
+    }
+
+    ctx->mdata.bounce = g_malloc(mlen);
+
+    qemu_iovec_reset(&ctx->mdata.iov);
+    qemu_iovec_add(&ctx->mdata.iov, ctx->mdata.bounce, mlen);
+
+    req->aiocb = blk_aio_preadv(blk, offset, &ctx->mdata.iov, 0,
+                                nvme_e2e_rw_check_cb, ctx);
+    return;
+
+out:
+    nvme_e2e_rw_cb(ctx, ret);
+}
+
+static void nvme_e2e_rw_mdata_out_cb(void *opaque, int ret)
+{
+    struct nvme_bounce_ctx *ctx = opaque;
+    NvmeRequest *req = ctx->req;
+    NvmeNamespace *ns = req->ns;
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint64_t slba = le64_to_cpu(rw->slba);
+    uint64_t offset = ns->mdata_offset + nvme_m2b(ns, slba);
+    BlockBackend *blk = ns->blkconf.blk;
+
+    trace_pci_nvme_e2e_rw_mdata_out_cb(nvme_cid(req), blk_name(blk));
+
+    if (ret) {
+        goto out;
+    }
+
+    req->aiocb = blk_aio_pwritev(blk, offset, &ctx->mdata.iov, 0,
+                                 nvme_e2e_rw_cb, ctx);
+    return;
+
+out:
+    nvme_e2e_rw_cb(ctx, ret);
+}
+
 static void nvme_aio_discard_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
@@ -1944,11 +2307,13 @@ struct nvme_copy_ctx {
     uint8_t *bounce;
     uint8_t *mbounce;
     uint32_t nlb;
+    NvmeCopySourceRange *ranges;
 };
 
 struct nvme_copy_in_ctx {
     NvmeRequest *req;
     QEMUIOVector iov;
+    NvmeCopySourceRange *range;
 };
 
 static void nvme_copy_complete_cb(void *opaque, int ret)
@@ -2022,6 +2387,70 @@ static void nvme_copy_in_complete(NvmeRequest *req)
 
     block_acct_done(blk_get_stats(ns->blkconf.blk), &req->acct);
 
+    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+        uint16_t prinfor = (copy->control[0] >> 4) & 0xf;
+        uint16_t prinfow = (copy->control[2] >> 2) & 0xf;
+        uint16_t nr = copy->nr + 1;
+        NvmeCopySourceRange *range;
+        uint64_t slba;
+        uint32_t nlb;
+        uint16_t apptag, appmask;
+        uint32_t reftag;
+        uint8_t *buf = ctx->bounce, *mbuf = ctx->mbounce;
+        size_t len, mlen;
+        int i;
+
+        /*
+         * The e2e helpers expects prinfo to be similar to the control field of
+         * the NvmeRwCmd, so shift by 10 to fake it.
+         */
+        prinfor = prinfor << 10;
+        prinfow = prinfow << 10;
+
+        for (i = 0; i < nr; i++) {
+            range = &ctx->ranges[i];
+            slba = le64_to_cpu(range->slba);
+            nlb = le16_to_cpu(range->nlb) + 1;
+            len = nvme_l2b(ns, nlb);
+            mlen = nvme_m2b(ns, nlb);
+            apptag = le16_to_cpu(range->apptag);
+            appmask = le16_to_cpu(range->appmask);
+            reftag = le32_to_cpu(range->reftag);
+
+            status = nvme_e2e_check(ns, buf, len, mbuf, mlen, prinfor, slba,
+                                    apptag, appmask, reftag);
+            if (status) {
+                goto invalid;
+            }
+
+            buf += len;
+            mbuf += mlen;
+        }
+
+        apptag = le16_to_cpu(copy->apptag);
+        appmask = le16_to_cpu(copy->appmask);
+        reftag = le32_to_cpu(copy->reftag);
+
+        if (prinfow & NVME_RW_PRINFO_PRACT) {
+            size_t len = nvme_l2b(ns, ctx->nlb);
+            size_t mlen = nvme_m2b(ns, ctx->nlb);
+
+            status = nvme_check_prinfo(ns, prinfow, slba, reftag);
+            if (status) {
+                goto invalid;
+            }
+
+            nvme_e2e_pract_generate_dif(ns, ctx->bounce, len, ctx->mbounce,
+                                        mlen, apptag, reftag);
+        } else {
+            status = nvme_e2e_check(ns, ctx->bounce, len, ctx->mbounce, mlen,
+                                    prinfow, sdlba, apptag, appmask, reftag);
+            if (status) {
+                goto invalid;
+            }
+        }
+    }
+
     status = nvme_check_bounds(ns, sdlba, ctx->nlb);
     if (status) {
         trace_pci_nvme_err_invalid_lba_range(sdlba, ctx->nlb, ns->id_ns.nsze);
@@ -2116,7 +2545,13 @@ struct nvme_compare_ctx {
 static void nvme_compare_mdata_cb(void *opaque, int ret)
 {
     NvmeRequest *req = opaque;
+    NvmeNamespace *ns = req->ns;
     NvmeCtrl *n = nvme_ctrl(req);
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    uint16_t ctrl = le16_to_cpu(rw->control);
+    uint16_t apptag = le16_to_cpu(rw->apptag);
+    uint16_t appmask = le16_to_cpu(rw->appmask);
+    uint32_t reftag = le32_to_cpu(rw->reftag);
     struct nvme_compare_ctx *ctx = req->opaque;
     g_autofree uint8_t *buf = NULL;
     uint16_t status = NVME_SUCCESS;
@@ -2132,6 +2567,40 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
         goto out;
     }
 
+    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+        uint64_t slba = le64_to_cpu(rw->slba);
+        uint8_t *bufp;
+        uint8_t *mbufp = ctx->mdata.bounce;
+        uint8_t *end = mbufp + ctx->mdata.iov.size;
+        size_t msize = nvme_msize(ns);
+        int16_t pil = 0;
+
+        status = nvme_e2e_check(ns, ctx->data.bounce, ctx->data.iov.size,
+                                ctx->mdata.bounce, ctx->mdata.iov.size, ctrl,
+                                slba, apptag, appmask, reftag);
+        if (status) {
+            req->status = status;
+            goto out;
+        }
+
+        /*
+         * When formatted with protection information, do not compare the DIF
+         * tuple.
+         */
+        if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
+            pil = nvme_msize(ns) - sizeof(NvmeDifTuple);
+        }
+
+        for (bufp = buf; mbufp < end; bufp += msize, mbufp += msize) {
+            if (memcmp(bufp + pil, mbufp + pil, msize - pil)) {
+                req->status = NVME_CMP_FAILURE;
+                goto out;
+            }
+        }
+
+        goto out;
+    }
+
     if (memcmp(buf, ctx->mdata.bounce, ctx->mdata.iov.size)) {
         req->status = NVME_CMP_FAILURE;
         goto out;
@@ -2287,12 +2756,18 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
     NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
-    g_autofree NvmeCopySourceRange *range = NULL;
 
     uint16_t nr = copy->nr + 1;
     uint8_t format = copy->control[0] & 0xf;
-    uint32_t nlb = 0;
 
+    /*
+     * Shift the PRINFOR/PRINFOW values by 10 to allow reusing the
+     * NVME_RW_PRINFO constants.
+     */
+    uint16_t prinfor = ((copy->control[0] >> 4) & 0xf) << 10;
+    uint16_t prinfow = ((copy->control[2] >> 2) & 0xf) << 10;
+
+    uint32_t nlb = 0;
     uint8_t *bounce = NULL, *bouncep = NULL;
     uint8_t *mbounce = NULL, *mbouncep = NULL;
     struct nvme_copy_ctx *ctx;
@@ -2301,6 +2776,11 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 
     trace_pci_nvme_copy(nvme_cid(req), nvme_nsid(ns), nr, format);
 
+    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) &&
+        ((prinfor & NVME_RW_PRINFO_PRACT) != (prinfow & NVME_RW_PRINFO_PRACT))) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
     if (!(n->id_ctrl.ocfs & (1 << format))) {
         trace_pci_nvme_err_copy_invalid_format(format);
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -2310,39 +2790,41 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
         return NVME_CMD_SIZE_LIMIT | NVME_DNR;
     }
 
-    range = g_new(NvmeCopySourceRange, nr);
+    ctx = g_new(struct nvme_copy_ctx, 1);
+    ctx->ranges = g_new(NvmeCopySourceRange, nr);
 
-    status = nvme_h2c(n, (uint8_t *)range, nr * sizeof(NvmeCopySourceRange),
-                      req);
+    status = nvme_h2c(n, (uint8_t *)ctx->ranges,
+                      nr * sizeof(NvmeCopySourceRange), req);
     if (status) {
-        return status;
+        goto out;
     }
 
     for (i = 0; i < nr; i++) {
-        uint64_t slba = le64_to_cpu(range[i].slba);
-        uint32_t _nlb = le16_to_cpu(range[i].nlb) + 1;
+        uint64_t slba = le64_to_cpu(ctx->ranges[i].slba);
+        uint32_t _nlb = le16_to_cpu(ctx->ranges[i].nlb) + 1;
 
         if (_nlb > le16_to_cpu(ns->id_ns.mssrl)) {
-            return NVME_CMD_SIZE_LIMIT | NVME_DNR;
+            status = NVME_CMD_SIZE_LIMIT | NVME_DNR;
+            goto out;
         }
 
         status = nvme_check_bounds(ns, slba, _nlb);
         if (status) {
             trace_pci_nvme_err_invalid_lba_range(slba, _nlb, ns->id_ns.nsze);
-            return status;
+            goto out;
         }
 
         if (NVME_ERR_REC_DULBE(ns->features.err_rec)) {
             status = nvme_check_dulbe(ns, slba, _nlb);
             if (status) {
-                return status;
+                goto out;
             }
         }
 
         if (ns->params.zoned) {
             status = nvme_check_zone_read(ns, slba, _nlb);
             if (status) {
-                return status;
+                goto out;
             }
         }
 
@@ -2350,7 +2832,8 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     }
 
     if (nlb > le32_to_cpu(ns->id_ns.mcl)) {
-        return NVME_CMD_SIZE_LIMIT | NVME_DNR;
+        status = NVME_CMD_SIZE_LIMIT | NVME_DNR;
+        goto out;
     }
 
     bounce = bouncep = g_malloc(nvme_l2b(ns, nlb));
@@ -2361,8 +2844,6 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     block_acct_start(blk_get_stats(ns->blkconf.blk), &req->acct, 0,
                      BLOCK_ACCT_READ);
 
-    ctx = g_new(struct nvme_copy_ctx, 1);
-
     ctx->bounce = bounce;
     ctx->mbounce = mbounce;
     ctx->nlb = nlb;
@@ -2371,8 +2852,8 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     req->opaque = ctx;
 
     for (i = 0; i < nr; i++) {
-        uint64_t slba = le64_to_cpu(range[i].slba);
-        uint32_t nlb = le16_to_cpu(range[i].nlb) + 1;
+        uint64_t slba = le64_to_cpu(ctx->ranges[i].slba);
+        uint32_t nlb = le16_to_cpu(ctx->ranges[i].nlb) + 1;
 
         size_t len = nvme_l2b(ns, nlb);
         int64_t offset = nvme_l2b(ns, slba);
@@ -2419,6 +2900,12 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     }
 
     return NVME_NO_COMPLETE;
+
+out:
+    g_free(ctx->ranges);
+    g_free(ctx);
+
+    return status;
 }
 
 static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
@@ -2428,6 +2915,7 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
     BlockBackend *blk = ns->blkconf.blk;
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
+    uint16_t ctrl = le16_to_cpu(rw->control);
     size_t data_len = nvme_l2b(ns, nlb);
     size_t len = data_len;
     int64_t offset = nvme_l2b(ns, slba);
@@ -2436,6 +2924,10 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
 
     trace_pci_nvme_compare(nvme_cid(req), nvme_nsid(ns), slba, nlb);
 
+    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) && (ctrl & NVME_RW_PRINFO_PRACT)) {
+        return NVME_INVALID_PROT_INFO | NVME_DNR;
+    }
+
     if (nvme_ns_ext(ns)) {
         len += nvme_m2b(ns, nlb);
     }
@@ -2533,12 +3025,175 @@ static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
     return status;
 }
 
+static uint16_t nvme_e2e_rw(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
+    NvmeNamespace *ns = req->ns;
+    BlockBackend *blk = ns->blkconf.blk;
+    bool wrz = rw->opcode == NVME_CMD_WRITE_ZEROES;
+    uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
+    uint64_t slba = le64_to_cpu(rw->slba);
+    size_t len = nvme_l2b(ns, nlb);
+    size_t mlen = nvme_m2b(ns, nlb);
+    size_t mapped_len = len;
+    int64_t offset = nvme_l2b(ns, slba);
+    uint16_t ctrl = le16_to_cpu(rw->control);
+    uint16_t apptag = le16_to_cpu(rw->apptag);
+    uint16_t appmask = le16_to_cpu(rw->appmask);
+    uint32_t reftag = le32_to_cpu(rw->reftag);
+    bool pract = !!(ctrl & NVME_RW_PRINFO_PRACT);
+    struct nvme_bounce_ctx *ctx;
+    uint16_t status;
+
+    trace_pci_nvme_e2e_rw(pract, NVME_RW_PRINFO(ctrl));
+
+    ctx = g_new0(struct nvme_bounce_ctx, 1);
+    ctx->req = req;
+
+    if (wrz) {
+        BdrvRequestFlags flags = BDRV_REQ_MAY_UNMAP;
+
+        if (ctrl & NVME_RW_PRINFO_PRCHK_MASK) {
+            status = NVME_INVALID_PROT_INFO | NVME_DNR;
+            goto err;
+        }
+
+        if (pract) {
+            uint8_t *mbuf, *end;
+            size_t msize = nvme_msize(ns);
+            int16_t pil = msize - sizeof(NvmeDifTuple);
+
+            status = nvme_check_prinfo(ns, ctrl, slba, reftag);
+            if (status) {
+                goto err;
+            }
+
+            flags = 0;
+
+            ctx->mdata.bounce = g_malloc0(mlen);
+
+            qemu_iovec_init(&ctx->mdata.iov, 1);
+            qemu_iovec_add(&ctx->mdata.iov, ctx->mdata.bounce, mlen);
+
+            mbuf = ctx->mdata.bounce;
+            end = mbuf + mlen;
+
+            if (ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT) {
+                pil = 0;
+            }
+
+            for (; mbuf < end; mbuf += msize) {
+                NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf + pil);
+
+                dif->apptag = cpu_to_be16(apptag);
+                dif->reftag = cpu_to_be32(reftag);
+
+                switch (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+                case NVME_ID_NS_DPS_TYPE_1:
+                case NVME_ID_NS_DPS_TYPE_2:
+                    reftag++;
+                }
+            }
+        }
+
+        req->aiocb = blk_aio_pwrite_zeroes(blk, offset, len, flags,
+                                           nvme_e2e_rw_mdata_out_cb, ctx);
+        return NVME_NO_COMPLETE;
+    }
+
+    if (nvme_ns_ext(ns) && !(pract && nvme_msize(ns) == 8)) {
+        mapped_len += mlen;
+    }
+
+    status = nvme_map_dptr(n, &req->sg, mapped_len, &req->cmd);
+    if (status) {
+        return status;
+    }
+
+    ctx->data.bounce = g_malloc(len);
+
+    qemu_iovec_init(&ctx->data.iov, 1);
+    qemu_iovec_add(&ctx->data.iov, ctx->data.bounce, len);
+
+    if (req->cmd.opcode == NVME_CMD_READ) {
+        block_acct_start(blk_get_stats(blk), &req->acct, ctx->data.iov.size,
+                         BLOCK_ACCT_READ);
+
+        req->aiocb = blk_aio_preadv(ns->blkconf.blk, offset, &ctx->data.iov, 0,
+                                    nvme_e2e_rw_mdata_in_cb, ctx);
+        return NVME_NO_COMPLETE;
+    }
+
+    status = nvme_bounce_data(n, ctx->data.bounce, ctx->data.iov.size,
+                              NVME_TX_DIRECTION_TO_DEVICE, req);
+    if (status) {
+        goto err;
+    }
+
+    ctx->mdata.bounce = g_malloc(mlen);
+
+    qemu_iovec_init(&ctx->mdata.iov, 1);
+    qemu_iovec_add(&ctx->mdata.iov, ctx->mdata.bounce, mlen);
+
+    if (!(pract && nvme_msize(ns) == 8)) {
+        status = nvme_bounce_mdata(n, ctx->mdata.bounce, ctx->mdata.iov.size,
+                                   NVME_TX_DIRECTION_TO_DEVICE, req);
+        if (status) {
+            goto err;
+        }
+    }
+
+    status = nvme_check_prinfo(ns, ctrl, slba, reftag);
+    if (status) {
+        goto err;
+    }
+
+    if (pract) {
+        status = nvme_check_prinfo(ns, ctrl, slba, reftag);
+        if (status) {
+            goto err;
+        }
+
+        /* splice generated protection information into the buffer */
+        nvme_e2e_pract_generate_dif(ns, ctx->data.bounce, ctx->data.iov.size,
+                                    ctx->mdata.bounce, ctx->mdata.iov.size,
+                                    apptag, reftag);
+    } else {
+        status = nvme_e2e_check(ns, ctx->data.bounce, ctx->data.iov.size,
+                                ctx->mdata.bounce, ctx->mdata.iov.size, ctrl,
+                                slba, apptag, appmask, reftag);
+        if (status) {
+            goto err;
+        }
+    }
+
+    block_acct_start(blk_get_stats(blk), &req->acct, ctx->data.iov.size,
+                     BLOCK_ACCT_WRITE);
+
+    req->aiocb = blk_aio_pwritev(ns->blkconf.blk, offset, &ctx->data.iov, 0,
+                                 nvme_e2e_rw_mdata_out_cb, ctx);
+
+    return NVME_NO_COMPLETE;
+
+err:
+    qemu_iovec_destroy(&ctx->data.iov);
+    g_free(ctx->data.bounce);
+
+    qemu_iovec_destroy(&ctx->mdata.iov);
+    g_free(ctx->mdata.bounce);
+
+    g_free(ctx);
+
+    return status;
+}
+
 static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
+    uint16_t ctrl = le16_to_cpu(rw->control);
     uint64_t data_size = nvme_l2b(ns, nlb);
     uint64_t mapped_size = data_size;
     uint64_t data_offset;
@@ -2547,6 +3202,14 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
 
     if (nvme_ns_ext(ns)) {
         mapped_size += nvme_m2b(ns, nlb);
+
+        if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+            bool pract = ctrl & NVME_RW_PRINFO_PRACT;
+
+            if (pract && nvme_msize(ns) == 8) {
+                mapped_size = data_size;
+            }
+        }
     }
 
     trace_pci_nvme_read(nvme_cid(req), nvme_nsid(ns), nlb, mapped_size, slba);
@@ -2578,6 +3241,10 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
+    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+        return nvme_e2e_rw(n, req);
+    }
+
     status = nvme_map_data(n, nlb, req);
     if (status) {
         goto invalid;
@@ -2602,6 +3269,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
     NvmeNamespace *ns = req->ns;
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
+    uint16_t ctrl = le16_to_cpu(rw->control);
     uint64_t data_size = nvme_l2b(ns, nlb);
     uint64_t mapped_size = data_size;
     uint64_t data_offset;
@@ -2612,6 +3280,14 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
 
     if (nvme_ns_ext(ns)) {
         mapped_size += nvme_m2b(ns, nlb);
+
+        if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+            bool pract = ctrl & NVME_RW_PRINFO_PRACT;
+
+            if (pract && nvme_msize(ns) == 8) {
+                mapped_size -= nvme_m2b(ns, nlb);
+            }
+        }
     }
 
     trace_pci_nvme_write(nvme_cid(req), nvme_io_opc_str(rw->opcode),
@@ -2635,6 +3311,8 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
         zone = nvme_get_zone_by_slba(ns, slba);
 
         if (append) {
+            bool piremap = !!(ctrl & NVME_RW_PIREMAP);
+
             if (unlikely(slba != zone->d.zslba)) {
                 trace_pci_nvme_err_append_not_at_start(slba, zone->d.zslba);
                 status = NVME_INVALID_FIELD;
@@ -2649,6 +3327,30 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
 
             slba = zone->w_ptr;
             res->slba = cpu_to_le64(slba);
+
+            switch (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+            case NVME_ID_NS_DPS_TYPE_1:
+                if (!piremap) {
+                    return NVME_INVALID_PROT_INFO | NVME_DNR;
+                }
+
+                /* fallthrough */
+
+            case NVME_ID_NS_DPS_TYPE_2:
+                if (piremap) {
+                    uint32_t reftag = le32_to_cpu(rw->reftag);
+                    rw->reftag = cpu_to_le32(reftag + (slba - zone->d.zslba));
+                }
+
+                break;
+
+            case NVME_ID_NS_DPS_TYPE_3:
+                if (piremap) {
+                    return NVME_INVALID_PROT_INFO | NVME_DNR;
+                }
+
+                break;
+            }
         }
 
         status = nvme_check_zone_write(ns, zone, slba, nlb);
@@ -2666,6 +3368,10 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
 
     data_offset = nvme_l2b(ns, slba);
 
+    if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
+        return nvme_e2e_rw(n, req);
+    }
+
     if (!wrz) {
         status = nvme_map_data(n, nlb, req);
         if (status) {
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 2912fa0849e7..243b0857b3d9 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -44,6 +44,17 @@ pci_nvme_flush(uint16_t cid, uint32_t nsid) "cid %"PRIu16" nsid %"PRIu32""
 pci_nvme_read(uint16_t cid, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_write(uint16_t cid, const char *verb, uint32_t nsid, uint32_t nlb, uint64_t count, uint64_t lba) "cid %"PRIu16" opname '%s' nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
 pci_nvme_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
+pci_nvme_e2e_rw(uint8_t pract, uint8_t prinfo) "pract 0x%"PRIx8" prinfo 0x%"PRIx8""
+pci_nvme_e2e_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
+pci_nvme_e2e_rw_mdata_in_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
+pci_nvme_e2e_rw_mdata_out_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s'"
+pci_nvme_e2e_rw_check_cb(uint16_t cid, uint8_t prinfo, uint16_t apptag, uint16_t appmask, uint32_t reftag) "cid %"PRIu16" prinfo 0x%"PRIx8" apptag 0x%"PRIx16" appmask 0x%"PRIx16" reftag 0x%"PRIx32""
+pci_nvme_e2e_pract_generate_dif(size_t len, size_t lba_size, size_t chksum_len, uint16_t apptag, uint32_t reftag) "len %zu lba_size %zu chksum_len %zu apptag 0x%"PRIx16" reftag 0x%"PRIx32""
+pci_nvme_e2e_check(uint8_t prinfo, uint16_t chksum_len) "prinfo 0x%"PRIx8" chksum_len %"PRIu16""
+pci_nvme_e2e_prchk_disabled(uint16_t apptag, uint32_t reftag) "apptag 0x%"PRIx16" reftag 0x%"PRIx32""
+pci_nvme_e2e_prchk_guard(uint16_t guard, uint16_t crc) "guard 0x%"PRIx16" crc 0x%"PRIx16""
+pci_nvme_e2e_prchk_apptag(uint16_t apptag, uint16_t elbat, uint16_t elbatm) "apptag 0x%"PRIx16" elbat 0x%"PRIx16" elbatm 0x%"PRIx16""
+pci_nvme_e2e_prchk_reftag(uint32_t reftag, uint32_t elbrt) "reftag 0x%"PRIx32" elbrt 0x%"PRIx32""
 pci_nvme_copy(uint16_t cid, uint32_t nsid, uint16_t nr, uint8_t format) "cid %"PRIu16" nsid %"PRIu32" nr %"PRIu16" format 0x%"PRIx8""
 pci_nvme_copy_source_range(uint64_t slba, uint32_t nlb) "slba 0x%"PRIx64" nlb %"PRIu32""
 pci_nvme_copy_in_complete(uint16_t cid) "cid %"PRIu16""
-- 
2.30.0


