Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAA33F5BD5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:17:36 +0200 (CEST)
Received: from localhost ([::1]:43032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITUs-0006Lg-WD
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITSB-0000Q9-M4; Tue, 24 Aug 2021 06:14:47 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:47813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITSA-0004UK-2Z; Tue, 24 Aug 2021 06:14:47 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 3DF263200AA3;
 Tue, 24 Aug 2021 06:14:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 24 Aug 2021 06:14:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=G33Nu3UL3tloHtz77vfPWSOyhOD0Q
 90RbN3ePJcpTvY=; b=n2vEyMlyhEm9onjYbA3spWPPkBDW/o3k3g9MwPI2r+Pcp
 AadFm+Vb7crnSzze4vh08sr4fzIlKte+8jvkN5lD/bR2ra+egeGn83gS9Gd1YwnL
 UGUcL6lKmj3fbjSJx3DP3wEEWs2o7zsQvdLV7IoVWKXPAwPF6r4daqZ14Mw/xz6t
 V4ByyF/6WYUDeZplWhfPv6h3CRXsPafk0eCk4Gf7ofbFit7hDKB2iY54oMFmVkwW
 2JmEPPluRSc0XvUr8H0DVm9U2PUsugWWYXS7DF5LrfFZXYf7btUCP2b1uhczMLI/
 Bu3pf6B/2og2eW4oGywEueLpR7QyWZUBtLJrVOzSA==
X-ME-Sender: <xms:k8YkYc371QkNg5a37XMOZSXBw_I0_jeG6KxX6tHqwb9a8O9eOaq3Tw>
 <xme:k8YkYXGASJ9fUBpFkRNQfzhRrlQDYOyJooiNWtJ-zXNGzo4kXn6ongrgapWRU-gGZ
 4g7I8E3SAePjp3Kf2k>
X-ME-Received: <xmr:k8YkYU6O0FIrVZW7oKX7o_WkwuSj4PBaFHXz3_Mgqf5WAM28FFN8hLc5uGdC5d8R8b5Lm83SELvT7d-xd9BwpL9uDu-1-op5n8XVUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtjedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgr
 ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
 hrnhephfetledtgeffuedujedvteevgfdtudeufeekvdfhveekkefhgfevtdfhveeuueet
 necuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
 grihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:k8YkYV0XcrsN-T8fM82SHi1rVNnME5v-Imkh2F7ufwYHxm-4SwilQw>
 <xmx:k8YkYfFEkbyzvTyn4B_a-HvSWPIx2mMdfslReg12Yb7AzRkB9cupKw>
 <xmx:k8YkYe983dpjhlR_pNAiLxpAMofxkdC8uCrHIZ4p-WuS_4qGOXpBag>
 <xmx:k8YkYXDxWCzaon-AiWwTm6ktrvK0pgKz8oZ7_3p34ohvbIwU-yRGsQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Aug 2021 06:14:42 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Message-Id: <b87cf2a2841d4597cc779df5dfce500c51a172ef.1629799776.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1629799776.git.fthain@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [RFC 05/10] hw/mos6522: Don't clear T1 interrupt flag on latch write
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

The Synertek datasheet says, "A write to T1L-H loads an 8-bit count value
into the latch. A read of T1L-H transfers the contents of the latch to
the data bus. Neither operation has an affect [sic] on the interrupt
flag."

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 hw/misc/mos6522.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index c0d6bee4cc..ffff8991f4 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -313,7 +313,6 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
         break;
     case VIA_REG_T1LH:
         s->timers[0].latch = (s->timers[0].latch & 0xff) | (val << 8);
-        s->ifr &= ~T1_INT;
         break;
     case VIA_REG_T2CL:
         s->timers[1].latch = (s->timers[1].latch & 0xff00) | val;
-- 
2.26.3


