Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4087330F8C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:39:27 +0100 (CET)
Received: from localhost ([::1]:40166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJG6Y-0003SD-Kt
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEwJ-0003yC-Iw; Mon, 08 Mar 2021 07:24:47 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:47463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEwH-0007FY-LJ; Mon, 08 Mar 2021 07:24:47 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id E4AC536E3;
 Mon,  8 Mar 2021 07:24:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:24:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Q7itcGoTqmNSN
 MmSWuZjgBCbDtOz7K3OK9K5REGHCdo=; b=VWmSgVjjJSODS3nPaPDaxuJDnQzIj
 p8d3HEF5onPT46C3O22Dy5fg30oF/3lg4NLSvWzdQAtmnI14qKutz7EPqXcPST+a
 Hv5M+BqTXo/dps5jLhgUZkbiBAVoy7ftH+vjrqx2aGGuKUhzWFspbPOTMJleuumT
 l2gkPLnvxub1cXAevCMLrk9OCymHysR3XciaK5EnUgjbLoZXf0I47OhXGrRHMdHy
 smzgpBXxHfZVBUMFBt3l32jYjfXTp1oOQqo2EFpgXF94ri8A2iCgkXBEpGl6BXsX
 FFrCVOXGWYcAldRJGKqceUAMzbPOS1wXy48Cc/KdYwtfphSy+BfiA04JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Q7itcGoTqmNSNMmSWuZjgBCbDtOz7K3OK9K5REGHCdo=; b=I4W3W/VR
 ofetVjLAIzlA7W/mlmS+Ofs0LxIOowmed1gAA+8AOuLLibhqYtvxuS0cFjOUxEmr
 QBzmhTI6ce+T300djQD1ikeiaH7JvnXjqPw9lWLFsNf1Ub0VFfmhWyUF1FR+zXfk
 gbW4zbRwvpdFBgworwrFoaNYNplIfAYDF66Q8PB2jq+N+3JpZOjktCXLzbnTTFX/
 RlsUHLTijF5Ikctuj/iQHvwO+kB0t0lXj7flKvcjYGYjSKl6JR/WsBtNY+6BH93G
 3dBgcKJucxx5IAsKaOrB7Y3ujfww7tGzHszUkGfENYlICvXK9onrPXmIaw7Kjnfe
 8l1K4cK1SGHH+A==
X-ME-Sender: <xms:aRdGYN8FgHE8OfgMWiw1jwrLSV7CNJTMpgmgw5HlwbqHQlVtFqAhqA>
 <xme:aRdGYHtRX_3WJhTgOkH0RtEVhYiG7XmmeEUl4hnHJgef0vFgc_jCDtfOTjfZZOQoN
 wvgrtzgO94opFyYtdM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvje
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:aRdGYF2c7t_xRh96PcYC5vjRE6aWnGS9aNXO-GKJQeIO0MCm9BHp3Q>
 <xmx:aRdGYEQyQkfAZE2azfrx1e2GwbLEsMDmoVnygtfkjyM1se_LbcTvrg>
 <xmx:aRdGYBdBg6gK7m0gdgVP-YOVdX4ZS8OMRhJi8iwtQb7QbjukzOcGzg>
 <xmx:aRdGYDEntg71lhTt5xUy2bjhK1ECXSzNe_RaCOEVYLBk5re6DPpGnqRRtes>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2889B1080069;
 Mon,  8 Mar 2021 07:24:08 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 34/38] hw/block/nvme: support allocated namespace type
Date: Mon,  8 Mar 2021 13:23:09 +0100
Message-Id: <20210308122313.286938-35-its@irrelevant.dk>
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

From NVMe spec 1.4b "6.1.5. NSID and Namespace Relationships" defines
valid namespace types:

	- Unallocated: Not exists in the NVMe subsystem
	- Allocated: Exists in the NVMe subsystem
	- Inactive: Not attached to the controller
	- Active: Attached to the controller

This patch added support for allocated, but not attached namespace type:

	!nvme_ns(n, nsid) && nvme_subsys_ns(n->subsys, nsid)

nvme_ns() returns attached namespace instance of the given controller
and nvme_subsys_ns() returns allocated namespace instance in the
subsystem.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-subsys.h | 13 +++++++++
 hw/block/nvme.c        | 63 +++++++++++++++++++++++++++++++-----------
 2 files changed, 60 insertions(+), 16 deletions(-)

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 8a0732b22316..14627f9ccb41 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -30,4 +30,17 @@ typedef struct NvmeSubsystem {
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
 int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp);
 
+/*
+ * Return allocated namespace of the specified nsid in the subsystem.
+ */
+static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsystem *subsys,
+        uint32_t nsid)
+{
+    if (!subsys) {
+        return NULL;
+    }
+
+    return subsys->namespaces[nsid];
+}
+
 #endif /* NVME_SUBSYS_H */
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index bfbdc8213c2b..3bfe10f5b517 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3253,7 +3253,7 @@ static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
     return nvme_c2h(n, id, sizeof(id), req);
 }
 
-static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -3267,7 +3267,14 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
 
     ns = nvme_ns(n, nsid);
     if (unlikely(!ns)) {
-        return nvme_rpt_empty_id_struct(n, req);
+        if (!active) {
+            ns = nvme_subsys_ns(n->subsys, nsid);
+            if (!ns) {
+                return nvme_rpt_empty_id_struct(n, req);
+            }
+        } else {
+            return nvme_rpt_empty_id_struct(n, req);
+        }
     }
 
     if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
@@ -3277,7 +3284,8 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
     return NVME_INVALID_CMD_SET | NVME_DNR;
 }
 
-static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
+        bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -3291,7 +3299,14 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
 
     ns = nvme_ns(n, nsid);
     if (unlikely(!ns)) {
-        return nvme_rpt_empty_id_struct(n, req);
+        if (!active) {
+            ns = nvme_subsys_ns(n->subsys, nsid);
+            if (!ns) {
+                return nvme_rpt_empty_id_struct(n, req);
+            }
+        } else {
+            return nvme_rpt_empty_id_struct(n, req);
+        }
     }
 
     if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
@@ -3304,7 +3319,8 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
     return NVME_INVALID_FIELD | NVME_DNR;
 }
 
-static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
+        bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -3329,7 +3345,14 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
     for (i = 1; i <= n->num_namespaces; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
-            continue;
+            if (!active) {
+                ns = nvme_subsys_ns(n->subsys, i);
+                if (!ns) {
+                    continue;
+                }
+            } else {
+                continue;
+            }
         }
         if (ns->params.nsid <= min_nsid) {
             continue;
@@ -3343,7 +3366,8 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
     return nvme_c2h(n, list, data_len, req);
 }
 
-static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
+        bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -3369,7 +3393,14 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req)
     for (i = 1; i <= n->num_namespaces; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
-            continue;
+            if (!active) {
+                ns = nvme_subsys_ns(n->subsys, i);
+                if (!ns) {
+                    continue;
+                }
+            } else {
+                continue;
+            }
         }
         if (ns->params.nsid <= min_nsid || c->csi != ns->csi) {
             continue;
@@ -3452,25 +3483,25 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
 
     switch (c->cns) {
     case NVME_ID_CNS_NS:
-         /* fall through */
+        return nvme_identify_ns(n, req, true);
     case NVME_ID_CNS_NS_PRESENT:
-        return nvme_identify_ns(n, req);
+        return nvme_identify_ns(n, req, false);
     case NVME_ID_CNS_CS_NS:
-         /* fall through */
+        return nvme_identify_ns_csi(n, req, true);
     case NVME_ID_CNS_CS_NS_PRESENT:
-        return nvme_identify_ns_csi(n, req);
+        return nvme_identify_ns_csi(n, req, false);
     case NVME_ID_CNS_CTRL:
         return nvme_identify_ctrl(n, req);
     case NVME_ID_CNS_CS_CTRL:
         return nvme_identify_ctrl_csi(n, req);
     case NVME_ID_CNS_NS_ACTIVE_LIST:
-         /* fall through */
+        return nvme_identify_nslist(n, req, true);
     case NVME_ID_CNS_NS_PRESENT_LIST:
-        return nvme_identify_nslist(n, req);
+        return nvme_identify_nslist(n, req, false);
     case NVME_ID_CNS_CS_NS_ACTIVE_LIST:
-         /* fall through */
+        return nvme_identify_nslist_csi(n, req, true);
     case NVME_ID_CNS_CS_NS_PRESENT_LIST:
-        return nvme_identify_nslist_csi(n, req);
+        return nvme_identify_nslist_csi(n, req, false);
     case NVME_ID_CNS_NS_DESCR_LIST:
         return nvme_identify_ns_descr_list(n, req);
     case NVME_ID_CNS_IO_COMMAND_SET:
-- 
2.30.1


