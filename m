Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B2910A69A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 23:36:29 +0100 (CET)
Received: from localhost ([::1]:59758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZjRc-0000vF-8y
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 17:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58201)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iZjP7-0007ln-MJ
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 17:33:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iZjGB-00071u-C6
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 17:24:42 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35486)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iZjGB-00071Y-1l
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 17:24:39 -0500
Received: by mail-ot1-x343.google.com with SMTP id 23so15635590otf.2
 for <qemu-devel@nongnu.org>; Tue, 26 Nov 2019 14:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=r6T84eJ/c7mgsgC4fpm1PiNnDf1nLslx5x01OL7oLII=;
 b=vF95xO8DD0jUlBDJFCIWNk795RetX58r4vgvVqp1cVwomxSC9hu328NksRM8h30Zt7
 /zEFDX6Ys3OmsQ1BNDFt7uDht7H47bP//PK1lrNJOBhuBjLlPbeXIL22ABrcpIyqLszt
 hKJomdQME93BtOqNgogzWlMTiJ/Kws6bECaRZafrhvqY4qa9oJAutFnGTOca+izYn2RZ
 O4lHwg49odXetYfE0YdIHK/Djxqmo0xHndJS3u8ZCS42z4f/xF3odynRABoUTc+xewSi
 xJGqX3B3hbCXYvEcRZ4F1XorWjMKPZtt7dWAGTYXYL7Fizpwa6zMuE39p72VuDPu2MrF
 05tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=r6T84eJ/c7mgsgC4fpm1PiNnDf1nLslx5x01OL7oLII=;
 b=s4V/Z/rm0/J2vWCDb2jiMmGEuzuIg2T3dP+qY7dCAdXVn0QEmW/bsTu9RyKwGxWsfl
 2iRlxQ7VPMVssTrc1Ej5nD3gN84j4YR/ce5WI97CnVcfVrwwYenwR9PMZVgQK4HfpejV
 D5Rk9WNQKTQ0dLTU7AoyQo+w3pY100qVsAi6nA+qn5fIa0VSkLpYkQGjvtR748aQ7Y5/
 49NyoHtLDADEuMQoA4ADKtBWm+XfTDM7R00UOkMyERMfWg3AqyWLZGE1Mwgxileb+NAO
 QLStiMA6q++ikjqUGTBaT+pBECEVaEmM/mQv1L/zHTfW0AsHY0wt6JcIzlNL6tA3/QRF
 bmhQ==
X-Gm-Message-State: APjAAAVR5YvVCpBBSUDu+qtpTeTm1Quc2tvtA7XTmrUdOPKBEijxoMEl
 4ukmfv6cEnR1Na1BEtVy2l2sCTVlzl6DnnL+wEM=
X-Google-Smtp-Source: APXvYqw2leDiSvLZswQYXSP/F/iNyn4tWkAnCSTCUN2KGXNzMSTJT+tn4t5secq/J2NoW/IUye0TdXPFD0hBcM/WYjw=
X-Received: by 2002:a05:6830:81:: with SMTP id a1mr1062115oto.64.1574807077877; 
 Tue, 26 Nov 2019 14:24:37 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6830:1391:0:0:0:0 with HTTP; Tue, 26 Nov 2019 14:24:37
 -0800 (PST)
In-Reply-To: <CAK4993j9g4Q4pu=LsOTB2k9UaFhr632-1jrN8qO0RFsTbvMJ-Q@mail.gmail.com>
References: <20191124050225.30351-1-mrolnik@gmail.com>
 <20191124050225.30351-11-mrolnik@gmail.com>
 <CAL1e-=jGAd9ENuoDvcx7E64zBFhKn45=xpP6t+a8kVJfnPcUFQ@mail.gmail.com>
 <CAK4993j9g4Q4pu=LsOTB2k9UaFhr632-1jrN8qO0RFsTbvMJ-Q@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Tue, 26 Nov 2019 23:24:37 +0100
Message-ID: <CAL1e-=gnoKDGc3hu--JhP+iXupcPOnAeXJxmbS8u6_ZzwLHjPw@mail.gmail.com>
Subject: Re: [PATCH v36 10/17] target/avr: Add instruction disassembly function
To: Michael Rolnik <mrolnik@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000777e390598475897"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Pavel Dovgalyuk <dovgaluk@ispras.ru>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000777e390598475897
Content-Type: text/plain; charset="UTF-8"

On Tuesday, November 26, 2019, Michael Rolnik <mrolnik@gmail.com> wrote:

>
>
> On Tue, Nov 26, 2019 at 9:52 PM Aleksandar Markovic <
> aleksandar.m.mail@gmail.com> wrote:
>
>> On Sun, Nov 24, 2019 at 6:03 AM Michael Rolnik <mrolnik@gmail.com> wrote:
>> >
>> > Provide function disassembles executed instruction when `-d in_asm` is
>> > provided
>> >
>> > Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
>> > ---
>> >  target/avr/cpu.h       |   1 +
>> >  target/avr/cpu.c       |   2 +-
>> >  target/avr/disas.c     | 214 +++++++++++++++++++++++++++++++++++++++++
>> >  target/avr/translate.c |  11 +++
>> >  4 files changed, 227 insertions(+), 1 deletion(-)
>> >  create mode 100644 target/avr/disas.c
>> >
>> > diff --git a/target/avr/cpu.h b/target/avr/cpu.h
>> > index ed9218af5f..574118beab 100644
>> > --- a/target/avr/cpu.h
>> > +++ b/target/avr/cpu.h
>> > @@ -157,6 +157,7 @@ bool avr_cpu_exec_interrupt(CPUState *cpu, int
>> int_req);
>> >  hwaddr avr_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>> >  int avr_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>> >  int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>> > +int avr_print_insn(bfd_vma addr, disassemble_info *info);
>> >
>> >  static inline int avr_feature(CPUAVRState *env, int feature)
>> >  {
>> > diff --git a/target/avr/cpu.c b/target/avr/cpu.c
>> > index dae56d7845..52ec21dd16 100644
>> > --- a/target/avr/cpu.c
>> > +++ b/target/avr/cpu.c
>> > @@ -83,7 +83,7 @@ static void avr_cpu_reset(CPUState *cs)
>> >  static void avr_cpu_disas_set_info(CPUState *cpu, disassemble_info
>> *info)
>> >  {
>> >      info->mach = bfd_arch_avr;
>> > -    info->print_insn = NULL;
>> > +    info->print_insn = avr_print_insn;
>> >  }
>> >
>> >  static void avr_cpu_realizefn(DeviceState *dev, Error **errp)
>> > diff --git a/target/avr/disas.c b/target/avr/disas.c
>> > new file mode 100644
>> > index 0000000000..727fc463ce
>> > --- /dev/null
>> > +++ b/target/avr/disas.c
>> > @@ -0,0 +1,214 @@
>> > +/*
>> > + * OpenRISC disassembler
>> > + *
>> > + * Copyright (c) 2018 Richard Henderson <rth@twiddle.net>
>> > + *
>> > + * This program is free software: you can redistribute it and/or modify
>> > + * it under the terms of the GNU General Public License as published by
>> > + * the Free Software Foundation, either version 2 of the License, or
>> > + * (at your option) any later version.
>> > + *
>> > + * This program is distributed in the hope that it will be useful,
>> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> > + * GNU General Public License for more details.
>> > + *
>> > + * You should have received a copy of the GNU General Public License
>> > + * along with this program.  If not, see <http://www.gnu.org/licenses/
>> >.
>> > + */
>> > +
>> > +#include "qemu/osdep.h"
>> > +#include "disas/dis-asm.h"
>> > +#include "qemu/bitops.h"
>> > +#include "cpu.h"
>> > +
>> > +typedef struct {
>> > +    disassemble_info *info;
>> > +    uint16_t next_word;
>> > +    bool next_word_used;
>> > +} DisasContext;
>> > +
>> > +static int to_A(DisasContext *ctx, int indx) { return 16 + (indx %
>> 16); }
>> > +static int to_B(DisasContext *ctx, int indx) { return 16 + (indx % 8);
>> }
>> > +static int to_C(DisasContext *ctx, int indx) { return 24 + (indx % 4)
>> * 2; }
>> > +static int to_D(DisasContext *ctx, int indx) { return (indx % 16) * 2;
>> }
>> > +
>>
>> Is there any better way for naming these four function than
>> meaningless to_A, to_B, to_C, to_D?
>
>
>> Aleksandar
>>
>
> if you look into insn.decode file you will see the following comment.
>  #   A = [16 .. 31]
>  #   B = [16 .. 23]
>  #   C = [24, 26, 28, 30]
>  #   D = [0, 2, 4, 6, 8, .. 30]
>
> I can call them if you prefer
> A is regs_16_to_31_by_one
> B is regs_16_to_23_by_one
> C is regs_24_to_30_by_two
> D is regs_00_to_30_by_two
>
>
I really like these new names.


>
>>
>> > +static uint16_t next_word(DisasContext *ctx)
>> > +{
>> > +    ctx->next_word_used = true;
>> > +    return ctx->next_word;
>> > +}
>> > +
>> > +static int append_16(DisasContext *ctx, int x)
>> > +{
>> > +    return x << 16 | next_word(ctx);
>> > +}
>> > +
>> > +
>> > +/* Include the auto-generated decoder.  */
>> > +static bool decode_insn(DisasContext *ctx, uint16_t insn);
>> > +#include "decode_insn.inc.c"
>> > +
>> > +#define output(mnemonic, format, ...) \
>> > +    (pctx->info->fprintf_func(pctx->info->stream, "%-9s " format, \
>> > +                        mnemonic, ##__VA_ARGS__))
>> > +
>> > +int avr_print_insn(bfd_vma addr, disassemble_info *info)
>> > +{
>> > +    DisasContext ctx;
>> > +    DisasContext *pctx = &ctx;
>> > +    bfd_byte buffer[4];
>> > +    uint16_t insn;
>> > +    int status;
>> > +
>> > +    ctx.info = info;
>> > +
>> > +    status = info->read_memory_func(addr, buffer, 4, info);
>> > +    if (status != 0) {
>> > +        info->memory_error_func(status, addr, info);
>> > +        return -1;
>> > +    }
>> > +    insn = bfd_getl16(buffer);
>> > +    ctx.next_word = bfd_getl16(buffer + 2);
>> > +    ctx.next_word_used = false;
>> > +
>> > +    if (!decode_insn(&ctx, insn)) {
>> > +        output(".db", "0x%02x, 0x%02x", buffer[0], buffer[1]);
>> > +    }
>> > +
>> > +    return ctx.next_word_used ? 4 : 2;
>> > +}
>> > +
>> > +
>> > +#define INSN(opcode, format, ...)
>>  \
>> > +static bool trans_##opcode(DisasContext *pctx, arg_##opcode * a)
>>   \
>> > +{
>>  \
>> > +    output(#opcode, format, ##__VA_ARGS__);
>>  \
>> > +    return true;
>>   \
>> > +}
>> > +
>> > +#define INSN_MNEMONIC(opcode, mnemonic, format, ...)
>>   \
>> > +static bool trans_##opcode(DisasContext *pctx, arg_##opcode * a)
>>   \
>> > +{
>>  \
>> > +    output(mnemonic, format, ##__VA_ARGS__);
>>   \
>> > +    return true;
>>   \
>> > +}
>> > +
>> > +/*
>> > + *   C       Z       N       V       S       H       T       I
>> > + *   0       1       2       3       4       5       6       7
>> > + */
>> > +static const char *brbc[] = {
>> > +    "BRCC", "BRNE", "BRPL", "BRVC", "BRGE", "BRHC", "BRTC", "BRID"
>> > +};
>> > +
>> > +static const char *brbs[] = {
>> > +    "BRCS", "BREQ", "BRMI", "BRVS", "BRLT", "BRHS", "BRTS", "BRIE"
>> > +};
>> > +
>> > +static const char *bset[] = {
>> > +    "SEC",  "SEZ",  "SEN",  "SEZ",  "SES",  "SEH",  "SET",  "SEI"
>> > +};
>> > +
>> > +static const char *bclr[] = {
>> > +    "CLC",  "CLZ",  "CLN",  "CLZ",  "CLS",  "CLH",  "CLT",  "CLI"
>> > +};
>> > +
>> > +INSN(ADC,    "r%d, r%d", a->rd, a->rr)
>> > +INSN(ADD,    "r%d, r%d", a->rd, a->rr)
>> > +INSN(ADIW,   "r%d:r%r, %d", a->rd + 1, a->rd, a->imm)
>> > +INSN(AND,    "r%d, r%d", a->rd, a->rr)
>> > +INSN(ANDI,   "r%d, %d", a->rd, a->imm)
>> > +INSN(ASR,    "r%d", a->rd)
>> > +INSN_MNEMONIC(BCLR,  bclr[a->bit], "")
>> > +INSN(BLD,    "r%d, %d", a->rd, a->bit)
>> > +INSN_MNEMONIC(BRBC,  brbc[a->bit], ".%+d", a->imm * 2)
>> > +INSN_MNEMONIC(BRBS,  brbs[a->bit], ".%+d", a->imm * 2)
>> > +INSN(BREAK,  "")
>> > +INSN_MNEMONIC(BSET,  bset[a->bit], "")
>> > +INSN(BST,    "r%d, %d", a->rd, a->bit)
>> > +INSN(CALL,   "0x%x", a->imm * 2)
>> > +INSN(CBI,    "%d, %d", a->reg, a->bit)
>> > +INSN(COM,    "r%d", a->rd)
>> > +INSN(CP,     "r%d, r%d", a->rd, a->rr)
>> > +INSN(CPC,    "r%d, r%d", a->rd, a->rr)
>> > +INSN(CPI,    "r%d, %d", a->rd, a->imm)
>> > +INSN(CPSE,   "r%d, r%d", a->rd, a->rr)
>> > +INSN(DEC,    "r%d", a->rd)
>> > +INSN(DES,    "%d", a->imm)
>> > +INSN(EICALL, "")
>> > +INSN(EIJMP,  "")
>> > +INSN(ELPM1,  "")
>> > +INSN(ELPM2,  "r%d, Z", a->rd)
>> > +INSN(ELPMX,  "r%d, Z+", a->rd)
>> > +INSN(EOR,    "r%d, r%d", a->rd, a->rr)
>> > +INSN(FMUL,   "r%d, r%d", a->rd, a->rr)
>> > +INSN(FMULS,  "r%d, r%d", a->rd, a->rr)
>> > +INSN(FMULSU, "r%d, r%d", a->rd, a->rr)
>> > +INSN(ICALL,  "")
>> > +INSN(IJMP,   "")
>> > +INSN(IN,     "r%d, $%d", a->rd, a->imm)
>> > +INSN(INC,    "r%d", a->rd)
>> > +INSN(JMP,    "0x%x", a->imm * 2)
>> > +INSN(LAC,    "Z, r%d", a->rd)
>> > +INSN(LAS,    "Z, r%d", a->rd)
>> > +INSN(LAT,    "Z, r%d", a->rd)
>> > +INSN(LDDY,   "r%d, Y+%d", a->rd, a->imm)
>> > +INSN(LDDZ,   "r%d, Z+%d", a->rd, a->imm)
>> > +INSN(LDI,    "r%d, %d", a->rd, a->imm)
>> > +INSN(LDS,    "r%d, %d", a->rd, a->imm)
>> > +INSN(LDX1,   "r%d, X", a->rd)
>> > +INSN(LDX2,   "r%d, X+", a->rd)
>> > +INSN(LDX3,   "r%d, -X", a->rd)
>> > +INSN(LDY2,   "r%d, Y+", a->rd)
>> > +INSN(LDY3,   "r%d, -Y", a->rd)
>> > +INSN(LDZ2,   "r%d, Z+", a->rd)
>> > +INSN(LDZ3,   "r%d, -Z", a->rd)
>> > +INSN(LPM1,   "")
>> > +INSN(LPM2,   "r%d, Z", a->rd)
>> > +INSN(LPMX,   "r%d, Z+", a->rd)
>> > +INSN(LSR,    "r%d", a->rd)
>> > +INSN(MOV,    "r%d, r%d", a->rd, a->rr)
>> > +INSN(MOVW,   "r%d:r%d, r%d,r:r%d", a->rd + 1, a->rd, a->rr + 1, a->rr)
>> > +INSN(MUL,    "r%d, r%d", a->rd, a->rr)
>> > +INSN(MULS,   "r%d, r%d", a->rd, a->rr)
>> > +INSN(MULSU,  "r%d, r%d", a->rd, a->rr)
>> > +INSN(NEG,    "r%d", a->rd)
>> > +INSN(NOP,    "")
>> > +INSN(OR,     "r%d, r%d", a->rd, a->rr)
>> > +INSN(ORI,    "r%d, %d", a->rd, a->imm)
>> > +INSN(OUT,    "$%d, r%d", a->imm, a->rd)
>> > +INSN(POP,    "r%d", a->rd)
>> > +INSN(PUSH,   "r%d", a->rd)
>> > +INSN(RCALL,  ".%+d", a->imm * 2)
>> > +INSN(RET,    "")
>> > +INSN(RETI,   "")
>> > +INSN(RJMP,   ".%+d", a->imm * 2)
>> > +INSN(ROR,    "r%d", a->rd)
>> > +INSN(SBC,    "r%d, r%d", a->rd, a->rr)
>> > +INSN(SBCI,   "r%d, %d", a->rd, a->imm)
>> > +INSN(SBI,    "$%d, %d", a->reg, a->bit)
>> > +INSN(SBIC,   "$%d, %d", a->reg, a->bit)
>> > +INSN(SBIS,   "$%d, %d", a->reg, a->bit)
>> > +INSN(SBIW,   "r%d:r%d, %d", a->rd + 1, a->rd, a->imm)
>> > +INSN(SBRC,   "r%d, %d", a->rr, a->bit)
>> > +INSN(SBRS,   "r%d, %d", a->rr, a->bit)
>> > +INSN(SLEEP,  "")
>> > +INSN(SPM,    "")
>> > +INSN(SPMX,   "Z+")
>> > +INSN(STDY,   "r%d, Y+%d", a->rd, a->imm)
>> > +INSN(STDZ,   "r%d, Z+%d", a->rd, a->imm)
>> > +INSN(STS,    "r%d, %d", a->rd, a->imm)
>> > +INSN(STX1,   "r%d, X", a->rr)
>> > +INSN(STX2,   "r%d, X+", a->rr)
>> > +INSN(STX3,   "r%d, -X", a->rr)
>> > +INSN(STY2,   "r%d, Y+", a->rd)
>> > +INSN(STY3,   "r%d, -Y", a->rd)
>> > +INSN(STZ2,   "r%d, Z+", a->rd)
>> > +INSN(STZ3,   "r%d, -Z", a->rd)
>> > +INSN(SUB,    "r%d, r%d", a->rd, a->rr)
>> > +INSN(SUBI,   "r%d, %d", a->rd, a->imm)
>> > +INSN(SWAP,   "r%d", a->rd)
>> > +INSN(WDR,    "")
>> > +INSN(XCH,    "Z, r%d", a->rd)
>> > +
>> > diff --git a/target/avr/translate.c b/target/avr/translate.c
>> > index fdf4e11f58..0446009d68 100644
>> > --- a/target/avr/translate.c
>> > +++ b/target/avr/translate.c
>> > @@ -3019,6 +3019,17 @@ done_generating:
>> >
>> >      tb->size = (ctx.npc - pc_start) * 2;
>> >      tb->icount = num_insns;
>> > +
>> > +#ifdef DEBUG_DISAS
>> > +    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
>> > +        && qemu_log_in_addr_range(tb->pc)) {
>> > +        qemu_log_lock();
>> > +        qemu_log("IN: %s\n", lookup_symbol(tb->pc));
>> > +        log_target_disas(cs, tb->pc, tb->size);
>> > +        qemu_log("\n");
>> > +        qemu_log_unlock();
>> > +    }
>> > +#endif
>> >  }
>> >
>> >  void restore_state_to_opc(CPUAVRState *env, TranslationBlock *tb,
>> > --
>> > 2.17.2 (Apple Git-113)
>> >
>>
>
>
> --
> Best Regards,
> Michael Rolnik
>

--000000000000777e390598475897
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, November 26, 2019, Michael Rolnik &lt;<a href=3D"mailto=
:mrolnik@gmail.com">mrolnik@gmail.com</a>&gt; wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 26, 2019 at=
 9:52 PM Aleksandar Markovic &lt;<a href=3D"mailto:aleksandar.m.mail@gmail.=
com" target=3D"_blank">aleksandar.m.mail@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Nov 24, 2019 at 6=
:03 AM Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com" target=3D"_b=
lank">mrolnik@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Provide function disassembles executed instruction when `-d in_asm` is=
<br>
&gt; provided<br>
&gt;<br>
&gt; Signed-off-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com"=
 target=3D"_blank">mrolnik@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/avr/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 target/avr/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br=
>
&gt;=C2=A0 target/avr/disas.c=C2=A0 =C2=A0 =C2=A0| 214 ++++++++++++++++++++=
++++++++++<wbr>+++++++++++<br>
&gt;=C2=A0 target/avr/translate.c |=C2=A0 11 +++<br>
&gt;=C2=A0 4 files changed, 227 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 target/avr/disas.c<br>
&gt;<br>
&gt; diff --git a/target/avr/cpu.h b/target/avr/cpu.h<br>
&gt; index ed9218af5f..574118beab 100644<br>
&gt; --- a/target/avr/cpu.h<br>
&gt; +++ b/target/avr/cpu.h<br>
&gt; @@ -157,6 +157,7 @@ bool avr_cpu_exec_interrupt(<wbr>CPUState *cpu, in=
t int_req);<br>
&gt;=C2=A0 hwaddr avr_cpu_get_phys_page_debug(<wbr>CPUState *cpu, vaddr add=
r);<br>
&gt;=C2=A0 int avr_cpu_gdb_read_register(<wbr>CPUState *cpu, uint8_t *buf, =
int reg);<br>
&gt;=C2=A0 int avr_cpu_gdb_write_register(<wbr>CPUState *cpu, uint8_t *buf,=
 int reg);<br>
&gt; +int avr_print_insn(bfd_vma addr, disassemble_info *info);<br>
&gt;<br>
&gt;=C2=A0 static inline int avr_feature(CPUAVRState *env, int feature)<br>
&gt;=C2=A0 {<br>
&gt; diff --git a/target/avr/cpu.c b/target/avr/cpu.c<br>
&gt; index dae56d7845..52ec21dd16 100644<br>
&gt; --- a/target/avr/cpu.c<br>
&gt; +++ b/target/avr/cpu.c<br>
&gt; @@ -83,7 +83,7 @@ static void avr_cpu_reset(CPUState *cs)<br>
&gt;=C2=A0 static void avr_cpu_disas_set_info(<wbr>CPUState *cpu, disassemb=
le_info *info)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 info-&gt;mach =3D bfd_arch_avr;<br>
&gt; -=C2=A0 =C2=A0 info-&gt;print_insn =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 info-&gt;print_insn =3D avr_print_insn;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 static void avr_cpu_realizefn(DeviceState *dev, Error **errp)<br=
>
&gt; diff --git a/target/avr/disas.c b/target/avr/disas.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..727fc463ce<br>
&gt; --- /dev/null<br>
&gt; +++ b/target/avr/disas.c<br>
&gt; @@ -0,0 +1,214 @@<br>
&gt; +/*<br>
&gt; + * OpenRISC disassembler<br>
&gt; + *<br>
&gt; + * Copyright (c) 2018 Richard Henderson &lt;<a href=3D"mailto:rth@twi=
ddle.net" target=3D"_blank">rth@twiddle.net</a>&gt;<br>
&gt; + *<br>
&gt; + * This program is free software: you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License as published =
by<br>
&gt; + * the Free Software Foundation, either version 2 of the License, or<=
br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; + * GNU General Public License for more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License<=
br>
&gt; + * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;<wbr>.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;disas/dis-asm.h&quot;<br>
&gt; +#include &quot;qemu/bitops.h&quot;<br>
&gt; +#include &quot;cpu.h&quot;<br>
&gt; +<br>
&gt; +typedef struct {<br>
&gt; +=C2=A0 =C2=A0 disassemble_info *info;<br>
&gt; +=C2=A0 =C2=A0 uint16_t next_word;<br>
&gt; +=C2=A0 =C2=A0 bool next_word_used;<br>
&gt; +} DisasContext;<br>
&gt; +<br>
&gt; +static int to_A(DisasContext *ctx, int indx) { return 16 + (indx % 16=
); }<br>
&gt; +static int to_B(DisasContext *ctx, int indx) { return 16 + (indx % 8)=
; }<br>
&gt; +static int to_C(DisasContext *ctx, int indx) { return 24 + (indx % 4)=
 * 2; }<br>
&gt; +static int to_D(DisasContext *ctx, int indx) { return (indx % 16) * 2=
; }<br>
&gt; +<br>
<br>
Is there any better way for naming these four function than<br>
meaningless to_A, to_B, to_C, to_D?=C2=A0</blockquote><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
Aleksandar<br></blockquote><div><br></div><div>if you look into insn.decode=
 file you will see the following comment.</div><div>=C2=A0# =C2=A0 A =3D [1=
6 .. 31]<br>=C2=A0# =C2=A0 B =3D [16 .. 23]<br>=C2=A0# =C2=A0 C =3D [24, 26=
, 28, 30]<br>=C2=A0# =C2=A0 D =3D [0, 2, 4, 6, 8, .. 30]<br></div><div><br>=
</div><div>I can call them if you prefer=C2=A0</div><div>A is regs_16_to_31=
_by_one</div><div>B is regs_16_to_23_by_one</div><div>C is regs_24_to_30_by=
_two</div><div>D is regs_00_to_30_by_two</div><div><br></div></div></div></=
blockquote><div><br></div><div>I really like these new names.</div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_=
quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +static uint16_t next_word(DisasContext *ctx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 ctx-&gt;next_word_used =3D true;<br>
&gt; +=C2=A0 =C2=A0 return ctx-&gt;next_word;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int append_16(DisasContext *ctx, int x)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return x &lt;&lt; 16 | next_word(ctx);<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +/* Include the auto-generated decoder.=C2=A0 */<br>
&gt; +static bool decode_insn(DisasContext *ctx, uint16_t insn);<br>
&gt; +#include &quot;decode_insn.inc.c&quot;<br>
&gt; +<br>
&gt; +#define output(mnemonic, format, ...) \<br>
&gt; +=C2=A0 =C2=A0 (pctx-&gt;info-&gt;fprintf_func(<wbr>pctx-&gt;info-&gt;=
stream, &quot;%-9s &quot; format, \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 mnemonic, ##__VA_ARGS__))<br>
&gt; +<br>
&gt; +int avr_print_insn(bfd_vma addr, disassemble_info *info)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 DisasContext ctx;<br>
&gt; +=C2=A0 =C2=A0 DisasContext *pctx =3D &amp;ctx;<br>
&gt; +=C2=A0 =C2=A0 bfd_byte buffer[4];<br>
&gt; +=C2=A0 =C2=A0 uint16_t insn;<br>
&gt; +=C2=A0 =C2=A0 int status;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 <a href=3D"http://ctx.info" rel=3D"noreferrer" target=
=3D"_blank">ctx.info</a> =3D info;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 status =3D info-&gt;read_memory_func(addr, buffer, 4, i=
nfo);<br>
&gt; +=C2=A0 =C2=A0 if (status !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;memory_error_func(<wbr>status, a=
ddr, info);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 insn =3D bfd_getl16(buffer);<br>
&gt; +=C2=A0 =C2=A0 ctx.next_word =3D bfd_getl16(buffer + 2);<br>
&gt; +=C2=A0 =C2=A0 ctx.next_word_used =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!decode_insn(&amp;ctx, insn)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 output(&quot;.db&quot;, &quot;0x%02x, 0x%=
02x&quot;, buffer[0], buffer[1]);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return ctx.next_word_used ? 4 : 2;<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +#define INSN(opcode, format, ...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +static bool trans_##opcode(DisasContext *pctx, arg_##opcode * a)=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 output(#opcode, format, ##__VA_ARGS__);=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 return true;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
&gt; +}<br>
&gt; +<br>
&gt; +#define INSN_MNEMONIC(opcode, mnemonic, format, ...)=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +static bool trans_##opcode(DisasContext *pctx, arg_##opcode * a)=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 output(mnemonic, format, ##__VA_ARGS__);=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 return true;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + *=C2=A0 =C2=A0C=C2=A0 =C2=A0 =C2=A0 =C2=A0Z=C2=A0 =C2=A0 =C2=A0 =C2=
=A0N=C2=A0 =C2=A0 =C2=A0 =C2=A0V=C2=A0 =C2=A0 =C2=A0 =C2=A0S=C2=A0 =C2=A0 =
=C2=A0 =C2=A0H=C2=A0 =C2=A0 =C2=A0 =C2=A0T=C2=A0 =C2=A0 =C2=A0 =C2=A0I<br>
&gt; + *=C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 =C2=
=A02=C2=A0 =C2=A0 =C2=A0 =C2=A03=C2=A0 =C2=A0 =C2=A0 =C2=A04=C2=A0 =C2=A0 =
=C2=A0 =C2=A05=C2=A0 =C2=A0 =C2=A0 =C2=A06=C2=A0 =C2=A0 =C2=A0 =C2=A07<br>
&gt; + */<br>
&gt; +static const char *brbc[] =3D {<br>
&gt; +=C2=A0 =C2=A0 &quot;BRCC&quot;, &quot;BRNE&quot;, &quot;BRPL&quot;, &=
quot;BRVC&quot;, &quot;BRGE&quot;, &quot;BRHC&quot;, &quot;BRTC&quot;, &quo=
t;BRID&quot;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const char *brbs[] =3D {<br>
&gt; +=C2=A0 =C2=A0 &quot;BRCS&quot;, &quot;BREQ&quot;, &quot;BRMI&quot;, &=
quot;BRVS&quot;, &quot;BRLT&quot;, &quot;BRHS&quot;, &quot;BRTS&quot;, &quo=
t;BRIE&quot;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const char *bset[] =3D {<br>
&gt; +=C2=A0 =C2=A0 &quot;SEC&quot;,=C2=A0 &quot;SEZ&quot;,=C2=A0 &quot;SEN=
&quot;,=C2=A0 &quot;SEZ&quot;,=C2=A0 &quot;SES&quot;,=C2=A0 &quot;SEH&quot;=
,=C2=A0 &quot;SET&quot;,=C2=A0 &quot;SEI&quot;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const char *bclr[] =3D {<br>
&gt; +=C2=A0 =C2=A0 &quot;CLC&quot;,=C2=A0 &quot;CLZ&quot;,=C2=A0 &quot;CLN=
&quot;,=C2=A0 &quot;CLZ&quot;,=C2=A0 &quot;CLS&quot;,=C2=A0 &quot;CLH&quot;=
,=C2=A0 &quot;CLT&quot;,=C2=A0 &quot;CLI&quot;<br>
&gt; +};<br>
&gt; +<br>
&gt; +INSN(ADC,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
&gt; +INSN(ADD,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
&gt; +INSN(ADIW,=C2=A0 =C2=A0&quot;r%d:r%r, %d&quot;, a-&gt;rd + 1, a-&gt;r=
d, a-&gt;imm)<br>
&gt; +INSN(AND,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
&gt; +INSN(ANDI,=C2=A0 =C2=A0&quot;r%d, %d&quot;, a-&gt;rd, a-&gt;imm)<br>
&gt; +INSN(ASR,=C2=A0 =C2=A0 &quot;r%d&quot;, a-&gt;rd)<br>
&gt; +INSN_MNEMONIC(BCLR,=C2=A0 bclr[a-&gt;bit], &quot;&quot;)<br>
&gt; +INSN(BLD,=C2=A0 =C2=A0 &quot;r%d, %d&quot;, a-&gt;rd, a-&gt;bit)<br>
&gt; +INSN_MNEMONIC(BRBC,=C2=A0 brbc[a-&gt;bit], &quot;.%+d&quot;, a-&gt;im=
m * 2)<br>
&gt; +INSN_MNEMONIC(BRBS,=C2=A0 brbs[a-&gt;bit], &quot;.%+d&quot;, a-&gt;im=
m * 2)<br>
&gt; +INSN(BREAK,=C2=A0 &quot;&quot;)<br>
&gt; +INSN_MNEMONIC(BSET,=C2=A0 bset[a-&gt;bit], &quot;&quot;)<br>
&gt; +INSN(BST,=C2=A0 =C2=A0 &quot;r%d, %d&quot;, a-&gt;rd, a-&gt;bit)<br>
&gt; +INSN(CALL,=C2=A0 =C2=A0&quot;0x%x&quot;, a-&gt;imm * 2)<br>
&gt; +INSN(CBI,=C2=A0 =C2=A0 &quot;%d, %d&quot;, a-&gt;reg, a-&gt;bit)<br>
&gt; +INSN(COM,=C2=A0 =C2=A0 &quot;r%d&quot;, a-&gt;rd)<br>
&gt; +INSN(CP,=C2=A0 =C2=A0 =C2=A0&quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)=
<br>
&gt; +INSN(CPC,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
&gt; +INSN(CPI,=C2=A0 =C2=A0 &quot;r%d, %d&quot;, a-&gt;rd, a-&gt;imm)<br>
&gt; +INSN(CPSE,=C2=A0 =C2=A0&quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
&gt; +INSN(DEC,=C2=A0 =C2=A0 &quot;r%d&quot;, a-&gt;rd)<br>
&gt; +INSN(DES,=C2=A0 =C2=A0 &quot;%d&quot;, a-&gt;imm)<br>
&gt; +INSN(EICALL, &quot;&quot;)<br>
&gt; +INSN(EIJMP,=C2=A0 &quot;&quot;)<br>
&gt; +INSN(ELPM1,=C2=A0 &quot;&quot;)<br>
&gt; +INSN(ELPM2,=C2=A0 &quot;r%d, Z&quot;, a-&gt;rd)<br>
&gt; +INSN(ELPMX,=C2=A0 &quot;r%d, Z+&quot;, a-&gt;rd)<br>
&gt; +INSN(EOR,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
&gt; +INSN(FMUL,=C2=A0 =C2=A0&quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
&gt; +INSN(FMULS,=C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
&gt; +INSN(FMULSU, &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
&gt; +INSN(ICALL,=C2=A0 &quot;&quot;)<br>
&gt; +INSN(IJMP,=C2=A0 =C2=A0&quot;&quot;)<br>
&gt; +INSN(IN,=C2=A0 =C2=A0 =C2=A0&quot;r%d, $%d&quot;, a-&gt;rd, a-&gt;imm=
)<br>
&gt; +INSN(INC,=C2=A0 =C2=A0 &quot;r%d&quot;, a-&gt;rd)<br>
&gt; +INSN(JMP,=C2=A0 =C2=A0 &quot;0x%x&quot;, a-&gt;imm * 2)<br>
&gt; +INSN(LAC,=C2=A0 =C2=A0 &quot;Z, r%d&quot;, a-&gt;rd)<br>
&gt; +INSN(LAS,=C2=A0 =C2=A0 &quot;Z, r%d&quot;, a-&gt;rd)<br>
&gt; +INSN(LAT,=C2=A0 =C2=A0 &quot;Z, r%d&quot;, a-&gt;rd)<br>
&gt; +INSN(LDDY,=C2=A0 =C2=A0&quot;r%d, Y+%d&quot;, a-&gt;rd, a-&gt;imm)<br=
>
&gt; +INSN(LDDZ,=C2=A0 =C2=A0&quot;r%d, Z+%d&quot;, a-&gt;rd, a-&gt;imm)<br=
>
&gt; +INSN(LDI,=C2=A0 =C2=A0 &quot;r%d, %d&quot;, a-&gt;rd, a-&gt;imm)<br>
&gt; +INSN(LDS,=C2=A0 =C2=A0 &quot;r%d, %d&quot;, a-&gt;rd, a-&gt;imm)<br>
&gt; +INSN(LDX1,=C2=A0 =C2=A0&quot;r%d, X&quot;, a-&gt;rd)<br>
&gt; +INSN(LDX2,=C2=A0 =C2=A0&quot;r%d, X+&quot;, a-&gt;rd)<br>
&gt; +INSN(LDX3,=C2=A0 =C2=A0&quot;r%d, -X&quot;, a-&gt;rd)<br>
&gt; +INSN(LDY2,=C2=A0 =C2=A0&quot;r%d, Y+&quot;, a-&gt;rd)<br>
&gt; +INSN(LDY3,=C2=A0 =C2=A0&quot;r%d, -Y&quot;, a-&gt;rd)<br>
&gt; +INSN(LDZ2,=C2=A0 =C2=A0&quot;r%d, Z+&quot;, a-&gt;rd)<br>
&gt; +INSN(LDZ3,=C2=A0 =C2=A0&quot;r%d, -Z&quot;, a-&gt;rd)<br>
&gt; +INSN(LPM1,=C2=A0 =C2=A0&quot;&quot;)<br>
&gt; +INSN(LPM2,=C2=A0 =C2=A0&quot;r%d, Z&quot;, a-&gt;rd)<br>
&gt; +INSN(LPMX,=C2=A0 =C2=A0&quot;r%d, Z+&quot;, a-&gt;rd)<br>
&gt; +INSN(LSR,=C2=A0 =C2=A0 &quot;r%d&quot;, a-&gt;rd)<br>
&gt; +INSN(MOV,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
&gt; +INSN(MOVW,=C2=A0 =C2=A0&quot;r%d:r%d, r%d,r:r%d&quot;, a-&gt;rd + 1, =
a-&gt;rd, a-&gt;rr + 1, a-&gt;rr)<br>
&gt; +INSN(MUL,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
&gt; +INSN(MULS,=C2=A0 =C2=A0&quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
&gt; +INSN(MULSU,=C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
&gt; +INSN(NEG,=C2=A0 =C2=A0 &quot;r%d&quot;, a-&gt;rd)<br>
&gt; +INSN(NOP,=C2=A0 =C2=A0 &quot;&quot;)<br>
&gt; +INSN(OR,=C2=A0 =C2=A0 =C2=A0&quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)=
<br>
&gt; +INSN(ORI,=C2=A0 =C2=A0 &quot;r%d, %d&quot;, a-&gt;rd, a-&gt;imm)<br>
&gt; +INSN(OUT,=C2=A0 =C2=A0 &quot;$%d, r%d&quot;, a-&gt;imm, a-&gt;rd)<br>
&gt; +INSN(POP,=C2=A0 =C2=A0 &quot;r%d&quot;, a-&gt;rd)<br>
&gt; +INSN(PUSH,=C2=A0 =C2=A0&quot;r%d&quot;, a-&gt;rd)<br>
&gt; +INSN(RCALL,=C2=A0 &quot;.%+d&quot;, a-&gt;imm * 2)<br>
&gt; +INSN(RET,=C2=A0 =C2=A0 &quot;&quot;)<br>
&gt; +INSN(RETI,=C2=A0 =C2=A0&quot;&quot;)<br>
&gt; +INSN(RJMP,=C2=A0 =C2=A0&quot;.%+d&quot;, a-&gt;imm * 2)<br>
&gt; +INSN(ROR,=C2=A0 =C2=A0 &quot;r%d&quot;, a-&gt;rd)<br>
&gt; +INSN(SBC,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
&gt; +INSN(SBCI,=C2=A0 =C2=A0&quot;r%d, %d&quot;, a-&gt;rd, a-&gt;imm)<br>
&gt; +INSN(SBI,=C2=A0 =C2=A0 &quot;$%d, %d&quot;, a-&gt;reg, a-&gt;bit)<br>
&gt; +INSN(SBIC,=C2=A0 =C2=A0&quot;$%d, %d&quot;, a-&gt;reg, a-&gt;bit)<br>
&gt; +INSN(SBIS,=C2=A0 =C2=A0&quot;$%d, %d&quot;, a-&gt;reg, a-&gt;bit)<br>
&gt; +INSN(SBIW,=C2=A0 =C2=A0&quot;r%d:r%d, %d&quot;, a-&gt;rd + 1, a-&gt;r=
d, a-&gt;imm)<br>
&gt; +INSN(SBRC,=C2=A0 =C2=A0&quot;r%d, %d&quot;, a-&gt;rr, a-&gt;bit)<br>
&gt; +INSN(SBRS,=C2=A0 =C2=A0&quot;r%d, %d&quot;, a-&gt;rr, a-&gt;bit)<br>
&gt; +INSN(SLEEP,=C2=A0 &quot;&quot;)<br>
&gt; +INSN(SPM,=C2=A0 =C2=A0 &quot;&quot;)<br>
&gt; +INSN(SPMX,=C2=A0 =C2=A0&quot;Z+&quot;)<br>
&gt; +INSN(STDY,=C2=A0 =C2=A0&quot;r%d, Y+%d&quot;, a-&gt;rd, a-&gt;imm)<br=
>
&gt; +INSN(STDZ,=C2=A0 =C2=A0&quot;r%d, Z+%d&quot;, a-&gt;rd, a-&gt;imm)<br=
>
&gt; +INSN(STS,=C2=A0 =C2=A0 &quot;r%d, %d&quot;, a-&gt;rd, a-&gt;imm)<br>
&gt; +INSN(STX1,=C2=A0 =C2=A0&quot;r%d, X&quot;, a-&gt;rr)<br>
&gt; +INSN(STX2,=C2=A0 =C2=A0&quot;r%d, X+&quot;, a-&gt;rr)<br>
&gt; +INSN(STX3,=C2=A0 =C2=A0&quot;r%d, -X&quot;, a-&gt;rr)<br>
&gt; +INSN(STY2,=C2=A0 =C2=A0&quot;r%d, Y+&quot;, a-&gt;rd)<br>
&gt; +INSN(STY3,=C2=A0 =C2=A0&quot;r%d, -Y&quot;, a-&gt;rd)<br>
&gt; +INSN(STZ2,=C2=A0 =C2=A0&quot;r%d, Z+&quot;, a-&gt;rd)<br>
&gt; +INSN(STZ3,=C2=A0 =C2=A0&quot;r%d, -Z&quot;, a-&gt;rd)<br>
&gt; +INSN(SUB,=C2=A0 =C2=A0 &quot;r%d, r%d&quot;, a-&gt;rd, a-&gt;rr)<br>
&gt; +INSN(SUBI,=C2=A0 =C2=A0&quot;r%d, %d&quot;, a-&gt;rd, a-&gt;imm)<br>
&gt; +INSN(SWAP,=C2=A0 =C2=A0&quot;r%d&quot;, a-&gt;rd)<br>
&gt; +INSN(WDR,=C2=A0 =C2=A0 &quot;&quot;)<br>
&gt; +INSN(XCH,=C2=A0 =C2=A0 &quot;Z, r%d&quot;, a-&gt;rd)<br>
&gt; +<br>
&gt; diff --git a/target/avr/translate.c b/target/avr/translate.c<br>
&gt; index fdf4e11f58..0446009d68 100644<br>
&gt; --- a/target/avr/translate.c<br>
&gt; +++ b/target/avr/translate.c<br>
&gt; @@ -3019,6 +3019,17 @@ done_generating:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tb-&gt;size =3D (ctx.npc - pc_start) * 2;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tb-&gt;icount =3D num_insns;<br>
&gt; +<br>
&gt; +#ifdef DEBUG_DISAS<br>
&gt; +=C2=A0 =C2=A0 if (qemu_loglevel_mask(CPU_LOG_<wbr>TB_IN_ASM)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; qemu_log_in_addr_range(tb-&gt;=
pc)<wbr>) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_lock();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IN: %s\n&quot;, lookup_sym=
bol(tb-&gt;pc));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 log_target_disas(cs, tb-&gt;pc, tb-&gt;si=
ze);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_unlock();<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 void restore_state_to_opc(<wbr>CPUAVRState *env, TranslationBloc=
k *tb,<br>
&gt; --<br>
&gt; 2.17.2 (Apple Git-113)<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
>Best Regards,<br>Michael Rolnik</div></div>
</blockquote>

--000000000000777e390598475897--

