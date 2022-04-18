Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F46505F7D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 23:53:38 +0200 (CEST)
Received: from localhost ([::1]:34050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngZJR-0005Fh-7S
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 17:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ngZIF-0004Bh-IV; Mon, 18 Apr 2022 17:52:23 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:33141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ngZIC-0001wk-Gy; Mon, 18 Apr 2022 17:52:22 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso15615909fac.0; 
 Mon, 18 Apr 2022 14:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dHRxSccTHYuX6AywfXYgmgUhDOzgIaoWpV3GRDzFcCM=;
 b=j89PNkVifujqEErc/J0v4lcfa7DmXLLDdECXTpWgKd+fzrXbj0pm6XbUCWP9ZXPdcR
 SfnRVLedrf/xQ8WxNYXsw7kaxI0wyOJdagu0ccdQAoPCnOtu8h7iweNeNNnjuyxBKptB
 y3tOJcv5hSQCa9WH5Awl18vXcat+lJB9U41BSaJNaCN6zeVcKnw1rqLpiNLpCgxRQ637
 YahI748ZQ2a1gmNOC1e2XvFLHJ+y4UZvr3/rIPxyVAoxACiWYJrwe21MBUNtv0RAw8YB
 duSRyJB7ooIiQgjk4ZgfKqWU45bMF2VXCQXO2aCvndpzJNIOntHhsFx/y5oKTRmvYbIz
 10sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dHRxSccTHYuX6AywfXYgmgUhDOzgIaoWpV3GRDzFcCM=;
 b=oiJ8C9L8vETokAj6KqIMeAgOEwuXQmyNFzTGBGf4YGsGAjw4UOp79wy38vu2S2MhCR
 ZdnvWepvsoaXYtQ1lVrO6vxjbmxnmVj2CkjQanq0i4fioX039s8TTOIdmmLM1owvyc0i
 2TAHFN+J76mXpgCXJuto2ZU9SnAxPEEKrAz8uBSHiGfJnPz6WzMVvhwSPiJXovFf818c
 RwQA2UX3EtneyOLtXigG0BVufCTMYqzyJ/8aZKl/GzZqcVm9TaAVzIIEeWSANZIGhV0W
 HAbadvPucxNnWEkcbm0TVofVxEFUUshn5thryjDrOttjhw/pDGPIn0hwYMcacvpH/7bu
 AE0Q==
X-Gm-Message-State: AOAM530yEabFKsbPeMeHlYibnI437S316QxltP2B69aThSETg5x2W6sV
 NjYyQmLJ7XsdfV9PwocQTic=
X-Google-Smtp-Source: ABdhPJzjemLT4Fsfyxwos/D3H+k/kmORjflSYfOHd4txURUjhwHnWdJmllHqwmIEBOJuskPlsx+3Dw==
X-Received: by 2002:a05:6870:9688:b0:e5:b9be:4062 with SMTP id
 o8-20020a056870968800b000e5b9be4062mr4412473oaq.270.1650318738213; 
 Mon, 18 Apr 2022 14:52:18 -0700 (PDT)
Received: from [192.168.10.222] ([179.225.252.195])
 by smtp.gmail.com with ESMTPSA id
 fz13-20020a056870ed8d00b000e593f1f26fsm3356905oab.18.2022.04.18.14.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Apr 2022 14:52:17 -0700 (PDT)
Message-ID: <8bc493c1-a93d-7cfa-bf44-ebcfd189c291@gmail.com>
Date: Mon, 18 Apr 2022 18:52:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v3 3/5] tests/tcg/ppc64: Add basic softmmu test support
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-4-leandro.lupori@eldorado.org.br>
 <4b6fff2c-897a-5ae6-c738-216db821b507@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <4b6fff2c-897a-5ae6-c738-216db821b507@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, alex.bennee@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/18/22 17:27, Cédric Le Goater wrote:
> On 4/18/22 21:10, Leandro Lupori wrote:
>> Add support to build and run the multiarch hello test, that simply
>> prints a message and exits, through semihosting operations.
>>
>> The linker script was imported from
>> https://github.com/legoater/pnv-test, that are the Microwatt tests
>> adapted to use a PowerNV console. Boot.S code was inspired on
>> mmu/head.S, also from pnv-test repo.
>>
>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>> ---
>>   MAINTAINERS                             |  2 +
>>   tests/tcg/ppc64/Makefile.softmmu-target | 56 +++++++++++++++++
>>   tests/tcg/ppc64/system/include/asm.h    | 68 ++++++++++++++++++++
>>   tests/tcg/ppc64/system/lib/boot.S       | 84 +++++++++++++++++++++++++
>>   tests/tcg/ppc64/system/lib/powerpc.lds  | 27 ++++++++
>>   5 files changed, 237 insertions(+)
>>   create mode 100644 tests/tcg/ppc64/Makefile.softmmu-target
>>   create mode 100644 tests/tcg/ppc64/system/include/asm.h
>>   create mode 100644 tests/tcg/ppc64/system/lib/boot.S
>>   create mode 100644 tests/tcg/ppc64/system/lib/powerpc.lds
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4ad2451e03..54f917f8ea 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -266,6 +266,7 @@ M: Cédric Le Goater <clg@kaod.org>
>>   M: Daniel Henrique Barboza <danielhb413@gmail.com>
>>   R: David Gibson <david@gibson.dropbear.id.au>
>>   R: Greg Kurz <groug@kaod.org>
>> +R: Leandro Lupori <leandro.lupori@eldorado.org.br>
>>   L: qemu-ppc@nongnu.org
>>   S: Maintained
>>   F: target/ppc/
>> @@ -273,6 +274,7 @@ F: hw/ppc/ppc.c
>>   F: hw/ppc/ppc_booke.c
>>   F: include/hw/ppc/ppc.h
>>   F: disas/ppc.c
>> +F: tests/tcg/ppc64/
> 
> 
> May be separate the ppc64 tests entry, unless you want to become a Reviewer
> of the PPC arch. Which is fine for me but I am not sure this is what you
> want. If you do separate the ppc64 tests, please declare yourself as a
> maintainer because you are clearly among the persons who know the most
> about it.

I second that. Leandro, feel free to add yourself as the maintainer of the softmmu
ppc64 tests.


Daniel

> 
> Thanks,
> 
> C.
> 
> 
>>   RISC-V TCG CPUs
>>   M: Palmer Dabbelt <palmer@dabbelt.com>
>> diff --git a/tests/tcg/ppc64/Makefile.softmmu-target b/tests/tcg/ppc64/Makefile.softmmu-target
>> new file mode 100644
>> index 0000000000..948427b70d
>> --- /dev/null
>> +++ b/tests/tcg/ppc64/Makefile.softmmu-target
>> @@ -0,0 +1,56 @@
>> +#
>> +# PowerPC64 system tests
>> +#
>> +
>> +# For now, disable tests that are failing
>> +DISABLED_TESTS := memory
>> +DISABLED_EXTRA_RUNS := run-gdbstub-memory
>> +
>> +PPC64_SYSTEM_SRC=$(SRC_PATH)/tests/tcg/ppc64/system
>> +VPATH+=$(PPC64_SYSTEM_SRC)
>> +
>> +# These objects provide the basic boot code and helper functions for all tests
>> +CRT_PATH=$(PPC64_SYSTEM_SRC)/lib
>> +CRT_OBJS=boot.o
>> +
>> +LINK_SCRIPT=$(CRT_PATH)/powerpc.lds
>> +# NOTE: --build-id is stored before the first code section in the linked
>> +#       binary, which causes problems for most tests, that expect to
>> +#       begin at address 0.
>> +LDFLAGS=-Wl,-T$(LINK_SCRIPT) -Wl,--build-id=none -static -nostdlib \
>> +    $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
>> +TESTS += $(filter-out $(DISABLED_TESTS),$(MULTIARCH_TESTS))
>> +EXTRA_RUNS += $(filter-out $(DISABLED_EXTRA_RUNS),$(MULTIARCH_RUNS))
>> +
>> +# NOTE: -Os doesn't work well with -Wl,--oformat=binary
>> +#       Some linker generated functions, such as savegpr*/restgpr*,
>> +#       end up being undefined.
>> +CFLAGS = -O -g -Wall -std=c99 -msoft-float -mno-vsx -mno-altivec \
>> +         -fno-stack-protector -ffreestanding \
>> +         -I $(PPC64_SYSTEM_SRC)/include $(MINILIB_INC) \
>> +         -mcpu=power8
>> +
>> +# Uncomment to test in LE
>> +# override EXTRA_CFLAGS += -mlittle-endian -mabi=elfv2
>> +
>> +# Leave the .elf files, to make debugging easier
>> +.PRECIOUS: $(CRT_OBJS) $(addsuffix .elf,$(TESTS))
>> +
>> +# Build CRT objects
>> +%.o: $(CRT_PATH)/%.S
>> +    $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -x assembler-with-cpp -c $< -o $@
>> +
>> +# Build and link the tests
>> +
>> +# The .elf files are just for debugging
>> +%.elf: %.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
>> +    $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>> +
>> +%: %.c %.elf $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
>> +    $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) -Wl,--oformat=binary
>> +
>> +memory: CFLAGS+=-DCHECK_UNALIGNED=1
>> +
>> +# Running
>> +QEMU_BASE_MACHINE=-cpu power9 -M powernv9 -m 1G -vga none -nographic
>> +QEMU_OPTS+=$(QEMU_BASE_MACHINE) -serial chardev:output -bios
>> diff --git a/tests/tcg/ppc64/system/include/asm.h b/tests/tcg/ppc64/system/include/asm.h
>> new file mode 100644
>> index 0000000000..127ed46730
>> --- /dev/null
>> +++ b/tests/tcg/ppc64/system/include/asm.h
>> @@ -0,0 +1,68 @@
>> +#ifndef PPC64_ASM_H
>> +#define PPC64_ASM_H
>> +
>> +#define XCONCAT(a, b)       a ## b
>> +#define CONCAT(a, b)        XCONCAT(a, b)
>> +
>> +/* Load an immediate 64-bit value into a register */
>> +#define LOAD_IMM64(r, e)                        \
>> +    lis     r, (e)@highest;                     \
>> +    ori     r, r, (e)@higher;                   \
>> +    rldicr  r, r, 32, 31;                       \
>> +    oris    r, r, (e)@h;                        \
>> +    ori     r, r, (e)@l;
>> +
>> +/* Switch CPU to little-endian mode, if needed */
>> +#define FIXUP_ENDIAN \
>> +    tdi   0, 0, 0x48;   /* Reverse endian of b . + 8 */             \
>> +    b     $ + 44;       /* Skip trampoline if endian is good */     \
>> +    .long 0xa600607d;   /* mfmsr r11 */                             \
>> +    .long 0x01006b69;   /* xori r11,r11,1 */                        \
>> +    .long 0x00004039;   /* li r10,0 */                              \
>> +    .long 0x6401417d;   /* mtmsrd r10,1 */                          \
>> +    .long 0x05009f42;   /* bcl 20,31,$+4 */                         \
>> +    .long 0xa602487d;   /* mflr r10 */                              \
>> +    .long 0x14004a39;   /* addi r10,r10,20 */                       \
>> +    .long 0xa6035a7d;   /* mtsrr0 r10 */                            \
>> +    .long 0xa6037b7d;   /* mtsrr1 r11 */                            \
>> +    .long 0x2400004c    /* rfid */
>> +
>> +/* Handle differences between ELFv1 and ELFv2 ABIs */
>> +
>> +#define DOT_LABEL(name)     CONCAT(., name)
>> +
>> +#if !defined(_CALL_ELF) || _CALL_ELF == 1
>> +#define FUNCTION(name)                          \
>> +    .section ".opd", "aw";                      \
>> +    .p2align 3;                                 \
>> +    .globl   name;                              \
>> +name:                                           \
>> +    .quad   DOT_LABEL(name), .TOC.@tocbase, 0;  \
>> +    .previous;                                  \
>> +DOT_LABEL(name):
>> +
>> +#define CALL(fn)                                \
>> +    LOAD_IMM64(%r12, fn);                       \
>> +    ld      %r12, 0(%r12);                      \
>> +    mtctr   %r12;                               \
>> +    bctrl
>> +
>> +#define CALL_LOCAL(fn)                          \
>> +    bl      DOT_LABEL(fn)
>> +
>> +#else
>> +#define FUNCTION(name)                          \
>> +    .globl   name;                              \
>> +name:
>> +
>> +#define CALL(fn)                                \
>> +    LOAD_IMM64(%r12, fn);                       \
>> +    mtctr   %r12;                               \
>> +    bctrl
>> +
>> +#define CALL_LOCAL(fn)                          \
>> +    bl      fn
>> +
>> +#endif
>> +
>> +#endif
>> diff --git a/tests/tcg/ppc64/system/lib/boot.S b/tests/tcg/ppc64/system/lib/boot.S
>> new file mode 100644
>> index 0000000000..b3bcd8a7da
>> --- /dev/null
>> +++ b/tests/tcg/ppc64/system/lib/boot.S
>> @@ -0,0 +1,84 @@
>> +/* Copyright 2013-2014 IBM Corp.
>> + *
>> + * Licensed under the Apache License, Version 2.0 (the "License");
>> + * you may not use this file except in compliance with the License.
>> + * You may obtain a copy of the License at
>> + *
>> + *     http://www.apache.org/licenses/LICENSE-2.0
>> + *
>> + * Unless required by applicable law or agreed to in writing, software
>> + * distributed under the License is distributed on an "AS IS" BASIS,
>> + * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
>> + * implied.
>> + * See the License for the specific language governing permissions and
>> + * limitations under the License.
>> + */
>> +
>> +#include "asm.h"
>> +
>> +#define SPR_HID0                        0x3f0
>> +#define SPR_HID0_POWER9_HILE            0x0800000000000000
>> +
>> +#define ADP_STOPPED_APPLICATIONEXIT     0x20026
>> +
>> +    .section ".head","ax"
>> +
>> +    /* QEMU enters in BE at 0x10 by default */
>> +    . = 0x10
>> +.global start
>> +start:
>> +    FIXUP_ENDIAN
>> +
>> +    /* Setup TOC */
>> +    LOAD_IMM64(%r2, .TOC.)
>> +
>> +    /* Configure interrupt endian */
>> +#ifdef __LITTLE_ENDIAN__
>> +    mfspr   %r10, SPR_HID0
>> +    LOAD_IMM64(%r11, SPR_HID0_POWER9_HILE)
>> +    or      %r10, %r10, %r11
>> +    mtspr   SPR_HID0, %r10
>> +#endif
>> +
>> +    /* Clear .bss */
>> +    LOAD_IMM64(%r10, __bss_start)
>> +    LOAD_IMM64(%r11, __bss_end)
>> +    subf    %r11, %r10, %r11
>> +    addi    %r11, %r11, 63
>> +    srdi.   %r11, %r11, 6
>> +    beq     2f
>> +    mtctr   %r11
>> +1:  dcbz    0, %r10
>> +    addi    %r10, %r10, 64
>> +    bdnz    1b
>> +
>> +    /* Setup stack */
>> +2:  LOAD_IMM64(%r1, __stack_top)
>> +    li      %r0, 0
>> +    stdu    %r0, -32(%r1)
>> +
>> +    CALL(main)
>> +
>> +    /* Terminate on exit */
>> +    CALL_LOCAL(sys_exit)
>> +    b       .
>> +
>> +FUNCTION(sys_exit)
>> +    /*
>> +     * As semihosting operations are executed by non-translated QEMU code,
>> +     * we shouldn't need to save LR.
>> +     */
>> +    LOAD_IMM64(%r4, ADP_STOPPED_APPLICATIONEXIT)
>> +    std     %r4, -16(%r1)
>> +    std     %r3, -8(%r1)
>> +    li      %r3, 0x18
>> +    addi    %r4, %r1, -16
>> +    sc      7
>> +    blr
>> +
>> +FUNCTION(__sys_outc)
>> +    addi    %r4, %r1, -1
>> +    stb     %r3, 0(%r4)
>> +    li      %r3, 0x03
>> +    sc      7
>> +    blr
>> diff --git a/tests/tcg/ppc64/system/lib/powerpc.lds b/tests/tcg/ppc64/system/lib/powerpc.lds
>> new file mode 100644
>> index 0000000000..db451e1fb9
>> --- /dev/null
>> +++ b/tests/tcg/ppc64/system/lib/powerpc.lds
>> @@ -0,0 +1,27 @@
>> +SECTIONS
>> +{
>> +    . = 0;
>> +    _start = .;
>> +    .head : {
>> +        KEEP(*(.head))
>> +    }
>> +    . = ALIGN(0x1000);
>> +    .text : { *(.text) *(.text.*) *(.rodata) *(.rodata.*) }
>> +    . = ALIGN(0x1000);
>> +    .data : { *(.data) *(.data.*) *(.got) *(.toc) }
>> +    . = ALIGN(0x80);
>> +    __bss_start = .;
>> +    .bss : {
>> +        *(.dynsbss)
>> +        *(.sbss)
>> +        *(.scommon)
>> +        *(.dynbss)
>> +        *(.bss)
>> +        *(.common)
>> +        *(.bss.*)
>> +    }
>> +    . = ALIGN(0x80);
>> +    __bss_end = .;
>> +    . = . + 0x4000;
>> +    __stack_top = .;
>> +}
> 

