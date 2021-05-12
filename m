Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D093137BA3F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:23:04 +0200 (CEST)
Received: from localhost ([::1]:41570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgm19-0005XV-SQ
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglz7-00038h-DB
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:20:57 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglz5-0003Sk-9A
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:20:57 -0400
Received: by mail-wr1-x430.google.com with SMTP id z17so3974186wrq.7
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IZk8GUqR7DhPCdmvGmYBRtbOpcgOJkWDFcVIv/+QqGA=;
 b=Vg/gH3c9PjzFkhQ5+YQSF6QVTo6fvTYrviAuiSuXqTne+iOTIcRlpMkCdvJjRS7yQa
 AAGFTSiYFT5jvp7x3bH/TpX+Ize5GK2DipSl160QUYkVXY9MLVlWgEr3fKeamS182WXB
 69/Ciid5TrJI2Bk7wTJw3iSipnB+UItJJ746AUQkUQma5GShb2enGaIAKl4HugtaMa9u
 D027oF1jKvTvxTtMFCMGG2e7/211Ct1aEU7OQZLbfaBMhpWF9bTdc+9QGOmlrGcpRjGT
 KTnoLosn10Ir3+cJH3nVbtEIJR6/O7RWOHmJIy0lI+kcTR5a706ms2kPcqAVjQYBU0MZ
 pjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IZk8GUqR7DhPCdmvGmYBRtbOpcgOJkWDFcVIv/+QqGA=;
 b=Rr5Yy3xFLmwmLS8GzGO4wU0b3F2rzJAdbFHJtd4GgcGzlvO6nRfx6aQlXD8of7ThQV
 kOfMMZ07/FVEQvaldctT+CD7czf7rfLMyMSpg2MPaBOD3H37WkOIzQUoSKRRzZON8pJ5
 Rll34l2fbyx0nzIIKI3RC5iSePYIPSg+ZVjqAAlW8YAt9p58peZWBYQ1qTCtDkA78Sle
 bv0aXwEgMs8u9meWpzLyzBINSgLeo27iXtSeZjuOzub7kruR5Hc6t/gUPaZWdwi9d5y3
 jHwjgvmHVQ23XIZs9HOSKxZQBUvD1Kl81O6O7o7eSP/anL1PU7XYttlgOOTdP6OZ/AIT
 /cYg==
X-Gm-Message-State: AOAM531+Rm84FQxCRpzDywoLvnveZQc6LmE3LUPeyn0bK7w0LQMUaFZm
 YFA7mLwPX6f1Rm2FUsmt9sTaUQ==
X-Google-Smtp-Source: ABdhPJw6GdXpalpfhR3wPIq+DJt8p35hbTb7Zv5sdzB7ibobmpSTRj8kthtppIsatoEOGFdImgalWQ==
X-Received: by 2002:a05:6000:1b06:: with SMTP id
 f6mr43643742wrz.339.1620814853658; 
 Wed, 12 May 2021 03:20:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a9sm26045192wmj.1.2021.05.12.03.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:20:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 23A731FF7E;
 Wed, 12 May 2021 11:20:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 00/31] testing/next pre-PR (hexagon, tricore, misc)
Date: Wed, 12 May 2021 11:20:20 +0100
Message-Id: <20210512102051.12134-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

I was planning to cut the PR from v2 but I needed to squash a couple
of remaining problems with the hexagon build and also when attempting
to use clang to build the x86 tests. As a result here is a v3 that:

  - drops the signals stress test as it still triggers issues
    - sanitizier fail on __get_user(*get_freg(env, i), &sc->fpregs.fprs[i]);
    - qemu-s390x on s390x segs around 4% of the time
  - skip clang for building i386/x86_64 tests (falls back to docker)
  - tweak the hexagon image to include ninja/git

The following still need review:

 - tests/tcg: don't allow clang as a cross compiler
 - tests/tcg: fix missing return
 - tests/tcg: don't iterate through other arch compilers

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

Greg Kurz (1):
  checkpatch: Fix use of uninitialized value

Matheus Ferst (2):
  tests/docker: gcc-10 based images for ppc64{,le} tests
  tests/tcg/ppc64le: tests for brh/brw/brd

Thomas Huth (1):
  cirrus.yml: Fix the MSYS2 task

 configure                                     |   3 +-
 include/hw/tricore/tricore_testdevice.h       |  38 ++++
 tests/tcg/tricore/macros.h                    | 129 +++++++++++
 hw/tricore/tricore_testboard.c                |   8 +
 hw/tricore/tricore_testdevice.c               |  82 +++++++
 tests/tcg/multiarch/system/memory.c           |   1 +
 tests/tcg/ppc64le/byte_reverse.c              |  21 ++
 .cirrus.yml                                   |   4 +-
 .gitlab-ci.d/containers.yml                   |  13 +-
 .gitlab-ci.yml                                |  11 +
 MAINTAINERS                                   |   3 +
 hw/tricore/meson.build                        |   1 +
 scripts/checkpatch.pl                         |   1 +
 tests/docker/Makefile.include                 |  29 ++-
 tests/docker/docker.py                        |  78 +++++--
 tests/docker/dockerfiles/alpine.docker        |   1 +
 tests/docker/dockerfiles/centos8.docker       |   1 +
 .../dockerfiles/debian-hexagon-cross.docker   |  45 ++++
 .../build-toolchain.sh                        | 141 ++++++++++++
 .../dockerfiles/debian-powerpc-cross.docker   |  12 -
 .../debian-powerpc-test-cross.docker          |  17 ++
 .../dockerfiles/debian-ppc64-cross.docker     |  11 -
 tests/docker/dockerfiles/fedora.docker        |   1 +
 tests/tcg/Makefile.qemu                       |  17 ++
 tests/tcg/Makefile.target                     |   5 +-
 tests/tcg/configure.sh                        | 207 +++++++++---------
 tests/tcg/ppc64/Makefile.target               |  13 ++
 tests/tcg/ppc64le/Makefile.target             |  13 ++
 tests/tcg/tricore/Makefile.softmmu-target     |  26 +++
 tests/tcg/tricore/link.ld                     |  60 +++++
 tests/tcg/tricore/test_abs.S                  |   7 +
 tests/tcg/tricore/test_bmerge.S               |   8 +
 tests/tcg/tricore/test_clz.S                  |   9 +
 tests/tcg/tricore/test_dvstep.S               |  15 ++
 tests/tcg/tricore/test_fadd.S                 |  16 ++
 tests/tcg/tricore/test_fmul.S                 |   8 +
 tests/tcg/tricore/test_ftoi.S                 |  10 +
 tests/tcg/tricore/test_madd.S                 |  11 +
 tests/tcg/tricore/test_msub.S                 |   9 +
 tests/tcg/tricore/test_muls.S                 |   9 +
 40 files changed, 931 insertions(+), 163 deletions(-)
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


