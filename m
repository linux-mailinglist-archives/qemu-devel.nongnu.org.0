Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4ED31D421
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 04:04:17 +0100 (CET)
Received: from localhost ([::1]:36108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCD8T-0000uL-0J
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 22:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCD7E-0000KH-It
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 22:03:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCD7D-0007cN-5S
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 22:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613530978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UuXqybmIxY+MftWdW6YCMt0i0uT4i6CJwOSQbqLCvQs=;
 b=U+JIfCasNoUhWoJAOc5rFALJ4NV81hc0dPuu+wGZUI0OEO3VR0ebd+WJSyepJdxmKj3fxL
 DlH8yYeiCUGwkiDFEs2c5j5jqgzozKk0jVaWaKbN1b44gfpXmJbdM+RE5J79aADVYXIWZM
 wEnXSu9TrL4VZnKcN0K1Iki5Ucr+c6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-ayZhVrPHPZWIuvG0JMvP8w-1; Tue, 16 Feb 2021 22:02:54 -0500
X-MC-Unique: ayZhVrPHPZWIuvG0JMvP8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC15D1005501;
 Wed, 17 Feb 2021 03:02:52 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-29.rdu2.redhat.com
 [10.10.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64523608BA;
 Wed, 17 Feb 2021 03:02:48 +0000 (UTC)
Date: Tue, 16 Feb 2021 22:02:46 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 08/24] python: Add pipenv support
Message-ID: <YCyHVvhDRp+qf4cJ@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-9-jsnow@redhat.com>
 <YCyGnK3DQXkVnsx+@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <YCyGnK3DQXkVnsx+@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GxyaJDRWR3VUyoV9"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--GxyaJDRWR3VUyoV9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2021 at 09:59:47PM -0500, Cleber Rosa wrote:
> On Thu, Feb 11, 2021 at 01:58:40PM -0500, John Snow wrote:
> > pipenv is a tool used for managing virtual environments with pinned,
> > explicit dependencies. It is used for precisely recreating python
> > virtual environments.
> >=20
> > pipenv uses two files to do this:
> >=20
> > (1) Pipfile, which is similar in purpose and scope to what setup.py
> > lists. It specifies the requisite minimum to get a functional
> > environment for using this package.
> >=20
> > (2) Pipfile.lock, which is similar in purpose to `pip freeze >
> > requirements.txt`. It specifies a canonical virtual environment used fo=
r
> > deployment or testing. This ensures that all users have repeatable
> > results.
> >=20
> > The primary benefit of using this tool is to ensure repeatable CI
> > results with a known set of packages. Although I endeavor to support as
> > many versions as I can, the fluid nature of the Python toolchain often
> > means tailoring code for fairly specific versions.
> >=20
> > Note that pipenv is *not* required to install or use this module; this =
is
> > purely for the sake of repeatable testing by CI or developers.
> >=20
> > Here, a "blank" pipfile is added with no dependencies, but specifies
> > Python 3.6 for the virtual environment.
> >=20
> > Pipfile will specify our version minimums, while Pipfile.lock specifies
> > an exact loudout of packages that were known to operate correctly. This
>=20
> Layout? Loadout?
>=20
> > latter file provides the real value for easy setup of container images
> > and CI environments.
> >=20
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/Pipfile | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >  create mode 100644 python/Pipfile
> >
>=20
> Other than that,
>=20
> Reviewed-by: Cleber Rosa <crosa@redhat.com>

Actually, just one suggestion: bump the position of this patch twice.
It makes it easier to understand its purpose if it is placed right
before the "python: add pylint to pipenv" patch.

Cheers,
- Cleber.

--GxyaJDRWR3VUyoV9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAsh1YACgkQZX6NM6Xy
CfMjSw/+NugfADuR7W6gM64DDaFKknkYAvEhgH4tg2mEHhBSnn1gQFP/2ra35SuF
GHeB12lSVOdxP0TfXXaOnjJPVW/jSIohM4psibapjk5GAbcaUFoloE+U07IlHADd
a2sYMMmFUrxH6UPuNWw0ivx4nywj4MQunCOWoHe8Wjyt+fI0zakWqQD27lo8Tc0s
ZU3kXd5uWsCehEdDRL8iGstoZdln8rTWVqtOYfy8vpQnzq8JTAgJDbrxRVNe08q+
p74heaOrz419Ia8AwL+ZEFjWAXoQVoowHWOFwh1MdITV3fOU07EMrFMXbAuHnriW
PK9H6O60oh6HQJQZXl2l8RfU8ke9lcXZsDLDRXfvQEAIB6SeQKBhr6uOx4Z5EFeg
wWL2PGFGi2pdPzWa0ihLxPLAQOUTGrnNs77bQm1xXxMCLveHb6bgpJjiLVpfkcAd
V8xr+wzsg3Cm95WvzRbpJ4WIklQmgBZ0fxAg9ewXstduSZk+UEHS96mOYMUmv0BY
WSdc1D80smdAB71DraHke+IfhIXjeCsNX3+tsjRCTLTkCRLWwc9zo9fHAp+nDMSv
tTxR0X9evoyw8uXHiDY1+jbqnpnQiUmYh+u/55PYJYZ0+m1y0h2+7DyMSgeXwLb6
UMOhMNsfC2e/ftqIrrelTDCxL/sUcV0GjFrlHvzVgNJOamTJLKc=
=cGld
-----END PGP SIGNATURE-----

--GxyaJDRWR3VUyoV9--


