Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA27B53AC77
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:08:34 +0200 (CEST)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSll-0003mz-Pl
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSj2-0000np-2m
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:46 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSj0-0004vA-2v
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:05:43 -0400
Received: by mail-ej1-x62d.google.com with SMTP id y19so5369477ejq.6
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tUUJccxh9CaAXuGk2DVhDxbjJV09BO5EmHOunVWPCC8=;
 b=HMBNb35+pxCWwibYc4aVl6Kql3zgwispuVgXyXc9DfXqCxOMYMr9VOhUyZsUxMPgZC
 zqk8u2Js58Jimi1glwjnJc6xtyoB4kK6AJOFHW07qGBV0gvDxTNgc+vCZGqTlDmELOcj
 LMKX1CiMGOcuai2IurkmeneESug0T5vSwQUOraTLSvmWgDqwTk6N4naeP/ZQy/ZZZaBi
 8lPCuK6/hWjVUGIMFnopHOUMldXTZIqOt8g8EY6lZ5i5k27Olexei/xgOmQw2GBGUTq3
 bM13ufQevV0U87aUSdTForBVrrpWvdzC2wbEMQThRYfM43K9/mhIrmgSPebWQOplBKhT
 +waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tUUJccxh9CaAXuGk2DVhDxbjJV09BO5EmHOunVWPCC8=;
 b=e7vGELmcRc0ro9racTy7Lsldc48GgfO3Lb5qNyBZgQNlv39mFJfBWnRPqfJ14OU3ay
 qHTPs8UQzADGLc81pN0ZgFw8pf2oDeq311snKOLy07KTgY2xuMl1xwWsEfWwqCnnqN1c
 32/mfn+XAUjidT+yF3bGPJ1B5wTwsjA25vgqr9kvVO15CMvveRZxZ3izsqpIrZkfYxYV
 9pWoDUJSN5kYUYYOD/B0CBD0l5aNh5NvmXi1fdUC4Y5QvQ5Cx/jwBOSxJG3IFuQJyMMJ
 o9Slz4xsGTQRUb65duXayEprYfOw4S55BQbZYYSdSkKgVtYCOg29U6L0utOaCYlhoR89
 NDfQ==
X-Gm-Message-State: AOAM5335w6Q9j7Pu5cKA/px5ccON2WgmmsH2WidjJkVRxV2DlhwsX72d
 LM003ljLS8/g57uI6ogoaPM8CA==
X-Google-Smtp-Source: ABdhPJx7c9HCPe20hWPoh9Fiav8ZZA3wJ+iLEdPiJYLT16k40WiMLyX2aaAfSfZ9VWQGwlyzLljTlw==
X-Received: by 2002:a17:907:9605:b0:6f5:c66:7c13 with SMTP id
 gb5-20020a170907960500b006f50c667c13mr714419ejc.66.1654106739320; 
 Wed, 01 Jun 2022 11:05:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a170906190100b00709f5f509c9sm92465eje.153.2022.06.01.11.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:05:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C39541FFB7;
 Wed,  1 Jun 2022 19:05:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 00/33] testing updates (gitlab, junit, lcitool, x-compile)
Date: Wed,  1 Jun 2022 19:05:04 +0100
Message-Id: <20220601180537.2329566-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 7077fcb9b68f058809c9dd9fd1dacae1881e886c:

  Merge tag 'vmbus-maint-20220530' of https://github.com/maciejsszmigiero/qemu into staging (2022-05-30 12:40:36 -0700)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-next-010622-3

for you to fetch changes up to 7266ecce502c31387a3cbf83d7297bc9cf27b139:

  docs/devel: clean-up the CI links in the docs (2022-06-01 18:55:04 +0100)

----------------------------------------------------------------
Various testing updates

  - fix some gitlab container dependencies
  - report meson test results via JUnit
  - fix meson display of enabled cross compilers
  - convert more cross build containers to lcitool and Debian 11
  - re-factor cross compiler detection
  - use test cross-compilers for building ROMs
  - disable CI runs by default (see docs)
  - fix some broken links in development documentation

----------------------------------------------------------------
Alex Bennée (9):
      meson.build: fix summary display of test compilers
      tests/lcitool: fix up indentation to correct style
      tests/docker: update debian-armhf-cross with lcitool
      tests/docker: update debian-armel-cross with lcitool
      tests/docker: update debian-mipsel-cross with lcitool
      tests/docker: update debian-mips64el-cross with lcitool
      tests/docker: update debian-ppc64el-cross with lcitool
      tests/docker: update debian-amd64 with lcitool
      docs/devel: clean-up the CI links in the docs

Daniel P. Berrangé (5):
      gitlab: introduce a common base job template
      gitlab: convert Cirrus jobs to .base_job_template
      gitlab: convert static checks to .base_job_template
      gitlab: convert build/container jobs to .base_job_template
      gitlab: don't run CI jobs in forks by default

Marc-André Lureau (1):
      gitlab-ci: add meson JUnit test result into report

Paolo Bonzini (16):
      configure: do not define or use the CPP variable
      build: clean up ninja invocation
      build: add a more generic way to specify make->ninja dependencies
      build: do a full build before running TCG tests
      configure, meson: move symlinking of ROMs to meson
      tests/tcg: correct target CPU for sparc32
      tests/tcg: merge configure.sh back into main configure script
      configure: add missing cross compiler fallbacks
      configure: handle host compiler in probe_target_compiler
      configure: introduce --cross-prefix-*=
      configure: include more binutils in tests/tcg makefile
      configure: move symlink configuration earlier
      configure: enable cross-compilation of s390-ccw
      configure: enable cross-compilation of optionrom
      configure: enable cross compilation of vof
      configure: remove unused variables from config-host.mak

Thomas Huth (2):
      .gitlab-ci.d/container-cross: Fix RISC-V container dependencies / stages
      .gitlab-ci.d/crossbuilds: Fix the dependency of the cross-i386-tci job

 docs/devel/ci-jobs.rst.inc                         | 116 +++-
 docs/devel/ci.rst                                  |  11 +-
 docs/devel/submitting-a-patch.rst                  |  36 +-
 docs/devel/testing.rst                             |   2 +
 configure                                          | 606 ++++++++++++++++++---
 Makefile                                           |   9 +-
 pc-bios/s390-ccw/netboot.mak                       |   2 +-
 meson.build                                        |   8 +-
 .gitlab-ci.d/base.yml                              |  72 +++
 .gitlab-ci.d/buildtest-template.yml                |  18 +-
 .gitlab-ci.d/buildtest.yml                         |  28 +-
 .gitlab-ci.d/cirrus.yml                            |  16 +-
 .gitlab-ci.d/container-cross.yml                   |  24 +-
 .gitlab-ci.d/container-template.yml                |   1 +
 .gitlab-ci.d/containers.yml                        |   3 +-
 .gitlab-ci.d/crossbuild-template.yml               |   3 +
 .gitlab-ci.d/crossbuilds.yml                       |   2 +
 .gitlab-ci.d/qemu-project.yml                      |   1 +
 .gitlab-ci.d/static_checks.yml                     |  19 +-
 .gitlab-ci.d/windows.yml                           |   1 +
 pc-bios/meson.build                                |  17 +-
 pc-bios/optionrom/Makefile                         |   4 +-
 pc-bios/s390-ccw/Makefile                          |   9 +-
 pc-bios/vof/Makefile                               |  17 +-
 scripts/mtest2make.py                              |   8 +-
 tests/Makefile.include                             |   4 +-
 tests/docker/Makefile.include                      |   5 -
 tests/docker/dockerfiles/debian-amd64.docker       | 194 +++++--
 tests/docker/dockerfiles/debian-armel-cross.docker | 178 +++++-
 tests/docker/dockerfiles/debian-armhf-cross.docker | 184 ++++++-
 .../dockerfiles/debian-mips64el-cross.docker       | 177 +++++-
 .../docker/dockerfiles/debian-mipsel-cross.docker  | 179 +++++-
 .../docker/dockerfiles/debian-ppc64el-cross.docker | 178 +++++-
 tests/lcitool/refresh                              | 178 ++++--
 tests/tcg/configure.sh                             | 376 -------------
 35 files changed, 1885 insertions(+), 801 deletions(-)
 create mode 100644 .gitlab-ci.d/base.yml
 delete mode 100755 tests/tcg/configure.sh

-- 
2.30.2


