Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01690331048
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:02:06 +0100 (CET)
Received: from localhost ([::1]:41090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGST-0002qC-0b
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGHw-0006LI-Os
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:12 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGHu-00018A-CG
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:12 -0500
Received: by mail-wr1-x435.google.com with SMTP id u14so11550515wri.3
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E3vzMoXsUhUKsMOxBiDzNMCWgqjSmqvyCFVtOZ5uKMI=;
 b=xkyeuvZSHfNqqmmOB0B+4Vr9ZpbwG5XtW+Lj9GljB2PuF0MdhHNViOjr0YPAzxMev7
 Pkxs4MjHzapZ3dGxc1v0MwBB5FeXof1DxMYCgZ5cA0QLIDyI6osKy6hz7sK01tAvpgu2
 os6gvb3Acq6H9407SY+q1mKWOhuiMmIxtn+ZwdM9wt6ug/7um4RFBmEc7QjJo+O/HlNW
 8IdTgfA7ELO9C3x5FBKEvEXol7z/R9RMyhx2glHdIgM7P91MGqaIIhnTLI2avr5DSgOW
 3uoNQ77EFtZBOtBXVBzi0dpZODPW0upH9ammuVb4uDI/dT/LeE86nsOfFcwtSowDixN/
 0yCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E3vzMoXsUhUKsMOxBiDzNMCWgqjSmqvyCFVtOZ5uKMI=;
 b=LTgghypx3uJCTQFzgCHVXnT6Oh+O4p1Ds/eMMI7T97wVuD3GMbigv6d4zVCT7tqwB8
 WXJiMHh7H0gJMOI3uruEvQCb2lPH+QdwDJC3XfaJXJGNjrjyPGhd/YnFNVs/FIgZGf8t
 8CwevFBW41LHBIHnUJSEn8MDKKD0nYIZyZTi02HTaOc3vzasuZnchklox7XmJneIdxpr
 puA2llBm2gG2Kax7I8wf47W7s/m+z1CWcWtJw0fdzzjCufW1McJqdNhvadnnKNVXb+cG
 UButjNx61quXl2/kcRTxm7b+CREtnLOwUBy67Jzy8Rr2x1OIWjrU2b0/CI5NyTqtvjow
 w4Kw==
X-Gm-Message-State: AOAM533+hm+cY55SJZHE+YX5+J3keo4TWoFfTYPTUO2AY1yftZqZj+zI
 uCMqs2jAs1h6HXJIZe3YaFq4hA==
X-Google-Smtp-Source: ABdhPJwpCuksILp5/vOPWISdJzyHew3SgIyJSQMY+hLjkOV3rr2YSgnay9hT7v8zv5KesScNqZ0nXw==
X-Received: by 2002:adf:ed06:: with SMTP id a6mr22430024wro.208.1615211466471; 
 Mon, 08 Mar 2021 05:51:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b65sm19067523wmh.4.2021.03.08.05.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:51:05 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BF4BE1FF7E;
 Mon,  8 Mar 2021 13:51:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 00/18] testing, docs, semihosting move and guest-loader
Date: Mon,  8 Mar 2021 13:50:46 +0000
Message-Id: <20210308135104.24903-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

The following changes since commit 91e92cad67caca3bc4b8e920ddb5c8ca64aac9e1:

  Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210305' into staging (2021-03-05 19:04:47 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-docs-xen-updates-080321-1

for you to fetch changes up to 8109b8cadf5979a29b4b6e1ca7288bc0ee676426:

  semihosting: Move hw/semihosting/ -> semihosting/ (2021-03-08 12:15:05 +0000)

----------------------------------------------------------------
Testing, guest-loader and other misc tweaks

  - add warning text to quickstart example
  - add support for hexagon check-tcg tests
  - add CFI tests to CI
  - use --arch-only for docker pre-requisites
  - fix .editorconfig for emacs
  - add guest-loader for Xen-like hypervisor testing
  - move generic-loader docs into manual proper
  - move semihosting out of hw/

----------------------------------------------------------------
Alessandro Di Federico (2):
      docker: Add Hexagon image
      tests/tcg: Use Hexagon Docker image

Alex Bennée (11):
      docs/system: add a gentle prompt for the complexity to come
      tests/docker: add a test-tcg for building then running check-tcg
      gitlab: add build-user-hexagon test
      .editorconfig: update the automatic mode setting for Emacs
      hw/board: promote fdt from ARM VirtMachineState to MachineState
      hw/riscv: migrate fdt field to generic MachineState
      device_tree: add qemu_fdt_setprop_string_array helper
      hw/core: implement a guest-loader to support static hypervisor guests
      docs: move generic-loader documentation into the main manual
      docs: add some documentation for the guest-loader
      tests/avocado: add boot_xen tests

Daniele Buono (2):
      gitlab-ci.yml: Allow custom # of parallel linkers
      gitlab-ci.yml: Add jobs to test CFI flags

Philippe Mathieu-Daudé (3):
      tests/docker: Use --arch-only when building Debian cross image
      semihosting: Move include/hw/semihosting/ -> include/semihosting/
      semihosting: Move hw/semihosting/ -> semihosting/

 docs/generic-loader.txt                            |  92 ------
 docs/system/generic-loader.rst                     | 117 +++++++
 docs/system/guest-loader.rst                       |  54 ++++
 docs/system/index.rst                              |   2 +
 docs/system/quickstart.rst                         |   8 +
 docs/system/targets.rst                            |   2 +
 meson.build                                        |   1 +
 hw/core/guest-loader.h                             |  34 ++
 include/hw/arm/virt.h                              |   1 -
 include/hw/boards.h                                |   1 +
 include/hw/riscv/virt.h                            |   1 -
 include/{hw => }/semihosting/console.h             |   0
 include/{hw => }/semihosting/semihost.h            |   0
 include/sysemu/device_tree.h                       |  17 +
 {hw/semihosting => semihosting}/common-semi.h      |   0
 gdbstub.c                                          |   2 +-
 hw/arm/virt.c                                      | 356 +++++++++++----------
 hw/core/guest-loader.c                             | 145 +++++++++
 hw/mips/malta.c                                    |   2 +-
 hw/riscv/virt.c                                    |  20 +-
 linux-user/aarch64/cpu_loop.c                      |   2 +-
 linux-user/arm/cpu_loop.c                          |   2 +-
 linux-user/riscv/cpu_loop.c                        |   2 +-
 linux-user/semihost.c                              |   2 +-
 {hw/semihosting => semihosting}/arm-compat-semi.c  |   6 +-
 {hw/semihosting => semihosting}/config.c           |   2 +-
 {hw/semihosting => semihosting}/console.c          |   4 +-
 softmmu/device_tree.c                              |  26 ++
 softmmu/vl.c                                       |   2 +-
 stubs/semihost.c                                   |   2 +-
 target/arm/helper.c                                |   4 +-
 target/arm/m_helper.c                              |   4 +-
 target/arm/translate-a64.c                         |   2 +-
 target/arm/translate.c                             |   2 +-
 target/lm32/helper.c                               |   2 +-
 target/m68k/op_helper.c                            |   2 +-
 target/mips/cpu.c                                  |   2 +-
 target/mips/mips-semi.c                            |   4 +-
 target/mips/translate.c                            |   2 +-
 target/nios2/helper.c                              |   2 +-
 target/riscv/cpu_helper.c                          |   2 +-
 target/unicore32/helper.c                          |   2 +-
 target/xtensa/translate.c                          |   2 +-
 target/xtensa/xtensa-semi.c                        |   2 +-
 .editorconfig                                      |  17 +-
 .gitlab-ci.yml                                     | 134 ++++++++
 Kconfig                                            |   1 +
 MAINTAINERS                                        |  15 +-
 hw/Kconfig                                         |   1 -
 hw/core/meson.build                                |   2 +
 hw/meson.build                                     |   1 -
 {hw/semihosting => semihosting}/Kconfig            |   0
 {hw/semihosting => semihosting}/meson.build        |   0
 tests/acceptance/boot_xen.py                       | 118 +++++++
 tests/docker/Makefile.include                      |   2 +
 .../docker/dockerfiles/debian-hexagon-cross.docker |  27 ++
 .../build-toolchain.sh                             | 141 ++++++++
 tests/docker/dockerfiles/debian10.docker           |   2 +-
 tests/docker/test-tcg                              |  22 ++
 tests/tcg/configure.sh                             |   4 +
 60 files changed, 1108 insertions(+), 318 deletions(-)
 delete mode 100644 docs/generic-loader.txt
 create mode 100644 docs/system/generic-loader.rst
 create mode 100644 docs/system/guest-loader.rst
 create mode 100644 hw/core/guest-loader.h
 rename include/{hw => }/semihosting/console.h (100%)
 rename include/{hw => }/semihosting/semihost.h (100%)
 rename {hw/semihosting => semihosting}/common-semi.h (100%)
 create mode 100644 hw/core/guest-loader.c
 rename {hw/semihosting => semihosting}/arm-compat-semi.c (99%)
 rename {hw/semihosting => semihosting}/config.c (99%)
 rename {hw/semihosting => semihosting}/console.c (98%)
 rename {hw/semihosting => semihosting}/Kconfig (100%)
 rename {hw/semihosting => semihosting}/meson.build (100%)
 create mode 100644 tests/acceptance/boot_xen.py
 create mode 100644 tests/docker/dockerfiles/debian-hexagon-cross.docker
 create mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
 create mode 100755 tests/docker/test-tcg


-- 
2.20.1


