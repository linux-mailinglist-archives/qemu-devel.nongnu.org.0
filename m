Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A2C3F5BD6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:17:39 +0200 (CEST)
Received: from localhost ([::1]:43270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITUv-0006VT-MM
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITRu-0007oz-DO; Tue, 24 Aug 2021 06:14:30 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:52533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITRs-0004K6-Jd; Tue, 24 Aug 2021 06:14:30 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 939793200A61;
 Tue, 24 Aug 2021 06:14:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 24 Aug 2021 06:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=8G1kpbvi3qLf34z7Dqvs6y2wkUaWA
 eyy9+jflbgSWyg=; b=HkmDh6M94b1EHWqaL21cQhqnv01vAh1n7cYlMtHXT72iL
 4eEo77XUhd+XsOV/suJIDFT1W0vHowChNfl+gs0YAGMozg6kfcSYWSN9Wkl8tn6k
 G/S3mMWZXNgBdYqJXvCzYVsbqqkFBDGxURRj4g9/Z33VGI8rs03X97DI3ThgCQjI
 4ak2FLu3oN0CBOXtBjZ0SpP+/KJS25HUj1uXNRUy85y7HZWUS9bX2elQ9M+9k1h9
 wJGLCAtphmJVm9JEzgCegFQYEnszjAIfja3UBtz7z7R6u8ry8STadiRXbXG5N9VJ
 iUVPcXhB5+YiJG1nu73DKaUfy67neRsmCN8tLyFXQ==
X-ME-Sender: <xms:gcYkYa4W0J0xqvBbUFrn62jk7Ftb2lxulqVLKQxwzSpMGZpR5O-UQw>
 <xme:gcYkYT4YWDrlTvHhGjRpxX-XaW2RKN-lF7cvYpJ9yJpfbX_4lVc4CzBkPxkO3Mx-R
 D2MUeucFmFB8ZJEHwQ>
X-ME-Received: <xmr:gcYkYZde0hFEnlnyDyCCvJvKDoAbyx6Gfym_ReGNgcTw3QPoLh7VR3hsw10z8KLe2_ZWsLyiRBxxf561PPU8EclGyjro57eWiyv8YQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtjedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgr
 ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
 hrnhephfetledtgeffuedujedvteevgfdtudeufeekvdfhveekkefhgfevtdfhveeuueet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
 grihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:gcYkYXJcpQHT2YUnejxcBPHL8ryMaw0LyTuIcGNMGpzCmWPZgDDwSg>
 <xmx:gcYkYeKM0pVXHSca5lkIXe6VDMQb0ldKcN44qeUut-BcT0uhNPWAPw>
 <xmx:gcYkYYykd1JAB7hqySTVcFgmEsQ3oHEZVlVaysuV6jDGGqESfaGLYg>
 <xmx:gsYkYa2Pg5KjxzUCWsDyYS4SFyrFJgYANuZvaB3kL3Vz2Gk4k4Y7Tg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Aug 2021 06:14:23 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Message-Id: <920eddc0e99bf57e7ac540502f863f222c401d2f.1629799776.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1629799776.git.fthain@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [RFC 03/10] hw/mos6522: Remove redundant mos6522_timer1_update() calls
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

Reads and writes to the TL and TC registers have no immediate effect on
a running timer, with the exception of a write to TCH. Hence these
mos6522_timer_update() calls are not needed.

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 hw/misc/mos6522.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index ff246b5437..1d4a56077e 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -234,7 +234,6 @@ uint64_t mos6522_read(void *opaque, hwaddr addr, unsigned size)
         val = s->timers[0].latch & 0xff;
         break;
     case VIA_REG_T1LH:
-        /* XXX: check this */
         val = (s->timers[0].latch >> 8) & 0xff;
         break;
     case VIA_REG_T2CL:
@@ -303,8 +302,6 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
         break;
     case VIA_REG_T1CL:
         s->timers[0].latch = (s->timers[0].latch & 0xff00) | val;
-        mos6522_timer1_update(s, &s->timers[0],
-                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
         break;
     case VIA_REG_T1CH:
         s->timers[0].latch = (s->timers[0].latch & 0xff) | (val << 8);
@@ -313,14 +310,10 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
         break;
     case VIA_REG_T1LL:
         s->timers[0].latch = (s->timers[0].latch & 0xff00) | val;
-        mos6522_timer1_update(s, &s->timers[0],
-                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
         break;
     case VIA_REG_T1LH:
         s->timers[0].latch = (s->timers[0].latch & 0xff) | (val << 8);
         s->ifr &= ~T1_INT;
-        mos6522_timer1_update(s, &s->timers[0],
-                              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
         break;
     case VIA_REG_T2CL:
         s->timers[1].latch = (s->timers[1].latch & 0xff00) | val;
-- 
2.26.3


