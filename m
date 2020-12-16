Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FE12DC4F2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:02:17 +0100 (CET)
Received: from localhost ([::1]:35830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaBs-0006m3-Hc
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyc-0007sC-LU
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:34 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyZ-0002Nm-GW
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:33 -0500
Received: by mail-wr1-x42c.google.com with SMTP id c5so20194168wrp.6
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d6r5TI+dJDVZQ5OwHi97mnEGqVifeMnT7F77mzxkvhA=;
 b=bSvTmL9OO+6OWx5MaEPNhiMZ0u6TqtwVYSJ3IEJDTilnq/EIfWGU8V1gmRBvv3dOYh
 rM4tmprAPx3Yd+ZpljyNW6/7iegm3uwf0Jcoylg+iFndDi0rc2H9rY+t1GI9A/WakOrE
 zVKBjoTlMcnlURz0Hjm5o0HTGyAkfO9kDYOC/AlYvEqhWc0uiXgQ452KsKrL2+1juyRx
 WWwtDRgUyoU7a1vT9LjeF4FN0/QepRXxFut9M8pBJwiazKE5KH4x+iLNOSnOjFSuqlK5
 TpHUY/Rr9H7DaCkpvnT6dMGLl9f8Q2f2iIQVt3L4PvlNMoFMCsJqPQQS91mB4ceFzxd6
 Cd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d6r5TI+dJDVZQ5OwHi97mnEGqVifeMnT7F77mzxkvhA=;
 b=pmyHiROngcCXW2fmAVrnUUEEckVHXn9B9rU0xXC+TcjA7M6kwV3+K3YWn8K9ylLwjr
 6BSV04+PwbkV1AfoH2xN6YMhAEitkb/pWjXFX9sK1IjiqZZ7TNKrDJlCg21Cz9rS4Hpe
 OWx1WxcEkYoiHcN0VeJCK03uk8CQPSFgbA3OtEmTiYfpQwkKLWbAjwHaoO1FXCyrE0jU
 nh/Iht8qaZrs5wKRa969jorHuBCl9epILGVAZvjUYY/3H/wZsG6xuxzGnIRfuDHFo/Sb
 lRXWG7y19zjKySaXOqPq4TeDFRTUA7E6IxGGHi6KqfVUYNBgx6Cml5O0pjzOY2hoXSET
 uRaw==
X-Gm-Message-State: AOAM532hbIyJvdGyv0eRUUb/PeGPHFcYlsPnXXA9CCjlFuYLyIYv01ib
 N0xQWJ+j5pSt8JqS2Fukv4LB+w==
X-Google-Smtp-Source: ABdhPJwoCu+kqkCkifYSmmfmZJ07jyd0tZTUX6tohOcPnhHURiRy/ibhAbndnuTsRVJgOOWSf5xdmw==
X-Received: by 2002:a5d:45d0:: with SMTP id b16mr38622180wrs.220.1608137309981; 
 Wed, 16 Dec 2020 08:48:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i7sm4060697wrv.12.2020.12.16.08.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:48:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D80561FF7E;
 Wed, 16 Dec 2020 16:48:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 00/11] testing and configure updates
Date: Wed, 16 Dec 2020 16:48:16 +0000
Message-Id: <20201216164827.24457-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64a4b6f:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2020-12-15 21:24:31 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-161220-1

for you to fetch changes up to f1d2e115645ddf18bd235e853ca47f73f4dffe6b:

  tests: update for rename of CentOS8 PowerTools repo (2020-12-16 16:19:37 +0000)

----------------------------------------------------------------
Testing and configure updates:

  - add moxie-softmmu to deprecated_targets_list
  - improve cross-build KVM coverage
  - new --without-default-features configure flag
  - add __repr__ for ConsoleSocket for debugging
  - build tcg tests with -Werror
  - test 32 bit builds with fedora
  - remove last traces of debian9
  - hotfix for centos8 powertools repo

----------------------------------------------------------------
Alex Bennée (8):
      configure: include moxie-softmmu in deprecated_targets_list
      gitlab: include aarch64-softmmu and ppc64-softmmu cross-system-build
      configure: move gettext detection to meson.build
      configure: add --without-default-features
      python: add __repr__ to ConsoleSocket to aid debugging
      gitlab: move --without-default-devices build from Travis
      gitlab: add --without-default-features build
      tests/tcg: build tests with -Werror

Daniel P. Berrangé (1):
      tests: update for rename of CentOS8 PowerTools repo

Thomas Huth (2):
      gitlab-CI: Test 32-bit builds with the fedora-i386-cross container
      tests/docker: Remove the remainders of debian9 containers from the Makefile

 configure                                         | 176 +++++++++++-----------
 .gitlab-ci.d/crossbuilds.yml                      |  22 ++-
 .gitlab-ci.yml                                    |  16 +-
 .travis.yml                                       |   8 -
 meson_options.txt                                 |   2 +-
 po/meson.build                                    |   2 +-
 python/qemu/console_socket.py                     |   7 +
 tests/docker/Makefile.include                     |   6 +-
 tests/docker/dockerfiles/centos8.docker           |   2 +-
 tests/docker/dockerfiles/fedora-i386-cross.docker |  18 ++-
 tests/tcg/Makefile.target                         |   2 +-
 11 files changed, 148 insertions(+), 113 deletions(-)

-- 
2.20.1


