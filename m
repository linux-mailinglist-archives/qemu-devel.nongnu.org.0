Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9156A4C888F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:53:58 +0100 (CET)
Received: from localhost ([::1]:55382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzCf-00025b-Kw
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:53:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6H-00037D-Rx
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:21 -0500
Received: from [2a00:1450:4864:20::42e] (port=39467
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6F-00073w-7y
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:20 -0500
Received: by mail-wr1-x42e.google.com with SMTP id ay10so1678070wrb.6
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xcy8VuOQjM1nhko7FmPI8zEveI85lF1x53IVlFyhRok=;
 b=AJ2iVu+FuHY1VLArHCYLeZCM+kyS75/d3Mpu5VayGCdQGv0sA97/m3wib/eFD7p8EX
 GtBQh7IqGoBOCHzmjpWSOfoaPCmCeJo5Z2hhXXdEQbPt7xIgvWGULt75dU79zJD/wZzU
 mZH58LEQUewutn6DZNWkZXcPVhWFzahHnZoCxnpkKPJgzfkAuqUIfq1fH6vpmSHFt2FT
 gcanOFIrN2qEm3RgBNyx+mso6X3WpejrtiUTDyqV9PsGvO0Cd0RIAJ/RiApdRoq8tozp
 fz29aUA9F1DRjrFShl03yT9XpQH2vvCkb3mgFko30DfGIdvrO44iFldJ2DiHYzNZT1I0
 g9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xcy8VuOQjM1nhko7FmPI8zEveI85lF1x53IVlFyhRok=;
 b=pEfVJugzNjPf7WBbY77CbeoAsv7uJ3iSDJlmV9VCzV8e5Q6MDVP4a0IHGELT+qXMf0
 6zv33wYI7k++AgvM70CzWURVM4sMA4R/HxVh6GfqEPVrMXRoq2U00WaeZvLzacdf1OGa
 8KVMVFFwZu1ZaTZtsv43kAsRIdBfjL2r7use3OVa3BEz4cqFNYloXQJyBNaYslleGypW
 LAK+dlNU97qH5zA0QUJwFaie0izKxk//GGpOWEr5AqC6pLeGf0Es49avPVkOHL7J/J++
 ImeKz0ARf/hcYsMraFOnG1j5bfuAYpoHePxSXBo6psNQwUTbg4zoCLUL/wnI0+zswOq/
 jOqg==
X-Gm-Message-State: AOAM532AlhB9P9/ZVD/ip2+NevLqAXTs1d47HOKmkXwdN+aAUMw4I7zs
 v+uLu4iLfXqx7a70ShtOfgbyNA==
X-Google-Smtp-Source: ABdhPJx6l6lC73ayot2V5/pFBRZAYdirJab0o2mPExKR6JEX2vBt4dkyt9v23ozm/nM4PQw4VBNyCg==
X-Received: by 2002:adf:f782:0:b0:1ef:8cf0:4560 with SMTP id
 q2-20020adff782000000b001ef8cf04560mr10705245wrp.512.1646128037852; 
 Tue, 01 Mar 2022 01:47:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 17-20020a05600c021100b00381501414absm1915103wmi.24.2022.03.01.01.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:47:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 529A71FFB7;
 Tue,  1 Mar 2022 09:47:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 00/18] testing and semihosting updates
Date: Tue,  1 Mar 2022 09:46:57 +0000
Message-Id: <20220301094715.550871-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit fa435db8ce1dff3b15e3f59a12f55f7b3a347b08:

  Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-request' into staging (2022-02-24 12:48:14 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-and-semihosting-280222-1

for you to fetch changes up to b904a9096f112795e47986448c145f5970d33c33:

  tests/tcg: port SYS_HEAPINFO to a system test (2022-02-28 16:42:42 +0000)

----------------------------------------------------------------
Testing and semihosting updates:

  - restore TESTS/IMAGES filtering to docker tests
  - add NOUSER to alpine image
  - bump lcitool version
  - move arm64/s390x cross build images to lcitool
  - add aarch32 runner CI scripts
  - expand testing to more vectors
  - update s390x jobs to focal for gitlab/travis
  - disable threadcount for all sh4
  - fix semihosting SYS_HEAPINFO and test

----------------------------------------------------------------
Alex Bennée (17):
      tests/docker: restore TESTS/IMAGES filtering
      tests/docker: add NOUSER for alpine image
      tests/lcitool: update to latest version
      tests/docker: update debian-arm64-cross with lcitool
      tests/docker: update debian-s390x-cross with lcitool
      tests/docker: introduce debian-riscv64-test-cross
      scripts/ci: add build env rules for aarch32 on aarch64
      scripts/ci: allow for a secondary runner
      gitlab: add a new aarch32 custom runner definition
      tests/tcg/ppc64: clean-up handling of byte-reverse
      tests/tcg: build sha1-vector with O3 and compare
      tests/tcg: add sha512 test
      tests/tcg: add vectorised sha512 versions
      gitlab: upgrade the job definition for s390x to 20.04
      tests/tcg: completely disable threadcount for sh4
      semihosting/arm-compat: replace heuristic for softmmu SYS_HEAPINFO
      tests/tcg: port SYS_HEAPINFO to a system test

Thomas Huth (1):
      travis.yml: Update the s390x jobs to Ubuntu Focal

 docs/devel/ci-jobs.rst.inc                         |   7 +
 include/hw/loader.h                                |  14 +
 hw/core/loader.c                                   |  86 ++
 semihosting/arm-compat-semi.c                      | 124 +--
 tests/tcg/aarch64/system/semiheap.c                |  93 ++
 tests/tcg/multiarch/sha512.c                       | 990 +++++++++++++++++++++
 .gitlab-ci.d/container-cross.yml                   |  20 +-
 .gitlab-ci.d/custom-runners.yml                    |   2 +-
 ...untu-18.04-s390x.yml => ubuntu-20.04-s390x.yml} |  28 +-
 .../custom-runners/ubuntu-20.40-aarch32.yml        |  23 +
 .travis.yml                                        |  12 +-
 MAINTAINERS                                        |   1 +
 scripts/ci/setup/build-environment.yml             |  25 +
 scripts/ci/setup/gitlab-runner.yml                 |  38 +
 tests/docker/Makefile.include                      |  29 +-
 tests/docker/dockerfiles/debian-arm64-cross.docker | 186 +++-
 .../dockerfiles/debian-arm64-test-cross.docker     |  13 -
 .../dockerfiles/debian-riscv64-test-cross.docker   |  12 +
 tests/docker/dockerfiles/debian-s390x-cross.docker | 181 +++-
 tests/docker/dockerfiles/opensuse-leap.docker      |   3 +-
 tests/docker/dockerfiles/ubuntu1804.docker         |   3 +-
 tests/docker/dockerfiles/ubuntu2004.docker         |   3 +-
 tests/lcitool/libvirt-ci                           |   2 +-
 tests/lcitool/refresh                              |  16 +
 tests/tcg/aarch64/Makefile.target                  |  17 +
 tests/tcg/arm/Makefile.target                      |  17 +
 tests/tcg/configure.sh                             |   4 +-
 tests/tcg/i386/Makefile.target                     |   9 +
 tests/tcg/ppc64/Makefile.target                    |  20 +-
 tests/tcg/ppc64le/Makefile.target                  |   9 +-
 tests/tcg/s390x/Makefile.target                    |   9 +
 tests/tcg/sh4/Makefile.target                      |   2 +
 tests/tcg/x86_64/Makefile.target                   |   7 +
 33 files changed, 1816 insertions(+), 189 deletions(-)
 create mode 100644 tests/tcg/aarch64/system/semiheap.c
 create mode 100644 tests/tcg/multiarch/sha512.c
 rename .gitlab-ci.d/custom-runners/{ubuntu-18.04-s390x.yml => ubuntu-20.04-s390x.yml} (87%)
 create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
 delete mode 100644 tests/docker/dockerfiles/debian-arm64-test-cross.docker
 create mode 100644 tests/docker/dockerfiles/debian-riscv64-test-cross.docker

-- 
2.30.2


