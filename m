Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22900E9266
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 22:52:59 +0100 (CET)
Received: from localhost ([::1]:34166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPZQA-00045F-4D
	for lists+qemu-devel@lfdr.de; Tue, 29 Oct 2019 17:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45295)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iPZH0-0005jY-JS
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 17:43:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iPZGw-0000Xq-27
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 17:43:30 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:41182)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iPZGv-0000W9-4U
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 17:43:25 -0400
Received: by mail-ot1-x335.google.com with SMTP id 94so256259oty.8
 for <qemu-devel@nongnu.org>; Tue, 29 Oct 2019 14:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=YAwuY7fhLVY526KroMSbpcqzWtTqWQXnbHlgfmUDp9w=;
 b=RLHpCcal8rQoS7tCsk08gEotnCrlZ+jqN1p5/A4KpiRWkjRWdv5BWUFeSwIR662a9C
 A2X6vbzhZ0G2Q4BcUKh5K+qngfBknCp7A0bg2ZdiYzlyNCTKF5Fw5WW3IXJLJSWepZN1
 qffLhj5A/wgo1huVPxYQRAJ9zW3a+HH6La0wvD3aj3PGWTNCs7ugzc63Q3iHJLVEgTBn
 eRseBuluGc1H7UOilF6KhGUaljiwa6kPAU0AqU3+sFgvVezCNU5jdG7DO9X9hoL/Kj4x
 I6Zw8ofd26cVQBIFrcNqys3MQQfMPt2mIjL2EEp7YR0v4ujTNMgpJAokG/V1oHO9CiLj
 kczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=YAwuY7fhLVY526KroMSbpcqzWtTqWQXnbHlgfmUDp9w=;
 b=aln5aYmHs7HRRuxm4pboiAszI8d1GiGSpbFeD7JQ4Ymna57V01l/furUaKRRcSl89B
 TQ77a3o1tnjeH22qdXepg/bselygnF5gGS+TGPU79yZznnq5RjtPDy9YylS5jwkLcc+h
 /521TKBuWepEuxJUI/U9oKZb8alMzPC/4U9Taskp85HlwX95jgbboDSIwJN3hRycEsir
 GJRmmEbX3mjeAlmw8Jh45BYa+dQRffQrR5nkxpmt5+Xr5xVFpgAmMerDrMidJMsmRDE1
 OlnqYnzCO3kU375GmNpcTUwzsdhuSnza8gdhXvpyhw6NCNkL8SlS6ta+x63lSxmfXYkz
 CJMA==
X-Gm-Message-State: APjAAAWRIDOeP+uyIheejFV8Fm3lFtRyybQqVj2wIfYg7myL4Vv3sMUH
 Xnyj1fHpJ0ZOkBylLPz8RaU21fytcHkywNgySbs=
X-Google-Smtp-Source: APXvYqxqAbXDeYDj1JTBJVEyUPnQEsr+St+jdcqQM7D6zdtOhN1Lng5FcVnl0vrBmRDWybMXOuS6+IihNGNbX3mZv8s=
X-Received: by 2002:a05:6830:2151:: with SMTP id
 r17mr14835623otd.341.1572385402811; 
 Tue, 29 Oct 2019 14:43:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Tue, 29 Oct 2019 14:43:22
 -0700 (PDT)
In-Reply-To: <20191029212430.20617-1-mrolnik@gmail.com>
References: <20191029212430.20617-1-mrolnik@gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Tue, 29 Oct 2019 22:43:22 +0100
Message-ID: <CAL1e-=jAM1qUv=Kn-f3=HhFww5JKTbABzPxbaBJpD2wqMvCTjQ@mail.gmail.com>
Subject: Re: [PATCH v35 00/13] QEMU AVR 8 bit cores
To: Michael Rolnik <mrolnik@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000062791e059613819d"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::335
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
Cc: "thuth@redhat.com" <thuth@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dovgaluk@ispras.ru" <dovgaluk@ispras.ru>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000062791e059613819d
Content-Type: text/plain; charset="UTF-8"

On Tuesday, October 29, 2019, Michael Rolnik <mrolnik@gmail.com> wrote:

> This series of patches adds 8bit AVR cores to QEMU.


Hi Michael,

I am going to take more detailed look at your series as soon as these
hectic days around softfreeze/hardfreeze days pass. It is definitely a
series that needed a lot of hard work, and it deserves to be seriously
considered.

Yours, Aleksandar



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
> 1. using cpu_get_sreg/cpu_set_sreg in avr_cpu_gdb_read_register/avr_
> cpu_gdb_write_register
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
> changes since v26
> 1.  add avocado acceptence test
> 2.  add boot serial test
>
> changes since v27
> 1.  list atmel2560 devices as unimplemented
> 2.  fix sram base/size
>
> changes since v28
> 1.  rebase
> 2.  fix includes & build
>
> changes since v29
> 1.  fixing ownership
> 2.  using 'since' instread of 'added in'
>
> changes since v30
> 1.  rebase
>
> changes since v31
> 1.  splitting 'Add instruction translation' commit
> 2.  fixing typo in qapi/machine.json sicne -> since
> 3.  removing unintended changes in configure file
> 4.  adding Richard Henderson as a co developer to 'Add instruction
> translation - CPU main translation funcions' commit
>
> changes since v32
> 1.  modify cpu_get_sreg to treat sreg C as other flags, except sreg Z
>
> changes since v33
> 1.  ensure flag C is always calculated as one bit
> 2.  calculate flag Z as one bit, without using inverse logic
>
> changes since v34
> 1.  rebase
>
> Michael Rolnik (12):
>   target/avr: Add outward facing interfaces and core CPU logic
>   target/avr: Add instruction helpers
>   target/avr: Add instruction decoding
>   target/avr: Add instruction translation - Registers definition
>   target/avr: Add instruction translation - Arithmetic and Logic
>     Instructions
>   target/avr: Add instruction translation - Branch Instructions
>   target/avr: Add instruction translation - Bit and Bit-test
>     Instructions
>   target/avr: Add instruction translation - MCU Control Instructions
>   target/avr: Add instruction translation - CPU main translation
>     function
>   target/avr: Add example board configuration
>   target/avr: Register AVR support with the rest of QEMU, the build
>     system, and the WMAINTAINERS file
>   target/avr: Add tests
>
> Sarah Harris (1):
>   target/avr: Add limited support for USART and 16 bit timer peripherals
>
>  MAINTAINERS                      |    9 +
>  arch_init.c                      |    2 +
>  configure                        |    7 +
>  default-configs/avr-softmmu.mak  |    5 +
>  gdb-xml/avr-cpu.xml              |   49 +
>  hw/Kconfig                       |    1 +
>  hw/avr/Kconfig                   |    6 +
>  hw/avr/Makefile.objs             |    1 +
>  hw/avr/sample.c                  |  282 +++
>  hw/char/Kconfig                  |    3 +
>  hw/char/Makefile.objs            |    1 +
>  hw/char/avr_usart.c              |  324 ++++
>  hw/misc/Kconfig                  |    3 +
>  hw/misc/Makefile.objs            |    2 +
>  hw/misc/avr_mask.c               |  112 ++
>  hw/timer/Kconfig                 |    3 +
>  hw/timer/Makefile.objs           |    2 +
>  hw/timer/avr_timer16.c           |  605 ++++++
>  include/disas/dis-asm.h          |    6 +
>  include/hw/char/avr_usart.h      |   97 +
>  include/hw/misc/avr_mask.h       |   47 +
>  include/hw/timer/avr_timer16.h   |   97 +
>  include/sysemu/arch_init.h       |    1 +
>  qapi/machine.json                |    3 +-
>  target/avr/Makefile.objs         |   33 +
>  target/avr/cpu-param.h           |   37 +
>  target/avr/cpu-qom.h             |   54 +
>  target/avr/cpu.c                 |  576 ++++++
>  target/avr/cpu.h                 |  253 +++
>  target/avr/gdbstub.c             |   85 +
>  target/avr/helper.c              |  354 ++++
>  target/avr/helper.h              |   29 +
>  target/avr/insn.decode           |  175 ++
>  target/avr/machine.c             |  121 ++
>  target/avr/translate.c           | 3028 ++++++++++++++++++++++++++++++
>  tests/Makefile.include           |    2 +
>  tests/acceptance/machine_avr6.py |   36 +
>  tests/boot-serial-test.c         |   10 +
>  tests/machine-none-test.c        |    1 +
>  39 files changed, 6461 insertions(+), 1 deletion(-)
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
>  create mode 100644 target/avr/cpu-qom.h
>  create mode 100644 target/avr/cpu.c
>  create mode 100644 target/avr/cpu.h
>  create mode 100644 target/avr/gdbstub.c
>  create mode 100644 target/avr/helper.c
>  create mode 100644 target/avr/helper.h
>  create mode 100644 target/avr/insn.decode
>  create mode 100644 target/avr/machine.c
>  create mode 100644 target/avr/translate.c
>  create mode 100644 tests/acceptance/machine_avr6.py
>
> --
> 2.17.2 (Apple Git-113)
>
>

--00000000000062791e059613819d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 29, 2019, Michael Rolnik &lt;<a href=3D"mailto:=
mrolnik@gmail.com">mrolnik@gmail.com</a>&gt; wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">This series of patches adds 8bit AVR cores to QEMU.</blockquote>=
<div><br></div><div>Hi Michael,</div><div><br></div><div>I am going to take=
 more detailed look at your series as soon as these hectic days around soft=
freeze/hardfreeze days pass. It is definitely a series that needed a lot of=
 hard work, and it deserves to be seriously considered.</div><div><br></div=
><div>Yours, Aleksandar</div><div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
All instruction, except BREAK/DES/SPM/SPMX, are implemented. Not fully test=
ed yet.<br>
However I was able to execute simple code with functions. e.g fibonacci cal=
culation.<br>
This series of patches include a non real, sample board.<br>
No fuses support yet. PC is set to 0 at reset.<br>
<br>
the patches include the following<br>
1. just a basic 8bit AVR CPU, without instruction decoding or translation<b=
r>
2. CPU features which allow define the following 8bit AVR cores<br>
=C2=A0 =C2=A0 =C2=A0avr1<br>
=C2=A0 =C2=A0 =C2=A0avr2 avr25<br>
=C2=A0 =C2=A0 =C2=A0avr3 avr31 avr35<br>
=C2=A0 =C2=A0 =C2=A0avr4<br>
=C2=A0 =C2=A0 =C2=A0avr5 avr51<br>
=C2=A0 =C2=A0 =C2=A0avr6<br>
=C2=A0 =C2=A0 =C2=A0xmega2 xmega4 xmega5 xmega6 xmega7<br>
3. a definition of sample machine with SRAM, FLASH and CPU which allows to =
execute simple code<br>
4. encoding for all AVR instructions<br>
5. interrupt handling<br>
6. helpers for IN, OUT, SLEEP, WBR &amp; unsupported instructions<br>
7. a decoder which given an opcode decides what istruction it is<br>
8. translation of AVR instruction into TCG<br>
9. all features together<br>
<br>
changes since v3<br>
1. rampD/X/Y/Z registers are encoded as 0x00ff0000 (instead of 0x000000ff) =
for faster address manipulaton<br>
2. ffs changed to ctz32<br>
3. duplicate code removed at avr_cpu_do_interrupt<br>
4. using andc instead of not + and<br>
5. fixing V flag calculation in varios instructions<br>
6. freeing local variables in PUSH<br>
7. tcg_const_local_i32 -&gt; tcg_const_i32<br>
8. using sextract32 instead of my implementation<br>
9. fixing BLD instruction<br>
10.xor(r) instead of 0xff - r at COM<br>
11.fixing MULS/MULSU not to modify inputs&#39; content<br>
12.using SUB for NEG<br>
13.fixing tcg_gen_qemu_ld/st call in XCH<br>
<br>
changes since v4<br>
1. target is now defined as big endian in order to optimize push_ret/pop_re=
t<br>
2. all style warnings are fixed<br>
3. adding cpu_set/get_sreg functions<br>
4. simplifying gen_goto_tb as there is no real paging<br>
5. env-&gt;pc -&gt; env-&gt;pc_w<br>
6. making flag dump more compact<br>
7. more spacing<br>
8. renaming CODE/DATA_INDEX -&gt; MMU_CODE/DATA_IDX<br>
9. removing avr_set_feature<br>
10. SPL/SPH set bug fix<br>
11. switching stb_phys to cpu_stb_data<br>
12. cleaning up avr_decode<br>
13. saving sreg, rampD/X/Y/Z, eind in HW format (savevm)<br>
14. saving CPU features (savevm)<br>
<br>
changes since v5<br>
1. BLD bug fix<br>
2. decoder generator is added<br>
<br>
chages since v6<br>
1. using cpu_get_sreg/cpu_set_sreg in avr_cpu_gdb_read_register/avr_<wbr>cp=
u_gdb_write_register<br>
2. configure the target as little endian because otherwise GDB does not wor=
k<br>
3. fixing and testing gen_push_ret/gen_pop_ret<br>
<br>
changes since v7<br>
1. folding back v6<br>
2. logging at helper_outb and helper_inb are done for non supported yet reg=
isters only<br>
3. MAINTAINERS updated<br>
<br>
changes since v8<br>
1. removing hw/avr from hw/Makefile.obj as it should not be built for all<b=
r>
2. making linux compilable<br>
3. testing on<br>
=C2=A0 =C2=A0 a. Mac, Apple LLVM version 7.0.0<br>
=C2=A0 =C2=A0 b. Ubuntu 12.04, gcc 4.9.2<br>
=C2=A0 =C2=A0 c. Fedora 23, gcc 5.3.1<br>
4. folding back some patches<br>
5. translation bug fixes for ORI, CPI, XOR instructions<br>
6. propper handling of cpu register writes though memory<br>
<br>
changes since v9<br>
1. removing forward declarations of static functions<br>
2. disabling debug prints<br>
3. switching to case range instead of if else if ...<br>
4. LD/ST IN/OUT accessing CPU maintainder registers are not routed to any d=
evice<br>
5. commenst about sample board and sample IO device added<br>
6. sample board description is more descriptive now<br>
7. memory_region_allocate_system_<wbr>memory is used to create RAM<br>
8. now there are helper_fullrd &amp; helper_fullwr when LD/ST try to access=
 registers<br>
<br>
changes since v10<br>
1. movig back fullwr &amp; fullrd into the commit where outb and inb were i=
ntroduced<br>
2. changing tlb_fill function signature<br>
3. adding empty line between functions<br>
4. adding newline on the last line of the file<br>
5. using tb-&gt;flags to generae full access ST/LD instructions<br>
6. fixing SBRC bug<br>
7. folding back 10th commit<br>
8. whenever a new file is introduced it&#39;s added to Makefile.objs<br>
<br>
changes since v11<br>
1. updating to v2.7.0-rc<br>
2. removing assignment to env-&gt;fullacc from gen_intermediate_code<br>
<br>
changes since v12<br>
1. fixing spacing<br>
2. fixing get/put_segment functions<br>
3. removing target-avr/machine.h file<br>
4. VMSTATE_SINGLE_TEST -&gt; VMSTATE_SINGLE<br>
5. comment spelling<br>
6. removing hw/avr/sample_io.c<br>
7. char const* -&gt; const char*<br>
8. proper ram allocation<br>
9. fixing breakpoint functionality.<br>
10.env1 -&gt; env<br>
11.fixing avr_cpu_gdb_write_register &amp; avr_cpu_gdb_read_register functi=
ons<br>
12.any cpu is removed<br>
12.feature bits are not saved into vm state<br>
<br>
changes since v13<br>
1. rebasing to v2.7.0-rc1<br>
<br>
changes since v14<br>
1. I made self review with git gui tool. (I did not know such a thing exist=
s)<br>
2. removing all double/tripple spaces<br>
3. removing comment reference to SampleIO<br>
4. folding back some changes, so there is not deleted lines in my code<br>
5. moving avr configuration, within configure file, before chris<br>
<br>
changes since v15<br>
1. removing IO registers cache from CPU<br>
2. implementing CBI/SBI as read(helper_inb), modify, write(helper_outb)<br>
3. implementing CBIC/SBIC as read(helper_inb), check, branch<br>
4. adding missing tcg_temp_free_i32 for tcg_const_i32<br>
<br>
changes since v16<br>
1. removing EXT IO registers knoledge from CPU. These registers are accessi=
ble<br>
=C2=A0 =C2=A0by LD/ST only. CPU has no interest in them<br>
<br>
changes since v17 (by Richard Henderson)<br>
This is Michael&#39;s v17, with some adjustments of my own:<br>
<br>
1. Fix the whitespace errors reported by &quot;git am&quot;,<br>
2. Replace the utf-8 characters with normal ascii,<br>
3. Ditch the separate compilation of translate.c.<br>
<br>
I retained the two separate files that could be regenerated<br>
from the included cpugen program, but merged in translate-insn.c.<br>
Not that it matters, but the code generated is about 3k smaller.<br>
<br>
changes since v18<br>
1.=C2=A0 moving target-avr into target/avr<br>
2.=C2=A0 do not call cpu_exec_initfn function from avr_cpu_initfn<br>
3.=C2=A0 call cpu_exec_realizefn avr_cpu_realizefn<br>
4.=C2=A0 do not fail sample machine creation if no rom is suplied<br>
5.=C2=A0 add tcg_gen_exit_tb(0) for BS_BRANCH in gen_intermediate_code<br>
6.=C2=A0 fix a register getters/setters in machine.c<br>
7.=C2=A0 changing QEMU_ARCH_AVR from 1&lt;&lt;17 to 1&lt;&lt;18<br>
<br>
changes since v19<br>
1.=C2=A0 use decodetree.py tool to decode instructions<br>
2.=C2=A0 adding USART<br>
3.=C2=A0 adding 16 bit timer peripherals<br>
4.=C2=A0 changing QEMU_ARCH_AVR from 1&lt;&lt;18 to 1&lt;&lt;20<br>
5.=C2=A0 renaming tlb_fill to avr_cpu_tlb_fill<br>
<br>
changes since v20<br>
1.=C2=A0 use one CPU naming convention<br>
2.=C2=A0 merging insn16.decode &amp; insn32.decode files<br>
3.=C2=A0 modifying skip next instruction mechanizm<br>
4.=C2=A0 translate BREAK as NOP for now<br>
<br>
changes since v21<br>
1.=C2=A0 Reorganize bstate.<br>
=C2=A0 =C2=A0 This will make transition to &lt;exec/translator.h&gt; easier=
, and fixes a couple of bugs wrt single stepping<br>
=C2=A0 =C2=A0 by <a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a><br>
2.=C2=A0 Drop cpc and fix page cross condition.<br>
=C2=A0 =C2=A0 by <a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a><br>
3.=C2=A0 Refactor checking supported/unsupported instructions<br>
4.=C2=A0 Add gdb-xml/avr-cpu.xml<br>
<br>
changes since v22<br>
1.=C2=A0 Rebase<br>
2.=C2=A0 Split long comment<br>
<br>
changes since v23<br>
1.=C2=A0 remove avr_cpu_list_compare function<br>
2.=C2=A0 modify avr_cpu_class_by_name function<br>
3.=C2=A0 modify avr_cpu_list_entry function<br>
4.=C2=A0 modify avr_cpu_list function<br>
<br>
changes since v24<br>
1.=C2=A0 remove AVR_CPU_TYPE_NAME macro<br>
<br>
changes since v25<br>
1.=C2=A0 fix patches. every file belong to one patch only<br>
2.=C2=A0 change copyright year from 2016 to 2019<br>
3.=C2=A0 create mask device to emulate prr0/prr1<br>
<br>
changes since v26<br>
1.=C2=A0 add avocado acceptence test<br>
2.=C2=A0 add boot serial test<br>
<br>
changes since v27<br>
1.=C2=A0 list atmel2560 devices as unimplemented<br>
2.=C2=A0 fix sram base/size<br>
<br>
changes since v28<br>
1.=C2=A0 rebase<br>
2.=C2=A0 fix includes &amp; build<br>
<br>
changes since v29<br>
1.=C2=A0 fixing ownership<br>
2.=C2=A0 using &#39;since&#39; instread of &#39;added in&#39;<br>
<br>
changes since v30<br>
1.=C2=A0 rebase<br>
<br>
changes since v31<br>
1.=C2=A0 splitting &#39;Add instruction translation&#39; commit<br>
2.=C2=A0 fixing typo in qapi/machine.json sicne -&gt; since<br>
3.=C2=A0 removing unintended changes in configure file<br>
4.=C2=A0 adding Richard Henderson as a co developer to &#39;Add instruction=
 translation - CPU main translation funcions&#39; commit<br>
<br>
changes since v32<br>
1.=C2=A0 modify cpu_get_sreg to treat sreg C as other flags, except sreg Z<=
br>
<br>
changes since v33<br>
1.=C2=A0 ensure flag C is always calculated as one bit<br>
2.=C2=A0 calculate flag Z as one bit, without using inverse logic<br>
<br>
changes since v34<br>
1.=C2=A0 rebase<br>
<br>
Michael Rolnik (12):<br>
=C2=A0 target/avr: Add outward facing interfaces and core CPU logic<br>
=C2=A0 target/avr: Add instruction helpers<br>
=C2=A0 target/avr: Add instruction decoding<br>
=C2=A0 target/avr: Add instruction translation - Registers definition<br>
=C2=A0 target/avr: Add instruction translation - Arithmetic and Logic<br>
=C2=A0 =C2=A0 Instructions<br>
=C2=A0 target/avr: Add instruction translation - Branch Instructions<br>
=C2=A0 target/avr: Add instruction translation - Bit and Bit-test<br>
=C2=A0 =C2=A0 Instructions<br>
=C2=A0 target/avr: Add instruction translation - MCU Control Instructions<b=
r>
=C2=A0 target/avr: Add instruction translation - CPU main translation<br>
=C2=A0 =C2=A0 function<br>
=C2=A0 target/avr: Add example board configuration<br>
=C2=A0 target/avr: Register AVR support with the rest of QEMU, the build<br=
>
=C2=A0 =C2=A0 system, and the WMAINTAINERS file<br>
=C2=A0 target/avr: Add tests<br>
<br>
Sarah Harris (1):<br>
=C2=A0 target/avr: Add limited support for USART and 16 bit timer periphera=
ls<br>
<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 9 +<br>
=C2=A0arch_init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 7 +<br>
=C2=A0default-configs/avr-softmmu.<wbr>mak=C2=A0 |=C2=A0 =C2=A0 5 +<br>
=C2=A0gdb-xml/avr-cpu.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A049 +<br>
=C2=A0hw/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0hw/avr/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A0 6 +<br>
=C2=A0hw/avr/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 1 +<br>
=C2=A0hw/avr/sample.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 282 +++<br>
=C2=A0hw/char/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 3 +<br>
=C2=A0hw/char/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 1 +<br>
=C2=A0hw/char/avr_usart.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 324 ++++<br>
=C2=A0hw/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 3 +<br>
=C2=A0hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 2 +<br>
=C2=A0hw/misc/avr_mask.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 112 ++<br>
=C2=A0hw/timer/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 3 +<br>
=C2=A0hw/timer/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 2 +<br>
=C2=A0hw/timer/avr_timer16.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 605 ++++++<br>
=C2=A0include/disas/dis-asm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 6 +<br>
=C2=A0include/hw/char/avr_usart.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A097 +<br=
>
=C2=A0include/hw/misc/avr_mask.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A047=
 +<br>
=C2=A0include/hw/timer/avr_timer16.h=C2=A0 =C2=A0|=C2=A0 =C2=A097 +<br>
=C2=A0include/sysemu/arch_init.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1=
 +<br>
=C2=A0qapi/machine.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 3 +-<br>
=C2=A0target/avr/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A033 +<br>
=C2=A0target/avr/cpu-param.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A037 +<br>
=C2=A0target/avr/cpu-qom.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A054 +<br>
=C2=A0target/avr/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 576 ++++++<br>
=C2=A0target/avr/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 253 +++<br>
=C2=A0target/avr/gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A085 +<br>
=C2=A0target/avr/helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 354 ++++<br>
=C2=A0target/avr/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A029 +<br>
=C2=A0target/avr/insn.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 175 ++<br>
=C2=A0target/avr/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 121 ++<br>
=C2=A0target/avr/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3028=
 ++++++++++++++++++++++++++++++<br>
=C2=A0tests/Makefile.include=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 2 +<br>
=C2=A0tests/acceptance/machine_avr6.<wbr>py |=C2=A0 =C2=A036 +<br>
=C2=A0tests/boot-serial-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A010 +<br>
=C2=A0tests/machine-none-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1=
 +<br>
=C2=A039 files changed, 6461 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 default-configs/avr-softmmu.<wbr>mak<br>
=C2=A0create mode 100644 gdb-xml/avr-cpu.xml<br>
=C2=A0create mode 100644 hw/avr/Kconfig<br>
=C2=A0create mode 100644 hw/avr/Makefile.objs<br>
=C2=A0create mode 100644 hw/avr/sample.c<br>
=C2=A0create mode 100644 hw/char/avr_usart.c<br>
=C2=A0create mode 100644 hw/misc/avr_mask.c<br>
=C2=A0create mode 100644 hw/timer/avr_timer16.c<br>
=C2=A0create mode 100644 include/hw/char/avr_usart.h<br>
=C2=A0create mode 100644 include/hw/misc/avr_mask.h<br>
=C2=A0create mode 100644 include/hw/timer/avr_timer16.h<br>
=C2=A0create mode 100644 target/avr/Makefile.objs<br>
=C2=A0create mode 100644 target/avr/cpu-param.h<br>
=C2=A0create mode 100644 target/avr/cpu-qom.h<br>
=C2=A0create mode 100644 target/avr/cpu.c<br>
=C2=A0create mode 100644 target/avr/cpu.h<br>
=C2=A0create mode 100644 target/avr/gdbstub.c<br>
=C2=A0create mode 100644 target/avr/helper.c<br>
=C2=A0create mode 100644 target/avr/helper.h<br>
=C2=A0create mode 100644 target/avr/insn.decode<br>
=C2=A0create mode 100644 target/avr/machine.c<br>
=C2=A0create mode 100644 target/avr/translate.c<br>
=C2=A0create mode 100644 tests/acceptance/machine_avr6.<wbr>py<br>
<br>
-- <br>
2.17.2 (Apple Git-113)<br>
<br>
</blockquote>

--00000000000062791e059613819d--

