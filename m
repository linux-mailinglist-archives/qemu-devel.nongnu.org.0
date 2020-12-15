Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EF02DA7B9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 06:35:51 +0100 (CET)
Received: from localhost ([::1]:44954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp301-0008C1-N2
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 00:35:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1kp2yu-0007lf-G0
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 00:34:40 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:42156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1kp2ys-0005H5-5K
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 00:34:40 -0500
Received: by mail-io1-xd41.google.com with SMTP id q137so19282311iod.9
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 21:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dGDqe6/zYRQJyKHh7Ay6aF83I8KrzivBX6bXByejm/Y=;
 b=kvNXB7JXtJzhsopj20Zu8Sika9h0u1NR0rPeOSCX6gYH9ieSZJSvGAZjZG/GMaLU4w
 QJnV0fyD3j3rSy9joxx5rNoluCMu0005ndZGkSgDun2TtHFGd+vmj9HnPNSG0sM9v3lk
 6rUNFVi5aGscCwGI7RJtmv6COLfYRTS1EALkOqQ5L7Bm8H1B/NtiTDbMUT2QpEwh7X7a
 tZ90GYcXB7XBwDoJjvcOPwvYOG8AFTDkx/qzKHxjuG/MHwXaMit5e7CXAiIr9dwRPx2i
 U63DRqUXMmn49gmoICFhSrW7+XKtGWkvIjXo7VYgroxCnvbOPbPZZsxROcftjhO9UERR
 IDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dGDqe6/zYRQJyKHh7Ay6aF83I8KrzivBX6bXByejm/Y=;
 b=Uo5tQ1/uBLtnUjuGGkSB50J+OA/4A58F3OdoLqqTYsJpEgtb7OCabMK/knmud3+tT+
 T+1weFL+NYlDAkmOAxuzNHhHm20lvasoSVmtIqmaxDCFzGS/4RI6xOxwFlu8wM5JbGGj
 nE/Ula/gX/xt8CZ+c2wt+P8BxjlKjDL9u8j3BVyGz7O0h3TlB6dtb1f80/720VJy612E
 SE/gASQEsbcd8wq92+BuplbjTuw2F5DDQbxcEmTeV1xnHNuJ0Ijl3XwLH9ZUdusF6ard
 zRDfZ5xQhRzNtRoYBh7iRj9h+9BZrVQebaidPJPAZXgbpeLG+ufFwr8mW9HcbwIjp522
 pj2g==
X-Gm-Message-State: AOAM5305A3oUnvKleRaM0djJ3UlBL45uJILg6+uuZKBB/HVXSQ9Pyrvh
 q1rRSmXdtOl90pLty4ErLWEbUdiOP1FtsCPtOXI=
X-Google-Smtp-Source: ABdhPJzQa6qzSGhL51nayNtV6ytLhrf7WwtD7jZWln515Hv7EXB23zxvR5+Wh//+CXToc2pSpkG/ElPiEym1mkeDdF8=
X-Received: by 2002:a5e:db4b:: with SMTP id r11mr36043354iop.148.1608010476460; 
 Mon, 14 Dec 2020 21:34:36 -0800 (PST)
MIME-Version: 1.0
References: <1604636510-8347-1-git-send-email-chenhc@lemote.com>
 <1604636510-8347-5-git-send-email-chenhc@lemote.com>
 <e85cc640-e5f4-bec1-2e3a-b5a57abe21c7@amsat.org>
 <CAAhV-H7ALVV=3Gj4iq4TVqL+czm3kK+F_uKvxGTJB-wonpGRHw@mail.gmail.com>
 <215f01d5-3fad-1dc6-bb1b-e8face969e23@amsat.org>
 <CAAhV-H6d1gDGKha=D+TNg-vwTL_5+9ON+x9GCE0QsrQktby01A@mail.gmail.com>
 <1e7b7abd-cd4a-8f2a-2957-acd90884e0fd@amsat.org>
 <c1110933-4c84-5bf9-32c3-0348ac7a911d@amsat.org>
 <6965e11e-b967-c8fa-7ac0-4f1e88481d4e@amsat.org>
 <CAAhV-H47Boz1Eq+UvxBNuK0Xm5=Y4xVkmS4ewyoy8ns0s8Dwvg@mail.gmail.com>
 <0a679b8f-65a8-82d4-f713-44195277018f@amsat.org>
In-Reply-To: <0a679b8f-65a8-82d4-f713-44195277018f@amsat.org>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Tue, 15 Dec 2020 13:34:24 +0800
Message-ID: <CAAhV-H7B3+nGOmxiibUDf7-v1eU=aqrK5YBM6wVac=nDz+U4PQ@mail.gmail.com>
Subject: Re: [PATCH V17 4/6] hw/mips: Add Loongson-3 boot parameter helpers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=chenhuacai@gmail.com; helo=mail-io1-xd41.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Huacai Chen <zltjiangshi@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe,

On Mon, Dec 14, 2020 at 9:49 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 12/14/20 3:37 AM, Huacai Chen wrote:
> > Hi, Philippe,
> >
> > On Mon, Dec 14, 2020 at 7:09 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> >>
> >> On 12/13/20 11:17 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> On 12/11/20 12:32 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >>>> On 12/11/20 3:46 AM, Huacai Chen wrote:
> >>>>> Hi, Rechard and Peter,
> >>>>>
> >>>>> On Wed, Dec 2, 2020 at 5:32 PM Philippe Mathieu-Daud=C3=A9 <f4bug@a=
msat.org> wrote:
> >>>>>>
> >>>>>> On 12/2/20 2:14 AM, Huacai Chen wrote:
> >>>>>>> Hi, Phillippe,
> >>>>>>>
> >>>>>>> On Tue, Nov 24, 2020 at 6:25 AM Philippe Mathieu-Daud=C3=A9 <f4bu=
g@amsat.org> wrote:
> >>>>>>>>
> >>>>>>>> On 11/6/20 5:21 AM, Huacai Chen wrote:
> >>>>>>>>> Preparing to add Loongson-3 machine support, add Loongson-3's L=
EFI (a
> >>>>>>>>> UEFI-like interface for BIOS-Kernel boot parameters) helpers fi=
rst.
> >>>>>>>>>
> >>>>>>>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>>>>>>>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> >>>>>>>>> Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >>>>>>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >>>>>>>>> ---
> >>>>>>>>>  hw/mips/loongson3_bootp.c | 165 ++++++++++++++++++++++++++++++=
+
> >>>>>>>>>  hw/mips/loongson3_bootp.h | 241 ++++++++++++++++++++++++++++++=
++++++++++++++++
> >>>>>>>>>  hw/mips/meson.build       |   1 +
> >>>>>>>>>  3 files changed, 407 insertions(+)
> >>>>>>>>>  create mode 100644 hw/mips/loongson3_bootp.c
> >>>>>>>>>  create mode 100644 hw/mips/loongson3_bootp.h
> >>>>>>>>>
> >>>>>>>>> diff --git a/hw/mips/loongson3_bootp.c b/hw/mips/loongson3_boot=
p.c
> >>>>>>>>> new file mode 100644
> >>>>>>>>> index 0000000..3a16081
> >>>>>>>>> --- /dev/null
> >>>>>>>>> +++ b/hw/mips/loongson3_bootp.c
> >>>>>>>>> @@ -0,0 +1,165 @@
> >>>>>>>>> +/*
> >>>>>>>>> + * LEFI (a UEFI-like interface for BIOS-Kernel boot parameters=
) helpers
> >>>>>>>>> + *
> >>>>>>>>> + * Copyright (c) 2018-2020 Huacai Chen (chenhc@lemote.com)
> >>>>>>>>> + * Copyright (c) 2018-2020 Jiaxun Yang <jiaxun.yang@flygoat.co=
m>
> >>>>>>>>> + *
> >>>>>>>>> + * This program is free software: you can redistribute it and/=
or modify
> >>>>>>>>> + * it under the terms of the GNU General Public License as pub=
lished by
> >>>>>>>>> + * the Free Software Foundation, either version 2 of the Licen=
se, or
> >>>>>>>>> + * (at your option) any later version.
> >>>>>>>>> + *
> >>>>>>>>> + * This program is distributed in the hope that it will be use=
ful,
> >>>>>>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty=
 of
> >>>>>>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See th=
e
> >>>>>>>>> + * GNU General Public License for more details.
> >>>>>>>>> + *
> >>>>>>>>> + * You should have received a copy of the GNU General Public L=
icense
> >>>>>>>>> + * along with this program. If not, see <https://www.gnu.org/l=
icenses/>.
> >>>>>>>>> + */
> >>>>>>>>> +
> >>>>>>>>> +#include "qemu/osdep.h"
> >>>>>>>>> +#include "qemu/units.h"
> >>>>>>>>> +#include "qemu/cutils.h"
> >>>>>>>>> +#include "cpu.h"
> >>>>>>>>> +#include "hw/boards.h"
> >>>>>>>>> +#include "hw/mips/loongson3_bootp.h"
> >>>>>>>>> +
> >>>>>>>>> +#define LOONGSON3_CORE_PER_NODE 4
> >>>>>>>>> +
> >>>>>>>>> +static struct efi_cpuinfo_loongson *init_cpu_info(void *g_cpui=
nfo, uint64_t cpu_freq)
> >>>>>>>>> +{
> >>>>>>>>> +    struct efi_cpuinfo_loongson *c =3D g_cpuinfo;
> >>>>>>>>> +
> >>>>>>>>> +    stl_le_p(&c->cputype, Loongson_3A);
> >>>>>>>>> +    stl_le_p(&c->processor_id, MIPS_CPU(first_cpu)->env.CP0_PR=
id);
> >>>>>>>>
> >>>>>>>> Build failing with Clang:
> >>>>>>>>
> >>>>>>>> FAILED: libqemu-mips64el-softmmu.fa.p/hw_mips_loongson3_bootp.c.=
o
> >>>>>>>> hw/mips/loongson3_bootp.c:35:15: error: taking address of packed=
 member
> >>>>>>>> 'processor_id' of class or structure 'efi_cpuinfo_loongson' may =
result
> >>>>>>>> in an unaligned pointer value [-Werror,-Waddress-of-packed-membe=
r]
> >>>>>>>>     stl_le_p(&c->processor_id, MIPS_CPU(first_cpu)->env.CP0_PRid=
);
> >>>>>>>>               ^~~~~~~~~~~~~~~
> >>>>>>>> 1 error generated.
> >>>>>>> We cannot reproduce it on X86/MIPS with clang...
> >>>>>>
> >>>>>> You can reproduce running the Clang job on Gitlab-CI:
> >>>>>>
> >>>>>> https://wiki.qemu.org/Testing/CI/GitLabCI
> >>>>>>
> >>>>>>> And I found that
> >>>>>>> stl_le_p() will be __builtin_memcpy(), I don't think memcpy() wil=
l
> >>>>>>> cause unaligned access. So, any suggestions?
> >>>>
> >>>> My understanding is the compiler is complaining for the argument
> >>>> passed to the caller, with no knowledge of the callee implementation=
.
> >>>>
> >>>> Which makes me wonder if these functions are really inlined...
> >>>>
> >>>> Do we need to use QEMU_ALWAYS_INLINE for these LDST helpers?
> >>>
> >>> No, this doesn't work neither.
> >>
> >> Well, this works:
> >>
> >> -- >8 --
> >> @@ -32,7 +32,7 @@ static struct efi_cpuinfo_loongson *init_cpu_info(vo=
id
> >> *g_cpuinfo, uint64_t cpu_
> >>      struct efi_cpuinfo_loongson *c =3D g_cpuinfo;
> >>
> >>      stl_le_p(&c->cputype, Loongson_3A);
> >> -    stl_le_p(&c->processor_id, MIPS_CPU(first_cpu)->env.CP0_PRid);
> >> +    c->processor_id =3D cpu_to_le32(MIPS_CPU(first_cpu)->env.CP0_PRid=
);
> >>      if (cpu_freq > UINT_MAX) {
> >>          stl_le_p(&c->cpu_clock_freq, UINT_MAX);
> >>      } else {
> >
> > This seems not allowed. In include/qemu/bswap.h it says:
> >  * Do an in-place conversion of the value pointed to by @v from the
> >  * native endianness of the host CPU to the specified format.
> >  *
> >  * Both X_to_cpu() and cpu_to_X() perform the same operation; you
> >  * should use whichever one is better documenting of the function your
> >  * code is performing.
> >  *
> >  * Do not use these functions for conversion of values which are in gue=
st
> >  * memory, since the data may not be sufficiently aligned for the host =
CPU's
> >  * load and store instructions. Instead you should use the ld*_p() and
> >  * st*_p() functions, which perform loads and stores of data of any
> >  * required size and endianness and handle possible misalignment.
> >
> > And there is a very strange problem, nearly all 32bit members are
> > after a 16bit vers member, why only processor_id is special? Compiler
> > bug?
>
> This is what I wonder since some time but I don't have the knowledge
> to confirm.
>
> Indeed I commented the "stl_le_p(&c->processor_id, ...);" line,
> and there is no error for the following 32-bit values, which are
> similarly unlikely 32-bit aligned.
>
> FWIW I am using Fedora release 32 (Thirty Two), and 'cc -v':
>
>  clang version 10.0.1 (Fedora 10.0.1-3.fc32)
>  Target: x86_64-unknown-linux-gnu
>  clang -cc1 version 10.0.1 based upon LLVM 10.0.1 default target
> x86_64-unknown-linux-gnu
>
Since cpu_to_le32() "solve" the problem here, I want to use
cpu_to_lexx() for all members, do you agree?

Huacai

> >
> > Huacai
> >> ---
> >>
> >>>
> >>>>
> >>>> I see Richard used it in commit 80d9d1c6785 ("cputlb: Split out
> >>>> load/store_memop").
> >>>>
> >>>>>>
> >>>>>> I'll defer this question to Richard/Peter who have deeper understa=
nding.
> >>>>> Any sugguestions? Other patches are updated, except this one.
> >>>>
> >>>> Searching on the list, I see Marc-Andr=C3=A9 resolved that by
> >>>> using a copy on the stack:
> >>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg614482.html

