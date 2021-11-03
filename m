Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DC84446C8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:13:21 +0100 (CET)
Received: from localhost ([::1]:36412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJpA-0005dj-Lr
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiB-0003WP-Uj
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:07 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:44707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJi9-0003Xt-Ae
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:07 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso2360245wme.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=en6elDcZ6Q7uuXxgVV4JGigi9TZlJ4KlE9oVrSFttjQ=;
 b=q2s+mESiSaEirBUb5rVjaLjvUHfjYyY1NpKuSnXVyCgW8H+QTdjiD8vfo9x9Onses6
 rHma3zxZHUNZewWZfBzWCi6g4FzKbC+L6S6d51dkaeB3jS/RZujkatUJ3Q07zpKdUnYA
 AnB1BfgoSZdNpnKmPBMGAfB+nsWPuQ83CWkhCeG39OuNKNRrQmflzFi/tQYojB5tTgQ4
 TB7QTVjTcTWjYOyi3yklOkfiyBIqRec8N6dZJFXlsempsvviGbZehb0RENPeAzTzaFeH
 wJEgJp6iw1njjZhKqK7RPe0jLGyzsdGAf29SNTW2krpHWWB3ebZfS1eV15Ale31q2Gpb
 t1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=en6elDcZ6Q7uuXxgVV4JGigi9TZlJ4KlE9oVrSFttjQ=;
 b=UUoQsrd35Eli+fU2gxTT7t69Pm5qyknHicuBq57FwV+W5B0PXYeXFwCwEQnzCsCwxr
 Aiz9ldE0f24/hnIWioWJKZ5V3qHsKMy5Ll5MRk+bV3whqIUD8wiJ3/tNsEFS2tCQsf7m
 8Hsd67en2Cji1Q44+Ga2nyIsK4fkA6nLfHOAYU1McKNXn1Yvlfx3ZnwG+MacAvWWJicm
 G0auGRq5jsgGxWuhPH52mnTAN4BMlQegc3NtgsbZ2eGkyGGnGfIJgAhyKEl2EOG6ZcBQ
 CqlGwJkDEZ1XmalNlLQB4Ip/ODTtZzh8QmKKBTkbhv4T0EmDm8RVz09OI16hpmkPjPxV
 uiew==
X-Gm-Message-State: AOAM53141fYSv5sN9bEefq/DPgmoj1Kgqp8zTn3MaY8105DHibk+T3cS
 dWj+PVQUrUlvqaK2YDgM60V/uQ==
X-Google-Smtp-Source: ABdhPJzG+Hs2pjSJkZT8hOZLzujh7SBw5dyVZLGAWL/DSoHrDAxCfPVHsUU9JC6sTHEAugWL/FqD1Q==
X-Received: by 2002:a05:600c:2e46:: with SMTP id
 q6mr16423069wmf.6.1635959161697; 
 Wed, 03 Nov 2021 10:06:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 10sm3161760wrb.75.2021.11.03.10.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:05:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6FDCD1FF96;
 Wed,  3 Nov 2021 17:05:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL for 6.2 00/21] testing, plugin and gdbstub updates
Date: Wed,  3 Nov 2021 17:05:37 +0000
Message-Id: <20211103170558.717981-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e86e00a2493254d072581960b48461eb96481e45:

  Merge remote-tracking branch 'remotes/berrange/tags/hmp-x-qmp-620-pull-request' into staging (2021-11-03 08:04:32 -0400)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-for-6.2-031121-2

for you to fetch changes up to 8b964f7f800eda16c489a7a8a0f1d88da1c34c1b:

  tests/vm/openbsd: Update to release 7.0 (2021-11-03 14:54:21 +0000)

----------------------------------------------------------------
Testing, gdbstub and plugin updates for 6.2

 - update hexagon compiler to binary release
 - add microblaze and nios2 compiler docker images
 - fix test cross compiler detection for some targets
 - don't try and link ebf to user targets
 - add L2 tracking to cache plugin
 - exit cleanly on C-a x
 - clean up debug output in check-tcg
 - switch to thread on break in gdbstub
 - update openbsd VM to 7.0

----------------------------------------------------------------
Alex Bennée (7):
      tests/docker: split PARTIAL into PARTIAL and VIRTUAL images
      tests/tcg: enable debian-nios2-cross for test building
      chardev: don't exit() straight away on C-a x
      tests/plugins: extend the insn plugin to track opcode sizes
      plugins: try and make plugin_insn_append more ergonomic
      tests/tcg: remove duplicate EXTRA_RUNS
      tests/tcg: remove debug polluting make output

Mahmoud Mandour (5):
      plugins/cache: freed heap-allocated mutexes
      plugins/cache: implement unified L2 cache emulation
      plugins/cache: split command line arguments into name and value
      plugins/cache: make L2 emulation optional through args
      docs/tcg-plugins: add L2 arguments to cache docs

Paolo Bonzini (1):
      ebpf: really include it only in system emulators

Pavel Labath (1):
      gdbstub: Switch to the thread receiving a signal

Philippe Mathieu-Daudé (1):
      tests/tcg: Fix some targets default cross compiler path

Richard Henderson (6):
      tests/docker: Update debian-hexagon-cross to a newer toolchain
      gitlab-ci: Remove special casing for hexagon testing
      tests/docker: Add debian-nios2-cross image
      tests/docker: Add debian-microblaze-cross image
      tests/tcg: Enable container_cross_cc for microblaze
      tests/vm/openbsd: Update to release 7.0

 docs/devel/tcg-plugins.rst                         |  20 +-
 meson.build                                        |   2 -
 include/exec/plugin-gen.h                          |  12 +-
 include/qemu/plugin.h                              |   7 +-
 accel/tcg/plugin-gen.c                             |   3 +-
 accel/tcg/translator.c                             |   2 +-
 chardev/char-mux.c                                 |   3 +-
 contrib/plugins/cache.c                            | 318 +++++++++++++++------
 gdbstub.c                                          |   8 +-
 stubs/qmp-quit.c                                   |   8 +
 tests/plugin/insn.c                                |  37 ++-
 .gitlab-ci.d/buildtest.yml                         |   4 -
 .gitlab-ci.d/container-cross.yml                   |  27 +-
 MAINTAINERS                                        |   4 +-
 stubs/meson.build                                  |   1 +
 tests/docker/Makefile.include                      |  59 ++--
 .../docker/dockerfiles/debian-hexagon-cross.docker |  47 +--
 .../build-toolchain.sh                             | 141 ---------
 .../debian-microblaze-cross.d/build-toolchain.sh   |  88 ++++++
 .../debian-nios2-cross.d/build-toolchain.sh        |  87 ++++++
 tests/docker/dockerfiles/debian-toolchain.docker   |  36 +++
 tests/tcg/configure.sh                             |  26 +-
 tests/tcg/hexagon/Makefile.target                  |   6 +
 tests/tcg/multiarch/Makefile.target                |  13 +-
 .../multiarch/gdbstub/test-thread-breakpoint.py    |  60 ++++
 tests/tcg/nios2/Makefile.target                    |  11 +
 tests/tcg/sh4/Makefile.target                      |   6 +
 tests/vm/openbsd                                   |   7 +-
 28 files changed, 688 insertions(+), 355 deletions(-)
 create mode 100644 stubs/qmp-quit.c
 delete mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
 create mode 100755 tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
 create mode 100755 tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
 create mode 100644 tests/docker/dockerfiles/debian-toolchain.docker
 create mode 100644 tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
 create mode 100644 tests/tcg/nios2/Makefile.target

-- 
2.30.2


