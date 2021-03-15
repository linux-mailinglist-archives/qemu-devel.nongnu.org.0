Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE3B33B1BD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:50:35 +0100 (CET)
Received: from localhost ([::1]:55770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlk2-0000mm-5o
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@knazarov.com>) id 1lLli9-0008KX-MP
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:48:37 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:34999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@knazarov.com>) id 1lLli7-0007U0-MT
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:48:37 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 430CD5C005D;
 Mon, 15 Mar 2021 07:48:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 15 Mar 2021 07:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=knazarov.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ksn6EAqr60y3D
 akcbU8cWWSHWU9hAiuqOtHJRqlrB14=; b=Se7PmpnGOchr/0qcOvM/H84XPIsbx
 OPJYFuIvraXOlt2aZ7KHn1JyRHLi0jcm0OJc9vH7eyiIppYX9KNrDB6h9WYtQNMn
 9eSdBnrIFF4SvaNh90xv+1o0WNcXoZws2Z0ecN0HSfpC3jPCZhpm/2YIGoEgMGBH
 PFCfZDw31D7qWlqnPk0bWpCkVw2sxTQyyI7XwM2LCqNd627iTOGF3BM3MFkEKzYh
 TliCXpjbBO+p6GXLtbj/Y2LEhJxC58krqVlWxKoqZYw+NP93hQ+6eUyaA7JAITLG
 N7FXbhe0UghML/0hiKlDt3Y/z/dgwd8Q3PTcgXt7xC/Fvrl2OkaGu+eqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ksn6EAqr60y3DakcbU8cWWSHWU9hAiuqOtHJRqlrB14=; b=KQOqea3R
 sy4ws797il6VBBfYRnhzfWrR2eGg/MH98cllY7L8hXFC3ubEOcnIpU+cKtrZ9i0C
 SIJXqsIdVgmDOaQIXrRDnpg+qrCK69h8jJ6x+nVRe0prxkXlhr2vXgxQiPktRtkr
 zz1chYr2qre1lXYS6Yw065dXhTz0+uVHMqFxjymmIXdPbCX+Nie9oGAO7IsPlr4a
 KOhtYAqGfvf5/3gDwxWXVw+GHEyvg5VdcSdWrEsttoRkDBPdGVu6tJUiMZj60s4b
 pqg6LO6kUEEWa5cdfNGWp0dVodBVRa7GcuByifvi28iiz7pQ2w7d+q4zAaSGR3dQ
 jYZaTqSG+OEvsw==
X-ME-Sender: <xms:k0lPYHxCbnQV86862n2pCIXsaaD8iod5sC8Hr4K0ljeRXq7h1TJ9Lg>
 <xme:k0lPYPTS87zWR-0E-F7coKix6KbUbWlqahbuzItuEml8Hyo_9lmgPH8KrTAjCq0rF
 akbPr1iRMaWEMWJCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvledgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmohhnshht
 rghnthhinhcupfgriigrrhhovhcuoehmrghilheskhhnrgiirghrohhvrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeffhfefgedukeetffeftdfgvdfhkedvhfelfedufefhleeugfek
 gfejledttdejgfenucfkphepuddtledrvdehvddruddtjedrleenucevlhhushhtvghruf
 hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghilheskhhnrgiirghrohhv
 rdgtohhm
X-ME-Proxy: <xmx:k0lPYBViqIuoOcZHlfROw3QaSPpl4cec9-V6-u5Ng-earc7fxzgWeA>
 <xmx:k0lPYBgNEKWdj_PS0Ipu2sivqOqNhZvbQpPWwb-2BhV_HGtkheCpbg>
 <xmx:k0lPYJDn_NEe0Ma4wZG72qHDNrCI399bamwAv23D9YssxVYugzSs0Q>
 <xmx:k0lPYG6jAifAOomC3pV2T8fR0FmhQqwTCQBC0OKr53LSz9aCfT0trQ>
Received: from pin.lan (unknown [109.252.107.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 58560240066;
 Mon, 15 Mar 2021 07:48:34 -0400 (EDT)
From: Konstantin Nazarov <mail@knazarov.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] edid: add support for DisplayID extension (5k
 resolution)
Date: Mon, 15 Mar 2021 14:46:39 +0300
Message-Id: <20210315114639.91953-3-mail@knazarov.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210315114639.91953-1-mail@knazarov.com>
References: <20210315114639.91953-1-mail@knazarov.com>
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

The Detailed Timing Descriptor has only 12 bits to store the
resolution. This limits the guest to 4095 pixels.

This patch adds support for the DisplayID extension, that has 2 full
bytes for that purpose, thus allowing 5k resolutions and above.

Based-on: <20210303152948.59943-2-akihiko.odaki@gmail.com>
Signed-off-by: Konstantin Nazarov <mail@knazarov.com>
---
 hw/display/edid-generate.c | 78 +++++++++++++++++++++++++++++++++++---
 hw/display/vga-pci.c       |  2 +-
 qemu-edid.c                |  2 +-
 3 files changed, 75 insertions(+), 7 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index 530bdbdf06e..e2c478e5042 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -209,8 +209,8 @@ static void edid_desc_ranges(uint8_t *desc)
     desc[7] =  30;
     desc[8] = 160;
 
-    /* max dot clock (1200 MHz) */
-    desc[9] = 1200 / 10;
+    /* max dot clock (2550 MHz) */
+    desc[9] = 2550 / 10;
 
     /* no extended timing information */
     desc[10] = 0x01;
@@ -316,15 +316,61 @@ uint32_t qemu_edid_dpi_to_mm(uint32_t dpi, uint32_t res)
     return res * 254 / 10 / dpi;
 }
 
+static void init_displayid(uint8_t *did)
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
 
@@ -340,6 +386,9 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
     if (!info->prefy) {
         info->prefy = 768;
     }
+    if (info->prefx >= 4096 || info->prefy >= 4096) {
+        large_screen = 1;
+    }
     if (info->width_mm && info->height_mm) {
         width_mm = info->width_mm;
         height_mm = info->height_mm;
@@ -357,6 +406,12 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
         edid_ext_dta(dta);
     }
 
+    if (size >= 384) {
+        did = edid + 256;
+        init_displayid(did);
+        edid[126]++;
+    }
+
     /* =============== header information =============== */
 
     /* fixed */
@@ -421,9 +476,12 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
 
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
@@ -449,6 +507,13 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
         desc += 18;
     }
 
+    /* =============== display id extensions =============== */
+
+    if (size >= 384 && large_screen) {
+        qemu_displayid_generate(did, refresh_rate, info->prefx, info->prefy,
+                                width_mm, height_mm);
+    }
+
     /* =============== finish up =============== */
 
     edid_fill_modes(edid, xtra3, dta, info->maxx, info->maxy);
@@ -456,6 +521,9 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
     if (dta) {
         edid_checksum(dta, 127);
     }
+    if (did) {
+        edid_checksum(did, 127);
+    }
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


