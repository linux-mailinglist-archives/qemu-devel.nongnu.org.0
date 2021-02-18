Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69CB31EFEC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 20:36:01 +0100 (CET)
Received: from localhost ([::1]:40860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCp5k-0008Te-EP
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 14:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoxq-0002Jg-1H
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:27:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoxn-0003MP-5s
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:27:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613676466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LEMshSffdDGAnP/k/adBrsOSVKVhZls/u9EuRIjK9j0=;
 b=SAYbZOFvr+lfcJkAr2z3/HO9DL/QgxEo4eAR0fWt4/V+MoyRcWrzjXC9VfGGWRgyXqLJ+n
 G46CNi/cnLwnczrDaKd74ggNWiCd6cju9O6n/z4I9Ht0gcHVy0Re/2D2HqPD/yiuMYyq88
 P2CnwCpjhNA2MHtGBoYAX/dDE7csmJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-iUP9iPLcNru69ygozevqvw-1; Thu, 18 Feb 2021 14:27:39 -0500
X-MC-Unique: iUP9iPLcNru69ygozevqvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CB6518A2ACB;
 Thu, 18 Feb 2021 19:27:38 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DA5C60BF1;
 Thu, 18 Feb 2021 19:27:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/25] python: create installable package
Date: Thu, 18 Feb 2021 14:27:08 -0500
Message-Id: <20210218192733.370968-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series factors the python/qemu directory as an installable=0D
package. It does not yet actually change the mechanics of how any other=0D
python source in the tree actually consumes it (yet), beyond the import=0D
path. (some import statements change in a few places.)=0D
=0D
git: https://gitlab.com/jsnow/qemu/-/commits/python-package-mk3=0D
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
Fedora: "dnf install python36" will do the trick.=0D
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
6. You may also (if you wish) create your own environment using a Python=0D
other than 3.6, bypassing pipenv. This may be useful for environments in=0D
which you simply do not have Python 3.6 readily available.=0D
=0D
Using the Python of your choice:=0D
=0D
> make distclean # (Remove the .venv, if you created one.)=0D
> /usr/bin/python3.9 -m venv .venv=0D
> source .venv/bin/activate  # (or activate.[fish|csh])=0D
=0D
> make develop  # Installs linter deps to this venv=0D
> make check    # Runs tests using current env=0D
> deactivate    # Leaves venv.=0D
=0D
This *should* pass, and if it doesn't, it's a bug. Due to dependencies=0D
changing like shifting sands, it's impossible to promise support for=0D
every last combination of dependency and python version. This is why the=0D
"make venv-check" target uses Python 3 and a very explicit set of=0D
packages instead. Still, this form *should* pass.=0D
=0D
Changelog=0D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
=0D
V5:=0D
=0D
001/25:[----] [--] 'python/console_socket: avoid one-letter variable'=0D
002/25:[----] [--] 'iotests/297: add --namespace-packages to mypy arguments=
'=0D
003/25:[0009] [FC] 'python: create qemu packages'=0D
004/25:[0012] [FC] 'python: create utils sub-package'=0D
005/25:[0002] [FC] 'python: add qemu package installer'=0D
006/25:[----] [--] 'python: add VERSION file'=0D
007/25:[0012] [FC] 'python: add directory structure README.rst files'=0D
008/25:[----] [--] 'python: Add pipenv support'=0D
009/25:[----] [--] 'python: add pylint import exceptions'=0D
010/25:[----] [--] 'python: move pylintrc into setup.cfg'=0D
011/25:[----] [--] 'python: add pylint to pipenv'=0D
012/25:[----] [--] 'python: move flake8 config to setup.cfg'=0D
013/25:[----] [-C] 'python: add excluded dirs to flake8 config'=0D
014/25:[----] [--] 'python: Add flake8 to pipenv'=0D
015/25:[----] [-C] 'python: move mypy.ini into setup.cfg'=0D
016/25:[----] [-C] 'python: add mypy to pipenv'=0D
017/25:[----] [--] 'python: move .isort.cfg into setup.cfg'=0D
018/25:[----] [--] 'python/qemu: add isort to pipenv'=0D
019/25:[----] [--] 'python/qemu: add qemu package itself to pipenv'=0D
020/25:[----] [-C] 'python: add devel package requirements to setuptools'=
=0D
021/25:[----] [--] 'python: add pytest and tests'=0D
022/25:[0010] [FC] 'python: add Makefile for some common tasks'=0D
023/25:[----] [--] 'python: add .gitignore'=0D
024/25:[----] [--] 'gitlab: add python linters to CI'=0D
025/25:[down] 'python: add 'make develop' target'=0D
=0D
-   Shuffled flake8 patch to the flake8 region of the patchset=0D
    (Didn't move the pylint patch down: It was annoying and stands on its o=
wn.)=0D
    Added RB/TB tags where applicable, see chart below this section.=0D
03: Changed copyright year=0D
    Updated import fixes for latest origin/master=0D
04: Updated import fixes for latest origin/master=0D
05: Updated commit message ("ReST" vs "rst")=0D
    Added information on PEP517/518 adoption to commit message.=0D
07: Make clear that "qemu.qmp", "qemu.machine" are not exhaustive.=0D
    Replace "amend" by "append"=0D
    Drastically shorten python/qemu/utils/README.rst=0D
22: Update Makefile with new Hint for which test you should run if unsure.=
=0D
    Fix typo (qemu.egg.info =3D> qemu.egg-info)=0D
    Have "make venv" touch .venv to avoid redundant checking where possible=
=0D
    Update help text for what "make distclean" is removing.=0D
25: New, just to facilitate creating your own venv, in the case=0D
    that you cannot easily install python 3.6, but still want=0D
    to run tests on your local machine easily.=0D
=0D
Current Status=0D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
=0D
+ [01] python-console_socket-avoid    # [RB] CR [SOB] JS=0D
+ [02] iotests-297-add-namespace      # [RB] CR [SOB] JS=0D
+ [03] python-create-qemu-packages    # [SOB] JS=0D
+ [04] python-create-utils-sub        # [SOB] JS=0D
+ [05] python-add-qemu-package        # [SOB] JS=0D
+ [06] python-add-version-file        # [RB] CR [SOB] JS=0D
+ [07] python-add-directory-structure # [SOB] JS=0D
+ [08] python-add-pipenv-support      # [RB] CR [SOB] JS=0D
+ [09] python-add-pylint-import       # [RB] CR [SOB] JS=0D
+ [10] python-move-pylintrc-into      # [RB] CR [TB] CR [SOB] JS=0D
+ [11] python-add-pylint-to-pipenv    # [RB] CR [TB] CR [SOB] JS=0D
+ [12] python-move-flake8-config-to   # [RB] CR [SOB] JS=0D
+ [13] python-add-excluded-dirs-to    # [SOB] JS=0D
+ [14] python-add-flake8-to-pipenv    # [RB] CR [TB] CR [SOB] JS=0D
+ [15] python-move-mypy-ini-into      # [SOB] JS=0D
+ [16] python-add-mypy-to-pipenv      # [RB] CR [TB] CR [SOB] JS=0D
+ [17] python-move-isort-cfg-into     # [RB] CR [SOB] JS=0D
+ [18] python-qemu-add-isort-to       # [RB] CR,PM [TB] CR [SOB] JS=0D
+ [19] python-qemu-add-qemu-package   # [RB] CR [TB] CR [SOB] JS=0D
+ [20] python-add-devel-package       # [SOB] JS=0D
+ [21] python-add-pytest-and-tests    # [SOB] JS=0D
+ [22] python-add-makefile-for-some   # [SOB] JS=0D
+ [23] python-add-gitignore           # [SOB] JS=0D
+ [24] gitlab-add-python-linters-to   # [SOB] JS=0D
> [25] python-add-make-develop-target # [SOB] JS=0D
=0D
Looking for reviews on:=0D
=0D
+ [03] python-create-qemu-packages    # python: create qemu packages=0D
+ [04] python-create-utils-sub        # python: create utils sub-package=0D
+ [05] python-add-qemu-package        # python: add qemu package installer=
=0D
+ [07] python-add-directory-structure # python: add directory structure REA=
DME.rst files=0D
+ [13] python-add-excluded-dirs-to    # python: add excluded dirs to flake8=
 config=0D
+ [15] python-move-mypy-ini-into      # python: move mypy.ini into setup.cf=
g=0D
+ [20] python-add-devel-package       # python: add devel package requireme=
nts to setuptools=0D
+ [21] python-add-pytest-and-tests    # python: add pytest and tests=0D
+ [22] python-add-makefile-for-some   # python: add Makefile for some commo=
n tasks=0D
+ [23] python-add-gitignore           # python: add .gitignore=0D
+ [24] gitlab-add-python-linters-to   # gitlab: add python linters to CI=0D
> [25] python-add-make-develop-target # python: add 'make develop' target=
=0D
=0D
Misc Notes=0D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
=0D
Reviewer notes:=0D
=0D
- The VERSION hack may be imperfect, but at 0.x and without uploading it=0D
  to PyPI, we have *all* the time in the world to fine-tune it later.=0D
- The CI integration may not be perfect, but it is better than *nothing*,=
=0D
  so I think it's worth doing even in an imperfect state.=0D
- Patch 25 is just a bonus, because I can't stop myself from making changes=
.=0D
=0D
John Snow (25):=0D
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
  python: add excluded dirs to flake8 config=0D
  python: Add flake8 to pipenv=0D
  python: move mypy.ini into setup.cfg=0D
  python: add mypy to pipenv=0D
  python: move .isort.cfg into setup.cfg=0D
  python/qemu: add isort to pipenv=0D
  python/qemu: add qemu package itself to pipenv=0D
  python: add devel package requirements to setuptools=0D
  python: add pytest and tests=0D
  python: add Makefile for some common tasks=0D
  python: add .gitignore=0D
  gitlab: add python linters to CI=0D
  python: add 'make develop' target=0D
=0D
 python/PACKAGE.rst                          |  32 +++=0D
 python/README.rst                           |  41 +++=0D
 python/qemu/README.rst                      |   8 +=0D
 python/qemu/machine/README.rst              |   9 +=0D
 python/qemu/qmp/README.rst                  |   9 +=0D
 python/qemu/utils/README.rst                |   7 +=0D
 .gitlab-ci.yml                              |  10 +=0D
 python/.gitignore                           |   9 +=0D
 python/Makefile                             |  42 +++=0D
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
 tests/acceptance/avocado_qemu/__init__.py   |   4 +-=0D
 tests/acceptance/virtio-gpu.py              |   2 +-=0D
 tests/docker/dockerfiles/fedora.docker      |   2 +=0D
 tests/qemu-iotests/297                      |   1 +=0D
 tests/qemu-iotests/300                      |   4 +-=0D
 tests/qemu-iotests/iotests.py               |   2 +-=0D
 tests/vm/aarch64vm.py                       |   2 +-=0D
 tests/vm/basevm.py                          |   2 +-=0D
 35 files changed, 698 insertions(+), 102 deletions(-)=0D
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


