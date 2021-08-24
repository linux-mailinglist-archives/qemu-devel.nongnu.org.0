Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B5A3F5BCC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:16:36 +0200 (CEST)
Received: from localhost ([::1]:37672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITTv-0002gp-Gg
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITS2-0008IX-WD; Tue, 24 Aug 2021 06:14:39 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:41595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITS1-0004PW-GQ; Tue, 24 Aug 2021 06:14:38 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id B3EFB3200AB0;
 Tue, 24 Aug 2021 06:14:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 24 Aug 2021 06:14:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=D6kpmswZJ+bN8/gNOo6Z+V8AqhvNc
 iyBCxIHB7mZLmY=; b=OInQgSWBOCM6Qd7guj0U0FnetFjheIVXb6pJgexyFfFYJ
 6+kGStgw60BRjJAjswCdq9SW55s+50JGOa6ScxwOfnt6DyOPuzLtb2XMwihD0dKb
 vPs7SUDTBxZ1nJ8Qaxv+IdWsnabgN8ZJ+7LM9bFU+CjHo2dTi/1CgwIDJd45GN+A
 Ul/YtQrTX1tEzVXuc0migS/Uoa98h5k5Dy8IrEOwM3uGM/79GdtMZi4n+ky+9+NB
 Kvi9kmlCa7mtKIA+UFDD79Iqk2NEFXGvsERIYTovfNjwCSyVmpIf6CbzkTEederi
 6aFr3uij0Ssw86QdqHJ8uV1t80gPEcSzTvwhpklLw==
X-ME-Sender: <xms:i8YkYTjxKTh9AiH0U0dxMUe21DkAdKQO-xVxRkbyMWIr0Zel2MPnXQ>
 <xme:i8YkYQAhKtBc0AYUL0UCj4o4NIykS3iyFESyl8lIHzX6yMEUjI7DB79vdP7twpeCz
 8LXQxCe7wRaNum0zZ8>
X-ME-Received: <xmr:i8YkYTFl9t4OcV9l9s4Tt1EbtogA_VBDZnvgi-rG8jx4k8rLJoyvqPtYJznuAJVdib5gFRc-h5W3S1iG3zAL79zOV8uHZtnWd68P1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtjedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgr
 ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
 hrnhephfetledtgeffuedujedvteevgfdtudeufeekvdfhveekkefhgfevtdfhveeuueet
 necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
 grihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:i8YkYQSI4lnTKTb23qilIDGd69S62Zsi5CN1Z17if4_0wDeKp-rF_Q>
 <xmx:i8YkYQxGm-OOtf44GgPZd8OvZ77YgYqbLVga23vzS6gh3Q_A9pzq1w>
 <xmx:i8YkYW43AuaFcq9Yc_zjdrRUdqxWpd5zC_gqB3x_Xzbno6aujF-Haw>
 <xmx:i8YkYc_cREGFI_Ciy3klNNb9qflVyjFCvc1QY5AjjfUcSEknuuYlKA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Aug 2021 06:14:33 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Message-Id: <e9a9b7f8c4530109b083bf19c547532f14db32a1.1629799776.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1629799776.git.fthain@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [RFC 04/10] hw/mos6522: Rename timer callback functions
Date: Tue, 24 Aug 2021 20:09:36 +1000
Received-SPF: none client-ip=64.147.123.25; envelope-from=fthain@linux-m68k.org;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This improves readability.

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 hw/misc/mos6522.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 1d4a56077e..c0d6bee4cc 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -154,7 +154,7 @@ static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
     }
 }
 
-static void mos6522_timer1(void *opaque)
+static void mos6522_timer1_expired(void *opaque)
 {
     MOS6522State *s = opaque;
     MOS6522Timer *ti = &s->timers[0];
@@ -164,7 +164,7 @@ static void mos6522_timer1(void *opaque)
     mos6522_update_irq(s);
 }
 
-static void mos6522_timer2(void *opaque)
+static void mos6522_timer2_expired(void *opaque)
 {
     MOS6522State *s = opaque;
     MOS6522Timer *ti = &s->timers[1];
@@ -445,8 +445,10 @@ static void mos6522_init(Object *obj)
         s->timers[i].index = i;
     }
 
-    s->timers[0].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer1, s);
-    s->timers[1].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer2, s);
+    s->timers[0].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                      mos6522_timer1_expired, s);
+    s->timers[1].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                      mos6522_timer2_expired, s);
 }
 
 static void mos6522_finalize(Object *obj)
-- 
2.26.3


