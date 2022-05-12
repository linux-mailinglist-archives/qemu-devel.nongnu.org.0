Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A951F524C61
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 14:07:50 +0200 (CEST)
Received: from localhost ([::1]:48072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np7bh-0000qN-Au
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 08:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1np7Zu-00077Y-13
 for qemu-devel@nongnu.org; Thu, 12 May 2022 08:05:58 -0400
Received: from mout.gmx.net ([212.227.15.19]:49249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1np7Zq-0000hU-PT
 for qemu-devel@nongnu.org; Thu, 12 May 2022 08:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652357135;
 bh=RjLYOtiJYiPlDSv07WkfAkqoQQTZPhLhSsk0HdqX/zQ=;
 h=X-UI-Sender-Class:Date:From:To:Subject:References:In-Reply-To;
 b=QbHh+tSNdME29Dq6yXWtEiTVkHdRCKWQwvwQFxR7vTzWg5EVGlDHAHJBJrHf/qYTu
 TZFM6+vzMcbD4CJzU8olFAQDowCcPLdJkc/GpBi/t2zjvHTOLj4X6FCJmfF8CFbLne
 4ww3VtzXozvzOHofDeEzBPOVZknTI3RNShE3E3fQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.169.143]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNt0M-1nQpQV29wu-00OCVc; Thu, 12
 May 2022 14:05:35 +0200
Date: Thu, 12 May 2022 14:05:33 +0200
From: Helge Deller <deller@gmx.de>
To: Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel@nongnu.org, Sven Schnelle <svens@stackframe.org>
Subject: Re: [PATCH 0/6] hppa: Artist graphics driver fixes for HP-UX
Message-ID: <Ynz4DeilqP6YYhEX@p100>
References: <20220511235054.185435-1-deller@gmx.de>
 <3574c102-ba23-07b9-e6df-818c53718de7@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3574c102-ba23-07b9-e6df-818c53718de7@gmx.de>
X-Provags-ID: V03:K1:iP9ilOyE5l3KIMpVT2fpKjzCAwd5+PAlTUQA/TLWTVFLaN8YU6H
 G4WDJdJwoWyyhu31HJ+gInlGIXZD0/Opz+srCvT/wTk5dt68fVaYRNyO9kNmddLcuOxsRXp
 Ia7JZM9wvMw9zzOLdjy+88EOKVnlaaitUDU/tuOEs8VZZa1Ea7hwcQ0ph4k+iKxgvnPrnip
 JztImTuiVYy0F0nxGHrSw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ozkSnJ/5/Fs=:+ZhTSDX+th8UMiZixdRPgM
 ZUjq3GXDXFZFxXyhpYRybvcYmJlnbe2Ibh4tsXPRhuXCBAh4HKZ6DH+VvMA2vBGtoun/Rt6c5
 Zx2ltiJ/7bWU/UF1dYIOcEzuBpwTE79tMBR9czuxteygg7nnHBrxpOEMY/cX7LdTpH6zzNb6v
 j+sCCwocHY4FlCWm25bhR9wUl8SK803ZhsyskZpbizwkObqCsMprZm/puGZmDZ315vkZTFiy3
 qL6Km1cdi6UX+91L2iSRG0hkPcjK4AANUvey4ALQH5CmPjFABFF7g632n23ZefVlU4rM2SzyS
 qefvv9Cgvk+uiKCIdVJHdB8aQgbCMBA17gL6k9p9nlpY7cm+Q+VocbWrNOrALRU6fX3KRlvJc
 uI5dEWrHmz9EKNUz8E5qpm4yiqh4zov73MPHV74WhDNyD8McxxA2tDICMU16K98xljCkGMYIp
 aSG+l+83rib4taUARPoG/h76xj3xZCOV8o4F10rtPCx5dghh1Y9ltKuNX4k6anU4mwmE0P3jP
 f0AWpQyUiCv5EvQ7AZn7s3/yssPSvp27lIo6nGaqnpMPe+rFNGV7dcpvKeu/ah3qYzkzv/jn6
 peexsc+RuNX/0o9kVKYltXiaGtLzDUeUGtRwS93mohtByYO5uyTYDyLoBRV3K4YL9w3IF+rB2
 HdK/XP6wJeN9PAa3bxFUAgwVaXT8EIGJjsD3aL+NPCXpMdW5QaWMhVth5+VCVawpmA9atgpZf
 TKAvD6Xf7mdWOO96R8x1sy2OIPeje09ZAv0FAhaMunjC8rCKBBAArD4Rxggp9s+dv62qPgELU
 i0u2M8o8uwbux+KCIkpsXbZxc1ziwTqGO6olCG01P6fKQhHUDyqwnT9oL/x1aOy+yYsr4QY9q
 YfJ3pXAibyc/MaqDtEjTK40nTXIIv/9fiq9ENZKSxEUWoGVKId7Itre5y78oXl89LT6nlE1Xz
 fHlLFZfwrjzm4HKnKTw2G6KgzJlePbhu63QnYQQNXXp7rcOuT+DlgH802CBqUg/FGQSPrmekn
 FnvkNZ3sm2DkuwZwgNccPoBkn5ogM+MlDL3VWFbb7YoWwYW7aW1BsfE/xUvMCRQxtBAzj+tp9
 DPECYtdcQCdwYw=
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
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

Please review below patch as well. I'd like to include it
in the series when I send a v2 version of the series.

Thanks,
Helge


From: Helge Deller <deller@gmx.de>
Date: Thu, 12 May 2022 13:40:39 +0200
Subject: [PATCH] artist: Fix X cursor position calculation in X11

The X cursor postion can be calculated based on the backporch and
interleave values.  In the emulation we ignore the HP-UX settings for
backporch and use instead twice the size of the emulated cursor.  With
those changes the X-position of the graphics cursor is now finally
working correctly on HP-UX 10 and HP-UX 11.

Based on coding in Xorg X11R6.6

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 49dad2b824..8bf3bed79a 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -1,7 +1,8 @@
 /*
  * QEMU HP Artist Emulation
  *
- * Copyright (c) 2019 Sven Schnelle <svens@stackframe.org>
+ * Copyright (c) 2019-2022 Sven Schnelle <svens@stackframe.org>
+ * Copyright (c) 2022 Helge Deller <deller@gmx.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or lat=
er.
  */
@@ -313,19 +314,15 @@ static void artist_rop8(ARTISTState *s, struct vram_=
buffer *buf,
 static void artist_get_cursor_pos(ARTISTState *s, int *x, int *y)
 {
     /*
-     * Don't know whether these magic offset values are configurable via
-     * some register. They seem to be the same for all resolutions.
-     * The cursor values provided in the registers are:
-     * X-value: -295 (for HP-UX 11) and 338 (for HP-UX 10.20) up to 2265
-     * Y-value: 1146 down to 0
      * The emulated Artist graphic is like a CRX graphic, and as such
      * it's usually fixed at 1280x1024 pixels.
-     * Because of the maximum Y-value of 1146 you can not choose a higher
-     * vertical resolution on HP-UX (unless you disable the mouse).
+     * Other resolutions may work, but no guarantee.
      */

-    static int offset =3D 338;
-    int lx;
+    unsigned int hbp_times_vi, horizBackPorch;
+    int16_t xHi, xLo;
+    const int videoInterleave =3D 4;
+    const int pipelineDelay =3D 4;

     /* ignore if uninitialized */
     if (s->cursor_pos =3D=3D 0) {
@@ -333,16 +330,22 @@ static void artist_get_cursor_pos(ARTISTState *s, in=
t *x, int *y)
         return;
     }

-    lx =3D artist_get_x(s->cursor_pos);
-    if (lx < offset) {
-        offset =3D lx;
-    }
-    *x =3D (lx - offset) / 2;
+    /* Calculate X position based on backporch and interleave values.
+       Based on code from Xorg X11R6.6
+     */
+    horizBackPorch =3D ((s->horiz_backporch & 0xff0000) >> 16) +
+                     ((s->horiz_backporch & 0xff00) >> 8) + 2;
+    hbp_times_vi =3D horizBackPorch * videoInterleave;
+    xHi =3D s->cursor_pos >> 19;
+    *x =3D ((xHi + pipelineDelay) * videoInterleave) - hbp_times_vi;
+
+    xLo =3D (s->cursor_pos >> 16) & 0x07;
+    *x +=3D ((xLo - hbp_times_vi) & (videoInterleave - 1)) + 8 - 1;

     /* subtract cursor offset from cursor control register */
     *x -=3D (s->cursor_cntrl & 0xf0) >> 4;

-    /* height minus nOffscreenScanlines is stored in cursor control regis=
ter */
+    /* Calculate Y position */
     *y =3D s->height - artist_get_y(s->cursor_pos);
     *y -=3D (s->cursor_cntrl & 0x0f);

@@ -1056,6 +1059,8 @@ static void artist_reg_write(void *opaque, hwaddr ad=
dr, uint64_t val,
         break;

     case HORIZ_BACKPORCH:
+        /* overwrite HP-UX settings to fix X cursor position. */
+        val =3D (NGLE_MAX_SPRITE_SIZE << 16) + (NGLE_MAX_SPRITE_SIZE << 8=
);
         combine_write_reg(addr, val, size, &s->horiz_backporch);
         break;


