Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E92C117614
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 20:45:38 +0100 (CET)
Received: from localhost ([::1]:45612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieOyO-0007nt-UF
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 14:45:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37346)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ieOxN-0007Ns-8C
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 14:44:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ieOxK-0001j6-GU
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 14:44:33 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41895)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1ieOxK-0001i2-6x
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 14:44:30 -0500
Received: by mail-oi1-x244.google.com with SMTP id i1so7458933oie.8
 for <qemu-devel@nongnu.org>; Mon, 09 Dec 2019 11:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=53WsohzbrAQYGITT1s/glR+i+zCZVAGLLNV34Z85qRk=;
 b=MsF/dla/I0es4atYpalSIcUeisoNvDxIyNcCmXSbjKS4Va4dnoOvitjDM3i/pnbmw8
 EsROMh0QNZ6IKqltbVUqfBB/BMuBRYkbvE+jJ76wxFfTPLEmoEJU3l9tKzUUdW5AR67c
 4VN5jyywJg25y+mUhDdlksC/d8g9bW/Qym4939oG44wFdjea46a1cQi1aYTOdDH1RXiY
 ZL2GEarJaU9MjhNTzImtfTzLg5bheEEIaBDmXRhlRvN3ZtG2aVJougTQuhcof1OlBSp1
 zNZ7WDEJNP2ria5TpXebvoc1Vfi5m+bVv013pW9G042LbcJHbOq+ufU7ZPfIT8uu/Pk2
 E+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=53WsohzbrAQYGITT1s/glR+i+zCZVAGLLNV34Z85qRk=;
 b=PVoR8K2zXfI2GDpDH1Iv1Ya3BWEDEDO3qfVi1MTHGs1fRaqeIxQme1HBDVhHuB6Ah/
 AUU0d+kvkdOAYj9XEbr4NSgEbKtPHDTxwNCebXa+34G5CuPov0iuI9Jk+hOowjVrQrEn
 HmnqqVrP8AIGWTKAAef0dCrfwVqUFprKMJU4EDJUVonzBT5pVy5On5EceQFwUtwYjyPo
 pg3wLb3KmqCq3n1WnJhkL9KP0PD4CziX4Jolr04SrlY1o6ouy5w1Y/n3rvWLGF7IHovU
 Y0gV3gOmbsH+TE6jpnaDc+GN5R7EOAJiBYtRp0YUI1adq3uVfZ1Izm26PbDWEHNwN2Oh
 BIcg==
X-Gm-Message-State: APjAAAVSsr9Gz7XLuuucDVX4MVAlXZrLWW5iG/Gyw0tsh1MAMVjlS8lI
 H3brVaqui3VHIt9iU63+pJdHLq7op1WhQlPNQuw=
X-Google-Smtp-Source: APXvYqzFrkUNUzLjc3eu+ZEQSscognwQ97PZ6KwUFssZCsLOeGRKYw/OssAOWISmWTThiaqZ1Jb2Vj7sGIvu4XJASpc=
X-Received: by 2002:a05:6808:98b:: with SMTP id
 a11mr747555oic.62.1575920669224; 
 Mon, 09 Dec 2019 11:44:29 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:d21:0:0:0:0:0 with HTTP;
 Mon, 9 Dec 2019 11:44:28 -0800 (PST)
In-Reply-To: <CAL1e-=gVU=859cTNH52d0AYsP2q6Sq_fFWVFRuJOya+FYKEqcQ@mail.gmail.com>
References: <20191208183922.13757-1-mrolnik@gmail.com>
 <20191208183922.13757-4-mrolnik@gmail.com>
 <CAL1e-=gVU=859cTNH52d0AYsP2q6Sq_fFWVFRuJOya+FYKEqcQ@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Mon, 9 Dec 2019 20:44:28 +0100
Message-ID: <CAL1e-=gN1nWi3L1cqM-p8+TntRB27+qNzYve84W=S9VW0Yyt1Q@mail.gmail.com>
Subject: Re: [PATCH v38 03/22] target/avr: Add instruction decoding
To: Michael Rolnik <mrolnik@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000aef49905994a9f3f"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dovgaluk@ispras.ru" <dovgaluk@ispras.ru>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000aef49905994a9f3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Monday, December 9, 2019, Aleksandar Markovic <
aleksandar.m.mail@gmail.com> wrote:

>
>
> On Sunday, December 8, 2019, Michael Rolnik <mrolnik@gmail.com> wrote:
>
>> This includes:
>> - encoding of all 16 bit instructions
>> - encoding of all 32 bit instructions
>>
>> Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
>> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  target/avr/insn.decode | 194 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 194 insertions(+)
>>  create mode 100644 target/avr/insn.decode
>>
>>
> Hi, Michael,
>
> Could you please reorder decoding definitions in this file following this
> pattern:
>
> #
> # Arithmetic Instructions
> #
>
> < their decoding definitions in the order they appear in the ISA doc >
>
> #
> target/avr: Add instruction translation - Branch Instructions
> #
>

copu-paste error. I meant:


# Branch Instructions
>
#
>

If you refactor the file this way, it will be much easier to inspect the
code, and also to add changes in case of future versions of AVR ISA - the
file would look much tidier.

Take care,
Aleksandar


> < their decoding definitions in the order they appear in the ISA doc >
>
> #
> # Data Transfer Instructions
> #
>
> < their decoding definitions in the order they appear in the ISA doc >
>
> #
> # Bit and Bit-test Instructions
> #
>
> < their decoding definitions in the order they appear in the ISA doc >
>
> #
> # MCU Control Instructions
> #
>
> < their decoding definitions in the order they appear in the ISA doc >
>
>
>
> Thanks in advance!
>
> Aleksandar
>
>
>
>
>
>
>> diff --git a/target/avr/insn.decode b/target/avr/insn.decode
>> new file mode 100644
>> index 0000000000..2eb6de692a
>> --- /dev/null
>> +++ b/target/avr/insn.decode
>> @@ -0,0 +1,194 @@
>> +#
>> +# AVR instruction decode definitions.
>> +#
>> +# Copyright (c) 2019 Michael Rolnik <mrolnik@gmail.com>
>> +#
>> +# This library is free software; you can redistribute it and/or
>> +# modify it under the terms of the GNU Lesser General Public
>> +# License as published by the Free Software Foundation; either
>> +# version 2.1 of the License, or (at your option) any later version.
>> +#
>> +# This library is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> +# Lesser General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU Lesser General Public
>> +# License along with this library; if not, see <
>> http://www.gnu.org/licenses/>.
>> +#
>> +
>> +#
>> +#   regs_16_31_by_one =3D [16 .. 31]
>> +#   regs_16_23_by_one =3D [16 .. 23]
>> +#   regs_24_30_by_two =3D [24, 26, 28, 30]
>> +#   regs_00_30_by_two =3D [0, 2, 4, 6, 8, .. 30]
>> +
>> +%rd             4:5
>> +%rr             9:1 0:4
>> +
>> +&rd_rr          rd rr
>> +&rd_imm         rd imm
>> +
>> +@op_rd_rr       .... .. . ..... ....        &rd_rr      rd=3D%rd rr=3D%=
rr
>> +ADD             0000 11 . ..... ....        @op_rd_rr
>> +ADC             0001 11 . ..... ....        @op_rd_rr
>> +AND             0010 00 . ..... ....        @op_rd_rr
>> +CP              0001 01 . ..... ....        @op_rd_rr
>> +CPC             0000 01 . ..... ....        @op_rd_rr
>> +CPSE            0001 00 . ..... ....        @op_rd_rr
>> +EOR             0010 01 . ..... ....        @op_rd_rr
>> +MOV             0010 11 . ..... ....        @op_rd_rr
>> +MUL             1001 11 . ..... ....        @op_rd_rr
>> +OR              0010 10 . ..... ....        @op_rd_rr
>> +SBC             0000 10 . ..... ....        @op_rd_rr
>> +SUB             0001 10 . ..... ....        @op_rd_rr
>> +
>> +
>> +%rd_c           4:2                         !function=3Dto_regs_24_30_b=
y_
>> two
>> +%imm6           6:2 0:4
>> +
>> +@op_rd_imm6     .... .... .. .. ....        &rd_imm     rd=3D%rd_c
>> imm=3D%imm6
>> +ADIW            1001 0110 .. .. ....        @op_rd_imm6
>> +SBIW            1001 0111 .. .. ....        @op_rd_imm6
>> +
>> +
>> +%rd_a           4:4                         !function=3Dto_regs_16_31_b=
y_
>> one
>> +%rr_a           0:4                         !function=3Dto_regs_16_31_b=
y_
>> one
>> +%rd_d           4:4                         !function=3Dto_regs_00_30_b=
y_
>> two
>> +%rr_d           0:4                         !function=3Dto_regs_00_30_b=
y_
>> two
>> +%imm8           8:4 0:4
>> +
>> +@op_rd_imm8     .... .... .... ....         &rd_imm     rd=3D%rd_a
>> imm=3D%imm8
>> +ANDI            0111 .... .... ....         @op_rd_imm8
>> +CPI             0011 .... .... ....         @op_rd_imm8
>> +LDI             1110 .... .... ....         @op_rd_imm8
>> +ORI             0110 .... .... ....         @op_rd_imm8
>> +SBCI            0100 .... .... ....         @op_rd_imm8
>> +SUBI            0101 .... .... ....         @op_rd_imm8
>> +
>> +
>> +@op_rd          .... ... rd:5 ....
>> +ASR             1001 010 ..... 0101         @op_rd
>> +COM             1001 010 ..... 0000         @op_rd
>> +DEC             1001 010 ..... 1010         @op_rd
>> +ELPM2           1001 000 ..... 0110         @op_rd
>> +ELPMX           1001 000 ..... 0111         @op_rd
>> +INC             1001 010 ..... 0011         @op_rd
>> +LDX1            1001 000 ..... 1100         @op_rd
>> +LDX2            1001 000 ..... 1101         @op_rd
>> +LDX3            1001 000 ..... 1110         @op_rd
>> +LDY2            1001 000 ..... 1001         @op_rd
>> +LDY3            1001 000 ..... 1010         @op_rd
>> +LDZ2            1001 000 ..... 0001         @op_rd
>> +LDZ3            1001 000 ..... 0010         @op_rd
>> +LPM2            1001 000 ..... 0100         @op_rd
>> +LPMX            1001 000 ..... 0101         @op_rd
>> +LSR             1001 010 ..... 0110         @op_rd
>> +NEG             1001 010 ..... 0001         @op_rd
>> +POP             1001 000 ..... 1111         @op_rd
>> +PUSH            1001 001 ..... 1111         @op_rd
>> +ROR             1001 010 ..... 0111         @op_rd
>> +STY2            1001 001 ..... 1001         @op_rd
>> +STY3            1001 001 ..... 1010         @op_rd
>> +STZ2            1001 001 ..... 0001         @op_rd
>> +STZ3            1001 001 ..... 0010         @op_rd
>> +SWAP            1001 010 ..... 0010         @op_rd
>> +
>> +
>> +@op_bit         .... .... . bit:3 ....
>> +BCLR            1001 0100 1 ... 1000        @op_bit
>> +BSET            1001 0100 0 ... 1000        @op_bit
>> +
>> +
>> +@op_rd_bit      .... ... rd:5 . bit:3
>> +BLD             1111 100 ..... 0 ...        @op_rd_bit
>> +BST             1111 101 ..... 0 ...        @op_rd_bit
>> +
>> +
>> +@op_bit_imm     .... .. imm:s7 bit:3
>> +BRBC            1111 01 ....... ...         @op_bit_imm
>> +BRBS            1111 00 ....... ...         @op_bit_imm
>> +
>> +
>> +BREAK           1001 0101 1001 1000
>> +EICALL          1001 0101 0001 1001
>> +EIJMP           1001 0100 0001 1001
>> +ELPM1           1001 0101 1101 1000
>> +ICALL           1001 0101 0000 1001
>> +IJMP            1001 0100 0000 1001
>> +LPM1            1001 0101 1100 1000
>> +NOP             0000 0000 0000 0000
>> +RET             1001 0101 0000 1000
>> +RETI            1001 0101 0001 1000
>> +SLEEP           1001 0101 1000 1000
>> +SPM             1001 0101 1110 1000
>> +SPMX            1001 0101 1111 1000
>> +WDR             1001 0101 1010 1000
>> +
>> +
>> +@op_reg_bit     .... .... reg:5 bit:3
>> +CBI             1001 1000 ..... ...         @op_reg_bit
>> +SBI             1001 1010 ..... ...         @op_reg_bit
>> +SBIC            1001 1001 ..... ...         @op_reg_bit
>> +SBIS            1001 1011 ..... ...         @op_reg_bit
>> +
>> +
>> +DES             1001 0100 imm:4 1011
>> +
>> +
>> +%rd_b           4:3                         !function=3Dto_regs_16_23_b=
y_
>> one
>> +%rr_b           0:3                         !function=3Dto_regs_16_23_b=
y_
>> one
>> +@fmul           .... .... . ... . ...       &rd_rr      rd=3D%rd_b rr=
=3D%rr_b
>> +FMUL            0000 0011 0 ... 1 ...       @fmul
>> +FMULS           0000 0011 1 ... 0 ...       @fmul
>> +FMULSU          0000 0011 1 ... 1 ...       @fmul
>> +MULSU           0000 0011 0 ... 0 ...       @fmul
>> +
>> +
>> +%io_imm         9:2 0:4
>> +@io_rd_imm      .... . .. ..... ....        &rd_imm     rd=3D%rd
>> imm=3D%io_imm
>> +IN              1011 0 .. ..... ....        @io_rd_imm
>> +OUT             1011 1 .. ..... ....        @io_rd_imm
>> +
>> +
>> +XCH             1001 001 rd:5 0100
>> +LAC             1001 001 rd:5 0110
>> +LAS             1001 001 rd:5 0101
>> +LAT             1001 001 rd:5 0111
>> +STX1            1001 001 rr:5 1100
>> +STX2            1001 001 rr:5 1101
>> +STX3            1001 001 rr:5 1110
>> +
>> +
>> +%ldst_d_imm     13:1 10:2 0:3
>> +@ldst_d         .. . . .. . rd:5  . ...     &rd_imm     imm=3D%ldst_d_i=
mm
>> +LDDY            10 . 0 .. 0 ..... 1 ...     @ldst_d
>> +LDDZ            10 . 0 .. 0 ..... 0 ...     @ldst_d
>> +STDY            10 . 0 .. 1 ..... 1 ...     @ldst_d
>> +STDZ            10 . 0 .. 1 ..... 0 ...     @ldst_d
>> +
>> +
>> +MOVW            0000 0001 .... ....         &rd_rr      rd=3D%rd_d rr=
=3D%rr_d
>> +MULS            0000 0010 .... ....         &rd_rr      rd=3D%rd_a rr=
=3D%rr_a
>> +
>> +RCALL           1101 imm:s12
>> +RJMP            1100 imm:s12
>> +
>> +SBRC            1111 110 rr:5 0 bit:3
>> +SBRS            1111 111 rr:5 0 bit:3
>> +
>> +# The 22-bit immediate is partially in the opcode word,
>> +# and partially in the next.  Use append_16 to build the
>> +# complete 22-bit value.
>> +%imm_call       4:5 0:1                     !function=3Dappend_16
>> +CALL            1001 010 ..... 111 .        imm=3D%imm_call
>> +JMP             1001 010 ..... 110 .        imm=3D%imm_call
>> +
>> +
>> +# The 16-bit immediate is completely in the next word.
>> +# Fields cannot be defined with no bits, so we cannot play
>> +# the same trick and append to a zero-bit value.
>> +# Defer reading the immediate until trans_{LDS,STS}.
>> +@ldst_s         .... ... rd:5 ....          imm=3D0
>> +LDS             1001 000 ..... 0000         @ldst_s
>> +STS             1001 001 ..... 0000         @ldst_s
>> --
>> 2.17.2 (Apple Git-113)
>>
>>

--000000000000aef49905994a9f3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, December 9, 2019, Aleksandar Markovic &lt;<a href=3D"mai=
lto:aleksandar.m.mail@gmail.com">aleksandar.m.mail@gmail.com</a>&gt; wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><br><br>On Sunday, December 8, 2019, Mic=
hael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com" target=3D"_blank">mrol=
nik@gmail.com</a>&gt; wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This include=
s:<br>
- encoding of all 16 bit instructions<br>
- encoding of all 32 bit instructions<br>
<br>
Signed-off-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com" targ=
et=3D"_blank">mrolnik@gmail.com</a>&gt;<br>
Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.=
com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0target/avr/insn.decode | 194 ++++++++++++++++++++++++++++++<wbr>+++++=
++++++<br>
=C2=A01 file changed, 194 insertions(+)<br>
=C2=A0create mode 100644 target/avr/insn.decode<br>
<br></blockquote><div><br></div><div>Hi, Michael,</div><div><br></div><div>=
Could you please reorder decoding definitions in this file following this p=
attern:</div><div><br></div><div><span style=3D"color:rgb(34,34,34);font-si=
ze:14px;line-height:22.1200008392334px">#</span></div><div><span style=3D"c=
olor:rgb(34,34,34);font-size:14px;line-height:22.1200008392334px"># Arithme=
tic Instructions</span></div><div><span style=3D"color:rgb(34,34,34);font-s=
ize:14px;line-height:22.1200008392334px">#</span></div><div><span style=3D"=
color:rgb(34,34,34);font-size:14px;line-height:22.1200008392334px"><br></sp=
an></div><div><span style=3D"color:rgb(34,34,34);font-size:14px;line-height=
:22.1200008392334px">&lt; their decoding definitions in the order they appe=
ar in the ISA doc &gt;</span></div><div><br></div><div><span style=3D"color=
:rgb(34,34,34);font-size:14px;line-height:22.1200008392334px">#</span></div=
><span style=3D"color:rgb(34,34,34);font-size:14px;line-height:22.120000839=
2334px">target/avr: Add instruction translation - Branch Instructions</span=
><div><div><span style=3D"color:rgb(34,34,34);font-size:14px;line-height:22=
.1200008392334px">#</span></div><div></div></div></blockquote><div><br></di=
v><div>copu-paste error. I meant:</div><div><br></div><div><br></div><div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;pa=
dding-left:1ex"><div><font color=3D"#222222"><span style=3D"font-size:14px;=
line-height:22.1200008392334px">#</span></font><span style=3D"color:rgb(34,=
34,34);font-size:14px;line-height:22.1200008392334px">=C2=A0Branch Instruct=
ions</span></div></blockquote><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><div><div><span style=3D"col=
or:rgb(34,34,34);font-size:14px;line-height:22.1200008392334px">#</span></d=
iv><div></div></div></blockquote></div><div><br></div><div>If you refactor =
the file this way, it will be much easier to inspect the code, and also to =
add changes in case of future versions of AVR ISA - the file would look muc=
h tidier.</div><div><br></div><div>Take care,</div><div>Aleksandar</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div><div></div><div><span style=
=3D"color:rgb(34,34,34);font-size:14px;line-height:22.1200008392334px"><br>=
</span></div><div><span style=3D"color:rgb(34,34,34);font-size:14px;line-he=
ight:22.1200008392334px">&lt; their decoding definitions in the order they =
appear in the ISA doc &gt;</span></div><div><span style=3D"color:rgb(34,34,=
34);font-size:14px;line-height:22.1200008392334px"><br></span></div><div><s=
pan style=3D"color:rgb(34,34,34);font-size:14px;line-height:22.120000839233=
4px">#</span></div><div><span style=3D"color:rgb(34,34,34);font-size:14px;l=
ine-height:22.1200008392334px">#</span><span style=3D"color:rgb(34,34,34);f=
ont-size:14px;line-height:22.1200008392334px">=C2=A0Data Transfer Instructi=
ons</span></div></div><div><div><div><span style=3D"color:rgb(34,34,34);fon=
t-size:14px;line-height:22.1200008392334px">#</span></div><div><span style=
=3D"color:rgb(34,34,34);font-size:14px;line-height:22.1200008392334px"><br>=
</span></div><div><span style=3D"color:rgb(34,34,34);font-size:14px;line-he=
ight:22.1200008392334px">&lt; their decoding definitions in the order they =
appear in the ISA doc &gt;</span></div><div><span style=3D"color:rgb(34,34,=
34);font-size:14px;line-height:22.1200008392334px"><br></span></div><div><s=
pan style=3D"color:rgb(34,34,34);font-size:14px;line-height:22.120000839233=
4px">#</span></div><div><span style=3D"color:rgb(34,34,34);font-size:14px;l=
ine-height:22.1200008392334px">#</span><span style=3D"color:rgb(34,34,34);f=
ont-size:14px;line-height:22.1200008392334px">=C2=A0Bit and Bit-test</span>=
<span style=3D"color:rgb(34,34,34);font-size:14px;line-height:22.1200008392=
334px">=C2=A0Instructions</span></div></div><div><div><span style=3D"color:=
rgb(34,34,34);font-size:14px;line-height:22.1200008392334px">#</span></div>=
<div><span style=3D"color:rgb(34,34,34);font-size:14px;line-height:22.12000=
08392334px"><br></span></div><div><span style=3D"color:rgb(34,34,34);font-s=
ize:14px;line-height:22.1200008392334px">&lt; their decoding definitions in=
 the order they appear in the ISA doc &gt;</span></div><div><span style=3D"=
color:rgb(34,34,34);font-size:14px;line-height:22.1200008392334px"><br></sp=
an></div><div><span style=3D"color:rgb(34,34,34);font-size:14px;line-height=
:22.1200008392334px">#</span></div><div><span style=3D"color:rgb(34,34,34);=
font-size:14px;line-height:22.1200008392334px">#</span><span style=3D"color=
:rgb(34,34,34);font-size:14px;line-height:22.1200008392334px">=C2=A0MCU Con=
trol Instructions</span></div></div><div><div><span style=3D"color:rgb(34,3=
4,34);font-size:14px;line-height:22.1200008392334px">#</span></div><div><sp=
an style=3D"color:rgb(34,34,34);font-size:14px;line-height:22.1200008392334=
px"><br></span></div><div><span style=3D"color:rgb(34,34,34);font-size:14px=
;line-height:22.1200008392334px">&lt; their decoding definitions in the ord=
er they appear in the ISA doc &gt;</span></div><div><span style=3D"color:rg=
b(34,34,34);font-size:14px;line-height:22.1200008392334px"><br></span></div=
><div><br></div><div><br></div><div>Thanks in advance!</div><div><br></div>=
<div>Aleksandar</div><div><span style=3D"color:rgb(34,34,34);font-size:14px=
;line-height:22.1200008392334px"><br></span></div><span style=3D"color:rgb(=
34,34,34);font-size:14px;line-height:22.1200008392334px"></span></div><div>=
<br></div><div><br></div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
diff --git a/target/avr/insn.decode b/target/avr/insn.decode<br>
new file mode 100644<br>
index 0000000000..2eb6de692a<br>
--- /dev/null<br>
+++ b/target/avr/insn.decode<br>
@@ -0,0 +1,194 @@<br>
+#<br>
+# AVR instruction decode definitions.<br>
+#<br>
+# Copyright (c) 2019 Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.co=
m" target=3D"_blank">mrolnik@gmail.com</a>&gt;<br>
+#<br>
+# This library is free software; you can redistribute it and/or<br>
+# modify it under the terms of the GNU Lesser General Public<br>
+# License as published by the Free Software Foundation; either<br>
+# version 2.1 of the License, or (at your option) any later version.<br>
+#<br>
+# This library is distributed in the hope that it will be useful,<br>
+# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU<b=
r>
+# Lesser General Public License for more details.<br>
+#<br>
+# You should have received a copy of the GNU Lesser General Public<br>
+# License along with this library; if not, see &lt;<a href=3D"http://www.g=
nu.org/licenses/" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;<wb=
r>.<br>
+#<br>
+<br>
+#<br>
+#=C2=A0 =C2=A0regs_16_31_by_one =3D [16 .. 31]<br>
+#=C2=A0 =C2=A0regs_16_23_by_one =3D [16 .. 23]<br>
+#=C2=A0 =C2=A0regs_24_30_by_two =3D [24, 26, 28, 30]<br>
+#=C2=A0 =C2=A0regs_00_30_by_two =3D [0, 2, 4, 6, 8, .. 30]<br>
+<br>
+%rd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04:5<br>
+%rr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A09:1 0:4<br>
+<br>
+&amp;rd_rr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rd rr<br>
+&amp;rd_imm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rd imm<br>
+<br>
+@op_rd_rr=C2=A0 =C2=A0 =C2=A0 =C2=A0.... .. . ..... ....=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;rd_rr=C2=A0 =C2=A0 =C2=A0 rd=3D%rd rr=3D%rr<br>
+ADD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000 11 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+ADC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00001 11 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+AND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00010 00 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+CP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0001 01 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+CPC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000 01 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+CPSE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0001 00 . ..... ....=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+EOR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00010 01 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+MOV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00010 11 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+MUL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 11 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+OR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0010 10 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+SBC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000 10 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+SUB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00001 10 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+<br>
+<br>
+%rd_c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04:2=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!function=
=3Dto_regs_24_30_by_<wbr>two<br>
+%imm6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06:2 0:4<br>
+<br>
+@op_rd_imm6=C2=A0 =C2=A0 =C2=A0.... .... .. .. ....=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;rd_imm=C2=A0 =C2=A0 =C2=A0rd=3D%rd_c imm=3D%imm6<br>
+ADIW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0110 .. .. ....=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 @op_rd_imm6<br>
+SBIW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0111 .. .. ....=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 @op_rd_imm6<br>
+<br>
+<br>
+%rd_a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04:4=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!function=
=3Dto_regs_16_31_by_<wbr>one<br>
+%rr_a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00:4=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!function=
=3Dto_regs_16_31_by_<wbr>one<br>
+%rd_d=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04:4=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!function=
=3Dto_regs_00_30_by_<wbr>two<br>
+%rr_d=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00:4=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!function=
=3Dto_regs_00_30_by_<wbr>two<br>
+%imm8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08:4 0:4<br>
+<br>
+@op_rd_imm8=C2=A0 =C2=A0 =C2=A0.... .... .... ....=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;rd_imm=C2=A0 =C2=A0 =C2=A0rd=3D%rd_a imm=3D%imm8<br>
+ANDI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0111 .... .... ....=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd_imm8<br>
+CPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00011 .... .... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd_imm8<br>
+LDI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01110 .... .... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd_imm8<br>
+ORI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00110 .... .... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd_imm8<br>
+SBCI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0100 .... .... ....=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd_imm8<br>
+SUBI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0101 .... .... ....=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd_imm8<br>
+<br>
+<br>
+@op_rd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .... ... rd:5 ....<br>
+ASR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 010 ..... 0101=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+COM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 010 ..... 0000=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+DEC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 010 ..... 1010=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+ELPM2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 000 ..... 0110=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+ELPMX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 000 ..... 0111=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+INC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 010 ..... 0011=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+LDX1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 ..... 1100=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+LDX2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 ..... 1101=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+LDX3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 ..... 1110=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+LDY2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 ..... 1001=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+LDY3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 ..... 1010=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+LDZ2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 ..... 0001=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+LDZ3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 ..... 0010=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+LPM2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 ..... 0100=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+LPMX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 ..... 0101=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+LSR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 010 ..... 0110=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+NEG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 010 ..... 0001=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+POP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 000 ..... 1111=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+PUSH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 001 ..... 1111=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+ROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 010 ..... 0111=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+STY2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 001 ..... 1001=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+STY3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 001 ..... 1010=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+STZ2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 001 ..... 0001=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+STZ3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 001 ..... 0010=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+SWAP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 010 ..... 0010=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd<br>
+<br>
+<br>
+@op_bit=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.... .... . bit:3 ....<br>
+BCLR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0100 1 ... 1000=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 @op_bit<br>
+BSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0100 0 ... 1000=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 @op_bit<br>
+<br>
+<br>
+@op_rd_bit=C2=A0 =C2=A0 =C2=A0 .... ... rd:5 . bit:3<br>
+BLD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01111 100 ..... 0 ...=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_bit<br>
+BST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01111 101 ..... 0 ...=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_bit<br>
+<br>
+<br>
+@op_bit_imm=C2=A0 =C2=A0 =C2=A0.... .. imm:s7 bit:3<br>
+BRBC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1111 01 ....... ...=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_bit_imm<br>
+BRBS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1111 00 ....... ...=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_bit_imm<br>
+<br>
+<br>
+BREAK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0101 1001 1000<br>
+EICALL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0101 0001 1001<br>
+EIJMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0100 0001 1001<br>
+ELPM1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0101 1101 1000<br>
+ICALL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0101 0000 1001<br>
+IJMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0100 0000 1001<br>
+LPM1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0101 1100 1000<br>
+NOP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000 0000 0000 0000<br>
+RET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0101 0000 1000<br>
+RETI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0101 0001 1000<br>
+SLEEP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0101 1000 1000<br>
+SPM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0101 1110 1000<br>
+SPMX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0101 1111 1000<br>
+WDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0101 1010 1000<br>
+<br>
+<br>
+@op_reg_bit=C2=A0 =C2=A0 =C2=A0.... .... reg:5 bit:3<br>
+CBI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 1000 ..... ...=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@op_reg_bit<br>
+SBI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 1010 ..... ...=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@op_reg_bit<br>
+SBIC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 1001 ..... ...=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_reg_bit<br>
+SBIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 1011 ..... ...=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_reg_bit<br>
+<br>
+<br>
+DES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0100 imm:4 1011<br=
>
+<br>
+<br>
+%rd_b=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04:3=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!function=
=3Dto_regs_16_23_by_<wbr>one<br>
+%rr_b=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00:3=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!function=
=3Dto_regs_16_23_by_<wbr>one<br>
+@fmul=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.... .... . ... . ...=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&amp;rd_rr=C2=A0 =C2=A0 =C2=A0 rd=3D%rd_b rr=3D%rr_b<br=
>
+FMUL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0000 0011 0 ... 1 ...=C2=A0 =
=C2=A0 =C2=A0 =C2=A0@fmul<br>
+FMULS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000 0011 1 ... 0 ...=C2=A0 =
=C2=A0 =C2=A0 =C2=A0@fmul<br>
+FMULSU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0000 0011 1 ... 1 ...=C2=A0 =C2=
=A0 =C2=A0 =C2=A0@fmul<br>
+MULSU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000 0011 0 ... 0 ...=C2=A0 =
=C2=A0 =C2=A0 =C2=A0@fmul<br>
+<br>
+<br>
+%io_imm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A09:2 0:4<br>
+@io_rd_imm=C2=A0 =C2=A0 =C2=A0 .... . .. ..... ....=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;rd_imm=C2=A0 =C2=A0 =C2=A0rd=3D%rd imm=3D%io_imm<br>
+IN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1011 0 .. ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @io_rd_imm<br>
+OUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01011 1 .. ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @io_rd_imm<br>
+<br>
+<br>
+XCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 001 rd:5 0100<br>
+LAC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 001 rd:5 0110<br>
+LAS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 001 rd:5 0101<br>
+LAT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 001 rd:5 0111<br>
+STX1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 001 rr:5 1100<br>
+STX2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 001 rr:5 1101<br>
+STX3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 001 rr:5 1110<br>
+<br>
+<br>
+%ldst_d_imm=C2=A0 =C2=A0 =C2=A013:1 10:2 0:3<br>
+@ldst_d=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.. . . .. . rd:5=C2=A0 . ...=C2=
=A0 =C2=A0 =C2=A0&amp;rd_imm=C2=A0 =C2=A0 =C2=A0imm=3D%ldst_d_imm<br>
+LDDY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10 . 0 .. 0 ..... 1 ...=C2=
=A0 =C2=A0 =C2=A0@ldst_d<br>
+LDDZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10 . 0 .. 0 ..... 0 ...=C2=
=A0 =C2=A0 =C2=A0@ldst_d<br>
+STDY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10 . 0 .. 1 ..... 1 ...=C2=
=A0 =C2=A0 =C2=A0@ldst_d<br>
+STDZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10 . 0 .. 1 ..... 0 ...=C2=
=A0 =C2=A0 =C2=A0@ldst_d<br>
+<br>
+<br>
+MOVW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0000 0001 .... ....=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;rd_rr=C2=A0 =C2=A0 =C2=A0 rd=3D%rd_d rr=3D%=
rr_d<br>
+MULS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0000 0010 .... ....=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;rd_rr=C2=A0 =C2=A0 =C2=A0 rd=3D%rd_a rr=3D%=
rr_a<br>
+<br>
+RCALL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01101 imm:s12<br>
+RJMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1100 imm:s12<br>
+<br>
+SBRC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1111 110 rr:5 0 bit:3<br>
+SBRS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1111 111 rr:5 0 bit:3<br>
+<br>
+# The 22-bit immediate is partially in the opcode word,<br>
+# and partially in the next.=C2=A0 Use append_16 to build the<br>
+# complete 22-bit value.<br>
+%imm_call=C2=A0 =C2=A0 =C2=A0 =C2=A04:5 0:1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!function=3Dappend_16<br>
+CALL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 010 ..... 111 .=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 imm=3D%imm_call<br>
+JMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 010 ..... 110 .=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 imm=3D%imm_call<br>
+<br>
+<br>
+# The 16-bit immediate is completely in the next word.<br>
+# Fields cannot be defined with no bits, so we cannot play<br>
+# the same trick and append to a zero-bit value.<br>
+# Defer reading the immediate until trans_{LDS,STS}.<br>
+@ldst_s=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.... ... rd:5 ....=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 imm=3D0<br>
+LDS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 000 ..... 0000=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@ldst_s<br>
+STS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 001 ..... 0000=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@ldst_s<br>
-- <br>
2.17.2 (Apple Git-113)<br>
<br>
</blockquote></div>
</blockquote>

--000000000000aef49905994a9f3f--

