Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D1748CD8A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 22:17:07 +0100 (CET)
Received: from localhost ([::1]:39330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7kzS-0003mG-5A
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 16:17:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1n7kqU-0003fj-HS; Wed, 12 Jan 2022 16:07:54 -0500
Received: from mout.gmx.net ([212.227.17.22]:45619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1n7kqI-0000en-45; Wed, 12 Jan 2022 16:07:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642021652;
 bh=xGBb7L4vMQdEr2R1rRoHshMoMr2JSJ0JRn+F2ikeLPQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GuO/koyDzaTwCWLA4xlaAQpBPipduqEY41r3cnff+RARmpiXS174r+ShcCmhIlXPw
 OYM2KmURB5qQ2BM3TcRZsPOYsVRXhfbxTuQFBAEla/w7F1rZQYbJkMx7NlyTGX46iq
 0/ad81HRMl0mz0exMMpk4IHPG+0zoE4jjoRy9Cxo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.184.198]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmlXK-1mfsgM1ao2-00jtMV; Wed, 12
 Jan 2022 22:07:32 +0100
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 4/5] hw/display/artist: Mouse cursor fixes for HP-UX
Date: Wed, 12 Jan 2022 22:07:29 +0100
Message-Id: <20220112210730.292775-5-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112210730.292775-1-deller@gmx.de>
References: <20220112210730.292775-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wi7BnjY/Nz7qy5yk5msnNp5DyCtaz7K1ff8iLxFoWSI9lYdF5to
 znbII6cSOPMmFFhlg+THXQiPSk9HBGElwQNlaKNDyWAOm3juZXgWdGNH19qNx0F/nZzx8xY
 cr+R0iE869mOSjp7ABTggKu3lvxJseWug+rvL7JBq8UbCDqFaNsrBEnT2KT/SBphavJxlEi
 arydqQjYjZdOE3uWUJJCA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8sFT7PcmpbU=:9KxxCzFBTrPEjlEpirR65P
 DaRI9cRSuAerOOxxa/LnqDvCKgrekG8ts2kJwtRUFTZE5MaivwR3UecmDExaoktW2biKkI5kD
 JuOno2EL4E4lX8KAZ/BspbrMz48aGXmYY6ujGn48ZE2BHZbrERURjodvLhL1JZ1Uo4uaJXS5y
 fpO5b4n1U3I2EPpFkF6XOetGew/KhsLvl2unmD0hgFvPL8RmnzJHLR8A9BTwRTYNJA1ZNs5yh
 +BQL92YHh2l0f1NbR33J8Qu6szuTrmhpwXvjB3qHlC+RTX9O8lRb/FiGqVN58G0sBqNo4ovKe
 wQ1IsmKz4jaVin8sFb3xrXhAckRF6pVWS0JXgysU1gHyf5CaKzCHK60gGnlAXQQsyObtfE172
 aL0hWaHJBxG8ZkkdRO45YVEt2VwCWA9KlRSlNmfTAxcVfiuClG8Nq4M3olotBTGhfKJV7wo4m
 F6y007WxUXrwtKejYlJtJkSf6lXD9z2x1CDR4B2RC+KjKbMpaWFDCDONtM4hXWp+NyEelTu0d
 vHi2hbXilp9SY/OIB0KWbCg1FyXzwmXLOcyCe18MmX8kHtscSRM5DpStwMtVBhHJTs+RXU2cg
 XPbvcaJDUUZtgfZ4eEDmxaCuIr9u2Sv4ExVix6OwLrhCrHp+cvwIbIgyrL8FKNHYnjkaYYLcH
 qwP2/PkmAGvcHGOZ1EFHX8wilP5po03TbNY3dxVGTASuGihrhWNmc9kksdnjj/eimSrnUdC4j
 aT5pHz4pWzMSf7qOdYgWe92+hEV3CrbbLBE/bmXw+7vHsF0y4bpOSE3oytQ+SCnYuV2hgEa56
 zQoE2534utjwHP9Aj3N9q51XTcjEv9baZ0mKYwUGuy7P2Xe23ATVA1a2iTrjKlOpHBamT1zc8
 pUvo5/D1dQY5E9/a4WaBDxvGa8zYW390g+7s4kTdjc7e50rbuxhsxod/2LX9bAFfRuGmY4wZs
 GoYjrEOLhhwu6lTJXYJk3s2rIhJsyCh+2nLN6EuvJe2IZHBZb1yyH2Qj1886nYEl5Jo8R+V/M
 8hKbV/t7d51bQmsjgkMNAwCyd1s7jLTNOadKnhV+jZ2fZsLPbRsuqRuu70gRUVyArhO2jAfFb
 pFc070MDu5DRjI=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fix the behaviour and positioning of the X11 mouse cursor in HP=
-UX.

The current code missed to subtract the offset of the CURSOR_CTRL register=
 from
the current mouse cursor position. The HP-UX graphics driver stores in thi=
s
register the offset of the mouse graphics compared to the current cursor
position.  Without this adjustment the mouse behaves strange at the screen
borders.

Additionally, depending on the HP-UX version, the mouse cursor position
in the cursor_pos register reports different values. To accommodate this
track the current min and max reported values and auto-adjust at runtime.

With this fix the mouse now behaves as expected on HP-UX 10 and 11.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: qemu-stable@nongnu.org
=2D--
 hw/display/artist.c | 42 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 21b7fd1b44..6384076c60 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -80,6 +80,7 @@ struct ARTISTState {
     uint32_t line_pattern_skip;

     uint32_t cursor_pos;
+    uint32_t cursor_cntrl;

     uint32_t cursor_height;
     uint32_t cursor_width;
@@ -328,19 +329,42 @@ static void artist_get_cursor_pos(ARTISTState *s, in=
t *x, int *y)
 {
     /*
      * Don't know whether these magic offset values are configurable via
-     * some register. They are the same for all resolutions, so don't
-     * bother about it.
+     * some register. They seem to be the same for all resolutions.
+     * The cursor values provided in the registers are:
+     * X-value: -295 (for HP-UX 11) and 338 (for HP-UX 10.20) up to 2265
+     * Y-value: 1146 down to 0
+     * The emulated Artist graphic is like a CRX graphic, and as such
+     * it's usually fixed at 1280x1024 pixels.
+     * Because of the maximum Y-value of 1146 you can not choose a higher
+     * vertical resolution on HP-UX (unless you disable the mouse).
      */

-    *y =3D 0x47a - artist_get_y(s->cursor_pos);
-    *x =3D ((artist_get_x(s->cursor_pos) - 338) / 2);
+    static int offset =3D 338;
+    int lx;
+
+    /* ignore if uninitialized */
+    if (s->cursor_pos =3D=3D 0) {
+        *x =3D *y =3D 0;
+        return;
+    }
+
+    lx =3D artist_get_x(s->cursor_pos);
+    if (lx < offset)
+        offset =3D lx;
+    *x =3D (lx - offset) / 2;
+
+    *y =3D 1146 - artist_get_y(s->cursor_pos);
+
+    /* subtract cursor offset from cursor control register */
+    *x -=3D (s->cursor_cntrl & 0xf0) >> 4;
+    *y -=3D (s->cursor_cntrl & 0x0f);

     if (*x > s->width) {
-        *x =3D 0;
+        *x =3D s->width;
     }

     if (*y > s->height) {
-        *y =3D 0;
+        *y =3D s->height;
     }
 }

@@ -1034,6 +1058,7 @@ static void artist_reg_write(void *opaque, hwaddr ad=
dr, uint64_t val,
         break;

     case CURSOR_CTRL:
+        combine_write_reg(addr, val, size, &s->cursor_cntrl);
         break;

     case IMAGE_BITMAP_OP:
@@ -1422,8 +1447,8 @@ static int vmstate_artist_post_load(void *opaque, in=
t version_id)

 static const VMStateDescription vmstate_artist =3D {
     .name =3D "artist",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .post_load =3D vmstate_artist_post_load,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT16(height, ARTISTState),
@@ -1443,6 +1468,7 @@ static const VMStateDescription vmstate_artist =3D {
         VMSTATE_UINT32(line_end, ARTISTState),
         VMSTATE_UINT32(line_xy, ARTISTState),
         VMSTATE_UINT32(cursor_pos, ARTISTState),
+        VMSTATE_UINT32(cursor_cntrl, ARTISTState),
         VMSTATE_UINT32(cursor_height, ARTISTState),
         VMSTATE_UINT32(cursor_width, ARTISTState),
         VMSTATE_UINT32(plane_mask, ARTISTState),
=2D-
2.31.1


