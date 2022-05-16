Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E1D52873B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 16:38:59 +0200 (CEST)
Received: from localhost ([::1]:39394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqbs6-0000Qz-W6
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 10:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqbip-000376-1x
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:29:20 -0400
Received: from mout.gmx.net ([212.227.17.22]:55031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqbin-0004vp-7z
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652711350;
 bh=bC8k4CmHvr7MWuEgzVuQnCwm1AP7Chq+SHlVnjE75DI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=VsAHdfKzfndavWuseHH/RfqlOI5ByCuPCCJqRW5KYgq6meFdemieASBKwDYCh9LsO
 jJaR5rlqamacttMMYhgVkJzKZQmjPplS9qJkTFXegJMM/66DPs5Zh94bTAfxBrpMnw
 iyYCEAM2YWHhy/Tdii59+OaFO/0+MSdOKx0mov54=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.160.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Md6R1-1nHGhZ0zR5-00aHXP; Mon, 16
 May 2022 16:29:10 +0200
From: Helge Deller <deller@gmx.de>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Helge Deller <deller@gmx.de>,
	Stefano Repici <rs.rdp@zoho.eu>
Subject: [PATCH v2 4/7] artist: Fix vertical X11 cursor position in HP-UX
Date: Mon, 16 May 2022 16:29:04 +0200
Message-Id: <20220516142907.32827-5-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516142907.32827-1-deller@gmx.de>
References: <20220516142907.32827-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AkgWy1lYZ+D1SGX51J6RBmRcwq8F9cDEbs48hnJATeit79pWBKe
 UfBarKV/Qia2IE4ueLcgA46D+dBpoTh6jOvWOuVW93IBnKR7do/SC70jk6F/b4Z+GmC9ZFz
 h0uW48Y/kyj1XbsVmtpW+cwnOVToxMpKf4lb9rLDay5wgsWmnJfRoEHvdDrsyWYK5ZBfT12
 For/jRijyY5JLRI+CCfqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SreHGUHXYjo=:T+WXT3nDY+P+uiLBvq8Ema
 BLTOzTCmZrCNg0PgbAYeKh+/ZCsIHwvNtSWOB0RHGknkvyvA5vlJ7lWGyhC7uokoG/yTYHUXP
 MJRdXAQN6Ba/W9NsdVKfW3HfItPjZfFmDK5MYu8nEjt+MDe00KOLVFukYNGgzU4naPiFdJQAR
 il2Vfgs03GmJ08vJtUIjGfNVZo8R3kSL3HqMS38YDIeRSsFfR5KHlhGZ2L36a7t2nLxSAip3X
 ezk6DP32U7YLg5m+dJUU+FzbY0aMtdCJemx5Fxv2QPcqjFtchoq43yik+E1SZAUFavEkhUCr5
 XAiflhYZ9CTb1a8j2ByZWz1QxXPb0rtF2hATTfGu+0IsvC8uwRBpKA+Fj1phAMLZQa2MgrYzc
 a+CxgkK+l4ECd15trRK5ehdokoF/yu5yHWpvYXc644QN9K2NGDbSFJ0m9mfOXDuiTkC8p67ZF
 IGvrMYY7xVb70JW3ZdbAW8tatZiJXSgLkOOwOwZSSbM+ktY3dMC/Z2UNYGU7g5PSeLSyeW1wC
 RrHkSB3uEbpPj0Ia5rVaEIf1KnZcrTMIVJVw3lAqWx9VAgC52I1lAYK8JAueu9GHfGAIItS3V
 GUYWdGHP+BRSh7vYHjc8UgJ6xvBPWaLC8ssOxQosYhM3FTF3e9yHUu4c/yg0jbb1q1CXBgCJV
 71xHSfrWkdgywqLI4CBHjD1izIwwN9IXI3zN3F2CcT4bGkx+F7tT3p4xYO9VVjUm43/mnM7s/
 omTEWVlxMkl9U5Zv5Ml46C63E3/A6Z++tIBBIAQyPejrdIWT+hFftaYcT3fXYq6aTMlQhiC7P
 LbR6wWQE8odGLakAwouYYPf7SgTUfh+f/nUFi2fUgElpTGUk8NdroTwTiBKgogH+0gntA8p2j
 cVqWKC7fiBJT4AqmrMKo934ijUVs2FicKZtC5WZ41I7bhk4xtEwoX9iuB2vAzSOH+tDP13D29
 7nzAVnnITTw9aqxV/mPRVVD0qGiqt18MGSSMod9Nwd/FBDdO4RwOtRRbUy9RBivsE0C066hDh
 rsjSwRdMlql8eX/ngNQaprzzppEbWPD052pT2nXb3d2pNPe3zLY4HM7eDmxicrBOKB/o8c3oZ
 1IwJK9JijFxfodH7vjcQLEiZCTUvPD5wGkKeWPoMCujOSwRqBM38Ie0Hg==
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

Drop the hard-coded value of 1146 lines which seems to work with HP-UX
11, but not with HP-UX 10. Instead encode the screen height in byte 0 of
active_lines_low and byte 3 of misc_video as it's expected by the Xorg
X11 graphics driver.

This potentially allows for higher vertical screen resolutions than
1280x1024 with X11.

Signed-off-by: Helge Deller <deller@gmx.de>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
=2D--
 hw/display/artist.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index c8b261a52e..780cb15026 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -337,10 +337,11 @@ static void artist_get_cursor_pos(ARTISTState *s, in=
t *x, int *y)
     }
     *x =3D (lx - offset) / 2;

-    *y =3D 1146 - artist_get_y(s->cursor_pos);
-
     /* subtract cursor offset from cursor control register */
     *x -=3D (s->cursor_cntrl & 0xf0) >> 4;
+
+    /* height minus nOffscreenScanlines is stored in cursor control regis=
ter */
+    *y =3D s->height - artist_get_y(s->cursor_pos);
     *y -=3D (s->cursor_cntrl & 0x0f);

     if (*x > s->width) {
@@ -1158,14 +1159,17 @@ static uint64_t artist_reg_read(void *opaque, hwad=
dr addr, unsigned size)
     case ACTIVE_LINES_LOW:
         val =3D s->active_lines_low;
         /* activeLinesLo for cursor is in reg20.b.b0 */
-        val |=3D ((s->height - 1) & 0xff);
+        val &=3D ~(0xff << 24);
+        val |=3D (s->height & 0xff) << 24;
         break;

     case MISC_VIDEO:
         /* emulate V-blank */
-        val =3D s->misc_video ^ 0x00040000;
+        s->misc_video ^=3D 0x00040000;
         /* activeLinesHi for cursor is in reg21.b.b2 */
-        val |=3D ((s->height - 1) & 0xff00);
+        val =3D s->misc_video;
+        val &=3D ~0xff00UL;
+        val |=3D (s->height & 0xff00);
         break;

     case MISC_CTRL:
=2D-
2.35.3


