Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032F43BD94E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:01:33 +0200 (CEST)
Received: from localhost ([::1]:52706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mZn-0007UO-IO
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mWl-0004aM-T5
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:58:23 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mWi-00020T-TR
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:58:23 -0400
Received: by mail-wm1-x32e.google.com with SMTP id w13so13785996wmc.3
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ni5fMMU1FwHvHJdvnCcKrftj3a4XJ9IwsyKxkk/HrRc=;
 b=Jkyr4tbujoyIVbvvWrDsts7fd8ryT1Mc60tSNBdzJaWwUxlSDNciGtakh/21m67aoQ
 QmnncoxsddsTfw1aSNo4Dp8jeHBw8DRKqLx8tGrzLOcNBrNerU+HDcA/0tWFavbuimWd
 29k5ovjJ1YnylOpU48lmyDttzKnzYkkhixOyqhAQ8sd1hcj5fBIxiz2BwJ0UpdAl+Wvf
 vYktGR4mMetftQeA64xaQEpQUfur5aYor65jDlJ32m7v12vBd/RGci8cwT4f3C09TkGo
 7RcR5KHeFpM3fwU4WlPRF5T5+H3L54qlBkjySrLZ47/VNrzk9M3js7Zx9WytKT8PEZoK
 PDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ni5fMMU1FwHvHJdvnCcKrftj3a4XJ9IwsyKxkk/HrRc=;
 b=FvkxhEbxIZmjccZ0IpHekUx8yQ1KxIi7Kmz+8ZZ6It/jhrxIsCAIeKEIM9/3D9em+Z
 /xt4J9y6CGdI37SehIuQWAT5k9sdTFtQ6umd716GRzvYSgG8+D9JSDqCLguMSK6f9XAe
 CxcPMGVNkeObt6zizRsLbck/w/ROFPbyIJznCEGJLhDXaHvOBvXoWCucGhdIRHK4G3Dy
 bndsMB6MU5rbOcCSyhAlJejbIuc+GqZDFGMrVBbz15Cw0hsSUlbKB4Of559Gy9zLFh//
 H69we89R8oGEi8BFEwnNdpL1v6FZjZqUg2p0gGtD6yw8tzHBWgSjZST54goy4nkNVZ2m
 AoVA==
X-Gm-Message-State: AOAM531zTX/Egw61DPx3MihHQSpiWJg7DeSaVy7U2X9NKYjIO5RMpPhK
 mQ2Gd+c9Wp8ULXdnvRsGB40vnA==
X-Google-Smtp-Source: ABdhPJyWzAPh2L4/aHJTRaomc6VYnYrZ59TsmizzbNbOC0lfZEGFXA4cFXAwRc2WXsPRN1rg+lzwYg==
X-Received: by 2002:a1c:25c6:: with SMTP id l189mr1295582wml.49.1625583499305; 
 Tue, 06 Jul 2021 07:58:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u2sm10659499wmc.42.2021.07.06.07.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 07:58:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B49B61FF7E;
 Tue,  6 Jul 2021 15:58:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 00/39] final pre-PR for 6.1 (testing and plugins)
Date: Tue,  6 Jul 2021 15:57:38 +0100
Message-Id: <20210706145817.24109-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is a roll-up of a number of testing series:

  - Cleber's ansible playbooks for installing runners
  - Daniel's Cirrus cleanups
  - Most of Daniels' docker clean-ups (but without lcitool)
  - Disable signals test for all arches

I've also included the latest submissions for TCG plugins. One big
change however is we now enable TCG plugins by default for TCG builds.
When no plugins are selected on the command line the performance hit
is so low I couldn't really measure it. I've dropped the previous tags
though as I needed to re-factor the configure a bit to handle some
additional corner cases.

The following still need some review:

 - contrib/plugins: enable -Wall for building plugins
 - tcg/plugins: enable by default for TCG builds
 - configure: stop user enabling plugins on Windows for now
 - configure: don't allow plugins to be enabled for a non-TCG build
 - meson.build: move TCG plugin summary output
 - plugins: fix-up handling of internal hostaddr for 32 bit
 - tests/tcg: make test-mmap a little less aggressive
 - tests/tcg: generalise the disabling of the signals test

Alex Bennée (8):
  tests/tcg: generalise the disabling of the signals test
  tests/tcg: make test-mmap a little less aggressive
  plugins: fix-up handling of internal hostaddr for 32 bit
  meson.build: move TCG plugin summary output
  configure: don't allow plugins to be enabled for a non-TCG build
  configure: stop user enabling plugins on Windows for now
  tcg/plugins: enable by default for TCG builds
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
  MAINTAINTERS: Added myself as a reviewer for TCG Plugins

 docs/ccid.txt                                 |  15 +-
 docs/devel/ci.rst                             | 127 ++++
 docs/devel/index.rst                          |   1 +
 docs/devel/tcg-plugins.rst                    |  86 ++-
 .gitlab-ci.d/cirrus/README.rst                |  54 ++
 configure                                     | 137 ++--
 meson.build                                   |  15 +-
 include/qemu/plugin-memory.h                  |   2 +-
 accel/tcg/cputlb.c                            |   2 +-
 contrib/plugins/cache.c                       | 641 ++++++++++++++++++
 contrib/plugins/execlog.c                     | 153 +++++
 plugins/api.c                                 |   4 +-
 tests/tcg/multiarch/test-mmap.c               |   6 +-
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
 tests/tcg/hppa/Makefile.target                |   3 -
 tests/tcg/multiarch/Makefile.target           |   6 +
 tests/tcg/s390x/Makefile.target               |   3 -
 tests/vm/netbsd                               |   4 +-
 tests/vm/openbsd                              |   4 +-
 57 files changed, 2114 insertions(+), 269 deletions(-)
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


