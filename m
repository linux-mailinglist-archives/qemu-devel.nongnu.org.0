Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663E14C8E1D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:45:35 +0100 (CET)
Received: from localhost ([::1]:40816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3ks-0004L5-Ev
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:45:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nP3iW-0001dK-Q1
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:43:08 -0500
Received: from [2a00:1450:4864:20::42d] (port=35396
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nP3iU-0004Fi-NQ
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:43:08 -0500
Received: by mail-wr1-x42d.google.com with SMTP id b5so20934867wrr.2
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 06:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sWO9JQy2HpU0Li+6ydQ/cxSh9Wo/dZTQNpCTZH+02bk=;
 b=EzIzLR4dD/Au4Tv4DwU4ilcUenfdGt6jPhioQlZMI9hRUHZtKNlwG1vkTbqgJEicXZ
 qzKewA3ntFRBEDxgOk4ysYJXskNi2Wx+dqDcXs5cSs1EpjaBCaGb2ZxrwkuIB52jMAQs
 OgjQYAKvvIk71JTRiwBDIH7xsU0s0zRlBeNqGcMTM/1OUE7nJILP0xXNXPs2sbj5ukyu
 wd+KSRMFkjjBhvU5CLfnSeorIB435OMeCgQcj8eIGHH1YMEoGqhN6ipUOOjTboi0vqDG
 JmpaUGjuwLZGzUss0Sr5FgeOLTseqRrmIC6c9CdTED71dNVFFFClfoFfqpL/PcQamVFF
 QrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sWO9JQy2HpU0Li+6ydQ/cxSh9Wo/dZTQNpCTZH+02bk=;
 b=7jBRUNRwAY949CPaIq9gUPKuFjyN3vwjM2ns3FOeQdBNxgIr25pAmCQGlzHCpcTU3o
 SXG7Egzp21VewJg2lL3iMJy62H2DsqF/9E7BqPzKL+DFP/buVQzkyeIWMb6U/CFfPNz0
 XIJkKowdHcJDZsZljXhWGCWZ7zBgY3AO+sv8uqfX19HYXEJZTcn1LKBHaz1v6JMI8gwe
 CCep9FkXuKc1/ZANvdemFuO3mch3maHISjqSLM2ibletSnLuqQbf5QfDWTBHci92ksF1
 x4yPE2FLKmR+pv6y85OrwvswYT/7MzWb5h/sGVp01YVeuLqPVlMW4mMHKd4lWpUglGxl
 Xing==
X-Gm-Message-State: AOAM532rTZCns74hcXdICo8N0FbHA45bgdBGm5RINFnHX+u4lpyR0//x
 zUDW/9X6Gni7UKx+coyFcunTCUk6q7PJqarFe2c=
X-Google-Smtp-Source: ABdhPJzEcfcoIAj4zN/oCFloxPUJp0lB3dFYK9TUFS20tG2eBPjA3dIH28PamT81KdsHYZLy+bD3qQo7bvGsyqxcg9c=
X-Received: by 2002:a5d:6d0c:0:b0:1ea:81fb:f323 with SMTP id
 e12-20020a5d6d0c000000b001ea81fbf323mr20279312wrq.187.1646145784759; Tue, 01
 Mar 2022 06:43:04 -0800 (PST)
MIME-Version: 1.0
References: <20220301142213.28568-1-frankja@linux.ibm.com>
 <20220301142213.28568-2-frankja@linux.ibm.com>
In-Reply-To: <20220301142213.28568-2-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 1 Mar 2022 18:42:52 +0400
Message-ID: <CAJ+F1CJVe71E+Wr4T7EB8h1t3kyZ8zVh2HDw2G=oL-Pi2a-xyA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dump: Introduce shdr_num to decrease complexity
To: Janosch Frank <frankja@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000bfc80905d9292ed7"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42d.google.com
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

--000000000000bfc80905d9292ed7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Mar 1, 2022 at 6:33 PM Janosch Frank <frankja@linux.ibm.com> wrote:

> Let's move from a boolean to a int variable which will later enable us
> to store the number of sections that are in the dump file.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c           | 43 ++++++++++++++++++-------------------------
>  include/sysemu/dump.h |  2 +-
>  2 files changed, 19 insertions(+), 26 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index a84d8b1598..6696d9819a 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -139,12 +139,12 @@ static void write_elf64_header(DumpState *s, Error
> **errp)
>      elf_header.e_phoff =3D cpu_to_dump64(s, sizeof(Elf64_Ehdr));
>      elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf64_Phdr));
>      elf_header.e_phnum =3D cpu_to_dump16(s, s->phdr_num);
> -    if (s->have_section) {
> +    if (s->shdr_num) {
>          uint64_t shoff =3D sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr) *
> s->sh_info;
>
>          elf_header.e_shoff =3D cpu_to_dump64(s, shoff);
>          elf_header.e_shentsize =3D cpu_to_dump16(s, sizeof(Elf64_Shdr));
> -        elf_header.e_shnum =3D cpu_to_dump16(s, 1);
> +        elf_header.e_shnum =3D cpu_to_dump16(s, s->shdr_num);
>      }
>
>      ret =3D fd_write_vmcore(&elf_header, sizeof(elf_header), s);
> @@ -170,12 +170,12 @@ static void write_elf32_header(DumpState *s, Error
> **errp)
>      elf_header.e_phoff =3D cpu_to_dump32(s, sizeof(Elf32_Ehdr));
>      elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf32_Phdr));
>      elf_header.e_phnum =3D cpu_to_dump16(s, s->phdr_num);
> -    if (s->have_section) {
> +    if (s->shdr_num) {
>          uint32_t shoff =3D sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) *
> s->sh_info;
>
>          elf_header.e_shoff =3D cpu_to_dump32(s, shoff);
>          elf_header.e_shentsize =3D cpu_to_dump16(s, sizeof(Elf32_Shdr));
> -        elf_header.e_shnum =3D cpu_to_dump16(s, 1);
> +        elf_header.e_shnum =3D cpu_to_dump16(s, s->shdr_num);
>      }
>
>      ret =3D fd_write_vmcore(&elf_header, sizeof(elf_header), s);
> @@ -482,7 +482,7 @@ static void write_elf_loads(DumpState *s, Error **err=
p)
>      uint32_t max_index;
>      Error *local_err =3D NULL;
>
> -    if (s->have_section) {
> +    if (s->shdr_num) {
>          max_index =3D s->sh_info;
>      } else {
>          max_index =3D s->phdr_num;
> @@ -567,7 +567,7 @@ static void dump_begin(DumpState *s, Error **errp)
>          }
>
>          /* write section to vmcore */
> -        if (s->have_section) {
> +        if (s->shdr_num) {
>              write_elf_section(s, 1, &local_err);
>              if (local_err) {
>                  error_propagate(errp, local_err);
> @@ -597,7 +597,7 @@ static void dump_begin(DumpState *s, Error **errp)
>          }
>
>          /* write section to vmcore */
> -        if (s->have_section) {
> +        if (s->shdr_num) {
>              write_elf_section(s, 0, &local_err);
>              if (local_err) {
>                  error_propagate(errp, local_err);
> @@ -1818,11 +1818,12 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
>       */
>      s->phdr_num =3D 1; /* PT_NOTE */
>      if (s->list.num < UINT16_MAX - 2) {
> +        s->shdr_num =3D 0;
>          s->phdr_num +=3D s->list.num;
> -        s->have_section =3D false;
>      } else {
> -        s->have_section =3D true;
> +        /* sh_info of section 0 holds the real number of phdrs */
>

...


>          s->phdr_num =3D PN_XNUM;
> +        s->shdr_num =3D 1;
>          s->sh_info =3D 1; /* PT_NOTE */
>
>          /* the type of shdr->sh_info is uint32_t, so we should avoid
> overflow */
> @@ -1834,23 +1835,15 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
>      }
>
>      if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> -        if (s->have_section) {
> -            s->memory_offset =3D sizeof(Elf64_Ehdr) +
> -                               sizeof(Elf64_Phdr) * s->sh_info +
> -                               sizeof(Elf64_Shdr) + s->note_size;
> -        } else {
> -            s->memory_offset =3D sizeof(Elf64_Ehdr) +
> -                               sizeof(Elf64_Phdr) * s->phdr_num +
> s->note_size;
> -        }
> +        s->memory_offset =3D sizeof(Elf64_Ehdr) +
> +                           sizeof(Elf64_Phdr) * s->sh_info +
>

The change "removing/replacing sizeof(Elf64_Phdr) * s->phdr_num by *
s->sh_info" should be done as a preliminary step, with more comments.

+                           sizeof(Elf64_Shdr) * s->shdr_num +
> +                           s->note_size;
>      } else {
> -        if (s->have_section) {
> -            s->memory_offset =3D sizeof(Elf32_Ehdr) +
> -                               sizeof(Elf32_Phdr) * s->sh_info +
> -                               sizeof(Elf32_Shdr) + s->note_size;
> -        } else {
> -            s->memory_offset =3D sizeof(Elf32_Ehdr) +
> -                               sizeof(Elf32_Phdr) * s->phdr_num +
> s->note_size;
> -        }
> +        s->memory_offset =3D sizeof(Elf32_Ehdr) +
> +                           sizeof(Elf32_Phdr) * s->sh_info +
> +                           sizeof(Elf32_Shdr) * s->shdr_num +
> +                           s->note_size;
>      }
>
>      return;
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index 250143cb5a..854341da0d 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -155,8 +155,8 @@ typedef struct DumpState {
>      ArchDumpInfo dump_info;
>      MemoryMappingList list;
>      uint16_t phdr_num;
> +    uint32_t shdr_num;
>      uint32_t sh_info;
> -    bool have_section;
>      bool resume;
>      bool detached;
>      ssize_t note_size;
> --
> 2.32.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000bfc80905d9292ed7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 1, 2022 at 6:33 PM Jano=
sch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Let&#39;s move from a boolean to a int variable which will later enable us=
<br>
to store the number of sections that are in the dump file.<br>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
---<br>
=C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 43 ++++++++++++=
++++++-------------------------<br>
=C2=A0include/sysemu/dump.h |=C2=A0 2 +-<br>
=C2=A02 files changed, 19 insertions(+), 26 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index a84d8b1598..6696d9819a 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -139,12 +139,12 @@ static void write_elf64_header(DumpState *s, Error **=
errp)<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_phoff =3D cpu_to_dump64(s, sizeof(Elf64_Eh=
dr));<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf6=
4_Phdr));<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_phnum =3D cpu_to_dump16(s, s-&gt;phdr_num)=
;<br>
-=C2=A0 =C2=A0 if (s-&gt;have_section) {<br>
+=C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t shoff =3D sizeof(Elf64_Ehdr) + s=
izeof(Elf64_Phdr) * s-&gt;sh_info;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_shoff =3D cpu_to_dump64(s, s=
hoff);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_shentsize =3D cpu_to_dump16(=
s, sizeof(Elf64_Shdr));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header.e_shnum =3D cpu_to_dump16(s, 1);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header.e_shnum =3D cpu_to_dump16(s, s-&gt;=
shdr_num);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D fd_write_vmcore(&amp;elf_header, sizeof(elf_hea=
der), s);<br>
@@ -170,12 +170,12 @@ static void write_elf32_header(DumpState *s, Error **=
errp)<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_phoff =3D cpu_to_dump32(s, sizeof(Elf32_Eh=
dr));<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf3=
2_Phdr));<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_phnum =3D cpu_to_dump16(s, s-&gt;phdr_num)=
;<br>
-=C2=A0 =C2=A0 if (s-&gt;have_section) {<br>
+=C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t shoff =3D sizeof(Elf32_Ehdr) + s=
izeof(Elf32_Phdr) * s-&gt;sh_info;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_shoff =3D cpu_to_dump32(s, s=
hoff);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_shentsize =3D cpu_to_dump16(=
s, sizeof(Elf32_Shdr));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header.e_shnum =3D cpu_to_dump16(s, 1);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header.e_shnum =3D cpu_to_dump16(s, s-&gt;=
shdr_num);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D fd_write_vmcore(&amp;elf_header, sizeof(elf_hea=
der), s);<br>
@@ -482,7 +482,7 @@ static void write_elf_loads(DumpState *s, Error **errp)=
<br>
=C2=A0 =C2=A0 =C2=A0uint32_t max_index;<br>
=C2=A0 =C2=A0 =C2=A0Error *local_err =3D NULL;<br>
<br>
-=C2=A0 =C2=A0 if (s-&gt;have_section) {<br>
+=C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_index =3D s-&gt;sh_info;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_index =3D s-&gt;phdr_num;<br>
@@ -567,7 +567,7 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write section to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;have_section) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf_section(s, 1, &am=
p;local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propaga=
te(errp, local_err);<br>
@@ -597,7 +597,7 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write section to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;have_section) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf_section(s, 0, &am=
p;local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propaga=
te(errp, local_err);<br>
@@ -1818,11 +1818,12 @@ static void dump_init(DumpState *s, int fd, bool ha=
s_format,<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;phdr_num =3D 1; /* PT_NOTE */<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;list.num &lt; UINT16_MAX - 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;shdr_num =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;phdr_num +=3D s-&gt;list.num;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;have_section =3D false;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;have_section =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* sh_info of section 0 holds the real number =
of phdrs */<br></blockquote><div><br></div><div>...</div><div>=C2=A0<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;phdr_num =3D PN_XNUM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;shdr_num =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;sh_info =3D 1; /* PT_NOTE */<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the type of shdr-&gt;sh_info is uint32=
_t, so we should avoid overflow */<br>
@@ -1834,23 +1835,15 @@ static void dump_init(DumpState *s, int fd, bool ha=
s_format,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;dump_info.d_class =3D=3D ELFCLASS64) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;have_section) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;memory_offset =3D sizeof(E=
lf64_Ehdr) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf64_Phdr) * s-&gt;sh_info +<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf64_Shdr) + s-&gt;note_size;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;memory_offset =3D sizeof(E=
lf64_Ehdr) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf64_Phdr) * s-&gt;phdr_num +=
 s-&gt;note_size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;memory_offset =3D sizeof(Elf64_Ehdr) +<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf64_Phdr) * s-&gt;sh_info +<br></blockquot=
e><div><br></div><div>The change &quot;removing/replacing sizeof(Elf64_Phdr=
) * s-&gt;phdr_num by * s-&gt;sh_info&quot; should be done as a preliminary=
 step, with more comments.<br></div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf64_Shdr) * s-&gt;shdr_num +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;note_size;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;have_section) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;memory_offset =3D sizeof(E=
lf32_Ehdr) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf32_Phdr) * s-&gt;sh_info +<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf32_Shdr) + s-&gt;note_size;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;memory_offset =3D sizeof(E=
lf32_Ehdr) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf32_Phdr) * s-&gt;phdr_num +=
 s-&gt;note_size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;memory_offset =3D sizeof(Elf32_Ehdr) +<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf32_Phdr) * s-&gt;sh_info +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf32_Shdr) * s-&gt;shdr_num +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;note_size;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0return;<br>
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h<br>
index 250143cb5a..854341da0d 100644<br>
--- a/include/sysemu/dump.h<br>
+++ b/include/sysemu/dump.h<br>
@@ -155,8 +155,8 @@ typedef struct DumpState {<br>
=C2=A0 =C2=A0 =C2=A0ArchDumpInfo dump_info;<br>
=C2=A0 =C2=A0 =C2=A0MemoryMappingList list;<br>
=C2=A0 =C2=A0 =C2=A0uint16_t phdr_num;<br>
+=C2=A0 =C2=A0 uint32_t shdr_num;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t sh_info;<br>
-=C2=A0 =C2=A0 bool have_section;<br>
=C2=A0 =C2=A0 =C2=A0bool resume;<br>
=C2=A0 =C2=A0 =C2=A0bool detached;<br>
=C2=A0 =C2=A0 =C2=A0ssize_t note_size;<br>
-- <br>
2.32.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000bfc80905d9292ed7--

