Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E4B528838
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:14:32 +0200 (CEST)
Received: from localhost ([::1]:54540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcQa-0006Qu-14
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqc3f-0005q6-Ds
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:50:52 -0400
Received: from mout.gmx.net ([212.227.17.21]:58139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqc2o-0008DA-UK
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:50:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652712577;
 bh=5x4+C6mz6HEzsXk7Lu4h8DanGcn0kCUqL/Q4G/Hnrm8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=N+hfRYkYcDz9uM5nO+yJGz6bw2EqyNZEUe8f+u+zCKMi7z/YSm/2qxcGNXdQRQLqT
 ETSFr6lNGQ6e0swPEaiZCJVU7BeMswOEDLwItXDmWSmldw3F7EuXuDlfowAvlnu8Yu
 KxJ0dkQxCwY2nt6+acGju50pQq/ykb2Q+a+m2xZg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.160.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6sit-1npISM0oHP-018HIT; Mon, 16
 May 2022 16:49:37 +0200
From: Helge Deller <deller@gmx.de>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sven Schnelle <svens@stackframe.org>, qemu-devel@nongnu.org
Cc: Stefano Repici <rs.rdp@zoho.eu>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 5/7] artist: Allow to turn cursor on or off
Date: Mon, 16 May 2022 16:49:32 +0200
Message-Id: <20220516144934.36273-6-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516144934.36273-1-deller@gmx.de>
References: <20220516144934.36273-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1JeoQlLY8M79t2fweTgXfPuSkkQZ7Z0NO6LmIDr9ZbduKyipU5r
 k98NIR7OQPxhaWxqmxSjPdihBmLfbRRegIzixQXbDKSOkjSnAMf4yK4ZSahb4GNbaEdXvQe
 Qs4cJ8+2qZn5lDoNu0yNlN+5/z7/B4c28AFa87Pm4RawfoduqsdVlEOkIvEyqNUILhqzLJj
 nqCjqIfQGRF8M5KGOUp3w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MOen53g1oIY=:YNW8pizsuPczNWH1xWWKUE
 bk72qUSD4pQf1jBJ9wjLawzYhPLgqBhO8RUNYGtjdsUnW1KzD/ZdrgVakybQktqecQSLvLpSD
 yHCOz/GuHiHICWUXqQeyHogIQHrHysX0XcvddyUh+k9ZjgOaXlY7YVNHr8P+8Twx/+yqxbMxv
 ulKrveb9erPLaIkUQsTeswnF7+/6nFvKXfgn7QIZDwuq5yKGHioQygBE5uFt3V+M2d2U0m/Dc
 W0Pyw17fq/r9G1pfEau/AgiIGY1Rox6cNy6HGFbscu3DbiTK0wVuD0Dh0MkVfww/+w7nzHBzS
 9KYhPig9X1NXUoXKPYyqLlGm5ak/LcnNrWiz4f+R9CMPjENuB1acJu+Ep94dCwQ6musr0eInA
 6t/xWcScWVZu5xU6DtoSm6SqqeIGAgXx3r5GKujyEGNa4o9t9lTafoGctPWDmrxf4OdrVtK7B
 4+hxg7q0esJ6YofCu1hdzjyhbDb00GYNc6aMyITYB4Qi1AA7taxozBG9cfUCzMCmCi8Q6Ox7L
 MnQUwuHrn8sJjobN8lID+4rh7gwrZyHGL3DuvVQ/pWwbjeCclREehz7pX44DO+KWXG0xBr6V+
 zwO8UzyrwlS7IcIwdduicyoBTIKf21Dm2XG7fhdqihzYspK2CrRTX0/ulyLScvOQ79m0PeubX
 f3n3NA6S+eoCfxCNBRRB77JQAWMN4PeKwbsJvy7WjT0ta9PRp/hWOVqoEkWvQHa7yN4zsi8m6
 aH21BW1xEsQGtumpFOpeOAgGj3a7zW9CiLoDb1RDp9MbfWhCZv5MXQI2moXwKSbLoj4Oqyjkk
 3mWiM6oP0KiMflGQMhEF6caYg9pwmeq+TjmJMJE2sF8BxkWvEJww7filuAtpd+0nOjMiCkWD7
 /CSmJqq8OsjsxPbUUGMrj81lsXTQjjOdA89kEAzfYFFJrjfLqREPgO84BncIuieurSREtdZnM
 HBQV/86HYqlMMR+t8nNskeWl7YcSbDTFWq6rUZ+jJ8Dcf8nJxDWSNcMXBeIo3HV5mDPBcHq4I
 qoc9Res8QquK3Bnr8MTYwDtBkDgfDA539itePgxTK9UQgqX1fPies3rydjg5Zwyd/V6F5Dtcm
 Ce7xPFqpoUfpXo=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Bit 0x80 in the cursor_cntrl register specifies if the cursor
should be visible. Prevent rendering the cursor if it's invisible.

Signed-off-by: Helge Deller <deller@gmx.de>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
=2D--
 hw/display/artist.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 780cb15026..b8930b7c5a 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -353,10 +353,20 @@ static void artist_get_cursor_pos(ARTISTState *s, in=
t *x, int *y)
     }
 }

+static inline bool cursor_visible(ARTISTState *s)
+{
+    /* cursor is visible if bit 0x80 is set in cursor_cntrl */
+    return s->cursor_cntrl & 0x80;
+}
+
 static void artist_invalidate_cursor(ARTISTState *s)
 {
     int x, y;

+    if (!cursor_visible(s)) {
+        return;
+    }
+
     artist_get_cursor_pos(s, &x, &y);
     artist_invalidate_lines(&s->vram_buffer[ARTIST_BUFFER_AP],
                             y, s->cursor_height);
@@ -1218,6 +1228,10 @@ static void artist_draw_cursor(ARTISTState *s)
     struct vram_buffer *cursor0, *cursor1 , *buf;
     int cx, cy, cursor_pos_x, cursor_pos_y;

+    if (!cursor_visible(s)) {
+        return;
+    }
+
     cursor0 =3D &s->vram_buffer[ARTIST_BUFFER_CURSOR1];
     cursor1 =3D &s->vram_buffer[ARTIST_BUFFER_CURSOR2];
     buf =3D &s->vram_buffer[ARTIST_BUFFER_AP];
=2D-
2.35.3


