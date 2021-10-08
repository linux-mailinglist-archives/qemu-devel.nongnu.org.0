Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E85B426A2F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 13:54:17 +0200 (CEST)
Received: from localhost ([::1]:35186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYoS8-0000kN-BR
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 07:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJp-0006Si-Pe
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:41 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:49631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJi-00072o-7M
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:41 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MNtGq-1mNt8N39Q0-00OH50; Fri, 08
 Oct 2021 13:45:24 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/13] macfb: add qdev property to specify display type
Date: Fri,  8 Oct 2021 13:45:13 +0200
Message-Id: <20211008114518.757615-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008114518.757615-1-laurent@vivier.eu>
References: <20211008114518.757615-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lo76DOm9QLp+EsrAabaM2vPa23U0emVhihPVU8hr3vPiRRfytZy
 pXTD2AqroGfHeMNJLGqm8M+gkCWeQHgIkAimYp+IdvPwmesTBfNZr4fc48HYBEbRd/tbRqb
 Ba0yom42p9ofRnp2UoqCSLj7Xn21k28GvIdPqLPwt9EO+ipn+U1i5dSWIyrwYlZDO9K+9wc
 IzhWwpgSqqkka3MJ0fyoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZqeySFZM2DA=:SeqNzLBzgUlFfy5+/21EAY
 PS6L9XfhrzzMeGmRqnQ3TMB/iV6ivdkcM8Mb6pb8BbcF5jUbDXHPBZ3NxxDOp0WE6d21jgHrE
 /8tKoAp47xAvk4TsvETT72cwwyccjB0Ds+Rxy/UdNy9cIGurVTVcslWnkq5T2dfP/zWtilbEs
 +u9kjNVCkAoMkq2yZYTJvoZiKAKAKWrXiJE4EFQAlyN3ngpHEnZPDSPl0HQI6bZtT9J373xdF
 KiLhBj1phA3IvL0VoBfCyevBt5ZRGP5tht/PkuSgzKhLJzLJGPDVV0gYLyYWGpfXwZrPD9tQN
 EEMyN8aM22j94JSrwjABrw4LbmUljbgxf4ImKjHIV5wXvD3tWgBTcFpsAHV76pmtPM5+tZ0EF
 arybXiVXIfKyon8J+mf1xwh/X6YvCGUW+tX4PWj8IjwN63gVIZpY9+ugcBPNDlpgw4AlYLdI8
 j06QwO9ARtFPljTG/fnroZJb5Dg7z1TYyPM1/BaMouqZNl+mzuQJeRgLNQxiUEyjXL0UdYWfD
 +TOb26GN6zg0OMuT5LOPvPc004afRU7LU0k+CSd9A1D1faSVY2i2ifU0lv6pnRB0sVSJtNTrT
 ZGBD4fJ8TfHhLCEL6YCogFztiZ3XHVbnp/dxM+ypkHKJrE6aUQ3ypRGxXv9bme7nxn37nkvn7
 eps2292JWw+Xu7f7unUQ6ft99Mm9CjW6jjNa7lQm9fGv1ZtnETETgFzgWKzK37EW+ms8QzGhb
 hO+EkZ7VH/NpFepW4rsgBtIjD/3RdLra1SDqXg==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Since the available resolutions and colour depths are determined by the attached
display type, add a qdev property to allow the display type to be specified.

The main resolutions of interest are high resolution 1152x870 with 8-bit colour
and SVGA resolution up to 800x600 with 24-bit colour so update the q800 machine
to allow high resolution mode if specified and otherwise fall back to SVGA.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211007221253.29024-9-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/display/macfb.h | 1 +
 hw/display/macfb.c         | 7 ++++++-
 hw/m68k/q800.c             | 5 +++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
index febf4ce0e843..e95a97ebdcda 100644
--- a/include/hw/display/macfb.h
+++ b/include/hw/display/macfb.h
@@ -46,6 +46,7 @@ typedef struct MacfbState {
     uint8_t color_palette[256 * 3];
     uint32_t width, height; /* in pixels */
     uint8_t depth;
+    uint8_t type;
 
     uint32_t sense;
 } MacfbState;
diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 6e485d7aef90..f98bcdec2dc6 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -316,7 +316,8 @@ static uint32_t macfb_sense_read(MacfbState *s)
     MacFbSense *macfb_sense;
     uint8_t sense;
 
-    macfb_sense = &macfb_sense_table[MACFB_DISPLAY_VGA];
+    assert(s->type < ARRAY_SIZE(macfb_sense_table));
+    macfb_sense = &macfb_sense_table[s->type];
     if (macfb_sense->sense == 0x7) {
         /* Extended sense */
         sense = 0;
@@ -544,6 +545,8 @@ static Property macfb_sysbus_properties[] = {
     DEFINE_PROP_UINT32("width", MacfbSysBusState, macfb.width, 640),
     DEFINE_PROP_UINT32("height", MacfbSysBusState, macfb.height, 480),
     DEFINE_PROP_UINT8("depth", MacfbSysBusState, macfb.depth, 8),
+    DEFINE_PROP_UINT8("display", MacfbSysBusState, macfb.type,
+                      MACFB_DISPLAY_VGA),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -551,6 +554,8 @@ static Property macfb_nubus_properties[] = {
     DEFINE_PROP_UINT32("width", MacfbNubusState, macfb.width, 640),
     DEFINE_PROP_UINT32("height", MacfbNubusState, macfb.height, 480),
     DEFINE_PROP_UINT8("depth", MacfbNubusState, macfb.depth, 8),
+    DEFINE_PROP_UINT8("display", MacfbNubusState, macfb.type,
+                      MACFB_DISPLAY_VGA),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 09b336602482..5223b880bc2d 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -421,6 +421,11 @@ static void q800_init(MachineState *machine)
     qdev_prop_set_uint32(dev, "width", graphic_width);
     qdev_prop_set_uint32(dev, "height", graphic_height);
     qdev_prop_set_uint8(dev, "depth", graphic_depth);
+    if (graphic_width == 1152 && graphic_height == 870 && graphic_depth == 8) {
+        qdev_prop_set_uint8(dev, "display", MACFB_DISPLAY_APPLE_21_COLOR);
+    } else {
+        qdev_prop_set_uint8(dev, "display", MACFB_DISPLAY_VGA);
+    }
     qdev_realize_and_unref(dev, BUS(nubus), &error_fatal);
 
     cs = CPU(cpu);
-- 
2.31.1


