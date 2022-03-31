Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFD94ED68C
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:11:46 +0200 (CEST)
Received: from localhost ([::1]:49590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqqH-0008Ur-Jj
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:11:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZqbx-0002dk-3K
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:56:57 -0400
Received: from [2a00:1450:4864:20::42d] (port=36712
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZqbv-00037N-87
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:56:56 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u3so32764846wrg.3
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 01:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IRGZM++IM66IZJ3BvYwD/kQm06WvSXSeyfl+0BaWc5c=;
 b=FIYnY3Y17spvgAOUdPG6eiF0b9fSaOgcBAHMVE58PGxlJHntz8YoZ8pRCkrpUXBRaa
 DCViai9LovQ0fLOY5TKRCGtgzRqOo1IBFgJcaGGogp7wGxfH7NLhlSOwIq9kNf+fbsDC
 YMqMlZQrZESn+KH7vn49qXmSTnf8xx7riqYsabKt/RAkcOOyX95kpy6OBEqkUXIjthOo
 gqkX65BH/I0Kai/Vo/inYGK+eSXrskl4GAHvRmv3z50DlafICLK3Y/rG3FFrdsdOCnBK
 B7k70pnrgSKXeOzWPDP6MmvvEOQ3Q/QXd1WitBzSYSspw5kQhHiSYBKhENXwRX8/JsH6
 /TIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IRGZM++IM66IZJ3BvYwD/kQm06WvSXSeyfl+0BaWc5c=;
 b=u42FeZFiUfw/jDrzKA1wKKRN8DnA0P7jHL+UHmwGn+5gsPnxCfEkSzGa3NAdhLtjgP
 KrawuAWtX6KAlmc6oxwxQdbkLhBhoRE4VwpVnr7bH7DHgoLMoA9zHXHsyH6ufI5k96lU
 3xbLyjEn99mCFVlHbKsWejBX8Iuh0yLmKNLK9VSR7tZs5/6RkdXKRztfIERGndVfMSMM
 3BnRN0nAkQ898+YsneKEBc1s1ebMMyX0XHp/hHxtgBE6VbFj59Rw1t7/BgrIS2fEmvke
 atauKSEvJSQpHvCazxoTBQMIfDwQq90sWnKNE5JRWGxMFK9K1sJLLrSOsbyxbGAlY14h
 RQ7w==
X-Gm-Message-State: AOAM533mq1912PBcBwyKpESGM2G9qgmM7svRy9Y0IFGkOg92eHooLHyp
 0M7VQ1Zw+u26ZIWYGKZBh6eXALPcYUlWoRiUMNA=
X-Google-Smtp-Source: ABdhPJzwcx47a0NF4bwKUJbmBkQ42zYOGRCCWMLuLPDE6WpOmXdG0aPfx+IDRabyNF1qT41jGtbeI03bh9AeVjKcz6s=
X-Received: by 2002:a05:6000:156e:b0:203:d6e6:c475 with SMTP id
 14-20020a056000156e00b00203d6e6c475mr3331072wrz.326.1648717014089; Thu, 31
 Mar 2022 01:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220330123603.107120-1-frankja@linux.ibm.com>
 <20220330123603.107120-7-frankja@linux.ibm.com>
In-Reply-To: <20220330123603.107120-7-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 31 Mar 2022 12:56:40 +0400
Message-ID: <CAJ+F1CJyka+zYpx1bT3vhCWwTsw6cip4sFBfCMEf4pO7aiBbXQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] dump: Introduce dump_is_64bit() helper function
To: Janosch Frank <frankja@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000f5c34605db7fd7ef"
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f5c34605db7fd7ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 4:44 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> Checking d_class in dump_info leads to lengthy conditionals so let's
> shorten things a bit by introducing a helper function.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  dump/dump.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 4be4dcab24..a7cf112d8f 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -55,6 +55,11 @@ static Error *dump_migration_blocker;
>        DIV_ROUND_UP((name_size), 4) +                    \
>        DIV_ROUND_UP((desc_size), 4)) * 4)
>
> +static inline bool dump_is_64bit(DumpState *s)
> +{
> +    return s->dump_info.d_class =3D=3D ELFCLASS64;
> +}
> +
>  uint16_t cpu_to_dump16(DumpState *s, uint16_t val)
>  {
>      if (s->dump_info.d_endian =3D=3D ELFDATA2LSB) {
> @@ -479,7 +484,7 @@ static void write_elf_loads(DumpState *s, Error **err=
p)
>          get_offset_range(memory_mapping->phys_addr,
>                           memory_mapping->length,
>                           s, &offset, &filesz);
> -        if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> +        if (dump_is_64bit(s)) {
>              write_elf64_load(s, memory_mapping, phdr_index++, offset,
>                               filesz, errp);
>          } else {
> @@ -527,7 +532,7 @@ static void dump_begin(DumpState *s, Error **errp)
>       */
>
>      /* write elf header to vmcore */
> -    if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> +    if (dump_is_64bit(s)) {
>          write_elf64_header(s, errp);
>      } else {
>          write_elf32_header(s, errp);
> @@ -536,7 +541,7 @@ static void dump_begin(DumpState *s, Error **errp)
>          return;
>      }
>
> -    if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> +    if (dump_is_64bit(s)) {
>          /* write PT_NOTE to vmcore */
>          write_elf64_note(s, errp);
>          if (*errp) {
> @@ -747,7 +752,7 @@ static void get_note_sizes(DumpState *s, const void
> *note,
>      uint64_t name_sz;
>      uint64_t desc_sz;
>
> -    if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> +    if (dump_is_64bit(s)) {
>          const Elf64_Nhdr *hdr =3D note;
>          note_head_sz =3D sizeof(Elf64_Nhdr);
>          name_sz =3D tswap64(hdr->n_namesz);
> @@ -1007,10 +1012,10 @@ out:
>
>  static void write_dump_header(DumpState *s, Error **errp)
>  {
> -    if (s->dump_info.d_class =3D=3D ELFCLASS32) {
> -        create_header32(s, errp);
> -    } else {
> +    if (dump_is_64bit(s)) {
>          create_header64(s, errp);
> +    } else {
> +        create_header32(s, errp);
>      }
>  }
>
> @@ -1697,8 +1702,8 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
>          uint32_t size;
>          uint16_t format;
>
> -        note_head_size =3D s->dump_info.d_class =3D=3D ELFCLASS32 ?
> -            sizeof(Elf32_Nhdr) : sizeof(Elf64_Nhdr);
> +        note_head_size =3D dump_is_64bit(s) ?
> +            sizeof(Elf64_Nhdr) : sizeof(Elf32_Nhdr);
>
>          format =3D le16_to_cpu(vmci->vmcoreinfo.guest_format);
>          size =3D le32_to_cpu(vmci->vmcoreinfo.size);
> @@ -1801,7 +1806,7 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
>          }
>      }
>
> -    if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> +    if (dump_is_64bit(s)) {
>          s->phdr_offset =3D sizeof(Elf64_Ehdr);
>          s->shdr_offset =3D s->phdr_offset + sizeof(Elf64_Phdr) *
> s->phdr_num;
>          s->note_offset =3D s->shdr_offset + sizeof(Elf64_Shdr) *
> s->shdr_num;
> --
> 2.32.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f5c34605db7fd7ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 30, 2022 at 4:44 PM Janos=
ch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" target=3D"_blank">fra=
nkja@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Checking d_class in dump_info leads to lengthy conditiona=
ls so let&#39;s<br>
shorten things a bit by introducing a helper function.<br>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a hre=
f=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau=
@redhat.com</a>&gt;</div><div><br></div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
---<br>
=C2=A0dump/dump.c | 25 +++++++++++++++----------<br>
=C2=A01 file changed, 15 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index 4be4dcab24..a7cf112d8f 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -55,6 +55,11 @@ static Error *dump_migration_blocker;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0DIV_ROUND_UP((name_size), 4) +=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0DIV_ROUND_UP((desc_size), 4)) * 4)<br>
<br>
+static inline bool dump_is_64bit(DumpState *s)<br>
+{<br>
+=C2=A0 =C2=A0 return s-&gt;dump_info.d_class =3D=3D ELFCLASS64;<br>
+}<br>
+<br>
=C2=A0uint16_t cpu_to_dump16(DumpState *s, uint16_t val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;dump_info.d_endian =3D=3D ELFDATA2LSB) {<br>
@@ -479,7 +484,7 @@ static void write_elf_loads(DumpState *s, Error **errp)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_offset_range(memory_mapping-&gt;phys_=
addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 memory_mapping-&gt;length,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 s, &amp;offset, &amp;filesz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;dump_info.d_class =3D=3D ELFCLASS64)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf64_load(s, memory_=
mapping, phdr_index++, offset,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filesz, errp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
@@ -527,7 +532,7 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* write elf header to vmcore */<br>
-=C2=A0 =C2=A0 if (s-&gt;dump_info.d_class =3D=3D ELFCLASS64) {<br>
+=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf64_header(s, errp);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf32_header(s, errp);<br>
@@ -536,7 +541,7 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (s-&gt;dump_info.d_class =3D=3D ELFCLASS64) {<br>
+=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write PT_NOTE to vmcore */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf64_note(s, errp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*errp) {<br>
@@ -747,7 +752,7 @@ static void get_note_sizes(DumpState *s, const void *no=
te,<br>
=C2=A0 =C2=A0 =C2=A0uint64_t name_sz;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t desc_sz;<br>
<br>
-=C2=A0 =C2=A0 if (s-&gt;dump_info.d_class =3D=3D ELFCLASS64) {<br>
+=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const Elf64_Nhdr *hdr =3D note;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0note_head_sz =3D sizeof(Elf64_Nhdr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name_sz =3D tswap64(hdr-&gt;n_namesz);<br=
>
@@ -1007,10 +1012,10 @@ out:<br>
<br>
=C2=A0static void write_dump_header(DumpState *s, Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (s-&gt;dump_info.d_class =3D=3D ELFCLASS32) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_header32(s, errp);<br>
-=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_header64(s, errp);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_header32(s, errp);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
@@ -1697,8 +1702,8 @@ static void dump_init(DumpState *s, int fd, bool has_=
format,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint16_t format;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 note_head_size =3D s-&gt;dump_info.d_class =3D=
=3D ELFCLASS32 ?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(Elf32_Nhdr) : sizeof(Elf6=
4_Nhdr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 note_head_size =3D dump_is_64bit(s) ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(Elf64_Nhdr) : sizeof(Elf3=
2_Nhdr);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format =3D le16_to_cpu(vmci-&gt;vmcoreinf=
o.guest_format);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D le32_to_cpu(vmci-&gt;vmcoreinfo.=
size);<br>
@@ -1801,7 +1806,7 @@ static void dump_init(DumpState *s, int fd, bool has_=
format,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (s-&gt;dump_info.d_class =3D=3D ELFCLASS64) {<br>
+=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;phdr_offset =3D sizeof(Elf64_Ehdr);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;shdr_offset =3D s-&gt;phdr_offset +=
 sizeof(Elf64_Phdr) * s-&gt;phdr_num;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;note_offset =3D s-&gt;shdr_offset +=
 sizeof(Elf64_Shdr) * s-&gt;shdr_num;<br>
-- <br>
2.32.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000f5c34605db7fd7ef--

