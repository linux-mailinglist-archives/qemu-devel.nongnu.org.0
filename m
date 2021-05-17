Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58642383952
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:13:08 +0200 (CEST)
Received: from localhost ([::1]:36684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lifrf-0001uT-AK
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifp7-0007Ds-Gf
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:29 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifp4-0005p1-4i
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:29 -0400
Received: by mail-wr1-x430.google.com with SMTP id v12so7012754wrq.6
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6qyEcdexsbKVomqedZupNgM6qMNpZl5uPu69o2xaBK8=;
 b=LrDtiWPtaflyOblNcHn4Hsv74p/fx1sB0exPAKs4e1RQ2+FNn/Z1uVgnPflRJFX+g0
 kqxHOqI27zSwhuvn0WfIblGMX5YBPbeh5hDpqgfqiM9V8kqzQyFStRSU1eC5WFkvsKm+
 5ZrSBwDwi6hTHadwRGlFjpcXKg4skPJpZI65vkh86cLu0uhSR5Qkmyb9MWN5L0fQqGK+
 RK+C1UMO2STeLkWfSB33JPHAfL4MZVGA+c3GJ0T6Dx4Gzz65kwXzVTblHM+J0i04HlUK
 h3P++VoUzIvBulxW5DVXfv384dKX+d4aG+r2y411D07Zb/ZLz9vN/mjyiBsio1ylfDps
 2etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6qyEcdexsbKVomqedZupNgM6qMNpZl5uPu69o2xaBK8=;
 b=ZduopI9qDhLioQwZ6rXn9GucELzwlyrVkQtvpWRawLDacg1huj4LjQW6EpLd5r8MJS
 junuEXOQ8vb90YeYqdDrtGAOV5zKwBwaRqdLSpuCtHxHxs2a0ONqp45hZzY8hWxhAXeP
 PTzkDZUwhgI2Hp86AC3VCX3gE7o9ggeOFk6dIHMc0fJFQbXr6grbTHzRJKyrkTISlP7c
 41wU4mW77gTrGOVaO+tiQIlWVAaHXawzdbbT67uXZKP3HOj07gpNHbMBaVPn60K/0yNu
 F8vtPVmyzgRqmW5MhJ+LF0XzPkNY4MfsJ37aC9gtWachYP7XFx3ALKBQW9mVrJq4zJ5i
 3Otw==
X-Gm-Message-State: AOAM532QuWjjyWHUvH+8r/u4/n4xayrTAQNPF9l/IHpcxsysTlZCwBIJ
 O0JCCwzOOeik9+tODL8IuCUXWA==
X-Google-Smtp-Source: ABdhPJwDmlanLgJaduEo6M3mlUyyOj6waErQfHxoTKV3UZFXbk5UrrNSBkP2hxl8XVQITXA2BKGAsQ==
X-Received: by 2002:adf:a212:: with SMTP id p18mr480578wra.353.1621267824504; 
 Mon, 17 May 2021 09:10:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x2sm5345034wmj.3.2021.05.17.09.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:10:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 05A371FF7E;
 Mon, 17 May 2021 17:10:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 00/29] testing and plugin updates
Date: Mon, 17 May 2021 17:09:53 +0100
Message-Id: <20210517161022.13984-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6005ee07c380cbde44292f5f6c96e7daa70f4f7d:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-05-16 17:22:46 +0100)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-and-plugin-updates-170521-2

for you to fetch changes up to e3ac6f02999e88b9f8fb85013121a9408d07b6e2:

  plugins/hotpages: Properly freed the hash table values (2021-05-17 14:38:44 +0100)

----------------------------------------------------------------
testing and plugin updates:

  - various fixes for binfmt_misc docker images
  - add hexagon check-tcg support docker image
  - add tricore check-tcg support
  - add missing ppc64le tests
  - don't use host_cc for test fallback
  - check-tcg configure.sh tweaks for cross compile/clang
  - fix some memory leaks in plugins

----------------------------------------------------------------
Alessandro Di Federico (1):
      tests/tcg: Use Hexagon Docker image

Alex Bennée (8):
      tests/docker: fix copying of executable in "update"
      tests/docker: make executable an optional argument to "update"
      tests/docker: allow "update" to add the current user
      tests/docker: add "fetch" sub-command
      docker: Add Hexagon image
      tests/tcg: fix missing return
      tests/tcg: don't allow clang as a cross compiler
      configure: use cc, not host_cc to set cross_cc for build arch

Andrew Melnychenko (1):
      tests/docker: Added libbpf library to the docker files.

Bastian Koppelmann (14):
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

Mahmoud Mandour (2):
      plugins/hotblocks: Properly freed the hash table values
      plugins/hotpages: Properly freed the hash table values

Matheus Ferst (1):
      tests/tcg/ppc64le: tests for brh/brw/brd

Yonggang Luo (2):
      plugins: Update qemu-plugins.symbols to match qemu-plugins.h
      plugins: Move all typedef and type declaration to the front of the qemu-plugin.h

 configure                                          |   3 +-
 include/hw/tricore/tricore_testdevice.h            |  38 +++++
 include/qemu/qemu-plugin.h                         | 187 ++++++++++-----------
 tests/tcg/tricore/macros.h                         | 129 ++++++++++++++
 contrib/plugins/hotblocks.c                        |   3 +-
 contrib/plugins/hotpages.c                         |   3 +-
 hw/tricore/tricore_testboard.c                     |   8 +
 hw/tricore/tricore_testdevice.c                    |  82 +++++++++
 tests/tcg/multiarch/system/memory.c                |   1 +
 tests/tcg/ppc64le/byte_reverse.c                   |  21 +++
 MAINTAINERS                                        |   3 +
 hw/tricore/meson.build                             |   1 +
 plugins/qemu-plugins.symbols                       |  25 ++-
 tests/docker/Makefile.include                      |  24 ++-
 tests/docker/docker.py                             |  78 ++++++---
 tests/docker/dockerfiles/alpine.docker             |   1 +
 tests/docker/dockerfiles/centos8.docker            |   1 +
 .../docker/dockerfiles/debian-hexagon-cross.docker |  45 +++++
 .../build-toolchain.sh                             | 141 ++++++++++++++++
 tests/docker/dockerfiles/fedora.docker             |   1 +
 tests/tcg/Makefile.target                          |   5 +-
 tests/tcg/configure.sh                             | 149 +++++++++-------
 tests/tcg/ppc64/Makefile.target                    |  13 ++
 tests/tcg/ppc64le/Makefile.target                  |  13 ++
 tests/tcg/tricore/Makefile.softmmu-target          |  26 +++
 tests/tcg/tricore/link.ld                          |  60 +++++++
 tests/tcg/tricore/test_abs.S                       |   7 +
 tests/tcg/tricore/test_bmerge.S                    |   8 +
 tests/tcg/tricore/test_clz.S                       |   9 +
 tests/tcg/tricore/test_dvstep.S                    |  15 ++
 tests/tcg/tricore/test_fadd.S                      |  16 ++
 tests/tcg/tricore/test_fmul.S                      |   8 +
 tests/tcg/tricore/test_ftoi.S                      |  10 ++
 tests/tcg/tricore/test_madd.S                      |  11 ++
 tests/tcg/tricore/test_msub.S                      |   9 +
 tests/tcg/tricore/test_muls.S                      |   9 +
 36 files changed, 966 insertions(+), 197 deletions(-)
 create mode 100644 include/hw/tricore/tricore_testdevice.h
 create mode 100644 tests/tcg/tricore/macros.h
 create mode 100644 hw/tricore/tricore_testdevice.c
 create mode 100644 tests/tcg/ppc64le/byte_reverse.c
 create mode 100644 tests/docker/dockerfiles/debian-hexagon-cross.docker
 create mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
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


