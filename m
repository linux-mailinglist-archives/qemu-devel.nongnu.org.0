Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63BB4366B8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:47:20 +0200 (CEST)
Received: from localhost ([::1]:52702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdaHn-0005cg-Oi
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx2-0008W4-9k
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:52 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZww-00020a-Ne
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:51 -0400
Received: by mail-pg1-x535.google.com with SMTP id 75so643870pga.3
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xq7nDHzy/zK9nHyorNMekruJvvqX0DZueE9EXsdrTT4=;
 b=UpvuTG3w40bVFNgpYAE7FNJ3vW7gxAdG4sx5Kg8xAePIT6IzwhiQSYa06nKdH/e4hZ
 lcIdHi0nCTMBiIJHTD3e78sA1X0ltOGiVDbwXS7LBXiFBygkERMAxJtdQ3dAu13eAhdN
 BBIJSDxSfnBKSmSJcDg0jcBAwRubTVH4ulXZyeSk/WkDbGOKn6O/lsmkMWKREvkdJwDp
 +C9D1O2fPZ4TlN8W+LB9+75VQfgfk7k0Kt4BEz8133zocMozRGWJ+C1LvChdbI2L/iWr
 RojTLZ7PIBQWD/AzerkcmUZOmszo8WhE9dYG+4IMrU6bDdBcR/m5Y2kXkUurvYnVgX70
 sKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xq7nDHzy/zK9nHyorNMekruJvvqX0DZueE9EXsdrTT4=;
 b=xMPVkc2i773tCj+VJEWV0rFsj5t8V5SbdGcdTW1tyRU1JfeL6Pa6GklU6+WbNOdcMF
 mrCsIVJGtkwBYMYwIdFg/M3/QQRAlAc+SLO9wHf5kfFKgvZnwvGn/Cill7SDK8bFhIiv
 ww5cM+hl6szB8REOWoQrziXFSLzHX5bRpBkypyQf4QYieb26wHHGmyEe33Uhcc+krcck
 Uy0IjZOfrnJJAzKcCLohm9BibFSJSZidbN3FLTE+fdNVaXn30Q1GKnaBrzfiY8jhufT2
 AvfaEn4AxkxtMkqygcE2kNBIo5mPXbrBG8R5R1q+sd2z3x0eOcX1VASia31+bMVCq+f3
 JKMA==
X-Gm-Message-State: AOAM530S15NBoYpfcP4HXgcoDEqH7ix/6ALyS9I6WXZG4/kzOJadKcKQ
 5V002fj8OtP07Kk4xQQc93lbVmW3IwN5nQ==
X-Google-Smtp-Source: ABdhPJyCH+0TAAeUaKg9AfuYroK2yuP/nCakIPOuD+CfElFTVQX/GZ6iXIBWsewSnXLVUDjkSealKQ==
X-Received: by 2002:a62:5a41:0:b0:448:152d:78bf with SMTP id
 o62-20020a625a41000000b00448152d78bfmr6269322pfb.77.1634829942058; 
 Thu, 21 Oct 2021 08:25:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/19] target/arm patch queue
Date: Thu, 21 Oct 2021 08:25:22 -0700
Message-Id: <20211021152541.781175-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

