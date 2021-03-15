Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556E133B1B8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:50:02 +0100 (CET)
Received: from localhost ([::1]:55162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLljV-0000VD-C9
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@knazarov.com>) id 1lLli1-0008Ct-4O
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:48:29 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:40065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@knazarov.com>) id 1lLlhz-0007Mu-7U
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:48:28 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3E5285C011A;
 Mon, 15 Mar 2021 07:48:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 15 Mar 2021 07:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=knazarov.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=8X4R4UV+TDGWzK+hZENE63/gFx
 YvFAq0IlqiSXFKtuc=; b=pZT4YTPTlWLvKoY6qQO5JcQxk7b9BaD/VhpF0Hwm2g
 SeDTUi/d5+BYXLwvcwTOgsl3v6RtTL0e8vqJ2ZCT01Etzm1Vrc/l2Bx8J24p6Aku
 N8qwhAn5s6fqu7g1jADI6RIUceEepS+xBsr+zQ1+oNi5sGuLXAjd8kEhjuLO159z
 BLa/CV1a7HgGOx7JZiwPfv4ylahWuIa/AYBR2r8U62lntHhJnNFK/fbINbYbGAld
 86y5DydvNoL4Z8Vr+VWgyE2q6R3G3csHq9189u2jtKdEEymj1b+rMb7Slrdqoc8Q
 N40RxGsMr5mVPhb/m2eMiNmMMMkTYPvEJABV1q41oO5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=8X4R4UV+TDGWzK+hZ
 ENE63/gFxYvFAq0IlqiSXFKtuc=; b=pH8R2BdGHh8ZAJdVt54rwlcPbeDzLRTmu
 lWTKO9XaG8NfPp9y6VPcrOFSuotpTs7/d+PHrz1AtQaUk+cp9+twyyaJp/fwP4gb
 m3PF4WNsPi9UmcE+VWXiGtBtL/LUumdjfPIvrsBbET0FnrqWGs3J2rFDH/ysf/kd
 GAJ4KNV5Hr0Rwm/Fg4c7EeTVY/4wEvgzVC/JN4X2t943YgnnkdxCimqDAJ1cgzEz
 Pw1ZUVfuhImq8sbUK5f40m7B8paYuuDxzzlAjhWcjKkBla4CZne0EXp31st3WH3w
 Tsa/uvlKC19ClmPy+rWdyRibJmwvGXqO4zdBcozn++O54ik7KrBBg==
X-ME-Sender: <xms:iUlPYPelybPXs9F9QfyiMSGQXh78HLVs0iqE8Ju8vrMkwZaud7E6ZA>
 <xme:iUlPYFOwoTG8C4bMQtn_iCzy-9IN8wbjcYsyJTmp4dE8eg9ksvumH43AiZXfntx0p
 FDmmEz8UK35rytVVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvledgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmohhnshhtrghn
 thhinhcupfgriigrrhhovhcuoehmrghilheskhhnrgiirghrohhvrdgtohhmqeenucggtf
 frrghtthgvrhhnpefgkeetvdfhffelfeevffdttddtleeljeelkeetfeekheduveeuffdv
 ffefjeduheenucfkphepuddtledrvdehvddruddtjedrleenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghilheskhhnrgiirghrohhvrdgt
 ohhm
X-ME-Proxy: <xmx:iUlPYIj9JuS7i_ZA-B1G6qE0TZtqw7Dv4Gv7sVWaPXpmtAjPMIaLpA>
 <xmx:iUlPYA-PpRoHn_8KopLb8f0cR_jar2w_gXqhHdtXVmJwVarPz5BKvg>
 <xmx:iUlPYLsnHTekZyD4NsI5kG_LI_efdXbi7zqx6zFmFvb-yG3TQGodbA>
 <xmx:iklPYEXNs1yBaq77z-72P4bnuvuWtfdCSGq8Yf8x6_p5qwatMviGcQ>
Received: from pin.lan (unknown [109.252.107.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0E54D24005E;
 Mon, 15 Mar 2021 07:48:24 -0400 (EDT)
From: Konstantin Nazarov <mail@knazarov.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] edid: move timing generation into a separate function
Date: Mon, 15 Mar 2021 14:46:37 +0300
Message-Id: <20210315114639.91953-1-mail@knazarov.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=mail@knazarov.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Konstantin Nazarov <mail@knazarov.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The timing generation is currently performed inside the function that
fills in the DTD. The DisplayID generation needs it as well, so moving
it out to a separate function.

Based-on: <20210303152948.59943-2-akihiko.odaki@gmail.com>
Signed-off-by: Konstantin Nazarov <mail@knazarov.com>
---
 hw/display/edid-generate.c | 68 ++++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 24 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index b0ce583d436..1e1d89b9a78 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -44,6 +44,35 @@ static const struct edid_mode {
     { .xres =  640,   .yres =  480,   .byte  = 35,   .bit = 5 },
 };
 
+typedef struct Timings {
+    uint32_t xfront;
+    uint32_t xsync;
+    uint32_t xblank;
+
+    uint32_t yfront;
+    uint32_t ysync;
+    uint32_t yblank;
+
+    uint64_t clock;
+} Timings;
+
+static void generate_timings(Timings *timings, uint32_t refresh_rate,
+                             uint32_t xres, uint32_t yres)
+{
+    /* pull some realistic looking timings out of thin air */
+    timings->xfront = xres * 25 / 100;
+    timings->xsync  = xres *  3 / 100;
+    timings->xblank = xres * 35 / 100;
+
+    timings->yfront = yres *  5 / 1000;
+    timings->ysync  = yres *  5 / 1000;
+    timings->yblank = yres * 35 / 1000;
+
+    timings->clock  = ((uint64_t)refresh_rate *
+                       (xres + timings->xblank) *
+                       (yres + timings->yblank)) / 10000000;
+}
+
 static void edid_ext_dta(uint8_t *dta)
 {
     dta[0] = 0x02;
@@ -207,38 +236,29 @@ static void edid_desc_timing(uint8_t *desc, uint32_t refresh_rate,
                              uint32_t xres, uint32_t yres,
                              uint32_t xmm, uint32_t ymm)
 {
-    /* pull some realistic looking timings out of thin air */
-    uint32_t xfront = xres * 25 / 100;
-    uint32_t xsync  = xres *  3 / 100;
-    uint32_t xblank = xres * 35 / 100;
-
-    uint32_t yfront = yres *  5 / 1000;
-    uint32_t ysync  = yres *  5 / 1000;
-    uint32_t yblank = yres * 35 / 1000;
-
-    uint64_t clock  = (uint64_t)refresh_rate * (xres + xblank) * (yres + yblank);
-
-    stl_le_p(desc, clock / 10000000);
+    Timings timings;
+    generate_timings(&timings, refresh_rate, xres, yres);
+    stl_le_p(desc, timings.clock);
 
     desc[2] = xres   & 0xff;
-    desc[3] = xblank & 0xff;
+    desc[3] = timings.xblank & 0xff;
     desc[4] = (((xres   & 0xf00) >> 4) |
-               ((xblank & 0xf00) >> 8));
+               ((timings.xblank & 0xf00) >> 8));
 
     desc[5] = yres   & 0xff;
-    desc[6] = yblank & 0xff;
+    desc[6] = timings.yblank & 0xff;
     desc[7] = (((yres   & 0xf00) >> 4) |
-               ((yblank & 0xf00) >> 8));
+               ((timings.yblank & 0xf00) >> 8));
 
-    desc[8] = xfront & 0xff;
-    desc[9] = xsync  & 0xff;
+    desc[8] = timings.xfront & 0xff;
+    desc[9] = timings.xsync  & 0xff;
 
-    desc[10] = (((yfront & 0x00f) << 4) |
-                ((ysync  & 0x00f) << 0));
-    desc[11] = (((xfront & 0x300) >> 2) |
-                ((xsync  & 0x300) >> 4) |
-                ((yfront & 0x030) >> 2) |
-                ((ysync  & 0x030) >> 4));
+    desc[10] = (((timings.yfront & 0x00f) << 4) |
+                ((timings.ysync  & 0x00f) << 0));
+    desc[11] = (((timings.xfront & 0x300) >> 2) |
+                ((timings.xsync  & 0x300) >> 4) |
+                ((timings.yfront & 0x030) >> 2) |
+                ((timings.ysync  & 0x030) >> 4));
 
     desc[12] = xmm & 0xff;
     desc[13] = ymm & 0xff;
-- 
2.24.3 (Apple Git-128)


