Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA003874CC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:09:36 +0200 (CEST)
Received: from localhost ([::1]:35962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livjL-0001y9-Nk
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhH-0007mH-AI
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:27 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhF-0005P9-6O
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:27 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i17so9303198wrq.11
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PgSnFlwujR6Y92nMPQ/AcZsYgl+IaFngVx+1h44up40=;
 b=GENg2sR5177NIDN0tzqpkZ7apaFJngOT9FVoq69gpivYL5oHRnrCAf7ShgAM9uBgHc
 t1HtONq/4R3giw7t/Zr2UjsgQVQGkJPQekT46uWeLO1gVAK4AJ1Rxe5IDbrhlra36imh
 +QK8rPiz5p1kZC001M2YjwduyaUqfp3zflhlPP1Tbmm8DfRoJRCHqyYoSR8M3M+kq5pC
 ifgsQFT/CYV2MBpZq2bOe6S+C51UDTisP8fJCsdhayLBPi7RBp99p/VKnYaw8BJZo7m/
 WI8uQ8VBISJtIDTLFM330jInUpm77xZpd0QPTS2vsh3VjrJDxNM/MYySj+uwvvXIDI1W
 KjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PgSnFlwujR6Y92nMPQ/AcZsYgl+IaFngVx+1h44up40=;
 b=IUa2hQNRpg4+TEJs080Esv9+nVZCjSn3Tkm59oH9iap40eey87M/QlORvFnvAfEnL5
 bii3UCGYWpC98m2qOeQgUYVe+5kHboOM7fzDsDzqjaqjMaxDy7xF/V6J+q0HJT00giUj
 AudTFmDlL/SIQw2R9x2nn1aPwVg7f9m1cFXsGavwdOk4yqJCEi5T4HmnmtLzTHUVqcLi
 rBci8ypXXxqlbP3BY28V0+FsuV1rP8mIhmsMtNxkbAlJeZxJRwdargHlyeHl/M41zxfZ
 y5V+5hPmGWFSPkeQZJSiHWAfE9x7exL68F4yNy1Y+MTxwtJ7iymXcLyczFUwQfNcWDh9
 JZ+w==
X-Gm-Message-State: AOAM531aciUjbbXiw3D82fpBxl3qKnE2UQdazg78VsOs2F2F7MWSvQ5n
 2YDbUS2qsy9kXOkxkT7C+5dfZg==
X-Google-Smtp-Source: ABdhPJxgMIzhJ4LUhxmDapzY6N6R7IGigcx15pAk/DfP7vdnDQt3qa55En8kJaNlol7kR5pdw7G9ng==
X-Received: by 2002:adf:fd82:: with SMTP id d2mr5643361wrr.218.1621328842661; 
 Tue, 18 May 2021 02:07:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c6sm2189170wru.50.2021.05.18.02.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:07:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ED47B1FF7E;
 Tue, 18 May 2021 10:07:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 00/29] testing and plugin updates
Date: Tue, 18 May 2021 10:06:51 +0100
Message-Id: <20210518090720.21915-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 367196caa07ac31443bc360145cc10fbef4fdf92:

  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.1-pull-request' into staging (2021-05-17 16:44:47 +0100)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-and-plugin-updates-180521-2

for you to fetch changes up to b1aa4de12e846e0ad18969ee823c19b66d8d4d8f:

  configure: use cc, not host_cc to set cross_cc for build arch (2021-05-18 09:36:21 +0100)

----------------------------------------------------------------
testing and plugin updates:

  - various fixes for binfmt_misc docker images
  - add hexagon check-tcg support docker image
  - add tricore check-tcg support
  - refactor ppc docker images
  - add missing ppc64le tests
  - don't use host_cc for test fallback
  - check-tcg configure.sh tweaks for cross compile/clang
  - fix some memory leaks in plugins

----------------------------------------------------------------
Alessandro Di Federico (2):
      docker: Add Hexagon image
      tests/tcg: Use Hexagon Docker image

Alex Bennée (9):
      tests/docker: fix copying of executable in "update"
      tests/docker: make executable an optional argument to "update"
      tests/docker: allow "update" to add the current user
      tests/docker: add "fetch" sub-command
      gitlab: add build-user-hexagon test
      tests/tcg: don't iterate through other arch compilers
      tests/tcg: fix missing return
      tests/tcg: don't allow clang as a cross compiler
      configure: use cc, not host_cc to set cross_cc for build arch

Andrew Melnychenko (1):
      tests/docker: Added libbpf library to the docker files.

Bastian Koppelmann (15):
      tests/tcg: Add docker_as and docker_ld cmds
      tests/tcg: Run timeout cmds using --foreground
      hw/tricore: Add testdevice for tests in tests/tcg/
      tests/tcg/tricore: Add build infrastructure
      configure: Emit HOST_CC to config-host.mak
      tests/tcg/tricore: Add macros to create tests and first test 'abs'
      tests/tcg/tricore: Add bmerge test
      tests/tcg/tricore: Add clz test
      tests/tcg/tricore: Add dvstep test
      tests/tcg/tricore: Add fadd test
      tests/tcg/tricore: Add fmul test
      tests/tcg/tricore: Add ftoi test
      tests/tcg/tricore: Add madd test
      tests/tcg/tricore: Add msub test
      tests/tcg/tricore: Add muls test

Matheus Ferst (2):
      tests/docker: gcc-10 based images for ppc64{,le} tests
      tests/tcg/ppc64le: tests for brh/brw/brd

 configure                                          |   3 +-
 include/hw/tricore/tricore_testdevice.h            |  38 ++++
 tests/tcg/tricore/macros.h                         | 129 +++++++++++++
 hw/tricore/tricore_testboard.c                     |   8 +
 hw/tricore/tricore_testdevice.c                    |  82 ++++++++
 tests/tcg/multiarch/system/memory.c                |   1 +
 tests/tcg/ppc64le/byte_reverse.c                   |  21 +++
 .gitlab-ci.d/containers.yml                        |  13 +-
 .gitlab-ci.yml                                     |  11 ++
 MAINTAINERS                                        |   3 +
 hw/tricore/meson.build                             |   1 +
 tests/docker/Makefile.include                      |  29 ++-
 tests/docker/docker.py                             |  78 +++++---
 tests/docker/dockerfiles/alpine.docker             |   1 +
 tests/docker/dockerfiles/centos8.docker            |   1 +
 .../docker/dockerfiles/debian-hexagon-cross.docker |  45 +++++
 .../build-toolchain.sh                             | 141 ++++++++++++++
 .../docker/dockerfiles/debian-powerpc-cross.docker |  12 --
 .../dockerfiles/debian-powerpc-test-cross.docker   |  17 ++
 tests/docker/dockerfiles/debian-ppc64-cross.docker |  11 --
 tests/docker/dockerfiles/fedora.docker             |   1 +
 tests/tcg/Makefile.qemu                            |  17 ++
 tests/tcg/Makefile.target                          |   5 +-
 tests/tcg/configure.sh                             | 207 +++++++++++----------
 tests/tcg/ppc64/Makefile.target                    |  13 ++
 tests/tcg/ppc64le/Makefile.target                  |  13 ++
 tests/tcg/tricore/Makefile.softmmu-target          |  26 +++
 tests/tcg/tricore/link.ld                          |  60 ++++++
 tests/tcg/tricore/test_abs.S                       |   7 +
 tests/tcg/tricore/test_bmerge.S                    |   8 +
 tests/tcg/tricore/test_clz.S                       |   9 +
 tests/tcg/tricore/test_dvstep.S                    |  15 ++
 tests/tcg/tricore/test_fadd.S                      |  16 ++
 tests/tcg/tricore/test_fmul.S                      |   8 +
 tests/tcg/tricore/test_ftoi.S                      |  10 +
 tests/tcg/tricore/test_madd.S                      |  11 ++
 tests/tcg/tricore/test_msub.S                      |   9 +
 tests/tcg/tricore/test_muls.S                      |   9 +
 38 files changed, 928 insertions(+), 161 deletions(-)
 create mode 100644 include/hw/tricore/tricore_testdevice.h
 create mode 100644 tests/tcg/tricore/macros.h
 create mode 100644 hw/tricore/tricore_testdevice.c
 create mode 100644 tests/tcg/ppc64le/byte_reverse.c
 create mode 100644 tests/docker/dockerfiles/debian-hexagon-cross.docker
 create mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
 delete mode 100644 tests/docker/dockerfiles/debian-powerpc-cross.docker
 create mode 100644 tests/docker/dockerfiles/debian-powerpc-test-cross.docker
 delete mode 100644 tests/docker/dockerfiles/debian-ppc64-cross.docker
 create mode 100644 tests/tcg/tricore/Makefile.softmmu-target
 create mode 100644 tests/tcg/tricore/link.ld
 create mode 100644 tests/tcg/tricore/test_abs.S
 create mode 100644 tests/tcg/tricore/test_bmerge.S
 create mode 100644 tests/tcg/tricore/test_clz.S
 create mode 100644 tests/tcg/tricore/test_dvstep.S
 create mode 100644 tests/tcg/tricore/test_fadd.S
 create mode 100644 tests/tcg/tricore/test_fmul.S
 create mode 100644 tests/tcg/tricore/test_ftoi.S
 create mode 100644 tests/tcg/tricore/test_madd.S
 create mode 100644 tests/tcg/tricore/test_msub.S
 create mode 100644 tests/tcg/tricore/test_muls.S

-- 
2.20.1


