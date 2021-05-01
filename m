Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBE3370873
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 20:47:52 +0200 (CEST)
Received: from localhost ([::1]:60332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcued-0001Sa-C8
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 14:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaS-00086l-Mx
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:32 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaN-0008SY-Ru
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:32 -0400
Received: by mail-pl1-x62f.google.com with SMTP id h7so682123plt.1
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JUjopnDel6a2JzT+l14u3noXO33cI/riZfKJngfzuTY=;
 b=w8bdQvkp966rteQrTh4pakh0kfBjwks28v8p/HqOUNreWvFv3sZLV0AjX72rNWt46X
 +ynGly7mVe/GUJPyPwQjzRyQuhZfPqiV8DrGosw9x0SZiQ7jifIk8PQXJoL8UkWUVfGr
 NLsdVIi4bdUEGEPQyoob5Rhv7z/PiimrQpL8bYgaIfyFZYdkuwqJHgpOumvb9I5nB8O7
 +s3CQAupv+prWM+X7YAXTHGMFFZgrSiBF1sWGrpZKNZexzVdwnCDVX21qhUe+NLvgXrn
 daG2cSNyphSqs07eh5nLaRsZ1R7wbUaqVd/tEyxQ2ZmtbkvTzUZDugjmimQlLboQj/Sz
 2W3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JUjopnDel6a2JzT+l14u3noXO33cI/riZfKJngfzuTY=;
 b=DFoQeMrEABd5j5W+WBKOBlAFMLLMgY4tH5dBkM3gOEN31WeM2wwfeDUiRGupSHuanQ
 n0yW+Bdf5lK/KMd8txztUMfHjo+x/oGP/SFsL4yMJ53OFnfgosWXnxIYmzX1WNOzWMwC
 lqxJRnLdWsPu0L1a/SEetrsBBsC4Oh+/0zEk7MqqakIXEld8XI6YpCWQlUXax9Z93X3V
 qwLPaT6rnJn+MrmyvVRTJlgMh4cYIh+3466Z4AAKKU5Mie9ZvIphT4ojcz5EA2LFHUp0
 dyWHoPwUKuyHJR7Veu7/3UMC32+ucVZueHri1vWoFxOk+HUA5s5oPCkQJr+AEIwxOmPv
 KKNw==
X-Gm-Message-State: AOAM530yQThZCKLZI6Ik5Ff0qjuKrNMxCsOvpVGQ4P0Rm1tgqwCBXC0m
 bvE62GVE/2tr6Y8xeKrxse2bQY+jzBJXJQ==
X-Google-Smtp-Source: ABdhPJx0dBbfxzpmnVQbBGawzdM0AgUfoNEzeuAU8SNlhMA9vXrNf1uIXToGFR7I3S6a9Eo53KEwbA==
X-Received: by 2002:a17:90a:cc11:: with SMTP id
 b17mr11910672pju.119.1619894605612; 
 Sat, 01 May 2021 11:43:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/31] target/hexagon patch queue
Date: Sat,  1 May 2021 11:42:53 -0700
Message-Id: <20210501184324.1338186-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

  https://gitlab.com/rth7680/qemu.git tags/pull-hex-20210501

for you to fetch changes up to 26f7c044ad234c3dfa7ca2ddf047a71d815e66dc:

  Hexagon (target/hexagon) CABAC decode bin (2021-05-01 08:31:43 -0700)

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
 target/hexagon/genptr.c               | 244 ++++++++++++++---
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
 40 files changed, 3768 insertions(+), 639 deletions(-)
 delete mode 100644 target/hexagon/conv_emu.h
 delete mode 100644 target/hexagon/conv_emu.c
 create mode 100644 tests/tcg/hexagon/brev.c
 create mode 100644 tests/tcg/hexagon/circ.c
 create mode 100644 tests/tcg/hexagon/load_align.c
 create mode 100644 tests/tcg/hexagon/load_unpack.c
 create mode 100644 tests/tcg/hexagon/multi_result.c

