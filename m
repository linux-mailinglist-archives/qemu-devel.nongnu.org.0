Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5432B31D44B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 04:39:36 +0100 (CET)
Received: from localhost ([::1]:47832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCDgc-0007uH-VR
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 22:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCDey-0007NW-HU
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 22:37:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCDeu-0002Z1-Rm
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 22:37:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613533066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LutFMmGy8hID3oqFqF2Y7zleXXjbpsx7lukDrHWePBk=;
 b=MiCPb7u5nCC49bJ9rx3+I+K43W4ge5k7txRW2LqYw8LbMcZATHhy81GH2tHtYncr3rtFF3
 oJuDA7P13TwMqjvauXhWvZYfDgJyoYQXdSSxzjg/TvVDOPUA9SD85nd0/KS/2pvmv5Ow/y
 DfOshJVyw/adbvnJ6PA/U1N2yd/AFoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-OQmh-PvTO5GEllxLTZXW7Q-1; Tue, 16 Feb 2021 22:37:43 -0500
X-MC-Unique: OQmh-PvTO5GEllxLTZXW7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32B931008312;
 Wed, 17 Feb 2021 03:37:42 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-29.rdu2.redhat.com
 [10.10.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EFF210023B0;
 Wed, 17 Feb 2021 03:37:37 +0000 (UTC)
Date: Tue, 16 Feb 2021 22:37:35 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 00/24] python: create installable package
Message-ID: <YCyPf6Pet306Yenu@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <YCXtY4ici/GJtZpN@localhost.localdomain>
 <d6a7c313-4c6d-41f6-92ef-0977ea58fa28@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d6a7c313-4c6d-41f6-92ef-0977ea58fa28@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w85jy9SmNXoxoqWI"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--w85jy9SmNXoxoqWI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 04:32:29PM -0500, John Snow wrote:
> On 2/11/21 9:52 PM, Cleber Rosa wrote:
> > On Thu, Feb 11, 2021 at 01:58:32PM -0500, John Snow wrote:
> > > This series factors the python/qemu directory as an installable
> > > package. It does not yet actually change the mechanics of how any oth=
er
> > > python source in the tree actually consumes it (yet), beyond the impo=
rt
> > > path. (some import statements change in a few places.)
> > >=20
> > > git: https://gitlab.com/jsnow/qemu/-/commits/python-package-mk3
> > > CI: https://gitlab.com/jsnow/qemu/-/pipelines/254940717
> > > (New CI job: https://gitlab.com/jsnow/qemu/-/jobs/1024230604)
> > >=20
> > > The primary motivation of this series is primarily to formalize our
> > > dependencies on mypy, flake8, isort, and pylint alongside versions th=
at
> > > are known to work. It does this using the setup.cfg and setup.py
> > > files. It also adds explicitly pinned versions (using Pipfile.lock) o=
f
> > > these dependencies that should behave in a repeatable and known way f=
or
> > > developers and CI environments both. Lastly, it enables those CI chec=
ks
> > > such that we can enforce Python coding quality checks via the CI test=
s.
> > >=20
> > > An auxiliary motivation is that this package is formatted in such a w=
ay
> > > that it COULD be uploaded to https://pypi.org/project/qemu and instal=
led
> > > independently of qemu.git with `pip install qemu`, but that button
> > > remains *unpushed* and this series *will not* cause any such
> > > releases. We have time to debate finer points like API guarantees and
> > > versioning even after this series is merged.
> > >=20
> > > Some other things this enables that might be of interest:
> > >=20
> > > With the python tooling as a proper package, you can install this
> > > package in editable or production mode to a virtual environment, your
> > > local user environment, or your system packages. The primary benefit =
of
> > > this is to gain access to QMP tooling regardless of CWD, without need=
ing
> > > to battle sys.path (and confounding other python analysis tools).
> > >=20
> > > For example: when developing, you may go to qemu/python/ and run `mak=
e
> > > venv` followed by `pipenv shell` to activate a virtual environment th=
at
> > > contains the qemu python packages. These packages will always reflect
> > > the current version of the source files in the tree. When you are
> > > finished, you can simply exit the shell (^d) to remove these packages
> > > from your python environment.
> > >=20
> > > When not developing, you could install a version of this package to y=
our
> > > environment outright to gain access to the QMP and QEMUMachine classe=
s
> > > for lightweight scripting and testing by using pip: "pip install [--u=
ser] ."
> > >=20
> > > TESTING THIS SERIES:
> > >=20
> > > First of all, nothing should change. Without any intervention,
> > > everything should behave exactly as it was before. The only new
> > > information here comes from how to interact with and run the linters
> > > that will be enforcing code quality standards in this subdirectory.
> > >=20
> > > To test those, CD to qemu/python first, and then:
> > >=20
> > > 1. Try "make venv && pipenv shell" to get a venv with the package
> > > installed to it in editable mode. Ctrl+d exits this venv shell. While=
 in
> > > this shell, any python script that uses "from qemu.[qmp|machine] impo=
rt
> > > ..." should work correctly regardless of where the script is, or what
> > > your CWD is.
> > >=20
> >=20
> > Ack here, works as expected.
> >=20
>=20
> That's a relief!
>=20
> > > You will need Python 3.6 installed on your system to do this step. Fo=
r
> > > Fedora: "dnf install python3.6" will do the trick.
> > >=20
> >=20
> > You may have explained this before, so forgive me asking again.  Why
> > is this dependent on a given Python version, and not a *minimum*
> > Python version? Are the checkers themselves susceptible to different
> > behavior depending on the Python version used?  If so, any hint on the
> > strategy for developing with say, Python 3.8, and then having issues
> > caught only on Python 3.6?
> >=20
>=20
> It's a good question, and I have struggled with communicating the languag=
e.
> So here are a few points:
>=20
> (1) Users will not need Python 3.6 on their local systems to be able to r=
un
> the linters; they will be able to run "make check" to run it under *any*
> environment -- granted they have the necessary packages. (mypy, pylint,
> pytest, flake8, and isort.) See note #2 below:
>=20
> (2) `pip install [--user] .[devel]` will install the needed dependencies =
to
> the local environment/venv regardless of python version. These dependenci=
es
> are not pinned, but do express a minimum viable version (in setup.cfg) fo=
r
> each tool that I tested rigorously.
>=20
> (3) The CI system will target Python 3.6 specifically, because that is ou=
r
> minimum version. This will work to prevent future features from bleeding
> into the codebase, which was a notable problem when we were targeting
> simultaneous 2.7 and 3.x deployments. If we were going to only run agains=
t
> one version, 3.6 is the defensibly correct version to run against. If we
> want to run against more, I'd say let's not let perfection be the enemy o=
f
> good enough.
>=20
> (4) I considered it important to be able to run, as much as is possible, =
the
> *EXACT SAME* environment for tests as the CI runs. For this purpose, "mak=
e
> venv-check" uses pipenv to install a pinned set of dependencies (that mig=
ht
> be lower than what you'd get otherwise), and uses explicitly Python 3.6.
> This is to make it repeatable and simple to run a test that's as close to
> what the CI runner will do as possible. This takes a lot of the thinking =
out
> of it.
>=20
>=20
> So, to answer you more directly:
>=20
> - 3.6 is a *minimum* for "make check". (setup.cfg)
> - 3.6 is a *dependency* for "make venv-check". (Pipfile, Pipfile.lock)
>

OK, this answers my question.  It wasn't completely clear to me that
you took the care of using Pipfile.lock with one, and only one, Python
version (via "make venv-check").

> And, as far as known version problems:
>=20
> - pylint 2.6.0 is not compatible with Python 3.9. They are working on it.
> 2.6.1-dev works alright, but isn't released yet. The linters may be
> unavailable to folks with 3.9-only environment.
>=20
> Workarounds:
>=20
> - Make your own venv using 3.7 or 3.8
> - Use the make venv-check entry point to use 3.6.
> - Give up and push it to gitlab and see if the CI test passes.
>=20
>=20
> And, finally, here's my maintainer testing strategy/promises:
>=20
> - I endeavor to make sure this package is tested and working on any non-E=
OL
> Python version (3.6 - 3.9 at time of writing)
> - I endeavor to ensure that it is easy to test and lint these files on yo=
ur
> local development system with minimum hassle
> - Given the volatility of compatibility between different versions of
> linters and python, however, the current *canonical check* is Python 3.6,
> using the explicitly pinned versions in the Pipfile.lock. There may be ti=
mes
> (like right now) where the local linting test may not work with your vers=
ion
> of Python.
>=20
> > > 2. Try "make check" while still in the shell to run the Python linter=
s
> > > using the venv built in the previous step. This will pull some packag=
es
> > > from PyPI and run pytest, which will in turn execute mypy, flake8, is=
ort
> > > and pylint with the correct arguments.
> > >=20
> >=20
> > Works as expected.  I'll provide more feedback at the specific patches.
> >=20
> > > 3. Having exited the shell from above, try "make venv-check". This wi=
ll
> > > create and update the venv if needed, then run 'make check' within th=
e
> > > context of that shell. It should pass as long as the above did.
> > >=20
> >=20
> > If this makes into a documentation (or on a v5), you may just want to
> > tell users to run "deactivate" instead of exiting the shell completely.
> >=20
>=20
> It depends on how you entered the shell. Literally "pipenv shell" does
> create a new shell process that you should exit from. Since I suggested
> using the pipenv invocation, I match that suggestion by telling the user =
to
> exit (instead of deactivate).
>=20
> You know too much about python for your own good!
>

May be the exact opposite! It's that I'm much more used to plain venvs
and those will not create a shell, and exiting will quit a session,
which is very annoying!

> > > 4. Still outside of the venv, you may try running "make check". This
> > > will not install anything, but unless you have the right Python
> > > dependencies installed, these tests may fail for you. You might try
> > > using "pip install --user .[devel]" to install the development packag=
es
> > > needed to run the tests successfully to your local user's python
> > > environment. Once done, you will probably want to "pip uninstall qemu=
"
> > > to remove that package to avoid it interfering with other things.
> > >=20
> >=20
> > This is good info for completeness, but I wonder if "make check"
> > should exist at all.  If it's a requirement for "make check-venv", the
> > question becomes if it should be advertised.  Hint: I don't think it
> > should, it just adds some a bit of confusion IMO.
> >=20
>=20
> I think it's cleanly separated... If you understand much about how python
> virtual environments work.
>=20
> - You can run the tests on any environment you want! or,
> - You can run those tests on a very, very specific environment that is
> controlled with a militaristic, iron fist.
>=20
> current belief: People who are not developing python can just wait for th=
e
> little orb to turn green in Gitlab-CI and not worry about running any
> particular test at all, actually. This current patch-set does not integra=
te
> these tests into "make check" at all, on purpose.
>=20
> People who ARE developing this package (infrequently) will need to know
> which they want to run. My suggestion is to use "make venv-check" as the
> best predictor of the CI check, though it can be slow and clunky.
>=20
> If you develop on this package a *lot*, and you regularly use a venv to
> develop, "make check" starts to make a lot more sense.
>=20
> "make" with no arguments produces the help message;
>=20
> ```
> python packaging help:
>=20
> make venv:       Create pipenv's virtual environment.
>     NOTE: Requires Python 3.6 and pipenv.
>           Will download packages from PyPI.
>     HINT: On Fedora: 'sudo dnf install python36 pipenv'
>=20
> make venv-check: run linters using pipenv's virtual environment.
>=20
> make check:      run linters using the current environment.
>     Hint: Install deps with: 'pip install ".[devel]"'
> ```
>=20
> ... Which, I suppose if you don't use python much, it might not make sens=
e
> to you which environment you want to run the tests under. I can probably =
add
> a hint:
>=20
> "HINT: Run this test if you're unsure which to run."
>

Yeah, the "make" help message is useful as it is, but I'd indeed include
this extra bit of info.

Thanks for the very detailed explanation!
- Cleber.

--w85jy9SmNXoxoqWI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAsj3wACgkQZX6NM6Xy
CfOwXxAAoEoyeBm/45m9KDyvp3tPEYnrRb9ODfphZi/ySgtaE7C0h95VLFtqxbWH
e+KZ80g37nUNC6B8HxpX9738TuWEi3ZXjYhVAE5DS1JU9He68BrfgAFB5Y+SFqzo
okWWjIXLXJe3ir4lykI2fWecGB5p16g8zFehZ+YwvLqetj9kpaw7i7rP3ibJ+d3x
Hqd6Ccb96KobHEKKI8wQVKvSwf25iIpuGiD0arjj/sw9ZPmb2VU+rSWu7vS3bBVj
4h/3jQ0CLtu3JrLvn4K23AS9eH4i80xGjMtUII6Xx9IxRrfo/t69MBT3n2JTD2SH
7q9u7b0KOaC/Nsr14i05s3+1VHuhaMWol31bPa+WNNIJT72F14fzP/+0UFRtA+nU
24Q9p8xeWkd+DwYk2WOXh3r+7NGKEJEer1myNfLK+J1xwaNWBqDToU9cYCFeT6Pt
EuYx+rvXAygLIuZMsKQ9u6oSeBZIGmqqnAiRI0mquunGhxT9k0jFYS9B1Ekn/OGm
J826y6LkHg5Bj+nxkLildZXfCBOV0tAUQab7p0LeQRCBgokJo7pLGbKnLmlqh7jX
P0pE4i0Df5apZ2oYh45rVpb6GG1A6u9nkbE5Bt0CpTJsRCrzd9+bGM46n9TzWQhW
T1OAdEyYN9IYwwsWBUjPKySUwfF42TPK9aFhMi1MwK+dRnBqqcs=
=tmj3
-----END PGP SIGNATURE-----

--w85jy9SmNXoxoqWI--


