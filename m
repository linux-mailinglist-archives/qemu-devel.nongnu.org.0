Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF26699B3F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:27:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSi1w-0002ey-QD; Thu, 16 Feb 2023 12:26:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pShQk-0000WP-S5; Thu, 16 Feb 2023 11:48:22 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwd@defmacro.it>)
 id 1pShQj-0004Pk-5P; Thu, 16 Feb 2023 11:48:22 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 53AE25C01D4;
 Thu, 16 Feb 2023 11:48:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 16 Feb 2023 11:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=defmacro.it; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1676566100; x=1676652500; bh=EQ
 Hy0yCe4COBPBeWOci/sv9c2pyrv5Robr7dwRxhgIo=; b=ajOE7Kru2B9MkHl8B1
 OUG6gvxi8w8Up4qwIhi72NAmyIfhE3jQKYHAIZX2aPR/y/E3GwuUEUz7xFj0QvMz
 lh59+b5mY1eOK3/0zrO12EiDP+uK3AJAhKaofffvGnMjG8rgRkMC82EqR4UCNGaw
 YU9oMfG+kW9VoliNAD0QNAAsXOYKFAEkZp/oIWW1qIzg1y0A6Wor6AJ/FPXLHFmY
 dDoiknuOPmROmXZ+XZnbfnrc3LatM1n9CX5cdEUkluGWGwmpZenOl1umguyB0IC7
 SZFt03joBKFPuRIDTbgGpAHYV23c2y3XcmHCrbfNA3MjEm6Ej+8ph2KeYFtxqPdV
 JShw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1676566100; x=1676652500; bh=EQHy0yCe4COBP
 BeWOci/sv9c2pyrv5Robr7dwRxhgIo=; b=dtRgaKPA47MwMlIbou00rpdz0tXeu
 qp/F6DmUyDwJWzWslxwxLwIAamw4NvWNoDEbVk5YobeZ1TQfy7FX1A3qNilgyUNu
 IWhD6vjmf8oz81Ze9WMNePnG/jUrYQYZVVqZk/+oy5Mwkew07LNw2hlLFn4RVlJX
 a8uOctI9uwnd7JIxeirpoZJSIGhOPnP1GcEUcfU4Cm0YQqrdxVq2nFqJt200LZUW
 NT5kxW8uh8p1OGF4v+UISRAQfXmJeIpeOyUorNDBWB4cxT24kT3NCAIa1aKgQnFJ
 MPP7QGaol0T+00wY7BsdAb3R3m4W8uNH7jTp6czggd2rYVhJ8b8mv+4Fw==
X-ME-Sender: <xms:VF7uY8ZCIkYtsmWSMNnILlqcQ_hs682oWNYW-lPgIo34SQyFwlZdTg>
 <xme:VF7uY3ZuEi_v8wWf6UMQ2SwbXJP6GNcNGGaPxWzdwkkc2GWhD-4hCAWPSyiIvUMkQ
 rB7I0TCmEgha57ah_c>
X-ME-Received: <xmr:VF7uY29kP7ouRe6VHjVWTjVcTxQPM7StLXhDnHy3RX74C8Qa2jxEDmNL6HnUZ9zSHBIfhZajIBAj_OKlMnMpmTc7M-4pQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfgvshhp
 vghrucffvghvrghnthhivghruceojhifugesuggvfhhmrggtrhhordhitheqnecuggftrf
 grthhtvghrnhepvddvtefhtdeugfetfeeukedtfeeitddugfffleehkeelveektdevteef
 leduueevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epjhifugesuggvfhhmrggtrhhordhith
X-ME-Proxy: <xmx:VF7uY2rpcF7HAKlHpy-8DwRt06ktzk92l1jhH-Fzz0KC4vzR2rqiZA>
 <xmx:VF7uY3pixP3ticw83QqoFICdqLbsbUkiic7KQ78bB9yNOxR7ISnthQ>
 <xmx:VF7uY0QmdpKCIpWaQv8iA1KVqofFfRvbv47IVYztX5XHnnaFkwPvww>
 <xmx:VF7uY0iHUOfCB0hdsw7ZWIW2863khvOmjEdNa0jRHMdpAia1zHttPg>
Feedback-ID: i0f41475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Feb 2023 11:48:18 -0500 (EST)
From: Jesper Devantier <jwd@defmacro.it>
To: jwd@defmacro.it,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Fam Zheng <fam@euphon.net>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 4/5] hw/nvme: basic directives support
Date: Thu, 16 Feb 2023 17:48:05 +0100
Message-Id: <20230216164806.233533-5-jwd@defmacro.it>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216164806.233533-1-jwd@defmacro.it>
References: <20230216164806.233533-1-jwd@defmacro.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jwd@defmacro.it;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 16 Feb 2023 12:26:45 -0500
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


