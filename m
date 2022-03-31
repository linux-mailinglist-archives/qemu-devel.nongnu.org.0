Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED0A4ED6C2
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:26:07 +0200 (CEST)
Received: from localhost ([::1]:36948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZr4B-0002jR-08
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:26:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZqc5-0002sk-Mz
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:57:05 -0400
Received: from [2a00:1450:4864:20::432] (port=43707
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZqc4-00039N-2m
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:57:05 -0400
Received: by mail-wr1-x432.google.com with SMTP id a1so32703773wrh.10
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 01:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RSgiB22P39n/YMYTZZaZ7xcftMrG5de0CxpakMfpOrs=;
 b=ZHBg5P52fbTOomWDkbuaBlC3+RYg3zkVU5iWnPQeqNyTKEZCYcmCljujmDoB3rkFPg
 CkKj7vBHxHqiWvhCUDE+oI2e849H3XX0zKf9JYNdpKhf1AGAdOzECYm8hosRnmsqRVEf
 fGOIBNZUMe8AGv43zvUggylVBTqEsZnAE6cD5vcMzN3KvacmtuubwwF1g45vpVwVDmTO
 2WO+CagC8RsuwsLmqsYh6vP0lgJKzLltT4Ia5kzEk0dt8M2JqlnG9HsTy96awNs8LHXr
 jQwDOVzXlB7ySI3jr/p0Bhz+HVatm7LsetBuMbdPJMIfd5kHr74wHXap9z5xcI0gdC+I
 SNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RSgiB22P39n/YMYTZZaZ7xcftMrG5de0CxpakMfpOrs=;
 b=iaJB3Wdzs0xYP+w3UFEw1XNfGK5azCWKGS+FftfC5kAR/CUBFe1EsmMY/NjJCQ2vRG
 LrXscHnzr4Si34wqM79jr7kpNsY9vyjZqnj23kh1Zm4Hx4mT0IgrvFvT6M98YQOKnuua
 K4CShV4y0mSDUohP6Shi+rxIq2+PLLooMUWdIRn+3YClT0zo8QuU0+Fc5QN68k3Yezjd
 euqdgyBDGiqq614cpXGxvYxD87tr0UE6OOgbxYLaFMzWWHlYd8dEE/mqtu41gI6cqiPi
 1+JQlYnYZproYQ07hghyYaIZmnMnuVfaHAAiyPqJ+y/Jc4f5uy64Nd9M7KXKS83vzcla
 7FbQ==
X-Gm-Message-State: AOAM530426kEstlAn0WqWGJRUeECrirp5xiSF/t5uc61FbIOmamU47/X
 iOX1hz3MFI/m8M5xbgBCdgPK9bIcSbnKgOhBwOs=
X-Google-Smtp-Source: ABdhPJz8yUmoQ2kia2fV+lzZL81Mz+maqSjtqgjeWRgF0TQ9CEZCqov19gqBU3KxeKwpDtD27hPmAOrs1H8HEBx6Pgg=
X-Received: by 2002:adf:a297:0:b0:203:d734:4314 with SMTP id
 s23-20020adfa297000000b00203d7344314mr3349439wra.562.1648717022458; Thu, 31
 Mar 2022 01:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220330123603.107120-1-frankja@linux.ibm.com>
 <20220330123603.107120-5-frankja@linux.ibm.com>
In-Reply-To: <20220330123603.107120-5-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 31 Mar 2022 12:56:47 +0400
Message-ID: <CAJ+F1C+xciStjs0EZ6dcvgZMwb+UAuvoUbBWL1ivXUSL1R=YjA@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] dump: Remove the section if when calculating the
 memory offset
To: Janosch Frank <frankja@linux.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000075791605db7fd850"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x432.google.com
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

--00000000000075791605db7fd850
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 4:48 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> When s->shdr_num is 0 we'll add 0 bytes of section headers which is
> equivalent to not adding section headers but with the multiplication
> we can remove a if/else.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  dump/dump.c | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index cd11dec0f4..bdff651da4 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1808,23 +1808,15 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
>      }
>
>      if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> -        if (s->shdr_num) {
> -            s->memory_offset =3D sizeof(Elf64_Ehdr) +
> -                               sizeof(Elf64_Phdr) * s->phdr_num +
> -                               sizeof(Elf64_Shdr) * s->shdr_num +
> s->note_size;
> -        } else {
> -            s->memory_offset =3D sizeof(Elf64_Ehdr) +
> -                               sizeof(Elf64_Phdr) * s->phdr_num +
> s->note_size;
> -        }
> +        s->memory_offset =3D sizeof(Elf64_Ehdr) +
> +                           sizeof(Elf64_Phdr) * s->phdr_num +
> +                           sizeof(Elf64_Shdr) * s->shdr_num +
> +                           s->note_size;
>      } else {
> -        if (s->shdr_num) {
> -            s->memory_offset =3D sizeof(Elf32_Ehdr) +
> -                               sizeof(Elf32_Phdr) * s->phdr_num +
> -                               sizeof(Elf32_Shdr) * s->shdr_num +
> s->note_size;
> -        } else {
> -            s->memory_offset =3D sizeof(Elf32_Ehdr) +
> -                               sizeof(Elf32_Phdr) * s->phdr_num +
> s->note_size;
> -        }
> +        s->memory_offset =3D sizeof(Elf32_Ehdr) +
> +                           sizeof(Elf32_Phdr) * s->phdr_num +
> +                           sizeof(Elf32_Shdr) * s->shdr_num +
> +                           s->note_size;
>      }
>
>      return;
> --
> 2.32.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000075791605db7fd850
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 30, 2022 at 4:48 PM Janos=
ch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" target=3D"_blank">fra=
nkja@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">When s-&gt;shdr_num is 0 we&#39;ll add 0 bytes of section=
 headers which is<br>
equivalent to not adding section headers but with the multiplication<br>
we can remove a if/else.<br>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a hre=
f=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau=
@redhat.com</a>&gt;</div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
---<br>
=C2=A0dump/dump.c | 24 ++++++++----------------<br>
=C2=A01 file changed, 8 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index cd11dec0f4..bdff651da4 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -1808,23 +1808,15 @@ static void dump_init(DumpState *s, int fd, bool ha=
s_format,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;dump_info.d_class =3D=3D ELFCLASS64) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;memory_offset =3D sizeof(E=
lf64_Ehdr) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf64_Phdr) * s-&gt;phdr_num +=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf64_Shdr) * s-&gt;shdr_num +=
 s-&gt;note_size;<br>
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
=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf64_Phdr) * s-&gt;phdr_num +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf64_Shdr) * s-&gt;shdr_num +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;note_size;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;memory_offset =3D sizeof(E=
lf32_Ehdr) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf32_Phdr) * s-&gt;phdr_num +=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf32_Shdr) * s-&gt;shdr_num +=
 s-&gt;note_size;<br>
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
=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf32_Phdr) * s-&gt;phdr_num +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0sizeof(Elf32_Shdr) * s-&gt;shdr_num +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;note_size;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0return;<br>
-- <br>
2.32.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--00000000000075791605db7fd850--

