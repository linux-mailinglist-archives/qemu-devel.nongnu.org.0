Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE980109775
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 02:12:49 +0100 (CET)
Received: from localhost ([::1]:49482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZPPM-00081N-QT
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 20:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57722)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iZPNl-0007J4-8p
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 20:11:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iZPNh-0001Qp-VR
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 20:11:08 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38417)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iZPNh-0001QV-OE
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 20:11:05 -0500
Received: by mail-ot1-x342.google.com with SMTP id z25so14429527oti.5
 for <qemu-devel@nongnu.org>; Mon, 25 Nov 2019 17:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=dXLtRat1sNW7UyHmIF/j2xb3hlqxWll83/Jnml7Aw6M=;
 b=iwImLEh07RXGKaGz7r1WdGgXGdHg9/aldTF9k1OVJg6h8UglXFAc72wGMaCYx+K5od
 cV0MQUEhwfqg91TyweOZnvcYquvnM/cwXmRv1XkW94nMYuMCHE2WwUrf1EHicbGJqGo0
 dAydO/DM42EZwilpsZwtVmT4IWXrP2zpApSd32bVVQjy/V5F8tJhM2nUKKHJja8CDcWA
 OTnCJDo5puEofD4rcL1mzGzQnRtGO/+cRHitC4depZR2AeuM6s6WavWwfpJkEeBO9ONc
 qgAE2VXh5jTSqaTo+YZ9+ZWM030k8iE35dS0Q7W0q26h85w4RVhKEneN9Y3GCmae7un4
 xV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=dXLtRat1sNW7UyHmIF/j2xb3hlqxWll83/Jnml7Aw6M=;
 b=lH2eGfqdZGYZi61TAf9dK92l5YW6KHCOQXmC7tGiOLzSqWD5oFJUsCzqZsEhFRzsuT
 rYbDe5o9H1wlnEM0p7cr1/r6ScGabWYbcdwHtE+lPsSQpnjcKDaMmOT9HyidudgpZLQf
 3HUQKzMIxfi6/hbE6/8AEIIpahL2P7SYEN4IyEgb/tEsSmrD2uD4iIz8GDvtolxldQ4b
 akWy2poOlICsqs4KBcECO5mt9RXtPPyHZ1yEMBWl0WMzPjSJ21FQx+yAV7s52e5BHpuf
 N0P9NqVoguYVph/nt8McrhjIYCS1t2OVYWrkicr1/DpQAZj0Ns71WB4fxCh50VXo8k1Y
 /WFw==
X-Gm-Message-State: APjAAAXmvPqedG0qVvVgYFRJpcc9YXgt0TxHrEjmOzJp63vMKNZgsv8u
 +bsxdNu/SFNviTf2sRbRLGdlT1sta2Biy9E0LL4=
X-Google-Smtp-Source: APXvYqxCTzTNnG/TrwVtkbFwDUJc6urcNUvk6JKhOMbybRK6BXuL0Dvw5UTWi+E0jFSSGuH+YYVYwgiY+wYtNBSCD84=
X-Received: by 2002:a05:6830:1383:: with SMTP id
 d3mr475981otq.306.1574730664692; 
 Mon, 25 Nov 2019 17:11:04 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6830:1391:0:0:0:0 with HTTP; Mon, 25 Nov 2019 17:11:04
 -0800 (PST)
In-Reply-To: <20191124050225.30351-11-mrolnik@gmail.com>
References: <20191124050225.30351-1-mrolnik@gmail.com>
 <20191124050225.30351-11-mrolnik@gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Tue, 26 Nov 2019 02:11:04 +0100
Message-ID: <CAL1e-=ji61MH=akB_r95Fgsa=ZvyhQXb7Njfn=PJdbSO+TWhKg@mail.gmail.com>
Subject: Re: [PATCH v36 10/17] target/avr: Add instruction disassembly function
To: Michael Rolnik <mrolnik@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e2cf550598358d3f"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: "dovgaluk@ispras.ru" <dovgaluk@ispras.ru>,
 "thuth@redhat.com" <thuth@redhat.com>, "philmd@redhat.com" <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e2cf550598358d3f
Content-Type: text/plain; charset="UTF-8"

On Sunday, November 24, 2019, Michael Rolnik <mrolnik@gmail.com> wrote:

> Provide function disassembles executed instruction when `-d in_asm` is
> provided
>
> Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
> ---


Richard, is this what you expected from Michael, or there are still some
caveats?

Thanks for the suggestion!

Aleksandar

 target/avr/cpu.h       |   1 +
>  target/avr/cpu.c       |   2 +-
>  target/avr/disas.c     | 214 +++++++++++++++++++++++++++++++++++++++++
>  target/avr/translate.c |  11 +++
>  4 files changed, 227 insertions(+), 1 deletion(-)
>  create mode 100644 target/avr/disas.c
>
> diff --git a/target/avr/cpu.h b/target/avr/cpu.h
> index ed9218af5f..574118beab 100644
> --- a/target/avr/cpu.h
> +++ b/target/avr/cpu.h
> @@ -157,6 +157,7 @@ bool avr_cpu_exec_interrupt(CPUState *cpu, int
> int_req);
>  hwaddr avr_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int avr_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> +int avr_print_insn(bfd_vma addr, disassemble_info *info);
>
>  static inline int avr_feature(CPUAVRState *env, int feature)
>  {
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index dae56d7845..52ec21dd16 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -83,7 +83,7 @@ static void avr_cpu_reset(CPUState *cs)
>  static void avr_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
>  {
>      info->mach = bfd_arch_avr;
> -    info->print_insn = NULL;
> +    info->print_insn = avr_print_insn;
>  }
>
>  static void avr_cpu_realizefn(DeviceState *dev, Error **errp)
> diff --git a/target/avr/disas.c b/target/avr/disas.c
> new file mode 100644
> index 0000000000..727fc463ce
> --- /dev/null
> +++ b/target/avr/disas.c
> @@ -0,0 +1,214 @@
> +/*
> + * OpenRISC disassembler
> + *
> + * Copyright (c) 2018 Richard Henderson <rth@twiddle.net>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "disas/dis-asm.h"
> +#include "qemu/bitops.h"
> +#include "cpu.h"
> +
> +typedef struct {
> +    disassemble_info *info;
> +    uint16_t next_word;
> +    bool next_word_used;
> +} DisasContext;
> +
> +static int to_A(DisasContext *ctx, int indx) { return 16 + (indx % 16); }
> +static int to_B(DisasContext *ctx, int indx) { return 16 + (indx % 8); }
> +static int to_C(DisasContext *ctx, int indx) { return 24 + (indx % 4) *
> 2; }
> +static int to_D(DisasContext *ctx, int indx) { return (indx % 16) * 2; }
> +
> +static uint16_t next_word(DisasContext *ctx)
> +{
> +    ctx->next_word_used = true;
> +    return ctx->next_word;
> +}
> +
> +static int append_16(DisasContext *ctx, int x)
> +{
> +    return x << 16 | next_word(ctx);
> +}
> +
> +
> +/* Include the auto-generated decoder.  */
> +static bool decode_insn(DisasContext *ctx, uint16_t insn);
> +#include "decode_insn.inc.c"
> +
> +#define output(mnemonic, format, ...) \
> +    (pctx->info->fprintf_func(pctx->info->stream, "%-9s " format, \
> +                        mnemonic, ##__VA_ARGS__))
> +
> +int avr_print_insn(bfd_vma addr, disassemble_info *info)
> +{
> +    DisasContext ctx;
> +    DisasContext *pctx = &ctx;
> +    bfd_byte buffer[4];
> +    uint16_t insn;
> +    int status;
> +
> +    ctx.info = info;
> +
> +    status = info->read_memory_func(addr, buffer, 4, info);
> +    if (status != 0) {
> +        info->memory_error_func(status, addr, info);
> +        return -1;
> +    }
> +    insn = bfd_getl16(buffer);
> +    ctx.next_word = bfd_getl16(buffer + 2);
> +    ctx.next_word_used = false;
> +
> +    if (!decode_insn(&ctx, insn)) {
> +        output(".db", "0x%02x, 0x%02x", buffer[0], buffer[1]);
> +    }
> +
> +    return ctx.next_word_used ? 4 : 2;
> +}
> +
> +
> +#define INSN(opcode, format, ...)                                       \
> +static bool trans_##opcode(DisasContext *pctx, arg_##opcode * a)        \
> +{                                                                       \
> +    output(#opcode, format, ##__VA_ARGS__);                             \
> +    return true;                                                        \
> +}
> +
> +#define INSN_MNEMONIC(opcode, mnemonic, format, ...)                    \
> +static bool trans_##opcode(DisasContext *pctx, arg_##opcode * a)        \
> +{                                                                       \
> +    output(mnemonic, format, ##__VA_ARGS__);                            \
> +    return true;                                                        \
> +}
> +
> +/*
> + *   C       Z       N       V       S       H       T       I
> + *   0       1       2       3       4       5       6       7
> + */
> +static const char *brbc[] = {
> +    "BRCC", "BRNE", "BRPL", "BRVC", "BRGE", "BRHC", "BRTC", "BRID"
> +};
> +
> +static const char *brbs[] = {
> +    "BRCS", "BREQ", "BRMI", "BRVS", "BRLT", "BRHS", "BRTS", "BRIE"
> +};
> +
> +static const char *bset[] = {
> +    "SEC",  "SEZ",  "SEN",  "SEZ",  "SES",  "SEH",  "SET",  "SEI"
> +};
> +
> +static const char *bclr[] = {
> +    "CLC",  "CLZ",  "CLN",  "CLZ",  "CLS",  "CLH",  "CLT",  "CLI"
> +};
> +
> +INSN(ADC,    "r%d, r%d", a->rd, a->rr)
> +INSN(ADD,    "r%d, r%d", a->rd, a->rr)
> +INSN(ADIW,   "r%d:r%r, %d", a->rd + 1, a->rd, a->imm)
> +INSN(AND,    "r%d, r%d", a->rd, a->rr)
> +INSN(ANDI,   "r%d, %d", a->rd, a->imm)
> +INSN(ASR,    "r%d", a->rd)
> +INSN_MNEMONIC(BCLR,  bclr[a->bit], "")
> +INSN(BLD,    "r%d, %d", a->rd, a->bit)
> +INSN_MNEMONIC(BRBC,  brbc[a->bit], ".%+d", a->imm * 2)
> +INSN_MNEMONIC(BRBS,  brbs[a->bit], ".%+d", a->imm * 2)
> +INSN(BREAK,  "")
> +INSN_MNEMONIC(BSET,  bset[a->bit], "")
> +INSN(BST,    "r%d, %d", a->rd, a->bit)
> +INSN(CALL,   "0x%x", a->imm * 2)
> +INSN(CBI,    "%d, %d", a->reg, a->bit)
> +INSN(COM,    "r%d", a->rd)
> +INSN(CP,     "r%d, r%d", a->rd, a->rr)
> +INSN(CPC,    "r%d, r%d", a->rd, a->rr)
> +INSN(CPI,    "r%d, %d", a->rd, a->imm)
> +INSN(CPSE,   "r%d, r%d", a->rd, a->rr)
> +INSN(DEC,    "r%d", a->rd)
> +INSN(DES,    "%d", a->imm)
> +INSN(EICALL, "")
> +INSN(EIJMP,  "")
> +INSN(ELPM1,  "")
> +INSN(ELPM2,  "r%d, Z", a->rd)
> +INSN(ELPMX,  "r%d, Z+", a->rd)
> +INSN(EOR,    "r%d, r%d", a->rd, a->rr)
> +INSN(FMUL,   "r%d, r%d", a->rd, a->rr)
> +INSN(FMULS,  "r%d, r%d", a->rd, a->rr)
> +INSN(FMULSU, "r%d, r%d", a->rd, a->rr)
> +INSN(ICALL,  "")
> +INSN(IJMP,   "")
> +INSN(IN,     "r%d, $%d", a->rd, a->imm)
> +INSN(INC,    "r%d", a->rd)
> +INSN(JMP,    "0x%x", a->imm * 2)
> +INSN(LAC,    "Z, r%d", a->rd)
> +INSN(LAS,    "Z, r%d", a->rd)
> +INSN(LAT,    "Z, r%d", a->rd)
> +INSN(LDDY,   "r%d, Y+%d", a->rd, a->imm)
> +INSN(LDDZ,   "r%d, Z+%d", a->rd, a->imm)
> +INSN(LDI,    "r%d, %d", a->rd, a->imm)
> +INSN(LDS,    "r%d, %d", a->rd, a->imm)
> +INSN(LDX1,   "r%d, X", a->rd)
> +INSN(LDX2,   "r%d, X+", a->rd)
> +INSN(LDX3,   "r%d, -X", a->rd)
> +INSN(LDY2,   "r%d, Y+", a->rd)
> +INSN(LDY3,   "r%d, -Y", a->rd)
> +INSN(LDZ2,   "r%d, Z+", a->rd)
> +INSN(LDZ3,   "r%d, -Z", a->rd)
> +INSN(LPM1,   "")
> +INSN(LPM2,   "r%d, Z", a->rd)
> +INSN(LPMX,   "r%d, Z+", a->rd)
> +INSN(LSR,    "r%d", a->rd)
> +INSN(MOV,    "r%d, r%d", a->rd, a->rr)
> +INSN(MOVW,   "r%d:r%d, r%d,r:r%d", a->rd + 1, a->rd, a->rr + 1, a->rr)
> +INSN(MUL,    "r%d, r%d", a->rd, a->rr)
> +INSN(MULS,   "r%d, r%d", a->rd, a->rr)
> +INSN(MULSU,  "r%d, r%d", a->rd, a->rr)
> +INSN(NEG,    "r%d", a->rd)
> +INSN(NOP,    "")
> +INSN(OR,     "r%d, r%d", a->rd, a->rr)
> +INSN(ORI,    "r%d, %d", a->rd, a->imm)
> +INSN(OUT,    "$%d, r%d", a->imm, a->rd)
> +INSN(POP,    "r%d", a->rd)
> +INSN(PUSH,   "r%d", a->rd)
> +INSN(RCALL,  ".%+d", a->imm * 2)
> +INSN(RET,    "")
> +INSN(RETI,   "")
> +INSN(RJMP,   ".%+d", a->imm * 2)
> +INSN(ROR,    "r%d", a->rd)
> +INSN(SBC,    "r%d, r%d", a->rd, a->rr)
> +INSN(SBCI,   "r%d, %d", a->rd, a->imm)
> +INSN(SBI,    "$%d, %d", a->reg, a->bit)
> +INSN(SBIC,   "$%d, %d", a->reg, a->bit)
> +INSN(SBIS,   "$%d, %d", a->reg, a->bit)
> +INSN(SBIW,   "r%d:r%d, %d", a->rd + 1, a->rd, a->imm)
> +INSN(SBRC,   "r%d, %d", a->rr, a->bit)
> +INSN(SBRS,   "r%d, %d", a->rr, a->bit)
> +INSN(SLEEP,  "")
> +INSN(SPM,    "")
> +INSN(SPMX,   "Z+")
> +INSN(STDY,   "r%d, Y+%d", a->rd, a->imm)
> +INSN(STDZ,   "r%d, Z+%d", a->rd, a->imm)
> +INSN(STS,    "r%d, %d", a->rd, a->imm)
> +INSN(STX1,   "r%d, X", a->rr)
> +INSN(STX2,   "r%d, X+", a->rr)
> +INSN(STX3,   "r%d, -X", a->rr)
> +INSN(STY2,   "r%d, Y+", a->rd)
> +INSN(STY3,   "r%d, -Y", a->rd)
> +INSN(STZ2,   "r%d, Z+", a->rd)
> +INSN(STZ3,   "r%d, -Z", a->rd)
> +INSN(SUB,    "r%d, r%d", a->rd, a->rr)
> +INSN(SUBI,   "r%d, %d", a->rd, a->imm)
> +INSN(SWAP,   "r%d", a->rd)
> +INSN(WDR,    "")
> +INSN(XCH,    "Z, r%d", a->rd)
> +
> diff --git a/target/avr/translate.c b/target/avr/translate.c
> index fdf4e11f58..0446009d68 100644
> --- a/target/avr/translate.c
> +++ b/target/avr/translate.c
> @@ -3019,6 +3019,17 @@ done_generating:
>
>      tb->size = (ctx.npc - pc_start) * 2;
>      tb->icount = num_insns;
> +
> +#ifdef DEBUG_DISAS
> +    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
> +        && qemu_log_in_addr_range(tb->pc)) {
> +        qemu_log_lock();
> +        qemu_log("IN: %s\n", lookup_symbol(tb->pc));
> +        log_target_disas(cs, tb->pc, tb->size);
> +        qemu_log("\n");
> +        qemu_log_unlock();
> +    }
> +#endif
>  }
>
>  void restore_state_to_opc(CPUAVRState *env, TranslationBlock *tb,
> --
> 2.17.2 (Apple Git-113)
>
>

--000000000000e2cf550598358d3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Sunday, November 24, 2019, Michael Rolnik &lt;<a href=3D"mailto:=
mrolnik@gmail.com">mrolnik@gmail.com</a>&gt; wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">Provide function disassembles executed instruction when `-d in_a=
sm` is<br>
provided<br>
<br>
Signed-off-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com">mrol=
nik@gmail.com</a>&gt;<br>
---</blockquote><div><br></div><div>Richard, is this what you expected from=
 Michael, or there are still some caveats?</div><div><br></div><div>Thanks =
for the suggestion!</div><div><br></div><div>Aleksandar</div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
=C2=A0target/avr/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0target/avr/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0target/avr/disas.c=C2=A0 =C2=A0 =C2=A0| 214 +++++++++++++++++++++++++=
+++++<wbr>+++++++++++<br>
=C2=A0target/avr/translate.c |=C2=A0 11 +++<br>
=C2=A04 files changed, 227 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 target/avr/disas.c<br>
<br>
diff --git a/target/avr/cpu.h b/target/avr/cpu.h<br>
index ed9218af5f..574118beab 100644<br>
--- a/target/avr/cpu.h<br>
+++ b/target/avr/cpu.h<br>
@@ -157,6 +157,7 @@ bool avr_cpu_exec_interrupt(<wbr>CPUState *cpu, int int=
_req);<br>
=C2=A0hwaddr avr_cpu_get_phys_page_debug(<wbr>CPUState *cpu, vaddr addr);<b=
r>
=C2=A0int avr_cpu_gdb_read_register(<wbr>CPUState *cpu, uint8_t *buf, int r=
eg);<br>
=C2=A0int avr_cpu_gdb_write_register(<wbr>CPUState *cpu, uint8_t *buf, int =
reg);<br>
+int avr_print_insn(bfd_vma addr, disassemble_info *info);<br>
<br>
=C2=A0static inline int avr_feature(CPUAVRState *env, int feature)<br>
=C2=A0{<br>
diff --git a/target/avr/cpu.c b/target/avr/cpu.c<br>
index dae56d7845..52ec21dd16 100644<br>
--- a/target/avr/cpu.c<br>
+++ b/target/avr/cpu.c<br>
@@ -83,7 +83,7 @@ static void avr_cpu_reset(CPUState *cs)<br>
=C2=A0static void avr_cpu_disas_set_info(<wbr>CPUState *cpu, disassemble_in=
fo *info)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0info-&gt;mach =3D bfd_arch_avr;<br>
-=C2=A0 =C2=A0 info-&gt;print_insn =3D NULL;<br>
+=C2=A0 =C2=A0 info-&gt;print_insn =3D avr_print_insn;<br>
=C2=A0}<br>
<br>
=C2=A0static void avr_cpu_realizefn(DeviceState *dev, Error **errp)<br>
diff --git a/target/avr/disas.c b/target/avr/disas.c<br>
new file mode 100644<br>
index 0000000000..727fc463ce<br>
--- /dev/null<br>
+++ b/target/avr/disas.c<br>
@@ -0,0 +1,214 @@<br>
+/*<br>
+ * OpenRISC disassembler<br>
+ *<br>
+ * Copyright (c) 2018 Richard Henderson &lt;<a href=3D"mailto:rth@twiddle.=
net">rth@twiddle.net</a>&gt;<br>
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
u.org/licenses/" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;<wbr=
>.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;disas/dis-asm.h&quot;<br>
+#include &quot;qemu/bitops.h&quot;<br>
+#include &quot;cpu.h&quot;<br>
+<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 disassemble_info *info;<br>
+=C2=A0 =C2=A0 uint16_t next_word;<br>
+=C2=A0 =C2=A0 bool next_word_used;<br>
+} DisasContext;<br>
+<br>
+static int to_A(DisasContext *ctx, int indx) { return 16 + (indx % 16); }<=
br>
+static int to_B(DisasContext *ctx, int indx) { return 16 + (indx % 8); }<b=
r>
+static int to_C(DisasContext *ctx, int indx) { return 24 + (indx % 4) * 2;=
 }<br>
+static int to_D(DisasContext *ctx, int indx) { return (indx % 16) * 2; }<b=
r>
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
+=C2=A0 =C2=A0 (pctx-&gt;info-&gt;fprintf_func(<wbr>pctx-&gt;info-&gt;strea=
m, &quot;%-9s &quot; format, \<br>
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
+=C2=A0 =C2=A0 <a href=3D"http://ctx.info" target=3D"_blank">ctx.info</a> =
=3D info;<br>
+<br>
+=C2=A0 =C2=A0 status =3D info-&gt;read_memory_func(addr, buffer, 4, info);=
<br>
+=C2=A0 =C2=A0 if (status !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;memory_error_func(<wbr>status, addr, =
info);<br>
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
+}<br>
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
+INSN(ADIW,=C2=A0 =C2=A0&quot;r%d:r%r, %d&quot;, a-&gt;rd + 1, a-&gt;rd, a-=
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
index fdf4e11f58..0446009d68 100644<br>
--- a/target/avr/translate.c<br>
+++ b/target/avr/translate.c<br>
@@ -3019,6 +3019,17 @@ done_generating:<br>
<br>
=C2=A0 =C2=A0 =C2=A0tb-&gt;size =3D (ctx.npc - pc_start) * 2;<br>
=C2=A0 =C2=A0 =C2=A0tb-&gt;icount =3D num_insns;<br>
+<br>
+#ifdef DEBUG_DISAS<br>
+=C2=A0 =C2=A0 if (qemu_loglevel_mask(CPU_LOG_<wbr>TB_IN_ASM)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; qemu_log_in_addr_range(tb-&gt;pc)<w=
br>) {<br>
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
=C2=A0void restore_state_to_opc(<wbr>CPUAVRState *env, TranslationBlock *tb=
,<br>
-- <br>
2.17.2 (Apple Git-113)<br>
<br>
</blockquote>

--000000000000e2cf550598358d3f--

