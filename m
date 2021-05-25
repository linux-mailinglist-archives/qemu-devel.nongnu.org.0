Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D32F390AB2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 22:48:46 +0200 (CEST)
Received: from localhost ([::1]:49222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lldyn-00046m-AW
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 16:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lldqU-0004oC-Cr
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:40:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lldqO-0005Zm-CX
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621975203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MAiyX1by7BcQwW/+wcQWTbsFMK5SohQKEwgJ6J2Wibc=;
 b=DxMRPuCsIJ00Ehx+beZ7K2DM8kKcxiC8UFP3MJbU8a2ZQa43p6HGRAfOB22J9a5uLwEicG
 yh+xjgam6CggcxSC1LH39BFLUHPavw58R8hRASEwG/bQBQ7aVAPLRzNey6O48LoHI5c2b6
 RzTSsairtSXsLC6f8cOZWPO/yfNLTtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-qCqsbADvNjS8xsWX-o5yXw-1; Tue, 25 May 2021 16:39:59 -0400
X-MC-Unique: qCqsbADvNjS8xsWX-o5yXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E031C7440;
 Tue, 25 May 2021 20:39:58 +0000 (UTC)
Received: from localhost (ovpn-114-2.phx2.redhat.com [10.3.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2AA560CEC;
 Tue, 25 May 2021 20:39:50 +0000 (UTC)
Date: Tue, 25 May 2021 16:39:46 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 22/25] python: add Makefile for some common tasks
Message-ID: <20210525203946.GF1567491@amachine.somewhere>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-23-jsnow@redhat.com>
 <YK1O0JcbsnN/MD6F@localhost.localdomain>
 <d7c34ee2-17d4-af0d-e8cd-851bf8e1e297@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d7c34ee2-17d4-af0d-e8cd-851bf8e1e297@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SxgehGEc6vB0cZwN"
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

--SxgehGEc6vB0cZwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 03:45:26PM -0400, John Snow wrote:
> On 5/25/21 3:24 PM, Cleber Rosa wrote:
> > On Wed, May 12, 2021 at 07:12:38PM -0400, John Snow wrote:
> > > Add "make venv" to create the pipenv-managed virtual environment that
> > > contains our explicitly pinned dependencies.
> > >=20
> > > Add "make check" to run the python linters [in the host execution
> > > environment].
> > >=20
> > > Add "make venv-check" which combines the above two: create/update the
> > > venv, then run the linters in that explicitly managed environment.
> > >=20
> > > Add "make develop" which canonizes the runes needed to get both the
> > > linting pre-requisites (the "[devel]" part), and the editable
> > > live-install (the "-e" part) of these python libraries.
> > >=20
> > > make clean: delete miscellaneous python packaging output possibly
> > > created by pipenv, pip, or other python packaging utilities
> > >=20
> > > make distclean: delete the above, the .venv, and the editable "qemu"
> > > package forwarder (qemu.egg-info) if there is one.
> > >=20
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >   python/README.rst |  3 +++
> > >   python/Makefile   | 42 ++++++++++++++++++++++++++++++++++++++++++
> > >   2 files changed, 45 insertions(+)
> > >   create mode 100644 python/Makefile
> > >=20
> > > diff --git a/python/README.rst b/python/README.rst
> > > index e107bd12a69..3e09d20c23c 100644
> > > --- a/python/README.rst
> > > +++ b/python/README.rst
> > > @@ -35,6 +35,9 @@ Files in this directory
> > >   - ``qemu/`` Python package source directory.
> > >   - ``tests/`` Python package tests directory.
> > >   - ``avocado.cfg`` Configuration for the Avocado test-runner.
> > > +  Used by ``make check`` et al.
> > > +- ``Makefile`` provides some common testing/installation invocations=
.
> > > +  Try ``make help`` to see available targets.
> > >   - ``MANIFEST.in`` is read by python setuptools, it specifies additi=
onal files
> > >     that should be included by a source distribution.
> > >   - ``PACKAGE.rst`` is used as the README file that is visible on PyP=
I.org.
> > > diff --git a/python/Makefile b/python/Makefile
> > > new file mode 100644
> > > index 00000000000..184f59e5634
> > > --- /dev/null
> > > +++ b/python/Makefile
> > > @@ -0,0 +1,42 @@
> > > +.PHONY: help venv venv-check check clean distclean develop
> > > +
> > > +help:
> > > +=09@echo "python packaging help:"
> > > +=09@echo ""
> > > +=09@echo "make venv:       Create pipenv's virtual environment."
> > > +=09@echo "    NOTE: Requires Python 3.6 and pipenv."
> > > +=09@echo "          Will download packages from PyPI."
> > > +=09@echo "    Hint: (On Fedora): 'sudo dnf install python36 pipenv'"
> > > +=09@echo ""
> > > +=09@echo "make venv-check: run linters using pipenv's virtual enviro=
nment."
> > > +=09@echo "    Hint: If you don't know which test to run, run this on=
e!"
> > > +=09@echo ""
> > > +=09@echo "make develop:    Install deps for 'make check', and"
> > > +=09@echo "                 the qemu libs in editable/development mod=
e."
> > > +=09@echo ""
> > > +=09@echo "make check:      run linters using the current environment=
."
> > > +=09@echo ""
> >=20
> > Let's observe how this will be used (or misused).  I fear most people
> > will jump into `make check`, even though you have described `make
> > venv-check` as the primary choice.
> >=20
> > We have a precedent with `make check-acceptance` that will create a
> > venv and use it by default, so we can consider that as a fallback
> > strategy based on user feedback.
> >=20
>=20
> Right, I see. Though, I did intentionally want to make it clear which of
> these invocations created an environment and which did not.
>=20
> Unlike the acceptance tests, it might make sense to run these tests both
> inside and outside of that venv, so I opted to make the default "make"
> target "make help".
>=20
> The Gitlab CI will run the right one, after all -- and I do still expect =
the
> regular 'make check' to pass, so I am not as sure that it's a crucial
> failure if someone runs the "wrong one".
>=20
> > > +=09@echo "make clean:      remove build output."
> > > +=09@echo ""
> > > +=09@echo "make distclean:  remove venv files, qemu package forwarder=
, and"
> > > +=09@echo "                 everything from 'make clean'."
> > > +
> > > +venv: .venv
> > > +.venv: Pipfile.lock
> > > +=09@PIPENV_VENV_IN_PROJECT=3D1 pipenv sync --dev --keep-outdated
> > > +=09@touch .venv
> > > +
> > > +venv-check: venv
> > > +=09@pipenv run make check
> > > +
> > > +develop:
> > > +=09pip3 install -e .[devel]
> > > +
> > > +check:
> > > +=09@avocado --config avocado.cfg run tests/
> > > +
> > > +clean:
> > > +=09rm -rf build/ dist/
> > > +
> >=20
> > Usually `python3 setup.py clean --all` would be the better choice here,
> > but, it doesn't clean `dist/`, so I'm OK with this.
> >=20
>=20
> Hm, I should probably move the 'dist' down into 'distclean' anyway, and I
> will replace the clean invocation with the one you suggest.
>

OK then, makes sense to me.

- Cleber.

--SxgehGEc6vB0cZwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCtYJIACgkQZX6NM6Xy
CfO/BxAAp6oMKYLqEd6nPecnxEqSCleN2q7Jf0gvJseT54IIatKxJ0KFXwFAecOs
tj3WHBOt6TbsUM1j0KjX64W7g/12iuaawB9brtSFJzLSHR+aOl/gp67ENSQIkS9/
3n09H0pvUpHtnjdrOR8clMsZJaHLfMHFqrfrIlYFiphP1pxPrdBTwTS2QcQkWR7N
IxF4cc+obZoZ8QYCw3v68Min1FvEJK/VfakU7MqvujI4uKsRe9l7qt2srsgvD+nw
RLHQ3ptDs+hGS3c/YwbTIq/L+QwePdYVRGEp+E+cHVkGT/weU2i/st21B1kUOvde
MyL4Dtge+xs3cfTwMogM+fEe9aZvCEsFtU03vo3ggFulJlPMHJvCH9oF8eWYzvJU
S5E5gfBs/NpUR6v8prtf6YlR4wHQaJZ/E+UpAX0Dew8R6Em2NnOe24KHFUAxZn01
mzqPOLmKNLTQ8ed9wNct5fGhpifgZxLFiX3Ar179j6xIgz//OoQC5I8z4KPTJ034
qZUVlgKFosRfEdcq4AvfMq2vXLeh1A7XjgQQ9HKAVWOQkkG2K4K3cya56U4YWfJ2
OGdCFFjvsR55Kg7i7wifOv3hqhn6B5ct3iEyr8SBPMJEbOndTOatyZEZx1RYwYnN
d3gkK9gY6KEcBeOZ4EeTUkoU2KfXADFJpahdUz0NEnoS6ZdlV9w=
=GWW3
-----END PGP SIGNATURE-----

--SxgehGEc6vB0cZwN--


