Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F218C2ADF4E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 20:28:05 +0100 (CET)
Received: from localhost ([::1]:48096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcZJE-0004Ah-U2
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 14:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEh-0002Nj-5O
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:26 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEe-0007Yo-Bk
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:22 -0500
Received: by mail-wm1-x341.google.com with SMTP id a3so2966243wmb.5
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 11:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h0ZjEjAkHx1ZzxLeZwYDxe+Sx0tcrLqa58bbg3J1Bg0=;
 b=tAnvUplwIPKvn9bbmMS1YElb/KwWMxzhV3J1tbopUaP5kku4Wh/HD/eHtrQi6geGo/
 y9cJf4HXWAsSLe1ALK9Vl4aqZXOYO8B8BoG98vaOSt7zvuaaWonv35mZwdBCJe6i+NOf
 /RQnJHzirqUNOnAk0wyfbkDX+mw/EX2LIrP4pAZZReCuTwxN9MrBzuq0hRrkjJ7siwDC
 QsFRRmC7gNwqMtSxN/DBNAIp2cy29bhQY0dZ7MEefTnCiwqhhV5PZZKHia6FJBS1oBIZ
 aPtTGODQ4bwmCc5EsGuYXN1Uabf8B9xjE0I6uhAZTCbaRYHEpvgYp3hCZb5QP9Gxr2DC
 DhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h0ZjEjAkHx1ZzxLeZwYDxe+Sx0tcrLqa58bbg3J1Bg0=;
 b=W2hnLC/B3XJ6FQF2uuRY6NAZoT77YIABH9vPKDxQNrFuNx5yRRCbqjZRNX+oP/syFt
 mkQmG/vwdSv44qrlypd5D9r3xodd/YZ1o7KlraJK/b/S+9/tAVp/tygfp8RVTY6c08Dt
 q9KkcPOTaQBADlAwLbipithiEsHYO3L/yvrWXEl1T8lIrcQB2slnnBQjI+yJgGh/hJlA
 CZZktkMOHTq4M29sAbM2wcANWjGQYclP1w+hZtr4cCuepCpOFbsppusC7h3La0eP9dOG
 SIBs4xvI7nIRdpB0aPvp0BS5tUJTNS3uGMT9486d6KmJf7aVubeqievwESGXRjB3FUle
 sO2Q==
X-Gm-Message-State: AOAM532wlMPlp+XcaSyv0MLhikXtcXKCLkR8ImBNN3VxyKolAxZRzn4Q
 HM+Pg1/nCOa7dWUbIaysrYEu/w==
X-Google-Smtp-Source: ABdhPJyQ/ePDsQnXtJh4l+zFZUGXRfGgwV0oPWJZkcEHutxhirl9DmkY5x+tcM1oIdZ4uX4sYjxhBg==
X-Received: by 2002:a05:600c:2949:: with SMTP id
 n9mr671458wmd.29.1605036198315; 
 Tue, 10 Nov 2020 11:23:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d3sm17906592wre.91.2020.11.10.11.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:23:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 45C2C1FF7E;
 Tue, 10 Nov 2020 19:23:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 for 5.1 00/10] various fixes (CI, Xen, plugins)
Date: Tue, 10 Nov 2020 19:23:06 +0000
Message-Id: <20201110192316.26397-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This collects together a bunch of fixes for 5.2:

  - a few resource leak fixes for plugins
  - Xen on arm64 build fixes (from my larger Xen series)
  - a couple of build and CI fixes
  - a tweak to the gitlab status script

I can drop the last patch if I have to but it hopefully allows for
easier scripting of the "waiting for gitlab" experience for those that
are not using "staging".

The following need review:

 - scripts/ci: clean up default args logic a little
 - gitlab: move remaining x86 check-tcg targets to gitlab

Alex Bennée (6):
  meson.build: fix building of Xen support for aarch64
  include/hw/xen.h: drop superfluous struct
  stubs/xen-hw-stub: drop xenstore_store_pv_console_info stub
  accel/stubs: drop unused cpu.h include
  gitlab: move remaining x86 check-tcg targets to gitlab
  scripts/ci: clean up default args logic a little

Alex Chen (2):
  plugins: Fix resource leak in connect_socket()
  plugins: Fix two resource leaks in setup_socket()

Philippe Mathieu-Daudé (2):
  hw/i386/acpi-build: Fix maybe-uninitialized error when ACPI hotplug
    off
  tests/acceptance: Disable Spartan-3A DSP 1800A test

 meson.build                            |  7 ++++-
 include/hw/xen/xen.h                   |  2 +-
 accel/stubs/hax-stub.c                 |  1 -
 contrib/plugins/lockstep.c             |  3 ++
 hw/i386/acpi-build.c                   | 41 ++++++++++++--------------
 stubs/xen-hw-stub.c                    |  4 ---
 .gitlab-ci.yml                         | 17 +++++++++++
 .travis.yml                            | 26 ----------------
 scripts/ci/gitlab-pipeline-status      | 24 ++++++++-------
 tests/acceptance/boot_linux_console.py |  2 ++
 tests/acceptance/replay_kernel.py      |  2 ++
 11 files changed, 63 insertions(+), 66 deletions(-)

-- 
2.20.1


