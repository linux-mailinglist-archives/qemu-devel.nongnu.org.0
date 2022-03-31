Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC024EDAEB
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 15:52:50 +0200 (CEST)
Received: from localhost ([::1]:46842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZvEG-0007BU-Vd
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 09:52:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZvBZ-0006Fx-Fk
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:50:01 -0400
Received: from [2a00:1450:4864:20::42e] (port=35674
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZvBV-0005is-GS
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:50:00 -0400
Received: by mail-wr1-x42e.google.com with SMTP id w21so29364774wra.2
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 06:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5PVK41zNsWh+SKF4lGQLRKwXVLQFfPHmPP+9TBxYaQM=;
 b=LoUwnTCuDAI5IrR0ohf7Kou/YbY3p72Za16BzkKRz3FvXaxuUlb8LCvlixOO4rU3bg
 cbAlhi5c4ef1Z0cevNqhU0N+35VgL0yX9lEWNIn/ZtLmlIjb6NjLDrQhe5wD0q9khEl5
 PcWhRjcE/s24Fc62yhgsJAS6/PFYQP/Dr+JKMw9RBNIVbeANxjl+ONJVuq4tG4Yb8ouM
 DBYNl93SnvodTTKyIXBA+KvVpFWeCx4qAZXFZlaGmaRLW6WoZw4hSZc1oVMZfUp5rsOM
 XQ36gGzQV4XQdVx+2DoBIg7K5dCuOzVGA7uNcYo67hinZYTDCKRwh7B5zUAz3e6kblTv
 u8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5PVK41zNsWh+SKF4lGQLRKwXVLQFfPHmPP+9TBxYaQM=;
 b=hTSDCcxobv+s4DIJ3s9zLhVDtnYJ9oAkXq3EBSyQN9zVbp6s9ikB5Tv227ot3TDvW/
 KbnDXTUfiZc3qRlKPVk/t/2FHdTutYbJsv82fGXViiDuonsmvDhy66Q5InNXuU5kjgKk
 GFIB2nd0hxt0P/jRDEs4h9ZmEc5j8Cd3oZW9m2mm34VTynSBPmOVNEiYIUO1cjWKmPpk
 F3rLCG2eJsd8seKQwKmflI1kX+ryBh6/5pXmw/qymPHV/jvlVcJY5eofvtogR1Qvp8Aj
 ZqbXCNktKTOkqZdyWPbcawwWgPpcrK3Kfk2RqpyFxybN/7+99OBAYT3UK5n3IjGKbBMo
 JEew==
X-Gm-Message-State: AOAM5322Qe0T3t8hL7AhoGknLvzRp93EyBB0qL16uY9vV85bKhxXmaaS
 x/WxcvzqztFHAoeTv8HIODyhkueYUx7nMtfu6lQ=
X-Google-Smtp-Source: ABdhPJxXkCxRzGaI2b4iEuSQ5dPyPChtmqU74LHBxQaqDtKJOVYBvvQ7yM76P4iWF1sZ9XzEpSxUyYww705pSCbEoW0=
X-Received: by 2002:a05:6000:156e:b0:203:d6e6:c475 with SMTP id
 14-20020a056000156e00b00203d6e6c475mr4244800wrz.326.1648734594730; Thu, 31
 Mar 2022 06:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220330123603.107120-1-frankja@linux.ibm.com>
 <20220330123603.107120-3-frankja@linux.ibm.com>
 <CAJ+F1CKk9_4PZqQ_ixAcQxpfVe6rgUkULV3EkpBRYgKi2B9Kdg@mail.gmail.com>
 <e88ab8c0-8ec0-150c-e1ad-e171f4bd6a65@linux.ibm.com>
In-Reply-To: <e88ab8c0-8ec0-150c-e1ad-e171f4bd6a65@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 31 Mar 2022 17:49:42 +0400
Message-ID: <CAJ+F1CL89C6sKaQhp4bCQLtxT-duZfJhKb4dvFur6eKkPbVjSQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] dump: Remove the sh_info variable
To: Janosch Frank <frankja@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000d90e9c05db83ef51"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d90e9c05db83ef51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Mar 31, 2022 at 1:47 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> On 3/31/22 10:58, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Mar 30, 2022 at 4:48 PM Janosch Frank <frankja@linux.ibm.com>
> wrote:
> >
> >> There's no need to have phdr_num and sh_info at the same time. We can
> >> make phdr_num 32 bit and set PN_XNUM when we write the header if
> >> phdr_num >=3D PN_XNUM.
> >>
> >
> > I am not fond of this change tbh, mixing variables, casting a u32 to
> u16..
> >
> > Could you provide more motivation? This seems to contradict also your
> > cleanup approach in the later patch "Add more offset variables".
>
> I can't fully follow you there. Where do I cast to u16 or mix variables?
>

"uint16_t phnum =3D s->phdr_num >=3D PN_XNUM ? PN_XNUM : s->phdr_num"

It's an implicit type casting from u32.

As for mixing variables, we used to have this obvious:

        shdr64.sh_info =3D cpu_to_dump32(s, s->sh_info);

And now:

        shdr64.sh_info =3D cpu_to_dump32(s, s->phdr_num);




> My idea for this change:
> ph_num is made independent of the data structure that it ends up in. We
> use ph_num as the only source for decisions and elf structure
> manipulation down the line since it contains the maximum possible number
> of section headers.
>
> This way we move the extra handling to the locations where it belongs
> and where an explanation for that behavior makes most sense:
> The ehdr write function and the section write function
>
> Without knowing the ELF spec, could you tell me what sh_info stores when
> first reading this code? Going from the name it might be section header
> information, whatever that would mean.
>
> I'd be happy to add comments to write_elf(32|64)_header() though so it's
> a bit more clear why we need to set PN_XNUM. I've already added one to
> dump_begin but that's not where we use PN_XNUM.
> >> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

The more we could clarify and document the code, the better ;) But since
you already got the change approved by Richard, I won't hold it.

thanks



> >> ---
> >>   dump/dump.c           | 34 ++++++++++++++--------------------
> >>   include/sysemu/dump.h |  3 +--
> >>   2 files changed, 15 insertions(+), 22 deletions(-)
> >>
> >> diff --git a/dump/dump.c b/dump/dump.c
> >> index 58c4923fce..0e6187c962 100644
> >> --- a/dump/dump.c
> >> +++ b/dump/dump.c
> >> @@ -124,6 +124,7 @@ static int fd_write_vmcore(const void *buf, size_t
> >> size, void *opaque)
> >>
> >>   static void write_elf64_header(DumpState *s, Error **errp)
> >>   {
> >> +    uint16_t phnum =3D s->phdr_num >=3D PN_XNUM ? PN_XNUM : s->phdr_n=
um;
> >>
> >
> > Please use MIN()
> >
> >
> >>       Elf64_Ehdr elf_header;
> >>       int ret;
> >>
> >> @@ -138,9 +139,9 @@ static void write_elf64_header(DumpState *s, Error
> >> **errp)
> >>       elf_header.e_ehsize =3D cpu_to_dump16(s, sizeof(elf_header));
> >>       elf_header.e_phoff =3D cpu_to_dump64(s, sizeof(Elf64_Ehdr));
> >>       elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf64_Phdr));
> >> -    elf_header.e_phnum =3D cpu_to_dump16(s, s->phdr_num);
> >> +    elf_header.e_phnum =3D cpu_to_dump16(s, phnum);
> >>       if (s->have_section) {
> >> -        uint64_t shoff =3D sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr) *
> >> s->sh_info;
> >> +        uint64_t shoff =3D sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr) *
> >> s->phdr_num;
> >>
> >>           elf_header.e_shoff =3D cpu_to_dump64(s, shoff);
> >>           elf_header.e_shentsize =3D cpu_to_dump16(s, sizeof(Elf64_Shd=
r));
> >> @@ -155,6 +156,7 @@ static void write_elf64_header(DumpState *s, Error
> >> **errp)
> >>
> >>   static void write_elf32_header(DumpState *s, Error **errp)
> >>   {
> >> +    uint16_t phnum =3D s->phdr_num >=3D PN_XNUM ? PN_XNUM : s->phdr_n=
um;
> >>
> >
> > same
> >
> >
> >>       Elf32_Ehdr elf_header;
> >>       int ret;
> >>
> >> @@ -169,9 +171,9 @@ static void write_elf32_header(DumpState *s, Error
> >> **errp)
> >>       elf_header.e_ehsize =3D cpu_to_dump16(s, sizeof(elf_header));
> >>       elf_header.e_phoff =3D cpu_to_dump32(s, sizeof(Elf32_Ehdr));
> >>       elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf32_Phdr));
> >> -    elf_header.e_phnum =3D cpu_to_dump16(s, s->phdr_num);
> >> +    elf_header.e_phnum =3D cpu_to_dump16(s, phnum);
> >>       if (s->have_section) {
> >> -        uint32_t shoff =3D sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) *
> >> s->sh_info;
> >> +        uint32_t shoff =3D sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) *
> >> s->phdr_num;
> >>
> >>           elf_header.e_shoff =3D cpu_to_dump32(s, shoff);
> >>           elf_header.e_shentsize =3D cpu_to_dump16(s, sizeof(Elf32_Shd=
r));
> >> @@ -358,12 +360,12 @@ static void write_elf_section(DumpState *s, int
> >> type, Error **errp)
> >>       if (type =3D=3D 0) {
> >>           shdr_size =3D sizeof(Elf32_Shdr);
> >>           memset(&shdr32, 0, shdr_size);
> >> -        shdr32.sh_info =3D cpu_to_dump32(s, s->sh_info);
> >> +        shdr32.sh_info =3D cpu_to_dump32(s, s->phdr_num);
> >>           shdr =3D &shdr32;
> >>       } else {
> >>           shdr_size =3D sizeof(Elf64_Shdr);
> >>           memset(&shdr64, 0, shdr_size);
> >> -        shdr64.sh_info =3D cpu_to_dump32(s, s->sh_info);
> >> +        shdr64.sh_info =3D cpu_to_dump32(s, s->phdr_num);
> >>           shdr =3D &shdr64;
> >>       }
> >>
> >> @@ -478,13 +480,6 @@ static void write_elf_loads(DumpState *s, Error
> >> **errp)
> >>       hwaddr offset, filesz;
> >>       MemoryMapping *memory_mapping;
> >>       uint32_t phdr_index =3D 1;
> >> -    uint32_t max_index;
> >> -
> >> -    if (s->have_section) {
> >> -        max_index =3D s->sh_info;
> >> -    } else {
> >> -        max_index =3D s->phdr_num;
> >> -    }
> >>
> >>       QTAILQ_FOREACH(memory_mapping, &s->list.head, next) {
> >>           get_offset_range(memory_mapping->phys_addr,
> >> @@ -502,7 +497,7 @@ static void write_elf_loads(DumpState *s, Error
> **errp)
> >>               return;
> >>           }
> >>
> >> -        if (phdr_index >=3D max_index) {
> >> +        if (phdr_index >=3D s->phdr_num) {
> >>               break;
> >>           }
> >>       }
> >> @@ -1801,22 +1796,21 @@ static void dump_init(DumpState *s, int fd, bo=
ol
> >> has_format,
> >>           s->phdr_num +=3D s->list.num;
> >>           s->have_section =3D false;
> >>       } else {
> >> +        /* sh_info of section 0 holds the real number of phdrs */
> >>           s->have_section =3D true;
> >> -        s->phdr_num =3D PN_XNUM;
> >> -        s->sh_info =3D 1; /* PT_NOTE */
> >>
> >>           /* the type of shdr->sh_info is uint32_t, so we should avoid
> >> overflow */
> >>           if (s->list.num <=3D UINT32_MAX - 1) {
> >> -            s->sh_info +=3D s->list.num;
> >> +            s->phdr_num +=3D s->list.num;
> >>           } else {
> >> -            s->sh_info =3D UINT32_MAX;
> >> +            s->phdr_num =3D UINT32_MAX;
> >>           }
> >>       }
> >>
> >>       if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> >>           if (s->have_section) {
> >>               s->memory_offset =3D sizeof(Elf64_Ehdr) +
> >> -                               sizeof(Elf64_Phdr) * s->sh_info +
> >> +                               sizeof(Elf64_Phdr) * s->phdr_num +
> >>                                  sizeof(Elf64_Shdr) + s->note_size;
> >>           } else {
> >>               s->memory_offset =3D sizeof(Elf64_Ehdr) +
> >> @@ -1825,7 +1819,7 @@ static void dump_init(DumpState *s, int fd, bool
> >> has_format,
> >>       } else {
> >>           if (s->have_section) {
> >>               s->memory_offset =3D sizeof(Elf32_Ehdr) +
> >> -                               sizeof(Elf32_Phdr) * s->sh_info +
> >> +                               sizeof(Elf32_Phdr) * s->phdr_num +
> >>                                  sizeof(Elf32_Shdr) + s->note_size;
> >>           } else {
> >>               s->memory_offset =3D sizeof(Elf32_Ehdr) +
> >> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> >> index 250143cb5a..b463fc9c02 100644
> >> --- a/include/sysemu/dump.h
> >> +++ b/include/sysemu/dump.h
> >> @@ -154,8 +154,7 @@ typedef struct DumpState {
> >>       GuestPhysBlockList guest_phys_blocks;
> >>       ArchDumpInfo dump_info;
> >>       MemoryMappingList list;
> >> -    uint16_t phdr_num;
> >> -    uint32_t sh_info;
> >> +    uint32_t phdr_num;
> >>       bool have_section;
> >>       bool resume;
> >>       bool detached;
> >> --
> >> 2.32.0
> >>
> >>
> >>
> >
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d90e9c05db83ef51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 31, 2022 at 1:47 PM Jan=
osch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 3/31/22 10:58, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Wed, Mar 30, 2022 at 4:48 PM Janosch Frank &lt;<a href=3D"mailto:fr=
ankja@linux.ibm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt; wrote:=
<br>
&gt; <br>
&gt;&gt; There&#39;s no need to have phdr_num and sh_info at the same time.=
 We can<br>
&gt;&gt; make phdr_num 32 bit and set PN_XNUM when we write the header if<b=
r>
&gt;&gt; phdr_num &gt;=3D PN_XNUM.<br>
&gt;&gt;<br>
&gt; <br>
&gt; I am not fond of this change tbh, mixing variables, casting a u32 to u=
16..<br>
&gt; <br>
&gt; Could you provide more motivation? This seems to contradict also your<=
br>
&gt; cleanup approach in the later patch &quot;Add more offset variables&qu=
ot;.<br>
<br>
I can&#39;t fully follow you there. Where do I cast to u16 or mix variables=
?<br></blockquote><div><br></div><div>&quot;uint16_t phnum =3D s-&gt;phdr_n=
um &gt;=3D PN_XNUM ? PN_XNUM : s-&gt;phdr_num&quot;</div><div><br></div><di=
v>It&#39;s an implicit type casting from u32.</div><div><br></div><div>As f=
or mixing variables, we used to have this obvious:<br></div><div><br> </div=
><div>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64.sh_info =3D cpu_to_dump32(s, s-&gt;sh_in=
fo);</div><div><br></div><div>And now:</div><div><br>
</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64.sh_info =3D cpu_to_dump32(s, =
s-&gt;phdr_num);</div><div><br></div><div><br></div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
My idea for this change:<br>
ph_num is made independent of the data structure that it ends up in. We <br=
>
use ph_num as the only source for decisions and elf structure <br>
manipulation down the line since it contains the maximum possible number <b=
r>
of section headers.<br>
<br>
This way we move the extra handling to the locations where it belongs <br>
and where an explanation for that behavior makes most sense:<br>
The ehdr write function and the section write function<br>
<br>
Without knowing the ELF spec, could you tell me what sh_info stores when <b=
r>
first reading this code? Going from the name it might be section header <br=
>
information, whatever that would mean.<br>
<br>
I&#39;d be happy to add comments to write_elf(32|64)_header() though so it&=
#39;s <br>
a bit more clear why we need to set PN_XNUM. I&#39;ve already added one to =
<br>
dump_begin but that&#39;s not where we use PN_XNUM.<br>
&gt;&gt; Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.i=
bm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
&gt;&gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.hende=
rson@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>=
</blockquote><div><br></div><div>The more we could clarify and document the=
 code, the better ;) But since you already got the change approved by Richa=
rd, I won&#39;t hold it.<br></div><div><br></div><div>thanks<br></div><div>=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
34 ++++++++++++++--------------------<br>
&gt;&gt;=C2=A0 =C2=A0include/sysemu/dump.h |=C2=A0 3 +--<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 15 insertions(+), 22 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/dump/dump.c b/dump/dump.c<br>
&gt;&gt; index 58c4923fce..0e6187c962 100644<br>
&gt;&gt; --- a/dump/dump.c<br>
&gt;&gt; +++ b/dump/dump.c<br>
&gt;&gt; @@ -124,6 +124,7 @@ static int fd_write_vmcore(const void *buf, si=
ze_t<br>
&gt;&gt; size, void *opaque)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0static void write_elf64_header(DumpState *s, Error **e=
rrp)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 uint16_t phnum =3D s-&gt;phdr_num &gt;=3D PN_XNUM ?=
 PN_XNUM : s-&gt;phdr_num;<br>
&gt;&gt;<br>
&gt; <br>
&gt; Please use MIN()<br>
&gt; <br>
&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Elf64_Ehdr elf_header;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;&gt;<br>
&gt;&gt; @@ -138,9 +139,9 @@ static void write_elf64_header(DumpState *s, E=
rror<br>
&gt;&gt; **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_ehsize =3D cpu_to_dump16(s,=
 sizeof(elf_header));<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_phoff =3D cpu_to_dump64(s, =
sizeof(Elf64_Ehdr));<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_phentsize =3D cpu_to_dump16=
(s, sizeof(Elf64_Phdr));<br>
&gt;&gt; -=C2=A0 =C2=A0 elf_header.e_phnum =3D cpu_to_dump16(s, s-&gt;phdr_=
num);<br>
&gt;&gt; +=C2=A0 =C2=A0 elf_header.e_phnum =3D cpu_to_dump16(s, phnum);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;have_section) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t shoff =3D sizeof(Elf64_Ehdr)=
 + sizeof(Elf64_Phdr) *<br>
&gt;&gt; s-&gt;sh_info;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t shoff =3D sizeof(Elf64_Ehdr)=
 + sizeof(Elf64_Phdr) *<br>
&gt;&gt; s-&gt;phdr_num;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_shoff =3D cpu=
_to_dump64(s, shoff);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_shentsize =3D=
 cpu_to_dump16(s, sizeof(Elf64_Shdr));<br>
&gt;&gt; @@ -155,6 +156,7 @@ static void write_elf64_header(DumpState *s, E=
rror<br>
&gt;&gt; **errp)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0static void write_elf32_header(DumpState *s, Error **e=
rrp)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 uint16_t phnum =3D s-&gt;phdr_num &gt;=3D PN_XNUM ?=
 PN_XNUM : s-&gt;phdr_num;<br>
&gt;&gt;<br>
&gt; <br>
&gt; same<br>
&gt; <br>
&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Elf32_Ehdr elf_header;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;&gt;<br>
&gt;&gt; @@ -169,9 +171,9 @@ static void write_elf32_header(DumpState *s, E=
rror<br>
&gt;&gt; **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_ehsize =3D cpu_to_dump16(s,=
 sizeof(elf_header));<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_phoff =3D cpu_to_dump32(s, =
sizeof(Elf32_Ehdr));<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_phentsize =3D cpu_to_dump16=
(s, sizeof(Elf32_Phdr));<br>
&gt;&gt; -=C2=A0 =C2=A0 elf_header.e_phnum =3D cpu_to_dump16(s, s-&gt;phdr_=
num);<br>
&gt;&gt; +=C2=A0 =C2=A0 elf_header.e_phnum =3D cpu_to_dump16(s, phnum);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;have_section) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t shoff =3D sizeof(Elf32_Ehdr)=
 + sizeof(Elf32_Phdr) *<br>
&gt;&gt; s-&gt;sh_info;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t shoff =3D sizeof(Elf32_Ehdr)=
 + sizeof(Elf32_Phdr) *<br>
&gt;&gt; s-&gt;phdr_num;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_shoff =3D cpu=
_to_dump32(s, shoff);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_shentsize =3D=
 cpu_to_dump16(s, sizeof(Elf32_Shdr));<br>
&gt;&gt; @@ -358,12 +360,12 @@ static void write_elf_section(DumpState *s, =
int<br>
&gt;&gt; type, Error **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (type =3D=3D 0) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shdr_size =3D sizeof(Elf32=
_Shdr);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;shdr32, 0, shd=
r_size);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr32.sh_info =3D cpu_to_dump32(s, s=
-&gt;sh_info);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr32.sh_info =3D cpu_to_dump32(s, s=
-&gt;phdr_num);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shdr =3D &amp;shdr32;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shdr_size =3D sizeof(Elf64=
_Shdr);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;shdr64, 0, shd=
r_size);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64.sh_info =3D cpu_to_dump32(s, s=
-&gt;sh_info);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64.sh_info =3D cpu_to_dump32(s, s=
-&gt;phdr_num);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shdr =3D &amp;shdr64;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; @@ -478,13 +480,6 @@ static void write_elf_loads(DumpState *s, Err=
or<br>
&gt;&gt; **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr offset, filesz;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryMapping *memory_mapping;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t phdr_index =3D 1;<br>
&gt;&gt; -=C2=A0 =C2=A0 uint32_t max_index;<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 if (s-&gt;have_section) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_index =3D s-&gt;sh_info;<br>
&gt;&gt; -=C2=A0 =C2=A0 } else {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_index =3D s-&gt;phdr_num;<br>
&gt;&gt; -=C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QTAILQ_FOREACH(memory_mapping, &amp;s-&g=
t;list.head, next) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_offset_range(memory_ma=
pping-&gt;phys_addr,<br>
&gt;&gt; @@ -502,7 +497,7 @@ static void write_elf_loads(DumpState *s, Erro=
r **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (phdr_index &gt;=3D max_index) {<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (phdr_index &gt;=3D s-&gt;phdr_num=
) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; @@ -1801,22 +1796,21 @@ static void dump_init(DumpState *s, int fd=
, bool<br>
&gt;&gt; has_format,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;phdr_num +=3D s-&gt;=
list.num;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;have_section =3D fal=
se;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* sh_info of section 0 holds the rea=
l number of phdrs */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;have_section =3D tru=
e;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_num =3D PN_XNUM;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;sh_info =3D 1; /* PT_NOTE */<br=
>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the type of shdr-&gt;sh=
_info is uint32_t, so we should avoid<br>
&gt;&gt; overflow */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;list.num &lt;=3D=
 UINT32_MAX - 1) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;sh_info +=3D s-&g=
t;list.num;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_num +=3D s-&=
gt;list.num;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;sh_info =3D UINT3=
2_MAX;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_num =3D UINT=
32_MAX;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;dump_info.d_class =3D=3D ELFCL=
ASS64) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;have_section) {<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;memory=
_offset =3D sizeof(Elf64_Ehdr) +<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf64_Phdr) * s-&gt;=
sh_info +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf64_Phdr) * s-&gt;=
phdr_num +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(Elf64_Shdr) + s=
-&gt;note_size;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;memory=
_offset =3D sizeof(Elf64_Ehdr) +<br>
&gt;&gt; @@ -1825,7 +1819,7 @@ static void dump_init(DumpState *s, int fd, =
bool<br>
&gt;&gt; has_format,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;have_section) {<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;memory=
_offset =3D sizeof(Elf32_Ehdr) +<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf32_Phdr) * s-&gt;=
sh_info +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf32_Phdr) * s-&gt;=
phdr_num +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(Elf32_Shdr) + s=
-&gt;note_size;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;memory=
_offset =3D sizeof(Elf32_Ehdr) +<br>
&gt;&gt; diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h<br>
&gt;&gt; index 250143cb5a..b463fc9c02 100644<br>
&gt;&gt; --- a/include/sysemu/dump.h<br>
&gt;&gt; +++ b/include/sysemu/dump.h<br>
&gt;&gt; @@ -154,8 +154,7 @@ typedef struct DumpState {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GuestPhysBlockList guest_phys_blocks;<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ArchDumpInfo dump_info;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryMappingList list;<br>
&gt;&gt; -=C2=A0 =C2=A0 uint16_t phdr_num;<br>
&gt;&gt; -=C2=A0 =C2=A0 uint32_t sh_info;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t phdr_num;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool have_section;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool resume;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool detached;<br>
&gt;&gt; --<br>
&gt;&gt; 2.32.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d90e9c05db83ef51--

