Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EAD3C6546
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 23:07:55 +0200 (CEST)
Received: from localhost ([::1]:36640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m339d-00074M-JJ
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 17:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m337o-0005wr-Nl
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:06:00 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m337m-0004Jk-Ee
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:06:00 -0400
Received: by mail-wr1-x432.google.com with SMTP id g16so17586897wrw.5
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 14:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jmR6qvXsjv146Udn9zBwMCdzaSgA4ZEohGBLRdU9LIg=;
 b=GOG6o0+1Q5ci8xmgL1ar5Gye0IRLIRXtVTL+7XkbX8WzId6dQYt5MUujA87IIQkpw6
 zTmDOJem486im2kzohHrhXaxdfoU71aM00u4zhZW1ItFCM0aGmFIQAkzRc5rYm6QIeu7
 r2GYmcgfgTvBtOMwy/n/6lamkw4TWyvtR9aeRowQ9HdGsm4Y4/GxoasBtxrlAr/W0GJK
 IdpsRDM8XqkVCJff3u0weXOTVe8eGs0Et7BsgKhHhebFROv3LyR3s60BCxCov++SkmR5
 x3ibX59vQRHhx5WpFrVUN7KALB6toerZuDXHJivr4p70lSWOi/yDCUtJDoOJDdRpc/aj
 D52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jmR6qvXsjv146Udn9zBwMCdzaSgA4ZEohGBLRdU9LIg=;
 b=PLKdHlA3xN4TKeQoXKJ/G101hCeuY2KwiIfOeuln4nykNoVEnWl7/Kjhk4d5axUS97
 stSWu+IUrUOURDtzs6gFABVq5J20p4wZMAfdxIVKBORxq5gJzsR48SbhMLZ4lm5GlzzH
 NfLtvjRckfOPJJx8CF6hkkXFqTChwvcmVhc13hq7SsYM3lWyspjT6O5BuNjEqhKWMVMk
 CLlh9N9V7zzBkL7K8N65bUPU8lSUSLHlXMdlmFDXQBUMk/VxfYkgRUmP0VKhTMyDipVD
 T3ZF6MH3wteFFRVnISfAmqjaCoMTdfIhSIb4HhxfA/PhiXH26r7u9Fx2cNBKOYupStuu
 XsDA==
X-Gm-Message-State: AOAM532z8/d++dXa9fFicjgSYB1CWeL523+vjcU0N9npOdOss+ijH0p7
 ee8Tp4FlP3o0E4PydfkNIHvdqw==
X-Google-Smtp-Source: ABdhPJwbfy7Ihn4RJx+CRNV8ut40+3TMdawxYPVb1jj6Jiv3tjdoMWNxDY8Ga0rKHio00u8M2B75SQ==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr1147653wru.387.1626123956262; 
 Mon, 12 Jul 2021 14:05:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v9sm3473018wml.36.2021.07.12.14.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 14:05:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9F5C81FF7E;
 Mon, 12 Jul 2021 22:05:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v4 00/42] testing, build and plugin updates
Date: Mon, 12 Jul 2021 22:05:54 +0100
Message-Id: <20210712210554.1951-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit bd38ae26cea0d1d6a97f930248df149204c210a2:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210710' into staging (2021-07-12 11:02:39 +0100)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-and-plugins-120721-4

for you to fetch changes up to 312ad3f702789db630c8e43aaad718a1459b2018:

  MAINTAINERS: Added myself as a reviewer for TCG Plugins (2021-07-12 20:13:24 +0100)

----------------------------------------------------------------
Testing and plugin updates:

  - custom runner playbooks for configuring GitLab runners
  - integrate Cirrus jobs into GitLab via cirrus-run
  - clean-up docker package lists
  - bump NetBSD to 9.2
  - bump OpenBSD to 6.9
  - make test-mmap more hexagon friendly
  - fixup handling of hostaddr for plugins
  - disallow some incompatible plugin configurations
  - enable plugins by default for most TCG builds
  - honour main build -Wall settings for plugins
  - new execlog plugin
  - new cache modelling plugin
  - fix io_uring build regression
  - disable modular TCG on Darwin

----------------------------------------------------------------
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
      contrib/plugins: add execlog to log instruction execution and memory access
      docs/devel: tcg-plugins: add execlog plugin description

Brad Smith (2):
      tests/vm: update NetBSD to 9.2
      tests/vm: update openbsd to release 6.9

Cleber Rosa (4):
      Jobs based on custom runners: documentation and configuration placeholder
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

Paolo Bonzini (2):
      meson: fix condition for io_uring stubs
      disable modular TCG on Darwin

 docs/ccid.txt                                      |  15 +-
 docs/devel/ci.rst                                  | 127 ++++
 docs/devel/index.rst                               |   1 +
 docs/devel/tcg-plugins.rst                         |  86 ++-
 .gitlab-ci.d/cirrus/README.rst                     |  54 ++
 configure                                          | 142 +++--
 meson.build                                        |  21 +-
 include/qemu/plugin-memory.h                       |   2 +-
 accel/tcg/cputlb.c                                 |   2 +-
 contrib/plugins/cache.c                            | 641 +++++++++++++++++++++
 contrib/plugins/execlog.c                          | 153 +++++
 plugins/api.c                                      |   4 +-
 tests/tcg/multiarch/test-mmap.c                    | 208 +++----
 .cirrus.yml                                        |  55 --
 .gitlab-ci.d/buildtest.yml                         |  23 -
 .gitlab-ci.d/cirrus.yml                            | 102 ++++
 .gitlab-ci.d/cirrus/build.yml                      |  35 ++
 .gitlab-ci.d/cirrus/freebsd-12.vars                |  13 +
 .gitlab-ci.d/cirrus/freebsd-13.vars                |  13 +
 .gitlab-ci.d/cirrus/macos-11.vars                  |  15 +
 .gitlab-ci.d/custom-runners.yml                    | 222 +++++++
 .gitlab-ci.d/qemu-project.yml                      |   2 +
 .travis.yml                                        |  12 +-
 MAINTAINERS                                        |   2 +
 contrib/plugins/Makefile                           |   4 +-
 scripts/ci/setup/.gitignore                        |   2 +
 scripts/ci/setup/build-environment.yml             | 116 ++++
 scripts/ci/setup/gitlab-runner.yml                 |  71 +++
 scripts/ci/setup/inventory.template                |   1 +
 scripts/ci/setup/vars.yml.template                 |  12 +
 scripts/coverity-scan/coverity-scan.docker         |   1 -
 stubs/meson.build                                  |   4 +-
 tests/docker/common.rc                             |  19 +-
 tests/docker/docker.py                             |   4 +-
 tests/docker/dockerfiles/centos8.docker            |  82 ++-
 .../docker/dockerfiles/debian-xtensa-cross.docker  |   2 +-
 tests/docker/dockerfiles/debian10.docker           |   4 +-
 tests/docker/dockerfiles/debian11.docker           |   2 +-
 tests/docker/dockerfiles/fedora-cris-cross.docker  |   2 +-
 tests/docker/dockerfiles/fedora-i386-cross.docker  |   2 +-
 tests/docker/dockerfiles/fedora-win32-cross.docker |   3 +-
 tests/docker/dockerfiles/fedora-win64-cross.docker |   3 +-
 tests/docker/dockerfiles/fedora.docker             |  67 +--
 tests/docker/dockerfiles/opensuse-leap.docker      |  77 ++-
 tests/docker/dockerfiles/ubuntu.docker             |   4 +-
 tests/docker/dockerfiles/ubuntu1804.docker         |  70 ++-
 tests/docker/dockerfiles/ubuntu2004.docker         |  64 +-
 tests/docker/run                                   |   3 -
 tests/docker/test-clang                            |   2 +-
 tests/docker/test-debug                            |   2 +-
 tests/docker/test-mingw                            |   3 +-
 tests/docker/test-misc                             |   2 +-
 tests/docker/test-tsan                             |   2 +-
 tests/tcg/hexagon/Makefile.target                  |   9 -
 tests/tcg/i386/Makefile.target                     |   3 +
 tests/tcg/multiarch/Makefile.target                |   2 +
 tests/vm/netbsd                                    |   4 +-
 tests/vm/openbsd                                   |   4 +-
 58 files changed, 2225 insertions(+), 377 deletions(-)
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


