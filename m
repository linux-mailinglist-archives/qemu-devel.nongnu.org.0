Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B99580081
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:11:01 +0200 (CEST)
Received: from localhost ([::1]:45370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFynT-0006PQ-Pa
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyi6-0000p3-0w
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:26 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyi3-0000Ca-KF
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:25 -0400
Received: by mail-wr1-x435.google.com with SMTP id b26so16134775wrc.2
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 07:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cB57w4C+nd2zErg/MWHj8mg6ds/8aVo+6hyBcgTEsYQ=;
 b=LnnmZz9iRe4mx9ujgOpFRina2DwJV1sAinObCgJW0VLuC0Tt7SqKWD0DkIO2QPgGny
 frOZs6rYDbyh8iGvAXxjeG057fHp1k3R6mcTHI2ZuWOWYv383M7gq5JKfBMkjQncsbvK
 xbVySuhxpXRCZkcV+QM1i2GVzw5AI/OuCaMUoMVH9Z+5vzL6OZxeE2sPCwh9QbzN0ADM
 88TSvCOJbp0YIIFVgZo30ZWuFWdYZMjVLDT1A36/tvwvenDhs/bFAxaJ4ZVEMJ9+eJCT
 uSxGyMrxgC3W2N0cfP5VzemmMA4z1nWC0DDMZgr61/rIxbB8ABQfi0aMmP5I1Xts8LDf
 Bw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cB57w4C+nd2zErg/MWHj8mg6ds/8aVo+6hyBcgTEsYQ=;
 b=tocgDXpMfe9L3tMPYtG22fI7FFk6DOehVAo27ALeSVOpskH0ybXeW1obimDYphXSe3
 J/HDUpf7ZH//CsXEEtr3WUbo6oIqQT9P5uhiCkuQp6RsxAg6BYAl3fS91uqGJP9wXhif
 xsTBpP2DLTrygSFqp+vTfNTiwneoJlPaTJepkMRv08c/9pEaQzSzT7y9qDSmrFq0ybKD
 9sN/5I37UYcdMNOqdDJ7piPpDuMRV2Kp0fhEu6fskNaKo5CiVNhKp2WrPYvpriGAYqj9
 ueoCBgAJZDQpohiouGSHAtP7TYbE3F8DLmTYWATlHQuCAfrqzPGOXoNyi8Jt8KPgkf+P
 Y6eQ==
X-Gm-Message-State: AJIora9c+Uj2kQnbqzyIqKl4KL1GLlxLNAC95Wmpw3V9seer4OYr8XPr
 bwXIl6ZDkmc6w/r5bXqONgukOA==
X-Google-Smtp-Source: AGRyM1ur/GhGBukFKEZ/3MyqTqABhoeuSJycfApqTqMcToZe59QaJAHWUbbdKaIBO7Av0haiEaE5rw==
X-Received: by 2002:adf:ea8c:0:b0:21e:463e:7480 with SMTP id
 s12-20020adfea8c000000b0021e463e7480mr7907801wrm.171.1658757921948; 
 Mon, 25 Jul 2022 07:05:21 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a1c7715000000b003a331c6bffdsm13704269wmi.47.2022.07.25.07.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 07:05:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 648D11FFB7;
 Mon, 25 Jul 2022 15:05:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 00/13] fixes for 7.1 (testing, docs, semihosting)
Date: Mon, 25 Jul 2022 15:05:07 +0100
Message-Id: <20220725140520.515340-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

As per usual I've opened up a tree for fixes for the 7.1 release. It
started as testing/next but I've included some fixes for semihosting
and a few minor doc updates as well. I'll roll a PR from this at the
end of the week (unless it doesn't meet the bar for missing rc0
tomorrow).

Alex Bennée (2):
  docs/devel: fix description of OBJECT_DECLARE_SIMPLE_TYPE
  qemu-options: bring the kernel and image options together

Bin Meng (2):
  .cirrus.yml: Change winsymlinks to 'native'
  .gitlab-ci.d/windows.yml: Enable native Windows symlink

Daniel P. Berrangé (3):
  tests: refresh to latest libvirt-ci module
  gitlab: show testlog.txt contents when cirrus/custom-runner jobs fail
  gitlab: drop 'containers-layer2' stage

Ilya Leoshkevich (2):
  qapi: Add exit-failure PanicAction
  tests/tcg/s390x: Test unaligned accesses to lowcore

Peter Maydell (4):
  semihosting: Don't return negative values on
    qemu_semihosting_console_write() failure
  semihosting: Don't copy buffer after console_write()
  semihosting: Check for errors on SET_ARG()
  semihosting: Fix handling of buffer in TARGET_SYS_TMPNAM

 docs/devel/qom.rst                            |  3 +-
 qapi/run-state.json                           |  4 +-
 include/sysemu/sysemu.h                       |  2 +-
 semihosting/arm-compat-semi.c                 | 29 +++++-
 semihosting/console.c                         |  3 +-
 semihosting/syscalls.c                        |  2 +-
 softmmu/main.c                                |  6 +-
 softmmu/runstate.c                            | 17 +++-
 .cirrus.yml                                   |  2 +-
 .gitlab-ci.d/cirrus/build.yml                 |  3 +-
 .gitlab-ci.d/cirrus/freebsd-12.vars           |  3 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |  3 +-
 .gitlab-ci.d/cirrus/macos-11.vars             |  4 +-
 .gitlab-ci.d/container-cross.yml              | 24 ++---
 .../custom-runners/centos-stream-8-x86_64.yml |  2 +
 .../custom-runners/ubuntu-20.04-aarch32.yml   |  2 +
 .../custom-runners/ubuntu-20.04-aarch64.yml   | 12 +++
 .../custom-runners/ubuntu-20.04-s390x.yml     | 12 +++
 .gitlab-ci.d/stages.yml                       |  1 -
 .gitlab-ci.d/windows.yml                      |  2 +
 qemu-options.hx                               | 98 +++++++++++++++----
 tests/docker/dockerfiles/alpine.docker        |  4 +-
 tests/docker/dockerfiles/centos8.docker       |  6 +-
 tests/docker/dockerfiles/debian-amd64.docker  |  2 +
 .../dockerfiles/debian-arm64-cross.docker     |  2 +
 .../dockerfiles/debian-armel-cross.docker     |  2 +
 .../dockerfiles/debian-armhf-cross.docker     |  2 +
 .../dockerfiles/debian-mips64el-cross.docker  |  2 +
 .../dockerfiles/debian-mipsel-cross.docker    |  2 +
 .../dockerfiles/debian-ppc64el-cross.docker   |  2 +
 .../dockerfiles/debian-s390x-cross.docker     |  2 +
 tests/docker/dockerfiles/fedora.docker        |  3 +-
 tests/docker/dockerfiles/opensuse-leap.docker |  7 +-
 tests/docker/dockerfiles/ubuntu2004.docker    |  2 +
 tests/lcitool/libvirt-ci                      |  2 +-
 tests/lcitool/projects/qemu.yml               |  6 +-
 tests/lcitool/refresh                         |  4 +-
 tests/tcg/s390x/Makefile.softmmu-target       |  9 ++
 tests/tcg/s390x/unaligned-lowcore.S           | 19 ++++
 39 files changed, 242 insertions(+), 70 deletions(-)
 create mode 100644 tests/tcg/s390x/Makefile.softmmu-target
 create mode 100644 tests/tcg/s390x/unaligned-lowcore.S

-- 
2.30.2


