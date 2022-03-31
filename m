Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0DF4ED694
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:13:57 +0200 (CEST)
Received: from localhost ([::1]:53778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqsO-000305-LC
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:13:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZqca-000345-JC
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:57:39 -0400
Received: from [2a00:1450:4864:20::42e] (port=40585
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZqcR-00039v-2V
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:57:35 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d7so32722733wrb.7
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z+E4ZksTsFQSYOJCDy8FX9onSvrXqPQId7cOPWKUUoU=;
 b=jHjgM9OkoQJnHATm3L7CY/lMCCZDAhcdGLgWQQiNB6EJ9sHlBu0rDU9f4DIK1wTl/J
 hc5fq1kf0VC6pcRs/1Nui84MzrJdgsKBWVUlj3kzVjHbCeTGwc1FO9xweA56cVr1p4Eo
 jPLqOH9/n97GqaK3cVXquE0kH77peT+vTe5oXC8mmzJ9hTS1mk6eEQEiejsaJou+sgHU
 8N1hgUFrenQo35P4Jmalbig2gkrl/01++nkgWL7gvcb+RDzizHxfMg15GzZinxebMBVJ
 nWKDVKww70blSj4HlhtSleGS8qkU/ct9pZVLf9h9gICx/isSD+X8AalBehAT1FGlnnqf
 aDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z+E4ZksTsFQSYOJCDy8FX9onSvrXqPQId7cOPWKUUoU=;
 b=jHzM+M0bwNmYCy/dlU7LKAnPTQ79QzocY8QIyhMq7FgZd4BasFG9XcpJXm3x+jztuz
 pQVwziwTOANO9LMyk6+JssVv6cZZZuAKr6t49/0mrLeJPMcoANBrfUZoEYn2NXrbRkUs
 DyMMK8PK3zibfXJ1h8vsO/9KIqyljPBA7P+jV0w4IbYYEEb91LjH/OB3KS/ZyFTygXmM
 5QPF8Gb2k2mYm3Cm7HHMuUvMrb5Qu/lQREAiRbx6SkAxz/5tFK0NGmggjkxxDExPJHYU
 Cmbefo0we/oT1s8f45mPWiN70/bvZIlQQk3/UsHRYsqF5r0O6yf8pgjLnWIEAJFld3VN
 DuXA==
X-Gm-Message-State: AOAM532qFXm8kplYlyhPghaWKcDhqA73Wp016w7XxHoCSFMp1zvpK+ha
 IKY+PzxKesTN47wQ4rAQ507TZT0eFyCWodU7EIA=
X-Google-Smtp-Source: ABdhPJyLj96ZzAPcMf0oOL1oHRVmRoSNQ1gh5CoonZkIZugmngetYgaYxS5Pm99Pyk28ePNyuBGnTWS2CKmenUi4llM=
X-Received: by 2002:a05:6000:1107:b0:205:b8e5:8929 with SMTP id
 z7-20020a056000110700b00205b8e58929mr3269619wrw.187.1648717030063; Thu, 31
 Mar 2022 01:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220330123603.107120-1-frankja@linux.ibm.com>
 <20220330123603.107120-4-frankja@linux.ibm.com>
In-Reply-To: <20220330123603.107120-4-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 31 Mar 2022 12:56:58 +0400
Message-ID: <CAJ+F1CKdtwF0EdA88cJXjk6QrJ7PL_RYYy-c=RkS3H1zAYZq5g@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] dump: Introduce shdr_num to decrease complexity
To: Janosch Frank <frankja@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000e9821405db7fd89a"
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

--000000000000e9821405db7fd89a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 4:45 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> Let's move from a boolean to a int variable which will later enable us
> to store the number of sections that are in the dump file.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  dump/dump.c           | 24 ++++++++++++------------
>  include/sysemu/dump.h |  2 +-
>  2 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 0e6187c962..cd11dec0f4 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -140,12 +140,12 @@ static void write_elf64_header(DumpState *s, Error
> **errp)
>      elf_header.e_phoff =3D cpu_to_dump64(s, sizeof(Elf64_Ehdr));
>      elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf64_Phdr));
>      elf_header.e_phnum =3D cpu_to_dump16(s, phnum);
> -    if (s->have_section) {
> +    if (s->shdr_num) {
>          uint64_t shoff =3D sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr) *
> s->phdr_num;
>
>          elf_header.e_shoff =3D cpu_to_dump64(s, shoff);
>          elf_header.e_shentsize =3D cpu_to_dump16(s, sizeof(Elf64_Shdr));
> -        elf_header.e_shnum =3D cpu_to_dump16(s, 1);
> +        elf_header.e_shnum =3D cpu_to_dump16(s, s->shdr_num);
>      }
>
>      ret =3D fd_write_vmcore(&elf_header, sizeof(elf_header), s);
> @@ -172,12 +172,12 @@ static void write_elf32_header(DumpState *s, Error
> **errp)
>      elf_header.e_phoff =3D cpu_to_dump32(s, sizeof(Elf32_Ehdr));
>      elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf32_Phdr));
>      elf_header.e_phnum =3D cpu_to_dump16(s, phnum);
> -    if (s->have_section) {
> +    if (s->shdr_num) {
>          uint32_t shoff =3D sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) *
> s->phdr_num;
>
>          elf_header.e_shoff =3D cpu_to_dump32(s, shoff);
>          elf_header.e_shentsize =3D cpu_to_dump16(s, sizeof(Elf32_Shdr));
> -        elf_header.e_shnum =3D cpu_to_dump16(s, 1);
> +        elf_header.e_shnum =3D cpu_to_dump16(s, s->shdr_num);
>      }
>
>      ret =3D fd_write_vmcore(&elf_header, sizeof(elf_header), s);
> @@ -556,7 +556,7 @@ static void dump_begin(DumpState *s, Error **errp)
>          }
>
>          /* write section to vmcore */
> -        if (s->have_section) {
> +        if (s->shdr_num) {
>              write_elf_section(s, 1, errp);
>              if (*errp) {
>                  return;
> @@ -582,7 +582,7 @@ static void dump_begin(DumpState *s, Error **errp)
>          }
>
>          /* write section to vmcore */
> -        if (s->have_section) {
> +        if (s->shdr_num) {
>              write_elf_section(s, 0, errp);
>              if (*errp) {
>                  return;
> @@ -1793,11 +1793,11 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
>       */
>      s->phdr_num =3D 1; /* PT_NOTE */
>      if (s->list.num < UINT16_MAX - 2) {
> +        s->shdr_num =3D 0;
>          s->phdr_num +=3D s->list.num;
> -        s->have_section =3D false;
>      } else {
>          /* sh_info of section 0 holds the real number of phdrs */
> -        s->have_section =3D true;
> +        s->shdr_num =3D 1;
>
>          /* the type of shdr->sh_info is uint32_t, so we should avoid
> overflow */
>          if (s->list.num <=3D UINT32_MAX - 1) {
> @@ -1808,19 +1808,19 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
>      }
>
>      if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> -        if (s->have_section) {
> +        if (s->shdr_num) {
>              s->memory_offset =3D sizeof(Elf64_Ehdr) +
>                                 sizeof(Elf64_Phdr) * s->phdr_num +
> -                               sizeof(Elf64_Shdr) + s->note_size;
> +                               sizeof(Elf64_Shdr) * s->shdr_num +
> s->note_size;
>          } else {
>              s->memory_offset =3D sizeof(Elf64_Ehdr) +
>                                 sizeof(Elf64_Phdr) * s->phdr_num +
> s->note_size;
>          }
>      } else {
> -        if (s->have_section) {
> +        if (s->shdr_num) {
>              s->memory_offset =3D sizeof(Elf32_Ehdr) +
>                                 sizeof(Elf32_Phdr) * s->phdr_num +
> -                               sizeof(Elf32_Shdr) + s->note_size;
> +                               sizeof(Elf32_Shdr) * s->shdr_num +
> s->note_size;
>          } else {
>              s->memory_offset =3D sizeof(Elf32_Ehdr) +
>                                 sizeof(Elf32_Phdr) * s->phdr_num +
> s->note_size;
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index b463fc9c02..19458bffbd 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -155,7 +155,7 @@ typedef struct DumpState {
>      ArchDumpInfo dump_info;
>      MemoryMappingList list;
>      uint32_t phdr_num;
> -    bool have_section;
> +    uint32_t shdr_num;
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

--000000000000e9821405db7fd89a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 30, 2022 at 4:45 PM Janos=
ch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" target=3D"_blank">fra=
nkja@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Let&#39;s move from a boolean to a int variable which wil=
l later enable us<br>
to store the number of sections that are in the dump file.<br>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"=
mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redh=
at.com</a>&gt;</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
---<br>
=C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 24 ++++++++++++=
------------<br>
=C2=A0include/sysemu/dump.h |=C2=A0 2 +-<br>
=C2=A02 files changed, 13 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index 0e6187c962..cd11dec0f4 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -140,12 +140,12 @@ static void write_elf64_header(DumpState *s, Error **=
errp)<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_phoff =3D cpu_to_dump64(s, sizeof(Elf64_Eh=
dr));<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf6=
4_Phdr));<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_phnum =3D cpu_to_dump16(s, phnum);<br>
-=C2=A0 =C2=A0 if (s-&gt;have_section) {<br>
+=C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t shoff =3D sizeof(Elf64_Ehdr) + s=
izeof(Elf64_Phdr) * s-&gt;phdr_num;<br>
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
@@ -172,12 +172,12 @@ static void write_elf32_header(DumpState *s, Error **=
errp)<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_phoff =3D cpu_to_dump32(s, sizeof(Elf32_Eh=
dr));<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf3=
2_Phdr));<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_phnum =3D cpu_to_dump16(s, phnum);<br>
-=C2=A0 =C2=A0 if (s-&gt;have_section) {<br>
+=C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t shoff =3D sizeof(Elf32_Ehdr) + s=
izeof(Elf32_Phdr) * s-&gt;phdr_num;<br>
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
@@ -556,7 +556,7 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write section to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;have_section) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf_section(s, 1, err=
p);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
@@ -582,7 +582,7 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write section to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;have_section) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf_section(s, 0, err=
p);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
@@ -1793,11 +1793,11 @@ static void dump_init(DumpState *s, int fd, bool ha=
s_format,<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;phdr_num =3D 1; /* PT_NOTE */<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;list.num &lt; UINT16_MAX - 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;shdr_num =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;phdr_num +=3D s-&gt;list.num;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;have_section =3D false;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* sh_info of section 0 holds the real nu=
mber of phdrs */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;have_section =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;shdr_num =3D 1;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the type of shdr-&gt;sh_info is uint32=
_t, so we should avoid overflow */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;list.num &lt;=3D UINT32_MAX - 1=
) {<br>
@@ -1808,19 +1808,19 @@ static void dump_init(DumpState *s, int fd, bool ha=
s_format,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;dump_info.d_class =3D=3D ELFCLASS64) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;have_section) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;memory_offset =3D siz=
eof(Elf64_Ehdr) +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(Elf64_Phdr) * s-&gt;phdr_num =
+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf64_Shdr) + s-&gt;note_size;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf64_Shdr) * s-&gt;shdr_num +=
 s-&gt;note_size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;memory_offset =3D siz=
eof(Elf64_Ehdr) +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(Elf64_Phdr) * s-&gt;phdr_num =
+ s-&gt;note_size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;have_section) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;memory_offset =3D siz=
eof(Elf32_Ehdr) +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(Elf32_Phdr) * s-&gt;phdr_num =
+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf32_Shdr) + s-&gt;note_size;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf32_Shdr) * s-&gt;shdr_num +=
 s-&gt;note_size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;memory_offset =3D siz=
eof(Elf32_Ehdr) +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(Elf32_Phdr) * s-&gt;phdr_num =
+ s-&gt;note_size;<br>
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h<br>
index b463fc9c02..19458bffbd 100644<br>
--- a/include/sysemu/dump.h<br>
+++ b/include/sysemu/dump.h<br>
@@ -155,7 +155,7 @@ typedef struct DumpState {<br>
=C2=A0 =C2=A0 =C2=A0ArchDumpInfo dump_info;<br>
=C2=A0 =C2=A0 =C2=A0MemoryMappingList list;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t phdr_num;<br>
-=C2=A0 =C2=A0 bool have_section;<br>
+=C2=A0 =C2=A0 uint32_t shdr_num;<br>
=C2=A0 =C2=A0 =C2=A0bool resume;<br>
=C2=A0 =C2=A0 =C2=A0bool detached;<br>
=C2=A0 =C2=A0 =C2=A0ssize_t note_size;<br>
-- <br>
2.32.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000e9821405db7fd89a--

