Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE30574CA9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 13:59:46 +0200 (CEST)
Received: from localhost ([::1]:36658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBxVS-0003qi-1i
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 07:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oBxRV-0001iy-MU; Thu, 14 Jul 2022 07:55:41 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:38487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oBxRT-0008VN-PT; Thu, 14 Jul 2022 07:55:41 -0400
Received: by mail-lj1-x233.google.com with SMTP id a10so1891170ljj.5;
 Thu, 14 Jul 2022 04:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rnpGYZvAtbsv36ycSfURKPnactCGNr6doIddHW83UOo=;
 b=qwG2Oi/VGerx4Ml+spMehaaYUPSNBRtGlWd7KQPH8eIwBwzi58g+uiwYMR/4/A+XTn
 ryaTHPHoDMutwDL5Bc3FPdXkXJsvp11U7xJdYCp3P1tNEdyhCNoIbhc/PNKqssZ8Qzzz
 zl5oeQ0lTytU7YdIFuC8bCuQg1C8dOVaAbQDXWyD4aTcQpT7y0AoPiqM0h1rxs31Tl+G
 L0eH/jD0Mn4wvOSo0tvcjnLNVEozgu/dhiq8gNTXwulaobAy9ByLTLB0OHa31WrbgXCn
 pRgasKaHsyM6a1NVGjV7hL+1EHdszF++ZqRe0+lFuf5Atbqh5geO0a7GdJur+hTBY/0e
 dhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rnpGYZvAtbsv36ycSfURKPnactCGNr6doIddHW83UOo=;
 b=2hO3ZNQKMOZ0FgUfiJk+ziRivnK31tuBCj0aiG1xoSB5ISjKKnubrR5x/rDqAjGkXk
 LoYwQqCB9Eqp2iA6WcZa+eDdU2M/D5X+1+fzwCiBuC5uBKSPiNkRrblVNo1sZyrtxSUB
 nTxv7wTG0GMbTiTV9S7rfhaOLhJHYn6BEq+tDNWn0suQPq9s8XjRoHT9apy87rPh4G2K
 03eInydlK8KkSX0aRaWn1zq2dF0TL754zx1qfiB7oN0WeWUULDbXLK7Disexah0XUPod
 qsLAZhh7YEdAXpotu+atSGJKKN0pEscfBhkWrh5+LMV+0iwToGRQZLNY74g5nKyPNn18
 LHOA==
X-Gm-Message-State: AJIora9uuISUiVOl8lt4G8v03YGobfsorYGEyEM1lu7NDXaZQoYWzuG4
 M9yUAF+MWxtvFOi334+KKkm/0W4t/R3fp+1myf4=
X-Google-Smtp-Source: AGRyM1uZk7nFXIbb9N9jQ18Fi36Nmci0ct91feNoJ3N+MHyjqA6jTWTWDLPcMWuzuDVM4lUZ6+jhiH3AObD+eqF4DcY=
X-Received: by 2002:a2e:9787:0:b0:25d:6d00:eef4 with SMTP id
 y7-20020a2e9787000000b0025d6d00eef4mr4171701lji.14.1657799735579; Thu, 14 Jul
 2022 04:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220713130322.25517-1-frankja@linux.ibm.com>
 <20220713130322.25517-6-frankja@linux.ibm.com>
 <CAMxuvawZehnqK=UN03nKEdtwL7yySKgb6GG5GV1S3CT_d0_iyg@mail.gmail.com>
 <39c9c903-a2dc-6799-b77c-825f9bde069e@linux.ibm.com>
In-Reply-To: <39c9c903-a2dc-6799-b77c-825f9bde069e@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 14 Jul 2022 15:55:24 +0400
Message-ID: <CAJ+F1CK5tuUWbyYe7BUbZQKLYRXGSstr8rtb5w0rbke0SQb-YQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] dump/dump: Add section string table support
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, "Henderson,
 Richard" <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000059189305e3c294d6"
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000059189305e3c294d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jul 14, 2022 at 3:54 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> On 7/13/22 17:58, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Jul 13, 2022 at 5:07 PM Janosch Frank <frankja@linux.ibm.com>
> wrote:
> >>
> >> Time to add a bit more descriptiveness to the dumps.
> >
> > Please add some more description & motivation to the patch (supposedly
> > necessary for next patches), and explain that it currently doesn't
> > change the dump (afaict).
>
> How about:
>
> As sections don't have a type like the notes do we need another way to
> determine their contents. The string table allows us to assign each
> section an identification string which architectures can then use to tag
> their sections with.
>
> There will be no string table if the architecture doesn't add custom
> sections which are introduced in a following patch.
>

lgtm, thanks


>
>
> >>
> >> -    if (dump_is_64bit(s)) {
> >> -        s->phdr_offset =3D sizeof(Elf64_Ehdr);
> >> -        s->shdr_offset =3D s->phdr_offset + sizeof(Elf64_Phdr) *
> s->phdr_num;
> >> -        s->note_offset =3D s->shdr_offset + sizeof(Elf64_Shdr) *
> s->shdr_num;
> >> -        s->memory_offset =3D s->note_offset + s->note_size;
> >> -    } else {
> >> -
> >> -        s->phdr_offset =3D sizeof(Elf32_Ehdr);
> >> -        s->shdr_offset =3D s->phdr_offset + sizeof(Elf32_Phdr) *
> s->phdr_num;
> >> -        s->note_offset =3D s->shdr_offset + sizeof(Elf32_Shdr) *
> s->shdr_num;
> >> -        s->memory_offset =3D s->note_offset + s->note_size;
> >> +    /*
> >> +     * calculate shdr_num and elf_section_data_size so we know the
> offsets and
> >> +     * sizes of all parts.
> >> +     *
> >> +     * If phdr_num overflowed we have at least one section header
> >> +     * More sections/hdrs can be added by the architectures
> >> +     */
> >> +    if (s->shdr_num > 1) {
> >> +        /* Reserve the string table */
> >> +        s->shdr_num +=3D 1;
> >>       }
> >>
> >> +    tmp =3D (s->phdr_num =3D=3D PN_XNUM) ? s->sh_info : s->phdr_num;
> >> +    if (dump_is_64bit(s)) {
> >> +        s->shdr_offset =3D sizeof(Elf64_Ehdr);
> >> +        s->phdr_offset =3D s->shdr_offset + sizeof(Elf64_Shdr) *
> s->shdr_num;
> >> +        s->note_offset =3D s->phdr_offset + sizeof(Elf64_Phdr) * tmp;
> >> +    } else {
> >> +        s->shdr_offset =3D sizeof(Elf32_Ehdr);
> >> +        s->phdr_offset =3D s->shdr_offset + sizeof(Elf32_Shdr) *
> s->shdr_num;
> >> +        s->note_offset =3D s->phdr_offset + sizeof(Elf32_Phdr) * tmp;
> >> +    }
> >> +    s->memory_offset =3D s->note_offset + s->note_size;
> >
> > I suggest to split this in a different patch. It's not obvious that
> > you can change phdr_offset / shdr_offset, it deserves a comment.
>
> Right, will do
>
> >
> >> +    s->section_offset =3D s->memory_offset + s->total_size;
> >> +
> >>       return;
> >>
> >>   cleanup:
> >> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> >> index 8379e29ef6..2c25c7d309 100644
> >> --- a/include/sysemu/dump.h
> >> +++ b/include/sysemu/dump.h
> >> @@ -178,6 +178,7 @@ typedef struct DumpState {
> >>       void *elf_section_hdrs;
> >>       uint64_t elf_section_data_size;
> >>       void *elf_section_data;
> >> +    GArray *string_table_buf;  /* String table section */
> >>
> >>       uint8_t *note_buf;          /* buffer for notes */
> >>       size_t note_buf_offset;     /* the writing place in note_buf */
> >> --
> >> 2.34.1
> >>
> >
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000059189305e3c294d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 14, 2022 at 3:54 PM Jan=
osch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 7/13/22 17:58, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Wed, Jul 13, 2022 at 5:07 PM Janosch Frank &lt;<a href=3D"mailto:fr=
ankja@linux.ibm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; Time to add a bit more descriptiveness to the dumps.<br>
&gt; <br>
&gt; Please add some more description &amp; motivation to the patch (suppos=
edly<br>
&gt; necessary for next patches), and explain that it currently doesn&#39;t=
<br>
&gt; change the dump (afaict).<br>
<br>
How about:<br>
<br>
As sections don&#39;t have a type like the notes do we need another way to =
<br>
determine their contents. The string table allows us to assign each <br>
section an identification string which architectures can then use to tag <b=
r>
their sections with.<br>
<br>
There will be no string table if the architecture doesn&#39;t add custom <b=
r>
sections which are introduced in a following patch.<br></blockquote><div><b=
r></div><div>lgtm, thanks<br></div><div>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_offset =3D sizeof(Elf64_Eh=
dr);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;shdr_offset =3D s-&gt;phdr_offs=
et + sizeof(Elf64_Phdr) * s-&gt;phdr_num;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;note_offset =3D s-&gt;shdr_offs=
et + sizeof(Elf64_Shdr) * s-&gt;shdr_num;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;memory_offset =3D s-&gt;note_of=
fset + s-&gt;note_size;<br>
&gt;&gt; -=C2=A0 =C2=A0 } else {<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_offset =3D sizeof(Elf32_Eh=
dr);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;shdr_offset =3D s-&gt;phdr_offs=
et + sizeof(Elf32_Phdr) * s-&gt;phdr_num;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;note_offset =3D s-&gt;shdr_offs=
et + sizeof(Elf32_Shdr) * s-&gt;shdr_num;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;memory_offset =3D s-&gt;note_of=
fset + s-&gt;note_size;<br>
&gt;&gt; +=C2=A0 =C2=A0 /*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* calculate shdr_num and elf_section_data_siz=
e so we know the offsets and<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* sizes of all parts.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* If phdr_num overflowed we have at least one=
 section header<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* More sections/hdrs can be added by the arch=
itectures<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; +=C2=A0 =C2=A0 if (s-&gt;shdr_num &gt; 1) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Reserve the string table */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;shdr_num +=3D 1;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 tmp =3D (s-&gt;phdr_num =3D=3D PN_XNUM) ? s-&gt;sh_=
info : s-&gt;phdr_num;<br>
&gt;&gt; +=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;shdr_offset =3D sizeof(Elf64_Eh=
dr);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_offset =3D s-&gt;shdr_offs=
et + sizeof(Elf64_Shdr) * s-&gt;shdr_num;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;note_offset =3D s-&gt;phdr_offs=
et + sizeof(Elf64_Phdr) * tmp;<br>
&gt;&gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;shdr_offset =3D sizeof(Elf32_Eh=
dr);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_offset =3D s-&gt;shdr_offs=
et + sizeof(Elf32_Shdr) * s-&gt;shdr_num;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;note_offset =3D s-&gt;phdr_offs=
et + sizeof(Elf32_Phdr) * tmp;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 s-&gt;memory_offset =3D s-&gt;note_offset + s-&gt;n=
ote_size;<br>
&gt; <br>
&gt; I suggest to split this in a different patch. It&#39;s not obvious tha=
t<br>
&gt; you can change phdr_offset / shdr_offset, it deserves a comment.<br>
<br>
Right, will do<br>
<br>
&gt; <br>
&gt;&gt; +=C2=A0 =C2=A0 s-&gt;section_offset =3D s-&gt;memory_offset + s-&g=
t;total_size;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0cleanup:<br>
&gt;&gt; diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h<br>
&gt;&gt; index 8379e29ef6..2c25c7d309 100644<br>
&gt;&gt; --- a/include/sysemu/dump.h<br>
&gt;&gt; +++ b/include/sysemu/dump.h<br>
&gt;&gt; @@ -178,6 +178,7 @@ typedef struct DumpState {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void *elf_section_hdrs;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t elf_section_data_size;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void *elf_section_data;<br>
&gt;&gt; +=C2=A0 =C2=A0 GArray *string_table_buf;=C2=A0 /* String table sec=
tion */<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t *note_buf;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* buffer for notes */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t note_buf_offset;=C2=A0 =C2=A0 =C2=
=A0/* the writing place in note_buf */<br>
&gt;&gt; --<br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000059189305e3c294d6--

