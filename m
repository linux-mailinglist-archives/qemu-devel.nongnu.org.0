Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D81434D541
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 18:40:09 +0200 (CEST)
Received: from localhost ([::1]:58260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQuvw-0002XM-93
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 12:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQuuS-0001Xk-DO
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:38:36 -0400
Received: from mout.web.de ([212.227.17.11]:58539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQuuQ-0007bm-JV
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617035912;
 bh=ZdHCYwcD9e/gT0I+TU43Yu+RRHgnaQofzfYa1MuajiY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=ml3xpew69x5QacelCUuaP1CUcXRT58kKnwE6TTs9jg5CnrKCw15aLKxxZ/nHXq4q0
 q5fvDRT3nHF+eqeQfgf/XCiDW/ItB/E2we9MmdqLJAD7oiMRq5r/zsQeDlnI6XkCjl
 4MCpwmQq3IRHR2+VMx3jZ0eO3fBoxQzpVjcL6dMQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.225]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LxfKp-1lgJ2h0Ga3-017DXG; Mon, 29
 Mar 2021 18:38:32 +0200
Date: Mon, 29 Mar 2021 18:38:20 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v6 0/4] yank: Add chardev tests and fixes
Message-ID: <cover.1617035720.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ELT8iTJpnpIby_F29wAOsca";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:BeUurqZXcTLjDTqmZA94CKAol16Imvp+yuJ0YLJTiKFNJJuiwZ4
 BCbFjxIasIrSTmzQ8mONynXVGpGmTS0l6oN/ozBxeBjqKXOZeuzlDkW9Jh2SG6xXBaXdVzo
 me6ARkAenHhY5ONmzZVpMorb+CVcwnFPUqALc0gl6nRD/kMrUhINXxUwEOB34ymufhw3s4k
 H+bxMJCxBQhJFT+86W4EA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dO4mvzbivos=:MRgmow3zdy3RGF16geph8P
 wKytG4LFv18IuvBQRWjV51ZIqjKmNHqc47s8E7EpJr+5OBcf6hSwHPjpjx5gb1sCV26HNqOCO
 pzIOlX47oO+73F6WGu0LQRg+ynlz0OOsaZVdPGAdz7P0QTlsJ7okm9sCfS+CBvbMpcZtQGjjb
 CWQyjSr4rk5QTmPmgN4ewZ9T1i+ILyQ38n/yIzCfDy6ph/uZHLFbkadtL/QkbmBbwk6wDc/Dx
 hYrcRawRB64SN0iq8+kBxyT1bOUqbC5LuSEuMsVLpzUbDYnozAHnWf1XRd+a/WRvPJQeIrfIN
 m6bPj7d4ZrGXPzLJY0/OktEXxsyGWhnUukn3r1dn0FqZdaa1H9fI1ORc2S163GkyHq3rexbV8
 dMo6ZexGFcK5Vd8MHfTyKCFRc1u8wxUvevdWOAN5bKYhJf2uCPz5NY+kqz5YLD8ZvlUNjHoMC
 IuWO3NQncQpzf0k6705ZTwsSVCfaW2dbS8OAhA41sy5LvivWgWOTkZeq6s4hbhYHkQFjMRw/a
 7iNFU/5liQVW7HwxkGzQbXOJDKqPC1Q+htSEYrmyKHlqnFakeYAybyL5sjMxA8kWbGmyHjhx0
 QrZCt0ZtUuNn8qa04xbu811de16U6epWXKtzwB7K1/YXMilzq8dB9hRUx3WaQpEd39q+xai6a
 yK8LURDcDDurgaaih5uNzGOXp1anMMZljqXyXls4yzYOvy7baIyqAFGIcPRlXi0g20HlBlXaZ
 6IAikYES1t41epJGxblGfYciWZFL3e2uw/0OStJG6AJdXAdpA8gBbHEjGS9sGgKM6BaWQcGIu
 OeDdhbhSsxqXl5yqY8eZu9H7/K5yVP+Y2NXLzCcqwle5rdbh+0Uf3S+gOiMk69Hpqps9xeHJk
 mnBtKCR1HTuoSbuQfLwJnXZwanJBWbXnVVSzRfnZ0nY9lSBsY6Cnf22LcPJl46qt7+lYvo5rj
 3BMkUUUtq+297lDz+EAtXme05Qz5knfQ4QylAnJ6odp3EBuh68Q8HIMGI+Nukg47Vk3UvrdNh
 qLie3+8OT0Yf04x1m9weB1Xqm5oSeVAdMYTb7HlrwUlesTcu8AfsNsOv/nfx/miu7fPQSVfTt
 iWcW/L6bOc6qof1BKCKYKbBH6CZN4Aejq1dYFpPr8M8SMmBeUz7wwqu/UFKjPqiTeDEcgSt/e
 zdPETZx/Xrwcwrtadk5+bRXrlm0Zv/wYeQ89QNLD+fvQNeTCmtNU4LEpUH4Uk2VHpw58c=
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
Cc: Marc-Andre Lureau <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/ELT8iTJpnpIby_F29wAOsca
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Everyone,
These patches increase test coverage for yank, add tests and fix bugs and
crashes in yank in combination with chardev-change.
Please Review.

Regards,
Lukas Straub

Changes:
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
 chardev/char-socket.c  |  20 ++++-
 chardev/char.c         |  77 ++++++++++------
 include/chardev/char.h |   3 +
 tests/unit/meson.build |   3 +-
 tests/unit/test-yank.c | 200 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 275 insertions(+), 29 deletions(-)
 create mode 100644 tests/unit/test-yank.c

--
2.30.2

--Sig_/ELT8iTJpnpIby_F29wAOsca
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBiAnwACgkQNasLKJxd
slj+Ng/+P8/TOM5lw4oAmswTpBogZPHT0p2/rQPwiq3iWn53115uvgCvqRlUhj4V
htn++Zx4wQ2vNu1DjommNKHpqR2/AXSPmV4w46XG/u078erSbEZNVZ8yPiJsZKNw
oylLOvLa0RODEGUrJrfFgxzHTRB3xdNF6Ac1J/Anu+nvkvVDDDPLch0PO8XT4FGz
rdrPfvweGt6ONVWhJ9T01h6IUQnjWkPhooZZn9cFpSNVeXpwKdidJDMAnygjswwp
dLxvuZ5ELLAFohFQb8JZNsSOhg283EwwJIrS7A2GW8s6eEHNYw/lX5M5EVByycZC
ho5mCk6YklQ9n7M6ZRcPkxBtGfYkq+QcCZIhN73jUatE8lPBwlKIrlK7GgYXDHzk
o3ZEn1t3DMiL3Va4xk2SfeyxGnjYD/tJD6s/Ikzt3GZpKybmXeqIRvyadiMDj0OF
/dZp8aAB/Amn8U07yef24YNiVPzE1AWsvmiNxKb1X8fQ4sQmLax+SLZaDBNQW5ex
gT/m3GmMwGACpUhaq9DNbT8CzeD0PLIVq8Jd5MyBL9GS5ZW0nY7r79lnMZwvGMZr
yvoW/b31R7ToQY/2sAYoHc78+Sv+1F1m42l2JuQmuAyE7R0Q2VvXN1GXhXk/91vB
hxAVKrtQE0zQBnbyyJWEdaWGfs7UNuiSyK/xdlo3vFYbF4QKC4s=
=At9J
-----END PGP SIGNATURE-----

--Sig_/ELT8iTJpnpIby_F29wAOsca--

