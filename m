Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9BD3F5BC9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:16:06 +0200 (CEST)
Received: from localhost ([::1]:36162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITTQ-0001f9-VR
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITRk-0007Ht-B8; Tue, 24 Aug 2021 06:14:20 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:57457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mITRi-0004DL-Dp; Tue, 24 Aug 2021 06:14:20 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 93DAC3200A18;
 Tue, 24 Aug 2021 06:14:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 24 Aug 2021 06:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=G9lQcM6KdRWUqEw5sP5sZCtnTl1qE
 4eZTR+PJiIiTcE=; b=jl+5RPxRhYadbumRUjFjKBzX5dHTu0r99fn/JNegiliY8
 tAwWsza1USwTAGl9yCkCccualTN9w4DXys7cD51sO28bf5P+VPAXWmC8ud67BtOL
 dgzYmqy/MoWAEYMsh/UfkhDv5jtxWGS4Kwt7J+gc5ekO3kKryBP3/oxRjiiS51ah
 BpwVbiX0dHvHZTtMnNLjot1RVmRY6SOTn1wKJZ6ZhCkVKxyIKYtsMCsUHg4ltgjA
 KVGDUPyvQWMnOw5IbSKHQp0bAfNylaKRhL8BaQm3oDs8tevVVBUk56mOMuz/KEnn
 SHwqi3couDSiADXOm0KBTgTUyYAGhpt4I37TGtOmw==
X-ME-Sender: <xms:d8YkYZX5QOVrxX4f9mOG4vjmmSvedSbm9Ch7T_C1m2L0FFx35gIfBA>
 <xme:d8YkYZk-OJAonIkOQhCrzZLHd-_nIUmTn9lchlDyA7OBwXXZLqSnMvfk199-fby2f
 wDKR56jdfW6qcwfn48>
X-ME-Received: <xmr:d8YkYVZ1nEp5DQUT4b1iRxwZzU8jOiBFvo232iDfnXXV7P_ReqPaSpJlT9enThblhGaHwH3w2mZGTbi1-FXlt2kUyunGFV5NxS_kIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtjedgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgr
 ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
 hrnhephfetledtgeffuedujedvteevgfdtudeufeekvdfhveekkefhgfevtdfhveeuueet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
 grihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:d8YkYcWlNForrTNmBThSWjZL8_u6ZOHxOXMy2A3aKcdO7DUnt3fUGw>
 <xmx:d8YkYTlXOZnEHnGOAVXr7LgQXxC-meubpAT-guCTvovv6TUktRoLxQ>
 <xmx:d8YkYZf1ORlXlDDog67f6ugH0mw7K30gv67XiMN3s5UawEpue3L9tw>
 <xmx:eMYkYRjXfG2CbLIreVLF-il7p1_lDZcjuhLVy6sLKLjFDnQ_o-FOzw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Aug 2021 06:14:13 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Message-Id: <0f0fe91d4b1878000260bea3bb44bcb61525ae13.1629799776.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1629799776.git.fthain@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [RFC 02/10] hw/mos6522: Remove get_counter_value() methods and
 functions
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

Also, these routines don't return the counter value but a time interval
between counter values, so they are misnamed.

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 hw/misc/mos6522.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index a478c1ca43..ff246b5437 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -52,23 +52,13 @@ static void mos6522_update_irq(MOS6522State *s)
     }
 }
 
-static uint64_t get_counter_value(MOS6522State *s, MOS6522Timer *ti)
-{
-    MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(s);
-
-    if (ti->index == 0) {
-        return mdc->get_timer1_counter_value(s, ti);
-    } else {
-        return mdc->get_timer2_counter_value(s, ti);
-    }
-}
-
 static unsigned int get_counter(MOS6522State *s, MOS6522Timer *ti)
 {
     int64_t d;
     unsigned int counter;
 
-    d = get_counter_value(s, ti);
+    d = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
+                 ti->frequency, NANOSECONDS_PER_SECOND);
 
     if (ti->index == 0) {
         /* the timer goes down from latch to -1 (period of latch + 2) */
@@ -191,12 +181,6 @@ static void mos6522_set_sr_int(MOS6522State *s)
     mos6522_update_irq(s);
 }
 
-static uint64_t mos6522_get_counter_value(MOS6522State *s, MOS6522Timer *ti)
-{
-    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
-                    ti->frequency, NANOSECONDS_PER_SECOND);
-}
-
 static void mos6522_portA_write(MOS6522State *s)
 {
     qemu_log_mask(LOG_UNIMP, "portA_write unimplemented\n");
@@ -498,8 +482,6 @@ static void mos6522_class_init(ObjectClass *oc, void *data)
     mdc->portB_write = mos6522_portB_write;
     mdc->portA_write = mos6522_portA_write;
     mdc->update_irq = mos6522_update_irq;
-    mdc->get_timer1_counter_value = mos6522_get_counter_value;
-    mdc->get_timer2_counter_value = mos6522_get_counter_value;
 }
 
 static const TypeInfo mos6522_type_info = {
-- 
2.26.3


