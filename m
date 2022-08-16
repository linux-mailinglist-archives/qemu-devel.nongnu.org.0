Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9394D595542
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 10:30:53 +0200 (CEST)
Received: from localhost ([::1]:57598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNryO-0000h5-LH
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 04:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oNrvy-0006pN-94; Tue, 16 Aug 2022 04:28:22 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:39647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oNrvw-000409-Iv; Tue, 16 Aug 2022 04:28:21 -0400
Received: by mail-lj1-x233.google.com with SMTP id s9so9929949ljs.6;
 Tue, 16 Aug 2022 01:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=5mHNuUSmLBgXhThitUTAt7CxamqRVzMR10jbsWQi4U4=;
 b=EXHmoEcQDjNDc1oJPjufboyN8v6hOrz8Vmt7JqFdhTbJYSJObdTBqGKCl8uDzl769j
 dYiqdQzq+hGxmIfsOYzRNdyM/vvigheee0vMAoFiQ/sGRZkB+l0kXlvgtFGCtMBDFY/b
 ZHXnpjTCU6iMVoEZt36lHSa18ah+zhNcWOGtxstCs/0q/uluZkZOT+QIlvXYRaxV415G
 6DJxWXTIX0n6tMSZ4fr6Ax9lbhKCGl1uxNd4QQILBLNKP2qXDfX5T+S6ZODBgt2H1dBS
 HPOn4gixuScxSKdpyGyTcqUwIkLVvtGcUvfRPr0TgqjOBa6OpmPqu7pABlO46Pe8jUio
 7XVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=5mHNuUSmLBgXhThitUTAt7CxamqRVzMR10jbsWQi4U4=;
 b=3I0Me+EM9ghizJXZb53XNEOaHChUUbwKHJEdJG6/su5xTPHEAFmZTgeckqYPeonl/U
 P3OTz7K3ad83u2O8cRqw69xtX+CQet88MiQlSFBHJlMssuUnwTUIg4bvgXOBq1Fju3Kf
 1RYlpQVdjTRSiOyRMwB1uwZJeQCSzBBP3eE4KczURhDAorx88jOlaDyGPCFAkX6+1Ydi
 7MXMKQNOcYs3ZYtGP1Dls3+f5Rg0wmtAOznYF2oYbJMz4/xpV8OsxJftLJR6L3nglo2O
 XmIT8dCOodUZXe0CJclSrzwnXsoVJ97nn8CJ0B7npQ6exedoXDmKCciCIHhjM2x1ddDy
 fTYw==
X-Gm-Message-State: ACgBeo3zFfTDPwStJWGLJ9dfAReGDDKJc8NLlfjkCdKa8wkRjS+ncNxb
 /Io4xn3Q6oN74a3s/ypnI+KSJmmGBlq6sQtNdN/WOzPlJrQ=
X-Google-Smtp-Source: AA6agR4qS3Act/rhjx3426//Gzlz18hq17JT2oKZXuiBAOLq0pagiISRWakW6DuKynjMb3fOng0DAhlJVJdgf4nwT7U=
X-Received: by 2002:a2e:9346:0:b0:261:8a31:b40c with SMTP id
 m6-20020a2e9346000000b002618a31b40cmr2577526ljh.267.1660638498622; Tue, 16
 Aug 2022 01:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-9-frankja@linux.ibm.com>
In-Reply-To: <20220811121111.9878-9-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 16 Aug 2022 12:28:07 +0400
Message-ID: <CAJ+F1CJY09Cgco_05dUdGo00nqv=Wpi7HF0TS9Oq_PApRUOfMg@mail.gmail.com>
Subject: Re: [PATCH v5 08/18] dump: Rename write_elf*_phdr_note to
 prepare_elf*_phdr_note
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com, 
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org, 
 seiden@linux.ibm.com, scgl@linux.ibm.com
Content-Type: multipart/alternative; boundary="000000000000cf943305e6578767"
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x233.google.com
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

--000000000000cf943305e6578767
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2022 at 4:43 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> The functions in question do not actually write to the file descriptor
> they set up a buffer which is later written to the fd.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  dump/dump.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 8a2a97a85e..a905316fe5 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -260,7 +260,7 @@ static void write_elf32_load(DumpState *s,
> MemoryMapping *memory_mapping,
>      }
>  }
>
> -static void write_elf64_phdr_note(DumpState *s, Elf64_Phdr *phdr)
> +static void prepare_elf64_phdr_note(DumpState *s, Elf64_Phdr *phdr)
>  {
>      memset(phdr, 0, sizeof(*phdr));
>      phdr->p_type =3D cpu_to_dump32(s, PT_NOTE);
> @@ -316,7 +316,7 @@ static void write_elf64_notes(WriteCoreDumpFunction f=
,
> DumpState *s,
>      write_guest_note(f, s, errp);
>  }
>
> -static void write_elf32_phdr_note(DumpState *s, Elf32_Phdr *phdr)
> +static void prepare_elf32_phdr_note(DumpState *s, Elf32_Phdr *phdr)
>  {
>      memset(phdr, 0, sizeof(*phdr));
>      phdr->p_type =3D cpu_to_dump32(s, PT_NOTE);
> @@ -364,11 +364,11 @@ static void write_elf_phdr_note(DumpState *s, Error
> **errp)
>      int ret;
>
>      if (dump_is_64bit(s)) {
> -        write_elf64_phdr_note(s, &phdr64);
> +        prepare_elf64_phdr_note(s, &phdr64);
>          size =3D sizeof(phdr64);
>          phdr =3D &phdr64;
>      } else {
> -        write_elf32_phdr_note(s, &phdr32);
> +        prepare_elf32_phdr_note(s, &phdr32);
>          size =3D sizeof(phdr32);
>          phdr =3D &phdr32;
>      }
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000cf943305e6578767
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 11, 2022 at 4:43 PM Janos=
ch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
The functions in question do not actually write to the file descriptor<br>
they set up a buffer which is later written to the fd.<br>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br></blockquote><div><br></d=
iv><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre=
.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0dump/dump.c | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index 8a2a97a85e..a905316fe5 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -260,7 +260,7 @@ static void write_elf32_load(DumpState *s, MemoryMappin=
g *memory_mapping,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void write_elf64_phdr_note(DumpState *s, Elf64_Phdr *phdr)<br>
+static void prepare_elf64_phdr_note(DumpState *s, Elf64_Phdr *phdr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0memset(phdr, 0, sizeof(*phdr));<br>
=C2=A0 =C2=A0 =C2=A0phdr-&gt;p_type =3D cpu_to_dump32(s, PT_NOTE);<br>
@@ -316,7 +316,7 @@ static void write_elf64_notes(WriteCoreDumpFunction f, =
DumpState *s,<br>
=C2=A0 =C2=A0 =C2=A0write_guest_note(f, s, errp);<br>
=C2=A0}<br>
<br>
-static void write_elf32_phdr_note(DumpState *s, Elf32_Phdr *phdr)<br>
+static void prepare_elf32_phdr_note(DumpState *s, Elf32_Phdr *phdr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0memset(phdr, 0, sizeof(*phdr));<br>
=C2=A0 =C2=A0 =C2=A0phdr-&gt;p_type =3D cpu_to_dump32(s, PT_NOTE);<br>
@@ -364,11 +364,11 @@ static void write_elf_phdr_note(DumpState *s, Error *=
*errp)<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (dump_is_64bit(s)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_phdr_note(s, &amp;phdr64);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prepare_elf64_phdr_note(s, &amp;phdr64);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D sizeof(phdr64);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phdr =3D &amp;phdr64;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_phdr_note(s, &amp;phdr32);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prepare_elf32_phdr_note(s, &amp;phdr32);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D sizeof(phdr32);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phdr =3D &amp;phdr32;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000cf943305e6578767--

