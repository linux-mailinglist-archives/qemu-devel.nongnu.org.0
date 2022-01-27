Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A82F49DD50
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 10:07:17 +0100 (CET)
Received: from localhost ([::1]:44518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD0kN-0008Pr-Uw
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 04:07:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nD00e-0004cu-Pm; Thu, 27 Jan 2022 03:20:00 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:59115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nD00c-0004Uc-RF; Thu, 27 Jan 2022 03:20:00 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0B1E058035E;
 Thu, 27 Jan 2022 03:19:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 27 Jan 2022 03:19:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=D5Ju29w9oGQpfi
 xiSPl0UH7PP/WSFw7k6ImRGBx4Pyw=; b=lFc2gHaoQ5yxaGKbzoYUyCyGoXBHBN
 5vKUD4DnMYd38JsEHyTJAW/O94n2SUnPEJkQKqocQ1P43pMAssWR4ubz65a/qvkZ
 ieJS6cIF9swIIz7gNWV34s6hDRMWnSV/6VqFWpBd7QhpYlCM+ZIhiqaOuco/Ch/W
 cjMk0ebnYVw6WoAorcT73mM/Ih5f8eaLhJ/YKK1dGF17Ucl0pFTKqKlC12xnOKzm
 qy0eB5SvfqZsGH4UC1W+x1IE+CHNcPehr6PbnSwMGoVL9Gh7aCEzxY4u5jKkvg1W
 ukLWkNhPQOpo5Hk7uW6+kXVES7ohxL4zux02r27t8aXUIgt1xozhaFqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=D5Ju29
 w9oGQpfixiSPl0UH7PP/WSFw7k6ImRGBx4Pyw=; b=kAbA7m1JsDKZo0XL2HBG4o
 JBbKl2G89/bRhRdMywsrJvJzOLv/VhPmjuRgUlsHoe4yfmdg8ey6RtHK5xIp3Y1B
 lu5eCuLvhJnGXRRQjCSXFVuRC4/ULa38FjXw6MdpqKNH/v01AeAlnxs5nQoczrPE
 f/pMEEdV5Vaom9BesxP5FU21I/gTWS4637BgmjATbbnJZ77d/97fIsrFo0YwTzkd
 8KXURxMeKbEzKrtcpZ/aTo+BYvL2DygO/HWoUrIhWJm/iKz6Xj7pec4+pk6EMlxs
 dHJqcOZ9b4/PW6TtzH3NzBTgUOrJ2gV5HanfaB3pC1ugQcvDvb8fWpB0Pu6Dn74A
 ==
X-ME-Sender: <xms:rFXyYQMcnySJWeE6mHGr6jjMvDcXB5nUJujLkrQpLylb0Nl2jmE1NQ>
 <xme:rFXyYW-7oz9EUFT3JT7ly4ej2vEdQuewgnmIqOugi7CuuN86IpOR__YPdYHWH5V60
 OcFnhIjxoPGkB7AY9U>
X-ME-Received: <xmr:rFXyYXTg0DYgMlFtZR5Ns4bMOqlsoRvbCoNOn6zcJ0fOHMy6GxxFDeOBruurkwFMvzk-_baeAantTgzE8p_6wA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfedvgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:rFXyYYs1a8hap-sO2n0iql_Bz6js2QUdXPkC9i-Mb6I2WZpo4j_q6Q>
 <xmx:rFXyYYdyKMqvxCmupuQBUGjfMVV7EipkuOByazR_4y0kdYFsqEeOsg>
 <xmx:rFXyYc2peJGBpz3ADFoDdG6ZzM93ssALDSI2v8tZyR62RITWxtOaJg>
 <xmx:rVXyYQ7PtDkOWns_JGZXBJP2uSJGt2Lq5ilsz2ceozt2JXTHtVbfMw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 03:19:54 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v2 1/3] hw/nvme: add struct for zone management send
Date: Thu, 27 Jan 2022 09:19:48 +0100
Message-Id: <20220127081950.953572-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220127081950.953572-1-its@irrelevant.dk>
References: <20220127081950.953572-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add struct for Zone Management Send in preparation for more zone send
flags.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 10 ++++------
 include/block/nvme.h | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 4344405e5939..7cb4974c5e83 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3616,26 +3616,24 @@ done:
 
 static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
 {
-    NvmeCmd *cmd = (NvmeCmd *)&req->cmd;
+    NvmeZoneSendCmd *cmd = (NvmeZoneSendCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
     NvmeZone *zone;
     NvmeZoneResetAIOCB *iocb;
     uint8_t *zd_ext;
-    uint32_t dw13 = le32_to_cpu(cmd->cdw13);
     uint64_t slba = 0;
     uint32_t zone_idx = 0;
     uint16_t status;
-    uint8_t action;
+    uint8_t action = cmd->zsa;
     bool all;
     enum NvmeZoneProcessingMask proc_mask = NVME_PROC_CURRENT_ZONE;
 
-    action = dw13 & 0xff;
-    all = !!(dw13 & 0x100);
+    all = cmd->zsflags & NVME_ZSFLAG_SELECT_ALL;
 
     req->status = NVME_SUCCESS;
 
     if (!all) {
-        status = nvme_get_mgmt_zone_slba_idx(ns, cmd, &slba, &zone_idx);
+        status = nvme_get_mgmt_zone_slba_idx(ns, &req->cmd, &slba, &zone_idx);
         if (status) {
             return status;
         }
diff --git a/include/block/nvme.h b/include/block/nvme.h
index e3bd47bf76ab..709d491c70d8 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1433,6 +1433,21 @@ enum NvmeZoneType {
     NVME_ZONE_TYPE_SEQ_WRITE         = 0x02,
 };
 
+typedef struct QEMU_PACKED NvmeZoneSendCmd {
+    uint8_t     opcode;
+    uint8_t     flags;
+    uint16_t    cid;
+    uint32_t    nsid;
+    uint32_t    rsvd8[4];
+    NvmeCmdDptr dptr;
+    uint64_t    slba;
+    uint32_t    rsvd48;
+    uint8_t     zsa;
+    uint8_t     zsflags;
+    uint8_t     rsvd54[2];
+    uint32_t    rsvd56[2];
+} NvmeZoneSendCmd;
+
 enum NvmeZoneSendAction {
     NVME_ZONE_ACTION_RSD             = 0x00,
     NVME_ZONE_ACTION_CLOSE           = 0x01,
@@ -1443,6 +1458,10 @@ enum NvmeZoneSendAction {
     NVME_ZONE_ACTION_SET_ZD_EXT      = 0x10,
 };
 
+enum {
+    NVME_ZSFLAG_SELECT_ALL = 1 << 0,
+};
+
 typedef struct QEMU_PACKED NvmeZoneDescr {
     uint8_t     zt;
     uint8_t     zs;
-- 
2.35.0


