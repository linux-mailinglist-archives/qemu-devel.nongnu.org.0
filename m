Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBAF2DCEF1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:58:09 +0100 (CET)
Received: from localhost ([::1]:58320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpq2z-0004mT-00
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kppox-0007xo-PJ
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:43:39 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kppos-0000H4-QV
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:43:39 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r7so25898950wrc.5
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tj93eT3E1rPmobdk4ILw1j2v6D3anDKdFCITuIrmh1A=;
 b=Fjy/vuyWJosBLj7ljJPwqAEdlAxm40V1ippFGFBrs3sLM8ExEiesKXI1R2/gUUfbvi
 Elj5zcsSLWjJ56ijgIM1R/MGV9acxiq/9wtwI8nYcUEk0AYulIJLJsCnI0ZBesZelZ+e
 GSPnZ6TkHuF7rk/1wF8FjYZHg1wKxi4/UdNSdQLzI6UA+jz2EknzFLFuzbM16h4hItlM
 t23N2xEYNrFkimWA488+WxhjpnCFB0th9TxUCswi39udXeXX9SXd0kGNSSQd+VIa6Ab3
 HHzuCnKNlIwUGcPK4tRc+DXeEOMHP87Td7Jf7/DkVn1yOVAAHM5o4vwTC55JsD97h5Ir
 EH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tj93eT3E1rPmobdk4ILw1j2v6D3anDKdFCITuIrmh1A=;
 b=bSYtZyUCYK0hPPTZ3f9TqfGCWaxddlrcJ6cm6ECAsreHSpC6pt7N6pbfzsJKKHS4Hj
 MgNFak853ZXCgQI1coTF3+9Hul+R6UfEJ79sZqRhq2C8h1KIHneJ+hF3RUoBMQKrUwp2
 /eE3ZrwwOYwOBZjgJuDh1Br3hZiNb7dGFV2soytADLg7SOf5sLC0DDHjT5GDPhoFcjrX
 MgkiTeBCH6RqwxuK+K9tOBt1FX5p4gDr393wgQDmZlI65GfaXQXZG4MQ1Hp1RlmVkrjr
 iCijGt4r9AeMb6w5/vqO6QLdkblzThN1G6FHf/w545MvCblGX+dtnyPHFmHlOEsT5k+R
 VKMw==
X-Gm-Message-State: AOAM531kLh4q0HoJyvOBmkGl9rZ8WgmNlBtm1vyt2+Gxoumhpzog7Jne
 YmVqUMcwGz/yR168uEZAGJ23YQ==
X-Google-Smtp-Source: ABdhPJx0OrwDmnxHNMWea6oEj2qDLU0FAhfS60+TUsQJFHsGtsOf30M20RuHmP7mjoSbBeKQD3zStA==
X-Received: by 2002:adf:c990:: with SMTP id f16mr42312928wrh.263.1608198212640; 
 Thu, 17 Dec 2020 01:43:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 89sm8402750wre.51.2020.12.17.01.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:43:31 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B9D231FF7E;
 Thu, 17 Dec 2020 09:43:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 00/11] testing and configure updates
Date: Thu, 17 Dec 2020 09:43:30 +0000
Message-Id: <20201217094330.17400-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64a4b6f:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2020-12-15 21:24:31 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-171220-2

for you to fetch changes up to a1c04860cec798914f8cd8ef77fce195f360d36e:

  tests: update for rename of CentOS8 PowerTools repo (2020-12-17 09:38:51 +0000)

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
 tests/docker/dockerfiles/centos8.docker           |   5 +-
 tests/docker/dockerfiles/fedora-i386-cross.docker |  18 ++-
 tests/tcg/Makefile.target                         |   2 +-
 11 files changed, 150 insertions(+), 114 deletions(-)

-- 
2.20.1


