Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1033738F841
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:38:06 +0200 (CEST)
Received: from localhost ([::1]:48084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMxI-0004Vq-GZ
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llMsy-0005ef-VR
 for qemu-devel@nongnu.org; Mon, 24 May 2021 22:33:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llMsv-0002KA-72
 for qemu-devel@nongnu.org; Mon, 24 May 2021 22:33:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621910012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dfrNnk6eHHM7Mp+GNpJ7l5AMS4dT3phTO5h1fLb6eUA=;
 b=BbaGsYOiS57YElLa5FG6FcgImMawJG6msniNs34Q9FUv74ZSht9ucq6taALuQ6nKTgNVZk
 afKWxfLBpZsoVV5LyNKCbnmcJrSCD/HvWj2T7l+UJ71WDPiDDhvtnkxuGgZqF3RND/k4eI
 rOdxBIbKvhJfaszHj1ieMV4pk52891g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-QtyXh8kHNeOCsoIxvm_xHw-1; Mon, 24 May 2021 22:33:28 -0400
X-MC-Unique: QtyXh8kHNeOCsoIxvm_xHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B9AA801107;
 Tue, 25 May 2021 02:33:27 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-137.rdu2.redhat.com
 [10.10.113.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD0D2503EB;
 Tue, 25 May 2021 02:33:17 +0000 (UTC)
Date: Mon, 24 May 2021 22:33:15 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 06/25] python: add directory structure README.rst files
Message-ID: <YKxh6/mwCEqRLIvH@localhost.localdomain>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-7-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210512231241.2816122-7-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="In0wKq96+gTFuN50"
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

--In0wKq96+gTFuN50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 07:12:22PM -0400, John Snow wrote:
> Add short readmes to python/, python/qemu/, python/qemu/machine,
> python/qemu/qmp, and python/qemu/utils that explain the directory
> hierarchy. These readmes are visible when browsing the source on
> e.g. gitlab/github and are designed to help new developers/users quickly
> make sense of the source tree.
>=20
> They are not designed for inclusion in a published manual.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/README.rst              | 41 ++++++++++++++++++++++++++++++++++
>  python/qemu/README.rst         |  8 +++++++
>  python/qemu/machine/README.rst |  9 ++++++++
>  python/qemu/qmp/README.rst     |  9 ++++++++
>  python/qemu/utils/README.rst   |  7 ++++++
>  5 files changed, 74 insertions(+)
>  create mode 100644 python/README.rst
>  create mode 100644 python/qemu/README.rst
>  create mode 100644 python/qemu/machine/README.rst
>  create mode 100644 python/qemu/qmp/README.rst
>  create mode 100644 python/qemu/utils/README.rst
>=20
> diff --git a/python/README.rst b/python/README.rst
> new file mode 100644
> index 00000000000..7a0dc5dff4a
> --- /dev/null
> +++ b/python/README.rst
> @@ -0,0 +1,41 @@
> +QEMU Python Tooling
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This directory houses Python tooling used by the QEMU project to build,
> +configure, and test QEMU. It is organized by namespace (``qemu``), and
> +then by package (e.g. ``qemu/machine``, ``qemu/qmp``, etc).
> +
> +``setup.py`` is used by ``pip`` to install this tooling to the current
> +environment. ``setup.cfg`` provides the packaging configuration used by
> +setup.py in a setuptools specific format. You will generally invoke it

For consistency, ``setup.py`` here?  Also, I guess ``setuptools`` as it
falls in the same category of ``pip``.

> +by doing one of the following:
> +
> +1. ``pip3 install .`` will install these packages to your current
> +   environment. If you are inside a virtual environment, they will
> +   install there. If you are not, it will attempt to install to the
> +   global environment, which is not recommended.

Maybe some **emphasis** on **not**?

> +
> +2. ``pip3 install --user .`` will install these packages to your user's
> +   local python packages. If you are inside of a virtual environment,
> +   this will fail.
> +

Maybe note that, if you are inside of a virtual environment, option #1
will probably be what users doing "--user" in a venv actually want.

> +If you append the ``-e`` argument, pip will install in "editable" mode;
> +which installs a version of the package that installs a forwarder
> +pointing to these files, such that the package always reflects the
> +latest version in your git tree.
> +
> +See `Installing packages using pip and virtual environments
> +<https://packaging.python.org/guides/installing-using-pip-and-virtual-en=
vironments/>`_
> +for more information.
> +
> +
> +Files in this directory
> +-----------------------
> +
> +- ``qemu/`` Python package source directory.
> +- ``PACKAGE.rst`` is used as the README file that is visible on PyPI.org=
.
> +- ``README.rst`` you are here!
> +- ``VERSION`` contains the PEP-440 compliant version used to describe
> +  this package; it is referenced by ``setup.cfg``.
> +- ``setup.cfg`` houses setuptools package configuration.
> +- ``setup.py`` is the setuptools installer used by pip; See above.

Not only used by pip... but I understand the reason for limiting the
amount of information given here.

> diff --git a/python/qemu/README.rst b/python/qemu/README.rst
> new file mode 100644
> index 00000000000..d04943f526c
> --- /dev/null
> +++ b/python/qemu/README.rst
> @@ -0,0 +1,8 @@
> +QEMU Python Namespace
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This directory serves as the root of a `Python PEP 420 implicit
> +namespace package <https://www.python.org/dev/peps/pep-0420/>`_.
> +
> +Each directory below is assumed to be an installable Python package that
> +is available under the ``qemu.<package>`` namespace.
> diff --git a/python/qemu/machine/README.rst b/python/qemu/machine/README.=
rst
> new file mode 100644
> index 00000000000..ac2b4fffb42
> --- /dev/null
> +++ b/python/qemu/machine/README.rst
> @@ -0,0 +1,9 @@
> +qemu.machine package
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This package provides core utilities used for testing and debugging
> +QEMU. It is used by the iotests, vm tests, acceptance tests, and several
> +other utilities in the ./scripts directory. It is not a fully-fledged
> +SDK and it is subject to change at any time.
> +
> +See the documentation in ``__init__.py`` for more information.
> diff --git a/python/qemu/qmp/README.rst b/python/qemu/qmp/README.rst
> new file mode 100644
> index 00000000000..c21951491cf
> --- /dev/null
> +++ b/python/qemu/qmp/README.rst
> @@ -0,0 +1,9 @@
> +qemu.qmp package
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This package provides a library used for connecting to and communicating
> +with QMP servers. It is used extensively by iotests, vm tests,
> +acceptance tests, and other utilities in the ./scripts directory. It is
> +not a fully-fledged SDK and is subject to change at any time.
> +
> +See the documentation in ``__init__.py`` for more information.
> diff --git a/python/qemu/utils/README.rst b/python/qemu/utils/README.rst
> new file mode 100644
> index 00000000000..975fbf4d7de
> --- /dev/null
> +++ b/python/qemu/utils/README.rst
> @@ -0,0 +1,7 @@
> +qemu.utils package
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This package provides miscellaneous utilities used for testing and
> +debugging QEMU. It is used primarily by the vm and acceptance tests.
> +
> +See the documentation in ``__init__.py`` for more information.
> --=20
> 2.30.2
>=20
>=20

With the ``setup.py`` and ``setuptools`` for consistency sake
mentioned in my first comment, all other comments are suggestions, so:

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--In0wKq96+gTFuN50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCsYeMACgkQZX6NM6Xy
CfMNsg/+PKdiMCaG+1Ok7kyBHSvtZZaZPTS8eLxR3xSKrj+puO6BEKUnLhCcc1e5
7JHnQuw2f+I3G1P7CbzZPD/xyhI/giKPJYYIyXb4AK9HmcYb5fWMFWeacQSdFjUd
qJBh3xMVdGVNkudWxKI+AkUPGDZ6WsMN4Req5L6uKY3yoPpKwrMxqan3YCGzsJYy
TVx90vHK1auygM06CPh5tPHWX0E/78FqPjFmFPBWEw9brk1Q62YpsqhVEWuS65FK
ewtMFpKHIukIJpPFoNqOUEjnhMIqQZm873nvSO1y50CI8hSdYYa3z96Tq5vOwrfZ
MKcMaLpdJIRWBWoVYsFqS20VskmJLHt8EKa3qoL4Myf15n98lEOhvLX/WOwMpfYF
j/0KFgZc4eN2x3EGhw1jziCNen8hbfMj6Y/kPjQuAKq2RH7WJL4oko/nXsKQnYCa
A/eolcbbbj8s7DOunQCS5GYWN1G9nPm2OjUx880xFiFdXGfCMwmXXtQEmIv8wx16
hrGxGoeUYrfxB0id0W0VvCnKybDP9VrCRAoc2LbEEAdCHsb8b4sc3Ojex9wNyAFd
lVaIC7/Fcpqq6sCI1SSrabXrIOrqjWi4qsVhp3BQq+salnQzFGzDtJ+8c5ZQ9TIK
WbdXt+nvatTeWIE2sWVpp2Xiz50UiqsqazTAt9cMWLGG6fTCVX4=
=vV5o
-----END PGP SIGNATURE-----

--In0wKq96+gTFuN50--


