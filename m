Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1572E436666
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:37:17 +0200 (CEST)
Received: from localhost ([::1]:56722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mda84-0005Yz-3T
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZv4-0005Y7-Lx
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:23:51 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZv2-0007uV-EZ
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:23:50 -0400
Received: by mail-pg1-x530.google.com with SMTP id t184so615752pgd.8
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xq7nDHzy/zK9nHyorNMekruJvvqX0DZueE9EXsdrTT4=;
 b=HNdaELcq1r0+hyTv3OoyQJtj12qB0O/XvGBTdY834YbNBvjpRDT4QxWTsO5JZAhgbW
 b+2IOToW4eEuGhg9jyVFXh9mZrPHpCMdq4/MKQq69lqwqF37zTyNBpO5VcZc+1uJsyAS
 MC8cB1eB0GQIRPhLNV5erUun4S7kgBwC+1Rq87ovScO7oWtIdlHgmwNYwYcLdFpQlKWH
 3M/FHjlI2j19BV32DNpYGUWKYv/ieo1wD44AMEqGOaBeX4EDwDnQMvdTeqeiURzcjS6e
 OxuAT0Y0uwzYTEFoWP7P4xqnCLSCFGvlqStrfKIjRX4GQ05zBfFiU+7CznUPYPNRbVCN
 5Kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xq7nDHzy/zK9nHyorNMekruJvvqX0DZueE9EXsdrTT4=;
 b=oijAHkZlkIcGzFF+orBpmErYrKFK50/dbWSp4uyfzNmZ5tVuh3+fgikm4qh+MJOBgQ
 GikLrfrCD75GAQANYGGKRKaQ01g6nWDRWLMt6TFNsLvdhzeHjotRQRzt1jz8RAzUri9p
 SOo4p02ep9q54eZ1OpdG6ov0ZOeQiyKE5q84CxOrDIiDe2Z7209+IucemJlUUfDiq1qb
 We+2bD3UcLOkbygbcgX11tMLr1PUAyEaB7k/ZVMlhsPdzAR6NSM+WGkT4my6DhBaW0T7
 DDvRFMES6tIbSMMqG3enz8gAKeqbaZzHoJzfJ4asPftUYxgAfY8qwkcP6Ddep3quXPL1
 8mAQ==
X-Gm-Message-State: AOAM533gxrClSNm+IuhCSrFzYomBfU5O/4tqL8Xk0l0IIKetlfeBxxgj
 6/+7yf6/qhzgX4CdQDY7tUpJgeewrNm92w==
X-Google-Smtp-Source: ABdhPJzjHiD1qljYdqMmzTZyV3u7W6E8ySh9GUrUjMEmEcoddc0o2W0Zpep3Prjc5Qcw/I8B7M4+0g==
X-Received: by 2002:aa7:811a:0:b0:44c:b9ef:f618 with SMTP id
 b26-20020aa7811a000000b0044cb9eff618mr6158301pfi.9.1634829826551; 
 Thu, 21 Oct 2021 08:23:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e8sm7029399pfn.45.2021.10.21.08.23.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:23:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/19] target/arm patch queue
Date: Thu, 21 Oct 2021 08:22:38 -0700
Message-Id: <20211021152345.780875-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

The following changes since commit afc9fcde55296b83f659de9da3cdf044812a6eeb:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-10-20 06:10:51 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-arm-20211021

for you to fetch changes up to f801789ff00f457044dcd91323316dbde42578d1:

  tests/data/acpi/virt: Update the empty expected file for PPTT (2021-10-21 08:04:15 -0700)

----------------------------------------------------------------
Introduce cpu topology support
Generate DBG2 table
Switch to ssize_t for elf loader return type
Fixed sbsa cpu type error message typo
Only initialize required submodules for edk2
Dont create device-tree node for empty NUMA node

----------------------------------------------------------------
Andrew Jones (2):
      hw/arm/virt: Add cpu-map to device tree
      hw/acpi/aml-build: Add PPTT table

Eric Auger (6):
      tests/acpi: Get prepared for IORT E.b revision upgrade
      hw/arm/virt-acpi-build: IORT upgrade up to revision E.b
      tests/acpi: Generate reference blob for IORT rev E.b
      tests/acpi: Add void table for virt/DBG2 bios-tables-test
      hw/arm/virt_acpi_build: Generate DBG2 table
      bios-tables-test: Generate reference table for virt/DBG2

Gavin Shan (1):
      hw/arm/virt: Don't create device-tree node for empty NUMA node

Luc Michel (1):
      hw/elf_ops.h: switch to ssize_t for elf loader return type

Philippe Mathieu-Daudé (2):
      roms/edk2: Only init brotli submodule to build BaseTools
      roms/edk2: Only initialize required submodules

Shuuichirou Ishii (1):
      hw/arm/sbsa-ref: Fixed cpu type error message typo.

Yanan Wang (6):
      hw/arm/virt: Only describe cpu topology since virt-6.2
      device_tree: Add qemu_fdt_add_path
      hw/acpi/aml-build: Add Processor hierarchy node structure
      tests/data/acpi/virt: Add an empty expected file for PPTT
      hw/arm/virt-acpi-build: Generate PPTT table
      tests/data/acpi/virt: Update the empty expected file for PPTT

 include/hw/acpi/aml-build.h       |   3 +
 include/hw/arm/virt.h             |   4 +-
 include/hw/elf_ops.h              |  27 ++++-----
 include/hw/loader.h               |  58 +++++++++----------
 include/sysemu/device_tree.h      |   1 +
 hw/acpi/aml-build.c               |  89 +++++++++++++++++++++++++++++
 hw/arm/boot.c                     |  13 +++++
 hw/arm/sbsa-ref.c                 |   2 +-
 hw/arm/virt-acpi-build.c          | 117 +++++++++++++++++++++++++++++++-------
 hw/arm/virt.c                     |  71 +++++++++++++++++++----
 hw/core/loader.c                  |  60 +++++++++----------
 softmmu/device_tree.c             |  44 +++++++++++++-
 .gitlab-ci.d/edk2.yml             |   6 +-
 roms/Makefile                     |   3 +-
 roms/Makefile.edk2                |   7 ++-
 scripts/make-release              |   7 ++-
 tests/data/acpi/virt/DBG2         | Bin 0 -> 87 bytes
 tests/data/acpi/virt/IORT         | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.memhp   | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.numamem | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.pxb     | Bin 124 -> 128 bytes
 tests/data/acpi/virt/PPTT         | Bin 0 -> 76 bytes
 22 files changed, 403 insertions(+), 109 deletions(-)
 create mode 100644 tests/data/acpi/virt/DBG2
 create mode 100644 tests/data/acpi/virt/PPTT

