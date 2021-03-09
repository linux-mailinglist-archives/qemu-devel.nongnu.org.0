Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A1433258D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:37:33 +0100 (CET)
Received: from localhost ([::1]:42312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbcB-0006JS-Vt
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJap4-0000gn-3e; Tue, 09 Mar 2021 06:46:46 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:33905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaow-0000nE-2X; Tue, 09 Mar 2021 06:46:45 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 3850C12FC;
 Tue,  9 Mar 2021 06:46:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:46:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=dRgKH07aE4wyM
 uJtz6k9DuMLBzKEnzW2uip9qqNh/9g=; b=0oFSJ3y9IEGimyj/3c+WOLXboFSIT
 hd7oPapBnCZ/la3kHdvID5W3rIj+k9iLr4gdlqz/oa/Sqn67gQNqUhUbddWKTd9H
 SOJz+2Jxd7devY7xH7pI9juPSPUQP2lA7VIgdRUhR2DXjYU6WePptgDD1g5vci35
 Nv/PZSBmchZHZD8+pxVyoXsPgn2wq4T5XM+55233wk3be/os++rH5sNtLVg+lJyW
 rD+8mQiXSWc5Ox3BbsaDiatvNArBoByt/LOGWjrpwWlxbngCS99P7+3dzRjS93LS
 soFMGynJ3lC3kD9YE9WRZjzRg/ZjlTHxiRMDca0AcKTHdHDxlOWiaRF1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=dRgKH07aE4wyMuJtz6k9DuMLBzKEnzW2uip9qqNh/9g=; b=FSf7aWId
 ynm6SQEsJH6ZJCG2hc/vsV4Elmh2t5F0opV63a/NElJk1Yp1zbmO4eBS6SwXP7mQ
 dB6lYF2Hxi1eVGtWe7/8RMMas5nUy3mcSXQZm8cm8r7cUbv8T2l4Z4O1NEpqehHq
 RzeThE3amKLDdgId6/8ALtjocTbuFfzfl5KSoXk4lUVMewo1GoRJrCsG0btGvgCz
 2Q3U7FAG4cLD/Wd2C9YsvTQUXgkNHi+7SA4ZAEJgNDnG4YoZ8naplE/0TRTw3xiy
 H9PDBzW9/IasGcQUwhuplEacZvtbI+WZsKiPOOtBVp1GUeWxsqPIy/Gh/80Eo2dB
 xgyzi8GBd2FiKA==
X-ME-Sender: <xms:_F9HYIC9j00WzG79jiLbCOMucy1YmukU2vjuUoPRb-JO-BFW7V4maQ>
 <xme:_F9HYKjLaiS-5Q5LOZblHjjHwD5J4XEcuQt_IfTkT4lhdFuCmnDnEL0-GrPNPpfXI
 YYNdeKL0vEgoBEqMe0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvvd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:_F9HYLn-sdrjMYFKlh9j8J2drxM75YC7XKpRnUI3jdg9itxfENx0hQ>
 <xmx:_F9HYOwWE47PP2nRww6wlriwSm-ZQBVzGRkygbVusniV7DAsv5xxGA>
 <xmx:_F9HYNSOjKqqE_BOcCC9S-bvTn_9Nadso0nVQVjSv2Ohy2i3j29sjw>
 <xmx:_F9HYIEHsu4jYTx5MzceWa7nl9B4zXF-YpeKpMwrrFc7G-5aiZkVKVsWfqU>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5EF3524005C;
 Tue,  9 Mar 2021 06:46:03 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 31/38] hw/block/nvme: support namespace detach
Date: Tue,  9 Mar 2021 12:45:05 +0100
Message-Id: <20210309114512.536489-32-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
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

Given that now we have nvme-subsys device supported, we can manage
namespace allocated, but not attached: detached.  This patch introduced
a parameter for nvme-ns device named 'detached'.  This parameter
indicates whether the given namespace device is detached from
a entire NVMe subsystem('subsys' given case, shared namespace) or a
controller('bus' given case, private namespace).

- Allocated namespace

  1) Shared ns in the subsystem 'subsys0':

     -device nvme-ns,id=ns1,drive=blknvme0,nsid=1,subsys=subsys0,detached=true

  2) Private ns for the controller 'nvme0' of the subsystem 'subsys0':

     -device nvme-subsys,id=subsys0
     -device nvme,serial=foo,id=nvme0,subsys=subsys0
     -device nvme-ns,id=ns1,drive=blknvme0,nsid=1,bus=nvme0,detached=true

  3) (Invalid case) Controller 'nvme0' has no subsystem to manage ns:

     -device nvme,serial=foo,id=nvme0
     -device nvme-ns,id=ns1,drive=blknvme0,nsid=1,bus=nvme0,detached=true

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h     |  1 +
 hw/block/nvme-subsys.h |  1 +
 hw/block/nvme.h        | 22 ++++++++++++++++++++++
 hw/block/nvme-ns.c     |  1 +
 hw/block/nvme.c        | 41 +++++++++++++++++++++++++++++++++++++++--
 5 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 7af6884862b5..b0c00e115d81 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -26,6 +26,7 @@ typedef struct NvmeZone {
 } NvmeZone;
 
 typedef struct NvmeNamespaceParams {
+    bool     detached;
     uint32_t nsid;
     QemuUUID uuid;
 
diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 7a54a8512079..507efcd23f9b 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -23,6 +23,7 @@ typedef struct NvmeSubsystem {
     uint8_t     subnqn[256];
 
     NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
+    /* Allocated namespaces for this subsystem */
     NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES];
 
     struct {
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 96afefa8c9fb..cd8d40634411 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -189,6 +189,10 @@ typedef struct NvmeCtrl {
     NvmeSubsystem   *subsys;
 
     NvmeNamespace   namespace;
+    /*
+     * Attached namespaces to this controller.  If subsys is not given, all
+     * namespaces in this list will always be attached.
+     */
     NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES];
     NvmeSQueue      **sq;
     NvmeCQueue      **cq;
@@ -207,6 +211,24 @@ static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
     return n->namespaces[nsid - 1];
 }
 
+static inline bool nvme_ns_is_attached(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    int nsid;
+
+    for (nsid = 1; nsid <= n->num_namespaces; nsid++) {
+        if (nvme_ns(n, nsid) == ns) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
+static inline void nvme_ns_attach(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    n->namespaces[nvme_nsid(ns) - 1] = ns;
+}
+
 static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
 {
     NvmeSQueue *sq = req->sq;
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 0e8760020483..eda6a0c003a4 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -399,6 +399,7 @@ static Property nvme_ns_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
     DEFINE_PROP_LINK("subsys", NvmeNamespace, subsys, TYPE_NVME_SUBSYS,
                      NvmeSubsystem *),
+    DEFINE_PROP_BOOL("detached", NvmeNamespace, params.detached, false),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
     DEFINE_PROP_UINT16("mssrl", NvmeNamespace, params.mssrl, 128),
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index bfab80c45789..1790a66cb8f7 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -27,7 +27,7 @@
  *              subsys=<subsys_id>
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
- *              subsys=<subsys_id>
+ *              subsys=<subsys_id>,detached=<true|false[optional]>
  *
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
  * offset 0 in BAR2 and supports only WDS, RDS and SQS for now. By default, the
@@ -91,6 +91,13 @@
  *   subsystem. Otherwise, `bus` must be given to attach this namespace to a
  *   specific controller as a non-shared namespace.
  *
+ * - `detached`
+ *   This parameter is only valid together with the `subsys` parameter. If left
+ *   at the default value (`false/off`), the namespace will be attached to all
+ *   controllers in the NVMe subsystem at boot-up. If set to `true/on`, the
+ *   namespace will be be available in the subsystem not not attached to any
+ *   controllers.
+ *
  * Setting `zoned` to true selects Zoned Command Set at the namespace.
  * In this case, the following namespace properties are available to configure
  * zoned operation:
@@ -4655,6 +4662,20 @@ static void nvme_init_state(NvmeCtrl *n)
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
 }
 
+static int nvme_attach_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
+{
+    if (nvme_ns_is_attached(n, ns)) {
+        error_setg(errp,
+                   "namespace %d is already attached to controller %d",
+                   nvme_nsid(ns), n->cntlid);
+        return -1;
+    }
+
+    nvme_ns_attach(n, ns);
+
+    return 0;
+}
+
 int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 {
     uint32_t nsid = nvme_nsid(ns);
@@ -4686,7 +4707,23 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 
     trace_pci_nvme_register_namespace(nsid);
 
-    n->namespaces[nsid - 1] = ns;
+    /*
+     * If subsys is not given, namespae is always attached to the controller
+     * because there's no subsystem to manage namespace allocation.
+     */
+    if (!n->subsys) {
+        if (ns->params.detached) {
+            error_setg(errp,
+                       "detached needs nvme-subsys specified nvme or nvme-ns");
+            return -1;
+        }
+
+        return nvme_attach_namespace(n, ns, errp);
+    } else {
+        if (!ns->params.detached) {
+            return nvme_attach_namespace(n, ns, errp);
+        }
+    }
 
     n->dmrsl = MIN_NON_ZERO(n->dmrsl,
                             BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
-- 
2.30.1


