Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C27D5895B8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 03:45:38 +0200 (CEST)
Received: from localhost ([::1]:41740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJPvc-0005zi-4J
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 21:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJPsy-0002xM-95
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 21:42:52 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:38409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJPsw-0000Wv-AM
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 21:42:51 -0400
Received: by mail-pl1-x62e.google.com with SMTP id o3so18018401ple.5
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 18:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=phPq4eHYg8emfMZOmprTVXMWB1LvPj/rRYu3fgcFsGQ=;
 b=JzyoEXhB+a8zg9kLyUYA39oI/dN0Ul6v7RM27jm9mMkO5dQHjF4EhU+vlhJJ+9EZET
 HbhA7d3P/yVTpayDCub3/EKP2yaAD5nA2AmmnHlXlC/AUzRi6pG+jfndIkFm2z3cQ5Y4
 JSmMEIZ0ah20G79IQ/rimKtPqIGXnBo3kdSP1QP19Um2RlrPR715tajDXUN+vpNjbukw
 kEqYzDZqU5RE9c5yf60QKgiTG2WXuuqAPWcGxm8N9TRjKMf2MtyUec3iP1ULKH/Xa6VI
 8y6oA+VUqpQfQy7jzPvtC+fMcTtmYi8ThhWrXEAsZIzyAhEF46syCGvtlpKnia0TPjTw
 IqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=phPq4eHYg8emfMZOmprTVXMWB1LvPj/rRYu3fgcFsGQ=;
 b=ymCrOZyQk/Sr7KAp9U/rQfvRQ6zULu1cb1AGSahfRLP0lnDzsXm2XzRh/OiAJg24ka
 RtrheUIVPULVejgouU0xS2s8zT2W5hCY0AnHd+kq5wD2V/2A5SrJEkcWdZfnNY97h3BM
 JJ+d0QBHwFn68hQkBMmJdgCQSW9KM7wcIV/i8Ljw2xqe71jKNEBW0MdW5tet8pvJK0HQ
 xPJMQdYEaKtbTaf14HzE1SFAON4uJYFOdUSsE48rF5mcMeEr1mgUyIgLSnQc4lYfAzpf
 FcNEaSSDn33Ff+alFxf7/LMH2mdGHvu5S5RYhYaYj8LjoWDzDLdrJ9GWqkFeVFUlCAh9
 vrUQ==
X-Gm-Message-State: ACgBeo1+i8CYuG5P/jYA7xkjLGZAY/BAKQtZrYqJffRR4jpoMzLrRQYE
 VVx41oSDC0YwMOS0ZFpfI4Ru35vo3pZFCg==
X-Google-Smtp-Source: AA6agR4/n81jkrhz5Q9Aby5bl6C2rbT4eavzu5yL+khhbGY+9GEsxJ5RhpjZ2PJ+vRiqP3XmENWq3w==
X-Received: by 2002:a17:902:f30c:b0:16d:a79c:4aed with SMTP id
 c12-20020a170902f30c00b0016da79c4aedmr28554753ple.23.1659577368416; 
 Wed, 03 Aug 2022 18:42:48 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a170902ec0100b0016784c93f23sm1981921pld.197.2022.08.03.18.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 18:42:47 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v8  0/3] Implement Sstc extension 
Date: Wed,  3 Aug 2022 18:42:37 -0700
Message-Id: <20220804014240.2514957-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
https://github.com/atishp04/qemu/tree/sstc_v8

It is tested on RV32 & RV64 with latest OpenSBI & Linux kernel[2]
patches.

Changes from v7->v8:
1. Removed redundant blank lines.
2. Invoke smode & hmode predicate function from sstc related predicate
   functions.

Changes from v6->v7:
1. Replaced g_malloc0 with g_new0.
2. Removed the over allocation for the timers.

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
[2] https://github.com/atishp04/linux/tree/sstc_v8

Atish Patra (3):
hw/intc: Move mtimer/mtimecmp to aclint
target/riscv: Add stimecmp support
target/riscv: Add vstimecmp support

hw/intc/riscv_aclint.c         |  41 +++++---
hw/timer/ibex_timer.c          |  18 ++--
include/hw/intc/riscv_aclint.h |   2 +
include/hw/timer/ibex_timer.h  |   2 +
target/riscv/cpu.c             |   9 ++
target/riscv/cpu.h             |  11 ++-
target/riscv/cpu_bits.h        |   8 ++
target/riscv/cpu_helper.c      |  11 ++-
target/riscv/csr.c             | 175 +++++++++++++++++++++++++++++++++
target/riscv/machine.c         |   7 +-
target/riscv/meson.build       |   3 +-
target/riscv/time_helper.c     | 114 +++++++++++++++++++++
target/riscv/time_helper.h     |  30 ++++++
13 files changed, 399 insertions(+), 32 deletions(-)
create mode 100644 target/riscv/time_helper.c
create mode 100644 target/riscv/time_helper.h

--
2.25.1


