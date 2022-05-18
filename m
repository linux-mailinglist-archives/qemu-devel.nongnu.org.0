Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9BE52BFBE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 18:21:54 +0200 (CEST)
Received: from localhost ([::1]:60494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrMQr-0007Ah-Hu
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 12:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nrMNK-0003kr-VA
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:18:18 -0400
Received: from mout.gmx.net ([212.227.17.22]:44009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nrMNH-0004Mz-Ox
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:18:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652890680;
 bh=8Ig1WWgUNbE+7Ptzu8rRqx0U8j1NFRrTGiB3WbrQnt4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=KTpKWheD9BpgM/+EjVz57wTEOk2XIUmVEzVHAAIqFEvyNBe0/NS3oTldHGivyt+Y6
 st46Hos6VhwTeUECc+VJdV9gSJSm0JttUjRMmd1IW+rk1UY2DW1foT3ZXxKGpWpx5p
 ICkNVHCQArMTrRJ9LFC1eT2F673mdPv4qPEG+spA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.138.233]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfYPY-1nOsEq2Ybg-00g05X; Wed, 18
 May 2022 18:18:00 +0200
From: Helge Deller <deller@gmx.de>
To: Sven Schnelle <svens@stackframe.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Helge Deller <deller@gmx.de>
Subject: [PULL 3/7] artist: Use human-readable variable names instead of
 reg_xxx
Date: Wed, 18 May 2022 18:17:54 +0200
Message-Id: <20220518161758.49036-4-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220518161758.49036-1-deller@gmx.de>
References: <20220518161758.49036-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ONWMVQNZbksTKeNJZUAgFjHuz9gRYRdeglyEyC3Abz7lBGXK0SB
 FfWBZy2imKp7Wlr2wgmMsOKQ98QhBjer9P2InLQxEpzjHNgtpSOhsWenny94NHiUGAwo36q
 RRVneHJYdJNZYpo/eqHANDDUBZIXWbGpeZLyBSWp+g9bLAZTM6bvWs0Dy+ZoD0YH7KPuzs9
 NSX561aUfkc/3GQpNe+2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2HxpffP8Lkw=:03eUCg+c7fTSTpQcOCEnu/
 lr9bhfcWXjKUpgtei1YglgmhU3l1jYqlaSyheZw6H4/3LBlwIeE0JPwEgmWrtMVkYxJT/Y45x
 r3XvuU23wzlf+AL95MrnR1tGji0IyjGIJGkw2s32+cWggSLiDDmMjj/BOpgNDN7lFWk3pQzwp
 cbAbGbhFmlKwcKUafYl/xKVv86JPXZ3dgjhfKuaSW5fKWmPxBUuaGeCWwlPuAuc33So7vKvwR
 CoQw1ocgMfXf0Hv4EQ6uVGYCghwNjuCIiPOquu8oe47wXpWy0ut8VZgyG/XwADaAtryrntMlk
 q4bCSZ//brJOJuOhxaxxqT44XBoB0GEfUO5xz7lRLMecOD2PZfI6X8ylE+EKbCZnltmtMiOOY
 ZrACXSQUaSO6HmXeZPp1jvGEABBi5INT72055ZiZ8CiiM7i437tY1US5/oQ7ekzdjqXWW8w3m
 3L5t20xk+7qOajaNHNJhjNndxS8lSo6zBv8uYY/RyhCKAQdDHEZi6V9mt6SGGbBbwY7Wxcpbz
 znGBFZEY81+AkuCLUycDvTungfU8QpZ5EI5nnfLX9rZWwMBmQcDGHdn8q37SbVvKKCk/Z6dxR
 Zu5oh11YvJi2x0Ds3GMvLJ2iAGO4aoHxRBk0LCE/14yFspvFF4o4koJyDX94K/HmuYFjkMVVA
 yjv5U7Y2In2pIRQlotUSvWYWmpDokk/SK2rqcLtLFLofIlFInrAZSKcFEeTYFljRURr8JgNl6
 /hSMc+r/oetRX1E2thH2YjBMExtsO7I4Nz2Oes61gyH9bbO/yOmA9mcCI1DomPNnuvt92td9f
 j+Ev5W6H+hIsTJhW0zPz7ezNvT+eoNGdBYY8Pwnm567yBgPMhV/pn28pMcSmeo71ZiBxK86tk
 ENKOc9dMpfp4p8lZhdvwXTN1phrruOAAJ/lsKZFHcidY9upn2NkyXRlEs49Uu8rJaIAKGxeuM
 0rZG6ywma321LAb7DqvLT2Js73jeC53bME1msYHufJge6ZFf+6nZNRNDAICzBRQkCbpBaqio6
 De85eVccV+baK5vgeIHPn0lRSDjszv7R6ZA6Zm9IrXpA/hXqMXaIs06gdasxXwYGdA85JRggb
 5NXxilVs3ZBaoCLBQzuqmnH9q/CqIzTdyLQlSJMCfZG9yq64rkllnCopQ==
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the variable names of some registers to human-readable and
understandable names.

Signed-off-by: Helge Deller <deller@gmx.de>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
=2D--
 hw/display/artist.c | 72 ++++++++++++++++++++++++++++++---------------
 1 file changed, 49 insertions(+), 23 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 6333ee41db..c8b261a52e 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -81,9 +81,10 @@ struct ARTISTState {
     uint32_t plane_mask;

     uint32_t reg_100080;
-    uint32_t reg_300200;
-    uint32_t reg_300208;
-    uint32_t reg_300218;
+    uint32_t horiz_backporch;
+    uint32_t active_lines_low;
+    uint32_t misc_video;
+    uint32_t misc_ctrl;

     uint32_t dst_bm_access;
     uint32_t src_bm_access;
@@ -138,8 +139,14 @@ typedef enum {
     BG_COLOR =3D 0x118014,
     PLANE_MASK =3D 0x118018,
     IMAGE_BITMAP_OP =3D 0x11801c,
-    CURSOR_POS =3D 0x300100,
-    CURSOR_CTRL =3D 0x300104,
+    CURSOR_POS =3D 0x300100,      /* reg17 */
+    CURSOR_CTRL =3D 0x300104,     /* reg18 */
+    MISC_VIDEO =3D 0x300218,      /* reg21 */
+    MISC_CTRL =3D 0x300308,       /* reg27 */
+    HORIZ_BACKPORCH =3D 0x300200, /* reg19 */
+    ACTIVE_LINES_LOW =3D 0x300208,/* reg20 */
+    FIFO1 =3D 0x300008,           /* reg34 */
+    FIFO2 =3D 0x380008,
 } artist_reg_t;

 typedef enum {
@@ -177,12 +184,18 @@ static const char *artist_reg_name(uint64_t addr)
     REG_NAME(SRC_BM_ACCESS);
     REG_NAME(CURSOR_POS);
     REG_NAME(CURSOR_CTRL);
+    REG_NAME(HORIZ_BACKPORCH);
+    REG_NAME(ACTIVE_LINES_LOW);
+    REG_NAME(MISC_VIDEO);
+    REG_NAME(MISC_CTRL);
     REG_NAME(LINE_XY);
     REG_NAME(PATTERN_LINE_START);
     REG_NAME(LINE_SIZE);
     REG_NAME(LINE_END);
     REG_NAME(FONT_WRITE_INCR_Y);
     REG_NAME(FONT_WRITE_START);
+    REG_NAME(FIFO1);
+    REG_NAME(FIFO2);
     }
     return "";
 }
@@ -1028,16 +1041,20 @@ static void artist_reg_write(void *opaque, hwaddr =
addr, uint64_t val,
         combine_write_reg(addr, val, size, &s->transfer_data);
         break;

-    case 0x300200:
-        combine_write_reg(addr, val, size, &s->reg_300200);
+    case HORIZ_BACKPORCH:
+        combine_write_reg(addr, val, size, &s->horiz_backporch);
         break;

-    case 0x300208:
-        combine_write_reg(addr, val, size, &s->reg_300208);
+    case ACTIVE_LINES_LOW:
+        combine_write_reg(addr, val, size, &s->active_lines_low);
         break;

-    case 0x300218:
-        combine_write_reg(addr, val, size, &s->reg_300218);
+    case MISC_VIDEO:
+        combine_write_reg(addr, val, size, &s->misc_video);
+        break;
+
+    case MISC_CTRL:
+        combine_write_reg(addr, val, size, &s->misc_ctrl);
         break;

     case CURSOR_POS:
@@ -1122,12 +1139,11 @@ static uint64_t artist_reg_read(void *opaque, hwad=
dr addr, unsigned size)
     case 0x100000:
     case 0x300000:
     case 0x300004:
-    case 0x300308:
     case 0x380000:
         break;

-    case 0x300008:
-    case 0x380008:
+    case FIFO1:
+    case FIFO2:
         /*
          * FIFO ready flag. we're not emulating the FIFOs
          * so we're always ready
@@ -1135,16 +1151,25 @@ static uint64_t artist_reg_read(void *opaque, hwad=
dr addr, unsigned size)
         val =3D 0x10;
         break;

-    case 0x300200:
-        val =3D s->reg_300200;
+    case HORIZ_BACKPORCH:
+        val =3D s->horiz_backporch;
+        break;
+
+    case ACTIVE_LINES_LOW:
+        val =3D s->active_lines_low;
+        /* activeLinesLo for cursor is in reg20.b.b0 */
+        val |=3D ((s->height - 1) & 0xff);
         break;

-    case 0x300208:
-        val =3D s->reg_300208;
+    case MISC_VIDEO:
+        /* emulate V-blank */
+        val =3D s->misc_video ^ 0x00040000;
+        /* activeLinesHi for cursor is in reg21.b.b2 */
+        val |=3D ((s->height - 1) & 0xff00);
         break;

-    case 0x300218:
-        val =3D s->reg_300218;
+    case MISC_CTRL:
+        val =3D s->misc_ctrl;
         break;

     case 0x30023c:
@@ -1379,9 +1404,10 @@ static const VMStateDescription vmstate_artist =3D =
{
         VMSTATE_UINT32(cursor_width, ARTISTState),
         VMSTATE_UINT32(plane_mask, ARTISTState),
         VMSTATE_UINT32(reg_100080, ARTISTState),
-        VMSTATE_UINT32(reg_300200, ARTISTState),
-        VMSTATE_UINT32(reg_300208, ARTISTState),
-        VMSTATE_UINT32(reg_300218, ARTISTState),
+        VMSTATE_UINT32(horiz_backporch, ARTISTState),
+        VMSTATE_UINT32(active_lines_low, ARTISTState),
+        VMSTATE_UINT32(misc_video, ARTISTState),
+        VMSTATE_UINT32(misc_ctrl, ARTISTState),
         VMSTATE_UINT32(dst_bm_access, ARTISTState),
         VMSTATE_UINT32(src_bm_access, ARTISTState),
         VMSTATE_UINT32(control_plane, ARTISTState),
=2D-
2.35.3


