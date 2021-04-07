Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF093563B1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 08:05:19 +0200 (CEST)
Received: from localhost ([::1]:33456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU1JW-0003Hi-FA
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 02:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11g-0002An-CW; Wed, 07 Apr 2021 01:46:52 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:46317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11c-00054M-WC; Wed, 07 Apr 2021 01:46:52 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1B9C058086F;
 Wed,  7 Apr 2021 01:46:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 07 Apr 2021 01:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=KaUL6/wAQacEc
 zt570h05DZE6fvl4ueR+/YrAAujjqc=; b=Wjf+3ITmSg77umA1BUhxNLZZ9+a/4
 L15JbJFEl491pME9s8BLQ4hM4YIbp284y0pE1ANp15CVstirgdkKmJTZYhgJT3Ul
 yHMVRt8s/FZ4xez0t65CB1P7IqxPGer6yufLnghhJastSiZ1LZV+aP4Xi/+3Jb7p
 Dhy1ef6MM33ugRBndJe39a+nkQxpGEpExYlPKg0SvaE1tJMxlVhYO2qqIkI+bgfh
 R2NoIJxs48j0XiLBOARq0QzCVjAoNT5p0UDMwb4x8li0OFOet/j23A9w6byDtpxC
 QR3UXE141vkgj/xTW6w0IS+4ZtGBZbFDdtR36qq4k/ooUgr5nqPEnyP2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=KaUL6/wAQacEczt570h05DZE6fvl4ueR+/YrAAujjqc=; b=syQd8FY1
 QOLkigxBzW8aoa2PomJfUZjSmmudczB5JeX3p9jJ2c5oXethJ+UpWJesRosZTbck
 Su+MdArDA7A6wuspD5hoOlpnqXZ4tFnDh5p4s/POdjZQkwbdbZQV+YkC9VH4BJaZ
 S1t2S8ex8OCrXQ5jHQ0WcHhnxFoLZAYsS+CpoIWjFjeV1gd2Z0WOjQvqzwEZRi1i
 UBJlQPFrb+j+y/JadVUy6SxtIoZtGEEFFvzPUNfmAaNqhSP8s1zknhcRkz6dWEvt
 aUKfLwF5AVRRvplUCPvosvrkgoEaBcwczF/qzD+FPggtdif84E2YrUXRFa+QD2jm
 zfOzQNt4eaVvSw==
X-ME-Sender: <xms:SEdtYIHbnBNoQAeGjpyhQ7ezzasfoz-wtlafVbaAhBAkSBKTGc21Vg>
 <xme:SEdtYHR92_wtM6xOL8n3ZKuUM1-Un5GF7gsMv9aFkN8w247MvXNcvyFyPPpMTFf1e
 RhCv5RC9_6Yw1E62oM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejiedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:SEdtYPRBiIDfBbiulOM4BSS69BGR0fFjRMa_GQFWV8r7VSa8Xkcrcg>
 <xmx:SEdtYK1XHyMVLMQIhZBK1_IGm6iUBKs4kP34u_f4r4yMALi0C7OQcw>
 <xmx:SEdtYJwORATvoVHbm9ZPOfTKpKPsQyLu2T70muaAqiCqqAXBtsc6jw>
 <xmx:SEdtYNwLYDtyoD1-Tc8ZR3KapUZzNgX0mofLWSufe01dJmh_ULtj5g>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9FEB4108005C;
 Wed,  7 Apr 2021 01:46:46 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 v2 06/10] hw/block/nvme: fix handling of private
 namespaces
Date: Wed,  7 Apr 2021 07:46:31 +0200
Message-Id: <20210407054635.189440-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210407054635.189440-1-its@irrelevant.dk>
References: <20210407054635.189440-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Prior to this patch, if a private nvme-ns device (that is, a namespace
that is not linked to a subsystem) is wired up to an nvme-subsys linked
nvme controller device, the device fails to verify that the namespace id
is unique within the subsystem. NVM Express v1.4b, Section 6.1.6 ("NSID
and Namespace Usage") states that because the device supports Namespace
Management, "NSIDs *shall* be unique within the NVM subsystem".

Additionally, prior to this patch, private namespaces are not known to
the subsystem and the namespace is considered exclusive to the
controller with which it is initially wired up to. However, this is not
the definition of a private namespace; per Section 1.6.33 ("private
namespace"), a private namespace is just a namespace that does not
support multipath I/O or namespace sharing, which means "that it is only
able to be attached to one controller at a time".

Fix this by always allocating namespaces in the subsystem (if one is
linked to the controller), regardless of the shared/private status of
the namespace. Whether or not the namespace is shareable is controlled
by a new `shared` nvme-ns parameter.

Finally, this fix allows the nvme-ns `subsys` parameter to be removed,
since the `shared` parameter now serves the purpose of attaching the
namespace to all controllers in the subsystem upon device realization.
It is invalid to have an nvme-ns namespace device with a linked
subsystem without the parent nvme controller device also being linked to
one and since the nvme-ns devices will unconditionally be "attached" (in
QEMU terms that is) to an nvme controller device through an NvmeBus, the
nvme-ns namespace device can always get a reference to the subsystem of
the controller it is explicitly (using 'bus=' parameter) or implicitly
attaching to.

Fixes: e570768566b3 ("hw/block/nvme: support for shared namespace in subsystem")
Cc: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-ns.h     |  10 +---
 hw/block/nvme-subsys.h |   7 +--
 hw/block/nvme.h        |  39 +------------
 include/block/nvme.h   |   1 +
 hw/block/nvme-ns.c     |  76 +++++++++++++++++++++----
 hw/block/nvme-subsys.c |  28 ----------
 hw/block/nvme.c        | 123 ++++++++++++++---------------------------
 hw/block/trace-events  |   1 -
 8 files changed, 115 insertions(+), 170 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 82340c4b2574..fb0a41f912e7 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -29,6 +29,7 @@ typedef struct NvmeZone {
 
 typedef struct NvmeNamespaceParams {
     bool     detached;
+    bool     shared;
     uint32_t nsid;
     QemuUUID uuid;
 
@@ -60,8 +61,8 @@ typedef struct NvmeNamespace {
     const uint32_t *iocs;
     uint8_t      csi;
     uint16_t     status;
+    int          attached;
 
-    NvmeSubsystem   *subsys;
     QTAILQ_ENTRY(NvmeNamespace) entry;
 
     NvmeIdNsZoned   *id_ns_zoned;
@@ -99,11 +100,6 @@ static inline uint32_t nvme_nsid(NvmeNamespace *ns)
     return 0;
 }
 
-static inline bool nvme_ns_shared(NvmeNamespace *ns)
-{
-    return !!ns->subsys;
-}
-
 static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
 {
     NvmeIdNs *id_ns = &ns->id_ns;
@@ -225,7 +221,7 @@ static inline void nvme_aor_dec_active(NvmeNamespace *ns)
 }
 
 void nvme_ns_init_format(NvmeNamespace *ns);
-int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
+int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
 void nvme_ns_cleanup(NvmeNamespace *ns);
diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index aafa04b84829..24132edd005c 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -14,7 +14,7 @@
     OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
 
 #define NVME_SUBSYS_MAX_CTRLS   32
-#define NVME_SUBSYS_MAX_NAMESPACES  256
+#define NVME_MAX_NAMESPACES     256
 
 typedef struct NvmeCtrl NvmeCtrl;
 typedef struct NvmeNamespace NvmeNamespace;
@@ -24,7 +24,7 @@ typedef struct NvmeSubsystem {
 
     NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
     /* Allocated namespaces for this subsystem */
-    NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES + 1];
+    NvmeNamespace *namespaces[NVME_MAX_NAMESPACES + 1];
 
     struct {
         char *nqn;
@@ -32,7 +32,6 @@ typedef struct NvmeSubsystem {
 } NvmeSubsystem;
 
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
-int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp);
 
 static inline NvmeCtrl *nvme_subsys_ctrl(NvmeSubsystem *subsys,
         uint32_t cntlid)
@@ -54,7 +53,7 @@ static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsystem *subsys,
         return NULL;
     }
 
-    assert(nsid && nsid <= NVME_SUBSYS_MAX_NAMESPACES);
+    assert(nsid && nsid <= NVME_MAX_NAMESPACES);
 
     return subsys->namespaces[nsid];
 }
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 8d1806cc942f..5d05ec368f7a 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -6,17 +6,9 @@
 #include "nvme-subsys.h"
 #include "nvme-ns.h"
 
-#define NVME_MAX_NAMESPACES 256
-
 #define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
 #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
 
-/*
- * Subsystem namespace list for allocated namespaces should be larger than
- * attached namespace list in a controller.
- */
-QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_SUBSYS_MAX_NAMESPACES);
-
 typedef struct NvmeParams {
     char     *serial;
     uint32_t num_queues; /* deprecated since 5.1 */
@@ -234,35 +226,6 @@ static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
     return n->namespaces[nsid - 1];
 }
 
-static inline bool nvme_ns_is_attached(NvmeCtrl *n, NvmeNamespace *ns)
-{
-    int nsid;
-
-    for (nsid = 1; nsid <= n->num_namespaces; nsid++) {
-        if (nvme_ns(n, nsid) == ns) {
-            return true;
-        }
-    }
-
-    return false;
-}
-
-static inline void nvme_ns_attach(NvmeCtrl *n, NvmeNamespace *ns)
-{
-    uint32_t nsid = nvme_nsid(ns);
-    assert(nsid && nsid <= NVME_MAX_NAMESPACES);
-
-    n->namespaces[nsid - 1] = ns;
-}
-
-static inline void nvme_ns_detach(NvmeCtrl *n, NvmeNamespace *ns)
-{
-    uint32_t nsid = nvme_nsid(ns);
-    assert(nsid && nsid <= NVME_MAX_NAMESPACES);
-
-    n->namespaces[nsid - 1] = NULL;
-}
-
 static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
 {
     NvmeSQueue *sq = req->sq;
@@ -291,7 +254,7 @@ typedef enum NvmeTxDirection {
     NVME_TX_DIRECTION_FROM_DEVICE = 1,
 } NvmeTxDirection;
 
-int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
+void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
 uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req);
 uint16_t nvme_bounce_mdata(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
diff --git a/include/block/nvme.h b/include/block/nvme.h
index b0a4e4291611..4ac926fbc687 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -847,6 +847,7 @@ enum NvmeStatusCodes {
     NVME_FEAT_NOT_NS_SPEC       = 0x010f,
     NVME_FW_REQ_SUSYSTEM_RESET  = 0x0110,
     NVME_NS_ALREADY_ATTACHED    = 0x0118,
+    NVME_NS_PRIVATE             = 0x0119,
     NVME_NS_NOT_ATTACHED        = 0x011A,
     NVME_NS_CTRL_LIST_INVALID   = 0x011C,
     NVME_CONFLICTING_ATTRS      = 0x0180,
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index ca04ee1bacfb..7bb618f18209 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -73,7 +73,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     /* support DULBE and I/O optimization fields */
     id_ns->nsfeat |= (0x4 | 0x10);
 
-    if (nvme_ns_shared(ns)) {
+    if (ns->params.shared) {
         id_ns->nmic |= NVME_NMIC_NS_SHARED;
     }
 
@@ -387,7 +387,8 @@ static void nvme_zoned_ns_shutdown(NvmeNamespace *ns)
     assert(ns->nr_open_zones == 0);
 }
 
-static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
+static int nvme_ns_check_constraints(NvmeCtrl *n, NvmeNamespace *ns,
+                                     Error **errp)
 {
     if (!ns->blkconf.blk) {
         error_setg(errp, "block backend not configured");
@@ -400,12 +401,32 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
+    if (ns->params.nsid > NVME_MAX_NAMESPACES) {
+        error_setg(errp, "invalid namespace id (must be between 0 and %d)",
+                   NVME_MAX_NAMESPACES);
+        return -1;
+    }
+
+    if (!n->subsys) {
+        if (ns->params.detached) {
+            error_setg(errp, "detached requires that the nvme device is "
+                       "linked to an nvme-subsys device");
+            return -1;
+        }
+
+        if (ns->params.shared) {
+            error_setg(errp, "shared requires that the nvme device is "
+                       "linked to an nvme-subsys device");
+            return -1;
+        }
+    }
+
     return 0;
 }
 
-int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
+int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 {
-    if (nvme_ns_check_constraints(ns, errp)) {
+    if (nvme_ns_check_constraints(n, ns, errp)) {
         return -1;
     }
 
@@ -453,27 +474,62 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
     NvmeNamespace *ns = NVME_NS(dev);
     BusState *s = qdev_get_parent_bus(dev);
     NvmeCtrl *n = NVME(s->parent);
+    NvmeSubsystem *subsys = n->subsys;
+    uint32_t nsid = ns->params.nsid;
+    int i;
 
-    if (nvme_ns_setup(ns, errp)) {
+    if (nvme_ns_setup(n, ns, errp)) {
         return;
     }
 
-    if (ns->subsys) {
-        if (nvme_subsys_register_ns(ns, errp)) {
+    if (!nsid) {
+        for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
+            if (nvme_ns(n, i) || nvme_subsys_ns(subsys, i)) {
+                continue;
+            }
+
+            nsid = ns->params.nsid = i;
+            break;
+        }
+
+        if (!nsid) {
+            error_setg(errp, "no free namespace id");
             return;
         }
     } else {
-        if (nvme_register_namespace(n, ns, errp)) {
+        if (nvme_ns(n, nsid) || nvme_subsys_ns(subsys, nsid)) {
+            error_setg(errp, "namespace id '%d' already allocated", nsid);
             return;
         }
     }
+
+    if (subsys) {
+        subsys->namespaces[nsid] = ns;
+
+        if (ns->params.detached) {
+            return;
+        }
+
+        if (ns->params.shared) {
+            for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
+                NvmeCtrl *ctrl = subsys->ctrls[i];
+
+                if (ctrl) {
+                    nvme_attach_ns(ctrl, ns);
+                }
+            }
+
+            return;
+        }
+    }
+
+    nvme_attach_ns(n, ns);
 }
 
 static Property nvme_ns_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
-    DEFINE_PROP_LINK("subsys", NvmeNamespace, subsys, TYPE_NVME_SUBSYS,
-                     NvmeSubsystem *),
     DEFINE_PROP_BOOL("detached", NvmeNamespace, params.detached, false),
+    DEFINE_PROP_BOOL("shared", NvmeNamespace, params.shared, false),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
     DEFINE_PROP_UINT16("ms", NvmeNamespace, params.ms, 0),
diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
index 9fadef8cec99..283a97b79d57 100644
--- a/hw/block/nvme-subsys.c
+++ b/hw/block/nvme-subsys.c
@@ -43,34 +43,6 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
     return cntlid;
 }
 
-int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp)
-{
-    NvmeSubsystem *subsys = ns->subsys;
-    NvmeCtrl *n;
-    uint32_t nsid = nvme_nsid(ns);
-    int i;
-
-    assert(nsid && nsid <= NVME_SUBSYS_MAX_NAMESPACES);
-
-    if (subsys->namespaces[nsid]) {
-        error_setg(errp, "namespace %d already registerd to subsy %s",
-                   nvme_nsid(ns), subsys->parent_obj.id);
-        return -1;
-    }
-
-    subsys->namespaces[nsid] = ns;
-
-    for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
-        n = subsys->ctrls[i];
-
-        if (n && nvme_register_namespace(n, ns, errp)) {
-            return -1;
-        }
-    }
-
-    return 0;
-}
-
 static void nvme_subsys_setup(NvmeSubsystem *subsys)
 {
     const char *nqn = subsys->params.nqn ?
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 0898ece2af31..d2dd82496790 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -93,10 +93,13 @@
  *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- * - `subsys`
- *   If given, the namespace will be attached to all controllers in the
- *   subsystem. Otherwise, `bus` must be given to attach this namespace to a
- *   specific controller as a non-shared namespace.
+ * - `shared`
+ *   When the parent nvme device (as defined explicitly by the 'bus' parameter
+ *   or implicitly by the most recently defined NvmeBus) is linked to an
+ *   nvme-subsys device, the namespace will be attached to all controllers in
+ *   the subsystem. If set to 'off' (the default), the namespace will remain a
+ *   private namespace and may only be attached to a single controller at a
+ *   time.
  *
  * - `detached`
  *   This parameter is only valid together with the `subsys` parameter. If left
@@ -4242,7 +4245,7 @@ static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
             continue;
         }
 
-        if (!nvme_ns_is_attached(ctrl, ns)) {
+        if (!nvme_ns(ctrl, c->nsid)) {
             continue;
         }
 
@@ -4899,6 +4902,10 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
 
     trace_pci_nvme_ns_attachment(nvme_cid(req), dw10 & 0xf);
 
+    if (!nvme_nsid_valid(n, nsid)) {
+        return NVME_INVALID_NSID | NVME_DNR;
+    }
+
     ns = nvme_subsys_ns(n->subsys, nsid);
     if (!ns) {
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -4920,18 +4927,23 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
         }
 
         if (attach) {
-            if (nvme_ns_is_attached(ctrl, ns)) {
+            if (nvme_ns(ctrl, nsid)) {
                 return NVME_NS_ALREADY_ATTACHED | NVME_DNR;
             }
 
-            nvme_ns_attach(ctrl, ns);
+            if (ns->attached && !ns->params.shared) {
+                return NVME_NS_PRIVATE | NVME_DNR;
+            }
+
+            nvme_attach_ns(ctrl, ns);
             __nvme_select_ns_iocs(ctrl, ns);
         } else {
-            if (!nvme_ns_is_attached(ctrl, ns)) {
+            if (!nvme_ns(ctrl, nsid)) {
                 return NVME_NS_NOT_ATTACHED | NVME_DNR;
             }
 
-            nvme_ns_detach(ctrl, ns);
+            ctrl->namespaces[nsid - 1] = NULL;
+            ns->attached--;
 
             nvme_update_dmrsl(ctrl);
         }
@@ -5825,6 +5837,12 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
     if (n->namespace.blkconf.blk) {
         warn_report("drive property is deprecated; "
                     "please use an nvme-ns device instead");
+
+        if (n->subsys) {
+            error_setg(errp, "subsystem support is unavailable with legacy "
+                       "namespace ('drive' property)");
+            return;
+        }
     }
 
     if (params->max_ioqpairs < 1 ||
@@ -5887,75 +5905,6 @@ static void nvme_init_state(NvmeCtrl *n)
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
 }
 
-static int nvme_attach_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
-{
-    if (nvme_ns_is_attached(n, ns)) {
-        error_setg(errp,
-                   "namespace %d is already attached to controller %d",
-                   nvme_nsid(ns), n->cntlid);
-        return -1;
-    }
-
-    nvme_ns_attach(n, ns);
-
-    return 0;
-}
-
-int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
-{
-    uint32_t nsid = nvme_nsid(ns);
-
-    if (nsid > NVME_MAX_NAMESPACES) {
-        error_setg(errp, "invalid namespace id (must be between 0 and %d)",
-                   NVME_MAX_NAMESPACES);
-        return -1;
-    }
-
-    if (!nsid) {
-        for (int i = 1; i <= n->num_namespaces; i++) {
-            if (!nvme_ns(n, i)) {
-                nsid = ns->params.nsid = i;
-                break;
-            }
-        }
-
-        if (!nsid) {
-            error_setg(errp, "no free namespace id");
-            return -1;
-        }
-    } else {
-        if (n->namespaces[nsid - 1]) {
-            error_setg(errp, "namespace id '%d' is already in use", nsid);
-            return -1;
-        }
-    }
-
-    trace_pci_nvme_register_namespace(nsid);
-
-    /*
-     * If subsys is not given, namespae is always attached to the controller
-     * because there's no subsystem to manage namespace allocation.
-     */
-    if (!n->subsys) {
-        if (ns->params.detached) {
-            error_setg(errp,
-                       "detached needs nvme-subsys specified nvme or nvme-ns");
-            return -1;
-        }
-
-        return nvme_attach_namespace(n, ns, errp);
-    } else {
-        if (!ns->params.detached) {
-            return nvme_attach_namespace(n, ns, errp);
-        }
-    }
-
-    n->dmrsl = MIN_NON_ZERO(n->dmrsl,
-                            BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
-
-    return 0;
-}
-
 static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 {
     uint64_t cmb_size = n->params.cmb_size_mb * MiB;
@@ -6185,6 +6134,18 @@ static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
     return 0;
 }
 
+void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    uint32_t nsid = ns->params.nsid;
+    assert(nsid && nsid <= NVME_MAX_NAMESPACES);
+
+    n->namespaces[nsid - 1] = ns;
+    ns->attached++;
+
+    n->dmrsl = MIN_NON_ZERO(n->dmrsl,
+                            BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
+}
+
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
     NvmeCtrl *n = NVME(pci_dev);
@@ -6216,13 +6177,11 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         ns = &n->namespace;
         ns->params.nsid = 1;
 
-        if (nvme_ns_setup(ns, errp)) {
+        if (nvme_ns_setup(n, ns, errp)) {
             return;
         }
 
-        if (nvme_register_namespace(n, ns, errp)) {
-            return;
-        }
+        nvme_attach_ns(n, ns);
     }
 }
 
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 22da06986d72..fa12e3a67a75 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -51,7 +51,6 @@ hd_geometry_guess(void *blk, uint32_t cyls, uint32_t heads, uint32_t secs, int t
 
 # nvme.c
 # nvme traces for successful events
-pci_nvme_register_namespace(uint32_t nsid) "nsid %"PRIu32""
 pci_nvme_irq_msix(uint32_t vector) "raising MSI-X IRQ vector %u"
 pci_nvme_irq_pin(void) "pulsing IRQ pin"
 pci_nvme_irq_masked(void) "IRQ is masked"
-- 
2.31.1


