Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B371150C56
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 15:49:59 +0200 (CEST)
Received: from localhost ([::1]:51312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfPM6-00009C-Cg
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 09:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41411)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hfPGA-0006aW-KK
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:43:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hfPG8-0007Uu-Km
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:43:50 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:56096)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hfPG2-0007I0-N3
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:43:44 -0400
Received: by mail-wm1-x335.google.com with SMTP id a15so12859699wmj.5
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 06:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kCmDXFJEpdyA4OSV2vu9c0OSfeNk3vyIoSJrUtmO0Ds=;
 b=WHyquUwkzhh1Oh6dFU0qtkfNipv1h8FMhZEFZW7xcc94a3t+TIqyKdWrQahvC+vI7c
 H7iHSxaLwpnbenzumPPAEkXRTbJzKbwL+7piXT9L2QFHxuCFT5M0f7XIM/q6wHEPC1gj
 saiLtb6vRoz0/vA88IJz7I8B4wvl7ojQb5m+mvEk5SQ3pweeVJBR+MuGDC1+tA1TEx1q
 +78A2ywYBTQJ/KdfLSTgf+xB9EqSFg/hdpcW4lyqXPjFVZBzD58Ae7Dor1G3srZbWQo7
 wW/nFqDBXcwV3dpnzly4vB4+Ia4J0JH7aPuENFemhR7IIx1XB5Ei8v54jfrBQ1JxEyFm
 nemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kCmDXFJEpdyA4OSV2vu9c0OSfeNk3vyIoSJrUtmO0Ds=;
 b=BOz26N7mHpj2ZLMyoLxYhmciS9q6U2hPheCpxevmhavFsiRUiDzREtzd8EkSjaQq8f
 cZ7jrrvO7Nnwz11s+Sh8hyIZnpnI/rAJ9chDLP7dn/Ee05QJGSmhl+iD0HFgjkLdborT
 i3kKWeLXHPViboFjz7bcp/W396Uupe9/nQI5vqV1ixvA57lTQqEKzVTaK/nPLOXzO4Vr
 1dToeCPIUWPcsTJE9jIwgBo/8JB80eh3uUNWpGA1ePSCJubjUGKGrzbkvKv5fbbKngZB
 jraFTKlPUmCzZJfRq+O4+2Rv/nAzZ5uX6hBiJIYNWq571Et4zVLkW9Pyh/NmGY1TZCUZ
 Y9/w==
X-Gm-Message-State: APjAAAXR8/TyRLmD8BqFJ8/sYK8hLgCmF9saiZaT4nLcFrNdctVs4J7n
 J9Ijl/NrbRuBEPXfaR8MNqwyQA==
X-Google-Smtp-Source: APXvYqxFYCvY8t8jNEQdesMG6XD58z9vLYiftFzy/mtYrrKU0JczgCxuyMwSmMxW70rXSY28rLJzuA==
X-Received: by 2002:a1c:4184:: with SMTP id o126mr15953163wma.68.1561383818498; 
 Mon, 24 Jun 2019 06:43:38 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id z5sm9370202wma.36.2019.06.24.06.43.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 06:43:37 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 755661FF87;
 Mon, 24 Jun 2019 14:43:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Mon, 24 Jun 2019 14:43:18 +0100
Message-Id: <20190624134337.10532-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::335
Subject: [Qemu-devel] [PULL 00/19] testing/next (tests/vm,
 Travis and hyperv build fix)
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

The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde:

  Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-2019' into staging (2019-06-21 15:40:50 +0100)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-next-240619-1

for you to fetch changes up to e0fe22c3528773fcbfd135a0ef7f6b3c5d373bb9:

  target/i386: fix feature check in hyperv-stub.c (2019-06-24 14:36:39 +0100)

----------------------------------------------------------------
Various testing fixes:

   - tests/vm updates and clean-ups
   - tests/vm serial autobuild on host
   - ensure MacOS builds do "brew update"
   - ensure we test --static user builds
   - fix hyperv compile failure

This brings my testing back to green on all CI services.

----------------------------------------------------------------
Alex Bennée (3):
      .travis.yml: default the --disable-system build to --static
      .travis.yml: force a brew update for MacOS builds
      target/i386: fix feature check in hyperv-stub.c

Cleber Rosa (4):
      tests/vm: avoid extra compressed image copy
      tests/vm: avoid image presence check and removal
      tests/vm: pin ubuntu.i386 image
      tests/vm: add source repos on ubuntu.i386

Gerd Hoffmann (11):
      tests/vm: send proxy environment variables over ssh
      tests/vm: use ssh with pty unconditionally
      tests/vm: run test builds on snapshot
      tests/vm: proper guest shutdown
      tests/vm: add vm-boot-{ssh,serial}-<guest> targets
      tests/vm: serial console support helpers
      tests/vm: openbsd autoinstall, using serial console
      tests/vm: freebsd autoinstall, using serial console
      tests/vm: netbsd autoinstall, using serial console
      tests/vm: fedora autoinstall, using serial console
      tests/vm: ubuntu.i386: apt proxy setup

Philippe Mathieu-Daudé (1):
      Makefile: Rename the 'vm-test' target as 'vm-help'

 .travis.yml               |   3 +-
 Makefile                  |   4 +-
 docs/devel/testing.rst    |   4 +-
 target/i386/hyperv-stub.c |   2 +-
 tests/vm/Makefile.include |  28 ++++++-
 tests/vm/basevm.py        | 135 ++++++++++++++++++++++++++++-----
 tests/vm/centos           |   6 +-
 tests/vm/fedora           | 189 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/vm/freebsd          | 180 ++++++++++++++++++++++++++++++++++++++++---
 tests/vm/netbsd           | 187 ++++++++++++++++++++++++++++++++++++++++++---
 tests/vm/openbsd          | 159 ++++++++++++++++++++++++++++++++++----
 tests/vm/ubuntu.i386      |  11 ++-
 12 files changed, 841 insertions(+), 67 deletions(-)
 create mode 100755 tests/vm/fedora

--
2.20.1


