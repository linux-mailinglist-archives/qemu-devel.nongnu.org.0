Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8373435C5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 00:33:28 +0100 (CET)
Received: from localhost ([::1]:44792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO7ZW-0000Wr-SE
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 19:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lO7Xy-0007tI-Ss
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 19:31:51 -0400
Received: from mout.web.de ([212.227.17.11]:40571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lO7Xx-0000DR-5t
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 19:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616369502;
 bh=mfynmYO34USO1ivqNWQkqor9LZvNIaA+t030PoKj+cM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=egmA3E4PRSqRDn/Y5yiarQTn76LS+L8WDIzj/b98HIbBL2EEy914qfmUUsTDpJbNT
 IoDMdqrxFOFq3m8WgyJRfEDHLIbpdIT/rBrHEpmou2Ky2vpU8ymo7LszxgpXae+6qu
 CuS1eihpkW6Tu6IXc/yNpdvRw8AhBOdOP7fmBj+o=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.131]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M09hY-1lgcMc0mw0-00uMlV; Mon, 22
 Mar 2021 00:31:42 +0100
Date: Mon, 22 Mar 2021 00:31:32 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH 0/5] yank: Add chardev tests and fixes
Message-ID: <cover.1616368879.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U.Aqne6+7IqLgxXNmg=A9Vc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:NIi7siVz988yMuuXoM2obN2BcJETO4V5MBby7NW6IxwLjHK8MQt
 g1oNQJp828GrZH+nT2Xx94xxJB2cui0oDiKjW2ggx4TFYbNjYX0tD3OSpZXY2TpKuXYcYxR
 lwA9K8GapOhkTAmWNJsjKTZKIteOCf84BUNzAjTmAdCd4S3zTrg8+thqUSCQ1J1kzNOGB9t
 WPeVwx4fqyTMZOub1tDlw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FjMrqTnNnRE=:/nGhY8FNekcwGrlWLwumzp
 ko83w5SF84kh9H52rhPLKcz2U2bHXOw0WAndub6HFSsvhT68OwxN5ks4OQ+NvNJHMvngl8+Wp
 QUAsRJrxO3MIqNmq6QQIFiaHkD4NBdwYqO3t7KA9YEbo1RFbDHnekoHPvNDJvXm4Hcc9ucx2R
 7ao3HKmnrfMzF0U5l8J2KMI3VB0igyKSOUM/ExD5d1PuYZDGNYipgd3l6lIWe3IA4eiL7L1uL
 vYkK1DEeOYUq6IAshhyyG4NywMnlW9bCEnXliERSxuqpB6Etf/H+CY2RZGeLiGfxJf48vb93z
 0gHO/9KfUYI5Gbzt3s+mN3jqdIjR0tkRcY/k6nNUlwd28LI96NERxQoilJy3BQxSa7w4YqVOs
 2g009J2maSrrKgUo0ucA7Y4U40EC/DZftRGTB6EpBDlhtiY189ZfXtEYJuTncNXqXe3ccaOkH
 kRRY7ggB/bbxhRkDfrPcb6rYQmBhpAvr9Wg/EDP2xFfDtcYUYnBRD7BMvvJT+AQK6BoDhwuCC
 qJyEtVmlV1p/vp9+OibUCJJo9ER9dY2a2r64aY/T0Wt5J1b13anG6CLb7e3MwUcbYJYiz292b
 VWNOQdS30vPHU6g7+Cdlll9PC952w0Z153SlGOCaOheJ9zTOU7HqsgMK++HWCJdvClB8tqVyU
 9bC5mGdalGM768ZDGvfrThTornJoIBhzn8OXfb5Erpsv1RPTgKsnPzsyouEhovlybZ573SAwA
 kqfbFymU0EPRtEYiRFrf8V1hSlqjyCXMwCnZu6g7XZdFmARN/nX3Sc4jAOnwUZbmWfGTioFls
 MDG1AnshUnUW3g8B9Pps4gaZJiNjtld9vL/5n+ztk5mbGHJETOMpjCYB5H1c5iuHezIOrN4V+
 JI6NXW4fxtSocZK32FRWJmTk4LPNSyYzLl6TBM3fd5rTTzn06se369MI5oRf5tU6TTomj/+rA
 CALpxnz7h+RWS+Yi1dviMC8YyOdByMx1SMqFFwP8YJAopAV9NQEuPqU6tnpT3L2XO+rhwg9aZ
 yZSabhXMrU1nUWy6dEOourTIdgBIIr2XmWgIGxv65EFSl7YiVg4DUoteYGHPt7xYHGptMZCLF
 GxZWs3JYErhMjvVdaDcDXaKMvhnKF47BGSZXHCTV3UCg1rGOg86ukUht8KldySacwS0baePr7
 re6cr9JPspwdUjfj1wGSRcxX2RQFgx5OSSMzHWhIrA93nSvE9AdaER3QHSmCyDcW6Bsg0Dyfu
 1zSfGBcPLw54ECzKwAKOOX1hJkYqTuM+TuWc0ow==
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li Zhang <zhlcindy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/U.Aqne6+7IqLgxXNmg=A9Vc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Everyone,
These patches increase test coverage for yank, add tests and fix bugs and
crashes in yank in combination with chardev-change.

Regards,
Lukas Straub

Based-on: <20210316135907.3646901-1-armbru@redhat.com>
([PATCH] yank: Avoid linking into executables that don't want it)

Alternatively:
https://github.com/Lukey3332/qemu.git yank_next

Lukas Straub (5):
  tests: Use the normal yank code instead of stubs in relevant tests
  tests: Add tests for yank with the chardev-change
  chardev/char.c: Move object_property_try_add_child out of chardev_new
  chardev/char.c: Always pass id to chardev_new
  chardev: Fix yank with the chardev-change case

 MAINTAINERS             |   1 +
 chardev/char-socket.c   |  20 +++-
 chardev/char.c          |  74 ++++++++-----
 include/chardev/char.h  |   4 +
 tests/qtest/meson.build |   6 +-
 tests/unit/meson.build  |   5 +-
 tests/unit/test-yank.c  | 240 ++++++++++++++++++++++++++++++++++++++++
 7 files changed, 317 insertions(+), 33 deletions(-)
 create mode 100644 tests/unit/test-yank.c

--
2.30.2

--Sig_/U.Aqne6+7IqLgxXNmg=A9Vc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBX11QACgkQNasLKJxd
slgKFg/+KwB+nMEABySDeOVDIMDh+fQsP3AYmJHbiClf4u5pGeugOex3DlOyTMll
RVzzbw5yzVsluCQHODU/8H4M081vUT9FWASPSPJgFQ09Nq46RZr6XpV4x6FH3ifE
cZIAZiXwdHv6PD4WkCaW0273ojSeQ99QZVjfrbWA19ziXN0RfwUn6tHHuqbVMsl9
NUNTzYjTIKEx/IcHs7rftlqggGU/lZPFbEwrvijGGj8mMB7p6ZsNBZlLjtNXhdWy
Xo6Y6y14ymHPOYm1+uUQrkdINOL2Z5t21Iy9ecRhqr+0WX9Fk04tHuBr3Y2Nygl7
mobNHxb28/+kza9jmFcZmsK+IPoaDjQAiYii86Y4E34KHFZkr+DTP5UQDb9tLan2
cxqEjjrMR52l4PQ9hXHrfiDIwFXMI32Yzihzw3ZrP6sS4ZcjkqUmpVQrJL2l1sOT
0FsY3GELKzx94oIaX0wGFqXG27H/sVNQrrVpJQKPeuNxNGUkcQc4OZhjuP9Lpahh
3iGReD0Ea37ugq4lMumq1a7qw3WDpG395RFL0RI9V3kVtGM8BbqZfazJQnMrWNz9
OyZ4zy1N+jO1HrmcQmhXwV1qAWPd1Ft1iYYhjIVmLN4xCU7dnNhYiL8+vQgLOGJx
/OfEhb9xNh5HShIlIYoqHOOo9Wpmh5dULybHHpc8uoSRZ86+eqk=
=t/do
-----END PGP SIGNATURE-----

--Sig_/U.Aqne6+7IqLgxXNmg=A9Vc--

