Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 354BA12C2C1
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Dec 2019 15:38:29 +0100 (CET)
Received: from localhost ([::1]:52552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilZi7-0008AI-TA
	for lists+qemu-devel@lfdr.de; Sun, 29 Dec 2019 09:38:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59861)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ilZhB-0007jd-Uy
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 09:37:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ilZh8-0006p1-GG
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 09:37:29 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39388)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1ilZh8-0006is-50
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 09:37:26 -0500
Received: by mail-ot1-x344.google.com with SMTP id 77so42940528oty.6
 for <qemu-devel@nongnu.org>; Sun, 29 Dec 2019 06:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=JJATI8BMxpGbk4GIkVE60B6LGeLKiI/qMwaMnwx0s/E=;
 b=Ep9m0oeHO4mGEAlR30lRJCkMd/ulCQVTX5UmnPBz0sademZ7dhZn125AzVkUEXQbSt
 kYvwEKUKgXZjPTFUQiaY/PYdr++JRjvv9cqoEtsLgJ+vzCx/JPpR0Zma/liAqjTFE8/o
 ebLR5ZSZ3/o3JF/bEzipGpdABj/+WFuXx4DQAQPA5TeFjGi0UHDDN9fNudrVRsOSe8hS
 aZ4ViI67yGFHL9NIVj9um+qYKYG1GPrRmq5PQvG8lyA/XX0Rlvgm1mOA7UhVTwQpZoLs
 kdijeQI5e6QMaqP9/+oAzyi7k8tyjZgMeukdIFt39Pd9pvSH+WpNF6VfNDxUjEYyEeCo
 jxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=JJATI8BMxpGbk4GIkVE60B6LGeLKiI/qMwaMnwx0s/E=;
 b=I/wOModg+PPtmgXwK2iD7oWpYfGcwYTsD0zXqHYAU+lEYo9z24D9GDhs72V1xbv5Ki
 f6xkAiOzYjdtKekZET4nUvPhJ0IWDyc/C3MnNMMyUgtFDzWa8xlsMWh1xFjNz/T3cePP
 w3tEyVq8c6O6JcD3XYxTU9YE9Mxvm8ExGRwacSLNHbZGGC2OcLIyIlgraCFPbxcEVtxE
 Whl4o0dFplsXj/WPru2UozmJKf2/+2ipbVQLmVCe5W/SYTrdls2QoKdpp+RIdMkfKij5
 0heYJNbd9RJvnHMuG3hYkbQYjEplOJ2lTwoyATP88qTYDpNzM/pXiaLIhQ3wwrWmAMoz
 VaTA==
X-Gm-Message-State: APjAAAXS4YxRFVFZaV8UADa20tl9nVBsu/xwZFZLI9U6SCdoR9RwDopY
 SIPFvUzad8pp8nxUoBUVbmUwBGi0oA8Es7v47Ys=
X-Google-Smtp-Source: APXvYqy/RKVX5/8hlNzMI//k6o/q+Ks7047kYcoVCcqpbkQO25ejbhaoUZEgLMxCOi/dvu6Bh9ab0lTgV9BId0goH8g=
X-Received: by 2002:a9d:4c94:: with SMTP id m20mr66551352otf.341.1577630244929; 
 Sun, 29 Dec 2019 06:37:24 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:d21:0:0:0:0:0 with HTTP;
 Sun, 29 Dec 2019 06:37:24 -0800 (PST)
In-Reply-To: <CAK4993i0vRtEh=evXyx0=KVziQZWWUsQX9c0JBKjajLv6G-wEw@mail.gmail.com>
References: <20191218210329.1960-1-mrolnik@gmail.com>
 <20191218210329.1960-4-mrolnik@gmail.com>
 <CAL1e-=hB5FhRtuxo1OGBSKA-aw1GW4RgpisKJWaT0TPHKaTVhw@mail.gmail.com>
 <CAK4993iuuCZzyEzsqodpf_T_3xSSJeF-PP1XLO8PsXy6JwrgfA@mail.gmail.com>
 <CAL1e-=iQ=iBzn9sRDgx9Edi+rO=uP7RqpMyDJQD9RyiB5MwA=A@mail.gmail.com>
 <CAL1e-=h+ujoRaCcXEkrrMJZ5bX=jWbzDy+GgTzsOJzMybHN96g@mail.gmail.com>
 <CAK4993i0vRtEh=evXyx0=KVziQZWWUsQX9c0JBKjajLv6G-wEw@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Sun, 29 Dec 2019 15:37:24 +0100
Message-ID: <CAL1e-=io5JhUP-i50OSk6jpiwxLec-hySVxb59OVVZ0FUkGgxQ@mail.gmail.com>
Subject: Re: [PATCH v39 03/22] target/avr: Add instruction decoding
To: Michael Rolnik <mrolnik@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000056054c059ad8aa72"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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

--00000000000056054c059ad8aa72
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Saturday, December 28, 2019, Michael Rolnik <mrolnik@gmail.com> wrote:

> Hi Aleksandar.
>
> This seems less logical to me.
> Then next thing will be to partition disassember part right?
>
>
>
Please respond inline in future, since inline redponding is standard for
this mailing list.

What is not logical to you?

I am trying to teach you how to create patches that are logical units easy
to understand and review.

In my view, yout series doesn't satisfy that basic requirement of being
organized in proper logical units that are expected from any series to be
accepted. (The worst part is patch 1)

Regards,
Aleksandsr



>
>
> On Sat, Dec 21, 2019 at 7:15 PM Aleksandar Markovic <
> aleksandar.m.mail@gmail.com> wrote:
>
>>
>>
>> On Saturday, December 21, 2019, Aleksandar Markovic <
>> aleksandar.m.mail@gmail.com> wrote:
>>
>>>
>>>
>>> On Saturday, December 21, 2019, Michael Rolnik <mrolnik@gmail.com>
>>> wrote:
>>>
>>>> Hi Aleksandar.
>>>>
>>>> please explain.
>>>>
>>>>>
>>>>>
>>> Hi, Michael.
>>>
>>> I wanted to say:
>>>
>>>
>>> 1. Cut the parts of insn.decode that describe coding of arithmetic and
>>> logic instructions and include them in the patch:
>>>
>>> target/avr: Add instruction translation - Arithmetic and Logic Instruct=
ions
>>>
>>>
>>> Since that would be the first time insn.decode is mentioned in the new
>> organization of the series, the license preamble of insn.decode can be
>> included in that patch, of course.
>>
>> Best wishes,
>> Aleksandar
>>
>>
>>
>>> 2. Cut the parts of insn.decode that describe coding of branch instruct=
ions and include them in the patch:
>>>
>>> target/avr: Add instruction translation - Branch Instructions
>>>
>>> 3. Cut the parts of insn.decode that describe coding of data transfer i=
nstructions
>>> and include them in the patch:
>>>
>>> target/avr: Add instruction translation - Data Transfer Instructions
>>>
>>>
>>> 4. Cut the parts of insn.decode that describe coding of bit and bit-tes=
t
>>> instructions and include them in the patch:
>>>
>>> target/avr: Add instruction translation - Bit and Bit-test Instructions
>>>
>>>
>>> 5. Cut the parts of insn.decode that describe coding of MCU control ins=
tructions
>>> and include them in the patch:
>>>
>>> target/avr: Add instruction translation - MCU Control Instructions
>>>
>>>
>>> This way, your patches become logicaly-organized rather than file
>>> organized. The patch on, let's say, arithmetic and logic instructions w=
ill
>>> contain all elements needed for their implementation, rather than those
>>> elements being split between decode and omplementation parts .
>>>
>>>
>>>
>>> Regards,
>>>
>>> Aleksandar
>>>
>>>
>>>
>>>> On Sat, Dec 21, 2019 at 1:18 PM Aleksandar Markovic <
>>>> aleksandar.m.mail@gmail.com> wrote:
>>>>
>>>>>
>>>>>
>>>>> On Wednesday, December 18, 2019, Michael Rolnik <mrolnik@gmail.com>
>>>>> wrote:
>>>>>
>>>>>> This includes:
>>>>>> - encoding of all 16 bit instructions
>>>>>> - encoding of all 32 bit instructions
>>>>>>
>>>>>> Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
>>>>>> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>>>> ---
>>>>>
>>>>>
>>>>> Michael,
>>>>>
>>>>> I am very pleased that you rearranged the order to be in sync with th=
e
>>>>> documentation.
>>>>>
>>>>> Now, for the next version, I would ask you to make this patch
>>>>> disappear.
>>>>>
>>>>> More precisely, "MCU Control Instructions" section of insn.decode fil=
e
>>>>> move to be a part of "Add MCU Control Instructions" (not sure abiut t=
he
>>>>> title, but it is 6 or 7 patches after this one)  patch, and so on, in=
 the
>>>>> same fashion, for all groups of instructions.
>>>>>
>>>>> Kind regards,
>>>>>
>>>>> Aleksandar
>>>>>
>>>>>
>>>>>
>>>>>  target/avr/insn.decode | 183 ++++++++++++++++++++++++++++++
>>>>>> +++++++++++
>>>>>>  1 file changed, 183 insertions(+)
>>>>>>  create mode 100644 target/avr/insn.decode
>>>>>>
>>>>>> diff --git a/target/avr/insn.decode b/target/avr/insn.decode
>>>>>> new file mode 100644
>>>>>> index 0000000000..0e4ec9ddf0
>>>>>> --- /dev/null
>>>>>> +++ b/target/avr/insn.decode
>>>>>> @@ -0,0 +1,183 @@
>>>>>> +#
>>>>>> +# AVR instruction decode definitions.
>>>>>> +#
>>>>>> +# Copyright (c) 2019 Michael Rolnik <mrolnik@gmail.com>
>>>>>> +#
>>>>>> +# This library is free software; you can redistribute it and/or
>>>>>> +# modify it under the terms of the GNU Lesser General Public
>>>>>> +# License as published by the Free Software Foundation; either
>>>>>> +# version 2.1 of the License, or (at your option) any later version=
.
>>>>>> +#
>>>>>> +# This library is distributed in the hope that it will be useful,
>>>>>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>>>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>>>>>> +# Lesser General Public License for more details.
>>>>>> +#
>>>>>> +# You should have received a copy of the GNU Lesser General Public
>>>>>> +# License along with this library; if not, see <
>>>>>> http://www.gnu.org/licenses/>.
>>>>>> +#
>>>>>> +
>>>>>> +#
>>>>>> +#   regs_16_31_by_one =3D [16 .. 31]
>>>>>> +#   regs_16_23_by_one =3D [16 .. 23]
>>>>>> +#   regs_24_30_by_two =3D [24, 26, 28, 30]
>>>>>> +#   regs_00_30_by_two =3D [0, 2, 4, 6, 8, .. 30]
>>>>>> +
>>>>>> +%rd             4:5
>>>>>> +%rr             9:1 0:4
>>>>>> +
>>>>>> +%rd_a           4:4
>>>>>>  !function=3Dto_regs_16_31_by_one
>>>>>> +%rd_b           4:3
>>>>>>  !function=3Dto_regs_16_23_by_one
>>>>>> +%rd_c           4:2
>>>>>>  !function=3Dto_regs_24_30_by_two
>>>>>> +%rd_d           4:4
>>>>>>  !function=3Dto_regs_00_30_by_two
>>>>>> +%rr_a           0:4
>>>>>>  !function=3Dto_regs_16_31_by_one
>>>>>> +%rr_b           0:3
>>>>>>  !function=3Dto_regs_16_23_by_one
>>>>>> +%rr_d           0:4
>>>>>>  !function=3Dto_regs_00_30_by_two
>>>>>> +
>>>>>> +%imm6           6:2 0:4
>>>>>> +%imm8           8:4 0:4
>>>>>> +
>>>>>> +%io_imm         9:2 0:4
>>>>>> +%ldst_d_imm     13:1 10:2 0:3
>>>>>> +
>>>>>> +# The 22-bit immediate is partially in the opcode word,
>>>>>> +# and partially in the next.  Use append_16 to build the
>>>>>> +# complete 22-bit value.
>>>>>> +%imm_call       4:5 0:1                     !function=3Dappend_16
>>>>>> +
>>>>>> +
>>>>>> +&rd_rr          rd rr
>>>>>> +&rd_imm         rd imm
>>>>>> +
>>>>>> +@op_rd_rr       .... .. . ..... ....        &rd_rr      rd=3D%rd rr=
=3D%rr
>>>>>> +@op_rd_imm6     .... .... .. .. ....        &rd_imm     rd=3D%rd_c
>>>>>> imm=3D%imm6
>>>>>> +@op_rd_imm8     .... .... .... ....         &rd_imm     rd=3D%rd_a
>>>>>> imm=3D%imm8
>>>>>> +@op_bit         .... .... . bit:3 ....
>>>>>> +@op_bit_imm     .... .. imm:s7 bit:3
>>>>>> +@fmul           .... .... . ... . ...       &rd_rr      rd=3D%rd_b
>>>>>> rr=3D%rr_b
>>>>>> +@io_rd_imm      .... . .. ..... ....        &rd_imm     rd=3D%rd
>>>>>> imm=3D%io_imm
>>>>>> +@ldst_d         .. . . .. . rd:5  . ...     &rd_imm
>>>>>>  imm=3D%ldst_d_imm
>>>>>> +
>>>>>> +# The 16-bit immediate is completely in the next word.
>>>>>> +# Fields cannot be defined with no bits, so we cannot play
>>>>>> +# the same trick and append to a zero-bit value.
>>>>>> +# Defer reading the immediate until trans_{LDS,STS}.
>>>>>> +@ldst_s         .... ... rd:5 ....          imm=3D0
>>>>>> +
>>>>>> +#
>>>>>> +# Arithmetic Instructions
>>>>>> +#
>>>>>> +ADD             0000 11 . ..... ....        @op_rd_rr
>>>>>> +ADC             0001 11 . ..... ....        @op_rd_rr
>>>>>> +ADIW            1001 0110 .. .. ....        @op_rd_imm6
>>>>>> +SUB             0001 10 . ..... ....        @op_rd_rr
>>>>>> +SUBI            0101 .... .... ....         @op_rd_imm8
>>>>>> +SBC             0000 10 . ..... ....        @op_rd_rr
>>>>>> +SBCI            0100 .... .... ....         @op_rd_imm8
>>>>>> +SBIW            1001 0111 .. .. ....        @op_rd_imm6
>>>>>> +AND             0010 00 . ..... ....        @op_rd_rr
>>>>>> +ANDI            0111 .... .... ....         @op_rd_imm8
>>>>>> +OR              0010 10 . ..... ....        @op_rd_rr
>>>>>> +ORI             0110 .... .... ....         @op_rd_imm8
>>>>>> +EOR             0010 01 . ..... ....        @op_rd_rr
>>>>>> +COM             1001 010 rd:5 0000
>>>>>> +NEG             1001 010 rd:5 0001
>>>>>> +INC             1001 010 rd:5 0011
>>>>>> +DEC             1001 010 rd:5 1010
>>>>>> +MUL             1001 11 . ..... ....        @op_rd_rr
>>>>>> +MULS            0000 0010 .... ....         &rd_rr      rd=3D%rd_a
>>>>>> rr=3D%rr_a
>>>>>> +MULSU           0000 0011 0 ... 0 ...       @fmul
>>>>>> +FMUL            0000 0011 0 ... 1 ...       @fmul
>>>>>> +FMULS           0000 0011 1 ... 0 ...       @fmul
>>>>>> +FMULSU          0000 0011 1 ... 1 ...       @fmul
>>>>>> +DES             1001 0100 imm:4 1011
>>>>>> +
>>>>>> +#
>>>>>> +# Branch Instructions
>>>>>> +#
>>>>>> +RJMP            1100 imm:s12
>>>>>> +IJMP            1001 0100 0000 1001
>>>>>> +EIJMP           1001 0100 0001 1001
>>>>>> +JMP             1001 010 ..... 110 .        imm=3D%imm_call
>>>>>> +RCALL           1101 imm:s12
>>>>>> +ICALL           1001 0101 0000 1001
>>>>>> +EICALL          1001 0101 0001 1001
>>>>>> +CALL            1001 010 ..... 111 .        imm=3D%imm_call
>>>>>> +RET             1001 0101 0000 1000
>>>>>> +RETI            1001 0101 0001 1000
>>>>>> +CPSE            0001 00 . ..... ....        @op_rd_rr
>>>>>> +CP              0001 01 . ..... ....        @op_rd_rr
>>>>>> +CPC             0000 01 . ..... ....        @op_rd_rr
>>>>>> +CPI             0011 .... .... ....         @op_rd_imm8
>>>>>> +SBRC            1111 110 rr:5 0 bit:3
>>>>>> +SBRS            1111 111 rr:5 0 bit:3
>>>>>> +SBIC            1001 1001 reg:5 bit:3
>>>>>> +SBIS            1001 1011 reg:5 bit:3
>>>>>> +BRBS            1111 00 ....... ...         @op_bit_imm
>>>>>> +BRBC            1111 01 ....... ...         @op_bit_imm
>>>>>> +
>>>>>> +#
>>>>>> +# Data Transfer Instructions
>>>>>> +#
>>>>>> +MOV             0010 11 . ..... ....        @op_rd_rr
>>>>>> +MOVW            0000 0001 .... ....         &rd_rr      rd=3D%rd_d
>>>>>> rr=3D%rr_d
>>>>>> +LDI             1110 .... .... ....         @op_rd_imm8
>>>>>> +LDS             1001 000 ..... 0000         @ldst_s
>>>>>> +LDX1            1001 000 rd:5 1100
>>>>>> +LDX2            1001 000 rd:5 1101
>>>>>> +LDX3            1001 000 rd:5 1110
>>>>>> +LDY2            1001 000 rd:5 1001
>>>>>> +LDY3            1001 000 rd:5 1010
>>>>>> +LDZ2            1001 000 rd:5 0001
>>>>>> +LDZ3            1001 000 rd:5 0010
>>>>>> +LDDY            10 . 0 .. 0 ..... 1 ...     @ldst_d
>>>>>> +LDDZ            10 . 0 .. 0 ..... 0 ...     @ldst_d
>>>>>> +STS             1001 001 ..... 0000         @ldst_s
>>>>>> +STX1            1001 001 rr:5 1100
>>>>>> +STX2            1001 001 rr:5 1101
>>>>>> +STX3            1001 001 rr:5 1110
>>>>>> +STY2            1001 001 rd:5 1001
>>>>>> +STY3            1001 001 rd:5 1010
>>>>>> +STZ2            1001 001 rd:5 0001
>>>>>> +STZ3            1001 001 rd:5 0010
>>>>>> +STDY            10 . 0 .. 1 ..... 1 ...     @ldst_d
>>>>>> +STDZ            10 . 0 .. 1 ..... 0 ...     @ldst_d
>>>>>> +LPM1            1001 0101 1100 1000
>>>>>> +LPM2            1001 000 rd:5 0100
>>>>>> +LPMX            1001 000 rd:5 0101
>>>>>> +ELPM1           1001 0101 1101 1000
>>>>>> +ELPM2           1001 000 rd:5 0110
>>>>>> +ELPMX           1001 000 rd:5 0111
>>>>>> +SPM             1001 0101 1110 1000
>>>>>> +SPMX            1001 0101 1111 1000
>>>>>> +IN              1011 0 .. ..... ....        @io_rd_imm
>>>>>> +OUT             1011 1 .. ..... ....        @io_rd_imm
>>>>>> +PUSH            1001 001 rd:5 1111
>>>>>> +POP             1001 000 rd:5 1111
>>>>>> +XCH             1001 001 rd:5 0100
>>>>>> +LAC             1001 001 rd:5 0110
>>>>>> +LAS             1001 001 rd:5 0101
>>>>>> +LAT             1001 001 rd:5 0111
>>>>>> +
>>>>>> +#
>>>>>> +# Bit and Bit-test Instructions
>>>>>> +#
>>>>>> +LSR             1001 010 rd:5 0110
>>>>>> +ROR             1001 010 rd:5 0111
>>>>>> +ASR             1001 010 rd:5 0101
>>>>>> +SWAP            1001 010 rd:5 0010
>>>>>> +SBI             1001 1010 reg:5 bit:3
>>>>>> +CBI             1001 1000 reg:5 bit:3
>>>>>> +BST             1111 101 rd:5 0 bit:3
>>>>>> +BLD             1111 100 rd:5 0 bit:3
>>>>>> +BSET            1001 0100 0 bit:3 1000
>>>>>> +BCLR            1001 0100 1 bit:3 1000
>>>>>> +
>>>>>> +#
>>>>>> +# MCU Control Instructions
>>>>>> +#
>>>>>> +BREAK           1001 0101 1001 1000
>>>>>> +NOP             0000 0000 0000 0000
>>>>>> +SLEEP           1001 0101 1000 1000
>>>>>> +WDR             1001 0101 1010 1000
>>>>>> +
>>>>>> --
>>>>>> 2.17.2 (Apple Git-113)
>>>>>>
>>>>>>
>>>>
>>>> --
>>>> Best Regards,
>>>> Michael Rolnik
>>>>
>>>
>
> --
> Best Regards,
> Michael Rolnik
>

--00000000000056054c059ad8aa72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Saturday, December 28, 2019, Michael Rolnik &lt;<a href=3D"mailt=
o:mrolnik@gmail.com">mrolnik@gmail.com</a>&gt; wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr">Hi=C2=A0Aleksandar.<div><br></div><div>This =
seems less logical to me.</div><div>Then next thing will be to partition di=
sassember part right?</div><div><br></div><div><br></div></div></blockquote=
><div>=C2=A0</div><div>Please respond inline in future, since inline redpon=
ding is standard for this mailing list.</div><div><br></div><div>What is no=
t logical to you?</div><div><br></div><div>I am trying to teach you how to =
create patches that are logical units easy to understand and review.=C2=A0<=
/div><div><br></div><div>In my view, yout series doesn&#39;t satisfy that b=
asic requirement of being organized in proper logical units that are expect=
ed from any series to be accepted. (The worst part is patch 1)</div><div><b=
r></div><div>Regards,</div><div>Aleksandsr<br></div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Sat, Dec 21, 2019 at 7:15 PM Aleksandar Markovic &lt;<a href=3D"mailto:alek=
sandar.m.mail@gmail.com" target=3D"_blank">aleksandar.m.mail@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br><=
br>On Saturday, December 21, 2019, Aleksandar Markovic &lt;<a href=3D"mailt=
o:aleksandar.m.mail@gmail.com" target=3D"_blank">aleksandar.m.mail@gmail.co=
m</a>&gt; wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br><=
br>On Saturday, December 21, 2019, Michael Rolnik &lt;<a href=3D"mailto:mro=
lnik@gmail.com" target=3D"_blank">mrolnik@gmail.com</a>&gt; wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Aleksandar=
.<div><br></div><div>please explain.</div></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><br></blockquote></blockquote><div><br></div><div>Hi=
, Michael.</div><div><br></div><div>I wanted to say:</div><div><br></div><d=
iv><br></div><div>1. Cut the parts of insn.decode that describe coding of a=
rithmetic and logic instructions and include them in the patch:</div><div><=
pre>target/avr: Add instruction <span style=3D"font-family:&quot;Helvetica =
Neue&quot;,Helvetica,Arial,sans-serif">translation - Arithmetic and Logic I=
nstructions</span></pre><pre><span style=3D"font-family:&quot;Helvetica Neu=
e&quot;,Helvetica,Arial,sans-serif"><br></span></pre><pre></pre></div></blo=
ckquote><div>Since that would be the first time insn.decode is mentioned in=
 the new organization of the series, the license preamble of insn.decode ca=
n be included in that patch, of course.</div><div><br></div><div>Best wishe=
s,</div><div>Aleksandar</div><div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div><pre></pre><pre><div style=3D"font=
-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;white-space:n=
ormal">2. Cut the parts of insn.decode that describe coding of branch instr=
uctions and include them in the patch:</div><div style=3D"font-family:&quot=
;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;white-space:normal"></div>=
</pre><pre>target/avr: Add instruction translation - Branch Instructions
<br></pre><div>3. Cut the parts of insn.decode that describe coding of d<sp=
an style=3D"white-space:pre-wrap">ata transfer </span>instructions and incl=
ude them in the=C2=A0patch:<br></div><div></div><pre><span style=3D"font-fa=
mily:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">target/avr: Add=
 instruction translation - Data Transfer Instructions</span></pre><pre><spa=
n style=3D"font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-seri=
f"><br></span></pre><div>4. Cut the parts of insn.decode that describe codi=
ng of bit and bit-test instructions and include them in the patch:</div><di=
v></div><pre><span style=3D"font-family:&quot;Helvetica Neue&quot;,Helvetic=
a,Arial,sans-serif">target/avr: Add instruction translation - Bit and Bit-t=
est Instructions</span></pre><pre><span style=3D"font-family:&quot;Helvetic=
a Neue&quot;,Helvetica,Arial,sans-serif"><br></span></pre><div>5. Cut the p=
arts of insn.decode that describe coding of=C2=A0<span style=3D"white-space=
:pre-wrap">MCU control</span>=C2=A0instructions and include them in=C2=A0th=
e patch:<br></div><div></div><pre><span style=3D"font-family:&quot;Helvetic=
a Neue&quot;,Helvetica,Arial,sans-serif">target/avr: Add instruction transl=
ation - MCU Control Instructions</span><br></pre></div><div><br></div><div>=
This way, your patches become logicaly-organized rather than file organized=
. The patch on, let&#39;s say, arithmetic and logic instructions will conta=
in all elements needed for their implementation, rather than those elements=
 being split between decode and omplementation parts .</div><div><br></div>=
<div><br></div><div><br></div><div>Regards,</div><div><br></div><div>Aleksa=
ndar</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, Dec 21, 2019 at 1:18 PM Aleksandar Markovic &lt;<a href=3D"m=
ailto:aleksandar.m.mail@gmail.com" target=3D"_blank">aleksandar.m.mail@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br><br>On Wednesday, December 18, 2019, Michael Rolnik &lt;<a href=3D=
"mailto:mrolnik@gmail.com" target=3D"_blank">mrolnik@gmail.com</a>&gt; wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">This includes:<br>
- encoding of all 16 bit instructions<br>
- encoding of all 32 bit instructions<br>
<br>
Signed-off-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com" targ=
et=3D"_blank">mrolnik@gmail.com</a>&gt;<br>
Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.=
com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
---</blockquote><div><br></div><div>Michael,</div><div><br></div><div>I am =
very pleased that you rearranged the order to be in sync with the documenta=
tion.</div><div><br></div><div>Now, for the next version, I would ask you t=
o make this patch disappear.</div><div><br></div><div>More precisely, &quot=
;MCU Control Instructions&quot; section of=C2=A0insn.decode file move to be=
 a part of &quot;Add MCU Control Instructions&quot; (not sure abiut the tit=
le, but it is 6 or 7 patches after this one) =C2=A0patch, and so on, in the=
 same fashion, for all groups of instructions.</div><div><br></div><div>Kin=
d regards,</div><div><br></div><div>Aleksandar</div><div><br></div><div><br=
></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0target/avr/insn.decode | 183 ++++++++++++++++++++++++++++++<wbr>+++++=
++++++<br>
=C2=A01 file changed, 183 insertions(+)<br>
=C2=A0create mode 100644 target/avr/insn.decode<br>
<br>
diff --git a/target/avr/insn.decode b/target/avr/insn.decode<br>
new file mode 100644<br>
index 0000000000..0e4ec9ddf0<br>
--- /dev/null<br>
+++ b/target/avr/insn.decode<br>
@@ -0,0 +1,183 @@<br>
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
+%rd_a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04:4=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!function=
=3Dto_regs_16_31_by_<wbr>one<br>
+%rd_b=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04:3=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!function=
=3Dto_regs_16_23_by_<wbr>one<br>
+%rd_c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04:2=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!function=
=3Dto_regs_24_30_by_<wbr>two<br>
+%rd_d=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04:4=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!function=
=3Dto_regs_00_30_by_<wbr>two<br>
+%rr_a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00:4=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!function=
=3Dto_regs_16_31_by_<wbr>one<br>
+%rr_b=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00:3=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!function=
=3Dto_regs_16_23_by_<wbr>one<br>
+%rr_d=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00:4=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!function=
=3Dto_regs_00_30_by_<wbr>two<br>
+<br>
+%imm6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06:2 0:4<br>
+%imm8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08:4 0:4<br>
+<br>
+%io_imm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A09:2 0:4<br>
+%ldst_d_imm=C2=A0 =C2=A0 =C2=A013:1 10:2 0:3<br>
+<br>
+# The 22-bit immediate is partially in the opcode word,<br>
+# and partially in the next.=C2=A0 Use append_16 to build the<br>
+# complete 22-bit value.<br>
+%imm_call=C2=A0 =C2=A0 =C2=A0 =C2=A04:5 0:1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!function=3Dappend_16<br>
+<br>
+<br>
+&amp;rd_rr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rd rr<br>
+&amp;rd_imm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rd imm<br>
+<br>
+@op_rd_rr=C2=A0 =C2=A0 =C2=A0 =C2=A0.... .. . ..... ....=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;rd_rr=C2=A0 =C2=A0 =C2=A0 rd=3D%rd rr=3D%rr<br>
+@op_rd_imm6=C2=A0 =C2=A0 =C2=A0.... .... .. .. ....=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;rd_imm=C2=A0 =C2=A0 =C2=A0rd=3D%rd_c imm=3D%imm6<br>
+@op_rd_imm8=C2=A0 =C2=A0 =C2=A0.... .... .... ....=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;rd_imm=C2=A0 =C2=A0 =C2=A0rd=3D%rd_a imm=3D%imm8<br>
+@op_bit=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.... .... . bit:3 ....<br>
+@op_bit_imm=C2=A0 =C2=A0 =C2=A0.... .. imm:s7 bit:3<br>
+@fmul=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.... .... . ... . ...=C2=A0 =
=C2=A0 =C2=A0 =C2=A0&amp;rd_rr=C2=A0 =C2=A0 =C2=A0 rd=3D%rd_b rr=3D%rr_b<br=
>
+@io_rd_imm=C2=A0 =C2=A0 =C2=A0 .... . .. ..... ....=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;rd_imm=C2=A0 =C2=A0 =C2=A0rd=3D%rd imm=3D%io_imm<br>
+@ldst_d=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.. . . .. . rd:5=C2=A0 . ...=C2=
=A0 =C2=A0 =C2=A0&amp;rd_imm=C2=A0 =C2=A0 =C2=A0imm=3D%ldst_d_imm<br>
+<br>
+# The 16-bit immediate is completely in the next word.<br>
+# Fields cannot be defined with no bits, so we cannot play<br>
+# the same trick and append to a zero-bit value.<br>
+# Defer reading the immediate until trans_{LDS,STS}.<br>
+@ldst_s=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.... ... rd:5 ....=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 imm=3D0<br>
+<br>
+#<br>
+# Arithmetic Instructions<br>
+#<br>
+ADD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000 11 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+ADC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00001 11 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+ADIW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0110 .. .. ....=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 @op_rd_imm6<br>
+SUB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00001 10 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+SUBI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0101 .... .... ....=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd_imm8<br>
+SBC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000 10 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+SBCI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0100 .... .... ....=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd_imm8<br>
+SBIW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0111 .. .. ....=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 @op_rd_imm6<br>
+AND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00010 00 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+ANDI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0111 .... .... ....=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd_imm8<br>
+OR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0010 10 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+ORI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00110 .... .... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd_imm8<br>
+EOR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00010 01 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+COM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 010 rd:5 0000<br>
+NEG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 010 rd:5 0001<br>
+INC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 010 rd:5 0011<br>
+DEC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 010 rd:5 1010<br>
+MUL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 11 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+MULS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0000 0010 .... ....=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;rd_rr=C2=A0 =C2=A0 =C2=A0 rd=3D%rd_a rr=3D%=
rr_a<br>
+MULSU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000 0011 0 ... 0 ...=C2=A0 =
=C2=A0 =C2=A0 =C2=A0@fmul<br>
+FMUL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0000 0011 0 ... 1 ...=C2=A0 =
=C2=A0 =C2=A0 =C2=A0@fmul<br>
+FMULS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000 0011 1 ... 0 ...=C2=A0 =
=C2=A0 =C2=A0 =C2=A0@fmul<br>
+FMULSU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0000 0011 1 ... 1 ...=C2=A0 =C2=
=A0 =C2=A0 =C2=A0@fmul<br>
+DES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0100 imm:4 1011<br=
>
+<br>
+#<br>
+# Branch Instructions<br>
+#<br>
+RJMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1100 imm:s12<br>
+IJMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0100 0000 1001<br>
+EIJMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0100 0001 1001<br>
+JMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 010 ..... 110 .=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 imm=3D%imm_call<br>
+RCALL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01101 imm:s12<br>
+ICALL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0101 0000 1001<br>
+EICALL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0101 0001 1001<br>
+CALL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 010 ..... 111 .=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 imm=3D%imm_call<br>
+RET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0101 0000 1000<br>
+RETI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0101 0001 1000<br>
+CPSE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0001 00 . ..... ....=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+CP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0001 01 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+CPC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000 01 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+CPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00011 .... .... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd_imm8<br>
+SBRC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1111 110 rr:5 0 bit:3<br>
+SBRS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1111 111 rr:5 0 bit:3<br>
+SBIC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 1001 reg:5 bit:3<br>
+SBIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 1011 reg:5 bit:3<br>
+BRBS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1111 00 ....... ...=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_bit_imm<br>
+BRBC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1111 01 ....... ...=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0@op_bit_imm<br>
+<br>
+#<br>
+# Data Transfer Instructions<br>
+#<br>
+MOV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00010 11 . ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @op_rd_rr<br>
+MOVW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0000 0001 .... ....=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;rd_rr=C2=A0 =C2=A0 =C2=A0 rd=3D%rd_d rr=3D%=
rr_d<br>
+LDI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01110 .... .... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@op_rd_imm8<br>
+LDS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 000 ..... 0000=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@ldst_s<br>
+LDX1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 rd:5 1100<br>
+LDX2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 rd:5 1101<br>
+LDX3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 rd:5 1110<br>
+LDY2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 rd:5 1001<br>
+LDY3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 rd:5 1010<br>
+LDZ2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 rd:5 0001<br>
+LDZ3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 rd:5 0010<br>
+LDDY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10 . 0 .. 0 ..... 1 ...=C2=
=A0 =C2=A0 =C2=A0@ldst_d<br>
+LDDZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10 . 0 .. 0 ..... 0 ...=C2=
=A0 =C2=A0 =C2=A0@ldst_d<br>
+STS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 001 ..... 0000=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@ldst_s<br>
+STX1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 001 rr:5 1100<br>
+STX2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 001 rr:5 1101<br>
+STX3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 001 rr:5 1110<br>
+STY2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 001 rd:5 1001<br>
+STY3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 001 rd:5 1010<br>
+STZ2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 001 rd:5 0001<br>
+STZ3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 001 rd:5 0010<br>
+STDY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10 . 0 .. 1 ..... 1 ...=C2=
=A0 =C2=A0 =C2=A0@ldst_d<br>
+STDZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10 . 0 .. 1 ..... 0 ...=C2=
=A0 =C2=A0 =C2=A0@ldst_d<br>
+LPM1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0101 1100 1000<br>
+LPM2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 rd:5 0100<br>
+LPMX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 000 rd:5 0101<br>
+ELPM1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0101 1101 1000<br>
+ELPM2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 000 rd:5 0110<br>
+ELPMX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 000 rd:5 0111<br>
+SPM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0101 1110 1000<br>
+SPMX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0101 1111 1000<br>
+IN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1011 0 .. ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @io_rd_imm<br>
+OUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01011 1 .. ..... ....=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 @io_rd_imm<br>
+PUSH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 001 rd:5 1111<br>
+POP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 000 rd:5 1111<br>
+XCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 001 rd:5 0100<br>
+LAC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 001 rd:5 0110<br>
+LAS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 001 rd:5 0101<br>
+LAT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 001 rd:5 0111<br>
+<br>
+#<br>
+# Bit and Bit-test Instructions<br>
+#<br>
+LSR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 010 rd:5 0110<br>
+ROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 010 rd:5 0111<br>
+ASR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 010 rd:5 0101<br>
+SWAP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 010 rd:5 0010<br>
+SBI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 1010 reg:5 bit:3<b=
r>
+CBI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 1000 reg:5 bit:3<b=
r>
+BST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01111 101 rd:5 0 bit:3<b=
r>
+BLD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01111 100 rd:5 0 bit:3<b=
r>
+BSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0100 0 bit:3 1000<br>
+BCLR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1001 0100 1 bit:3 1000<br>
+<br>
+#<br>
+# MCU Control Instructions<br>
+#<br>
+BREAK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0101 1001 1000<br>
+NOP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000 0000 0000 0000<br>
+SLEEP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0101 1000 1000<br>
+WDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01001 0101 1010 1000<br>
+<br>
-- <br>
2.17.2 (Apple Git-113)<br>
<br>
</blockquote>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
>Best Regards,<br>Michael Rolnik</div>
</blockquote>
</blockquote>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
>Best Regards,<br>Michael Rolnik</div>
</blockquote>

--00000000000056054c059ad8aa72--

