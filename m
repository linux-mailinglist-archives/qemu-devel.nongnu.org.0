Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B61652BFBC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 18:21:51 +0200 (CEST)
Received: from localhost ([::1]:60362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrMQo-00074x-FE
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 12:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nrMNE-0003jQ-DX
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:18:09 -0400
Received: from mout.gmx.net ([212.227.17.21]:45107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nrMNC-0004Lr-Gk
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652890681;
 bh=5x4+C6mz6HEzsXk7Lu4h8DanGcn0kCUqL/Q4G/Hnrm8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=M/bu9B0oEelwdCCh1tJ/62hIbc+yKYPAEIGmDOy8bhe5AmoGvO7vlXDS8ZXL/mEkZ
 Jsa1V2GBrS0ibQbfyFqmgbmFh6E0cV3RTf8COrao4pC7PdR0tG/hzAbBHy99GsUJVg
 NYzUOpXBQpPnvZTZGWobyxFWatgS615wC7RXCshI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.138.233]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MY68T-1oN3av3umL-00YTEQ; Wed, 18
 May 2022 18:18:00 +0200
From: Helge Deller <deller@gmx.de>
To: Sven Schnelle <svens@stackframe.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Helge Deller <deller@gmx.de>
Subject: [PULL 5/7] artist: Allow to turn cursor on or off
Date: Wed, 18 May 2022 18:17:56 +0200
Message-Id: <20220518161758.49036-6-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220518161758.49036-1-deller@gmx.de>
References: <20220518161758.49036-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3BuzHzXzq/SjbdhVsV1p3kXZbs4RVcruv0nPJwGJaWrMz7My9Zr
 LaK5ovl0uRkaBMfRIEw6u46BFJgRu9wqkAahbUoOlr7Mjsth9ebTfnPgo6i7OivuZhn0C5D
 zlJbJ4y4M9bWzEuKr1B6Jxi1hX1z8yEN5qSyL5lxZPrh/DGKmhgyaR+j6/6cZgzyewD6aUc
 wsGFciyaAspraqOkNtg6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pB0iNptpLMY=:lAxnA/hMbok/c43BgSAGY4
 uPZajx5aYhRUUcBQQJrci9Q9mHeKh8khK6TgN//0d41oxt/vbEhCsoBhtNKubLYaqTGM1mJu7
 H6Sj3iP9UiKclfHnvS0MeIkC2NCb/PIuJdiFfzFqV2CKEjq/HmAtFy4cLScET3K2NQrbBtYXx
 mDayO+uO4wHRylVU3AcZQoUf0YNobuQr+1FyMFQ2tAStkaN+W6UpUQaRFavx8NNjSiseEXYMm
 IZbWk7gHjNKBsTx+KYGcll3jCWeN3e13YhuDRTHTz9/p9xkoQ53h0I3PuOJQcSMNG01s43hP5
 Aa7BBdZvtxlPic4mGiIj0u0uqLnhmURSuuJbG6fdpSDsa44YPxH6GFlSQiakm/vOLonf1kM2y
 ReB1Bcn0A3AiftKM3hqYZNRU6dpYLGlT99PWIXL/USPlPWbWQbj+2xmivkJsMF3wBKKTQ3ws0
 HD12UNa+O8tvxJ5MB/3DJA6xTkhZK+HMm2nyABT4BoIRRHj9a0bTs4MuAna5nPe7/qMImIAwL
 rd94QVoCEvd6UNJ3w0qIUe2ySmniJc7zgXJxA0KfPJhWl3VcHHRSH0zkjzbhKb3a2zQTbQe2h
 NpzAWthoYRppXqqb0hR1mvHxNviXwRjA1r2zp50BW0lSYlIglf9yR57e5Xmev0gO40g10rJZm
 xe0kQEosYzR0yG1qVMOKsXVXzcWzChpOaBYVfEWNf29/r91DeNB89ucjsrtFdJx8cA5hRmYxt
 dYie30snSgcCoXqJpHaVj95YQiqcfZ6/CZHe+mHVisT4xK504uCX4mCwHqX7Z4ZjAKJs2g2pg
 jfmiWhT083Irwpw/ARjVAIDhMvLaB5XPfcUj43+3OSix2K35NXC0b/gB7IkMnBveep0ZMalMM
 LDxhVOfBoi/C2Wvc/JSiVUbdlWzMKfyrs0wi9BGEsk4afPXg8Jabt6pNY9TGwkgdVWfSM+nRz
 SsWvaixG+mpQP+giTkF+o3UqbTb+RWxEq3LMYPEJOq1tLTkz6rT4LvGGk05jTHsWxvqONdSe7
 LThgLh/rauFpxkxC0UnA9RERpfLuV6ujh6bB/8W9V81iBL4Y7yFt3QURX6avLnhbarYRfEzwN
 S3W4nwAG8sur2udO87NITEnLRKXIcGFx5Ww1kAEawmnpIGDIoY/gQmgxA==
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


