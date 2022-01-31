Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DF24A5192
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 22:38:27 +0100 (CET)
Received: from localhost ([::1]:48112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEeNW-0007JK-6m
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 16:38:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nEeL3-0004RO-6H
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 16:35:53 -0500
Received: from mout.gmx.net ([212.227.15.15]:58853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nEeKm-0000w8-Di
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 16:35:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643664932;
 bh=PRHDo6z6chIttvoNoof5bBeyN4L7vmEa3gMLSes46Qw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=FDvDbRgCAph1YP5bZtp6lB9c93n9D0twAnlvOI1Hic9jcOdLXNDzt9E5rc9+tdn3K
 x9FagptQwhmBw0lpiIedCVGaoYfBzKDdYnvFqr5/jKrOnC/kZl2nAwdVgT9ZUTubq9
 k3E26D9BFhnL187vc4sa66rYx+4JUidr2+yKJx4Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.183.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZCb5-1mk4mr22Qj-00VA6w; Mon, 31
 Jan 2022 22:35:32 +0100
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 5/6] hw/display/artist: Mouse cursor fixes for HP-UX
Date: Mon, 31 Jan 2022 22:35:28 +0100
Message-Id: <20220131213529.17404-6-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131213529.17404-1-deller@gmx.de>
References: <20220131213529.17404-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nz3swW/VfT3qXrpaPCTQQPpPNZ3LDkY6XugWmcQ601jMIlJFfCE
 Bw+XQS7VKLz9y4+oe7iTctgMZtK9NLFRSVaO/sQwJE7YjCIwGA1OmrSU/PniqWsYJ87V7oW
 Lcw5zT7nYsMMGhGDYh7wgG7m3yOB3vNa0Or/upCtfIJRPLaoePlHAyl/ig+NrnGN4T6vs4Z
 ILIACoOkG14p+nCO/RLUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XlaJg6iQBPY=:AXh6qpV7TjoAvwtZ+BHpd3
 oX5EIKq4zNy+vPtu+2JrhxjCbre4iJm72kzgdXClPyDLciUFe8LmngOpFoeivszkuUevBn5ik
 QEJLoujZ2RHXNZX3HRuNurxOy/oVN6L9yY8M0Xb8oDiqnQkzRZnk/JHzw3zbGT6PG+szyt0ju
 G2vyd/oMYNWnqwZpzHY1pbE0EEEMBq9+d5JtO8nGcHxDyjPHzGsyW2THZVR+CpJ6z4R8m7vxq
 XjoKsdpHNP5paSlEJnAUpvkIZePPDIsoay1quqkjXDKQWyIO37dWoKBTAqO1l5n6fY+c4971w
 Y4mV4Vy2SsLF9GqUcdcIkDXFV+G8cn3ATN1FQzD9qmi7jLHw48S3ZUEuX93tWcuaRMFz1jYw1
 vWcR/sufUUfUPjGDeAoup01CUyTW8rzn0vl8MhbxSZJO0POa2iK+wyZaQx2hzsLCscUKZgEAA
 u47bHzAkPzJJJA8c2ZLk7q0OsUyurW+muqbx3ugNKXoQqsuD8IyyUHHdoSEM/P1oh4HilTYdh
 o+gY8a8aHEtc7FqF2dHFcONUp4XwAG9nxlOYrUAO/mAtD7I9/G9K71Al8jTUrTqElpMjj2Q2X
 cpqheIR+ksQvQZaBPs3Bbg/fOLvd4mUKNy2LvuiKmr92YW0Vcpol4+LFU5qXb0ykAzZdEaaRk
 t7/5evAC0pRCkfjbxorKH/jXg+ygiMcIeFWFCA/OHiR3fkVv+hhZWTql4sFCGzhkKoUrAy6Dr
 TD4zjoTenEMx0c2Bm3Fo7USDLw0FS4w4q2oYLq4UkcNOZX3PHq76FURQxba6GD1+0JEuUdF6t
 gvevVkhbeWU7YsO09BNBfHDXTwZv+sh5fQhPek2YGsNzL9LxIpbxc8/8ibihQTGCkCfqr5pSP
 PHLAWLsG3WqKILvP7IlTCAFprHzioDOAvgazE953cahf9A2bS7m3t4y5HC8wDIVRbqNEMrIO2
 FDJRaGUl1o5J8ofCUmuG/RRSQ96eeJvHhqJ/YEghNMmu7ZFWzEbq8MyywsNcXGa3XRlkxd9eT
 j9lkQq4c1W3q698N8FpWtqK/Ws4CrNTPtydD3yrxvH/MaTu6RRwFVwSOqRmu0K50n6nMcHYTr
 xjNRrlth/TZRdc=
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
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
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 hw/display/artist.c | 42 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 442bdbc130..8a9fa482d0 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -80,6 +80,7 @@ struct ARTISTState {
     uint32_t line_pattern_skip;

     uint32_t cursor_pos;
+    uint32_t cursor_cntrl;

     uint32_t cursor_height;
     uint32_t cursor_width;
@@ -301,19 +302,42 @@ static void artist_get_cursor_pos(ARTISTState *s, in=
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

@@ -1027,6 +1051,7 @@ static void artist_reg_write(void *opaque, hwaddr ad=
dr, uint64_t val,
         break;

     case CURSOR_CTRL:
+        combine_write_reg(addr, val, size, &s->cursor_cntrl);
         break;

     case IMAGE_BITMAP_OP:
@@ -1331,8 +1356,8 @@ static int vmstate_artist_post_load(void *opaque, in=
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
@@ -1352,6 +1377,7 @@ static const VMStateDescription vmstate_artist =3D {
         VMSTATE_UINT32(line_end, ARTISTState),
         VMSTATE_UINT32(line_xy, ARTISTState),
         VMSTATE_UINT32(cursor_pos, ARTISTState),
+        VMSTATE_UINT32(cursor_cntrl, ARTISTState),
         VMSTATE_UINT32(cursor_height, ARTISTState),
         VMSTATE_UINT32(cursor_width, ARTISTState),
         VMSTATE_UINT32(plane_mask, ARTISTState),
=2D-
2.34.1


