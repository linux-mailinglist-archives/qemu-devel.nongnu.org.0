Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320814ED692
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:13:38 +0200 (CEST)
Received: from localhost ([::1]:53120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqs5-0002ZD-9t
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:13:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZqbm-0002d7-S3
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:56:47 -0400
Received: from [2a00:1450:4864:20::436] (port=43704
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZqbZ-00031N-DJ
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:56:36 -0400
Received: by mail-wr1-x436.google.com with SMTP id a1so32701721wrh.10
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 01:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kt/4aU0RH7DcZBe5eJFdxg5OmM26KnRTu+/kffpRfTs=;
 b=hRqRS/I1TQ4wo4D5fnXRbbri1itRmfB1M7v5rAtcMPWCJ1wdg5zUmdOVx7YbJUrhjV
 wfXs1DEo7HaCpLIHpEsEQtyJxCls5Kp10FwRuzl2Twjo9EDy1uHkrwBaWhcTDBNvCnDE
 R4Ugv2b5m+ZpGpqYMSp155ITZgA4VFeYYm8cnqeE8ZqIutgURDp+ntC0k4iPRx8F+rUT
 KnvXRBrPuivcq3o41h7XHv3EXXYRjbMM9/is/9Nfh0yYAvpKA3zdKBvdSDUO5PwOVknE
 0QJRIm9U3CoNY6cDSo66Z/6fE/7eChc8Lc3iP9aiCSG9lP5t0jzLlRTrukHjJjllxzDg
 82wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kt/4aU0RH7DcZBe5eJFdxg5OmM26KnRTu+/kffpRfTs=;
 b=UjU+AGAdybWT5L8bsrnXDx3MALzeHNjjs01Uny08lM8lSMQyzH4tOb6HKn2vcsNQwj
 87ac49WpGVBtl41x4QXOli5xKAZWPVs/9BYykZtn0WcywpRGsPcFbTZ00N/19kMSIb3l
 NYrjHKlQYbLzxpd2BbuJxYcZuanwjkWckX4te40Umq1f4IuGJMYbYkHBxse6gWuTbR46
 KPYjVgYvbFmmMTutsFAMZZBuTLtU5sHMI82vT2xmEKqzBFCYfYGT9/QMRIX1EIUxFGbs
 GvyFksL9++y8w7pWCbp+4SZrR9q57CLkqCi3ONaqkvlUITjiCxa92PNi5+76dzM2WE7j
 +jxQ==
X-Gm-Message-State: AOAM5304+zmFDTIBaZqwdAfs71yvnj82pX47t8RTMIf700+zAFm5InsL
 p7p4Sxo2BxKDwIYV2OTvCza7ZpNlDhbzKmoUnzw=
X-Google-Smtp-Source: ABdhPJzZywtDNws3dWbAQu33+LFhoJ6kXt5qQp+hsoek5JPmOjqvOXdVf90r6W5oPr4zhMHPM/zUfVwEU8E2YjyRm7s=
X-Received: by 2002:adf:a297:0:b0:203:d734:4314 with SMTP id
 s23-20020adfa297000000b00203d7344314mr3347920wra.562.1648716992054; Thu, 31
 Mar 2022 01:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220330123603.107120-1-frankja@linux.ibm.com>
 <20220330123603.107120-10-frankja@linux.ibm.com>
In-Reply-To: <20220330123603.107120-10-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 31 Mar 2022 12:56:20 +0400
Message-ID: <CAJ+F1C+aCUMZk+f_zX0TwypY9QFpWQ1z5AOBRsTbrC5Za5=Mqg@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] dump: Consolidate elf note function
To: Janosch Frank <frankja@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000a5880405db7fd67a"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x436.google.com
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

--000000000000a5880405db7fd67a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 4:37 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> Just like with the other write functions let's move the 32/64 bit elf
> handling to a function to improve readability.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  dump/dump.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 92acd9eb5c..4af71de9b1 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -510,6 +510,15 @@ static void write_elf_loads(DumpState *s, Error
> **errp)
>      }
>  }
>
> +static void write_elf_notes(DumpState *s, Error **errp)
> +{
> +    if (dump_is_64bit(s)) {
> +        write_elf64_notes(fd_write_vmcore, s, errp);
> +    } else {
> +        write_elf32_notes(fd_write_vmcore, s, errp);
> +    }
> +}
> +
>  /* write elf header, PT_NOTE and elf note to vmcore. */
>  static void dump_begin(DumpState *s, Error **errp)
>  {
> @@ -569,13 +578,8 @@ static void dump_begin(DumpState *s, Error **errp)
>          }
>      }
>
> -    if (dump_is_64bit(s)) {
> -        /* write notes to vmcore */
> -        write_elf64_notes(fd_write_vmcore, s, errp);
> -    } else {
> -        /* write notes to vmcore */
> -        write_elf32_notes(fd_write_vmcore, s, errp);
> -    }
> +    /* write notes to vmcore */
> +    write_elf_notes(s, errp);
>  }
>
>  static int get_next_block(DumpState *s, GuestPhysBlock *block)
> --
> 2.32.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000a5880405db7fd67a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 30, 2022 at 4:37 PM Janos=
ch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Just like with the other write functions let&#39;s move the 32/64 bit elf<b=
r>
handling to a function to improve readability.<br>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br></blockquote><div><br></d=
iv><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marc=
andre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0dump/dump.c | 18 +++++++++++-------<br>
=C2=A01 file changed, 11 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index 92acd9eb5c..4af71de9b1 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -510,6 +510,15 @@ static void write_elf_loads(DumpState *s, Error **errp=
)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+static void write_elf_notes(DumpState *s, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_notes(fd_write_vmcore, s, errp);<b=
r>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_notes(fd_write_vmcore, s, errp);<b=
r>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0/* write elf header, PT_NOTE and elf note to vmcore. */<br>
=C2=A0static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0{<br>
@@ -569,13 +578,8 @@ static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* write notes to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_notes(fd_write_vmcore, s, errp);<b=
r>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* write notes to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_notes(fd_write_vmcore, s, errp);<b=
r>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /* write notes to vmcore */<br>
+=C2=A0 =C2=A0 write_elf_notes(s, errp);<br>
=C2=A0}<br>
<br>
=C2=A0static int get_next_block(DumpState *s, GuestPhysBlock *block)<br>
-- <br>
2.32.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a5880405db7fd67a--

