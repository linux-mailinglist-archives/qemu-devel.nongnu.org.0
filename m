Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793584B00EE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 00:07:15 +0100 (CET)
Received: from localhost ([::1]:58010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHw3N-00070P-Ty
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 18:07:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvx1-000442-QS
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:00:39 -0500
Received: from [2607:f8b0:4864:20::42f] (port=34610
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvwz-000312-Ja
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:00:39 -0500
Received: by mail-pf1-x42f.google.com with SMTP id n23so7038199pfo.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 15:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CwxLYHpCEI8aD5Vzcq4kCOoDLHWkicz3VcNV7xmAo+w=;
 b=VNMDLTsyu0Vpm+EVOCCcdZah/E/bzqTZUqS8YF1k1LWIAmwzXi3I/BLFxjaGyyAhHR
 93mWtREu1qj9L4rNMF1E9Oq5OS2/y30UNRu/L/SDpHwYVzOf+4jhMngj6mT1AvoR5djF
 Uud9Bw1Mfqsd15rrm+zdGXLvZCjpLAM7oa1VtuNkXYaZ9kPsIjAlab1MvlIzhBUT4LAh
 LYxlqaNuTZJ3915LySTiHvSDlluNoGEO4yreN/z7On7FdG8OjMYdjDXVGatj3GE4LoIB
 V+rTo6zc8mb1f2WF2dFnw/dnAmLKfiRseAv2xZNPhg200o7W22WnlwhH0LTFKk90aJmg
 IDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CwxLYHpCEI8aD5Vzcq4kCOoDLHWkicz3VcNV7xmAo+w=;
 b=faqtTYMZnIDPLkCk35Z69pIE+QY3v5GyFPp2wzl3fw8Ltx7dLm7unTNkNemUkU99w6
 f+dnxzMLhJ2EWe9MbulhP3IguvmDMv9h3r6H6uWs4YPxtGoiRxicVWwsmWnfqI8ky7+8
 x5MjRy4c5C6/KoXX6PBjenjrzil17HaV+qM4Rdm1xXIBWaHRYYFFp1wVOpnc4kTbiXlU
 Fpau6M2eCWMHjWv5OjjP+eTj8aYmlNhxPfl+EOO4wDKx3Qm8smtzNHWbK1rj9F87sonb
 8KtO6leDBVNzUJjGIRyWtNFvlMTSsqpBChm312/LT0YNcH0xX8OrITtSYpa44gTqnEZK
 S1iA==
X-Gm-Message-State: AOAM530FEmGoNGh3l9Q9iyWcrEeQnkNGLSDtoF04iTcgk05brQCycXB4
 9F5p/sfVQxct5WOG//EZT00qCIbBgKI=
X-Google-Smtp-Source: ABdhPJyfRrrRxvU2RzJRlX4pE8f5xksxISGLsjgC2ByOqrfeFkImS+CBEhG44teNoTlj8mRzjNhXWQ==
X-Received: by 2002:a63:ed10:: with SMTP id d16mr3702731pgi.17.1644447635966; 
 Wed, 09 Feb 2022 15:00:35 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id h9sm21516557pfi.124.2022.02.09.15.00.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 15:00:35 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/9] exec: Split some user-mode specific declarations from
 'exec/exec-all.h'
Date: Thu, 10 Feb 2022 00:00:21 +0100
Message-Id: <20220209230030.93987-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

- Add missing headers
- Merge exec/user/ to user/
- Extract MMUAccessType from QOM "hw/core/cpu.h" to "exec/cpu-tlb.h"
- Extract user-specific declarations to "user/cpu-{common,target}.h"
- Share preexit_cleanup() from Linux with BSD

More to come, but flushing for early feedback.

Based-on: <20220209215446.58402-1-f4bug@amsat.org>

Philippe Mathieu-Daudé (9):
  accel/tcg: Add missing 'tcg/tcg.h' header
  coverity-scan: Cover common-user/
  include: Move exec/user/ to user/
  linux-user/exit: Add missing 'qemu/plugin.h' header
  linux-user/cpu_loop: Add missing 'exec/cpu-all.h' header
  exec: Define MMUAccessType in 'exec/cpu-tlb.h' header
  user: Declare target-specific prototypes in 'user/cpu-target.h'
  user: Declare target-agnostic prototypes in 'user/cpu-common.h'
  user: Share preexit_cleanup() with linux and bsd implementations

 accel/tcg/tcg-accel-ops-icount.c    |  1 +
 accel/tcg/tcg-accel-ops-mttcg.c     |  1 +
 accel/tcg/tcg-accel-ops-rr.c        |  1 +
 accel/tcg/tcg-accel-ops.c           |  1 +
 accel/tcg/user-exec.c               |  1 +
 bsd-user/elfload.c                  |  1 +
 bsd-user/main.c                     |  1 +
 bsd-user/qemu.h                     |  6 ++--
 bsd-user/signal.c                   |  1 +
 {linux-user => common-user}/exit.c  |  4 +--
 common-user/meson.build             |  1 +
 include/exec/cpu-all.h              |  5 ++-
 include/exec/cpu-defs.h             |  1 +
 include/exec/cpu-tlb.h              | 16 +++++++++
 include/exec/cpu_ldst.h             |  1 +
 include/exec/exec-all.h             | 54 ++--------------------------
 include/hw/core/cpu.h               |  6 ----
 include/hw/core/tcg-cpu-ops.h       |  1 +
 include/{exec => }/user/abitypes.h  |  0
 include/user/cpu-common.h           | 36 +++++++++++++++++++
 include/user/cpu-target.h           | 56 +++++++++++++++++++++++++++++
 include/user/safe-syscall.h         |  6 ++--
 include/{exec => }/user/thunk.h     |  2 +-
 linux-user/aarch64/cpu_loop.c       |  1 +
 linux-user/alpha/cpu_loop.c         |  1 +
 linux-user/arm/cpu_loop.c           |  1 +
 linux-user/arm/signal.c             |  1 +
 linux-user/cpu_loop-common.h        |  1 +
 linux-user/cris/cpu_loop.c          |  1 +
 linux-user/elfload.c                |  1 +
 linux-user/hexagon/cpu_loop.c       |  1 +
 linux-user/hppa/cpu_loop.c          |  1 +
 linux-user/hppa/signal.c            |  1 +
 linux-user/i386/cpu_loop.c          |  1 +
 linux-user/linuxload.c              |  1 +
 linux-user/m68k/cpu_loop.c          |  1 +
 linux-user/main.c                   |  1 +
 linux-user/meson.build              |  1 -
 linux-user/microblaze/cpu_loop.c    |  1 +
 linux-user/mips/cpu_loop.c          |  1 +
 linux-user/mmap.c                   |  1 +
 linux-user/nios2/cpu_loop.c         |  1 +
 linux-user/openrisc/cpu_loop.c      |  1 +
 linux-user/ppc/cpu_loop.c           |  1 +
 linux-user/ppc/signal.c             |  1 +
 linux-user/qemu.h                   |  2 +-
 linux-user/riscv/cpu_loop.c         |  1 +
 linux-user/s390x/cpu_loop.c         |  1 +
 linux-user/sh4/cpu_loop.c           |  1 +
 linux-user/signal.c                 |  1 +
 linux-user/sparc/cpu_loop.c         |  1 +
 linux-user/syscall.c                |  1 +
 linux-user/thunk.c                  |  2 +-
 linux-user/uaccess.c                |  1 +
 linux-user/user-internals.h         | 12 +------
 linux-user/xtensa/cpu_loop.c        |  1 +
 scripts/coverity-scan/COMPONENTS.md |  2 +-
 target/arm/internals.h              |  1 +
 target/mips/internal.h              |  1 +
 target/ppc/internal.h               |  2 ++
 target/ppc/mmu-hash32.h             |  2 ++
 target/ppc/mmu-hash64.h             |  2 ++
 target/ppc/mmu-radix64.h            |  2 ++
 target/s390x/s390x-internal.h       |  2 ++
 64 files changed, 178 insertions(+), 85 deletions(-)
 rename {linux-user => common-user}/exit.c (95%)
 create mode 100644 include/exec/cpu-tlb.h
 rename include/{exec => }/user/abitypes.h (100%)
 create mode 100644 include/user/cpu-common.h
 create mode 100644 include/user/cpu-target.h
 rename include/{exec => }/user/thunk.h (99%)

-- 
2.34.1


