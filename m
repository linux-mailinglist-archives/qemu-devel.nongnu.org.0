Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A844614047
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 22:59:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opcmo-00014m-Oo; Mon, 31 Oct 2022 17:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcmm-00014V-AE
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 17:57:36 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcmk-0007iV-Gk
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 17:57:36 -0400
Received: by mail-il1-x12b.google.com with SMTP id m15so4749169ilq.2
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 14:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Mo9l+k2co7XzUSfWEUZYtYwTK9wv53E17+zkdZVAuXI=;
 b=jmecIZOxhJGtSgqXqQBsKiAuxW/A/EYx6C7hS2uMLIIVlOMptW6rAkvEPwAPOHEkIK
 oLLLqSAeVF6sEPS6a9UhbmZgRrd/UeKXgyZ01XYujdvkOTcglZT5q6oZ8kQjtvzx9pZc
 27D8rIQ//y7mZw0x1TJvN3Y6SqEo/SZU39kCosCkqDS4wWXqsq97J1GLn8brwtRwn4os
 QY9ayH15c9XRvTaeK8H6X3W4ILDJDMaeg73vDJAfGZaV+a6rAKQ/KFwCItQQ6teGoDWg
 d14vL0lnDnUd++j8EE0DNWkWD1ehRTDNbhSg+9XkVQOixKRHFV+PY+Gv/Oc03SoWecJC
 UZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mo9l+k2co7XzUSfWEUZYtYwTK9wv53E17+zkdZVAuXI=;
 b=MmgImIDTNQYlFgJs+ErTqPTkfaQfMjg42BVhSlVHzub3ZoFDSmL1ZiRr38n4z++R9p
 G4fJeWSFckPtJaMByg+5zsF4Pb75hNmGnF/++fHzP35k6uY0tn2wS7GwKB6mubxdp4xK
 pedqVw3XNyqB2p5vN2chXx5tzgmKymJ8sp7396ipJYgItntyyPw18JoQxQ3xsic27WK/
 +99ulARk2aDkA49fP7KYVIUG2zYmwb90uawjY6N9fObmIAAVpzz8FrQfTBeA7gkhqMgP
 D4Jr87kxPHfDdXAv+KnlTj3cKu2qt2/dWu8WZ7kCxMahCmV8uKbPj2VR+NQjoCjEgqVi
 NPNA==
X-Gm-Message-State: ACrzQf1svff1b1oDp2u9nYNiCLZtw7188KO1Y/ADpz1azTXpoRXkwX98
 pXw0RFebW4Rl8Az98HzBWy06mLWg00/y+g==
X-Google-Smtp-Source: AMsMyM7ZChzLbJy0Qr5tjgPb6cqfdExV7rBzOKBenYfIFcnXhaSgCmTpiacWbK0FzfNhZkgEQETfVQ==
X-Received: by 2002:a05:6e02:967:b0:300:b362:6604 with SMTP id
 q7-20020a056e02096700b00300b3626604mr2754911ilt.246.1667253452945; 
 Mon, 31 Oct 2022 14:57:32 -0700 (PDT)
Received: from stoup.. ([172.58.142.195]) by smtp.gmail.com with ESMTPSA id
 i12-20020a056e02054c00b002f4e385252asm2920913ils.39.2022.10.31.14.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 14:57:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com
Subject: [PULL v2 00/13] tcg-next patch queue
Date: Tue,  1 Nov 2022 08:57:10 +1100
Message-Id: <20221031215723.414467-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

For v2, adjust patch 6 for --disable-tcg and
include the fix for the cpu initialization race.


r~


The following changes since commit 5107fd3effb1cfec3b96d9e819f1605048640e31:

  net/vhost-vdpa.c: Fix clang compilation failure (2022-10-31 13:01:31 -0400)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20221031-2

for you to fetch changes up to 83d92559cdf0ce842e52e5bbf230f7f62a6206aa:

  tests/tcg/multiarch: Add munmap-pthread.c (2022-11-01 08:31:41 +1100)

----------------------------------------------------------------
Remove sparc32plus support from tcg/sparc.
target/i386: Use cpu_unwind_state_data for tpr access.
target/i386: Expand eflags updates inline
Complete cpu initialization before registration

----------------------------------------------------------------
Icenowy Zheng (1):
      tcg/tci: fix logic error when registering helpers via FFI

Ilya Leoshkevich (1):
      tests/tcg/multiarch: Add munmap-pthread.c

Richard Henderson (11):
      tcg/sparc: Remove support for sparc32plus
      tcg/sparc64: Rename from tcg/sparc
      tcg/sparc64: Remove sparc32plus constraints
      accel/tcg: Introduce cpu_unwind_state_data
      target/i386: Use cpu_unwind_state_data for tpr access
      target/openrisc: Always exit after mtspr npc
      target/openrisc: Use cpu_unwind_state_data for mfspr
      accel/tcg: Remove will_exit argument from cpu_restore_state
      accel/tcg: Remove reset_icount argument from cpu_restore_state_from_tb
      target/i386: Expand eflags updates inline
      accel/tcg: Complete cpu initialization before registration

 meson.build                                 |   4 +-
 accel/tcg/internal.h                        |   4 +-
 include/exec/exec-all.h                     |  24 ++-
 target/i386/helper.h                        |   5 -
 tcg/{sparc => sparc64}/tcg-target-con-set.h |  16 +-
 tcg/{sparc => sparc64}/tcg-target-con-str.h |   3 -
 tcg/{sparc => sparc64}/tcg-target.h         |  11 --
 accel/tcg/cpu-exec-common.c                 |   2 +-
 accel/tcg/cpu-exec.c                        |   8 +-
 accel/tcg/tb-maint.c                        |   4 +-
 accel/tcg/translate-all.c                   | 107 ++++++-----
 cpu.c                                       |  10 +-
 target/alpha/helper.c                       |   2 +-
 target/alpha/mem_helper.c                   |   2 +-
 target/arm/op_helper.c                      |   2 +-
 target/arm/tlb_helper.c                     |   8 +-
 target/cris/helper.c                        |   2 +-
 target/i386/helper.c                        |  25 ++-
 target/i386/tcg/cc_helper.c                 |  41 -----
 target/i386/tcg/sysemu/svm_helper.c         |   2 +-
 target/i386/tcg/translate.c                 |  30 ++-
 target/m68k/op_helper.c                     |   4 +-
 target/microblaze/helper.c                  |   2 +-
 target/nios2/op_helper.c                    |   2 +-
 target/openrisc/sys_helper.c                |  17 +-
 target/ppc/excp_helper.c                    |   2 +-
 target/s390x/tcg/excp_helper.c              |   2 +-
 target/tricore/op_helper.c                  |   2 +-
 target/xtensa/helper.c                      |   6 +-
 tcg/tcg.c                                   |  81 +-------
 tests/tcg/multiarch/munmap-pthread.c        |  79 ++++++++
 tcg/{sparc => sparc64}/tcg-target.c.inc     | 275 ++++++++--------------------
 MAINTAINERS                                 |   2 +-
 tests/tcg/multiarch/Makefile.target         |   3 +
 34 files changed, 339 insertions(+), 450 deletions(-)
 rename tcg/{sparc => sparc64}/tcg-target-con-set.h (69%)
 rename tcg/{sparc => sparc64}/tcg-target-con-str.h (77%)
 rename tcg/{sparc => sparc64}/tcg-target.h (95%)
 create mode 100644 tests/tcg/multiarch/munmap-pthread.c
 rename tcg/{sparc => sparc64}/tcg-target.c.inc (91%)

