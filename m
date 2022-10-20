Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A630960633B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:36:32 +0200 (CEST)
Received: from localhost ([::1]:33556 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWes-0002UZ-Ip
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:36:30 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWWU-0005l6-0f
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU5v-0002cz-Pc
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:30 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU5t-0000nF-Ru
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:15 -0400
Received: by mail-wr1-x432.google.com with SMTP id v1so4718495wrt.11
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+B4GzlWXWiP9Upd6Rg4oVg9IEzG6zFAZsiOi8BQcrIM=;
 b=dHtKvqEdDqwEsEPBT3YobfGF8dDlGDzjWopjSveaQ+8EVJHeFfRCXAN/4hYNRSECTK
 2QtQEb2+I1AXGPzkLLLccLdmJyH6AK3Uzlf3bvcFqKGqtlnUqrCrtrEf+/EkJ8zuegLg
 wzTYSq97fJHXEijff1WlbTbvYD4i942iwzBrDLNr4nx6BTe5rHDWxWPY4c6U4CKIxtwd
 6Rlb6QWJFeXh/JaKZBaaL4WN8OlgBBuf+pvyG7eaExEt1nWMywTQ5Koe7pczDA296/NL
 h7/mIsA/UlHBU+rjIC+JG2N1smSN9/eNUt0koho/yAEdqc5UqSaqwOsHMdlZCHBfAKPb
 17PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+B4GzlWXWiP9Upd6Rg4oVg9IEzG6zFAZsiOi8BQcrIM=;
 b=hMA2drt4YqEPMeHgHyKzJnlxO9olnZIbpEIrkBr2Kxet9+1ETCvP3gsNnFLDMPkTmH
 Zo3uc9f1RP3I5W9moVIDVd4j/H7tqaF0DkEQbBw7Ox+ofkG85v6mHSurVVMG/KGvh/Z9
 +myXEfF3aL1I5zOhQPVE7g0qEEK3+WiCbL38UDHxa50PT0jdM1vDuyLT5obM3vejZyro
 DE4Ub6huGnudm1jKrnGqK42xD6+Qi0fzkDXX5CU8FCEzBXdiuCGEHx+tiuN+e+YDj3Oz
 g9WC5Re+qc4IZ9+RMK1CrZU5OAH+2z4CUZI2anQy/IggfiXb9Krd6vrgvXpWbUOLmOLp
 4rVQ==
X-Gm-Message-State: ACrzQf0Fr3xneGHeqUZ4pSalGnGGSelRo0ixc3TB+k6JBAZLSnCx+y2m
 CMHEVVAaLwc5wL2zfnrq6Mr+SA==
X-Google-Smtp-Source: AMsMyM4FPBtCiKZEaTvC9v9Eq4apzu+zEl77syvSls3b/mdlxZo7tmYx8CFQUgjmDKbUfjHseICJ8w==
X-Received: by 2002:a5d:59ae:0:b0:230:24a1:f295 with SMTP id
 p14-20020a5d59ae000000b0023024a1f295mr8488486wrr.457.1666266730762; 
 Thu, 20 Oct 2022 04:52:10 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n33-20020a05600c3ba100b003c6b7f55673sm2696931wms.2.2022.10.20.04.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:52:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A44671FFB7;
 Thu, 20 Oct 2022 12:52:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org (open list:S390 general arch...)
Subject: [PATCH  v3 00/26] testing/next (docker, avocado, s390x, MAINTAINERS)
Date: Thu, 20 Oct 2022 12:51:43 +0100
Message-Id: <20221020115209.1761864-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The testing/next changes have accumulated a few more fixes since the
last posting. Including:

  - a bunch of Bin Meng's test cleanups for windows
  - some avocado test fixes and tweaks
  - disabling an sh4 avocado test (possibly a missed recent intermittent regression)
  - enabling some sh4 check-tcg tests (now bugs are fixed)
  - a minor excursion into the s390 translator    

The following still need review:

  - target/s390x: fake instruction loading when handling 'ex'
  - target/s390x: don't probe next pc for EXecuted insns
  - target/s390x: don't use ld_code2 to probe next pc
  - tests/tcg: re-enable threadcount for sh4
  - tests/tcg: re-enable linux-test for sh4
  - tests/avocado: disable sh4 rd2 tests on Gitlab
  - tests/avocado: set -machine none for userfwd and vnc tests
  - MAINTAINERS: fix-up for check-tcg Makefile changes
  - MAINTAINERS: add features_to_c.sh to gdbstub files
  - MAINTAINERS: add entries for the key build bits
  - tests/tcg: use regular semihosting for nios2-softmmu
  - tests/avocado: extend the timeout for x86_64 tcg tests
  - configure: fix the --enable-static --disable-pie case
  - configure: don't enable cross compilers unless in target_list
  - tests/docker: update fedora-win[32|64]-cross with lcitool

Alex Bennée (16):
  tests/docker: update fedora-win[32|64]-cross with lcitool
  tests/docker: update test-mingw to run single build
  configure: don't enable cross compilers unless in target_list
  configure: fix the --enable-static --disable-pie case
  tests/avocado: extend the timeout for x86_64 tcg tests
  tests/tcg: use regular semihosting for nios2-softmmu
  MAINTAINERS: add entries for the key build bits
  MAINTAINERS: add features_to_c.sh to gdbstub files
  MAINTAINERS: fix-up for check-tcg Makefile changes
  tests/avocado: set -machine none for userfwd and vnc tests
  tests/avocado: disable sh4 rd2 tests on Gitlab
  tests/tcg: re-enable linux-test for sh4
  tests/tcg: re-enable threadcount for sh4
  target/s390x: don't use ld_code2 to probe next pc
  target/s390x: don't probe next pc for EXecuted insns
  target/s390x: fake instruction loading when handling 'ex'

Anton Johansson (2):
  tests/docker: Add flex/bison to `debian-all-test`
  tests/docker: Add flex/bison to `debian-hexagon-cross`

Bin Meng (6):
  semihosting/arm-compat-semi: Avoid using hardcoded /tmp
  tcg: Avoid using hardcoded /tmp
  util/qemu-sockets: Use g_get_tmp_dir() to get the directory for
    temporary files
  block/vvfat: Unify the mkdir() call
  fsdev/virtfs-proxy-helper: Use g_mkdir()
  hw/usb: dev-mtp: Use g_mkdir()

Paolo Bonzini (1):
  tests/tcg: include CONFIG_PLUGIN in config-host.mak

Peter Maydell (1):
  tests/avocado: raspi2_initrd: Wait for guest shutdown message before
    stopping

 configure                                     |  17 +-
 include/exec/translator.h                     |  17 ++
 block/vvfat.c                                 |   9 +-
 fsdev/virtfs-proxy-helper.c                   |   3 +-
 hw/usb/dev-mtp.c                              |   4 +-
 semihosting/arm-compat-semi.c                 |   3 +-
 target/s390x/tcg/translate.c                  |  14 +-
 tcg/tcg.c                                     |   3 +-
 util/qemu-sockets.c                           |   5 +-
 MAINTAINERS                                   |  28 ++-
 tests/avocado/boot_linux.py                   |   1 +
 tests/avocado/boot_linux_console.py           |   6 +-
 tests/avocado/info_usernet.py                 |   3 +
 tests/avocado/vnc.py                          |   1 +
 tests/docker/dockerfiles/alpine.docker        |   2 +-
 tests/docker/dockerfiles/centos8.docker       |   2 +-
 .../dockerfiles/debian-all-test-cross.docker  |   2 +
 .../dockerfiles/debian-amd64-cross.docker     | 234 ++++++++---------
 tests/docker/dockerfiles/debian-amd64.docker  | 236 +++++++++---------
 .../dockerfiles/debian-arm64-cross.docker     | 232 ++++++++---------
 .../dockerfiles/debian-armel-cross.docker     | 230 ++++++++---------
 .../dockerfiles/debian-armhf-cross.docker     | 232 ++++++++---------
 .../dockerfiles/debian-hexagon-cross.docker   |   2 +-
 .../dockerfiles/debian-mips64el-cross.docker  | 226 ++++++++---------
 .../dockerfiles/debian-mipsel-cross.docker    | 226 ++++++++---------
 .../dockerfiles/debian-ppc64el-cross.docker   | 230 ++++++++---------
 .../dockerfiles/debian-s390x-cross.docker     | 228 ++++++++---------
 .../dockerfiles/fedora-win32-cross.docker     | 139 ++++++++---
 .../dockerfiles/fedora-win64-cross.docker     | 138 +++++++---
 tests/docker/dockerfiles/fedora.docker        | 230 ++++++++---------
 tests/docker/dockerfiles/opensuse-leap.docker |   2 +-
 tests/docker/dockerfiles/ubuntu2004.docker    | 234 ++++++++---------
 tests/docker/test-mingw                       |  16 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/refresh                         |  48 ++--
 tests/tcg/nios2/Makefile.softmmu-target       |   3 +-
 tests/tcg/sh4/Makefile.target                 |  12 -
 37 files changed, 1600 insertions(+), 1420 deletions(-)

-- 
2.34.1


