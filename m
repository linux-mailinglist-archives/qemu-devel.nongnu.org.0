Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D35B323B7B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:51:06 +0100 (CET)
Received: from localhost ([::1]:60234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEsh7-00074f-B3
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEsfe-0005qj-1y
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:49:34 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEsfc-0002T0-3c
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:49:33 -0500
Received: by mail-wm1-x332.google.com with SMTP id v21so1535100wml.4
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 03:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fyou74XSbC+grgsAImJZl4rRjugJTifk+mPeU5Wu1AQ=;
 b=EEJ1wCgffBRfF1a6v2DjoG1UazwOouKKgUqdmSm6n3/pE7ftZQiKkEc82yzay6aWnw
 GZgh74ZebhlqTyC+trekfTQW/Mcwu4FVvflqIur8ixD2c681jjYUwvbDundGlb8x568K
 Q1OwIJYvPQiN6L0NBKd1p8WEWGOz70Rpl0bg2KmZbJnFrW/Sd8jQVfKtO077fr7mnmRZ
 cAEAjmSMEHuE859m9HXkf709rC1zbDLzIRHe7k/bnwOrxo2gkDwrxEJPIRrhJUfEesXq
 UxhybxMp9uyLLWq0maSWeIA/odhkrlx9y/ChS/vIbvMF569AXC4AGtMI+v5dFJLSPtp8
 q1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fyou74XSbC+grgsAImJZl4rRjugJTifk+mPeU5Wu1AQ=;
 b=WvgktOM5zjGrF7/Ec14BaSOkjeVuzeO4QfnKpCUiHTcqlhd6D7BuJb9ea8zW37CcH5
 XKwgsb3tGi3NrvxxqZC5eMTmoS7ZH/zJf0nl4gZRgLIcm8GePA37JORt63iMsS39HMir
 g34pm8YGF7GSYSengcN/77Wu9QkdJzqV1H81cvKNL68dPejwF+Q/famyLEt51gS4uotZ
 ht2cm8m1r2DkGCTCRzygzErefqycD7Ks0Tpzl0HXJ0KlHYXDRhc0ZbXkaawB3RaFYi/Y
 t4IrXIkIgsTroXCgF+q9Q+Sn0nPSDuK88JLVikw6mG20/553877QZPy14Odk3d4m5X4z
 oEPQ==
X-Gm-Message-State: AOAM532fcv/UjOTwKn1WB8MGPl0y8aDbo7+pnLLaLpvHvDbx2Ko7B3aW
 Tl2wYQIhZm2/O7lrvmNQbapnnA==
X-Google-Smtp-Source: ABdhPJzEvcDahMcV8aCdFhDDupJAvfnYgjzVHwgvjPNvGeLwJ5+wWFs2TuNyDZoXBfzFqqWKV7XATA==
X-Received: by 2002:a1c:7c17:: with SMTP id x23mr3371353wmc.95.1614167370564; 
 Wed, 24 Feb 2021 03:49:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 12sm2455749wmw.43.2021.02.24.03.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 03:49:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5EAE11FF7E;
 Wed, 24 Feb 2021 11:49:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 0/7] testing updates (build, docs, dumps)
Date: Wed, 24 Feb 2021 11:49:19 +0000
Message-Id: <20210224114926.6303-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

The following changes since commit 7ef8134565dccf9186d5eabd7dbb4ecae6dead87:

  Merge remote-tracking branch 'remotes/edgar/tags/edgar/cris-next-2021-02-22.for-upstream' into staging (2021-02-22 14:20:32 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-updates-240221-1

for you to fetch changes up to 93a11007681a8051c07834c52d785a2948ff9632:

  docs: move CODING_STYLE into the developer documentation (2021-02-24 11:05:21 +0000)

----------------------------------------------------------------
Testing tweaks (build, docs, bumps)

  - expose cross compiler info in meson pretty print
  - bump Fedora to 33
  - "graceful" handling of missing virgl config
  - updates to the container documentation
  - move CODING_STYLE.rst into developer manual

----------------------------------------------------------------
Alex Bennée (6):
      meson.build: expose TCG cross compiler information in summary
      tests/acceptance: allow a "graceful" failing for virtio-gpu test
      docs/devel: expand on use of containers to build tests
      docs/devel: update the container based tests
      docs/devel: add forward reference to check-tcg
      docs: move CODING_STYLE into the developer documentation

Philippe Mathieu-Daudé (1):
      docker: Bump Fedora images to release 33

 docs/devel/index.rst                               |  1 +
 CODING_STYLE.rst => docs/devel/style.rst           |  6 +-
 docs/devel/testing.rst                             | 85 ++++++++++++++++------
 README.rst                                         |  4 +-
 meson.build                                        | 18 +++++
 scripts/fix-multiline-comments.sh                  |  2 +-
 tests/acceptance/virtio-gpu.py                     |  7 +-
 tests/docker/dockerfiles/fedora-cris-cross.docker  |  2 +-
 tests/docker/dockerfiles/fedora-i386-cross.docker  |  2 +-
 tests/docker/dockerfiles/fedora-win32-cross.docker |  2 +-
 tests/docker/dockerfiles/fedora-win64-cross.docker |  2 +-
 tests/docker/dockerfiles/fedora.docker             |  2 +-
 tests/tcg/configure.sh                             |  8 --
 13 files changed, 101 insertions(+), 40 deletions(-)
 rename CODING_STYLE.rst => docs/devel/style.rst (99%)

-- 
2.20.1


