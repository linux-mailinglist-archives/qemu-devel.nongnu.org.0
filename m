Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5263342F5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:22:13 +0100 (CET)
Received: from localhost ([::1]:40494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1bA-0007ik-Bn
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1Fs-0004Mj-Qa
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:12 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:34199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1Fm-0002Wu-Qq
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:12 -0500
Received: by mail-ed1-x530.google.com with SMTP id b13so28859902edx.1
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M0AMLbXZ/QcwWks3HRZCqtE1oJw3lKk4nAgvETeXr/g=;
 b=l5TFphpg1oYXcBrZ5w5w6uJs1kZVl45rp4znvq5A6AmywcFxGFNRGHz3xdUVvSoavf
 QBCE33GOSawK7TmWPtqwbbKK95RzPQnaXrN21vKLiu5lgV2IYUKYhK35lJ9vysJk2MpR
 3Za4HSBriWC2jKefH5W7fDJrbbaI1KoST3HgjF0vhCVDndjSbP0NeFptSx0gI3XUyKSH
 oooeDcmgaaTJEBlivCY4ZS3f929eG5S09r8tiq3Tm9gjQZ+GtLI2uBRV/y1XmeT9ao0I
 2HIu5uATbXwQ4FapDOu2a68AcYg17e63JEr7IVODExi1ujQNHj7C+9DtRTRtUd0B4trX
 G/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M0AMLbXZ/QcwWks3HRZCqtE1oJw3lKk4nAgvETeXr/g=;
 b=hLs+v6fC0k58tX/3gqZX6Bw8k5MSxq3H+IVq1FTydIdpqCC6L8RYmlFI5HWkjhEQUz
 toTX3VHEbc81aF3EsILoNwu79uwXQy1FvfEhj/XgXiR9toXNXSwe2wQ6nO45P/gr7DMw
 3n2Yslgkr6TJt3KJWfyWIa6hs2AwQufae4Xp9GlSO+xjNPUMTNS/aZBPoqbZLD+rp2RG
 rrMmWlUywIaykO/noM87KPB1DWK63eGebp4cqVFmzu+SLTy8NT8z0g1kQW7lM54FSGwo
 puVu708mfnARRaf3ium9GB043CbMzKtcASsdRjxWO/vPofMMSYOARphV/HZgfTPdF0Vk
 1SRw==
X-Gm-Message-State: AOAM533u2/7Zh00x6zYTHEyTH5EvzE9Onv+sfR2lxF1Ex8NSrfWB0dHs
 pZk17pGi1BfO9VDQ0PmtJSaPkg==
X-Google-Smtp-Source: ABdhPJxlaKkM3tKpcBg9ELzH7LL3jUMX0ANz2C96geRgf10QNP5+ln7xDiP/cNg3c+ma+UKRUqLVoQ==
X-Received: by 2002:a05:6402:3075:: with SMTP id
 bs21mr4120470edb.274.1615392004455; 
 Wed, 10 Mar 2021 08:00:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q10sm10811794eds.67.2021.03.10.08.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:00:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 91EE31FF7E;
 Wed, 10 Mar 2021 16:00:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 00/15] testing, docs, semihosting move and guest-loader
Date: Wed, 10 Mar 2021 15:59:47 +0000
Message-Id: <20210310160002.11659-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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

v2 drops the hexagon docker patches.

The following changes since commit a557b00469bca61a058fc1db4855503cac1c3219:

  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-03-09 21:31:18 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-docs-xen-updates-100321-2

for you to fetch changes up to 8df9f0c3d7f53c5a123ebb873d1c22daec003c22:

  semihosting: Move hw/semihosting/ -> semihosting/ (2021-03-10 15:34:12 +0000)

----------------------------------------------------------------
Testing, guest-loader and other misc tweaks

  - add warning text to quickstart example
  - add CFI tests to CI
  - use --arch-only for docker pre-requisites
  - fix .editorconfig for emacs
  - add guest-loader for Xen-like hypervisor testing
  - move generic-loader docs into manual proper
  - move semihosting out of hw/

----------------------------------------------------------------
Alex Bennée (10):
      docs/system: add a gentle prompt for the complexity to come
      tests/docker: add a test-tcg for building then running check-tcg
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

 docs/generic-loader.txt                           |  92 ------
 docs/system/generic-loader.rst                    | 117 +++++++
 docs/system/guest-loader.rst                      |  54 ++++
 docs/system/index.rst                             |   2 +
 docs/system/quickstart.rst                        |   8 +
 docs/system/targets.rst                           |   2 +
 meson.build                                       |   1 +
 hw/core/guest-loader.h                            |  34 +++
 include/hw/arm/virt.h                             |   1 -
 include/hw/boards.h                               |   1 +
 include/hw/riscv/virt.h                           |   1 -
 include/{hw => }/semihosting/console.h            |   0
 include/{hw => }/semihosting/semihost.h           |   0
 include/sysemu/device_tree.h                      |  17 ++
 {hw/semihosting => semihosting}/common-semi.h     |   0
 gdbstub.c                                         |   2 +-
 hw/arm/virt.c                                     | 356 +++++++++++-----------
 hw/core/guest-loader.c                            | 145 +++++++++
 hw/mips/malta.c                                   |   2 +-
 hw/riscv/virt.c                                   |  20 +-
 linux-user/aarch64/cpu_loop.c                     |   2 +-
 linux-user/arm/cpu_loop.c                         |   2 +-
 linux-user/riscv/cpu_loop.c                       |   2 +-
 linux-user/semihost.c                             |   2 +-
 {hw/semihosting => semihosting}/arm-compat-semi.c |   6 +-
 {hw/semihosting => semihosting}/config.c          |   2 +-
 {hw/semihosting => semihosting}/console.c         |   4 +-
 softmmu/device_tree.c                             |  26 ++
 softmmu/vl.c                                      |   2 +-
 stubs/semihost.c                                  |   2 +-
 target/arm/helper.c                               |   4 +-
 target/arm/m_helper.c                             |   4 +-
 target/arm/translate-a64.c                        |   2 +-
 target/arm/translate.c                            |   2 +-
 target/lm32/helper.c                              |   2 +-
 target/m68k/op_helper.c                           |   2 +-
 target/mips/cpu.c                                 |   2 +-
 target/mips/mips-semi.c                           |   4 +-
 target/mips/translate.c                           |   2 +-
 target/nios2/helper.c                             |   2 +-
 target/riscv/cpu_helper.c                         |   2 +-
 target/unicore32/helper.c                         |   2 +-
 target/xtensa/translate.c                         |   2 +-
 target/xtensa/xtensa-semi.c                       |   2 +-
 .editorconfig                                     |  17 +-
 .gitlab-ci.yml                                    | 123 ++++++++
 Kconfig                                           |   1 +
 MAINTAINERS                                       |  13 +-
 hw/Kconfig                                        |   1 -
 hw/core/meson.build                               |   2 +
 hw/meson.build                                    |   1 -
 {hw/semihosting => semihosting}/Kconfig           |   0
 {hw/semihosting => semihosting}/meson.build       |   0
 tests/acceptance/boot_xen.py                      | 118 +++++++
 tests/docker/dockerfiles/debian10.docker          |   2 +-
 tests/docker/test-tcg                             |  22 ++
 56 files changed, 921 insertions(+), 318 deletions(-)
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
 create mode 100755 tests/docker/test-tcg

-- 
2.20.1


