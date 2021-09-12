Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28A3407E43
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:01:47 +0200 (CEST)
Received: from localhost ([::1]:42912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPRvO-0004wg-KC
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPRs0-0002MB-5X
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:58:16 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:37786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPRrx-0003tT-If
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:58:15 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 j10-20020a17090a94ca00b00181f17b7ef7so4874934pjw.2
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NC681AfB2Aq3JmMml1DCNZcdOc/ZXHLexY7sbOaAvj0=;
 b=mBcbRkKTNTIfqsmAkZl2GFJuRtI9ariDw8MhtmYK3J3gQt5xlsJAJGOtfEK4iQgadO
 4WcxOE7H0o2gLViZaneRAMcGquPdNGSjHiVv9fbi+gkJIJRLj6kSilZ9aVL9SmCYilID
 lF2tKEKKAB/XVi5Hit+wvjZtO6PBRJW1lWEW/cvzOLnBrfRcI/CaYKgTeEf/VmvM5VeU
 JQo0seHU4ujKJS6U8Q7aiRdIKcf9okWkPRmcXmE5T0E2PuyAHvBR1NNp2uAZpfzKIjkr
 W/PvfL1AE0zuWMrNPrVLdSNBjNwHfCJYzBIM+C3P0LUX4A0DUhu7vvlekOUyFSnMe/gM
 mhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NC681AfB2Aq3JmMml1DCNZcdOc/ZXHLexY7sbOaAvj0=;
 b=LFytAjIcooh8fHmMYCJf6G2/57EA/CWv5uBGqdeSD86f8uXdn4hneeiNmu6qb7PiKU
 F8YToP2r53s+DLSjgcrVq07j8+bhqtNqNRAlbK3YZgon83R63W99dU4gy2+riHT1oTA6
 7kQeUEKbGj+EJrQTq40Tx/hG5qn/0HtLJVWMkPxmi/M+yobwJmL1G4PkBZdacYx+0moQ
 9KiQm0xXVT3FlK60SC4LHa/3udM1GhN+nC4wB9bQmPLKH2NWcXwJMNaLORcb+D1M+G9B
 7UTbru0S05HQKk2/lvLttJ4DcPhl8ALdwX8IbM3wUvMNY41PpUGzeDZGeaPUavmVb2L+
 qNgw==
X-Gm-Message-State: AOAM531DMvgs9IEtfmpn+2PT1h0ES8bCp3aCC3bvbD26L2ziN9I3YMZH
 3kG+KryRJq+me7/4ifVZUMrJx+ShpV9xxg==
X-Google-Smtp-Source: ABdhPJxwL9gunEMllLpokXUQrSVgw2TBQx0KUzApE1comUJ0CG9mRR1+2sK5eHqxngOnDwzx39O5iA==
X-Received: by 2002:a17:90b:1981:: with SMTP id
 mv1mr8204264pjb.45.1631462290616; 
 Sun, 12 Sep 2021 08:58:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v13sm4439415pfm.16.2021.09.12.08.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 08:58:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] tcg patch queue
Date: Sun, 12 Sep 2021 08:58:00 -0700
Message-Id: <20210912155809.196236-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Note that I've extended the expiration date of my gpg key
and have uploaded it to keyserver.ubuntu.com.


r~


The following changes since commit 99c44988d5ba1866a411450c877ed818b1b70081:

  Merge remote-tracking branch 'remotes/bsdimp/tags/pull-bsd-user-20210910' into staging (2021-09-11 14:00:39 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210912

for you to fetch changes up to 267a3ec3e2a8fb3e06a9d46d09fcfc57dfefd118:

  tcg/arm: Fix tcg_out_vec_op function signature (2021-09-12 05:07:36 -0700)

----------------------------------------------------------------
Fix translation race condition for user-only.
Fix tcg/i386 encoding for VPSLLVQ, VPSRLVQ.
Fix tcg/arm tcg_out_vec_op signature.
Fix tcg/ppc (32bit) build with clang.
Remove dupluate TCG_KICK_PERIOD definition.
Remove unused tcg_global_reg_new.
Use __builtin_bswap*.

----------------------------------------------------------------
Bin Meng (1):
      tcg: Remove tcg_global_reg_new defines

Ilya Leoshkevich (2):
      accel/tcg: Add DisasContextBase argument to translator_ld*
      accel/tcg: Clear PAGE_WRITE before translation

Jose R. Ziviani (1):
      tcg/arm: Fix tcg_out_vec_op function signature

Luc Michel (1):
      accel/tcg: remove redundant TCG_KICK_PERIOD define

Richard Henderson (4):
      tcg/i386: Split P_VEXW from P_REXW
      include/qemu: Use builtins for bswap
      tcg/ppc: Replace TCG_TARGET_CALL_DARWIN with _CALL_DARWIN
      tcg/ppc: Ensure _CALL_SYSV is set for 32-bit ELF

 meson.build                               |  6 ----
 include/exec/translate-all.h              |  1 +
 include/exec/translator.h                 | 44 +++++++++++++----------
 include/qemu/bswap.h                      | 53 ++-------------------------
 include/tcg/tcg-op.h                      |  2 --
 target/arm/arm_ldst.h                     | 12 +++----
 accel/tcg/tcg-accel-ops-rr.c              |  2 --
 accel/tcg/translate-all.c                 | 59 ++++++++++++++++++-------------
 accel/tcg/translator.c                    | 39 ++++++++++++++++++++
 target/alpha/translate.c                  |  2 +-
 target/arm/translate-a64.c                |  2 +-
 target/arm/translate.c                    |  9 ++---
 target/hexagon/translate.c                |  3 +-
 target/hppa/translate.c                   |  5 +--
 target/i386/tcg/translate.c               | 10 +++---
 target/m68k/translate.c                   |  2 +-
 target/mips/tcg/translate.c               |  8 ++---
 target/openrisc/translate.c               |  2 +-
 target/ppc/translate.c                    |  5 +--
 target/riscv/translate.c                  |  5 +--
 target/s390x/tcg/translate.c              | 16 +++++----
 target/sh4/translate.c                    |  4 +--
 target/sparc/translate.c                  |  2 +-
 target/xtensa/translate.c                 |  5 +--
 target/mips/tcg/micromips_translate.c.inc |  2 +-
 target/mips/tcg/mips16e_translate.c.inc   |  4 +--
 target/mips/tcg/nanomips_translate.c.inc  |  4 +--
 tcg/arm/tcg-target.c.inc                  |  3 +-
 tcg/i386/tcg-target.c.inc                 | 13 +++----
 tcg/ppc/tcg-target.c.inc                  | 25 ++++++++++---
 30 files changed, 185 insertions(+), 164 deletions(-)

