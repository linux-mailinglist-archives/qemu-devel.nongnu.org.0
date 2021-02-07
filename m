Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE833125AD
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 17:00:19 +0100 (CET)
Received: from localhost ([::1]:39236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8mTy-0001CB-3Q
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 11:00:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l8mPN-0006As-Rg
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 10:55:33 -0500
Received: from mout.web.de ([217.72.192.78]:41243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l8mPJ-0006YM-BH
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 10:55:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1612713325;
 bh=7ua/6SuBV446QElSblUX2fQTa/2wqoZLR8jSt7jDu/M=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=FzeHGzkLkFsMxkwEO0KuxXcBg+anQ4jTiDiSVR4JaY/f0Gk8RyqcXgZcQN1NbSCCF
 qLPn8/YXa09O94dMzwfVqJ8QoS0a4ZMewA05eJpmsWxc+TdulVlY6bZNBBKFcnu1kE
 /Xbzi861HhfIA2VTsBfRn0CZviygmOUjpVLlj2z8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.85]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Mf0pJ-1lXKTM2pZZ-00OaLn; Sun, 07
 Feb 2021 16:55:25 +0100
Date: Sun, 7 Feb 2021 16:55:23 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v4 2/6] boot_linux.py: Use pick_qemu_util
Message-ID: <cff831492e743dbe4791e51f6d7f5598a4f3ef28.1612712637.git.lukasstraub2@web.de>
In-Reply-To: <cover.1612712637.git.lukasstraub2@web.de>
References: <cover.1612712637.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kZHiV/msAvsnz34J4_s/s81";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:vbFCNwORPiBNsfBIb7ZeLTW25SEFzfbUJr8Zpr2+SZBJGWcceQh
 3anVeJKIZlqu9Akxn7hMqOYRyj80af8U3jlhyKH/KWD/3ERRjW+Bm5xbX7SmeaiB/oPB0SA
 ll/N5+giMiXaRQW+KkDgLhE5FOvXIlzKlqiL3BFddfzWlXgzMZha7C1Qhc9pM/EkgkymjPl
 bkCjyDrBUxYlbSOs34+tg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HkfAg+BpS1c=:+2Za27j1EEmnr99vt7lAAn
 yzFmfNa2X/w/w7GoPUMaVpg5GWYCiJi1Ltkritbh5WeSyf96HYNmXPFW35DLuQMEy3oJsx+xU
 +YmiDlNYKHd4AkXokTh8lYc1A1e+4PmutXSe0lXiWUy0co3lvzUoL61Ql5WTMEsVNCaG8WO3a
 P861Vk2y9mscF0YaKmF0/dCN/gDujFMdTfIKWfiWswE2PBa2kBvbNmgNXV0zOI+UXRstmvMAC
 gVsXf1awVyTXCtNk5QjFSy//szCZGmI9RZrzrc7UTHgVtiIvOnYOAyA9VxLlCI9Pn/AuRnoes
 ipKmJEsxRBgpoQd7bxicFoLSoFHxBRafIBvpZxvRrivzXT2waJnr+hHRpslIE+taMeUo7ErJ+
 hGRx5sEXwpwW2cI1u4vBE6jkxJ3zQ2pB23RqNjt0OTuONGW34BN3udjRFbcyzM86uTj+e6iMc
 fmDRkIkMr8ak97u7S6a8DdZXOhby7+lTDdqiQ0yOF7Bta/5XxuDfuMfxZGJAlJy6Xb4awI03m
 lSjSIF253Io5qj8YMkW7EbASATPKpCpwrrJUCABrz1+kz26gVVHReclyZcl2ulg/5VbjyiRW/
 nAiv2yZumfm564w0xQVOGqmtasa6JrJA7Mo8c43jM/ZvlCVENMUBkku1MY7rvKSLmnwL6IPoo
 jbi2UNs98njWiP7e/aCoEbrUlFwmU9A1Jtiwf0tjI9r0GL7P1JEnoNC/C86pZKQJ/wc/+xmNQ
 +ZaNrDD1m5mYL6lkP3aZVT6G4Aet3FnHclGSEdlbASzLocARkCYBP+2WRxvfPI3iTtXfIGqq+
 7shficlIgDUItJBGURb2c7EyKBu1AT89ydGFiaHlD2Asa5mrSUASi9Iv3vTl9UU1I/oCjOis6
 Ua+3NWOnXu5xw77gKXf8lhIQb32HAEfz5ZDgJsQaQ=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/kZHiV/msAvsnz34J4_s/s81
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Replace duplicate code with pick_qemu_util.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 tests/acceptance/boot_linux.py | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 1da4a53d6a..38029f8c70 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -31,15 +31,8 @@ class BootLinuxBase(Test):
     def download_boot(self):
         self.log.debug('Looking for and selecting a qemu-img binary to be '
                        'used to create the bootable snapshot image')
-        # If qemu-img has been built, use it, otherwise the system wide one
-        # will be used.  If none is available, the test will cancel.
-        qemu_img =3D os.path.join(BUILD_DIR, 'qemu-img')
-        if not os.path.exists(qemu_img):
-            qemu_img =3D find_command('qemu-img', False)
-        if qemu_img is False:
-            self.cancel('Could not find "qemu-img", which is required to '
-                        'create the bootable image')
-        vmimage.QEMU_IMG =3D qemu_img
+
+        vmimage.QEMU_IMG =3D self.pick_qemu_util("qemu-img")

         self.log.info('Downloading/preparing boot image')
         # Fedora 31 only provides ppc64le images
--
2.30.0


--Sig_/kZHiV/msAvsnz34J4_s/s81
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmAgDWsACgkQNasLKJxd
slhFjw//X6egO+r9dALXzK54i/A8UF/bgwa3YeRRK424cQbRiDYoZsyuQOHE+YGj
sCBbUteB/xBRgm5fBE+ognheYcQWDHtTHq4wDEiaFi1X6ASnh9PsTNhpWuudDB1J
+Hh/CDdvBAGrFJA0uA1AS6o5EjFc23cGPds7VVyfr7WTjw79DjtDw1aOG7BF8JH7
CuAP/bhjkfPqvPNwc07RHPFNRFtePc9ypm3wdpg+c7NFIHZqcxUf31zwZbjhCi5Y
K+ebf7j2C7Lnby8DPl6/s4rB9eJUFHLeEJ5mqObJW+6N8JcTatQD+WyI0SWXQSrZ
R5/ebwsSBkWjsWLd8fUhZ4nd401oP9HtGxj2OXZ9xn1zJzHqQfEDSoaP5xjSFxKR
I692GggmtobE3lvnfk7dOlczMEwXCbZg6/mcletfoa9AsIOLDcJNUVtLbXGj8HGT
H588yWvyBpfHWgN5dEx0mwwJZ+MAdxpXX9RblYtXGoZx0mEUbtk9YKzx19HAgV25
zC2zjC0jENB+OZdGoCJmaA8srC2RloNE0Z0U0OOKFSAdFcGNBK8V1TFS51umSOq8
MVU52kEOnN2xzwEqweJiXkAROoRrvwQbT5WufMpDTSaxRUIj2TKXBSVnY7zY5LeY
hutVYkg0lMI7/yk9pZ42/OeER2RFJHoFFeA1kjjKidPKgy4qP1w=
=YdLT
-----END PGP SIGNATURE-----

--Sig_/kZHiV/msAvsnz34J4_s/s81--

