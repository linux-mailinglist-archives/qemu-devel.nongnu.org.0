Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360A82DE1F7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:29:10 +0100 (CET)
Received: from localhost ([::1]:38936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDwb-000055-8p
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:29:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqDuk-0006mf-Jd
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:14 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqDuh-00033a-9c
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:14 -0500
Received: by mail-wr1-x42e.google.com with SMTP id i9so1769161wrc.4
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 03:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=71qCxFU33mBWkBlZ9GJymx0Z9KG3H5Q7RVnH/hRnqmQ=;
 b=wvd0gwIFnE02axl1+6ikXHRp3Wmjs+pCRw3DkKeBv5Ci2y6LsXLzykb/w7yjJte21h
 2flmtA0vV7XVmRp0z77/ECKqa1Gtv2JcrLB5yiXk/MKtu1yK69CzNtFFHEGUmuKcEMLX
 VFyF6GAaCBLYp2HUYZ1DKkYuzZtjozb2XCW604B3F2xd+1eaz1D2bArLeh9F7aFj791T
 llIguHfHrfbD1WwC3+lsTGIepm2e+FMPjElU567BrAg+pk8dwvqFPQde+sXLXjHQuxXF
 UraBkosCzGzS7nYgxsba5FSh3WDG4YnRAoOXr1So9yC8mDm043clhPMIpIrnpowb5pjQ
 E1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=71qCxFU33mBWkBlZ9GJymx0Z9KG3H5Q7RVnH/hRnqmQ=;
 b=YTFqfUEqrICfegWDIvf68aeyoiSwAEgsOKH0qHfb63Pcf+OXdoi2EkDffqdnTKMUOz
 h7UCzwQ+MHKV63YUwTTmg5q6O+/0GLrZRRbmxWEBor5hvBWwFRRbugpxsFaaUOULRoEu
 ziiwwUkBSazM106ODu/9n8brw83ORaqxzvTOxa75d8+0srvTdFK+WqrRmkjLShdxuVY4
 RE4AK6GvVFQPsaY5D6+pY+tof7bD9LOONksioAA5nnqsGagiGE3OWjSZMxgIN11VPZqk
 mmPmccqa3buLF8YDH3lcr+Uv0jUEZhxoWJRf5pkE7AfMX0d29t0OZ+2Hh+lwU4SBN42h
 1gTw==
X-Gm-Message-State: AOAM531tNIIDyG07/KXeq6LwTQmsin9YmDh0EPtVlxUqqvMQbbpN3Rc3
 3FcIvAKC7p5EX1ejjqVCV6TOEg==
X-Google-Smtp-Source: ABdhPJxWAM8qJOQFqyMdUX0mgB7Y1YqC5QXC8OAkrpt2jxKoTvnbodiTmym7b0+b7VoeC7cTebo4mA==
X-Received: by 2002:a5d:69cf:: with SMTP id s15mr3876818wrw.372.1608290829761; 
 Fri, 18 Dec 2020 03:27:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j2sm12901540wrt.35.2020.12.18.03.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 03:27:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A5F961FF7E;
 Fri, 18 Dec 2020 11:27:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 0/9] gdbstub/next (cleanups, softmmu, SVE)
Date: Fri, 18 Dec 2020 11:26:58 +0000
Message-Id: <20201218112707.28348-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

This is the next iteration of gdbstub/next. Apart from adding review
tags there are a few new patches:

 - now the 8.3.1 gating is there we can revert the disable of gdbstub-sha1
 - addition of some softmmu tests (which exercise watchpoints)
 - moving the SVE target representation to org.gnu.gdb.aarch64.sve

The final patch allows GDB to do SVE aware handling of pseudo registers
rather than treating the set as a custom target description. The
following still need review:

 - target/arm: use official org.gnu.gdb.aarch64.sve layout for registers
 - gdbstub: implement a softmmu based test
 - Revert "tests/tcg/multiarch/Makefile.target: Disable run-gdbstub-sha1 test"
 - configure: gate our use of GDB to 8.3.1 or above

Alex Bennée (8):
  test/guest-debug: echo QEMU command as well
  configure: gate our use of GDB to 8.3.1 or above
  Revert "tests/tcg/multiarch/Makefile.target: Disable run-gdbstub-sha1
    test"
  gdbstub: implement a softmmu based test
  gdbstub: drop CPUEnv from gdb_exit()
  gdbstub: drop gdbserver_cleanup in favour of gdb_exit
  gdbstub: ensure we clean-up when terminated
  target/arm: use official org.gnu.gdb.aarch64.sve layout for registers

Lirong Yuan (1):
  gdbstub: add support to Xfer:auxv:read: packet

 configure                                     |   7 +-
 include/exec/gdbstub.h                        |  14 +-
 bsd-user/syscall.c                            |   6 +-
 gdbstub.c                                     |  65 +++++++--
 linux-user/exit.c                             |   2 +-
 softmmu/runstate.c                            |   2 +-
 target/arm/arm-semi.c                         |   2 +-
 target/arm/gdbstub.c                          |  75 ++++------
 target/arm/helper.c                           |   2 +-
 target/m68k/m68k-semi.c                       |   2 +-
 target/nios2/nios2-semi.c                     |   2 +-
 MAINTAINERS                                   |   1 +
 tests/guest-debug/run-test.py                 |  35 +++--
 tests/tcg/aarch64/Makefile.softmmu-target     |   1 +
 tests/tcg/aarch64/gdbstub/test-sve-ioctl.py   |  11 ++
 tests/tcg/aarch64/system/boot.S               |   1 +
 tests/tcg/i386/Makefile.softmmu-target        |   1 +
 tests/tcg/i386/system/boot.S                  |   2 +-
 tests/tcg/multiarch/Makefile.target           |  13 +-
 tests/tcg/multiarch/gdbstub/memory.py         | 130 ++++++++++++++++++
 .../multiarch/gdbstub/test-qxfer-auxv-read.py |  57 ++++++++
 .../multiarch/system/Makefile.softmmu-target  |  19 ++-
 tests/tcg/x86_64/Makefile.softmmu-target      |   1 +
 tests/tcg/x86_64/system/boot.S                |   2 +-
 24 files changed, 371 insertions(+), 82 deletions(-)
 create mode 100644 tests/tcg/multiarch/gdbstub/memory.py
 create mode 100644 tests/tcg/multiarch/gdbstub/test-qxfer-auxv-read.py

-- 
2.20.1


