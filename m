Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BCC4452D8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 13:18:34 +0100 (CET)
Received: from localhost ([::1]:35782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mibhR-0001Be-8d
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 08:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mibff-0000Rm-DW
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 08:16:43 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mibfa-0002mi-MO
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 08:16:42 -0400
Received: by mail-wm1-x330.google.com with SMTP id 71so4333021wma.4
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 05:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PGBmZGoyNB+02Dc+PQGeRv0jiCaEWHRva5ePRUtTz0c=;
 b=hm7AwNL/AuGuFKC+UJHADKUhGFSdc5z8ZofFrSbslhRG+4vyTQTcLA77fffEdf9QHj
 HBxxgtyMeo85oYvx8EsgT445YJWCi/02+QGH8xl+fo87tYM/IGdx8k/PtfvxIrXG8dR2
 0Yy6F+H/48HJMZutZAEa6LTSSKCoL0WnHDHL4R3xffd7/cPnRy4JpX/bapixIXTlLH/H
 33uPXvyW7wSIrYkAG9d0HaetCw3KQS6MpjivXWFwP2BJ1+FbI1bM21XQ5dcsUmo3lWgO
 X2a4MXe0sgbq5rKwOjBS9vOrAPeRN6YIz7wGYY1/ShfzAsPlzUZnX1X+7selurLFMm+v
 hCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PGBmZGoyNB+02Dc+PQGeRv0jiCaEWHRva5ePRUtTz0c=;
 b=YJJ7/k6UlxTGsbnswIrMAtT3PwkmXvIq4RHohUboI32OUeNaJeVdWYxnQwe9C9IC28
 17aK1fpwNIXqoKC1wlVh8nMOE8RAj1ZWKv/pDDf2tC6jaHLXEALCQYiCqlKugqcMFq+i
 mQMMtq+ijZClWcJ+ayM21te/WVEm1w+Vrpz9qlRxXcjW5pBO7voeHRoLwohPopIZsYB9
 gY0lwmy8Hx/pk3UJZRVh/hLGj/EmfkqtOM4ZHa4p0uNOGTH1mojU8ZB3H3Wg83MEMh7z
 2VRYLX6BTfGO2ddaND20bHgSk3hALLjmIAQQDtIuMzrt9ZrDaC/88et0ohx6bVdHjWik
 yv0A==
X-Gm-Message-State: AOAM530NpvoAMjlLz7JxOlSomsqf5dH1net2/lsOofniQiRP+jm1PdDk
 NkubtQ9EDedxFU3LeP386EttrA==
X-Google-Smtp-Source: ABdhPJyztkCLSviYs8Z3uW8XOeX7I/C+mgYVSH8hCeAGInidWfve9W9bMSS+85fobVZdaXzWlXrCkA==
X-Received: by 2002:a05:600c:3586:: with SMTP id
 p6mr17057972wmq.34.1636028196226; 
 Thu, 04 Nov 2021 05:16:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l11sm4854920wrp.61.2021.11.04.05.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 05:16:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 731C41FF96;
 Thu,  4 Nov 2021 12:16:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL for 6.2 v2 00/19] testing, plugin and gdbstub updates
Date: Thu,  4 Nov 2021 12:16:34 +0000
Message-Id: <20211104121634.900434-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

v2, dropped the hexagon toolchain updates which seem to be busted.

The following changes since commit b1fd92137e4d485adeec8e9f292f928ff335b76c:

  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2021-11-03 13:07:30 -0400)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-for-6.2-041121-2

for you to fetch changes up to b31b3fd0c0e17b95b9b0e05e0d67d0cd3ca081da:

  tests/vm/openbsd: Update to release 7.0 (2021-11-04 10:32:01 +0000)

----------------------------------------------------------------
Testing, gdbstub and plugin updates for 6.2

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

Richard Henderson (4):
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
 MAINTAINERS                                        |   3 +
 stubs/meson.build                                  |   1 +
 tests/docker/Makefile.include                      |  39 ++-
 .../debian-microblaze-cross.d/build-toolchain.sh   |  88 ++++++
 .../debian-nios2-cross.d/build-toolchain.sh        |  87 ++++++
 tests/docker/dockerfiles/debian-toolchain.docker   |  36 +++
 tests/tcg/configure.sh                             |  26 +-
 tests/tcg/multiarch/Makefile.target                |  13 +-
 .../multiarch/gdbstub/test-thread-breakpoint.py    |  60 ++++
 tests/tcg/nios2/Makefile.target                    |  11 +
 tests/tcg/sh4/Makefile.target                      |   6 +
 tests/vm/openbsd                                   |   7 +-
 23 files changed, 670 insertions(+), 127 deletions(-)
 create mode 100644 stubs/qmp-quit.c
 create mode 100755 tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
 create mode 100755 tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
 create mode 100644 tests/docker/dockerfiles/debian-toolchain.docker
 create mode 100644 tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
 create mode 100644 tests/tcg/nios2/Makefile.target

-- 
2.30.2


