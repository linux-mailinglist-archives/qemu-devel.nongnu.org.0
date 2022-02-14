Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A044B450E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 09:58:38 +0100 (CET)
Received: from localhost ([::1]:54308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJXBs-0007C7-AZ
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 03:58:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJWPY-0003DK-Lq; Mon, 14 Feb 2022 03:08:40 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:55935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJWPW-0007YD-DE; Mon, 14 Feb 2022 03:08:40 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id DACF32B001E3;
 Mon, 14 Feb 2022 03:08:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 14 Feb 2022 03:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=iZgRhve8kfQhRl
 VQ/BzOZXFT81EUsS6mQ5C3w3qprtI=; b=ibWnXgWRq89rxE+gRDnBhRWkwPSjFP
 FF+s27xNoKaBEZuuH+is9+DnEY6wmVNQQpaO4P6VWmtfiAw/5dHlHflAcVU8kzPn
 qgG4T6F1dqNTAdgx3W0pagV+pyrrLmkpzRLbvUdb61qfBfDfdcRG3f5VbOHjFGAD
 3s8y8v10Soom1nfRkyLAvH9dEw2JPvRohJLkT4f72c911ScMaYNoEjtWt6FLSvYn
 AjfEwIYK0C1RE0LqdsXSEbFKdGPfB18CMY9Y257Fu6SkxORX3fTEKJoo2DWAxMOp
 qdkh0S6N2u4mHI18ECyPAKBuqN3KUL0WWoowRO3DOIvUEgMVwRwFWqJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=iZgRhv
 e8kfQhRlVQ/BzOZXFT81EUsS6mQ5C3w3qprtI=; b=K6HymveSHYvbleQHO1obT7
 3Cg6hbhqaLOjEXmv2ZVALwjxlaWuLEOLi6kdQ2gE4khVf+0wHB7fOsW3/gVf+gQw
 irVn0Pqt9982csUH71CfpB+z8JAuFfO0qmrCZ+c6wbABYbLqwj6Ngl9pr0k8Cx/W
 naRLh5c7BueHwYrE/+h/eVaDsPPJwn10RB41bicCbjphJsHKKoVL75wc4lCG/2xn
 NT3tFuDuS/0sEbGIPhVraGy4kZB//OXN8vveNuziUWH1BWx7DhgsPVKFSbxHK9d/
 HwssXBu7rpxkiHosdZ1BsrRkdjmb36KYxtmDDKQIDtNhOW8hUEzUWw+5j9OsuXcQ
 ==
X-ME-Sender: <xms:9w0KYqPPyfLhLBvFd260B66dsA7N_99daA5XYH1Kg7-j2FRStZkwDg>
 <xme:9w0KYo_2s7w3dPIaDxg552DxESF-pxmjojuFViihwDzEXSoQhcZrED8z_E9qJNDbk
 wrvsbM-9ZqmErnpbwQ>
X-ME-Received: <xmr:9w0KYhTNWE1PQVDiOjcDvKnzI6dJp5BXDu2rZFVSg2ZNO9Fl2Z6cHJ9LfIdt1eF4GeGDGw16f_rnsLGDb6D4zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjedugdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:9w0KYqu1YmJIUlv9GiLwBtYELxT_YJ6NH7vFeylmn_cqevFxnknE7w>
 <xmx:9w0KYifAJpNlZuqpM7a1WOMPN-0l-iUJPK1ewgp85ecJii44CyiByQ>
 <xmx:9w0KYu12_e4JQrOMl6OLWymvS6_-MCfqW_QO6zghq2AmZNzzrkg9aQ>
 <xmx:9w0KYi6XDE-FUS1QuK5I1gdLdluv4xmf32bpX8PE3A-F7Zm2th77f78jT4U>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Feb 2022 03:08:21 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 5/6] hw/nvme: add ozcs enum
Date: Mon, 14 Feb 2022 09:08:00 +0100
Message-Id: <20220214080801.13627-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214080801.13627-1-its@irrelevant.dk>
References: <20220214080801.13627-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add enumeration for OZCS values.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ns.c         | 3 ++-
 include/block/nvme.h | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 8b5f98c76180..356b6c1c2f14 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -266,7 +266,8 @@ static void nvme_ns_init_zoned(NvmeNamespace *ns)
     id_ns_z->mar = cpu_to_le32(ns->params.max_active_zones - 1);
     id_ns_z->mor = cpu_to_le32(ns->params.max_open_zones - 1);
     id_ns_z->zoc = 0;
-    id_ns_z->ozcs = ns->params.cross_zone_read ? 0x01 : 0x00;
+    id_ns_z->ozcs = ns->params.cross_zone_read ?
+        NVME_ID_NS_ZONED_OZCS_RAZB : 0x00;
 
     for (i = 0; i <= ns->id_ns.nlbaf; i++) {
         id_ns_z->lbafe[i].zsze = cpu_to_le64(ns->zone_size);
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 709d491c70d8..e10ea6f0eb88 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1351,6 +1351,10 @@ typedef struct QEMU_PACKED NvmeIdNsZoned {
     uint8_t     vs[256];
 } NvmeIdNsZoned;
 
+enum NvmeIdNsZonedOzcs {
+    NVME_ID_NS_ZONED_OZCS_RAZB    = 1 << 0,
+};
+
 /*Deallocate Logical Block Features*/
 #define NVME_ID_NS_DLFEAT_GUARD_CRC(dlfeat)       ((dlfeat) & 0x10)
 #define NVME_ID_NS_DLFEAT_WRITE_ZEROES(dlfeat)    ((dlfeat) & 0x08)
-- 
2.35.1


