Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF815524137
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 01:54:02 +0200 (CEST)
Received: from localhost ([::1]:33636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1now9Z-000549-DG
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 19:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1now6r-0002Wo-J0
 for qemu-devel@nongnu.org; Wed, 11 May 2022 19:51:13 -0400
Received: from mout.gmx.net ([212.227.17.20]:55753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1now6p-0007TA-Mq
 for qemu-devel@nongnu.org; Wed, 11 May 2022 19:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652313056;
 bh=NorrkFRs0APDbVEe52ARvCapJy/21D5ef172eNxHskI=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=kLAyJu9ZAdVhNxWuLK6qnF54ARHFaO4uLEIi35opRYIwwAzs7IOuwPG6CVOlj28hu
 RmAc2cSv9Lnrut8IBjnVBuy53S2cgCz5BTivJwrOWncHRrAtspNlmpF9NZTjsiOhxJ
 AJrO/9TCKJ5yWXgZ8aZY91PzEROuYr1O6AftqKAA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.141.127]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mw9UK-1o5VWG1kns-00s5Fw; Thu, 12
 May 2022 01:50:56 +0200
From: Helge Deller <deller@gmx.de>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 5/6] artist: Allow to turn cursor on or off
Date: Thu, 12 May 2022 01:50:53 +0200
Message-Id: <20220511235054.185435-6-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220511235054.185435-1-deller@gmx.de>
References: <20220511235054.185435-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:THqJp/obO63gfJ2c7HWcs2GcYUZfweh679Th3QA5WlT8MIyhg0g
 Beb7n2NRwlVMWxCKkq1kOVCPWk4XqGTBwdvonULmZqQ/fGJuLSufYX/J01U/6M7t6obm5OV
 bZ24aADk/WYppgWy6EPMV1nis1sn+WHiWfNlwU84ZeFq86Vr78O3MJWSfQSn8SsJGNtymui
 /znCr8mWLP3FlVdhLD3KA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UMiKL/AnEhI=:QwFyqKViM3wqWrGVo8cA9L
 FfLoSUSC8RhsVdyRcL2yoL6RfTduRSxAAa6jLKDLi4VLBQuPG6oQcAomXY8reooSmj8UgA/kH
 fxb7jK8ES5GiNtkroO5HHoHWZS0AhxYuQ7s7mknyxaR0i8TIsubRwHYeNp29SWYTyAkfzP1Uf
 Pyzk+Vyo1g39zvLNT0/NykoD3A/46Zp3aPs0gh/D8J6fHdTwRRYGU2cpGZ3tCQM/sKieRSuLq
 AIF/fRnLSZ/A6OR9dYEm92rvLpCm2Z9prRKwvgMLkatm0+YLvnKw7xS75S8LfEiwFRf2zDI4j
 LAbwPhx3XH1eXb0WlsQ/seM3CqGsjpoIVKhxUU4figNatUH8CAjPWzUAE2DgvRL9/+gjfQqf8
 wN2uKIOskjEyTSYVsoGjG9pbXoe9tfdEapJuPwATedf/TMWf+CZkOdBDnM+QomxRDcl9Pq44t
 MsxDdpZ4cKD05ncpoIFopfL5muXJq9bvkkoxyPdbHNSMRqIdHSLzdj/ugIigmnUPBKndGiytP
 fYedUTyghxz23omDV+3EHI4aEFn4ZZYQglbpIVTuwB83QVLDpfZgLGuBQIPQCl589oOM55EsU
 Wz+oPgLh57GtEeuzSEMAVN012YQtmPs7+qkH5yze6jqxl2QSbIW4ZkCO29YfaArq7R4JEekwE
 8S3oWaJKdJg8nmxz1kbeMXbM3suEHXetJJosqGUfXdl4T7LvF2t43IJkWESKMDMk+F3rgUYXb
 2ziXD7JX3Btvwb45OU8My6vBUsLbW/tj5ilVL1gjXb4mcpB+XvyxA5xEBlGMw9aELJj/8kHr0
 3s/sGDA5ivHS87QSaXgGPnuN0B3/EXmM1hDsZuCfUJ1uazYIaviO5qKeP9D4eDq4iyYnAfvpC
 9S3eg5XpCQVI5j3zZtH4wEaGNI09ZxIDvp5JvyN+uenV2yfLFHCI+Yv1ATBbeWSOddAB4nYFY
 fkIP3t7cWbVKNnwTiK5qZlZXT3ucU968ClJtcA0MS69zGv1llInJ0u99WlYUAJP5zwmE85Oou
 wcAA8NPvesN/IjWGGvE33IRTx0aXILD0zb9KWI9V71OdZr2IdpL0o0KlZV4FmvNSng5z6dGfl
 AIS7p3RV7yDCnk=
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bit 0x80 in the cursor_cntrl register specifies if the cursor
should be visible. Prevent rendering the cursor if it's invisible.

Signed-off-by: Helge Deller <deller@gmx.de>
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


