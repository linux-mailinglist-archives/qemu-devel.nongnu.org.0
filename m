Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114EC4CB121
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:18:03 +0100 (CET)
Received: from localhost ([::1]:36700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWME-0004TK-4I
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:18:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nPWK4-0002IZ-Pk
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 16:15:48 -0500
Received: from [2a00:1450:4864:20::335] (port=41867
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nPWK3-0000fh-53
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 16:15:48 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so1235313wmf.0
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 13:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wHUhywmck8/RXf7Rvb1CPXmNKi3+OveKetl2/24Huz8=;
 b=LHLijG5X9XopV/iMf5sWIKN6lOSI6mTZRC5MsMblqktbtV61kXG41wccYuKZ2kNevC
 trqp9Bo1Ezn1NeoawUDC4m3e/loBQaiHSsVJ91R2p3quduc/MCD/b63N/8qnWguoVUSg
 SKqeKzu3nQcQ9n9SOe1R5tc+ZDTCCL9dzr6d3dPiw4O1hyogbx+sltPGLoETMQ3sgWya
 oScuOejJi2y4Qt3AV/8MauxVaU/iS4UFNgHBwOfu6t6x4jkGv6e2hoUY70+GZj0MBmR2
 fK7Aya4fIkXhQHRN28U/YGVFhw7RKJuG/QUMzfIy4+fF7FAzuHdIBLGxJGmgdaYP+D1C
 pFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wHUhywmck8/RXf7Rvb1CPXmNKi3+OveKetl2/24Huz8=;
 b=a3i/UTwdBxAAfAQuQ9YpZqUtDeUpg78vdsYCuuIvFQSpuMNSKmCTyxDbhRzo114nZi
 3CJh3lADG8SpwJnDI4cm1qPZE6gWKfDyCqVcB8BUzXnbN3fEoku9ksueK9d8N7WAnROI
 GLErLT61eyxZRLygxpCddnqSgKGZC9YbB+iHJ/AvuW3QdU6U+f49qGBXLho3J5LCatOP
 InBD33GbWSPVp4iTEVzMLJZJvSi08YUaC4mlejTZLZ0hDTLZ4ottei1QpDfmvEIVzlRd
 e4EF19rvHYZFQIaQ8LmaKEwnlOTSVeOyJ8I6nhETWZtv4uzCIT79tlDm1JbMFEC5enIg
 41Hg==
X-Gm-Message-State: AOAM5308LhnifIx+TS+LlxW0yzBtbuyI0XsbuQGnS5oGl69y6zuG5qDw
 GR4pUvjW6YbsNvVwpuLeDiloj1c4DfVo7hq2Ovk=
X-Google-Smtp-Source: ABdhPJzRSawOcD9TxT9JYiOatHp+UXcrTtmVjAVzwUbLAv6NE9nQAupW4TK1Sawz03i2iQKz4jsTBryRXxYOqypIhtU=
X-Received: by 2002:a7b:c939:0:b0:37b:c13f:6fa3 with SMTP id
 h25-20020a7bc939000000b0037bc13f6fa3mr1378898wml.72.1646255744961; Wed, 02
 Mar 2022 13:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20220301142213.28568-1-frankja@linux.ibm.com>
 <20220301142213.28568-8-frankja@linux.ibm.com>
 <CAMxuvazk2MYoXj1Gku3F5sepwUVuo-Q6Ts8sYkrQHtJ0jnytjQ@mail.gmail.com>
 <104c2aa7-2b0f-c5f4-a996-561d960c7701@linux.ibm.com>
In-Reply-To: <104c2aa7-2b0f-c5f4-a996-561d960c7701@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 3 Mar 2022 01:15:33 +0400
Message-ID: <CAJ+F1CLKfsWZR6OrL_CCGFg8=bUAfSFROsUKXmzoNoE0QP1EnQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] dump: Consolidate elf note function
To: Janosch Frank <frankja@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000e351ae05d942c8fd"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e351ae05d942c8fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 2, 2022 at 6:02 PM Janosch Frank <frankja@linux.ibm.com> wrote:

> On 3/2/22 11:30, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Tue, Mar 1, 2022 at 6:22 PM Janosch Frank <frankja@linux.ibm.com>
> wrote:
> >>
> >> Just like with the other write functions let's move the 32/64 bit elf
> >> handling to a function to improve readability.
> >>
> >> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> >> ---
> >>   dump/dump.c | 24 +++++++++++++++++-------
> >>   1 file changed, 17 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/dump/dump.c b/dump/dump.c
> >> index 78654b9c27..9ba0392e00 100644
> >> --- a/dump/dump.c
> >> +++ b/dump/dump.c
> >> @@ -507,6 +507,21 @@ static void write_elf_loads(DumpState *s, Error
> **errp)
> >>       }
> >>   }
> >>
> >> +static void write_elf_notes(DumpState *s, Error **errp)
> >> +{
> >> +    Error *local_err =3D NULL;
> >> +
> >> +    if (dump_is_64bit(s)) {
> >> +        write_elf64_notes(fd_write_vmcore, s, &local_err);
> >> +    } else {
> >> +        write_elf32_notes(fd_write_vmcore, s, &local_err);
> >> +    }
> >> +    if (local_err) {
> >> +        error_propagate(errp, local_err);
> >> +        return;
> >> +    }
> >
> > Please use "modern"-style ERRP_GUARD(), and indicate failure with a
> > bool (see include/qapi/error.h)
>
> Didn't know that's a thing, I'll have a look
>
> >
> > (perhaps this should be preliminary to this series)
>
> So you want me to change all the local_error + error_propagate()s in
> this file?
>
>
It's not mandatory, but if you do that would be nice. Otherwise, try to
update the code you touch.

thanks



> >
> >> +}
> >> +
> >>   /* write elf header, PT_NOTE and elf note to vmcore. */
> >>   static void dump_begin(DumpState *s, Error **errp)
> >>   {
> >> @@ -570,13 +585,8 @@ static void dump_begin(DumpState *s, Error **errp=
)
> >>           }
> >>       }
> >>
> >> -    if (dump_is_64bit(s)) {
> >> -        /* write notes to vmcore */
> >> -        write_elf64_notes(fd_write_vmcore, s, &local_err);
> >> -    } else {
> >> -        /* write notes to vmcore */
> >> -        write_elf32_notes(fd_write_vmcore, s, &local_err);
> >> -    }
> >> +    /* write notes to vmcore */
> >> +    write_elf_notes(s, &local_err);
> >>       if (local_err) {
> >>           error_propagate(errp, local_err);
> >>           return;
> >> --
> >> 2.32.0
> >>
> >
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e351ae05d942c8fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 2, 2022 at 6:02 PM Jano=
sch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On 3/2/22 11:30, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Tue, Mar 1, 2022 at 6:22 PM Janosch Frank &lt;<a href=3D"mailto:fra=
nkja@linux.ibm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; Just like with the other write functions let&#39;s move the 32/64 =
bit elf<br>
&gt;&gt; handling to a function to improve readability.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.i=
bm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0dump/dump.c | 24 +++++++++++++++++-------<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 17 insertions(+), 7 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/dump/dump.c b/dump/dump.c<br>
&gt;&gt; index 78654b9c27..9ba0392e00 100644<br>
&gt;&gt; --- a/dump/dump.c<br>
&gt;&gt; +++ b/dump/dump.c<br>
&gt;&gt; @@ -507,6 +507,21 @@ static void write_elf_loads(DumpState *s, Err=
or **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; +static void write_elf_notes(DumpState *s, Error **errp)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_notes(fd_write_vmcore, s,=
 &amp;local_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_notes(fd_write_vmcore, s,=
 &amp;local_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt; <br>
&gt; Please use &quot;modern&quot;-style ERRP_GUARD(), and indicate failure=
 with a<br>
&gt; bool (see include/qapi/error.h)<br>
<br>
Didn&#39;t know that&#39;s a thing, I&#39;ll have a look<br>
<br>
&gt; <br>
&gt; (perhaps this should be preliminary to this series)<br>
<br>
So you want me to change all the local_error + error_propagate()s in <br>
this file?<br>
<br></blockquote><div><br></div><div>It&#39;s not mandatory, but if you do =
that would be nice. Otherwise, try to update the code you touch.</div><div>=
<br></div><div>thanks</div><div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
&gt; <br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0/* write elf header, PT_NOTE and elf note to vmcore. *=
/<br>
&gt;&gt;=C2=A0 =C2=A0static void dump_begin(DumpState *s, Error **errp)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; @@ -570,13 +585,8 @@ static void dump_begin(DumpState *s, Error **=
errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* write notes to vmcore */<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_notes(fd_write_vmcore, s,=
 &amp;local_err);<br>
&gt;&gt; -=C2=A0 =C2=A0 } else {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* write notes to vmcore */<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_notes(fd_write_vmcore, s,=
 &amp;local_err);<br>
&gt;&gt; -=C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 /* write notes to vmcore */<br>
&gt;&gt; +=C2=A0 =C2=A0 write_elf_notes(s, &amp;local_err);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp, loca=
l_err);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt; --<br>
&gt;&gt; 2.32.0<br>
&gt;&gt;<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e351ae05d942c8fd--

