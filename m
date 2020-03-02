Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 823AA1763B1
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 20:19:00 +0100 (CET)
Received: from localhost ([::1]:37586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8qah-0002Nn-D7
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 14:18:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54192)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <deller@gmx.de>) id 1j8qW7-0000pp-Uk
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 14:14:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <deller@gmx.de>) id 1j8qW6-0007WK-LF
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 14:14:15 -0500
Received: from mout.gmx.net ([212.227.15.15]:43633)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <deller@gmx.de>) id 1j8qW6-0007UR-86
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 14:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1583176450;
 bh=Cxyrdksecd5F18qZjzSh4eS7I7NqZGMD6yeHdeolhAo=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=HUJVTks6hTHb2TTqLqFulIXOdeseX+eMVsxKhR+kqvNSs/4DOQG5zwZavSI3ozniQ
 mDv0eVSCAUmDFkKX915bpERhS/Y3rr5fk0CEhQBXyekL8dqCiY9LE/YkCrMeeT20rt
 yggX4VWG/w3c8htrA8H+AyYJfMprN23FY4n/yi5o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.130.108]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3lc9-1j97Mf2aAN-000vam; Mon, 02
 Mar 2020 20:14:10 +0100
Date: Mon, 2 Mar 2020 20:14:09 +0100
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] hw/artist: Reduce default artist screen size to 800x600 pixel
Message-ID: <20200302191409.GA4512@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:Roicp1uANwi0iMJar+jG+juiFi6IijskKnwbk0mkPnkoIqXudZj
 6mMVnBeh6kbWRHbzaFrniFfDbikyBAy405BUfwZp0V/ZiREAzuzYZ15K0DBtlrIW+vvASXd
 nQQPVBT2t//V+8AdLsPPU+2Tv6PQwCpRey4JfrQoJX+rDHha+JQ6TnACgv74dSY8V0mWHA0
 3N7zGIoFgQPutY7NO0prg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/bFEFr19/h4=:V/hHiHLw7OYi8HHZaJYbNW
 0UAYPQoTiehgqyNHpAre9QRDss5lOFQ2bs3VbpGFiaPdPEKvM2xSA/pW2An8+5mX8mzNYreN3
 xYe7Ow4vLrYAkKPXRHgig09iAS4CMZ34H8SDSwJ1/9R1HRpRFQLWB1a71QHPyEvgDMM4UQBtf
 9Bd8BJlqi88ZhOTAbaLhQMYbBWW+eW57XeKieIG3+LDnONN4t9rsXngGhzr+zANgQzMvZ4tIA
 1syHFAiVWqg4XUMS+Qey+Twoj1phF+BVtxduNt2nfDAoCjafz8odtyggeipd7sXbcElCY48wb
 9hOmc8Wt/ju6YQA4/4d2MMRHXjHKbDvccpP2FmzPQlO1iAeIqn6XFRyTKAmMcPTVCO7s41Gds
 Jkw0JsX++f9pn6WPRm5OczKe2ZNSsY6viCxhYY6ze4ZTRbOP9iJDkJ8mZ42nANSsJ36F7OGWr
 RPt8AxmUjK4urrLRQufEWVcnsNo47Lg9zONBPiiY9kL2HfY/7lnoS5XPesfnS31N1Waa4M08J
 IxqldTThPRmtg3obHF4FpKIwc7mhrQJGUz/PgZ6ii1kVEI+Ge2yLTgztzSuv/ZAGwyItteE9A
 baF/VYiErbk5vrKwOuDzXA2g7KoTNZKVQSUny46xtu28JGGvVgvIg4ZN9GW5xDgbwiYUcblPK
 vLXl+OMX4d/lZFsZkYiZanjMKhcIl2qq91BIVvSKlzTwvpKNx8TB+6DjEcAJQLA+xQRr6+9c3
 0VPfboK5f7e/k+FKr3sYtgRseHdatuNLYpwDXs8XvlGrl1i0zDw9l7+j7rmlhN6nSvIrPlbGe
 lLUcVK/a2qPqt3z0G8kBYvHs7DzlYcVezoTOS65B8WjGgyqIQdBqz/VgeALrnvhNQF7yGBCh3
 I2TKiuuWuwKgazMooYkFNzytT1jjfBf2QxETjYc2t3/hlldd8gxToAA0ixCVDaVCkiQuXqvVM
 dOqrkhH/HgeZEguErQgn/jtc1n/xd+CpHoSfIcrw+OirXoJeqz0kCupjfY98wYqNFgG881Yta
 C2rTNE8o8bue6NWp+8XMXqOXOqzdwA7QqPxH3G/jtL3vcqxddPrlQZWUUPAdyaIfHYrH9mrOM
 irUX9aVKJWf4HNhjiIVCnyKL6kqSB2nh1DVMiawSgGXwVCG+31N7hv03hr/XSG0UnLLBiHFYS
 ttQpbKPy8fAwPEiEIG9LyhjIbV3w1Yg0uXfLRz3H497f7fQLUq7l0pkGmUsxlaybcSO8jn0XC
 hZsdS48HNt2myKE41
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.15.15
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Reduce the default emulated screen size to 800x600 pixel instead of
1280x1024 pixel. With the bigger screen size the emulated graphic card
isn't fully visible on my laptop display, and if people want bigger
sizes it's possible to define it on the command line.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 65be9e3554..74cff24d7b 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -1418,8 +1412,8 @@ static const VMStateDescription vmstate_artist =3D {
 };

 static Property artist_properties[] =3D {
-    DEFINE_PROP_UINT16("width",        ARTISTState, width, 1280),
-    DEFINE_PROP_UINT16("height",       ARTISTState, height, 1024),
+    DEFINE_PROP_UINT16("width",        ARTISTState, width, 800),
+    DEFINE_PROP_UINT16("height",       ARTISTState, height, 600),
     DEFINE_PROP_UINT16("depth",        ARTISTState, depth, 8),
     DEFINE_PROP_END_OF_LIST(),
 };

