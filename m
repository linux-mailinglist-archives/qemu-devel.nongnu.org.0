Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8455B37EF69
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:15:11 +0200 (CEST)
Received: from localhost ([::1]:43476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgy4M-0004IB-GJ
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2I-0001Gp-2C
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2D-0005su-OO
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620861176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UqvqamTltTcjWRk3Z3eCb5uGF2jgCdtMgbcGgix93XI=;
 b=WiOF0A+8XubivsGJ1U39d83mIYaT5JVBceWGx/c0AOsDu0sONr+3A3smNkEx+tmwSJsdCf
 PEbNyYhfT5ZuuzaPC82KTKmI4Ou2dpE5Z0nNzveCILUiqQ32usNVzwZ3Ylh503e4UwfGvj
 OUa3NdC0ChnJ8BQgJw51+HS76sIXR/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-M3H76BZHO4SNUQBoDiL1JA-1; Wed, 12 May 2021 19:12:52 -0400
X-MC-Unique: M3H76BZHO4SNUQBoDiL1JA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F5C31005D52;
 Wed, 12 May 2021 23:12:51 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 992AC5B6A3;
 Wed, 12 May 2021 23:12:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/25] python: create installable package
Date: Wed, 12 May 2021 19:12:16 -0400
Message-Id: <20210512231241.2816122-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210512214642.2803189-1-jsnow@redhat.com>=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/302010131=0D
GitLab: https://gitlab.com/jsnow/qemu/-/tree/python-package-mk3=0D
MR: https://gitlab.com/jsnow/qemu/-/merge_requests/4=0D
=0D
I invite you to leave review comments on my mock merge request on=0D
gitlab, submitted against my own mirror. I will, as always, also respond=0D
to feedback on-list.=0D
=0D
ABOUT=0D
=3D=3D=3D=3D=3D=0D
=0D
This series factors the python/qemu directory as an installable=0D
package. It does not yet actually change the mechanics of how any other=0D
python source in the tree actually consumes it (yet), beyond the import=0D
path -- some import statements change in a few places.=0D
=0D
RATIONALE=0D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
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
Other bits of interest=0D
----------------------=0D
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
for lightweight scripting and testing by using pip: "pip install=0D
[--user] ."=0D
=0D
TESTING THIS SERIES=0D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
=0D
First of all, nothing should change. Without any intervention,=0D
everything should behave exactly as it did before. The only new=0D
information here comes from how to interact with and run the linters=0D
that will be enforcing code quality standards in this subdirectory.=0D
=0D
There are various invocations available that will test subtly different=0D
combinations using subtly different environments. I am assuming some=0D
light knowledge of Python environments and installing Python packages=0D
here. If you have questions, I would be delighted to answer them.=0D
=0D
To test the new tests, CD to ./python/ first, and then:=0D
=0D
0. Try "make" or "make help" to get a sense of this series.=0D
=0D
1. Try "make venv && pipenv shell" to get a venv with the package=0D
   installed to it in editable mode. Ctrl+d exits this venv shell. While=0D
   in this shell, any python script that uses "from qemu.[qmp|machine]=0D
   import ..." should work correctly regardless of where the script is,=0D
   or what your CWD is.=0D
=0D
   This will pull some packages from PyPI and install them into the=0D
   virtual environment, leaving your normal environment untouched.=0D
=0D
   You will need Python 3.6 and pipenv installed on your system to do=0D
   this step. For Fedora: "dnf install python36 pipenv" will do the=0D
   trick. If you don't have this, skip down to #4 and onwards.=0D
=0D
2. Try "make check" while still in the shell to run the Python linters=0D
using the venv built in the previous step. This will run avocado, which=0D
will in turn execute mypy, flake8, isort and pylint with the correct=0D
arguments.=0D
=0D
3. Having exited the shell from above, try "make venv-check". This will=0D
create and update the venv if needed, then run 'make check' within the=0D
context of that shell. It should pass as long as the above did. You=0D
should be able to run "make distclean" prior to running "make=0D
venv-check" and have the entire process work start to finish.=0D
=0D
4. Still outside of the venv, you may try running "make check". This=0D
will not install anything, but unless you have the right Python=0D
dependencies installed, these tests may fail for you. You might try=0D
using "pip install --user .[devel]" to install the development packages=0D
needed to run the tests successfully to your local user's python=0D
environment. Once done, you will probably want to "pip uninstall qemu"=0D
to remove the qemu packages to avoid them interfering with other things.=0D
=0D
5. "make distclean" will delete the venv and any temporary files that=0D
may have been created by packaging, installing, testing, etc.=0D
=0D
6. You may also (if you wish) create your own environment using a Python=0D
   other than 3.6, bypassing pipenv. This may be useful for environments=0D
   in which you simply do not have Python 3.6 readily available, or=0D
   explicitly wish to test against a different version.=0D
=0D
   Using the Python of your choice:=0D
=0D
   - `> make distclean` (Remove the .venv, if you created one.)=0D
   - `> /usr/bin/python3.9 -m venv .venv`=0D
   - `> source .venv/bin/activate` (or activate.[fish|csh])=0D
   - `> make develop`  (Installs linter deps to this venv)=0D
   - `> make check`    (Runs tests using current env)=0D
   - `> deactivate`    (Leaves the venv)=0D
=0D
   This *should* pass, and if it doesn't, it's a bug. Due to=0D
   dependencies changing like shifting sands, it's impossible to promise=0D
   support for every last combination of dependency and python=0D
   version. This is why the "make venv-check" target uses Python 3 and a=0D
   very explicit set of packages instead. Still, this form *should*=0D
   pass.=0D
=0D
7. If you are running Fedora or a distro that packages multiple Python=0D
versions, you can try running "make check-tox" to run the linters under=0D
all Python versions from Python 3.6 to 3.9. This will create a series of=0D
virtual environments under the .tox folder, leaving your existing=0D
environment unscathed. This should pass, provided you have the requisite=0D
Python versions on hand. When you are done, "make distclean" should=0D
remove any testing files.=0D
=0D
CHANGELOG=0D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
=0D
V6=0D
--=0D
=0D
```=0D
001/25:[----] [--] 'iotests/297: add --namespace-packages to mypy arguments=
'=0D
002/25:[----] [-C] 'python: create qemu packages'=0D
003/25:[----] [--] 'python: create utils sub-package'=0D
004/25:[0005] [FC] 'python: add qemu package installer'=0D
005/25:[0002] [FC] 'python: add VERSION file'=0D
006/25:[----] [--] 'python: add directory structure README.rst files'=0D
007/25:[down] 'python: add MANIFEST.in'=0D
008/25:[0001] [FC] 'python: Add pipenv support'=0D
009/25:[----] [--] 'python: add pylint import exceptions'=0D
010/25:[----] [--] 'python: move pylintrc into setup.cfg'=0D
011/25:[0083] [FC] 'python: add pylint to pipenv'=0D
012/25:[----] [--] 'python: move flake8 config to setup.cfg'=0D
013/25:[----] [--] 'python: add excluded dirs to flake8 config'=0D
014/25:[0038] [FC] 'python: Add flake8 to pipenv'=0D
015/25:[----] [--] 'python: move mypy.ini into setup.cfg'=0D
016/25:[0050] [FC] 'python: add mypy to pipenv'=0D
017/25:[----] [--] 'python: move .isort.cfg into setup.cfg'=0D
018/25:[0006] [FC] 'python/qemu: add isort to pipenv'=0D
019/25:[0004] [FC] 'python/qemu: add qemu package itself to pipenv'=0D
020/25:[0014] [FC] 'python: add devel package requirements to setuptools'=
=0D
021/25:[down] 'python: add avocado-framework and tests'=0D
022/25:[0015] [FC] 'python: add Makefile for some common tasks'=0D
023/25:[0018] [FC] 'python: add .gitignore'=0D
024/25:[0004] [FC] 'gitlab: add python linters to CI'=0D
025/25:[down] 'python: add tox support'=0D
```=0D
=0D
- 04: Changed maintainer blurb in PACKAGE.rst=0D
- 05: VERSION is now 0.6.1a0=0D
- 07: New, needed for both tox and using Pipenv to install the qemu=0D
      package(s) in editable mode.=0D
- 08: Add README entries explaining the purpose of the pipenv files.=0D
- 11: pylint dependency was bumped to 2.7.0.=0D
- 14: pipenv changes.=0D
- 16: pipenv changes.=0D
- 18: isort pinned at >=3D 5.1.2 now; see commit message.=0D
- 19: pipenv changes.=0D
- 20: Context differences from isort, pylint, and pipenv changes.=0D
- 22:=0D
   - Add 'make develop'=0D
   - Add more README.rst entries.=0D
   - Change pytest invocation to avocado.=0D
- 23:=0D
   - Add comments to gitignore, split ignores out by function/category=0D
   - Ignore vscode files. (I like vscode now!)=0D
- 24: Use the 'needs' feature of Gitlab CI and move the test to 'test'=0D
  stage=0D
=0D
STATUS=0D
=3D=3D=3D=3D=3D=3D=3D=0D
=0D
```=0D
+ [01] iotests-297-add-namespace      # [RB] CR [SOB] JS=0D
+ [02] python-create-qemu-packages    # [SOB] JS=0D
+ [03] python-create-utils-sub        # [SOB] JS=0D
+ [04] python-add-qemu-package        # [SOB] JS=0D
+ [05] python-add-version-file        # [RB] CR [SOB] JS=0D
+ [06] python-add-directory-structure # [SOB] JS=0D
+ [07] python-add-manifest-in         # [SOB] JS=0D
+ [08] python-add-pipenv-support      # [RB] CR [SOB] JS=0D
+ [09] python-add-pylint-import       # [RB] CR [SOB] JS=0D
+ [10] python-move-pylintrc-into      # [RB] CR [TB] CR [SOB] JS=0D
+ [11] python-add-pylint-to-pipenv    # [SOB] JS=0D
+ [12] python-move-flake8-config-to   # [RB] CR [SOB] JS=0D
+ [13] python-add-excluded-dirs-to    # [SOB] JS=0D
+ [14] python-add-flake8-to-pipenv    # [RB] CR [TB] CR [SOB] JS=0D
+ [15] python-move-mypy-ini-into      # [SOB] JS=0D
+ [16] python-add-mypy-to-pipenv      # [RB] CR [TB] CR [SOB] JS=0D
+ [17] python-move-isort-cfg-into     # [RB] CR [SOB] JS=0D
+ [18] python-qemu-add-isort-to       # [SOB] JS=0D
+ [19] python-qemu-add-qemu-package   # [RB] CR [TB] CR [SOB] JS=0D
+ [20] python-add-devel-package       # [SOB] JS=0D
+ [21] python-add-avocado-framework   # [SOB] JS=0D
+ [22] python-add-makefile-for-some   # [SOB] JS=0D
+ [23] python-add-gitignore           # [SOB] JS=0D
+ [24] gitlab-add-python-linters-to   # [SOB] JS=0D
> [25] python-add-tox-support         # [SOB] JS=0D
```=0D
=0D
John Snow (25):=0D
  iotests/297: add --namespace-packages to mypy arguments=0D
  python: create qemu packages=0D
  python: create utils sub-package=0D
  python: add qemu package installer=0D
  python: add VERSION file=0D
  python: add directory structure README.rst files=0D
  python: add MANIFEST.in=0D
  python: Add pipenv support=0D
  python: add pylint import exceptions=0D
  python: move pylintrc into setup.cfg=0D
  python: add pylint to pipenv=0D
  python: move flake8 config to setup.cfg=0D
  python: add excluded dirs to flake8 config=0D
  python: Add flake8 to pipenv=0D
  python: move mypy.ini into setup.cfg=0D
  python: add mypy to pipenv=0D
  python: move .isort.cfg into setup.cfg=0D
  python/qemu: add isort to pipenv=0D
  python/qemu: add qemu package itself to pipenv=0D
  python: add devel package requirements to setuptools=0D
  python: add avocado-framework and tests=0D
  python: add Makefile for some common tasks=0D
  python: add .gitignore=0D
  gitlab: add python linters to CI=0D
  python: add tox support=0D
=0D
 python/PACKAGE.rst                          |  33 +++=0D
 python/README.rst                           |  53 +++++=0D
 python/qemu/README.rst                      |   8 +=0D
 python/qemu/machine/README.rst              |   9 +=0D
 python/qemu/qmp/README.rst                  |   9 +=0D
 python/qemu/utils/README.rst                |   7 +=0D
 .gitlab-ci.yml                              |  12 +=0D
 python/.gitignore                           |  20 ++=0D
 python/MANIFEST.in                          |   2 +=0D
 python/Makefile                             |  47 ++++=0D
 python/Pipfile                              |  13 ++=0D
 python/Pipfile.lock                         | 231 ++++++++++++++++++++=0D
 python/VERSION                              |   1 +=0D
 python/avocado.cfg                          |  10 +=0D
 python/mypy.ini                             |   4 -=0D
 python/qemu/.flake8                         |   2 -=0D
 python/qemu/.isort.cfg                      |   7 -=0D
 python/qemu/__init__.py                     |  11 -=0D
 python/qemu/machine/__init__.py             |  36 +++=0D
 python/qemu/{ =3D> machine}/console_socket.py |   0=0D
 python/qemu/{ =3D> machine}/machine.py        |  16 +-=0D
 python/qemu/{ =3D> machine}/qtest.py          |   3 +-=0D
 python/qemu/pylintrc                        |  58 -----=0D
 python/qemu/{qmp.py =3D> qmp/__init__.py}     |  12 +-=0D
 python/qemu/utils/__init__.py               |  23 ++=0D
 python/qemu/{ =3D> utils}/accel.py            |   0=0D
 python/setup.cfg                            |  79 +++++++=0D
 python/setup.py                             |  23 ++=0D
 python/tests/flake8.sh                      |   2 +=0D
 python/tests/isort.sh                       |   2 +=0D
 python/tests/mypy.sh                        |   2 +=0D
 python/tests/pylint.sh                      |   2 +=0D
 python/tox.ini                              |  13 ++=0D
 tests/acceptance/avocado_qemu/__init__.py   |   4 +-=0D
 tests/acceptance/virtio-gpu.py              |   2 +-=0D
 tests/docker/dockerfiles/fedora.docker      |   2 +=0D
 tests/qemu-iotests/297                      |   1 +=0D
 tests/qemu-iotests/300                      |   4 +-=0D
 tests/qemu-iotests/iotests.py               |   2 +-=0D
 tests/vm/aarch64vm.py                       |   2 +-=0D
 tests/vm/basevm.py                          |   2 +-=0D
 41 files changed, 672 insertions(+), 97 deletions(-)=0D
 create mode 100644 python/PACKAGE.rst=0D
 create mode 100644 python/README.rst=0D
 create mode 100644 python/qemu/README.rst=0D
 create mode 100644 python/qemu/machine/README.rst=0D
 create mode 100644 python/qemu/qmp/README.rst=0D
 create mode 100644 python/qemu/utils/README.rst=0D
 create mode 100644 python/.gitignore=0D
 create mode 100644 python/MANIFEST.in=0D
 create mode 100644 python/Makefile=0D
 create mode 100644 python/Pipfile=0D
 create mode 100644 python/Pipfile.lock=0D
 create mode 100644 python/VERSION=0D
 create mode 100644 python/avocado.cfg=0D
 delete mode 100644 python/mypy.ini=0D
 delete mode 100644 python/qemu/.flake8=0D
 delete mode 100644 python/qemu/.isort.cfg=0D
 delete mode 100644 python/qemu/__init__.py=0D
 create mode 100644 python/qemu/machine/__init__.py=0D
 rename python/qemu/{ =3D> machine}/console_socket.py (100%)=0D
 rename python/qemu/{ =3D> machine}/machine.py (98%)=0D
 rename python/qemu/{ =3D> machine}/qtest.py (98%)=0D
 delete mode 100644 python/qemu/pylintrc=0D
 rename python/qemu/{qmp.py =3D> qmp/__init__.py} (96%)=0D
 create mode 100644 python/qemu/utils/__init__.py=0D
 rename python/qemu/{ =3D> utils}/accel.py (100%)=0D
 create mode 100644 python/setup.cfg=0D
 create mode 100755 python/setup.py=0D
 create mode 100755 python/tests/flake8.sh=0D
 create mode 100755 python/tests/isort.sh=0D
 create mode 100755 python/tests/mypy.sh=0D
 create mode 100755 python/tests/pylint.sh=0D
 create mode 100644 python/tox.ini=0D
=0D
--=20=0D
2.30.2=0D
=0D


