Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751524ED6B9
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:22:29 +0200 (CEST)
Received: from localhost ([::1]:34636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZr0e-000171-03
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:22:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZqbt-0002dO-PU
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:56:55 -0400
Received: from [2a00:1450:4864:20::435] (port=44829
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZqbr-00035a-TK
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:56:53 -0400
Received: by mail-wr1-x435.google.com with SMTP id b19so32695292wrh.11
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 01:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vds+rrdqwTeHd1oTd4fDGWVVWZY3At41PvVxK6J5zAg=;
 b=kAGXTucIWSLtx66P+MtsRsQ7leYDrCdRIgXmTAoNtGt1G8MVjzLyD7emwggkv/sDq4
 1BZBLsgN2NdP3KiOuq2+xrWYzY4dieraBYqz5Ivcrcyxa3gwHDrpPm9KSGZS3dLtcLQw
 3V3kwFtNhJ1skDmr0iDcCojMvhABJtr0CT+pDwn8jYNfX10AVTtxKMg6yynWiAA4rk3n
 mYKeBmCuqCLezNOV4cboJ3bPeG9r4Rmn+wtXyawPjOk2vaTrFb28JwuvQkjGP1yHdvKR
 UdIPj2dZynj59kIDYXSiCs+oy64qIOR8yVL3SidhnpEmx1tZH7T/VW58cMPHhIAgECJ4
 qOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vds+rrdqwTeHd1oTd4fDGWVVWZY3At41PvVxK6J5zAg=;
 b=jiV3oQfzIcfOLquPUIX87YWFCNaaNtd9gGr3eYNU216manTBrCzpeA5aN4iIdCluTi
 sLk+8f96aGe7+TgjyM/xURHsMYg4iLzlizG/bj8iyh2cXBGHFTtM30Xd2KN6i+sdVIkX
 dBCfPa2YR3IrSXQsv65vOvb+5B4cEYz0BIc8R+W3yx0lQnqHK3w3liIcqxnZ/ZieX79U
 2B/yr5V+Ofc0EGr4xrHpwO3makO8oy/puMX3RJ4reDqbbh8obNV7LwrdsTDcL3BajTGR
 jCNVm7+xXqx2EuVrazB7cKJ+GlQnGujGq116dYwx2y0KOS54NRJo0ogArWeLw2FfLQDh
 +g8w==
X-Gm-Message-State: AOAM533sGcH/87Uc7ZAVrjHMJWlgXu/dch6N05quLvmWr18q0nPLxDTF
 vjuIQKZUACXu2Ncyr3J1FkuHTBUFKWOdvZ8CGNg=
X-Google-Smtp-Source: ABdhPJzyLAbhQbUZls0tJSzm0SsVVLud6GXcG8WWjuL4nvmcnxU8i77gokiLFoKD9Fi+K73Xj/uh5RCrs30OJQZDHW8=
X-Received: by 2002:a05:6000:1449:b0:204:6d5:fb2b with SMTP id
 v9-20020a056000144900b0020406d5fb2bmr3203487wrx.421.1648717010508; Thu, 31
 Mar 2022 01:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220330123603.107120-1-frankja@linux.ibm.com>
 <20220330123603.107120-8-frankja@linux.ibm.com>
In-Reply-To: <20220330123603.107120-8-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 31 Mar 2022 12:56:36 +0400
Message-ID: <CAJ+F1CLn-6-70kddmSgssev9MUidwRV1dFx=WSYgfrCXUk3w2Q@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] dump: Consolidate phdr note writes
To: Janosch Frank <frankja@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000bf216d05db7fd7f4"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x435.google.com
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

--000000000000bf216d05db7fd7f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 4:49 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> There's no need to have two write functions. Let's rather have two
> functions that set the data for elf 32/64 and then write it in a
> common function.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  dump/dump.c | 94 +++++++++++++++++++++++++++--------------------------
>  1 file changed, 48 insertions(+), 46 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index a7cf112d8f..365798f5a1 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -236,24 +236,15 @@ static void write_elf32_load(DumpState *s,
> MemoryMapping *memory_mapping,
>      }
>  }
>
> -static void write_elf64_note(DumpState *s, Error **errp)
> +static void write_elf64_phdr_note(DumpState *s, Elf64_Phdr *phdr)
>  {
> -    Elf64_Phdr phdr;
> -    int ret;
> -
> -    memset(&phdr, 0, sizeof(Elf64_Phdr));
> -    phdr.p_type =3D cpu_to_dump32(s, PT_NOTE);
> -    phdr.p_offset =3D cpu_to_dump64(s, s->note_offset);
> -    phdr.p_paddr =3D 0;
> -    phdr.p_filesz =3D cpu_to_dump64(s, s->note_size);
> -    phdr.p_memsz =3D cpu_to_dump64(s, s->note_size);
> -    phdr.p_vaddr =3D 0;
> -
> -    ret =3D fd_write_vmcore(&phdr, sizeof(Elf64_Phdr), s);
> -    if (ret < 0) {
> -        error_setg_errno(errp, -ret,
> -                         "dump: failed to write program header table");
> -    }
> +    memset(phdr, 0, sizeof(*phdr));
> +    phdr->p_type =3D cpu_to_dump32(s, PT_NOTE);
> +    phdr->p_offset =3D cpu_to_dump64(s, s->note_offset);
> +    phdr->p_paddr =3D 0;
> +    phdr->p_filesz =3D cpu_to_dump64(s, s->note_size);
> +    phdr->p_memsz =3D cpu_to_dump64(s, s->note_size);
> +    phdr->p_vaddr =3D 0;
>  }
>
>  static inline int cpu_index(CPUState *cpu)
> @@ -301,24 +292,15 @@ static void write_elf64_notes(WriteCoreDumpFunction
> f, DumpState *s,
>      write_guest_note(f, s, errp);
>  }
>
> -static void write_elf32_note(DumpState *s, Error **errp)
> +static void write_elf32_phdr_note(DumpState *s, Elf32_Phdr *phdr)
>  {
> -    Elf32_Phdr phdr;
> -    int ret;
> -
> -    memset(&phdr, 0, sizeof(Elf32_Phdr));
> -    phdr.p_type =3D cpu_to_dump32(s, PT_NOTE);
> -    phdr.p_offset =3D cpu_to_dump32(s, s->note_offset);
> -    phdr.p_paddr =3D 0;
> -    phdr.p_filesz =3D cpu_to_dump32(s, s->note_size);
> -    phdr.p_memsz =3D cpu_to_dump32(s, s->note_size);
> -    phdr.p_vaddr =3D 0;
> -
> -    ret =3D fd_write_vmcore(&phdr, sizeof(Elf32_Phdr), s);
> -    if (ret < 0) {
> -        error_setg_errno(errp, -ret,
> -                         "dump: failed to write program header table");
> -    }
> +    memset(phdr, 0, sizeof(*phdr));
> +    phdr->p_type =3D cpu_to_dump32(s, PT_NOTE);
> +    phdr->p_offset =3D cpu_to_dump32(s, s->note_offset);
> +    phdr->p_paddr =3D 0;
> +    phdr->p_filesz =3D cpu_to_dump32(s, s->note_size);
> +    phdr->p_memsz =3D cpu_to_dump32(s, s->note_size);
> +    phdr->p_vaddr =3D 0;
>  }
>
>  static void write_elf32_notes(WriteCoreDumpFunction f, DumpState *s,
> @@ -348,6 +330,32 @@ static void write_elf32_notes(WriteCoreDumpFunction
> f, DumpState *s,
>      write_guest_note(f, s, errp);
>  }
>
> +static void write_elf_phdr_note(DumpState *s, Error **errp)
> +{
> +    ERRP_GUARD();
> +    Elf32_Phdr phdr32;
> +    Elf64_Phdr phdr64;
> +    void *phdr;
> +    size_t size;
> +    int ret;
> +
> +    if (dump_is_64bit(s)) {
> +        write_elf64_phdr_note(s, &phdr64);
> +        size =3D sizeof(phdr64);
> +        phdr =3D &phdr64;
> +    } else {
> +        write_elf32_phdr_note(s, &phdr32);
> +        size =3D sizeof(phdr32);
> +        phdr =3D &phdr32;
> +    }
> +
> +    ret =3D fd_write_vmcore(phdr, size, s);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret,
> +                         "dump: failed to write program header table");
> +    }
> +}
> +
>  static void write_elf_section(DumpState *s, int type, Error **errp)
>  {
>      Elf32_Shdr shdr32;
> @@ -541,13 +549,13 @@ static void dump_begin(DumpState *s, Error **errp)
>          return;
>      }
>
> -    if (dump_is_64bit(s)) {
> -        /* write PT_NOTE to vmcore */
> -        write_elf64_note(s, errp);
> -        if (*errp) {
> -            return;
> -        }
> +    /* write PT_NOTE to vmcore */
> +    write_elf_phdr_note(s, errp);
> +    if (*errp) {
> +        return;
> +    }
>
> +    if (dump_is_64bit(s)) {
>          /* write all PT_LOAD to vmcore */
>          write_elf_loads(s, errp);
>          if (*errp) {
> @@ -568,12 +576,6 @@ static void dump_begin(DumpState *s, Error **errp)
>              return;
>          }
>      } else {
> -        /* write PT_NOTE to vmcore */
> -        write_elf32_note(s, errp);
> -        if (*errp) {
> -            return;
> -        }
> -
>          /* write all PT_LOAD to vmcore */
>          write_elf_loads(s, errp);
>          if (*errp) {
> --
> 2.32.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000bf216d05db7fd7f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 30, 2022 at 4:49 PM Janos=
ch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" target=3D"_blank">fra=
nkja@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">There&#39;s no need to have two write functions. Let&#39;=
s rather have two<br>
functions that set the data for elf 32/64 and then write it in a<br>
common function.<br>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a hre=
f=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau=
@redhat.com</a>&gt;</div><div><br></div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
---<br>
=C2=A0dump/dump.c | 94 +++++++++++++++++++++++++++-------------------------=
-<br>
=C2=A01 file changed, 48 insertions(+), 46 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index a7cf112d8f..365798f5a1 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -236,24 +236,15 @@ static void write_elf32_load(DumpState *s, MemoryMapp=
ing *memory_mapping,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void write_elf64_note(DumpState *s, Error **errp)<br>
+static void write_elf64_phdr_note(DumpState *s, Elf64_Phdr *phdr)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 Elf64_Phdr phdr;<br>
-=C2=A0 =C2=A0 int ret;<br>
-<br>
-=C2=A0 =C2=A0 memset(&amp;phdr, 0, sizeof(Elf64_Phdr));<br>
-=C2=A0 =C2=A0 phdr.p_type =3D cpu_to_dump32(s, PT_NOTE);<br>
-=C2=A0 =C2=A0 phdr.p_offset =3D cpu_to_dump64(s, s-&gt;note_offset);<br>
-=C2=A0 =C2=A0 phdr.p_paddr =3D 0;<br>
-=C2=A0 =C2=A0 phdr.p_filesz =3D cpu_to_dump64(s, s-&gt;note_size);<br>
-=C2=A0 =C2=A0 phdr.p_memsz =3D cpu_to_dump64(s, s-&gt;note_size);<br>
-=C2=A0 =C2=A0 phdr.p_vaddr =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 ret =3D fd_write_vmcore(&amp;phdr, sizeof(Elf64_Phdr), s);<b=
r>
-=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, -ret,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;dump: failed to write program header table&quot;);<b=
r>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 memset(phdr, 0, sizeof(*phdr));<br>
+=C2=A0 =C2=A0 phdr-&gt;p_type =3D cpu_to_dump32(s, PT_NOTE);<br>
+=C2=A0 =C2=A0 phdr-&gt;p_offset =3D cpu_to_dump64(s, s-&gt;note_offset);<b=
r>
+=C2=A0 =C2=A0 phdr-&gt;p_paddr =3D 0;<br>
+=C2=A0 =C2=A0 phdr-&gt;p_filesz =3D cpu_to_dump64(s, s-&gt;note_size);<br>
+=C2=A0 =C2=A0 phdr-&gt;p_memsz =3D cpu_to_dump64(s, s-&gt;note_size);<br>
+=C2=A0 =C2=A0 phdr-&gt;p_vaddr =3D 0;<br>
=C2=A0}<br>
<br>
=C2=A0static inline int cpu_index(CPUState *cpu)<br>
@@ -301,24 +292,15 @@ static void write_elf64_notes(WriteCoreDumpFunction f=
, DumpState *s,<br>
=C2=A0 =C2=A0 =C2=A0write_guest_note(f, s, errp);<br>
=C2=A0}<br>
<br>
-static void write_elf32_note(DumpState *s, Error **errp)<br>
+static void write_elf32_phdr_note(DumpState *s, Elf32_Phdr *phdr)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 Elf32_Phdr phdr;<br>
-=C2=A0 =C2=A0 int ret;<br>
-<br>
-=C2=A0 =C2=A0 memset(&amp;phdr, 0, sizeof(Elf32_Phdr));<br>
-=C2=A0 =C2=A0 phdr.p_type =3D cpu_to_dump32(s, PT_NOTE);<br>
-=C2=A0 =C2=A0 phdr.p_offset =3D cpu_to_dump32(s, s-&gt;note_offset);<br>
-=C2=A0 =C2=A0 phdr.p_paddr =3D 0;<br>
-=C2=A0 =C2=A0 phdr.p_filesz =3D cpu_to_dump32(s, s-&gt;note_size);<br>
-=C2=A0 =C2=A0 phdr.p_memsz =3D cpu_to_dump32(s, s-&gt;note_size);<br>
-=C2=A0 =C2=A0 phdr.p_vaddr =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 ret =3D fd_write_vmcore(&amp;phdr, sizeof(Elf32_Phdr), s);<b=
r>
-=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, -ret,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;dump: failed to write program header table&quot;);<b=
r>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 memset(phdr, 0, sizeof(*phdr));<br>
+=C2=A0 =C2=A0 phdr-&gt;p_type =3D cpu_to_dump32(s, PT_NOTE);<br>
+=C2=A0 =C2=A0 phdr-&gt;p_offset =3D cpu_to_dump32(s, s-&gt;note_offset);<b=
r>
+=C2=A0 =C2=A0 phdr-&gt;p_paddr =3D 0;<br>
+=C2=A0 =C2=A0 phdr-&gt;p_filesz =3D cpu_to_dump32(s, s-&gt;note_size);<br>
+=C2=A0 =C2=A0 phdr-&gt;p_memsz =3D cpu_to_dump32(s, s-&gt;note_size);<br>
+=C2=A0 =C2=A0 phdr-&gt;p_vaddr =3D 0;<br>
=C2=A0}<br>
<br>
=C2=A0static void write_elf32_notes(WriteCoreDumpFunction f, DumpState *s,<=
br>
@@ -348,6 +330,32 @@ static void write_elf32_notes(WriteCoreDumpFunction f,=
 DumpState *s,<br>
=C2=A0 =C2=A0 =C2=A0write_guest_note(f, s, errp);<br>
=C2=A0}<br>
<br>
+static void write_elf_phdr_note(DumpState *s, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 ERRP_GUARD();<br>
+=C2=A0 =C2=A0 Elf32_Phdr phdr32;<br>
+=C2=A0 =C2=A0 Elf64_Phdr phdr64;<br>
+=C2=A0 =C2=A0 void *phdr;<br>
+=C2=A0 =C2=A0 size_t size;<br>
+=C2=A0 =C2=A0 int ret;<br>
+<br>
+=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_phdr_note(s, &amp;phdr64);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D sizeof(phdr64);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 phdr =3D &amp;phdr64;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_phdr_note(s, &amp;phdr32);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D sizeof(phdr32);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 phdr =3D &amp;phdr32;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ret =3D fd_write_vmcore(phdr, size, s);<br>
+=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, -ret,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;dump: failed to write program header table&quot;);<b=
r>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0static void write_elf_section(DumpState *s, int type, Error **errp)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Elf32_Shdr shdr32;<br>
@@ -541,13 +549,13 @@ static void dump_begin(DumpState *s, Error **errp)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* write PT_NOTE to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_note(s, errp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /* write PT_NOTE to vmcore */<br>
+=C2=A0 =C2=A0 write_elf_phdr_note(s, errp);<br>
+=C2=A0 =C2=A0 if (*errp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write all PT_LOAD to vmcore */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf_loads(s, errp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*errp) {<br>
@@ -568,12 +576,6 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* write PT_NOTE to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_note(s, errp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write all PT_LOAD to vmcore */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf_loads(s, errp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*errp) {<br>
-- <br>
2.32.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000bf216d05db7fd7f4--

