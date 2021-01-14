Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5A82F6138
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 13:47:04 +0100 (CET)
Received: from localhost ([::1]:51000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l021n-0000mS-Qw
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 07:47:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l01zr-00007T-DN
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:45:03 -0500
Received: from mout.web.de ([217.72.192.78]:49481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l01zo-0007dU-Md
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1610628289;
 bh=gC1ovgPuxOKwrXWLpFeWil2w3JoCLiNM38TDzKeUezM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=XaLeG1g1oNT/qqm6XuNcQ7+boPLZRqJKEwRQKA6pA73wI9F3eTK25YCaCPOhhpg9n
 p/twSZbugb8AUYcdjznW1gSQQHEn7HMQbylhpdBi+9yikj5RcxVYxqJKEDEMGfvQ99
 ZlD2wk63DLpugRNdZ6qgZtfh6S417DUZJTE5uelg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.5]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MLijy-1lHhMu3VOC-00HiGz; Thu, 14
 Jan 2021 13:44:48 +0100
Date: Thu, 14 Jan 2021 13:44:38 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PULL 0/7] Yank patches patches for 2021-01-13
Message-ID: <20210114134438.4cc5c7af@gecko.fritz.box>
In-Reply-To: <87bldrsncb.fsf@dusky.pond.sub.org>
References: <20210113093101.550964-1-armbru@redhat.com>
 <CAFEAcA8HmqWuzny9bmpXNLtsK7nuRaxPW3j6ZZougn7Y+tX7+A@mail.gmail.com>
 <87r1mnlr0a.fsf@linaro.org> <87bldrsncb.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_9fiou8+KbpBk.x._IF.v8L";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:dfKT+BXIVaVNWYBYnBL3tBn7nX+liLRvnzcnPCctWQP8yMUh8wl
 ctBavBqk7MLlizO3HZxfGzSV3KsywKt5et3PVywIwIFdDt4QXB09TKxLFmuJ/IGK9F7qXD4
 sZhhnth7yQqvhLLu356Yw+Ul1VVxAgydoxk8CsWQlnrUql3saznWRPY0+siUFFk17uxZeRg
 SrvJqXJZe75GlZTZoUcyw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pRDuGPyafyo=:7+PrlmZWV9/1MwZvbv5owK
 6ifvAkQbq2YFUJIfZHDnM0XG4X+vMo3fNFw5+R/nM6uEAUn/riiZfTg/4Vpd2yTIv2UicyMVs
 bMTmEqMKZMi5sl2rLnN4VSiuNRUZPXdJ6tIsStBaJSqAPrbDCc3vi57yr1vYRJhX4piiiieIk
 m+7/wBOYxbjSDmtyNR6YPbAagbqC3e+aeJpxycNaxX0s9EfHJ2qM9g/IxCibxHvhs0vakVQ3P
 ZYLviW/Elm7pMnp3r/ZN0kWU1EOw0a08QMbCWeMl8JTRdyiOnswNF/9C6XD6ApiYd9QLG/WsE
 f8cF9qfpDz4sq8W7Af5lITOHuh/F4hhlRFCv2ktpDj3OFg5P9FART477fDlhfFATTH2DdCn7C
 gw8MugnGRAZPEP56o5XC4zzK5TMod5h5fcNN+pBqJTZFK6rNS1U5j+TaoCthEbiRmzh80UUWL
 ghzdCbLADCEuHdR5kjySRJdoMDBT6rigTMUjoNdwvPWWvUef/lS4Olw28lEBl4p4bRjQ88NsU
 +vSrQzZujUMo9Fr6qEvs2PQ0OnHmfll/oKwvBJjB5ZE1hOjkOFTUvEViNZkvfOFPfI3fk4SGu
 uRxfSUdWSotMAOnTBRTeWtN6+mKuQ4diTuUnfcetz+AizJiQ3ipo64RI6hkrCa+uNrpYYfEti
 TSITabvYPN+zO/ONXvtkf41eKmTFLixpEjOGxIxmALpneTF5tbY1pA3wdxSLJlXp1oylr3pgZ
 KbP492rDrGswu2iVvsI04fllKmQ78o5Nr75918rClw9WHWlUocY87DnF6qNlUvTNZ0ZeR5zb9
 eWHOLtYh6fJUpDxzVBtr7mDQaT0rol9/menEOOZ5JrO4QktrmwjEO60kBwMV7Anl33JyF3teF
 W1xMiZi0GwRYwoDFukAw==
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/_9fiou8+KbpBk.x._IF.v8L
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Jan 2021 13:40:52 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>=20
> > Peter Maydell <peter.maydell@linaro.org> writes:
> > =20
> >> On Wed, 13 Jan 2021 at 09:31, Markus Armbruster <armbru@redhat.com> wr=
ote: =20
> >>>
> >>> This pull request is on behalf of Lukas.  Hope that's okay.
> >>>
> >>> The following changes since commit f8e1d8852e393b3fd524fb005e38590063=
d99bc0:
> >>>
> >>>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm=
-20210112-1' into staging (2021-01-12 21:23:25 +0000)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   git://repo.or.cz/qemu/armbru.git tags/pull-yank-2021-01-13
> >>>
> >>> for you to fetch changes up to 91d48e520a4a4f72e97aeb333029694f5d57cc=
93:
> >>>
> >>>   tests/test-char.c: Wait for the chardev to connect in char_socket_c=
lient_dupid_test (2021-01-13 10:21:17 +0100)
> >>>
> >>> ----------------------------------------------------------------
> >>> Yank patches patches for 2021-01-13
> >>>
> >>> ----------------------------------------------------------------
> >>> Lukas Straub (7):
> >>>       Introduce yank feature
> >>>       block/nbd.c: Add yank feature
> >>>       chardev/char-socket.c: Add yank feature
> >>>       migration: Add yank feature
> >>>       io/channel-tls.c: make qio_channel_tls_shutdown thread-safe
> >>>       io: Document qmp oob suitability of qio_channel_shutdown and io=
_shutdown
> >>>       tests/test-char.c: Wait for the chardev to connect in char_sock=
et_client_dupid_test =20
> >>
> >>
> >> Applied, thanks. =20
> >
> > This broke the check-unit and check-softfloat build task in Travis
> >
> >   https://travis-ci.org/github/qemu/qemu/jobs/754436018
> >
> > Likely because of missing stubs for the yank commands:
> >
> >   FAILED: qemu-io=20
> >
> >   gcc  -o qemu-io qemu-io.p/qemu-io.c.o -Wl,--as-needed -Wl,--no-undefi=
ned -pie -Wl,--whole-archive libblock.fa libcrypto.fa libauthz.fa libqom.fa=
 libio.fa -Wl,--no-whole-archive -Wl,--warn-common -Wl,-z,relro -Wl,-z,now =
-m64 -fstack-protector-strong -Wl,--start-group libqemuutil.a subprojects/l=
ibvhost-user/libvhost-user-glib.a subprojects/libvhost-user/libvhost-user.a=
 libblock.fa libcrypto.fa libauthz.fa libqom.fa libio.fa @block.syms -lgnut=
ls -pthread -lutil -lm -lgthread-2.0 -lglib-2.0 -lgthread-2.0 -lglib-2.0 -l=
xml2 /usr/lib/x86_64-linux-gnu/libiscsi.so -laio -lgthread-2.0 -lglib-2.0 /=
usr/lib/x86_64-linux-gnu/libz.so /usr/lib/x86_64-linux-gnu/libnfs.so /usr/l=
ib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu/libzstd.so -lssh /usr/l=
ib/x86_64-linux-gnu/libcurl.so /usr/lib/gcc/x86_64-linux-gnu/9/../../../x86=
_64-linux-gnu/libbz2.so -lgnutls -lnettle -lgnutls -lpam -lgnutls -Wl,--end=
-group
> >
> >   /usr/bin/ld: libblock.fa(block_nbd.c.o): in function `nbd_close':
> >
> >   /home/travis/build/qemu/qemu/build/../block/nbd.c:2358: undefined ref=
erence to `yank_unregister_instance' =20
> [...]
> >   collect2: error: ld returned 1 exit status =20
>=20
>=20
> Reproduced locally:
>=20
>     $ ../configure --disable-system --disable-user --enable-tools
>     $ make
>=20
> Lukas, can you take care of this?
>=20

Yes, I'm on it.

Regards,
Lukas Straub

--=20


--Sig_/_9fiou8+KbpBk.x._IF.v8L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmAAPLYACgkQNasLKJxd
sljMbg//f7Q78QCeT6CsUF4Db+UyHXDYheVTUUAPyVe7lLZZ5mWhUqOOtwVfo01/
w5Ge29mLuJneG0MoXcuCSxOOZIQcKBQgCvvuxkgouWT/9UbBJQwUo0C2F0fp0C6v
owTp5piqfmCzrtZjcAtBSaEvtZof1zs2HoWHghF4cqq5l8kF+pW5s1fnISXQrSlG
L1W6XHePLMDWeStoqOv/1Fvh1OXSDFFrMbBrY3KZCCfkIZVJZ0V2M4Jmip96m+14
j14b/ZlOBCRlOMQ48wB6Nix2xEEZjEhyzCr3vPcFDNgo2uAWUHRX/kGOnvKtTBQ7
DeredS2Jnh6P3ZzuILIdytTBjTs6//N2kTP2ApJanP69/GBXwnfN+PEbu8KzQ4fm
u4KoBjMNH6eBULTwX2YSXev2uy8eYOKOFc4qUE75A75NsGx3e0nLf563vOBtYECX
hif14E4MeQPDcqFHrAcC1MqE9P2kikvBYBwVNtJ78ub+6Q6aiNvsuJ1pU0M1rTDk
39KxRYvPNgmUG79prOS9d52MCbrvp+O+Fqciw8oCh+9UE/Tkm1XzzYjeXDC0j5Lw
Nlf3WZ3PP15dpwjYB+QpxckOiHmYBaPF426uFjXM/nWzCciyBme5VxozU7aht6Gr
yIcEcrBejKn2ZxPkcZBSNNeR8AbHyYlY/pex+yKIYsrUhp4DqTs=
=tz7g
-----END PGP SIGNATURE-----

--Sig_/_9fiou8+KbpBk.x._IF.v8L--

