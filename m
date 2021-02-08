Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A8D313DFE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:48:34 +0100 (CET)
Received: from localhost ([::1]:40590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BaJ-0001Jb-H4
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:48:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95pQ-0003iP-UK
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:39:54 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95ol-0007hv-55
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:39:43 -0500
Received: by mail-wr1-x430.google.com with SMTP id u14so16937026wri.3
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hp51cnorlWSpMQXDF9bdOXBE8vyYVho+cDlAWY6lkjo=;
 b=lJWrwhplUUX7z2rmUJv055tCMepGynW215bx5D1CXx8BldLs4d8AF9CHy2phVC55/w
 dkpjLVUiJLpBHGBHHMM4Kuw5J1YZEbTwS1CWyp5XJ3+/YM0R9vNayNkhJ5IfxA54e+lG
 rQBIhc9h0GcgRvKAcwNhTaAN4Fa51GuhGx9yyhoCY1L2NYfz0b2cu7+MQg+ovLbKw3EJ
 Ssy2yFhh8A5pqM2hbd8JIfl9oJ+u7G805uF30nY6AsPms2YH3LUD5j9U+MLzBHRhV9G8
 OWxs9b6GPWnY2jvqQhNnivU9uslbpJP7IlrS4zl2CzbvU6Zoy1ipPsN1aCzRdvRbhxhb
 NLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hp51cnorlWSpMQXDF9bdOXBE8vyYVho+cDlAWY6lkjo=;
 b=FueyV+URWv3lNtvFi9xqMt0txPyGR1Hitpc8v0vLdPVeomWBnaEBGJnt5qDqg0IdRH
 bAsVGLUQuvoY29e/f4PbUe2inudZkck3y8SGlYaPLdfoORSeLNbNr5Zd5Og9xAaph+JR
 RedHMgfhh4VfJYLklxhuTrhEEmCZJ3q4HqU62MYdS2GwxzEUE4pjvXScQP4kEqaCu2LN
 4dt0LG7OWSjsk3aW0FeoF2F8p8XHohxAoqzR+JXooZNL848rJ6rxKWoRDpFnw9P91vtM
 punWJZ5Rn9zESlEVg6NreyPXBH6nhc8Yl55oLOGhLEhFycFKdXLl88Tk+CW56NH2c9HU
 ilwg==
X-Gm-Message-State: AOAM531eSLbxqLXdRUxpbT+bYxBg16UzhepKsOUxjgwYPUeCGVFAB3Yq
 yjtE9G2RB+ysq1ExyQ97wC87Tg==
X-Google-Smtp-Source: ABdhPJy3t4kcBnr3sX0euQB8Xx2cp/0d9sJSLy+5L2PWtuxR6PzqAVdSAOsLdwqWSP7bkGIJlKxNoQ==
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr18964436wrt.324.1612787903514; 
 Mon, 08 Feb 2021 04:38:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j185sm21701548wma.1.2021.02.08.04.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:38:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B2C5C1FF7E;
 Mon,  8 Feb 2021 12:38:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 00/16] testing, gdbstub and doc tweaks
Date: Mon,  8 Feb 2021 12:38:05 +0000
Message-Id: <20210208123821.19818-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5b19cb63d9dfda41b412373b8c9fe14641bcab60:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210205' into staging (2021-02-05 22:59:12 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-gdbstub-docs-080221-1

for you to fetch changes up to d994cc54498e8952113110b07a76dbfecd46a909:

  docs/system: document an example booting the versatilepb machine (2021-02-08 10:55:20 +0000)

----------------------------------------------------------------
Testing, gdbstub and doc tweaks:

  - increase timeout on replay kernel acceptance test
  - fixes for binfmt_misc docker images
  - better gdb version detection
  - don't silently skip gdb tests
  - fix for gdbstub auxv handling
  - cleaner handling of check-tcg on tcg disabled builds
  - expand vexpress/versitile docs with examples

----------------------------------------------------------------
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

Thomas Huth (1):
      tests/acceptance: Increase the timeout in the replay tests

 docs/system/arm/versatile.rst         | 34 ++++++++++++++++++++++++++++++++++
 docs/system/arm/vexpress.rst          | 28 ++++++++++++++++++++++++++++
 configure                             |  6 +++---
 Makefile                              |  2 +-
 gdbstub.c                             | 17 ++++++++++++-----
 scripts/mtest2make.py                 |  1 +
 tests/Makefile.include                | 12 +++++++-----
 tests/acceptance/replay_kernel.py     |  2 +-
 tests/docker/Makefile.include         | 26 +++++++++++++++++++++++---
 tests/docker/docker.py                | 23 +++++++++++++++++------
 tests/docker/dockerfiles/empty.docker |  8 ++++++++
 tests/tcg/Makefile.qemu               |  4 ++--
 tests/tcg/multiarch/Makefile.target   |  5 ++++-
 13 files changed, 141 insertions(+), 27 deletions(-)
 create mode 100644 tests/docker/dockerfiles/empty.docker

-- 
2.20.1


