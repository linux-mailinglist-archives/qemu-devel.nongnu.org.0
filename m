Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A1152873D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 16:39:13 +0200 (CEST)
Received: from localhost ([::1]:39388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqbsL-0000Qw-E7
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 10:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqbiu-0003AC-Ru
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:29:24 -0400
Received: from mout.gmx.net ([212.227.17.21]:41527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqbir-0004wS-Jm
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652711350;
 bh=5x4+C6mz6HEzsXk7Lu4h8DanGcn0kCUqL/Q4G/Hnrm8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hVm1V0kpM1X1jGm1tP77kG7bf4MNCvA7yYiypOMIhXQtow3Td+UwwXXpno7xe7c90
 NqUHBvUVcjQHSTc7U7j2e5DOisWzNrolItykKLXUUdCa7qu0+eAY2z7P0q+VVRnrUq
 T77dPA+opPCiw5NuGMvg841KtEpkACFsQAs2l0Mg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.160.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2jC-1nUD7U1zRy-00n9h4; Mon, 16
 May 2022 16:29:10 +0200
From: Helge Deller <deller@gmx.de>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Helge Deller <deller@gmx.de>,
	Stefano Repici <rs.rdp@zoho.eu>
Subject: [PATCH v2 5/7] artist: Allow to turn cursor on or off
Date: Mon, 16 May 2022 16:29:05 +0200
Message-Id: <20220516142907.32827-6-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516142907.32827-1-deller@gmx.de>
References: <20220516142907.32827-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eF3HdLGkIWNWVuKD2QPKHP3zMiolfqB2LXzPBplRqnYEB/gYKj1
 T4qMPwCfnN2VVVMLoqDjGfaxQDB7dsIFvK0rrrwbuYXY523lr7zg1n5yQ598UkUVdcXicND
 eYpFkoTkoJJLU4JqFkEMdrvZ+7lNCaDTlDYGe+vFO66IV8y+8GpxqZgmU0jLnfiM868oEZs
 Xa15LcsPEZAPJgPHdAv4Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JGyscn+5bnA=:djXt9+1tCzsedwyyFo94Yc
 5/6h34joC4FNz/L/DK8rcScBDLhMfwbSbLvm7NO+CBEBMMetYJX137B9oy2sGNLVZ6eetwMlo
 XT70+xdy+yBuMpv5w0gNhkeYJ7ciSZtBuLXznb0lsmS81Es2UTpArSznmaekad1l7b7ljnHTu
 fAN8d5tps0xOVkVBgOh+AaxORsir+BoTZA3EjCXprWzOuvZt1yN2ey4+pd88IaLCKVzTkgZDn
 WJkNzt01M7xAjPg0FVBY36YOxSjFFUhgQsHRt/HNtXY/zKMLU0Y0JTqzYZu7pxhJ9uO6LNlcp
 IPC2ux7zngdm3yjkWAQZbsqLkPeeTREDg3MXKIthjEnhH//iMrxH7WNnKrM5YZjkDQecBJUcP
 G1RP0DMuxSjzj1ECShNMYfhVghENxrzRJNUKarRvMaSl/1z1L2NK81d2KmCs4zaYWzv/bmG4L
 0Hjk94NmEfPlpXQzaUwMy3roKYoaoAOiyhgRox11TMR3x7rdKVL6CaxzB9BnDP7O/XT2PDORU
 ntCOEwR8VjXvIH9piC0uI0t/ny/tyGWayoSVoiTLnHLezBKGlTjT3WhhoMmcrVmZlqgFzf1lN
 XDC9UhR8hlBlOrkCm2QtvcncaZT5mQA1mbvzkerr7gV5gnm5ojK9u2iHAnQY+SmdC4OxVSr+M
 +lxu4O6lsv9LAXbY5//edVAQazATnVzkyFNM11TrVUycowt7tCFignrJ4BfjdxP/iasehoV6C
 rzyA4kZzqZNVuuCtG6XtbUarX2VUygQfw/ifK8dVPLr6yEOTe0JJ6AlWlNEbYeBufvovkdyql
 ku/YqGU8a45/pD9qJuKCff4j97dT1hDu7eWvzEqQBcDt6QNFoiDWzHNZJvZ1GahLCljFrEQDM
 gtNXyWIq8RWZHCfq9e1jHAAiOYuWP6prTvBm3BeJw35hOYjAK8RZmklbCz5QxdPw3JrrCVBd3
 rtX7Sy3oODIoPTXKszCaQJpC1DoFIRqK1tUvYbwi9Ui55k3f7xT73Y5AGzRurvP1BYS4eQ1mC
 WpjFRnT8ekuC9DpW9siRFJnD1vmjWmVN85IZlvhOxch3zMZo+Lw/T/s6RgR2/XKssq6rdO2J3
 URhMnUOJJ+3B+/1L2Rc+NlcEiP86OIXgwKSWtckSyUd5nvTJxLvqiGmXg==
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


