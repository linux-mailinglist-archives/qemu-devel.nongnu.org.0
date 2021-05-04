Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339F2372877
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:08:52 +0200 (CEST)
Received: from localhost ([::1]:49542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrz1-0000Sn-4y
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrst-0002Md-0k
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:31 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrsq-00032j-WC
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:30 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a4so8728577wrr.2
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q/+qwTC8zNgx+d+hVTlEWCEVVWE5ZQZzlzxGFpmvz6U=;
 b=DQUkHP7gqU5UKUsQDhqYhOWl+mKeDG1DBRmKMBIzga8vxf5NMm7xpaaBNAhRQmfpZG
 4qDayEuQHFSeKdTjFXHBMTPP1xHQCPvC3VeVYCwtViaBNJvIIJSWaWecy2xwuOgXYV6+
 rTN8Tmpz+X6HpPAbL9lHLD5nY5V9KhmvL69di58A9TPkI5Ls9z0WtzWDQMjbzEizZa0z
 A8gb6QNYcQIKYKTr3Av2pXoG+PbxWg5LGx/uiWNIe1wUP4DwNPDkCnIuB4mFFb1GeVH4
 WpO4MnziliSTROda7MVGNFneabo4xrX6k78mfaRQqW9j1K6Sv4h3YYM1+FIqFem4Aso6
 DXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q/+qwTC8zNgx+d+hVTlEWCEVVWE5ZQZzlzxGFpmvz6U=;
 b=KPoK5ycnqeL7PIQVZneizWIeBjxbweCPL8xkIJkhLH3ypIlvPyrOIIrx29of+vv1fK
 wp4pM36BSbLKh+420He7eX/tTx3sEd8GeY9+YUjcmG/GiLwDhRsncUvvm/5uG5ZffYKX
 tAiAm79xJ9PREh6m/6rMj5S/LGqA3XWd2ndwN1cyTTIWNLvVYuKMU4QoSKF8tT/+Wy5C
 S0EaysRCutP8B+36YZt106sBsFuQJaJ0b58jHaA1n7FPQTZS/qsCO9EsN4R/0wdecocj
 Xjt2Y4ufMRhZxRVkWyNZNGsBcMqkwoJuNqLwVpTyGIqOCb2X9z1s/bdSzT3H0jTvIEZF
 D+Uw==
X-Gm-Message-State: AOAM533F8lEp/HXwtn6ecl+G4xmjIa+xLJHRwabadF6XpJ93vyDjtwAJ
 4z09r6QeBu1XpRRDiNkzD/rAjw==
X-Google-Smtp-Source: ABdhPJyeXszJTkaE1lSZh/Ds1o9gCoB+BHPpdPFodSw1zu71wzOIp7W9PHhf3mDXIi4OBTFjU2pPlg==
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr21099627wry.364.1620122547468; 
 Tue, 04 May 2021 03:02:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g12sm1982970wmh.24.2021.05.04.03.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:02:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8090F1FF7E;
 Tue,  4 May 2021 11:02:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 00/30] testing/next (hexagon, tricore, ppc, signals,
 cirrus)
Date: Tue,  4 May 2021 11:01:53 +0100
Message-Id: <20210504100223.25427-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

Now that the tree is open time to start the testing updates again.
I've added another tweak to configure I found while testing on non-x86
boxen. There are also a few fixes for an errant file that got added
with the tricore tests and a fix rth pointed out that meant hexagon
wasn't actually running it's tests. The signal smasher test which was
used to find the s390x issue is now included although still disabled
for sparc/alpha while their fixes are in flight.

The following remain un-reviewed:

 - configure: use cc, not host_cc to set cross_cc for build arch
 - tests/tcg: add a multiarch signals test to stress test signal delivery
 - tests/tcg: don't iterate through other arch compilers

Alessandro Di Federico (2):
  docker: Add Hexagon image
  tests/tcg: Use Hexagon Docker image

Alex Bennée (8):
  tests/docker: fix copying of executable in "update"
  tests/docker: make executable an optional argument to "update"
  tests/docker: allow "update" to add the current user
  tests/docker: add "fetch" sub-command
  gitlab: add build-user-hexagon test
  tests/tcg: don't iterate through other arch compilers
  tests/tcg: add a multiarch signals test to stress test signal delivery
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
 tests/tcg/tricore/macros.h                    | 129 ++++++++++++
 hw/tricore/tricore_testboard.c                |   8 +
 hw/tricore/tricore_testdevice.c               |  82 ++++++++
 tests/tcg/multiarch/signals.c                 | 149 +++++++++++++
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
 .../dockerfiles/debian-hexagon-cross.docker   |  44 ++++
 .../build-toolchain.sh                        | 141 +++++++++++++
 .../dockerfiles/debian-powerpc-cross.docker   |  12 --
 .../debian-powerpc-test-cross.docker          |  17 ++
 .../dockerfiles/debian-ppc64-cross.docker     |  11 -
 tests/docker/dockerfiles/fedora.docker        |   1 +
 tests/tcg/Makefile.qemu                       |  17 ++
 tests/tcg/Makefile.target                     |   5 +-
 tests/tcg/alpha/Makefile.target               |   7 +
 tests/tcg/configure.sh                        | 196 +++++++++---------
 tests/tcg/multiarch/Makefile.target           |   2 +
 tests/tcg/ppc64/Makefile.target               |  13 ++
 tests/tcg/ppc64le/Makefile.target             |  13 ++
 tests/tcg/sparc64/Makefile.target             |   7 +
 tests/tcg/tricore/Makefile.softmmu-target     |  26 +++
 tests/tcg/tricore/link.ld                     |  60 ++++++
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
 43 files changed, 1083 insertions(+), 163 deletions(-)
 create mode 100644 include/hw/tricore/tricore_testdevice.h
 create mode 100644 tests/tcg/tricore/macros.h
 create mode 100644 hw/tricore/tricore_testdevice.c
 create mode 100644 tests/tcg/multiarch/signals.c
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


