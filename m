Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562D911813B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 08:19:25 +0100 (CET)
Received: from localhost ([::1]:51382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieZno-0007SU-F7
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 02:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1ieZmw-00073u-NH
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 02:18:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1ieZmt-0007LM-Il
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 02:18:30 -0500
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:42087)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1ieZmt-0007KT-Ac
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 02:18:27 -0500
Received: by mail-qk1-x743.google.com with SMTP id z14so5265079qkg.9
 for <qemu-devel@nongnu.org>; Mon, 09 Dec 2019 23:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hgf+YmFajUskrfpvzCSdYsxFl7kEA1Dmn0tfBWp8y4E=;
 b=fD1I+Vs1aiuidPp+bTJWB3Jqu/x7/in+rMaatJJvaZTrCNBNzKHA+ZsXk8ykpJ3+Mp
 GKAYMcJT4nrKsHr4ej5fSbdnDaUKtRvKFiu7gn2TJglilwjyeXDHQ0j50rMRa0kqMGCI
 cwDrPJd/ygThpfk/bOWjcoPy/Vf5YpM2Y3NsP5r0s/Xx4J6PEUwmcFRBhEhBIfdRrJM8
 BwFjzWY1uh+xkNF4y1kUubGDCut12HzVJKLwufw40aHFr47FjaaSpZyiC4p12HQgsKbq
 z1CahuY4EkUnwaMAYOqk/yn4E4i8q7TS7K9BrYmNOdT9arKqS11L4nLcn9mEXrOjMb8U
 sdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hgf+YmFajUskrfpvzCSdYsxFl7kEA1Dmn0tfBWp8y4E=;
 b=oSLdskT9FQ4oV5Yyd52DnRY7RSpih5NTqVKqNGVpTfTY0RHt8xSv2PsyN5zYvdRAwX
 5+/tRfzMNhaS3kAHBdryAzUNiLazEraqRqhINdkbm4LKzR/3oWvZN4l90hal5U0BhzlF
 1+pTBF02+an+9hBmOlKnuPQDWvLMsIuiQ8VwxBJUoaBiA1l6hIn5JGRt/mbBOBrBDHC6
 XUeXP7zTzW/jp1MBp/lCfEqCfFnXauP859Fzg2wixIcML/VCEHGr+HLCMSDhI05gbcaV
 9KwL+08QyMWjGWcFuc2jc4bibagNIk4qg0XhcWnEuid+wueU3+NImQFgCFn+HS4NxjrB
 s2Kg==
X-Gm-Message-State: APjAAAX2BR/XZnSyQWqe2G8ebgqlVCohp1pPnvJ4odIFbjoIaL2ULLA9
 752wOK8SIBqulwAkkcwJdZw9PQtqdrLE0hnHoQg=
X-Google-Smtp-Source: APXvYqwkQ4y5gtJSV0Z0Fduahj/WuVnetqTZ899ba8TNbmSz0vU9l6v1B1tXrOp532f+YkSulwgkJ7uq25No/Ldtdkc=
X-Received: by 2002:ae9:ea08:: with SMTP id f8mr472249qkg.489.1575962306125;
 Mon, 09 Dec 2019 23:18:26 -0800 (PST)
MIME-Version: 1.0
References: <20191208183922.13757-1-mrolnik@gmail.com>
 <20191208183922.13757-12-mrolnik@gmail.com>
 <CAL1e-=iPsFgtEmvT2xt-Fm8AiQBxq48_veVDcnnyMEqghF16hw@mail.gmail.com>
 <CAK4993ipego3-ELy82A85Rcd=PDiqCF0M5-COpHPUTL6UjVQZQ@mail.gmail.com>
 <CAL1e-=gkGa0GCjSMm1QK+KrsnSts_1ZgvcjjP6acCVt7xP3ZpQ@mail.gmail.com>
In-Reply-To: <CAL1e-=gkGa0GCjSMm1QK+KrsnSts_1ZgvcjjP6acCVt7xP3ZpQ@mail.gmail.com>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Tue, 10 Dec 2019 09:18:13 +0200
Message-ID: <CAK4993jAANG-P_FeWhzu0ncZdiDEn=moWQ=qPKjNS_7SxzPFUQ@mail.gmail.com>
Subject: Re: [PATCH v38 11/22] target/avr: Add instruction disassembly function
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006fa4260599545131"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
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
 "me@xcancerberox.com.ar" <me@xcancerberox.com.ar>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "dovgaluk@ispras.ru" <dovgaluk@ispras.ru>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006fa4260599545131
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You are right. See at the bottom of the file. There is a comment about it

Sent from my cell phone, please ignore typos

On Tue, Dec 10, 2019, 6:21 AM Aleksandar Markovic <
aleksandar.m.mail@gmail.com> wrote:

>
>
> On Monday, December 9, 2019, Michael Rolnik <mrolnik@gmail.com> wrote:
>
>> Hi Aleksandar.
>>
>> 1. all instructions are 16 bit long except CALL & JMP they are 32 bit lo=
ng
>>
>
> Accordingto the doc, LDS and STS also have 32-bit coding.
>
>
>
>> 2. next_word_used is set to true by next_word when called by append_16
>> when CALL & JMP are parsed
>>
>> Regards,
>> Michael Rolnik
>>
>> On Mon, Dec 9, 2019 at 8:10 PM Aleksandar Markovic <
>> aleksandar.m.mail@gmail.com> wrote:
>>
>>>
>>>
>>> On Sunday, December 8, 2019, Michael Rolnik <mrolnik@gmail.com> wrote:
>>>
>>>> Provide function disassembles executed instruction when `-d in_asm` is
>>>> provided
>>>>
>>>> Example:
>>>> `./avr-softmmu/qemu-system-avr -bios
>>>> free-rtos/Demo/AVR_ATMega2560_GCC/demo.elf -d in_asm` will produce
>>>> something like the following
>>>>
>>>> ```
>>>>     ...
>>>>     IN:
>>>>     0x0000014a:  CALL      0x3808
>>>>
>>>>     IN: main
>>>>     0x00003808:  CALL      0x4b4
>>>>
>>>>     IN: vParTestInitialise
>>>>     0x000004b4:  LDI       r24, 255
>>>>     0x000004b6:  STS       r24, 0
>>>>     0x000004b8:  MULS      r16, r20
>>>>     0x000004ba:  OUT       $1, r24
>>>>     0x000004bc:  LDS       r24, 0
>>>>     0x000004be:  MULS      r16, r20
>>>>     0x000004c0:  OUT       $2, r24
>>>>     0x000004c2:  RET
>>>>     ...
>>>> ```
>>>>
>>>> Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
>>>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>>>> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>> Suggested-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
>>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>> ---
>>>>  target/avr/cpu.h       |   1 +
>>>>  target/avr/cpu.c       |   2 +-
>>>>  target/avr/disas.c     | 226 ++++++++++++++++++++++++++++++++++++++++=
+
>>>>  target/avr/translate.c |  11 ++
>>>>  4 files changed, 239 insertions(+), 1 deletion(-)
>>>>  create mode 100644 target/avr/disas.c
>>>>
>>>> diff --git a/target/avr/cpu.h b/target/avr/cpu.h
>>>> index c217eefeb4..a8a3e7ade6 100644
>>>> --- a/target/avr/cpu.h
>>>> +++ b/target/avr/cpu.h
>>>> @@ -178,6 +178,7 @@ bool avr_cpu_exec_interrupt(CPUState *cpu, int
>>>> int_req);
>>>>  hwaddr avr_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>>>>  int avr_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>>>>  int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>>>> +int avr_print_insn(bfd_vma addr, disassemble_info *info);
>>>>
>>>>  static inline int avr_feature(CPUAVRState *env, int feature)
>>>>  {
>>>> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
>>>> index c5cafcae3c..be4b921e4d 100644
>>>> --- a/target/avr/cpu.c
>>>> +++ b/target/avr/cpu.c
>>>> @@ -83,7 +83,7 @@ static void avr_cpu_reset(CPUState *cs)
>>>>  static void avr_cpu_disas_set_info(CPUState *cpu, disassemble_info
>>>> *info)
>>>>  {
>>>>      info->mach =3D bfd_arch_avr;
>>>> -    info->print_insn =3D NULL;
>>>> +    info->print_insn =3D avr_print_insn;
>>>>  }
>>>>
>>>>  static void avr_cpu_realizefn(DeviceState *dev, Error **errp)
>>>> diff --git a/target/avr/disas.c b/target/avr/disas.c
>>>> new file mode 100644
>>>> index 0000000000..22863d2eb1
>>>> --- /dev/null
>>>> +++ b/target/avr/disas.c
>>>> @@ -0,0 +1,226 @@
>>>> +/*
>>>> + * AVR disassembler
>>>> + *
>>>> + * Copyright (c) 2019 Richard Henderson <rth@twiddle.net>
>>>> + * Copyright (c) 2019 Michael Rolnik <mrolnik@gmail.com>
>>>> + *
>>>> + * This program is free software: you can redistribute it and/or modi=
fy
>>>> + * it under the terms of the GNU General Public License as published =
by
>>>> + * the Free Software Foundation, either version 2 of the License, or
>>>> + * (at your option) any later version.
>>>> + *
>>>> + * This program is distributed in the hope that it will be useful,
>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>> + * GNU General Public License for more details.
>>>> + *
>>>> + * You should have received a copy of the GNU General Public License
>>>> + * along with this program.  If not, see <http://www.gnu.org/licenses=
/
>>>> >.
>>>> + */
>>>> +
>>>> +#include "qemu/osdep.h"
>>>> +#include "cpu.h"
>>>> +
>>>> +typedef struct {
>>>> +    disassemble_info *info;
>>>> +    uint16_t next_word;
>>>> +    bool next_word_used;
>>>> +} DisasContext;
>>>> +
>>>> +static int to_regs_16_31_by_one(DisasContext *ctx, int indx)
>>>> +{
>>>> +    return 16 + (indx % 16);
>>>> +}
>>>> +
>>>> +static int to_regs_16_23_by_one(DisasContext *ctx, int indx)
>>>> +{
>>>> +    return 16 + (indx % 8);
>>>> +}
>>>> +static int to_regs_24_30_by_two(DisasContext *ctx, int indx)
>>>> +{
>>>> +    return 24 + (indx % 4) * 2;
>>>> +}
>>>> +static int to_regs_00_30_by_two(DisasContext *ctx, int indx)
>>>> +{
>>>> +    return (indx % 16) * 2;
>>>> +}
>>>> +
>>>> +static uint16_t next_word(DisasContext *ctx)
>>>> +{
>>>> +    ctx->next_word_used =3D true;
>>>> +    return ctx->next_word;
>>>> +}
>>>> +
>>>> +static int append_16(DisasContext *ctx, int x)
>>>> +{
>>>> +    return x << 16 | next_word(ctx);
>>>> +}
>>>> +
>>>> +
>>>> +/* Include the auto-generated decoder.  */
>>>> +static bool decode_insn(DisasContext *ctx, uint16_t insn);
>>>> +#include "decode_insn.inc.c"
>>>> +
>>>> +#define output(mnemonic, format, ...) \
>>>> +    (pctx->info->fprintf_func(pctx->info->stream, "%-9s " format, \
>>>> +                        mnemonic, ##__VA_ARGS__))
>>>> +
>>>> +int avr_print_insn(bfd_vma addr, disassemble_info *info)
>>>> +{
>>>> +    DisasContext ctx;
>>>> +    DisasContext *pctx =3D &ctx;
>>>> +    bfd_byte buffer[4];
>>>> +    uint16_t insn;
>>>> +    int status;
>>>> +
>>>> +    ctx.info =3D info;
>>>> +
>>>> +    status =3D info->read_memory_func(addr, buffer, 4, info);
>>>> +    if (status !=3D 0) {
>>>> +        info->memory_error_func(status, addr, info);
>>>> +        return -1;
>>>> +    }
>>>> +    insn =3D bfd_getl16(buffer);
>>>> +    ctx.next_word =3D bfd_getl16(buffer + 2);
>>>> +    ctx.next_word_used =3D false;
>>>> +
>>>> +    if (!decode_insn(&ctx, insn)) {
>>>> +        output(".db", "0x%02x, 0x%02x", buffer[0], buffer[1]);
>>>> +    }
>>>> +
>>>> +    return ctx.next_word_used ? 4 : 2;
>>>> +}
>>>
>>>
>>> Hi, Michael,
>>>
>>> What is the role of ctx.next_word_used, if it looks it is always "false=
"?
>>>
>>> Related to this, how do you disassemble 32-bit-coded instructions? From
>>> this patch, it looks you treat all AVR instructions as 16-bit-coded?
>>>
>>> Thanks,
>>> Aleksandar
>>>
>>>
>>>> +
>>>> +
>>>> +#define INSN(opcode, format, ...)
>>>>  \
>>>> +static bool trans_##opcode(DisasContext *pctx, arg_##opcode * a)
>>>>   \
>>>> +{
>>>>  \
>>>> +    output(#opcode, format, ##__VA_ARGS__);
>>>>  \
>>>> +    return true;
>>>>   \
>>>> +}
>>>> +
>>>> +#define INSN_MNEMONIC(opcode, mnemonic, format, ...)
>>>>   \
>>>> +static bool trans_##opcode(DisasContext *pctx, arg_##opcode * a)
>>>>   \
>>>> +{
>>>>  \
>>>> +    output(mnemonic, format, ##__VA_ARGS__);
>>>>   \
>>>> +    return true;
>>>>   \
>>>> +}
>>>> +
>>>> +/*
>>>> + *   C       Z       N       V       S       H       T       I
>>>> + *   0       1       2       3       4       5       6       7
>>>> + */
>>>> +static const char *brbc[] =3D {
>>>> +    "BRCC", "BRNE", "BRPL", "BRVC", "BRGE", "BRHC", "BRTC", "BRID"
>>>> +};
>>>> +
>>>> +static const char *brbs[] =3D {
>>>> +    "BRCS", "BREQ", "BRMI", "BRVS", "BRLT", "BRHS", "BRTS", "BRIE"
>>>> +};
>>>> +
>>>> +static const char *bset[] =3D {
>>>> +    "SEC",  "SEZ",  "SEN",  "SEZ",  "SES",  "SEH",  "SET",  "SEI"
>>>> +};
>>>> +
>>>> +static const char *bclr[] =3D {
>>>> +    "CLC",  "CLZ",  "CLN",  "CLZ",  "CLS",  "CLH",  "CLT",  "CLI"
>>>> +};
>>>> +
>>>> +INSN(ADC,    "r%d, r%d", a->rd, a->rr)
>>>> +INSN(ADD,    "r%d, r%d", a->rd, a->rr)
>>>> +INSN(ADIW,   "r%d:r%d, %d", a->rd + 1, a->rd, a->imm)
>>>> +INSN(AND,    "r%d, r%d", a->rd, a->rr)
>>>> +INSN(ANDI,   "r%d, %d", a->rd, a->imm)
>>>> +INSN(ASR,    "r%d", a->rd)
>>>> +INSN_MNEMONIC(BCLR,  bclr[a->bit], "")
>>>> +INSN(BLD,    "r%d, %d", a->rd, a->bit)
>>>> +INSN_MNEMONIC(BRBC,  brbc[a->bit], ".%+d", a->imm * 2)
>>>> +INSN_MNEMONIC(BRBS,  brbs[a->bit], ".%+d", a->imm * 2)
>>>> +INSN(BREAK,  "")
>>>> +INSN_MNEMONIC(BSET,  bset[a->bit], "")
>>>> +INSN(BST,    "r%d, %d", a->rd, a->bit)
>>>> +INSN(CALL,   "0x%x", a->imm * 2)
>>>> +INSN(CBI,    "%d, %d", a->reg, a->bit)
>>>> +INSN(COM,    "r%d", a->rd)
>>>> +INSN(CP,     "r%d, r%d", a->rd, a->rr)
>>>> +INSN(CPC,    "r%d, r%d", a->rd, a->rr)
>>>> +INSN(CPI,    "r%d, %d", a->rd, a->imm)
>>>> +INSN(CPSE,   "r%d, r%d", a->rd, a->rr)
>>>> +INSN(DEC,    "r%d", a->rd)
>>>> +INSN(DES,    "%d", a->imm)
>>>> +INSN(EICALL, "")
>>>> +INSN(EIJMP,  "")
>>>> +INSN(ELPM1,  "")
>>>> +INSN(ELPM2,  "r%d, Z", a->rd)
>>>> +INSN(ELPMX,  "r%d, Z+", a->rd)
>>>> +INSN(EOR,    "r%d, r%d", a->rd, a->rr)
>>>> +INSN(FMUL,   "r%d, r%d", a->rd, a->rr)
>>>> +INSN(FMULS,  "r%d, r%d", a->rd, a->rr)
>>>> +INSN(FMULSU, "r%d, r%d", a->rd, a->rr)
>>>> +INSN(ICALL,  "")
>>>> +INSN(IJMP,   "")
>>>> +INSN(IN,     "r%d, $%d", a->rd, a->imm)
>>>> +INSN(INC,    "r%d", a->rd)
>>>> +INSN(JMP,    "0x%x", a->imm * 2)
>>>> +INSN(LAC,    "Z, r%d", a->rd)
>>>> +INSN(LAS,    "Z, r%d", a->rd)
>>>> +INSN(LAT,    "Z, r%d", a->rd)
>>>> +INSN(LDDY,   "r%d, Y+%d", a->rd, a->imm)
>>>> +INSN(LDDZ,   "r%d, Z+%d", a->rd, a->imm)
>>>> +INSN(LDI,    "r%d, %d", a->rd, a->imm)
>>>> +INSN(LDS,    "r%d, %d", a->rd, a->imm)
>>>> +INSN(LDX1,   "r%d, X", a->rd)
>>>> +INSN(LDX2,   "r%d, X+", a->rd)
>>>> +INSN(LDX3,   "r%d, -X", a->rd)
>>>> +INSN(LDY2,   "r%d, Y+", a->rd)
>>>> +INSN(LDY3,   "r%d, -Y", a->rd)
>>>> +INSN(LDZ2,   "r%d, Z+", a->rd)
>>>> +INSN(LDZ3,   "r%d, -Z", a->rd)
>>>> +INSN(LPM1,   "")
>>>> +INSN(LPM2,   "r%d, Z", a->rd)
>>>> +INSN(LPMX,   "r%d, Z+", a->rd)
>>>> +INSN(LSR,    "r%d", a->rd)
>>>> +INSN(MOV,    "r%d, r%d", a->rd, a->rr)
>>>> +INSN(MOVW,   "r%d:r%d, r%d,r:r%d", a->rd + 1, a->rd, a->rr + 1, a->rr=
)
>>>> +INSN(MUL,    "r%d, r%d", a->rd, a->rr)
>>>> +INSN(MULS,   "r%d, r%d", a->rd, a->rr)
>>>> +INSN(MULSU,  "r%d, r%d", a->rd, a->rr)
>>>> +INSN(NEG,    "r%d", a->rd)
>>>> +INSN(NOP,    "")
>>>> +INSN(OR,     "r%d, r%d", a->rd, a->rr)
>>>> +INSN(ORI,    "r%d, %d", a->rd, a->imm)
>>>> +INSN(OUT,    "$%d, r%d", a->imm, a->rd)
>>>> +INSN(POP,    "r%d", a->rd)
>>>> +INSN(PUSH,   "r%d", a->rd)
>>>> +INSN(RCALL,  ".%+d", a->imm * 2)
>>>> +INSN(RET,    "")
>>>> +INSN(RETI,   "")
>>>> +INSN(RJMP,   ".%+d", a->imm * 2)
>>>> +INSN(ROR,    "r%d", a->rd)
>>>> +INSN(SBC,    "r%d, r%d", a->rd, a->rr)
>>>> +INSN(SBCI,   "r%d, %d", a->rd, a->imm)
>>>> +INSN(SBI,    "$%d, %d", a->reg, a->bit)
>>>> +INSN(SBIC,   "$%d, %d", a->reg, a->bit)
>>>> +INSN(SBIS,   "$%d, %d", a->reg, a->bit)
>>>> +INSN(SBIW,   "r%d:r%d, %d", a->rd + 1, a->rd, a->imm)
>>>> +INSN(SBRC,   "r%d, %d", a->rr, a->bit)
>>>> +INSN(SBRS,   "r%d, %d", a->rr, a->bit)
>>>> +INSN(SLEEP,  "")
>>>> +INSN(SPM,    "")
>>>> +INSN(SPMX,   "Z+")
>>>> +INSN(STDY,   "r%d, Y+%d", a->rd, a->imm)
>>>> +INSN(STDZ,   "r%d, Z+%d", a->rd, a->imm)
>>>> +INSN(STS,    "r%d, %d", a->rd, a->imm)
>>>> +INSN(STX1,   "r%d, X", a->rr)
>>>> +INSN(STX2,   "r%d, X+", a->rr)
>>>> +INSN(STX3,   "r%d, -X", a->rr)
>>>> +INSN(STY2,   "r%d, Y+", a->rd)
>>>> +INSN(STY3,   "r%d, -Y", a->rd)
>>>> +INSN(STZ2,   "r%d, Z+", a->rd)
>>>> +INSN(STZ3,   "r%d, -Z", a->rd)
>>>> +INSN(SUB,    "r%d, r%d", a->rd, a->rr)
>>>> +INSN(SUBI,   "r%d, %d", a->rd, a->imm)
>>>> +INSN(SWAP,   "r%d", a->rd)
>>>> +INSN(WDR,    "")
>>>> +INSN(XCH,    "Z, r%d", a->rd)
>>>> +
>>>> diff --git a/target/avr/translate.c b/target/avr/translate.c
>>>> index c8c6f798bf..a621195817 100644
>>>> --- a/target/avr/translate.c
>>>> +++ b/target/avr/translate.c
>>>> @@ -2917,6 +2917,17 @@ done_generating:
>>>>
>>>>      tb->size =3D (ctx.npc - pc_start) * 2;
>>>>      tb->icount =3D num_insns;
>>>> +
>>>> +#ifdef DEBUG_DISAS
>>>> +    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
>>>> +        && qemu_log_in_addr_range(tb->pc)) {
>>>> +        qemu_log_lock();
>>>> +        qemu_log("IN: %s\n", lookup_symbol(tb->pc));
>>>> +        log_target_disas(cs, tb->pc, tb->size);
>>>> +        qemu_log("\n");
>>>> +        qemu_log_unlock();
>>>> +    }
>>>> +#endif
>>>>  }
>>>>
>>>>  void restore_state_to_opc(CPUAVRState *env, TranslationBlock *tb,
>>>> --
>>>> 2.17.2 (Apple Git-113)
>>>>
>>>>
>>
>> --
>> Best Regards,
>> Michael Rolnik
>>
>

--0000000000006fa4260599545131
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">You are right. See at the bottom of the file. There is a =
comment about it<br><br><div data-smartmail=3D"gmail_signature">Sent from m=
y cell phone, please ignore typos </div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 10, 2019, 6:21 AM Aleks=
andar Markovic &lt;<a href=3D"mailto:aleksandar.m.mail@gmail.com">aleksanda=
r.m.mail@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
br><br>On Monday, December 9, 2019, Michael Rolnik &lt;<a href=3D"mailto:mr=
olnik@gmail.com" target=3D"_blank" rel=3D"noreferrer">mrolnik@gmail.com</a>=
&gt; wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi Aleksanda=
r.<div><br></div><div>1. all instructions are 16 bit long except CALL &amp;=
 JMP they are 32 bit long</div></div></blockquote><div><br></div><div>Accor=
dingto the doc, LDS and STS also have 32-bit coding.</div><div><br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>2.=C2=
=A0next_word_used is set to true by=C2=A0next_word when called by=C2=A0appe=
nd_16 when CALL &amp; JMP are parsed</div><div><br></div><div>Regards,</div=
><div>Michael Rolnik</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Mon, Dec 9, 2019 at 8:10 PM Aleksandar Markovi=
c &lt;<a href=3D"mailto:aleksandar.m.mail@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">aleksandar.m.mail@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><br><br>On Sunday, December 8, 2=
019, Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com" target=3D"_bla=
nk" rel=3D"noreferrer">mrolnik@gmail.com</a>&gt; wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Provide function disassembles executed in=
struction when `-d in_asm` is<br>
provided<br>
<br>
Example:<br>
`./avr-softmmu/qemu-system-avr -bios free-rtos/Demo/AVR_ATMega2560_GCC/demo=
.elf -d in_asm` will produce something like the following<br>
<br>
```<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 IN:<br>
=C2=A0 =C2=A0 0x0000014a:=C2=A0 CALL=C2=A0 =C2=A0 =C2=A0 0x3808<br>
<br>
=C2=A0 =C2=A0 IN: main<br>
=C2=A0 =C2=A0 0x00003808:=C2=A0 CALL=C2=A0 =C2=A0 =C2=A0 0x4b4<br>
<br>
=C2=A0 =C2=A0 IN: vParTestInitialise<br>
=C2=A0 =C2=A0 0x000004b4:=C2=A0 LDI=C2=A0 =C2=A0 =C2=A0 =C2=A0r24, 255<br>
=C2=A0 =C2=A0 0x000004b6:=C2=A0 STS=C2=A0 =C2=A0 =C2=A0 =C2=A0r24, 0<br>
=C2=A0 =C2=A0 0x000004b8:=C2=A0 MULS=C2=A0 =C2=A0 =C2=A0 r16, r20<br>
=C2=A0 =C2=A0 0x000004ba:=C2=A0 OUT=C2=A0 =C2=A0 =C2=A0 =C2=A0$1, r24<br>
=C2=A0 =C2=A0 0x000004bc:=C2=A0 LDS=C2=A0 =C2=A0 =C2=A0 =C2=A0r24, 0<br>
=C2=A0 =C2=A0 0x000004be:=C2=A0 MULS=C2=A0 =C2=A0 =C2=A0 r16, r20<br>
=C2=A0 =C2=A0 0x000004c0:=C2=A0 OUT=C2=A0 =C2=A0 =C2=A0 =C2=A0$2, r24<br>
=C2=A0 =C2=A0 0x000004c2:=C2=A0 RET<br>
=C2=A0 =C2=A0 ...<br>
```<br>
<br>
Signed-off-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">mrolnik@gmail.com</a>&gt;<br>
Suggested-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lin=
aro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.org<=
/a>&gt;<br>
Suggested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redh=
at.com" target=3D"_blank" rel=3D"noreferrer">philmd@redhat.com</a>&gt;<br>
Suggested-by: Aleksandar Markovic &lt;<a href=3D"mailto:aleksandar.m.mail@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">aleksandar.m.mail@gmail.com<=
/a>&gt;<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redha=
t.com" target=3D"_blank" rel=3D"noreferrer">philmd@redhat.com</a>&gt;<br>
Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.=
com" target=3D"_blank" rel=3D"noreferrer">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0target/avr/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0target/avr/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0target/avr/disas.c=C2=A0 =C2=A0 =C2=A0| 226 +++++++++++++++++++++++++=
++++++++++++++++<br>
=C2=A0target/avr/translate.c |=C2=A0 11 ++<br>
=C2=A04 files changed, 239 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 target/avr/disas.c<br>
<br>
diff --git a/target/avr/cpu.h b/target/avr/cpu.h<br>
index c217eefeb4..a8a3e7ade6 100644<br>
--- a/target/avr/cpu.h<br>
+++ b/target/avr/cpu.h<br>
@@ -178,6 +178,7 @@ bool avr_cpu_exec_interrupt(CPUState *cpu, int int_req)=
;<br>
=C2=A0hwaddr avr_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
=C2=A0int avr_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);<=
br>
=C2=A0int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);=
<br>
+int avr_print_insn(bfd_vma addr, disassemble_info *info);<br>
<br>
=C2=A0static inline int avr_feature(CPUAVRState *env, int feature)<br>
=C2=A0{<br>
diff --git a/target/avr/cpu.c b/target/avr/cpu.c<br>
index c5cafcae3c..be4b921e4d 100644<br>
--- a/target/avr/cpu.c<br>
+++ b/target/avr/cpu.c<br>
@@ -83,7 +83,7 @@ static void avr_cpu_reset(CPUState *cs)<br>
=C2=A0static void avr_cpu_disas_set_info(CPUState *cpu, disassemble_info *i=
nfo)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0info-&gt;mach =3D bfd_arch_avr;<br>
-=C2=A0 =C2=A0 info-&gt;print_insn =3D NULL;<br>
+=C2=A0 =C2=A0 info-&gt;print_insn =3D avr_print_insn;<br>
=C2=A0}<br>
<br>
=C2=A0static void avr_cpu_realizefn(DeviceState *dev, Error **errp)<br>
diff --git a/target/avr/disas.c b/target/avr/disas.c<br>
new file mode 100644<br>
index 0000000000..22863d2eb1<br>
--- /dev/null<br>
+++ b/target/avr/disas.c<br>
@@ -0,0 +1,226 @@<br>
+/*<br>
+ * AVR disassembler<br>
+ *<br>
+ * Copyright (c) 2019 Richard Henderson &lt;<a href=3D"mailto:rth@twiddle.=
net" target=3D"_blank" rel=3D"noreferrer">rth@twiddle.net</a>&gt;<br>
+ * Copyright (c) 2019 Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.c=
om" target=3D"_blank" rel=3D"noreferrer">mrolnik@gmail.com</a>&gt;<br>
+ *<br>
+ * This program is free software: you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License as published by<br=
>
+ * the Free Software Foundation, either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+ * GNU General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License<br>
+ * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gn=
u.org/licenses/" target=3D"_blank" rel=3D"noreferrer">http://www.gnu.org/li=
censes/</a>&gt;.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;cpu.h&quot;<br>
+<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 disassemble_info *info;<br>
+=C2=A0 =C2=A0 uint16_t next_word;<br>
+=C2=A0 =C2=A0 bool next_word_used;<br>
+} DisasContext;<br>
+<br>
+static int to_regs_16_31_by_one(DisasContext *ctx, int indx)<br>
+{<br>
+=C2=A0 =C2=A0 return 16 + (indx % 16);<br>
+}<br>
+<br>
+static int to_regs_16_23_by_one(DisasContext *ctx, int indx)<br>
+{<br>
+=C2=A0 =C2=A0 return 16 + (indx % 8);<br>
+}<br>
+static int to_regs_24_30_by_two(DisasContext *ctx, int indx)<br>
+{<br>
+=C2=A0 =C2=A0 return 24 + (indx % 4) * 2;<br>
+}<br>
+static int to_regs_00_30_by_two(DisasContext *ctx, int indx)<br>
+{<br>
+=C2=A0 =C2=A0 return (indx % 16) * 2;<br>
+}<br>
+<br>
+static uint16_t next_word(DisasContext *ctx)<br>
+{<br>
+=C2=A0 =C2=A0 ctx-&gt;next_word_used =3D true;<br>
+=C2=A0 =C2=A0 return ctx-&gt;next_word;<br>
+}<br>
+<br>
+static int append_16(DisasContext *ctx, int x)<br>
+{<br>
+=C2=A0 =C2=A0 return x &lt;&lt; 16 | next_word(ctx);<br>
+}<br>
+<br>
+<br>
+/* Include the auto-generated decoder.=C2=A0 */<br>
+static bool decode_insn(DisasContext *ctx, uint16_t insn);<br>
+#include &quot;decode_insn.inc.c&quot;<br>
+<br>
+#define output(mnemonic, format, ...) \<br>
+=C2=A0 =C2=A0 (pctx-&gt;info-&gt;fprintf_func(pctx-&gt;info-&gt;stream, &q=
uot;%-9s &quot; format, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mnemonic, ##__VA_ARGS__))<br>
+<br>
+int avr_print_insn(bfd_vma addr, disassemble_info *info)<br>
+{<br>
+=C2=A0 =C2=A0 DisasContext ctx;<br>
+=C2=A0 =C2=A0 DisasContext *pctx =3D &amp;ctx;<br>
+=C2=A0 =C2=A0 bfd_byte buffer[4];<br>
+=C2=A0 =C2=A0 uint16_t insn;<br>
+=C2=A0 =C2=A0 int status;<br>
+<br>
+=C2=A0 =C2=A0 <a href=3D"http://ctx.info" target=3D"_blank" rel=3D"norefer=
rer">ctx.info</a> =3D info;<br>
+<br>
+=C2=A0 =C2=A0 status =3D info-&gt;read_memory_func(addr, buffer, 4, info);=
<br>
+=C2=A0 =C2=A0 if (status !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;memory_error_func(status, addr, info)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 insn =3D bfd_getl16(buffer);<br>
+=C2=A0 =C2=A0 ctx.next_word =3D bfd_getl16(buffer + 2);<br>
+=C2=A0 =C2=A0 ctx.next_word_used =3D false;<br>
+<br>
+=C2=A0 =C2=A0 if (!decode_insn(&amp;ctx, insn)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output(&quot;.db&quot;, &quot;0x%02x, 0x%02x&q=
uot;, buffer[0], buffer[1]);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ctx.next_word_used ? 4 : 2;<br>
+}</blockquote><div><br></div><div>Hi, Michael,</div><div><br></div><div>Wh=
at is the role of ctx.next_word_used, if it looks it is always &quot;false&=
quot;?</div><div><br></div><div>Related to this, how do you disassemble 32-=
bit-coded instructions? From this patch, it looks you treat all AVR instruc=
tions as 16-bit-coded?</div><div><br></div><div>Thanks,</div><div>Aleksanda=
r</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+<br>
+#define INSN(opcode, format, ...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+static bool trans_##opcode(DisasContext *pctx, arg_##opcode * a)=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
+{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 output(#opcode, format, ##__VA_ARGS__);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 return true;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
+}<br>
+<br>
+#define INSN_MNEMONIC(opcode, mnemonic, format, ...)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+static bool trans_##opcode(DisasContext *pctx, arg_##opcode * a)=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
+{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 output(mnemonic, format, ##__VA_ARGS__);=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
+=C2=A0 =C2=A0 return true;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
+}<br>
+<br>
+/*<br>
+ *=C2=A0 =C2=A0C=C2=A0 =C2=A0 =C2=A0 =C2=A0Z=C2=A0 =C2=A0 =C2=A0 =C2=A0N=
=C2=A0 =C2=A0 =C2=A0 =C2=A0V=C2=A0 =C2=A0 =C2=A0 =C2=A0S=C2=A0 =C2=A0 =C2=
=A0 =C2=A0H=C2=A0 =C2=A0 =C2=A0 =C2=A0T=C2=A0 =C2=A0 =C2=A0 =C2=A0I<br>
+ *=C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=A02=
=C2=A0 =C2=A0 =C2=A0 =C2=A03=C2=A0 =C2=A0 =C2=A0 =C2=A04=C2=A0 =C2=A0 =C2=
=A0 =C2=A05=C2=A0 =C2=A0 =C2=A0 =C2=A06=C2=A0 =C2=A0 =C2=A0 =C2=A07<br>
+ */<br>
+static const char *brbc[] =3D {<br>
+=C2=A0 =C2=A0 &quot;BRCC&quot;, &quot;BRNE&quot;, &quot;BRPL&quot;, &quot;=
BRVC&quot;, &quot;BRGE&quot;, &quot;BRHC&quot;, &quot;BRTC&quot;, &quot;BRI=
D&quot;<br>
+};<br>
+<br>
+static const char *brbs[] =3D {<br>
+=C2=A0 =C2=A0 &quot;BRCS&quot;, &quot;BREQ&quot;, &quot;BRMI&quot;, &quot;=
BRVS&quot;, &quot;BRLT&quot;, &quot;BRHS&quot;, &quot;BRTS&quot;, &quot;BRI=
E&quot;<br>
+};<br>
+<br>
+static const char *bset[] =3D {<br>
+=C2=A0 =C2=A0 &quot;SEC&quot;,=C2=A0 &quot;SEZ&quot;,=C2=A0 &quot;SEN&quot=
;,=C2=A0 &quot;SEZ&quot;,=C2=A0 &quot;SES&quot;,=C2=A0 &quot;SEH&quot;,=C2=
=A0 &quot;SET&quot;,=C2=A0 &quot;SEI&quot;<br>
+};<br>
+<br>
+static const char *bclr[] =3D {<br>
+=C2=A0 =C2=A0 &quot;CLC&quot;,=C2=A0 &quot;CLZ&quot;,=C2=A0 &quot;CLN&quot=
;,=C2=A0 &quot;CLZ&quot;,=C2=A0 &quot;CLS&quot;,=C2=A0 &quot;CLH&quot;,=C2=
=A0 &quot;CLT&quot;,=C2=A0 &quot;CLI&quot;<br>
+};<br>
+<br>
+INSN(ADC,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
+INSN(ADD,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
+INSN(ADIW,=C2=A0 =C2=A0&quot;r%d:r%d, %d&quot;, a-&gt;rd + 1, a-&gt;rd, a-=
&gt;imm)<br>
+INSN(AND,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
+INSN(ANDI,=C2=A0 =C2=A0&quot;r%d, %d&quot;, a-&gt;rd, a-&gt;imm)<br>
+INSN(ASR,=C2=A0 =C2=A0 &quot;r%d&quot;, a-&gt;rd)<br>
+INSN_MNEMONIC(BCLR,=C2=A0 bclr[a-&gt;bit], &quot;&quot;)<br>
+INSN(BLD,=C2=A0 =C2=A0 &quot;r%d, %d&quot;, a-&gt;rd, a-&gt;bit)<br>
+INSN_MNEMONIC(BRBC,=C2=A0 brbc[a-&gt;bit], &quot;.%+d&quot;, a-&gt;imm * 2=
)<br>
+INSN_MNEMONIC(BRBS,=C2=A0 brbs[a-&gt;bit], &quot;.%+d&quot;, a-&gt;imm * 2=
)<br>
+INSN(BREAK,=C2=A0 &quot;&quot;)<br>
+INSN_MNEMONIC(BSET,=C2=A0 bset[a-&gt;bit], &quot;&quot;)<br>
+INSN(BST,=C2=A0 =C2=A0 &quot;r%d, %d&quot;, a-&gt;rd, a-&gt;bit)<br>
+INSN(CALL,=C2=A0 =C2=A0&quot;0x%x&quot;, a-&gt;imm * 2)<br>
+INSN(CBI,=C2=A0 =C2=A0 &quot;%d, %d&quot;, a-&gt;reg, a-&gt;bit)<br>
+INSN(COM,=C2=A0 =C2=A0 &quot;r%d&quot;, a-&gt;rd)<br>
+INSN(CP,=C2=A0 =C2=A0 =C2=A0&quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
+INSN(CPC,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
+INSN(CPI,=C2=A0 =C2=A0 &quot;r%d, %d&quot;, a-&gt;rd, a-&gt;imm)<br>
+INSN(CPSE,=C2=A0 =C2=A0&quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
+INSN(DEC,=C2=A0 =C2=A0 &quot;r%d&quot;, a-&gt;rd)<br>
+INSN(DES,=C2=A0 =C2=A0 &quot;%d&quot;, a-&gt;imm)<br>
+INSN(EICALL, &quot;&quot;)<br>
+INSN(EIJMP,=C2=A0 &quot;&quot;)<br>
+INSN(ELPM1,=C2=A0 &quot;&quot;)<br>
+INSN(ELPM2,=C2=A0 &quot;r%d, Z&quot;, a-&gt;rd)<br>
+INSN(ELPMX,=C2=A0 &quot;r%d, Z+&quot;, a-&gt;rd)<br>
+INSN(EOR,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
+INSN(FMUL,=C2=A0 =C2=A0&quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
+INSN(FMULS,=C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
+INSN(FMULSU, &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
+INSN(ICALL,=C2=A0 &quot;&quot;)<br>
+INSN(IJMP,=C2=A0 =C2=A0&quot;&quot;)<br>
+INSN(IN,=C2=A0 =C2=A0 =C2=A0&quot;r%d, $%d&quot;, a-&gt;rd, a-&gt;imm)<br>
+INSN(INC,=C2=A0 =C2=A0 &quot;r%d&quot;, a-&gt;rd)<br>
+INSN(JMP,=C2=A0 =C2=A0 &quot;0x%x&quot;, a-&gt;imm * 2)<br>
+INSN(LAC,=C2=A0 =C2=A0 &quot;Z, r%d&quot;, a-&gt;rd)<br>
+INSN(LAS,=C2=A0 =C2=A0 &quot;Z, r%d&quot;, a-&gt;rd)<br>
+INSN(LAT,=C2=A0 =C2=A0 &quot;Z, r%d&quot;, a-&gt;rd)<br>
+INSN(LDDY,=C2=A0 =C2=A0&quot;r%d, Y+%d&quot;, a-&gt;rd, a-&gt;imm)<br>
+INSN(LDDZ,=C2=A0 =C2=A0&quot;r%d, Z+%d&quot;, a-&gt;rd, a-&gt;imm)<br>
+INSN(LDI,=C2=A0 =C2=A0 &quot;r%d, %d&quot;, a-&gt;rd, a-&gt;imm)<br>
+INSN(LDS,=C2=A0 =C2=A0 &quot;r%d, %d&quot;, a-&gt;rd, a-&gt;imm)<br>
+INSN(LDX1,=C2=A0 =C2=A0&quot;r%d, X&quot;, a-&gt;rd)<br>
+INSN(LDX2,=C2=A0 =C2=A0&quot;r%d, X+&quot;, a-&gt;rd)<br>
+INSN(LDX3,=C2=A0 =C2=A0&quot;r%d, -X&quot;, a-&gt;rd)<br>
+INSN(LDY2,=C2=A0 =C2=A0&quot;r%d, Y+&quot;, a-&gt;rd)<br>
+INSN(LDY3,=C2=A0 =C2=A0&quot;r%d, -Y&quot;, a-&gt;rd)<br>
+INSN(LDZ2,=C2=A0 =C2=A0&quot;r%d, Z+&quot;, a-&gt;rd)<br>
+INSN(LDZ3,=C2=A0 =C2=A0&quot;r%d, -Z&quot;, a-&gt;rd)<br>
+INSN(LPM1,=C2=A0 =C2=A0&quot;&quot;)<br>
+INSN(LPM2,=C2=A0 =C2=A0&quot;r%d, Z&quot;, a-&gt;rd)<br>
+INSN(LPMX,=C2=A0 =C2=A0&quot;r%d, Z+&quot;, a-&gt;rd)<br>
+INSN(LSR,=C2=A0 =C2=A0 &quot;r%d&quot;, a-&gt;rd)<br>
+INSN(MOV,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
+INSN(MOVW,=C2=A0 =C2=A0&quot;r%d:r%d, r%d,r:r%d&quot;, a-&gt;rd + 1, a-&gt=
;rd, a-&gt;rr + 1, a-&gt;rr)<br>
+INSN(MUL,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
+INSN(MULS,=C2=A0 =C2=A0&quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
+INSN(MULSU,=C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
+INSN(NEG,=C2=A0 =C2=A0 &quot;r%d&quot;, a-&gt;rd)<br>
+INSN(NOP,=C2=A0 =C2=A0 &quot;&quot;)<br>
+INSN(OR,=C2=A0 =C2=A0 =C2=A0&quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
+INSN(ORI,=C2=A0 =C2=A0 &quot;r%d, %d&quot;, a-&gt;rd, a-&gt;imm)<br>
+INSN(OUT,=C2=A0 =C2=A0 &quot;$%d, r%d&quot;, a-&gt;imm, a-&gt;rd)<br>
+INSN(POP,=C2=A0 =C2=A0 &quot;r%d&quot;, a-&gt;rd)<br>
+INSN(PUSH,=C2=A0 =C2=A0&quot;r%d&quot;, a-&gt;rd)<br>
+INSN(RCALL,=C2=A0 &quot;.%+d&quot;, a-&gt;imm * 2)<br>
+INSN(RET,=C2=A0 =C2=A0 &quot;&quot;)<br>
+INSN(RETI,=C2=A0 =C2=A0&quot;&quot;)<br>
+INSN(RJMP,=C2=A0 =C2=A0&quot;.%+d&quot;, a-&gt;imm * 2)<br>
+INSN(ROR,=C2=A0 =C2=A0 &quot;r%d&quot;, a-&gt;rd)<br>
+INSN(SBC,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
+INSN(SBCI,=C2=A0 =C2=A0&quot;r%d, %d&quot;, a-&gt;rd, a-&gt;imm)<br>
+INSN(SBI,=C2=A0 =C2=A0 &quot;$%d, %d&quot;, a-&gt;reg, a-&gt;bit)<br>
+INSN(SBIC,=C2=A0 =C2=A0&quot;$%d, %d&quot;, a-&gt;reg, a-&gt;bit)<br>
+INSN(SBIS,=C2=A0 =C2=A0&quot;$%d, %d&quot;, a-&gt;reg, a-&gt;bit)<br>
+INSN(SBIW,=C2=A0 =C2=A0&quot;r%d:r%d, %d&quot;, a-&gt;rd + 1, a-&gt;rd, a-=
&gt;imm)<br>
+INSN(SBRC,=C2=A0 =C2=A0&quot;r%d, %d&quot;, a-&gt;rr, a-&gt;bit)<br>
+INSN(SBRS,=C2=A0 =C2=A0&quot;r%d, %d&quot;, a-&gt;rr, a-&gt;bit)<br>
+INSN(SLEEP,=C2=A0 &quot;&quot;)<br>
+INSN(SPM,=C2=A0 =C2=A0 &quot;&quot;)<br>
+INSN(SPMX,=C2=A0 =C2=A0&quot;Z+&quot;)<br>
+INSN(STDY,=C2=A0 =C2=A0&quot;r%d, Y+%d&quot;, a-&gt;rd, a-&gt;imm)<br>
+INSN(STDZ,=C2=A0 =C2=A0&quot;r%d, Z+%d&quot;, a-&gt;rd, a-&gt;imm)<br>
+INSN(STS,=C2=A0 =C2=A0 &quot;r%d, %d&quot;, a-&gt;rd, a-&gt;imm)<br>
+INSN(STX1,=C2=A0 =C2=A0&quot;r%d, X&quot;, a-&gt;rr)<br>
+INSN(STX2,=C2=A0 =C2=A0&quot;r%d, X+&quot;, a-&gt;rr)<br>
+INSN(STX3,=C2=A0 =C2=A0&quot;r%d, -X&quot;, a-&gt;rr)<br>
+INSN(STY2,=C2=A0 =C2=A0&quot;r%d, Y+&quot;, a-&gt;rd)<br>
+INSN(STY3,=C2=A0 =C2=A0&quot;r%d, -Y&quot;, a-&gt;rd)<br>
+INSN(STZ2,=C2=A0 =C2=A0&quot;r%d, Z+&quot;, a-&gt;rd)<br>
+INSN(STZ3,=C2=A0 =C2=A0&quot;r%d, -Z&quot;, a-&gt;rd)<br>
+INSN(SUB,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
+INSN(SUBI,=C2=A0 =C2=A0&quot;r%d, %d&quot;, a-&gt;rd, a-&gt;imm)<br>
+INSN(SWAP,=C2=A0 =C2=A0&quot;r%d&quot;, a-&gt;rd)<br>
+INSN(WDR,=C2=A0 =C2=A0 &quot;&quot;)<br>
+INSN(XCH,=C2=A0 =C2=A0 &quot;Z, r%d&quot;, a-&gt;rd)<br>
+<br>
diff --git a/target/avr/translate.c b/target/avr/translate.c<br>
index c8c6f798bf..a621195817 100644<br>
--- a/target/avr/translate.c<br>
+++ b/target/avr/translate.c<br>
@@ -2917,6 +2917,17 @@ done_generating:<br>
<br>
=C2=A0 =C2=A0 =C2=A0tb-&gt;size =3D (ctx.npc - pc_start) * 2;<br>
=C2=A0 =C2=A0 =C2=A0tb-&gt;icount =3D num_insns;<br>
+<br>
+#ifdef DEBUG_DISAS<br>
+=C2=A0 =C2=A0 if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; qemu_log_in_addr_range(tb-&gt;pc)) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_lock();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IN: %s\n&quot;, lookup_symbol(t=
b-&gt;pc));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 log_target_disas(cs, tb-&gt;pc, tb-&gt;size);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_unlock();<br>
+=C2=A0 =C2=A0 }<br>
+#endif<br>
=C2=A0}<br>
<br>
=C2=A0void restore_state_to_opc(CPUAVRState *env, TranslationBlock *tb,<br>
-- <br>
2.17.2 (Apple Git-113)<br>
<br>
</blockquote>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
>Best Regards,<br>Michael Rolnik</div>
</blockquote>
</blockquote></div>

--0000000000006fa4260599545131--

