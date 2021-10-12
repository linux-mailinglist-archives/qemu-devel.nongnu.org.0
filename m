Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C753242A171
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 11:56:43 +0200 (CEST)
Received: from localhost ([::1]:58526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maEWY-0001aI-T1
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 05:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maED2-0004om-Fg
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 05:36:32 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maED0-0001Al-M5
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 05:36:32 -0400
Received: by mail-wr1-x435.google.com with SMTP id u18so65145410wrg.5
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 02:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RG/TYOAiNiz7Zjzo//Or7kcqS2r2Xb76n7z6Z3gZ41I=;
 b=cuBjksCtwTn+Qje7gaMeClrskn3RlpDh9ZGexUCHCoxMI5fV2XHUix9dGWjiRvd1BA
 U5H5M63jfDB6oz+3M4tihkh+ImI5JEIsxO+B1vXyA8+07RbrRwEaIUBSs/kCmQ77HdP8
 0f76lLZdbU/SEAIgqVQUDOEJmJKE+ARWfaEJDAJVnourk6FWr7szifg2Yp5WBJo27QTz
 8p9SdFGx/Di3tpFCEF+T3eVsQPi1UVYmXUc/vUeDERgSFzPnOSREYDRlpY+6BG9ZTTxl
 VAtV6BWOs1UhvFSiyjQ8JGZSXeDR4XG3tyEaLTSrrQwZe26vzIbenL2d2m6ysXdZNoJc
 hfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RG/TYOAiNiz7Zjzo//Or7kcqS2r2Xb76n7z6Z3gZ41I=;
 b=rz9sq5iGVSF+mQ7M3ZgmzhF9tspZs2QQa1yP3XPeB/CUZdCvYi8H09IHzrh8huNAgI
 vrwyFmK17DcO4nqTx6jotzdXuwWLk6T/RpxqfxnXoXtVG/yEQwN+XaxF7U3JmVtAmcy+
 KwUMLKXNk2+kNxUsyTEXEh1bPXAx35bGbr7dFinjkYmWV3kKeOhDIVWmBvbKtBLoS5Fc
 NHKNBbswkbSVM9/0u01hF9leb8ERIGW79bzbEUMM12Gk+JXyoGTlyuHGm7IULJzTtNfI
 lpxBImv7n+HxlfZfSIxcjRKvROXmfoY1yAAKsj7Ue/zt/FgUhvakypj0/2YVkuccnVXW
 jBiQ==
X-Gm-Message-State: AOAM532tzGVUllmzZYxdoz1lD4aNeT6RyW37o0/0+jV8CI8muhUi7/Ic
 cS7F/vyHQp/rUDo3vmziEhRE3g==
X-Google-Smtp-Source: ABdhPJxfJgv6nEf37IdtmMU/1uOJ+0V9qkfbmCapq4aJosYoGf147qbUsQmTDFyDESlwfyokd1YXPw==
X-Received: by 2002:a1c:3807:: with SMTP id f7mr4448445wma.117.1634031380112; 
 Tue, 12 Oct 2021 02:36:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g2sm10495482wrb.20.2021.10.12.02.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 02:36:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D7FD1FF96;
 Tue, 12 Oct 2021 10:36:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL v2 00/13] some testing and plugin updates
Date: Tue, 12 Oct 2021 10:36:17 +0100
Message-Id: <20211012093618.3914052-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c09124dcb8401a0d635b4a52b295e9b3fc12392a:

  Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2021-10-11 08:15:32 -0700)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-for-6.2-121021-2

for you to fetch changes up to 17888749ba0fb06694de5efe0b941f16a0fba6fa:

  tests/docker: add a debian-native image and make available (2021-10-12 08:38:10 +0100)

----------------------------------------------------------------
Some testing and plugin updates:

  - don't override the test compiler when specified
  - split some multiarch tests by guest OS
  - add riscv64 docker image and cross-compile tests
  - drop release tarball test from Travis
  - skip check-patch on master repo
  - fix passing of TEST_TARGETS to cirrus
  - fix missing symbols in plugins
  - ensure s390x insn start ops precede plugin instrumentation
  - refactor plugin instruction boundary detection
  - update github repo lockdown
  - add a debian-native test image for multi-arch builds

----------------------------------------------------------------
Alex Bennée (7):
      configure: don't override the selected host test compiler if defined
      tests/tcg/sha1: remove endian include
      tests/tcg: move some multiarch files and make conditional
      tests/docker: promote debian-riscv64-cross to a full image
      accel/tcg: re-factor plugin_inject_cb so we can assert insn_idx is valid
      .github: move repo lockdown to the v2 configuration
      tests/docker: add a debian-native image and make available

Daniel P. Berrangé (2):
      gitlab: skip the check-patch job on the upstream repo
      gitlab: fix passing of TEST_TARGETS env to cirrus

Lukas Jünger (1):
      plugins/: Add missing functions to symbol list

Richard Henderson (2):
      gitlab: Add cross-riscv64-system, cross-riscv64-user
      target/s390x: move tcg_gen_insn_start to s390x_tr_insn_start

Thomas Huth (1):
      travis.yml: Remove the "Release tarball" job

 configure                                          |   6 +-
 include/tcg/tcg.h                                  |   6 -
 accel/tcg/plugin-gen.c                             | 157 +++++++++++----------
 target/s390x/tcg/translate.c                       |  10 +-
 tests/tcg/multiarch/{ => libs}/float_helpers.c     |   2 +-
 tests/tcg/multiarch/{ => linux}/linux-test.c       |   0
 tests/tcg/multiarch/sha1.c                         |   1 -
 .github/lockdown.yml                               |  34 -----
 .github/workflows/lockdown.yml                     |  30 ++++
 .gitlab-ci.d/cirrus.yml                            |   2 +-
 .gitlab-ci.d/cirrus/build.yml                      |   1 +
 .gitlab-ci.d/container-cross.yml                   |   3 +-
 .gitlab-ci.d/crossbuilds.yml                       |  19 +++
 .gitlab-ci.d/static_checks.yml                     |   2 +-
 .travis.yml                                        |  23 ---
 plugins/qemu-plugins.symbols                       |   3 +
 tests/docker/Makefile.include                      |   6 +-
 tests/docker/common.rc                             |  10 +-
 tests/docker/dockerfiles/debian-native.docker      |  49 +++++++
 .../docker/dockerfiles/debian-riscv64-cross.docker |  46 +++++-
 tests/tcg/multiarch/Makefile.target                |  15 +-
 tests/tcg/x86_64/Makefile.target                   |   4 +
 22 files changed, 271 insertions(+), 158 deletions(-)
 rename tests/tcg/multiarch/{ => libs}/float_helpers.c (99%)
 rename tests/tcg/multiarch/{ => linux}/linux-test.c (100%)
 delete mode 100644 .github/lockdown.yml
 create mode 100644 .github/workflows/lockdown.yml
 create mode 100644 tests/docker/dockerfiles/debian-native.docker

-- 
2.30.2


