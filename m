Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8208C5067A3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:24:25 +0200 (CEST)
Received: from localhost ([::1]:43198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngk5w-0001BM-Il
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsQ-0005Fc-QA
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:27 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsO-0008Hn-M9
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:26 -0400
Received: by mail-ed1-x534.google.com with SMTP id v15so20353718edb.12
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=isUubsyikrqghf2h0cBAdfObwaQMeXsG8cNC2aa09vU=;
 b=jd3rAzMwzUtch0HN8cadSEhrxIgWcxwi/kSSBDqD+BWX+TemLLiCB5QXpuA+6WImw2
 VVOk5qhMhhQ0uckVxY1UI7Gb5PM9jd5ZLwe7aJe8k8WlvAzOKULnul2igGfnEk8SIL8r
 +qmHgwhT73UkSISXUKsBBc0frDQZYgIP34N7CLgmSnoWUv4gkyBeHezQyJQoaIB8o0aI
 q2ZelfbiMSnaDHDqwISkn8zNKb94sgbnZM62tTJiF+qCCD7gSOjJnjpKrQJRVs/C6yEj
 ldKaQaeP9m/R0L8fDR0x1OJS3u3UFtcAFXekd27EeXxtj6iltbHXffRWOviOHcn/MxxC
 KdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=isUubsyikrqghf2h0cBAdfObwaQMeXsG8cNC2aa09vU=;
 b=pw2LK3mA5WN+/aTbhF9AHLL2cZL8f4R0XUIR8Jm/74E9JMu3mVV9eym/U4smcxaxpn
 HPH9ySCU37j/vWnfxMMyM/EueLXIW8mWxhh/ApK6SVZUZ8p6g7CMR3x2s3ry+42ccX8S
 HDdEMeRakfLqToTKsb4Pst4BIiSKgZbJmyJtRaHSqnbqlQcAULFasAnH96L7XifLwMOh
 3wrLvVHT0ynDDJJo7YZs2P/fU9QYrdAezsqTWUC1mTzZgyf2iobSG2h7GpNf4ygvZ0Qk
 ci5Uw9S+SsDNexpGk4sxwlT6hL2VpCYc1tXIQ+e4qN9CPA36rVI0bzaazkGXNHA7ejTH
 5u7g==
X-Gm-Message-State: AOAM530VuZeBiZBYt/WUzLEwe2VmUH/zX4tHtQWeovYV+oD1+cd9ISh4
 XWFEMt757rJuOsfvoVwH/JztHg==
X-Google-Smtp-Source: ABdhPJwqrGa8j//tHCdSj52NCP/jlqb2JAdEb46CkHaXxNo7aDcIbmJwgjBi4CNjd4lm7CgMPyL0PA==
X-Received: by 2002:aa7:d497:0:b0:41d:6fed:9f90 with SMTP id
 b23-20020aa7d497000000b0041d6fed9f90mr16183689edr.325.1650359422084; 
 Tue, 19 Apr 2022 02:10:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 lb26-20020a170907785a00b006ea4d2928e5sm5451236ejc.218.2022.04.19.02.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:10:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5503C1FFB7;
 Tue, 19 Apr 2022 10:10:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 for 7.1 00/25] testing, docs and gdbstub pre-PR
Date: Tue, 19 Apr 2022 10:09:55 +0100
Message-Id: <20220419091020.3008144-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

As we hope for the release of 7.0 to go without any hitches it is time
to a roll a pre-PR for my first 7.1 pull request. This includes:

  - some doc fixups for devel manual
  - a -cpu max test for check-avocado
  - Paolo's cross-compiler cleanups for check-tcg
  - some check-tcg cleanups and extensions
  - some fixes for gdbstub

I'll aim to roll the series once the tree is open again. Currently the
following patches need review:

 - tests/guest-debug: better handle gdb crashes
 - tests/tcg: add missing reference files for float_convs
 - tests/tcg: add float_convd test
 - tests/tcg: remove duplicate sha512-sse case
 - docs/devel: drop :hidden: and :includehidden: tags
 - docs/devel: add some notes on the binfmt-image-debian targets
 - tests/avocado: update aarch64_virt test to exercise -cpu max

Alex Bennée (8):
  tests/avocado: update aarch64_virt test to exercise -cpu max
  docs/devel: add some notes on the binfmt-image-debian targets
  docs/devel: drop :hidden: and :includehidden: tags
  tests/tcg: remove duplicate sha512-sse case
  tests/tcg: add float_convd test
  tests/tcg: add missing reference files for float_convs
  target/i386: fix byte swap issue with XMM register access
  tests/guest-debug: better handle gdb crashes

Paolo Bonzini (17):
  tests/docker: remove dead code for linux-user containers
  tests/docker: remove test targets
  tests/docker: remove dead variable
  tests/docker: remove unnecessary default definitions
  tests/docker: inline variable definitions or move close to use
  tests/docker: remove unnecessary filtering of $(DOCKER_IMAGES)
  tests/docker: simplify docker-TEST@IMAGE targets
  tests/docker: do not duplicate rules for hexagon-cross
  tests/tcg: add compiler test variables when using containers
  tests/tcg: remove CONFIG_LINUX_USER from config-target.mak
  tests/tcg: remove CONFIG_USER_ONLY from config-target.mak
  tests/tcg: prepare Makefile.prereqs at configure time
  tests/tcg: list test targets in Makefile.prereqs
  tests/tcg: invoke Makefile.target directly from QEMU's makefile
  tests/tcg: isolate from QEMU's config-host.mak
  tests/docker: remove SKIP_DOCKER_BUILD
  tests/tcg: fix non-static build

 docs/devel/index-api.rst                      |   1 -
 docs/devel/index-build.rst                    |   3 +-
 docs/devel/index-internals.rst                |   1 -
 docs/devel/index-process.rst                  |   1 -
 docs/devel/index-tcg.rst                      |   1 -
 docs/devel/index.rst                          |   2 -
 docs/devel/qtest.rst                          |   1 -
 docs/devel/testing.rst                        |  38 +
 configure                                     |   3 +-
 target/i386/gdbstub.c                         |   4 +-
 tests/tcg/multiarch/float_convd.c             | 106 ++
 MAINTAINERS                                   |   1 +
 tests/Makefile.include                        |  63 +-
 tests/avocado/boot_linux_console.py           |  25 -
 tests/avocado/machine_aarch64_virt.py         |  51 +
 tests/docker/Makefile.include                 | 115 +-
 tests/docker/docker.py                        |  57 -
 .../build-toolchain.sh                        |   0
 tests/docker/dockerfiles/empty.docker         |   8 -
 tests/guest-debug/run-test.py                 |  11 +-
 tests/tcg/Makefile.prereqs                    |  18 -
 tests/tcg/Makefile.qemu                       | 121 ---
 tests/tcg/Makefile.target                     |  14 +-
 tests/tcg/aarch64/Makefile.softmmu-target     |   2 +-
 tests/tcg/aarch64/Makefile.target             |  10 +-
 tests/tcg/aarch64/float_convd.ref             | 988 ++++++++++++++++++
 tests/tcg/arm/float_convd.ref                 | 988 ++++++++++++++++++
 tests/tcg/configure.sh                        |  78 +-
 tests/tcg/i386/Makefile.target                |   2 +-
 tests/tcg/i386/float_convd.conf               | 988 ++++++++++++++++++
 tests/tcg/i386/float_convs.ref                | 748 +++++++++++++
 tests/tcg/multiarch/Makefile.target           |   2 +-
 tests/tcg/ppc64/Makefile.target               |   4 +-
 tests/tcg/ppc64le/Makefile.target             |   4 +-
 tests/tcg/x86_64/Makefile.target              |   9 +-
 tests/tcg/x86_64/float_convd.ref              | 988 ++++++++++++++++++
 tests/tcg/x86_64/float_convs.ref              | 748 +++++++++++++
 37 files changed, 5780 insertions(+), 424 deletions(-)
 create mode 100644 tests/tcg/multiarch/float_convd.c
 create mode 100644 tests/avocado/machine_aarch64_virt.py
 rename tests/docker/dockerfiles/{debian-hexagon-cross.docker.d => debian-hexagon-cross.d}/build-toolchain.sh (100%)
 delete mode 100644 tests/docker/dockerfiles/empty.docker
 delete mode 100644 tests/tcg/Makefile.prereqs
 delete mode 100644 tests/tcg/Makefile.qemu
 create mode 100644 tests/tcg/aarch64/float_convd.ref
 create mode 100644 tests/tcg/arm/float_convd.ref
 create mode 100644 tests/tcg/i386/float_convd.conf
 create mode 100644 tests/tcg/i386/float_convs.ref
 create mode 100644 tests/tcg/x86_64/float_convd.ref
 create mode 100644 tests/tcg/x86_64/float_convs.ref

-- 
2.30.2


