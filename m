Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA805287C6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 16:58:49 +0200 (CEST)
Received: from localhost ([::1]:56074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcBJ-0004Zt-N4
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 10:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqbiu-0003AE-ST
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:29:24 -0400
Received: from mout.gmx.net ([212.227.17.21]:58103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqbir-0004wR-JH
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652711350;
 bh=8Ig1WWgUNbE+7Ptzu8rRqx0U8j1NFRrTGiB3WbrQnt4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cwmuHB4d1QfzLdG7P9P90mdR2/C7SyyEW8qgCnmH82aflbcfA/MVbuy7UcaP0TmAw
 Ypix3hP0Cx/jvMKUlYLHdScnn7bo9CjkWj2dXAOOAK+XxxPxmQcvKQTjnR+s6sSqbt
 uzXTqRdTlJ+Bb06skkDBhsZvLyBQOQ3IW0RtT1ec=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.160.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmDEm-1nQNdd48yO-00iDkW; Mon, 16
 May 2022 16:29:10 +0200
From: Helge Deller <deller@gmx.de>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Helge Deller <deller@gmx.de>,
	Stefano Repici <rs.rdp@zoho.eu>
Subject: [PATCH v2 3/7] artist: Use human-readable variable names instead of
 reg_xxx
Date: Mon, 16 May 2022 16:29:03 +0200
Message-Id: <20220516142907.32827-4-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516142907.32827-1-deller@gmx.de>
References: <20220516142907.32827-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rk5ElaengYE5R4zTEFOGiGzPjLTNrK/bUfO9GPwmVQyqKxq2A+9
 3awsTlukGUqd9ojiM6tYruMq77CQAARlKVe0NDE4/TJboR+uJg+CORCySA3btl7XfPMAo5x
 VLAi7I8SBbSIV3CfSka+LaFehZI4d0a2uklbn1nxXIHGTeFpLWDww2tBMwSjxwTg4Jjskwt
 kkQ09Y1CG9xq/bFnXvfsw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wkhnpGbDMDc=:p2JCFbaX2xeiejJJ17Z0+l
 OyOf8nIq/fSO5TG5a3qoYmuUfhCUSw3wg6XyQJDiUjUB+37q7XdV2U/z/rY12ADIKh7KDNFGN
 +t2YlFtB90T3AhNp8EYkcESdaFEvqZ7PBrFBYix61DqtLJaiW9b4NQ/DT2kq40zP07kX8Xjew
 rXbWGeiXCELkcWPEpCqHs6rTfD89JAFOvdbZrCpIjbOGgvm69XJTiswXUQcyCAToMGlfn0yIn
 aWksxsvF4iRWuifQJWA4LW346Ki7aMRRY+Z/6voYNvH00HEY5+Vrt6wBs2GtPSYo3Nd7tU0/c
 3g5g9U3/7j7VmTDH94kcFtq37WiT6ge8MVqinsk0rPhJa7RM9sRyVTXC9+o868YN68xhimL0z
 NY5p2sXZCxu7j/iqgLJLBTtY+0kmdDja9mog6a3HOHm5sEG39qcJ8UnEtW21ykV5uyiL/ju1W
 aieU7yD9z4kYW8Qj4GboEsN6svRLcybYDf+wZMNoFs6pkhLyfrncaGom983SA498NqYElsXqG
 NrQzCgV76EJ9SzU5SFBqJzNCJ8O6QQsmqB4KkNENeyTWVe5sLX3zA4uAfcI3G55LxFnqoNClg
 7q47+taouQUcpZg3wLaxW8R3KbqJuojzNeOCwd0lS9xsA33fBzILkS8bGMnz99sN8CasU02Pv
 CZ7y6H6wiI0C9mVxRPjUC1J8wJ4ajGhm/C5hnzBnNbhcMjnSJ+Dd0V8UNIscE0R1FxlHgus3Q
 pRUQ4F+bGpM03W7KZ/RyqUMCA+ku62JdD82Kj4D9lKxTHzuBCrnXhLpzs+JcCpVPadoJC70Ip
 AaKB4LOD3l9cag2c8KzUDt2H2sodRdcQ5e1nNeM8//8XCd2d1kIS1091xTcScQa2R1KIhbj+K
 97fF4kVRzPjsKua/q6P0E/fZWHghUPVq/QJ7l4EERizZoVS7iLCC4in1u24+z7Ar9eiPqtMgo
 Yaibmk8yjan/UmIbJ5auX1nq8kau8fP4l8m7EZsOghcCLPlHvqNZkglEd1ubi9H/3P4KI08KJ
 ckQrQ/LJ/uMEQdCCSWl1K3LdY7HznLF++ZxmjxdcBvh4BqMXYnOxdGj6bxaLTilv4gSfCwbho
 0WEnRy2eA9NGmJDceiVCyUK6SaQWmdFTiz4B4t9zoA9CQ0FcOzLZ9OtPQ==
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
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


