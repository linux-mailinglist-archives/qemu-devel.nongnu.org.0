Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CDA509292
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:18:17 +0200 (CEST)
Received: from localhost ([::1]:34528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIeO-0007ya-Ig
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIbJ-0005w3-Dg; Wed, 20 Apr 2022 18:15:05 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:45704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIbE-0005XL-E1; Wed, 20 Apr 2022 18:15:02 -0400
Received: by mail-oi1-x229.google.com with SMTP id 12so3634845oix.12;
 Wed, 20 Apr 2022 15:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ngrp9hRpArNBd76NTUz0b7mnDljhjoGV1y6Xb9kOw0U=;
 b=TnFV0SJmHuiANxQ0MtGZvu72guBo56GhJsijnmuR9v1Emn5W4vzzhel5CpBSqhIKsR
 MZmJU3xZzLg1cFrtZIxHygD6AuoP4dUwLUAr+hNNCzqSzekhfG0baW3pGRo0qaDIc2ON
 OCtTDRW17Zed0DeWRfW0XpEnat8N8DiZUQhkI7jQ7vsqQxaUa+jmev4toPxuDuGLSfKB
 qCUimetJNn3FeURxriCXFhHGp/4c2IwjfYdS+Jm1x/EPa9qB1CFSosnId0FnbdqlX1Dr
 PoaZk/Qdgqw5KyoYOF9ITeqQdFFr3o0Eguhmu8BTYv6iLHGQh/Ct0xbeTpPZjyJRMtuP
 WuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ngrp9hRpArNBd76NTUz0b7mnDljhjoGV1y6Xb9kOw0U=;
 b=ebGtfXj90cKm1g6+oea+KNwwaKU2RKibLakEw2Eqtldel2RvfD/vO0JrzeVHByM+MM
 3eusiU29bu6vkPyq6rS9zqfnMntYjtgVLvdx5g/RQ874wm4OGyvKYPdOCL0dDQrf3Hpv
 Jb+v3xq96jlUOuzkvdMOYgeflZaclxH3qKw4CuYLMi+LYoL7tTZFi7O8q6HwKO4A3ER/
 QIQQIZyN6qjeb+MWcMtfhXPDCi3z9iOJz/itE8n+rq8DjU6UM2iCSZCB1p6lgP52qT45
 Xr+E47Z7LUxKd1d/MwabnbYeyj+1GUZPQzx5PopXAw/UloLjZphguKQLNsAdv7MCSnFZ
 7FEA==
X-Gm-Message-State: AOAM532PiH3K9whzJgN1EDD4nAEnEXpVtZpAC+MM9uYSjNJx8m1UmHM6
 YY9luxTzYW6G9npoQq+y/+TcTYXwDic=
X-Google-Smtp-Source: ABdhPJyG1La4+fc57IMxe80x03gyfdZVSb5QCjTtiZh66ibvfCxuCbKX3KHdLMXevMzYaYGOxcMPWg==
X-Received: by 2002:a05:6808:14d5:b0:2da:455b:1917 with SMTP id
 f21-20020a05680814d500b002da455b1917mr2622171oiw.81.1650492898601; 
 Wed, 20 Apr 2022 15:14:58 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:14:20 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/23] ppc queue
Date: Wed, 20 Apr 2022 19:13:06 -0300
Message-Id: <20220420221329.169755-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 danielhb413@gmail.com, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2d20a57453f6a206938cbbf77bed0b378c806c1f:

  Merge tag 'pull-fixes-for-7.1-200422-1' of https://github.com/stsquad/qemu into staging (2022-04-20 11:13:08 -0700)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220420-2

for you to fetch changes up to 2d94af4b16c40758eee3a8591307ae173090d4ad:

  hw/ppc: change indentation to spaces from TABs (2022-04-20 18:00:30 -0300)

----------------------------------------------------------------
ppc patch queue for 2022-04-20

First batch of ppc patches for QEMU 7.1:

- skiboot firmware version bump
- pseries: add 2M DDW pagesize
- pseries: make virtual hypervisor code TCG only
- powernv: introduce GPIO lines for PSIHB device
- powernv: remove PCIE root bridge LSI
- target/ppc: alternative softfloat 128 bit integer support
- assorted fixes

----------------------------------------------------------------
Alexey Kardashevskiy (2):
      ppc/spapr/ddw: Add 2M pagesize
      ppc/vof: Fix uninitialized string tracing

Bernhard Beschow (1):
      hw/ppc/ppc405_boards: Initialize g_autofree pointer

Cédric Le Goater (5):
      ppc/pnv: Fix PSI IRQ definition
      ppc/pnv: Remove PnvLpcController::psi link
      ppc/pnv: Remove PnvOCC::psi link
      ppc/pnv: Remove PnvPsiClas::irq_set
      ppc/pnv: Remove useless checks in set_irq handlers

Fabiano Rosas (3):
      spapr: Move hypercall_register_softmmu
      spapr: Move nested KVM hypercalls under a TCG only config.
      target/ppc: Improve KVM hypercall trace

Frederic Barrat (3):
      pcie: Don't try triggering a LSI when not defined
      ppc/pnv: Remove LSI on the PCIE host bridge
      target/ppc: Add two missing register callbacks on POWER10

Guo Zhi (1):
      hw/ppc: change indentation to spaces from TABs

Joel Stanley (1):
      ppc/pnv: Update skiboot to v7.0

Matheus Ferst (7):
      qemu/int128: add int128_urshift
      softfloat: add uint128_to_float128
      softfloat: add int128_to_float128
      softfloat: add float128_to_uint128
      softfloat: add float128_to_int128
      target/ppc: implement xscv[su]qqp
      target/ppc: implement xscvqp[su]qz

 fpu/softfloat.c                     | 183 ++++++++++++++++++++++++++++++++++++
 hw/pci-host/pnv_phb3.c              |   1 +
 hw/pci-host/pnv_phb4.c              |   1 +
 hw/pci/pcie.c                       |   5 +-
 hw/pci/pcie_aer.c                   |   2 +-
 hw/ppc/pnv.c                        |  30 +++---
 hw/ppc/pnv_lpc.c                    |  19 +---
 hw/ppc/pnv_occ.c                    |  16 +---
 hw/ppc/pnv_psi.c                    |  36 +++----
 hw/ppc/ppc405_boards.c              |   4 +-
 hw/ppc/ppc440_bamboo.c              |   6 +-
 hw/ppc/spapr_hcall.c                |  74 +++++++++------
 hw/ppc/spapr_rtas.c                 |  18 ++--
 hw/ppc/spapr_rtas_ddw.c             |   1 +
 hw/ppc/vof.c                        |   2 +-
 include/fpu/softfloat.h             |   7 ++
 include/hw/ppc/pnv_lpc.h            |   8 +-
 include/hw/ppc/pnv_occ.h            |   7 +-
 include/hw/ppc/pnv_psi.h            |   7 +-
 include/hw/ppc/ppc.h                |  10 +-
 include/hw/ppc/spapr.h              |   1 +
 include/qemu/int128.h               |  21 +++++
 pc-bios/skiboot.lid                 | Bin 2528128 -> 2527240 bytes
 roms/skiboot                        |   2 +-
 target/ppc/cpu_init.c               |   2 +
 target/ppc/fpu_helper.c             |  33 +++++++
 target/ppc/helper.h                 |   4 +
 target/ppc/insn32.decode            |   7 ++
 target/ppc/kvm.c                    |   2 +-
 target/ppc/trace-events             |   2 +-
 target/ppc/translate/vsx-impl.c.inc |  22 +++++
 tests/unit/test-int128.c            |  50 ++++++++++
 32 files changed, 446 insertions(+), 137 deletions(-)

