Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E736AC361
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:35:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBvS-0006Vc-1h; Mon, 06 Mar 2023 09:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pZBvP-0006TI-I9; Mon, 06 Mar 2023 09:34:51 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pZBvN-0005Vg-T8; Mon, 06 Mar 2023 09:34:51 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 213B05C030E;
 Mon,  6 Mar 2023 09:34:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 06 Mar 2023 09:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1678113289; x=
 1678199689; bh=aiaRokQO7JW6MfW6yaEjam2OP1225/L/eTK8FjewRD4=; b=B
 qPAEKrhAD8GVEsbsEc/yN2jz0Z16Qoyna6UWD4YXNdbfdKMG6q6vOueRZGVZAwpN
 L8o9CfrlqW3VxEYOv9LXiE/8LAZ7YA5qj/+aMF1lIuEx3cZl1qVYpjbP00glNSLi
 eRaG9WL6LqTV85cHUVXmLGF0MWCrsHF8dZdY/s1S3Bkctpm5X4Qbk04c72tn0+QE
 L45GE/Ha9xw+Hs7PVdb0ldRIrBbP7ppY9tYegUGEq+jLof6Fd41MV370x62RNS1y
 Ey/IBqkl2fObdQYz0dppgmWtP47A0tqXSY0ZMxBjvgagQW2pEJzcG5dhe5Kg1nAM
 HJc86imfoPWAoivKsYl8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1678113289; x=
 1678199689; bh=aiaRokQO7JW6MfW6yaEjam2OP1225/L/eTK8FjewRD4=; b=m
 twH6WgqvrSi3CBfwQkbBnSql0Go6NK0bPqFyt/ujXWzEngKIRTN608vVEmdLPw4Z
 G+hJlCZrKcuYZIHKdxcot+NSVJkCU1tNQIdo9TfJTqcaOPWhF47J4Vc7OecWjRuX
 n/fWuyfnxxpvtuToOedXHPZ49xCPLNS0crfG4mQaflLSxwJk5ECIvxUEYtuyJ53U
 /1N1uupQCbxeC6MaSym5w4bnvVByzH8jdsKKgRhihxnr6DE/EbBVDixeB98dwW1n
 R4Er0vZP548Yd5Q2E5PRgK31YYDZHJSkLIZcSvwjhl3ZyJk+X7/aZ+gWCwYWCCRC
 H9CAYbi2ZYE2VZBwoVDnQ==
X-ME-Sender: <xms:CPoFZEvbzxGiYcLtqorY77rU9yVWELUsc0wbusi_JQvG0jxcWUcEkQ>
 <xme:CPoFZBfdn88NIBcXPXG2luhrM7CAzW-NqYDdKnJpRCitXLkes9OMAXy5wsxZli8r0
 6qjoz4MOsLgOvVW4Us>
X-ME-Received: <xmr:CPoFZPwkSMI_cJWtwFVOkj_jRzMOVy_AOmjtHOz8_UzVh99Zd0q-pcCcUyXkEv5F9QS0Xe8N7lB-Tl54TzGtP45GVNdzJoXnennTW9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtkedgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:CPoFZHOTJW-L3xgGCKBC9nkwK2cvgVsecXNh8SGGl53QDdR7oMXtwg>
 <xmx:CPoFZE_ewPmrbBxb8DxQRWtjsO_cDQ_jrFqxXeB86cfJi4u74EcRCA>
 <xmx:CPoFZPU9lJJL9bjSn3GBXNOx2b_p0Y2_r7fBNn_2Byr1wLil36YCwQ>
 <xmx:CfoFZF2i59cOTwZBLWFhBHNjMfIvGJIso5Y7yQBPY5p_lWRM3fig0Q>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Mar 2023 09:34:46 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 4/5] hw/nvme: basic directives support
Date: Mon,  6 Mar 2023 15:34:32 +0100
Message-Id: <20230306143433.10351-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306143433.10351-1-its@irrelevant.dk>
References: <20230306143433.10351-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6175; i=k.jensen@samsung.com;
 h=from:subject; bh=Mkz5OwnB/2/9T6og95hwn02x2DNMAX7980KhO8V9lYw=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGQF+fmuoHAnswZSbJdCqyaiwK7GCmNMp/K8G
 vha1AKqp3T/zokBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJkBfn5AAoJEE3hrzFt
 Tw3pmgEH/joA0Dj+NJBporGWudoQUMnbxbY8B/rpqX8wy9vaNIb86ziwMcxNZ7Tg7Ev9eg0owdX
 Zn8JIA00ZG3ctzCkBQ7lxCuuHScnsTOO6w8vLEnW+hEtrAXeR70Q4aDY9fUq828Moar0SPVwNlC
 zbukHLbpwzqoP5lKQv78zG+tnMzXgaadpZHOwVg9LU3I038mjDJ6z/I1mrrB3TLPs6Ft3VpzEzF
 gIvnyhWXcVy2LYDwMYAesMDHzl4bpE4nBKI0JiQZCbsK5E/Tt7RoqNaLYtANl+xXoN4Z1sU0gzX
 ScKijf8QOOdkaZGTjTVrt1gnlvAY0YPlybpqg9CcQMlLvHLBUCaPcK16
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 40 +++++++++++++++++++++++++++++++++++++++-
 hw/nvme/nvme.h       |  2 ++
 include/block/nvme.h | 35 ++++++++++++++++++++++++++++++-----
 3 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 4bfc7835b539..0ead0ee30815 100644
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
@@ -6150,6 +6152,37 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
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
@@ -6198,6 +6231,10 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
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
@@ -7454,7 +7491,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
     id->oacs =
-        cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT | NVME_OACS_DBBUF);
+        cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT | NVME_OACS_DBBUF |
+                    NVME_OACS_DIRECTIVES);
     id->cntrltype = 0x1;
 
     /*
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index a88e0dea5c83..e489830478ee 100644
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
index 4abc1bbfa5b6..d463d0ef5fdc 100644
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


