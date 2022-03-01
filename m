Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C428A4C8E0B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:41:41 +0100 (CET)
Received: from localhost ([::1]:32924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3h6-000780-TB
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:41:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nP3Ws-0007oN-TL
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:31:07 -0500
Received: from [2a00:1450:4864:20::433] (port=39574
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nP3Wn-0001si-Ul
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:31:06 -0500
Received: by mail-wr1-x433.google.com with SMTP id ay10so2980632wrb.6
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 06:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KQaB6m0atNL6wpGPhry2gG66BGFgfyjJ5FdONUKdegY=;
 b=aUpZfyD/FfGqv/PNBSA4A+7NSpd9lY35nu18mQOEEXiWFV645uU+8RmEhAbyclz59g
 pK1Qb1a38vI9E6AcWW2mEbXmJzt3s+dpb3RGSqwp2We645Q7ezSFt88v86gmS3eCuIWG
 +rsOo0qdqP4+OTWruXSpt70UAgFfl7xdrm/OI/MvGlRudxxyYdttYxE2H7UWP/9up5X5
 DQCdB/3slevxL0zq6hUtI8+2ZZERBX1gVENgrzGmvd+X+u+nNjXSQaaOMh5kWhmIjVnM
 vtRr165ny1zUhtl+F0OQRkobbAKfuihvaGsLFm2ip27xyrnHEjnZ0/6jJx3xG//RbYgp
 cNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KQaB6m0atNL6wpGPhry2gG66BGFgfyjJ5FdONUKdegY=;
 b=A4xJkf9M4OWo1IBFqyH7PElrK1Hm0wUPtR3ESUR2AI1GcLbC9uJfn5+95r1FZ3zGsb
 0Bj1NlGLOUuUOuUfGkihmJyfzx5YMrMU080VMXpyj9ebdXbV+obcpKQg8ILp/2pVQ8mq
 HrY0Rya55ZVeI3pUDpl/eRc0cOJ49TWtx5wwjBBJX/BhuIo27M4MqZ/xh/vnpIeyNGPj
 /1OeX+Uoz/3OCBj300NnhpO1oyZkwSbfuP8XGK6X7CMzHZ9tH3Q6OFXb5CBBR7421xAp
 bRFyECHqV9l6r56K/P5WdpXXCpSVlqXjnRt2fpbP8qOD/JTSE9QoapzhM9PrLH2s8ium
 qPiQ==
X-Gm-Message-State: AOAM531feevqctL2tlK9gTnJrFVLJTxdFSmifYRAIJxPLwtPKprsMwi1
 VhSdLxGTSqM5TYwbfRYpJaLy3vBPiEJGyPpvkwg=
X-Google-Smtp-Source: ABdhPJzq8Yml9M2VwjpUL60S+3ie4fYW34F4U3JOEp0wbXmbMHjiZ/boB0ICm9c4qI2cTk1JEdQFgSHcKVyNNFqqCBc=
X-Received: by 2002:adf:c3cc:0:b0:1ed:b641:6ee2 with SMTP id
 d12-20020adfc3cc000000b001edb6416ee2mr19641990wrg.529.1646145059882; Tue, 01
 Mar 2022 06:30:59 -0800 (PST)
MIME-Version: 1.0
References: <20220301142213.28568-1-frankja@linux.ibm.com>
 <20220301142213.28568-6-frankja@linux.ibm.com>
In-Reply-To: <20220301142213.28568-6-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 1 Mar 2022 18:30:47 +0400
Message-ID: <CAJ+F1CLsQ5vwOdwURSuLAp_afSk-hffJC1wEYH7zVFiiLEXmfw@mail.gmail.com>
Subject: Re: [PATCH 5/7] dump: Consolidate phdr note writes
To: Janosch Frank <frankja@linux.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000008b0ae405d92903fe"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008b0ae405d92903fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Mar 1, 2022 at 6:26 PM Janosch Frank <frankja@linux.ibm.com> wrote:

> There's no need to have two write functions. Let's rather have two
> functions that set the data for elf 32/64 and then write it in a
> common function.
>
Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c | 96 ++++++++++++++++++++++++++---------------------------

 1 file changed, 48 insertions(+), 48 deletions(-)
>

I suppose there are other parts of the series that make use of that,
because as such, it's not a clear improvement to me.

>

>
> diff --git a/dump/dump.c b/dump/dump.c
> index bb152bddff..88c2dbb466 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -231,24 +231,15 @@ static void write_elf32_load(DumpState *s,
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
> @@ -296,24 +287,15 @@ static void write_elf64_notes(WriteCoreDumpFunction
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
> @@ -343,6 +325,31 @@ static void write_elf32_notes(WriteCoreDumpFunction
> f, DumpState *s,
>      write_guest_note(f, s, errp);
>  }
>
> +static void write_elf_phdr_note(DumpState *s, Error **errp)
> +{
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
> @@ -540,14 +547,14 @@ static void dump_begin(DumpState *s, Error **errp)
>          return;
>      }
>
> -    if (dump_is_64bit(s)) {
> -        /* write PT_NOTE to vmcore */
> -        write_elf64_note(s, &local_err);
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> -            return;
> -        }
> +    /* write PT_NOTE to vmcore */
> +    write_elf_phdr_note(s, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
>
> +    if (dump_is_64bit(s)) {
>          /* write all PT_LOAD to vmcore */
>          write_elf_loads(s, &local_err);
>          if (local_err) {
> @@ -571,13 +578,6 @@ static void dump_begin(DumpState *s, Error **errp)
>              return;
>          }
>      } else {
> -        /* write PT_NOTE to vmcore */
> -        write_elf32_note(s, &local_err);
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> -            return;
> -        }
> -
>          /* write all PT_LOAD to vmcore */
>          write_elf_loads(s, &local_err);
>          if (local_err) {
> --
> 2.32.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000008b0ae405d92903fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 1, 2022 at 6:26 PM Jano=
sch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>There&#39;s no need to have two write functions. Let&#39;s rather have two=
<br>
functions that set the data for elf 32/64 and then write it in a<br>
common function.<br></blockquote><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
---<br>
=C2=A0dump/dump.c | 96 ++++++++++++++++++++++++++--------------------------=
-=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A01 file changed, 48 insertions(+), 48 deletions(-)<br></blockquote><di=
v><br></div><div><div>I suppose there are other parts of the series that ma=
ke use of that, because as such, it&#39;s not a clear improvement to me.<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
</blockquote>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index bb152bddff..88c2dbb466 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -231,24 +231,15 @@ static void write_elf32_load(DumpState *s, MemoryMapp=
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
@@ -296,24 +287,15 @@ static void write_elf64_notes(WriteCoreDumpFunction f=
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
@@ -343,6 +325,31 @@ static void write_elf32_notes(WriteCoreDumpFunction f,=
 DumpState *s,<br>
=C2=A0 =C2=A0 =C2=A0write_guest_note(f, s, errp);<br>
=C2=A0}<br>
<br>
+static void write_elf_phdr_note(DumpState *s, Error **errp)<br>
+{<br>
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
@@ -540,14 +547,14 @@ static void dump_begin(DumpState *s, Error **errp)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* write PT_NOTE to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_note(s, &amp;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /* write PT_NOTE to vmcore */<br>
+=C2=A0 =C2=A0 write_elf_phdr_note(s, &amp;local_err);<br>
+=C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write all PT_LOAD to vmcore */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf_loads(s, &amp;local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
@@ -571,13 +578,6 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* write PT_NOTE to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_note(s, &amp;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write all PT_LOAD to vmcore */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf_loads(s, &amp;local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
-- <br>
2.32.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000008b0ae405d92903fe--

