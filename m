Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E23D4853EC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 14:58:34 +0100 (CET)
Received: from localhost ([::1]:53918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n56oC-00080c-5v
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 08:58:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gN-00088Q-8o
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:27 -0500
Received: from [2a00:1450:4864:20::52c] (port=35468
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gA-0004As-Fm
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:18 -0500
Received: by mail-ed1-x52c.google.com with SMTP id y22so162349785edq.2
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 05:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QxJR8i+ouV/l60+JB6pAgt5r2VkA5dVxnEF/OR+aLjg=;
 b=CKiJKCp1lHf0YJnhWtFqspwY8+WT9PlVrjl8logpqTFg5IGZmELuGq5E4AGClnzTgw
 jnEgmtCKgKNFOdHh0ZceF/Iswr73D6ggATHiZwHcRwH/S8vtapVIh+up5Gtv3l5voYhW
 EVcMpp7eMNvdeII+PdEOmuizOVzaUINQSEkj6+KZv9CXtrtYoGBMhRskUv085c35dZGz
 SIbezVkJs1qVKsBhs+dlXrmNgTDDucoDLrAWZFlLeQsZNNZEUMFk+6Fa6C6Z8BA+m4Ue
 6RlSZ41Usvo6s2EyDO/XPCBcFuMwLwMFvTrKXkTtTJiH/mD+AVpqEanmFGIg6ZNB69nz
 h/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QxJR8i+ouV/l60+JB6pAgt5r2VkA5dVxnEF/OR+aLjg=;
 b=A9bfgJnAGBB/kLZ2qtYHIz2zshUKOpjdJQjUMXz7xu0MjU1DWfXpzxAXObaJ3hPE4W
 ZEZgpTAK5+B+s0d8SEy2T/biohD8Ibm6sXWsiAUA//GQOdkm4vjFHn9wVH+/rvoDdcpP
 SPEEtUJNouOyhJKOVrAQsjNSG+yFe5AyCl1iESbR+FTWNmTVuC4A6mmEfUhQ5iP4Ss+E
 Mu1TsJ7OZ21OYlk34oGPGFJpkTdMPs4zm7NFX2TXF9+YrDEGXuGTvgrTBPtxJmKO8KCY
 QpXMNJFd8lwqgrW12dLz9kvaaNk7mOnZCJfppB/9vWiQc2b4twr2wHks803lmK3sip1M
 V3jA==
X-Gm-Message-State: AOAM531YF+KsuWZnEHIhkw2KYvc/Tvx+P+mHSlCqhsS5f1Vt0pTtQoMR
 Sb2F4shxSQuJ8pCE5wRVxd6K1g==
X-Google-Smtp-Source: ABdhPJxoRPUBYCdDyMAvhXK4E7KeeSH2eM+TJvWRGfaPLKfyOA5cAyF6rgu4PMDYA/iNzPCimZoCKw==
X-Received: by 2002:a17:907:97c7:: with SMTP id
 js7mr41643109ejc.84.1641390611889; 
 Wed, 05 Jan 2022 05:50:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k21sm15717745edo.87.2022.01.05.05.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 05:50:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2358B1FFB7;
 Wed,  5 Jan 2022 13:50:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 00/34] testing/next and other misc fixes
Date: Wed,  5 Jan 2022 13:49:35 +0000
Message-Id: <20220105135009.1584676-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Happy New Year QEMU developers. To get our new year off to a quick
start here are a bunch of testing and testing adjacent updates. There
are some miscellaneous updates touching linux-user, ARM virt, and
various other minor code tweaks and cleanups. If maintainers want to
take via their own trees then please grab them otherwise I'm happy to
include them in my next pull request.

Everything is pretty well reviewed except:

 - tests/avocado: add :avocado: tags for some tests
 - linux-user/elfload: add extra logging for hole finding
 - hw/arm: add control knob to disable kaslr_seed via DTB (2 acks, 1 sobs)

Alex Bennée (7):
  hw/arm: add control knob to disable kaslr_seed via DTB
  monitor: move x-query-profile into accel/tcg to fix build
  docs/devel: update C standard to C11
  docs/devel: more documentation on the use of suffixes
  linux-user/elfload: add extra logging for hole finding
  linux-user: don't adjust base of found hole
  tests/avocado: add :avocado: tags for some tests

Brad Smith (1):
  FreeBSD: Upgrade to 12.3 release

Daniel P. Berrangé (17):
  ui: avoid compiler warnings from unused clipboard info variable
  meson: require liburing >= 0.3
  ui: avoid warnings about directdb on Alpine / musl libc
  ci: explicitly skip I/O tests on alpine
  tests/docker: switch fedora image to release 35
  tests: integrate lcitool for generating build env manifests
  tests/docker: auto-generate centos8.docker with lcitool
  tests/docker: auto-generate fedora.docker with lcitool
  tests/docker: auto-generate ubuntu1804.docker with lcitool
  tests/docker: auto-generate ubuntu2004.docker with lcitool
  tests/docker: auto-generate opensuse-leap.docker with lcitool
  tests/docker: remove ubuntu.docker container
  .gitlab-ci.d/cirrus: auto-generate variables with lcitool
  tests/docker: updates to alpine package list
  tests/docker: fix sorting of alpine image package lists
  tests/docker: fully expand the alpine package list
  tests/docker: auto-generate alpine.docker with lcitool

John Snow (1):
  spice: Update QXLInterface for spice >= 0.15.0

Marc-André Lureau (1):
  docs/sphinx: fix compatibility with sphinx < 1.8

Paolo Bonzini (2):
  tests/tcg: use CONFIG_LINUX_USER, not CONFIG_LINUX
  docker: include bison in debian-tricore-cross

Richard Henderson (2):
  tests/tcg/multiarch: Read fp flags before printf
  test/tcg/ppc64le: Add float reference files

Stefan Hajnoczi (1):
  tests/docker: add libfuse3 development headers

Thomas Huth (2):
  gitlab-ci: Enable docs in the centos job
  linux-user: Remove the deprecated ppc64abi32 target

 docs/about/deprecated.rst                     |   7 -
 docs/about/removed-features.rst               |   8 +
 docs/devel/style.rst                          |  14 +-
 docs/devel/testing.rst                        | 104 ++-
 docs/sphinx/fakedbusdoc.py                    |   4 +-
 docs/system/arm/virt.rst                      |   7 +
 docs/user/main.rst                            |   1 -
 configure                                     |  29 +-
 Makefile                                      |   2 +
 configs/targets/ppc64abi32-linux-user.mak     |   8 -
 meson.build                                   |   3 +-
 qapi/machine.json                             |   1 +
 include/glib-compat.h                         |   6 +-
 include/hw/arm/virt.h                         |   1 +
 include/ui/qemu-spice.h                       |   6 +
 include/ui/sdl2.h                             |  11 +
 linux-user/ppc/target_syscall.h               |   4 +-
 linux-user/syscall_defs.h                     |   6 +-
 accel/tcg/cpu-exec.c                          |  31 +
 hw/arm/virt.c                                 |  32 +-
 hw/display/qxl.c                              |  14 +-
 linux-user/elfload.c                          |  27 +-
 linux-user/ppc/signal.c                       |  11 +-
 monitor/qmp-cmds.c                            |  31 -
 tests/tcg/multiarch/float_convs.c             |   2 +-
 tests/tcg/multiarch/float_madds.c             |   2 +-
 ui/clipboard.c                                |   4 +-
 ui/spice-display.c                            |  11 +
 .gitlab-ci.d/buildtest.yml                    |  31 +-
 .gitlab-ci.d/cirrus.yml                       |   5 +-
 .gitlab-ci.d/cirrus/freebsd-12.vars           |  11 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |  11 +-
 .gitlab-ci.d/cirrus/macos-11.vars             |  11 +-
 .gitlab-ci.d/containers.yml                   |   5 -
 .gitmodules                                   |   3 +
 hmp-commands-info.hx                          |   2 +
 tests/avocado/empty_cpu_model.py              |   3 +
 tests/avocado/info_usernet.py                 |   3 +
 tests/avocado/migration.py                    |   1 +
 tests/avocado/version.py                      |   1 +
 tests/avocado/vnc.py                          |   1 +
 tests/docker/dockerfiles/alpine.docker        | 176 ++--
 tests/docker/dockerfiles/centos8.docker       | 244 +++---
 .../dockerfiles/debian-ppc64el-cross.docker   |   2 +-
 .../dockerfiles/debian-tricore-cross.docker   |   1 +
 tests/docker/dockerfiles/fedora.docker        | 263 +++---
 tests/docker/dockerfiles/opensuse-leap.docker | 246 +++---
 tests/docker/dockerfiles/ubuntu.docker        |  71 --
 tests/docker/dockerfiles/ubuntu1804.docker    | 255 +++---
 tests/docker/dockerfiles/ubuntu2004.docker    | 258 +++---
 tests/lcitool/Makefile.include                |  17 +
 tests/lcitool/libvirt-ci                      |   1 +
 tests/lcitool/projects/qemu.yml               | 116 +++
 tests/lcitool/refresh                         |  96 +++
 tests/tcg/configure.sh                        |  10 +-
 tests/tcg/hexagon/float_convs.ref             | 152 ++--
 tests/tcg/hexagon/float_madds.ref             |  48 +-
 tests/tcg/multiarch/Makefile.target           |   2 +-
 tests/tcg/ppc64le/float_convs.ref             | 748 +++++++++++++++++
 tests/tcg/ppc64le/float_madds.ref             | 768 ++++++++++++++++++
 tests/tcg/x86_64/Makefile.target              |   2 +-
 tests/vm/freebsd                              |   8 +-
 62 files changed, 2993 insertions(+), 966 deletions(-)
 delete mode 100644 configs/targets/ppc64abi32-linux-user.mak
 delete mode 100644 tests/docker/dockerfiles/ubuntu.docker
 create mode 100644 tests/lcitool/Makefile.include
 create mode 160000 tests/lcitool/libvirt-ci
 create mode 100644 tests/lcitool/projects/qemu.yml
 create mode 100755 tests/lcitool/refresh
 create mode 100644 tests/tcg/ppc64le/float_convs.ref
 create mode 100644 tests/tcg/ppc64le/float_madds.ref

-- 
2.30.2


