Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D2B5F715E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 00:48:07 +0200 (CEST)
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogZew-0005PV-3A
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 18:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1ogZbe-0003JA-FU; Thu, 06 Oct 2022 18:44:43 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:41165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1ogZbc-0008WF-Di; Thu, 06 Oct 2022 18:44:42 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 002185C00DE;
 Thu,  6 Oct 2022 18:44:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 06 Oct 2022 18:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1665096276; x=1665182676; bh=6t
 n/NGQhhdui/vD3mxPTValU6y0ZtnCHXeZ56HyamtU=; b=CMklom3pSu4AsmsZX/
 6MJ+HnfTyKMe1VPzugSyDZv0EdiHbpKuB7VXQ42UdoCpKzeIL4ULc3XE3Cj64UGe
 FdIxcgjaa+k0NRUbC0c5RIp5H4rPvPo3phxeNAIr7ugn6GOsBnPZUcPGNhQ6Umkf
 81UyM+ltH7+8mWIkPjdWShJygcDcPiuaiccFIaEOjGNZ/dPnus6BSTAKGU0qCkk2
 oV/4HJxLcrEN9sntEgLVRCSeTspU6k/OZTzhFngWVCgNqn/9g0Y21+hczTv6DzQb
 mtDkXe1MBCF+54Q+NDvpe7oFvLMyL9ee2ecahKbSLn7+UdIVLs85iz9oqJYO/Vss
 3h5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1665096276; x=1665182676; bh=6tn/NGQhhdui/
 vD3mxPTValU6y0ZtnCHXeZ56HyamtU=; b=bzdCwbtKDVbGdE58CdrurMHl6M35K
 iIeH4ivqr56vVxCvIzhZEqZqbP94zY6opA0c1dc36z4SCt0WGLJH7X3QmFYiT3VX
 yBpXl2jULJwbhbRem3pE5BTDMMT2kkVEwImnSaqn0uxghqU65lgWG4pU7La0xWzE
 Nj7jUkNtIqPtZdzUNLhBXqaoATTdMTTdvUlw6Lsh8tqvftQw6uqZ1iTy9gcP2JyO
 3g2nQTbs56Z/NZeouDbjD9mGqq4pMc3wYJp4Trwj19huuY6C7qq5PWyKtUsXxf+q
 EUhQ7U22gbmsfM/1sVIiGwluUMNez+pIp/zaluyjLk7K+rZ18kSYslnuQ==
X-ME-Sender: <xms:VFo_Y76NBeNwWFEPE4bCTUoDrMmZkRzt-h_B6dwwZRczt6QQf01Oow>
 <xme:VFo_Yw4q1F0U0ilyw6FwrPO6Az73p7_VVDdmL5bnGQNumxf_6jJGtgTKPurTpcoWF
 _F6t60CjPuOZPi_fU8>
X-ME-Received: <xmr:VFo_YyfUZnHfbicmQKGzudHDn50MCs-uzktl1LfJ2lM8yDKKoXJc_CzlLiJGqq_pAUMFEQ9TS8yfpA-X8wKLxVFyLiGW6RUf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeiiedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertder
 tddtnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeefveeihfdvgeeguddtveeuudeu
 vdelgeetleefhfeukeehteekieeujeehtddtjeenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:VFo_Y8LKOlbz8332OIHE4UaASIgcMOkI1PlPisOUwnFVWZjLrG12Sw>
 <xmx:VFo_Y_JkTuwbhRN6VdgLCDnoVMMj7QnM5GiD4a7Yc36iUokV62B4iQ>
 <xmx:VFo_Y1wDEXgG7hcu7hJYNUxDyEItK7CqfHBhEVWFZs5pl52AkXNGvw>
 <xmx:VFo_Y5D4fWxt2IPI-5jdX76vI7blLWDfAyKIr36K6bO9jPE00PwJuw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Oct 2022 18:44:36 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: clg@kaod.org
Cc: alistair@alistair23.me, andrew@aj.id.au, frasse.iglesias@gmail.com,
 irischenlj@fb.com, joel@jms.id.au, michael@walle.cc,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Patrick Williams <patrick@stwcx.xyz>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH] m25p80: Add the w25q01jvq SFPD table
Date: Thu,  6 Oct 2022 17:44:24 -0500
Message-Id: <20221006224424.3556372-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220722063602.128144-9-clg@kaod.org>
References: <20220722063602.128144-9-clg@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=patrick@stwcx.xyz;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_SUSPICIOUS_NTLD=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01 autolearn=ham autolearn_force=no
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

Generated from hardware using the following command and then padding
with 0xff to fill out a power-of-2:
    hexdump -v -e '8/1 "0x%02x, " "\n"' sfdp`

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 hw/block/m25p80.c      |  3 ++-
 hw/block/m25p80_sfdp.c | 36 ++++++++++++++++++++++++++++++++++++
 hw/block/m25p80_sfdp.h |  2 ++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 8ba9d732a3..86343160ef 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -349,7 +349,8 @@ static const FlashPartInfo known_devices[] = {
       .sfdp_read = m25p80_sfdp_w25q256 },
     { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K),
       .sfdp_read = m25p80_sfdp_w25q512jv },
-    { INFO("w25q01jvq",   0xef4021,      0,  64 << 10, 2048, ER_4K) },
+    { INFO("w25q01jvq",   0xef4021,      0,  64 << 10, 2048, ER_4K),
+      .sfdp_read = m25p80_sfdp_w25q01jvq },
 };
 
 typedef enum {
diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
index dad3d7e64f..77615fa29e 100644
--- a/hw/block/m25p80_sfdp.c
+++ b/hw/block/m25p80_sfdp.c
@@ -294,3 +294,39 @@ static const uint8_t sfdp_w25q512jv[] = {
     0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
 };
 define_sfdp_read(w25q512jv);
+
+static const uint8_t sfdp_w25q01jvq[] = {
+    0x53, 0x46, 0x44, 0x50, 0x06, 0x01, 0x01, 0xff,
+    0x00, 0x06, 0x01, 0x10, 0x80, 0x00, 0x00, 0xff,
+    0x84, 0x00, 0x01, 0x02, 0xd0, 0x00, 0x00, 0xff,
+    0x03, 0x00, 0x01, 0x02, 0xf0, 0x00, 0x00, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xe5, 0x20, 0xfb, 0xff, 0xff, 0xff, 0xff, 0x3f,
+    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x42, 0xbb,
+    0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00,
+    0xff, 0xff, 0x40, 0xeb, 0x0c, 0x20, 0x0f, 0x52,
+    0x10, 0xd8, 0x00, 0x00, 0x36, 0x02, 0xa6, 0x00,
+    0x82, 0xea, 0x14, 0xe2, 0xe9, 0x63, 0x76, 0x33,
+    0x7a, 0x75, 0x7a, 0x75, 0xf7, 0xa2, 0xd5, 0x5c,
+    0x19, 0xf7, 0x4d, 0xff, 0xe9, 0x70, 0xf9, 0xa5,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0x0a, 0xf0, 0xff, 0x21, 0xff, 0xdc, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+};
+define_sfdp_read(w25q01jvq);
diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
index 62f140a2fc..8fb1cd3f8a 100644
--- a/hw/block/m25p80_sfdp.h
+++ b/hw/block/m25p80_sfdp.h
@@ -24,4 +24,6 @@ extern uint8_t m25p80_sfdp_mx66l1g45g(uint32_t addr);
 extern uint8_t m25p80_sfdp_w25q256(uint32_t addr);
 extern uint8_t m25p80_sfdp_w25q512jv(uint32_t addr);
 
+extern uint8_t m25p80_sfdp_w25q01jvq(uint32_t addr);
+
 #endif
-- 
2.35.1


