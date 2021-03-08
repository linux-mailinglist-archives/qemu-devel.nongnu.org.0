Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C304330F17
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:26:52 +0100 (CET)
Received: from localhost ([::1]:42862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFuN-0000JV-0T
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEwB-0003qS-Rt; Mon, 08 Mar 2021 07:24:40 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:49513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEw7-0007Bp-AA; Mon, 08 Mar 2021 07:24:39 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 493C4365D;
 Mon,  8 Mar 2021 07:24:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:24:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ZvUwlwOxhzcrk
 JcvZn5Cih4e1iYWicZSnRRvxM7zUpc=; b=iWvqJeMdgwDteHs+uirBr7li17oJW
 qMP+QTpdiK2uyQOtYmhjQy6pCLhdkvyI4GDG6Fg0UUDPkoJPJ3Tx/z45XOmg32Dh
 7oo1Gz9S3XpBbocpTtQBIjI49mJckG1gJjUhuDDbTVIUvtqxAd0sd0pi+Ps3HM0w
 55HpzfapvBz7ZjxeERAVUVQD1hYgEIEMrmqPyfit1n3BhtiVi8SRJdglWs7LU5YR
 bkoe58bknW07SxcbHBDQmSVV23regaiPb71YxM02/QNwxE61flfN30CWaReY1ZF0
 s1c12e0dTmvYeIAy+wwE1RWClbiyDA5GPYPkgcHRiexWAbMjecOdLSJ0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ZvUwlwOxhzcrkJcvZn5Cih4e1iYWicZSnRRvxM7zUpc=; b=HmOi0o0W
 0Cyt1AJUFBTr5Ot45AAmkxSrbg5chMjZzhkv7lELUJE+Y/XjgdZXZHHW5/Rl867r
 LDpp3p4eFDeqjAFjW9LJALuakHfqrTr6YKDMHZvSeBsSjCl5zDgh9BHVKwa67F4E
 +iUkjkWJE/4Q+K9XKGtqdyNKginw2x2AtbT2MakGi4DlAD3Rt1H3UdCjj/OkvFrG
 jc6qEX6YqwPcxRW/Rp6XfmUIpfAgOtMZ8sg1pKcLqsDQ/epcsolvujVjrn7wDd+6
 EzekDtBQ3Sf5G5DDC09i6w31ikGvsapVAfLmBujpsWcBe/Fp/wO/GoLPAR82V4m1
 P2M8aYJbktEGRg==
X-ME-Sender: <xms:ZBdGYE6_43ZuFnPVVFWi33vUwsG-RhBG4uAXfIHDYpS8AUnVuR4z8g>
 <xme:ZBdGYDuW4BXqX-qaRchUJypHhtcgcNt4ZqKbrT83MB6OU1jFOb0qj7-CJYxgq6Laf
 tMUMOG7GLk1Kf2Wf3Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvje
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ZBdGYN4uPm3eS8gRGhxLtfACpTxbvrkNr4ncjJM0nzak-Tc_njVWcg>
 <xmx:ZBdGYGW202gVKIt22ZUmTm4lQOJKs49thr43DrOs_2X7FNMw1aSKSA>
 <xmx:ZBdGYH96ChvlWKRTT0GTstRBOOIAXN8P3J6cnuSBXetMifJ1Q-K4pQ>
 <xmx:ZBdGYNKvY39phMlF_djQcrB4_bcy8kqLlxTquYHVotpaqgaUCSpCjtrjA6U>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6D33F1080066;
 Mon,  8 Mar 2021 07:24:03 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 31/38] hw/block/nvme: support namespace detach
Date: Mon,  8 Mar 2021 13:23:06 +0100
Message-Id: <20210308122313.286938-32-its@irrelevant.dk>
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
index ccf6a71398d3..890d118117dc 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -23,6 +23,7 @@ typedef struct NvmeSubsystem {
     uint8_t     subnqn[256];
 
     NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
+    /* Allocated namespaces for this subsystem */
     NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES];
 } NvmeSubsystem;
 
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
index 22bd8403496b..bfbdc8213c2b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -23,7 +23,7 @@
  *              max_ioqpairs=<N[optional]>, \
  *              aerl=<N[optional]>,aer_max_queued=<N[optional]>, \
  *              mdts=<N[optional]>,zoned.zasl=<N[optional]>, \
- *              subsys=<subsys_id> \
+ *              subsys=<subsys_id>,detached=<true|false[optional]>
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
  *              subsys=<subsys_id>
@@ -82,6 +82,13 @@
  *   controllers in the subsystem. Otherwise, `bus` must be given to attach
  *   this namespace to a specified single controller as a non-shared namespace.
  *
+ * - `detached`
+ *   Not to attach the namespace device to controllers in the NVMe subsystem
+ *   during boot-up. If not given, namespaces are all attahced to all
+ *   controllers in the subsystem by default.
+ *   It's mutual exclusive with 'bus' parameter. It's only valid in case
+ *   `subsys` is provided.
+ *
  * Setting `zoned` to true selects Zoned Command Set at the namespace.
  * In this case, the following namespace properties are available to configure
  * zoned operation:
@@ -4646,6 +4653,20 @@ static void nvme_init_state(NvmeCtrl *n)
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
@@ -4677,7 +4698,23 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 
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


