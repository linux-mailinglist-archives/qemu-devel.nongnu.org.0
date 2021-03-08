Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591A0330DE4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:34:37 +0100 (CET)
Received: from localhost ([::1]:54026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJF5o-0000fd-Au
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:34:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEv9-00032M-0b; Mon, 08 Mar 2021 07:23:35 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:58359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEv2-0006ux-L4; Mon, 08 Mar 2021 07:23:34 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 40A8C36C8;
 Mon,  8 Mar 2021 07:23:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=62hI8Sl1+AOh0
 EDJGsNyANbqeAo7S+ls4HuSt2updQY=; b=fsLSJHL31kYq9oyMP4AqTu8YJug84
 MVX/b7/ssVWC62KCrh7Dn89kumWGE1lznCK3RRi9yADT3QvIP5ugyPcmzJnrlSE2
 nPCc3xz7DtLjylvETzt9StKJkMab6rXmRYSSFvPcCv3gzflM+HjaasIAy9i+Dzii
 eN3gYH1Z1FbjiQ8aJWhG0ZYXi1Ql83fXTK2hR/d1jiGzopk4KDiy9Bo/nBSSD3xd
 03yAnuyIFqUUDAn7vC9EHQWIy2b1cxIxPJjGY5OvwvXVOLM672Y75/MBj8koRZ22
 CUflJNAGEV3PHOC1ZKmd2Q9cKrIDwdSzIpkj6rK/lnov4uG3vxX3p46xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=62hI8Sl1+AOh0EDJGsNyANbqeAo7S+ls4HuSt2updQY=; b=eCfgJe59
 /oyyclGfDHrEQs5y9FDVZiBYvnvAORa4G13jnhoXohRNTljTWrFkFzPeup8YbW1Y
 R3zeZy5cLG1PwgJKh9HgyuWmiggoCpw0i6Tx2ZpVecuKcF4LAnbGBEGAMTI3HZpe
 eEYCBsqc0aBzxlDvIdx/OoEyJvFLBxq6bp4xi5iDdDR29+LGjwFI1v+sc74363Sr
 B27BgJzFETAmFMbcxMQiISTyVtI95ndoBEYRac2z1xs4wBoSLhVD/IxmDR3fP0BE
 hiJMplg602UsD6YWkyKj8gaZPJdqbUwgdJwswtXDWD+UjLjDWEfRQx0t1ukZ2wgU
 ct6l/TxSKGE62A==
X-ME-Sender: <xms:PRdGYMuW2OTJbl0tNUBWmEKl2inH157BLvp_7IVj9UPYZjPBn_LIFw>
 <xme:PRdGYJeyzFwdtEfNEs33JHhebSvydKLEB1f-2kJLhCU8eRY-bT6mSHN48iCJd7AHr
 TOVeic19boroo3Canw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:PRdGYHwMMPjuXrnlVLUsxlydhshLXFn_ue8LDE4J2sR9Re3IjJhwtA>
 <xmx:PRdGYPMk4CZ88IdqUc056bIrhhJCe5BUyzXWdYLW4xmDrLzDZMdX7w>
 <xmx:PRdGYM_R6fTMgamcrIyFBzD4Na6Iv9D0Aw7-WCpRVCaghE2goq8maQ>
 <xmx:PRdGYAQMK8SaI7t9ih_F0_O6bBCbtdZtKqeaMeFDFGpGcDJ2bMPhW4TFryE>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6598E108005C;
 Mon,  8 Mar 2021 07:23:24 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 06/38] hw/block/nvme: support for shared namespace in subsystem
Date: Mon,  8 Mar 2021 13:22:41 +0100
Message-Id: <20210308122313.286938-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

nvme-ns device is registered to a nvme controller device during the
initialization in nvme_register_namespace() in case that 'bus' property
is given which means it's mapped to a single controller.

This patch introduced a new property 'subsys' just like the controller
device instance did to map a namespace to a NVMe subsystem.

If 'subsys' property is given to the nvme-ns device, it will belong to
the specified subsystem and will be attached to all controllers in that
subsystem by enabling shared namespace capability in NMIC(Namespace
Multi-path I/O and Namespace Capabilities) in Identify Namespace.

Usage:

  -device nvme-subsys,id=subsys0
  -device nvme,serial=foo,id=nvme0,subsys=subsys0
  -device nvme,serial=bar,id=nvme1,subsys=subsys0
  -device nvme,serial=baz,id=nvme2,subsys=subsys0
  -device nvme-ns,id=ns1,drive=<drv>,nsid=1,subsys=subsys0  # Shared
  -device nvme-ns,id=ns2,drive=<drv>,nsid=2,bus=nvme2       # Non-shared

  In the above example, 'ns1' will be shared to 'nvme0' and 'nvme1' in
  the same subsystem.  On the other hand, 'ns2' will be attached to the
  'nvme2' only as a private namespace in that subsystem.

All the namespace with 'subsys' parameter will attach all controllers in
the subsystem to the namespace by default.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h     |  7 +++++++
 hw/block/nvme-subsys.h |  3 +++
 hw/block/nvme-ns.c     | 17 ++++++++++++++---
 hw/block/nvme-subsys.c | 25 +++++++++++++++++++++++++
 hw/block/nvme.c        | 10 +++++++++-
 5 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 293ac990e3f6..929e78861903 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -47,6 +47,8 @@ typedef struct NvmeNamespace {
     const uint32_t *iocs;
     uint8_t      csi;
 
+    NvmeSubsystem   *subsys;
+
     NvmeIdNsZoned   *id_ns_zoned;
     NvmeZone        *zone_array;
     QTAILQ_HEAD(, NvmeZone) exp_open_zones;
@@ -77,6 +79,11 @@ static inline uint32_t nvme_nsid(NvmeNamespace *ns)
     return -1;
 }
 
+static inline bool nvme_ns_shared(NvmeNamespace *ns)
+{
+    return !!ns->subsys;
+}
+
 static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
 {
     NvmeIdNs *id_ns = &ns->id_ns;
diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 4eba50d96a1d..ccf6a71398d3 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -14,6 +14,7 @@
     OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
 
 #define NVME_SUBSYS_MAX_CTRLS   32
+#define NVME_SUBSYS_MAX_NAMESPACES  32
 
 typedef struct NvmeCtrl NvmeCtrl;
 typedef struct NvmeNamespace NvmeNamespace;
@@ -22,8 +23,10 @@ typedef struct NvmeSubsystem {
     uint8_t     subnqn[256];
 
     NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
+    NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES];
 } NvmeSubsystem;
 
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
+int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp);
 
 #endif /* NVME_SUBSYS_H */
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 93ac6e107a09..64b6a491adc3 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -63,6 +63,10 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 
     id_ns->npda = id_ns->npdg = npdg - 1;
 
+    if (nvme_ns_shared(ns)) {
+        id_ns->nmic |= NVME_NMIC_NS_SHARED;
+    }
+
     return 0;
 }
 
@@ -363,14 +367,21 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (nvme_register_namespace(n, ns, errp)) {
-        return;
+    if (ns->subsys) {
+        if (nvme_subsys_register_ns(ns, errp)) {
+            return;
+        }
+    } else {
+        if (nvme_register_namespace(n, ns, errp)) {
+            return;
+        }
     }
-
 }
 
 static Property nvme_ns_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
+    DEFINE_PROP_LINK("subsys", NvmeNamespace, subsys, TYPE_NVME_SUBSYS,
+                     NvmeSubsystem *),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
     DEFINE_PROP_BOOL("zoned", NvmeNamespace, params.zoned, false),
diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
index e9d61c993c90..641de33e99fc 100644
--- a/hw/block/nvme-subsys.c
+++ b/hw/block/nvme-subsys.c
@@ -43,6 +43,31 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
     return cntlid;
 }
 
+int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp)
+{
+    NvmeSubsystem *subsys = ns->subsys;
+    NvmeCtrl *n;
+    int i;
+
+    if (subsys->namespaces[nvme_nsid(ns)]) {
+        error_setg(errp, "namespace %d already registerd to subsy %s",
+                   nvme_nsid(ns), subsys->parent_obj.id);
+        return -1;
+    }
+
+    subsys->namespaces[nvme_nsid(ns)] = ns;
+
+    for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
+        n = subsys->ctrls[i];
+
+        if (n && nvme_register_namespace(n, ns, errp)) {
+            return -1;
+        }
+    }
+
+    return 0;
+}
+
 static void nvme_subsys_setup(NvmeSubsystem *subsys)
 {
     snprintf((char *)subsys->subnqn, sizeof(subsys->subnqn),
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 4e8e15a82da0..34f9be0199d5 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -25,7 +25,8 @@
  *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]>, \
  *              subsys=<subsys_id> \
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
- *              zoned=<true|false[optional]>
+ *              zoned=<true|false[optional]>, \
+ *              subsys=<subsys_id>
  *      -device nvme-subsys,id=<subsys_id>
  *
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
@@ -70,6 +71,13 @@
  *   data size being in effect. By setting this property to 0, users can make
  *   ZASL to be equal to MDTS. This property only affects zoned namespaces.
  *
+ * nvme namespace device parameters
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * - `subsys`
+ *   NVM Subsystem device.  If given, this namespace will be attached to all
+ *   controllers in the subsystem. Otherwise, `bus` must be given to attach
+ *   this namespace to a specified single controller as a non-shared namespace.
+ *
  * Setting `zoned` to true selects Zoned Command Set at the namespace.
  * In this case, the following namespace properties are available to configure
  * zoned operation:
-- 
2.30.1


