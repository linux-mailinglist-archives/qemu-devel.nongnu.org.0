Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B476F31E36B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 01:14:27 +0100 (CET)
Received: from localhost ([::1]:37410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWxe-0003cb-Pm
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 19:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWYF-0000Sd-Q9
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:48:11 -0500
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:44705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWYB-0006a8-Ms
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:48:11 -0500
Received: by mail-vs1-xe36.google.com with SMTP id 68so35859vsk.11
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=efezNXTk23kq5yUDGGYKgIOgUOkmILYRnXg+BP75n9I=;
 b=hdoJK9F8rr61AvyBGceC9Bq8I6kWXc+CMouPapVH0/ezU+ziAMnbMZx1YdXbj0tHS/
 q3Xkbgg/U7AcOoR/vHSan1JWps4A9HQaunbl/c6CChxiwd3pmnY90laWCVILppnKR8RM
 baZ4kLYhgq7RzUzMGUTx1sMas+SD4pHK/DIuaeIkceiOzZTVi1d31HScPk2J/R6+VLGd
 MkdxmJAXRKl5ZIBItPMAF91QurvnOHH1xG97XQs/h7L0VsPqJpFGC4hC/4VDzmcSSZ92
 3mFgmQx5ECr7o0VbUr6rauyU5Z6FswPKXa5x21IzBelhy31dTPbY/yIBzX7cq40hLX5X
 7ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=efezNXTk23kq5yUDGGYKgIOgUOkmILYRnXg+BP75n9I=;
 b=GPcaE83kjmenhSIdEW947W3JitXP75B+sMhHDre3W3QiIbplcWOo3uqWao822FdAkZ
 MhMm/9QHOYC2RukKwvE0q3ob8GO/fpSO3P7yC5rnLlmh24AHBE/RMS0JLssS/GgrfUiq
 Qq7lYowvmagHl87XX+aNh3za8HlHFvh+Bda8+BEWe1+zBEf56BpVeLQHX9/jtCSWEGIt
 M6aRZ1NfGkbZpeURSPjms2ZpST7WLoxIC+IIZSA9TL6jC7cvTuK1pM4YRwem2j6uBQhj
 Pq9gLbPxOY7h2MmxilEdTbUl+DmXLP57ANv2WEhxetu9Qt1cDl3OpPXnz8HShzokbDh3
 E7Jw==
X-Gm-Message-State: AOAM533imFZQeyyWu3HS3YlunpzbLLB69TGOVdyu6xXtc1ZxxhqrleXJ
 DxxTJ7mpBcQG46j7mZYA4IJLBrBijqKwrg==
X-Google-Smtp-Source: ABdhPJyrCEX7c6xUD9Di868fDNB5MlxE8UP249lqsS8j3BVKiJvUKdVubDwDSEH14zQm0SUpgz0DvQ==
X-Received: by 2002:aa7:8ec4:0:b029:1ec:f672:f0ac with SMTP id
 b4-20020aa78ec40000b02901ecf672f0acmr1427125pfr.37.1613605227158; 
 Wed, 17 Feb 2021 15:40:27 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:40:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/35] hexagon initial commit
Date: Wed, 17 Feb 2021 15:39:48 -0800
Message-Id: <20210217234023.1742406-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe36.google.com
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

The following changes since commit f0f75dc174b6c79eb78a161d1c0921f82d7f1bf0:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-02-17 13:04:48 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-hex-20210217

for you to fetch changes up to 91bdc01a235a0065411e29ad78859587fee85bc6:

  Hexagon build infrastructure (2021-02-17 12:55:21 -0800)

----------------------------------------------------------------
Initial commit for the Qualcomm Hexagon processor.

----------------------------------------------------------------
Richard Henderson (1):
      qemu/int128: Add int128_or

Taylor Simpson (34):
      Hexagon Update MAINTAINERS file
      Hexagon (target/hexagon) README
      Hexagon (include/elf.h) ELF machine definition
      Hexagon (target/hexagon) scalar core definition
      Hexagon (disas) disassembler
      Hexagon (target/hexagon) register names
      Hexagon (target/hexagon) scalar core helpers
      Hexagon (target/hexagon) GDB Stub
      Hexagon (target/hexagon) architecture types
      Hexagon (target/hexagon) instruction and packet types
      Hexagon (target/hexagon) register fields
      Hexagon (target/hexagon) instruction attributes
      Hexagon (target/hexagon) instruction/packet decode
      Hexagon (target/hexagon) instruction printing
      Hexagon (target/hexagon/arch.[ch]) utility functions
      Hexagon (target/hexagon/conv_emu.[ch]) utility functions
      Hexagon (target/hexagon/fma_emu.[ch]) utility functions
      Hexagon (target/hexagon/imported) arch import
      Hexagon (target/hexagon) generator phase 1 - C preprocessor for semantics
      Hexagon (target/hexagon) generator phase 2 - generate header files
      Hexagon (target/hexagon) generator phase 3 - C preprocessor for decode tree
      Hexagon (target/hexagon) generater phase 4 - decode tree
      Hexagon (target/hexagon) opcode data structures
      Hexagon (target/hexagon) macros
      Hexagon (target/hexagon) instruction classes
      Hexagon (target/hexagon) TCG generation
      Hexagon (target/hexagon) TCG for instructions with multiple definitions
      Hexagon (target/hexagon) TCG for floating point instructions
      Hexagon (target/hexagon) translation
      Hexagon (linux-user/hexagon) Linux user emulation
      Hexagon (tests/tcg/hexagon) TCG tests - multiarch
      Hexagon (tests/tcg/hexagon) TCG tests - atomics/load/store/misc
      Hexagon (tests/tcg/hexagon) TCG tests - floating point
      Hexagon build infrastructure

 default-configs/targets/hexagon-linux-user.mak |    1 +
 meson.build                                    |    1 +
 include/disas/dis-asm.h                        |    1 +
 include/elf.h                                  |    1 +
 include/qemu/int128.h                          |   10 +
 linux-user/hexagon/sockbits.h                  |   18 +
 linux-user/hexagon/syscall_nr.h                |  322 ++++
 linux-user/hexagon/target_cpu.h                |   44 +
 linux-user/hexagon/target_elf.h                |   40 +
 linux-user/hexagon/target_fcntl.h              |   18 +
 linux-user/hexagon/target_signal.h             |   34 +
 linux-user/hexagon/target_structs.h            |   54 +
 linux-user/hexagon/target_syscall.h            |   36 +
 linux-user/hexagon/termbits.h                  |   18 +
 linux-user/qemu.h                              |    2 +
 linux-user/syscall_defs.h                      |   33 +
 target/hexagon/arch.h                          |   34 +
 target/hexagon/attribs.h                       |   35 +
 target/hexagon/conv_emu.h                      |   31 +
 target/hexagon/cpu-param.h                     |   29 +
 target/hexagon/cpu.h                           |  159 ++
 target/hexagon/cpu_bits.h                      |   58 +
 target/hexagon/decode.h                        |   32 +
 target/hexagon/fma_emu.h                       |   36 +
 target/hexagon/gen_tcg.h                       |  319 ++++
 target/hexagon/genptr.h                        |   25 +
 target/hexagon/helper.h                        |   88 +
 target/hexagon/hex_arch_types.h                |   38 +
 target/hexagon/hex_regs.h                      |   83 +
 target/hexagon/iclass.h                        |   50 +
 target/hexagon/insn.h                          |   74 +
 target/hexagon/internal.h                      |   37 +
 target/hexagon/macros.h                        |  592 +++++++
 target/hexagon/opcodes.h                       |   58 +
 target/hexagon/printinsn.h                     |   27 +
 target/hexagon/reg_fields.h                    |   36 +
 target/hexagon/translate.h                     |   93 ++
 target/hexagon/attribs_def.h.inc               |   97 ++
 target/hexagon/reg_fields_def.h.inc            |   41 +
 disas/hexagon.c                                |   65 +
 linux-user/elfload.c                           |   16 +
 linux-user/hexagon/cpu_loop.c                  |  100 ++
 linux-user/hexagon/signal.c                    |  276 ++++
 target/hexagon/arch.c                          |  300 ++++
 target/hexagon/conv_emu.c                      |  177 ++
 target/hexagon/cpu.c                           |  318 ++++
 target/hexagon/decode.c                        |  957 +++++++++++
 target/hexagon/fma_emu.c                       |  702 ++++++++
 target/hexagon/gdbstub.c                       |   47 +
 target/hexagon/gen_dectree_import.c            |  188 +++
 target/hexagon/gen_semantics.c                 |   88 +
 target/hexagon/genptr.c                        |  331 ++++
 target/hexagon/iclass.c                        |   73 +
 target/hexagon/op_helper.c                     | 1064 ++++++++++++
 target/hexagon/opcodes.c                       |  142 ++
 target/hexagon/printinsn.c                     |  146 ++
 target/hexagon/reg_fields.c                    |   27 +
 target/hexagon/translate.c                     |  748 +++++++++
 tests/tcg/hexagon/atomics.c                    |  139 ++
 tests/tcg/hexagon/dual_stores.c                |   60 +
 tests/tcg/hexagon/fpstuff.c                    |  370 +++++
 tests/tcg/hexagon/mem_noshuf.c                 |  328 ++++
 tests/tcg/hexagon/misc.c                       |  380 +++++
 tests/tcg/hexagon/preg_alias.c                 |  169 ++
 MAINTAINERS                                    |    9 +
 disas/meson.build                              |    1 +
 scripts/gensyscalls.sh                         |    1 +
 scripts/qemu-binfmt-conf.sh                    |    6 +-
 target/hexagon/README                          |  235 +++
 target/hexagon/dectree.py                      |  351 ++++
 target/hexagon/gen_helper_funcs.py             |  220 +++
 target/hexagon/gen_helper_protos.py            |  150 ++
 target/hexagon/gen_op_attribs.py               |   39 +
 target/hexagon/gen_op_regs.py                  |  110 ++
 target/hexagon/gen_opcodes_def.py              |   36 +
 target/hexagon/gen_printinsn.py                |  173 ++
 target/hexagon/gen_shortcode.py                |   60 +
 target/hexagon/gen_tcg_func_table.py           |   58 +
 target/hexagon/gen_tcg_funcs.py                |  485 ++++++
 target/hexagon/hex_common.py                   |  234 +++
 target/hexagon/imported/allidefs.def           |   30 +
 target/hexagon/imported/alu.idef               | 1258 ++++++++++++++
 target/hexagon/imported/branch.idef            |  326 ++++
 target/hexagon/imported/compare.idef           |  619 +++++++
 target/hexagon/imported/encode.def             |  124 ++
 target/hexagon/imported/encode_pp.def          | 2110 ++++++++++++++++++++++++
 target/hexagon/imported/encode_subinsn.def     |  149 ++
 target/hexagon/imported/float.idef             |  312 ++++
 target/hexagon/imported/iclass.def             |   51 +
 target/hexagon/imported/ldst.idef              |  286 ++++
 target/hexagon/imported/macros.def             | 1531 +++++++++++++++++
 target/hexagon/imported/mpy.idef               | 1208 ++++++++++++++
 target/hexagon/imported/shift.idef             | 1066 ++++++++++++
 target/hexagon/imported/subinsns.idef          |  149 ++
 target/hexagon/imported/system.idef            |   68 +
 target/hexagon/meson.build                     |  193 +++
 target/meson.build                             |    1 +
 tests/tcg/configure.sh                         |    4 +-
 tests/tcg/hexagon/Makefile.target              |   46 +
 tests/tcg/hexagon/first.S                      |   56 +
 tests/tcg/hexagon/float_convs.ref              |  748 +++++++++
 tests/tcg/hexagon/float_madds.ref              |  768 +++++++++
 102 files changed, 23185 insertions(+), 2 deletions(-)
 create mode 100644 default-configs/targets/hexagon-linux-user.mak
 create mode 100644 linux-user/hexagon/sockbits.h
 create mode 100644 linux-user/hexagon/syscall_nr.h
 create mode 100644 linux-user/hexagon/target_cpu.h
 create mode 100644 linux-user/hexagon/target_elf.h
 create mode 100644 linux-user/hexagon/target_fcntl.h
 create mode 100644 linux-user/hexagon/target_signal.h
 create mode 100644 linux-user/hexagon/target_structs.h
 create mode 100644 linux-user/hexagon/target_syscall.h
 create mode 100644 linux-user/hexagon/termbits.h
 create mode 100644 target/hexagon/arch.h
 create mode 100644 target/hexagon/attribs.h
 create mode 100644 target/hexagon/conv_emu.h
 create mode 100644 target/hexagon/cpu-param.h
 create mode 100644 target/hexagon/cpu.h
 create mode 100644 target/hexagon/cpu_bits.h
 create mode 100644 target/hexagon/decode.h
 create mode 100644 target/hexagon/fma_emu.h
 create mode 100644 target/hexagon/gen_tcg.h
 create mode 100644 target/hexagon/genptr.h
 create mode 100644 target/hexagon/helper.h
 create mode 100644 target/hexagon/hex_arch_types.h
 create mode 100644 target/hexagon/hex_regs.h
 create mode 100644 target/hexagon/iclass.h
 create mode 100644 target/hexagon/insn.h
 create mode 100644 target/hexagon/internal.h
 create mode 100644 target/hexagon/macros.h
 create mode 100644 target/hexagon/opcodes.h
 create mode 100644 target/hexagon/printinsn.h
 create mode 100644 target/hexagon/reg_fields.h
 create mode 100644 target/hexagon/translate.h
 create mode 100644 target/hexagon/attribs_def.h.inc
 create mode 100644 target/hexagon/reg_fields_def.h.inc
 create mode 100644 disas/hexagon.c
 create mode 100644 linux-user/hexagon/cpu_loop.c
 create mode 100644 linux-user/hexagon/signal.c
 create mode 100644 target/hexagon/arch.c
 create mode 100644 target/hexagon/conv_emu.c
 create mode 100644 target/hexagon/cpu.c
 create mode 100644 target/hexagon/decode.c
 create mode 100644 target/hexagon/fma_emu.c
 create mode 100644 target/hexagon/gdbstub.c
 create mode 100644 target/hexagon/gen_dectree_import.c
 create mode 100644 target/hexagon/gen_semantics.c
 create mode 100644 target/hexagon/genptr.c
 create mode 100644 target/hexagon/iclass.c
 create mode 100644 target/hexagon/op_helper.c
 create mode 100644 target/hexagon/opcodes.c
 create mode 100644 target/hexagon/printinsn.c
 create mode 100644 target/hexagon/reg_fields.c
 create mode 100644 target/hexagon/translate.c
 create mode 100644 tests/tcg/hexagon/atomics.c
 create mode 100644 tests/tcg/hexagon/dual_stores.c
 create mode 100644 tests/tcg/hexagon/fpstuff.c
 create mode 100644 tests/tcg/hexagon/mem_noshuf.c
 create mode 100644 tests/tcg/hexagon/misc.c
 create mode 100644 tests/tcg/hexagon/preg_alias.c
 create mode 100644 target/hexagon/README
 create mode 100755 target/hexagon/dectree.py
 create mode 100755 target/hexagon/gen_helper_funcs.py
 create mode 100755 target/hexagon/gen_helper_protos.py
 create mode 100755 target/hexagon/gen_op_attribs.py
 create mode 100755 target/hexagon/gen_op_regs.py
 create mode 100755 target/hexagon/gen_opcodes_def.py
 create mode 100755 target/hexagon/gen_printinsn.py
 create mode 100755 target/hexagon/gen_shortcode.py
 create mode 100755 target/hexagon/gen_tcg_func_table.py
 create mode 100755 target/hexagon/gen_tcg_funcs.py
 create mode 100755 target/hexagon/hex_common.py
 create mode 100644 target/hexagon/imported/allidefs.def
 create mode 100644 target/hexagon/imported/alu.idef
 create mode 100644 target/hexagon/imported/branch.idef
 create mode 100644 target/hexagon/imported/compare.idef
 create mode 100644 target/hexagon/imported/encode.def
 create mode 100644 target/hexagon/imported/encode_pp.def
 create mode 100644 target/hexagon/imported/encode_subinsn.def
 create mode 100644 target/hexagon/imported/float.idef
 create mode 100644 target/hexagon/imported/iclass.def
 create mode 100644 target/hexagon/imported/ldst.idef
 create mode 100755 target/hexagon/imported/macros.def
 create mode 100644 target/hexagon/imported/mpy.idef
 create mode 100644 target/hexagon/imported/shift.idef
 create mode 100644 target/hexagon/imported/subinsns.idef
 create mode 100644 target/hexagon/imported/system.idef
 create mode 100644 target/hexagon/meson.build
 create mode 100644 tests/tcg/hexagon/Makefile.target
 create mode 100644 tests/tcg/hexagon/first.S
 create mode 100644 tests/tcg/hexagon/float_convs.ref
 create mode 100644 tests/tcg/hexagon/float_madds.ref

