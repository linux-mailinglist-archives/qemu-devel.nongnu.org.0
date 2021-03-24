Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B3B347AC6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:33:55 +0100 (CET)
Received: from localhost ([::1]:47804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4a2-0007p5-GL
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wh-0006DB-1o
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:27 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4We-0007GH-RV
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:26 -0400
Received: by mail-wr1-x436.google.com with SMTP id j18so24670590wra.2
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TjBXCHtY+wXOv15xAY72qqIcU9z8qt/ix/GYAWPQ2ic=;
 b=jeVRYvs8Mdeiu9o36Z45/yhPCj9K98EVVRfnRcidGQAWqoffRxj7gfVJkyebM8hhg6
 KeOfLYDpSE8mxS6An8R8hO7MOuts+fT33XeYu8Z1rxE6eO5pkv1fY6nDoSjpTjkNFTVr
 yxHw6wXuxrieKQyBc6wFQKlepVXH7TmdAHRgAsOI45mNDaPosatDzFa4wcE2UIs53cmf
 EHYECXUdD14ApmC48/mlMZdWMH0DzVuiI7WmE6s+oq2eBWiL2hGe450iYIO06b97BYzp
 1HioTQTbNBHl3a3WH6VUiol0UJ20xfMppZYsrBMEvwXV1xfy8NG/tcblLMYLf6vrvyFT
 zyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TjBXCHtY+wXOv15xAY72qqIcU9z8qt/ix/GYAWPQ2ic=;
 b=HiiF4Aqea15coY/Aw4AAczWg98HgCqXs2Dq7vFfyRsu95/Rhl+72M/oV6Rb42rCgkN
 QZOqXeljdLv8rVG8bdzwpBYku/AXYXa8nYbMxtDZVv4CQF27GW0C/VqAy5QeO3SS8UoZ
 ha9RRqH1JDZU63+y0omImhzRwQdgv+oGdzMAllKXA3zpX9TSCFu3+dWnXIg3rHdUTqGL
 zkLyk9aJb1MeNjidvQNTnWXVuvIe3yVTN8gHkVDk6V75SK8NQSjIUAXByR+tNhnlcYLz
 Dka7p9ZT9DMN+4ljjbD3fUXtrXiLb4EyijzBhiZ/yAfrVewUl3iUUjecI394MdqLoj3P
 49kg==
X-Gm-Message-State: AOAM533ClUPRAKUz/myV8sdLPbtRNHeR+bn+PW6FgSon+ZGBa3YAVqXD
 qCXFGu/fcgNeLVLRgB7YRXTqpg==
X-Google-Smtp-Source: ABdhPJyEi5dsTcq8XEzA1z5ECQJmdotJanakSdPLyiVGZgZmeQS3/fydDdi3Db4PY0zcfOPEua5NxQ==
X-Received: by 2002:adf:fb05:: with SMTP id c5mr3948512wrr.302.1616596223178; 
 Wed, 24 Mar 2021 07:30:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j12sm3572781wrx.59.2021.03.24.07.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:30:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B06381FF7E;
 Wed, 24 Mar 2021 14:30:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL for 6.0 00/22] various fixes (kernel-doc, semihosting, testing)
Date: Wed, 24 Mar 2021 14:29:59 +0000
Message-Id: <20210324143021.8560-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

The following changes since commit 01874b15d36e3f9a3506c47941a92ccf8d8bed98:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20210323' into staging (2021-03-24 11:22:08 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-6.0-rc0-fixed-240321-1

for you to fetch changes up to a9eb2df27f117bbac9f370bf8cb79532005f19c2:

  gitlab: default to not building the documentation (2021-03-24 14:25:48 +0000)

----------------------------------------------------------------
Various fixes for 6.0:

  - include kernel-doc API reference for plugins
  - fix semihosting SYS_HEAPINFO
  - various tweaks to improve CI runtime
  - more stroz fixes
  - fix iotest CI regressions

----------------------------------------------------------------
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
      configure: Don't use the __atomic_*_16 functions for testing 128-bit support
      cirrus.yml: Update the FreeBSD task to version 12.2

 docs/devel/style.rst                               |  46 ++++--
 docs/devel/tcg-plugins.rst                         |   5 +
 configure                                          |   6 +-
 include/sysemu/arch_init.h                         |   9 ++
 tests/tcg/aarch64/semicall.h                       |  18 +++
 tests/tcg/arm/semicall.h                           |  15 +-
 tests/tcg/riscv64/semicall.h                       |  22 +++
 blockdev.c                                         |   6 +-
 linux-user/riscv/cpu_loop.c                        |   5 +
 semihosting/arm-compat-semi.c                      |  62 +++-----
 softmmu/qdev-monitor.c                             |  65 ++++----
 tests/tcg/arm/semihosting.c                        |  26 ----
 .../arm-compat-semi}/semiconsole.c                 |   2 +
 tests/tcg/multiarch/arm-compat-semi/semihosting.c  |  82 ++++++++++
 tests/unit/test-cutils.c                           | 171 ++++++++++++++++++++-
 tools/virtiofsd/fuse_lowlevel.c                    |   1 +
 util/cutils.c                                      |  33 ++--
 .cirrus.yml                                        |   7 +-
 .gitlab-ci.d/crossbuilds.yml                       |  15 +-
 .gitlab-ci.yml                                     |  43 ++----
 MAINTAINERS                                        |   1 +
 scripts/kernel-doc                                 |   3 +
 tests/qemu-iotests/040                             |   2 +-
 tests/qemu-iotests/051                             |  12 +-
 tests/qemu-iotests/051.out                         |   2 +-
 tests/qemu-iotests/051.pc.out                      |   2 +-
 tests/qemu-iotests/068                             |   4 +-
 tests/qemu-iotests/093                             |   3 +-
 tests/qemu-iotests/127                             |   3 +-
 tests/qemu-iotests/139                             |   9 +-
 tests/qemu-iotests/182                             |  13 +-
 tests/qemu-iotests/238                             |   4 +-
 tests/qemu-iotests/240                             |  10 +-
 tests/qemu-iotests/256                             |   6 +-
 tests/qemu-iotests/257                             |   4 +-
 tests/qemu-iotests/307                             |   4 +-
 tests/qemu-iotests/common.rc                       |  13 ++
 tests/qemu-iotests/iotests.py                      |  10 +-
 tests/qemu-iotests/testenv.py                      |   1 +
 tests/tcg/Makefile.target                          |   3 +
 tests/tcg/aarch64/Makefile.target                  |  18 ---
 tests/tcg/arm/Makefile.target                      |  22 ++-
 tests/tcg/multiarch/Makefile.target                |  31 ++++
 43 files changed, 548 insertions(+), 271 deletions(-)
 create mode 100644 tests/tcg/aarch64/semicall.h
 create mode 100644 tests/tcg/riscv64/semicall.h
 delete mode 100644 tests/tcg/arm/semihosting.c
 rename tests/tcg/{arm => multiarch/arm-compat-semi}/semiconsole.c (93%)
 create mode 100644 tests/tcg/multiarch/arm-compat-semi/semihosting.c

-- 
2.20.1


