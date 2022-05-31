Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09057538B36
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 08:12:21 +0200 (CEST)
Received: from localhost ([::1]:50964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvv75-0000LB-UF
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 02:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nvuyw-0006NC-3W; Tue, 31 May 2022 02:03:54 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nvuyq-0001xM-09; Tue, 31 May 2022 02:03:53 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EAF845C01C6;
 Tue, 31 May 2022 02:03:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 31 May 2022 02:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1653977025; x=1654063425; bh=4CcOpKUhm/
 8teOUrv9OL1sKYmouyEtHzdm2U/qmEo6Q=; b=Z9EpAbnc+lCwbizhZVGgKKTyxj
 WAzu9jJEGDM7Swe+H1NAqKxU83vI1bcD5DIUeiAAYtJpk3bhZ0uYxPVV10zLsmY6
 9HcJbhmTu3Vr5AxC8e5bV+H5oMuB4q+BlqfhIWL6E/S64yI1jvnnEJNxRb5Ou2et
 LMUrQgPAZsR+9/2aI3IaXaK5hhh4gOwSxpg+WlzWuc3FOmeyoPl2ykw0KpsNkRB8
 ZFu/vOSUIk3VnLtJYJnChmciyINeuWrZ1rooid98G/vatexjyg9qt1hzrgurpB7j
 xuK0Ctq0U+SwGBxdVPeNEg32opnxBIfGLODFo0cWeC62+efm7qjk8HdYEl0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1653977025; x=1654063425; bh=4CcOpKUhm/8teOUrv9OL1sKYmouyEtHzdm2
 U/qmEo6Q=; b=QxyQV1koN9S13lG2kDkNQ2SwU6Q9QBkK7B+mb8dqgOv/k7XmyHB
 0NEREKXpx4DqfxVRPk7hnJWJ/cOSBBAJF2kjSOBXqxiIYSJ+i2xWs3FBrS4fiEBc
 zVWfVmofwJFcrmiKVUhDR/Q+Ijrlo2Y607Co/8nGJoltbIR6XokmXljB/LTwyKWB
 c8pSQ8e3xP8sdTwKCxeDCjcJ02IIoYR2o9JcX0/7WT/HUP06Aj0V+x1swpAWTB9Q
 lNT1XU67HH6zmrQksN2OkJYx2H+Mh6c+boz4KfWp6p6Qx3DqYuJcumqOrggc8s1C
 vHhr7sIfqTCV2q+IVkcuvMo0wG+G6a/waBQ==
X-ME-Sender: <xms:wa-VYsrLZ9g-Jo2tLSxvG7JqIQve44CMz2zFaHxyBt6SKbprWsiBgA>
 <xme:wa-VYipdd7eK6YfuH_ncwf6aIKL9pm6pt8F7jKPXYj726hXLpjtw-9_GvY_HS-E7C
 9_tQOcVO8fzk_mI_mQ>
X-ME-Received: <xmr:wa-VYhO_nqG4lQSCpIT70WKd1Bfcr4xZVZBczXPp5DtRg-mpK5ezCWm1rri9ecrTqYrebxbyx04KPBHZ9sgY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeejgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnheptdeludfhgeelheelledtjefffeejtdeluedvgfetveffgeetvdevkeehieeikeet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:wa-VYj7ZqVSKlyrLkPbIPMeEr8N6Dw_E_kCCAwx0TiPaEjSLA09OsQ>
 <xmx:wa-VYr736uqpAL1Qv_n-c3UGf_QEc4_6sdn2yBSH5vE7ebOH0rBbLQ>
 <xmx:wa-VYjjMrsg44ilRfwwBFuz26Dk73b6ms220cvXIRwnKnjGI-nKksA>
 <xmx:wa-VYluSFzM-4M4TTHgZYjKpELYHAos8Ew-MS0lFnmrazn8DO_1qMw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 May 2022 02:03:43 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Klaus Jensen <its@irrelevant.dk>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH] hw/nvme: add command set independent identify namespace
Date: Tue, 31 May 2022 08:03:42 +0200
Message-Id: <20220531060342.2556973-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add support for the command set independent identify namespace data
structure (CNS 0x8).

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 28 ++++++++++++++++++++++++++++
 hw/nvme/trace-events |  1 +
 include/block/nvme.h | 16 ++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 1e6e0fcad918..1da99a3c2f23 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4793,6 +4793,32 @@ static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
     return nvme_c2h(n, (uint8_t *)list, sizeof(list), req);
 }
 
+static uint16_t nvme_identify_ns_ind(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeNamespace *ns;
+    NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
+    uint32_t nsid = le32_to_cpu(c->nsid);
+    NvmeIdNsIndependent id;
+
+    trace_pci_nvme_identify_ns_ind(nsid);
+
+    if (!nvme_nsid_valid(n, nsid)) {
+        return NVME_INVALID_NSID | NVME_DNR;
+    }
+
+    ns = nvme_ns(n, nsid);
+    if (unlikely(!ns)) {
+        return nvme_rpt_empty_id_struct(n, req);
+    }
+
+    id = (NvmeIdNsIndependent) {
+        .nmic = ns->params.shared ? 0x1 : 0x0,
+        .nstat = 0x1,
+    };
+
+    return nvme_c2h(n, &id, sizeof(id), req);
+}
+
 static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
                                      bool active)
 {
@@ -5011,6 +5037,8 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
         return nvme_identify_ctrl_list(n, req, false);
     case NVME_ID_CNS_CS_NS:
         return nvme_identify_ns_csi(n, req, true);
+    case NVME_ID_CNS_CS_IND_NS:
+        return nvme_identify_ns_ind(n, req);
     case NVME_ID_CNS_CS_NS_PRESENT:
         return nvme_identify_ns_csi(n, req, false);
     case NVME_ID_CNS_CTRL:
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index ff1b4589692b..2a7a3ab2756e 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -55,6 +55,7 @@ pci_nvme_identify(uint16_t cid, uint8_t cns, uint16_t ctrlid, uint8_t csi) "cid
 pci_nvme_identify_ctrl(void) "identify controller"
 pci_nvme_identify_ctrl_csi(uint8_t csi) "identify controller, csi=0x%"PRIx8""
 pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
+pci_nvme_identify_ns_ind(uint32_t nsid) "nsid %"PRIu32""
 pci_nvme_identify_ctrl_list(uint8_t cns, uint16_t cntid) "cns 0x%"PRIx8" cntid %"PRIu16""
 pci_nvme_identify_ns_csi(uint32_t ns, uint8_t csi) "nsid=%"PRIu32", csi=0x%"PRIx8""
 pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 3737351cc815..3888fb804619 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1029,6 +1029,7 @@ enum NvmeIdCns {
     NVME_ID_CNS_CS_NS                 = 0x05,
     NVME_ID_CNS_CS_CTRL               = 0x06,
     NVME_ID_CNS_CS_NS_ACTIVE_LIST     = 0x07,
+    NVME_ID_CNS_CS_IND_NS             = 0x08,
     NVME_ID_CNS_NS_PRESENT_LIST       = 0x10,
     NVME_ID_CNS_NS_PRESENT            = 0x11,
     NVME_ID_CNS_NS_ATTACHED_CTRL_LIST = 0x12,
@@ -1346,6 +1347,20 @@ typedef struct QEMU_PACKED NvmeIdNsNvm {
     uint8_t     rsvd268[3828];
 } NvmeIdNsNvm;
 
+typedef struct QEMU_PACKED NvmeIdNsIndependent {
+    uint8_t     nsfeat;
+    uint8_t     nmic;
+    uint8_t     rescap;
+    uint8_t     fpi;
+    uint32_t    anagrpid;
+    uint8_t     nsattr;
+    uint8_t     rsvd9;
+    uint16_t    nvmsetid;
+    uint16_t    endgrpid;
+    uint8_t     nstat;
+    uint8_t     rsvd15[4081];
+} NvmeIdNsIndependent;
+
 typedef struct QEMU_PACKED NvmeIdNsDescr {
     uint8_t nidt;
     uint8_t nidl;
@@ -1582,6 +1597,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeLBAF) != 4);
     QEMU_BUILD_BUG_ON(sizeof(NvmeLBAFE) != 16);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNs) != 4096);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsIndependent) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsNvm) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsZoned) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSglDescriptor) != 16);
-- 
2.36.1


