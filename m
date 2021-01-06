Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9392EBFE4
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 15:56:53 +0100 (CET)
Received: from localhost ([::1]:50278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxAF2-0006M7-4x
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 09:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxADK-0005Q6-CW
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 09:55:06 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxADI-0003hp-Ec
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 09:55:06 -0500
Received: by mail-wm1-x32b.google.com with SMTP id 3so2859324wmg.4
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 06:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oCs/GiaXJ8UfozctaprU1b+rmPCno9vm3HLWQZJ8y0k=;
 b=Vz32HWlwzOblbAGEmpLy2bBiQfaHbSiQgTTD7T/LsCpEf7XT78TMywjbRijKMjP6E7
 awlcks/zH8ZUr9vXnFFB0moQPj0OJ+csRx6p+hjYOV2uv/qm9bDvyymJBUQgo9/DvMi2
 0OzK9HX3t91n33cMsC5MsDw7xJbk6nHdXmnnLw5YNNwth6Dow7gj4JLDLpmy1G6BqS59
 tK7Laf7s0dp7zaygwpsKgdgx7gQDnAutWkU7Dns4PNBiUeklSiNl2BYbpreFlbP/Mvz6
 fmdTxcgEUpZu6wDe8cbM0CqdTkQpcEIbc2w9/wiaun8tTrEdMIw0KU9AvxcDLPG/HvjX
 l0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=oCs/GiaXJ8UfozctaprU1b+rmPCno9vm3HLWQZJ8y0k=;
 b=aNeK5y9Ej8JSGXg8l5oFxUHaPEweAewpfczzc225wVdw6sFrdWakWEPP4BYU/XwZM+
 jOlpb6R8OnHAHjusvhOnNFdsgSFWOT4/vZh/CI5auKTDxPBXfNXVBcJW3Oda0mwskwYN
 VgQMNzHl6KLznwMrAnpvRRM1koPIQ7Fr9TsszRBPh1e8qrrDmNl9h4hQZLT9pLK90z7l
 OOn3Thf1JGLlUBNE1cT7F5ZpEWLs5/h8H1SJxgbfqyl7Kow9B0JLFBSB4xZ6YhX9nffT
 QIJlb0VQ42IGn2eXqx9xA8zB5ApMlAnpc50dsdvXTK7InS7MWUxtDirNjsHUTYp6sMGj
 a28A==
X-Gm-Message-State: AOAM531jG0XGsvGmb76SQrGBl1grwEepFwXi/jclCexXMhRaQ6Bfmqwa
 /9ld+nY5LgvZbfQjgwqHo1pY8Ss2o1WaDg==
X-Google-Smtp-Source: ABdhPJwoMbNisKEsLpQB1WJ7P6gu/uHa3Z8kdpmF215EzAHXccc3/IdZ2Tj30SCSA9FG3UlnLzb/eQ==
X-Received: by 2002:a7b:c45a:: with SMTP id l26mr4034884wmi.91.1609944902470; 
 Wed, 06 Jan 2021 06:55:02 -0800 (PST)
Received: from avogadro.lan ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id s205sm3267770wmf.46.2021.01.06.06.55.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 06:55:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 00/52] Misc patches for 2020-12-21
Date: Wed,  6 Jan 2021 15:54:56 +0100
Message-Id: <20210106145459.413716-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

for you to fetch changes up to c8b2b7fed9850356f5d88bc7da2f1cefe57289bf:

  win32: drop fd registration to the main-loop on setting non-block (2021-01-06 10:21:20 +0100)

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

v2->v3: removed libssh conversion, limited lzo/snappy/lzfse for user-only builds
 
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

Paolo Bonzini (31):
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
 configure                                         | 756 +++++-----------------
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
 meson.build                                       | 410 +++++++++---
 meson_options.txt                                 |  47 +-
 migration/meson.build                             |   2 +-
 monitor/misc.c                                    |   1 -
 plugins/core.c                                    |  37 ++
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
 67 files changed, 1012 insertions(+), 874 deletions(-)
 create mode 100644 docs/devel/control-flow-integrity.rst
 rename {accel/tcg => include/exec}/translate-all.h (100%)
 create mode 100644 include/qemu/cacheflush.h
 create mode 100644 tests/qemu-iotests/common.env.in
 create mode 100644 util/cacheflush.c
-- 
2.29.2


