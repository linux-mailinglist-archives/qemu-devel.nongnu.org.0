Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEAF6BF46
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 17:47:13 +0200 (CEST)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnm9A-0006b1-Fb
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 11:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35532)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mrolnik@gmail.com>) id 1hnm8t-0006An-G6
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 11:46:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1hnm8q-0001RJ-MM
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 11:46:55 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:42514)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1hnm8q-0001Qv-FU
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 11:46:52 -0400
Received: by mail-qt1-x841.google.com with SMTP id h18so23822526qtm.9
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 08:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e0675C+9l6bfzu7GUDBYJTEhbxtlXLA6owjIWheaNcw=;
 b=aiFfvVlSKN9eRyYcw0M7Ov1WD4EnJIbx6ccOGH+z/3mFME2OmFKtSfxkuwpm/xREnT
 cIXel6jO9OtnKbKv6yrVeQkwAaTSa7mhR/pXGIPcHZ4+eoL5yoUpaljMRIog9fmZoW9T
 UlbTE6e4jQZrM7mAxbTV/4VkargaQIdpFlJ7RG366hK9jg97tk1ZO3qXxRUpASYwawrz
 eGZfSVvAZKDVMvYVmBzEQfX1juMrK9eHFV1oE+TFmf8LzfDHJgZwWc7AOMo7WNdT8kzU
 8+odspmKLk3sGkX1yIdqN0311+gUJjDddWY7qvz3aOTQuuF+9o07aM7cKCss7JcFCOjs
 56qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e0675C+9l6bfzu7GUDBYJTEhbxtlXLA6owjIWheaNcw=;
 b=ZXcSGTMoQb5ELuG6sWTZpVmfYc31aiU/2yWXHoXdY3HkTFYN0wAYc9Ffg7wep26WE8
 1P75r/I48qiNUCR1rEkKexb60H/B5eZvaYo/iw8POu5TeQd9jqJ7E9dsnZPAvo54E1sS
 cwovyio8opbOq+dopzUF7N40lhNmSLUOa5A9+zCB9RZqvbF+4VdxxAAKDUTFQbian6e/
 ta6mtoV81ixvOhkikhJLiyzAUE31VYHmfLIeRcFwBakKW3Xea0LItDa9vIjFV/vPUFIL
 1a+s40gurasJB/EWId90CQWAt8e5hnSK+XL25JhKizOSw/YdNxJRG8yKxUh3DStNpVIk
 K8sA==
X-Gm-Message-State: APjAAAW+yktHXjM/inoDCOeae9TxiLn0P4kDWGa427IwZjaggjO1QcwT
 VHnFdnV60asY1sI3UNEVD5r/CSDjrd6P9lpwtGW+0qep
X-Google-Smtp-Source: APXvYqzp1JuHy/kzEVbSJPCuBc19wTRjdO4mFTFADuH4kTMsAp3otT2QoIA5F4HvxxHtZShGNBXG8Qg2BWECGCaAQCY=
X-Received: by 2002:ac8:5315:: with SMTP id t21mr28581794qtn.229.1563378410910; 
 Wed, 17 Jul 2019 08:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190712053704.21228-1-mrolnik@gmail.com>
In-Reply-To: <20190712053704.21228-1-mrolnik@gmail.com>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Wed, 17 Jul 2019 18:46:14 +0300
Message-ID: <CAK4993h_VjHbg-BSbuH469fEZYy9zTz8Uh2o080vySNeopiHQQ@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::841
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v26 0/7] QEMU AVR 8 bit cores
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping.

On Fri, Jul 12, 2019 at 8:37 AM Michael Rolnik <mrolnik@gmail.com> wrote:

> This series of patches adds 8bit AVR cores to QEMU.
> All instruction, except BREAK/DES/SPM/SPMX, are implemented. Not fully
> tested yet.
> However I was able to execute simple code with functions. e.g fibonacci
> calculation.
> This series of patches include a non real, sample board.
> No fuses support yet. PC is set to 0 at reset.
>
> the patches include the following
> 1. just a basic 8bit AVR CPU, without instruction decoding or translation
> 2. CPU features which allow define the following 8bit AVR cores
>      avr1
>      avr2 avr25
>      avr3 avr31 avr35
>      avr4
>      avr5 avr51
>      avr6
>      xmega2 xmega4 xmega5 xmega6 xmega7
> 3. a definition of sample machine with SRAM, FLASH and CPU which allows to
> execute simple code
> 4. encoding for all AVR instructions
> 5. interrupt handling
> 6. helpers for IN, OUT, SLEEP, WBR & unsupported instructions
> 7. a decoder which given an opcode decides what istruction it is
> 8. translation of AVR instruction into TCG
> 9. all features together
>
> changes since v3
> 1. rampD/X/Y/Z registers are encoded as 0x00ff0000 (instead of 0x000000ff)
> for faster address manipulaton
> 2. ffs changed to ctz32
> 3. duplicate code removed at avr_cpu_do_interrupt
> 4. using andc instead of not + and
> 5. fixing V flag calculation in varios instructions
> 6. freeing local variables in PUSH
> 7. tcg_const_local_i32 -> tcg_const_i32
> 8. using sextract32 instead of my implementation
> 9. fixing BLD instruction
> 10.xor(r) instead of 0xff - r at COM
> 11.fixing MULS/MULSU not to modify inputs' content
> 12.using SUB for NEG
> 13.fixing tcg_gen_qemu_ld/st call in XCH
>
> changes since v4
> 1. target is now defined as big endian in order to optimize
> push_ret/pop_ret
> 2. all style warnings are fixed
> 3. adding cpu_set/get_sreg functions
> 4. simplifying gen_goto_tb as there is no real paging
> 5. env->pc -> env->pc_w
> 6. making flag dump more compact
> 7. more spacing
> 8. renaming CODE/DATA_INDEX -> MMU_CODE/DATA_IDX
> 9. removing avr_set_feature
> 10. SPL/SPH set bug fix
> 11. switching stb_phys to cpu_stb_data
> 12. cleaning up avr_decode
> 13. saving sreg, rampD/X/Y/Z, eind in HW format (savevm)
> 14. saving CPU features (savevm)
>
> changes since v5
> 1. BLD bug fix
> 2. decoder generator is added
>
> chages since v6
> 1. using cpu_get_sreg/cpu_set_sreg in
> avr_cpu_gdb_read_register/avr_cpu_gdb_write_register
> 2. configure the target as little endian because otherwise GDB does not
> work
> 3. fixing and testing gen_push_ret/gen_pop_ret
>
> changes since v7
> 1. folding back v6
> 2. logging at helper_outb and helper_inb are done for non supported yet
> registers only
> 3. MAINTAINERS updated
>
> changes since v8
> 1. removing hw/avr from hw/Makefile.obj as it should not be built for all
> 2. making linux compilable
> 3. testing on
>     a. Mac, Apple LLVM version 7.0.0
>     b. Ubuntu 12.04, gcc 4.9.2
>     c. Fedora 23, gcc 5.3.1
> 4. folding back some patches
> 5. translation bug fixes for ORI, CPI, XOR instructions
> 6. propper handling of cpu register writes though memory
>
> changes since v9
> 1. removing forward declarations of static functions
> 2. disabling debug prints
> 3. switching to case range instead of if else if ...
> 4. LD/ST IN/OUT accessing CPU maintainder registers are not routed to any
> device
> 5. commenst about sample board and sample IO device added
> 6. sample board description is more descriptive now
> 7. memory_region_allocate_system_memory is used to create RAM
> 8. now there are helper_fullrd & helper_fullwr when LD/ST try to access
> registers
>
> changes since v10
> 1. movig back fullwr & fullrd into the commit where outb and inb were
> introduced
> 2. changing tlb_fill function signature
> 3. adding empty line between functions
> 4. adding newline on the last line of the file
> 5. using tb->flags to generae full access ST/LD instructions
> 6. fixing SBRC bug
> 7. folding back 10th commit
> 8. whenever a new file is introduced it's added to Makefile.objs
>
> changes since v11
> 1. updating to v2.7.0-rc
> 2. removing assignment to env->fullacc from gen_intermediate_code
>
> changes since v12
> 1. fixing spacing
> 2. fixing get/put_segment functions
> 3. removing target-avr/machine.h file
> 4. VMSTATE_SINGLE_TEST -> VMSTATE_SINGLE
> 5. comment spelling
> 6. removing hw/avr/sample_io.c
> 7. char const* -> const char*
> 8. proper ram allocation
> 9. fixing breakpoint functionality.
> 10.env1 -> env
> 11.fixing avr_cpu_gdb_write_register & avr_cpu_gdb_read_register functions
> 12.any cpu is removed
> 12.feature bits are not saved into vm state
>
> changes since v13
> 1. rebasing to v2.7.0-rc1
>
> changes since v14
> 1. I made self review with git gui tool. (I did not know such a thing
> exists)
> 2. removing all double/tripple spaces
> 3. removing comment reference to SampleIO
> 4. folding back some changes, so there is not deleted lines in my code
> 5. moving avr configuration, within configure file, before chris
>
> changes since v15
> 1. removing IO registers cache from CPU
> 2. implementing CBI/SBI as read(helper_inb), modify, write(helper_outb)
> 3. implementing CBIC/SBIC as read(helper_inb), check, branch
> 4. adding missing tcg_temp_free_i32 for tcg_const_i32
>
> changes since v16
> 1. removing EXT IO registers knoledge from CPU. These registers are
> accessible
>    by LD/ST only. CPU has no interest in them
>
> changes since v17 (by Richard Henderson)
> This is Michael's v17, with some adjustments of my own:
>
> 1. Fix the whitespace errors reported by "git am",
> 2. Replace the utf-8 characters with normal ascii,
> 3. Ditch the separate compilation of translate.c.
>
> I retained the two separate files that could be regenerated
> from the included cpugen program, but merged in translate-insn.c.
> Not that it matters, but the code generated is about 3k smaller.
>
> changes since v18
> 1.  moving target-avr into target/avr
> 2.  do not call cpu_exec_initfn function from avr_cpu_initfn
> 3.  call cpu_exec_realizefn avr_cpu_realizefn
> 4.  do not fail sample machine creation if no rom is suplied
> 5.  add tcg_gen_exit_tb(0) for BS_BRANCH in gen_intermediate_code
> 6.  fix a register getters/setters in machine.c
> 7.  changing QEMU_ARCH_AVR from 1<<17 to 1<<18
>
> changes since v19
> 1.  use decodetree.py tool to decode instructions
> 2.  adding USART
> 3.  adding 16 bit timer peripherals
> 4.  changing QEMU_ARCH_AVR from 1<<18 to 1<<20
> 5.  renaming tlb_fill to avr_cpu_tlb_fill
>
> changes since v20
> 1.  use one CPU naming convention
> 2.  merging insn16.decode & insn32.decode files
> 3.  modifying skip next instruction mechanizm
> 4.  translate BREAK as NOP for now
>
> changes since v21
> 1.  Reorganize bstate.
>     This will make transition to <exec/translator.h> easier, and fixes a
> couple of bugs wrt single stepping
>     by richard.henderson@linaro.org
> 2.  Drop cpc and fix page cross condition.
>     by richard.henderson@linaro.org
> 3.  Refactor checking supported/unsupported instructions
> 4.  Add gdb-xml/avr-cpu.xml
>
> changes since v22
> 1.  Rebase
> 2.  Split long comment
>
> changes since v23
> 1.  remove avr_cpu_list_compare function
> 2.  modify avr_cpu_class_by_name function
> 3.  modify avr_cpu_list_entry function
> 4.  modify avr_cpu_list function
>
> changes since v24
> 1.  remove AVR_CPU_TYPE_NAME macro
>
> changes since v25
> 1.  fix patches. every file belong to one patch only
> 2.  change copyright year from 2016 to 2019
> 3.  create mask device to emulate prr0/prr1
>
> Michael Rolnik (3):
>   target/avr: Add instruction decoding
>   target/avr: Add instruction translation
>   target/avr: Register AVR support with the rest of QEMU, the build
>     system, and the MAINTAINERS file
>
> Sarah Harris (4):
>   target/avr: Add outward facing interfaces and core CPU logic
>   target/avr: Add instruction helpers
>   target/avr: Add limited support for USART and 16 bit timer peripherals
>   target/avr: Add example board configuration
>
>  MAINTAINERS                     |    6 +
>  arch_init.c                     |    2 +
>  configure                       |    7 +
>  default-configs/avr-softmmu.mak |    5 +
>  gdb-xml/avr-cpu.xml             |   49 +
>  hw/Kconfig                      |    1 +
>  hw/avr/Kconfig                  |    5 +
>  hw/avr/Makefile.objs            |    1 +
>  hw/avr/sample.c                 |  237 +++
>  hw/char/Kconfig                 |    3 +
>  hw/char/Makefile.objs           |    1 +
>  hw/char/avr_usart.c             |  322 ++++
>  hw/misc/Kconfig                 |    3 +
>  hw/misc/Makefile.objs           |    2 +
>  hw/misc/avr_mask.c              |  110 ++
>  hw/timer/Kconfig                |    3 +
>  hw/timer/Makefile.objs          |    1 +
>  hw/timer/avr_timer16.c          |  603 +++++++
>  include/disas/dis-asm.h         |    6 +
>  include/hw/char/avr_usart.h     |   97 ++
>  include/hw/misc/avr_mask.h      |   47 +
>  include/hw/timer/avr_timer16.h  |   97 ++
>  include/sysemu/arch_init.h      |    1 +
>  qapi/common.json                |    3 +-
>  target/avr/Makefile.objs        |   33 +
>  target/avr/cpu-param.h          |   37 +
>  target/avr/cpu.c                |  579 +++++++
>  target/avr/cpu.h                |  280 +++
>  target/avr/gdbstub.c            |   85 +
>  target/avr/helper.c             |  354 ++++
>  target/avr/helper.h             |   29 +
>  target/avr/insn.decode          |  175 ++
>  target/avr/machine.c            |  123 ++
>  target/avr/translate.c          | 2888 +++++++++++++++++++++++++++++++
>  tests/machine-none-test.c       |    1 +
>  35 files changed, 6195 insertions(+), 1 deletion(-)
>  create mode 100644 default-configs/avr-softmmu.mak
>  create mode 100644 gdb-xml/avr-cpu.xml
>  create mode 100644 hw/avr/Kconfig
>  create mode 100644 hw/avr/Makefile.objs
>  create mode 100644 hw/avr/sample.c
>  create mode 100644 hw/char/avr_usart.c
>  create mode 100644 hw/misc/avr_mask.c
>  create mode 100644 hw/timer/avr_timer16.c
>  create mode 100644 include/hw/char/avr_usart.h
>  create mode 100644 include/hw/misc/avr_mask.h
>  create mode 100644 include/hw/timer/avr_timer16.h
>  create mode 100644 target/avr/Makefile.objs
>  create mode 100644 target/avr/cpu-param.h
>  create mode 100644 target/avr/cpu.c
>  create mode 100644 target/avr/cpu.h
>  create mode 100644 target/avr/gdbstub.c
>  create mode 100644 target/avr/helper.c
>  create mode 100644 target/avr/helper.h
>  create mode 100644 target/avr/insn.decode
>  create mode 100644 target/avr/machine.c
>  create mode 100644 target/avr/translate.c
>
> --
> 2.17.2 (Apple Git-113)
>
>

-- 
Best Regards,
Michael Rolnik
