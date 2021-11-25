Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BAE45D5B9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 08:46:06 +0100 (CET)
Received: from localhost ([::1]:47944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq9SH-0002kD-OY
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 02:46:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mq9KC-0007ku-0l; Thu, 25 Nov 2021 02:37:44 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:49045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mq9KA-0000Vs-Du; Thu, 25 Nov 2021 02:37:43 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 55E1C5C01A8;
 Thu, 25 Nov 2021 02:37:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 25 Nov 2021 02:37:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=JrWb3UuoCg2iu
 wQY6MWzFJnuH+rEfBZLhpbZba1Wb5A=; b=MMpvK9K111KdLpPKhicI2cUzeD6RI
 UFR3JmqBEzSimeg/RzOfOMJLjL1E6PD+D+3m6ZYm1OgLWWQnwXpno/FqhUzcKXfd
 kHg6hMYwXRSD3DvFQR76kLqX/vbHK2Mcv62idvSJxCxqz3UFj4/JVTQfm5lwYPl/
 kormEX4Z2Iz3hBaDxUh+0Mu3rGtjsNpm0x6MEO1BXbKYaFT5VZhdZdAg3KzpoVk9
 VQCAJg4Dw0Abzvf6vnSY3rJdMKmZtAahlSRAvLsxUg+NsI9sC/WJP2y+nxLhdpgz
 xvz6mdly3b9SzUag3fPbIchzcp9Qh7ivDL0bGz0yNWRuQ0Ej7sPSm4WlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=JrWb3UuoCg2iuwQY6MWzFJnuH+rEfBZLhpbZba1Wb5A=; b=R1xK22Ct
 LqnvvCO6alk36UMj5Osj456kXmkO8/jGU62ZFD/u0YAe/sYueTREy8Kxo50ILK9F
 FhPNW2vWfKRkwRbS0oVg00uSqQwNYLTyW9jMHr6IpOKcCIGGhDToX9dyJeb5RzCa
 DiD1816cgUhnGvDqflPfbSju3dvI6ItDOHyzBn/Vc9QHyFyVaBFvLu4WkL/Z4HdQ
 j9HHhNvV+6Ru/OL6PilZHE3tBWBhl/eDGPbK7fvWzudf/4L9smfU4ahuqpncqn03
 WBm662BDinoWO/77brK+ZoPV4PJ++CGe89lhp+t9buNLpwX7ItSaQ/FtQYS0ihKd
 Mf9Z3EgvDhMDWQ==
X-ME-Sender: <xms:RD2fYb1xmCC2Bx05PFWjH30lFFSW5yo2Q-6ynv78N0InpBsO-EEzZg>
 <xme:RD2fYaFXSt_Ja6R7Fyod5merU9ercWTNkd5vaGIsXImw8jJ5vkGeHN_CqbyDFSNqO
 kJ2p6B0CLrAYI_hbTA>
X-ME-Received: <xmr:RD2fYb5NLjtyOWJiPXt8wC5Z6uTSjcuIGZMYrv5oJ3NtjnJ_p5GuXaP2L2o29CRD8D3W3c6y5bUHhxntHLx0kcb8xHQN4Yr0V4Wec7IfTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeelgddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:RD2fYQ06m4Ac2ADytAUjNUlfbfz_mSt4X3wbs2L7D5of1qfwQ006vg>
 <xmx:RD2fYeEpfz47riv-JFH6DZcIkECwpgRjwK7KsqfOe1sXJAEJq6r_eg>
 <xmx:RD2fYR-XFxZUK8kjgmbvY9NRu0PRxF2yDctFu1E5oqx0F50RsJ6Z_A>
 <xmx:RT2fYcYhJBVmU4PnGiSsmbiMIHp9Olr4l8zoMj4GoAHitIC68wWQag>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Nov 2021 02:37:39 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH for-7.0 1/4] hw/nvme: add struct for zone management send
Date: Thu, 25 Nov 2021 08:37:32 +0100
Message-Id: <20211125073735.248403-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125073735.248403-1-its@irrelevant.dk>
References: <20211125073735.248403-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Klaus Jensen <k.jensen@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add struct for Zone Management Send in preparation for more zone send
flags.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 10 ++++------
 include/block/nvme.h | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 5f573c417b3d..489d586ab9d7 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3593,26 +3593,24 @@ done:
 
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
+    all = cmd->zsflags[0] & NVME_ZSFLAG_SELECT_ALL;
 
     req->status = NVME_SUCCESS;
 
     if (!all) {
-        status = nvme_get_mgmt_zone_slba_idx(ns, cmd, &slba, &zone_idx);
+        status = nvme_get_mgmt_zone_slba_idx(ns, &req->cmd, &slba, &zone_idx);
         if (status) {
             return status;
         }
diff --git a/include/block/nvme.h b/include/block/nvme.h
index e3bd47bf76ab..2ee227760265 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1433,6 +1433,20 @@ enum NvmeZoneType {
     NVME_ZONE_TYPE_SEQ_WRITE         = 0x02,
 };
 
+typedef struct QEMU_PACKED NvmeZoneSendCmd {
+    uint8_t     opcode;
+    uint8_t     flags;
+    uint16_t    cid;
+    uint32_t    nsid;
+    uint32_t    rsvd2[4];
+    NvmeCmdDptr dptr;
+    uint64_t    slba;
+    uint32_t    rsvd12;
+    uint8_t     zsa;
+    uint8_t     zsflags[3];
+    uint32_t    rsvd14[2];
+} NvmeZoneSendCmd;
+
 enum NvmeZoneSendAction {
     NVME_ZONE_ACTION_RSD             = 0x00,
     NVME_ZONE_ACTION_CLOSE           = 0x01,
@@ -1443,6 +1457,10 @@ enum NvmeZoneSendAction {
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
2.34.0


