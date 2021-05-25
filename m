Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156F5390A8B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 22:34:06 +0200 (CEST)
Received: from localhost ([::1]:56342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lldka-0005xO-UZ
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 16:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lldi2-0004XP-OK
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:31:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lldho-0000Zk-2O
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621974669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gb8IPp6jl7JG8i/zbAIK2wZOmq7locxWjlugR2erLo4=;
 b=Xf6+V7ch3I0C91xTbl6bvfsKInHWdhO7aZT1PWpqFP3BBYMZdWEeZcMxJr32OepHuAEMYx
 ttRZOPCjpX2bOO5e/r61fNrzoUglZi2hjr1UPUc+t0WZ4S4Ndw+ze8jkY7msy0KwTvLFsR
 yiup5SvAh+xSwNZRzKkDJ8b0EKnQf9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-u7k_Jj6RO9qy8E73nrQOog-1; Tue, 25 May 2021 16:31:01 -0400
X-MC-Unique: u7k_Jj6RO9qy8E73nrQOog-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1C3A8015F5;
 Tue, 25 May 2021 20:31:00 +0000 (UTC)
Received: from localhost (ovpn-114-2.phx2.redhat.com [10.3.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6AA15C1A1;
 Tue, 25 May 2021 20:30:53 +0000 (UTC)
Date: Tue, 25 May 2021 16:30:41 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 06/25] python: add directory structure README.rst files
Message-ID: <20210525203041.GC1567491@amachine.somewhere>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-7-jsnow@redhat.com>
 <YKxh6/mwCEqRLIvH@localhost.localdomain>
 <359a6fd3-995d-08e9-e78b-0f3e38ee34ae@redhat.com>
MIME-Version: 1.0
In-Reply-To: <359a6fd3-995d-08e9-e78b-0f3e38ee34ae@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
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

--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 01:14:50PM -0400, John Snow wrote:
> On 5/24/21 10:33 PM, Cleber Rosa wrote:
> > On Wed, May 12, 2021 at 07:12:22PM -0400, John Snow wrote:
> > > Add short readmes to python/, python/qemu/, python/qemu/machine,
> > > python/qemu/qmp, and python/qemu/utils that explain the directory
> > > hierarchy. These readmes are visible when browsing the source on
> > > e.g. gitlab/github and are designed to help new developers/users quic=
kly
> > > make sense of the source tree.
> > >=20
> > > They are not designed for inclusion in a published manual.
> > >=20
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >   python/README.rst              | 41 +++++++++++++++++++++++++++++++=
+++
> > >   python/qemu/README.rst         |  8 +++++++
> > >   python/qemu/machine/README.rst |  9 ++++++++
> > >   python/qemu/qmp/README.rst     |  9 ++++++++
> > >   python/qemu/utils/README.rst   |  7 ++++++
> > >   5 files changed, 74 insertions(+)
> > >   create mode 100644 python/README.rst
> > >   create mode 100644 python/qemu/README.rst
> > >   create mode 100644 python/qemu/machine/README.rst
> > >   create mode 100644 python/qemu/qmp/README.rst
> > >   create mode 100644 python/qemu/utils/README.rst
> > >=20
> > > diff --git a/python/README.rst b/python/README.rst
> > > new file mode 100644
> > > index 00000000000..7a0dc5dff4a
> > > --- /dev/null
> > > +++ b/python/README.rst
> > > @@ -0,0 +1,41 @@
> > > +QEMU Python Tooling
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +This directory houses Python tooling used by the QEMU project to bui=
ld,
> > > +configure, and test QEMU. It is organized by namespace (``qemu``), a=
nd
> > > +then by package (e.g. ``qemu/machine``, ``qemu/qmp``, etc).
> > > +
> > > +``setup.py`` is used by ``pip`` to install this tooling to the curre=
nt
> > > +environment. ``setup.cfg`` provides the packaging configuration used=
 by
> > > +setup.py in a setuptools specific format. You will generally invoke =
it
> >=20
> > For consistency, ``setup.py`` here?  Also, I guess ``setuptools`` as it
> > falls in the same category of ``pip``.
> >=20
>=20
> Kinda-sorta, but `pip` is a command line executable and setuptools isn't.
> Along those lines I'll fix setup.py but leave setuptools as-is.
>

OK, fair enough.

> > > +by doing one of the following:
> > > +
> > > +1. ``pip3 install .`` will install these packages to your current
> > > +   environment. If you are inside a virtual environment, they will
> > > +   install there. If you are not, it will attempt to install to the
> > > +   global environment, which is not recommended.
> >=20
> > Maybe some **emphasis** on **not**?
> >=20
>=20
> Sure :)
>=20
> > > +
> > > +2. ``pip3 install --user .`` will install these packages to your use=
r's
> > > +   local python packages. If you are inside of a virtual environment=
,
> > > +   this will fail.
> > > +
> >=20
> > Maybe note that, if you are inside of a virtual environment, option #1
> > will probably be what users doing "--user" in a venv actually want.
> >=20
>=20
> Yes. It's frequently annoying how this works, because it's hard to relay
> succinctly :)
>=20
> I think at least newer versions of pip give you good warnings when you us=
e
> --user for virtual environments at least.
>

True.

> > > +If you append the ``-e`` argument, pip will install in "editable" mo=
de;
> > > +which installs a version of the package that installs a forwarder
> > > +pointing to these files, such that the package always reflects the
> > > +latest version in your git tree.
> > > +
> > > +See `Installing packages using pip and virtual environments
> > > +<https://packaging.python.org/guides/installing-using-pip-and-virtua=
l-environments/>`_
> > > +for more information.
> > > +
> > > +
> > > +Files in this directory
> > > +-----------------------
> > > +
> > > +- ``qemu/`` Python package source directory.
> > > +- ``PACKAGE.rst`` is used as the README file that is visible on PyPI=
.org.
> > > +- ``README.rst`` you are here!
> > > +- ``VERSION`` contains the PEP-440 compliant version used to describ=
e
> > > +  this package; it is referenced by ``setup.cfg``.
> > > +- ``setup.cfg`` houses setuptools package configuration.
> > > +- ``setup.py`` is the setuptools installer used by pip; See above.
> >=20
> > Not only used by pip... but I understand the reason for limiting the
> > amount of information given here.
> >=20
>=20
> Yes ... suggesting broadly that I don't really support using
> setuptools/setup.py alone to install the package, but instead expect and
> consider 'pip' to be the canonical/supported interface.
>=20
> There are sometimes minor differences between how they handle things, so =
I
> wanted less emphasis on setuptools et al.
>

Sure, I can definitely side with you here.

> > > diff --git a/python/qemu/README.rst b/python/qemu/README.rst
> > > new file mode 100644
> > > index 00000000000..d04943f526c
> > > --- /dev/null
> > > +++ b/python/qemu/README.rst
> > > @@ -0,0 +1,8 @@
> > > +QEMU Python Namespace
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +This directory serves as the root of a `Python PEP 420 implicit
> > > +namespace package <https://www.python.org/dev/peps/pep-0420/>`_.
> > > +
> > > +Each directory below is assumed to be an installable Python package =
that
> > > +is available under the ``qemu.<package>`` namespace.
> > > diff --git a/python/qemu/machine/README.rst b/python/qemu/machine/REA=
DME.rst
> > > new file mode 100644
> > > index 00000000000..ac2b4fffb42
> > > --- /dev/null
> > > +++ b/python/qemu/machine/README.rst
> > > @@ -0,0 +1,9 @@
> > > +qemu.machine package
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +This package provides core utilities used for testing and debugging
> > > +QEMU. It is used by the iotests, vm tests, acceptance tests, and sev=
eral
> > > +other utilities in the ./scripts directory. It is not a fully-fledge=
d
> > > +SDK and it is subject to change at any time.
> > > +
> > > +See the documentation in ``__init__.py`` for more information.
> > > diff --git a/python/qemu/qmp/README.rst b/python/qemu/qmp/README.rst
> > > new file mode 100644
> > > index 00000000000..c21951491cf
> > > --- /dev/null
> > > +++ b/python/qemu/qmp/README.rst
> > > @@ -0,0 +1,9 @@
> > > +qemu.qmp package
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +This package provides a library used for connecting to and communica=
ting
> > > +with QMP servers. It is used extensively by iotests, vm tests,
> > > +acceptance tests, and other utilities in the ./scripts directory. It=
 is
> > > +not a fully-fledged SDK and is subject to change at any time.
> > > +
> > > +See the documentation in ``__init__.py`` for more information.
> > > diff --git a/python/qemu/utils/README.rst b/python/qemu/utils/README.=
rst
> > > new file mode 100644
> > > index 00000000000..975fbf4d7de
> > > --- /dev/null
> > > +++ b/python/qemu/utils/README.rst
> > > @@ -0,0 +1,7 @@
> > > +qemu.utils package
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +This package provides miscellaneous utilities used for testing and
> > > +debugging QEMU. It is used primarily by the vm and acceptance tests.
> > > +
> > > +See the documentation in ``__init__.py`` for more information.
> > > --=20
> > > 2.30.2
> > >=20
> > >=20
> >=20
> > With the ``setup.py`` and ``setuptools`` for consistency sake
> > mentioned in my first comment, all other comments are suggestions, so:
> >=20
>=20
> I took one of those two review comments, and acted on one of two of your
> suggestions.
>=20
> > Reviewed-by: Cleber Rosa <crosa@redhat.com>
> >=20
>=20
> So technically I didn't meet your criteria for taking this RB :) Let me k=
now
> if I can still apply it:
>=20
> diff --git a/python/README.rst b/python/README.rst
> index 7a0dc5dff4a..38b0c83f321 100644
> --- a/python/README.rst
> +++ b/python/README.rst
> @@ -7,17 +7,17 @@ then by package (e.g. ``qemu/machine``, ``qemu/qmp``,
> etc).
>=20
>  ``setup.py`` is used by ``pip`` to install this tooling to the current
>  environment. ``setup.cfg`` provides the packaging configuration used by
> -setup.py in a setuptools specific format. You will generally invoke it
> -by doing one of the following:
> +``setup.py`` in a setuptools specific format. You will generally invoke
> +it by doing one of the following:
>

OK.

>  1. ``pip3 install .`` will install these packages to your current
>     environment. If you are inside a virtual environment, they will
>     install there. If you are not, it will attempt to install to the
> -   global environment, which is not recommended.
> +   global environment, which is **not recommended**.
>

Nice :)

>  2. ``pip3 install --user .`` will install these packages to your user's
>     local python packages. If you are inside of a virtual environment,
> -   this will fail.
> +   this will fail; you likely want the first invocation above.
>=20
>  If you append the ``-e`` argument, pip will install in "editable" mode;
>  which installs a version of the package that installs a forwarder

Cool!  And, just to make sure, I'll give you not one but two:

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>

:)

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCtXm4ACgkQZX6NM6Xy
CfP6YQ//TQXyHujsEKXhFP9vLq5c4Rh8m4uI66f1weBdEbZkE5vKGN8c74wSyzHi
67pOMWY0hCsypuwfCFj6MBz+eQ9tcWxYwO2rqyOScIiclswsvkbOPlVIeGJ3FDKN
kVZCAFYEAZZlUOuqR/mtsZqg1961xF9/NX5qSn8vI+FKIOEOf+i1UAmB/QRmDu5C
863AaXfa9gIwQ2Z3DcFeUYJtb5bkXCj1HrocUW/AQr1gPIfvB/vxDPNbvfntH1Zo
WH2uBXxhOYcVWyDFmGECG2/c72SdFoP74JANcjQtIHD4WOfxc9d2NvTv+ifj2QsA
GY6CSLG12YmWhQvSFS0ThSk7gHRvaqV7YKR6x3mk0ugKHjkNQEWAVYRq8vQIY87a
uFt/cZOoxuWYe7GhvupJkBJx4N9CtIgKGwZlUX8Rxq8GjzzzfmxMH3+Kd2nKJeKl
OQ4k2izesCPL28xtLXZN8lFl6/cy8Y4UmmHtbk1rIPUJms3vFwDAmRO5EwuxmT1/
GdZSvoCOW6TGbBtMWeR+7sVO6bTqjqSmPKkUf2rZXhgpbMHxMmTsQBP7qQsi/ei3
mpJSMuxuYnc9O3Y1Qjh6IeK/P51f8BShdktcJJK2fXD6/7AwrqJDJf/xcppJ99KY
ZGiXxCvlUy6FzQ18F76R9RSpFiKmF5b15BUBRbINAU+6tKhtuj0=
=C4LG
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--


