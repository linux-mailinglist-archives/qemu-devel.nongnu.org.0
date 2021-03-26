Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BA034A2B4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 08:50:27 +0100 (CET)
Received: from localhost ([::1]:43654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPhEg-0003jF-Bh
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 03:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPhD7-0002Z1-1g
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 03:48:49 -0400
Received: from mout.web.de ([212.227.15.14]:59271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPhD5-0002UZ-1F
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 03:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616744922;
 bh=8jxO6jwe2V44xC4hrKRUt1glbNfJcPa0npfSZgNUmLU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=DL2+mqp9Cj/FbuSFKzVgI8nIQura5ZC/k14OaeXcshlIPkr0ZLrokHLzYnTLzm7su
 Xc2JRmHS9ffhS3+rJzKWItz9jLL14MsKQSGmZJ5nhfhtW89o+MGhh2wtpz1aym25Wp
 wWjnteRHP6BIos6c9TjnBd2HVX5HPJBKxnx5wEYU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MPYMT-1lL0Ey3YuH-004mki; Fri, 26
 Mar 2021 08:48:41 +0100
Date: Fri, 26 Mar 2021 08:48:32 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v4 0/4] yank: Add chardev tests and fixes
Message-ID: <cover.1616744509.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ng9W1XYo=tr7kIbBqrf3BQ=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:klxiUUiGDrsnQHN0ILIMXzfxT5X11a3kKYT3qznMtKk66FX7qJZ
 JTT13Df1tejszq7HtlRss5Hckm/msWg9ctwO2cvaexsCqAEC2/h0op8GpW7L9p2sVFn79Un
 yxMe2vHAJbx6KBqyicHM6sK6C2c7vobWf72VtA3W7nm3ZKWeD7aVk5RvuYOJOajH74qeIBl
 vyza1xSmzsV/mNGFulzFQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zlx2S0FLRSU=:9el63ngpHhgE0UlTkFSahT
 kRLg6bB47rvy4Iw9a/2kDVtnNrtGgWmEhApuB0k+ZQFaZfBfWRgbpVZ+MzR2goSh+idcMeIh1
 Zn4vXORr94w+QAcMP4A0xJCTZimqKkN0YLgP9IBOGQwwx8THjay2QegPpCt5en05LvAyYineU
 +Hq+50gwXhFmRVR2rxKAL3uzgY4t5nYkl4w3et3DSp/4uuN/5HG+3kOl5haNcOFDwP74xEy2W
 l9UL/RP+P8tNx64AuK5qG9aHJ9/3nY8zaLMJUIeS2QYJeF1hKaYokGUMf+sU60EW74WgdCTdD
 1KSwXJAgJw25MrnpsOE/CNy48KrIUWHJ77toFH2dV6q80ktIqtLOjNHrsHihIuD4mgw9GwIfc
 ApjoYp80STdwASLbBAqmJ72nSWtc8lvf6fwHG2+4mcDOT4s0ih5APSIICciWS6B6fxLPpDZZ4
 W3R8ivZxs1tCM3d/otSGCDe+MugcXDkpSuEyeXDkGdOeKI7WMqoZdFe44Kqln+UjSEp8H7FTP
 Cz3X+Dbdn1mrgxOxVgB4SroHtJaN2KGpw3XnbiYnjQqfpNh4K1m+xsXrHRff3/CV+hlJMoMCD
 UCZADqI0a0AyTJgtJp302xe8/u1UjWcB++S8xqTNSTp/fZCJD9AzwbctP+3JhUuLzt6xsxPyn
 4GbZ8/8SxJH2m+FlDnucmSVGXRyVJZk+r5rldNydvbCeAk6zl8Zzuj0YaKbPWXDZPbgE2P6G5
 lmGFnj7UC/LLpJPBp67ai+v9x9grNb4ngJApxGFVlAtH6K31xcWZ+sqzaNVFOQLvPIZ3qPRCv
 QeFz29N92zi5uxRCkRkOAwVOeN2FWaUP/90080ekMxUQLfwPLoj3CufznbLT4UG3w1UXBGLuT
 ywqYFWvD8YWWORHZ6JlsTw2xk1/1SghSs+o3MVMS+Z4l0oKEOZ16SvW0YcfkXsawsHPV/goyR
 r5mg0R1R1Dv8VhmBIiPVfo37en1Wt3K4xuQEc+8DcfjPt9y8jb0LaPU9IbzgIxnBbai2Mjyj9
 SFIKPAqLNK2et6nYsjqeQSreXxtCn7Bmq3Ry7yiatuYAlsUkq+GPB0xa3tKG9De3eFJqUrBM5
 lH8sacyIUm/vi6Sj/xfPm5gno5i2ZJZGyyl4r+W+rejddVM1wQeTuRBocObt5vmg+i9BXTajH
 9+nlQ3eyNZKMCwpSvXBxPGmqOcHzJQFo9mLtPJ8EW/3C1aKslGLTFEOckDXNyxZxldB5Y=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li Zhang <zhlcindy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/Ng9W1XYo=tr7kIbBqrf3BQ=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Everyone,
These patches increase test coverage for yank, add tests and fix bugs and
crashes in yank in combination with chardev-change.
Please Review.

Regards,
Lukas Straub

Changes:
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
 tests/unit/test-yank.c | 199 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 274 insertions(+), 29 deletions(-)
 create mode 100644 tests/unit/test-yank.c

--
2.30.2

--Sig_/Ng9W1XYo=tr7kIbBqrf3BQ=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBdkdAACgkQNasLKJxd
slhN4w/+Io3ts2HxnzXmCZp0JLL7Ck6pTguklAk5hAV2ad0aYK3HClqkPVqKxidg
Kpce1++ENCa7FSa/QwioI1c9bkdwo76Fqv1EEn7mBC3KycVeK4XgEg7n3C3vG357
WwOPnbBDcbsyqphi9U7+3SNVFtI/B74oQhhzSaosSEvExxafKquEHQ/S+JVoRsST
O667RdG0KZ4RQ+ADHTtAAc58/4FQ3d9Ker5u4/YY8K0bp3tEnDoQjjoq6Z08hewX
iu4LHd+j85ghc3qQJtdgWQ/k9MnkYpJmpPS3eByTbPazfD/P7Kou79WNaMMBMElI
2DKyy/q7XwJxhb4pCm8NzWaYgjji78u36XMJkN28Vzkidaj1D572DrXwv7VlfQth
kOGZ8YJ9kyPlLC3hIXm+ArZLwU2MQwktiSpeQL4yiC0Pit4XDr0vc0osU7cmC2lW
dE8OH5BCduWwdbmzgT8h+eLzL6TDFtJ+Ie/T9REZqaC7Uf3saGBaEwpLlawXTQA3
hzQHoLxP5BV90CczkZjadm4P+Ue02viEsIq1apiWy9lL5GAsGExocJwN9n/D1Vi1
Kvf9Z9U/qCPzyUTDlE1so68iRg+hOTGp71IYisLlmjycI7NXLg6blPWHGuaMagQJ
zYx51wXVXq4ema7j4bgaiNqlMrkQ4pyTTZvL3QXI585w6rj/X68=
=BWmj
-----END PGP SIGNATURE-----

--Sig_/Ng9W1XYo=tr7kIbBqrf3BQ=--

