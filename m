Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A22D3192DF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:14:42 +0100 (CET)
Received: from localhost ([::1]:42014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHQH-0006bT-FD
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:14:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHBa-0003fu-UY
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:59:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHBW-0005KF-AD
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:59:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613069965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2qW0z4oaCNKpuQXYhCc+Ukprnpks8/eWjQXb7wHSvpo=;
 b=DIQsDDJRzlXgCBZLDo/zIRlg8VHOoJFpTCJ4XJh0Qd8XiagMvOFBKN7NAss+yRXi+i4GJZ
 M6jnwkB4nvISnev0DZduIjZUdAAOaplj9+8aApeHNS4JgM+CQa7+i0/65Ru9mxNf7XZzeB
 j2z929prWjZZ6rpqcpq8O4ja3Q5ZLTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-IdZpedHdNbaI_nkF8nFlug-1; Thu, 11 Feb 2021 13:59:22 -0500
X-MC-Unique: IdZpedHdNbaI_nkF8nFlug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8D796EE27;
 Thu, 11 Feb 2021 18:59:20 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17EE877711;
 Thu, 11 Feb 2021 18:58:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/24] python: create installable package
Date: Thu, 11 Feb 2021 13:58:32 -0500
Message-Id: <20210211185856.3975616-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series factors the python/qemu directory as an installable=0D
package. It does not yet actually change the mechanics of how any other=0D
python source in the tree actually consumes it (yet), beyond the import=0D
path. (some import statements change in a few places.)=0D
=0D
git: https://gitlab.com/jsnow/qemu/-/commits/python-package-mk3=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/254940717=0D
(New CI job: https://gitlab.com/jsnow/qemu/-/jobs/1024230604)=0D
=0D
The primary motivation of this series is primarily to formalize our=0D
dependencies on mypy, flake8, isort, and pylint alongside versions that=0D
are known to work. It does this using the setup.cfg and setup.py=0D
files. It also adds explicitly pinned versions (using Pipfile.lock) of=0D
these dependencies that should behave in a repeatable and known way for=0D
developers and CI environments both. Lastly, it enables those CI checks=0D
such that we can enforce Python coding quality checks via the CI tests.=0D
=0D
An auxiliary motivation is that this package is formatted in such a way=0D
that it COULD be uploaded to https://pypi.org/project/qemu and installed=0D
independently of qemu.git with `pip install qemu`, but that button=0D
remains *unpushed* and this series *will not* cause any such=0D
releases. We have time to debate finer points like API guarantees and=0D
versioning even after this series is merged.=0D
=0D
Some other things this enables that might be of interest:=0D
=0D
With the python tooling as a proper package, you can install this=0D
package in editable or production mode to a virtual environment, your=0D
local user environment, or your system packages. The primary benefit of=0D
this is to gain access to QMP tooling regardless of CWD, without needing=0D
to battle sys.path (and confounding other python analysis tools).=0D
=0D
For example: when developing, you may go to qemu/python/ and run `make=0D
venv` followed by `pipenv shell` to activate a virtual environment that=0D
contains the qemu python packages. These packages will always reflect=0D
the current version of the source files in the tree. When you are=0D
finished, you can simply exit the shell (^d) to remove these packages=0D
from your python environment.=0D
=0D
When not developing, you could install a version of this package to your=0D
environment outright to gain access to the QMP and QEMUMachine classes=0D
for lightweight scripting and testing by using pip: "pip install [--user] .=
"=0D
=0D
TESTING THIS SERIES:=0D
=0D
First of all, nothing should change. Without any intervention,=0D
everything should behave exactly as it was before. The only new=0D
information here comes from how to interact with and run the linters=0D
that will be enforcing code quality standards in this subdirectory.=0D
=0D
To test those, CD to qemu/python first, and then:=0D
=0D
1. Try "make venv && pipenv shell" to get a venv with the package=0D
installed to it in editable mode. Ctrl+d exits this venv shell. While in=0D
this shell, any python script that uses "from qemu.[qmp|machine] import=0D
..." should work correctly regardless of where the script is, or what=0D
your CWD is.=0D
=0D
You will need Python 3.6 installed on your system to do this step. For=0D
Fedora: "dnf install python3.6" will do the trick.=0D
=0D
2. Try "make check" while still in the shell to run the Python linters=0D
using the venv built in the previous step. This will pull some packages=0D
from PyPI and run pytest, which will in turn execute mypy, flake8, isort=0D
and pylint with the correct arguments.=0D
=0D
3. Having exited the shell from above, try "make venv-check". This will=0D
create and update the venv if needed, then run 'make check' within the=0D
context of that shell. It should pass as long as the above did.=0D
=0D
4. Still outside of the venv, you may try running "make check". This=0D
will not install anything, but unless you have the right Python=0D
dependencies installed, these tests may fail for you. You might try=0D
using "pip install --user .[devel]" to install the development packages=0D
needed to run the tests successfully to your local user's python=0D
environment. Once done, you will probably want to "pip uninstall qemu"=0D
to remove that package to avoid it interfering with other things.=0D
=0D
5. "make distclean" will delete the venv and any temporary files that=0D
may have been created by packaging, installing, testing, etc.=0D
=0D
Changelog:=0D
=0D
- Moved qemu/machine/accel.py to qemu/utils/accel.py=0D
- Integrated CI patches into this series=0D
- Changed version of package to 0.6.0.0a1=0D
- Misc different changes for import statements in e.g. iotests/VM tests=0D
- Modified iotests invocation of mypy ever so slightly=0D
=0D
Reviewer notes:=0D
=0D
- The VERSION hack may be imperfect, but at 0.x and without uploading it=0D
  to PyPI, we have *all* the time in the world to fine-tune it later.=0D
- The CI integration may not be perfect, but it is better than *nothing*,=
=0D
  so I think it's worth doing even in an imperfect state.=0D
=0D
John Snow (24):=0D
  python/console_socket: avoid one-letter variable=0D
  iotests/297: add --namespace-packages to mypy arguments=0D
  python: create qemu packages=0D
  python: create utils sub-package=0D
  python: add qemu package installer=0D
  python: add VERSION file=0D
  python: add directory structure README.rst files=0D
  python: Add pipenv support=0D
  python: add pylint import exceptions=0D
  python: move pylintrc into setup.cfg=0D
  python: add pylint to pipenv=0D
  python: move flake8 config to setup.cfg=0D
  python: Add flake8 to pipenv=0D
  python: move mypy.ini into setup.cfg=0D
  python: add mypy to pipenv=0D
  python: move .isort.cfg into setup.cfg=0D
  python/qemu: add isort to pipenv=0D
  python/qemu: add qemu package itself to pipenv=0D
  python: add devel package requirements to setuptools=0D
  python: add pytest and tests=0D
  python: add excluded dirs to flake8 config=0D
  python: add Makefile for some common tasks=0D
  python: add .gitignore=0D
  gitlab: add python linters to CI=0D
=0D
 python/PACKAGE.rst                          |  32 +++=0D
 python/README.rst                           |  41 +++=0D
 python/qemu/README.rst                      |   8 +=0D
 python/qemu/machine/README.rst              |   9 +=0D
 python/qemu/qmp/README.rst                  |   9 +=0D
 python/qemu/utils/README.rst                |   9 +=0D
 .gitlab-ci.yml                              |  10 +=0D
 python/.gitignore                           |   9 +=0D
 python/Makefile                             |  35 +++=0D
 python/Pipfile                              |  13 +=0D
 python/Pipfile.lock                         | 285 ++++++++++++++++++++=0D
 python/VERSION                              |   1 +=0D
 python/mypy.ini                             |   4 -=0D
 python/qemu/.flake8                         |   2 -=0D
 python/qemu/.isort.cfg                      |   7 -=0D
 python/qemu/__init__.py                     |  11 -=0D
 python/qemu/machine/__init__.py             |  36 +++=0D
 python/qemu/{ =3D> machine}/console_socket.py |  10 +-=0D
 python/qemu/{ =3D> machine}/machine.py        |  16 +-=0D
 python/qemu/{ =3D> machine}/qtest.py          |   3 +-=0D
 python/qemu/pylintrc                        |  58 ----=0D
 python/qemu/{qmp.py =3D> qmp/__init__.py}     |  12 +-=0D
 python/qemu/utils/__init__.py               |  23 ++=0D
 python/qemu/{ =3D> utils}/accel.py            |   0=0D
 python/setup.cfg                            |  82 ++++++=0D
 python/setup.py                             |  23 ++=0D
 python/tests/test_lint.py                   |  28 ++=0D
 tests/acceptance/boot_linux.py              |   3 +-=0D
 tests/acceptance/virtio-gpu.py              |   2 +-=0D
 tests/acceptance/virtiofs_submounts.py      |   2 +-=0D
 tests/docker/dockerfiles/fedora.docker      |   2 +=0D
 tests/qemu-iotests/297                      |   1 +=0D
 tests/qemu-iotests/300                      |   4 +-=0D
 tests/qemu-iotests/iotests.py               |   2 +-=0D
 tests/vm/aarch64vm.py                       |   2 +-=0D
 tests/vm/basevm.py                          |   2 +-=0D
 36 files changed, 693 insertions(+), 103 deletions(-)=0D
 create mode 100644 python/PACKAGE.rst=0D
 create mode 100644 python/README.rst=0D
 create mode 100644 python/qemu/README.rst=0D
 create mode 100644 python/qemu/machine/README.rst=0D
 create mode 100644 python/qemu/qmp/README.rst=0D
 create mode 100644 python/qemu/utils/README.rst=0D
 create mode 100644 python/.gitignore=0D
 create mode 100644 python/Makefile=0D
 create mode 100644 python/Pipfile=0D
 create mode 100644 python/Pipfile.lock=0D
 create mode 100644 python/VERSION=0D
 delete mode 100644 python/mypy.ini=0D
 delete mode 100644 python/qemu/.flake8=0D
 delete mode 100644 python/qemu/.isort.cfg=0D
 delete mode 100644 python/qemu/__init__.py=0D
 create mode 100644 python/qemu/machine/__init__.py=0D
 rename python/qemu/{ =3D> machine}/console_socket.py (95%)=0D
 rename python/qemu/{ =3D> machine}/machine.py (98%)=0D
 rename python/qemu/{ =3D> machine}/qtest.py (98%)=0D
 delete mode 100644 python/qemu/pylintrc=0D
 rename python/qemu/{qmp.py =3D> qmp/__init__.py} (96%)=0D
 create mode 100644 python/qemu/utils/__init__.py=0D
 rename python/qemu/{ =3D> utils}/accel.py (100%)=0D
 create mode 100644 python/setup.cfg=0D
 create mode 100755 python/setup.py=0D
 create mode 100644 python/tests/test_lint.py=0D
=0D
--=20=0D
2.29.2=0D
=0D


