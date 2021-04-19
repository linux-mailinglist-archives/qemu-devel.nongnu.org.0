Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380BA364682
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 16:57:26 +0200 (CEST)
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVL2-0004gJ-TU
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 10:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIO-0002yd-I0
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:40 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIM-0006rl-My
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:40 -0400
Received: by mail-wr1-x430.google.com with SMTP id h4so25334347wrt.12
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dZOeTxdPuwy8HJl5kf8O3xEO7xibb3lbAKtiwiUZ/kg=;
 b=JYdEu5Np7YQOO3F+o5QoIvrrNl1J/xhQHQ9Z/kg2UogkYP6U9rOB5OfSH33lM/EZyR
 xq1GqjiPuLwqVZ6tTRCyQOcDpcRJ1q72CnwgJjXBgqxVonsaEbaN2/nljJ3pwhMpJkfE
 Bd/wA9Xt3ypirP8rIE9kouphqOslSThbmygw9vrEFsne5MCQ8YCkAhK2S6CHIkVsoTWB
 uYqQBMhr46ARZPfWwF0OE5O4SiDobNSHFUxJCuyjPM0LMYqjLFXbTBQ5hEPbgEOHpelf
 0SBcgwU2fv2mMuLmkDHsGOPhzapdpSz2GdsodfPSaopWpBxs7wm7TFZt/6fvrx7Xgh4D
 n7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dZOeTxdPuwy8HJl5kf8O3xEO7xibb3lbAKtiwiUZ/kg=;
 b=kKtEDqqyMLiEqkPwoDS4IlDUquh+/kSDE9I1lFcNlYia9nu0v44x70IK/gf2NuI4Qu
 +auBF8MEUNEaxNoaUKyrUxH5aBgrbABV7i/HwJTJyi8XIVL5zGMHoTEUGr6Z68rRAweR
 JMmm1E5l+XDVXN1zy4co3k31z6+xq/556jP99cs9uo8xTE60/b+3RIcI+xrzWAZAX/PB
 byvAfMYhCjPjwSEJ8PAUcGTbY7tgu0ojEw/crvctGwS4iEnmA+Jfbe6jhr2bkL16pc0x
 nMwvpzlItdMYcOtr8G51AUoxtwvZD5VpAc7cA22lJuUBy6BIyWPk3GyJpuIdrwfpCC6I
 8euw==
X-Gm-Message-State: AOAM5305JN6cFzvPKq79LfRBxIYqKIBk7lGtLmb+bdT5ov0CyBlhGOth
 nOK/CovT3dcMRDanrX1Bwv9o/g==
X-Google-Smtp-Source: ABdhPJwPh//y0vw4doQwKZXap5ZnxoayYjs09BSyA531g5FJSmplo9wiSLEHNsZcEjqVGM/UsEzAug==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr15028482wru.305.1618844077224; 
 Mon, 19 Apr 2021 07:54:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h10sm8891026wrt.40.2021.04.19.07.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 07:54:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 964641FF7E;
 Mon, 19 Apr 2021 15:54:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for post 6.0 v1 00/25] testing/next (hexagon/tricore/test cc)
Date: Mon, 19 Apr 2021 15:54:10 +0100
Message-Id: <20210419145435.14083-1-alex.bennee@linaro.org>
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

This is the current state of my testing tree in preparation for the
opening of the flood gates once 6.0 is out of the door. It includes
fixes for 3 areas:

  - updates to the docker scripting to support pre-built images,
    specifically for hexagon

  - some tweaks to tcg/configure.sh to deal with disabling local
    compiler usage.

  - a series of patches adding support for Tricore TCG tests

I'm also carrying Greg's tweak to checkpatch. Currently the following
have not got reviews:
  
 - tests/tcg: don't iterate through other arch compilers
 - docker: Add Hexagon image
 - tests/docker: add "fetch" sub-command
 - tests/docker: allow "update" to add the current user
 - tests/docker: make executable an optional argument to "update"
 - tests/docker: fix copying of executable in "update"

Alessandro Di Federico (2):
  docker: Add Hexagon image
  tests/tcg: Use Hexagon Docker image

Alex Bennée (6):
  tests/docker: fix copying of executable in "update"
  tests/docker: make executable an optional argument to "update"
  tests/docker: allow "update" to add the current user
  tests/docker: add "fetch" sub-command
  gitlab: add build-user-hexagon test
  tests/tcg: don't iterate through other arch compilers

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

 configure                                     |   1 +
 include/hw/tricore/tricore_testdevice.h       |  38 ++++
 tests/tcg/tricore/macros.h                    | 129 +++++++++++++
 hw/tricore/tricore_testboard.c                |   8 +
 hw/tricore/tricore_testdevice.c               |  82 ++++++++
 .gitlab-ci.yml                                |  11 ++
 MAINTAINERS                                   |   3 +
 hw/tricore/meson.build                        |   1 +
 scripts/checkpatch.pl                         |   1 +
 tests/docker/Makefile.include                 |  24 ++-
 tests/docker/docker.py                        |  78 +++++---
 tests/docker/dockerfiles/alpine.docker        |   1 +
 tests/docker/dockerfiles/centos8.docker       |   1 +
 .../dockerfiles/debian-hexagon-cross.docker   |  44 +++++
 .../build-toolchain.sh                        | 141 ++++++++++++++
 tests/docker/dockerfiles/fedora.docker        |   1 +
 tests/tcg/Makefile.qemu                       |  15 ++
 tests/tcg/Makefile.target                     |   5 +-
 tests/tcg/configure.sh                        | 175 +++++++++---------
 tests/tcg/tricore/Makefile.softmmu-target     |  26 +++
 .../tcg/tricore/Makefile.softmmu-target.orig  |  25 +++
 tests/tcg/tricore/link.ld                     |  60 ++++++
 tests/tcg/tricore/test_abs.S                  |   7 +
 tests/tcg/tricore/test_bmerge.S               |   8 +
 tests/tcg/tricore/test_clz.S                  |   9 +
 tests/tcg/tricore/test_dvstep.S               |  15 ++
 tests/tcg/tricore/test_fadd.S                 |  16 ++
 tests/tcg/tricore/test_fmul.S                 |   8 +
 tests/tcg/tricore/test_ftoi.S                 |  10 +
 tests/tcg/tricore/test_madd.S                 |  11 ++
 tests/tcg/tricore/test_msub.S                 |   9 +
 tests/tcg/tricore/test_muls.S                 |   9 +
 32 files changed, 858 insertions(+), 114 deletions(-)
 create mode 100644 include/hw/tricore/tricore_testdevice.h
 create mode 100644 tests/tcg/tricore/macros.h
 create mode 100644 hw/tricore/tricore_testdevice.c
 create mode 100644 tests/docker/dockerfiles/debian-hexagon-cross.docker
 create mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
 create mode 100644 tests/tcg/tricore/Makefile.softmmu-target
 create mode 100644 tests/tcg/tricore/Makefile.softmmu-target.orig
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


