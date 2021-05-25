Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637D8390A9B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 22:41:19 +0200 (CEST)
Received: from localhost ([::1]:38596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lldrZ-0004ok-JG
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 16:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lldpF-0002hz-0s
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:38:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lldp7-0004mT-Qp
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:38:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621975125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ak6gdxRItHQ76G9r431hVaTNDr7lnEpaTCl18GTI50w=;
 b=Qo/lgFB1Q0taxxeu3Y4f2ftvQYXWAHVxYoxO4Zj+hv1CqSQeFGn78r5kzQPSbYAmjJg3qD
 Fsv6l+HYLr5CU5CgfBvMraQBIiBvDnL6kxTthD+i9x3xrEDkLhAqKpfGeCxO9dxkSOTh5g
 WF8UssXQ5w8q3RUHTVb408sDbSUDYM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-BWGJQu7LPyahfizL1QZ8-g-1; Tue, 25 May 2021 16:38:41 -0400
X-MC-Unique: BWGJQu7LPyahfizL1QZ8-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC620100A253;
 Tue, 25 May 2021 20:38:38 +0000 (UTC)
Received: from localhost (ovpn-114-2.phx2.redhat.com [10.3.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECC0F5D6AC;
 Tue, 25 May 2021 20:38:31 +0000 (UTC)
Date: Tue, 25 May 2021 16:38:08 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 20/25] python: add devel package requirements to
 setuptools
Message-ID: <20210525203808.GE1567491@amachine.somewhere>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-21-jsnow@redhat.com>
 <YK0iRgCDgKfVogKD@localhost.localdomain>
 <840fc0a4-45f9-7ce8-3f1c-a10303c44fbc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <840fc0a4-45f9-7ce8-3f1c-a10303c44fbc@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u5E4XgoOPWr4PD9E"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--u5E4XgoOPWr4PD9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 01:43:42PM -0400, John Snow wrote:
> On 5/25/21 12:13 PM, Cleber Rosa wrote:
> > On Wed, May 12, 2021 at 07:12:36PM -0400, John Snow wrote:
> > > setuptools doesn't have a formal understanding of development require=
s,
> > > but it has an optional feataures section. Fine; add a "devel" feature
> > > and add the requirements to it.
> > >=20
> > > To avoid duplication, we can modify pipenv to install qemu[devel]
> > > instead. This enables us to run invocations like "pip install -e
> > > .[devel]" and test the package on bleeding-edge packages beyond those
> > > specified in Pipfile.lock.
> > >=20
> > > Importantly, this also allows us to install the qemu development
> > > packages in a non-networked mode: `pip3 install --no-index -e .[devel=
]`
> > > will now fail if the proper development dependencies are not already
> > > met. This can be useful for automated build scripts where fetching
> > > network packages may be undesirable.
> > >=20
> >=20
> > This is a fairly exotic feature of setuptools, with very very few
> > packages that I know about using it.  With most users (I believe)
> > relying on pipenv to get the exact packages, the setuptools/pip use
> > case may fall into obscurity IMO.
> >=20
>=20
> Fair enough.
>=20
> The intent is:
>=20
> - Pipenv is more for CI, to deploy a consistent set of frozen packages th=
at
> are known to behave in an extremely stable manner. My hope is to avoid
> breaking changes introduced unknowingly by pylint et al.
>=20
> - pip install qemu[devel] is intended more for external/normal use by
> developers. It grabs the latest and greatest and it may indeed break as
> dependencies change beyond my awareness.
>=20
>=20
> Some packages like aiohttp use that optional dependency feature to instal=
l
> optional modules -- `pip install aiohttp[speedups]` installs optional
> dependencies that allow that module to work much faster, but aren't
> required.
>=20
> Since these linting tools aren't *required* just to *use* the package, I =
am
> doing users a courtesy by listing them as optional. That way, they aren't
> pulled in when using "pip install qemu", and if I have to pin on specific
> sub-versions etc, it won't include conflict dependencies for people using
> other projects that DO declare a hard requirement on those packages.
>=20
> I can amend the PACKAGE.rst file to mention this usage, though it's only
> useful for folks developing the package.
>=20
> (Still, part of the ploy here is to attract outside help on developing th=
e
> QEMU SDK, pull requests welcome etc, so it's worth a documentation blurb =
for
> now.)
>

Yep, I agree with your reasoning here.  I just felt like an extra bit
of documentation would do the trick.

> > So my suggestion is: consider better exposing the fact that this is
> > available (a documentation section perhaps).
> >=20
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >   python/Pipfile      |  5 +----
> > >   python/Pipfile.lock | 14 +++++++++-----
> > >   python/setup.cfg    |  9 +++++++++
> > >   3 files changed, 19 insertions(+), 9 deletions(-)
> > >=20
> >=20
> > Either way,
> >=20
> > Reviewed-by: Cleber Rosa <crosa@redhat.com>
> >=20
>=20
> Thanks! I am taking your R-B and I have applied the following diff.
>=20
> Note that the PACKAGE.rst blurb references qemu[devel] instead because th=
e
> PACKAGE.rst file is what is displayed theoretically on PyPI. That exact
> invocation will fail currently, because it's not on PyPI yet.
>=20
> A little weird, but I *think* it's correct.
>=20
>=20
> diff --git a/python/PACKAGE.rst b/python/PACKAGE.rst
> index 1bbfe1b58e2..05ea7789fc1 100644
> --- a/python/PACKAGE.rst
> +++ b/python/PACKAGE.rst
> @@ -31,3 +31,7 @@ official `GitLab mirror
> <https://gitlab.com/qemu-project/qemu>`_.
>  Please report bugs on the `QEMU issue tracker
>  <https://gitlab.com/qemu-project/qemu/-/issues>`_ and tag ``@jsnow`` in
>  the report.
> +
> +Optional packages necessary for running code quality analysis for this
> +package can be installed with the optional dependency group "devel":
> +``pip install qemu[devel]``.
> diff --git a/python/README.rst b/python/README.rst
> index bf9bbca979a..954870973d0 100644
> --- a/python/README.rst
> +++ b/python/README.rst
> @@ -24,6 +24,10 @@ which installs a version of the package that installs =
a
> forwarder
>  pointing to these files, such that the package always reflects the
>  latest version in your git tree.
>=20
> +Installing ".[devel]" instead of "." will additionally pull in required
> +packages for testing this package. They are not runtime requirements,
> +and are not needed to simply use these libraries.
> +
>  See `Installing packages using pip and virtual environments
>=20
> <https://packaging.python.org/guides/installing-using-pip-and-virtual-env=
ironments/>`_
>  for more information.

Looks great to me.  And, let me be clear about it:

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--u5E4XgoOPWr4PD9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCtYDAACgkQZX6NM6Xy
CfNyDQ/+J+N7kp7PaPgH+G5NcIIE6defKWwGC4KKeEhKX6CWpw1nXtPGa3WzYgOG
8kO0xCUB3IivVbHY9PO1cvrgvMBWe6KxzbmD4RaWCZqRGEPQmXpgjYPIkKKp3m+v
BWGnuRr1DWmX5mZg+/T8NxBChzkmJJCF4Vku0ve7mi5olbBywgy+dHEeJlH7fnXL
SYvZk1PeXzzzOpdCeSVCZcBiRAr+uwNCcoEtF2BvoY8YMqGfPgztCSDCU1CgnU+8
Bg6INR+zs7hbt3RV/mRs36zKgpSM9SLJnVbc6yd+lgssSKY75U04IqRc5cRzcqgG
8byWujcPOKAt2KWIExBBF14MP13X5TQ5gkKj6U552fIQbSpCJawSJx4NKbNyzVxa
gkUJs+I36No2R/B345rgTbB2IQZ9NQw/MzmbY8pjgHg5kMJcK4Q3x1/hf8VRp26G
e8jXOIsnkJ9nYyLL7nymP+9s4gGtl8LYd8R8S95iUOxFX0VsXqOpV8dm2NW3IwJs
FxcFiJTEI56anC+qlJQn6hXVuxBIKXi7sml4gmwMGl3Bx5Pq9r6WEojqP6nURfHJ
ERuw3Hoba6dmLL6F+9ZrgAcXt/e2bKJOwGgpfLln8rzCl98jinZNoGpOdn9KGhUU
hHSKE7K1Hr6pOBVNfTF/sQIPW3cSMpdKcQ5SRQdt0Kmi8iFCZRI=
=zi2U
-----END PGP SIGNATURE-----

--u5E4XgoOPWr4PD9E--


