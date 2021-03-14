Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E3F33A3D0
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 10:15:16 +0100 (CET)
Received: from localhost ([::1]:42716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLMqB-0000hV-Vs
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 05:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@knazarov.com>) id 1lLMnt-0007ti-UY
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 05:12:53 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:52509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@knazarov.com>) id 1lLMnq-0004y4-9T
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 05:12:53 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 727405C008F;
 Sun, 14 Mar 2021 05:12:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 14 Mar 2021 05:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=knazarov.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=wk2KWSc9IS7RnAS4lzfAlrBD3P
 AyqKdCwTioUG9cndw=; b=cETXFBHql2xFH+f5tq+0aEsMr4h3/I3oGJihtf9Znf
 Z+6V7cb4oGucNNfKDUlRNeWtrA4kLFmG70gJ+sAorghpiktXVTGqH2N/4qbKPt35
 TNTP9Vb761jYsfqIG6B8qj6p64g5AlQSNfECDKGJMt8kNN2JfyEsPzIBP0E1W3mz
 9t54ktKRWdNSpxXgshFsKQtzF7hBnfP4hdG6Za+YHfbYo+anwjHQEKAhY5laVr6i
 6Ps0LkwuWmXS8uHLLMV3iLVoA+Wtg0e/jTTtTEV0GrZiEn9ahL4zp1XwfZwQvKnN
 hWaz/n70OMVAwvGcqWDBdhpKu3+MoBbb8x19M4fgdU+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wk2KWSc9IS7RnAS4l
 zfAlrBD3PAyqKdCwTioUG9cndw=; b=aNSBDf1kqIQ4zyQCzT+FCceuU40DHdfW/
 55UPBXrQU+c0Jw7X2PlCM+x3rRqX1rdhweJ99c0x+gYzK9BuxMoax4sgeE5fr5Hg
 QIWnt7fS6DiDmBtJFDo8tRIS0Kbc9yrwFYFJKR0MfKtlWUMW+Z4sswQ3IndJdvvC
 D+dkagPdaGM/cIp6sna8Krki4XxYrgGtymrAgyotigG1wCB4j2eXp79oqNqTwFki
 UlzsFfZ5OY9Ie0sFK1tl6+VYSkNVV1Sy3g8IIULq+Q4PoaLZ0TFabPeA+QvRL2pK
 p026BaajS0z0DQs09u7y55yYS8ZfecNn6r1mN/AfGH1vnJw3iq2tg==
X-ME-Sender: <xms:kdNNYPLpLo-5ohlqzaNuxHpG0-FLoRhwbL4J8po5xhas91bc2x0Irg>
 <xme:kdNNYDIkN-ziA0TeGBFD2k7uu7rKDxeVqGhTRMYeCmhbQGOh4qU4BhlV6rXsLdfcJ
 g0upILaQaVSadjEQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvhedgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmohhnshhtrghn
 thhinhcupfgriigrrhhovhcuoehmrghilheskhhnrgiirghrohhvrdgtohhmqeenucggtf
 frrghtthgvrhhnpefgkeetvdfhffelfeevffdttddtleeljeelkeetfeekheduveeuffdv
 ffefjeduheenucfkphepuddtledrvdehvddruddtjedrleenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghilheskhhnrgiirghrohhvrdgt
 ohhm
X-ME-Proxy: <xmx:kdNNYHutd89PbPjh6iuvatPomD-vXVTGCEzl0GetKPDlMPCPh2fkmg>
 <xmx:kdNNYIbLGLh-kfIs2DX30oBnw6Dvh3bQjXNVzzjA_CM5-piCbGAQxA>
 <xmx:kdNNYGbQNLm_qfnJwdweGc3tX5ZzM0jIaWZ2n5v-HaPlxKvLFzL4SQ>
 <xmx:kdNNYJyBT-F1OPpaqfeQ3_rsVeE5oMrRW4mSOztY6kmNbB2v3HIL-A>
Received: from pin.lan (unknown [109.252.107.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4A6031080063;
 Sun, 14 Mar 2021 05:12:48 -0400 (EDT)
From: Konstantin Nazarov <mail@knazarov.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] edid: add support for DisplayID extension (5k resolution)
Date: Sun, 14 Mar 2021 12:12:36 +0300
Message-Id: <20210314091236.44313-1-mail@knazarov.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=mail@knazarov.com;
 helo=out5-smtp.messagingengine.com
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

The Detailed Timing Descriptor has only 12 bits to store the
resolution. This limits the guest to 4095 pixels.

This patch adds support for the DisplayID extension, that has 2 full
bytes for that purpose, thus allowing 5k resolutions and above.

Based-on: <20210303152948.59943-2-akihiko.odaki@gmail.com>
Signed-off-by: Konstantin Nazarov <mail@knazarov.com>
---
 hw/display/edid-generate.c | 156 +++++++++++++++++++++++++++++--------
 hw/display/vga-pci.c       |   2 +-
 qemu-edid.c                |   2 +-
 3 files changed, 124 insertions(+), 36 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index b0ce583d436..db1e319e2dc 100644
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
@@ -129,17 +158,17 @@ static void edid_fill_modes(uint8_t *edid, uint8_t *xtra3, uint8_t *dta,
     }
 }
 
-static void edid_checksum(uint8_t *edid)
+static void edid_checksum(uint8_t *edid, size_t len)
 {
     uint32_t sum = 0;
     int i;
 
-    for (i = 0; i < 127; i++) {
+    for (i = 0; i < len; i++) {
         sum += edid[i];
     }
     sum &= 0xff;
     if (sum) {
-        edid[127] = 0x100 - sum;
+        edid[len] = 0x100 - sum;
     }
 }
 
@@ -180,8 +209,8 @@ static void edid_desc_ranges(uint8_t *desc)
     desc[7] =  30;
     desc[8] = 160;
 
-    /* max dot clock (1200 MHz) */
-    desc[9] = 1200 / 10;
+    /* max dot clock (2550 MHz) */
+    desc[9] = 2550 / 10;
 
     /* no extended timing information */
     desc[10] = 0x01;
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
@@ -296,15 +316,61 @@ uint32_t qemu_edid_dpi_to_mm(uint32_t dpi, uint32_t res)
     return res * 254 / 10 / dpi;
 }
 
+static void dummy_displayid(uint8_t *did)
+{
+    did[0] = 0x70; /* display id extension */
+    did[1] = 0x13; /* version 1.3 */
+    did[2] = 4;    /* length */
+    did[3] = 0x03; /* product type (0x03 == standalone display device) */
+    edid_checksum(did + 1, did[2] + 4);
+}
+
+static void qemu_displayid_generate(uint8_t *did, uint32_t refresh_rate,
+                                    uint32_t xres, uint32_t yres,
+                                    uint32_t xmm, uint32_t ymm)
+{
+    Timings timings;
+    generate_timings(&timings, refresh_rate, xres, yres);
+
+    did[0] = 0x70; /* display id extension */
+    did[1] = 0x13; /* version 1.3 */
+    did[2] = 23;   /* length */
+    did[3] = 0x03; /* product type (0x03 == standalone display device) */
+
+    did[5] = 0x03; /* Detailed Timings Data Block */
+    did[6] = 0x00; /* revision */
+    did[7] = 0x14; /* block length */
+
+    did[8]  = timings.clock  & 0xff;
+    did[9]  = (timings.clock & 0xff00) >> 8;
+    did[10] = (timings.clock & 0xff0000) >> 16;
+
+    did[11] = 0x88; /* leave aspect ratio undefined */
+
+    stw_le_p(did + 12, 0xffff & (xres - 1));
+    stw_le_p(did + 14, 0xffff & (timings.xblank - 1));
+    stw_le_p(did + 16, 0xffff & (timings.xfront - 1));
+    stw_le_p(did + 18, 0xffff & (timings.xsync - 1));
+
+    stw_le_p(did + 20, 0xffff & (yres - 1));
+    stw_le_p(did + 22, 0xffff & (timings.yblank - 1));
+    stw_le_p(did + 24, 0xffff & (timings.yfront - 1));
+    stw_le_p(did + 26, 0xffff & (timings.ysync - 1));
+
+    edid_checksum(did + 1, did[2] + 4);
+}
+
 void qemu_edid_generate(uint8_t *edid, size_t size,
                         qemu_edid_info *info)
 {
     uint32_t desc = 54;
     uint8_t *xtra3 = NULL;
     uint8_t *dta = NULL;
+    uint8_t *did = NULL;
     uint32_t width_mm, height_mm;
     uint32_t refresh_rate = info->refresh_rate ? info->refresh_rate : 75000;
     uint32_t dpi = 100; /* if no width_mm/height_mm */
+    uint32_t large_screen = 0;
 
     /* =============== set defaults  =============== */
 
@@ -320,6 +386,9 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
     if (!info->prefy) {
         info->prefy = 768;
     }
+    if (info->prefx >= 4096 || info->prefy >= 4096) {
+        large_screen = 1;
+    }
     if (info->width_mm && info->height_mm) {
         width_mm = info->width_mm;
         height_mm = info->height_mm;
@@ -401,9 +470,12 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
 
     /* =============== descriptor blocks =============== */
 
-    edid_desc_timing(edid + desc, refresh_rate, info->prefx, info->prefy,
-                     width_mm, height_mm);
-    desc += 18;
+    /* The DTD section has only 12 bits to store the resolution */
+    if (!large_screen) {
+        edid_desc_timing(edid + desc, refresh_rate, info->prefx, info->prefy,
+                         width_mm, height_mm);
+        desc += 18;
+    }
 
     edid_desc_ranges(edid + desc);
     desc += 18;
@@ -429,12 +501,28 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
         desc += 18;
     }
 
+    /* =============== display id extensions =============== */
+
+    if (size >= 384) {
+        did = edid + 256;
+        dummy_displayid(did);
+        edid[126]++;
+
+        if (large_screen) {
+            qemu_displayid_generate(did, refresh_rate, info->prefx, info->prefy,
+                                    width_mm, height_mm);
+        }
+    }
+
     /* =============== finish up =============== */
 
     edid_fill_modes(edid, xtra3, dta, info->maxx, info->maxy);
-    edid_checksum(edid);
+    edid_checksum(edid, 127);
     if (dta) {
-        edid_checksum(dta);
+        edid_checksum(dta, 127);
+    }
+    if (did) {
+        edid_checksum(did, 127);
     }
 }
 
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index 48d29630ab7..62fb5c38c1f 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -49,7 +49,7 @@ struct PCIVGAState {
     qemu_edid_info edid_info;
     MemoryRegion mmio;
     MemoryRegion mrs[4];
-    uint8_t edid[256];
+    uint8_t edid[384];
 };
 
 #define TYPE_PCI_VGA "pci-vga"
diff --git a/qemu-edid.c b/qemu-edid.c
index 1cd6a951723..028f2d181a1 100644
--- a/qemu-edid.c
+++ b/qemu-edid.c
@@ -41,7 +41,7 @@ static void usage(FILE *out)
 int main(int argc, char *argv[])
 {
     FILE *outfile = NULL;
-    uint8_t blob[256];
+    uint8_t blob[384];
     uint32_t dpi = 100;
     int rc;
 
-- 
2.24.3 (Apple Git-128)


