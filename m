Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7048A69CA6A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 13:01:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4ph-0001Pb-9E; Mon, 20 Feb 2023 06:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pU4pe-0001Ov-Ta; Mon, 20 Feb 2023 06:59:46 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pU4pd-0006di-4K; Mon, 20 Feb 2023 06:59:46 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E0ECC3200D5D;
 Mon, 20 Feb 2023 06:59:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 20 Feb 2023 06:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defmacro.it; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1676894382; x=1676980782; bh=6/
 rxYS2sWciDXBZZQT1J6qvzcISPDTf1kh9aX3r2v3c=; b=Sz76m+r/U35ehTkv3H
 Wpy14m42P8PtGB2ac38WZdAJt9r7fA9i66RL6mV/4EEj60tEKgi2Kv3oAzeNh2cf
 ehTx3P5tHShLiREmyRWIElcH5AcK+b/fNwANP7uxKJG/m/RqbM1ACAVEzAun/oDF
 sxqr45D23AwIqlRRD5R/FLE0z6DpJETsEFx248t7cg9u7gNjVMU3nYvlZe4Gnh0o
 QoRzZdBD+sYNBe3CPVpyWvhfOf4J/ETizcLD5ywyYx8xJ1x4FRnb4Dtjr3RYEZhQ
 4XuH54lsQstzapejikz7b93ws6cs3sfRBqIrsX7YCF9dxX0EtV1U9kF033tXjQmm
 UQcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1676894382; x=1676980782; bh=6/rxYS2sWciDX
 BZZQT1J6qvzcISPDTf1kh9aX3r2v3c=; b=HNM/zy25R77vuZtvowkORZ//qQd1V
 IJ5NEVG+voOhJUDSkKCNLhxHJYIfPgyF3sx/Z4xxDCTS1+Pa3klbbBW+4sFU7GKE
 uGjeZojy8xEnMJpS85ZlvmTd/yeRtkUSVMbmRkST1qJjo1mmx89HBqSSAcLf2mis
 lkGTCD0SJ2w1JmO1yofv1YBbFsI8CSmRJT/9qzHmaUcYMH6mes8ZpVmYkEEEZ5js
 qvRDyrR1gDYqOEEN08h8/AtVZy+x1tRJNgC4GI+tEuzsULhTx9krXEilktNI7rP6
 uZ5Z+g+pTf6pdCW9o4vG3nV68SGHVejwmOVsIRzgltvAgpuJ/dH4u3VVQ==
X-ME-Sender: <xms:rmDzY1OBxXF-fvJNCz8bJFy-WfebXRwrIRT2vWK19IDCyYuBvy7Wbw>
 <xme:rmDzY3--wl3QiHMEXrFlHKEGvCzG_ciLxLq2JEaWQ63W5g9c-WPWRWcEFLCE_ekO1
 be04UknRFNM_E35jjQ>
X-ME-Received: <xmr:rmDzY0SOhZnG_mIFkndhVTtILzI1PGEu3yWG17BrSGE9jUYCikFZ_ua1TRevjZBNXSeEEiWo50FnWqM9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejhedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfgvshhp
 vghrucffvghvrghnthhivghruceojhifugesuggvfhhmrggtrhhordhitheqnecuggftrf
 grthhtvghrnhepvddvtefhtdeugfetfeeukedtfeeitddugfffleehkeelveektdevteef
 leduueevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epjhifugesuggvfhhmrggtrhhordhith
X-ME-Proxy: <xmx:rmDzYxsXQr8KYicDgIyDdxbVOSa2xfb63byr7N91u9Y4ewRQ0LF0Yg>
 <xmx:rmDzY9fcDcNNlQMPnl3k4dwjqrUbeZKYJy0P7viy84Gcc3IgyeYGvg>
 <xmx:rmDzY93NagpLftVStTFNIcCRSnWWLo6NmdZucT-pL3NmI6GH2dMEAg>
 <xmx:rmDzY-VSEeT2NfrAfVqDU9BDZMNsWBfuogSrS5HAadTSlF0gSVtozQ>
Feedback-ID: i0f41475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Feb 2023 06:59:40 -0500 (EST)
From: Jesper Devantier <jwd@defmacro.it>
To: jwd@defmacro.it,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v3 4/5] hw/nvme: basic directives support
Date: Mon, 20 Feb 2023 12:59:25 +0100
Message-Id: <20230220115926.54623-5-jwd@defmacro.it>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230220115926.54623-1-jwd@defmacro.it>
References: <20230220115926.54623-1-jwd@defmacro.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=jwd@defmacro.it;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Add support for the Directive Send and Recv commands and the Identify
directive.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/nvme/ctrl.c       | 40 +++++++++++++++++++++++++++++++++++++++-
 hw/nvme/nvme.h       |  2 ++
 include/block/nvme.h | 35 ++++++++++++++++++++++++++++++-----
 3 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 729ed9adc5..17e6b430e2 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -266,6 +266,8 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_VIRT_MNGMT]       = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_DBBUF_CONFIG]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_FORMAT_NVM]       = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
+    [NVME_ADM_CMD_DIRECTIVE_RECV]   = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_DIRECTIVE_SEND]   = NVME_CMD_EFF_CSUPP,
 };
 
 static const uint32_t nvme_cse_iocs_none[256];
@@ -6146,6 +6148,37 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
     return NVME_SUCCESS;
 }
 
+static uint16_t nvme_directive_send(NvmeCtrl *n, NvmeRequest *req)
+{
+    return NVME_INVALID_FIELD | NVME_DNR;
+}
+
+static uint16_t nvme_directive_receive(NvmeCtrl *n, NvmeRequest *req)
+{
+    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
+    uint32_t dw11 = le32_to_cpu(req->cmd.cdw11);
+    uint32_t nsid = le32_to_cpu(req->cmd.nsid);
+    uint8_t doper, dtype;
+    uint32_t numd, trans_len;
+    NvmeDirectiveIdentify id = {
+        .supported = 1 << NVME_DIRECTIVE_IDENTIFY,
+        .enabled = 1 << NVME_DIRECTIVE_IDENTIFY,
+    };
+
+    numd = dw10 + 1;
+    doper = dw11 & 0xff;
+    dtype = (dw11 >> 8) & 0xff;
+
+    trans_len = MIN(sizeof(NvmeDirectiveIdentify), numd << 2);
+
+    if (nsid == NVME_NSID_BROADCAST || dtype != NVME_DIRECTIVE_IDENTIFY ||
+        doper != NVME_DIRECTIVE_RETURN_PARAMS) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    return nvme_c2h(n, (uint8_t *)&id, trans_len, req);
+}
+
 static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opcode,
@@ -6194,6 +6227,10 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_dbbuf_config(n, req);
     case NVME_ADM_CMD_FORMAT_NVM:
         return nvme_format(n, req);
+    case NVME_ADM_CMD_DIRECTIVE_SEND:
+        return nvme_directive_send(n, req);
+    case NVME_ADM_CMD_DIRECTIVE_RECV:
+        return nvme_directive_receive(n, req);
     default:
         assert(false);
     }
@@ -7450,7 +7487,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
     id->oacs =
-        cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT | NVME_OACS_DBBUF);
+        cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT | NVME_OACS_DBBUF |
+                    NVME_OACS_DIRECTIVES);
     id->cntrltype = 0x1;
 
     /*
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index a88e0dea5c..e489830478 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -345,7 +345,9 @@ static inline const char *nvme_adm_opc_str(uint8_t opc)
     case NVME_ADM_CMD_GET_FEATURES:     return "NVME_ADM_CMD_GET_FEATURES";
     case NVME_ADM_CMD_ASYNC_EV_REQ:     return "NVME_ADM_CMD_ASYNC_EV_REQ";
     case NVME_ADM_CMD_NS_ATTACHMENT:    return "NVME_ADM_CMD_NS_ATTACHMENT";
+    case NVME_ADM_CMD_DIRECTIVE_SEND:   return "NVME_ADM_CMD_DIRECTIVE_SEND";
     case NVME_ADM_CMD_VIRT_MNGMT:       return "NVME_ADM_CMD_VIRT_MNGMT";
+    case NVME_ADM_CMD_DIRECTIVE_RECV:   return "NVME_ADM_CMD_DIRECTIVE_RECV";
     case NVME_ADM_CMD_DBBUF_CONFIG:     return "NVME_ADM_CMD_DBBUF_CONFIG";
     case NVME_ADM_CMD_FORMAT_NVM:       return "NVME_ADM_CMD_FORMAT_NVM";
     default:                            return "NVME_ADM_CMD_UNKNOWN";
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 4abc1bbfa5..d463d0ef5f 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -613,7 +613,9 @@ enum NvmeAdminCommands {
     NVME_ADM_CMD_ACTIVATE_FW    = 0x10,
     NVME_ADM_CMD_DOWNLOAD_FW    = 0x11,
     NVME_ADM_CMD_NS_ATTACHMENT  = 0x15,
+    NVME_ADM_CMD_DIRECTIVE_SEND = 0x19,
     NVME_ADM_CMD_VIRT_MNGMT     = 0x1c,
+    NVME_ADM_CMD_DIRECTIVE_RECV = 0x1a,
     NVME_ADM_CMD_DBBUF_CONFIG   = 0x7c,
     NVME_ADM_CMD_FORMAT_NVM     = 0x80,
     NVME_ADM_CMD_SECURITY_SEND  = 0x81,
@@ -1161,11 +1163,12 @@ enum NvmeIdCtrlCtratt {
 };
 
 enum NvmeIdCtrlOacs {
-    NVME_OACS_SECURITY  = 1 << 0,
-    NVME_OACS_FORMAT    = 1 << 1,
-    NVME_OACS_FW        = 1 << 2,
-    NVME_OACS_NS_MGMT   = 1 << 3,
-    NVME_OACS_DBBUF     = 1 << 8,
+    NVME_OACS_SECURITY      = 1 << 0,
+    NVME_OACS_FORMAT        = 1 << 1,
+    NVME_OACS_FW            = 1 << 2,
+    NVME_OACS_NS_MGMT       = 1 << 3,
+    NVME_OACS_DIRECTIVES    = 1 << 5,
+    NVME_OACS_DBBUF         = 1 << 8,
 };
 
 enum NvmeIdCtrlOncs {
@@ -1644,6 +1647,27 @@ typedef enum NvmeVirtualResourceType {
     NVME_VIRT_RES_INTERRUPT     = 0x01,
 } NvmeVirtualResourceType;
 
+typedef struct NvmeDirectiveIdentify {
+    uint8_t supported;
+    uint8_t unused1[31];
+    uint8_t enabled;
+    uint8_t unused33[31];
+    uint8_t rsvd64[4032];
+} NvmeDirectiveIdentify;
+
+enum NvmeDirective {
+    NVME_DIRECTIVE_SUPPORTED = 0x0,
+    NVME_DIRECTIVE_ENABLED   = 0x1,
+};
+
+enum NvmeDirectiveTypes {
+    NVME_DIRECTIVE_IDENTIFY = 0x0,
+};
+
+enum NvmeDirectiveOperations {
+    NVME_DIRECTIVE_RETURN_PARAMS = 0x1,
+};
+
 static inline void _nvme_check_size(void)
 {
     QEMU_BUILD_BUG_ON(sizeof(NvmeBar) != 4096);
@@ -1683,5 +1707,6 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeSecCtrlEntry) != 32);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSecCtrlList) != 4096);
     QEMU_BUILD_BUG_ON(sizeof(NvmeEndGrpLog) != 512);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeDirectiveIdentify) != 4096);
 }
 #endif
-- 
2.39.2


