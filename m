Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB384A7896
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:17:07 +0100 (CET)
Received: from localhost ([::1]:54132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFL7o-00025N-Gt
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:17:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1nFK6d-0006r7-L9; Wed, 02 Feb 2022 13:11:47 -0500
Received: from mout.gmx.net ([212.227.17.20]:47973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1nFK6b-0007CF-JL; Wed, 02 Feb 2022 13:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643825502;
 bh=PRHDo6z6chIttvoNoof5bBeyN4L7vmEa3gMLSes46Qw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MRPdYQ6m/6UNmx42911dbkMuHiTMFDTGJdgph4wZjcmPTlQQgVb6YIBO9kTm39lbJ
 LR1DujTxYGAl2+5cmgIaCvUiHAgVvOGkFan3AeAVtNvi+tJbcZWI6EOa0R1FTaTeDu
 QJQ2ExNo6DkcRNBbvkdbW2OFsqmer/v4QwiZg8TE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.163.171]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGQnF-1n1LTX1di1-00GqSK; Wed, 02
 Feb 2022 19:11:42 +0100
From: Helge Deller <deller@gmx.de>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 5/6] hw/display/artist: Mouse cursor fixes for HP-UX
Date: Wed,  2 Feb 2022 19:11:38 +0100
Message-Id: <20220202181139.124485-6-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202181139.124485-1-deller@gmx.de>
References: <20220202181139.124485-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9pbs7yznJ//92GkdcByCUy7xNbvbLKJxKWCjhCZZJbE6hEIp1gd
 LBNNplF3QefTHk4f5Rwm9OUXu7V0J2+Fh/WQOOIfOWOfsJMzpADzXJAxBuZGTLnqrZ9y3Xw
 6wEZ+nCUIgFBD984yYGGN0gz1h207z0PgEB0doI6eP4xlFyq3e/w2GPpQWlXw/aCBvy7rbz
 UF2pBayBnnVT7hj3ZmDpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FyIGUaxZwTo=:6Q1dySHvRxmc+Ou/YSYxaa
 /hOmwQ696DRx6hRPUqOmx1Geq5HUXm3C15Byhwkwv2d45lnzHVG3a+gDjjsbFMHfSy4GeABaC
 Z0hJCVcdRZTv+gzQuqUa8Myx1aV94UrrAmax8m1oZ6rcmlBnVF0nrKsqm7oP53zpfgdI1RWtd
 kBUZe4E7tBoH8RQyjE1jliT/6aWA//lJ3XTmPSqCojx046HySlUiqJqjkog4K7+ESt+8YHCjv
 sy7e6PUjISdXGeMEsMMDMYDkLhN5ZaV5rKZVp55gm2a5OfVCCBa9p0p6eDvghujz4MqPMeGpH
 40mP4PrLCeIRZemcqUnGiXRjo+/Owwzuc776SO0hROmApWuVm0F2gVs2qHfo7wT9OV9eEugiq
 Ak/MCAyK+iIiHu0sLKevS8v8KaJ9+c2JhhuQsCkfjMr5FdClngiQaarSvMqUDDr1FgU3ywXJ4
 WAG+AwiRRy7qAK95IgkbXa5ul72rilMIkeKyck1sZw9/+iIwyiczPu1Kla24NYDqmI9DOP4aw
 hl8Kzr1azD2yxb6XB/YSoJVWW7i2MNfpkzj4GolQhzE2lZirpW2dIt2IMgz7AoLM8DoDCw95u
 kYg//xpxU92iFm+mVrk99DzrQ5Rli/WI8+69DeftTJQCc1VwE76NpupBAhVCwP6luzSPzpc9N
 YgPavLFfa/DHrLJ0wXkf7pyjS0QhWbm2ztoIQgQ4ardpsJR7hy4CKq1kXl5V++EKZ134SOf6X
 EikFPCaOl7OKAsqKaFvsFcL3g865J23wR4HYyEV3qqvp3GSNh2JxE2UhFGS23q/u/Ur9Emc10
 ZynP9BqEEm9czhDtTf1WNTPGYX8dNkIBF1ogvZDpuEyGgRrLup/WudLHa3ztyupQjmS237phP
 2Dl3BDAKqUid0jq54jXlTq6UXW2ERFPALR7ufyezpaA9KwfTQRdLwoQPXUrHaIDXS0gPJMbjC
 wh1zq+gFlU//6QD3t8d5FWeo7aJHohtzDW0P8yi4IRroKTMAaPd8phh1E2W1Fvr2wpvK/Z59R
 7IxzPJaobuj6QuZz7hRFkSj7zUM4c2guY8v7I+Qz98oMoUR7dUdhegZlKlPOW1FRjjPeoUfzm
 9IvuA8AahvQVdQ=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>,
 qemu-stable@nongnu.org
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


