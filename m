Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EB93DD504
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 13:59:57 +0200 (CEST)
Received: from localhost ([::1]:44452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWbs-0002mx-Bn
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 07:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaH-0000G1-Gk
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:17 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaF-0003XR-Me
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:17 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b11so15835362wrx.6
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VinAvWr0oP3L+Ksr/ZXhaZRMmGR8NbwHzGNkiAf/lvo=;
 b=NRQpDEqhZcUkzmM+a+UE5v6UbqhhI/EjosOPqnfy5vF95qeYR+KHFe17+CBPcszVzS
 ls4RIc1XnqWxbItILdKo2HOJkVXJKJUjQfJner/myQIdYLzA/jiSzqv7W1UyaY/bHgdZ
 6YE2T6ietDjrNCmJkV/78gCvpJQxpgR/Yl4K2u6BWZSGAW2vNItdnFmjD7YQgM9gADpJ
 pmPkY3QDcJKuf2yHX4Ndm8wtYSY83fLy9zFMNpX/dGiOshpm9WgddkAJsb7kbjwFn3Ip
 A5LuCJYv3iuMmAT9r4F1UAuahpRP71XUThWsR5ZFK1cOXbIFwVEdFlplZrfPV9hsdll5
 mYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VinAvWr0oP3L+Ksr/ZXhaZRMmGR8NbwHzGNkiAf/lvo=;
 b=f9ucPCm4XNj64IZJ6QREfQ/8jREjjq2xBMkeFDd8Y6ydgiAJY3NwdMeKLvU6HjgjXv
 IPh8Z0eH9oXBUu+7X6FJHia9PVNYrMz0Hlx5aKr68Ao0uXfgha69SnCAV+tueAwhr73b
 IZzu5EWG+RDq8QUEFR06K946r0FEk4e8zqv2yDpe4SXSWliOFw58X8T/H7S+sVaiHyBe
 BMnyejo3RZlfzDkocL6dHQthbU9oiF4mwRP1i3DXXFmMCoFNWJSqns+xpaflSEqv64Sv
 up23CqE9AxYU5r9qpK2isXPthdim7Vy8Bh+uO8IU78EY+mkkvqFKF6ynuWoJC5PuJKh8
 GGMw==
X-Gm-Message-State: AOAM531+07lN6tqNQM5hZ5bzZ/Rj+WW3vTwi3mbrO8NPkJ9hGkT/K1Vu
 r/Pj6Ut69CowYzdO6wHk3zy8Kp6hGfEn9g==
X-Google-Smtp-Source: ABdhPJx/UrO8SgIiJg4ar6rzPa18HmUa7g6t3XmgW3Eq1nXnGgM91hV+GU7YKe/cjr/QxWwJMIHecg==
X-Received: by 2002:adf:9084:: with SMTP id i4mr17420450wri.23.1627905493992; 
 Mon, 02 Aug 2021 04:58:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/21] target-arm queue
Date: Mon,  2 Aug 2021 12:57:51 +0100
Message-Id: <20210802115812.10731-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A largish pullreq but it's almost all docs fixes.

-- PMM

The following changes since commit 10a3c4a4b3e14208cfed274514d1911e5230935f:

  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-08-02 09:47:07 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210802

for you to fetch changes up to 4a64939db76b10d8d41d2af3c6aad8142da55450:

  docs: Move user-facing barrier docs into system manual (2021-08-02 12:55:51 +0100)

----------------------------------------------------------------
target-arm queue:
 * Add documentation of Arm 'mainstone', 'kzm', 'imx25-pdk' boards
 * MAINTAINERS: Don't list Andrzej Zaborowski for various components
 * docs: Remove stale TODO comments about license and version
 * docs: Move licence/copyright from HTML output to rST comments
 * docs: Format literal text correctly
 * hw/arm/boot: Report error if there is no fw_cfg device in the machine
 * docs: rSTify barrier.txt and bootindex.txt

----------------------------------------------------------------
Peter Maydell (21):
      docs: Add documentation of Arm 'mainstone' board
      docs: Add documentation of Arm 'kzm' board
      docs: Add documentation of Arm 'imx25-pdk' board
      MAINTAINERS: Don't list Andrzej Zaborowski for various components
      docs: Remove stale TODO comments about license and version
      docs: Move licence/copyright from HTML output to rST comments
      docs/devel/build-system.rst: Format literals correctly
      docs/devel/build-system.rst: Correct typo in example code
      docs/devel/ebpf_rss.rst: Format literals correctly
      docs/devel/migration.rst: Format literals correctly
      docs/devel: Format literals correctly
      docs/system/s390x/protvirt.rst: Format literals correctly
      docs/system/arm/cpu-features.rst: Format literals correctly
      docs: Format literals correctly
      docs/about/removed-features: Fix markup error
      docs/tools/virtiofsd.rst: Delete stray backtick
      hw/arm/boot: Report error if there is no fw_cfg device in the machine
      docs: Move bootindex.txt into system section and rstify
      docs: Move the protocol part of barrier.txt into interop
      ui/input-barrier: Move TODOs from barrier.txt to a comment
      docs: Move user-facing barrier docs into system manual

 docs/about/index.rst                         |   2 +-
 docs/about/removed-features.rst              |   2 +-
 docs/barrier.txt                             | 370 -----------------------
 docs/bootindex.txt                           |  52 ----
 docs/devel/build-system.rst                  | 160 +++++-----
 docs/devel/ebpf_rss.rst                      |  18 +-
 docs/devel/migration.rst                     |  36 +--
 docs/devel/qgraph.rst                        |   8 +-
 docs/devel/tcg-plugins.rst                   |  14 +-
 docs/devel/testing.rst                       |   8 +-
 docs/interop/barrier.rst                     | 426 +++++++++++++++++++++++++++
 docs/interop/index.rst                       |   1 +
 docs/interop/live-block-operations.rst       |   2 +-
 docs/interop/qemu-ga-ref.rst                 |   9 -
 docs/interop/qemu-qmp-ref.rst                |   9 -
 docs/interop/qemu-storage-daemon-qmp-ref.rst |   9 -
 docs/interop/vhost-user-gpu.rst              |   7 +-
 docs/interop/vhost-user.rst                  |  12 +-
 docs/system/arm/cpu-features.rst             | 116 ++++----
 docs/system/arm/imx25-pdk.rst                |  19 ++
 docs/system/arm/kzm.rst                      |  18 ++
 docs/system/arm/mainstone.rst                |  25 ++
 docs/system/arm/nuvoton.rst                  |   2 +-
 docs/system/arm/sbsa.rst                     |   4 +-
 docs/system/arm/virt.rst                     |   2 +-
 docs/system/barrier.rst                      |  44 +++
 docs/system/bootindex.rst                    |  76 +++++
 docs/system/cpu-hotplug.rst                  |   2 +-
 docs/system/generic-loader.rst               |   4 +-
 docs/system/guest-loader.rst                 |   6 +-
 docs/system/index.rst                        |   2 +
 docs/system/ppc/powernv.rst                  |   8 +-
 docs/system/riscv/microchip-icicle-kit.rst   |   2 +-
 docs/system/riscv/virt.rst                   |   2 +-
 docs/system/s390x/protvirt.rst               |  12 +-
 docs/system/target-arm.rst                   |   3 +
 docs/tools/virtiofsd.rst                     |   2 +-
 hw/arm/boot.c                                |   9 +
 hw/arm/sbsa-ref.c                            |   7 -
 ui/input-barrier.c                           |   5 +
 MAINTAINERS                                  |   8 +-
 41 files changed, 849 insertions(+), 674 deletions(-)
 delete mode 100644 docs/barrier.txt
 delete mode 100644 docs/bootindex.txt
 create mode 100644 docs/interop/barrier.rst
 create mode 100644 docs/system/arm/imx25-pdk.rst
 create mode 100644 docs/system/arm/kzm.rst
 create mode 100644 docs/system/arm/mainstone.rst
 create mode 100644 docs/system/barrier.rst
 create mode 100644 docs/system/bootindex.rst

