Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88E94B29AF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:08:23 +0100 (CET)
Received: from localhost ([::1]:48230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYT8-00029X-GB
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:08:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOT-0007NM-CH
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:36 -0500
Received: from [2a00:1450:4864:20::532] (port=37589
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOK-0005Ad-NN
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:28 -0500
Received: by mail-ed1-x532.google.com with SMTP id da4so17151896edb.4
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MqG1bXlPPbXvN4Vb7Log6kjEHeVsV4s59HtXDd3EXzk=;
 b=uVWYSZJxLJ2TbG4crverXeVUT6DvsjX4wPbcjTLSy9H572QLDrAaMTtx4yDk2iAlQ5
 ouYl0JksURpZsndfeFkY4rEzCCL4taZXvDlvQ79Ce2pOa1lyXmO11DycuccQeNMW/zHC
 i2k62Mb8sJTbTOU8MfmhPsFAv89VV7SYuF2HG/OyobVhegGDzuPLIjevnSNnmcrHP3jv
 90kSb7X7A0zEppu3NfYbwV3PnkIU6PUvHB+Tv/yw5BvChzAI3zp5DmWNvG93raVlRKXQ
 BWycMAxyeLONgc7WQOSoyJtx2pJmN85o70/or9aeju3HMKqkHs26B8FRh7HbJkjIgvpp
 ufzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MqG1bXlPPbXvN4Vb7Log6kjEHeVsV4s59HtXDd3EXzk=;
 b=vTZL4drTWwWh6v8fKKMva1ly5KyyR+iZurRXzNVjkLt3QU6d9BCpKMfxqYEmPJAgGi
 Xzom5UzpUg/If2AzpcgxHJAM9kwNGzfsfxrNedvci6xTj0lGu7veud1dmY2uCZmDGOKR
 3UC/P6fIedli9C/BuqZOf9You4bNCLuk31rSI1nGtfUGDvXGSJHUuiWUOAbHQqK+0i4s
 9lHM0RLAyXQVlwVGd785QybBRpdyqKL/wmx69xbB7yf6yciYvx1U+M34MVF6TA/vrQ9B
 A45blfInVYMA2tks0Le/UZToADjwxqeDLIZ/rKoB5UFOKwnE3LsodNIVlysUF0C5j6YX
 eqdQ==
X-Gm-Message-State: AOAM5321KzUpD6Ml8kcXsMNU08ogixBi+ovk6vb6fYhIvDGRisoKDrDB
 80tQBhMOjhQXH+yhD5VgP/3jtA==
X-Google-Smtp-Source: ABdhPJxRBYW8v53nwK5ZTV/oCmwOFRYbWrPDsvmWTE86U4DZwfT+hLVDit1VoOXdKMYFnrft3vMLtw==
X-Received: by 2002:a05:6402:3c3:: with SMTP id
 t3mr2686425edw.444.1644595392362; 
 Fri, 11 Feb 2022 08:03:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 5sm22328ejr.200.2022.02.11.08.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 08:03:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9A2F21FFB7;
 Fri, 11 Feb 2022 16:03:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 00/11] testing/next (docker, lcitool, ci, tcg)
Date: Fri, 11 Feb 2022 16:02:58 +0000
Message-Id: <20220211160309.335014-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is the current state of my testing/next tree which introduces a
few different things:

 - some cleanups to IMAGE/TEST filtering
 - use lcitool to generate a new debian-arm64-cross
 - a messy attempt to enable aarch32 gitlab runners
 - some tests to better exercise TCGv_vec code

All patches could do with some review.

Alex Bennée (11):
  tests/docker: restore TESTS/IMAGES filtering
  tests/docker: add NOUSER for alpine image
  tests/lcitool: update to latest version
  tests/docker: update debian-arm64-cross with lci-tool
  tests/docker: introduce debian-riscv64-test-cross
  scripts/ci: add build env rules for aarch32 on aarch64
  scripts/ci: allow for a secondary runner
  gitlab: add a new aarch32 custom runner definition
  tests/tcg: build sha1-vector with O3 and compare
  tests/tcg: add sha512 test
  tests/tcg: add vectorised sha512 versions

 docs/devel/ci-jobs.rst.inc                    |   7 +
 tests/tcg/multiarch/sha512.c                  | 990 ++++++++++++++++++
 .gitlab-ci.d/container-cross.yml              |  17 +-
 .../custom-runners/ubuntu-20.40-aarch32.yml   |  23 +
 scripts/ci/setup/build-environment.yml        |  25 +
 scripts/ci/setup/gitlab-runner.yml            |  34 +
 tests/docker/Makefile.include                 |  28 +-
 .../dockerfiles/debian-arm64-cross.docker     | 186 +++-
 .../debian-arm64-test-cross.docker            |  13 -
 .../debian-riscv64-test-cross.docker          |  12 +
 tests/docker/dockerfiles/opensuse-leap.docker |   3 +-
 tests/docker/dockerfiles/ubuntu1804.docker    |   3 +-
 tests/docker/dockerfiles/ubuntu2004.docker    |   3 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/refresh                         |  11 +
 tests/tcg/aarch64/Makefile.target             |  17 +
 tests/tcg/arm/Makefile.target                 |  17 +
 tests/tcg/configure.sh                        |   4 +-
 tests/tcg/i386/Makefile.target                |   6 +
 tests/tcg/ppc64le/Makefile.target             |   5 +-
 tests/tcg/s390x/Makefile.target               |   9 +
 tests/tcg/x86_64/Makefile.target              |   7 +
 22 files changed, 1353 insertions(+), 69 deletions(-)
 create mode 100644 tests/tcg/multiarch/sha512.c
 create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
 delete mode 100644 tests/docker/dockerfiles/debian-arm64-test-cross.docker
 create mode 100644 tests/docker/dockerfiles/debian-riscv64-test-cross.docker

-- 
2.30.2


