Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EDF31985F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 03:54:24 +0100 (CET)
Received: from localhost ([::1]:52062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAOb9-0001pr-BO
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 21:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAOZO-00011R-Vi
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 21:52:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAOZM-0007Pj-AA
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 21:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613098351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fch3KUwBR2kTU/yl0VEjAoWx2bf2C7yiJd5SLrSx6uY=;
 b=iPU5jeJM2vJJbK2oG1imV5/e7gpl3rkYwG1/wc4mnd7OxxhZ/xPj0jIubnmzkwcU4MBl0a
 x6eHksXKHE8m+pD7SPrbkwqxyrFe91lxw1HFkTg0ElsNE3i3Y2f+TW8AxYkAU5IvMOdhlZ
 Qtp4Med3qSLAvSBwaFbAaFsP02EhQZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-E2HN2n-_MqCFzhwtxR42Zw-1; Thu, 11 Feb 2021 21:52:27 -0500
X-MC-Unique: E2HN2n-_MqCFzhwtxR42Zw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B84A801965;
 Fri, 12 Feb 2021 02:52:26 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-63.rdu2.redhat.com
 [10.10.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C988661F20;
 Fri, 12 Feb 2021 02:52:21 +0000 (UTC)
Date: Thu, 11 Feb 2021 21:52:19 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 00/24] python: create installable package
Message-ID: <YCXtY4ici/GJtZpN@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211185856.3975616-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n65687p0whTrckeE"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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

--n65687p0whTrckeE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 01:58:32PM -0500, John Snow wrote:
> This series factors the python/qemu directory as an installable
> package. It does not yet actually change the mechanics of how any other
> python source in the tree actually consumes it (yet), beyond the import
> path. (some import statements change in a few places.)
>=20
> git: https://gitlab.com/jsnow/qemu/-/commits/python-package-mk3
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/254940717
> (New CI job: https://gitlab.com/jsnow/qemu/-/jobs/1024230604)
>=20
> The primary motivation of this series is primarily to formalize our
> dependencies on mypy, flake8, isort, and pylint alongside versions that
> are known to work. It does this using the setup.cfg and setup.py
> files. It also adds explicitly pinned versions (using Pipfile.lock) of
> these dependencies that should behave in a repeatable and known way for
> developers and CI environments both. Lastly, it enables those CI checks
> such that we can enforce Python coding quality checks via the CI tests.
>=20
> An auxiliary motivation is that this package is formatted in such a way
> that it COULD be uploaded to https://pypi.org/project/qemu and installed
> independently of qemu.git with `pip install qemu`, but that button
> remains *unpushed* and this series *will not* cause any such
> releases. We have time to debate finer points like API guarantees and
> versioning even after this series is merged.
>=20
> Some other things this enables that might be of interest:
>=20
> With the python tooling as a proper package, you can install this
> package in editable or production mode to a virtual environment, your
> local user environment, or your system packages. The primary benefit of
> this is to gain access to QMP tooling regardless of CWD, without needing
> to battle sys.path (and confounding other python analysis tools).
>=20
> For example: when developing, you may go to qemu/python/ and run `make
> venv` followed by `pipenv shell` to activate a virtual environment that
> contains the qemu python packages. These packages will always reflect
> the current version of the source files in the tree. When you are
> finished, you can simply exit the shell (^d) to remove these packages
> from your python environment.
>=20
> When not developing, you could install a version of this package to your
> environment outright to gain access to the QMP and QEMUMachine classes
> for lightweight scripting and testing by using pip: "pip install [--user]=
 ."
>=20
> TESTING THIS SERIES:
>=20
> First of all, nothing should change. Without any intervention,
> everything should behave exactly as it was before. The only new
> information here comes from how to interact with and run the linters
> that will be enforcing code quality standards in this subdirectory.
>=20
> To test those, CD to qemu/python first, and then:
>=20
> 1. Try "make venv && pipenv shell" to get a venv with the package
> installed to it in editable mode. Ctrl+d exits this venv shell. While in
> this shell, any python script that uses "from qemu.[qmp|machine] import
> ..." should work correctly regardless of where the script is, or what
> your CWD is.
>

Ack here, works as expected.

> You will need Python 3.6 installed on your system to do this step. For
> Fedora: "dnf install python3.6" will do the trick.
>

You may have explained this before, so forgive me asking again.  Why
is this dependent on a given Python version, and not a *minimum*
Python version? Are the checkers themselves susceptible to different
behavior depending on the Python version used?  If so, any hint on the
strategy for developing with say, Python 3.8, and then having issues
caught only on Python 3.6?

> 2. Try "make check" while still in the shell to run the Python linters
> using the venv built in the previous step. This will pull some packages
> from PyPI and run pytest, which will in turn execute mypy, flake8, isort
> and pylint with the correct arguments.
>

Works as expected.  I'll provide more feedback at the specific patches.

> 3. Having exited the shell from above, try "make venv-check". This will
> create and update the venv if needed, then run 'make check' within the
> context of that shell. It should pass as long as the above did.
>

If this makes into a documentation (or on a v5), you may just want to
tell users to run "deactivate" instead of exiting the shell completely.

> 4. Still outside of the venv, you may try running "make check". This
> will not install anything, but unless you have the right Python
> dependencies installed, these tests may fail for you. You might try
> using "pip install --user .[devel]" to install the development packages
> needed to run the tests successfully to your local user's python
> environment. Once done, you will probably want to "pip uninstall qemu"
> to remove that package to avoid it interfering with other things.
>

This is good info for completeness, but I wonder if "make check"
should exist at all.  If it's a requirement for "make check-venv", the
question becomes if it should be advertised.  Hint: I don't think it
should, it just adds some a bit of confusion IMO.

> 5. "make distclean" will delete the venv and any temporary files that
> may have been created by packaging, installing, testing, etc.
>

Works as expected.  Now, unto the individual patches.

Cheers,
- Cleber.

--n65687p0whTrckeE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAl7WEACgkQZX6NM6Xy
CfNxgA//W8HgzltsfzE88CJkRNsz4nfKwS7cSOOY+vf8br4WRI7i3SOBlH+GpJSP
Z10TuGFWwantHjUpmJSS140lOPcFzdJF0yq+F5KaVrGYas1sqtwL8/Z7ZBlTmumo
R03j61odHjDty74ys2DJ8QMkHNV9yi4bqwDTJEAONuAYfvcLEkZZLuW2qUNnDTIk
pIg3YJ1SlJAc86KUtDUXZI35uu+pbbPtKoIll2S0iSuUpLR0U2cumpmNQm10GoVR
X+RGINQxkQUqEU2A8x8leoBpb5B5KlqiFHcIA5Yrw+LQyK+lM4N/8kMRbWaOkriP
DmRFTWT23Lw4yNBp5rGC9X51nyAzcSTXOnQo+ureatDvlVg0Fl2XtlNV3ZYFNG33
Sar7WiqHzZWWmUM6wywaYzQLl0zIbfgYerhE9DVZ/FH2w43fU81tS42YN6bsOj9F
SMZ9lqLwp70O5INCyXuJ91D5d6Wchf3jvmVBH6TXAs4gPaifo5xu2ZLvXyKmyAhb
EM9O5jhsAID29jRQxZ1R7xpgzIKolChNk5XR8rtnu8rqmvkKk/Ykp6XsShD4vOEo
gwgRYcjhVWwJX85il0/Y+Q0XJKxqUbIZ6Pj4dLPNM7LG5GDhqOzMMc5penVrzX/o
KzOXWEok/AQ+huMrK5j4+Xy8bNFloHSNPV9UukkWke70Wa9DFv0=
=Uvz+
-----END PGP SIGNATURE-----

--n65687p0whTrckeE--


