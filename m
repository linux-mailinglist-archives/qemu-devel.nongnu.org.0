Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EBC34D799
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 20:53:08 +0200 (CEST)
Received: from localhost ([::1]:50386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQx0d-00035Q-BC
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 14:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQwy3-0002K9-PI
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:50:27 -0400
Received: from mout.web.de ([212.227.15.14]:48479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQwy1-0007mZ-JX
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 14:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617043823;
 bh=MFNy2bEDiiYfwQvhW9eOSgmRL8P/BQYjx191CuytEZU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Fq0P+JUxJ7lXDXDdeowVfTSrol/jHVwf3NWuI15dj0o9CTZ8MkCuGDBQBfMzxkZTm
 kVT21fGzbDIS5HWGnHrYG29FYjxv0rv9qvehVfE9X7wJ7jhWNpjNxAE84ND+rJbcpf
 So7NYHqQk59dzbZQ9EhBNy0fIkfDacOpm/0GL29c=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.225]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M3Spk-1liktq3lbc-00qz5S; Mon, 29
 Mar 2021 20:50:22 +0200
Date: Mon, 29 Mar 2021 20:50:13 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v6 0/4] yank: Add chardev tests and fixes
Message-ID: <20210329205013.24001609@gecko.fritz.box>
In-Reply-To: <CAJ+F1C+hq+fop4cBEeNeRYj8qi-bAmvH3myEoVn2cUiC4ttCAg@mail.gmail.com>
References: <cover.1617035720.git.lukasstraub2@web.de>
 <CAJ+F1C+hq+fop4cBEeNeRYj8qi-bAmvH3myEoVn2cUiC4ttCAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NANMYe9X7VHiy6Z.frQ4=4q";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:hwuVr5hshGiOlJ7ORrEfiECHMQ10Skno8cuK869pzs7G/JIMoTg
 jOed6cpVnILJHhXDukMlMMumR9SXP0Dp6DE8d7CF8lBfJjU7ipXfVY9DAiXsyBmqgCjDso0
 +BwsT9QfFnsWOOdx3+41rmkKfu65aKMWqG+5Tb0WetMu9I+EawomaHhbQejRZnsT1DkXMJK
 hVK1ZccU0cOBaGfIKuy3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sjHW9CdLILw=:elQZ4doMo9Ngw7oIfMDMrG
 SlfWxF7qxgJWvc08rEKD0fZ/p0XXRENRDkV09tU63p8SKrpKb/HVUAA74q1Ej77ieooXm19L9
 qyi4gEZ8wIQxuMMwJMd9+J8zh2VCcizfIgegpHn3GormzYWCksaHxq7pQr30rkmWghPwyqfvJ
 DDg3K5bCzlKZiCZrO9Y5SV8o/bRYmK7+Q7r2FeeBAeIaOS7KDbMZMbKgM/DHnB7y31ERLLdi8
 Nz1dWkVDCq29nW685TpNDvVGu6MH6w2izGHh3Rxr1g5jlw9nOL1VDgLVLqnfaT/4a2VyhKso/
 Id9htnNxoWvzuZsVjiAKVfyCc8gA49AOMFfz8+aPPKz2m15OdG0nVo+iZHbJdQ42XS1KCIzjc
 OMt8WXTjkctoPtF/0IodXfyderMHMKkHsZHIWrSRK942DfPgkqjXXrWHbWMNAMpWnZWZLVJII
 wvPISrLu9xwfJCbv9q8hTvm9+QQAzdFSMakIeWm5KI6oLfXaOFg9LNBEEnJGWeb2dsViPk7lN
 xRxEAdA4VQjgp97XK8HVzUdtnjoI98OagyELdKu9E0NPHX4hF3aZq6GusQax+0HqpwueXqXKc
 UnaSDwrsgvrXE8tgLnvfzSjDDI2W6LCtj03PLBNELdeZO+Rw0HZY1+/3FX0nyxQI1AsYCEdmA
 hKwcN3Cq7dqqMpqCJTvoqh3sIEU/5Fqmvb6rZQd9/Ji7sUTtro4zpZF5pdIPlyGcW5KJzveSL
 EXAuDsExNA6evOxrsM9mJp3V+PrRbnJe+ABoRgwWSc2PR8wOOurG8YYH4n+ctb3CDKob9uYJR
 PaBSedBNgZYp6/6OKRGwOfdwFv8++5FoYfmxpeS0yXl8t8xeAcdCe1RWbp/AqT+0y2ds8cTzb
 Bo/2Tr8A1m0IkhkiipAgygXOsBs/xWWDX7FtignY1Lqf5CWWsHTX1EHUjmTxVAhSrkNZsh+w3
 ngHbYVCP95dzGAQhoDzJaynzp0E11JA0LFCwnSN1oSRvPnEQ5PDfFfminkhKQmoznxv3+6h03
 OVsd6imDII2H21HShUzz6rMiNgD3FPUHouN5VZNrTPLDrBo7ciWNfEXqa4L4Z3IQWbKAxsDH1
 lVvh7HURtaGxFSSjyjVK1GE8OfhG//yMxT7WNkEtTq1alnPJT5jXR4MY/Z6LdzDNSv2JswOvA
 05j5kXuTLrE42TDAZ6KycKy/bny2fuh99QMnydb4YyUpb3EapQTnNTSkbC2gxJevv8HHE=
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/NANMYe9X7VHiy6Z.frQ4=4q
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Mar 2021 22:19:17 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> wrote:

> Hi Lukas
>=20
> On Mon, Mar 29, 2021 at 8:38 PM Lukas Straub <lukasstraub2@web.de> wrote:
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
> > -v6:
> >  -test: (hopefully) fix test on OSX by using qio_net_listener on the du=
mmy
> >   server socket so new clients get accept()'ed properly
> > =20
>=20
> I can't see the change, patchew neither:
> https://patchew.org/QEMU/cover.1616794852.git.lukasstraub2@web.de/diff/co=
ver.1617035720.git.lukasstraub2@web.de/

Oh, I forgot to git add.

> btw, could you also fix the checkpatch style issue?

Okay.

Regards,
Lukas Straub

> thanks
>=20
> >
> > -v5:
> >  -test: fix memory leak
> >
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
> >  tests/unit/test-yank.c | 200 +++++++++++++++++++++++++++++++++++++++++
> >  6 files changed, 275 insertions(+), 29 deletions(-)
> >  create mode 100644 tests/unit/test-yank.c
> >
> > --
> > 2.30.2
> > =20
>=20
>=20



--=20


--Sig_/NANMYe9X7VHiy6Z.frQ4=4q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBiIWUACgkQNasLKJxd
sliDOQ//ZWMS5IOVJMgkYObJpP9UgzDObrkQS1zimjS/uj4gVAXICd8BCAUzRMED
p5h8qlOUBUSflA4+GrgT84VtAOxsItTrQvuIPVkGNMhRxFR065V2ReFEOR5UV7Ec
9FiwcBbnZklyN85TXfZ3lzVn3fJF1bFv1wRtCSf/E/iTDyU+2+3tbDDB8L8OKSdf
dKyYQA5ilcHD1UgHzvwwGb4ErT4QS8iOCKMvZTiA2fLhtXgBfwSIdhijmDx4hd/c
mJAC0rHN/ZqE5+hvxeuuNrKm/hnBa1iJ/1aL3BH0JFWvWAjjPZB1GQsDxdBPsHBM
lOsG5NiTCoNBE9DUrH8lQr8SeQYn71cGfmokl69MIizyhu6WJJcEzpBbZAVIEskr
OsrGs2VeE0RivR9gySfaSV3MwbSGF7wa5tA5aVT0+I7RSYs2HXC2wwdlpuDaMqcj
EBhI27VusFHL/KGAlF9xVuIoJ/Y+zPGuV0H+/wdc0YnVuSKU03FjO9gXNSulZWH0
7kRl2KRzjVRY6EDnQIbfxuQYdfnDVBkRQVjr7SFq68w1HEiFWIsM+5o/gICLD3Fy
xnnO+S6wntWnbTDXWcGXDfTU3Je+wBJNWCipO5dAnS6ZJ25Pez7GtnXYf1Rp1hD8
T7Yd0mpuKQ25CBI1RJaq1Erh6MGUgHV5glOzLF45rIzzwOFNPhQ=
=L0AG
-----END PGP SIGNATURE-----

--Sig_/NANMYe9X7VHiy6Z.frQ4=4q--

