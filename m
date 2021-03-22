Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24022343AB5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 08:37:50 +0100 (CET)
Received: from localhost ([::1]:55570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOF8G-0002JN-K9
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 03:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOF6g-0001Vs-SJ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 03:36:10 -0400
Received: from mout.web.de ([212.227.15.14]:39519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOF6e-0007CT-G5
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 03:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616398563;
 bh=781AZ+8WT8f39Lp0XX92xNhMKCgdhKPRD7CBcLcs1KY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=H/P8zby0XK7tZsUYNa+IXVCpn2sI603YAddukUCJSelBiRQBgk4sD2GCyMggx804o
 JxJNzxrLI9BQYiGd5KbFSNLaS4vj5pramC/aolxAOBoMOURJZARRa3KbB47FXPfj2r
 fjE8jquPPb0+UUvNHPeGrMWc3xLnvoW9Wc/nAWzE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.232]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M4qon-1lahOJ3KZh-00z0p2; Mon, 22
 Mar 2021 08:36:02 +0100
Date: Mon, 22 Mar 2021 08:35:45 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/5] tests: Use the normal yank code instead of stubs in
 relevant tests
Message-ID: <20210322083545.2c36b5a0@gecko.fritz.box>
In-Reply-To: <1fc6eff2-a8e5-4ae2-96a5-1b30325dff81@redhat.com>
References: <cover.1616368879.git.lukasstraub2@web.de>
 <950007e82e19e75831b29fac07ab990c213d2352.1616368879.git.lukasstraub2@web.de>
 <1fc6eff2-a8e5-4ae2-96a5-1b30325dff81@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J.vku+EUrip.DZ+SuEq8mSS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:LMk0+l3W8t0loPjjU5kjTPfEbM64RFFWb4yemfH7CDI+g05tpPJ
 iPTxUMwrkJ2AzB8c9B9bmN7yO13FvqtNjgmPm6AubBTbEovvQyMW8N8gjMVXCCl/EvVG7LF
 y6uFVT9MTbbWQcvROIhT9SWzMbicgkY2+tPWK5KEU6JoxSuC/b7oxpuiM52J7XidYlxw3Kf
 kQFCLXmMAtCfMhmRfsthQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xDOoe3fyom0=:CrX62Gb9wOj3vDWpNyxRfV
 KhVJ4xLgVqUTPYMCO8byZV56TcQWnQB5kNvN+lM+0ghZawtdqz6TEv/hB0ysgacO/LARtApRJ
 Qfhtyiq9C3EK08WeFmtFB/Hr5bIv5yCezd2x0/VQOSWTsyhFqfaUqVqS8uftA7l+Pq42ZG7/L
 W0ON0ad0LWIPNXOaRTovvJmCmaRnvWwIlZmqG8h5R0Ch1+QLkW2gYmc2gaPB1Lv7i70ZPpB4P
 7VMj0f1BGKqFsE18XckTnDnf69ZE3gxZW1ipBsi+hK8mLn/ff3JQTRPnRUjaT02trZIpMkwax
 Y60OD+0LuD/KpopIKX8az6xZnoxMR5rpqP/dr81GONszDvTPR4WY0CavHvqNiplKapYPNwRz7
 oceMjFcATCoAFx129t9QbTEq4roPd7qVVV2jNo8ufeQS+5BVN57Ycb4ElcMZp2S7guTHTCenC
 2L5cpleu8UzDpbITWRdVvGxtK7/4HUR5pTEbqn7flb74Ch9sVJ9zg5Bgg6NkrNlPD/v8uQarC
 wdX8zQDe2g7Yu3Sz0Owdm6r/+WE95tSDdPjK+6Bn6KneSVeAsGK/u9rZeyG2PXtEBQjWpmSVq
 2NJ0DdskmCnMnFVBI3cvgTwdiAGdej6opHSVFhkfjriYgQJifqK1mwTqVGjX297VmOTPRCaSX
 4iPqp/Qol59Xd6Bb86o15+yIJXr923TGoawKV8b9wOcfWFeFdhadQG1AAlWucfdB6uwjhBsFO
 hKA7Drc4xHV36y7HggzB1KMffvGjjAV0FRBUpSjGn0bE9okedKljQqwXt5uMDjOqLe23ke1SH
 2ujAow69ZbrSccwiS9RohvKoQ0j1I29D17XqEVYOhAVcqI68Ai8qDa2zbdDqSqEhPH/lGPrJl
 7V3HfOsrlfTqTnnDRyFQ==
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

--Sig_/J.vku+EUrip.DZ+SuEq8mSS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Mar 2021 06:20:50 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 22/03/2021 00.31, Lukas Straub wrote:
> > Use the normal yank code instead of stubs in relevant tests to
> > increase coverage and to ensure that registering and unregistering
> > of yank instances and functions is done correctly.
> >=20
> > Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> > ---
> >   tests/qtest/meson.build | 6 +++---
> >   tests/unit/meson.build  | 4 ++--
> >   2 files changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index 66ee9fbf45..40e1f495f7 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -234,9 +234,9 @@ tpmemu_files =3D ['tpm-emu.c', 'tpm-util.c', 'tpm-t=
ests.c']
> >   qtests =3D {
> >     'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.=
c'],
> >     'cdrom-test': files('boot-sector.c'),
> > -  'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
> > +  'dbus-vmstate-test': ['migration-helpers.c', dbus_vmstate1, '../../m=
onitor/yank.c'],
> >     'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c=
'],
> > -  'migration-test': files('migration-helpers.c'),
> > +  'migration-test': ['migration-helpers.c', io, '../../monitor/yank.c'=
],
> >     'pxe-test': files('boot-sector.c'),
> >     'qos-test': [chardev, io, qos_test_ss.apply(config_host, strict: fa=
lse).sources()],
> >     'tpm-crb-swtpm-test': [io, tpmemu_files],
>=20
> Is this really necessary for the qtests? I can understand the change for =
the=20
> unit tests, but the qtests are separate programs where I could not imagin=
e=20
> that they use the yank functions in any way?

Yes, it is necessary. While the yank functions are not called in these test=
s,
it still checks that registering and unregistering of yank instances and
functions is done correctly. I.e. That no yank functions are registered bef=
ore
the instance, that the yank instance is only unregistered after all functio=
ns
where unregistered, that the same instance is not registered twice and that
the yank instance actually exists before it is unregistered.

>   Thomas
>=20
>=20
> PS: Please add a proper description about the yank feature to either that=
=20
> yank.c file or to include/qemu/yank.h ... I had a hard time to find out w=
hat=20
> this code is all about until I finally looked up your cover letter of the=
=20
> original series on the mailing list.
>=20

Will do.

Regards,
Lukas Straub

--=20


--Sig_/J.vku+EUrip.DZ+SuEq8mSS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBYSNEACgkQNasLKJxd
slj3WA//V0DUFx8cQbKf7BShr3X1RJLInzIoR8cixtYsuKNz22R+9Pv3b5vTHvY8
ZG/G9YZfjy3n0jqmYKggo986fP2u+Ub2P92NGP0ifdPtvZzVS/uFPMcd1prc1ne+
Y1R/eT9YiRDbXi4FoxRR7XoiwASmDE3s1697nvOKQ8Fj6GuaTPyVhgzTmhzskIsW
hF5b6rTncUwfthmv5x1hhFIH71rcF2oCgZpGw1mJg0ZEw+75MQhGRvsi+/0dxFua
iR17wVQSwgszI4taTp39o4Hiss4HruwqOZ/R5yrPawAqOVr4MeWHUjkWiageA9TU
xa3tDn2IByxfDow8mhwXnki71ZLgTi9o6wRBzu021jM9Ky/4X5jWFNOY72QO8jQD
w6DO4CSTln+F/xhQPQw8KXbI/84Zeh/Zm0vONujDkOGLK4Nt3kSSLzSJDvM1b2zH
v8Mx24GqklcaXjZ6Tn4OHPQyFnPFcZcFzZvkvZezpR3VkQaOU6QVbBKQ88TjOJ+S
pa6nkyMa+wVe20BkAr035GCe3beX1iB8nUMs3G/afKQeUSraWpMpZY1IEyw0mCEN
5WF+8R71OqXlsuWnxn96b7gZB3+qBefKOrs9iKOkg5hBW2zMg1fvrUE50px023E6
S3nZ0UfU1v2Wjc63ZX+Hh0vfdVN169d8mEj4P8/twNoqxOwy70U=
=Tvzy
-----END PGP SIGNATURE-----

--Sig_/J.vku+EUrip.DZ+SuEq8mSS--

