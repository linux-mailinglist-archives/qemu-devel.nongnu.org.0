Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736A8342D1A
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 14:39:57 +0100 (CET)
Received: from localhost ([::1]:49114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNbpc-0004hq-1A
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 09:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbn3-000324-DZ
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:17 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:40835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbmv-0004D8-Vr
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:17 -0400
Received: by mail-ed1-x534.google.com with SMTP id b16so14045230eds.7
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 06:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cWAZnufMv5196SD1dILE1W9cidOBdFrbv8oUmQ9j2HU=;
 b=QLHFXqFlBaCFdiKEhNSDCNDLy6WnQs+IvGH9Tbm6aiwVe6EDvfMs59zMu3CkZd623a
 s75pnS9UbPJFM/gne/bOgXZbcm3FM4WxX+psoGWvM3d/sj18dwfHOKT4eEvlKA8/9LX3
 zZIOkyk/h8vxcrc+RbhKERJQukKPn5ZIUJ1Q82hvVJCITbOdM05G0W8X4MI3NsoSj1Ri
 8+enc10Svl1zZfBwt+RtR8W8bthiRzq6nbiSbGZg0IBgJ35hQrmTS+5GlOlGIP68varW
 EDYdLiYWGHQLiFYrbnsVPCERsoQteeE6v5/qrMVcFG4UVB55opJK//0G5EXastg6wwU1
 ksVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cWAZnufMv5196SD1dILE1W9cidOBdFrbv8oUmQ9j2HU=;
 b=N1mwprvOS69FotD1WT/bcwKwunhjd4dZ1ReTZhUgpFP9DM0V7HPEX9EKzSru9K0mPn
 MPz2qRDJgXOdEoPufgYIUO01TKrrWn5KfUTvPXizh4ZhfrWKrVloYs4Xxb2m5Krz/7YZ
 PIlJ36NUoS/c/5cyRgGJ8N1cXCq/VuGVBMhu+uu0JXlWce8uWil9D6s7Bg0NvmfmdDpI
 AYrgqggjdeE1F0Gr8vfRpGl9X8kVtJIAjoztjjLRVh1ZKjKli92oXbHTQi643r9s2GbC
 u6SYUCzNTDBXn1/v7pO/A9XdBddxkmEBmFPAxegsyCcSD1xcEZHX/skCvkD1eKjp6iC7
 IZdQ==
X-Gm-Message-State: AOAM530CmVIXiB3yg/RW45aGXf+Va+aLQo3pD6o8LpuncbogVNO9/Jhf
 pSayKzUKgYkF5DglhB6FugCDCA==
X-Google-Smtp-Source: ABdhPJzqc1XV7IeXqm+9HZDcv7OIcLuF7FnJQVb/ylplJrSgMX9/n36SqmZliMuiMWi0mnKQIixBJg==
X-Received: by 2002:aa7:d385:: with SMTP id x5mr15673409edq.289.1616247428072; 
 Sat, 20 Mar 2021 06:37:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k26sm5367304ejk.29.2021.03.20.06.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 06:37:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B45C61FF7E;
 Sat, 20 Mar 2021 13:37:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.0 v1 00/14] fixes for rc1 (kernel-doc, semihosting,
 testing)
Date: Sat, 20 Mar 2021 13:36:52 +0000
Message-Id: <20210320133706.21475-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
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

Here is my current collection of fixes for rc1. We have a couple of
documentation tweaks including the final bit of enabling work for the
plugin API to be included via kernel-doc. We have some semihosting
fixes which have been on the list before which just need the final bit
of review. Finally there is a selection of tweaks for CI issues which
hopefully get BSD (and Cirrus) up and running again.

The following still need review:

 - tests/tcg: add HeapInfo checking to semihosting test
 - linux-user/riscv: initialise the TaskState heap/stack info
 - semihosting: move semihosting tests to multiarch
 - docs/devel: expand style section of memory management
 - scripts/kernel-doc: strip QEMU_ from function definitions

Alex Bennée (9):
  scripts/kernel-doc: strip QEMU_ from function definitions
  docs/devel: include the plugin API information from the headers
  docs/devel: expand style section of memory management
  tools/virtiofsd: include --socket-group in help
  semihosting: move semihosting tests to multiarch
  semihosting/arm-compat-semi: unify GET/SET_ARG helpers
  semihosting/arm-compat-semi: don't use SET_ARG to report SYS_HEAPINFO
  linux-user/riscv: initialise the TaskState heap/stack info
  tests/tcg: add HeapInfo checking to semihosting test

Eric Blake (2):
  utils: Tighter tests for qemu_strtosz
  utils: Work around mingw strto*l bug with 0x

Thomas Huth (3):
  gitlab-ci.yml: Merge the trace-backend testing into other jobs
  configure: Don't use the __atomic_*_16 functions for testing 128-bit
    support
  cirrus.yml: Update the FreeBSD task to version 12.2

 docs/devel/style.rst                          |  46 +++--
 docs/devel/tcg-plugins.rst                    |   5 +
 configure                                     |   6 +-
 tests/tcg/aarch64/semicall.h                  |  18 ++
 tests/tcg/arm/semicall.h                      |  15 +-
 tests/tcg/riscv64/semicall.h                  |  22 +++
 linux-user/riscv/cpu_loop.c                   |   5 +
 semihosting/arm-compat-semi.c                 |  62 +++----
 tests/tcg/arm/semihosting.c                   |  26 ---
 .../arm-compat-semi}/semiconsole.c            |   2 +
 .../multiarch/arm-compat-semi/semihosting.c   |  71 ++++++++
 tests/unit/test-cutils.c                      | 171 +++++++++++++++++-
 tools/virtiofsd/fuse_lowlevel.c               |   1 +
 util/cutils.c                                 |  33 +++-
 .cirrus.yml                                   |   7 +-
 .gitlab-ci.yml                                |  30 +--
 MAINTAINERS                                   |   1 +
 scripts/kernel-doc                            |   3 +
 tests/tcg/Makefile.target                     |   3 +
 tests/tcg/aarch64/Makefile.target             |  18 --
 tests/tcg/arm/Makefile.target                 |  22 +--
 tests/tcg/multiarch/Makefile.target           |  31 ++++
 22 files changed, 430 insertions(+), 168 deletions(-)
 create mode 100644 tests/tcg/aarch64/semicall.h
 create mode 100644 tests/tcg/riscv64/semicall.h
 delete mode 100644 tests/tcg/arm/semihosting.c
 rename tests/tcg/{arm => multiarch/arm-compat-semi}/semiconsole.c (93%)
 create mode 100644 tests/tcg/multiarch/arm-compat-semi/semihosting.c

-- 
2.20.1


