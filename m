Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA8849DCB5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:44:20 +0100 (CET)
Received: from localhost ([::1]:50542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD0OB-0000rd-Qc
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:44:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nD00g-0004fh-3f; Thu, 27 Jan 2022 03:20:02 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:56551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nD00e-0004V3-8f; Thu, 27 Jan 2022 03:20:01 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5876558036A;
 Thu, 27 Jan 2022 03:19:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 27 Jan 2022 03:19:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=tK4Jy19IE8K6Is
 OmToHwzs9oXN8F9MtvwA1t/muqngU=; b=MkRX0rIZHL5t4gcQjvNupYzMALK6na
 W3ojiveykU3AwrpGQ6lov7mBJamkmO3s92YXGLt3LNvG4xin9EmnUyCLeysPmOTB
 VyX8+lwV7REkVjQL0ibk4IfL0A1Wf4E5OF07vPo6StU3jysivt73eDiSg2hhbZ1n
 p8fJXWTW9qJ3ya4eM39NJabqdMGfAHzB2ZkpwuFm7IlD338wLCnDU9mQPQlRPVcs
 8gKHTCv9dm7W0ejeJQPAK0blXD7XsGKMudkBOmPJudkcngpJhCHza30YR4wxn0OZ
 47CKBJXg++RgkieRootpvGdqtFq7L3El9B+p/+/P58Lhvs6r3iUXvexg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=tK4Jy1
 9IE8K6IsOmToHwzs9oXN8F9MtvwA1t/muqngU=; b=LwEusmB1cT5dP4sPEC/4fY
 J64TUGnYXuJEhogjY/XHUuSCpl/EZRZUHbeYyfWM9757GGmIFVKgSE1zUy+odiHj
 hnW7sFkBqDmAUIpXfGUQtwF6716JunmLKS1GLJCiY4qfr7hkjyNfA+4Kfg9eV46w
 vKvYvLK9npJD5X94apNYpD2Z7vh7q8jpVWeM5epOtNrCGxazUpPURjE7mNQSKh+Z
 8NaoIlvhboK2ZKR77a4zkUQWz7hI3MMenUfcUvOXtlqv3/4xEU+UZ2z9D4d4YbVs
 d7T+IgnTRw4/gE55k8oZa3cSCHFobO/1lDL/83mACuP8XCp9yDtmIPmQyd1pXq0g
 ==
X-ME-Sender: <xms:rlXyYXNUshdBTNwmxiLPirtt409Qhc5-DVcEGFcXr4DP82NPTKVNng>
 <xme:rlXyYR9jxyo_h7SPoUu9-HfYY-TZTgTlhtGz2ek7KQHnUvkFrXqRux5FRoGgSKTEp
 Cf9BEFMuqJCT2SADb8>
X-ME-Received: <xmr:rlXyYWRm55NwOPgZhhwy2a624FgrRw3eGAMJXlcabHToApKxaPqJAzc5ewdD1HLPUI2M6fo3DmNMxsJ8Gvi_Eg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfedvgdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:rlXyYbvcl0ANd7RiOkW1mktotmmFLl2rUeSbVFf4I6pisFT9AWni5w>
 <xmx:rlXyYffBoNNnJTtFpTghEj8sJRF6sLl0QdTntn5LcsP7QxEjBp_1pw>
 <xmx:rlXyYX0cUQwOZya97IGK_1LPKT_gTwBY2x4BszqCIMIm5n37Q3UMog>
 <xmx:r1XyYT6iGdhTLq4fOGQZ0D7hBYQwTr8GDtD0v1RcdodBtXlBnacmdQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 03:19:57 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v2 2/3] hw/nvme: add ozcs enum
Date: Thu, 27 Jan 2022 09:19:49 +0100
Message-Id: <20220127081950.953572-3-its@irrelevant.dk>
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
2.35.0


