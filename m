Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEA3397D10
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 01:33:42 +0200 (CEST)
Received: from localhost ([::1]:55082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loDtF-0002tk-18
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 19:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loDrT-0001T9-EU
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:31:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loDrQ-0005iJ-27
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622590306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hNPZBcgLiz1CczBao+qWhsa69KFWOz4zqDHSb76KolA=;
 b=HAEASOb3uCsClNrk5/wSO+IO2EsNGC9GzV0n0fXr8DQTh22utSzwNfH9OxVdmpTrzZkzUm
 VkDwI8dfvO6HLfjrCVkYzMdgx0wjOi48D2+qY/q+g0a3lH/DJmXhpVRz40X7xJAmVELs3d
 QGGIiiwiQF7hiuoTOgQjAVrKGB4s90M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-HzJJ6hCuN8uyvbFB--v6Jw-1; Tue, 01 Jun 2021 19:31:43 -0400
X-MC-Unique: HzJJ6hCuN8uyvbFB--v6Jw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B51BC804747;
 Tue,  1 Jun 2021 23:31:41 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A33F2C01E;
 Tue,  1 Jun 2021 23:31:19 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/44] Python patches
Date: Tue,  1 Jun 2021 19:31:17 -0400
Message-Id: <20210601233118.1103509-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 52848929b70dcf92a68aedcfd90207be81ba3274=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210528-pull-reque=
st' into staging (2021-05-30 20:10:30 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to 6b9c277797879ce41ed20deb6737f4156cc279b3:=0D
=0D
  gitlab: add python linters to CI (2021-06-01 16:21:21 -0400)=0D
=0D
----------------------------------------------------------------=0D
Pull request=0D
=0D
V2:=0D
 - Squashed in fixup for=0D
   'Python: add utility function for retrieving port redirection'=0D
 - Rebased on today's upstream=0D
=0D
CI here:=0D
https://gitlab.com/jsnow/qemu/-/pipelines/313202814=0D
=0D
----------------------------------------------------------------=0D
=0D
Cleber Rosa (12):=0D
  Python: expose QEMUMachine's temporary directory=0D
  tests/acceptance/virtiofs_submounts.py: add missing accel tag=0D
  tests/acceptance/virtiofs_submounts.py: evaluate string not length=0D
  Python: add utility function for retrieving port redirection=0D
  Acceptance Tests: move useful ssh methods to base class=0D
  Acceptance Tests: add port redirection for ssh by default=0D
  Acceptance Tests: make username/password configurable=0D
  Acceptance Tests: set up SSH connection by default after boot for=0D
    LinuxTest=0D
  tests/acceptance/virtiofs_submounts.py: remove launch_vm()=0D
  Acceptance Tests: add basic documentation on LinuxTest base class=0D
  Acceptance Tests: introduce CPU hotplug test=0D
  tests/acceptance/virtiofs_submounts.py: fix setup of SSH pubkey=0D
=0D
John Snow (31):=0D
  python/console_socket: avoid one-letter variable=0D
  python/machine: use subprocess.DEVNULL instead of=0D
    open(os.path.devnull)=0D
  python/machine: use subprocess.run instead of subprocess.Popen=0D
  python/console_socket: Add a pylint ignore=0D
  python/machine: Disable pylint warning for open() in _pre_launch=0D
  python/machine: disable warning for Popen in _launch()=0D
  python/machine: Trim line length to below 80 chars=0D
  iotests/297: add --namespace-packages to mypy arguments=0D
  python: create qemu packages=0D
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
  python: add tox support=0D
  gitlab: add python linters to CI=0D
=0D
Willian Rampazzo (1):=0D
  acceptance tests: bump Avocado version to 88.1=0D
=0D
 docs/devel/testing.rst                      |  26 +++=0D
 python/PACKAGE.rst                          |  43 ++++=0D
 python/README.rst                           |  58 +++++=0D
 python/qemu/README.rst                      |   8 +=0D
 python/qemu/machine/README.rst              |   9 +=0D
 python/qemu/qmp/README.rst                  |   9 +=0D
 python/qemu/utils/README.rst                |   7 +=0D
 .gitlab-ci.d/containers.yml                 |   5 +=0D
 .gitlab-ci.d/static_checks.yml              |  21 ++=0D
 python/.gitignore                           |  16 ++=0D
 python/MANIFEST.in                          |   3 +=0D
 python/Makefile                             |  48 ++++=0D
 python/Pipfile                              |  13 ++=0D
 python/Pipfile.lock                         | 231 ++++++++++++++++++++=0D
 python/VERSION                              |   1 +=0D
 python/avocado.cfg                          |  10 +=0D
 python/mypy.ini                             |   4 -=0D
 python/qemu/.flake8                         |   2 -=0D
 python/qemu/.isort.cfg                      |   7 -=0D
 python/qemu/__init__.py                     |  11 -=0D
 python/qemu/machine/__init__.py             |  36 +++=0D
 python/qemu/{ =3D> machine}/console_socket.py |  11 +-=0D
 python/qemu/{ =3D> machine}/machine.py        |  68 ++++--=0D
 python/qemu/{ =3D> machine}/qtest.py          |   9 +-=0D
 python/qemu/pylintrc                        |  58 -----=0D
 python/qemu/{qmp.py =3D> qmp/__init__.py}     |  12 +-=0D
 python/qemu/utils/__init__.py               |  45 ++++=0D
 python/qemu/{ =3D> utils}/accel.py            |   0=0D
 python/setup.cfg                            | 102 +++++++++=0D
 python/setup.py                             |  23 ++=0D
 python/tests/flake8.sh                      |   2 +=0D
 python/tests/isort.sh                       |   2 +=0D
 python/tests/mypy.sh                        |   2 +=0D
 python/tests/pylint.sh                      |   2 +=0D
 tests/acceptance/avocado_qemu/__init__.py   |  69 +++++-=0D
 tests/acceptance/boot_linux.py              |  18 +-=0D
 tests/acceptance/hotplug_cpu.py             |  37 ++++=0D
 tests/acceptance/info_usernet.py            |  29 +++=0D
 tests/acceptance/linux_ssh_mips_malta.py    |  42 +---=0D
 tests/acceptance/virtio-gpu.py              |   2 +-=0D
 tests/acceptance/virtiofs_submounts.py      |  71 +-----=0D
 tests/docker/dockerfiles/python.docker      |  18 ++=0D
 tests/qemu-iotests/297                      |   1 +=0D
 tests/qemu-iotests/300                      |   4 +-=0D
 tests/qemu-iotests/iotests.py               |   4 +-=0D
 tests/requirements.txt                      |   2 +-=0D
 tests/vm/aarch64vm.py                       |   2 +-=0D
 tests/vm/basevm.py                          |  12 +-=0D
 48 files changed, 967 insertions(+), 248 deletions(-)=0D
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
 rename python/qemu/{ =3D> machine}/console_socket.py (94%)=0D
 rename python/qemu/{ =3D> machine}/machine.py (93%)=0D
 rename python/qemu/{ =3D> machine}/qtest.py (95%)=0D
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
 create mode 100644 tests/acceptance/hotplug_cpu.py=0D
 create mode 100644 tests/acceptance/info_usernet.py=0D
 create mode 100644 tests/docker/dockerfiles/python.docker=0D
=0D
--=20=0D
2.31.1=0D
=0D


