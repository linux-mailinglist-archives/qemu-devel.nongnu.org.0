Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24B23ADCCF
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:31:07 +0200 (CEST)
Received: from localhost ([::1]:60510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lup6w-0004gx-V6
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lup25-0008Ey-2q
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:05 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lup22-0002nG-Dr
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:04 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso8763261pjx.1
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 21:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kilRtNZnhYq0a8ylcC5yhvX0FRijHTwQS1lQhqAVsoQ=;
 b=V2nC2wV5I95CFO4o6vhNQioBrgn2iubl5Ui5IXz6acJt6sUaI8brY+dzyxx9n5tD5j
 YW4lmAsbKKAkd4E1cnwOZihMAW8N/i3CczxXM6XOCGkoi77Nxajvwc8yrvx4V4xwSYBF
 hbjoxU3Abqxp6mHoNGupMAjnPhmVC11iSLbg5+KwtfZm2RLmmyz3FIyaA4OPaMaXrvcB
 2wFajvMBgtkeeKefrOugKS/B69/K/ZvO4EZzkK6zTmbnW6cv4bCXKcwc3ETpSCxl5x+k
 R9WD2CwfIL8MDVqSg/6ka1nCmyFg3vlUaso3nmwspFFLfNFxCboa7qq57qCUpeoUSf+3
 v+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kilRtNZnhYq0a8ylcC5yhvX0FRijHTwQS1lQhqAVsoQ=;
 b=iiLbVvCACdAeWGzG8Djfu+/9WqtYpdW4/MnHbT+f7LXOTNnJRMhGmLh2wx2ebmA9j4
 q5eS5faGgG69oKyMXiCvouIY6fAo3awfR7l0lu5sJzbQd4AQbc1R7YGwEFimLoYg3R+x
 FJmeMlmF8Xxvks8qJ1X8kNqOTDsdIZ/2t01jFe+UvXA5/+HEwr36b9hRDJFf7HgqNfZJ
 sWDa7bupAVrl6UGT5pMnT9asd+I+ei4Dmt7CgTfcOUoDOOn1K6ryFflhQoJMaiwB6rgz
 Kj2YH+3mOpNh5HhQKkxMEQAZIpK1ZJzcepgZNvj2me6rYFvkRIUem8non+hIT9Rd4q6o
 ML1A==
X-Gm-Message-State: AOAM533Rfodwswj0LCCkI3mB+X4+uxEz4BRNEWUgco4cqkFXcVCWBzA1
 ZIo1MpXHOcOO/J4M8JoGSsMvs6YbsNEszQ==
X-Google-Smtp-Source: ABdhPJwAocuK5OKWIho1mRndl/WD/F3Hsh6Ysoq9z//Lbw+81b2zoAJNe7LoPukJ3L+nIFpZZ9LNnQ==
X-Received: by 2002:a17:90a:8b0d:: with SMTP id
 y13mr30144658pjn.14.1624163160802; 
 Sat, 19 Jun 2021 21:26:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b18sm11925859pfb.131.2021.06.19.21.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 21:26:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/33] tcg patch queue
Date: Sat, 19 Jun 2021 21:25:58 -0700
Message-Id: <20210620042559.1236022-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3ccf6cd0e3e1dfd663814640b3b18b55715d7a75:

  Merge remote-tracking branch 'remotes/kraxel/tags/audio-20210617-pull-request' into staging (2021-06-18 09:54:42 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210619-2

for you to fetch changes up to 1c9638667b7068539dc5783c9428d588b14162ea:

  util/oslib-win32: Fix fatal assertion in qemu_try_memalign (2021-06-19 14:51:51 -0700)

----------------------------------------------------------------
TCI cleanup and re-encoding
Fixes for #367 and #390.
Move TCGCond to tcg/tcg-cond.h.
Fix for win32 qemu_try_memalign.

----------------------------------------------------------------
Alessandro Di Federico (1):
      tcg: expose TCGCond manipulation routines

Richard Henderson (31):
      tcg: Combine dh_is_64bit and dh_is_signed to dh_typecode
      tcg: Add tcg_call_flags
      accel/tcg/plugin-gen: Drop inline markers
      plugins: Drop tcg_flags from struct qemu_plugin_dyn_cb
      accel/tcg: Add tcg call flags to plugins helpers
      tcg: Store the TCGHelperInfo in the TCGOp for call
      tcg: Add tcg_call_func
      tcg: Build ffi data structures for helpers
      tcg/tci: Improve tcg_target_call_clobber_regs
      tcg/tci: Move call-return regs to end of tcg_target_reg_alloc_order
      tcg/tci: Use ffi for calls
      tcg/tci: Reserve r13 for a temporary
      tcg/tci: Emit setcond before brcond
      tcg/tci: Remove tci_write_reg
      tcg/tci: Change encoding to uint32_t units
      tcg/tci: Implement goto_ptr
      tcg/tci: Implement movcond
      tcg/tci: Implement andc, orc, eqv, nand, nor
      tcg/tci: Implement extract, sextract
      tcg/tci: Implement clz, ctz, ctpop
      tcg/tci: Implement mulu2, muls2
      tcg/tci: Implement add2, sub2
      tcg/tci: Split out tci_qemu_ld, tci_qemu_st
      Revert "tcg/tci: Use exec/cpu_ldst.h interfaces"
      tcg/tci: Remove the qemu_ld/st_type macros
      tcg/tci: Use {set,clear}_helper_retaddr
      tests/tcg: Increase timeout for TCI
      accel/tcg: Probe the proper permissions for atomic ops
      tcg/sparc: Fix temp_allocate_frame vs sparc stack bias
      tcg: Allocate sufficient storage in temp_allocate_frame
      tcg: Restart when exhausting the stack frame

Stefan Weil (1):
      util/oslib-win32: Fix fatal assertion in qemu_try_memalign

 configure                                          |    3 +
 accel/tcg/atomic_template.h                        |   24 +-
 accel/tcg/plugin-helpers.h                         |    5 +-
 include/exec/helper-head.h                         |   37 +-
 include/exec/helper-tcg.h                          |   34 +-
 include/qemu/plugin.h                              |    1 -
 include/tcg/tcg-cond.h                             |  101 ++
 include/tcg/tcg-opc.h                              |    4 +-
 include/tcg/tcg.h                                  |   71 +-
 target/hppa/helper.h                               |    3 -
 target/i386/ops_sse_header.h                       |    3 -
 target/m68k/helper.h                               |    1 -
 target/ppc/helper.h                                |    3 -
 tcg/tcg-internal.h                                 |   22 +
 tcg/tci/tcg-target-con-set.h                       |    1 +
 tcg/tci/tcg-target.h                               |   68 +-
 accel/tcg/cputlb.c                                 |   95 +-
 accel/tcg/plugin-gen.c                             |   20 +-
 accel/tcg/user-exec.c                              |    8 +-
 plugins/core.c                                     |   30 +-
 tcg/optimize.c                                     |    3 +-
 tcg/tcg.c                                          |  299 +++--
 tcg/tci.c                                          | 1203 ++++++++++----------
 util/oslib-win32.c                                 |    6 +-
 tcg/sparc/tcg-target.c.inc                         |   16 +-
 tcg/tci/tcg-target.c.inc                           |  550 ++++-----
 tcg/meson.build                                    |    8 +-
 tcg/tci/README                                     |   20 +-
 tests/docker/dockerfiles/alpine.docker             |    1 +
 tests/docker/dockerfiles/centos8.docker            |    1 +
 tests/docker/dockerfiles/debian10.docker           |    1 +
 tests/docker/dockerfiles/fedora-i386-cross.docker  |    1 +
 tests/docker/dockerfiles/fedora-win32-cross.docker |    1 +
 tests/docker/dockerfiles/fedora-win64-cross.docker |    1 +
 tests/docker/dockerfiles/fedora.docker             |    1 +
 tests/docker/dockerfiles/ubuntu.docker             |    1 +
 tests/docker/dockerfiles/ubuntu1804.docker         |    1 +
 tests/docker/dockerfiles/ubuntu2004.docker         |    1 +
 tests/tcg/Makefile.target                          |    6 +-
 39 files changed, 1453 insertions(+), 1202 deletions(-)
 create mode 100644 include/tcg/tcg-cond.h

