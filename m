Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7099B2FCF
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Sep 2019 14:23:48 +0200 (CEST)
Received: from localhost ([::1]:54284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9TZD-0006Mn-1c
	for lists+qemu-devel@lfdr.de; Sun, 15 Sep 2019 08:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50418)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1i9TWX-0004sg-AN
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 08:21:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1i9TWV-00018m-9q
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 08:21:01 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34663)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1i9TWV-00018F-37
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 08:20:59 -0400
Received: by mail-wr1-x441.google.com with SMTP id a11so26368738wrx.1
 for <qemu-devel@nongnu.org>; Sun, 15 Sep 2019 05:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a0O6cIsYW+GAtaNGkriZHSrrm45EivNi7PPLzaYxVtQ=;
 b=Cn0KAB2mhENKiTelWUwGypNEN7F2d9jYfvbSGnHFEX+vkwtYxNkm2HP83xcyaFMBf6
 NKf/zLmAREdSAMtr4qK/s4lH540N1rey8KB2Hc32plm8/cC3zI025DKkiySL7t+r3fP/
 ez5PE1ZgtzwZs5Y0lprSLjUw9nFXOIQxzp7yqHWZY/sU/eJoQxO76WefuHybXG8qjFFE
 KajvVp4++IOFkxTsh87P+zL1fr838b/ZtGPa/2dSK1BHH23e93cyOWHg3I8TNvkX3vII
 qMP4PTUqr+8rsMFVCHyJQlxPxlTL3Ig6+Cz20tPCNSg3eqJiGaX2TFuqE4gEkPpWTL3j
 zsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a0O6cIsYW+GAtaNGkriZHSrrm45EivNi7PPLzaYxVtQ=;
 b=uCYwhiMjo4gf3HWdJ7cQsVoDVu1u++BPJQ08X74kHPO3kRxLEFmshciFxKdkEAJMVL
 20bv192BBeXBCXpNFoR3pYMQoDe8ESss+JLytX9qVYJwiabDjnbeM5qVqMDWNATXd/OD
 K5+4Iflu21MWUUs+2JxHKtQ7CijS8jr3sWnkKbWeT21fqothpi+27kuZQVvSEONLKtuD
 EZq3on5nCiGxegxwTAkzw+rGFVaXu0quWtRjrV0GQvL0hZZ2nFgdIBkEOYI5M+F1HlGw
 JcAcH8V9HSmYWu/09DT2V6ufLNmzErStXfeHe5CIY5/uWyWHvqrdDWdcYKUZFraGjqth
 /YmA==
X-Gm-Message-State: APjAAAUV8jOcEMk498epL19KgEzeQuw+OhQdqioIT07B6wir0ydqDAUP
 d730V8Drl0HNPz1Fb9/6aRFPpzLn2qb05A==
X-Google-Smtp-Source: APXvYqzkjLsgMi1U9V2NbMaL+od6/Zl+xyFNZkCyqDKblFhIbTQPDkiu56dIX3EWnSVBWHncv2mhAQ==
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr11806551wrs.151.1568550056877; 
 Sun, 15 Sep 2019 05:20:56 -0700 (PDT)
Received: from 8c859074c0ff.ant.amazon.com.com ([213.57.17.146])
 by smtp.gmail.com with ESMTPSA id b194sm15947032wmg.46.2019.09.15.05.20.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 15 Sep 2019 05:20:56 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 15 Sep 2019 15:20:07 +0300
Message-Id: <20190915122015.45852-1-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-devel] [PATCH v31 0/8] QEMU AVR 8 bit cores
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
Cc: thuth@redhat.com, dovgaluk@ispras.ru, richard.henderson@linaro.org,
 Michael Rolnik <mrolnik@gmail.com>, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches adds 8bit AVR cores to QEMU.
All instruction, except BREAK/DES/SPM/SPMX, are implemented. Not fully tested yet.
However I was able to execute simple code with functions. e.g fibonacci calculation.
This series of patches include a non real, sample board.
No fuses support yet. PC is set to 0 at reset.

the patches include the following
1. just a basic 8bit AVR CPU, without instruction decoding or translation
2. CPU features which allow define the following 8bit AVR cores
     avr1
     avr2 avr25
     avr3 avr31 avr35
     avr4
     avr5 avr51
     avr6
     xmega2 xmega4 xmega5 xmega6 xmega7
3. a definition of sample machine with SRAM, FLASH and CPU which allows to execute simple code
4. encoding for all AVR instructions
5. interrupt handling
6. helpers for IN, OUT, SLEEP, WBR & unsupported instructions
7. a decoder which given an opcode decides what istruction it is
8. translation of AVR instruction into TCG
9. all features together

changes since v3
1. rampD/X/Y/Z registers are encoded as 0x00ff0000 (instead of 0x000000ff) for faster address manipulaton
2. ffs changed to ctz32
3. duplicate code removed at avr_cpu_do_interrupt
4. using andc instead of not + and
5. fixing V flag calculation in varios instructions
6. freeing local variables in PUSH
7. tcg_const_local_i32 -> tcg_const_i32
8. using sextract32 instead of my implementation
9. fixing BLD instruction
10.xor(r) instead of 0xff - r at COM
11.fixing MULS/MULSU not to modify inputs' content
12.using SUB for NEG
13.fixing tcg_gen_qemu_ld/st call in XCH

changes since v4
1. target is now defined as big endian in order to optimize push_ret/pop_ret
2. all style warnings are fixed
3. adding cpu_set/get_sreg functions
4. simplifying gen_goto_tb as there is no real paging
5. env->pc -> env->pc_w
6. making flag dump more compact
7. more spacing
8. renaming CODE/DATA_INDEX -> MMU_CODE/DATA_IDX
9. removing avr_set_feature
10. SPL/SPH set bug fix
11. switching stb_phys to cpu_stb_data
12. cleaning up avr_decode
13. saving sreg, rampD/X/Y/Z, eind in HW format (savevm)
14. saving CPU features (savevm)

changes since v5
1. BLD bug fix
2. decoder generator is added

chages since v6
1. using cpu_get_sreg/cpu_set_sreg in avr_cpu_gdb_read_register/avr_cpu_gdb_write_register
2. configure the target as little endian because otherwise GDB does not work
3. fixing and testing gen_push_ret/gen_pop_ret

changes since v7
1. folding back v6
2. logging at helper_outb and helper_inb are done for non supported yet registers only
3. MAINTAINERS updated

changes since v8
1. removing hw/avr from hw/Makefile.obj as it should not be built for all
2. making linux compilable
3. testing on
    a. Mac, Apple LLVM version 7.0.0
    b. Ubuntu 12.04, gcc 4.9.2
    c. Fedora 23, gcc 5.3.1
4. folding back some patches
5. translation bug fixes for ORI, CPI, XOR instructions
6. propper handling of cpu register writes though memory

changes since v9
1. removing forward declarations of static functions
2. disabling debug prints
3. switching to case range instead of if else if ...
4. LD/ST IN/OUT accessing CPU maintainder registers are not routed to any device
5. commenst about sample board and sample IO device added
6. sample board description is more descriptive now
7. memory_region_allocate_system_memory is used to create RAM
8. now there are helper_fullrd & helper_fullwr when LD/ST try to access registers

changes since v10
1. movig back fullwr & fullrd into the commit where outb and inb were introduced
2. changing tlb_fill function signature
3. adding empty line between functions
4. adding newline on the last line of the file
5. using tb->flags to generae full access ST/LD instructions
6. fixing SBRC bug
7. folding back 10th commit
8. whenever a new file is introduced it's added to Makefile.objs

changes since v11
1. updating to v2.7.0-rc
2. removing assignment to env->fullacc from gen_intermediate_code

changes since v12
1. fixing spacing
2. fixing get/put_segment functions
3. removing target-avr/machine.h file
4. VMSTATE_SINGLE_TEST -> VMSTATE_SINGLE
5. comment spelling
6. removing hw/avr/sample_io.c
7. char const* -> const char*
8. proper ram allocation
9. fixing breakpoint functionality.
10.env1 -> env
11.fixing avr_cpu_gdb_write_register & avr_cpu_gdb_read_register functions
12.any cpu is removed
12.feature bits are not saved into vm state

changes since v13
1. rebasing to v2.7.0-rc1

changes since v14
1. I made self review with git gui tool. (I did not know such a thing exists)
2. removing all double/tripple spaces
3. removing comment reference to SampleIO
4. folding back some changes, so there is not deleted lines in my code
5. moving avr configuration, within configure file, before chris

changes since v15
1. removing IO registers cache from CPU
2. implementing CBI/SBI as read(helper_inb), modify, write(helper_outb)
3. implementing CBIC/SBIC as read(helper_inb), check, branch
4. adding missing tcg_temp_free_i32 for tcg_const_i32

changes since v16
1. removing EXT IO registers knoledge from CPU. These registers are accessible
   by LD/ST only. CPU has no interest in them

changes since v17 (by Richard Henderson)
This is Michael's v17, with some adjustments of my own:

1. Fix the whitespace errors reported by "git am",
2. Replace the utf-8 characters with normal ascii,
3. Ditch the separate compilation of translate.c.

I retained the two separate files that could be regenerated
from the included cpugen program, but merged in translate-insn.c.
Not that it matters, but the code generated is about 3k smaller.

changes since v18
1.  moving target-avr into target/avr
2.  do not call cpu_exec_initfn function from avr_cpu_initfn
3.  call cpu_exec_realizefn avr_cpu_realizefn
4.  do not fail sample machine creation if no rom is suplied
5.  add tcg_gen_exit_tb(0) for BS_BRANCH in gen_intermediate_code
6.  fix a register getters/setters in machine.c
7.  changing QEMU_ARCH_AVR from 1<<17 to 1<<18

changes since v19
1.  use decodetree.py tool to decode instructions
2.  adding USART
3.  adding 16 bit timer peripherals
4.  changing QEMU_ARCH_AVR from 1<<18 to 1<<20
5.  renaming tlb_fill to avr_cpu_tlb_fill

changes since v20
1.  use one CPU naming convention
2.  merging insn16.decode & insn32.decode files
3.  modifying skip next instruction mechanizm
4.  translate BREAK as NOP for now

changes since v21
1.  Reorganize bstate.
    This will make transition to <exec/translator.h> easier, and fixes a couple of bugs wrt single stepping
    by richard.henderson@linaro.org
2.  Drop cpc and fix page cross condition.
    by richard.henderson@linaro.org
3.  Refactor checking supported/unsupported instructions
4.  Add gdb-xml/avr-cpu.xml

changes since v22
1.  Rebase
2.  Split long comment

changes since v23
1.  remove avr_cpu_list_compare function
2.  modify avr_cpu_class_by_name function
3.  modify avr_cpu_list_entry function
4.  modify avr_cpu_list function

changes since v24
1.  remove AVR_CPU_TYPE_NAME macro

changes since v25
1.  fix patches. every file belong to one patch only
2.  change copyright year from 2016 to 2019
3.  create mask device to emulate prr0/prr1

changes since v26
1.  add avocado acceptence test
2.  add boot serial test

changes since v27
1.  list atmel2560 devices as unimplemented
2.  fix sram base/size

changes since v28
1.  rebase
2.  fix includes & build

changes since v29
1.  fixing ownership
2.  using 'since' instread of 'added in'

changes since v30
1.  rebase

Michael Rolnik (7):
  target/avr: Add outward facing interfaces and core CPU logic
  target/avr: Add instruction helpers
  target/avr: Add instruction decoding
  target/avr: Add instruction translation
  target/avr: Add example board configuration
  target/avr: Register AVR support with the rest of QEMU, the build
    system, and the MAINTAINERS file
  target/avr: Add tests

Sarah Harris (1):
  target/avr: Add limited support for USART and 16 bit timer peripherals

 MAINTAINERS                      |    6 +
 arch_init.c                      |    2 +
 configure                        |   89 +-
 default-configs/avr-softmmu.mak  |    5 +
 gdb-xml/avr-cpu.xml              |   49 +
 hw/Kconfig                       |    1 +
 hw/avr/Kconfig                   |    6 +
 hw/avr/Makefile.objs             |    1 +
 hw/avr/sample.c                  |  282 +++
 hw/char/Kconfig                  |    3 +
 hw/char/Makefile.objs            |    1 +
 hw/char/avr_usart.c              |  324 ++++
 hw/misc/Kconfig                  |    3 +
 hw/misc/Makefile.objs            |    2 +
 hw/misc/avr_mask.c               |  112 ++
 hw/timer/Kconfig                 |    3 +
 hw/timer/Makefile.objs           |    1 +
 hw/timer/avr_timer16.c           |  605 +++++++
 include/disas/dis-asm.h          |    6 +
 include/hw/char/avr_usart.h      |   97 +
 include/hw/misc/avr_mask.h       |   47 +
 include/hw/timer/avr_timer16.h   |   97 +
 include/sysemu/arch_init.h       |    1 +
 qapi/machine.json                |    3 +-
 target/avr/Makefile.objs         |   33 +
 target/avr/cpu-param.h           |   37 +
 target/avr/cpu-qom.h             |   54 +
 target/avr/cpu.c                 |  576 ++++++
 target/avr/cpu.h                 |  254 +++
 target/avr/gdbstub.c             |   85 +
 target/avr/helper.c              |  354 ++++
 target/avr/helper.h              |   29 +
 target/avr/insn.decode           |  175 ++
 target/avr/machine.c             |  121 ++
 target/avr/translate.c           | 2888 ++++++++++++++++++++++++++++++
 tests/Makefile.include           |    2 +
 tests/acceptance/machine_avr6.py |   36 +
 tests/boot-serial-test.c         |   10 +
 tests/machine-none-test.c        |    1 +
 39 files changed, 6359 insertions(+), 42 deletions(-)
 create mode 100644 default-configs/avr-softmmu.mak
 create mode 100644 gdb-xml/avr-cpu.xml
 create mode 100644 hw/avr/Kconfig
 create mode 100644 hw/avr/Makefile.objs
 create mode 100644 hw/avr/sample.c
 create mode 100644 hw/char/avr_usart.c
 create mode 100644 hw/misc/avr_mask.c
 create mode 100644 hw/timer/avr_timer16.c
 create mode 100644 include/hw/char/avr_usart.h
 create mode 100644 include/hw/misc/avr_mask.h
 create mode 100644 include/hw/timer/avr_timer16.h
 create mode 100644 target/avr/Makefile.objs
 create mode 100644 target/avr/cpu-param.h
 create mode 100644 target/avr/cpu-qom.h
 create mode 100644 target/avr/cpu.c
 create mode 100644 target/avr/cpu.h
 create mode 100644 target/avr/gdbstub.c
 create mode 100644 target/avr/helper.c
 create mode 100644 target/avr/helper.h
 create mode 100644 target/avr/insn.decode
 create mode 100644 target/avr/machine.c
 create mode 100644 target/avr/translate.c
 create mode 100644 tests/acceptance/machine_avr6.py

-- 
2.17.2 (Apple Git-113)


