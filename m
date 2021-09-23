Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203814168B0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 02:07:17 +0200 (CEST)
Received: from localhost ([::1]:32956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTYkG-0004R3-4i
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 20:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYgf-0001ad-Ma; Thu, 23 Sep 2021 20:03:36 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:48131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYge-0005nZ-86; Thu, 23 Sep 2021 20:03:33 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 83F3F5C0198;
 Thu, 23 Sep 2021 20:03:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 23 Sep 2021 20:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=8G1kpbvi3qLf34z7Dqvs6y2wkUaWA
 eyy9+jflbgSWyg=; b=Ks7hdW+6Bye+nVVhoUrtSBlGHzCjpctW124YZmmj+CjaU
 DTNPSaAVwvENpRXFoenWG23jixWwR3rxmDuPK0ubmtOnHvrxp8VebMWXLAMn4dI0
 eNln0EFGcFlB36Iu4QiK13+dQTxqNzUk4vnvW6QukgiqKW4Muim1e+cTXaWVZn2d
 i59Z0flytM3sdWL2ESgADrMeNqxQ0dXP3bnaTsjepbCyiE+JGqxMnHsLcpnotEuo
 +/JfuZ8ahOXvyb6+EDSYfeSSty1NJPiQcPbWVklihs3qwlkmxYwGPUmqkL1i9jdv
 EL+qLnqenMIPnK1/Mjt2cGyRDWtycwVQXDz5uWYOA==
X-ME-Sender: <xms:0xVNYXbe2PLz-i1ix4OFcOyrL4IHhOGByRB3Llj34hj58_MFiph8Jw>
 <xme:0xVNYWbY8u4s5Aib-TUpMYeudbBag20Wf6W4an41vXzFa2lMLYvZFbHLczmvNe9_J
 GIOwtGYcxYwIgiXsco>
X-ME-Received: <xmr:0xVNYZ8fOtXI6Le7YuPSxemJr2bpmB1Mn3gZWqeYYm4aWlWyEi0cv3-UAAMNtJvr29oOhjbdLiYsw7RwrQMsNFpTOnVLgN6ICX2EWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgr
 ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
 hrnhephfetledtgeffuedujedvteevgfdtudeufeekvdfhveekkefhgfevtdfhveeuueet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
 grihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:0xVNYdq8n08BzV8pcwzcKKvcknYyiFxUfNAcQOc7kgQS58EQ6NRBQg>
 <xmx:0xVNYSoJ68vx4nlNSu9fdCm6Ytqx-oPJMpkERqdHdipNAvEFvZuQfQ>
 <xmx:0xVNYTQ_7VwiVWOCzwPMqZ0Ud379lYHQ0NOh3wv3AcalRvcSfjgdFQ>
 <xmx:0xVNYZ1R2mlKD-apwc8U0P1n71139-dp_Ay8DwKdMNIESBVvNuEWrg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 20:03:30 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Greg Kurz <groug@kaod.org>
Message-Id: <331f68f7b849ab366206f88ba8aed67c3c84d90f.1632437396.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1632437396.git.fthain@linux-m68k.org>
References: <cover.1632437396.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v1 3/9] hw/mos6522: Remove redundant mos6522_timer1_update()
 calls
Date: Fri, 24 Sep 2021 08:49:56 +1000
Received-SPF: none client-ip=66.111.4.29; envelope-from=fthain@linux-m68k.org;
 helo=out5-smtp.messagingengine.com
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


