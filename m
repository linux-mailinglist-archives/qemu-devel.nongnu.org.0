Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB0B510C8F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 01:20:59 +0200 (CEST)
Received: from localhost ([::1]:40696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njUUM-0000Id-6o
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 19:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1njUIr-0005H4-VI
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:09:05 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:40871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1njUIp-0000I5-PM
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:09:05 -0400
Received: by mail-pg1-x52f.google.com with SMTP id x12so87409pgj.7
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 16:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jk8tA+yKf4FLJEbGZW6ag/0yVS0cS54zZ6lF4KTSGts=;
 b=JGJ4FmCajKcGKfZLzjjAo4gHp2myal7QYfgRAw77NcQo3suZ1rv/fmQrd7bs/gMvO4
 fsu23eP48QZ0yhdtbepEcAquR69GHPtmBx4iO7nmplwVGs1sdBkYNntalpJAj9atAlou
 ftH5jBI85nVrXphSMKZ3RbDD9U8u5WZfy+9uOUhzUv2Kbo8T/PDLhAUEWoFB2ZLHSdfl
 gYD1m/QnxMnlVsc5ERd2X7FtV+iWJwdR+k7jh19x+AZda9b0/RmZUu3ALjkfloHIQm+I
 YXLBbOuDGAArf0kOiAHm+OfcTCttU6lygd9qQ1bAHjl8oMedd5knygfPTp6Wc28Atuxm
 c+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jk8tA+yKf4FLJEbGZW6ag/0yVS0cS54zZ6lF4KTSGts=;
 b=h7VOXhKcKJ08TEFXLLKjMeZSlNCVlmmmY/Ke4wCVRXvh0wLYJ7prcDn3Dp+MjjoQsc
 2Y+Oe+WqTWdZyIGJWmYEnujrcDKUoqI3sZUnnENRVlpBM3fTTtZDUSjOQfChzcn8frWR
 aDDv/TwWgYZwCFgA41b9yDa6o3GYre2/uVYmD8wHvNtTt/7XabQDHcd8b9TytIwUaKK1
 D0fNTw6hWphCu/XmHKcX4LziaiOVzXHOkjsFd2Ni72+6zyNL/7/VRfkZE/snj4ELgQ/3
 yi0zSTrPT3/aE6t091keoAkdkkZa4xspx7dE+0ZK22WCm/msaZ1IV6W1NtizlzNRGrBD
 7aMQ==
X-Gm-Message-State: AOAM530+dpDmZrQas+RgSyiPIetpqPpiz31ueU+55D7qJ/wUf4NbmgGo
 q6PH8lnEQ0yU/cCg2EfF4Kdp93GF5DOp9g==
X-Google-Smtp-Source: ABdhPJxas2/7AoEOr3VO3X9Y4kLHrsSU4oAFjopy0KlLmcgmt7JGMkjUQwLLTqr08C4iPvWNdol7PQ==
X-Received: by 2002:a05:6a00:e14:b0:4fe:3cdb:23f with SMTP id
 bq20-20020a056a000e1400b004fe3cdb023fmr26789024pfb.86.1651014541222; 
 Tue, 26 Apr 2022 16:09:01 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 t29-20020a62d15d000000b0050d42864753sm7856490pfl.49.2022.04.26.16.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 16:09:00 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2  0/5] Implement Sstc extension 
Date: Tue, 26 Apr 2022 16:08:49 -0700
Message-Id: <20220426230855.336292-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x52f.google.com
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
Cc: qemu-riscv@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series implements Sstc extension[1] which was ratified recently.

The first patch is a prepartory patches while PATCH 2 adds stimecmp
support while PATCH 3 adds vstimecmp support. This series is based on
on top of upstream commit (faee5441a038).

The series can also be found at
https://github.com/atishp04/qemu/tree/sstc_v2

It is tested on RV32 & RV64 with additional OpenSBI[2] & Linux kernel[3]
patches.

Changes from v1->v2:
1. Rebased on the latest upstream commit.
2. Replaced PATCH 1 with another patch where mtimer/timecmp is
   moved from CPU to ACLINT.
3. Added ACLINT migration support.

[1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
[2] https://github.com/atishp04/opensbi/tree/sstc_v2
[3] https://github.com/atishp04/linux/tree/sstc_v3

Atish Patra (5):
hw/intc: Move mtimer/mtimecmp to aclint
migration: Add 64bit variable array data type
hw/intc: Support migration of aclint device
target/riscv: Add stimecmp support
target/riscv: Add vstimecmp support

hw/intc/riscv_aclint.c         |  41 +++++---
hw/timer/ibex_timer.c          |  20 ++--
include/hw/intc/riscv_aclint.h |   2 +
include/hw/timer/ibex_timer.h  |   2 +
include/migration/vmstate.h    |  11 ++
migration/vmstate.c            |   2 +
target/riscv/cpu.c             |   8 ++
target/riscv/cpu.h             |  10 +-
target/riscv/cpu_bits.h        |   8 ++
target/riscv/cpu_helper.c      |  11 +-
target/riscv/csr.c             | 181 +++++++++++++++++++++++++++++++++
target/riscv/machine.c         |   3 +-
target/riscv/meson.build       |   3 +-
target/riscv/time_helper.c     | 114 +++++++++++++++++++++
target/riscv/time_helper.h     |  30 ++++++
15 files changed, 415 insertions(+), 31 deletions(-)
create mode 100644 target/riscv/time_helper.c
create mode 100644 target/riscv/time_helper.h

--
2.25.1


