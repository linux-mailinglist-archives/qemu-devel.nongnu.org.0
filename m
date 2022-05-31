Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CD253960A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 20:17:23 +0200 (CEST)
Received: from localhost ([::1]:43518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw6Qj-0001Ao-PE
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 14:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nw6DO-0002kw-6G
 for qemu-devel@nongnu.org; Tue, 31 May 2022 14:03:34 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:35526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nw6DL-0003af-Si
 for qemu-devel@nongnu.org; Tue, 31 May 2022 14:03:33 -0400
Received: by mail-pl1-x636.google.com with SMTP id c2so13540763plh.2
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 11:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8piZKU/xCQQBfl87LVUfbrnS70UiGjhb6yXz25ReMYE=;
 b=s5MxGNJWAoGE7TzfxhJDM9+hfWvXEGrvfgLQ9GdptEa9bz/J7o5IkkLsi+NTULYinf
 2EmgT+P2l9kqAYD1vZ1wFwDyFcVvXgq1142LjTbpoeOOyd4ohSzLAPmMdSM4ZcKOWpKf
 DEogsyX+dxat+TAxCHZGruViZZiFujnYM3jrVZ5GUue+edlc6aLkd0Of8ltUs2tq9CNa
 3nmil9hoW1/Bk6/33f9vzSQo0JPjXNonBz9+qEgyo9hiVGJzdWpxR7B9lHrqoSA9DEV/
 P8EE26YrCpU1AEGnfPMvaWMLNhMSotZT/A4riqxnE2L7ejUmEyqviZ7HTluhHIKkEqIH
 qZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8piZKU/xCQQBfl87LVUfbrnS70UiGjhb6yXz25ReMYE=;
 b=B/2ly/SwcvvJIN9W3Ca4x7LBPwFy965r4BnRvLfl5wUmm+1eBGg5b4Vs9F+LHjkyX9
 piHApS1pnfzzfWosr0P1fejAa64ADmo6oOIpFSwqCDhHrrOzx3JJTpylQkO9k41VyAQp
 62y0nZclryG8ApkTC6SY59gyT/MRp81azOLgYLbYSGsdI1+vjVbuBYJtv219UwhgM60C
 IPwT7BOkIrXXI4JmViXQu8Sn/F5QUCgU78twy51Yg657qCodhu0poHu4z2C/sdfgo7yo
 roBzZAUBJ+j/H2BgX8fN9pXYIA/WcSv2PkCaWMPS5Aur+syXXHEfXzpm6wlPzvamesxR
 rtJA==
X-Gm-Message-State: AOAM531KYYUnxgNm5jXylfQfNnQwNTtlDX4LgdMPxKqcwoNINpu0J9yC
 d5QEo/2itPjgV3AiJIUYjgoRHZRFaffYsw==
X-Google-Smtp-Source: ABdhPJykD9gZglr1RkqjvWu7YxxYW6wi7iW3eT7t+n3XK0TI1gRKi1a0qG7Ikhf6LQARfF44eIZycQ==
X-Received: by 2002:a17:903:11d0:b0:155:c240:a2c0 with SMTP id
 q16-20020a17090311d000b00155c240a2c0mr62005475plh.143.1654020208529; 
 Tue, 31 May 2022 11:03:28 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a632c0c000000b003f5e0c264bcsm10746611pgs.66.2022.05.31.11.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 11:03:27 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v5  0/3] Implement Sstc extension 
Date: Tue, 31 May 2022 11:03:18 -0700
Message-Id: <20220531180321.34942-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x636.google.com
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
https://github.com/atishp04/qemu/tree/sstc_v5

It is tested on RV32 & RV64 with latest OpenSBI & Linux kernel[2]
patches. It does require the mcountinhibit support patch from PMU series[3]
or dummy one from Anup's series [4]. Otherwise, OpenSBI doesn't detect v1.12
priv version.

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
[2] https://github.com/atishp04/linux/tree/sstc_v4
[3] https://github.com/atishp04/qemu/tree/riscv_pmu_v7
[4] https://www.mail-archive.com/qemu-devel@nongnu.org/msg885157.html

Atish Patra (3):
hw/intc: Move mtimer/mtimecmp to aclint
target/riscv: Add stimecmp support
target/riscv: Add vstimecmp support

hw/intc/riscv_aclint.c         |  41 +++++---
hw/timer/ibex_timer.c          |  18 ++--
include/hw/intc/riscv_aclint.h |   2 +
include/hw/timer/ibex_timer.h  |   2 +
target/riscv/cpu.c             |   8 ++
target/riscv/cpu.h             |  11 +-
target/riscv/cpu_bits.h        |   8 ++
target/riscv/cpu_helper.c      |  11 +-
target/riscv/csr.c             | 177 +++++++++++++++++++++++++++++++++
target/riscv/machine.c         |   7 +-
target/riscv/meson.build       |   3 +-
target/riscv/time_helper.c     | 114 +++++++++++++++++++++
target/riscv/time_helper.h     |  30 ++++++
13 files changed, 400 insertions(+), 32 deletions(-)
create mode 100644 target/riscv/time_helper.c
create mode 100644 target/riscv/time_helper.h

--
2.25.1


