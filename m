Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654C62EFB4F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:46:15 +0100 (CET)
Received: from localhost ([::1]:57338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0WM-00073w-Da
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:46:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0TG-0005W2-Lw
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:02 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0TE-0003AK-GI
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:02 -0500
Received: by mail-wm1-x336.google.com with SMTP id 3so9670056wmg.4
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N2bSIuhQoS80Z2lR4SOmrndvJaQLNisv3KuSO9la1dY=;
 b=HdeU2Dc5UgGvO2UuaTXnaK4+GJ1YMtT64wGeH3khA48OtasKBo9PMBCAQ0+XxFYuTO
 OdErwchyl3wGSALaw6CQlf43fmU3v+ofdr5xPw7DmOHjADE4BByURWQ45/NDiU0yjf7e
 lCalxFDP/P9na/JbyGpvpv55lXwUjcRJ7yrv8aOuC2vWvUPsxZSMeAtTgQqxHiT8kpEr
 RRVRpIKpIPEATyPpqYtIBzBM6fITJy5bZY1PaMN9EvD2mr6StYE/hclErprjvHkkmqE+
 LhS/hyOcAUqR4Q/WvsPiA4il6kxyB9EUBAvF0KbYY5YYIkPouJIxblOdO2jFOwuSGdr1
 ZDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N2bSIuhQoS80Z2lR4SOmrndvJaQLNisv3KuSO9la1dY=;
 b=ChudODlbC2HVqYBNsd3ZwHRBNmF3tWWcZSCKc8iT7SgZg6dldMf3g1M92zpL4SOPDj
 i4SgmNtZziap645szMYAQ0otHC3LTTnUwOiIU6dzRutlkxJtpbCJ8HNHO9eIj5C02Hbi
 6Mv79TZWkUmaO169Lu/0/pP3328JdGlomSoi8nPe84SnDTMheRaqxIfw0nTeFaJlBOBZ
 YkE4ZaCTaUQFZQuW94Z6ViOpVNP5w71QXotIs5CKSPqQpUttaOrspDhtpT0ncjzJ+oW7
 Yd3U0J7HdIIHkg5hR12HLo56o5gkLm7ednLIEnPHkBqEtw994yJNsEKxSI08V1wc4VkN
 UAfA==
X-Gm-Message-State: AOAM531TlC8kc7EOF7K4mpYCP+Rvt03N3xXs3Sw4sm9nk6a9eUcxxx+g
 Q9ZuoXP8Pb7Bq/r4OIVWZ75KLA==
X-Google-Smtp-Source: ABdhPJzMzVwX0mFhxYzYCFfEvMHYCFwmCr8hJY/gDObYg49tZEXNxKBA3Ul4JAl04m17fqCKQEMSWw==
X-Received: by 2002:a1c:dd07:: with SMTP id u7mr4923341wmg.51.1610145778554;
 Fri, 08 Jan 2021 14:42:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n16sm14941474wrj.26.2021.01.08.14.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 14:42:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E2E801FF7E;
 Fri,  8 Jan 2021 22:42:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 00/20] gdbstub, semihosting and test/tool updates (pre PR)
Date: Fri,  8 Jan 2021 22:42:36 +0000
Message-Id: <20210108224256.2321-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

This is gathering together my maintainer trees into one place in
advance of putting together a pull request next week. There are:

  - gdbstub: more tests and tweaks to SVE handling for ARM
  - semihosting: common code and enabling for RiscV
  - some minor test and devtool tweaks

Last chance to object to any of the changes ;-)

Alex Bennée (9):
  test/guest-debug: echo QEMU command as well
  configure: gate our use of GDB to 8.3.1 or above
  Revert "tests/tcg/multiarch/Makefile.target: Disable run-gdbstub-sha1
    test"
  gdbstub: implement a softmmu based test
  gdbstub: drop CPUEnv from gdb_exit()
  gdbstub: drop gdbserver_cleanup in favour of gdb_exit
  gdbstub: ensure we clean-up when terminated
  target/arm: use official org.gnu.gdb.aarch64.sve layout for registers
  Makefile: add GNU global tags support

Keith Packard (8):
  semihosting: Move ARM semihosting code to shared directories
  semihosting: Change common-semi API to be architecture-independent
  semihosting: Change internal common-semi interfaces to use CPUState *
  semihosting: Support SYS_HEAPINFO when env->boot_info is not set
  riscv: Add semihosting support
  semihosting: Implement SYS_ELAPSED and SYS_TICKFREQ
  semihosting: Implement SYS_TMPNAM
  semihosting: Implement SYS_ISERROR

Kito Cheng (1):
  riscv: Add semihosting support for user mode

Lirong Yuan (1):
  gdbstub: add support to Xfer:auxv:read: packet

Philippe Mathieu-Daudé (1):
  tests/docker: Remove Debian 9 remnant lines

 configure                                     |   7 +-
 Makefile                                      |   9 +-
 default-configs/devices/arm-softmmu.mak       |   1 +
 default-configs/devices/riscv32-softmmu.mak   |   2 +
 default-configs/devices/riscv64-softmmu.mak   |   2 +
 .../targets/aarch64-linux-user.mak            |   1 +
 .../targets/aarch64_be-linux-user.mak         |   1 +
 default-configs/targets/arm-linux-user.mak    |   1 +
 default-configs/targets/armeb-linux-user.mak  |   1 +
 .../targets/riscv32-linux-user.mak            |   1 +
 .../targets/riscv64-linux-user.mak            |   1 +
 hw/semihosting/common-semi.h                  |  39 ++
 include/exec/gdbstub.h                        |  14 +-
 include/qemu/timer.h                          |   2 +
 linux-user/qemu.h                             |   4 +-
 target/arm/cpu.h                              |   8 -
 target/riscv/cpu_bits.h                       |   1 +
 bsd-user/syscall.c                            |   6 +-
 gdbstub.c                                     |  65 ++-
 .../semihosting/common-semi.c                 | 525 ++++++++++++------
 linux-user/aarch64/cpu_loop.c                 |   3 +-
 linux-user/arm/cpu_loop.c                     |   3 +-
 linux-user/exit.c                             |   2 +-
 linux-user/riscv/cpu_loop.c                   |   5 +
 linux-user/{arm => }/semihost.c               |   8 +-
 softmmu/runstate.c                            |   2 +-
 target/arm/gdbstub.c                          |  75 +--
 target/arm/helper.c                           |   7 +-
 target/arm/m_helper.c                         |   7 +-
 target/m68k/m68k-semi.c                       |   2 +-
 target/nios2/nios2-semi.c                     |   2 +-
 target/riscv/cpu_helper.c                     |  10 +
 target/riscv/translate.c                      |  11 +
 util/qemu-timer-common.c                      |   4 +
 .../riscv/insn_trans/trans_privileged.c.inc   |  37 +-
 .gitignore                                    |   3 +
 MAINTAINERS                                   |   1 +
 hw/semihosting/Kconfig                        |   3 +
 hw/semihosting/meson.build                    |   3 +
 linux-user/arm/meson.build                    |   3 -
 linux-user/meson.build                        |   1 +
 qemu-options.hx                               |  10 +-
 target/arm/meson.build                        |   2 -
 tests/docker/Makefile.include                 |   1 -
 tests/guest-debug/run-test.py                 |  35 +-
 tests/tcg/aarch64/Makefile.softmmu-target     |   1 +
 tests/tcg/aarch64/gdbstub/test-sve-ioctl.py   |  11 +
 tests/tcg/aarch64/system/boot.S               |   1 +
 tests/tcg/i386/Makefile.softmmu-target        |   1 +
 tests/tcg/i386/system/boot.S                  |   2 +-
 tests/tcg/multiarch/Makefile.target           |  13 +-
 tests/tcg/multiarch/gdbstub/memory.py         | 130 +++++
 .../multiarch/gdbstub/test-qxfer-auxv-read.py |  57 ++
 .../multiarch/system/Makefile.softmmu-target  |  19 +-
 tests/tcg/x86_64/Makefile.softmmu-target      |   1 +
 tests/tcg/x86_64/system/boot.S                |   2 +-
 56 files changed, 888 insertions(+), 281 deletions(-)
 create mode 100644 hw/semihosting/common-semi.h
 rename target/arm/arm-semi.c => hw/semihosting/common-semi.c (66%)
 rename linux-user/{arm => }/semihost.c (89%)
 create mode 100644 tests/tcg/multiarch/gdbstub/memory.py
 create mode 100644 tests/tcg/multiarch/gdbstub/test-qxfer-auxv-read.py

-- 
2.20.1


