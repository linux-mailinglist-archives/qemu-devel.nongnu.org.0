Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FFA31DFBE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 20:41:58 +0100 (CET)
Received: from localhost ([::1]:43500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCShx-0004kp-GC
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 14:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCSg6-00045N-GG
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 14:40:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCSg3-0003kn-RN
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 14:40:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613590797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1//YgritQNSxJUbvvbOBl9rwrHKyCX16iiRQeE3sl68=;
 b=EG0swheUzuxKnZ5a66kw6wmViknvUY21AdXMnx7cfeoD1YbWapGf6YIC5tDnP1Qe0ZDPrs
 VIP18XrLnZJ2qSUnfjIYAf+VRfuu57H4KCVvq0PiUevZs5PZN+F3FhI55dVzVDmwJUX3jX
 CaTHfaWnXXuX2/X04O4tkx4OLfE2YiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-sLVpy9s3NneaM9igwQJadQ-1; Wed, 17 Feb 2021 14:39:55 -0500
X-MC-Unique: sLVpy9s3NneaM9igwQJadQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BF10BBEE2;
 Wed, 17 Feb 2021 19:39:54 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-28.rdu2.redhat.com
 [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16ADA5D9C2;
 Wed, 17 Feb 2021 19:39:46 +0000 (UTC)
Date: Wed, 17 Feb 2021 14:39:44 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 08/24] python: Add pipenv support
Message-ID: <20210217193944.GA349288@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-9-jsnow@redhat.com>
 <YCyGnK3DQXkVnsx+@localhost.localdomain>
 <YCyHVvhDRp+qf4cJ@localhost.localdomain>
 <41b213f5-8102-63e3-86d2-68a42f60aa05@redhat.com>
MIME-Version: 1.0
In-Reply-To: <41b213f5-8102-63e3-86d2-68a42f60aa05@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 17, 2021 at 12:28:22PM -0500, John Snow wrote:
> On 2/16/21 10:02 PM, Cleber Rosa wrote:
> > On Tue, Feb 16, 2021 at 09:59:47PM -0500, Cleber Rosa wrote:
> > > On Thu, Feb 11, 2021 at 01:58:40PM -0500, John Snow wrote:
> > > > pipenv is a tool used for managing virtual environments with pinned=
,
> > > > explicit dependencies. It is used for precisely recreating python
> > > > virtual environments.
> > > >=20
> > > > pipenv uses two files to do this:
> > > >=20
> > > > (1) Pipfile, which is similar in purpose and scope to what setup.py
> > > > lists. It specifies the requisite minimum to get a functional
> > > > environment for using this package.
> > > >=20
> > > > (2) Pipfile.lock, which is similar in purpose to `pip freeze >
> > > > requirements.txt`. It specifies a canonical virtual environment use=
d for
> > > > deployment or testing. This ensures that all users have repeatable
> > > > results.
> > > >=20
> > > > The primary benefit of using this tool is to ensure repeatable CI
> > > > results with a known set of packages. Although I endeavor to suppor=
t as
> > > > many versions as I can, the fluid nature of the Python toolchain of=
ten
> > > > means tailoring code for fairly specific versions.
> > > >=20
> > > > Note that pipenv is *not* required to install or use this module; t=
his is
> > > > purely for the sake of repeatable testing by CI or developers.
> > > >=20
> > > > Here, a "blank" pipfile is added with no dependencies, but specifie=
s
> > > > Python 3.6 for the virtual environment.
> > > >=20
> > > > Pipfile will specify our version minimums, while Pipfile.lock speci=
fies
> > > > an exact loudout of packages that were known to operate correctly. =
This
> > >=20
> > > Layout? Loadout?
> > >=20
> > > > latter file provides the real value for easy setup of container ima=
ges
> > > > and CI environments.
> > > >=20
> > > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > > ---
> > > >   python/Pipfile | 11 +++++++++++
> > > >   1 file changed, 11 insertions(+)
> > > >   create mode 100644 python/Pipfile
> > > >=20
> > >=20
> > > Other than that,
> > >=20
> > > Reviewed-by: Cleber Rosa <crosa@redhat.com>
> >=20
> > Actually, just one suggestion: bump the position of this patch twice.
> > It makes it easier to understand its purpose if it is placed right
> > before the "python: add pylint to pipenv" patch.
> >=20
> > Cheers,
> > - Cleber.
> >=20
>=20
> The way the series is laid out is:
>=20
> 01-02: pre-requisite fixes
> 03-07: Create the package, readmes, etc.
> 08:    Pipenv support
> 09-11: Pylint
> 12-13: flake8
> 14-15: mypy
> 16-17: isort
> 18-20: Testing and pre-requisites
> 21-23: Polish
> 24: CI support
>=20
> Moving the pipenv patch to just before the final pylint patch works OK, b=
ut
> breaks up the pylint section. Should I still do it?
>

OK, now with that approach of groupping in min, it sounds reasonable.
My previous point was that pipenv is not needed until right before #10,
but that's just nitpicking and almost bikeshedding (I won't admit it
easily).

> --js
>=20
>=20
> (Hm, by this layout, I should probably actually move the pylint fix in #0=
1
> down to appear after the pipenv patch. I could also move the flake8 fixes=
 in
> #21 up to be near the other flake8 patches.)

Sounds more consistent.

Cheers,
- Cleber.

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAtcP0ACgkQZX6NM6Xy
CfOtjxAA05Z6xHfj20Ldln/f8VyBGGzdY6qvPVNb1yZHyKcCDeGcC1kCuMUBhoMA
Vg9nOzd9FHIhbyuNexYzyRTuwTumSl7w9J0wStYrIgWBxfx8Ssj/3x71+levxcEP
mzCW7E3QVfY+BsV0j//DIGC6tyKMKZSI0b1v9PVC+bncpOkVpUfWb/sIXC2zzR+7
Pgv6oavNeHuZPnBrI2mEJePqwl/t++LcS+Nz1SPkZr8XVbj5n0bkH/mafRvZXzBh
cLTp7WjFvPRmaNNVblRqCMwoJ9GUo95qyrFK3BtOc7jCeyVxDKNSomUKEIgrH+6q
ar5jUFLdoUi2TvBjtl9FIxr86C1wcINwIucEiKFvG70SoAu62aYPWAwsUv3tgHq/
g30S7x52nCzYdU+lBeaTmWA50C03Etj0MUhJFdjf5u8ZUilZmYPkwid/lVtonvFr
p65E0YqWu76eZdJgQWLz8LrskTmW/th7+BPd499k7WBWlSXTzZ0ZqA2S92g0+PgT
WM8o36/LEYT5Hlp4zZbvWLiTpJdBYHlfoIZxnLTR7YrYtqyuhFCwzFet6SVzvzno
yT7Ow1BpcyWI6byJWa9TttWRdn0dFUx3nFJTQq5io08roXcVMRYQZa2yFQ8ipx3p
hcUU5xln11hGAyJuGhG5gS/+KitnU4Vx7DEgxePaZ/NqFaDfxto=
=e4b6
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--


