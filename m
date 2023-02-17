Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABCD69AB05
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 13:08:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSzWy-0005Gi-2r; Fri, 17 Feb 2023 07:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pSzWv-0005Fh-Kb; Fri, 17 Feb 2023 07:07:57 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pSzWt-0003R8-Qi; Fri, 17 Feb 2023 07:07:57 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0C22A5C0164;
 Fri, 17 Feb 2023 07:07:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 17 Feb 2023 07:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defmacro.it; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1676635675; x=1676722075; bh=EQ
 Hy0yCe4COBPBeWOci/sv9c2pyrv5Robr7dwRxhgIo=; b=YY5iontpkb221Qamnu
 l54LJuVCAh9+S9KeXXOnkmRqS3xfvtfZbMkDczeeutZAFKQIkje8Bl1sIYpZOGbw
 E1FheKJ9iRZK5VOubBrkAmU2UCgXNxsmlxAYKKF1C6sxsbLbi32NctshY72pYjjd
 QZ5s3nhH2U61aPxAEcPon/bpYFZMUPorovJc6wqrcVSkSJgel9zLhZRjrDfRFXOA
 IGxjeQr5Enl2VH+GKPXA4p/Ubg9CVwDUfNMfPh6sIpbkjuY3Gxek5rtwGYtJFFUr
 utMOMm8xnCtI1eBbvjObCjjNKEz0u5SKtREVG+NomR/YvG2duo+UGhJJdO8iVE7M
 cp2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1676635675; x=1676722075; bh=EQHy0yCe4COBP
 BeWOci/sv9c2pyrv5Robr7dwRxhgIo=; b=mRyXE5qIEFJT4RJVeEglLZmJJNUYm
 3TdoYfEs0PE1vSqzqB4gH4pd0oU3EO7zU2eD0RDnt7dwx6zHyoyItqN4hVxq6r6U
 oWm67IEjG4GIA67gWsXwCcO7nOOHBL9fx4ILc2hk3AjZc/a5KbjJZn58dEh6UxyM
 keNsozjHD5KenJTuwGSMAeWU2I5dWL65XNL0rQZ3BYHafACiUjiV/Vb6/EYvquiY
 KlFS0T3OfKoknBRSUfuOz77ZEqtVxCWKaquH2AyF4hf/D5eEX9l4g1K3cG122zJO
 kKEKLwVE/Z9wPgyLXHqM1QECQZaiDGsG85p2rxoSs7XcNrUxB7b97lGgA==
X-ME-Sender: <xms:Gm7vY_fOBh_PAvceT02qfSQ5XNTc_rkPdY4o7HBfes8-bKE48XMcSg>
 <xme:Gm7vY1Mlgpkt1NmAJSz-bSV-9h79GDIv0YWrtknUl9wYFBjfzHXEtguZ1oFXl1GEa
 rxZiVui0zv_7hxnWcc>
X-ME-Received: <xmr:Gm7vY4jO1qPd3fj5hM9psrBPJpxvE3aQDuYHcr2QB5PfPHuHxPdxhW4xduTFvruhXPyo8jaoPl_y0B78>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeiledgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfgvshhp
 vghrucffvghvrghnthhivghruceojhifugesuggvfhhmrggtrhhordhitheqnecuggftrf
 grthhtvghrnhepvddvtefhtdeugfetfeeukedtfeeitddugfffleehkeelveektdevteef
 leduueevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epjhifugesuggvfhhmrggtrhhordhith
X-ME-Proxy: <xmx:Gm7vYw-MR1q4-HDI5z0F6TIF46jN3sm9nzziC7VDBH32zSmAVDonRA>
 <xmx:Gm7vY7vgYxQjgYpZDXKpXxVT3UsLtCcq1TM7i6749kvQfh43gu6XUA>
 <xmx:Gm7vY_FNuUHXlRVLWlCJQMKXSyKrNBX-fZP_Flrn9kPjmGNbElK43w>
 <xmx:G27vY8kXQHpAw-V309D79XxhVoDwGHSi6nSMq8KZRM5AJCRh-mAtfA>
Feedback-ID: i0f41475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Feb 2023 07:07:53 -0500 (EST)
From: Jesper Devantier <jwd@defmacro.it>
To: qemu-devel@nongnu.org,
	jwd@defmacro.it
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Fam Zheng <fam@euphon.net>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v2 4/5] hw/nvme: basic directives support
Date: Fri, 17 Feb 2023 13:07:42 +0100
Message-Id: <20230217120743.308632-5-jwd@defmacro.it>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217120743.308632-1-jwd@defmacro.it>
References: <20230217120743.308632-1-jwd@defmacro.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=jwd@defmacro.it;
 helo=out5-smtp.messagingengine.com
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
2.39.1


