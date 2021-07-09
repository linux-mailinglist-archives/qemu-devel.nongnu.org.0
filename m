Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A5B3C25FF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:32:42 +0200 (CEST)
Received: from localhost ([::1]:60484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rYX-0007Ly-17
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rW7-0004b6-4j
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:11 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rW4-0005TO-Ud
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:10 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v5so12434571wrt.3
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6nn5hibjkCcgBU7kLf4K9C0rokjCPnMJF57FGy2N/wA=;
 b=N2zcTP3N+Ykhgf8b9ED16cvbn60ad+DK0VmMwOMzFCXY1MnJhAFi+wsMlZOgY3BpHv
 UqOv6HC7ji3j5djn55Gf3sHRf+8BRqnu7U2Ms0Er6H7yCVs2byqktOAUAaCtCxG6YIus
 YjYXFmvrtHIEzDs+RfINgh7hfjzO6oHsVsVnKIO3m/RrRrrN6ckNWTwsoaGkGUuUtd1c
 yWoH2U1jfn/Wr5GkLpkQE+SUhpyMjek4MGIQmbDvyvrOG5A6OMzQ8P65Bm6zc4K6VUyr
 ggqVzFDrRLbGdVWJMY8/yPP88RvAAZ2N/68rUmeXsHbxpXpFUizFkvY6uf+YoUBGgitD
 dNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6nn5hibjkCcgBU7kLf4K9C0rokjCPnMJF57FGy2N/wA=;
 b=tuR5Bkq5HE0alEBAMB///yZDBkyzqqoVxXv9sLvZXnpw+cVChNSvNJwSbu3KRsM+aL
 mx47+EMUpDMWc3fvppMf7ZdWvFATspsp0TODus62fQWboJZ2B8AarQDQ7ZUweGnwz3JD
 HPkNPDgR1hzTVMutzmkR4EQ7sOkHEeEHgJAYdvvU0bB3LZgGAnI4XNpa3gl5gHjSDNe+
 9+TO20fn9PjpovqWzbVdttXHSmH/hkrcnwwBkNUxaCKMupwj/QrA8PDGYqjCL1x4VWn3
 D9b3VabhNCxmu2+v21Un2bxLYV31g4AEjpxrcg6EURLYH//CJOpgZyvU/6JDZJW18r1l
 IRMg==
X-Gm-Message-State: AOAM5339geYEPWk4UbfyyWEJaCNf+HoLutLhYi6jnYhvYDUjsR9j7vwK
 E1x/1Jmwg/sjbT93eP4mk+6e/Q==
X-Google-Smtp-Source: ABdhPJzEHgd74GROE1+pHS9Zx4AlwJR7XlTfG51STYseQWb74Xw5d8Fa4PGrPg805+tL6OoqfhXtGQ==
X-Received: by 2002:a05:6000:1a43:: with SMTP id
 t3mr42383694wry.112.1625841007383; 
 Fri, 09 Jul 2021 07:30:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v21sm1322331wml.5.2021.07.09.07.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:30:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B20061FF7E;
 Fri,  9 Jul 2021 15:30:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.1 v3 00/40] testing and plugins pre-PR
Date: Fri,  9 Jul 2021 15:29:25 +0100
Message-Id: <20210709143005.1554-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Apologies for the patch bombing but I figured it was easier to turn
this around quickly to make the PR roll on Monday easier and reduce
the chance of an errors creeping in. Mostly addressing review comments
but I fixed a bug with the windows test and also added a new commit to
split the static & plugins check. So only two patches outstanding:

 - configure: add an explicit static and plugins check
 - tests/tcg: make test-mmap a little less aggressive

Alex Bennée (9):
  tests/tcg: also disable the signals test for plugins
  tests/tcg: make test-mmap a little less aggressive
  plugins: fix-up handling of internal hostaddr for 32 bit
  meson.build: move TCG plugin summary output
  configure: don't allow plugins to be enabled for a non-TCG build
  configure: add an explicit static and plugins check
  configure: stop user enabling plugins on Windows for now
  tcg/plugins: enable by default for most TCG builds
  contrib/plugins: enable -Wall for building plugins

Alexandre Iooss (2):
  contrib/plugins: add execlog to log instruction execution and memory
    access
  docs/devel: tcg-plugins: add execlog plugin description

Brad Smith (2):
  tests/vm: update NetBSD to 9.2
  tests/vm: update openbsd to release 6.9

Cleber Rosa (4):
  Jobs based on custom runners: documentation and configuration
    placeholder
  Jobs based on custom runners: build environment docs and playbook
  Jobs based on custom runners: docs and gitlab-runner setup playbook
  Jobs based on custom runners: add job definitions for QEMU's machines

Daniel P. Berrangé (18):
  build: validate that system capstone works before using it
  gitlab: support for FreeBSD 12, 13 and macOS 11 via cirrus-run
  cirrus: delete FreeBSD and macOS jobs
  hw/usb/ccid: remove references to NSS
  tests/docker: don't use BUILDKIT in GitLab either
  tests/docker: use project specific container registries
  tests/docker: use explicit docker.io registry
  tests/docker: remove FEATURES env var from templates
  tests/docker: fix sorting in package lists
  tests/docker: fix mistakes in centos package lists
  tests/docker: fix mistakes in fedora package list
  tests/docker: fix mistakes in ubuntu package lists
  tests/docker: remove mingw packages from Fedora
  tests/docker: expand centos8 package list
  tests/docker: expand fedora package list
  tests/docker: expand ubuntu1804 package list
  tests/docker: expand ubuntu2004 package list
  tests/docker: expand opensuse-leap package list

Mahmoud Mandour (5):
  plugins: Added a new cache modelling plugin
  plugins/cache: Enable cache parameterization
  plugins/cache: Added FIFO and LRU eviction policies
  docs/devel: Added cache plugin to the plugins docs
  MAINTAINERS: Added myself as a reviewer for TCG Plugins

 docs/ccid.txt                                 |  15 +-
 docs/devel/ci.rst                             | 127 ++++
 docs/devel/index.rst                          |   1 +
 docs/devel/tcg-plugins.rst                    |  86 ++-
 .gitlab-ci.d/cirrus/README.rst                |  54 ++
 configure                                     | 141 ++--
 meson.build                                   |  15 +-
 include/qemu/plugin-memory.h                  |   2 +-
 accel/tcg/cputlb.c                            |   2 +-
 contrib/plugins/cache.c                       | 641 ++++++++++++++++++
 contrib/plugins/execlog.c                     | 153 +++++
 plugins/api.c                                 |   4 +-
 tests/tcg/multiarch/test-mmap.c               | 208 +++---
 .cirrus.yml                                   |  55 --
 .gitlab-ci.d/buildtest.yml                    |  23 -
 .gitlab-ci.d/cirrus.yml                       | 102 +++
 .gitlab-ci.d/cirrus/build.yml                 |  35 +
 .gitlab-ci.d/cirrus/freebsd-12.vars           |  13 +
 .gitlab-ci.d/cirrus/freebsd-13.vars           |  13 +
 .gitlab-ci.d/cirrus/macos-11.vars             |  15 +
 .gitlab-ci.d/custom-runners.yml               | 222 ++++++
 .gitlab-ci.d/qemu-project.yml                 |   2 +
 .travis.yml                                   |  12 +-
 MAINTAINERS                                   |   2 +
 contrib/plugins/Makefile                      |   4 +-
 scripts/ci/setup/.gitignore                   |   2 +
 scripts/ci/setup/build-environment.yml        | 116 ++++
 scripts/ci/setup/gitlab-runner.yml            |  71 ++
 scripts/ci/setup/inventory.template           |   1 +
 scripts/ci/setup/vars.yml.template            |  12 +
 scripts/coverity-scan/coverity-scan.docker    |   1 -
 tests/docker/common.rc                        |  19 +-
 tests/docker/docker.py                        |   4 +-
 tests/docker/dockerfiles/centos8.docker       |  82 ++-
 .../dockerfiles/debian-xtensa-cross.docker    |   2 +-
 tests/docker/dockerfiles/debian10.docker      |   4 +-
 tests/docker/dockerfiles/debian11.docker      |   2 +-
 .../dockerfiles/fedora-cris-cross.docker      |   2 +-
 .../dockerfiles/fedora-i386-cross.docker      |   2 +-
 .../dockerfiles/fedora-win32-cross.docker     |   3 +-
 .../dockerfiles/fedora-win64-cross.docker     |   3 +-
 tests/docker/dockerfiles/fedora.docker        |  67 +-
 tests/docker/dockerfiles/opensuse-leap.docker |  77 ++-
 tests/docker/dockerfiles/ubuntu.docker        |   4 +-
 tests/docker/dockerfiles/ubuntu1804.docker    |  70 +-
 tests/docker/dockerfiles/ubuntu2004.docker    |  64 +-
 tests/docker/run                              |   3 -
 tests/docker/test-clang                       |   2 +-
 tests/docker/test-debug                       |   2 +-
 tests/docker/test-mingw                       |   3 +-
 tests/docker/test-misc                        |   2 +-
 tests/docker/test-tsan                        |   2 +-
 tests/tcg/hexagon/Makefile.target             |   9 -
 tests/tcg/multiarch/Makefile.target           |   2 +
 tests/vm/netbsd                               |   4 +-
 tests/vm/openbsd                              |   4 +-
 56 files changed, 2213 insertions(+), 375 deletions(-)
 create mode 100644 docs/devel/ci.rst
 create mode 100644 .gitlab-ci.d/cirrus/README.rst
 create mode 100644 contrib/plugins/cache.c
 create mode 100644 contrib/plugins/execlog.c
 create mode 100644 .gitlab-ci.d/cirrus.yml
 create mode 100644 .gitlab-ci.d/cirrus/build.yml
 create mode 100644 .gitlab-ci.d/cirrus/freebsd-12.vars
 create mode 100644 .gitlab-ci.d/cirrus/freebsd-13.vars
 create mode 100644 .gitlab-ci.d/cirrus/macos-11.vars
 create mode 100644 .gitlab-ci.d/custom-runners.yml
 create mode 100644 scripts/ci/setup/.gitignore
 create mode 100644 scripts/ci/setup/build-environment.yml
 create mode 100644 scripts/ci/setup/gitlab-runner.yml
 create mode 100644 scripts/ci/setup/inventory.template
 create mode 100644 scripts/ci/setup/vars.yml.template

-- 
2.20.1


