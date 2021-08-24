Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B5E3F5BC8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:15:46 +0200 (CEST)
Received: from localhost ([::1]:34590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITSz-0000ae-L9
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITRa-0006iA-4q; Tue, 24 Aug 2021 06:14:10 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:35823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITRY-00045u-Jq; Tue, 24 Aug 2021 06:14:09 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C371B3200A90;
 Tue, 24 Aug 2021 06:14:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 24 Aug 2021 06:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=GOyQvIBmoqlEWKUC1L3vnBey+rGNz
 lW1F/+LDP21SMU=; b=GW0kkZ7IfcXNLIuhoIXwGLAEh2cksnqyihBNn8wXm9p0i
 Ys1Q8xZLAqGzCqHZVdlPS+PXZVqP/sMitzeOeJb2YkoTqum9zXoLoohIzcdzX2JY
 ARkF9VS6U/+cnenuerBu3FwfjWhzogcex84zLWnx5z8G2GyWIskEpH4y4DOCwU56
 5pGK1CxI/4X/2ZL9C5PjIVIyB+IZIQM811Lc5rZTBN2zWxLFNFf4kwcCmcpHKeSK
 Rn03ctiFRTsL6gWlTi4/CQ4Ow1KnYkmRJKoT0uWIH0wnbHPS4e45L4wRSG+BXuA0
 hKbVTiCu5mYVD4MNWNtgqxAFD4uxNT3MjMDwwmgVw==
X-ME-Sender: <xms:bcYkYcTqgOQ0ywEMnF_T0nMb-GboM8JnU9C5ZRHLeTqWKFsJT9z87Q>
 <xme:bcYkYZwpdsr60jpOQpMRhlqxG3tNWvtFeLZProRr196I9rHnJT0TAR00uYsGL_3A7
 73j3YOgYYzICLggxuI>
X-ME-Received: <xmr:bcYkYZ034viejgzece9SqztIDklhSJYBZ4HmIs-8HnVR52hdcLRIgV1znIRl_2ldTB5RWKKqf9IOu9tDYOBzfXm8DDrz1RfgOsyW6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtjedgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgr
 ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
 hrnhephfetledtgeffuedujedvteevgfdtudeufeekvdfhveekkefhgfevtdfhveeuueet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
 grihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:bcYkYQAo6OV9hItQtu0zU-PhCw0E3ofhiDQdoJKVslNBwx_MdYANqg>
 <xmx:bcYkYVjMDJRTsJGwORdv86fIGW5NXRBdSiFRjzWKNDYS3mODcs4dDw>
 <xmx:bcYkYcqtELubkNhf3EO9hy0Oa9IuoM3uWDBj4giQPrXeiuVDOJI2IA>
 <xmx:bsYkYatC8fLzS_bWlm5Il45Wg9UuCheg4Rwn6dLr97sIE1ygUYfuaw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Aug 2021 06:14:03 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Message-Id: <9b78e8c6e453feab6275d04bf503051645770d85.1629799776.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1629799776.git.fthain@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [RFC 01/10] hw/mos6522: Remove get_load_time() methods and functions
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

This code appears to be unnecessary.

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
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


