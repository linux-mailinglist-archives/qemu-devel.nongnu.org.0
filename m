Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBB9332FB9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:17:41 +0100 (CET)
Received: from localhost ([::1]:43096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJinU-0005e0-Ig
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lJhtn-000629-RC
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:20:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lJhtm-0005iL-1n
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 14:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615317605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QASMLsbk+5kt22kHR7iIf2r0ICUICtx/1FemEYQ8LwQ=;
 b=Cb5s8YL/HQP4OrIFNuaiUOqzPTLcPPeyluXfNwSXYJFVmojZfO//3LMtsa8Toksjw7ZmNy
 fTM6GOcew23EpTLHzdLB8WZDublgK5XTVDGUubYZ2sx5+MBvyZR/yUDdt3aPNwoMKuEho8
 afIhwGDdqXJ+2hrktvH4BjRlVNeIv9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-nC7twhpdOC6BkldFmWTztg-1; Tue, 09 Mar 2021 14:20:00 -0500
X-MC-Unique: nC7twhpdOC6BkldFmWTztg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA0EB881D4B;
 Tue,  9 Mar 2021 19:19:59 +0000 (UTC)
Received: from localhost (ovpn-117-250.rdu2.redhat.com [10.10.117.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75E1860240;
 Tue,  9 Mar 2021 19:19:59 +0000 (UTC)
Date: Tue, 9 Mar 2021 13:40:07 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 1/3] tests/acceptance: Automatic set -cpu to the test vm
Message-ID: <20210309184007.GA2155904@amachine.somewhere>
References: <20210224212654.1146167-1-wainersm@redhat.com>
 <20210224212654.1146167-2-wainersm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210224212654.1146167-2-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: wrampazz@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, philmd@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 06:26:52PM -0300, Wainer dos Santos Moschetta wrote=
:
> This introduces a new feature to the functional tests: automatic setting =
of
> the '-cpu VALUE' option to the created vm if the test is tagged with
> 'cpu:VALUE'. The 'cpu' property is made available to the test object as w=
ell.
>=20
> For example, for a simple test as:
>=20
>     def test(self):
>         """
>         :avocado: tags=3Dcpu:host
>         """
>         self.assertEqual(self.cpu, "host")
>         self.vm.launch()
>=20
> The resulted QEMU evocation will be like:
>

Maybe you meant "resulting" ?

>     qemu-system-x86_64 -display none -vga none -chardev socket,id=3Dmon,p=
ath=3D/var/tmp/avo_qemu_sock_pdgzbgd_/qemu-1135557-monitor.sock -mon charde=
v=3Dmon,mode=3Dcontrol -cpu host
>=20
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  docs/devel/testing.rst                    | 8 ++++++++
>  tests/acceptance/avocado_qemu/__init__.py | 4 ++++
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 00ce16de48..40478672c0 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -844,6 +844,14 @@ name.  If one is not given explicitly, it will eithe=
r be set to
>  ``None``, or, if the test is tagged with one (and only one)
>  ``:avocado: tags=3Darch:VALUE`` tag, it will be set to ``VALUE``.
> =20
> +cpu
> +~~~
> +
> +If the test is tagged with one (and only one) ``:avocado: tags=3Dcpu:VAL=
UE`` tag
> +then the ``cpu`` attribute will be set to ``VALUE``, and the ``-cpu`` ar=
gument
> +will be set to all QEMUMachine instances created by the test. Otherwise =
the
> +attribute will be set to ``None``.
> +
>  machine
>  ~~~~~~~
> =20
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance=
/avocado_qemu/__init__.py
> index df167b142c..0f4649b173 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -193,6 +193,8 @@ def setUp(self):
>          self.arch =3D self.params.get('arch',
>                                      default=3Dself._get_unique_tag_val('=
arch'))
> =20
> +        self.cpu =3D self._get_unique_tag_val('cpu')
> +
>          self.machine =3D self.params.get('machine',
>                                         default=3Dself._get_unique_tag_va=
l('machine'))
> =20
> @@ -218,6 +220,8 @@ def get_vm(self, *args, name=3DNone):
>              name =3D str(uuid.uuid4())
>          if self._vms.get(name) is None:
>              self._vms[name] =3D self._new_vm(*args)
> +            if self.cpu is not None:
> +                self._vms[name].add_args('-cpu', self.cpu)
>              if self.machine is not None:
>                  self._vms[name].set_machine(self.machine)
>          return self._vms[name]
> --=20
> 2.29.2
>=20

Did you omit the support for the "cpu" parameter on purpose?  Unless
there's a good argument against it, I'd say we should try to keep
those tags/parameters/attributes consistently available.

Cheers,
- Cleber.

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBHwQUACgkQZX6NM6Xy
CfMJIQ//R33rxVrAKot5NhcGBI5eEAsUisje6hh7VIGlZCdlHGyxAoE9oOYxnJnk
jYKbM/aHBUzuq2X19b/7nNXlEnQ8NRrIKDMw2ZYWkWA0UWf14Z9YIld351UyfjJC
xDIGaP5wfVsgL9SdBYx1L+x7husQO0Uw7gIgzdknaJHUK/fvK9znVEWjOLEIGzuw
2vNHL2Gy08HqSq+q7hm7wc5NstLYXUeV16xK84qToyfKXEYgqyGkgSD8i7eMHTJU
YN+TkEv0mAcF2cM0BDaGR8XmT+Qd2YLH5pmudrlD0T+p6j+I5V82gXA+Q7M9hWCL
uZR1pkFM+1jksq24BkGP/OwMShj1CTydHgDeUodAfKCphuVkS4zrGp1KMTS5J8J6
YNmksvvOtf6jtV21SuX4CnYZmTmrvIpQgKRtc5gXZNueP0xpi8Acq3iN92/0GE1t
95rLm5CN6bEHpswx9yC+nQzmgVhI3JAKvURphKP3d5qwz9T/gOi574Taa/tj3A/y
PlTimIEBis6OYeEwn/+UxozeEsliSivObesNeGG2OuVvCL9A6m3maYgm0kAtdpsw
4Yt45fjr6NmTawVfzdy4/jqFXsar4OtIWLSjjHzfdGF3MPX0Y30GhCbgn8QR8u3f
z+AReqplNl+kk2kBFkguJoWi2VUtdbFlLSp9gK1GCW4bY/WiENc=
=CUKF
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--


