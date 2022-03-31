Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FE24ED66B
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:02:37 +0200 (CEST)
Received: from localhost ([::1]:34872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqhQ-0006c5-3O
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:02:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZqdN-0003v7-OI
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:58:25 -0400
Received: from [2a00:1450:4864:20::334] (port=34330
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZqdL-0003WA-I4
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:58:25 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 p26-20020a05600c1d9a00b0038ccbff1951so1578021wms.1
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 01:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W7j9XgaWaEi1qX9EYWHYWXrT6AVt+cVJFBgIlHIYKWA=;
 b=XY403J5vTR0agaM/NU4Tk7y19Fn1f9hotPFGoCdIJUSTFFfgPdIzIhifFCaUfxfDqu
 +UEpGTuyAFIoTWJ6703e8MnBFlM43u/BScO0BVkwrXWlIoMiafPJ8QVa5qrFaNIsY6R4
 OJ+bZHPaAA7yz6P6x2AqDY1EwHzlF4ZgaTLn4heN60ce5o95F6EAJm/uSFco5ZPucCtb
 JR4TikPqOc9tz27GeNyqmfODyOTa0uXYFjOw84VSmNCTxN7HAr8qU+IXuRYJh0lBKUGZ
 1waV6sujIyNo33XEcR9hSEj/adhUkUpwlek1kYKp+ZMXotdKB0vUcoXxStNJbzNGS1ei
 VNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W7j9XgaWaEi1qX9EYWHYWXrT6AVt+cVJFBgIlHIYKWA=;
 b=GSlQ83rTUI07448zUQZuXlnkzxFRlkNp2dE1HpbuWnRVIGAkwYRq9LpRZrDX+UNfHg
 s3mttK3+nS9LoIvhtX14A5kHL4Y0/BLXrBPU5MoFSMIUYMiz4L6xpJTIdJZLQAgHa7lW
 K5y+qyXeBT01trmmE78jhwaRolc+YwtzQ4vCviUGiIJfhhUiSFEAEtR10AESgzZPY3R8
 K5x95eqQ8xN6Uiej8QIfXW1SBNPHBsXsZOabN6/hq6FujcUen2h/m5swjPEr3eIacq6I
 ECbj5dT6gfHNJi3/WkQ2HDmnqiAxTDqg2bcHBEG6rpu7EwddLRmT4ojMnWuwFtqrsY68
 V+WA==
X-Gm-Message-State: AOAM5318CvAGCHef021796y7ScZzI7YAnd4DDgZuHYCzZzYr7JgbbyMf
 QvHZgosWkh4JxdXqYwrywzrlCuHzynRf8U0vlB4=
X-Google-Smtp-Source: ABdhPJw6r18cnPwWSMngSahVL642XPJ0Nb8GwBBkbZXFEvHyp0m1Ys2ed7DUSrLuBzgM4efArQ7iRnsenezN1PKhH0g=
X-Received: by 2002:a7b:c5d6:0:b0:381:4127:84d3 with SMTP id
 n22-20020a7bc5d6000000b00381412784d3mr3854294wmk.24.1648717102166; Thu, 31
 Mar 2022 01:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220330123603.107120-1-frankja@linux.ibm.com>
 <20220330123603.107120-3-frankja@linux.ibm.com>
In-Reply-To: <20220330123603.107120-3-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 31 Mar 2022 12:58:10 +0400
Message-ID: <CAJ+F1CKk9_4PZqQ_ixAcQxpfVe6rgUkULV3EkpBRYgKi2B9Kdg@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] dump: Remove the sh_info variable
To: Janosch Frank <frankja@linux.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000035b41a05db7fdd57"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x334.google.com
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

--00000000000035b41a05db7fdd57
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 30, 2022 at 4:48 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> There's no need to have phdr_num and sh_info at the same time. We can
> make phdr_num 32 bit and set PN_XNUM when we write the header if
> phdr_num >=3D PN_XNUM.
>

I am not fond of this change tbh, mixing variables, casting a u32 to u16..

Could you provide more motivation? This seems to contradict also your
cleanup approach in the later patch "Add more offset variables".


> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  dump/dump.c           | 34 ++++++++++++++--------------------
>  include/sysemu/dump.h |  3 +--
>  2 files changed, 15 insertions(+), 22 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 58c4923fce..0e6187c962 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -124,6 +124,7 @@ static int fd_write_vmcore(const void *buf, size_t
> size, void *opaque)
>
>  static void write_elf64_header(DumpState *s, Error **errp)
>  {
> +    uint16_t phnum =3D s->phdr_num >=3D PN_XNUM ? PN_XNUM : s->phdr_num;
>

Please use MIN()


>      Elf64_Ehdr elf_header;
>      int ret;
>
> @@ -138,9 +139,9 @@ static void write_elf64_header(DumpState *s, Error
> **errp)
>      elf_header.e_ehsize =3D cpu_to_dump16(s, sizeof(elf_header));
>      elf_header.e_phoff =3D cpu_to_dump64(s, sizeof(Elf64_Ehdr));
>      elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf64_Phdr));
> -    elf_header.e_phnum =3D cpu_to_dump16(s, s->phdr_num);
> +    elf_header.e_phnum =3D cpu_to_dump16(s, phnum);
>      if (s->have_section) {
> -        uint64_t shoff =3D sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr) *
> s->sh_info;
> +        uint64_t shoff =3D sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr) *
> s->phdr_num;
>
>          elf_header.e_shoff =3D cpu_to_dump64(s, shoff);
>          elf_header.e_shentsize =3D cpu_to_dump16(s, sizeof(Elf64_Shdr));
> @@ -155,6 +156,7 @@ static void write_elf64_header(DumpState *s, Error
> **errp)
>
>  static void write_elf32_header(DumpState *s, Error **errp)
>  {
> +    uint16_t phnum =3D s->phdr_num >=3D PN_XNUM ? PN_XNUM : s->phdr_num;
>

same


>      Elf32_Ehdr elf_header;
>      int ret;
>
> @@ -169,9 +171,9 @@ static void write_elf32_header(DumpState *s, Error
> **errp)
>      elf_header.e_ehsize =3D cpu_to_dump16(s, sizeof(elf_header));
>      elf_header.e_phoff =3D cpu_to_dump32(s, sizeof(Elf32_Ehdr));
>      elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf32_Phdr));
> -    elf_header.e_phnum =3D cpu_to_dump16(s, s->phdr_num);
> +    elf_header.e_phnum =3D cpu_to_dump16(s, phnum);
>      if (s->have_section) {
> -        uint32_t shoff =3D sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) *
> s->sh_info;
> +        uint32_t shoff =3D sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) *
> s->phdr_num;
>
>          elf_header.e_shoff =3D cpu_to_dump32(s, shoff);
>          elf_header.e_shentsize =3D cpu_to_dump16(s, sizeof(Elf32_Shdr));
> @@ -358,12 +360,12 @@ static void write_elf_section(DumpState *s, int
> type, Error **errp)
>      if (type =3D=3D 0) {
>          shdr_size =3D sizeof(Elf32_Shdr);
>          memset(&shdr32, 0, shdr_size);
> -        shdr32.sh_info =3D cpu_to_dump32(s, s->sh_info);
> +        shdr32.sh_info =3D cpu_to_dump32(s, s->phdr_num);
>          shdr =3D &shdr32;
>      } else {
>          shdr_size =3D sizeof(Elf64_Shdr);
>          memset(&shdr64, 0, shdr_size);
> -        shdr64.sh_info =3D cpu_to_dump32(s, s->sh_info);
> +        shdr64.sh_info =3D cpu_to_dump32(s, s->phdr_num);
>          shdr =3D &shdr64;
>      }
>
> @@ -478,13 +480,6 @@ static void write_elf_loads(DumpState *s, Error
> **errp)
>      hwaddr offset, filesz;
>      MemoryMapping *memory_mapping;
>      uint32_t phdr_index =3D 1;
> -    uint32_t max_index;
> -
> -    if (s->have_section) {
> -        max_index =3D s->sh_info;
> -    } else {
> -        max_index =3D s->phdr_num;
> -    }
>
>      QTAILQ_FOREACH(memory_mapping, &s->list.head, next) {
>          get_offset_range(memory_mapping->phys_addr,
> @@ -502,7 +497,7 @@ static void write_elf_loads(DumpState *s, Error **err=
p)
>              return;
>          }
>
> -        if (phdr_index >=3D max_index) {
> +        if (phdr_index >=3D s->phdr_num) {
>              break;
>          }
>      }
> @@ -1801,22 +1796,21 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
>          s->phdr_num +=3D s->list.num;
>          s->have_section =3D false;
>      } else {
> +        /* sh_info of section 0 holds the real number of phdrs */
>          s->have_section =3D true;
> -        s->phdr_num =3D PN_XNUM;
> -        s->sh_info =3D 1; /* PT_NOTE */
>
>          /* the type of shdr->sh_info is uint32_t, so we should avoid
> overflow */
>          if (s->list.num <=3D UINT32_MAX - 1) {
> -            s->sh_info +=3D s->list.num;
> +            s->phdr_num +=3D s->list.num;
>          } else {
> -            s->sh_info =3D UINT32_MAX;
> +            s->phdr_num =3D UINT32_MAX;
>          }
>      }
>
>      if (s->dump_info.d_class =3D=3D ELFCLASS64) {
>          if (s->have_section) {
>              s->memory_offset =3D sizeof(Elf64_Ehdr) +
> -                               sizeof(Elf64_Phdr) * s->sh_info +
> +                               sizeof(Elf64_Phdr) * s->phdr_num +
>                                 sizeof(Elf64_Shdr) + s->note_size;
>          } else {
>              s->memory_offset =3D sizeof(Elf64_Ehdr) +
> @@ -1825,7 +1819,7 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
>      } else {
>          if (s->have_section) {
>              s->memory_offset =3D sizeof(Elf32_Ehdr) +
> -                               sizeof(Elf32_Phdr) * s->sh_info +
> +                               sizeof(Elf32_Phdr) * s->phdr_num +
>                                 sizeof(Elf32_Shdr) + s->note_size;
>          } else {
>              s->memory_offset =3D sizeof(Elf32_Ehdr) +
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index 250143cb5a..b463fc9c02 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -154,8 +154,7 @@ typedef struct DumpState {
>      GuestPhysBlockList guest_phys_blocks;
>      ArchDumpInfo dump_info;
>      MemoryMappingList list;
> -    uint16_t phdr_num;
> -    uint32_t sh_info;
> +    uint32_t phdr_num;
>      bool have_section;
>      bool resume;
>      bool detached;
> --
> 2.32.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000035b41a05db7fdd57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 30, 2022 at 4:48 PM Jan=
osch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" target=3D"_blank">f=
rankja@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">There&#39;s no need to have phdr_num and sh_info at the=
 same time. We can<br>
make phdr_num 32 bit and set PN_XNUM when we write the header if<br>
phdr_num &gt;=3D PN_XNUM.<br></blockquote><div><br></div><div>I am not fond=
 of this change tbh, mixing variables, casting a u32 to u16.. <br></div><di=
v><br></div><div>Could you provide more motivation? This seems to contradic=
t also your cleanup approach in the later patch &quot;Add more offset varia=
bles&quot;.<br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 34 ++++++++++++=
++--------------------<br>
=C2=A0include/sysemu/dump.h |=C2=A0 3 +--<br>
=C2=A02 files changed, 15 insertions(+), 22 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index 58c4923fce..0e6187c962 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -124,6 +124,7 @@ static int fd_write_vmcore(const void *buf, size_t size=
, void *opaque)<br>
<br>
=C2=A0static void write_elf64_header(DumpState *s, Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 uint16_t phnum =3D s-&gt;phdr_num &gt;=3D PN_XNUM ? PN_XNUM =
: s-&gt;phdr_num;<br></blockquote><div><br></div><div>Please use MIN()<br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0Elf64_Ehdr elf_header;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
@@ -138,9 +139,9 @@ static void write_elf64_header(DumpState *s, Error **er=
rp)<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_ehsize =3D cpu_to_dump16(s, sizeof(elf_hea=
der));<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_phoff =3D cpu_to_dump64(s, sizeof(Elf64_Eh=
dr));<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf6=
4_Phdr));<br>
-=C2=A0 =C2=A0 elf_header.e_phnum =3D cpu_to_dump16(s, s-&gt;phdr_num);<br>
+=C2=A0 =C2=A0 elf_header.e_phnum =3D cpu_to_dump16(s, phnum);<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;have_section) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t shoff =3D sizeof(Elf64_Ehdr) + sizeof=
(Elf64_Phdr) * s-&gt;sh_info;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t shoff =3D sizeof(Elf64_Ehdr) + sizeof=
(Elf64_Phdr) * s-&gt;phdr_num;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_shoff =3D cpu_to_dump64(s, s=
hoff);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_shentsize =3D cpu_to_dump16(=
s, sizeof(Elf64_Shdr));<br>
@@ -155,6 +156,7 @@ static void write_elf64_header(DumpState *s, Error **er=
rp)<br>
<br>
=C2=A0static void write_elf32_header(DumpState *s, Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 uint16_t phnum =3D s-&gt;phdr_num &gt;=3D PN_XNUM ? PN_XNUM =
: s-&gt;phdr_num;<br></blockquote><div><br></div><div>same</div><div>=C2=A0=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0Elf32_Ehdr elf_header;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
@@ -169,9 +171,9 @@ static void write_elf32_header(DumpState *s, Error **er=
rp)<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_ehsize =3D cpu_to_dump16(s, sizeof(elf_hea=
der));<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_phoff =3D cpu_to_dump32(s, sizeof(Elf32_Eh=
dr));<br>
=C2=A0 =C2=A0 =C2=A0elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf3=
2_Phdr));<br>
-=C2=A0 =C2=A0 elf_header.e_phnum =3D cpu_to_dump16(s, s-&gt;phdr_num);<br>
+=C2=A0 =C2=A0 elf_header.e_phnum =3D cpu_to_dump16(s, phnum);<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;have_section) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t shoff =3D sizeof(Elf32_Ehdr) + sizeof=
(Elf32_Phdr) * s-&gt;sh_info;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t shoff =3D sizeof(Elf32_Ehdr) + sizeof=
(Elf32_Phdr) * s-&gt;phdr_num;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_shoff =3D cpu_to_dump32(s, s=
hoff);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_header.e_shentsize =3D cpu_to_dump16(=
s, sizeof(Elf32_Shdr));<br>
@@ -358,12 +360,12 @@ static void write_elf_section(DumpState *s, int type,=
 Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0if (type =3D=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shdr_size =3D sizeof(Elf32_Shdr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;shdr32, 0, shdr_size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr32.sh_info =3D cpu_to_dump32(s, s-&gt;sh_i=
nfo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr32.sh_info =3D cpu_to_dump32(s, s-&gt;phdr=
_num);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shdr =3D &amp;shdr32;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shdr_size =3D sizeof(Elf64_Shdr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;shdr64, 0, shdr_size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64.sh_info =3D cpu_to_dump32(s, s-&gt;sh_i=
nfo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64.sh_info =3D cpu_to_dump32(s, s-&gt;phdr=
_num);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shdr =3D &amp;shdr64;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -478,13 +480,6 @@ static void write_elf_loads(DumpState *s, Error **errp=
)<br>
=C2=A0 =C2=A0 =C2=A0hwaddr offset, filesz;<br>
=C2=A0 =C2=A0 =C2=A0MemoryMapping *memory_mapping;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t phdr_index =3D 1;<br>
-=C2=A0 =C2=A0 uint32_t max_index;<br>
-<br>
-=C2=A0 =C2=A0 if (s-&gt;have_section) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_index =3D s-&gt;sh_info;<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_index =3D s-&gt;phdr_num;<br>
-=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_FOREACH(memory_mapping, &amp;s-&gt;list.head, ne=
xt) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_offset_range(memory_mapping-&gt;phys_=
addr,<br>
@@ -502,7 +497,7 @@ static void write_elf_loads(DumpState *s, Error **errp)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (phdr_index &gt;=3D max_index) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (phdr_index &gt;=3D s-&gt;phdr_num) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -1801,22 +1796,21 @@ static void dump_init(DumpState *s, int fd, bool ha=
s_format,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;phdr_num +=3D s-&gt;list.num;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;have_section =3D false;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* sh_info of section 0 holds the real number =
of phdrs */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;have_section =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_num =3D PN_XNUM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;sh_info =3D 1; /* PT_NOTE */<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* the type of shdr-&gt;sh_info is uint32=
_t, so we should avoid overflow */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;list.num &lt;=3D UINT32_MAX - 1=
) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;sh_info +=3D s-&gt;list.nu=
m;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_num +=3D s-&gt;list.n=
um;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;sh_info =3D UINT32_MAX;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_num =3D UINT32_MAX;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;dump_info.d_class =3D=3D ELFCLASS64) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;have_section) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;memory_offset =3D siz=
eof(Elf64_Ehdr) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf64_Phdr) * s-&gt;sh_info +<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf64_Phdr) * s-&gt;phdr_num +=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(Elf64_Shdr) + s-&gt;note_size=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;memory_offset =3D siz=
eof(Elf64_Ehdr) +<br>
@@ -1825,7 +1819,7 @@ static void dump_init(DumpState *s, int fd, bool has_=
format,<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;have_section) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;memory_offset =3D siz=
eof(Elf32_Ehdr) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf32_Phdr) * s-&gt;sh_info +<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf32_Phdr) * s-&gt;phdr_num +=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(Elf32_Shdr) + s-&gt;note_size=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;memory_offset =3D siz=
eof(Elf32_Ehdr) +<br>
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h<br>
index 250143cb5a..b463fc9c02 100644<br>
--- a/include/sysemu/dump.h<br>
+++ b/include/sysemu/dump.h<br>
@@ -154,8 +154,7 @@ typedef struct DumpState {<br>
=C2=A0 =C2=A0 =C2=A0GuestPhysBlockList guest_phys_blocks;<br>
=C2=A0 =C2=A0 =C2=A0ArchDumpInfo dump_info;<br>
=C2=A0 =C2=A0 =C2=A0MemoryMappingList list;<br>
-=C2=A0 =C2=A0 uint16_t phdr_num;<br>
-=C2=A0 =C2=A0 uint32_t sh_info;<br>
+=C2=A0 =C2=A0 uint32_t phdr_num;<br>
=C2=A0 =C2=A0 =C2=A0bool have_section;<br>
=C2=A0 =C2=A0 =C2=A0bool resume;<br>
=C2=A0 =C2=A0 =C2=A0bool detached;<br>
-- <br>
2.32.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--00000000000035b41a05db7fdd57--

