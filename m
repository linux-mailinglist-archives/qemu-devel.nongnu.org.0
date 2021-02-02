Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8D230BFBC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:42:13 +0100 (CET)
Received: from localhost ([::1]:37852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vwa-0004zx-GT
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vuZ-0003L2-Uz
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:07 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vuW-0007B3-Ur
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:07 -0500
Received: by mail-wr1-x42b.google.com with SMTP id b3so2371438wrj.5
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QX6KvENyks8CIv4e3WKgDl493/mLtSW5w23cgLQLTQ0=;
 b=ANonQCTVJK+It0A9aY2pNVu2mD/xltgvNy+KPqd4Xc33oqHw+66USFtAMkdZAiDJSx
 bY+ScBRJvORJZsSTEc9FVel2DB5O0l3uZx9V2Y9VgutpEkAL4fXumBeuzZTzywLHXk5G
 DWe6ce6UbMTqr0N4qTtFSoZfIRSagdZMlBvsQZWiVJ2f/fuHKkHeIOvXehml4qvj8fMP
 ixybMzrksXZi/ZI5WpCACEYm1XdOrL4kqDIthN3xCqIHd47Win3vGPUy4nttuvhjoIPk
 s3o18d2Xz38BnJ3KWIrpyUCYeMK9bWlNq6a0iKkIvfwaA/rfxqKG7QRyS1ZlvCmWM1WI
 84rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QX6KvENyks8CIv4e3WKgDl493/mLtSW5w23cgLQLTQ0=;
 b=EiaWsk0jpHe4Cl1cI0rDuZNfjG/0GobogxcaSkuNSxwATR5GSYwv21LVmln58nLT+C
 jgvT9i1OdJI62AdG5XSwKHqAEckfhXF0kQ8hkEgG8NrkgDYArejvRi2Vs9Vt2E5Jec4L
 5qrFXjJZLC5VsLBHXJgJRsEOEyLBZWJVzKFywSr7J+MbtGGLntaQRniiM30f2Otim5K1
 tkBvm3/4MSMpYvFjIO2gApJ3M7OakrpRksluwXe4ue1BdP1RCzG8D0AJ2W0LdcTwM9Jj
 6QJ2RnIeA/ZSSIi8p7XsJYKObgIXBBc2Mcql1vDOP5guRqamxqIvpmrt1dbm2S8anJ5o
 DPaA==
X-Gm-Message-State: AOAM531Pgn7BwZjja7HwDWVc3ylHXOOtoRtEXL8xZC0BufD2KvXh7mTm
 2w9fsyz3yz4o8t1/vb7sXPz9nw==
X-Google-Smtp-Source: ABdhPJxZ3MaqEZF4midxGWgc+uJ3dRSptvIj+66TjzmsyGcTpuFfa+kcLvxAbFjDkdgJDGf8mYYgMA==
X-Received: by 2002:adf:f90d:: with SMTP id b13mr17310246wrr.198.1612273202768; 
 Tue, 02 Feb 2021 05:40:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r1sm31816727wrl.95.2021.02.02.05.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:40:01 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 11B0B1FF7E;
 Tue,  2 Feb 2021 13:40:01 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 00/15] testing/gdbstub/docs pre-PR
Date: Tue,  2 Feb 2021 13:39:45 +0000
Message-Id: <20210202134001.25738-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Here is the pre-PR roll-up of my testing tree (and other misc bits).
We have updates to docker's binfmt handling, gdbstub testing as well
as some documentation tweaks. Last chance to review/object to any
patches before I roll the PR, the following are still unreviewed:

 - docs/system: document an example booting the versatilepb machine
 - docs/system: document an example vexpress-a15 invocation
 - tests/tcg: don't silently skip the gdb tests
 - configure: bump the minimum gdb version for check-tcg to 9.1
 - tests/docker: add a docker-exec-copy-test
 - tests/docker: preserve original name when copying libs

Alex Bennée (11):
  tests/docker: make _copy_with_mkdir accept missing files
  tests/docker: preserve original name when copying libs
  tests/docker: alias docker-help target for consistency
  tests/docker: add a docker-exec-copy-test
  configure: make version_ge more tolerant of shady version input
  configure: bump the minimum gdb version for check-tcg to 9.1
  tests/tcg: don't silently skip the gdb tests
  scripts/mtest2make.py: export all-%s-targets variable and use it
  tests/Makefile.include: don't use TARGET_DIRS for check-tcg
  docs/system: document an example vexpress-a15 invocation
  docs/system: document an example booting the versatilepb machine

Philippe Mathieu-Daudé (2):
  tests/docker: Fix _get_so_libs() for docker-binfmt-image
  tests/docker: Fix typo in help message

Richard Henderson (1):
  gdbstub: Fix handle_query_xfer_auxv

Stefan Weil (1):
  tests/tcg: Replace /bin/true by true (required on macOS)

 docs/system/arm/versatile.rst         | 34 +++++++++++++++++++++++++++
 docs/system/arm/vexpress.rst          | 28 ++++++++++++++++++++++
 configure                             |  6 ++---
 Makefile                              |  2 +-
 gdbstub.c                             | 17 ++++++++++----
 scripts/mtest2make.py                 |  1 +
 tests/Makefile.include                | 12 ++++++----
 tests/docker/Makefile.include         | 26 +++++++++++++++++---
 tests/docker/docker.py                | 23 +++++++++++++-----
 tests/docker/dockerfiles/empty.docker |  8 +++++++
 tests/tcg/Makefile.qemu               |  4 ++--
 tests/tcg/multiarch/Makefile.target   |  5 +++-
 12 files changed, 140 insertions(+), 26 deletions(-)
 create mode 100644 tests/docker/dockerfiles/empty.docker

-- 
2.20.1


