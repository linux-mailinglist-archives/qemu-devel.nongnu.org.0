Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43472DAAC6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 11:23:20 +0100 (CET)
Received: from localhost ([::1]:53598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp7UF-0004RN-RO
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 05:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kp7SM-0003CK-Se
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:21:22 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kp7SJ-0004Qt-6T
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:21:22 -0500
Received: by mail-ot1-f67.google.com with SMTP id 11so18815169oty.9
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 02:21:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9UKXKDLiydTpa6jKPgWE4x9dd66vErEGADwKvhT3ms4=;
 b=o3U2/uvCc2J8d91CoRGwzEbt3XjDJtjHm5GTxDs85WEJIEsYmK2p4W3HmP42CPP6mt
 68bRNacnzAl5Gkl4Rir7Szb/jgqxmHmRyJ63f9V1MJwEIBg+cGyUo90RwjJGT9KVpfZj
 8zjAZKN5RS6YrJVpxPv/xzJDN+pqe2nB+sJteOndjWtmc/fIjTVLrIoifqf2NevPcImT
 rWwCZCr5ukOAfUwMVCv7aH4GlWAWSAau0q4KiAZ6sRb9Xh87HsrX/OIjO8I2freaCfmS
 2HvYwhX93CjV+NVF1qSQXTiPQwfTveb6PnNQpmiQw/WnVA36g4B6OCdtIHIlgSQHUE4e
 eSbw==
X-Gm-Message-State: AOAM533QUqhLbOO1BsZ78tSsM4AbLspRm94XqVaF+7BKDgd3w7mvuKGD
 HeByZpy0B7gbV4L7XLfxdMeGCrgxd77Jb3I7068=
X-Google-Smtp-Source: ABdhPJxEmqxbvqSls/DkqK4Soa49vX4ad0GadLpY6kFMnFRlKcXBuTjZaQyIlFZJlpPqTtO/t6Vw7K8PmimRFGotP4c=
X-Received: by 2002:a9d:4b81:: with SMTP id k1mr22939143otf.371.1608027678027; 
 Tue, 15 Dec 2020 02:21:18 -0800 (PST)
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
 <CAAhV-H7B3+nGOmxiibUDf7-v1eU=aqrK5YBM6wVac=nDz+U4PQ@mail.gmail.com>
In-Reply-To: <CAAhV-H7B3+nGOmxiibUDf7-v1eU=aqrK5YBM6wVac=nDz+U4PQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 15 Dec 2020 11:21:04 +0100
Message-ID: <CAAdtpL7HFWFe+fP6h5v4mw8_gbJaAFNS+sMSoxro2kn9cJ0i-w@mail.gmail.com>
Subject: Re: [PATCH V17 4/6] hw/mips: Add Loongson-3 boot parameter helpers
To: Huacai Chen <chenhuacai@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000089b45605b67e1ef3"
Received-SPF: pass client-ip=209.85.210.67;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f67.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--00000000000089b45605b67e1ef3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 15 d=C3=A9c. 2020 06:34, Huacai Chen <chenhuacai@gmail.com> a =C3=
=A9crit :

> Hi, Philippe,
>
> On Mon, Dec 14, 2020 at 9:49 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org>
> wrote:
> >
> > On 12/14/20 3:37 AM, Huacai Chen wrote:
> > > Hi, Philippe,
> > >
> > > On Mon, Dec 14, 2020 at 7:09 AM Philippe Mathieu-Daud=C3=A9 <
> f4bug@amsat.org> wrote:
> > >>
> > >> On 12/13/20 11:17 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > >>> On 12/11/20 12:32 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > >>>> On 12/11/20 3:46 AM, Huacai Chen wrote:
> > >>>>> Hi, Rechard and Peter,
> > >>>>>
> > >>>>> On Wed, Dec 2, 2020 at 5:32 PM Philippe Mathieu-Daud=C3=A9 <
> f4bug@amsat.org> wrote:
> > >>>>>>
> > >>>>>> On 12/2/20 2:14 AM, Huacai Chen wrote:
> > >>>>>>> Hi, Phillippe,
> > >>>>>>>
> > >>>>>>> On Tue, Nov 24, 2020 at 6:25 AM Philippe Mathieu-Daud=C3=A9 <
> f4bug@amsat.org> wrote:
> > >>>>>>>>
> > >>>>>>>> On 11/6/20 5:21 AM, Huacai Chen wrote:
> > >>>>>>>>> Preparing to add Loongson-3 machine support, add Loongson-3's
> LEFI (a
> > >>>>>>>>> UEFI-like interface for BIOS-Kernel boot parameters) helpers
> first.
> > >>>>>>>>>
> > >>>>>>>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > >>>>>>>>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > >>>>>>>>> Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > >>>>>>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > >>>>>>>>> ---
> > >>>>>>>>>  hw/mips/loongson3_bootp.c | 165
> +++++++++++++++++++++++++++++++
> > >>>>>>>>>  hw/mips/loongson3_bootp.h | 241
> ++++++++++++++++++++++++++++++++++++++++++++++
> > >>>>>>>>>  hw/mips/meson.build       |   1 +
> > >>>>>>>>>  3 files changed, 407 insertions(+)
> > >>>>>>>>>  create mode 100644 hw/mips/loongson3_bootp.c
> > >>>>>>>>>  create mode 100644 hw/mips/loongson3_bootp.h
> > >>>>>>>>>
> > >>>>>>>>> diff --git a/hw/mips/loongson3_bootp.c
> b/hw/mips/loongson3_bootp.c
> > >>>>>>>>> new file mode 100644
> > >>>>>>>>> index 0000000..3a16081
> > >>>>>>>>> --- /dev/null
> > >>>>>>>>> +++ b/hw/mips/loongson3_bootp.c
> > >>>>>>>>> @@ -0,0 +1,165 @@
> > >>>>>>>>> +/*
> > >>>>>>>>> + * LEFI (a UEFI-like interface for BIOS-Kernel boot
> parameters) helpers
> > >>>>>>>>> + *
> > >>>>>>>>> + * Copyright (c) 2018-2020 Huacai Chen (chenhc@lemote.com)
> > >>>>>>>>> + * Copyright (c) 2018-2020 Jiaxun Yang <
> jiaxun.yang@flygoat.com>
> > >>>>>>>>> + *
> > >>>>>>>>> + * This program is free software: you can redistribute it
> and/or modify
> > >>>>>>>>> + * it under the terms of the GNU General Public License as
> published by
> > >>>>>>>>> + * the Free Software Foundation, either version 2 of the
> License, or
> > >>>>>>>>> + * (at your option) any later version.
> > >>>>>>>>> + *
> > >>>>>>>>> + * This program is distributed in the hope that it will be
> useful,
> > >>>>>>>>> + * but WITHOUT ANY WARRANTY; without even the implied
> warranty of
> > >>>>>>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
> the
> > >>>>>>>>> + * GNU General Public License for more details.
> > >>>>>>>>> + *
> > >>>>>>>>> + * You should have received a copy of the GNU General Public
> License
> > >>>>>>>>> + * along with this program. If not, see <
> https://www.gnu.org/licenses/>.
> > >>>>>>>>> + */
> > >>>>>>>>> +
> > >>>>>>>>> +#include "qemu/osdep.h"
> > >>>>>>>>> +#include "qemu/units.h"
> > >>>>>>>>> +#include "qemu/cutils.h"
> > >>>>>>>>> +#include "cpu.h"
> > >>>>>>>>> +#include "hw/boards.h"
> > >>>>>>>>> +#include "hw/mips/loongson3_bootp.h"
> > >>>>>>>>> +
> > >>>>>>>>> +#define LOONGSON3_CORE_PER_NODE 4
> > >>>>>>>>> +
> > >>>>>>>>> +static struct efi_cpuinfo_loongson *init_cpu_info(void
> *g_cpuinfo, uint64_t cpu_freq)
> > >>>>>>>>> +{
> > >>>>>>>>> +    struct efi_cpuinfo_loongson *c =3D g_cpuinfo;
> > >>>>>>>>> +
> > >>>>>>>>> +    stl_le_p(&c->cputype, Loongson_3A);
> > >>>>>>>>> +    stl_le_p(&c->processor_id,
> MIPS_CPU(first_cpu)->env.CP0_PRid);
> > >>>>>>>>
> > >>>>>>>> Build failing with Clang:
> > >>>>>>>>
> > >>>>>>>> FAILED:
> libqemu-mips64el-softmmu.fa.p/hw_mips_loongson3_bootp.c.o
> > >>>>>>>> hw/mips/loongson3_bootp.c:35:15: error: taking address of
> packed member
> > >>>>>>>> 'processor_id' of class or structure 'efi_cpuinfo_loongson' ma=
y
> result
> > >>>>>>>> in an unaligned pointer value
> [-Werror,-Waddress-of-packed-member]
> > >>>>>>>>     stl_le_p(&c->processor_id,
> MIPS_CPU(first_cpu)->env.CP0_PRid);
> > >>>>>>>>               ^~~~~~~~~~~~~~~
> > >>>>>>>> 1 error generated.
> > >>>>>>> We cannot reproduce it on X86/MIPS with clang...
> > >>>>>>
> > >>>>>> You can reproduce running the Clang job on Gitlab-CI:
> > >>>>>>
> > >>>>>> https://wiki.qemu.org/Testing/CI/GitLabCI
> > >>>>>>
> > >>>>>>> And I found that
> > >>>>>>> stl_le_p() will be __builtin_memcpy(), I don't think memcpy()
> will
> > >>>>>>> cause unaligned access. So, any suggestions?
> > >>>>
> > >>>> My understanding is the compiler is complaining for the argument
> > >>>> passed to the caller, with no knowledge of the callee
> implementation.
> > >>>>
> > >>>> Which makes me wonder if these functions are really inlined...
> > >>>>
> > >>>> Do we need to use QEMU_ALWAYS_INLINE for these LDST helpers?
> > >>>
> > >>> No, this doesn't work neither.
> > >>
> > >> Well, this works:
> > >>
> > >> -- >8 --
> > >> @@ -32,7 +32,7 @@ static struct efi_cpuinfo_loongson
> *init_cpu_info(void
> > >> *g_cpuinfo, uint64_t cpu_
> > >>      struct efi_cpuinfo_loongson *c =3D g_cpuinfo;
> > >>
> > >>      stl_le_p(&c->cputype, Loongson_3A);
> > >> -    stl_le_p(&c->processor_id, MIPS_CPU(first_cpu)->env.CP0_PRid);
> > >> +    c->processor_id =3D cpu_to_le32(MIPS_CPU(first_cpu)->env.CP0_PR=
id);
> > >>      if (cpu_freq > UINT_MAX) {
> > >>          stl_le_p(&c->cpu_clock_freq, UINT_MAX);
> > >>      } else {
> > >
> > > This seems not allowed. In include/qemu/bswap.h it says:
> > >  * Do an in-place conversion of the value pointed to by @v from the
> > >  * native endianness of the host CPU to the specified format.
> > >  *
> > >  * Both X_to_cpu() and cpu_to_X() perform the same operation; you
> > >  * should use whichever one is better documenting of the function you=
r
> > >  * code is performing.
> > >  *
> > >  * Do not use these functions for conversion of values which are in
> guest
> > >  * memory, since the data may not be sufficiently aligned for the hos=
t
> CPU's
> > >  * load and store instructions. Instead you should use the ld*_p() an=
d
> > >  * st*_p() functions, which perform loads and stores of data of any
> > >  * required size and endianness and handle possible misalignment.
> > >
> > > And there is a very strange problem, nearly all 32bit members are
> > > after a 16bit vers member, why only processor_id is special? Compiler
> > > bug?
> >
> > This is what I wonder since some time but I don't have the knowledge
> > to confirm.
> >
> > Indeed I commented the "stl_le_p(&c->processor_id, ...);" line,
> > and there is no error for the following 32-bit values, which are
> > similarly unlikely 32-bit aligned.
> >
> > FWIW I am using Fedora release 32 (Thirty Two), and 'cc -v':
> >
> >  clang version 10.0.1 (Fedora 10.0.1-3.fc32)
> >  Target: x86_64-unknown-linux-gnu
> >  clang -cc1 version 10.0.1 based upon LLVM 10.0.1 default target
> > x86_64-unknown-linux-gnu
> >
> Since cpu_to_le32() "solve" the problem here, I want to use
> cpu_to_lexx() for all members, do you agree?
>

Fine by me. We can switch back to the recommended ldst helpers later, when
someone figure out the problem.


> Huacai
>
> > >
> > > Huacai
> > >> ---
> > >>
> > >>>
> > >>>>
> > >>>> I see Richard used it in commit 80d9d1c6785 ("cputlb: Split out
> > >>>> load/store_memop").
> > >>>>
> > >>>>>>
> > >>>>>> I'll defer this question to Richard/Peter who have deeper
> understanding.
> > >>>>> Any sugguestions? Other patches are updated, except this one.
> > >>>>
> > >>>> Searching on the list, I see Marc-Andr=C3=A9 resolved that by
> > >>>> using a copy on the stack:
> > >>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg614482.html
>

--00000000000089b45605b67e1ef3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Le mar. 15 d=C3=A9c. 2020 06:34, Huacai Chen &lt;<a href=3D"ma=
ilto:chenhuacai@gmail.com">chenhuacai@gmail.com</a>&gt; a =C3=A9crit=C2=A0:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Hi, Philippe,<br>
<br>
On Mon, Dec 14, 2020 at 9:49 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"=
mailto:f4bug@amsat.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.or=
g</a>&gt; wrote:<br>
&gt;<br>
&gt; On 12/14/20 3:37 AM, Huacai Chen wrote:<br>
&gt; &gt; Hi, Philippe,<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Dec 14, 2020 at 7:09 AM Philippe Mathieu-Daud=C3=A9 &lt;<=
a href=3D"mailto:f4bug@amsat.org" target=3D"_blank" rel=3D"noreferrer">f4bu=
g@amsat.org</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On 12/13/20 11:17 PM, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; &gt;&gt;&gt; On 12/11/20 12:32 PM, Philippe Mathieu-Daud=C3=A9 wrote:<=
br>
&gt; &gt;&gt;&gt;&gt; On 12/11/20 3:46 AM, Huacai Chen wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt; Hi, Rechard and Peter,<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; On Wed, Dec 2, 2020 at 5:32 PM Philippe Mathieu-D=
aud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank" rel=3D"n=
oreferrer">f4bug@amsat.org</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; On 12/2/20 2:14 AM, Huacai Chen wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; Hi, Phillippe,<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; On Tue, Nov 24, 2020 at 6:25 AM Philippe =
Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank"=
 rel=3D"noreferrer">f4bug@amsat.org</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On 11/6/20 5:21 AM, Huacai Chen wrote=
:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Preparing to add Loongson-3 machi=
ne support, add Loongson-3&#39;s LEFI (a<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; UEFI-like interface for BIOS-Kern=
el boot parameters) helpers first.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Reviewed-by: Philippe Mathieu-Dau=
d=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank" rel=3D"nor=
eferrer">f4bug@amsat.org</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Huacai Chen &lt;<a=
 href=3D"mailto:chenhc@lemote.com" target=3D"_blank" rel=3D"noreferrer">che=
nhc@lemote.com</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Co-developed-by: Jiaxun Yang &lt;=
<a href=3D"mailto:jiaxun.yang@flygoat.com" target=3D"_blank" rel=3D"norefer=
rer">jiaxun.yang@flygoat.com</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Jiaxun Yang &lt;<a=
 href=3D"mailto:jiaxun.yang@flygoat.com" target=3D"_blank" rel=3D"noreferre=
r">jiaxun.yang@flygoat.com</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 hw/mips/loongson3_bootp.c |=
 165 +++++++++++++++++++++++++++++++<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 hw/mips/loongson3_bootp.h |=
 241 ++++++++++++++++++++++++++++++++++++++++++++++<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 hw/mips/meson.build=C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 3 files changed, 407 insert=
ions(+)<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 create mode 100644 hw/mips/=
loongson3_bootp.c<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 create mode 100644 hw/mips/=
loongson3_bootp.h<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/hw/mips/loongson3_bo=
otp.c b/hw/mips/loongson3_bootp.c<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; new file mode 100644<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; index 0000000..3a16081<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- /dev/null<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/hw/mips/loongson3_bootp.c<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -0,0 +1,165 @@<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +/*<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + * LEFI (a UEFI-like interface f=
or BIOS-Kernel boot parameters) helpers<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + *<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + * Copyright (c) 2018-2020 Huaca=
i Chen (<a href=3D"mailto:chenhc@lemote.com" target=3D"_blank" rel=3D"noref=
errer">chenhc@lemote.com</a>)<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + * Copyright (c) 2018-2020 Jiaxu=
n Yang &lt;<a href=3D"mailto:jiaxun.yang@flygoat.com" target=3D"_blank" rel=
=3D"noreferrer">jiaxun.yang@flygoat.com</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + *<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + * This program is free software=
: you can redistribute it and/or modify<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + * it under the terms of the GNU=
 General Public License as published by<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + * the Free Software Foundation,=
 either version 2 of the License, or<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + * (at your option) any later ve=
rsion.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + *<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + * This program is distributed i=
n the hope that it will be useful,<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + * but WITHOUT ANY WARRANTY; wit=
hout even the implied warranty of<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + * MERCHANTABILITY or FITNESS FO=
R A PARTICULAR PURPOSE. See the<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + * GNU General Public License fo=
r more details.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + *<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + * You should have received a co=
py of the GNU General Public License<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + * along with this program. If n=
ot, see &lt;<a href=3D"https://www.gnu.org/licenses/" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">https://www.gnu.org/licenses/</a>&gt;.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + */<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#include &quot;qemu/osdep.h&quot=
;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#include &quot;qemu/units.h&quot=
;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#include &quot;qemu/cutils.h&quo=
t;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#include &quot;cpu.h&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#include &quot;hw/boards.h&quot;=
<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#include &quot;hw/mips/loongson3=
_bootp.h&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#define LOONGSON3_CORE_PER_NODE =
4<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +static struct efi_cpuinfo_loongs=
on *init_cpu_info(void *g_cpuinfo, uint64_t cpu_freq)<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +{<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 struct efi_cpuinfo=
_loongson *c =3D g_cpuinfo;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 stl_le_p(&amp;c-&g=
t;cputype, Loongson_3A);<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 stl_le_p(&amp;c-&g=
t;processor_id, MIPS_CPU(first_cpu)-&gt;env.CP0_PRid);<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Build failing with Clang:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; FAILED: libqemu-mips64el-softmmu.fa.p=
/hw_mips_loongson3_bootp.c.o<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; hw/mips/loongson3_bootp.c:35:15: erro=
r: taking address of packed member<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#39;processor_id&#39; of class or st=
ructure &#39;efi_cpuinfo_loongson&#39; may result<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; in an unaligned pointer value [-Werro=
r,-Waddress-of-packed-member]<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0stl_le_p(&amp;c-&g=
t;processor_id, MIPS_CPU(first_cpu)-&gt;env.CP0_PRid);<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; 1 error generated.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; We cannot reproduce it on X86/MIPS with c=
lang...<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; You can reproduce running the Clang job on Gi=
tlab-CI:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://wiki.qemu.org/Testing/CI/G=
itLabCI" rel=3D"noreferrer noreferrer" target=3D"_blank">https://wiki.qemu.=
org/Testing/CI/GitLabCI</a><br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; And I found that<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; stl_le_p() will be __builtin_memcpy(), I =
don&#39;t think memcpy() will<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; cause unaligned access. So, any suggestio=
ns?<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; My understanding is the compiler is complaining for t=
he argument<br>
&gt; &gt;&gt;&gt;&gt; passed to the caller, with no knowledge of the callee=
 implementation.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Which makes me wonder if these functions are really i=
nlined...<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Do we need to use QEMU_ALWAYS_INLINE for these LDST h=
elpers?<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; No, this doesn&#39;t work neither.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Well, this works:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -- &gt;8 --<br>
&gt; &gt;&gt; @@ -32,7 +32,7 @@ static struct efi_cpuinfo_loongson *init_cp=
u_info(void<br>
&gt; &gt;&gt; *g_cpuinfo, uint64_t cpu_<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 struct efi_cpuinfo_loongson *c =3D g_cpui=
nfo;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 stl_le_p(&amp;c-&gt;cputype, Loongson_3A)=
;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 stl_le_p(&amp;c-&gt;processor_id, MIPS_CPU(fir=
st_cpu)-&gt;env.CP0_PRid);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 c-&gt;processor_id =3D cpu_to_le32(MIPS_CPU(fi=
rst_cpu)-&gt;env.CP0_PRid);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (cpu_freq &gt; UINT_MAX) {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stl_le_p(&amp;c-&gt;cpu_clo=
ck_freq, UINT_MAX);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt;<br>
&gt; &gt; This seems not allowed. In include/qemu/bswap.h it says:<br>
&gt; &gt;=C2=A0 * Do an in-place conversion of the value pointed to by @v f=
rom the<br>
&gt; &gt;=C2=A0 * native endianness of the host CPU to the specified format=
.<br>
&gt; &gt;=C2=A0 *<br>
&gt; &gt;=C2=A0 * Both X_to_cpu() and cpu_to_X() perform the same operation=
; you<br>
&gt; &gt;=C2=A0 * should use whichever one is better documenting of the fun=
ction your<br>
&gt; &gt;=C2=A0 * code is performing.<br>
&gt; &gt;=C2=A0 *<br>
&gt; &gt;=C2=A0 * Do not use these functions for conversion of values which=
 are in guest<br>
&gt; &gt;=C2=A0 * memory, since the data may not be sufficiently aligned fo=
r the host CPU&#39;s<br>
&gt; &gt;=C2=A0 * load and store instructions. Instead you should use the l=
d*_p() and<br>
&gt; &gt;=C2=A0 * st*_p() functions, which perform loads and stores of data=
 of any<br>
&gt; &gt;=C2=A0 * required size and endianness and handle possible misalign=
ment.<br>
&gt; &gt;<br>
&gt; &gt; And there is a very strange problem, nearly all 32bit members are=
<br>
&gt; &gt; after a 16bit vers member, why only processor_id is special? Comp=
iler<br>
&gt; &gt; bug?<br>
&gt;<br>
&gt; This is what I wonder since some time but I don&#39;t have the knowled=
ge<br>
&gt; to confirm.<br>
&gt;<br>
&gt; Indeed I commented the &quot;stl_le_p(&amp;c-&gt;processor_id, ...);&q=
uot; line,<br>
&gt; and there is no error for the following 32-bit values, which are<br>
&gt; similarly unlikely 32-bit aligned.<br>
&gt;<br>
&gt; FWIW I am using Fedora release 32 (Thirty Two), and &#39;cc -v&#39;:<b=
r>
&gt;<br>
&gt;=C2=A0 clang version 10.0.1 (Fedora 10.0.1-3.fc32)<br>
&gt;=C2=A0 Target: x86_64-unknown-linux-gnu<br>
&gt;=C2=A0 clang -cc1 version 10.0.1 based upon LLVM 10.0.1 default target<=
br>
&gt; x86_64-unknown-linux-gnu<br>
&gt;<br>
Since cpu_to_le32() &quot;solve&quot; the problem here, I want to use<br>
cpu_to_lexx() for all members, do you agree?<br></blockquote></div></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Fine by me. We can switch back =
to the recommended ldst helpers later, when someone figure out the problem.=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
<br>
Huacai<br>
<br>
&gt; &gt;<br>
&gt; &gt; Huacai<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; I see Richard used it in commit 80d9d1c6785 (&quot;cp=
utlb: Split out<br>
&gt; &gt;&gt;&gt;&gt; load/store_memop&quot;).<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; I&#39;ll defer this question to Richard/Peter=
 who have deeper understanding.<br>
&gt; &gt;&gt;&gt;&gt;&gt; Any sugguestions? Other patches are updated, exce=
pt this one.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Searching on the list, I see Marc-Andr=C3=A9 resolved=
 that by<br>
&gt; &gt;&gt;&gt;&gt; using a copy on the stack:<br>
&gt; &gt;&gt;&gt;&gt; <a href=3D"https://www.mail-archive.com/qemu-devel@no=
ngnu.org/msg614482.html" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://www.mail-archive.com/qemu-devel@nongnu.org/msg614482.html</a><br>
</blockquote></div></div></div>

--00000000000089b45605b67e1ef3--

