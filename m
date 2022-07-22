Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A0357D7EB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 03:07:44 +0200 (CEST)
Received: from localhost ([::1]:37060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEh8o-0000Em-Kw
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 21:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oEh2H-0002g7-0v
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 21:00:58 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:56016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oEh2C-0004nN-Mg
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 21:00:55 -0400
Received: by mail-pj1-x1035.google.com with SMTP id b10so3077450pjq.5
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 18:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UJMF+QwxuxeFL9Y4njw5Uu3hl4+mobDhhJ6Om1heV/k=;
 b=RynAYW1aOv/gpxvkl+Qh9YImECqzZlUpzQasmKf64Wg7LyyfZRAsxQzqH8eTS90iGJ
 +DvV5XRgsNXD5JXsjOOKSgZrrEmF/x3mLXIWmgfEt/QZxMqx2QMcd6OMQ3HEbNbsvW2b
 THFhSv2N1PlPvCzHxSwulS0mBBEki86puwgiXDt7RAWao+2FJ+UwwGGFjw/JpsvJiduI
 1UL1wxl2fOyCBdpQxjR1aRAldsJh31cnVEHLudRIutLlwM/1L8rxTHnMzhFqr2fJsuLp
 v/el/0Si6Al0sVIo9nuDzLcY4Y8THL8lsxOfvcfBXyYjzUJ3qKJCLnZBCTLXndpJkiLH
 ki7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UJMF+QwxuxeFL9Y4njw5Uu3hl4+mobDhhJ6Om1heV/k=;
 b=4LnoOay0mcNYaSnFwfTHoWuADDadWImvi/hICpCFhMXOcGO8W1GT7+3x0JGnbX0ZC4
 Me4mGaMNEsGtltkA5ubDKzPullrskqiMhanRhog+9TW2xAKcV814JQ7m93+mA442vEBD
 QP5OqW2an1xscIgJku9QJ+6/NXyiJn0kthRZg3ds+R0+9w2MCNlyTs4k7A7rgFPJURyc
 jP8eTWHAeJaArJsy2v+jrcHNqEdhZBLWW3M8wKY/6JoIJ/0ZCTigmIjt7tcoEQbW5mWs
 VCykE8z8DCjPl6OSTfwWvsvvrRQGqRSk9RKI5x7F4K6CIS1j82P1RXXNn44dmxetfG+7
 J+0w==
X-Gm-Message-State: AJIora9Zzt1cJ5EhRm5Y799u0T4x8n986iqBAGWDcjax4NVsXcV6DYB2
 Li6D2AA5JC1jXVAclqYzJYu636nflmHtYQ==
X-Google-Smtp-Source: AGRyM1vuabrGtiXVymE3L9wGmkYZVXYQVrEogjemR4eRoVskDJaxBXOHq0hqS8Yu4ZVvMN4TEaRUoA==
X-Received: by 2002:a17:90b:4c0c:b0:1ef:e4f6:409f with SMTP id
 na12-20020a17090b4c0c00b001efe4f6409fmr14046407pjb.227.1658451649926; 
 Thu, 21 Jul 2022 18:00:49 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 d20-20020aa797b4000000b0052b8a7f6b65sm2393631pfq.109.2022.07.21.18.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 18:00:49 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v6  0/3] Implement Sstc extension 
Date: Thu, 21 Jul 2022 18:00:43 -0700
Message-Id: <20220722010046.343744-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series implements Sstc extension[1] which was ratified recently.

The first patch is a prepartory patches while PATCH 2 adds stimecmp
support while PATCH 3 adds vstimecmp support. This series is based on
on top of upstream commit (faee5441a038).

The series can also be found at
https://github.com/atishp04/qemu/tree/sstc_v6

It is tested on RV32 & RV64 with latest OpenSBI & Linux kernel[2]
patches.

Changes from v5->v6:
1. Rebased on top of the latest HEAD commit.

Changes from v4->v5:
1. Removed any ordering related flags and emulate the hardware more
   closely. 

Changes from v3->v4:
1. Added [v]stimecmp_wr_done to the corresponding vmstate strucuture.

Changes from v2->v3:
1. Dropped generic migration code improvement patches.
2. Removed the order constraints while updating stimecmp/vstimecmp.

Changes from v1->v2:
1. Rebased on the latest upstream commit.
2. Replaced PATCH 1 with another patch where mtimer/timecmp is
   moved from CPU to ACLINT.
3. Added ACLINT migration support.

[1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
[2] https://github.com/atishp04/linux/tree/sstc_v7

Atish Patra (3):
hw/intc: Move mtimer/mtimecmp to aclint
target/riscv: Add stimecmp support
target/riscv: Add vstimecmp support

hw/intc/riscv_aclint.c         |  41 +++++---
hw/timer/ibex_timer.c          |  18 ++--
include/hw/intc/riscv_aclint.h |   2 +
include/hw/timer/ibex_timer.h  |   2 +
target/riscv/cpu.c             |  12 +++
target/riscv/cpu.h             |  11 +-
target/riscv/cpu_bits.h        |   8 ++
target/riscv/cpu_helper.c      |  11 +-
target/riscv/csr.c             | 177 +++++++++++++++++++++++++++++++++
target/riscv/machine.c         |   7 +-
target/riscv/meson.build       |   3 +-
target/riscv/time_helper.c     | 114 +++++++++++++++++++++
target/riscv/time_helper.h     |  30 ++++++
13 files changed, 404 insertions(+), 32 deletions(-)
create mode 100644 target/riscv/time_helper.c
create mode 100644 target/riscv/time_helper.h

--
2.25.1


