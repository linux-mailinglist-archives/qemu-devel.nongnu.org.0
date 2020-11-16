Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4D62B43BB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:28:46 +0100 (CET)
Received: from localhost ([::1]:35408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedcj-0006VX-5M
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYa-0001Xe-O2
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:28 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYW-000370-5x
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:28 -0500
Received: by mail-wm1-x333.google.com with SMTP id a3so23432675wmb.5
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P3s89U5AWlEpkPlD2N62ryzJUTNQUgTz9hN8LcwRn8I=;
 b=DGtApeOSTeRsUU6ua7ByjaZbqaCAXA4RcIUHoO+mIbeLgYaM9miJVhoOQigFLCCPV6
 +kSCHh16CbwC/B8O/VnXFBqozmtOvsi9B8iUBzIqXDr0uKgm4qNUR/5tRxAq05Dovjgi
 dHZIIcxMqR3MPgrhlgiPO0QYt1zNXWbtxzErXfmhRBUquKaRSS3jn/mzVj8C6z9eQ4+Z
 H86QXmfiuXSc6lNCvolVW4rMr1H3owQ1bLEDmT/cOI7+cH1CbojsmG6LxT+uonBhw+Kh
 NmW+wtu/aIAE+4v9v16edy+zxlXqzSXvmV/V8GVyb/sDFZEnVJF+GWpCjiBqSdabkP3q
 q0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P3s89U5AWlEpkPlD2N62ryzJUTNQUgTz9hN8LcwRn8I=;
 b=HwJ3seYdwRDRDvOco1YC0fJbeo1/FSRMVy0UHtJT91nIvQi2aSZuPJKn9pWw+TJqvp
 YDA1nEawpkSS5QzFUjBFnb+wcFkv+I6VVdh1e4ZE2/RKK1q17caIi2mTSZpdHTKtbRmR
 ju7yJbO/lr2jOfM0WfjKS0psx470PkdkVzUIpLAebs3lmLjeFe8zPs8NpyP+yULRtlFu
 Jo3kG6usENv6U5iguRm1J+TzxDZXcunnwRg1/TlNjaDM0ZBm245IzppkT/WkLm/3lmZz
 JZeWvwGV1hwrLM8ASn30PJHPQ+o7ZyVUAiIWYKFIORgAWPLdgCsvw5M7nCvlWhE0+MVS
 I08Q==
X-Gm-Message-State: AOAM532fwMj3D9g0FLitu2fkoKpkoKtdikm1NeKGRHx2e+k5XTz8ldHj
 BIGxdVVJkY0nqboPur/eS3uqRw==
X-Google-Smtp-Source: ABdhPJxKzhpgT3EmjowkHownE8gEqcOobwD37NKssvRyzWIAP3CZZWNZ3lnJWi5zv750p3pz9sr2Yw==
X-Received: by 2002:a1c:5946:: with SMTP id n67mr14977568wmb.162.1605529459675; 
 Mon, 16 Nov 2020 04:24:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b1sm20415092wmd.43.2020.11.16.04.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:24:18 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CA7B51FF7E;
 Mon, 16 Nov 2020 12:24:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 0/9] various fixes (CI, Xen, warnings)
Date: Mon, 16 Nov 2020 12:24:08 +0000
Message-Id: <20201116122417.28346-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit b50ea0d54bbca7d440315c3d0c0f7a4d6537b180:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20201113-1' into staging (2020-11-14 11:22:07 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-and-misc-161120-1

for you to fetch changes up to 7025111a199b97ae806817788bec50f456c47d85:

  .gitlab-ci.d/check-patch: tweak output for CI logs (2020-11-16 11:08:40 +0000)

----------------------------------------------------------------
Various fixes

  - fix resource leak in a couple of plugin
  - fix build of Xen enabled i386 image on Aarch64
  - maybe unitialized warning fix
  - disable unstable Spartan-3A acceptance test
  - terser output of gitlab checkpatch check

----------------------------------------------------------------
Alex Bennée (5):
      meson.build: fix building of Xen support for aarch64
      include/hw/xen.h: drop superfluous struct
      stubs/xen-hw-stub: drop xenstore_store_pv_console_info stub
      accel/stubs: drop unused cpu.h include
      .gitlab-ci.d/check-patch: tweak output for CI logs

Alex Chen (2):
      plugins: Fix resource leak in connect_socket()
      plugins: Fix two resource leaks in setup_socket()

Philippe Mathieu-Daudé (2):
      hw/i386/acpi-build: Fix maybe-uninitialized error when ACPI hotplug off
      tests/acceptance: Disable Spartan-3A DSP 1800A test

 meson.build                            |  7 +++++-
 include/hw/xen/xen.h                   |  2 +-
 accel/stubs/hax-stub.c                 |  1 -
 contrib/plugins/lockstep.c             |  3 +++
 hw/i386/acpi-build.c                   | 41 ++++++++++++++++------------------
 stubs/xen-hw-stub.c                    |  4 ----
 .gitlab-ci.d/check-patch.py            |  4 ++--
 tests/acceptance/boot_linux_console.py |  2 ++
 tests/acceptance/replay_kernel.py      |  2 ++
 9 files changed, 35 insertions(+), 31 deletions(-)

-- 
2.20.1


