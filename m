Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B30B2E9782
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 15:43:58 +0100 (CET)
Received: from localhost ([::1]:59024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwR5R-0006Nf-Mp
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 09:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kwR4J-0005nO-Hy
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:42:47 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kwR4H-0004Lb-CX
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:42:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id y23so19555879wmi.1
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 06:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=16i9d4d7aU1uhBdlUVeJW7tR/LZGwnQhkEcP2yoQyzI=;
 b=GfD5D4sRj4/14l7zgyjUxm/84HeQBgiG6FoijRxmZbHuQAT+h6d3CcojyLR+euPSEC
 efQcvmxkRMM53eGmKjL1lW+BOriIJjEqvCdCfAMWbxJW/6CDqwHcYDvHxvVtPykvg+5M
 HC0KTWZ9hbjvoOXF9nHF6Btyxe1MGMpn4XNBrnsvFeYimXSisZ+ZPuNzDB0axX8cniVs
 gnN5YQAqhovvLDY0PzAGQTC7DIwUxxBbHSlGH86yDksALCP24zSCfzQnOEQev1uecv9J
 xBfHYAVFGvCnrM1DD4ADA6/5cfSaGCbF0aPDIMPrvUQBaU++xv42eefRyyyZSdW8vRy2
 qfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=16i9d4d7aU1uhBdlUVeJW7tR/LZGwnQhkEcP2yoQyzI=;
 b=XO151lqMFjtgiCiNwqGO+zl7Rlsd9ZnXqMhsyTm6Z1/0+7Oey7MKDvDZVPeH17/gIo
 6lStEbZj8UZQYxJ5zWX8tMkRd8Bc+JGILVYe7Ulep98e0AFMjnLN62KpAAy1mFfW9lp2
 Waden06AsW2JM78PtA/hV5hSW3P5WyLJnN5P4Vy7i9oiAoOCBabzQUnZsZgrSUYTP5JX
 wN+3Kl5JrKO6rOLv/Mz9bMm1CoJP3rz7Owpm87rCZlAo5f5ODJ8EXLysSxq3ZpobEBSq
 l7dJ1psEDPH48wWGzacFc2HZ8OF2+S2H6629pJ/1uGQc5N9ZjPCLfxB9BnR/fm4H31Qi
 KaiQ==
X-Gm-Message-State: AOAM533Sj8d5Pv5oW+PaWD1rKzBNJ1oWFXR9GYvUbdRZMHed+aI/jloa
 f5R/oUPNG9/hVcJ+k6YGQA8K37eOA389dw==
X-Google-Smtp-Source: ABdhPJzN5suDCPxawVVV71QA5sHB0q37FIT1sAemOP12gChpM7SrAwIHzslMY05F3TtDo5GrcIIdKw==
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr28003578wmi.45.1609771363271; 
 Mon, 04 Jan 2021 06:42:43 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v11sm90331029wrt.25.2021.01.04.06.42.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 06:42:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/53] Misc patches for 2020-12-21
Date: Mon,  4 Jan 2021 15:42:41 +0100
Message-Id: <20210104144241.343186-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 41192db338588051f21501abc13743e62b0a5605:

  Merge remote-tracking branch 'remotes/ehabkost-gl/tags/machine-next-pull-request' into staging (2021-01-01 22:57:15 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to bac87e979fcca9f884e1c9190132c51d99a86984:

  win32: drop fd registration to the main-loop on setting non-block (2021-01-02 21:03:38 +0100)

----------------------------------------------------------------
From Alex's pull request:
* improve cross-build KVM coverage
* new --without-default-features configure flag
* add __repr__ for ConsoleSocket for debugging
* build tcg tests with -Werror
* test 32 bit builds with fedora
* remove last traces of debian9
* hotfix for centos8 powertools repo

* Move lots of feature detection code to meson (Alex, myself)
* CFI and LTO support (Daniele)
* test-char dangling pointer (Eduardo)
* Build system and win32 fixes (Marc-André)
* Initialization fixes (myself)
* TCG include cleanup (Richard, myself)
* x86 'int N' fix (Peter)

----------------------------------------------------------------

For v2, I just dropped the 0.55->0.56 upgrade and will include it later.
The remaining patches are the same as before.

Paolo

Alex Bennée (7):
      gitlab: include aarch64-softmmu and ppc64-softmmu cross-system-build
      configure: move gettext detection to meson.build
      configure: add --without-default-features
      python: add __repr__ to ConsoleSocket to aid debugging
      gitlab: move --without-default-devices build from Travis
      gitlab: add --without-default-features build
      tests/tcg: build tests with -Werror

Daniel P. Berrangé (1):
      tests: update for rename of CentOS8 PowerTools repo

Daniele Buono (5):
      configure,meson: add option to enable LTO
      cfi: Initial support for cfi-icall in QEMU
      check-block: enable iotests with cfi-icall
      configure,meson: support Control-Flow Integrity
      docs: Add CFI Documentation

Eduardo Habkost (2):
      test-char: Destroy chardev correctly at char_file_test_internal()
      qom: Assert that objects being destroyed have no parent

Marc-André Lureau (2):
      build-sys: fix -static linking of libvhost-user
      win32: drop fd registration to the main-loop on setting non-block

Paolo Bonzini (32):
      configure: document --without-default-{features,devices}
      vl: initialize displays _after_ exiting preconfiguration
      remove TCG includes from common code
      trace: do not include TCG helper tracepoints in no-TCG builds
      Makefile: add dummy target for build.ninja dependencies
      meson: fix detection of curses with pkgconfig
      meson: use pkg-config method for libudev
      meson: use dependency to gate block modules
      meson: cleanup Kconfig.host handling
      configure: remove useless code to check for Xen PCI passthrough
      configure: remove variable bogus_os
      configure: accept --enable-slirp
      configure: remove CONFIG_FILEVERSION and CONFIG_PRODUCTVERSION
      brlapi: convert to meson
      curl: remove compatibility code, require 7.29.0
      curl: convert to meson
      glusterfs: convert to meson
      bzip2: convert to meson
      libiscsi: convert to meson
      libnfs: convert to meson
      libssh: convert to meson
      rbd: convert to meson
      lzo: convert to meson
      snappy: convert to meson
      lzfse: convert to meson
      zstd: convert to meson
      seccomp: convert to meson
      virtfs: convert to meson
      cap_ng: convert to meson
      libattr: convert to meson
      meson.build: convert --with-default-devices to meson
      configure: move tests/qemu-iotests/common.env generation to meson

Peter Maydell (1):
      target/i386: Check privilege level for protected mode 'int N' task gate

Richard Henderson (1):
      util: Extract flush_icache_range to cacheflush.c

Thomas Huth (2):
      gitlab-CI: Test 32-bit builds with the fedora-i386-cross container
      tests/docker: Remove the remainders of debian9 containers from the Makefile

 .gitlab-ci.d/crossbuilds.yml                      |  22 +-
 .gitlab-ci.yml                                    |  14 +
 .travis.yml                                       |   8 -
 MAINTAINERS                                       |   2 +
 Makefile                                          |   1 +
 accel/Kconfig                                     |   9 +
 accel/stubs/tcg-stub.c                            |   1 -
 accel/tcg/cpu-exec.c                              |  11 +
 accel/tcg/cputlb.c                                |   2 +-
 accel/tcg/translate-all.c                         |   2 +-
 accel/tcg/user-exec.c                             |   2 +-
 block/curl.c                                      |  28 -
 block/meson.build                                 |  22 +-
 chardev/meson.build                               |   2 +-
 configure                                         | 798 +++++-----------------
 contrib/elf2dmp/meson.build                       |   2 +-
 contrib/vhost-user-scsi/meson.build               |   2 +-
 cpu.c                                             |   2 +-
 docs/devel/control-flow-integrity.rst             | 137 ++++
 docs/devel/index.rst                              |   5 +-
 docs/devel/kconfig.rst                            |  19 +-
 hw/i386/kvmvapic.c                                |   1 -
 {accel/tcg => include/exec}/translate-all.h       |   0
 include/qemu/cacheflush.h                         |  24 +
 include/qemu/compiler.h                           |  11 +
 meson.build                                       | 430 +++++++++---
 meson_options.txt                                 |  49 +-
 migration/meson.build                             |   2 +-
 monitor/misc.c                                    |   1 -
 plugins/core.c                                    |  37 +
 plugins/loader.c                                  |   7 +
 po/meson.build                                    |   2 +-
 python/qemu/console_socket.py                     |   7 +
 qom/object.c                                      |   1 +
 softmmu/meson.build                               |   2 +-
 softmmu/physmem.c                                 |   4 +-
 softmmu/qemu-seccomp.c                            |   2 -
 softmmu/vl.c                                      |   2 +-
 target/i386/tcg/seg_helper.c                      |  35 +-
 tcg/aarch64/tcg-target.h                          |   5 -
 tcg/arm/tcg-target.h                              |   5 -
 tcg/i386/tcg-target.h                             |   4 -
 tcg/mips/tcg-target.h                             |  11 -
 tcg/ppc/tcg-target.c.inc                          |  22 -
 tcg/ppc/tcg-target.h                              |   1 -
 tcg/riscv/tcg-target.h                            |   5 -
 tcg/s390/tcg-target.h                             |   4 -
 tcg/sparc/tcg-target.h                            |   8 -
 tcg/tcg.c                                         |   1 +
 tcg/tci.c                                         |   7 +
 tcg/tci/tcg-target.h                              |   4 -
 tests/check-block.sh                              |  18 +-
 tests/docker/Makefile.include                     |   6 +-
 tests/docker/dockerfiles/centos8.docker           |   5 +-
 tests/docker/dockerfiles/fedora-i386-cross.docker |  18 +-
 tests/qemu-iotests/common.env.in                  |   3 +
 tests/qemu-iotests/meson.build                    |   3 +
 tests/tcg/Makefile.target                         |   2 +-
 tests/test-char.c                                 |   2 +-
 tools/meson.build                                 |   6 +-
 trace/meson.build                                 |   2 +-
 util/cacheflush.c                                 |  71 ++
 util/main-loop.c                                  |  11 +
 util/meson.build                                  |   2 +-
 util/oslib-posix.c                                |  11 +
 util/oslib-win32.c                                |   1 -
 version.rc                                        |   4 +-
 67 files changed, 1027 insertions(+), 923 deletions(-)
 create mode 100644 docs/devel/control-flow-integrity.rst
 rename {accel/tcg => include/exec}/translate-all.h (100%)
 create mode 100644 include/qemu/cacheflush.h
 create mode 100644 tests/qemu-iotests/common.env.in
 create mode 100644 util/cacheflush.c
-- 
2.29.2

