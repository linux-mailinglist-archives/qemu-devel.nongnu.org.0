Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915AF2D8CEB
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 12:59:39 +0100 (CET)
Received: from localhost ([::1]:41782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koQ2M-0005ER-L5
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 06:59:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1koPru-0005hO-9Q; Sun, 13 Dec 2020 06:48:50 -0500
Received: from mout.web.de ([212.227.17.12]:41935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1koPrs-0002Qx-LW; Sun, 13 Dec 2020 06:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1607860123;
 bh=UP4094DmmCJ+Ss3RCBCnPcG3KWGgAKwbGEevrHNiNpE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=VCNZ77IfrkC0mIykkD1VNnfurWs/NojE5o5CnlekG8wuAXhMwOeMdZB0Q6XCCwJoO
 WG2qEfJbYUzNgdGzoUylIe4is5abHwVKIvLK782NnU/BepQIrtBVYALWOLHYzEu5rl
 9C/2U+yA14cqFiDhfJeLLCvV/pyVbxDqrZBf8dZU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.131]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M8Qtq-1jtXmi3VII-00vyY0; Sun, 13
 Dec 2020 12:48:42 +0100
Date: Sun, 13 Dec 2020 12:48:41 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v12 7/7] tests/test-char.c: Wait for the chardev to connect
 in char_socket_client_dupid_test
Message-ID: <9289057e4a736e2c9823634fdfe47e81962905b6.1607858747.git.lukasstraub2@web.de>
In-Reply-To: <cover.1607858747.git.lukasstraub2@web.de>
References: <cover.1607858747.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H5mNjaUzDko8JtK+tNhR=EZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:mBJsKeb0IRIDimauNo3NTTY2lxh8A2GPAoU1noJWPyc1rA86MrC
 Yf8faXMWuSRNPip4TBmWgj5HOIwuGIwg+EL0VYmi+s+f/5msw3ONCHHbLgIoYL4V40uOMD4
 D7TPFCEvTR8O6dpBvnZNxxI2YGMa3sxQIY/KiIBMI33vkIkX5og9KWrHXe5MRNGKVX8yeLC
 YTE6a1ycgQFweqXdjtesg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QsisDYe2Z00=:12RICRZtUVRBvPs5ocFqTe
 jkN1sfPWDB1DCWk4NbxOpFdHxIc5G+ajvNgEYxnO+0pjMxDK4J0fO3wCfRwYWV5MmStInGO0j
 acgV1Uz4+LmrnmMnZ6fW8nQxTQSB5gl9evTfnFv9oJxn0Px2U03e0qB9si415xFMKYACKXZzq
 lmnTnXrpzBbeCKkQ7wLtTUrXOWsUcO2J843evPhdwOUyEoiVMbU9i6jph9Nt3JpQ3fCaaOsO7
 /fYZpyxIj/7iTDeplcNO238gpVsW0b1OK5s5HLzvyXY1iCA+Uqx0kMK3/FoNOERPFcWhTPoZy
 lRsVthrCl9Wc562ROAWAVnC/XUwpZha3dlqf5aKvqOpYNRu/FcIO5Thc+5jLcTZwUlAOQGWss
 9T2NoHkG6tEKFRwH6VsgOEQyM5aXKvo42BVflzdYu84KGeDWJ74Yk57zH/aXn0UKqszASYb0h
 q6qCHaNTFvL5xNPAd9jcgrF/8u/BXwmli459jZPjOxHOviz+TwlyJETKhFIYGCkyFy81CtI6r
 Y5afrfx5b/kSsPdr6/g7mT7Vn2S20b+HXinnnPCGUwIi/pzokClMVDaC7eWiaLZgeg9Hgn5AK
 7no84QbQZggUp/WLrafRC4jvYmaO8gk4Satkv1GMFHjTwcgr7fqd4QmRJrC/8RD+w04dS4Uxm
 hfQ28P+unzFW8/dD3SdQU5HCaNcHBPftd60dMvC/Qzugzs21d+RXkaOgbMDWMIZ/Oo1/TiF5C
 gargmGrRZ53wUNsebqJ/CJUMjB6a5HWgGvCJqveHdQd5abzfBtCM7aZ4d4n5M5QnfNPgigBu+
 WdeautkK5o4MmmqPZPbrJ5uPnO2oIFy+PVyEyoZp2kAi6ZFrf3IgvgWJLBzSAYevafbPN7zMp
 gazH1h8ix8ZPxV9oZCPNKLBAJ2rwMBDAmKSLmd8RU=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1B?= =?UTF-8?B?bmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/H5mNjaUzDko8JtK+tNhR=EZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

A connecting chardev object has an additional reference by the connecting
thread, so if the chardev is still connecting by the end of the test,
then the chardev object won't be freed. This in turn means that the yank
instance won't be unregistered and when running the next test-case
yank_register_instance will abort, because the yank instance is
already/still registered.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tests/test-char.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/test-char.c b/tests/test-char.c
index 953e0d1c1f..41a76410d8 100644
--- a/tests/test-char.c
+++ b/tests/test-char.c
@@ -937,6 +937,7 @@ static void char_socket_client_dupid_test(gconstpointer=
 opaque)
     g_assert_nonnull(opts);
     chr1 =3D qemu_chr_new_from_opts(opts, NULL, &error_abort);
     g_assert_nonnull(chr1);
+    qemu_chr_wait_connected(chr1, &error_abort);

     chr2 =3D qemu_chr_new_from_opts(opts, NULL, &local_err);
     g_assert_null(chr2);
--
2.20.1

--Sig_/H5mNjaUzDko8JtK+tNhR=EZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/V/5kACgkQNasLKJxd
sljEBw//bOVZUzXYx9Bvm3AXn+x1H9x9Re+rDYRXtONIF0pBBZIy7as/SdBkfOyH
O568CMSbHCnXbjk97RxfbTZY0G3Xs8t/iwNLcwbG99DQrpqyKJZLdyc/Wheen9E/
kyFtiARGm4GEaN7RN1S2Mtm/exFQkya77T7mi9MB8PyxEHnyBLV/QzA3L7Ht1acw
4ow/cwZ8lAC0RBenQ1DYn61AP98eFJav+UEvzM8154F1vyiq2wLMgLDxNqrCVwOo
1REJ3Q04CzFhEfbbNxCYuDI1NT+iy11YXFZuaVMuOMOSifU4AatqyU1OPm2HMB5G
3pvw1+R8TQyC4IdFF6VvE4Yx4UwSeYTAJbr1rGArFieXNoxWBrU6HtXxu3njDg4p
GHOpGZASmfmbSRZWdn0TCOaT4LcCNtu33spaQPmrzsyLFM1VAUHjxK6akeutu+04
CQMRP9IpGPcXUwlygVwbViPfhkSILhHAery++OzkJB+BKKVMolb+5j3mqaZW0D0l
LWxer3Xnq9GkyUU8zt5iBl6ulGH8GGjjViUm8EkeX3R69Bo9o82Mlr7Rx3Nl3d5W
tX7hArSD2UsHTXRR6BToAzBTquIc+glBBupgONHpRGUKSbUbtk07OEoTnzB5H3hi
9jsfs8lyVF1vpeqVyTIJiPPYPyMDHrqudwLYpMrczY6B5R4+i5Q=
=bcQ1
-----END PGP SIGNATURE-----

--Sig_/H5mNjaUzDko8JtK+tNhR=EZ--

