Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942CB344DB8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:50:09 +0100 (CET)
Received: from localhost ([::1]:39542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOgq-0002dX-6N
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOOfD-0001qg-BE
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:48:27 -0400
Received: from mout.web.de ([212.227.15.14]:48375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOOfA-0007p3-Ko
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616435297;
 bh=L+oN91jl5n/5DcPQxd+Sfi7ic/2riJEHPB2ZC+wLtFk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=UQHvs7EXL2HU8T02FouQxdsJICrIP9S8tAnsBsldy8bU/GAOhjtw2oFQ4sVfGAdtS
 kYIDoJIl0q8Iigm2U3qE3p4tYIAscKvZUpSLx1baDg2/FNni7k8k2YCLaoYJx+LObF
 /wKRPTnI/WvhTvxfb+2dER0vzMZ7bRN87v/XI+UI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.232]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MD8Au-1lRi2v1vxM-00GXAM; Mon, 22
 Mar 2021 18:48:17 +0100
Date: Mon, 22 Mar 2021 18:48:00 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/5] tests: Use the normal yank code instead of stubs in
 relevant tests
Message-ID: <20210322184800.5ead0f3c@gecko.fritz.box>
In-Reply-To: <52d508d6-284c-6b36-62ed-f25081e63cfd@redhat.com>
References: <cover.1616368879.git.lukasstraub2@web.de>
 <950007e82e19e75831b29fac07ab990c213d2352.1616368879.git.lukasstraub2@web.de>
 <1fc6eff2-a8e5-4ae2-96a5-1b30325dff81@redhat.com>
 <20210322083545.2c36b5a0@gecko.fritz.box>
 <52d508d6-284c-6b36-62ed-f25081e63cfd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/USBNde/r7DqK08rwN3gh2t6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:rE80pF5wL6blhONr5HGpMRfYbGj3X6vYf+cKPIQd4rCVmvn2XhL
 zhs+F6b+MO5miBNzx1V+4Eb/uK0O8MTrgN7UXH3jvj3SFn5Syc0P4QnugD5FzbfreEqaze3
 qDAmaFaIw2HznfO2YBcEmu/Akpj151Xu7jFEKPCvcuslwOJIHySHqCWJyQIMpLI+YIaNPyg
 Gre6TI3d4g15ijjo5QsmQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CVjeGXobi7k=:sH/LKhRHE6oWAfx8pf28GR
 thifThyxNAcV+xHl3esS9PYT/IY5sfInJkO4i2hO7bdM7hzEyCJSKhBDu4BsSRvwjSlRSBru1
 Aj9duyCLA6cnTIn2WB32zC4MHeSKI7aAk9XEXEl3b5GlFDvsoMB/lBswW55Di7HXDI9mZZcsO
 iMuZiBiDe/u9cdCK4u2v/Kus3GeLQhjx5HoaTMh82kXYF+UKScR+CRK5FVh0wfy8KO+QYZgeb
 wWpOjhSFunYd6B6vK1gXWOwn//qg1tMkw/mRvOJq2mzeD8u3Z7Jt7ownablbgtf++jCP+njO6
 8ii1+JCPi3kfsJPSXuHh8yEsAK5/qRBbhjlVb+L+NTnJf3lW5lThW5divAkwpfa9d7HKTR+/m
 ezTWMEiKZbeHVRyX27pR9fpm+fBMrI1kfYlOttGAVlSoT8ya048uoOwO8jTDm5klAhyixhg08
 f60Y5RpbGibQrISOY7jpmTC0vcok3mjVm/ehzv3ZBmPyMT/Ao41NRNjYM2WX7qaKTrQVCU6Ws
 mmBfVpN1SPYoAM/VimlsWcK6k7+qCFcv3SePmWXgtj5WZto8Y2fux0I+gZa/rChA18VQefKl7
 eZzMdadZ7adiPeDnp6gIglxzkY5de1BRA528mk6ut+/kcG2OmKQ6jUZMbq5DXF/HYuY/FbTim
 6FpzXFdQUfFfF1weHHOT3Ugr6pHa1EVvTuOy6Nk5JdNqG/LbZ4QnP6yfjMTNoL/mZb+BnYcKf
 ZGD4dGjSrRqxYqSLgksb6kXj6WjgCvfzoiUzNMVguIHXMD8dVRO1DDIoL6CdYc5UV82BmIlz+
 68javKs2g6HuFH/DEHCyxXRd7qeo3d3q6DeqxG3/BxDy2rK86Oe1rk3YFGwr0sHDv0/O+lf0b
 4ptfr5JfyevRx0jJMPRQ==
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Li Zhang <zhlcindy@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/USBNde/r7DqK08rwN3gh2t6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Mar 2021 17:00:23 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 22/03/2021 08.35, Lukas Straub wrote:
> > On Mon, 22 Mar 2021 06:20:50 +0100
> > Thomas Huth <thuth@redhat.com> wrote:
> >  =20
> >> On 22/03/2021 00.31, Lukas Straub wrote: =20
> >>> Use the normal yank code instead of stubs in relevant tests to
> >>> increase coverage and to ensure that registering and unregistering
> >>> of yank instances and functions is done correctly.
> >>>
> >>> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> >>> ---
> >>>    tests/qtest/meson.build | 6 +++---
> >>>    tests/unit/meson.build  | 4 ++--
> >>>    2 files changed, 5 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> >>> index 66ee9fbf45..40e1f495f7 100644
> >>> --- a/tests/qtest/meson.build
> >>> +++ b/tests/qtest/meson.build
> >>> @@ -234,9 +234,9 @@ tpmemu_files =3D ['tpm-emu.c', 'tpm-util.c', 'tpm=
-tests.c']
> >>>    qtests =3D {
> >>>      'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-e=
mu.c'],
> >>>      'cdrom-test': files('boot-sector.c'),
> >>> -  'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
> >>> +  'dbus-vmstate-test': ['migration-helpers.c', dbus_vmstate1, '../..=
/monitor/yank.c'],
> >>>      'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-serve=
r.c'],
> >>> -  'migration-test': files('migration-helpers.c'),
> >>> +  'migration-test': ['migration-helpers.c', io, '../../monitor/yank.=
c'],
> >>>      'pxe-test': files('boot-sector.c'),
> >>>      'qos-test': [chardev, io, qos_test_ss.apply(config_host, strict:=
 false).sources()],
> >>>      'tpm-crb-swtpm-test': [io, tpmemu_files], =20
> >>
> >> Is this really necessary for the qtests? I can understand the change f=
or the
> >> unit tests, but the qtests are separate programs where I could not ima=
gine
> >> that they use the yank functions in any way? =20
> >=20
> > Yes, it is necessary. While the yank functions are not called in these =
tests,
> > it still checks that registering and unregistering of yank instances and
> > functions is done correctly. I.e. That no yank functions are registered=
 before
> > the instance, that the yank instance is only unregistered after all fun=
ctions
> > where unregistered, that the same instance is not registered twice and =
that
> > the yank instance actually exists before it is unregistered. =20
>=20
> Now you even confused me more. Could you elaborate a little bit? If none =
of=20
> the functions are called by the test, which part of yank.c is excercised=
=20
> here at all? Could you give a more detailed example? The only thing I cou=
ld=20
> imagine is yank_init(), but that does not look like something we need to=
=20
> check in a qtest ?

Oh, sorry. I meant yank's concept of a yank function here. It works this wa=
y:
The different subsystems first register a yank instance. So in this case
when starting migration in the test, the migration code first registers a
yank instance. Then, it registers _yank functions_ with this instance, for
for example to shutdown a socket.

Now, (in the real-world qemu case) if qemu hangs, the user can use the
'yank' qmp command to call the _yank functions_ to recover.

The test doesn't test the 'yank' qmp command, but yank_register_instance,
yank_register_function (which are called by the migration code and thus
also the migration test) still check if everything is done correctly.

Regards,
Lukas Straub

>   Thomas
>=20



--=20


--Sig_/USBNde/r7DqK08rwN3gh2t6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBY2FAACgkQNasLKJxd
sliFkw//VuCLGwKwx59FxYGgmECuFfogiQDOgBW6czBZBbc1bYjiMv1l75n61JS2
qCHfWL0vQfRH58SQPHI3zz0zoHVq/Sdt4EyTbEZ0TQyYhUmVkWCu0SCiNnART7WJ
/Y+JMJIQzY+ZiVxcxaE7PVW8b3k4kN6Kd2zA56Nt7XPG9fYe8+cOiV0MMEby//gZ
4bHiI9lmK21iVhLli+COAm4MjhEzXpNGdcILrYdwRsRO16P4Fv4uIEzcq80sgH24
QzQzLJQF/w6RBTVpxqZunDiRXuhMw9RD5ASkAhoF8mUqNpcGCis8zZm7Z6NrHDbO
XIo0PgecTCprVv6T5fdiG+HLzPOgRe9YHyAXtLQ98fvRWEWtDQsPHS/UeLOjmmEM
/d+rAIVyhv3+sXJ1Ho0MfQ/HWsscb4Q2bEPJfYfkkwSA+uS1z5xSNu9lsw790JIW
nuyJRoK9Iv9wqh5hFrLCRWpWypwYTpDoKOjE4ttOSvcJQLyoeu/RBZMLhsscFPmp
Idnl7hamOZ6/ZA4gYJVHYEzKrGKZy0pd7npkef1YdapG6qVLjzVsYlKZttjytMMW
/7Ys/pZ3W9IsLFQzTz4oF6Nsx19HKmZxWT9D6PYjPC+3eUrlvaRWivs/8Ju2n6Kd
9m/Inz7tR6w8imDxnpJSbuce6op1ZTm3EB3S+ALV5xaEWK2BHW8=
=Wkd9
-----END PGP SIGNATURE-----

--Sig_/USBNde/r7DqK08rwN3gh2t6--

