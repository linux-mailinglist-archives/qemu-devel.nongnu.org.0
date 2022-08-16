Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846AE595582
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 10:45:02 +0200 (CEST)
Received: from localhost ([::1]:52654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNsC5-0001yL-LS
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 04:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oNsAX-00088v-QA; Tue, 16 Aug 2022 04:43:25 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:42753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oNsAS-0005yN-Tk; Tue, 16 Aug 2022 04:43:23 -0400
Received: by mail-lj1-x22e.google.com with SMTP id v10so9954282ljh.9;
 Tue, 16 Aug 2022 01:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=XcSBKB/VYbqYfxWUMTyHiHuZrfdTCAo8gK29w7P47RY=;
 b=ZOyodM38dHJxSGVQWYU8Vjv7TImIyXWgzwHlVjxj/t8kJxIKMObk8RM0AWu7hAhWYb
 owrm2K9Q3ujsoFdr9vwlWrlZXRW1TJ9C+mmHfzESZq9lm4GkCNDeJlghczcn648Lh7jp
 Aa3TtyaaYKeRmnLNffM4LMXrODS1y2XGi/F/N164zU5uB23f2alr4Z1c4GWQs8mw8FNE
 PXOyyu6jnuK+p3jRKBfgM58IZttIGfkfX1J8dyCm7oS+0oOXg5QJ/fD8Ysde2tjxSlAF
 VJIEz7cWy+uM598xDHs+D+XaX9qOtphlV/+9msKM2Mmt83/zjj/QLhu+pdU8MdjNcYBi
 MQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=XcSBKB/VYbqYfxWUMTyHiHuZrfdTCAo8gK29w7P47RY=;
 b=QQFcgMbVDdkjfCxaEoxYYkO9i2rJAvShdq8yoPxXTerU6ZeQamITdoBLt47gAxZLDV
 YwoXBN246U/A8p1oHP4Xpyto2eqIT14jaelxpUJbUkfUglJtyn3r9+2cWZFwepVDb09a
 DvPtqXjFcpFkE0h0aKiQfH0rd+S7Zr1tiVVUKn6B5ch1RwHhTIbIHifF+x4/4Dpdo796
 DaeN+sdwN2wCT4ejYKWgGu8CdfnVeMuKQIE/yeCox2oixNFkytvR7YvO6yjmqb4Bsycn
 5llgPeojafe49XWU+/WoePs0wn0TPISItYYXck1JkDdWkNm/2VeLZBLPsB2+Yvqb0tT9
 IBuA==
X-Gm-Message-State: ACgBeo06I5y30JHOMoaqDFb54R2zPsPmyOFMQa1k4IaIAW0UH4pq77SQ
 nmRYvqOmzuH+FBLRfKelBI2EnP1aNJOGHFweGRI=
X-Google-Smtp-Source: AA6agR4QkfNiNNRfvvmXixsqa/m7d1xeHvsTegXKTxtU0agSNvhwBqVKO3r6fhWLjklGu9rX1KDvTqAaduB6KRFrO08=
X-Received: by 2002:a2e:9885:0:b0:25e:5348:dd1 with SMTP id
 b5-20020a2e9885000000b0025e53480dd1mr5880383ljj.449.1660639398734; Tue, 16
 Aug 2022 01:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-10-frankja@linux.ibm.com>
In-Reply-To: <20220811121111.9878-10-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 16 Aug 2022 12:43:07 +0400
Message-ID: <CAJ+F1CJU8pHsms8-0T7us6q+sPpzrL=1SBH++EFH5tYv_fOw0Q@mail.gmail.com>
Subject: Re: [PATCH v5 09/18] dump: Use a buffer for ELF section data and
 headers
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com, 
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org, 
 seiden@linux.ibm.com, scgl@linux.ibm.com
Content-Type: multipart/alternative; boundary="00000000000076308305e657bd7d"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22e.google.com
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

--00000000000076308305e657bd7d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Aug 11, 2022 at 4:16 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> Currently we're writing the NULL section header if we overflow the
> physical header number in the ELF header. But in the future we'll add
> custom section headers AND section data.
>
> To facilitate this we need to rearange section handling a bit. As with
> the other ELF headers we split the code into a prepare and a write
> step.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>
---
>  dump/dump.c           | 83 +++++++++++++++++++++++++++++--------------
>  include/sysemu/dump.h |  2 ++
>  2 files changed, 58 insertions(+), 27 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index a905316fe5..0051c71d08 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -380,30 +380,57 @@ static void write_elf_phdr_note(DumpState *s, Error
> **errp)
>      }
>  }
>
> -static void write_elf_section(DumpState *s, int type, Error **errp)
> +static void prepare_elf_section_hdr_zero(DumpState *s)
>  {
> -    Elf32_Shdr shdr32;
> -    Elf64_Shdr shdr64;
> -    int shdr_size;
> -    void *shdr;
> +    if (dump_is_64bit(s)) {
> +        Elf64_Shdr *shdr64 =3D s->elf_section_hdrs;
> +
> +        shdr64->sh_info =3D cpu_to_dump32(s, s->phdr_num);
> +    } else {
> +        Elf32_Shdr *shdr32 =3D s->elf_section_hdrs;
> +
> +        shdr32->sh_info =3D cpu_to_dump32(s, s->phdr_num);
> +    }
> +}
> +
> +static void prepare_elf_section_hdrs(DumpState *s)
> +{
> +    size_t len, sizeof_shdr;
> +
> +    /*
> +     * Section ordering:
> +     * - HDR zero
> +     */
> +    sizeof_shdr =3D dump_is_64bit(s) ? sizeof(Elf64_Shdr) :
> sizeof(Elf32_Shdr);
> +    len =3D sizeof_shdr * s->shdr_num;
> +    s->elf_section_hdrs =3D g_malloc0(len);
> +
> +    /*
> +     * The first section header is ALWAYS a special initial section
> +     * header.
> +     *
> +     * The header should be 0 with one exception being that if
> +     * phdr_num is PN_XNUM then the sh_info field contains the real
> +     * number of segment entries.
> +     *
> +     * As we zero allocate the buffer we will only need to modify
> +     * sh_info for the PN_XNUM case.
> +     */
> +    if (s->phdr_num >=3D PN_XNUM) {
> +        prepare_elf_section_hdr_zero(s);
> +    }
> +}
> +
> +static void write_elf_section_headers(DumpState *s, Error **errp)
> +{
> +    size_t sizeof_shdr =3D dump_is_64bit(s) ? sizeof(Elf64_Shdr) :
> sizeof(Elf32_Shdr);
>      int ret;
>
> -    if (type =3D=3D 0) {
> -        shdr_size =3D sizeof(Elf32_Shdr);
> -        memset(&shdr32, 0, shdr_size);
> -        shdr32.sh_info =3D cpu_to_dump32(s, s->phdr_num);
> -        shdr =3D &shdr32;
> -    } else {
> -        shdr_size =3D sizeof(Elf64_Shdr);
> -        memset(&shdr64, 0, shdr_size);
> -        shdr64.sh_info =3D cpu_to_dump32(s, s->phdr_num);
> -        shdr =3D &shdr64;
> -    }
> +    prepare_elf_section_hdrs(s);
>
> -    ret =3D fd_write_vmcore(shdr, shdr_size, s);
> +    ret =3D fd_write_vmcore(s->elf_section_hdrs, s->shdr_num * sizeof_sh=
dr,
> s);
>      if (ret < 0) {
> -        error_setg_errno(errp, -ret,
> -                         "dump: failed to write section header table");
> +        error_setg_errno(errp, -ret, "dump: failed to write section
> headers");
>      }
>  }
>
> @@ -579,6 +606,12 @@ static void dump_begin(DumpState *s, Error **errp)
>          return;
>      }
>
> +    /* write section headers to vmcore */
> +    write_elf_section_headers(s, errp);
> +    if (*errp) {
> +        return;
> +    }
>

Can you make that move a separate commit? And please explain why this is
valid, and also update the table in the comment too.

Otherwise, changes look good to me.

+
>      /* write PT_NOTE to vmcore */
>      write_elf_phdr_note(s, errp);
>      if (*errp) {
> @@ -591,14 +624,6 @@ static void dump_begin(DumpState *s, Error **errp)
>          return;
>      }
>
> -    /* write section to vmcore */
> -    if (s->shdr_num) {
> -        write_elf_section(s, 1, errp);
> -        if (*errp) {
> -            return;
> -        }
> -    }
> -
>      /* write notes to vmcore */
>      write_elf_notes(s, errp);
>  }
> @@ -674,7 +699,11 @@ static void create_vmcore(DumpState *s, Error **errp=
)
>          return;
>      }
>
> +    /* Iterate over memory and dump it to file */
>      dump_iterate(s, errp);
> +    if (*errp) {
> +        return;
> +    }
>  }
>
>  static int write_start_flat_header(int fd)
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index b62513d87d..9995f65dc8 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -177,6 +177,8 @@ typedef struct DumpState {
>      int64_t filter_area_begin;  /* Start address of partial guest memory
> area */
>      int64_t filter_area_length; /* Length of partial guest memory area *=
/
>
> +    void *elf_section_hdrs;     /* Pointer to section header buffer */
> +
>      uint8_t *note_buf;          /* buffer for notes */
>      size_t note_buf_offset;     /* the writing place in note_buf */
>      uint32_t nr_cpus;           /* number of guest's cpu */
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000076308305e657bd7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 11, 2022 at 4:16 PM Jan=
osch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Currently we&#39;re writing the NULL section header if we overflow the<br=
>
physical header number in the ELF header. But in the future we&#39;ll add<b=
r>
custom section headers AND section data.<br>
<br>
To facilitate this we need to rearange section handling a bit. As with<br>
the other ELF headers we split the code into a prepare and a write<br>
step.<br>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt; <br></blockquote><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 83 ++++++++++++=
+++++++++++++++++--------------<br>
=C2=A0include/sysemu/dump.h |=C2=A0 2 ++<br>
=C2=A02 files changed, 58 insertions(+), 27 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index a905316fe5..0051c71d08 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -380,30 +380,57 @@ static void write_elf_phdr_note(DumpState *s, Error *=
*errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void write_elf_section(DumpState *s, int type, Error **errp)<br>
+static void prepare_elf_section_hdr_zero(DumpState *s)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 Elf32_Shdr shdr32;<br>
-=C2=A0 =C2=A0 Elf64_Shdr shdr64;<br>
-=C2=A0 =C2=A0 int shdr_size;<br>
-=C2=A0 =C2=A0 void *shdr;<br>
+=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Elf64_Shdr *shdr64 =3D s-&gt;elf_section_hdrs;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64-&gt;sh_info =3D cpu_to_dump32(s, s-&gt;=
phdr_num);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Elf32_Shdr *shdr32 =3D s-&gt;elf_section_hdrs;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr32-&gt;sh_info =3D cpu_to_dump32(s, s-&gt;=
phdr_num);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void prepare_elf_section_hdrs(DumpState *s)<br>
+{<br>
+=C2=A0 =C2=A0 size_t len, sizeof_shdr;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Section ordering:<br>
+=C2=A0 =C2=A0 =C2=A0* - HDR zero<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 sizeof_shdr =3D dump_is_64bit(s) ? sizeof(Elf64_Shdr) : size=
of(Elf32_Shdr);<br>
+=C2=A0 =C2=A0 len =3D sizeof_shdr * s-&gt;shdr_num;<br>
+=C2=A0 =C2=A0 s-&gt;elf_section_hdrs =3D g_malloc0(len);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* The first section header is ALWAYS a special initial=
 section<br>
+=C2=A0 =C2=A0 =C2=A0* header.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* The header should be 0 with one exception being that=
 if<br>
+=C2=A0 =C2=A0 =C2=A0* phdr_num is PN_XNUM then the sh_info field contains =
the real<br>
+=C2=A0 =C2=A0 =C2=A0* number of segment entries.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* As we zero allocate the buffer we will only need to =
modify<br>
+=C2=A0 =C2=A0 =C2=A0* sh_info for the PN_XNUM case.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (s-&gt;phdr_num &gt;=3D PN_XNUM) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prepare_elf_section_hdr_zero(s);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void write_elf_section_headers(DumpState *s, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 size_t sizeof_shdr =3D dump_is_64bit(s) ? sizeof(Elf64_Shdr)=
 : sizeof(Elf32_Shdr);<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
-=C2=A0 =C2=A0 if (type =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr_size =3D sizeof(Elf32_Shdr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&amp;shdr32, 0, shdr_size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr32.sh_info =3D cpu_to_dump32(s, s-&gt;phdr=
_num);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr =3D &amp;shdr32;<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr_size =3D sizeof(Elf64_Shdr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&amp;shdr64, 0, shdr_size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64.sh_info =3D cpu_to_dump32(s, s-&gt;phdr=
_num);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr =3D &amp;shdr64;<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 prepare_elf_section_hdrs(s);<br>
<br>
-=C2=A0 =C2=A0 ret =3D fd_write_vmcore(shdr, shdr_size, s);<br>
+=C2=A0 =C2=A0 ret =3D fd_write_vmcore(s-&gt;elf_section_hdrs, s-&gt;shdr_n=
um * sizeof_shdr, s);<br>
=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, -ret,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;dump: failed to write section header table&quot;);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, -ret, &quot;dump: faile=
d to write section headers&quot;);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
@@ -579,6 +606,12 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 /* write section headers to vmcore */<br>
+=C2=A0 =C2=A0 write_elf_section_headers(s, errp);<br>
+=C2=A0 =C2=A0 if (*errp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Can you make that move=
 a separate commit? And please explain why this is valid, and also update t=
he table in the comment too.</div><div><br></div><div>Otherwise, changes lo=
ok good to me.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0/* write PT_NOTE to vmcore */<br>
=C2=A0 =C2=A0 =C2=A0write_elf_phdr_note(s, errp);<br>
=C2=A0 =C2=A0 =C2=A0if (*errp) {<br>
@@ -591,14 +624,6 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 /* write section to vmcore */<br>
-=C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_section(s, 1, errp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0/* write notes to vmcore */<br>
=C2=A0 =C2=A0 =C2=A0write_elf_notes(s, errp);<br>
=C2=A0}<br>
@@ -674,7 +699,11 @@ static void create_vmcore(DumpState *s, Error **errp)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 /* Iterate over memory and dump it to file */<br>
=C2=A0 =C2=A0 =C2=A0dump_iterate(s, errp);<br>
+=C2=A0 =C2=A0 if (*errp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
=C2=A0static int write_start_flat_header(int fd)<br>
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h<br>
index b62513d87d..9995f65dc8 100644<br>
--- a/include/sysemu/dump.h<br>
+++ b/include/sysemu/dump.h<br>
@@ -177,6 +177,8 @@ typedef struct DumpState {<br>
=C2=A0 =C2=A0 =C2=A0int64_t filter_area_begin;=C2=A0 /* Start address of pa=
rtial guest memory area */<br>
=C2=A0 =C2=A0 =C2=A0int64_t filter_area_length; /* Length of partial guest =
memory area */<br>
<br>
+=C2=A0 =C2=A0 void *elf_section_hdrs;=C2=A0 =C2=A0 =C2=A0/* Pointer to sec=
tion header buffer */<br>
+<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *note_buf;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=
 buffer for notes */<br>
=C2=A0 =C2=A0 =C2=A0size_t note_buf_offset;=C2=A0 =C2=A0 =C2=A0/* the writi=
ng place in note_buf */<br>
=C2=A0 =C2=A0 =C2=A0uint32_t nr_cpus;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* number of guest&#39;s cpu */<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000076308305e657bd7d--

