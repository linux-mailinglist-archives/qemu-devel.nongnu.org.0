Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB44645D5BB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 08:48:31 +0100 (CET)
Received: from localhost ([::1]:50190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq9Uc-0004PD-L1
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 02:48:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mq9KF-0007rZ-Oe; Thu, 25 Nov 2021 02:37:47 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:45987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mq9KE-0000WN-B5; Thu, 25 Nov 2021 02:37:47 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 271D25C0109;
 Thu, 25 Nov 2021 02:37:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 25 Nov 2021 02:37:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=qGBD61aZ0WTI0
 2c3CREOvlqAz4JE8ofVhaVhtFAyq5U=; b=QsTz+aqlOQcnpbB1TFMVyvgPX7iO5
 wdWrGPW3tN49zuYl1fiK0iXG0Yp6GAkNZ4lwL88bV5wYSVAD5nlYBzqSAshM1Qvc
 ibWrR43ViqefZMIijg07CmbOVMmnGPcBVBKXSJkLrZxNHZfvzulTBbXeiGGZMciD
 N/3gPesUNBNmYNunWsLJitGl69RtPIw2yuSZcGkbhoWxQH5Jz9m8ylvKIqeVhfu3
 f3QvhN9nsKLZfa6Ln0Wqi2vkEm28O5BTlhd90naga7W+b3AS7wV4ta58y6Ms/Cew
 lkKLEimwwh0/2qUeyXg20eGasIcPoN4wlWyuzCQ/IoETBkCPL+bAJ1KMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=qGBD61aZ0WTI02c3CREOvlqAz4JE8ofVhaVhtFAyq5U=; b=W+2jQX2z
 gOKTyhWi8BdCnPBOthE7mIDydUzajjuiepaW7MAL3ZoLsE6g27q0yhsHYfaBCp8O
 BS/RwF79gGyrq2l5ztAQhiY+ERlaRrO6o3KVx1WPCubqew5NckBQlvVRuUd/3/RT
 JJS99LiHy6yvy7Xsc9QJ2RC3Nn19Mz/jYkFpbO+238LzzTOKgfs7Z8gxCUYbKRqo
 4F71A/ReIYWt5sfgieQoljG2bYoKuFZVtThr8rQUAd78h8SLdVH/J0EmaCoAvX0o
 jxa56CkyJ7tqqigTQOC6Ihmi+LJj6w7ViFlH8YvmIPpE5IutnWsKgjtNwE3iS8Dx
 /4bOdPCxVXz8CQ==
X-ME-Sender: <xms:SD2fYbsK0EvXqDgk11eJ8C1SBew6chgbOSZhzOqpCo8DxDbp6oTHcA>
 <xme:SD2fYcevkocnfG4_mvbvNOSyqAMsyjxToS7AiR2ygi6PBjIXa-BtYF8vbF8ajID0V
 tmLUfSQguNXEyCAM6E>
X-ME-Received: <xmr:SD2fYez5NRhiCHEN6xSkerKLVu6lXY7v8mwJ7ygqa1X_w6oI2GCUCqWZfIPsVVKm6fZhjjaIn13xhPgDobor1aDNTYnAJ5pA2gxM3Bo6dQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeelgddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SD2fYaPd-B_kjwOiH2nKnE42TirfQYTLv4V3bzGY1vPkPeMXaNRSaA>
 <xmx:SD2fYb-Unhxx6hDg3Lbbw-xfMBV0gF-nnUTNM8RWkqGQ5rRN8WZxow>
 <xmx:SD2fYaWLI-z3NtbBd_Wj69eC4Io0AwQZB590rC3I0RSCN79OCilGHw>
 <xmx:ST2fYXQ1R4hjKPcBKaq-b8Rw62AVePtpXuiTnxoYSK0YLAYvHT5gcQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Nov 2021 02:37:43 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH for-7.0 3/4] hw/nvme: add ozcs enum
Date: Thu, 25 Nov 2021 08:37:34 +0100
Message-Id: <20211125073735.248403-4-its@irrelevant.dk>
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

Add enumeration for OZCS values.

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
index 2b8b906466ab..d33ff2c184cf 100644
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
2.34.0


