Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EB74C8E00
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:39:37 +0100 (CET)
Received: from localhost ([::1]:57930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3f6-0004o7-WF
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:39:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nP3Zi-00051g-Es
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:34:02 -0500
Received: from [2a00:1450:4864:20::32e] (port=46908
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nP3Zg-0002MM-Ge
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:34:01 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so1514777wmp.5
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 06:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UxqlU2xBkMW9gTsfya+zq1mPE+z1NeCSHwHe9kJmkus=;
 b=QIvQh6NOfi3yPucfdcsVMrMc5MywmGIaXo8N8VsuX2MJ5tkP26NNoMyJY4KnU7Abh5
 9DJ6ufaaUxBgt45M0TYZwrXFHuB9Vv9w5Gk2mBTh+Z70AYdRc2EyKj2z6o6JK4a7+vwA
 JqcGc3FRSsKF5dhpRubv962mMlaq5jHYHZ7aKP1+t/uuxrAVYUaPW+jViBDacQCRY+ax
 N5P/besftGuxvJdWGRDjUJkLIa6U+AuL1ss03Wf+j8CinTDVWsasKlyRZ+0w/7hjC48Y
 LzFlA7U6HgWkjALJf3hr4Op4qzb4TgT9pZpl7qVbMQHfsH4/1+tZJ9V9wG/KlOJiqfpA
 co/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UxqlU2xBkMW9gTsfya+zq1mPE+z1NeCSHwHe9kJmkus=;
 b=icOzqdks6gcL4NbdEzphDBNasA4UbIKu9SFl+RlIqV4jwWH9sfGqWNuQ3yvMJNJ6WL
 /mK+PCx5dBtSf2tbTvVTqhz3Z7qkfYUU72hszhnPyjS4pgEi2mjR6xJFAKr0nUjGdCfN
 UT7fNOTRJx/uNBjPjeVZ3Hb7h8tCoz+o9DyUcNVRl1+mRC1ix3xI/hhWeFaSgxd9xeyv
 ZbPWFXmskmc0Xa4PxnFkg8YE+XqDF64JBnSJ8Dm/PrvDYmnQocsaW1qMUWceM2JMSNmY
 ksTAuvHeGhoe2E5QaJhrFliOE7ude+v0rhz8dNXJT2FfvwBpv+BvUm2GiHl9VHEi3kbp
 YbwA==
X-Gm-Message-State: AOAM532zsRGyzbFdVFm9p/pisr5KkUbD+seF8hiVHqO08ha0hVaLfP1+
 N+ITECju+U+dJ/wZku6D9mygYHeXjaGAG5gx8sk=
X-Google-Smtp-Source: ABdhPJzn1JR7L9J77JS3qGW06qNeVqOCZlZfrSt9avsVGuOZdvpJKdScvkIi67rZg91F0CN89V4NeYuIo5tdYcJodHg=
X-Received: by 2002:a05:600c:230a:b0:381:67e7:e207 with SMTP id
 10-20020a05600c230a00b0038167e7e207mr7807518wmo.36.1646145239037; Tue, 01 Mar
 2022 06:33:59 -0800 (PST)
MIME-Version: 1.0
References: <20220301142213.28568-1-frankja@linux.ibm.com>
 <20220301142213.28568-5-frankja@linux.ibm.com>
In-Reply-To: <20220301142213.28568-5-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 1 Mar 2022 18:33:46 +0400
Message-ID: <CAJ+F1CL3MMRKHTyLTHS+6X-2UoYAxddAx17ZR=Zm1gDufu4Vfg@mail.gmail.com>
Subject: Re: [PATCH 4/7] dump: Introduce dump_is_64bit() helper function
To: Janosch Frank <frankja@linux.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000038ba8305d9290e06"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x32e.google.com
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

--00000000000038ba8305d9290e06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Mar 1, 2022 at 6:30 PM Janosch Frank <frankja@linux.ibm.com> wrote:

> Checking d_class in dump_info leads to lengthy conditionals so let's
> shorten things a bit by introducing a helper function.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c           | 14 +++++++-------
>  include/sysemu/dump.h |  6 ++++++
>  2 files changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 242f83db95..bb152bddff 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -481,7 +481,7 @@ static void write_elf_loads(DumpState *s, Error **err=
p)
>          get_offset_range(memory_mapping->phys_addr,
>                           memory_mapping->length,
>                           s, &offset, &filesz);
> -        if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> +        if (dump_is_64bit(s)) {
>              write_elf64_load(s, memory_mapping, phdr_index++, offset,
>                               filesz, &local_err);
>          } else {
> @@ -530,7 +530,7 @@ static void dump_begin(DumpState *s, Error **errp)
>       */
>
>      /* write elf header to vmcore */
> -    if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> +    if (dump_is_64bit(s)) {
>          write_elf64_header(s, &local_err);
>      } else {
>          write_elf32_header(s, &local_err);
> @@ -540,7 +540,7 @@ static void dump_begin(DumpState *s, Error **errp)
>          return;
>      }
>
> -    if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> +    if (dump_is_64bit(s)) {
>          /* write PT_NOTE to vmcore */
>          write_elf64_note(s, &local_err);
>          if (local_err) {
> @@ -761,7 +761,7 @@ static void get_note_sizes(DumpState *s, const void
> *note,
>      uint64_t name_sz;
>      uint64_t desc_sz;
>
> -    if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> +    if (dump_is_64bit(s)) {
>          const Elf64_Nhdr *hdr =3D note;
>          note_head_sz =3D sizeof(Elf64_Nhdr);
>          name_sz =3D tswap64(hdr->n_namesz);
> @@ -1023,7 +1023,7 @@ out:
>
>  static void write_dump_header(DumpState *s, Error **errp)
>  {
> -    if (s->dump_info.d_class =3D=3D ELFCLASS32) {
> +    if (!dump_is_64bit(s)) {
>          create_header32(s, errp);
>      } else {
>          create_header64(s, errp);
> @@ -1716,7 +1716,7 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
>          uint32_t size;
>          uint16_t format;
>
> -        note_head_size =3D s->dump_info.d_class =3D=3D ELFCLASS32 ?
> +        note_head_size =3D !dump_is_64bit(s) ?
>              sizeof(Elf32_Nhdr) : sizeof(Elf64_Nhdr);
>
>          format =3D le16_to_cpu(vmci->vmcoreinfo.guest_format);
> @@ -1821,7 +1821,7 @@ static void dump_init(DumpState *s, int fd, bool
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
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index ffc2ea1072..078b3d57a1 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -203,4 +203,10 @@ typedef struct DumpState {
>  uint16_t cpu_to_dump16(DumpState *s, uint16_t val);
>  uint32_t cpu_to_dump32(DumpState *s, uint32_t val);
>  uint64_t cpu_to_dump64(DumpState *s, uint64_t val);
> +
> +static inline bool dump_is_64bit(DumpState *s)
> +{
> +    return s->dump_info.d_class =3D=3D ELFCLASS64;
> +}
>

Since it's not used outside of dump.c (so far), I'd keep this as a regular
static function there. Otherwise, lgtm.


--=20
Marc-Andr=C3=A9 Lureau

--00000000000038ba8305d9290e06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 1, 2022 at 6:30 PM Jano=
sch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Checking d_class in dump_info leads to lengthy conditionals so let&#39;s<b=
r>
shorten things a bit by introducing a helper function.<br>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
---<br>
=C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 +++++++-----=
--<br>
=C2=A0include/sysemu/dump.h |=C2=A0 6 ++++++<br>
=C2=A02 files changed, 13 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index 242f83db95..bb152bddff 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -481,7 +481,7 @@ static void write_elf_loads(DumpState *s, Error **errp)=
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
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filesz, &amp;local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
@@ -530,7 +530,7 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* write elf header to vmcore */<br>
-=C2=A0 =C2=A0 if (s-&gt;dump_info.d_class =3D=3D ELFCLASS64) {<br>
+=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf64_header(s, &amp;local_err);<br=
>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf32_header(s, &amp;local_err);<br=
>
@@ -540,7 +540,7 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (s-&gt;dump_info.d_class =3D=3D ELFCLASS64) {<br>
+=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write PT_NOTE to vmcore */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf64_note(s, &amp;local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
@@ -761,7 +761,7 @@ static void get_note_sizes(DumpState *s, const void *no=
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
@@ -1023,7 +1023,7 @@ out:<br>
<br>
=C2=A0static void write_dump_header(DumpState *s, Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (s-&gt;dump_info.d_class =3D=3D ELFCLASS32) {<br>
+=C2=A0 =C2=A0 if (!dump_is_64bit(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_header32(s, errp);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_header64(s, errp);<br>
@@ -1716,7 +1716,7 @@ static void dump_init(DumpState *s, int fd, bool has_=
format,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint16_t format;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 note_head_size =3D s-&gt;dump_info.d_class =3D=
=3D ELFCLASS32 ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 note_head_size =3D !dump_is_64bit(s) ?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf32_Nhdr) : sizeof=
(Elf64_Nhdr);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format =3D le16_to_cpu(vmci-&gt;vmcoreinf=
o.guest_format);<br>
@@ -1821,7 +1821,7 @@ static void dump_init(DumpState *s, int fd, bool has_=
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
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h<br>
index ffc2ea1072..078b3d57a1 100644<br>
--- a/include/sysemu/dump.h<br>
+++ b/include/sysemu/dump.h<br>
@@ -203,4 +203,10 @@ typedef struct DumpState {<br>
=C2=A0uint16_t cpu_to_dump16(DumpState *s, uint16_t val);<br>
=C2=A0uint32_t cpu_to_dump32(DumpState *s, uint32_t val);<br>
=C2=A0uint64_t cpu_to_dump64(DumpState *s, uint64_t val);<br>
+<br>
+static inline bool dump_is_64bit(DumpState *s)<br>
+{<br>
+=C2=A0 =C2=A0 return s-&gt;dump_info.d_class =3D=3D ELFCLASS64;<br>
+}<br></blockquote><div><br></div><div>Since it&#39;s not used outside of d=
ump.c (so far), I&#39;d keep this as a regular static function there. Other=
wise, lgtm.</div><br clear=3D"all"></div><br>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000038ba8305d9290e06--

