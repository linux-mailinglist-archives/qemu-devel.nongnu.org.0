Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759DB32FD87
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:38:09 +0100 (CET)
Received: from localhost ([::1]:50744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIeci-0000Ce-F6
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeaz-0006vV-3a
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:21 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:45759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeav-0002wK-PG
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:20 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso1060404pjb.4
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x7tTTJlJXrwr70Bi2gDQ06WHTdR0qg3YpeiRIprpatk=;
 b=H3/JdfsshZ0r/rYK0cEIXymgORtYug9BljV1fSHPAJZD+l/eHaBpxu/NcxSoWm8t9A
 6vOA36xAy4yomfVhdDWiH6PVX3Tmin+/L+AjTw5lF8BM5RfzZoTygx8/yEnl6FcM4Euy
 8ZiJpvOlAvJV2+UGq58zWqPH3G+yJ0y1DVS/RTIXTdC2I+1FsPhb8OMuMq0HKhJHzIgD
 FYkkDRdrrTA8x3Oe8qapvDx+vwafgRZuppSMCqvbbfkIVHNEHIhosyn/jvUdXcwjfiNi
 D7hOzosMwJIzm43+aAxE1MCJLrQTOyKM+9dEY3PdYO5Fs/YLyEfhvpXd5qiWik/HVJZm
 pDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x7tTTJlJXrwr70Bi2gDQ06WHTdR0qg3YpeiRIprpatk=;
 b=J3AqukIydhoJZQQq3GZe1aU0Vjcr7mgD8zgJl+d5dydaYJ8VwbLOiFX/xnzJQ4gKNL
 kZwrvpPCq64EzzMZOc1KpFyqMsIWByQqVLtqfedSAAn/kXLtW418YjHPgefldbLuCUwf
 RCZwf7aY9UlsxXxNkR1honkCYEo6BmIN1Afha7eacUnQpEBVhXbnrGbp3xM3Qwg7IN8Z
 LcdZjwaWc9LGcM2NlfU5fDoeAbr6sFdHzJ3M5ichW0gq/2/+A9vt0l9pMX/+Iwp4Sjq8
 ll3OOnjX0Tcav4jg3gg6TSWKRwiAlzNjJnS7wBqypZ/qMat6CBOXMezURM/GatqOt9wS
 gLkA==
X-Gm-Message-State: AOAM53117J+Kl5fQCiuFKdkD/XzGbtJcqVypOm9whZKxJHtX6F4SIdY8
 jWlksCuS62y1pCKlXJVmi+Un2MWAVxAMIA==
X-Google-Smtp-Source: ABdhPJzxTi4hwtQs6C3UE6F07hPEghK5RJ9yXcE5bQodwer9k4nB1rw0npnOBxGw4b+R31xI02FoaA==
X-Received: by 2002:a17:90a:7a8b:: with SMTP id
 q11mr16389105pjf.215.1615066575575; 
 Sat, 06 Mar 2021 13:36:15 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/27] tcg patch queue
Date: Sat,  6 Mar 2021 13:35:46 -0800
Message-Id: <20210306213613.85168-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 91e92cad67caca3bc4b8e920ddb5c8ca64aac9e1:

  Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210305' into staging (2021-03-05 19:04:47 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210306

for you to fetch changes up to 6cc9d67c6f682cf04eea2d6e64a252b63a7eccdf:

  accel/tcg: Precompute curr_cflags into cpu->tcg_cflags (2021-03-06 11:53:57 -0800)

----------------------------------------------------------------
TCI build fix and cleanup
Streamline tb_lookup
Fixes for tcg/aarch64

----------------------------------------------------------------
Alex Bennée (4):
      accel/tcg: rename tb_lookup__cpu_state and hoist state extraction
      accel/tcg: move CF_CLUSTER calculation to curr_cflags
      accel/tcg: drop the use of CF_HASH_MASK and rename params
      include/exec: lightly re-arrange TranslationBlock

Richard Henderson (23):
      tcg/aarch64: Fix constant subtraction in tcg_out_addsub2
      tcg/aarch64: Fix I3617_CMLE0
      tcg/aarch64: Fix generation of "scalar" vector operations
      tcg/tci: Use exec/cpu_ldst.h interfaces
      tcg: Split out tcg_raise_tb_overflow
      tcg: Manage splitwx in tc_ptr_to_region_tree by hand
      tcg/tci: Merge identical cases in generation (arithmetic opcodes)
      tcg/tci: Merge identical cases in generation (exchange opcodes)
      tcg/tci: Merge identical cases in generation (deposit opcode)
      tcg/tci: Merge identical cases in generation (conditional opcodes)
      tcg/tci: Merge identical cases in generation (load/store opcodes)
      tcg/tci: Remove tci_read_r8
      tcg/tci: Remove tci_read_r8s
      tcg/tci: Remove tci_read_r16
      tcg/tci: Remove tci_read_r16s
      tcg/tci: Remove tci_read_r32
      tcg/tci: Remove tci_read_r32s
      tcg/tci: Reduce use of tci_read_r64
      tcg/tci: Merge basic arithmetic operations
      tcg/tci: Merge extension operations
      tcg/tci: Merge bswap operations
      tcg/tci: Merge mov, not and neg operations
      accel/tcg: Precompute curr_cflags into cpu->tcg_cflags

 accel/tcg/tcg-accel-ops.h       |   1 +
 include/exec/exec-all.h         |  22 +-
 include/exec/tb-lookup.h        |  26 +-
 include/hw/core/cpu.h           |   2 +
 accel/tcg/cpu-exec.c            |  34 +--
 accel/tcg/tcg-accel-ops-mttcg.c |   3 +-
 accel/tcg/tcg-accel-ops-rr.c    |   2 +-
 accel/tcg/tcg-accel-ops.c       |   8 +
 accel/tcg/tcg-runtime.c         |   6 +-
 accel/tcg/translate-all.c       |  18 +-
 linux-user/main.c               |   1 +
 linux-user/sh4/signal.c         |   8 +-
 linux-user/syscall.c            |  18 +-
 softmmu/physmem.c               |   2 +-
 tcg/tcg.c                       |  29 ++-
 tcg/tci.c                       | 526 ++++++++++++----------------------------
 tcg/aarch64/tcg-target.c.inc    | 229 ++++++++++++++---
 tcg/tci/tcg-target.c.inc        | 204 ++++++----------
 18 files changed, 529 insertions(+), 610 deletions(-)

