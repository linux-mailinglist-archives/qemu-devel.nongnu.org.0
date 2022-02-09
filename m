Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241D54AF4C6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:07:24 +0100 (CET)
Received: from localhost ([::1]:58406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHoZ0-0006rO-3Y
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:07:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnlO-0002b3-MH
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:06 -0500
Received: from [2a00:1450:4864:20::52c] (port=44606
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnlJ-0007q8-4Q
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:06 -0500
Received: by mail-ed1-x52c.google.com with SMTP id bx2so5323601edb.11
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B5RpqMQMp/15LOY20o9sAuy94wTtJaj/lIUbswhfDGs=;
 b=BfBED6wbUrKl7iaDv+W/6ME8EdmSZGwWDiM+On8bZLDmkwcCKlK5yVUtJ+ZKes2ULn
 CSyxv/9Av6mCKL0T5M8OLnaSNp/fZiopVFuFbQbIYBKZas6vfxcZKwR+vboczdIBLAr6
 L+rViRxEeIgZQWsI/zHRHIt0Xq++ZPMyGCtwzcA2PG8yq8fu1ALRhi2mXgXYji5qTaZM
 wK7IMRQRIdrBmUJgbWl+0DljCWoZa46kPNeOv7ejcL5swvh8lwDjKDXdw6I1HuunD4q4
 PBNRtmZF6ikQWOgexdNxogzVEAyOPl1bPkSFKQdAw7k/tvBIm6jTmdFIJorSMmp/16IB
 4ntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B5RpqMQMp/15LOY20o9sAuy94wTtJaj/lIUbswhfDGs=;
 b=OoSKbzfMsXfLCKiYgJmKcCXkGev/C0kPSo/YKgWs6qcnHA9Gw0Lf/DuHyQkWCL8glW
 pcWDVBdGXCgraKohtHV9aZeBYf9NsDHfg+etzio7Ud+xRSMuUBC8eoEllKdsX8/Ujbxj
 2TuMMqCUleSzxoRizgf63/f+omLOfzqBflpr/Ihal06rqBRDygbwuV0Rim7dsWUEhbwD
 EYZETHR0Z23/2sbe9JjMK0FJKaaKU4XLiLYG2IK5FAPHZCWd7yQT/FTR/a/LWH9e7UJv
 0A7ol3jz2vaq5O+z62BPbjwm7eYGlKb/bHDbPHc+QUVBjC/QsSdBNtC3XN/VeAJ0IJ8l
 0GJw==
X-Gm-Message-State: AOAM532muNwXWaxiCZgKRvveXFLAG8Gm6gnZhUCWAm3F2OHQTuNibBA4
 3fQyPJBdLBba2u3PeLehNAJ0Pg==
X-Google-Smtp-Source: ABdhPJy+MPojgCSYB8yyCpqOa7nzJT3IIjNmq/UbD2SNtQcVKvDWOChixK+q+rd+/eGmHFnCWeUazQ==
X-Received: by 2002:a05:6402:4304:: with SMTP id
 m4mr2678094edc.67.1644416132091; 
 Wed, 09 Feb 2022 06:15:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l9sm3892384ejn.164.2022.02.09.06.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:15:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5198F1FFB7;
 Wed,  9 Feb 2022 14:15:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 00/28] testing and plugin updates
Date: Wed,  9 Feb 2022 14:15:01 +0000
Message-Id: <20220209141529.3418384-1-alex.bennee@linaro.org>
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
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132af:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220208' into staging (2022-02-08 11:40:08 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-and-plugins-090222-1

for you to fetch changes up to 514f9f8eb64bfd5d6c15024db93f83bd81998de5:

  include/exec: fix softmmu version of TARGET_ABI_FMT_lx (2022-02-09 13:29:38 +0000)

----------------------------------------------------------------
Testing and plugin updates:

  - include vhost tests in qtest
  - clean-up gcov ephemera in clean/.gitignore
  - lcitool and docker updates
  - mention .editorconfig in devel notes
  - switch Centos8 to Centos Stream 8
  - remove TCG tracing support
  - add coverage plugin using drcov format
  - expand abilities of libinsn.so plugin
  - use correct logging for i386 int cases
  - move reset of plugin data to start of block
  - deprecate ppc6432abi
  - fix TARGET_ABI_FMT_ptr for softmmu builds

----------------------------------------------------------------
Alex Bennée (15):
      tests/Makefile.include: clean-up old code
      tests/qtest: enable more vhost-user tests by default
      Makefile: also remove .gcno files when cleaning
      .gitignore: add .gcov pattern
      docs/devel: mention our .editorconfig
      tests/tcg/sh4: disable another unreliable test
      docs: remove references to TCG tracing
      tracing: remove TCG memory access tracing
      tracing: remove the trace-tcg includes from the build
      tracing: excise the tcg related from tracetool
      tests/plugin: allow libinsn.so per-CPU counts
      tests/plugins: add instruction matching to libinsn.so
      target/i386: use CPU_LOG_INT for IRQ servicing
      plugins: move reset of plugin data to tb_start
      include/exec: fix softmmu version of TARGET_ABI_FMT_lx

Ivanov Arkady (2):
      plugins: add helper functions for coverage plugins
      contrib/plugins: add a drcov plugin

Michael Tokarev (1):
      drop libxml2 checks since libxml is not actually used (for parallels)

Philippe Mathieu-Daudé (6):
      MAINTAINERS: Cover lcitool submodule with build test / automation
      gitmodules: Correct libvirt-ci submodule URL
      tests/lcitool: Include local qemu.yml when refreshing cirrus-ci files
      tests/lcitool: Refresh submodule and remove libxml2
      tests: Manually remove libxml2 on MSYS2 runners
      tests/lcitool: Install libibumad to cover RDMA on Debian based distros

Stefan Hajnoczi (1):
      gitlab: fall back to commit hash in qemu-setup filename

Thomas Huth (3):
      tests/lcitool: Allow lcitool-refresh in out-of-tree builds, too
      tests: Update CentOS 8 container to CentOS Stream 8
      linux-user: Remove the deprecated ppc64abi32 target

 docs/about/deprecated.rst                          |   7 -
 docs/about/removed-features.rst                    |  21 +++
 docs/devel/style.rst                               |   4 +
 docs/devel/tracing.rst                             |  85 -----------
 docs/user/main.rst                                 |   1 -
 configure                                          |  29 +---
 Makefile                                           |   3 +-
 configs/targets/ppc64abi32-linux-user.mak          |   8 -
 meson.build                                        |  10 --
 accel/tcg/atomic_template.h                        |  12 --
 include/exec/cpu_ldst.h                            |   2 +-
 include/exec/helper-gen.h                          |   2 -
 include/exec/helper-proto.h                        |   1 -
 include/exec/helper-tcg.h                          |   1 -
 include/qemu/qemu-plugin.h                         |  34 +++++
 include/trace-tcg.h                                |   6 -
 linux-user/ppc/target_syscall.h                    |   4 +-
 linux-user/syscall_defs.h                          |   6 +-
 accel/tcg/cputlb.c                                 |   2 -
 accel/tcg/plugin-gen.c                             |  31 ++--
 accel/tcg/user-exec.c                              |  14 --
 contrib/plugins/drcov.c                            | 163 +++++++++++++++++++++
 linux-user/elfload.c                               |   4 +-
 linux-user/ppc/signal.c                            |  11 +-
 plugins/api.c                                      |  48 ++++++
 target/i386/tcg/sysemu/seg_helper.c                |   4 +-
 tcg/tcg-op.c                                       |   5 -
 tests/plugin/insn.c                                | 126 +++++++++++++++-
 tests/qtest/vhost-user-test.c                      |  21 ++-
 accel/tcg/atomic_common.c.inc                      |  20 ---
 .cirrus.yml                                        |   1 -
 .gitignore                                         |   1 +
 .gitlab-ci.d/buildtest.yml                         |  27 ----
 .gitlab-ci.d/cirrus/freebsd-12.vars                |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars                |   2 +-
 .gitlab-ci.d/cirrus/macos-11.vars                  |   2 +-
 .gitlab-ci.d/crossbuild-template.yml               |   2 +-
 .gitlab-ci.d/windows.yml                           |   2 -
 .gitmodules                                        |   2 +-
 MAINTAINERS                                        |   1 +
 block/meson.build                                  |   3 +-
 contrib/plugins/Makefile                           |   1 +
 meson_options.txt                                  |   2 -
 plugins/qemu-plugins.symbols                       |   4 +
 scripts/checkpatch.pl                              |   1 -
 scripts/ci/org.centos/stream/8/x86_64/configure    |   1 -
 scripts/coverity-scan/coverity-scan.docker         |   1 -
 scripts/coverity-scan/run-coverity-scan            |   2 +-
 scripts/meson-buildoptions.sh                      |   3 -
 scripts/tracetool/__init__.py                      |  41 +-----
 scripts/tracetool/format/tcg_h.py                  |  83 -----------
 scripts/tracetool/format/tcg_helper_c.py           |  79 ----------
 scripts/tracetool/format/tcg_helper_h.py           |  48 ------
 scripts/tracetool/format/tcg_helper_wrapper_h.py   |  70 ---------
 scripts/tracetool/vcpu.py                          |  14 +-
 tests/Makefile.include                             |   4 -
 tests/docker/dockerfiles/alpine.docker             |   4 +-
 tests/docker/dockerfiles/centos8.docker            |   6 +-
 .../docker/dockerfiles/debian-ppc64el-cross.docker |   2 +-
 tests/docker/dockerfiles/fedora.docker             |   4 +-
 tests/docker/dockerfiles/opensuse-leap.docker      |   3 +-
 tests/docker/dockerfiles/ubuntu1804.docker         |   4 +-
 tests/docker/dockerfiles/ubuntu2004.docker         |   4 +-
 tests/lcitool/Makefile.include                     |   2 +-
 tests/lcitool/libvirt-ci                           |   2 +-
 tests/lcitool/projects/qemu.yml                    |   2 +-
 tests/lcitool/refresh                              |   4 +-
 tests/tcg/configure.sh                             |   2 +-
 tests/tcg/sh4/Makefile.target                      |   4 +
 trace-events                                       |  14 --
 trace/meson.build                                  |  14 --
 71 files changed, 472 insertions(+), 683 deletions(-)
 delete mode 100644 configs/targets/ppc64abi32-linux-user.mak
 delete mode 100644 include/trace-tcg.h
 create mode 100644 contrib/plugins/drcov.c
 delete mode 100644 scripts/tracetool/format/tcg_h.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_c.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_h.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_wrapper_h.py

-- 
2.30.2


