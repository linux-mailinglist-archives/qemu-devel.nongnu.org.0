Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5124168B2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 02:07:32 +0200 (CEST)
Received: from localhost ([::1]:33526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTYkV-0004qA-Nj
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 20:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYgY-0001Yd-NI; Thu, 23 Sep 2021 20:03:26 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:55571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mTYgX-0005hU-9Q; Thu, 23 Sep 2021 20:03:26 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8E47C5C0198;
 Thu, 23 Sep 2021 20:03:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 23 Sep 2021 20:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=awM8pk8gaVSbYY5eRoZM+BPdO/qswv9VHADonsYx1
 UU=; b=Kz13H3ajCrjx2RiYkW1BfpHj7Jxac7vLRd2P9vcPbBaJtYBUm09A7B7/Q
 gQGGc6WVXztmJgW6LH2pUE4pPqESfY7ngWxmwhMbYeFL85cBy/LkUavwBjVXUHIU
 kVa/cJJvoZ7YZFcpjJOc0pxXZ/bSmKQYn3wS2uwOxamrkg4yE0+eHC/cKrMDana2
 +SDKVcahlLuSQUClAB36uFcD5QYcQDAPbMdgcuDdxnLSX23ujPhKjltPRqnuXYhp
 BU/HvzGdxdskE/7OC3nnXiT8RKz5rZ5s9VK3JbOaoYL+Kni8Zm8F+Tf5gz5pJV0H
 RIfNsGT329Gy0gFuymDU0HxJlMNAw==
X-ME-Sender: <xms:zBVNYX5xyvG9Dz9ncNkOb-H5_WezEd75qLKYPYkXl8Wd_GL8RuhRKw>
 <xme:zBVNYc6iRwEIq1Msa2odewThEAM47tS35cpZ_Yweet5uGCgbDB_A0BdG2ds7qzs-1
 ffnX42Xr5RRMVah50c>
X-ME-Received: <xmr:zBVNYee9DZnr9apS8JYD9vSVK1pe6bpJcOahqW5MGfFxLSKQeQlbyxA-Qpr-hSiAbqmoHShXdtQogv0TociLcBZH6XoMvPa0Flj7QA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffkjghfhffugggtgfffsehtkeertddttdejnecuhfhrohhmpefhihhnnhcu
 vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
 htthgvrhhnpeeuvdevtdelfeelffdufeefteeukeektdfgieeugffhveetteevhfdvieej
 tdfhleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:zBVNYYLRTitOM602Qh52oQ7amkIatSKR0YwZZFGuXQ4WHdVY1I-90g>
 <xmx:zBVNYbLE5VwZxHxUoGWrQ-xSwnbirz1oaySQOOWHZC3oR_-Iqxbp6Q>
 <xmx:zBVNYRxIiy1nLCyqiTs5QwIdrkIs_JaJnSvOKAxqdmoJT0fPdvHlxg>
 <xmx:zBVNYSX2TWdEGdxfSIK3V9rqfc1dcJ4sRI9LZnLs77d24veI-Qt4Wg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 20:03:22 -0400 (EDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Greg Kurz <groug@kaod.org>
Message-Id: <8a347c38dda92fa7ff42a88cb20a2ffae95bffc1.1632437396.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1632437396.git.fthain@linux-m68k.org>
References: <cover.1632437396.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v1 2/9] hw/mos6522: Remove get_counter_value() methods and
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


