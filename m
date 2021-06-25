Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD133B4023
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:18:33 +0200 (CEST)
Received: from localhost ([::1]:37358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhyq-0008Pv-Q4
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwhuV-0000Tv-Am
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:14:03 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:33333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwhuT-0002vA-9J
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:14:03 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 t11-20020a1cc30b0000b02901cec841b6a0so6112692wmf.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gyuIVBlS74hjXGHrg9PjOI6wjj8gjMeXlEeGZso40PI=;
 b=ejyllPP1ZQW4Xc9VJD+8yI2lBZHopXabaLYTZSf3cON7xS8Ft6JuVQPIZpP3HYyOIM
 /bbaz+DLgnayFwFzeM8XSwl6VAMM1IpmmL0qbfzreQQd+KOlQW6MLLmMFSboAt3YgiZW
 xapGrw4rWL5K9Qp6lTck8V4xALukHXEWcAm/Mkq96BOQxg1HuR/6KEr3ZsvWBKXknMx/
 eYLJ3LW97r58IrO+FhwGw4aYdyUTaWNpEUCNWN1NgRY0rPmi0hrQ9QqU00ga0+BzAMBn
 l6CfA2aJ5XI3GNAYfIhdDPmJafkMwHKvPU9w62ZBoKy7NHIUCfi/AJjLHexIm4yY2plZ
 5xHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gyuIVBlS74hjXGHrg9PjOI6wjj8gjMeXlEeGZso40PI=;
 b=XW2SwAGZX55IQy7bjHizrfydwkMwt/mhYua6as8FoDMb3zARkxqAp+ENLDiIOxjMUY
 UxQROCslzsNA44yQrUesiYlXMTjSjDbd3f0YrERSGEqM92VRbNOn5aPo47BGAyVYzUk/
 Ffm9rfB1yyn2edOANHnCuu2qghByEgrgzQlXjHT21VvhCkz+EabB1i4N9pZa7TS00VKN
 GvV3g2qNC8HBlOuGCn7qkm3ZJWmBQFbCn1TulzlKbhqNIWUq7Z4B8QyLv6Z1wUveRYCH
 lqgfpPNRL5TtJmvVkHqpSplP3/yZiruP7p33hAERfSXUOZUr2Ked9tRNsYv6Bsurq/bO
 arhw==
X-Gm-Message-State: AOAM532YET6DQmPs5wyih3J0qFmSAUHO1tCpv+J1lLBQBkK/tm6+hnrA
 mCPJtBEzfetL9kym0aTmwmup7w==
X-Google-Smtp-Source: ABdhPJwCmkK7X0PLBRXLwJ/5/107l6Bs1Is8PvULghCZTT9R39Nb4ZfXwLfxUIZa5hMd4AlbPNkaQg==
X-Received: by 2002:a05:600c:2482:: with SMTP id
 2mr9350936wms.67.1624612440018; 
 Fri, 25 Jun 2021 02:14:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m67sm11273008wmm.17.2021.06.25.02.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:13:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 641441FF7E;
 Fri, 25 Jun 2021 10:13:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 0/7] misc fixes (docs, plugins, tests)
Date: Fri, 25 Jun 2021 10:13:48 +0100
Message-Id: <20210625091355.25673-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ecba223da6215d6f6ce2d343b70b2e9a19bfb90b:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210624' into staging (2021-06-24 15:00:34 +0100)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-updates-250621-1

for you to fetch changes up to 7c4ab60f18f5257d37164df0ae0951ece4425b02:

  plugins/api: expose symbol lookup to plugins (2021-06-25 10:08:37 +0100)

----------------------------------------------------------------
A few miscellaneous fixes

  - tweak tcg/kvm based GIC tests
  - add header to MTTCG docs
  - cleanup checkpatch handling
  - GitLab feature and bug request templates
  - symbol resolution helper for plugin API
  - skip hppa/s390x signals test until fixes arrive

----------------------------------------------------------------
Alex Bennée (4):
      tests/acceptance: tweak the tcg/kvm tests for virt
      scripts/checkpatch: roll diff tweaking into checkpatch itself
      tests/tcg: skip the signals test for hppa/s390x for now
      plugins/api: expose symbol lookup to plugins

John Snow (2):
      GitLab: Add "Bug" issue reporting template
      GitLab: Add "Feature Request" issue template.

Luis Pires (1):
      docs/devel: Add a single top-level header to MTTCG's doc

 docs/devel/multi-thread-tcg.rst            |  5 ++-
 include/qemu/qemu-plugin.h                 |  9 +++++
 plugins/api.c                              |  6 +++
 .gitlab-ci.d/static_checks.yml             |  3 --
 .gitlab/issue_templates/bug.md             | 64 ++++++++++++++++++++++++++++++
 .gitlab/issue_templates/feature_request.md | 32 +++++++++++++++
 .patchew.yml                               |  3 --
 scripts/checkpatch.pl                      |  7 +++-
 tests/acceptance/boot_linux.py             | 24 +++++------
 tests/tcg/hppa/Makefile.target             |  4 ++
 tests/tcg/s390x/Makefile.target            |  4 ++
 11 files changed, 140 insertions(+), 21 deletions(-)
 create mode 100644 .gitlab/issue_templates/bug.md
 create mode 100644 .gitlab/issue_templates/feature_request.md

-- 
2.20.1


