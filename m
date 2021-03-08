Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26F6330FD0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:46:21 +0100 (CET)
Received: from localhost ([::1]:54684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGDE-0001Ns-Rx
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:46:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEwM-00042R-Do; Mon, 08 Mar 2021 07:24:50 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:44665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEwI-0007Fo-FI; Mon, 08 Mar 2021 07:24:50 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 0D45536CE;
 Mon,  8 Mar 2021 07:24:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:24:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=XNlNPyV57vQY5
 P0kLw+uiohmOHFnrISVh2DBqCbHc9Y=; b=iRz/DBxbACG0huZunKR0IEjGderJ/
 FW9/oJwizUmmIDz7RKyNm+tWuB64FTJaCBnAiqwLdjZMSyxTWCG9Y9YTEcs6oieF
 8IB+BCbrieiH5YzEsYqRjtxjGEn43WfJiIaB5rOLiMlfxLvIiKKScRAL6VZjSWxD
 om6DIcolEdCLtmwrdkznojJ/wJeHRyd3T0O13wvivq2QHBWj2FU5Dwq8rb9v+hHd
 KC4PInDh8kXqzi7fcBXOAua3ewTYocpk1thayL+Y9FCVMfVj9n+/ZfDOg9nDAE+F
 Go0/1nNsKG8hiXSjoOvj6lTlbYh3ZfV3QqAkdO90saRAjO8FoN+V6Mc6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=XNlNPyV57vQY5P0kLw+uiohmOHFnrISVh2DBqCbHc9Y=; b=mUKC9CfT
 A5INMi1fl6NnjdUBsavk3jwcszDpQjRFxk+GG5tDrCX26zmwdu2JC4gW2qZdtCdG
 t1zrJlyDCUWw8IIiCoN3KAa8detT8gO/x6uCl+ELztS2gBsNoiQKrDaA6TaECDys
 wHyziCdQpIn3t0Vh4BE9GPapOHj9CUR3RZIewu7QXFP7DcKiOfAfvY9ut/GDYk35
 6i2xDtg0nzgJwNiFySuwEcrU0KCmeQK2+s1cbipK/57EGf+fHSgQlKLXhCnqLYyS
 1i/G7HX12IJHdWZ0PvDwwDWh2JA61pYhWH6fISjSTylePf2HeWq6sYFhCngi3P8r
 Rs6eQZ1BeKxKnQ==
X-ME-Sender: <xms:bBdGYILW_WDByPH3QuTuLI0OhmnXmR6GoQ6n6aStjewQyTkkf6rnLw>
 <xme:bBdGYII9mx632waMygD2Io4RU1OKrF-FMBo0qtPxsh5i60QCGnuyNkpqd9M8d7tTe
 YHARPizA6ksXsCTAT4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeefud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:bBdGYItUlOhU-vnzfrcdUzRK9N_u7iu_GXKlzbNnMx025OBYMFgp2A>
 <xmx:bBdGYFZNJArzTs2Q_hU_m7Oewx0dR_XlPJVnNiGY1--CBndXZJZbQA>
 <xmx:bBdGYPb1ewqKWHUHLNLz6mcTM5cQBWkcUr1_cEvY2zW8wsXLOkdtTw>
 <xmx:bBdGYNN1_dyL7xJacXo7oQPuL_vs-t_rcunnUHD0-qKU1eKYe7uXEt8KvG8>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 467BD1080067;
 Mon,  8 Mar 2021 07:24:11 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 36/38] hw/block/nvme: support namespace attachment command
Date: Mon,  8 Mar 2021 13:23:11 +0100
Message-Id: <20210308122313.286938-37-its@irrelevant.dk>
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

This patch supports Namespace Attachment command for the pre-defined
nvme-ns device nodes.  Of course, attach/detach namespace should only be
supported in case 'subsys' is given.  This is because if we detach a
namespace from a controller, somebody needs to manage the detached, but
allocated namespace in the NVMe subsystem.

As command effect for the namespace attachment command is registered,
the host will be notified that namespace inventory is changed so that
host will rescan the namespace inventory after this command.  For
example, kernel driver manages this command effect via passthru IOCTL.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
[k.jensen: rebased for dma refactor]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-subsys.h | 10 +++++++
 hw/block/nvme.h        |  5 ++++
 include/block/nvme.h   |  6 +++++
 hw/block/nvme.c        | 60 +++++++++++++++++++++++++++++++++++++++++-
 hw/block/trace-events  |  2 ++
 5 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 14627f9ccb41..ef4bec928eae 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -30,6 +30,16 @@ typedef struct NvmeSubsystem {
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
 int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp);
 
+static inline NvmeCtrl *nvme_subsys_ctrl(NvmeSubsystem *subsys,
+        uint32_t cntlid)
+{
+    if (!subsys) {
+        return NULL;
+    }
+
+    return subsys->ctrls[cntlid];
+}
+
 /*
  * Return allocated namespace of the specified nsid in the subsystem.
  */
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 85a7b5a14f4e..1287bc2cd17a 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -235,6 +235,11 @@ static inline void nvme_ns_attach(NvmeCtrl *n, NvmeNamespace *ns)
     n->namespaces[nvme_nsid(ns) - 1] = ns;
 }
 
+static inline void nvme_ns_detach(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    n->namespaces[nvme_nsid(ns) - 1] = NULL;
+}
+
 static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
 {
     NvmeSQueue *sq = req->sq;
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 16d8c4c90f7e..03471a4d5abd 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -566,6 +566,7 @@ enum NvmeAdminCommands {
     NVME_ADM_CMD_ASYNC_EV_REQ   = 0x0c,
     NVME_ADM_CMD_ACTIVATE_FW    = 0x10,
     NVME_ADM_CMD_DOWNLOAD_FW    = 0x11,
+    NVME_ADM_CMD_NS_ATTACHMENT  = 0x15,
     NVME_ADM_CMD_FORMAT_NVM     = 0x80,
     NVME_ADM_CMD_SECURITY_SEND  = 0x81,
     NVME_ADM_CMD_SECURITY_RECV  = 0x82,
@@ -836,6 +837,9 @@ enum NvmeStatusCodes {
     NVME_FEAT_NOT_CHANGEABLE    = 0x010e,
     NVME_FEAT_NOT_NS_SPEC       = 0x010f,
     NVME_FW_REQ_SUSYSTEM_RESET  = 0x0110,
+    NVME_NS_ALREADY_ATTACHED    = 0x0118,
+    NVME_NS_NOT_ATTACHED        = 0x011A,
+    NVME_NS_CTRL_LIST_INVALID   = 0x011C,
     NVME_CONFLICTING_ATTRS      = 0x0180,
     NVME_INVALID_PROT_INFO      = 0x0181,
     NVME_WRITE_TO_RO            = 0x0182,
@@ -951,6 +955,7 @@ typedef struct QEMU_PACKED NvmePSD {
     uint8_t     resv[16];
 } NvmePSD;
 
+#define NVME_CONTROLLER_LIST_SIZE 2048
 #define NVME_IDENTIFY_DATA_SIZE 4096
 
 enum NvmeIdCns {
@@ -1055,6 +1060,7 @@ enum NvmeIdCtrlOacs {
     NVME_OACS_SECURITY  = 1 << 0,
     NVME_OACS_FORMAT    = 1 << 1,
     NVME_OACS_FW        = 1 << 2,
+    NVME_OACS_NS_MGMT   = 1 << 3,
 };
 
 enum NvmeIdCtrlOncs {
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 3f86da6ebc5c..fc38c3e4629d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -187,6 +187,7 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_SET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_GET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_NS_ATTACHMENT]    = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,
 };
 
 static const uint32_t nvme_cse_iocs_none[256];
@@ -3896,6 +3897,61 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeRequest *req)
     return NVME_NO_COMPLETE;
 }
 
+static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns);
+static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeNamespace *ns;
+    NvmeCtrl *ctrl;
+    uint16_t list[NVME_CONTROLLER_LIST_SIZE] = {};
+    uint32_t nsid = le32_to_cpu(req->cmd.nsid);
+    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
+    bool attach = !(dw10 & 0xf);
+    uint16_t *nr_ids = &list[0];
+    uint16_t *ids = &list[1];
+    uint16_t ret;
+    int i;
+
+    trace_pci_nvme_ns_attachment(nvme_cid(req), dw10 & 0xf);
+
+    ns = nvme_subsys_ns(n->subsys, nsid);
+    if (!ns) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    ret = nvme_h2c(n, (uint8_t *)list, 4096, req);
+    if (ret) {
+        return ret;
+    }
+
+    if (!*nr_ids) {
+        return NVME_NS_CTRL_LIST_INVALID | NVME_DNR;
+    }
+
+    for (i = 0; i < *nr_ids; i++) {
+        ctrl = nvme_subsys_ctrl(n->subsys, ids[i]);
+        if (!ctrl) {
+            return NVME_NS_CTRL_LIST_INVALID | NVME_DNR;
+        }
+
+        if (attach) {
+            if (nvme_ns_is_attached(ctrl, ns)) {
+                return NVME_NS_ALREADY_ATTACHED | NVME_DNR;
+            }
+
+            nvme_ns_attach(ctrl, ns);
+            __nvme_select_ns_iocs(ctrl, ns);
+        } else {
+            if (!nvme_ns_is_attached(ctrl, ns)) {
+                return NVME_NS_NOT_ATTACHED | NVME_DNR;
+            }
+
+            nvme_ns_detach(ctrl, ns);
+        }
+    }
+
+    return NVME_SUCCESS;
+}
+
 static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opcode,
@@ -3932,6 +3988,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_get_feature(n, req);
     case NVME_ADM_CMD_ASYNC_EV_REQ:
         return nvme_aer(n, req);
+    case NVME_ADM_CMD_NS_ATTACHMENT:
+        return nvme_ns_attachment(n, req);
     default:
         assert(false);
     }
@@ -4901,7 +4959,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
-    id->oacs = cpu_to_le16(0);
+    id->oacs = cpu_to_le16(NVME_OACS_NS_MGMT);
     id->cntrltype = 0x1;
 
     /*
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 60a076cea54f..c5dba935a0c1 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -84,6 +84,8 @@ pci_nvme_aer(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aer_aerl_exceeded(void) "aerl exceeded"
 pci_nvme_aer_masked(uint8_t type, uint8_t mask) "type 0x%"PRIx8" mask 0x%"PRIx8""
 pci_nvme_aer_post_cqe(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
+pci_nvme_ns_attachment(uint16_t cid, uint8_t sel) "cid %"PRIu16", sel=0x%"PRIx8""
+pci_nvme_ns_attachment_attach(uint16_t cntlid, uint32_t nsid) "cntlid=0x%"PRIx16", nsid=0x%"PRIx32""
 pci_nvme_enqueue_event(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
 pci_nvme_enqueue_event_noqueue(int queued) "queued %d"
 pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
-- 
2.30.1


