Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3D343AFFE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:29:03 +0200 (CEST)
Received: from localhost ([::1]:39564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJhW-0007UA-J8
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbT-0000r6-EE
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:47 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbM-0007PS-F8
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:46 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 y205-20020a1c7dd6000000b0032cc8c2800fso1635627wmc.4
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1qjAWxrIgLW7ojat20kCv7SXb4Ty6YxEzSXQixJ0l7o=;
 b=pBHNuafOXK4WirdIm/lY9QjmR4gwzddBsWOQcdOfEertVB1dfQusHX9WPUd5siz61A
 XHpsJRU5Fk2x4e9GygGHaM9LeC3AFozyZKThJTVruotiuakbYq3lk3++teU8jjUhyzk2
 MMB8qRFk56mkPodHWhYFXaZxjJRHrntmKvJ28QeYTydxgrHZbYdIx1RQQ7R2hq0Liwye
 hzvwHhWiczo3FzvDOF8dFbaxBr7t1S8+uK20i37JQqJQorsh/IURjnA67KSejS4VPj8Z
 E+Gf+cmj14aiYx6a5kSx/i2XKxFVGPXJDiN+MPYIVURUIs0okIRk4d9DP02eoZjqpbDI
 XvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1qjAWxrIgLW7ojat20kCv7SXb4Ty6YxEzSXQixJ0l7o=;
 b=VQn7pJ+qixVVGS5PHSUhPTAk5BGwU1/AqXGOTaKOd1d1622PMjob3ujY9kYNAkraEm
 56y0w4omi0oVcxQnE24hTKAHIz86wrUgGU851UYgXNs6s0RZNThC69tI7pfzRwMLuCNi
 yWNmmX7ycPgoEn5wFm7momO7CW+CVy7U/1auNN2SHlSWTONhj85IEdhiJX6oLxkfOfqG
 dT/VnHzM8CUmGiAjCkd/ky5GB8zfhvW9lLIa6fAPpOegdC29udaGj8ynDxLH6tJnUFny
 NZcmiGKOv7D5kxqKThf+uNJhjBW6x/DZ0j3qtUJFDkMeCR3R++UErtxdXiixhez81hBs
 Rydg==
X-Gm-Message-State: AOAM533NB9FKUSs40qAWcLP2FIiybi1bpwbi56eqe95AKRrk3yXZeG2J
 8fPFZz7DkHYX+e3vo1Rtm9pcOFtWFopYzg==
X-Google-Smtp-Source: ABdhPJxagA0Dk/BDSLyvyJ8+DevRNhIr+2QP1BgK7Wn1JHDYQJCe1And/dzl7vLUsBFCHk+f2K8euw==
X-Received: by 2002:a05:600c:a05:: with SMTP id
 z5mr26306861wmp.73.1635243757605; 
 Tue, 26 Oct 2021 03:22:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b19sm184379wmj.9.2021.10.26.03.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:22:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BA3521FF96;
 Tue, 26 Oct 2021 11:22:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 00/28] testing, plugins and gdbstub for 6.2
Date: Tue, 26 Oct 2021 11:22:06 +0100
Message-Id: <20211026102234.3961636-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is an omnibus series covering a bunch of my maintainer trees. We
have updates to testing from Richard which expands the testing nios2
and microblaze along with an update to the hexagon images. There is
also a patch from Paolo that fixes a linux-user build issue that
hasn't been merged yet. The L2 updates for Mahmoud's cache modelling
plugin. A couple of gdbstub and plugin bug fixes and a new plugin for
code coverage (using drcov format). Finally I've started clearing out
the old broken TCG tracing support.

The following still need review:

- tests/tcg: remove duplicate EXTRA_RUNS
- tracing: excise the tcg related from tracetool
- tracing: remove the trace-tcg includes from the build
- tracing: remove TCG memory access tracing
- docs: remove references to TCG tracing
- plugins: try and make plugin_insn_append more ergonomic
- tests/plugins: extend the insn plugin to track opcode sizes
- tests/tcg: enable debian-nios2-cross for test building
- tests/docker: allow non-unique userid
- tests/docker: split PARTIAL into PARTIAL and VIRTUAL images

Alex Bennée (11):
  tests/docker: split PARTIAL into PARTIAL and VIRTUAL images
  tests/docker: allow non-unique userid
  tests/tcg: enable debian-nios2-cross for test building
  chardev: don't exit() straight away on C-a x
  tests/plugins: extend the insn plugin to track opcode sizes
  plugins: try and make plugin_insn_append more ergonomic
  docs: remove references to TCG tracing
  tracing: remove TCG memory access tracing
  tracing: remove the trace-tcg includes from the build
  tracing: excise the tcg related from tracetool
  tests/tcg: remove duplicate EXTRA_RUNS

Brian Cain (1):
  tests/docker: Update debian-hexagon-cross to a newer toolchain

Ivanov Arkady (2):
  plugins: add helper functions for coverage plugins
  contrib/plugins: add a drcov plugin

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
  tests/docker: Use apt build-dep in debian10
  tests/docker: Simplify debian-all-test-cross
  gitlab-ci: Remove special casing for hexagon testing
  tests/docker: Add debian-nios2-cross image
  tests/docker: Add debian-microblaze-cross image
  tests/tcg: Enable container_cross_cc for microblaze

 docs/about/removed-features.rst               |  13 +
 docs/devel/tcg-plugins.rst                    |  20 +-
 docs/devel/tracing.rst                        |  85 -----
 meson.build                                   |   6 -
 accel/tcg/atomic_template.h                   |  12 -
 include/exec/helper-gen.h                     |   2 -
 include/exec/helper-proto.h                   |   1 -
 include/exec/helper-tcg.h                     |   1 -
 include/exec/plugin-gen.h                     |  12 +-
 include/qemu/plugin.h                         |   7 +-
 include/qemu/qemu-plugin.h                    |  34 ++
 include/trace-tcg.h                           |   6 -
 accel/tcg/cputlb.c                            |   2 -
 accel/tcg/plugin-gen.c                        |   3 +-
 accel/tcg/translator.c                        |   2 +-
 accel/tcg/user-exec.c                         |  15 +-
 chardev/char-mux.c                            |   3 +-
 contrib/plugins/cache.c                       | 318 +++++++++++++-----
 contrib/plugins/drcov.c                       | 163 +++++++++
 gdbstub.c                                     |   8 +-
 plugins/api.c                                 |  46 +++
 stubs/qmp-quit.c                              |   8 +
 tcg/tcg-op.c                                  |   5 -
 tests/plugin/insn.c                           |  37 +-
 accel/tcg/atomic_common.c.inc                 |  20 --
 .gitlab-ci.d/buildtest.yml                    |   4 -
 .gitlab-ci.d/container-cross.yml              |  27 +-
 MAINTAINERS                                   |   4 +-
 contrib/plugins/Makefile                      |   1 +
 plugins/qemu-plugins.symbols                  |   4 +
 scripts/tracetool/__init__.py                 |  41 +--
 scripts/tracetool/format/tcg_h.py             |  83 -----
 scripts/tracetool/format/tcg_helper_c.py      |  79 -----
 scripts/tracetool/format/tcg_helper_h.py      |  48 ---
 .../tracetool/format/tcg_helper_wrapper_h.py  |  70 ----
 scripts/tracetool/vcpu.py                     |  14 +-
 stubs/meson.build                             |   1 +
 tests/docker/Makefile.include                 |  59 ++--
 tests/docker/docker.py                        |   4 +-
 .../dockerfiles/debian-all-test-cross.docker  |   5 -
 .../dockerfiles/debian-hexagon-cross.docker   |  45 +--
 .../build-toolchain.sh                        | 141 --------
 .../build-toolchain.sh                        |  88 +++++
 .../debian-nios2-cross.d/build-toolchain.sh   |  87 +++++
 .../dockerfiles/debian-toolchain.docker       |  36 ++
 tests/docker/dockerfiles/debian10.docker      |   9 +-
 tests/tcg/configure.sh                        |  26 +-
 tests/tcg/multiarch/Makefile.target           |  12 +-
 .../gdbstub/test-thread-breakpoint.py         |  60 ++++
 tests/tcg/nios2/Makefile.target               |  11 +
 trace-events                                  |  14 -
 trace/meson.build                             |  14 -
 52 files changed, 945 insertions(+), 871 deletions(-)
 delete mode 100644 include/trace-tcg.h
 create mode 100644 contrib/plugins/drcov.c
 create mode 100644 stubs/qmp-quit.c
 delete mode 100644 scripts/tracetool/format/tcg_h.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_c.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_h.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_wrapper_h.py
 delete mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
 create mode 100755 tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
 create mode 100755 tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
 create mode 100644 tests/docker/dockerfiles/debian-toolchain.docker
 create mode 100644 tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
 create mode 100644 tests/tcg/nios2/Makefile.target

-- 
2.30.2


