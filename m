Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3686C3325C7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:51:21 +0100 (CET)
Received: from localhost ([::1]:39342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbpY-0000cm-67
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:51:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJap7-0000kf-B4; Tue, 09 Mar 2021 06:46:49 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:60987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJap4-0000qp-OV; Tue, 09 Mar 2021 06:46:49 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D467C493;
 Tue,  9 Mar 2021 06:46:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Sl/CpQHhFqujk
 703EFpjgErX5Eb/+dG+EgZ6JirRlng=; b=LSkdRc6goHkqMHiqBMl5hkJ/zKsHI
 GJE2+Je4zYe5Z9bQmMan+wJO31irJjmPEBWMcADOI8S+Ileq9VoTV3WVfPEDy/N3
 NqZqSt4D/saqUFwfEzEsmTMEC/8Tzj7WPlvZ/FwjArLZwwPK1EmKEV3p7733dB9k
 x1IwXTwADg/lX1PjStX1J9hs2ITdNWkkxdwRSOgQR+pFj3YskDf+CaSrA2LO35E1
 GYnXnMxjYl6suUN0tmlWDhI5ARY4SRTSoPd5e18irtdBUhxHUTljLrBJ0qzBBqQK
 M3uDls/GR67tgdWL4L5rlYIHfTSSnG8ByQ+mQmSK/p5Jrmet2A5AdAyZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Sl/CpQHhFqujk703EFpjgErX5Eb/+dG+EgZ6JirRlng=; b=OUOOd1eL
 YUlLT0EXc7/Z9DrGXm3dmGelp3GkSnvMl32bG/NiQW6YFY+fIv5kEKk1YVo300io
 z1OD52CUDcZNfLS02L/dIBadMMImB9lT1Nmz0BR2zO9DSJeEk9yEPfE7a7QtCc3j
 q+qohPYGmqLHKRF0I2IedrVzRoI6k0TXbGoEwZd6zl5VfipUZQpSORE7yv5hQXM1
 Bq3BduNwWf2cIxwaaham4CDg9VywDpDo4wecYez2DhVVKVdA//oQQGviJZy1hBDT
 1wrQ12cZ220KwLokYXGGb8FD0QB0+1FUfEhJZAsZIFaiEHueBITEXFrIMQnREqUr
 zN9RZct282O9qg==
X-ME-Sender: <xms:AWBHYBDJ8_Jvp-zaRKTO2wjkcrbhMZKbOTiJu907-q2ludTJAwnaYA>
 <xme:AWBHYPgXJ_vJ33kQWSBJJFjG7AF1r3hHilC0Eyq3MSH5zpdoMxPr87GvGNDoRtoSh
 7U70drmeUBen_5-28w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvvd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:AWBHYMlcLi-gKuqY5YlbXVCF6MrvowcSbd4VuGEyFx8w2KMlEjQolg>
 <xmx:AWBHYLyDSdpkIJFB6TObrBxaviCH81W1t_7jdugqqSJ926tVjwyYaQ>
 <xmx:AWBHYGTDO7Ox1Uhu4PK-o9RlI1tFylf6GD7D6Lu4GAVtjp5ENFFSNA>
 <xmx:AWBHYJEJQvqJT3zVE0A9FLWXnsEW3fXgPJk8GQ7mbktV0Adow5NKZ7vBfiE>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0BA8924005C;
 Tue,  9 Mar 2021 06:46:07 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 34/38] hw/block/nvme: support allocated namespace type
Date: Tue,  9 Mar 2021 12:45:08 +0100
Message-Id: <20210309114512.536489-35-its@irrelevant.dk>
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
index 65a8bcda030d..83a6427b6e9d 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -34,4 +34,17 @@ typedef struct NvmeSubsystem {
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
index 1790a66cb8f7..414473c19c56 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3262,7 +3262,7 @@ static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
     return nvme_c2h(n, id, sizeof(id), req);
 }
 
-static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -3276,7 +3276,14 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
 
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
@@ -3286,7 +3293,8 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
     return NVME_INVALID_CMD_SET | NVME_DNR;
 }
 
-static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
+        bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -3300,7 +3308,14 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
 
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
@@ -3313,7 +3328,8 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
     return NVME_INVALID_FIELD | NVME_DNR;
 }
 
-static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
+        bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -3338,7 +3354,14 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
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
@@ -3352,7 +3375,8 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
     return nvme_c2h(n, list, data_len, req);
 }
 
-static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
+        bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -3378,7 +3402,14 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req)
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
@@ -3461,25 +3492,25 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
 
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


