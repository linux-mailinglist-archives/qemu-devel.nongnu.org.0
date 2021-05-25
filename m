Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850D0390999
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 21:25:18 +0200 (CEST)
Received: from localhost ([::1]:57866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llcg1-00050r-6e
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 15:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llcfA-0004AT-J4
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:24:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llcf7-0002Qe-My
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621970661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f9TTCrIFTeQtXhvZ+BI8ozFwkTkEOzNoX0S1OSW5dmc=;
 b=U93t11G/FqRRXBvUgfkSG6J56TUKfZHgGx9Z2J7khg70BMK+SD7p5KxehKdGoZHW03ZiMo
 CFMawCMsFqXym49AbRR/ISGNKY/Kg4ra9blyhsJL1YfSNk/AfdI0fJWnzxZAN+D4M45TAk
 tIzNpcVcTZ032UGIZdTvJuX8nXYLvkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-DhXwhvrtM_GEJy9Dls3v1A-1; Tue, 25 May 2021 15:24:16 -0400
X-MC-Unique: DhXwhvrtM_GEJy9Dls3v1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03FF2107ACCD;
 Tue, 25 May 2021 19:24:15 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-219.ams2.redhat.com
 [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E2F15C1C2;
 Tue, 25 May 2021 19:24:03 +0000 (UTC)
Date: Tue, 25 May 2021 15:24:00 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 22/25] python: add Makefile for some common tasks
Message-ID: <YK1O0JcbsnN/MD6F@localhost.localdomain>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-23-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210512231241.2816122-23-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QB6tef+xSQgnIgY/"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

--QB6tef+xSQgnIgY/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 07:12:38PM -0400, John Snow wrote:
> Add "make venv" to create the pipenv-managed virtual environment that
> contains our explicitly pinned dependencies.
>=20
> Add "make check" to run the python linters [in the host execution
> environment].
>=20
> Add "make venv-check" which combines the above two: create/update the
> venv, then run the linters in that explicitly managed environment.
>=20
> Add "make develop" which canonizes the runes needed to get both the
> linting pre-requisites (the "[devel]" part), and the editable
> live-install (the "-e" part) of these python libraries.
>=20
> make clean: delete miscellaneous python packaging output possibly
> created by pipenv, pip, or other python packaging utilities
>=20
> make distclean: delete the above, the .venv, and the editable "qemu"
> package forwarder (qemu.egg-info) if there is one.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/README.rst |  3 +++
>  python/Makefile   | 42 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 python/Makefile
>=20
> diff --git a/python/README.rst b/python/README.rst
> index e107bd12a69..3e09d20c23c 100644
> --- a/python/README.rst
> +++ b/python/README.rst
> @@ -35,6 +35,9 @@ Files in this directory
>  - ``qemu/`` Python package source directory.
>  - ``tests/`` Python package tests directory.
>  - ``avocado.cfg`` Configuration for the Avocado test-runner.
> +  Used by ``make check`` et al.
> +- ``Makefile`` provides some common testing/installation invocations.
> +  Try ``make help`` to see available targets.
>  - ``MANIFEST.in`` is read by python setuptools, it specifies additional =
files
>    that should be included by a source distribution.
>  - ``PACKAGE.rst`` is used as the README file that is visible on PyPI.org=
.
> diff --git a/python/Makefile b/python/Makefile
> new file mode 100644
> index 00000000000..184f59e5634
> --- /dev/null
> +++ b/python/Makefile
> @@ -0,0 +1,42 @@
> +.PHONY: help venv venv-check check clean distclean develop
> +
> +help:
> +=09@echo "python packaging help:"
> +=09@echo ""
> +=09@echo "make venv:       Create pipenv's virtual environment."
> +=09@echo "    NOTE: Requires Python 3.6 and pipenv."
> +=09@echo "          Will download packages from PyPI."
> +=09@echo "    Hint: (On Fedora): 'sudo dnf install python36 pipenv'"
> +=09@echo ""
> +=09@echo "make venv-check: run linters using pipenv's virtual environmen=
t."
> +=09@echo "    Hint: If you don't know which test to run, run this one!"
> +=09@echo ""
> +=09@echo "make develop:    Install deps for 'make check', and"
> +=09@echo "                 the qemu libs in editable/development mode."
> +=09@echo ""
> +=09@echo "make check:      run linters using the current environment."
> +=09@echo ""

Let's observe how this will be used (or misused).  I fear most people
will jump into `make check`, even though you have described `make
venv-check` as the primary choice.

We have a precedent with `make check-acceptance` that will create a
venv and use it by default, so we can consider that as a fallback
strategy based on user feedback.

> +=09@echo "make clean:      remove build output."
> +=09@echo ""
> +=09@echo "make distclean:  remove venv files, qemu package forwarder, an=
d"
> +=09@echo "                 everything from 'make clean'."
> +
> +venv: .venv
> +.venv: Pipfile.lock
> +=09@PIPENV_VENV_IN_PROJECT=3D1 pipenv sync --dev --keep-outdated
> +=09@touch .venv
> +
> +venv-check: venv
> +=09@pipenv run make check
> +
> +develop:
> +=09pip3 install -e .[devel]
> +
> +check:
> +=09@avocado --config avocado.cfg run tests/
> +
> +clean:
> +=09rm -rf build/ dist/
> +

Usually `python3 setup.py clean --all` would be the better choice here,
but, it doesn't clean `dist/`, so I'm OK with this.

> +distclean: clean
> +=09rm -rf qemu.egg-info/ .venv/
> --=20
> 2.30.2
>=20
>=20

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--QB6tef+xSQgnIgY/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCtTswACgkQZX6NM6Xy
CfNTtxAAsEOj8XfUl1PBXx2YK0rI47efLGtA/lu87ACXHi9+VidEFOdoa+UpXemH
nLlD7bJnqNdGLO4BJHl0gdvMd+MdENH9pcm7u9gFIGv91+p4J9fEuoX7HJdqVTQ1
Ca0NAv6ORh0/50518yupHGuiDDr5mJW7zA8NN9Jcc3Pw/PMjxBy7PDNufRbNw7ne
TdiqXqhYDOo1IWRFGsFWF5RGFRjd/dXh1MSGIjH7VgQ08pSOiBOGwW5SBL38f+mn
AnmxHdsqusku9+wB2BC/rJRagbMSaVlZXDP6jd7Rr/Uimim98Ujpg+GnbFJxBAEv
28LfJ2+Wko3ffMdLWGL4CqCv9G237aQWjVoElB2Xr9bydaxuLJL+aq2OPl/fmMiu
s60bEukdGIYNKE0gry51aB/N3Bstjnc/TcblEwzqzth5j6Zwqb9oXfU/j6dx95sl
mr/CF83R/4Kgn6r5ik8MxDPhoouifIbBsAqdjXVtj7NvlQj9k8U1GyMeItgE+gO7
HwmMvYIRIPetJaUFN12Z1dQi+wYKC4lSXQoSwn6qAlzqGpigKpEUgUyUShh3H012
FdioSmOJN2eGnXHLqwW0qpZJ4eS+Z8OxIYV0VGiOBbcIheyVIFT9vamYtsEsxfmJ
j1XRi5wQgRYjK49Gya7qpcbR8KnIH+jmdgZMaPAq19TPnSWwsy0=
=dmbt
-----END PGP SIGNATURE-----

--QB6tef+xSQgnIgY/--


