Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A230940FDF9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:34:39 +0200 (CEST)
Received: from localhost ([::1]:47960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGow-0002eo-Me
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeI-0003S7-8v
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:38 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeF-0005PA-Mq
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:38 -0400
Received: by mail-wr1-x431.google.com with SMTP id u18so14342023wrg.5
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 09:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zve0GkimwQsE4HrEgfcmpH78aU33D7mOgzjLF1SWoiw=;
 b=W855Sk94JHX+pMPUG+yW0ZtrvG04QD4T+L9wyHzjHs/l/2prwzsbfdP7u8fw3ITpEB
 DE/cslSX0TYoR3z2JZaa3/IzJyy/Eu33JVOuJ+UX4wQuQydi12Aj8wroDWfYCHNEmFI2
 ChMZUk63rQ2eZeiD0dRs3zjWfiPO4HwNNwKdoKrwevkmMW6DQfpR79Fh2sTPs5pMhyh1
 EJ24O2lM2gm1WhWmjyNTODmaSOW8+bYQwrhcClY02rU95/gKLJ8iBYOUaQM5HVTxzGeY
 3y2GsRMV9cqbdOPmsmHFfPLiV6KBai5OM91ftag6awFCn3tCgMmkkmngHlpdkbfU3MA+
 xNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zve0GkimwQsE4HrEgfcmpH78aU33D7mOgzjLF1SWoiw=;
 b=fwpLoQCnkkH8LHJ/XtG0YhmEnj4uKJnS4Dwe3JKUqs5Z8mLD/Nqa1+jQJb5IJJwWUN
 qbqC7K5KUDNeFXGPxyQB2xGpN1hZMilPGstEMhu87mquMsSP/mt0a/g/Apc8QCMq2wOg
 h5ZMMnF8fwxf0PEpmnONwxjAbsohMABrYuka7Hy9TukqM+qUsvyI8whf5wENsKBa1QSm
 7RGCb1THT83auHwlKGcvFzjOr5k20ZP91YgVly9gEeKUV6kd+72CnAHKlcp3FnOq/s0J
 vq5yOjqlJ2CXAFqP6xhxVMOwPzxVnHmnzq7MAp0K0emABG2LmeGW5cL4pUU8ULeWmg9I
 9dzQ==
X-Gm-Message-State: AOAM531GDaNAnY4L91lqWLuQSA33xdZpAhbHKb3s3gKhX1kR5QP4pZOV
 7TeY2O4dAPVcen/Uw2a4Lx1QFQ==
X-Google-Smtp-Source: ABdhPJwR6QlbHsIPYShk2aLHolhUU09lQamMiZeOgJsFiq8aWstKZaq2UqbOFS4ETpZyLifSZm2Y/w==
X-Received: by 2002:adf:e74b:: with SMTP id c11mr13364577wrn.101.1631895814013; 
 Fri, 17 Sep 2021 09:23:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c17sm8791057wrn.54.2021.09.17.09.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 09:23:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 32DF21FF96;
 Fri, 17 Sep 2021 17:23:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 00/11] testing and plugin pre-PR (configure, gitlab,
 plugins)
Date: Fri, 17 Sep 2021 17:23:21 +0100
Message-Id: <20210917162332.3511179-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is mostly a collection of updates for testing plus a few minor
plugin tweaks that didn't seem worth stuffing in a separate series. I
think most of this is ready so I'll likely cut a PR from it next week.

The following still need review:

 - tests/tcg: move some multiarch files and make conditional
 - configure: don't override the selected host test compiler if defined

Alex Bennée (5):
  configure: don't override the selected host test compiler if defined
  tests/tcg/sha1: remove endian include
  tests/tcg: move some multiarch files and make conditional
  tests/docker: promote debian-riscv64-cross to a full image
  accel/tcg: re-factor plugin_inject_cb so we can assert insn_idx is
    valid

Daniel P. Berrangé (2):
  gitlab: skip the check-patch job on the upstream repo
  gitlab: fix passing of TEST_TARGETS env to cirrus

John Snow (1):
  python: Update for pylint 2.10

Lukas Jünger (1):
  plugins/: Add missing functions to symbol list

Richard Henderson (1):
  gitlab: Add cross-riscv64-system, cross-riscv64-user

Thomas Huth (1):
  travis.yml: Remove the "Release tarball" job

 configure                                     |   7 +-
 include/tcg/tcg.h                             |   6 -
 accel/tcg/plugin-gen.c                        | 157 ++++++++++--------
 .../tcg/multiarch/{ => libs}/float_helpers.c  |   2 +-
 tests/tcg/multiarch/{ => linux}/linux-test.c  |   0
 tests/tcg/multiarch/sha1.c                    |   1 -
 .gitlab-ci.d/cirrus.yml                       |   2 +-
 .gitlab-ci.d/cirrus/build.yml                 |   1 +
 .gitlab-ci.d/container-cross.yml              |   3 +-
 .gitlab-ci.d/crossbuilds.yml                  |  19 +++
 .gitlab-ci.d/static_checks.yml                |   2 +-
 .travis.yml                                   |  23 ---
 plugins/qemu-plugins.symbols                  |   3 +
 python/qemu/machine/machine.py                |   9 +-
 python/setup.cfg                              |   1 +
 tests/docker/Makefile.include                 |   2 -
 .../dockerfiles/debian-riscv64-cross.docker   |  46 ++++-
 tests/tcg/multiarch/Makefile.target           |  15 +-
 tests/tcg/x86_64/Makefile.target              |   4 +
 19 files changed, 182 insertions(+), 121 deletions(-)
 rename tests/tcg/multiarch/{ => libs}/float_helpers.c (99%)
 rename tests/tcg/multiarch/{ => linux}/linux-test.c (100%)

-- 
2.30.2


