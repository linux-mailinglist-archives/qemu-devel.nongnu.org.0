Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C0C370D6E
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 16:47:57 +0200 (CEST)
Received: from localhost ([::1]:51398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDO0-00034o-IC
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 10:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKb-0001Fu-Is
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:25 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKY-00058v-R2
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:25 -0400
Received: by mail-pg1-x529.google.com with SMTP id i14so1916862pgk.5
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mPX1C1qmQ9JuCgV9FteoT42wh6Ly21fJelh7sGz/eDk=;
 b=SYwLlQLgJHoPTxo41F01duOb9Vu5Y6k+iMdlGawOfVhk8tbYTVljSBAynpbjH1wMEl
 0fsUPVLPnuDyCA4AyACMoVejQcSo7lWupLhLOF5EobBAy8QBDWc1R39CcTaTomjpyRfJ
 Hp2ZW4YWxT9Wy1bKvygHi8eZcaKTSb/rdHvyW9//RyhvFJbWm0T7obeiExuT0XY+oD+E
 Ss2p8Hk2zf2VZb3g4hGHFqyIXe0me84960ll4o3pW1b6XX1tIurW0KJdrKRYuGoPPWa0
 Ijkv+bJ1DMuJUkfdFNnhv5KtEOHVPCtOHWLDWnnwrnLVIKhAxengDtepQdk5CmRgAMRg
 gGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mPX1C1qmQ9JuCgV9FteoT42wh6Ly21fJelh7sGz/eDk=;
 b=czZP4Uj3KOkVfhHOXjpbiAhJY/wjX08MZGLUUwEEw0mKtuQ8ieka7qZbD1Z3NctM9Z
 ASaQVeNuJvOUN3dvFWOuXL4vqymBc+kAZCWq3Em18o1vMu2ws7Fch3kUZ1KGzCCIuKMj
 kxUW5XUP6sD3ruy7btBvpv4mmUjXpmhjX7+TQr3knzeThzbGgPYJ+33pTW5yZfu2DALJ
 hpPzgEMvX7vnzZvHRIx9WeFb/vPIwaYfTg9WtlrgDS52Z7b80HvBeLd9i4ffMMppjUr7
 0pLmL1lbiaMy1qWtsSb9tJLi4qcodSOTMgC+7UsHpfYc2Lsiqy0T3Ppvd8rh+dDojoke
 TcBg==
X-Gm-Message-State: AOAM531ulIXQHFDJs4GCrwhU5izoU0cJMEdRVDlgUBz0vAK7J4HuioHF
 yQro3AWIBUOAG7Wz8DlVSJ9KDq+ACaYJ9A==
X-Google-Smtp-Source: ABdhPJxUTjJEyxIDJMiJ7mzkbgDIRfBX+Wi2doNebB/MFrmvfAUfGFKcpQcI1HHGdWReUa9k2GXT7A==
X-Received: by 2002:a63:4b52:: with SMTP id k18mr14140478pgl.190.1619966661072; 
 Sun, 02 May 2021 07:44:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/31] target/hexagon patch queue
Date: Sun,  2 May 2021 07:43:48 -0700
Message-Id: <20210502144419.1659844-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

The following changes since commit 8f860d2633baf9c2b6261f703f86e394c6bc22ca:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-04-30' into staging (2021-04-30 16:02:00 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-hex-20210502

for you to fetch changes up to e628c0156be74dd14a261bbd18674bacd1afcc7d:

  Hexagon (target/hexagon) CABAC decode bin (2021-05-01 16:06:11 -0700)

----------------------------------------------------------------
Minor cleanups.
Finish the rest of the hexagon integer instructions.

----------------------------------------------------------------
Taylor Simpson (31):
      target/hexagon: translation changes
      target/hexagon: remove unnecessary checks in find_iclass_slots
      target/hexagon: Change DECODE_MAPPED_REG operand name to OPNUM
      target/hexagon: fix typo in comment
      target/hexagon: remove unnecessary semicolons
      Hexagon (target/hexagon) TCG generation cleanup
      Hexagon (target/hexagon) cleanup gen_log_predicated_reg_write_pair
      Hexagon (target/hexagon) remove unnecessary inline directives
      Hexagon (target/hexagon) use env_archcpu and env_cpu
      Hexagon (target/hexagon) properly generate TB end for DISAS_NORETURN
      Hexagon (target/hexagon) decide if pred has been written at TCG gen time
      Hexagon (target/hexagon) change variables from int to bool when appropriate
      Hexagon (target/hexagon) remove unused carry_from_add64 function
      Hexagon (target/hexagon) change type of softfloat_roundingmodes
      Hexagon (target/hexagon) use softfloat default NaN and tininess
      Hexagon (target/hexagon) replace float32_mul_pow2 with float32_scalbn
      Hexagon (target/hexagon) use softfloat for float-to-int conversions
      Hexagon (target/hexagon) cleanup ternary operators in semantics
      Hexagon (target/hexagon) cleanup reg_field_info definition
      Hexagon (target/hexagon) move QEMU_GENERATE to only be on during macros.h
      Hexagon (target/hexagon) compile all debug code
      Hexagon (target/hexagon) add F2_sfrecipa instruction
      Hexagon (target/hexagon) add F2_sfinvsqrta
      Hexagon (target/hexagon) add A5_ACS (vacsh)
      Hexagon (target/hexagon) add A6_vminub_RdP
      Hexagon (target/hexagon) add A4_addp_c/A4_subp_c
      Hexagon (target/hexagon) circular addressing
      Hexagon (target/hexagon) bit reverse (brev) addressing
      Hexagon (target/hexagon) load and unpack bytes instructions
      Hexagon (target/hexagon) load into shifted register instructions
      Hexagon (target/hexagon) CABAC decode bin

 target/hexagon/arch.h                 |   9 +-
 target/hexagon/conv_emu.h             |  31 ---
 target/hexagon/cpu.h                  |   5 -
 target/hexagon/cpu_bits.h             |   2 +-
 target/hexagon/gen_tcg.h              | 424 ++++++++++++++++++++++++++++-
 target/hexagon/helper.h               |  23 +-
 target/hexagon/insn.h                 |  21 +-
 target/hexagon/internal.h             |  11 +-
 target/hexagon/macros.h               | 118 ++++++++-
 target/hexagon/reg_fields.h           |   4 +-
 target/hexagon/translate.h            |   9 +-
 linux-user/hexagon/cpu_loop.c         |   2 +-
 target/hexagon/arch.c                 | 181 ++++++++++---
 target/hexagon/conv_emu.c             | 177 -------------
 target/hexagon/cpu.c                  |  14 +-
 target/hexagon/decode.c               |  84 +++---
 target/hexagon/fma_emu.c              |  40 +--
 target/hexagon/genptr.c               | 233 +++++++++++++---
 target/hexagon/iclass.c               |   4 -
 target/hexagon/op_helper.c            | 398 ++++++++++++++++++----------
 target/hexagon/reg_fields.c           |   3 +-
 target/hexagon/translate.c            | 175 ++++++------
 tests/tcg/hexagon/brev.c              | 190 +++++++++++++
 tests/tcg/hexagon/circ.c              | 486 ++++++++++++++++++++++++++++++++++
 tests/tcg/hexagon/fpstuff.c           | 242 +++++++++++++++++
 tests/tcg/hexagon/load_align.c        | 415 +++++++++++++++++++++++++++++
 tests/tcg/hexagon/load_unpack.c       | 474 +++++++++++++++++++++++++++++++++
 tests/tcg/hexagon/misc.c              |  47 ++++
 tests/tcg/hexagon/multi_result.c      | 282 ++++++++++++++++++++
 fpu/softfloat-specialize.c.inc        |   3 +
 target/hexagon/gen_tcg_funcs.py       |   2 +-
 target/hexagon/imported/alu.idef      |  44 +++
 target/hexagon/imported/compare.idef  |  12 +-
 target/hexagon/imported/encode_pp.def |  30 +++
 target/hexagon/imported/float.idef    |  32 +++
 target/hexagon/imported/ldst.idef     |  68 +++++
 target/hexagon/imported/macros.def    |  47 ++++
 target/hexagon/imported/shift.idef    |  47 ++++
 target/hexagon/meson.build            |   1 -
 tests/tcg/hexagon/Makefile.target     |   6 +
 40 files changed, 3757 insertions(+), 639 deletions(-)
 delete mode 100644 target/hexagon/conv_emu.h
 delete mode 100644 target/hexagon/conv_emu.c
 create mode 100644 tests/tcg/hexagon/brev.c
 create mode 100644 tests/tcg/hexagon/circ.c
 create mode 100644 tests/tcg/hexagon/load_align.c
 create mode 100644 tests/tcg/hexagon/load_unpack.c
 create mode 100644 tests/tcg/hexagon/multi_result.c

