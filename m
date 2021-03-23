Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E37346203
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:56:29 +0100 (CET)
Received: from localhost ([::1]:39944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOiSK-0005Hz-Ja
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOiQs-0003bP-Ml
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:54:58 -0400
Received: from mout.web.de ([212.227.15.3]:53481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOiQq-0004xk-Jb
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:54:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616511285;
 bh=i28hjSeTduXnH31KQTbxggzar78PQbdw/73Xh5mXg88=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Fu2jAMQv0S58KwP5CmW2Pd/5XPy83m9axzspbvvY/zXDcuXsELA8hdmm91A57sS4K
 D1qFLq/W+Rep2IOZ1if4A3Cofo1RxpcVJxj64vHqxI+CDqhSQ4lQZ3OcTZGeB4M2tB
 6w7NK4aepTY9bo2TusIrApulvRb5I6O68GY+H4+o=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.81]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mmyqx-1m7iPi2d4Z-00jehy; Tue, 23
 Mar 2021 15:54:45 +0100
Date: Tue, 23 Mar 2021 15:54:22 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/5] tests: Use the normal yank code instead of stubs in
 relevant tests
Message-ID: <20210323154935.521714df@gecko.fritz.box>
In-Reply-To: <5c37e536-14bb-37fc-8dfb-2d776f763c63@redhat.com>
References: <cover.1616368879.git.lukasstraub2@web.de>
 <950007e82e19e75831b29fac07ab990c213d2352.1616368879.git.lukasstraub2@web.de>
 <1fc6eff2-a8e5-4ae2-96a5-1b30325dff81@redhat.com>
 <20210322083545.2c36b5a0@gecko.fritz.box>
 <52d508d6-284c-6b36-62ed-f25081e63cfd@redhat.com>
 <20210322184800.5ead0f3c@gecko.fritz.box>
 <5c37e536-14bb-37fc-8dfb-2d776f763c63@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2rUkiD1Y/2JVV6uMLSo82pT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:iEdDB3c3TcF1KaWXS3hDkRjI1e6fkTkYpe4TyPorHEnDiHRpWFo
 raaxSe0xYdrlMPhQCgpBwaMIsMIAj90rh5dvhZVpyTyd375WjpIFQKAyD91Cw5kfHP+gjeq
 gZUIwR/iKnfkoV+NJHWDmXOfaqTL2eHk/Hll+t5xaduOyDx1mOFZQHFmYKBCbmQSWYJEESc
 t2DCWN2or24b2eUUjzRdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2H3c20XxV4A=:exb0dyPRWmI1l4aby5pBMO
 cXXp6JSDhQom2CNsY9hqRpLTu4+LQmZTWfp1i2xaOimOEzbN0IjGYPcJQRfzO/1ayifRha8WT
 rJ8ZJKuXxQyOziy1HOUiPH26P47e2bHAaZsHrPxTBQT5e6duJ6x6zlWrMgGauXQeDz6thJZr6
 Fza8EIWdl5WgSH98/EKq38Otp8Euc1/O56g+dSMjOh/cIMtIgR3Xv5ZecpDojYBLeKhRr6u/N
 Ntn/ca4zRjMr84v7at0uNZU6USjmkMRxds/Wk+FLQmhOGQAaN1z/gsr3zpmYLxfPkS2zS1l9N
 Em0ZsgrYzTTMrI51uMFQt97UHcgOEwl+GewI5ovRAu5PoBqRd0/rUcz/uUTQZVx6Vz8tgxS/1
 ylTsrEx3+v/iAIx43MDXNs7o39Zdtir/BsrK5gzq7ueKlQ9m5YZVM+O3atdjIbknJZHkdXjWS
 cr9NVFpTARNqXSFEs8N6JNHgVmJ978tOU9OMQqnbznZjq76Gat126/dSL+AmGRMYS750t2sFm
 A7Pn7czNu6tgwQDOJCm8opB9MdjITePSrV9qZj2JmklNIHYKEjvUb3qwlJaae7tzPrrRq5ufN
 KBGlzTLia1pCZugRc7OIKfnEGK2Z+gfR/EsFdcVOrs9+7wTd5psQotpRoUegjtEXUMlLuByIH
 f0sVoGaUHl3IueGM++eCXrmQ8cMKwlfaB2g0HQSSx5vmuycmr/aNp5K90lsJxUJB4+bh1cIfL
 5GfdRrxmRYq9dFxcai7TFLVoOtzNZKMOBhpK0ZWqilE3U17u9GJu5iR4yngO52ZBvZJyCAwfQ
 PEnCJE7zBrz07xKdhkcoBuC714+CifTxvdwEtyq+31iZXmrh1j6yzVkd/eaf+pSavWD8l9wwU
 eJTASzQMoGyVaw7u0CmGSMjl0PWLDM6WDCcR8j/swFskB9mtX181+mDBWZIyZq24st4fYxwce
 hMTMXYYjzyOoxLriO2+AADOjEJN9cCcqVp4/mtRDbaRvsKKKL101y7xEdZa0D+X/JS4vHI8KJ
 22LdTIo/IGCdZHzkH0oPaZYAoLtwcNOOUiZMIdHIdwpluhc7NGR2+EVjIG8I4E6/PEM232SS6
 4eDPSt4cgBXZyN1bD4aY2SKqusEIERf6+chSP4nPs8qxPr+2O14biYBZg3wg+qS2xaLUiu1oY
 mFpISlHnEfR8c7OopG5gl+16z2BiqXkWoTdnkGYJt2v0z3n1YIxtT4q9LgMqO0pbEBXqE=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Li Zhang <zhlcindy@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/2rUkiD1Y/2JVV6uMLSo82pT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Mar 2021 05:46:24 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 22/03/2021 18.48, Lukas Straub wrote:
> > On Mon, 22 Mar 2021 17:00:23 +0100
> > Thomas Huth <thuth@redhat.com> wrote:
> >  =20
> >> On 22/03/2021 08.35, Lukas Straub wrote: =20
> >>> On Mon, 22 Mar 2021 06:20:50 +0100
> >>> Thomas Huth <thuth@redhat.com> wrote:
> >>>     =20
> >>>> On 22/03/2021 00.31, Lukas Straub wrote: =20
> >>>>> Use the normal yank code instead of stubs in relevant tests to
> >>>>> increase coverage and to ensure that registering and unregistering
> >>>>> of yank instances and functions is done correctly.
> >>>>>
> >>>>> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> >>>>> ---
> >>>>>     tests/qtest/meson.build | 6 +++---
> >>>>>     tests/unit/meson.build  | 4 ++--
> >>>>>     2 files changed, 5 insertions(+), 5 deletions(-)
> >>>>>
> >>>>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> >>>>> index 66ee9fbf45..40e1f495f7 100644
> >>>>> --- a/tests/qtest/meson.build
> >>>>> +++ b/tests/qtest/meson.build
> >>>>> @@ -234,9 +234,9 @@ tpmemu_files =3D ['tpm-emu.c', 'tpm-util.c', 't=
pm-tests.c']
> >>>>>     qtests =3D {
> >>>>>       'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tp=
m-emu.c'],
> >>>>>       'cdrom-test': files('boot-sector.c'),
> >>>>> -  'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate=
1,
> >>>>> +  'dbus-vmstate-test': ['migration-helpers.c', dbus_vmstate1, '../=
../monitor/yank.c'],
> >>>>>       'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-se=
rver.c'],
> >>>>> -  'migration-test': files('migration-helpers.c'),
> >>>>> +  'migration-test': ['migration-helpers.c', io, '../../monitor/yan=
k.c'],
> >>>>>       'pxe-test': files('boot-sector.c'),
> >>>>>       'qos-test': [chardev, io, qos_test_ss.apply(config_host, stri=
ct: false).sources()],
> >>>>>       'tpm-crb-swtpm-test': [io, tpmemu_files], =20
> >>>>
> >>>> Is this really necessary for the qtests? I can understand the change=
 for the
> >>>> unit tests, but the qtests are separate programs where I could not i=
magine
> >>>> that they use the yank functions in any way? =20
> >>>
> >>> Yes, it is necessary. While the yank functions are not called in thes=
e tests,
> >>> it still checks that registering and unregistering of yank instances =
and
> >>> functions is done correctly. I.e. That no yank functions are register=
ed before
> >>> the instance, that the yank instance is only unregistered after all f=
unctions
> >>> where unregistered, that the same instance is not registered twice an=
d that
> >>> the yank instance actually exists before it is unregistered. =20
> >>
> >> Now you even confused me more. Could you elaborate a little bit? If no=
ne of
> >> the functions are called by the test, which part of yank.c is excercis=
ed
> >> here at all? Could you give a more detailed example? The only thing I =
could
> >> imagine is yank_init(), but that does not look like something we need =
to
> >> check in a qtest ? =20
> >=20
> > Oh, sorry. I meant yank's concept of a yank function here. It works thi=
s way:
> > The different subsystems first register a yank instance. So in this case
> > when starting migration in the test, the migration code first registers=
 a
> > yank instance. Then, it registers _yank functions_ with this instance, =
for
> > for example to shutdown a socket. =20
>=20
> But these are the qtest, separate stand-alone programs. The migration cod=
e=20
> of QEMU (i.e. the code in the main "migration" folder) is not linked into=
=20
> these binaries. Doing something like:
>=20
>   grep -r yank tests/qtest/migration-test
>=20
> should give you zero results. Thus it IMHO does not make sense to add the=
=20
> yank.c to these tests here.
>=20
> Having said that, it seems like the qos-test is linking against the chard=
ev=20
> code and thus might use indirectly the yank code there. So you maybe migh=
t=20
> want to add it to the qos-test instead?

Ok, now I understand. In that case it doesn't matter if full yank is linked
into qtest.

Regards,
Lukas Straub

>   Thomas
>=20



--=20


--Sig_/2rUkiD1Y/2JVV6uMLSo82pT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBaAR4ACgkQNasLKJxd
slgmrA//fd/PqUchiggYStBzEV8jWmBVfoM7ci8t5tUPI5p1x96kaZvd2mkO63Ct
bx6dUbjj87o2eUb2o79rIeTaYkHNIOo59GiHEE64MMAEdYe5s2HKEbaYeJN/E76d
j6VjB5FzO5jb3qCiAL1evPL9wwFKMy95p6Hw/k+yQTTCFsYFztF+fuQes9HU/WgU
hjQkx969Y6MwMOCRMRy7/Das0d5dT3ahb+c4ckA0Vy+g53Q48cSbk7BEEuYA7uxR
yLPDlF+39FVu5NNkKt1lAGRK88f++KnFaRvemyBT5ZUkB3lQs1BQ5BPqKLgpnO9k
EPAOApcb6ILYEb2dzYkz8W+6Q2FnbJ8SajpHn0jnMj2zxcyPwbiuuMQd49pq3iXw
rI/4Z6CxiFHZ9+GbPETiUzkfnghsF3F0QZ3OH9MmlxDEB4zHfjYlNc9rhyWOY61f
E+gig60nbRQnDrgGVFJSv0L3Uo791MbXNPKgGotpDQfbFtRBIrQDY4y1lrPP/wlF
gWt7dsLuu+77qQdBTlSVftl+M4okSpwXXfr+X0T4naGQmn6yPsBdgT7pd8GJ0ylV
sYJbmTu8gsztUiZoF27Jm45Owi1pci4c5CKtTrU3dHc2rPgos2mD7Mq4BlHYHtyt
Y0XCXFFNBN5MG/HXkk8RxSRY/yDo1ZuX68XOXpM5Q306DzqRtxI=
=eQ2v
-----END PGP SIGNATURE-----

--Sig_/2rUkiD1Y/2JVV6uMLSo82pT--

