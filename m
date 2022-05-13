Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA80A526971
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:36:44 +0200 (CEST)
Received: from localhost ([::1]:37660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npa9a-0002aP-8d
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1npZrP-0006rx-Mo
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:17:55 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:53818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1npZrN-0000L0-I8
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:17:55 -0400
Received: by mail-pj1-x102e.google.com with SMTP id o69so8742221pjo.3
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 11:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=93VyuI9ux6SDr/ub98vmdVIqFVVDpMP+vBYt5ZXXoRM=;
 b=7NwlP4SqnNBFJQmv7Q1UpQ3ZklLY8I91FRB6sOBmLgWTbpTwsj+K7Szdzx7fmIPEB1
 P1JE6kobU+XIPF9yostGJ66AYqg9msd5x5ZSgKkqHQCWDi7xL6LHYJDK8HDtQq/3K4xf
 ymd/7QbEOH5B1qKe5ui35XqlHMVNtMgLkAaqnm+SLm59teYA1ee7owkIjmGtgIkw1C6T
 1rYGeI4PQvmnP3CEWBNzhHU8pTaX2rN5UrTnlh/x9037dU0e2IeAmJgyAGjHlz2/nWi0
 a+txoe/5xkURe9HpK8C8ShQXjz75CJeMwe6UsnAi6Ks0gnP2YaIjK6fW8bBGeyiDny7f
 dC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=93VyuI9ux6SDr/ub98vmdVIqFVVDpMP+vBYt5ZXXoRM=;
 b=osUlfYCbmoFa76/nizvyIcm4mPNEICR678VcJoMsI03K/1YUN8Xv/nZpOSr4toomRv
 69jAdxQMK/9kI7wSFTn1/VMJAczqFhDJiUakSyqep+HCky/h6t1O5eQUMGFvZBsLJJUC
 Sx17zYnGZlDZ4KpjPJY/ys95v4z7RYOo+fi534A4saUnCsaK/JuhJwJoKy8cdaGjO7Rp
 7fDwpnb+sT8x4ZrgDgQSoDs71dE8zW6Q5UNfhZWbX6SsNAWQvFxtn2LVV9KIck9LWoNU
 i3qaBl04XY9aubQ9YD+R2h4KgrvhPb88uW2EkWHPjojHOaL7M5CudkBFDrlxQAJE7xFN
 CZfA==
X-Gm-Message-State: AOAM531JXWFIjtNO1GPrm3QTZVBt+1e3xtw/eQpaskxivpacGB8RWGhP
 nzXk7m4U9W4jVBBLh3w+S98tVZ9FL0Jn5g==
X-Google-Smtp-Source: ABdhPJwl89g5W/bged/FP7qInJ7SirlTwMLMOaZb0egEZLtPGomE2sWIz21847UWSpR0tJEKPW+nCw==
X-Received: by 2002:a17:90a:ec0e:b0:1d9:7f4d:23be with SMTP id
 l14-20020a17090aec0e00b001d97f4d23bemr6076892pjy.181.1652465871525; 
 Fri, 13 May 2022 11:17:51 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 gg18-20020a17090b0a1200b001cd4989ff3fsm1907047pjb.6.2022.05.13.11.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 11:17:50 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v4  0/3] Implement Sstc extension 
Date: Fri, 13 May 2022 11:17:45 -0700
Message-Id: <20220513181748.990645-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102e.google.com
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
https://github.com/atishp04/qemu/tree/sstc_v4

It is tested on RV32 & RV64 with latest OpenSBI & Linux kernel[2]
patches. It does require the mcountinhibit support patch from PMU series[3]
or dummy one from Anup's series [4]. Otherwise, OpenSBI doesn't detect v1.12
priv version.

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
[2] https://github.com/atishp04/linux/tree/sstc_v3
[3] https://github.com/atishp04/qemu/tree/riscv_pmu_v7
[4] https://www.mail-archive.com/qemu-devel@nongnu.org/msg885157.html

Atish Patra (3):
hw/intc: Move mtimer/mtimecmp to aclint
target/riscv: Add stimecmp support
target/riscv: Add vstimecmp support

hw/intc/riscv_aclint.c         |  41 +++++--
hw/timer/ibex_timer.c          |  18 ++-
include/hw/intc/riscv_aclint.h |   2 +
include/hw/timer/ibex_timer.h  |   2 +
target/riscv/cpu.c             |   8 ++
target/riscv/cpu.h             |  15 ++-
target/riscv/cpu_bits.h        |   8 ++
target/riscv/cpu_helper.c      |  11 +-
target/riscv/csr.c             | 200 +++++++++++++++++++++++++++++++++
target/riscv/machine.c         |   9 +-
target/riscv/meson.build       |   3 +-
target/riscv/time_helper.c     | 114 +++++++++++++++++++
target/riscv/time_helper.h     |  30 +++++
13 files changed, 429 insertions(+), 32 deletions(-)
create mode 100644 target/riscv/time_helper.c
create mode 100644 target/riscv/time_helper.h

--
2.25.1


