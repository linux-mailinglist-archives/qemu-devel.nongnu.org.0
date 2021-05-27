Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5063933B4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:26:54 +0200 (CEST)
Received: from localhost ([::1]:47158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmIqT-0005vt-HR
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmIkR-0004pO-Qf
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:20:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmIiV-0006H9-Bk
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622132318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l/dVX2JsIkBMSF6cF7ICdFfg6f1FPrzVenWS+ZB8CsM=;
 b=Ab4y4WtomqbKVjOGpFog7a/R71xWH0/kAkHC95QRdAICNHEt2cry0fkyxqXHPBjJhg5U5o
 vTefkDJuN6DVlHiXKKteBTKT3/vjJsliRdssn6j8P2xYiP22KFNz5hPQO9Eq+Eg7TGMsPA
 7UEE+IZ4OEquUEj8VUajDDeOj5VeXQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-_DlHMlyMMCGrup2DK8T70g-1; Thu, 27 May 2021 12:18:34 -0400
X-MC-Unique: _DlHMlyMMCGrup2DK8T70g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A88D653;
 Thu, 27 May 2021 16:18:32 +0000 (UTC)
Received: from localhost (ovpn-114-2.phx2.redhat.com [10.3.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 567C55D6D3;
 Thu, 27 May 2021 16:18:25 +0000 (UTC)
Date: Thu, 27 May 2021 12:05:43 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v7 10/31] python: add qemu package installer
Message-ID: <20210527160543.GC1916721@amachine.somewhere>
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-11-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210526002454.124728-11-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 08:24:33PM -0400, John Snow wrote:
> Add setup.cfg and setup.py, necessary for installing a package via
> pip. Add a ReST document (PACKAGE.rst) explaining the basics of what
> this package is for and who to contact for more information. This
> document will be used as the landing page for the package on PyPI.
>=20
> List the subpackages we intend to package by name instead of using
> find_namespace because find_namespace will naively also packages tests,
> things it finds in the dist/ folder, etc. I could not figure out how to
> modify this behavior; adding allow/deny lists to setuptools kept
> changing the packaged hierarchy. This works, roll with it.
>=20
> I am not yet using a pyproject.toml style package manifest, because
> "editable" installs are not defined (yet?) by PEP-517/518.
>=20
> I consider editable installs crucial for development, though they have
> (apparently) always been somewhat poorly defined.
>=20
> Pip now (19.2 and later) now supports editable installs for projects
> using pyproject.toml manifests, but might require the use of the
> --no-use-pep517 flag, which somewhat defeats the point. Full support for
> setup.py-less editable installs was not introduced until pip 21.1.1:
> https://github.com/pypa/pip/pull/9547/commits/7a95720e796a5e56481c1cc20b6=
ce6249c50f357
>=20
> For now, while the dust settles, stick with the de-facto
> setup.py/setup.cfg combination supported by setuptools. It will be worth
> re-evaluating this point again in the future when our supported build
> platforms all ship a fairly modern pip.
>=20
> Additional reading on this matter:
>=20
> https://github.com/pypa/packaging-problems/issues/256
> https://github.com/pypa/pip/issues/6334
> https://github.com/pypa/pip/issues/6375
> https://github.com/pypa/pip/issues/6434
> https://github.com/pypa/pip/issues/6438
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/PACKAGE.rst | 33 +++++++++++++++++++++++++++++++++
>  python/setup.cfg   | 22 ++++++++++++++++++++++
>  python/setup.py    | 23 +++++++++++++++++++++++
>  3 files changed, 78 insertions(+)
>  create mode 100644 python/PACKAGE.rst
>  create mode 100644 python/setup.cfg
>  create mode 100755 python/setup.py
>=20
> diff --git a/python/PACKAGE.rst b/python/PACKAGE.rst
> new file mode 100644
> index 00000000000..1bbfe1b58e2
> --- /dev/null
> +++ b/python/PACKAGE.rst
> @@ -0,0 +1,33 @@
> +QEMU Python Tooling
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This package provides QEMU tooling used by the QEMU project to build,
> +configure, and test QEMU. It is not a fully-fledged SDK and it is subjec=
t
> +to change at any time.
> +
> +Usage
> +-----
> +
> +The ``qemu.qmp`` subpackage provides a library for communicating with
> +QMP servers. The ``qemu.machine`` subpackage offers rudimentary
> +facilities for launching and managing QEMU processes. Refer to each
> +package's documentation
> +(``>>> help(qemu.qmp)``, ``>>> help(qemu.machine)``)
> +for more information.
> +
> +Contributing
> +------------
> +
> +This package is maintained by John Snow <jsnow@redhat.com> as part of
> +the QEMU source tree. Contributions are welcome and follow the `QEMU
> +patch submission process
> +<https://wiki.qemu.org/Contribute/SubmitAPatch>`_, which involves
> +sending patches to the QEMU development mailing list.
> +
> +John maintains a `GitLab staging branch
> +<https://gitlab.com/jsnow/qemu/-/tree/python>`_, and there is an
> +official `GitLab mirror <https://gitlab.com/qemu-project/qemu>`_.
> +
> +Please report bugs on the `QEMU issue tracker
> +<https://gitlab.com/qemu-project/qemu/-/issues>`_ and tag ``@jsnow`` in
> +the report.
> diff --git a/python/setup.cfg b/python/setup.cfg
> new file mode 100644
> index 00000000000..3fa92a2e73f
> --- /dev/null
> +++ b/python/setup.cfg
> @@ -0,0 +1,22 @@
> +[metadata]
> +name =3D qemu
> +maintainer =3D QEMU Developer Team
> +maintainer_email =3D qemu-devel@nongnu.org
> +url =3D https://www.qemu.org/
> +download_url =3D https://www.qemu.org/download/
> +description =3D QEMU Python Build, Debug and SDK tooling.
> +long_description =3D file:PACKAGE.rst
> +long_description_content_type =3D text/x-rst
> +classifiers =3D
> +    Development Status :: 3 - Alpha
> +    License :: OSI Approved :: GNU General Public License v2 (GPLv2)
> +    Natural Language :: English
> +    Operating System :: OS Independent
> +    Programming Language :: Python :: 3 :: Only
> +
> +[options]
> +python_requires =3D >=3D 3.6
> +packages =3D
> +    qemu.qmp
> +    qemu.machine
> +    qemu.utils

^ Good!

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCvw1cACgkQZX6NM6Xy
CfOcNBAAjuoB0OG4siWtY40//Hk8i7fyuN5JpDomuWfG4aomqzRkeQevl9fnuqlI
HxEkG1ZBupMm+pksw4iEHI50yEgX0vzXQ/WOIzSoToseXrO7Nv1o4zG8a87gOIMT
JGSG6mdznYwqtR9EbXRIgx5jGzW6jtPe3hXSp4KU6bXAfhTWIGTc569Z2EkLl1qm
j69d8PTt6J15gvWbkor4uUgIvZ3Ams9XV2VjzLFgYBKy3ynj1KUWVt4gMUbulvDB
DZeJnP26Cpr+pPO4hlM3nR8Ft95t+m9tKiMWrUKxBOl4d/+ANGrG92vRXga5H7Ls
it4LEJoZ6vktKIwgciPN7wjdvGKtpjzXv8LzzIj7fqxzQuBDY0FQmHUUEHnNlbip
Urr8K98VLRZ+f830PG6pRhK5Ngv0eC3YFpbezegacMLiLLgCZYgY6dhewf1d/I68
s6f/jn1QlJJavfByC+QVUyB916mRXp3hJmsroJfJMvo2dnYohBAxMLIpWWA42JyY
3LbWEp7yldukKcn1yrr9UsotBB2EDHTdwy0WW4gQvIDRrKloLvj0qW7//nzxdlKN
LLppraeRKT6rn0JY3A732uiSmkMYjqDlSNFbetJIzxGFgadwsfs9S62NUh2T3Hgq
8sO1x7jWIqcaIeZG+eQVZNCfRBUD1NJMQ4h8WC7Oax//YogX3ko=
=rHaj
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--


