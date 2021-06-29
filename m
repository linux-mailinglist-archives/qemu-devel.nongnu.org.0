Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA3C3B7859
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:13:15 +0200 (CEST)
Received: from localhost ([::1]:52028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJAY-0005hx-Ow
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyInQ-00026O-41; Tue, 29 Jun 2021 14:49:20 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:57869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyInO-0005kf-86; Tue, 29 Jun 2021 14:49:19 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id B27022B00AC9;
 Tue, 29 Jun 2021 14:48:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 29 Jun 2021 14:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=I8VlBmrxV4OB7
 HuvEgWJH7oyQEZhZg8hJWmu/RUDCdw=; b=iQ6lEA2qgZxVu8fOl5HRDYTg9pH9A
 IaMiBbIzVe9JOAXlPQgSqLZGhEQWjei8qZBtEWwAko2zdPGix5F6sOVWb2lfKveW
 /4rwbNFeZDOaP+9449+gWq+epOTtN9JAtxDBGifR8kOLi7LAPI9CFX1UcI4W6mOW
 VPM97TFsvDMTbXDJT2yPW6dO0VRoSt3VSZOJc92ITXBeljDHaULJ5uhgs3d9QOaj
 cLyl0OB1uFfv3ZC19CPIHiqQ/ilL2JdaJvFunSq0LmsdxAmLkLNM7Pr2yRO5QONc
 W82q9IyGz+w3GIishNk4ZjPCLR0N+I/5V0eFnwxXAlO/U9Ux2YpOB6V2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=I8VlBmrxV4OB7HuvEgWJH7oyQEZhZg8hJWmu/RUDCdw=; b=r3+4AJ/X
 dS6LoqSH0Euh1B/60NL8FVXVup/0HpTRZcyQv7avD/3hS+rFM4fX7BJ1cTZoR9D5
 mYuYrGNxY2c1uU4eZeVPdkj3U3gENehkG4+yXsE6Zz2/rSH2F3OmqYPKlpLzvh43
 ppOC0somTmVnV84hQ+vXqM+pzAsjsLxBJK4lgceBtj+sJC9JzlEIWwpR7hHqXQi8
 dk1kYNHNVb2CuwtA2oplEA3jR6Dr6tgmczxScSazbXaA9l54uzx4b4LNHMVyU+2x
 34Tp+YZ+jIeUG3g7nwJWrhpeYRvCUwdpbHs4qU96LDu1rQ7ssCkHXa+VMPN85qtW
 us2+iguO/NhYvQ==
X-ME-Sender: <xms:F2vbYCDVeZLKbfO194UlJY-1Wsbrly5i5KfYXTvhYwbNozgtIYIHhA>
 <xme:F2vbYMia0FTiI5wNSjJPpHg2CfEG3jq4elE8CHr8mU85rJHaVXllA7dtJbGZFELqk
 4blJ8YFHq772NsflkA>
X-ME-Received: <xmr:F2vbYFnvoZ8Q4QM5-pzFUJ93w2LZqUfiLLj9ttV3dyjUTmQHHZZD5hmcjcIpyHh5vwxKWfwYjWbV_VMki3KMJxWRNTQxBcYonbtj0dJuyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:F2vbYAxL7I08Fs2En-tin6qjXoeza2x8tXqvF4dwuRFbnFzBWZh99w>
 <xmx:F2vbYHSAXIycRObbcLaT8Z3Gg5adD71Cnv-YoGjgB6c2Y1NDo5ln3Q>
 <xmx:F2vbYLaFoWJBHRGlr9gDbQ1MyZy5xd_mDGdCpU23ZuKLvOpoS7jeEA>
 <xmx:F2vbYPZxHGPwya2--uDq3vBxZ2X-O25wRzNZXvaRzplRxiq0LuBhI3NTbPQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:48:53 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 19/23] hw/nvme: fix endianess conversion and add controller list
Date: Tue, 29 Jun 2021 20:47:39 +0200
Message-Id: <20210629184743.230173-20-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629184743.230173-1-its@irrelevant.dk>
References: <20210629184743.230173-1-its@irrelevant.dk>
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Add the controller identifiers list CNS 0x13, available list of ctrls
in NVM Subsystem that may or may not be attached to namespaces.

In Identify Ctrl List of the CNS 0x12 and 0x13 no endian conversion
for the nsid field.

These two CNS values shows affect when there exists a Subsystem.
Added condition if there is no Subsystem return invalid field in
command.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h |  1 +
 hw/nvme/ctrl.c       | 26 ++++++++++++++++++--------
 hw/nvme/trace-events |  2 +-
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 0fabe28b7bdd..527105fafc0b 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -988,6 +988,7 @@ enum NvmeIdCns {
     NVME_ID_CNS_NS_PRESENT_LIST       = 0x10,
     NVME_ID_CNS_NS_PRESENT            = 0x11,
     NVME_ID_CNS_NS_ATTACHED_CTRL_LIST = 0x12,
+    NVME_ID_CNS_CTRL_LIST             = 0x13,
     NVME_ID_CNS_CS_NS_PRESENT_LIST    = 0x1a,
     NVME_ID_CNS_CS_NS_PRESENT         = 0x1b,
     NVME_ID_CNS_IO_COMMAND_SET        = 0x1c,
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 6a0c2cc48422..541c0819d5b0 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4449,9 +4449,11 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
     return NVME_INVALID_CMD_SET | NVME_DNR;
 }
 
-static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
+                                        bool attached)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
+    uint32_t nsid = le32_to_cpu(c->nsid);
     uint16_t min_id = le16_to_cpu(c->ctrlid);
     uint16_t list[NVME_CONTROLLER_LIST_SIZE] = {};
     uint16_t *ids = &list[1];
@@ -4459,15 +4461,21 @@ static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
     NvmeCtrl *ctrl;
     int cntlid, nr_ids = 0;
 
-    trace_pci_nvme_identify_ns_attached_list(min_id);
+    trace_pci_nvme_identify_ctrl_list(c->cns, min_id);
 
-    if (c->nsid == NVME_NSID_BROADCAST) {
+    if (!n->subsys) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    ns = nvme_subsys_ns(n->subsys, c->nsid);
-    if (!ns) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+    if (attached) {
+        if (nsid == NVME_NSID_BROADCAST) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+
+        ns = nvme_subsys_ns(n->subsys, nsid);
+        if (!ns) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
     }
 
     for (cntlid = min_id; cntlid < ARRAY_SIZE(n->subsys->ctrls); cntlid++) {
@@ -4476,7 +4484,7 @@ static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
             continue;
         }
 
-        if (!nvme_ns(ctrl, c->nsid)) {
+        if (attached && !nvme_ns(ctrl, nsid)) {
             continue;
         }
 
@@ -4703,7 +4711,9 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
     case NVME_ID_CNS_NS_PRESENT:
         return nvme_identify_ns(n, req, false);
     case NVME_ID_CNS_NS_ATTACHED_CTRL_LIST:
-        return nvme_identify_ns_attached_list(n, req);
+        return nvme_identify_ctrl_list(n, req, true);
+    case NVME_ID_CNS_CTRL_LIST:
+        return nvme_identify_ctrl_list(n, req, false);
     case NVME_ID_CNS_CS_NS:
         return nvme_identify_ns_csi(n, req, true);
     case NVME_ID_CNS_CS_NS_PRESENT:
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index 48d10c36e85b..f9a1f14e2638 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -51,7 +51,7 @@ pci_nvme_identify(uint16_t cid, uint8_t cns, uint16_t ctrlid, uint8_t csi) "cid
 pci_nvme_identify_ctrl(void) "identify controller"
 pci_nvme_identify_ctrl_csi(uint8_t csi) "identify controller, csi=0x%"PRIx8""
 pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
-pci_nvme_identify_ns_attached_list(uint16_t cntid) "cntid=%"PRIu16""
+pci_nvme_identify_ctrl_list(uint8_t cns, uint16_t cntid) "cns 0x%"PRIx8" cntid %"PRIu16""
 pci_nvme_identify_ns_csi(uint32_t ns, uint8_t csi) "nsid=%"PRIu32", csi=0x%"PRIx8""
 pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_nslist_csi(uint16_t ns, uint8_t csi) "nsid=%"PRIu16", csi=0x%"PRIx8""
-- 
2.32.0


