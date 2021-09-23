Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFD74168AF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 02:06:55 +0200 (CEST)
Received: from localhost ([::1]:60850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTYjt-0004Bg-Cb
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 20:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYgS-0001WC-1R; Thu, 23 Sep 2021 20:03:20 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:55107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYgQ-0005d3-GX; Thu, 23 Sep 2021 20:03:19 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4A1395C0198;
 Thu, 23 Sep 2021 20:03:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 23 Sep 2021 20:03:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=xUb1Yzz/dlDjw9acsbqgUufBJzLXKD1S/AyTZJMZ8
 f0=; b=Tpx66BDsFfjLz5gcf4rVd0YJ0FZvqR0xJ8BqlQL4UU9FWNcqrcAAfDFLb
 BSg1q4WECWRBvQQ4+TKNZ27O4X5P7cFuvecgf5m16MGO46FVnEnpR701bMxeTE5B
 S83yXKIgYhuuerPLso9R2yS90QgeM8xHvLFl2/YYdRomfmu2IW+yBT/PJPT5xvO9
 EHByJgBINHy25CJBeDL8lNSKGhCvL6SqoSe0GTqap5sgoNncrgJOPwWrqm7/zBqM
 OaEQR1qwY3feQTfYMbpxf4LEWsMs6vQzF5PE9hZSjZW9zSCTaf6KaxBtfVEroANH
 GvW73DztR3veGyXkVuKNcSzXUk1cQ==
X-ME-Sender: <xms:xRVNYUfGGywpeab3MoQY56Wa7xZmvKbb6reknqSsi5nJWIDBN04l6A>
 <xme:xRVNYWNSYV99Y9OcSlnEp7DqzB6a5K5dfUhJh6ryXFNnys5dAnDyHvsY72JD-6rDk
 6bex1Kakq7OpJItJd8>
X-ME-Received: <xmr:xRVNYVheGdEOLEoYJcq_xi83MOWG71TGp0e3cEXoaax28YaWMhRcQE_o73LGZ47av1U-Xf5oDuDc_6oupe6AfvvVXN1PjUBOyAS8xw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffugggtgfffsehtkeertddttdejnecuhfhrohhmpefhihhnnhcu
 vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
 htthgvrhhnpeeuvdevtdelfeelffdufeefteeukeektdfgieeugffhveetteevhfdvieej
 tdfhleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:xRVNYZ-nk2DYufOsgOFeOchL7GMsXYkSv0DepTxo2vN3QfhTmeoycg>
 <xmx:xRVNYQv9TmzZ2103sECRaq91f61gAO_0yAr515j-wz-yibeOucbp0w>
 <xmx:xRVNYQE8BGaVsloDMCcWb05VHOLSvsWdQbX0troM4JKDklbfZSpBEQ>
 <xmx:xRVNYZ6AuikERLg2DvuysGaT0gIQReVPjWk_lSWw6hXmnHzU1L_h2w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 20:03:15 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Greg Kurz <groug@kaod.org>
Message-Id: <6777c32efbf222c03979efc04a085bc06017e61a.1632437396.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1632437396.git.fthain@linux-m68k.org>
References: <cover.1632437396.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v1 1/9] hw/mos6522: Remove get_load_time() methods and
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This code appears to be unnecessary.

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/mos6522.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 1c57332b40..a478c1ca43 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -63,17 +63,6 @@ static uint64_t get_counter_value(MOS6522State *s, MOS6522Timer *ti)
     }
 }
 
-static uint64_t get_load_time(MOS6522State *s, MOS6522Timer *ti)
-{
-    MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
-
-    if (ti->index == 0) {
-        return mdc->get_timer1_load_time(s, ti);
-    } else {
-        return mdc->get_timer2_load_time(s, ti);
-    }
-}
-
 static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti)
 {
     int64_t d;
@@ -98,7 +87,7 @@ static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti)
 static void set_counter(MOS6522State *s, MOS6522Timer *ti, unsigned int val)
 {
     trace_mos6522_set_counter(1 + ti->index, val);
-    ti->load_time = get_load_time(s, ti);
+    ti->load_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     ti->counter_value = val;
     if (ti->index == 0) {
         mos6522_timer1_update(s, ti, ti->load_time);
@@ -208,13 +197,6 @@ static uint64_t mos6522_get_counter_value(MOS6522State *s, MOS6522Timer *ti)
                     ti->frequency, NANOSECONDS_PER_SECOND);
 }
 
-static uint64_t mos6522_get_load_time(MOS6522State *s, MOS6522Timer *ti)
-{
-    uint64_t load_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-
-    return load_time;
-}
-
 static void mos6522_portA_write(MOS6522State *s)
 {
     qemu_log_mask(LOG_UNIMP, "portA_write unimplemented\n");
@@ -518,8 +500,6 @@ static void mos6522_class_init(ObjectClass *oc, void *data)
     mdc->update_irq = mos6522_update_irq;
     mdc->get_timer1_counter_value = mos6522_get_counter_value;
     mdc->get_timer2_counter_value = mos6522_get_counter_value;
-    mdc->get_timer1_load_time = mos6522_get_load_time;
-    mdc->get_timer2_load_time = mos6522_get_load_time;
 }
 
 static const TypeInfo mos6522_type_info = {
-- 
2.26.3


