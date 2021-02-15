Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F97731B698
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:45:09 +0100 (CET)
Received: from localhost ([::1]:53090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBaRH-0001Sz-U6
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaP5-0008Mo-Bg
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:42:51 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaP2-0004Jy-Au
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:42:50 -0500
Received: by mail-wr1-x429.google.com with SMTP id l12so8122578wry.2
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uAFaHjqWIkEvKZ7SosVyc1w72PmwgrAO/sVE7m5a10k=;
 b=AZII845OpuzMLdAtW7iPaHrLc9He/MVP0TlfuNt5Wo5HzueTEhRAUUg8+zCMxFfAyU
 FrF72ShhHbKmXHUsBHKH8NTwlTvzd1NstqkHqZEK00cqunFIzzAZtBodz3SHel6PjnzZ
 APhI4LigDptP3iRxhnnpSfnubME0MU4zdmewOZp2N11pNbGNtwR4aTJiNL2Yaa97KLA8
 K5CVgU5R2bqfIfV+P04QeyRnD49Ze03rANp2g4Y1PsvS+SHrNLErvANSdTMz1+istxjJ
 HcVYKtdcx63JETDHSpeaHWHPEGQ4SCSldoaedIp86U62m/oF3cNszkI/KDIKjsrzCU7l
 7s4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uAFaHjqWIkEvKZ7SosVyc1w72PmwgrAO/sVE7m5a10k=;
 b=jA9VL77xBwVBKmuzhZ6lzpOkCUhHEY8BmhTAM78JR2yaKgQ2nkiXT9CmmpS8vLqWHX
 cLdfR//r1uMV29+XEZk+yWJLsCuGnEbAQmnx4cdEPhG5ASxBLN4LzrNKSzc2MkhEZJZ0
 /NvSjF+t3GV6jOf28FhsDp3n6GJj9487blcK0Sda8wNfopvX7FKVm3MYvctesc4OykDD
 /FB500mZbl3A9us1Zt99iWuuJomoui8OuSnsdphbZ+tn6Je23sjrY+h2I7MabO1spVmC
 kQmHOt7xJGGhujJgkOcmlndsnzhv7RGqjDLn3xPn2phNt/vPngEjm+gRP9eZ0tB7riXX
 bzQQ==
X-Gm-Message-State: AOAM532QEONgYtzQkNSh+NyLbSjlfgK/GvBxUZoXt5osIgBokedNpndt
 eE9rmz7XJtbHIHKMohcI6DGjLA==
X-Google-Smtp-Source: ABdhPJzR6gbcrYlXHCP8bb3gl6zu4MmVVTj/1FF/cNzukX2Ngb4YksgUx5IN/YkDt/mnJAaFaElWuQ==
X-Received: by 2002:a5d:4f85:: with SMTP id d5mr18101097wru.165.1613382166644; 
 Mon, 15 Feb 2021 01:42:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m11sm4873738wmi.25.2021.02.15.01.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:42:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E32DA1FF7E;
 Mon, 15 Feb 2021 09:42:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 00/15] testing and gdbstub updates
Date: Mon, 15 Feb 2021 09:42:29 +0000
Message-Id: <20210215094244.12716-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

The following changes since commit 392b9a74b9b621c52d05e37bc6f41f1bbab5c6f8:

  Merge remote-tracking branch 'remotes/ericb/tags/pull-bitmaps-2021-02-12' into staging (2021-02-13 21:26:00 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-gdbstub-150221-1

for you to fetch changes up to 8886ff2844dc1a62dc4722ac65daf57c27dda2ee:

  tests/tcg: fix silent skipping of softmmu gdb tests (2021-02-15 09:38:54 +0000)

----------------------------------------------------------------
testing and gdbstub updates:

  - more migration of Travis to GitLab
  - drop Travis container
  - remove last of shippable
  - clean up gdbstub MAINTAINERS
  - remove gdb_get_floatN() helpers
  - don't be quiet about skipping gdb tests

----------------------------------------------------------------
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

 docs/devel/loads-stores.rst                        |  14 +--
 docs/devel/testing.rst                             |  14 ---
 include/exec/cpu-all.h                             |   8 --
 include/exec/gdbstub.h                             |  20 ----
 include/qemu/bswap.h                               |  60 -----------
 target/m68k/helper.c                               |   5 +-
 target/ppc/gdbstub.c                               |   8 +-
 target/sh4/gdbstub.c                               |   8 +-
 target/ppc/translate_init.c.inc                    |   4 +-
 .gitlab-ci.yml                                     |  40 +++++++-
 .shippable.yml                                     |  23 -----
 .travis.yml                                        | 113 +--------------------
 MAINTAINERS                                        |   5 +-
 scripts/{travis => ci}/coverage-summary.sh         |   2 +-
 tests/docker/Makefile.include                      |  11 +-
 tests/docker/dockerfiles/travis.docker             |  17 ----
 tests/docker/dockerfiles/ubuntu2004.docker         |   2 +
 tests/docker/travis                                |  22 ----
 tests/docker/travis.py                             |  47 ---------
 tests/tcg/multiarch/system/Makefile.softmmu-target |   6 +-
 20 files changed, 66 insertions(+), 363 deletions(-)
 delete mode 100644 .shippable.yml
 rename scripts/{travis => ci}/coverage-summary.sh (92%)
 delete mode 100644 tests/docker/dockerfiles/travis.docker
 delete mode 100755 tests/docker/travis
 delete mode 100755 tests/docker/travis.py

-- 
2.20.1


