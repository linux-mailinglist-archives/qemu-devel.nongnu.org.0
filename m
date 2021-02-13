Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD9B31AB81
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:07:18 +0100 (CET)
Received: from localhost ([::1]:54432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAudo-0003Rg-Lt
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:07:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaD-0001qn-FC
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:33 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAua9-00062S-Pn
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:33 -0500
Received: by mail-wr1-x436.google.com with SMTP id v14so2893259wro.7
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CRPphQ6p0B+2XWtuyWHAq2JPLRtfBb80YVX9UktTdYQ=;
 b=x138FYed5cIwTxyCyvAJUKwltsyovKHTdEyPCTPYYTpN8KZd2gKdBIunDfzvU8HhOQ
 ZR/QvRq9sh/IBa7Ny1QnbVZGbO4l7T2z/gJXFeOwCbwMnCX0iJz10gNLwLELiRI6ZT+U
 FTtk85rb5MF49fkOaFJOvw0+nF0xcqxw7k3MH5IbyJZ9zNht63URW38vVsi/9HJPiZYe
 GPQ14y/RnbBP6mon2y7Z8izrKZunMgCynLPLPQC+J82Zxpt2EjjMfIB3wwF3x6+Cg4uc
 6MaGBnix7kq7vobvfeZPO0QBMMRNBW788nVS5pqS9NU9zLmir5nBOogwj1SDiOTwVRh8
 elLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CRPphQ6p0B+2XWtuyWHAq2JPLRtfBb80YVX9UktTdYQ=;
 b=Yja6ucaQC7anoMElUqHPkmV5G8MVDrTqZceTHehTT2rNKsU/mI3W1MGnuSKARStZcq
 5ZzcD0Z/yDqyPhpYyP1S/xTxWRibQ0DqyHBVKnCDN735wJ7+B+RiQeIZ1o59r70NeCE4
 pzt0p6MG+BUKePnw3BOJVJxa2I5Gr0xhV29+T3qRsLt4jKrxkkXKFWxEjpQoTPwkCBX8
 vLxohcPLqDmhdPpIooJU0HH9V6gaZ63TQC6ogYW9KaV/TUak8iXJZbas3sISUzU5jg4q
 z9uj2w0wmcilgQlqwVk0jJzziqvaRdr0xRBcMdX32k+TTuZ4VXhZq60dgymRpX+r58Ow
 7nNA==
X-Gm-Message-State: AOAM532iTYmfZhuFrBwwrfOwOrvVH85PYiddkaYFjXg3BSHSlDxEI1t7
 lErHcmGGRwK0mRpACX40XYyWbQ==
X-Google-Smtp-Source: ABdhPJyZhw8IFwvgmVtA+Rg45wWHmKbh1w2nOZgd0p88QXsf5tFTFqAke7WlhH0CpVPwav6PMP9iDg==
X-Received: by 2002:a05:6000:143:: with SMTP id
 r3mr8750267wrx.357.1613221407811; 
 Sat, 13 Feb 2021 05:03:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u4sm14435932wrr.37.2021.02.13.05.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:03:26 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D1401FF7E;
 Sat, 13 Feb 2021 13:03:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 00/23] plugins/next pre-PR (hwprofile, regression fixes,
 icount count fix)
Date: Sat, 13 Feb 2021 13:03:02 +0000
Message-Id: <20210213130325.14781-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Hopefully the final round for the current plugins queue. I've added a
slightly more finessed version of the io_recompile handling for
plugins which is now call CF_MEMI_ONLY - which allows memory
instrumentation but nothing else. I've added an additional acceptance
test to ensure inline/cb based counting stays aligned. Along with the
usual tweaks and cleanups from review which are documented bellow the
--- of the commit messages.

The following remain un-reviewed:

 - tests/acceptance: add a memory callback check
 - tests/plugin: allow memory plugin to do both inline and callbacks
 - accel/tcg: cache single instruction TB on pending replay exception
 - tests/plugin: expand insn test to detect duplicate instructions

Alex Bennée (14):
  hw/virtio/pci: include vdev name in registered PCI sections
  plugins: add API to return a name for a IO device
  plugins: new hwprofile plugin
  accel/tcg/plugin-gen: fix the call signature for inline callbacks
  tests/plugin: expand insn test to detect duplicate instructions
  tests/acceptance: add a new set of tests to exercise plugins
  accel/tcg: actually cache our partial icount TB
  accel/tcg: cache single instruction TB on pending replay exception
  accel/tcg: re-factor non-RAM execution code
  accel/tcg: remove CF_NOCACHE and special cases
  accel/tcg: allow plugin instrumentation to be disable via cflags
  tests/acceptance: add a new tests to detect counting errors
  tests/plugin: allow memory plugin to do both inline and callbacks
  tests/acceptance: add a memory callback check

Richard Henderson (4):
  exec: Move TranslationBlock typedef to qemu/typedefs.h
  accel/tcg: Create io_recompile_replay_branch hook
  target/mips: Create mips_io_recompile_replay_branch
  target/sh4: Create superh_io_recompile_replay_branch

zhouyang (5):
  contrib: Don't use '#' flag of printf format
  contrib: Fix some code style problems, ERROR: "foo * bar" should be
    "foo *bar"
  contrib: Add spaces around operator
  contrib: space required after that ','
  contrib: Open brace '{' following struct go on the same line

 docs/devel/tcg-plugins.rst               |  34 +++
 include/exec/exec-all.h                  |   9 +-
 include/exec/plugin-gen.h                |   4 +-
 include/exec/tb-context.h                |   1 -
 include/hw/core/cpu.h                    |   4 +-
 include/hw/core/tcg-cpu-ops.h            |  13 +-
 include/qemu/plugin.h                    |   4 +
 include/qemu/qemu-plugin.h               |   6 +
 include/qemu/typedefs.h                  |   1 +
 target/arm/internals.h                   |   3 +-
 accel/tcg/cpu-exec.c                     |  61 +----
 accel/tcg/plugin-gen.c                   |  35 +--
 accel/tcg/translate-all.c                | 130 ++++------
 accel/tcg/translator.c                   |   5 +-
 contrib/ivshmem-server/main.c            |   2 +-
 contrib/plugins/hotblocks.c              |   2 +-
 contrib/plugins/hotpages.c               |   2 +-
 contrib/plugins/howvec.c                 |  19 +-
 contrib/plugins/hwprofile.c              | 305 +++++++++++++++++++++++
 contrib/plugins/lockstep.c               |   6 +-
 hw/virtio/virtio-pci.c                   |  22 +-
 plugins/api.c                            |  56 ++++-
 target/cris/translate.c                  |   2 +-
 target/lm32/translate.c                  |   2 +-
 target/mips/cpu.c                        |  18 ++
 target/moxie/translate.c                 |   2 +-
 target/sh4/cpu.c                         |  18 ++
 target/unicore32/translate.c             |   2 +-
 tests/plugin/insn.c                      |  12 +-
 tests/plugin/mem.c                       |  27 +-
 MAINTAINERS                              |   1 +
 contrib/plugins/Makefile                 |   1 +
 tests/acceptance/tcg_plugins.py          | 148 +++++++++++
 tests/tcg/i386/Makefile.softmmu-target   |  10 +
 tests/tcg/i386/Makefile.target           |   7 +
 tests/tcg/x86_64/Makefile.softmmu-target |  10 +
 36 files changed, 769 insertions(+), 215 deletions(-)
 create mode 100644 contrib/plugins/hwprofile.c
 create mode 100644 tests/acceptance/tcg_plugins.py

-- 
2.20.1


