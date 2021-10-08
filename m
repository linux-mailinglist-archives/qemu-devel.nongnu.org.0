Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 966B7426AD9
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 14:31:07 +0200 (CEST)
Received: from localhost ([::1]:48574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYp1m-0005tu-IS
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 08:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYowu-0002wr-2F
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:04 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYows-0006sL-0L
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:03 -0400
Received: by mail-wr1-x42b.google.com with SMTP id m22so29410735wrb.0
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tb0SsVCNXUY66njE4M/RlBEnUqd+u1vzil04lfCkShc=;
 b=E1w5xY8vBJ6OjGF7br8JSNK+T+GZlZ1KqmuBxU94r+0+dlEugZylu00ZQ2CrabSXAq
 4wVKNmb1tpooo/FWblixD8wCzS1tLv//bTTJXjav/pokOjsKF86MJEhYe2PviJjmKYbf
 EBMnbrD3LbfMqCwvz8It7OVwm9hCIvLMcZuZmg7569LsXFYtMjpzPV6SipR/7F9lm9My
 9LY8/yG4rMcPWcQIiVk+j3tm9VNX0d2JlAqJnsqVBCkjANpbyMYuzp6Wp2C2d6csWw7w
 +4GiWsIdabdfqwxz7AkAwAGRcBFy/HD0JdiZiAi9wvQYA39TE+h4ubE5Ega/lT7Bg5vr
 LL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tb0SsVCNXUY66njE4M/RlBEnUqd+u1vzil04lfCkShc=;
 b=7FbOhQWWJNiReBu6kuwfDQ6hkIMSEGyoRfG10z04LimhS+iZ7zbGKIOFBTVtjOJEtP
 txRa0V/EPpvB0W1mi13WIzJjySOJVnao6WsdHnVo1cA45kvgTUekicfCk+yNTcu7ojs6
 nXzGqLl5OanxQeaS/6vlRuBYsfF587HnJK94FwWantmUrk1fptOfS1WSEOjUteajj3o5
 eOeNzF+kZLORyE1DoricRXiPzv88DyQsBLJCpVCaYgS1EZ7YoQbyHj+8+OWq7Ax0/VsP
 PVhtA5LMtJ7/+Tzm/zIP0QlXa9qathjeLG81q9/NddD6WZ+BuOEAdXS6PzG0U6Hb9VyL
 yyHQ==
X-Gm-Message-State: AOAM531hiK448lgFtMIL9ksNpqYNOvngWNtmksTzYA2Y4oK+hnWLSvF0
 Zh76B/TKiuoYOzt7ywAvYz5DNPxfv4D/qQ==
X-Google-Smtp-Source: ABdhPJyrDbmGpeoyQDbOitGRfFswvO7K/uc+ezuhBNz83HayZHDhl1dZJxdTUxiwrzPtOpizf6Aa5w==
X-Received: by 2002:a5d:64a6:: with SMTP id m6mr3734704wrp.282.1633695960644; 
 Fri, 08 Oct 2021 05:26:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m4sm12360329wml.28.2021.10.08.05.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 05:25:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 39E9D1FF96;
 Fri,  8 Oct 2021 13:25:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 00/12] some testing and plugin updates
Date: Fri,  8 Oct 2021 13:25:44 +0100
Message-Id: <20211008122556.757252-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 14f12119aa675e9e28207a48b0728a2daa5b88d6:

  Merge remote-tracking branch 'remotes/vsementsov/tags/pull-jobs-2021-10-07-v2' into staging (2021-10-07 10:26:35 -0700)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-for-6.2-081021-1

for you to fetch changes up to 755c4aefd86f8b8eda1eb37f20024765c70ebbcb:

  tests/docker: add a debian-native image and make available (2021-10-08 12:55:27 +0100)

----------------------------------------------------------------
Some testing and plugin updates:

  - don't override the test compiler when specified
  - split some multiarch tests by guest OS
  - add riscv64 docker image and cross-compile tests
  - drop release tarball test from Travis
  - skip check-patch on master repo
  - fix passing of TEST_TARGETS to cirrus
  - fix missing symbols in plugins
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

Richard Henderson (1):
      gitlab: Add cross-riscv64-system, cross-riscv64-user

Thomas Huth (1):
      travis.yml: Remove the "Release tarball" job

 configure                                          |   6 +-
 include/tcg/tcg.h                                  |   6 -
 accel/tcg/plugin-gen.c                             | 157 +++++++++++----------
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
 21 files changed, 263 insertions(+), 156 deletions(-)
 rename tests/tcg/multiarch/{ => libs}/float_helpers.c (99%)
 rename tests/tcg/multiarch/{ => linux}/linux-test.c (100%)
 delete mode 100644 .github/lockdown.yml
 create mode 100644 .github/workflows/lockdown.yml
 create mode 100644 tests/docker/dockerfiles/debian-native.docker

-- 
2.30.2


