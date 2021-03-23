Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865B7346710
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:59:16 +0100 (CET)
Received: from localhost ([::1]:35900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlJD-0002bS-Jk
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHK-0006j1-DY
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:14 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:44634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHI-0002mZ-FO
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:14 -0400
Received: by mail-ej1-x62e.google.com with SMTP id e14so10027410ejz.11
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lG17dUe6KrUGdssdcJeSgbfxJTWtyIhnza+NNbtxAGM=;
 b=cNCxLih6DEEJdghVgeMGlp2jDK5pYTV+vmdQmzwk7S7TZ0WV21kCkfq7JhLucMzX+e
 uEDDSi5F2DzcIq+oSJS97OITmBrXvIHgsHbjYs25JjAd0osP3RZd8MATlEo6AAv4EdGN
 NbKfCcnjycrlGnrCkU2zLaY5hb/ctiDBi3wmo6M3IIQ3OLlsDUn46JPdEaACfBFT9Ej/
 wr9xhPAcO/zPywaLO7gsiHix6CYoLT4DrYymaTObPFSZiKCJ2QJln5PRHL6MJEyldSDP
 kOhmGEgcV+L+wkkeCZiFu/jQ+BpNuoKmg5m1fsx63bFBe6PjxXvMRyqiu2nA/2/DS+Su
 sWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lG17dUe6KrUGdssdcJeSgbfxJTWtyIhnza+NNbtxAGM=;
 b=Vx6jcNdgkbyXMvzj5RNfOgjXfLOsVmWLeDy+6dHkGn2xyB5q0aRn+8AumFp0JTfvIM
 /GZkyy+g21KocplfKTzgjoBTA1/MzbTL+yrmNsrbAPI10UUmdUrdFwsmCbD8eCUwCwV7
 PNRX3Z27HFfGEM/8qxuIBWckGCpZOyL9CPXUw3AGyex7EfmxN3VneEvmkMqevL9A9sNG
 gZoVBV2IKGXMUt8fRUIdTti5JBEI6t3BboaIYEWs6wl1je7BbM1s18/HI6Od7NU3bV8G
 WJ8CfHo0nFKyzCBcKPh4sTz98nSA7n1lDtgIqnn8KdnkBU/daNh/dqmHwzc8FMlJFFMV
 rBQg==
X-Gm-Message-State: AOAM532v64RwtpzlhE+bbv3vGyYypY4VJBWhNH6rYSWA+NwNRaPcTjYz
 yOfjoBrGR3K6hAzYxU2467gQyg==
X-Google-Smtp-Source: ABdhPJyHRJMNE9l5Cyhqyglbt08yYCvQAKQCdiOcPPp0JRzEBqUOrcJdKDssLI9eZaddsqX+9utbyA==
X-Received: by 2002:a17:906:fcd2:: with SMTP id
 qx18mr5622763ejb.327.1616518390250; 
 Tue, 23 Mar 2021 09:53:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id cf4sm13137124edb.19.2021.03.23.09.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:53:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A9ED1FF7E;
 Tue, 23 Mar 2021 16:53:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.0 v2 00/22] fixes for rc1 pre-PR (kernel-doc, semihosting,
 testing)
Date: Tue, 23 Mar 2021 16:52:46 +0000
Message-Id: <20210323165308.15244-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I've added a testing patch to extend the CFI times, Laurent's series
to fix the iotest regressions currently keeping the CI from going
green and an optimisation to the --enable-docs build to try and start
bringing the total CI time down a bit. rc0 is being tagged today so
I'll probably roll a PR from this later in the week in time for rc1.

The following are still need review:

 - tests/tcg: add HeapInfo checking to semihosting test

Alex Bennée (11):
  scripts/kernel-doc: strip QEMU_ from function definitions
  docs/devel: include the plugin API information from the headers
  docs/devel: expand style section of memory management
  tools/virtiofsd: include --socket-group in help
  semihosting: move semihosting tests to multiarch
  semihosting/arm-compat-semi: unify GET/SET_ARG helpers
  semihosting/arm-compat-semi: don't use SET_ARG to report SYS_HEAPINFO
  linux-user/riscv: initialise the TaskState heap/stack info
  tests/tcg: add HeapInfo checking to semihosting test
  gitlab: extend timeouts for CFI builds
  gitlab: default to not building the documentation

Eric Blake (2):
  utils: Tighter tests for qemu_strtosz
  utils: Work around mingw strto*l bug with 0x

Laurent Vivier (6):
  qdev: define list of archs with virtio-pci or virtio-ccw
  m68k: add the virtio devices aliases
  blockdev: with -drive if=virtio, use generic virtio-blk
  iotests: Revert "iotests: use -ccw on s390x for 040, 139, and 182"
  iotests: test m68k with the virt machine
  iotests: iothreads need ioeventfd

Thomas Huth (3):
  gitlab-ci.yml: Merge the trace-backend testing into other jobs
  configure: Don't use the __atomic_*_16 functions for testing 128-bit
    support
  cirrus.yml: Update the FreeBSD task to version 12.2

 docs/devel/style.rst                          |  46 +++--
 docs/devel/tcg-plugins.rst                    |   5 +
 configure                                     |   6 +-
 include/sysemu/arch_init.h                    |   9 +
 tests/tcg/aarch64/semicall.h                  |  18 ++
 tests/tcg/arm/semicall.h                      |  15 +-
 tests/tcg/riscv64/semicall.h                  |  22 +++
 blockdev.c                                    |   6 +-
 linux-user/riscv/cpu_loop.c                   |   5 +
 semihosting/arm-compat-semi.c                 |  62 +++----
 softmmu/qdev-monitor.c                        |  65 ++++---
 tests/tcg/arm/semihosting.c                   |  26 ---
 .../arm-compat-semi}/semiconsole.c            |   2 +
 .../multiarch/arm-compat-semi/semihosting.c   |  82 +++++++++
 tests/unit/test-cutils.c                      | 171 +++++++++++++++++-
 tools/virtiofsd/fuse_lowlevel.c               |   1 +
 util/cutils.c                                 |  33 +++-
 .cirrus.yml                                   |   7 +-
 .gitlab-ci.d/crossbuilds.yml                  |  15 +-
 .gitlab-ci.yml                                |  43 ++---
 MAINTAINERS                                   |   1 +
 scripts/kernel-doc                            |   3 +
 tests/qemu-iotests/040                        |   2 +-
 tests/qemu-iotests/051                        |  12 +-
 tests/qemu-iotests/051.out                    |   2 +-
 tests/qemu-iotests/051.pc.out                 |   2 +-
 tests/qemu-iotests/068                        |   4 +-
 tests/qemu-iotests/093                        |   3 +-
 tests/qemu-iotests/127                        |   3 +-
 tests/qemu-iotests/139                        |   9 +-
 tests/qemu-iotests/182                        |  13 +-
 tests/qemu-iotests/238                        |   4 +-
 tests/qemu-iotests/240                        |  10 +-
 tests/qemu-iotests/256                        |   6 +-
 tests/qemu-iotests/257                        |   4 +-
 tests/qemu-iotests/307                        |   4 +-
 tests/qemu-iotests/common.rc                  |  13 ++
 tests/qemu-iotests/iotests.py                 |  10 +-
 tests/qemu-iotests/testenv.py                 |   1 +
 tests/tcg/Makefile.target                     |   3 +
 tests/tcg/aarch64/Makefile.target             |  18 --
 tests/tcg/arm/Makefile.target                 |  22 +--
 tests/tcg/multiarch/Makefile.target           |  31 ++++
 43 files changed, 548 insertions(+), 271 deletions(-)
 create mode 100644 tests/tcg/aarch64/semicall.h
 create mode 100644 tests/tcg/riscv64/semicall.h
 delete mode 100644 tests/tcg/arm/semihosting.c
 rename tests/tcg/{arm => multiarch/arm-compat-semi}/semiconsole.c (93%)
 create mode 100644 tests/tcg/multiarch/arm-compat-semi/semihosting.c

-- 
2.20.1


