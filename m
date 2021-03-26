Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AE334ADB0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 18:37:01 +0100 (CET)
Received: from localhost ([::1]:58544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPqOK-0006c8-9e
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 13:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPqMO-0005ET-Mb
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:35:00 -0400
Received: from mout.web.de ([217.72.192.78]:53011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPqMM-0004PN-H3
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 13:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616780095;
 bh=tY+Y1CZccxwc66KhknL4eCbEW7eTwsmx5yqoAYKKgsM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=BxtIVyvXC6oWjPCjttfwA36mNdwiV7i3b9FiLhoA6Y15c4JvW+9xc+djhI+cIMax4
 Fo7ooFeppopY2teUhayQJohSdTHO5ImMjDS10VVhjAdYFUjrxYzGGMKPlM5sLbZ7LV
 fTc1VI0pk0GKZAT9Af3+V2GP80iXoxnvdz69/8L8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MoecF-1m1f4I2qOf-00ofzc; Fri, 26
 Mar 2021 18:34:55 +0100
Date: Fri, 26 Mar 2021 18:34:54 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for 6.0 0/6] Yank fixes
Message-ID: <cover.1616779714.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fumW8_2I61ai=bsZZm3_oFu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:R/7US28r90bU/Xc/nUOHv8Y4b9n4CP9h0rnU1/TV71AMFkSxnqQ
 di7m0M+ycuN+uT5INQiHouZgs4d3YHAFaZ2Ig3c7yVtPJ6ENlW9+kb/jccM2msOfjCOsuWG
 0/iTw3ykX4i3+fW8Q5HkYpEqG4RH+sr1M0GbsjWLQEgz9X6e7Y27bLTYktpLR7EvEOdC3Vd
 Z1vFosyU5LMRIDfdZaPMw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7esxPrI2wq0=:dRsWmJLRQdswDy2dn8m5G0
 0F3uvw4EGVKcEBa2hK7RkUmhhslXKJv3NSdDuAJR929waduIergAdzwhwvPSYPBsl3uSTPMQH
 oC7rlOOYiy/OqzJfysNhRciOSdsioJvMTE+lGysB5QArABNSGDpG66B+rXWdy+MDkjQC4+ZYC
 X0hzzFdVXMA5RDbOGI6j5RozdbCD/Xc1MAD0MeOdTP1LQvWQPBMzCt4dsoX6T3BeqlJBC0xsL
 /PYRExgVbT5RWJjFRkMYKzJmpKKUaZQj0Uy5gSxtP0L/I7TKKXrRY1XCGPtHBPuWnElgT9c2G
 ZjmlzHXg4rgf4ET7e88k9wlriu8A2gY/BYekRqWMqUWswOKT+lRjv9fa0crtxSqqvQ3AnNAin
 NR9k7Vb6aEW3cl9ZjC8S66Y6hBxLf/OEZ8Y0kTMCRrRPSJVPSHkIqbsQV9d0p9x2rO2+Ed2Zu
 VccLBSV2waEay749k1kAdse4t2zl/346cnLi+zbUc67dlThbUgrhzBSw4tjjMk0/Jw1TDQDEz
 HRGCzVIvi52p9frQ+p2EJHqaE/MKFGhu5GqhUqynf/wjB0umcbMOVLXpTrOaoZ6e6E3BTmkAQ
 OQlU/7g0DqKbEfCntYTK1rISfTmGrFV9XWVsD3pxRSoM4qoRah85kZAYAOxHmg01elY2tejr5
 uCzxYdlBo+yk0dYD5QSS9RQ9+VyNQ+NR7zKoFLaFP6I8OA53ILW1X9BANBysRRBJkf8gPX6Bh
 PXM95PVlWtm9PnnvXE9x/nT2NaYMMf7bthhAg/RRNpzL1GnDnHZ3AEIo+Xfaq3zA8bcf2R6OD
 C6KxhKvoAW8DZy7MC8clEdtP7YtDOcopP3Jo1v6ye+O80NJ1kXnETp1PvDDMIl2LU12aKvY9e
 ukXEtc0EMbO4ORQofCl5magGDrRG0O4PQbBSDJvg48WheyiXFQJIL+zFj9TBI920jV9zqwfGv
 XyiwYwua4++a1z96FG5mEckS5wD/Gz1ufSryDndxdIkpq1QlE5O5XR3hLlYic6ERozh4EmW+2
 7KMgN+z0Dlw4t4iGSQxOGhemfewl+nkHOzqnpebIqDbpdr96d7s6GZW1mGudni8x+Tri1Ri+T
 WCj7RpBnPsU6TRuw7YntWL+WxDivN8paxGlWhiutPyVpihNjNZZ6eQoa6kl9+T+r68Ldpq9cM
 2NU6faO1l0+kXVtTPSQaNdfBSsujgBB4eadMDmLxRJw7D3UVVpKXW9uvw9fbNsyo7td9M=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/fumW8_2I61ai=bsZZm3_oFu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

The following changes since commit 5ca634afcf83215a9a54ca6e66032325b5ffb5f6:

  Merge remote-tracking branch 'remotes/philmd/tags/sdmmc-20210322' into st=
aging (2021-03-22 18:50:25 +0000)

are available in the Git repository at:

  https://github.com/Lukey3332/qemu.git tags/pull-26-03-2021

for you to fetch changes up to 7c2f1ddcaa1c97462cb0b834d5aa7368283aa67d:

  tests: Add tests for yank with the chardev-change case (2021-03-26 17:12:=
18 +0000)

----------------------------------------------------------------
Yank fixes for 6.0:
 -Remove qiochannel dependency from the yank core code
 -Always link in the yank code to increase test coverage
 -Fix yank with chardev-change
 -Add tests for yank with chardev-change

----------------------------------------------------------------
Lukas Straub (6):
      yank: Remove dependency on qiochannel
      yank: Always link full yank code
      chardev/char.c: Move object_property_try_add_child out of chardev_new
      chardev/char.c: Always pass id to chardev_new
      chardev: Fix yank with the chardev-change case
      tests: Add tests for yank with the chardev-change case

 MAINTAINERS                   |   3 +-
 chardev/char-socket.c         |  41 ++++++---
 chardev/char.c                |  77 ++++++++++------
 include/chardev/char.h        |   3 +
 include/qemu/yank.h           |  10 ---
 migration/channel.c           |   6 +-
 migration/meson.build         |   1 +
 migration/multifd.c           |   3 +-
 migration/qemu-file-channel.c |   3 +-
 migration/yank_functions.c    |  20 +++++
 migration/yank_functions.h    |  17 ++++
 stubs/meson.build             |   1 -
 stubs/yank.c                  |  29 ------
 tests/unit/meson.build        |   3 +-
 tests/unit/test-yank.c        | 200 ++++++++++++++++++++++++++++++++++++++=
++++
 util/meson.build              |   2 +-
 util/yank.c                   |   8 --
 17 files changed, 337 insertions(+), 90 deletions(-)
 create mode 100644 migration/yank_functions.c
 create mode 100644 migration/yank_functions.h
 delete mode 100644 stubs/yank.c
 create mode 100644 tests/unit/test-yank.c

--
2.30.2

--Sig_/fumW8_2I61ai=bsZZm3_oFu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBeGz4ACgkQNasLKJxd
sljljQ//e87q95Rwn0o2pisxCkcDgsKl5Lyo9SPVLKJNqijhm9CmKL7IcEPkVDCm
ew5hjO+ZiJBmdUbGk7krDLPraw6NQ6Fd42zRvw4nJ+/19CehfXBYUGSVA00hy0M+
hiR2+jXUtRjD9yccFfGHfDSYMvfp720kuVvQUkA4j6U/OSWyu0UsmwNCl1Q2DpVl
Y1AE7Sit1p2+jgr+mMmlXEjtXjBrD0VTq4Ah3y0rOxB3PCTmjjM3BAusOG0akiLl
m/sJpoLvKLbbzzG3PYEq+X7+JxgI7xHk0JSBrZbADINmchJXXWskbrPrkuO918lo
tPcouSJH2o5ja4PrNbqXap3AA8r++3NTwzdU1JBdDkl8PLJD59P+qOV6VjLI0ohU
+xNWa/JTUb1F5o2G9dFfkCelkmS1RXMtzR0iWHlYQ4uH8yy1NykToKL7WN1a0l/M
DIrg92yyRhmDGdQi3Ke8NNoat10Vgu7akUJbfUq7VlGJZw+dHWp7f8OMwNlzwBJg
HCp9hGsIL7jv+ltiPqoiLlJ8HlEVqI7MlguRcAYk66nw+n0q4a9i8P8JCQ1fJdpd
SDr7THHlBPz1OK9Qdc7/u30rhyCpDC5pK48s2dc8o4kScRfIPjPEG4cgNHb6nJs9
FbgbvewVLECD2xKz/Wzp2I9KIHyCKFtrxtTHZxRwbhWSROCWudk=
=MY8E
-----END PGP SIGNATURE-----

--Sig_/fumW8_2I61ai=bsZZm3_oFu--

