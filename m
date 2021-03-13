Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D25339E13
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 13:46:15 +0100 (CET)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL3en-0004Sj-Br
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 07:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@knazarov.com>) id 1lL1lz-00039u-T6
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 05:45:32 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:52603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@knazarov.com>) id 1lL1lw-0007tY-Gr
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 05:45:31 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7B9385C0094;
 Sat, 13 Mar 2021 05:45:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 13 Mar 2021 05:45:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=knazarov.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=MrcByp2mhwjKCvU8y7GwYu+3px
 DV7xhqR+EKxHjaOxA=; b=bNc3wsRc94UEVL2Ih8gXTZQoAwTRiSB6zc5zhwCSQQ
 Zva7YSp4MfK0WHOeQrO+wdh8Tq3AI6WyNpGcODFUM10eb/ETtm7YwqudbgY6Ar/x
 4swzlj8h3X7y9Jk+o7qEp/1ZT39lWAGKz6UB24ZBkhVe87AZqNK+8NGZiP3uYRak
 ezmgxIeyR5OqzKFp5CuzCy+qSmOX6DIoTyW97ZFCUv0jxWDHcA98X2Tttm41Bk0u
 FzMA73gApimN8Ikfa0cX0/ABGl7zL1X2/F7NCj1SM/XWCMJZOyUeSd1DnRgcTVma
 uIpO4+KLzybA1Hv8Zz0F6Sg6O9bmrXmYuROjDyWFozEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MrcByp2mhwjKCvU8y
 7GwYu+3pxDV7xhqR+EKxHjaOxA=; b=qwpDESWdopMzENB2pxkKbJKYywYqsPa7i
 HB/8crhM04yWUfn04tUgTpv8xynkZwU+P6j+9X779MWShGTna+X4LHnX1Al2gWlP
 /TtbVgxsQ/HoblaD6PAof02c1bvWuWjDifZNDTyW+o8q/FHkWDFRTv8XJVrXZr+n
 fER625Q89jxWZBlpM86ybGGznm4G2ylMghwE8WCkYML1h+aF7BL1ZABI9q3F6vCn
 olkvW2pWX24KuyaaZalC7KlTsxKNIP1RZXCJeLVRA7l4Zhquq70IgzzDAXnbByKp
 gti0DQm/aeFirIC5Etv2ukT9y8oxRKasBp3neIG65u0jYxp91rzSA==
X-ME-Sender: <xms:xZdMYKl4xgo2irQNaLWrHJU3yPFUaGHkjE3BI1azJoS_OSf0wP3V0Q>
 <xme:xZdMYB1Sq_h-jPiJQM6YPjiop_qjKyJmSMf_V9sAB85kf63pkdf10_q_GR8t738Wc
 DoYGWkN8JsCK32YwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvgedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmohhnshhtrghn
 thhinhcupfgriigrrhhovhcuoehmrghilheskhhnrgiirghrohhvrdgtohhmqeenucggtf
 frrghtthgvrhhnpefgkeetvdfhffelfeevffdttddtleeljeelkeetfeekheduveeuffdv
 ffefjeduheenucfkphepuddtledrvdehvddruddtjedrleenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghilheskhhnrgiirghrohhvrdgt
 ohhm
X-ME-Proxy: <xmx:xZdMYIpc1JydoVZ-unFc4EAB1kyu4TWxDzLhQfcK44EBcJxEqG4SUA>
 <xmx:xZdMYOnOqtHj0CO9rA3AAm_ZZ0QC5uz4cCl8P0y9PyMsYe-4ErthqQ>
 <xmx:xZdMYI0zr8Rio8OA3ud-vGPAxZxzZH9C2F0-ZP1alHs3ezvWfKKPZg>
 <xmx:xpdMYF9ui9fN2zCZY5jDbOsrw6t5tiN6th31bP2NWSHdSTSOv6Lo7A>
Received: from pin.lan (unknown [109.252.107.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2C1C9108005C;
 Sat, 13 Mar 2021 05:45:25 -0500 (EST)
From: Konstantin Nazarov <mail@knazarov.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] edid: add support for DisplayID extension (5k resolution)
Date: Sat, 13 Mar 2021 13:44:32 +0300
Message-Id: <20210313104432.3591-1-mail@knazarov.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=mail@knazarov.com;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 13 Mar 2021 07:44:33 -0500
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
 hw/display/edid-generate.c | 158 +++++++++++++++++++++++++++++--------
 hw/display/vga-pci.c       |   2 +-
 qemu-edid.c                |   2 +-
 3 files changed, 126 insertions(+), 36 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index b0ce583d436..c34c879fba3 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -44,6 +44,35 @@ static const struct edid_mode {
     { .xres =  640,   .yres =  480,   .byte  = 35,   .bit = 5 },
 };
 
+struct timings {
+    uint32_t xfront;
+    uint32_t xsync;
+    uint32_t xblank;
+
+    uint32_t yfront;
+    uint32_t ysync;
+    uint32_t yblank;
+
+    uint64_t clock;
+};
+
+static void generate_timings(struct timings *timings, uint32_t refresh_rate,
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
+    struct timings timings;
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
@@ -296,15 +316,62 @@ uint32_t qemu_edid_dpi_to_mm(uint32_t dpi, uint32_t res)
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
+    struct timings timings;
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
+
 
     /* =============== set defaults  =============== */
 
@@ -320,6 +387,9 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
     if (!info->prefy) {
         info->prefy = 768;
     }
+    if (info->prefx >= 4096 || info->prefy >= 4096) {
+        large_screen = 1;
+    }
     if (info->width_mm && info->height_mm) {
         width_mm = info->width_mm;
         height_mm = info->height_mm;
@@ -401,9 +471,12 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
 
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
@@ -429,13 +502,30 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
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
     }
+    if (did) {
+        edid_checksum(did, 127);
+    }
+
 }
 
 size_t qemu_edid_size(uint8_t *edid)
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


