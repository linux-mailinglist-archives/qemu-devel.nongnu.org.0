Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095F934D7AB
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 20:59:04 +0200 (CEST)
Received: from localhost ([::1]:56234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQx6N-0005qO-1o
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 14:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQx3K-00042u-G2
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:55:54 -0400
Received: from mout.web.de ([212.227.15.4]:48033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQx3B-0001UO-6M
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:55:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617044142;
 bh=wWcp1Ejj4xLDh+v0jZ2l91lshXjmh/O/i65EskMNeEg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=ZN2ebFbeDrXPiPkrQSCAeJBWYqvnn+yc42v4439SS4x7KvWUHzhkRijFAV6iKCsVS
 ioUlJhc4wQiiyL+EdMP0Zh7ogceClK20ZmC6A+xRX3mVyfNQ/yUR8MVQ2CMuLZE0Wl
 V6TMkpaw3tbQ14feuFTn2O0nBEKaKWBtHmuyw3uM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.225]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M3V26-1lQOom2xoA-000r5c; Mon, 29
 Mar 2021 20:55:42 +0200
Date: Mon, 29 Mar 2021 20:55:41 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v7 0/4] yank: Add chardev tests and fixes
Message-ID: <cover.1617043998.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GwaBaK2bmsaZTnZrnuhO1qZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:KuUqpDE4CH7v5Kuzq2Eo8yTR+GwUvWg2I7oexzC3qwms62VsFHr
 V5epMFTSPjvopDZoghhIpw7AAnJIaeVZCm3znWthTbwWMHLjXbBd1Fh4j8+ZTzrLns3Oojq
 lXrNGXKsE7GpjF3NNa2KAPL1WuENt4E3LTnKTxDIjfQubpVYofJ5JdB77jBrZ50S0oUdH1i
 Y9LDQgFDxlNud3ff6ygrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V188OMggaV4=:JhUAG9HOLqEf2PfscLXFiH
 GBOJRxZ20OUrjUJFnIcShsph5sdHe/uMYvTQlSoId/yDm1XdMxa10SzbICozeS4p5t8GpDhbQ
 0oGZbPlK56ARD5QWCMbejy26Ct4cV+jkyUWnsCvjtHlmf18J+4LnM6m1dTUddHjcOW9qAjg5a
 s4vO7s60iwO9df6Jzk4kTFLaKus/maJFpvvgzyhyr4GVr1gFl/DS3qSKNMcHgUXANPIBWLVpa
 ytZPqREnJtEtOxaAgnmaBCjSr6RmXUjSSTgfMGgJPLS15DzVYcXwg+cH1ECbwKdIUhEBy8xF/
 BRgSST3zeTDGARw/qZNcpE5uzmZB4CYhpcl5xE/SWTt9ptffP+Wm5ooKM9Gkm81wHvz3Gm3sq
 M3VY7TE/W90vDbZtAlSDvTQnYYCDTOwTyj2nP55ST2fdvmoo/NyjDHnL2B1xOOOk8/uIGPyMd
 v6HeuEMzisPkcQOQfQHhrEJWf8T2P3ZEhWFtJ5CpxdszmbSGuc67MH0W2ZwTni357igpPF0Yb
 nZVmVZ+M1utO0XygW6uvBQaqmrmiGhj3xyvQY7mYYPanI1iDkKFEgMRrFN1UIaSQlPX/NF99U
 3BhkOAPyYfip1TdMsHhQmW1Jxmhn23oc3V1iKXGcZzM+lEz4rPlTV4jXZ8/tAZ+l8pd51UmSV
 oRlefvlo+AbpkajyrDi5OKjs2WKt0xZpebZpieb336ZqvHhxhfNH0BTNGbI5PsIkE+EUoHWTL
 SZDBRkgOPVhV352rViZBtzoC8UZRIohv6AKvDVXx0WWNGBY5zVgd5x3s2ymTsUIYbh36jvnXg
 BTvs8NCHdRGKceFs2hFhKPZPOe23PHtVdVHhCE2j16t4uGZ0QWPbrluP+4a0mi4BrTnTZvGqa
 mth/vyikwgkpAvO6ruv8WK9OILH4bNVe4V9u2Ja7MMf/hbHZHAArh+A/4SCFdvTBUdZ1OMDqI
 3yxnt99z3jxR9zHb5oWjIlm27LcB9J0hpG5dKsMIs+WP4bUQI/Tmk4vPmyCfe6XZ6mGVXOxaJ
 pzmxNncBTAkME1bdRx4va4llEdc0jgYC0mgfneHZKeFNAX0vBdMIfK3OkMNfQ7mDZC78K6UKH
 X2UqLEKlTmax1RsRCxUkbiEQZm8qmiZHAQZmX2XPX/2/qMEqb/t/orWrnga4xAbOBoqvzvpfM
 7XNIaucNnxQLgsQJwX0ixAfv6ETwmJLWNZRIh58Kne+tg6UrP2iMs0JB48szoqOD+FiPI=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Marc-Andre Lureau <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/GwaBaK2bmsaZTnZrnuhO1qZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Everyone,
These patches increase test coverage for yank, add tests and fix bugs and
crashes in yank in combination with chardev-change.
Please Review.

Regards,
Lukas Straub

Changes:
-v7:
 -test: fix patchew error by not using macros

-v6:
 -test: (hopefully) fix test on OSX by using qio_net_listener on the dummy
  server socket so new clients get accept()'ed properly

-v5:
 -test: fix memory leak

-v4:
 -test: fix CharChangeTestConfig structs on stack going out of scope
 -test: move after bugfixes

-v3:
 -Base on <cover.1616521341.git.lukasstraub2@web.de>
  ([PATCH 0/2] yank: Always link full yank code)
 -Drop patch 1 (tests: Use the normal yank code instead of stubs in relevan=
t tests)

-v2:
 -test: add license
 -test: factorize testcases to a single function
 -test: test chardev_change with initialization of new chardev failing
 -fix chardev_change with initialization of new chardev failing
 -add reviewed-by and tested-by tags

Based-on: <cover.1616521341.git.lukasstraub2@web.de>
([PATCH 0/2] yank: Always link full yank code)


Lukas Straub (4):
  chardev/char.c: Move object_property_try_add_child out of chardev_new
  chardev/char.c: Always pass id to chardev_new
  chardev: Fix yank with the chardev-change case
  tests: Add tests for yank with the chardev-change case

 MAINTAINERS            |   1 +
 chardev/char-socket.c  |  20 +++-
 chardev/char.c         |  77 +++++++++-----
 include/chardev/char.h |   3 +
 tests/unit/meson.build |   3 +-
 tests/unit/test-yank.c | 227 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 302 insertions(+), 29 deletions(-)
 create mode 100644 tests/unit/test-yank.c

--
2.30.2

--Sig_/GwaBaK2bmsaZTnZrnuhO1qZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBiIq0ACgkQNasLKJxd
sljsqhAAguoqvpJOa42tr1gVok5xGd5kZqP1UNUsdsfWnAYY80o8Uej7+FhV7ZxN
VdOKEAr/80Dm3xtm5mVuieptoxNcEOl+Gx7v+On1Vl1c/BdvY9vGKdBlWGnC0Ctk
h730+lR42eLvmAf9eaCPYAi1WOC6GxvnOvnDEa+tQwgcrT7wWa4VCHZBG1NcHtGH
R1+pDWMCQhbp54g0AZ90zcTbIzbm24S/98eyUdQEQ0ymnvuAEeGZL77uv5k2i/4o
80X5qAmMWjJFp4pwbKb4ZyDgJhbTOtozE02amQCxpgigoBAInwkN2IaeLH3DPlcB
hHyquBjWr/FzEgxsKG+uimv80eIz3IZKD9djswdZyy7aRO/2i2Edme8zTBnbig1Y
PH2t6p3jmVSKAUjMvnmKF2pOPu0RFZaXpldTJkLz4PYDBlhNg8Octuh1dHrnV4o5
1CRPLwFltyG4rjY5gBdJtyLxbqRqLaFXowwFF2ZB3WU8Gl18z3yGY/C2XHBPsHao
rJTZCktVADBnXh8aBqZGNWi7YzBWEn5xV6JEdVgUR4zLiOp/3lZvn4RnzjVj/Y2Y
7PjvWuOHbFpZkOu9MXxpE6919UMBxeC5Q9QM0HjoImrgQ+8tVWp29ZUoj+Kf9mhP
C4qFUrwSPRhqFA8bdrjTGuX5Z8WXoYbtGbAVzttGmIT7PJgXeho=
=ArZV
-----END PGP SIGNATURE-----

--Sig_/GwaBaK2bmsaZTnZrnuhO1qZ--

