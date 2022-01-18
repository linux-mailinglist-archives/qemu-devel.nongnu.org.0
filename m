Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F419A492E4E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 20:18:18 +0100 (CET)
Received: from localhost ([::1]:42998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9tzm-0004b7-12
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 14:18:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9tir-0004GD-Q1
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 14:00:51 -0500
Received: from [2a00:1450:4864:20::336] (port=33391
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9tip-0005CS-Pl
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 14:00:49 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 o7-20020a05600c510700b00347e10f66d1so2962743wms.0
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 11:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KGouPXiTiGl0IDMVryQTiFCjbWX0yG5Gd/zkbtInJzs=;
 b=kcC0MDsCXooYkOyGgsvOT7Rp+ZqbOV8IPHG5DP732z4sdQ/6V5HJPVXAWRfFtcIwT1
 xNwnoIAo+kKcn7IP9SnAOh9tzXc9O15Vnzck1+OiUcz6sv90eDmFHfiutAz7OWw5ywCM
 lWeeYni7yqqyTBPACosIt8M83D5k1aZPh77vyGt3EQbt8fKiTj5SN1Z8GAP+251gNysr
 gFGRQddDYYCgRel2oq6pXXphy1gBR3XEa412CYFnqiN1IWm+yJJJuGoiPMOv6XEGiXl+
 +siL1ymz14FPUjAlvt5Tq0WnCtLthbXEUdAIblG/jFlgBS+0E5U6Ky6M/+PpZpWpGZ5j
 fSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KGouPXiTiGl0IDMVryQTiFCjbWX0yG5Gd/zkbtInJzs=;
 b=ZnfAPwmNPJHlW5QgRT8g/gHfZynNaAOI3D7NLHOXJw7Xj7R1MszAVZ8re+hLtOdFtb
 O3ZUZNRpRnhivpZFlESsh2T3CE9zP+4qWkcHgObcrpmGCNH20JYzUiUFfhg7LL398d/D
 qubJE0EEK9IcNYyXc1XRht/B8OMwmjWQT6pkmmXki9vn/Kuv/06nWdc2fDk8vF2AQDNq
 1/g2dC/Eg+zzJ1BgUd/pucFwaCAdfw8uUrdFpWg5LaztkdgwFrOjIfKHlI15xm24z32c
 y7TxfZex7vsjY9IjJNM+57Umx51i5nBgg2/FlYop+HwEPtt2LwrP7F/uQSK2iP3RWyvF
 0ngw==
X-Gm-Message-State: AOAM533gEoTj6Nl7BoOLlCO6UBo7EMtPuoi0a/YxK3cn55D8GW4uO/z+
 jEgQZ1w+plpKVU40xftW4FbktQ==
X-Google-Smtp-Source: ABdhPJwJwHyh03tF/uhhfjly4WKhlLuQ8x1+eNUTOmCw9RflblkV+MQvLpYTBHbv8MwVW05o9E3veA==
X-Received: by 2002:a5d:63d1:: with SMTP id c17mr25323671wrw.522.1642532445809; 
 Tue, 18 Jan 2022 11:00:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m20sm3562724wms.4.2022.01.18.11.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 11:00:44 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6E5041FFB7;
 Tue, 18 Jan 2022 19:00:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 00/31] testing/next and other misc fixes
Date: Tue, 18 Jan 2022 19:00:43 +0000
Message-Id: <20220118190043.1427303-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The following changes since commit 6621441db50d5bae7e34dbd04bf3c57a27a71b32:

  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20220115' into staging (2022-01-16 20:12:23 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-for-7.0-180122-2

for you to fetch changes up to 3265d1fc77eb5da522accb37e50053dfdfda7e8f:

  docker: include bison in debian-tricore-cross (2022-01-18 16:44:16 +0000)

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
  - expand reserve for brk() for static 64 bit programs
  - fix bug with linux-user hole calculation
  - avoid affecting flags when printing results in float tests
  - add float reference files for ppc64
  - update FreeBSD to 12.3
  - add bison dependancy to tricore images

----------------------------------------------------------------
Alex Bennée (7):
      hw/arm: add control knob to disable kaslr_seed via DTB
      monitor: move x-query-profile into accel/tcg to fix build
      docs/devel: update C standard to C11
      docs/devel: more documentation on the use of suffixes
      linux-user: expand reserved brk space for 64bit guests
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

 docs/devel/style.rst                               |  14 +-
 docs/devel/testing.rst                             | 104 ++-
 docs/system/arm/virt.rst                           |   8 +
 Makefile                                           |   2 +
 meson.build                                        |   3 +-
 qapi/machine.json                                  |   1 +
 include/glib-compat.h                              |   6 +-
 include/hw/arm/virt.h                              |   1 +
 include/ui/qemu-spice.h                            |   6 +
 include/ui/sdl2.h                                  |  11 +
 accel/tcg/cpu-exec.c                               |  31 +
 hw/arm/virt.c                                      |  32 +-
 hw/display/qxl.c                                   |  14 +-
 linux-user/elfload.c                               |  35 +-
 monitor/qmp-cmds.c                                 |  31 -
 tests/tcg/multiarch/float_convs.c                  |   2 +-
 tests/tcg/multiarch/float_madds.c                  |   2 +-
 ui/clipboard.c                                     |   4 +-
 ui/spice-display.c                                 |  11 +
 .gitlab-ci.d/buildtest.yml                         |   2 +-
 .gitlab-ci.d/cirrus.yml                            |   5 +-
 .gitlab-ci.d/cirrus/freebsd-12.vars                |  11 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars                |  11 +-
 .gitlab-ci.d/cirrus/macos-11.vars                  |  11 +-
 .gitlab-ci.d/containers.yml                        |   5 -
 .gitmodules                                        |   3 +
 hmp-commands-info.hx                               |   2 +
 tests/docker/dockerfiles/alpine.docker             | 176 +++--
 tests/docker/dockerfiles/centos8.docker            | 244 ++++---
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
 tests/tcg/configure.sh                             |   8 +-
 tests/tcg/hexagon/float_convs.ref                  | 152 ++--
 tests/tcg/hexagon/float_madds.ref                  |  48 +-
 tests/tcg/multiarch/Makefile.target                |   2 +-
 tests/tcg/ppc64le/float_convs.ref                  | 748 ++++++++++++++++++++
 tests/tcg/ppc64le/float_madds.ref                  | 768 +++++++++++++++++++++
 tests/tcg/x86_64/Makefile.target                   |   2 +-
 tests/vm/freebsd                                   |   8 +-
 47 files changed, 2970 insertions(+), 878 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/ubuntu.docker
 create mode 100644 tests/lcitool/Makefile.include
 create mode 160000 tests/lcitool/libvirt-ci
 create mode 100644 tests/lcitool/projects/qemu.yml
 create mode 100755 tests/lcitool/refresh
 create mode 100644 tests/tcg/ppc64le/float_convs.ref
 create mode 100644 tests/tcg/ppc64le/float_madds.ref

-- 
2.30.2


