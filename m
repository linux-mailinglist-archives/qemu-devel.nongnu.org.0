Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2063C19C5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:25:27 +0200 (CEST)
Received: from localhost ([::1]:38404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZeI-0007Zo-Rl
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPA-0003Hn-TA
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:09:48 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:54131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZP8-0004kC-Hh
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:09:48 -0400
Received: by mail-wm1-x333.google.com with SMTP id w13so4771337wmc.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cvn/kvpkYYF9E/a/BPB1h5/ewJa8Swv4Kk76IZ+bbyg=;
 b=r+nPrIvMlBAN64Ll8sIpljSnE3RWHmWSOx5Ci3ZMO1/lrWHPdPsXKw+9sV6bSCUqzG
 Lpluwxb9MpgdqzzGxKWubIhCRcMzXR8C4T26AMnHpBAyZBD3A0uRpM31/kQ/lSx4qbsu
 38UugbQnBGZxT5FYATAFx+CFnToq35cO91UCMD42RWe5vRZd/I7KAIPiMMbxodalHQdx
 nTzGyzkni+27p25xYvHvDnaMBqPPvBRcBKxbMvoQFViGmsaJpUFlxYTasYC4dh3TTrOL
 ekXae+RIbbKWMbCVHzim9C3EQFZyA/m/VFhx6bM+4/d802abm7Led/zJ8Ec2JjkQJqcd
 pfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cvn/kvpkYYF9E/a/BPB1h5/ewJa8Swv4Kk76IZ+bbyg=;
 b=pDY0rPvN8t0/6SrKAyUotEBb/vS6T9bKUIrEHJTPIMHKGKeNn5nB5uwSNZjEsalRWA
 KgHlAHUqqGhkGQubOORLFokNxxjqjANIR47fsR7gbS/lfNiqf+vJF0smZ9HAvtcyHfW6
 SmhcepTqu4cCAFuRwGWaags5/adxzO1IGUnafeb1qrZDj9ypZF/mqe4lxk2XzgEoOzsL
 nA7Z5hbR0k1ZNAhlGG0A/RorbnGjeGU3ol84qJyp9THoqr1qZpEFXMFsAnvDWLABPeom
 kgJ08h0iQ1m1VjfsEc0puBZNIpr4UqTq8oxxO1jpca3tks9MOaNUtxbjIt1+Zx58vwG5
 tPSA==
X-Gm-Message-State: AOAM5335CXwpADCcUQoPQGtKtEwU+MTzSBXIONDoNIRTH8m9D510DC51
 gesKIzrDDYwMl421o07C4HakHw==
X-Google-Smtp-Source: ABdhPJxum7xzrR1Fc20bvouMJc6D9OCFMmOH4WTSPB7HKgDMZDfSTO21HNlNK3p52A3C9PhRPIL0YQ==
X-Received: by 2002:a05:600c:3b0b:: with SMTP id
 m11mr6983761wms.25.1625771383763; 
 Thu, 08 Jul 2021 12:09:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a22sm3186743wrc.66.2021.07.08.12.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:09:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D42DB1FF7E;
 Thu,  8 Jul 2021 20:09:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 for 6.1 00/39] testing and plugins pre-PR series
Date: Thu,  8 Jul 2021 20:09:02 +0100
Message-Id: <20210708190941.16980-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

As the v1 got a few comments about the position of checks to prevent
non-supported versions of tcg with plugins I decided to post a v2.
I'll generate the PR from this one instead.

  - fix title of MAINTAINERS post
  - change order of checks in configure
  - also disable signals test for plugin variants
  
The following are still un-reviewed:

 - configure: stop user enabling plugins on Windows for now
 - configure: don't allow plugins to be enabled for a non-TCG build
 - meson.build: move TCG plugin summary output
 - plugins: fix-up handling of internal hostaddr for 32 bit
 - tests/tcg: make test-mmap a little less aggressive
 - tests/tcg: also disable the signals test for plugins

Alex Bennée (8):
  tests/tcg: also disable the signals test for plugins
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
  MAINTAINERS: Added myself as a reviewer for TCG Plugins

 docs/ccid.txt                                 |  15 +-
 docs/devel/ci.rst                             | 127 ++++
 docs/devel/index.rst                          |   1 +
 docs/devel/tcg-plugins.rst                    |  86 ++-
 .gitlab-ci.d/cirrus/README.rst                |  54 ++
 configure                                     | 138 ++--
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
 tests/tcg/multiarch/Makefile.target           |   2 +
 tests/vm/netbsd                               |   4 +-
 tests/vm/openbsd                              |   4 +-
 55 files changed, 2111 insertions(+), 263 deletions(-)
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


