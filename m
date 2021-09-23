Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BAD4168B1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 02:07:22 +0200 (CEST)
Received: from localhost ([::1]:33254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTYkL-0004g2-Rk
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 20:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYgu-0001pH-Dv; Thu, 23 Sep 2021 20:03:48 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:60189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYgs-0005wD-LY; Thu, 23 Sep 2021 20:03:48 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E03135C019D;
 Thu, 23 Sep 2021 20:03:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 23 Sep 2021 20:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=TbSWpafMo8Kfp9k0Ir5UbxAx68Nqj
 kbe+zXc52aXycw=; b=FYaK5d9aeARvmOZk5W06sujc9y4MUJOLSXJXmOAUDm5ox
 xgDKG9arw80N1/4kIEG7Zx2DRqF3z0v+9jve3kqDgW3i2iWRpxJGkoBNJCYQUOaj
 qmOYZWmrVpOCsIUQIfedIXYEGYy8fsZoTUQ/t/k4j/9cK47Zk01bdddHaIoPksb7
 2UeVNhqb3bXvmwsIXWSzL8F4nWPpm9y5bnCrIc+Nq5LR7o0Bpq6Uu+hlQl+6IH6P
 0wAmRQXaQP3kigaf5Rk24M2XYndVbEFHsD73jfEmYQB+bmNRLLogbRZ6o6oKaDQG
 w3El+B/E6UcZ2CiRfSv4rSLgIEiP6by8ziAsBOnJQ==
X-ME-Sender: <xms:4RVNYXcOQxSWHZCvu2gb2lnMgSJk3VgHFN9_bI64zASrT6Jqq_8Gtw>
 <xme:4RVNYdMuNq_5Url6drhmJJRQ3tlNIMu5xZrqXMwwZY39R-y0kZVi3M_625rBY_yON
 xh9xxhZqnoHfpmnQtA>
X-ME-Received: <xmr:4RVNYQjaB2RdTH3NsMxfJtjWYUidmBxYuO710UaNU0aP5LmLNoHFiwfGliqyOJ9CeFHI_jYLVE4XP-RcgZje-WIpBPPsJ_iBK-1pvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgr
 ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
 hrnhephfetledtgeffuedujedvteevgfdtudeufeekvdfhveekkefhgfevtdfhveeuueet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
 grihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:4RVNYY9xftkCSmyyDkqZdyWC0Dy6pOVSVGK2wl0Ewlo8PQ6xC-ogZQ>
 <xmx:4RVNYTuY9CLSbHSNG5DGhBcG4f0vjfwgC1pR2zg32lKDyLCkB5Xi1Q>
 <xmx:4RVNYXFvNKRJTFFqfRHTVJckZWEi_UbgRz9l8gjkUTvJaUuu_XIbXQ>
 <xmx:4RVNYc5RZs6yq6Yow0_LPoRMHHyzzAMd8tfc4ScPrsX3rOBZa0viMA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 20:03:44 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Greg Kurz <groug@kaod.org>
Message-Id: <005b55c5dccb3786d15188f76f689002448383ae.1632437396.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1632437396.git.fthain@linux-m68k.org>
References: <cover.1632437396.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v1 5/9] hw/mos6522: Fix initial timer counter reload
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

The first reload of timer 1 is early by half of a clock cycle as it gets
measured from a falling edge. By contrast, the succeeding reloads are
measured from rising edge to rising edge.

Neglecting that complication, the behaviour of the counter should be the
same from one reload to the next. The sequence is always:

N, N-1, N-2, ... 2, 1, 0, -1, N, N-1, N-2, ...

But at the first reload, the present driver does this instead:

N, N-1, N-2, ... 2, 1, 0, -1, N-1, N-2, ...

Fix this deviation for both timer 1 and timer 2, and allow for the fact
that on a real 6522 the timer 2 counter is not reloaded when it wraps.

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 hw/misc/mos6522.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index c0d6bee4cc..6bd60f2118 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -63,15 +63,16 @@ static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti)
     if (ti->index == 0) {
         /* the timer goes down from latch to -1 (period of latch + 2) */
         if (d <= (ti->counter_value + 1)) {
-            counter = (ti->counter_value - d) & 0xffff;
+            counter = ti->counter_value - d;
         } else {
-            counter = (d - (ti->counter_value + 1)) % (ti->latch + 2);
-            counter = (ti->latch - counter) & 0xffff;
+            int64_t d_post_reload = d - (ti->counter_value + 2);
+            /* XXX this calculation assumes that ti->latch has not changed */
+            counter = ti->latch - (d_post_reload % (ti->latch + 2));
         }
     } else {
-        counter = (ti->counter_value - d) & 0xffff;
+        counter = ti->counter_value - d;
     }
-    return counter;
+    return counter & 0xffff;
 }
 
 static void set_counter(MOS6522State *s, MOS6522Timer *ti, unsigned int val)
@@ -102,11 +103,13 @@ static int64_t get_next_irq_time(MOS6522State *s, MOS6522Timer *ti,
 
     /* the timer goes down from latch to -1 (period of latch + 2) */
     if (d <= (ti->counter_value + 1)) {
-        counter = (ti->counter_value - d) & 0xffff;
+        counter = ti->counter_value - d;
     } else {
-        counter = (d - (ti->counter_value + 1)) % (ti->latch + 2);
-        counter = (ti->latch - counter) & 0xffff;
+        int64_t d_post_reload = d - (ti->counter_value + 2);
+        /* XXX this calculation assumes that ti->latch has not changed */
+        counter = ti->latch - (d_post_reload % (ti->latch + 2));
     }
+    counter &= 0xffff;
 
     /* Note: we consider the irq is raised on 0 */
     if (counter == 0xffff) {
-- 
2.26.3


