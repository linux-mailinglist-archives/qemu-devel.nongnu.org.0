Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406B3318A7A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:29:35 +0100 (CET)
Received: from localhost ([::1]:52858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAB6E-0004NU-8p
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:29:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4e-0002jX-1P
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:27:56 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4c-0003nw-4y
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:27:55 -0500
Received: by mail-wr1-x435.google.com with SMTP id b3so4000591wrj.5
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eJLMLFvsBi85e8gu1R69mgNk0v/NVtFQY/gwHikwOOo=;
 b=s/Azj+BgmIH+loIIPF5CqZGpANVXzb3+jfzQCclORLIdgCvetEDQ/shcBjz4uaefUi
 2spOZJs87w5XXYoTe1+LvWY12QP8vrHMGmYdcmv/iiqpNWfcAjStuJDk6BdWvlBDRfKI
 QdKxfz2YUgtwxG0nvObq/ILIVr8IL/6uUIihvK3Oo1Oc3Ddvn868L1DDv6AC9JPT640m
 PCBlcp3dYRf3LO1hHuV1sCS7U6hhCAFGp60GuKn1VyvqGp7q3+MK+SA7elYUESsgkSZP
 Hp5HOL+fb/lyVeJeyyiF3KUa490wsy1YoJ5dXDpBcJZ6MkaxxEbDvV2i3y2sJ3Qcav3e
 PNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eJLMLFvsBi85e8gu1R69mgNk0v/NVtFQY/gwHikwOOo=;
 b=BF5hSlVg0f0LHny/ypEWGV8QWh8J8rOvX9gGCMU+oTG8PAsSzWzznUvkwv6dnTHZ7h
 kCs3Kyf4/yN3REAKRxwoIRot2Ozv8Xtq/15fjYbr3sdY+/7wCdOdz9ANR0w0FtgBuFf0
 WrqhNRwvZUmHHHQiIShVUBUK5tYlZdKEC2YTszl4LBXd4rPJRNY3HBxrgGwDWMt6yFoq
 9JcNSlh+zVqHnoltRbgRbOj0dxaEnsykw6hpkN0hK+QA3Az+NE+qVCDZZxQ12H8f59Ow
 7yWtgfYElhv+B8zfPZTP1DH/GL0yXxc+TPfahMYKWEFDC72Qmrt6rDEgK8hHJYUeQv9M
 rohw==
X-Gm-Message-State: AOAM532fpawYkI330OBxtRAcFW4puzXpFpOTFCyP9IRq4Ltr0XO9ZYch
 wxFVNCXlgFInT9G/IyOZw4HyPQ==
X-Google-Smtp-Source: ABdhPJyq5woWyH43Ga9xw0uwEJIvk5PvT1UqJFn2/LYIHlrhbqPWYLsgpaPwIsKfYSEyWfXKkVcGqA==
X-Received: by 2002:a5d:4386:: with SMTP id i6mr5345522wrq.411.1613046472418; 
 Thu, 11 Feb 2021 04:27:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i15sm7946067wmq.26.2021.02.11.04.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:27:51 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EAFC01FF7E;
 Thu, 11 Feb 2021 12:27:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 00/15] testing and gdbstub pre-PR (travis, shipable, gitlab,
 gdb float)
Date: Thu, 11 Feb 2021 12:27:35 +0000
Message-Id: <20210211122750.22645-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is a pre-PR series for testing and gdbstub updates. On the
testing side we are almost entirely switched to gitlab for tests (only
the non-x86 builds still run). Hopefully we can transition these to
gitlab runners soon. Elsewhere shipable is turned off leaving our
testing menagerie as:

  - Cirrus (BSD's, Windows, MacOS)
  - GitLab (everything else)

although of course patchew continues to do sanity checking on
incoming patches to the list. On the gdbstub side we have some
clean-ups from Peter to remove special handling for floats. The only
unreviewed patch at the moment is:

 - tests/tcg: fix silent skipping of softmmu gdb tests

I should be preparing the PR on Monday morning when a glorious half
term will limit my distractions ;-)

Alex Bennée (2):
  .shippable: remove the last bits
  tests/tcg: fix silent skipping of softmmu gdb tests

Daniel P. Berrangé (1):
  tests/docker: remove travis container

Peter Maydell (6):
  MAINTAINERS: Add gdbstub.h to the "GDB stub" section
  target/sh4: Drop use of gdb_get_float32() and ldfl_p()
  target/m68k: Drop use of gdb_get_float64() and ldfq_p()
  target/ppc: Drop use of gdb_get_float64() and ldfq_p()
  gdbstub: Remove unused gdb_get_float32() and gdb_get_float64()
  bswap.h: Remove unused float-access functions

Philippe Mathieu-Daudé (2):
  travis.yml: Move gprof/gcov test across to gitlab
  travis-ci: Disable C++ optional objects on AArch64 container

Thomas Huth (4):
  travis.yml: Move the -fsanitize=undefined test to the gitlab-CI
  travis.yml: Move the --enable-modules test to the gitlab-CI
  travis.yml: (Re-)move the --enable-debug jobs
  travis.yml: Move the -fsanitize=thread testing to the gitlab-CI

 docs/devel/loads-stores.rst                   |  14 +--
 docs/devel/testing.rst                        |  14 ---
 include/exec/cpu-all.h                        |   8 --
 include/exec/gdbstub.h                        |  20 ----
 include/qemu/bswap.h                          |  60 ----------
 target/m68k/helper.c                          |   5 +-
 target/ppc/gdbstub.c                          |   8 +-
 target/sh4/gdbstub.c                          |   8 +-
 target/ppc/translate_init.c.inc               |   4 +-
 .gitlab-ci.yml                                |  40 ++++++-
 .shippable.yml                                |  23 ----
 .travis.yml                                   | 113 +-----------------
 MAINTAINERS                                   |   5 +-
 scripts/{travis => ci}/coverage-summary.sh    |   2 +-
 tests/docker/Makefile.include                 |  11 +-
 tests/docker/dockerfiles/travis.docker        |  17 ---
 tests/docker/dockerfiles/ubuntu2004.docker    |   2 +
 tests/docker/travis                           |  22 ----
 tests/docker/travis.py                        |  47 --------
 .../multiarch/system/Makefile.softmmu-target  |   6 +-
 20 files changed, 66 insertions(+), 363 deletions(-)
 delete mode 100644 .shippable.yml
 rename scripts/{travis => ci}/coverage-summary.sh (92%)
 delete mode 100644 tests/docker/dockerfiles/travis.docker
 delete mode 100755 tests/docker/travis
 delete mode 100755 tests/docker/travis.py

-- 
2.20.1


