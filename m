Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF57C3B48B7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:23:38 +0200 (CEST)
Received: from localhost ([::1]:56380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqUL-0006xP-TH
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqRK-0003jK-1l
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:20:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqRH-0005bb-2p
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624645226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0oRZoT37YKscPlAp4gJ2u/V6ukevJqeERn05yV/QEO8=;
 b=fUikTbzJZDZo8vKCgZT+4+h7CUwkkG/qXjxvjvyPbGvuZvEIzK7NQGcQRZ+f2iW8jFv/g8
 1YJsgadthLXBZnmI6zNgIbWmKM6QW0eaGrcYYYWrjiJ6DykSj4tLWnoaEddxDnp3YbYd9l
 ZR67Rmp7cEiAUYyYZjgugLZ+pLXazbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-DRBA7vq-NS-Kl2HSsuj0zQ-1; Fri, 25 Jun 2021 14:20:24 -0400
X-MC-Unique: DRBA7vq-NS-Kl2HSsuj0zQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E8D4EC1A3;
 Fri, 25 Jun 2021 18:20:23 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E5155D9C6;
 Fri, 25 Jun 2021 18:20:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/10] python/iotests: Run iotest linters during Python CI
Date: Fri, 25 Jun 2021 14:20:11 -0400
Message-Id: <20210625182021.803227-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210625154540.783306-1-jsnow@redhat.com>=0D
GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-iotest=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/327413868=0D
=0D
Since iotests are such a heavy and prominent user of the Python qemu.qmp=0D
and qemu.machine packages, it would be convenient if the Python linting=0D
suite also checked this client for any possible regressions introduced=0D
by shifting around signatures, types, or interfaces in these packages.=0D
=0D
(We'd eventually find those problems when iotest 297 ran, but with=0D
increasing distance between Python development and Block development,=0D
the risk of an accidental breakage in this regard increases. I,=0D
personally, know to run iotests (and especially 297) after changing=0D
Python code, but not everyone in the future might. Plus, I am lazy, and=0D
I like only having to push one button.)=0D
=0D
Add the ability for the Python CI to run the iotest linters too, which=0D
means that the iotest linters would be checked against:=0D
=0D
- Python 3.6, using a frozen set of linting packages at their oldest=0D
  supported versions, using 'pipenv'=0D
- Python 3.6 through Python 3.10 inclusive, using 'tox' and the latest=0D
  versions of mypy/pylint that happen to be installed during test=0D
  time. This CI test is allowed to fail with a warning, and can serve=0D
  as a bellwether for when new incompatible changes may disrupt the=0D
  linters. Testing against old and new Python interpreters alike can=0D
  help surface incompatibility issues we may need to be aware of.)=0D
=0D
Here are example outputs of those CI jobs with this series applied:=0D
 - "check-python-pipenv": https://gitlab.com/jsnow/qemu/-/jobs/1377735087=
=0D
 - "check-python-tox": https://gitlab.com/jsnow/qemu/-/jobs/1377735088=0D
=0D
You can also run these same tests locally from ./python, plus one more:=0D
=0D
- "make check-venv" to test against whatever python you have.=0D
- "make check-pipenv", if you have Python 3.6 and pipenv installed.=0D
- "make check-tox", if you have Python 3.6 through Python 3.10 installed.=
=0D
=0D
Here are example outputs from each of the three different local=0D
execution methods, in order as outlined above:=0D
=0D
(1)=0D
=0D
jsnow@scv ~/s/q/python (python-package-iotest)> make check-venv=0D
VENV ~/.cache/qemu-pyvenv=0D
ACTIVATE ~/.cache/qemu-pyvenv=0D
INSTALL qemu[devel] ~/.cache/qemu-pyvenv=0D
ACTIVATE ~/.cache/qemu-pyvenv=0D
make[1]: Entering directory '/home/jsnow/src/qemu/python'=0D
JOB ID     : 645eacd5ed7f4d5a76ea5f494984a55403a11081=0D
JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-25T12.01-645eacd/j=
ob.log=0D
 (1/5) tests/flake8.sh: PASS (0.28 s)=0D
 (2/5) tests/iotests.sh: PASS (9.61 s)=0D
 (3/5) tests/isort.sh: PASS (0.09 s)=0D
 (4/5) tests/mypy.sh: PASS (0.25 s)=0D
 (5/5) tests/pylint.sh: PASS (4.13 s)=0D
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0=0D
JOB TIME   : 14.73 s=0D
make[1]: Leaving directory '/home/jsnow/src/qemu/python'=0D
=0D
(2)=0D
=0D
jsnow@scv ~/s/q/python (python-package-iotest)> make check-pipenv=0D
Creating a virtualenv for this project...=0D
Pipfile: /home/jsnow/src/qemu/python/Pipfile=0D
Using /usr/bin/python3.6m (3.6.13) to create virtualenv...=0D
=E2=A0=B9 Creating virtual environment...created virtual environment CPytho=
n3.6.13.final.0-64 in 104ms=0D
  creator CPython3Posix(dest=3D/home/jsnow/src/qemu/python/.venv, clear=3DF=
alse, no_vcs_ignore=3DFalse, global=3DFalse)=0D
  seeder FromAppData(download=3DFalse, pip=3Dbundle, setuptools=3Dbundle, w=
heel=3Dbundle, via=3Dcopy, app_data_dir=3D/home/jsnow/.local/share/virtuale=
nv)=0D
    added seed packages: pip=3D=3D21.1.2, setuptools=3D=3D57.0.0, wheel=3D=
=3D0.36.2=0D
  activators BashActivator,CShellActivator,FishActivator,PowerShellActivato=
r,PythonActivator,XonshActivator=0D
=0D
=E2=9C=94 Successfully created virtual environment!=0D
Virtualenv location: /home/jsnow/src/qemu/python/.venv=0D
Installing dependencies from Pipfile.lock (c13e91)...=0D
  =F0=9F=90=8D   =E2=96=89=E2=96=89=E2=96=89=E2=96=89=E2=96=89=E2=96=89=E2=
=96=89=E2=96=89=E2=96=89=E2=96=89=E2=96=89=E2=96=89=E2=96=89=E2=96=89=E2=96=
=89=E2=96=89=E2=96=89=E2=96=89=E2=96=89=E2=96=89=E2=96=89=E2=96=89=E2=96=89=
=E2=96=89=E2=96=89=E2=96=89=E2=96=89=E2=96=89=E2=96=89=E2=96=89=E2=96=89=E2=
=96=89 30/30 =E2=80=94 00:00:08=0D
To activate this project's virtualenv, run pipenv shell.=0D
Alternatively, run a command inside the virtualenv with pipenv run.=0D
All dependencies are now up-to-date!=0D
rm -f pyproject.toml=0D
make[1]: Entering directory '/home/jsnow/src/qemu/python'=0D
JOB ID     : a56f53f3c5ef0058d341917228362db8ff24075f=0D
JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-25T11.58-a56f53f/j=
ob.log=0D
 (1/5) tests/flake8.sh: PASS (0.42 s)=0D
 (2/5) tests/iotests.sh: PASS (8.89 s)=0D
 (3/5) tests/isort.sh: PASS (0.24 s)=0D
 (4/5) tests/mypy.sh: PASS (0.30 s)=0D
 (5/5) tests/pylint.sh: PASS (3.96 s)=0D
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0=0D
JOB TIME   : 14.16 s=0D
make[1]: Leaving directory '/home/jsnow/src/qemu/python'=0D
=0D
(3)=0D
=0D
jsnow@scv ~/s/q/python (python-package-iotest)> make check-tox=0D
GLOB sdist-make: /home/jsnow/src/qemu/python/setup.py=0D
py36 create: /home/jsnow/src/qemu/python/.tox/py36=0D
py36 installdeps: .[devel], .[fuse]=0D
py36 inst: /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.z=
ip=0D
py36 installed: appdirs=3D=3D1.4.4,astroid=3D=3D2.5.6,avocado-framework=3D=
=3D89.0,distlib=3D=3D0.3.2,filelock=3D=3D3.0.12,flake8=3D=3D3.9.2,fusepy=3D=
=3D3.0.1,importlib-metadata=3D=3D4.5.0,importlib-resources=3D=3D5.1.4,isort=
=3D=3D5.9.1,lazy-object-proxy=3D=3D1.6.0,mccabe=3D=3D0.6.1,mypy=3D=3D0.910,=
mypy-extensions=3D=3D0.4.3,packaging=3D=3D20.9,pluggy=3D=3D0.13.1,py=3D=3D1=
.10.0,pycodestyle=3D=3D2.7.0,pyflakes=3D=3D2.3.1,pylint=3D=3D2.8.3,pyparsin=
g=3D=3D2.4.7,qemu @ file:///home/jsnow/src/qemu/python/.tox/.tmp/package/1/=
qemu-0.6.1.0a1.zip,six=3D=3D1.16.0,toml=3D=3D0.10.2,tox=3D=3D3.23.1,typed-a=
st=3D=3D1.4.3,typing-extensions=3D=3D3.10.0.0,virtualenv=3D=3D20.4.7,wrapt=
=3D=3D1.12.1,zipp=3D=3D3.4.1=0D
py36 run-test-pre: PYTHONHASHSEED=3D'835116428'=0D
py36 run-test: commands[0] | make check=0D
JOB ID     : c37bc201d0ec4d22a9f8b9347e3848e47fe88ba8=0D
JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-25T11.59-c37bc20/j=
ob.log=0D
 (1/5) tests/flake8.sh:  PASS (0.36 s)=0D
 (2/5) tests/iotests.sh:  PASS (10.64 s)=0D
 (3/5) tests/isort.sh:  PASS (0.11 s)=0D
 (4/5) tests/mypy.sh:  PASS (1.31 s)=0D
 (5/5) tests/pylint.sh:  PASS (4.45 s)=0D
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0=0D
JOB TIME   : 17.28 s=0D
py37 create: /home/jsnow/src/qemu/python/.tox/py37=0D
py37 installdeps: .[devel], .[fuse]=0D
py37 inst: /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.z=
ip=0D
py37 installed: appdirs=3D=3D1.4.4,astroid=3D=3D2.5.6,avocado-framework=3D=
=3D89.0,distlib=3D=3D0.3.2,filelock=3D=3D3.0.12,flake8=3D=3D3.9.2,fusepy=3D=
=3D3.0.1,importlib-metadata=3D=3D4.5.0,isort=3D=3D5.9.1,lazy-object-proxy=
=3D=3D1.6.0,mccabe=3D=3D0.6.1,mypy=3D=3D0.910,mypy-extensions=3D=3D0.4.3,pa=
ckaging=3D=3D20.9,pluggy=3D=3D0.13.1,py=3D=3D1.10.0,pycodestyle=3D=3D2.7.0,=
pyflakes=3D=3D2.3.1,pylint=3D=3D2.8.3,pyparsing=3D=3D2.4.7,qemu @ file:///h=
ome/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip,six=3D=3D1=
.16.0,toml=3D=3D0.10.2,tox=3D=3D3.23.1,typed-ast=3D=3D1.4.3,typing-extensio=
ns=3D=3D3.10.0.0,virtualenv=3D=3D20.4.7,wrapt=3D=3D1.12.1,zipp=3D=3D3.4.1=
=0D
py37 run-test-pre: PYTHONHASHSEED=3D'835116428'=0D
py37 run-test: commands[0] | make check=0D
JOB ID     : 5fd0aaadb8557f941d773dd28f0017bed7b36526=0D
JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-25T11.59-5fd0aaa/j=
ob.log=0D
 (1/5) tests/flake8.sh:  PASS (0.32 s)=0D
 (2/5) tests/iotests.sh:  PASS (11.52 s)=0D
 (3/5) tests/isort.sh:  PASS (0.09 s)=0D
 (4/5) tests/mypy.sh:  PASS (0.27 s)=0D
 (5/5) tests/pylint.sh:  PASS (4.44 s)=0D
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0=0D
JOB TIME   : 17.03 s=0D
py38 create: /home/jsnow/src/qemu/python/.tox/py38=0D
py38 installdeps: .[devel], .[fuse]=0D
py38 inst: /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.z=
ip=0D
py38 installed: appdirs=3D=3D1.4.4,astroid=3D=3D2.5.6,avocado-framework=3D=
=3D89.0,distlib=3D=3D0.3.2,filelock=3D=3D3.0.12,flake8=3D=3D3.9.2,fusepy=3D=
=3D3.0.1,isort=3D=3D5.9.1,lazy-object-proxy=3D=3D1.6.0,mccabe=3D=3D0.6.1,my=
py=3D=3D0.910,mypy-extensions=3D=3D0.4.3,packaging=3D=3D20.9,pluggy=3D=3D0.=
13.1,py=3D=3D1.10.0,pycodestyle=3D=3D2.7.0,pyflakes=3D=3D2.3.1,pylint=3D=3D=
2.8.3,pyparsing=3D=3D2.4.7,qemu @ file:///home/jsnow/src/qemu/python/.tox/.=
tmp/package/1/qemu-0.6.1.0a1.zip,six=3D=3D1.16.0,toml=3D=3D0.10.2,tox=3D=3D=
3.23.1,typing-extensions=3D=3D3.10.0.0,virtualenv=3D=3D20.4.7,wrapt=3D=3D1.=
12.1=0D
py38 run-test-pre: PYTHONHASHSEED=3D'835116428'=0D
py38 run-test: commands[0] | make check=0D
JOB ID     : dde7217f6afa2cb7496b8b8da3dee57783fa6377=0D
JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-25T11.59-dde7217/j=
ob.log=0D
 (1/5) tests/flake8.sh:  PASS (0.25 s)=0D
 (2/5) tests/iotests.sh:  PASS (10.17 s)=0D
 (3/5) tests/isort.sh:  PASS (0.08 s)=0D
 (4/5) tests/mypy.sh:  PASS (0.25 s)=0D
 (5/5) tests/pylint.sh:  PASS (3.96 s)=0D
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0=0D
JOB TIME   : 15.08 s=0D
py39 create: /home/jsnow/src/qemu/python/.tox/py39=0D
py39 installdeps: .[devel], .[fuse]=0D
py39 inst: /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.z=
ip=0D
py39 installed: appdirs=3D=3D1.4.4,astroid=3D=3D2.5.6,avocado-framework=3D=
=3D89.0,distlib=3D=3D0.3.2,filelock=3D=3D3.0.12,flake8=3D=3D3.9.2,fusepy=3D=
=3D3.0.1,isort=3D=3D5.9.1,lazy-object-proxy=3D=3D1.6.0,mccabe=3D=3D0.6.1,my=
py=3D=3D0.910,mypy-extensions=3D=3D0.4.3,packaging=3D=3D20.9,pluggy=3D=3D0.=
13.1,py=3D=3D1.10.0,pycodestyle=3D=3D2.7.0,pyflakes=3D=3D2.3.1,pylint=3D=3D=
2.8.3,pyparsing=3D=3D2.4.7,qemu @ file:///home/jsnow/src/qemu/python/.tox/.=
tmp/package/1/qemu-0.6.1.0a1.zip,six=3D=3D1.16.0,toml=3D=3D0.10.2,tox=3D=3D=
3.23.1,typing-extensions=3D=3D3.10.0.0,virtualenv=3D=3D20.4.7,wrapt=3D=3D1.=
12.1=0D
py39 run-test-pre: PYTHONHASHSEED=3D'835116428'=0D
py39 run-test: commands[0] | make check=0D
JOB ID     : 9c30aa6af6aece73acd995603a11df6f6d609b43=0D
JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-25T12.00-9c30aa6/j=
ob.log=0D
 (1/5) tests/flake8.sh:  PASS (0.31 s)=0D
 (2/5) tests/iotests.sh:  PASS (10.97 s)=0D
 (3/5) tests/isort.sh:  PASS (0.09 s)=0D
 (4/5) tests/mypy.sh:  PASS (0.24 s)=0D
 (5/5) tests/pylint.sh:  PASS (4.14 s)=0D
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0=0D
JOB TIME   : 16.11 s=0D
py310 create: /home/jsnow/src/qemu/python/.tox/py310=0D
py310 installdeps: .[devel], .[fuse]=0D
py310 inst: /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.=
zip=0D
py310 installed: appdirs=3D=3D1.4.4,astroid=3D=3D2.5.6,avocado-framework=3D=
=3D89.0,distlib=3D=3D0.3.2,filelock=3D=3D3.0.12,flake8=3D=3D3.9.2,fusepy=3D=
=3D3.0.1,isort=3D=3D5.9.1,lazy-object-proxy=3D=3D1.6.0,mccabe=3D=3D0.6.1,my=
py=3D=3D0.910,mypy-extensions=3D=3D0.4.3,packaging=3D=3D20.9,pluggy=3D=3D0.=
13.1,py=3D=3D1.10.0,pycodestyle=3D=3D2.7.0,pyflakes=3D=3D2.3.1,pylint=3D=3D=
2.8.3,pyparsing=3D=3D2.4.7,qemu @ file:///home/jsnow/src/qemu/python/.tox/.=
tmp/package/1/qemu-0.6.1.0a1.zip,six=3D=3D1.16.0,toml=3D=3D0.10.2,tox=3D=3D=
3.23.1,typing-extensions=3D=3D3.10.0.0,virtualenv=3D=3D20.4.7,wrapt=3D=3D1.=
12.1=0D
py310 run-test-pre: PYTHONHASHSEED=3D'835116428'=0D
py310 run-test: commands[0] | make check=0D
JOB ID     : 24de320dd6b9130a6986c67ea3bf9aff6af7b134=0D
JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-25T12.00-24de320/j=
ob.log=0D
 (1/5) tests/flake8.sh:  PASS (0.29 s)=0D
 (2/5) tests/iotests.sh:  PASS (18.38 s)=0D
 (3/5) tests/isort.sh:  PASS (0.09 s)=0D
 (4/5) tests/mypy.sh:  PASS (0.54 s)=0D
 (5/5) tests/pylint.sh:  PASS (4.10 s)=0D
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0=0D
JOB TIME   : 23.70 s=0D
___________________________________ summary _______________________________=
____=0D
  py36: commands succeeded=0D
  py37: commands succeeded=0D
  py38: commands succeeded=0D
  py39: commands succeeded=0D
  py310: commands succeeded=0D
  congratulations :)=0D
=0D
John Snow (10):=0D
  iotests/297: modify is_python_file to work from any CWD=0D
  iotests/297: Add get_files() function=0D
  iotests/297: Don't rely on distro-specific linter binaries=0D
  iotests/297: Create main() function=0D
  iotests/297: Separate environment setup from test execution=0D
  iotests/297: Add 'directory' argument to run_linters=0D
  iotests/297: return error code from run_linters()=0D
  iotests/297: split linters.py off from 297=0D
  iotests/linters: Add entry point for Python CI linters=0D
  python: Add iotest linters to test suite=0D
=0D
 python/tests/iotests.sh       |   2 +=0D
 tests/qemu-iotests/297        |  80 +++------------------=0D
 tests/qemu-iotests/linters.py | 130 ++++++++++++++++++++++++++++++++++=0D
 3 files changed, 141 insertions(+), 71 deletions(-)=0D
 create mode 100755 python/tests/iotests.sh=0D
 create mode 100755 tests/qemu-iotests/linters.py=0D
=0D
--=20=0D
2.31.1=0D
=0D


