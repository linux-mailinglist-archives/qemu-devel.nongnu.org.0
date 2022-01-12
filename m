Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB9B48C33C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:34:54 +0100 (CET)
Received: from localhost ([::1]:45296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7bu1-0002x4-Sm
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:34:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bmt-0002c5-9O
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:31 -0500
Received: from [2607:f8b0:4864:20::92b] (port=35574
 helo=mail-ua1-x92b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bmr-0003NL-2v
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:30 -0500
Received: by mail-ua1-x92b.google.com with SMTP id m90so4136926uam.2
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/+VrM7ScrhB7FfhkzHZvkTZp0+6OwvH00dQIctPZb30=;
 b=HUzAqMZCFFPAqvYiFWW/H4+3Bld0YabhUv7skt0AgRIoVNJEguHmmXaaQbvs2JodKL
 giY13HffDaNtKSFMEFBNFDud/O/p5eyqr4dazucgffz/aVg+0YP/KMe7Hv932JlCtgrn
 w3dds6xKvUpkDDLdl6Kw6ig5+qROMM7tqR0C12PUiWQgf0mQeiUFbgdns0c790PQGNeu
 MIPkoqLkSV+cht4Jq9FQeNFxwqUivZ6V2LLNNJZNHbATxXizFHH51kZTXacB70wRn0oP
 GqJdl44xNIpgmHkNRAInKVtnWqh6pLcl3QBhdL1a3mp944YmMeqorcncGVxE1jlq2FVb
 QZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/+VrM7ScrhB7FfhkzHZvkTZp0+6OwvH00dQIctPZb30=;
 b=3ljE8CjoceczjfVyo8tt4CgnIrjRLTEzXn0pHV49Zs90gCY+3m6y/0CXravVGO/gwU
 IzchgNZzKC4KibsuCnDk2MXslHwcobyyvkaSPCvnLtQ1RYG/8/AtsYiSiMwJ4jJ63Hwh
 L0pePm2ZlIwv3+5cpeEhEKZ9OuLehGsNNGcW36KJMGelOLnOrIUgw7cIw3ES7KlFdATY
 shJXDt2tjI7t/cozQ++GM2psY2SVj/hn1XPepzMeA2Kv0JwWIBkNAJ86kksrBOLIp6SL
 ywTl8so4iqh1zJ/Yu0iaKdd4koVxe0GFIQhJrobX4UUK2rToyjF5MdtDarV1psDAgcJU
 8EYA==
X-Gm-Message-State: AOAM533/JVltFy9TcniIpPVvMqpIH9lJQ2AQWpozYAl+X16QeQiWPs6s
 sEm7lCs6vGsQAYFLK0Zh1aMkcQ==
X-Google-Smtp-Source: ABdhPJzjI1fcNT9DUIRscX/ArDJDnQzzrLe4MI0vH8OIaFStUmRtxcURJRaNDCXhWLDh3GCWnLyVUA==
X-Received: by 2002:a67:f6d9:: with SMTP id v25mr3703796vso.36.1641986845393; 
 Wed, 12 Jan 2022 03:27:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o26sm6054259vsl.9.2022.01.12.03.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5088A1FFB7;
 Wed, 12 Jan 2022 11:27:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 00/31] testing/next and other misc fixes
Date: Wed, 12 Jan 2022 11:26:51 +0000
Message-Id: <20220112112722.3641051-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x92b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit bf99e0ec9a51976868d7a8334620716df15fe7fe:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2022-01-11 10:12:29 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-for-7.0-110122-1

for you to fetch changes up to dbd30b7abee963f4fb08892a7d7f920bb76ece58:

  linux-user: Remove the deprecated ppc64abi32 target (2022-01-11 13:00:53 +0000)

----------------------------------------------------------------
Various testing and other misc updates:

  - fix compiler warnings with ui and sdl
  - update QXL/spice dependancy
  - skip I/O tests on Alpine
  - update fedora image to latest version
  - integrate lcitool and regenerate docker images
  - favour CONFIG_LINUX_USER over CONFIG_LINUX
  - add libfuse3 dependencies to docker images
  - add dtb-kaslr-seed control knob to virt machine
  - fix build breakage from HMP update
  - update docs for C standard and suffix usage
  - add more logging for debugging user hole finding
  - fix bug with linux-user hold calculation
  - avoid affecting flags when printing results in float tests
  - add float reference files for ppc64
  - update FreeBSD to 12.3
  - add bison dependancy to tricore images
  - remove deprecated ppc64abi32 target

----------------------------------------------------------------
Alex Bennée (6):
      hw/arm: add control knob to disable kaslr_seed via DTB
      monitor: move x-query-profile into accel/tcg to fix build
      docs/devel: update C standard to C11
      docs/devel: more documentation on the use of suffixes
      linux-user/elfload: add extra logging for hole finding
      linux-user: don't adjust base of found hole

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

Paolo Bonzini (2):
      tests/tcg: use CONFIG_LINUX_USER, not CONFIG_LINUX
      docker: include bison in debian-tricore-cross

Richard Henderson (2):
      tests/tcg/multiarch: Read fp flags before printf
      test/tcg/ppc64le: Add float reference files

Stefan Hajnoczi (1):
      tests/docker: add libfuse3 development headers

Thomas Huth (1):
      linux-user: Remove the deprecated ppc64abi32 target

 docs/about/deprecated.rst                          |   7 -
 docs/about/removed-features.rst                    |   8 +
 docs/devel/style.rst                               |  14 +-
 docs/devel/testing.rst                             | 104 ++-
 docs/system/arm/virt.rst                           |   8 +
 docs/user/main.rst                                 |   1 -
 configure                                          |  29 +-
 Makefile                                           |   2 +
 configs/targets/ppc64abi32-linux-user.mak          |   8 -
 meson.build                                        |   3 +-
 qapi/machine.json                                  |   1 +
 include/glib-compat.h                              |   6 +-
 include/hw/arm/virt.h                              |   1 +
 include/ui/qemu-spice.h                            |   6 +
 include/ui/sdl2.h                                  |  11 +
 linux-user/ppc/target_syscall.h                    |   4 +-
 linux-user/syscall_defs.h                          |   6 +-
 accel/tcg/cpu-exec.c                               |  31 +
 hw/arm/virt.c                                      |  32 +-
 hw/display/qxl.c                                   |  14 +-
 linux-user/elfload.c                               |  27 +-
 linux-user/ppc/signal.c                            |  11 +-
 monitor/qmp-cmds.c                                 |  31 -
 tests/tcg/multiarch/float_convs.c                  |   2 +-
 tests/tcg/multiarch/float_madds.c                  |   2 +-
 ui/clipboard.c                                     |   4 +-
 ui/spice-display.c                                 |  11 +
 .gitlab-ci.d/buildtest.yml                         |  29 +-
 .gitlab-ci.d/cirrus.yml                            |   5 +-
 .gitlab-ci.d/cirrus/freebsd-12.vars                |  11 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars                |  11 +-
 .gitlab-ci.d/cirrus/macos-11.vars                  |  11 +-
 .gitlab-ci.d/containers.yml                        |   5 -
 .gitmodules                                        |   3 +
 hmp-commands-info.hx                               |   2 +
 tests/docker/dockerfiles/alpine.docker             | 176 +++--
 tests/docker/dockerfiles/centos8.docker            | 244 ++++---
 .../docker/dockerfiles/debian-ppc64el-cross.docker |   2 +-
 .../docker/dockerfiles/debian-tricore-cross.docker |   1 +
 tests/docker/dockerfiles/fedora.docker             | 263 +++----
 tests/docker/dockerfiles/opensuse-leap.docker      | 246 ++++---
 tests/docker/dockerfiles/ubuntu.docker             |  71 --
 tests/docker/dockerfiles/ubuntu1804.docker         | 255 ++++---
 tests/docker/dockerfiles/ubuntu2004.docker         | 258 ++++---
 tests/lcitool/Makefile.include                     |  17 +
 tests/lcitool/libvirt-ci                           |   1 +
 tests/lcitool/projects/qemu.yml                    | 116 ++++
 tests/lcitool/refresh                              |  96 +++
 tests/tcg/configure.sh                             |  10 +-
 tests/tcg/hexagon/float_convs.ref                  | 152 ++--
 tests/tcg/hexagon/float_madds.ref                  |  48 +-
 tests/tcg/multiarch/Makefile.target                |   2 +-
 tests/tcg/ppc64le/float_convs.ref                  | 748 ++++++++++++++++++++
 tests/tcg/ppc64le/float_madds.ref                  | 768 +++++++++++++++++++++
 tests/tcg/x86_64/Makefile.target                   |   2 +-
 tests/vm/freebsd                                   |   8 +-
 56 files changed, 2982 insertions(+), 963 deletions(-)
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


