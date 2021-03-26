Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E7434AC4D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 17:09:44 +0100 (CET)
Received: from localhost ([::1]:44850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPp1r-0006gg-VC
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 12:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPozv-0005de-Q8
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 12:07:43 -0400
Received: from mout.web.de ([212.227.15.4]:51397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPozq-0003ws-N1
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 12:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616774850;
 bh=/4ppC/vg836CIIBJIVP50kwcNZhyug7CyD6YMEwkXFQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=sjfv+ZzttnE9IlfaLfvEp7Zoy31T8T0vsWhPhPon8EBkXpTZ8BeGsVa5YufvAsw43
 JffDT5c+qiAavTBnLrD0Tzmxnce+4vcUv5WIy1l9umNjlHTqOi+8GL05FiGgE1eoxs
 udAtsWAa54sM2QMLdqw33zaW1M1Ldzuz6AdZD+j4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lxwjk-1lkyOM2v4e-015FLE; Fri, 26
 Mar 2021 17:07:30 +0100
Date: Fri, 26 Mar 2021 17:07:29 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v4 0/4] yank: Add chardev tests and fixes
Message-ID: <20210326170729.5b4d9f11@gecko.fritz.box>
In-Reply-To: <CAJ+F1CLJawkZv=7pm6D_r0=Wx856Qsor+FeV7zJOUkyNjGfiQg@mail.gmail.com>
References: <cover.1616744509.git.lukasstraub2@web.de>
 <CAJ+F1CLJawkZv=7pm6D_r0=Wx856Qsor+FeV7zJOUkyNjGfiQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cZQNy8.8QT=fS2cKSahFgm0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:3a/6apVkn/vm0Hkjz5Qyg5vYuNjlvtfAqSzMXtxk9sbE2BIdv3u
 dWlMj+r4wHsCJLHLl2Mfknzh9IIMuIoXFIFzFk+1b21dmTiOuXLFD6VdRgQaUgRaOVh6sfP
 CiBjcwqG2Ie+jk1DA0YTWEKmG9ufkxmfC/r07XX4FSWbc10lCzqqV5KE3xk76b7UnMp6QS5
 VdjV56vAhDuCNpJOJkaIA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uTqmvh8anVs=:mQ+slPUqB8f/S8MIs8GEHe
 rQY/ffiXy99SkfLbGakgsd7OkaNJlyyacA4m2XYHBckvIDuyEJ4mw3nGDZDo0fdwYv1x53H0u
 fmTIRRNWmgvRdfEie7ucLYbk9c5UQkWQNoxHSIJVuIb81PD1mOFhmotNpMi8l4ccXXFBYOrAu
 KncgUBibo34i/VPIPfgIfZa8XYxqEr+qHlIwksuWfpc1h2RUkb5gFLBTVyDs6oTMHDNQvpS1s
 qQU5scCN0O46+OI/WZ+gWN92yzBrklQrlMkUZi0DLXNDHZqRCVfXPF5vSV11TTKyHflsqayOO
 6FBIPWUkuWFi1V8cCiVC8hxG9u4/wMaMBNhTSeCIfJ3URxUDs74lPxZgjpQgZCFoPX31gPpPr
 x3efGtyeRQTwtV3hojMquA5LMU+fYld1ozivgPt9XdIYyCxR078TBqVXKxwYy08jM6SRDAVue
 tdPjPY9LILZbyLyyacrP63IB9FYUfXqwS9onMKZDxRrIxEI1o52C0ywyORJuu7SOVpmVx5bWD
 QyINBwWE8zZgTq44KRN+TAImjm8LXx8G3AYI02FkuYbd3h5/v1ASTo3Gqbl2Cqi5Z9JbM3Lb9
 aP28N2TiSRVz4JAe8JFuQJp0l1JFbBvpv+SbsTr3e/Z2sFo4ktizbQ3/G144oSbJ3JH1y7MwG
 UaTobfqYHYBa1HRnWel0ivsyVGU6bxGgIgnls88Q89tu8AQdrjl/kE7lRpKsb/K0FbJuCjZz3
 UmUgI4+Wif0IzPH4JiYpM9O2R1YT6VEM3xAdRAZbw3szNf2CiSlfAqQqY6g6ewOQm7N7HvbP7
 pDhXcK7NgS45zaUVseZR9q+cgGJZ2cAxPe+UwBbUNNAhXAMrYC4vrY7rOtUxyOFJDIMqq4Uol
 pZByAAvaOoUpS0SMwT1EOGIRUY8KBz7ZQK6sAoDsRUV3DfJ+Lsvx9yhuK0ml1xJhDxVxFe0kc
 V5/xooLHANM+G5NK5RNLcGr5MEg+YTng77apzPpmQBh8h48ZbnHOjdMTrVS3Ftcl8Ie72cda3
 xqFzeGvVdxql2MwhxM2LTXSjQwbdGEaWB3qgRuwA9ICSAXDgymxv1mVnKh66vF3RNKP1y5NVg
 YYOfDEos84yM1ghymDyHGmyRtwVdIdlwUsFE84S2LeK3xPy7uHB3odYoLM55qLQbxm27b+eH1
 GBPtQziQ1yH0PwR4ez8cR40sHe+38GZB1ob2n2bk/Ym+H2BJMddYdABMmgcq+i55fMLvM=
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Li Zhang <zhlcindy@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/cZQNy8.8QT=fS2cKSahFgm0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Mar 2021 19:56:26 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> wrote:

> Hi
>=20
> On Fri, Mar 26, 2021 at 11:48 AM Lukas Straub <lukasstraub2@web.de> wrote:
>=20
> > Hello Everyone,
> > These patches increase test coverage for yank, add tests and fix bugs a=
nd
> > crashes in yank in combination with chardev-change.
> > Please Review.
> >
> > Regards,
> > Lukas Straub
> >
> > Changes:
> > -v4:
> >  -test: fix CharChangeTestConfig structs on stack going out of scope
> >  -test: move after bugfixes
> >
> > -v3:
> >  -Base on <cover.1616521341.git.lukasstraub2@web.de>
> >   ([PATCH 0/2] yank: Always link full yank code)
> >  -Drop patch 1 (tests: Use the normal yank code instead of stubs in
> > relevant tests)
> >
> > -v2:
> >  -test: add license
> >  -test: factorize testcases to a single function
> >  -test: test chardev_change with initialization of new chardev failing
> >  -fix chardev_change with initialization of new chardev failing
> >  -add reviewed-by and tested-by tags
> >
> > Based-on: <cover.1616521341.git.lukasstraub2@web.de>
> > ([PATCH 0/2] yank: Always link full yank code)
> >
> > Lukas Straub (4):
> >   chardev/char.c: Move object_property_try_add_child out of chardev_new
> >   chardev/char.c: Always pass id to chardev_new
> >   chardev: Fix yank with the chardev-change case
> >   tests: Add tests for yank with the chardev-change case
> >
> >  MAINTAINERS            |   1 +
> >  chardev/char-socket.c  |  20 ++++-
> >  chardev/char.c         |  77 ++++++++++------
> >  include/chardev/char.h |   3 +
> >  tests/unit/meson.build |   3 +-
> >  tests/unit/test-yank.c | 199 +++++++++++++++++++++++++++++++++++++++++
> >  6 files changed, 274 insertions(+), 29 deletions(-)
> >  create mode 100644 tests/unit/test-yank.c
> >
> > --
> > 2.30.2
> > =20
>=20
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20

Alright, thank you for reviewing this.

Regards,
Lukas Straub

--=20


--Sig_/cZQNy8.8QT=fS2cKSahFgm0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBeBsEACgkQNasLKJxd
slix1BAAtS74bPn4vqn1kutL4WOj0zHEyIIOQkL/LuvlYK8wPlfxktraF70KrPp/
4LZCWl46mQM5FZFyOrCfJRt6H4eikyXFX63z7xNKTr/zuJ6efgObYrFGMR4zhSj8
EJG5ajlq1Ye2IEfNQ6H76bwi2QAZTTfeNSAeKzEu2NM21RqpUeMyr/q64koZIZYz
SiBx4e9OrREDLYsx3FqERKLvLVTXrf6DBSeR8OW7UhvANANhkxDAzVyuEDEQYpaS
c9MZOi3eMgcnXb3LDikKR+Or3Sev76rdQvKIgTAgZ1mfca9RZIbPb9dnerjI9ggj
ieU8rHjO/CtyvEEvsOBcS/j0YLMKEmKkAfNpBQrOi7dhbnbb2mb1zTwTuzHtthL8
227OoyNdHHeUQPcuPCPyhWLVT7xX4NUymGO8kY/ChumS17xak0UN7KXdEuwh4dJu
kn3X1xQ1EcQeCeX4wI32gpgwlOxNFlGiTS4AJfBCKRs8bSiu/az3RWnciRimO0B4
txebaX2sVZrCy5hslR/os+gJFmd4CsaHFY2O8gw7mXm0N2mP+orqPTKt9wgQjxzs
5uH1niOLbp2fDsw2njA61ldddi5t2Vc+nSDDkPs5APW58ceOFZObZtK7DGBLlDFC
Fkw+ggnlq4HobIFRtHFi1WaS+Bi9d1HWeePG3fE7FslQLpZgQ+A=
=EVU9
-----END PGP SIGNATURE-----

--Sig_/cZQNy8.8QT=fS2cKSahFgm0--

