Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3958835C417
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 12:35:38 +0200 (CEST)
Received: from localhost ([::1]:52832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVtur-00013V-9g
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 06:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVtrK-0006cd-EZ
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:31:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVtrI-0000Fm-1G
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:31:58 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a6so12367297wrw.8
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 03:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5VrOuywLZrAwXy/Rc+b9SRL1LhRcq/fx1CvEgiIrSV4=;
 b=EYo3VvOHLdzccMfJRoJIql2BT0WvuL9HEfxPQuQ7reQHLu11Wch9meWZIj2AdQiGvW
 ttwwIc9eGw8FWbBn7kQPTvzfiUO/jwY2ydGFEI3xef5NpSMXNw61gX1c3B2BG8gyhkbi
 hzjrrqR8Tl97nKv/1yw2gwj5trAuzugtnhSR/a1w6Dg12AsXpxNv93zKN1phP1WeoPe+
 m75pmycAGpG9TEtIElpBGHJQP9nwDNZS6kiCr8KBqEcWDXhE6CGW8uTODhxuQ27uX7MK
 IG8uLB1nLr92JJHAMh2zrUmiq5JqJUal0nSFo9DiwGooQLe925QYKfnOAQh0J8nk/qXM
 HTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5VrOuywLZrAwXy/Rc+b9SRL1LhRcq/fx1CvEgiIrSV4=;
 b=PUZIfHl5tiz7lX8Ad5izxMZw1aAjYAKZd4SIetQZ5WNkXqu3iCp1jBlJcsti2OV6CS
 bTh+ymZrhx5pyi+gY5ZDK1XkbXeruV1SkwM9qehg2hwPtrKQIp7PBXxEq2K0pnc1CWXR
 uMWbGKmLavNKh/foaWlod4evw81TBX9QS/n8gZ3ZYWpjzV7Am/Pq+LUXGercsjQYxQfe
 Df1Du5IfZGaIpb699Xw/iLudrc1vtqDwbtAuP9ILa8/kt5zbv3yrAQd3Z7JMdGRL9F8B
 Dl+PxlXZSX9R7tbDBzPDFu2fVY2/CHzN6D9T5x/5PTIRKsP1VRyhP3944Acn0d8yxYVn
 9LvA==
X-Gm-Message-State: AOAM530Wt30z+GJyH6xYqcirm6fOEKkNp5LWwantBseONaBOzGfdO+sJ
 Q2SEZ4KKlpJLwLr5vNdMRw3WDN1Q1a8kbV62
X-Google-Smtp-Source: ABdhPJypF1GlJWOsqte7+G6auTkz1V+OxdhFKwAsUFsEr1PnnPuiNB4J1FHt1vfNChyegTnrHDGNSg==
X-Received: by 2002:a5d:4851:: with SMTP id n17mr9667354wrs.215.1618223513686; 
 Mon, 12 Apr 2021 03:31:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d2sm16878651wrq.26.2021.04.12.03.31.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 03:31:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] target-arm queue
Date: Mon, 12 Apr 2021 11:31:47 +0100
Message-Id: <20210412103152.28433-1-peter.maydell@linaro.org>
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

Handful of arm fixes for the rc.

The following changes since commit 555249a59e9cdd6b58da103aba5cf3a2d45c899f:

  Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2021-04-10 16:58:56 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210412

for you to fetch changes up to 52c01ada86611136e3122dd139788dbcbc292d86:

  exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1 (2021-04-12 11:06:24 +0100)

----------------------------------------------------------------
target-arm queue:
 * hw/arm/virt-acpi-build: Fix GSIV values of the {GERR, Sync} interrupts
 * hw/arm/smmuv3: Emulate CFGI_STE_RANGE for an aligned range of StreamIDs
 * accel/tcg: Preserve PAGE_ANON when changing page permissions
 * target/arm: Check PAGE_WRITE_ORG for MTE writeability
 * exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1

----------------------------------------------------------------
Richard Henderson (3):
      accel/tcg: Preserve PAGE_ANON when changing page permissions
      target/arm: Check PAGE_WRITE_ORG for MTE writeability
      exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1

Zenghui Yu (2):
      hw/arm/virt-acpi-build: Fix GSIV values of the {GERR, Sync} interrupts
      hw/arm/smmuv3: Emulate CFGI_STE_RANGE for an aligned range of StreamIDs

 include/exec/cpu-all.h            |  4 ++--
 tests/tcg/aarch64/mte.h           |  3 ++-
 accel/tcg/translate-all.c         |  9 ++++++--
 hw/arm/smmuv3.c                   | 12 +++++++----
 hw/arm/virt-acpi-build.c          |  4 ++--
 target/arm/mte_helper.c           |  2 +-
 tests/tcg/aarch64/mte-6.c         | 43 +++++++++++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  2 +-
 8 files changed, 66 insertions(+), 13 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte-6.c

