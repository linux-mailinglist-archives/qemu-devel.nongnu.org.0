Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3216931D402
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 03:48:57 +0100 (CET)
Received: from localhost ([::1]:58992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCCtb-0006AP-Py
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 21:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCCsT-0005dQ-Cn
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 21:47:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCCsQ-000691-KA
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 21:47:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613530061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vp8TzNtj2RnyegvgRZE9Wngp4Z7/7Rtmrqz3/v7IzVc=;
 b=CpiH4w0cIyxnZ1Fj5zgySkEqKRiMYK0fZOrsm3IArsqVcAP2SWGmWfElaBNduPWeuSGRP8
 BOhGwhhv9ZHsMPt/BFc1asaic2iKwxIrCVrKgtCemVUOdB+5ADHTDSzHxjNBVqQYbNSBCs
 M2e9N/gdeYlXDIijnHy+HLG5j0Y9tcc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-m4kpAqbHMPmiJssAxstoUg-1; Tue, 16 Feb 2021 21:47:37 -0500
X-MC-Unique: m4kpAqbHMPmiJssAxstoUg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DFEC801965;
 Wed, 17 Feb 2021 02:47:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-29.rdu2.redhat.com
 [10.10.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BEFD5D9C0;
 Wed, 17 Feb 2021 02:47:31 +0000 (UTC)
Date: Tue, 16 Feb 2021 21:47:29 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 07/24] python: add directory structure README.rst files
Message-ID: <YCyDwYYhpYEz2onl@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-8-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211185856.3975616-8-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xEP6nlYbttz3B2/0"
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
 qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--xEP6nlYbttz3B2/0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 01:58:39PM -0500, John Snow wrote:
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
>  python/qemu/utils/README.rst   |  9 ++++++++
>  5 files changed, 76 insertions(+)
>  create mode 100644 python/README.rst
>  create mode 100644 python/qemu/README.rst
>  create mode 100644 python/qemu/machine/README.rst
>  create mode 100644 python/qemu/qmp/README.rst
>  create mode 100644 python/qemu/utils/README.rst
>

It's not often I complain about too much documentation, but I honestly
think this will not scale.  I understand that the intention is to help
users browsing through the directory structure it has a huge potential
for bit rot.

The READMEs at the first two levels seem OK, but the ones at the
subpackages level will be a maintainance nightmare.  I would *very
much* move those (subpackage ones) documentation into the Python file
themselves.

> diff --git a/python/README.rst b/python/README.rst
> new file mode 100644
> index 00000000000..6a14b99e104
> --- /dev/null
> +++ b/python/README.rst
> @@ -0,0 +1,41 @@
> +QEMU Python Tooling
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This directory houses Python tooling used by the QEMU project to build,
> +configure, and test QEMU. It is organized by namespace (``qemu``), and
> +then by package (``qemu/machine``, ``qemu/qmp``).
> +
> +``setup.py`` is used by ``pip`` to install this tooling to the current
> +environment. ``setup.cfg`` provides the packaging configuration used by
> +setup.py in a setuptools specific format. You will generally invoke it
> +by doing one of the following:
> +
> +1. ``pip3 install .`` will install these packages to your current
> +   environment. If you are inside a virtual environment, they will
> +   install there. If you are not, it will attempt to install to the
> +   global environment, which is not recommended.
> +
> +2. ``pip3 install --user .`` will install these packages to your user's
> +   local python packages. If you are inside of a virtual environment,
> +   this will fail.
> +
> +If you amend the ``-e`` argument, pip will install in "editable" mode;
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
> index 00000000000..4b33c1f27e1
> --- /dev/null
> +++ b/python/qemu/utils/README.rst
> @@ -0,0 +1,9 @@
> +qemu.utils package
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This package provides misc utilities used for testing and debugging
> +QEMU. It is used most directly by the qemu.machine package, but has some
> +uses by the vm and acceptance tests for determining accelerator support.
> +
> +See the documentation in ``__init__.py`` and ``accel.py`` for more
> +information.

And example of the bit rot and the huge maintainance cost is when a
new file is added here, let's say, "qemu/utils/network.py".  I think
your good intentions would quickly backfire.

Regards,
- Cleber.

--xEP6nlYbttz3B2/0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAsg78ACgkQZX6NM6Xy
CfNYoQ//RxRV9X1LREQ/PNUQpYmKln86FaX3ZllpAyHSHMGHxC8lYrUHuku68sZm
s3KLMSnbx1hrviZs+6pQw+3laP4Gvb0QPFyQz8DrsoWcgPCTW0qK5xn1mCneSLb5
ASO0iW0cO6Q/bZuTqVoFLokBVtPn9NQ0UzjHrZpdZONwSkMVbbbrelFAu2JdY3x+
/wmTXX9AqXOQCU7u1h+mJg6473uZkQG9mdalKwuXwQpBmJwcLcysHC1l36wNnXGF
LRfpymkcyC1vMS+YWuMkqzkrFdo0s7igpE0c0Lk+MedvLP2J/2sydIJwb6R/Fjl5
dr4EMd8/MNe66pEBERqU0NYNYgffhRy5hxgu6Mc/GH2ZzTgsGEX91kRkkSsug135
xiuFIIC5NaShjo47lYYPatBtQUwxMUeikCnBtPpbtr/FfZZgtz5mxxlrGNW2x9ON
SCp7tjwj/6XhlUAsrHkUSDy1XbzoRGiBdh7DOZ0ID4sQFWyUEFuOZxSM5lcgIDzv
IiZwkgyVk5+5YhC3mCIfPFfEUNDW6M3m1GaA7qvyJ+LCOZ8rVMH2PJRlSNQusb8J
5c3W0pCl8lM60JoOOdRHYVPGSlEJ2bqpb5bl7q6DaJl1hayIzunA4NU1dLCNW+7X
PHW83xL6CEIKO2g2Eu0ug5UKfwdxg+giLDmUPFUagIuBWSJDd5M=
=Fl1e
-----END PGP SIGNATURE-----

--xEP6nlYbttz3B2/0--


