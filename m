Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CDD38BD19
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 06:02:18 +0200 (CEST)
Received: from localhost ([::1]:34718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljwMb-0004S3-8u
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 00:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1ljwKy-0003kS-UH
 for qemu-devel@nongnu.org; Fri, 21 May 2021 00:00:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1ljwKm-0001ZT-Fh
 for qemu-devel@nongnu.org; Fri, 21 May 2021 00:00:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621569622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g6itQWKuksZj1TrEB1dMdv1/Wia2e/+XQS8EO+Y5GsY=;
 b=hf83QUAXilNV6wfZPU+4n1Aq8qca86vMjt0fwc+wLTc8FQSViS0XfFGpXf7G58VDlUTml1
 hynDsOjeJtz0+yBMEcYBFkDmk7T3vGFseNEt+Iu5qxhy05VMYu0GSy5mJ9jaFeZk6t800Y
 vm7OHk0YjsKcwdHIrWczXPB6M/hwfR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-a6ZGQiAvOhOGcimL7X_rZQ-1; Fri, 21 May 2021 00:00:18 -0400
X-MC-Unique: a6ZGQiAvOhOGcimL7X_rZQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79E82180FD66;
 Fri, 21 May 2021 04:00:17 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-222.rdu2.redhat.com
 [10.10.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C33D863623;
 Fri, 21 May 2021 04:00:03 +0000 (UTC)
Date: Fri, 21 May 2021 00:00:01 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 04/25] python: add qemu package installer
Message-ID: <YKcwI3iA9qTY6Mzc@localhost.localdomain>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-5-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210512231241.2816122-5-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uJgBM31xuf/phJlB"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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

--uJgBM31xuf/phJlB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 07:12:20PM -0400, John Snow wrote:
> Add setup.cfg and setup.py, necessary for installing a package via
> pip. Add a ReST document (PACKAGE.rst) explaining the basics of what
> this package is for and who to contact for more information. This
> document will be used as the landing page for the package on PyPI.
>=20
> I am not yet using a pyproject.toml style package manifest, because
> "editable" installs are not defined (yet?) by PEP-517/518.
>=20
> I consider editable installs crucial for development, though they have
> (apparently) always been somewhat poorly defined.
>

They are crucial for development indeed, so I agree with your overall
choices here.

> Pip now (19.2 and later) now supports editable installs for projects
> using pyproject.toml manifests, but might require the use of the
> --no-use-pep517 flag, which somewhat defeats the point.
>

Just to make it clear for other people reading this, it means that
even with the very latest pip release (21.1.1), you *must* have a
setup.py or setup.cfg file to use editable (development) installs[1]
You can *not* rely solely on a pyproject.toml setup.

[1] https://github.com/pypa/pip/pull/9547/commits/7a95720e796a5e56481c1cc20=
b6ce6249c50f357

> For now, while the dust settles, stick with the de-facto
> setup.py/setup.cfg combination supported by setuptools. It will be worth
> re-evaluating this point again in the future when our supported build
> platforms all ship a fairly modern pip.
>

Agreed, but let's not hold our breath given that even pip 21.1.1 still
doesn't support that.  My guesstimate is 6-12 months for the feature to
be developed/merged, and let's say another 12 months for our supported
build platforms to ship it.

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
>  python/setup.cfg   | 19 +++++++++++++++++++
>  python/setup.py    | 23 +++++++++++++++++++++++
>  3 files changed, 75 insertions(+)
>  create mode 100644 python/PACKAGE.rst
>  create mode 100644 python/setup.cfg
>  create mode 100755 python/setup.py
>
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
> index 00000000000..dd71640fc2f
> --- /dev/null
> +++ b/python/setup.cfg
> @@ -0,0 +1,19 @@
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
> +packages =3D find_namespace:
> diff --git a/python/setup.py b/python/setup.py
> new file mode 100755
> index 00000000000..2014f81b757
> --- /dev/null
> +++ b/python/setup.py
> @@ -0,0 +1,23 @@
> +#!/usr/bin/env python3
> +"""
> +QEMU tooling installer script
> +Copyright (c) 2020-2021 John Snow for Red Hat, Inc.
> +"""
> +
> +import setuptools
> +import pkg_resources
> +
> +
> +def main():
> +    """
> +    QEMU tooling installer
> +    """
> +
> +    # https://medium.com/@daveshawley/safely-using-setup-cfg-for-metadat=
a-1babbe54c108
> +    pkg_resources.require('setuptools>=3D39.2')
> +
> +    setuptools.setup()
> +
> +
> +if __name__ =3D=3D '__main__':
> +    main()
> --=20
> 2.30.2
>=20
>=20

BTW, about the need to have a "setup.py", before pip 21.1.1:

  $ rm setup.py
  $ pip install -e .
  ERROR: File "setup.py" not found. Directory cannot be installed in editab=
le mode: /home/cleber/src/qemu/python

On pip 21.1.1:

   $ pip install -e .=20
   Obtaining file:///home/cleber/src/qemu/python
   Installing collected packages: qemu
     Running setup.py develop for qemu
   Successfully installed qemu-0.0.0

Side note: The "Running setup.py ..." message given by pip 21.1.1,
even though there is *not* a "setup.py" is rather confusing.

Anyway, we may be able to drop setup.py either when we find pip 21.1.1
or later in our "common build environments", or if we require people
hacking on the Python module to "pip install --upgrade pip".

I'll be repeating myself here, but I believe you made the right
choices at this time, and based on my testing I can successfully
install/develop using "python setup.py" and "pip", so:

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--uJgBM31xuf/phJlB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCnMEEACgkQZX6NM6Xy
CfO6NRAAuZQTIPNfwh00Jn7JkQEugvyltefgEWuNTrKtX+LW0TdrckjdddWmPTPe
CWl47HC90Wr+uLKUOa3zp1XcGD7BTdm0sjljrwYNF2vKnfnYcx0eyRF0vVwuFhqR
57/CvrFLHC4RQQ50AQYl9SszH3sC8XxJgXsJQKTPsqFeHmqnJYYOpuwe5Cfk8Mh2
t1S/ydq0Ca8B0WSG5itHQgZJrOqix5VSr8uggyV8bJ45HVHAY2Oq0+UFmbzqDlWM
0XB5fof6PSHZAmnLqxdwulR/L7wKEKN3hw4BID47r8dNT4VOqeD70V6dVE6PuRlL
h5hr2pqeOTbBguBhQ8wRqsk9MxsrUjJRKaFWf0W4ROt88GGIedV4AyqFjShvM8WZ
dmaPmw5QXmG4oGxZYbUoEhbfG552hxQkTbV24ykf4QCPRWXx4MnycHikuEmqy1qm
Rr21o4RL0bNGp+oc+mZ4McIFN4+Anl5DnihIZm7HPbrSGadUFKJxeZ2T8dj7UL/G
o3H/Ymcl3QO4Upy65qfvcoBlZ2RWfiR6LFUvCne4Yx8gZBduomRxGfOVrf9Okqy0
YSCGCzunfAvUTzNXrat3VNCnMTGVrnW0GcDTlPbv5GXA68eW0B+7hs6eBgLF4wkr
UpENaeNjs8vY5gjZgwsDX7urp54hHHJqcTEaE5iv7la5P+6ic+k=
=AGIE
-----END PGP SIGNATURE-----

--uJgBM31xuf/phJlB--


