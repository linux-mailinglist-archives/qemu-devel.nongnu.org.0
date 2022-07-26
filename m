Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A51581419
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 15:25:34 +0200 (CEST)
Received: from localhost ([::1]:39468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGKZ3-0002wK-3A
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 09:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oGKMV-0007u3-MR; Tue, 26 Jul 2022 09:12:37 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:37458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oGKMK-0000nX-Gb; Tue, 26 Jul 2022 09:12:27 -0400
Received: by mail-lj1-x230.google.com with SMTP id e11so16463459ljl.4;
 Tue, 26 Jul 2022 06:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fb+ODmBkQOt/Ab4KjC5l6QKJvnDsdfM/fZZLQysSOhE=;
 b=lKQKSNjLopu/dim0M9b6IRLsvzYoDweb6hnOpjfTvLmRBVS7VLfYDOocJJjfD57wnN
 vg011xB6wbZekru3zN2YUiyMNWmLjUX1LEZRgq5QN19utEIq2oGujWJVzH3o10jDGVQ7
 yssThDSBBq5FDYtL+mkW0+lhldRlji5EAcErv1OFVknMIDil5I0+EDX/V49nmm2QTLL+
 8DVTEaBxfTvJIv8yfR+bamfAxVpR4j2pVtXeLeEMUTXHu7qJDKplhpY/BCJdMIH6KYam
 aUjR4hkmdZPtSi1xlnyttFIq9zOoP+2l3yyYo3bTEPKHf3/7JHyD7mXHjblmh/UjwR7Q
 MsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fb+ODmBkQOt/Ab4KjC5l6QKJvnDsdfM/fZZLQysSOhE=;
 b=vX5W3ncrLKP98wEu0MYO1HznRmChpZxfwz+EO1wyUhLDelyA4b7kxutJk9zQbIKy+C
 Rjhk5uKSEECuVm9mGPyE+GKpX41cC8RLyz1Ku1m62kzFVaGO1pScU7PCdwb/+fYHIGAA
 29STAJZopMXslnrug7fsFX3DMJu5ur88cSyM3zJsLCDyNsDOfKDLnr8MBHccF4D1rG77
 aDdhFYWM3EyuXlhpRwhxtRyQ5A+CmH5iWaOQFkUWMhf9c3H2C54AIcAbXV9gueFr0GBI
 00v1eC5DfZKnbKeNMV+D4KSFW3XM89TbCELtJOJl5GmKg7DTN23ukzTQtaedFm/fq76O
 ASyA==
X-Gm-Message-State: AJIora8RBTPyUwXQHSErTYBldXm9BJAK/3vAzm1PyyoqO9yIwbp2vIFD
 HY/g6vbi/Gd0yw1ITFlIzSZu5EP7JAg1YgBX+5K2WVHKM6U=
X-Google-Smtp-Source: AGRyM1sGQCeKtD/ovfEcWzA3geM3lw2EGTBwQCPuCgs2BrMgUFEDyKs0W2TtKoPxtwAceoWkS4cr58vPNj7Icvn2QMQ=
X-Received: by 2002:a2e:9787:0:b0:25d:6d00:eef4 with SMTP id
 y7-20020a2e9787000000b0025d6d00eef4mr5657819lji.14.1658841139645; Tue, 26 Jul
 2022 06:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-12-frankja@linux.ibm.com>
 <CAMxuvawu-q-Fe4ZXU2Bc1gwLfpQCCw3HxWhbBK6+8exkM1b+nw@mail.gmail.com>
 <e24cff5c-3171-69dc-3e17-d4f773be6f2b@linux.ibm.com>
In-Reply-To: <e24cff5c-3171-69dc-3e17-d4f773be6f2b@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 26 Jul 2022 17:12:08 +0400
Message-ID: <CAJ+F1CL8qm4qiHbKyE2YCAZ1ZVMKF-UAR6f39zMgw2Xdq7zCgQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/17] dump/dump: Add section string table support
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, seiden@linux.ibm.com,
 scgl@linux.ibm.com
Content-Type: multipart/alternative; boundary="000000000000de116505e4b50c6b"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x230.google.com
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

--000000000000de116505e4b50c6b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2022 at 4:55 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> On 7/26/22 13:25, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Tue, Jul 26, 2022 at 1:23 PM Janosch Frank <frankja@linux.ibm.com>
> wrote:
> >>
> >> As sections don't have a type like the notes do we need another way to
> >> determine their contents. The string table allows us to assign each
> >> section an identification string which architectures can then use to
> >> tag their sections with.
> >>
> >> There will be no string table if the architecture doesn't add custom
> >> sections which are introduced in a following patch.
> >>
> >> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> >> ---
> >>   dump/dump.c           | 81 +++++++++++++++++++++++++++++++++++++++++=
+-
> >>   include/sysemu/dump.h |  1 +
> >>   2 files changed, 81 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/dump/dump.c b/dump/dump.c
> >> index 3cf846d0a0..298a1e923f 100644
> >> --- a/dump/dump.c
> >> +++ b/dump/dump.c
> >> @@ -99,6 +99,7 @@ static int dump_cleanup(DumpState *s)
> >>       close(s->fd);
> >>       g_free(s->guest_note);
> >>       g_free(s->elf_header);
> >> +    g_array_unref(s->string_table_buf);
> >>       s->guest_note =3D NULL;
> >>       if (s->resume) {
> >>           if (s->detached) {
> >> @@ -357,21 +358,72 @@ static size_t
> prepare_elf_section_hdr_zero(DumpState *s)
> >>       return dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr=
);
> >>   }
> >>
> >> +static void write_elf_section_hdr_string(DumpState *s, void *buff)
> >> +{
> >
> > Mildly annoyed that we use "write_" prefix for actually writing to the
> > fd, and sometimes to pre-fill (or "prepare_" structures). Would you
> > mind cleaning that up?
> >
>
> Yes, absolutely
>
> >> +    Elf32_Shdr shdr32;
> >> +    Elf64_Shdr shdr64;
> >> +    int shdr_size;
> >> +    void *shdr =3D buff;
> >
> > Why assign here?
>
> Great question
>

:)


>
> >
> >> +
> >> +    if (dump_is_64bit(s)) {
> >> +        shdr_size =3D sizeof(Elf64_Shdr);
> >> +        memset(&shdr64, 0, shdr_size);
> >> +        shdr64.sh_type =3D SHT_STRTAB;
> >> +        shdr64.sh_offset =3D s->section_offset +
> s->elf_section_data_size;
> >> +        shdr64.sh_name =3D s->string_table_buf->len;
> >> +        g_array_append_vals(s->string_table_buf, ".strtab",
> sizeof(".strtab"));
> >> +        shdr64.sh_size =3D s->string_table_buf->len;
> >> +        shdr =3D &shdr64;
> >> +    } else {
> >> +        shdr_size =3D sizeof(Elf32_Shdr);
> >> +        memset(&shdr32, 0, shdr_size);
> >> +        shdr32.sh_type =3D SHT_STRTAB;
> >> +        shdr32.sh_offset =3D s->section_offset +
> s->elf_section_data_size;
> >> +        shdr32.sh_name =3D s->string_table_buf->len;
> >> +        g_array_append_vals(s->string_table_buf, ".strtab",
> sizeof(".strtab"));
> >> +        shdr32.sh_size =3D s->string_table_buf->len;
> >> +        shdr =3D &shdr32;
> >> +    }
> >> +
> >> +    memcpy(buff, shdr, shdr_size);
> >> +}
> >> +
> >>   static void prepare_elf_section_hdrs(DumpState *s)
> >>   {
> >>       size_t len, sizeof_shdr;
> >> +    Elf64_Ehdr *hdr64 =3D s->elf_header;
> >> +    Elf32_Ehdr *hdr32 =3D s->elf_header;
> >> +    void *buff_hdr;
> >>
> >>       /*
> >>        * Section ordering:
> >>        * - HDR zero (if needed)
> >> +     * - String table hdr
> >>        */
> >>       sizeof_shdr =3D dump_is_64bit(s) ? sizeof(Elf64_Shdr) :
> sizeof(Elf32_Shdr);
> >>       len =3D sizeof_shdr * s->shdr_num;
> >>       s->elf_section_hdrs =3D g_malloc0(len);
> >> +    buff_hdr =3D s->elf_section_hdrs;
> >>
> >>       /* Write special section first */
> >>       if (s->phdr_num =3D=3D PN_XNUM) {
> >>           prepare_elf_section_hdr_zero(s);
> >> +        buff_hdr +=3D sizeof_shdr;
> >> +    }
> >> +
> >> +    if (s->shdr_num < 2) {
> >> +        return;
> >> +    }
> >> +
> >> +    /*
> >> +     * String table needs to be last section since strings are added
> >> +     * via arch_sections_write_hdr().
> >> +     */
> >
> > This comment isn't exactly relevant yet, since that code isn't there,
> but ok.
>
> What about something like this, it's a bit more precise and I'll add the
> arch_sections_write_hdr() reference in the next patch?
>
> /*
> * String table needs to be the last section since it will be populated
> when adding other elf structures.
> */
>
>
ok


> [..]
> >>       s->length =3D length;
> >> +    /* First index is 0, it's the special null name */
> >> +    s->string_table_buf =3D g_array_new(FALSE, TRUE, 1);
> >> +    /*
> >> +     * Allocate the null name, due to the clearing option set to true
> >> +     * it will be 0.
> >> +     */
> >> +    g_array_set_size(s->string_table_buf, 1);
> >
> > I wonder if GByteArray wouldn't be more appropriate, even if it
> > doesn't have the clearing option. If it's just for one byte, ...
>
> I don't really care but I need a decision on it to change it :)
>

I haven't tried, but I think it would be a better fit.


--=20
Marc-Andr=C3=A9 Lureau

--000000000000de116505e4b50c6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 26, 2022 at 4:55 PM Janos=
ch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On 7/26/22 13:25, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Tue, Jul 26, 2022 at 1:23 PM Janosch Frank &lt;<a href=3D"mailto:fr=
ankja@linux.ibm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; As sections don&#39;t have a type like the notes do we need anothe=
r way to<br>
&gt;&gt; determine their contents. The string table allows us to assign eac=
h<br>
&gt;&gt; section an identification string which architectures can then use =
to<br>
&gt;&gt; tag their sections with.<br>
&gt;&gt;<br>
&gt;&gt; There will be no string table if the architecture doesn&#39;t add =
custom<br>
&gt;&gt; sections which are introduced in a following patch.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.i=
bm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
81 ++++++++++++++++++++++++++++++++++++++++++-<br>
&gt;&gt;=C2=A0 =C2=A0include/sysemu/dump.h |=C2=A0 1 +<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 81 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/dump/dump.c b/dump/dump.c<br>
&gt;&gt; index 3cf846d0a0..298a1e923f 100644<br>
&gt;&gt; --- a/dump/dump.c<br>
&gt;&gt; +++ b/dump/dump.c<br>
&gt;&gt; @@ -99,6 +99,7 @@ static int dump_cleanup(DumpState *s)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0close(s-&gt;fd);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(s-&gt;guest_note);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(s-&gt;elf_header);<br>
&gt;&gt; +=C2=A0 =C2=A0 g_array_unref(s-&gt;string_table_buf);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;guest_note =3D NULL;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;resume) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;detached) {<br>
&gt;&gt; @@ -357,21 +358,72 @@ static size_t prepare_elf_section_hdr_zero(D=
umpState *s)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return dump_is_64bit(s) ? sizeof(Elf64_S=
hdr) : sizeof(Elf32_Shdr);<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; +static void write_elf_section_hdr_string(DumpState *s, void *buff=
)<br>
&gt;&gt; +{<br>
&gt; <br>
&gt; Mildly annoyed that we use &quot;write_&quot; prefix for actually writ=
ing to the<br>
&gt; fd, and sometimes to pre-fill (or &quot;prepare_&quot; structures). Wo=
uld you<br>
&gt; mind cleaning that up?<br>
&gt; <br>
<br>
Yes, absolutely<br>
<br>
&gt;&gt; +=C2=A0 =C2=A0 Elf32_Shdr shdr32;<br>
&gt;&gt; +=C2=A0 =C2=A0 Elf64_Shdr shdr64;<br>
&gt;&gt; +=C2=A0 =C2=A0 int shdr_size;<br>
&gt;&gt; +=C2=A0 =C2=A0 void *shdr =3D buff;<br>
&gt; <br>
&gt; Why assign here?<br>
<br>
Great question<br></blockquote><div><br></div><div>:)</div><div>=C2=A0<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr_size =3D sizeof(Elf64_Shdr);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&amp;shdr64, 0, shdr_size);<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64.sh_type =3D SHT_STRTAB;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64.sh_offset =3D s-&gt;section_of=
fset + s-&gt;elf_section_data_size;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64.sh_name =3D s-&gt;string_table=
_buf-&gt;len;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_array_append_vals(s-&gt;string_tabl=
e_buf, &quot;.strtab&quot;, sizeof(&quot;.strtab&quot;));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64.sh_size =3D s-&gt;string_table=
_buf-&gt;len;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr =3D &amp;shdr64;<br>
&gt;&gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr_size =3D sizeof(Elf32_Shdr);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&amp;shdr32, 0, shdr_size);<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr32.sh_type =3D SHT_STRTAB;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr32.sh_offset =3D s-&gt;section_of=
fset + s-&gt;elf_section_data_size;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr32.sh_name =3D s-&gt;string_table=
_buf-&gt;len;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_array_append_vals(s-&gt;string_tabl=
e_buf, &quot;.strtab&quot;, sizeof(&quot;.strtab&quot;));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr32.sh_size =3D s-&gt;string_table=
_buf-&gt;len;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr =3D &amp;shdr32;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 memcpy(buff, shdr, shdr_size);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0static void prepare_elf_section_hdrs(DumpState *s)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len, sizeof_shdr;<br>
&gt;&gt; +=C2=A0 =C2=A0 Elf64_Ehdr *hdr64 =3D s-&gt;elf_header;<br>
&gt;&gt; +=C2=A0 =C2=A0 Elf32_Ehdr *hdr32 =3D s-&gt;elf_header;<br>
&gt;&gt; +=C2=A0 =C2=A0 void *buff_hdr;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Section ordering:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * - HDR zero (if needed)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* - String table hdr<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof_shdr =3D dump_is_64bit(s) ? sizeo=
f(Elf64_Shdr) : sizeof(Elf32_Shdr);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D sizeof_shdr * s-&gt;shdr_num;<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;elf_section_hdrs =3D g_malloc0(len=
);<br>
&gt;&gt; +=C2=A0 =C2=A0 buff_hdr =3D s-&gt;elf_section_hdrs;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Write special section first */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;phdr_num =3D=3D PN_XNUM) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prepare_elf_section_hdr_ze=
ro(s);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 buff_hdr +=3D sizeof_shdr;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 if (s-&gt;shdr_num &lt; 2) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* String table needs to be last section since=
 strings are added<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* via arch_sections_write_hdr().<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; <br>
&gt; This comment isn&#39;t exactly relevant yet, since that code isn&#39;t=
 there, but ok.<br>
<br>
What about something like this, it&#39;s a bit more precise and I&#39;ll ad=
d the <br>
arch_sections_write_hdr() reference in the next patch?<br>
<br>
/*<br>
* String table needs to be the last section since it will be populated <br>
when adding other elf structures.<br>
*/<br>
<br></blockquote><div><br></div><div>ok</div><div>=C2=A0<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
[..]<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;length =3D length;<br>
&gt;&gt; +=C2=A0 =C2=A0 /* First index is 0, it&#39;s the special null name=
 */<br>
&gt;&gt; +=C2=A0 =C2=A0 s-&gt;string_table_buf =3D g_array_new(FALSE, TRUE,=
 1);<br>
&gt;&gt; +=C2=A0 =C2=A0 /*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* Allocate the null name, due to the clearing=
 option set to true<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* it will be 0.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; +=C2=A0 =C2=A0 g_array_set_size(s-&gt;string_table_buf, 1);<br>
&gt; <br>
&gt; I wonder if GByteArray wouldn&#39;t be more appropriate, even if it<br=
>
&gt; doesn&#39;t have the clearing option. If it&#39;s just for one byte, .=
..<br>
<br>
I don&#39;t really care but I need a decision on it to change it :)<br></bl=
ockquote><div><br></div><div>I haven&#39;t tried, but I think it would be a=
 better fit. <br></div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" =
class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000de116505e4b50c6b--

