Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B248359553C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 10:30:01 +0200 (CEST)
Received: from localhost ([::1]:33228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNrxY-0008VE-8G
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 04:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oNrud-0005ip-Pi; Tue, 16 Aug 2022 04:27:04 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:34392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oNrub-0003td-Lv; Tue, 16 Aug 2022 04:26:59 -0400
Received: by mail-lf1-x131.google.com with SMTP id o2so13845880lfb.1;
 Tue, 16 Aug 2022 01:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=AUrJ38OMKIC7k9sliYl3ko+R1LDlt6mUqMRLL4DwN9U=;
 b=o5hOovQT9S3lLoDWsWKwk4WBAsBdNo2yCzr3wGuqWEM4MkIlL3C1TBb2aqPjFqZfFt
 BfPNq8QC19bQXak25ag1up/6qNdr/srxsrj1+uGwAGH/kbfXoXy/aQKwkAxw1Mx/klQD
 Br00Q/Lz7O8HOF4Ev1Lv2A/EyZppNUA621HqWiM4aZouoNXZyK+lG5xXoeIFE6h3Kszu
 eExnCD4z+EE8kPRBxDgLcyrg4caSRr7YJqs0PYMrpvcYPLZjBI+Lx8JZkph5H6AS00bo
 xmN6BiB1Ur8PePJmV+PCaUfwi8vxU8cW/Le5XfkZkqmjZU47ZgEa7iyYQ/g3va9yThoN
 eK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=AUrJ38OMKIC7k9sliYl3ko+R1LDlt6mUqMRLL4DwN9U=;
 b=SBkVB/nykZgyvmGC0qaLkHHPi7pL4Oyv9Ds7matQN0e1bvf22Mu/qWZ4h5zsP4itcF
 ZWoAP7i4/8DXhMO3TfUu1Ef8Tc3rVhhaRgLA88vtvzH8jevu9sYJs21DlGefn4zsPDJV
 unzYlDcEW7A6QhPP6fLGU+i2fU/ejkbDQoNvxDlKKkYx59zA0CZ8f5dzN8mBRDfhDs0G
 3hVd7pnr7PRtSDsR3dwvteqwLQo4W/dp7A6hbta6WblnQlRJyRbwbhAntKCIm6cxV3Nd
 aPf7c5jlCyQJv2r4t8bwoviMNhJu9UG+Ku1ZNCxOHilGvY8TidN0KOs8cSgVDrJ+JIpg
 ErIA==
X-Gm-Message-State: ACgBeo3WngPCGIh+LkMOnGm1G71RvNlEACotywRJj//UKQH/va3069uh
 ZhJ/bS2s/LTWx6+Ut1Qaa+DB0BlBZ0/qrUGnc20=
X-Google-Smtp-Source: AA6agR6ImlPy8vZQ/7izMgI15EEE/ujX1NKPbEew7wtZ9Q+MuYFxFE5FMHob3QZ9dthpAEwSYNfV//7mNbQt+JOvYOQ=
X-Received: by 2002:a05:6512:695:b0:491:6ee3:bf33 with SMTP id
 t21-20020a056512069500b004916ee3bf33mr4890176lfe.276.1660638414221; Tue, 16
 Aug 2022 01:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-8-frankja@linux.ibm.com>
In-Reply-To: <20220811121111.9878-8-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 16 Aug 2022 12:26:42 +0400
Message-ID: <CAJ+F1C+vA6Kr=iyRL=hkzM_pXOwsD1i607Vm7MKg+p=c=tDMUA@mail.gmail.com>
Subject: Re: [PATCH v5 07/18] dump: Split elf header functions into prepare
 and write
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com, 
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org, 
 seiden@linux.ibm.com, scgl@linux.ibm.com
Content-Type: multipart/alternative; boundary="000000000000c7b8a705e6578200"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x131.google.com
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

--000000000000c7b8a705e6578200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2022 at 4:29 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> Let's split the write from the modification of the elf header so we
> can consolidate the write of the data in one function.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  dump/dump.c | 100 ++++++++++++++++++++++++++++------------------------
>  1 file changed, 53 insertions(+), 47 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index d82cc46d7d..8a2a97a85e 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -131,7 +131,7 @@ static int fd_write_vmcore(const void *buf, size_t
> size, void *opaque)
>      return 0;
>  }
>
> -static void write_elf64_header(DumpState *s, Error **errp)
> +static void prepare_elf64_header(DumpState *s, Elf64_Ehdr *elf_header)
>  {
>      /*
>       * phnum in the elf header is 16 bit, if we have more segments we
> @@ -139,34 +139,27 @@ static void write_elf64_header(DumpState *s, Error
> **errp)
>       * special section.
>       */
>      uint16_t phnum =3D MIN(s->phdr_num, PN_XNUM);
> -    Elf64_Ehdr elf_header;
> -    int ret;
>
> -    memset(&elf_header, 0, sizeof(Elf64_Ehdr));
> -    memcpy(&elf_header, ELFMAG, SELFMAG);
> -    elf_header.e_ident[EI_CLASS] =3D ELFCLASS64;
> -    elf_header.e_ident[EI_DATA] =3D s->dump_info.d_endian;
> -    elf_header.e_ident[EI_VERSION] =3D EV_CURRENT;
> -    elf_header.e_type =3D cpu_to_dump16(s, ET_CORE);
> -    elf_header.e_machine =3D cpu_to_dump16(s, s->dump_info.d_machine);
> -    elf_header.e_version =3D cpu_to_dump32(s, EV_CURRENT);
> -    elf_header.e_ehsize =3D cpu_to_dump16(s, sizeof(elf_header));
> -    elf_header.e_phoff =3D cpu_to_dump64(s, s->phdr_offset);
> -    elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf64_Phdr));
> -    elf_header.e_phnum =3D cpu_to_dump16(s, phnum);
> +    memset(elf_header, 0, sizeof(Elf64_Ehdr));
> +    memcpy(elf_header, ELFMAG, SELFMAG);
> +    elf_header->e_ident[EI_CLASS] =3D ELFCLASS64;
> +    elf_header->e_ident[EI_DATA] =3D s->dump_info.d_endian;
> +    elf_header->e_ident[EI_VERSION] =3D EV_CURRENT;
> +    elf_header->e_type =3D cpu_to_dump16(s, ET_CORE);
> +    elf_header->e_machine =3D cpu_to_dump16(s, s->dump_info.d_machine);
> +    elf_header->e_version =3D cpu_to_dump32(s, EV_CURRENT);
> +    elf_header->e_ehsize =3D cpu_to_dump16(s, sizeof(elf_header));
> +    elf_header->e_phoff =3D cpu_to_dump64(s, s->phdr_offset);
> +    elf_header->e_phentsize =3D cpu_to_dump16(s, sizeof(Elf64_Phdr));
> +    elf_header->e_phnum =3D cpu_to_dump16(s, phnum);
>      if (s->shdr_num) {
> -        elf_header.e_shoff =3D cpu_to_dump64(s, s->shdr_offset);
> -        elf_header.e_shentsize =3D cpu_to_dump16(s, sizeof(Elf64_Shdr));
> -        elf_header.e_shnum =3D cpu_to_dump16(s, s->shdr_num);
> -    }
> -
> -    ret =3D fd_write_vmcore(&elf_header, sizeof(elf_header), s);
> -    if (ret < 0) {
> -        error_setg_errno(errp, -ret, "dump: failed to write elf header")=
;
> +        elf_header->e_shoff =3D cpu_to_dump64(s, s->shdr_offset);
> +        elf_header->e_shentsize =3D cpu_to_dump16(s, sizeof(Elf64_Shdr))=
;
> +        elf_header->e_shnum =3D cpu_to_dump16(s, s->shdr_num);
>      }
>  }
>
> -static void write_elf32_header(DumpState *s, Error **errp)
> +static void prepare_elf32_header(DumpState *s, Elf32_Ehdr *elf_header)
>  {
>      /*
>       * phnum in the elf header is 16 bit, if we have more segments we
> @@ -174,28 +167,45 @@ static void write_elf32_header(DumpState *s, Error
> **errp)
>       * special section.
>       */
>      uint16_t phnum =3D MIN(s->phdr_num, PN_XNUM);
> -    Elf32_Ehdr elf_header;
> +
> +    memset(elf_header, 0, sizeof(Elf32_Ehdr));
> +    memcpy(elf_header, ELFMAG, SELFMAG);
> +    elf_header->e_ident[EI_CLASS] =3D ELFCLASS32;
> +    elf_header->e_ident[EI_DATA] =3D s->dump_info.d_endian;
> +    elf_header->e_ident[EI_VERSION] =3D EV_CURRENT;
> +    elf_header->e_type =3D cpu_to_dump16(s, ET_CORE);
> +    elf_header->e_machine =3D cpu_to_dump16(s, s->dump_info.d_machine);
> +    elf_header->e_version =3D cpu_to_dump32(s, EV_CURRENT);
> +    elf_header->e_ehsize =3D cpu_to_dump16(s, sizeof(elf_header));
> +    elf_header->e_phoff =3D cpu_to_dump32(s, s->phdr_offset);
> +    elf_header->e_phentsize =3D cpu_to_dump16(s, sizeof(Elf32_Phdr));
> +    elf_header->e_phnum =3D cpu_to_dump16(s, phnum);
> +    if (s->shdr_num) {
> +        elf_header->e_shoff =3D cpu_to_dump32(s, s->shdr_offset);
> +        elf_header->e_shentsize =3D cpu_to_dump16(s, sizeof(Elf32_Shdr))=
;
> +        elf_header->e_shnum =3D cpu_to_dump16(s, s->shdr_num);
> +    }
> +}
> +
> +static void write_elf_header(DumpState *s, Error **errp)
> +{
> +    Elf32_Ehdr elf32_header;
> +    Elf64_Ehdr elf64_header;
> +    size_t header_size;
> +    void *header_ptr;
>      int ret;
>
> -    memset(&elf_header, 0, sizeof(Elf32_Ehdr));
> -    memcpy(&elf_header, ELFMAG, SELFMAG);
> -    elf_header.e_ident[EI_CLASS] =3D ELFCLASS32;
> -    elf_header.e_ident[EI_DATA] =3D s->dump_info.d_endian;
> -    elf_header.e_ident[EI_VERSION] =3D EV_CURRENT;
> -    elf_header.e_type =3D cpu_to_dump16(s, ET_CORE);
> -    elf_header.e_machine =3D cpu_to_dump16(s, s->dump_info.d_machine);
> -    elf_header.e_version =3D cpu_to_dump32(s, EV_CURRENT);
> -    elf_header.e_ehsize =3D cpu_to_dump16(s, sizeof(elf_header));
> -    elf_header.e_phoff =3D cpu_to_dump32(s, s->phdr_offset);
> -    elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf32_Phdr));
> -    elf_header.e_phnum =3D cpu_to_dump16(s, phnum);
> -    if (s->shdr_num) {
> -        elf_header.e_shoff =3D cpu_to_dump32(s, s->shdr_offset);
> -        elf_header.e_shentsize =3D cpu_to_dump16(s, sizeof(Elf32_Shdr));
> -        elf_header.e_shnum =3D cpu_to_dump16(s, s->shdr_num);
> +    if (dump_is_64bit(s)) {
> +        prepare_elf64_header(s, &elf64_header);
> +        header_size =3D sizeof(elf64_header);
> +        header_ptr =3D &elf64_header;
> +    } else {
> +        prepare_elf32_header(s, &elf32_header);
> +        header_size =3D sizeof(elf32_header);
> +        header_ptr =3D &elf32_header;
>      }
>
> -    ret =3D fd_write_vmcore(&elf_header, sizeof(elf_header), s);
> +    ret =3D fd_write_vmcore(header_ptr, header_size, s);
>      if (ret < 0) {
>          error_setg_errno(errp, -ret, "dump: failed to write elf header")=
;
>      }
> @@ -564,11 +574,7 @@ static void dump_begin(DumpState *s, Error **errp)
>       */
>
>      /* write elf header to vmcore */
> -    if (dump_is_64bit(s)) {
> -        write_elf64_header(s, errp);
> -    } else {
> -        write_elf32_header(s, errp);
> -    }
> +    write_elf_header(s, errp);
>      if (*errp) {
>          return;
>      }
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c7b8a705e6578200
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 11, 2022 at 4:29 PM Janos=
ch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Let&#39;s split the write from the modification of the elf header so we<br>
can consolidate the write of the data in one function.<br>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br></blockquote><div><br></d=
iv><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre=
.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0dump/dump.c | 100 ++++++++++++++++++++++++++++-----------------------=
-<br>
=C2=A01 file changed, 53 insertions(+), 47 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index d82cc46d7d..8a2a97a85e 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -131,7 +131,7 @@ static int fd_write_vmcore(const void *buf, size_t size=
, void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
-static void write_elf64_header(DumpState *s, Error **errp)<br>
+static void prepare_elf64_header(DumpState *s, Elf64_Ehdr *elf_header)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * phnum in the elf header is 16 bit, if we have more s=
egments we<br>
@@ -139,34 +139,27 @@ static void write_elf64_header(DumpState *s, Error **=
errp)<br>
=C2=A0 =C2=A0 =C2=A0 * special section.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0uint16_t phnum =3D MIN(s-&gt;phdr_num, PN_XNUM);<br>
-=C2=A0 =C2=A0 Elf64_Ehdr elf_header;<br>
-=C2=A0 =C2=A0 int ret;<br>
<br>
-=C2=A0 =C2=A0 memset(&amp;elf_header, 0, sizeof(Elf64_Ehdr));<br>
-=C2=A0 =C2=A0 memcpy(&amp;elf_header, ELFMAG, SELFMAG);<br>
-=C2=A0 =C2=A0 elf_header.e_ident[EI_CLASS] =3D ELFCLASS64;<br>
-=C2=A0 =C2=A0 elf_header.e_ident[EI_DATA] =3D s-&gt;dump_info.d_endian;<br=
>
-=C2=A0 =C2=A0 elf_header.e_ident[EI_VERSION] =3D EV_CURRENT;<br>
-=C2=A0 =C2=A0 elf_header.e_type =3D cpu_to_dump16(s, ET_CORE);<br>
-=C2=A0 =C2=A0 elf_header.e_machine =3D cpu_to_dump16(s, s-&gt;dump_info.d_=
machine);<br>
-=C2=A0 =C2=A0 elf_header.e_version =3D cpu_to_dump32(s, EV_CURRENT);<br>
-=C2=A0 =C2=A0 elf_header.e_ehsize =3D cpu_to_dump16(s, sizeof(elf_header))=
;<br>
-=C2=A0 =C2=A0 elf_header.e_phoff =3D cpu_to_dump64(s, s-&gt;phdr_offset);<=
br>
-=C2=A0 =C2=A0 elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf64_Phd=
r));<br>
-=C2=A0 =C2=A0 elf_header.e_phnum =3D cpu_to_dump16(s, phnum);<br>
+=C2=A0 =C2=A0 memset(elf_header, 0, sizeof(Elf64_Ehdr));<br>
+=C2=A0 =C2=A0 memcpy(elf_header, ELFMAG, SELFMAG);<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_ident[EI_CLASS] =3D ELFCLASS64;<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_ident[EI_DATA] =3D s-&gt;dump_info.d_endian=
;<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_ident[EI_VERSION] =3D EV_CURRENT;<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_type =3D cpu_to_dump16(s, ET_CORE);<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_machine =3D cpu_to_dump16(s, s-&gt;dump_inf=
o.d_machine);<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_version =3D cpu_to_dump32(s, EV_CURRENT);<b=
r>
+=C2=A0 =C2=A0 elf_header-&gt;e_ehsize =3D cpu_to_dump16(s, sizeof(elf_head=
er));<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_phoff =3D cpu_to_dump64(s, s-&gt;phdr_offse=
t);<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_phentsize =3D cpu_to_dump16(s, sizeof(Elf64=
_Phdr));<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_phnum =3D cpu_to_dump16(s, phnum);<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;shdr_num) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header.e_shoff =3D cpu_to_dump64(s, s-&gt;=
shdr_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header.e_shentsize =3D cpu_to_dump16(s, si=
zeof(Elf64_Shdr));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header.e_shnum =3D cpu_to_dump16(s, s-&gt;=
shdr_num);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 ret =3D fd_write_vmcore(&amp;elf_header, sizeof(elf_header),=
 s);<br>
-=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, -ret, &quot;dump: faile=
d to write elf header&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header-&gt;e_shoff =3D cpu_to_dump64(s, s-=
&gt;shdr_offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header-&gt;e_shentsize =3D cpu_to_dump16(s=
, sizeof(Elf64_Shdr));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header-&gt;e_shnum =3D cpu_to_dump16(s, s-=
&gt;shdr_num);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void write_elf32_header(DumpState *s, Error **errp)<br>
+static void prepare_elf32_header(DumpState *s, Elf32_Ehdr *elf_header)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * phnum in the elf header is 16 bit, if we have more s=
egments we<br>
@@ -174,28 +167,45 @@ static void write_elf32_header(DumpState *s, Error **=
errp)<br>
=C2=A0 =C2=A0 =C2=A0 * special section.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0uint16_t phnum =3D MIN(s-&gt;phdr_num, PN_XNUM);<br>
-=C2=A0 =C2=A0 Elf32_Ehdr elf_header;<br>
+<br>
+=C2=A0 =C2=A0 memset(elf_header, 0, sizeof(Elf32_Ehdr));<br>
+=C2=A0 =C2=A0 memcpy(elf_header, ELFMAG, SELFMAG);<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_ident[EI_CLASS] =3D ELFCLASS32;<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_ident[EI_DATA] =3D s-&gt;dump_info.d_endian=
;<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_ident[EI_VERSION] =3D EV_CURRENT;<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_type =3D cpu_to_dump16(s, ET_CORE);<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_machine =3D cpu_to_dump16(s, s-&gt;dump_inf=
o.d_machine);<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_version =3D cpu_to_dump32(s, EV_CURRENT);<b=
r>
+=C2=A0 =C2=A0 elf_header-&gt;e_ehsize =3D cpu_to_dump16(s, sizeof(elf_head=
er));<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_phoff =3D cpu_to_dump32(s, s-&gt;phdr_offse=
t);<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_phentsize =3D cpu_to_dump16(s, sizeof(Elf32=
_Phdr));<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_phnum =3D cpu_to_dump16(s, phnum);<br>
+=C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header-&gt;e_shoff =3D cpu_to_dump32(s, s-=
&gt;shdr_offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header-&gt;e_shentsize =3D cpu_to_dump16(s=
, sizeof(Elf32_Shdr));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header-&gt;e_shnum =3D cpu_to_dump16(s, s-=
&gt;shdr_num);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void write_elf_header(DumpState *s, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 Elf32_Ehdr elf32_header;<br>
+=C2=A0 =C2=A0 Elf64_Ehdr elf64_header;<br>
+=C2=A0 =C2=A0 size_t header_size;<br>
+=C2=A0 =C2=A0 void *header_ptr;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
-=C2=A0 =C2=A0 memset(&amp;elf_header, 0, sizeof(Elf32_Ehdr));<br>
-=C2=A0 =C2=A0 memcpy(&amp;elf_header, ELFMAG, SELFMAG);<br>
-=C2=A0 =C2=A0 elf_header.e_ident[EI_CLASS] =3D ELFCLASS32;<br>
-=C2=A0 =C2=A0 elf_header.e_ident[EI_DATA] =3D s-&gt;dump_info.d_endian;<br=
>
-=C2=A0 =C2=A0 elf_header.e_ident[EI_VERSION] =3D EV_CURRENT;<br>
-=C2=A0 =C2=A0 elf_header.e_type =3D cpu_to_dump16(s, ET_CORE);<br>
-=C2=A0 =C2=A0 elf_header.e_machine =3D cpu_to_dump16(s, s-&gt;dump_info.d_=
machine);<br>
-=C2=A0 =C2=A0 elf_header.e_version =3D cpu_to_dump32(s, EV_CURRENT);<br>
-=C2=A0 =C2=A0 elf_header.e_ehsize =3D cpu_to_dump16(s, sizeof(elf_header))=
;<br>
-=C2=A0 =C2=A0 elf_header.e_phoff =3D cpu_to_dump32(s, s-&gt;phdr_offset);<=
br>
-=C2=A0 =C2=A0 elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf32_Phd=
r));<br>
-=C2=A0 =C2=A0 elf_header.e_phnum =3D cpu_to_dump16(s, phnum);<br>
-=C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header.e_shoff =3D cpu_to_dump32(s, s-&gt;=
shdr_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header.e_shentsize =3D cpu_to_dump16(s, si=
zeof(Elf32_Shdr));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header.e_shnum =3D cpu_to_dump16(s, s-&gt;=
shdr_num);<br>
+=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prepare_elf64_header(s, &amp;elf64_header);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 header_size =3D sizeof(elf64_header);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 header_ptr =3D &amp;elf64_header;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prepare_elf32_header(s, &amp;elf32_header);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 header_size =3D sizeof(elf32_header);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 header_ptr =3D &amp;elf32_header;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 ret =3D fd_write_vmcore(&amp;elf_header, sizeof(elf_header),=
 s);<br>
+=C2=A0 =C2=A0 ret =3D fd_write_vmcore(header_ptr, header_size, s);<br>
=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg_errno(errp, -ret, &quot;dump: =
failed to write elf header&quot;);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -564,11 +574,7 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* write elf header to vmcore */<br>
-=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_header(s, errp);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_header(s, errp);<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 write_elf_header(s, errp);<br>
=C2=A0 =C2=A0 =C2=A0if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000c7b8a705e6578200--

