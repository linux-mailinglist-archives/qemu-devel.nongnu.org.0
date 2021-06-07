Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17BE39DEDA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:34:54 +0200 (CEST)
Received: from localhost ([::1]:39822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqGL7-0005T0-ED
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJU-0002yX-BZ
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:12 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJO-0000JR-D6
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:11 -0400
Received: by mail-wr1-x435.google.com with SMTP id r9so1181245wrz.10
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 07:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=omQaHKzXrrxA4ICQO4h8mvHUVYO3ZKihQGe8gpcF+YA=;
 b=VkuMzPqlyWPJo38QgLePxXtMddAOCIBJn+ApPxtyc/esOAIFy3zO943K0VBsZRoYhe
 XRwgCdVP0CtlkqLfHO+03/ZxRfU/5PJQTkDNS7Px3QbttUMbWspKV5KWR7A5YaM+feyi
 TaeaDJTYCLdETTwg7TU9lQIwqp/xr2nz+XGngEcMVKEFEsYB17fReykx5g9Jm0ZcZ913
 hiV1rvqlyPt6fYYwecm4Fh3QZDaAyZqH1gzw1CCIhCVZRLLF7DP1b+RoxezhQYB8FsTI
 9shqo4GvLUYeK2XM9Ax9IMEwlsEH8Q2GTw/3mkoyLP4gi9ZcMEkxVW3QWCm9vp8LgaRr
 8yJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=omQaHKzXrrxA4ICQO4h8mvHUVYO3ZKihQGe8gpcF+YA=;
 b=s2NgGzP2KGFMdfhAuqhmuoZUpDKvgn89U34RP3N4P2SO0eTAfwkD5zM3NC9G2urpkc
 D7BaQU/H4ImZm0Dv6mFF857k4ARBjsyU8AHRR1Ejcc2W2/LIzpkZhQSF2li9BAUHLMXB
 04gAlpovkQcrRkfbe+jx3epHamj0Qj7MzJF2R0wduqOzmdY4jUluU+2SrLLs4TblZlha
 xgbuGWttHj7X2iy631yh0SdyQh7tbWvv1TfUdqMD9IQ5ep9DfWguOVrMElAhqZCFCdxB
 besgPP/aHbtkarIGGM87t1cMVIlqV9pCueFt0/qapmmXB6ytCX+rzBJ0F1y1a1c/FOXs
 NUEw==
X-Gm-Message-State: AOAM530+mAhTm3/BLnEI+N2zFGm/Z7/OOhbNGkv/eWFP28aWAngy6qwW
 jE0hFt/afWORAMJz4oo+ARiwVg==
X-Google-Smtp-Source: ABdhPJwpY22ll+m62xIHg/+dlHhJNWRExdzdtlvp8cy2E44u19d23GTcKnUIJmji/ZvPfTcf+sa4sg==
X-Received: by 2002:a5d:4848:: with SMTP id n8mr18002126wrs.70.1623076384781; 
 Mon, 07 Jun 2021 07:33:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b22sm11517668wmj.22.2021.06.07.07.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 07:33:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A7641FF7E;
 Mon,  7 Jun 2021 15:33:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 0/8] testing and misc updates
Date: Mon,  7 Jun 2021 15:32:55 +0100
Message-Id: <20210607143303.28572-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6f398e533f5e259b4f937f4aa9de970f7201d166:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210604' into staging (2021-06-05 11:25:52 +0100)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-updates-070621-2

for you to fetch changes up to 72205289a0799c6d0a73107198098b830dbea2f9:

  scripts/checkpatch.pl: process .c.inc and .h.inc files as C source (2021-06-07 14:49:30 +0100)

----------------------------------------------------------------
A few testing and configure updates:

  - add the multiarch signals stress test
  - fix display of multi-word compiler stanzas in meson
  - fix quoting of multi-word compiler stazas in configure.sh
  - tag some acceptance tests as TCG only
  - make checkpatch test work harder to find clean diffs
  - split gprof/gconv job to avoid timeouts
  - fix centos8 VM build by adding --source-path
  - make checkpatch aware of .h.inc and .c.inc paths

----------------------------------------------------------------
Alex Bennée (6):
      tests/tcg: add a multiarch signals test to stress test signal delivery
      meson.build: fix cosmetics of compiler display
      tests/tcg/configure.sh: tweak quoting of target_compiler
      tests/acceptance: tag various arm tests as TCG only
      gitlab: work harder to avoid false positives in checkpatch
      tests/vm: expose --source-path to scripts to find extra files

Matheus Ferst (1):
      scripts/checkpatch.pl: process .c.inc and .h.inc files as C source

Philippe Mathieu-Daudé (1):
      gitlab-ci: Split gprof-gcov job

 meson.build                            |   8 +-
 tests/tcg/multiarch/signals.c          | 149 +++++++++++++++++++++++++++++++++
 .gitlab-ci.d/buildtest.yml             |  17 +++-
 .gitlab-ci.d/static_checks.yml         |   6 +-
 scripts/checkpatch.pl                  |   4 +-
 tests/acceptance/boot_linux_console.py |  18 ++++
 tests/tcg/configure.sh                 |   6 +-
 tests/tcg/multiarch/Makefile.target    |   2 +
 tests/vm/Makefile.include              |   1 +
 tests/vm/basevm.py                     |   4 +
 tests/vm/centos.aarch64                |   2 +-
 11 files changed, 203 insertions(+), 14 deletions(-)
 create mode 100644 tests/tcg/multiarch/signals.c

-- 
2.20.1


