Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D4534B17F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 22:46:22 +0100 (CET)
Received: from localhost ([::1]:46134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPuHc-00060c-KV
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 17:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPuFX-0004zA-WC
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 17:44:12 -0400
Received: from mout.web.de ([212.227.17.11]:57985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPuFW-0003Ax-4Q
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 17:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616795044;
 bh=FKha7my2fwMClBLa65q83CQagKZh7+Dh/vDofJnXAtI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=rvKDlel1GzMpUU19mOMt35tGxiwdjkjTQ6WFxZvPSlIkWvtR8npxs1XQi4CeNKB1i
 7ggtDQRYIVq290RBoNsYE6oWVlEKLu8DaDrv667iG+6YAqbLCgmXlGS3GhwTyAT8oH
 +fDMJ2Vhj580yu3bOVld6Fy0rYjf+xLwe32WPauU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MPrLN-1l3Y2x1myJ-00MvLV; Fri, 26
 Mar 2021 22:44:04 +0100
Date: Fri, 26 Mar 2021 22:43:54 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v5 0/4] yank: Add chardev tests and fixes
Message-ID: <cover.1616794852.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9fe4bYB4LSu266zpwWOZ_om";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:K7DE7p4/+An509iM8OZ6ctzDomZ8tqpUmPIdkzdMP1K86KRvJJC
 Ntgrx5PdmnP2BAlWXTf1X2+SwLN8EX2s1I4C6m3iA0Mfi+5+RrPWjmcpf/mcXU4N+0p9o5y
 d9fHsG0X0yQVhzpVOgb2ZD2UTGH1olybySmFJZsl3RgyPL5EEmr9THWo6PI47oHYmVpap3L
 n0uLx2rsW2TFVyO+Yu6LA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EoIZi9k24HE=:NyU3pP/pPl2w/VbM6b7OV2
 EVfHmB/s7X/WVGKqPeRJhgeC8pWVQZY+Q9IQZCSg9Cv4k3jfcluSwLdjL8cR5pNh4iFLoF3of
 XIoMoEOGu9c49gFP/BtFNEvrKgj1oFiRt156XNqfJ2zw82nAQ8MjgtCIZYMLuNGW8JGz32RzJ
 G3IvydY7Bmjf5nc/lqifq4toHnWEAmtaE+8NGsRYeEYz0PVSG3XeUxHF/SVemJ57spOXs49Cu
 Dw8mvIe/+3OrjdGDfyOnoe9Jm5yPSUo0+hRkCAPlZwbnDk4H0fNTu7FTg/AMhPtcsCfr/5NWh
 RfJ7OS4CzSEPxbcKfmYoRlV1BVLCnkAc7HEroW3qEqupMm/IkY9yZPtuqfknMudqBaheZh4oE
 0PMHpmVb0SGUcApnH4aJXAvuFYZttisQ11SVsDRFDY2zsuS8uB7/av8TnQ8ZvZ+Q/m4zIB/VD
 45/XdgFhGis241zxFAH6LNCCEdZAKXspgvOhAqJYeU9DfS1jHGP/ZXBoSRn68G1nfC8euOZj/
 hGBdr63DTzuBoH+M1OL+fPbD5DmHSXb882heT7g8UR8VMwOeYKmPUxUA2HjqNYxNiMc3BqgCk
 0Q9ZtA3cbZnAgVV5B50GRZVFbueQnpiX+jwnnNzLgtGwl267hUK0GzWbR7zhb0jDsATpI9bHz
 i4uxfm/xqz3oGY8tKFVx2rnqvJKk8zuT5yX6hEn1tj9oUy/OJjTl/YUBX09CR174Xa9Vm8JvF
 /yti/nKrsTJ4vUbdWX/l15zqx2BO0b2WqwqVQKie2P3wDdZifT+T/hFTflg8pgWqgsQat4jru
 Xb0ThRbR73K2hCXd5l7+y1/ZzfzulAp5503JM19qksOkWlwfgkRGT2eNSJy5ke1VEMEBiHBRQ
 iuVEXzIJzEM9CXW0v5uAGBUY5x0RggH+gFqfbRk7+xRmYh5bk5TbOElxO4/GlrVKjQzE+l3Y4
 Waue0q1KQLMdOabMqV/9Xz/x6G7azhIbGmP0Pq3JpL6ByNY2imxcwXOWBv3L9qHDO4eKGf7oU
 XiDAxUFzNARMStU4Pnd4SnLeJObq/qBmBzYvCuOp8fYbOGYriWxR8ojmbjT1giZqEd9suhtQT
 Ht4zqPNmk6vb29knS4Q5ws7zwcb3q0FqC4NFULFkzCh17UlZNjPpfizTO6mtIBuGHZct7C6Hl
 UBzxNiDCYC+jgs5uYoFJK9kY9Y6V/dQxGFBheiae9fxz1D3nfTPPlO/TCZjoW+AK/8oMY=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li Zhang <zhlcindy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/9fe4bYB4LSu266zpwWOZ_om
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Everyone,
These patches increase test coverage for yank, add tests and fix bugs and
crashes in yank in combination with chardev-change.
Please Review.

Regards,
Lukas Straub

Changes:
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
 chardev/char-socket.c  |  20 ++++-
 chardev/char.c         |  77 ++++++++++------
 include/chardev/char.h |   3 +
 tests/unit/meson.build |   3 +-
 tests/unit/test-yank.c | 200 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 275 insertions(+), 29 deletions(-)
 create mode 100644 tests/unit/test-yank.c

--
2.30.2

--Sig_/9fe4bYB4LSu266zpwWOZ_om
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBeVZoACgkQNasLKJxd
slg5EA/+NHBYdnCjxPJos/gStd1fUftdJwDjZ7tkAyMorxR0lYJY0QGwzBCfUvaQ
k5CbWVTWgGO+nVVeWmllyZi3lpkJkdiPj9FY1g5rHg5NkmkEXnw54ZBsFAMbXwtl
5TF+ESudMzhAgSt0/HUOnWD3waTh3nIOV7ibCrJcd2d+YZaNC/vpH1kO2hacFg5q
qfcbuh6nPK8AB5V78JWXtWhisJCDdacNPnp7DXRcnVjDUHka6EtIbqubS7hFXTGr
fJ+0ijOa9Zq4uSkon7raLYtpCWGsojpE52NtpKjpwPs3GJyYsmT2hOtd8K9nrvJK
mXYtR0sVSQRbqdA3ludDpZOPOATZSrLkoENFk54lcV4uzcSeZoIZt2nqN1Wr1gIn
8LubQj0XgatOX8GMPi924AXp2zJauZkUFjIRIkOkf6qYlGHlfVU/OurWQ3wtGKAv
nCXNUfvpYMr1zoMzyELo/PMQ5s3RZ5dr4WVUG836zY/BKrf9PDqmlst3uA+Xh1dd
icbB8PmZIAJEjVVtCkRyzvKna0lznQpVR0cI+QHsdghKeVelxMN9fL/RJxcJr6Nr
7q4mpbzp2L5Mj58iNGjUP2Vc2HowBxCxLSn+cEx/9gdlYjRHd/AsbGj9R++CH08b
N7n/SUKeHag2fC/vXl+scaVZ4CWp2c0ks+HLMsNGeVmzsJFdngw=
=geF9
-----END PGP SIGNATURE-----

--Sig_/9fe4bYB4LSu266zpwWOZ_om--

