Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1663D383D6D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:30:19 +0200 (CEST)
Received: from localhost ([::1]:43072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiwU-0001BR-4a
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liiMH-00035G-Ns
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:52:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liiME-0001js-5p
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621277569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8hh8hikySvHc27y0nyR0AdCh9lZcoAliGoiJcQZa2A=;
 b=CTwWh7TaX6TJfxA+g9ElV/Y3zUtpxZeTpSUnTFFCyOf8ZQmEeE0sxroHSC+zz46chfBuf2
 4zTbHSwglJRbmZ4hGvjHlZiB39Y2gccCKhJhH43sMh7MN3fVZA4rY0DgJbE9utHhEy4PwV
 EmbwgM2K+3HWV+2TINLNJ9TtaYwR8dE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-e9hPFYRtM7yyM2i02_WM1A-1; Mon, 17 May 2021 14:52:46 -0400
X-MC-Unique: e9hPFYRtM7yyM2i02_WM1A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2D22805EF1;
 Mon, 17 May 2021 18:52:44 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0126C19C46;
 Mon, 17 May 2021 18:52:33 +0000 (UTC)
Subject: Re: [PATCH v6 00/25] python: create installable package
To: qemu-devel@nongnu.org
References: <20210512231241.2816122-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <d59b6295-58a4-90bd-f898-75d8fc5326ed@redhat.com>
Date: Mon, 17 May 2021 14:52:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512231241.2816122-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 7:12 PM, John Snow wrote:
> Based-on: <20210512214642.2803189-1-jsnow@redhat.com>
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/302010131
> GitLab: https://gitlab.com/jsnow/qemu/-/tree/python-package-mk3
> MR: https://gitlab.com/jsnow/qemu/-/merge_requests/4
> 
Patchset updated and rebased on top of new linting pre-req series.
(Gitlab branch and MR rebased and updated.)

Based-on: <20210517184808.3562549-1-jsnow@redhat.com>

> I invite you to leave review comments on my mock merge request on
> gitlab, submitted against my own mirror. I will, as always, also respond
> to feedback on-list.
> 
> ABOUT
> =====
> 
> This series factors the python/qemu directory as an installable
> package. It does not yet actually change the mechanics of how any other
> python source in the tree actually consumes it (yet), beyond the import
> path -- some import statements change in a few places.
> 
> RATIONALE
> =========
> 
> The primary motivation of this series is primarily to formalize our
> dependencies on mypy, flake8, isort, and pylint alongside versions that
> are known to work. It does this using the setup.cfg and setup.py
> files. It also adds explicitly pinned versions (using Pipfile.lock) of
> these dependencies that should behave in a repeatable and known way for
> developers and CI environments both. Lastly, it enables those CI checks
> such that we can enforce Python coding quality checks via the CI tests.
> 
> An auxiliary motivation is that this package is formatted in such a way
> that it COULD be uploaded to https://pypi.org/project/qemu and installed
> independently of qemu.git with `pip install qemu`, but that button
> remains *unpushed* and this series *will not* cause any such
> releases. We have time to debate finer points like API guarantees and
> versioning even after this series is merged.
> 
> Other bits of interest
> ----------------------
> 
> With the python tooling as a proper package, you can install this
> package in editable or production mode to a virtual environment, your
> local user environment, or your system packages. The primary benefit of
> this is to gain access to QMP tooling regardless of CWD, without needing
> to battle sys.path (and confounding other python analysis tools).
> 
> For example: when developing, you may go to qemu/python/ and run `make
> venv` followed by `pipenv shell` to activate a virtual environment that
> contains the qemu python packages. These packages will always reflect
> the current version of the source files in the tree. When you are
> finished, you can simply exit the shell (^d) to remove these packages
> from your python environment.
> 
> When not developing, you could install a version of this package to your
> environment outright to gain access to the QMP and QEMUMachine classes
> for lightweight scripting and testing by using pip: "pip install
> [--user] ."
> 
> TESTING THIS SERIES
> ===================
> 
> First of all, nothing should change. Without any intervention,
> everything should behave exactly as it did before. The only new
> information here comes from how to interact with and run the linters
> that will be enforcing code quality standards in this subdirectory.
> 
> There are various invocations available that will test subtly different
> combinations using subtly different environments. I am assuming some
> light knowledge of Python environments and installing Python packages
> here. If you have questions, I would be delighted to answer them.
> 
> To test the new tests, CD to ./python/ first, and then:
> 
> 0. Try "make" or "make help" to get a sense of this series.
> 
> 1. Try "make venv && pipenv shell" to get a venv with the package
>     installed to it in editable mode. Ctrl+d exits this venv shell. While
>     in this shell, any python script that uses "from qemu.[qmp|machine]
>     import ..." should work correctly regardless of where the script is,
>     or what your CWD is.
> 
>     This will pull some packages from PyPI and install them into the
>     virtual environment, leaving your normal environment untouched.
> 
>     You will need Python 3.6 and pipenv installed on your system to do
>     this step. For Fedora: "dnf install python36 pipenv" will do the
>     trick. If you don't have this, skip down to #4 and onwards.
> 
> 2. Try "make check" while still in the shell to run the Python linters
> using the venv built in the previous step. This will run avocado, which
> will in turn execute mypy, flake8, isort and pylint with the correct
> arguments.
> 
> 3. Having exited the shell from above, try "make venv-check". This will
> create and update the venv if needed, then run 'make check' within the
> context of that shell. It should pass as long as the above did. You
> should be able to run "make distclean" prior to running "make
> venv-check" and have the entire process work start to finish.
> 
> 4. Still outside of the venv, you may try running "make check". This
> will not install anything, but unless you have the right Python
> dependencies installed, these tests may fail for you. You might try
> using "pip install --user .[devel]" to install the development packages
> needed to run the tests successfully to your local user's python
> environment. Once done, you will probably want to "pip uninstall qemu"
> to remove the qemu packages to avoid them interfering with other things.
> 
> 5. "make distclean" will delete the venv and any temporary files that
> may have been created by packaging, installing, testing, etc.
> 
> 6. You may also (if you wish) create your own environment using a Python
>     other than 3.6, bypassing pipenv. This may be useful for environments
>     in which you simply do not have Python 3.6 readily available, or
>     explicitly wish to test against a different version.
> 
>     Using the Python of your choice:
> 
>     - `> make distclean` (Remove the .venv, if you created one.)
>     - `> /usr/bin/python3.9 -m venv .venv`
>     - `> source .venv/bin/activate` (or activate.[fish|csh])
>     - `> make develop`  (Installs linter deps to this venv)
>     - `> make check`    (Runs tests using current env)
>     - `> deactivate`    (Leaves the venv)
> 
>     This *should* pass, and if it doesn't, it's a bug. Due to
>     dependencies changing like shifting sands, it's impossible to promise
>     support for every last combination of dependency and python
>     version. This is why the "make venv-check" target uses Python 3 and a
>     very explicit set of packages instead. Still, this form *should*
>     pass.
> 
> 7. If you are running Fedora or a distro that packages multiple Python
> versions, you can try running "make check-tox" to run the linters under
> all Python versions from Python 3.6 to 3.9. This will create a series of
> virtual environments under the .tox folder, leaving your existing
> environment unscathed. This should pass, provided you have the requisite
> Python versions on hand. When you are done, "make distclean" should
> remove any testing files.
> 
> CHANGELOG
> =========
> 
> V6
> --
> 
> ```
> 001/25:[----] [--] 'iotests/297: add --namespace-packages to mypy arguments'
> 002/25:[----] [-C] 'python: create qemu packages'
> 003/25:[----] [--] 'python: create utils sub-package'
> 004/25:[0005] [FC] 'python: add qemu package installer'
> 005/25:[0002] [FC] 'python: add VERSION file'
> 006/25:[----] [--] 'python: add directory structure README.rst files'
> 007/25:[down] 'python: add MANIFEST.in'
> 008/25:[0001] [FC] 'python: Add pipenv support'
> 009/25:[----] [--] 'python: add pylint import exceptions'
> 010/25:[----] [--] 'python: move pylintrc into setup.cfg'
> 011/25:[0083] [FC] 'python: add pylint to pipenv'
> 012/25:[----] [--] 'python: move flake8 config to setup.cfg'
> 013/25:[----] [--] 'python: add excluded dirs to flake8 config'
> 014/25:[0038] [FC] 'python: Add flake8 to pipenv'
> 015/25:[----] [--] 'python: move mypy.ini into setup.cfg'
> 016/25:[0050] [FC] 'python: add mypy to pipenv'
> 017/25:[----] [--] 'python: move .isort.cfg into setup.cfg'
> 018/25:[0006] [FC] 'python/qemu: add isort to pipenv'
> 019/25:[0004] [FC] 'python/qemu: add qemu package itself to pipenv'
> 020/25:[0014] [FC] 'python: add devel package requirements to setuptools'
> 021/25:[down] 'python: add avocado-framework and tests'
> 022/25:[0015] [FC] 'python: add Makefile for some common tasks'
> 023/25:[0018] [FC] 'python: add .gitignore'
> 024/25:[0004] [FC] 'gitlab: add python linters to CI'
> 025/25:[down] 'python: add tox support'
> ```
> 
> - 04: Changed maintainer blurb in PACKAGE.rst
> - 05: VERSION is now 0.6.1a0
> - 07: New, needed for both tox and using Pipenv to install the qemu
>        package(s) in editable mode.
> - 08: Add README entries explaining the purpose of the pipenv files.
> - 11: pylint dependency was bumped to 2.7.0.
> - 14: pipenv changes.
> - 16: pipenv changes.
> - 18: isort pinned at >= 5.1.2 now; see commit message.
> - 19: pipenv changes.
> - 20: Context differences from isort, pylint, and pipenv changes.
> - 22:
>     - Add 'make develop'
>     - Add more README.rst entries.
>     - Change pytest invocation to avocado.
> - 23:
>     - Add comments to gitignore, split ignores out by function/category
>     - Ignore vscode files. (I like vscode now!)
> - 24: Use the 'needs' feature of Gitlab CI and move the test to 'test'
>    stage
> 
> STATUS
> =======
> 
> ```
> + [01] iotests-297-add-namespace      # [RB] CR [SOB] JS
> + [02] python-create-qemu-packages    # [SOB] JS
> + [03] python-create-utils-sub        # [SOB] JS
> + [04] python-add-qemu-package        # [SOB] JS
> + [05] python-add-version-file        # [RB] CR [SOB] JS
> + [06] python-add-directory-structure # [SOB] JS
> + [07] python-add-manifest-in         # [SOB] JS
> + [08] python-add-pipenv-support      # [RB] CR [SOB] JS
> + [09] python-add-pylint-import       # [RB] CR [SOB] JS
> + [10] python-move-pylintrc-into      # [RB] CR [TB] CR [SOB] JS
> + [11] python-add-pylint-to-pipenv    # [SOB] JS
> + [12] python-move-flake8-config-to   # [RB] CR [SOB] JS
> + [13] python-add-excluded-dirs-to    # [SOB] JS
> + [14] python-add-flake8-to-pipenv    # [RB] CR [TB] CR [SOB] JS
> + [15] python-move-mypy-ini-into      # [SOB] JS
> + [16] python-add-mypy-to-pipenv      # [RB] CR [TB] CR [SOB] JS
> + [17] python-move-isort-cfg-into     # [RB] CR [SOB] JS
> + [18] python-qemu-add-isort-to       # [SOB] JS
> + [19] python-qemu-add-qemu-package   # [RB] CR [TB] CR [SOB] JS
> + [20] python-add-devel-package       # [SOB] JS
> + [21] python-add-avocado-framework   # [SOB] JS
> + [22] python-add-makefile-for-some   # [SOB] JS
> + [23] python-add-gitignore           # [SOB] JS
> + [24] gitlab-add-python-linters-to   # [SOB] JS
>> [25] python-add-tox-support         # [SOB] JS
> ```
> 
> John Snow (25):
>    iotests/297: add --namespace-packages to mypy arguments
>    python: create qemu packages
>    python: create utils sub-package
>    python: add qemu package installer
>    python: add VERSION file
>    python: add directory structure README.rst files
>    python: add MANIFEST.in
>    python: Add pipenv support
>    python: add pylint import exceptions
>    python: move pylintrc into setup.cfg
>    python: add pylint to pipenv
>    python: move flake8 config to setup.cfg
>    python: add excluded dirs to flake8 config
>    python: Add flake8 to pipenv
>    python: move mypy.ini into setup.cfg
>    python: add mypy to pipenv
>    python: move .isort.cfg into setup.cfg
>    python/qemu: add isort to pipenv
>    python/qemu: add qemu package itself to pipenv
>    python: add devel package requirements to setuptools
>    python: add avocado-framework and tests
>    python: add Makefile for some common tasks
>    python: add .gitignore
>    gitlab: add python linters to CI
>    python: add tox support
> 
>   python/PACKAGE.rst                          |  33 +++
>   python/README.rst                           |  53 +++++
>   python/qemu/README.rst                      |   8 +
>   python/qemu/machine/README.rst              |   9 +
>   python/qemu/qmp/README.rst                  |   9 +
>   python/qemu/utils/README.rst                |   7 +
>   .gitlab-ci.yml                              |  12 +
>   python/.gitignore                           |  20 ++
>   python/MANIFEST.in                          |   2 +
>   python/Makefile                             |  47 ++++
>   python/Pipfile                              |  13 ++
>   python/Pipfile.lock                         | 231 ++++++++++++++++++++
>   python/VERSION                              |   1 +
>   python/avocado.cfg                          |  10 +
>   python/mypy.ini                             |   4 -
>   python/qemu/.flake8                         |   2 -
>   python/qemu/.isort.cfg                      |   7 -
>   python/qemu/__init__.py                     |  11 -
>   python/qemu/machine/__init__.py             |  36 +++
>   python/qemu/{ => machine}/console_socket.py |   0
>   python/qemu/{ => machine}/machine.py        |  16 +-
>   python/qemu/{ => machine}/qtest.py          |   3 +-
>   python/qemu/pylintrc                        |  58 -----
>   python/qemu/{qmp.py => qmp/__init__.py}     |  12 +-
>   python/qemu/utils/__init__.py               |  23 ++
>   python/qemu/{ => utils}/accel.py            |   0
>   python/setup.cfg                            |  79 +++++++
>   python/setup.py                             |  23 ++
>   python/tests/flake8.sh                      |   2 +
>   python/tests/isort.sh                       |   2 +
>   python/tests/mypy.sh                        |   2 +
>   python/tests/pylint.sh                      |   2 +
>   python/tox.ini                              |  13 ++
>   tests/acceptance/avocado_qemu/__init__.py   |   4 +-
>   tests/acceptance/virtio-gpu.py              |   2 +-
>   tests/docker/dockerfiles/fedora.docker      |   2 +
>   tests/qemu-iotests/297                      |   1 +
>   tests/qemu-iotests/300                      |   4 +-
>   tests/qemu-iotests/iotests.py               |   2 +-
>   tests/vm/aarch64vm.py                       |   2 +-
>   tests/vm/basevm.py                          |   2 +-
>   41 files changed, 672 insertions(+), 97 deletions(-)
>   create mode 100644 python/PACKAGE.rst
>   create mode 100644 python/README.rst
>   create mode 100644 python/qemu/README.rst
>   create mode 100644 python/qemu/machine/README.rst
>   create mode 100644 python/qemu/qmp/README.rst
>   create mode 100644 python/qemu/utils/README.rst
>   create mode 100644 python/.gitignore
>   create mode 100644 python/MANIFEST.in
>   create mode 100644 python/Makefile
>   create mode 100644 python/Pipfile
>   create mode 100644 python/Pipfile.lock
>   create mode 100644 python/VERSION
>   create mode 100644 python/avocado.cfg
>   delete mode 100644 python/mypy.ini
>   delete mode 100644 python/qemu/.flake8
>   delete mode 100644 python/qemu/.isort.cfg
>   delete mode 100644 python/qemu/__init__.py
>   create mode 100644 python/qemu/machine/__init__.py
>   rename python/qemu/{ => machine}/console_socket.py (100%)
>   rename python/qemu/{ => machine}/machine.py (98%)
>   rename python/qemu/{ => machine}/qtest.py (98%)
>   delete mode 100644 python/qemu/pylintrc
>   rename python/qemu/{qmp.py => qmp/__init__.py} (96%)
>   create mode 100644 python/qemu/utils/__init__.py
>   rename python/qemu/{ => utils}/accel.py (100%)
>   create mode 100644 python/setup.cfg
>   create mode 100755 python/setup.py
>   create mode 100755 python/tests/flake8.sh
>   create mode 100755 python/tests/isort.sh
>   create mode 100755 python/tests/mypy.sh
>   create mode 100755 python/tests/pylint.sh
>   create mode 100644 python/tox.ini
> 


