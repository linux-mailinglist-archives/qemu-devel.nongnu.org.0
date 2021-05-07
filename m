Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AFA376B42
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 22:46:08 +0200 (CEST)
Received: from localhost ([::1]:49252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf7MM-0005h8-Uu
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 16:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lf7Kr-00051e-PI
 for qemu-devel@nongnu.org; Fri, 07 May 2021 16:44:33 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lf7Kq-0000ku-1R
 for qemu-devel@nongnu.org; Fri, 07 May 2021 16:44:33 -0400
Received: by mail-ej1-x631.google.com with SMTP id b25so15467301eju.5
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 13:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HVDppyBjinKNNn2sw6Qo+npX6ID6CxViBWzb+Q3N1/I=;
 b=SO17bGm0dHiQePq3nWcLxL5s20LwY+PnmzX3hDrV88EYJB5hIHOZvPLDPwtSUIiXP/
 ooPy5x/sS5ECc0ZFZCN1efjlUw/JcDNf42J1p1E81Ht3pExRDnLsBaEKAjFxT/HexvMf
 +C5Ry2DVKjAFDBUMug8nfzXk7kxQ1cUqf9R88JEWVP/k7Hfia8FgEEiwoRiAZTQi8qM1
 y45GRBtoYifWmFqyEHJZCe/O/sR4g4igWFxAHZ7reCKo+tHBefURffoUifpvPZ8X8P0s
 8cmlNl0bfzkHeSx424gkk0WPfj8yDwdd04tKowb8x/rei8IC0bpeTmPQg+CztsSm5cYN
 g/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HVDppyBjinKNNn2sw6Qo+npX6ID6CxViBWzb+Q3N1/I=;
 b=nkmwCbMTmj3N3S/vz1XJtsydRImiW8Gc5Aq4k/j/b7tKA5Mv0btwzTXXe4kceYfgHz
 +P67z0Ux3X7Yiarn7thPQ/AHXxZMIUcsEs97ZlKa/FCGo99PGJgcwIpBA+qqs1PNe6X/
 yaJYY/F7GyKHW7zVoSWju+3qPW9dnJzhtqqzcLWpNvlLvBh3p14OmzvnExDssE9d8z9S
 R+2pUrPjFb6yMVVzT5zYG9/nQUEK9Ar8ixqZQFfJbOO8SVBiQl6WGfvbQ+VnGKdIscPs
 IRqmvwH0D/2r3M58Vp97Nkx9LoPlq0H2Dyn9EYC+I6KtMIlir8MPlnADbCYqtJ9dqqtc
 ho5w==
X-Gm-Message-State: AOAM531jpWCykeKhfS2oKsaE5yKISRNXtpz7A4DHbC2Hg58FcsNGOCWy
 xVytQQ8zLTMNj/akKe9atEI8jTXs8q9wxCBIBSA=
X-Google-Smtp-Source: ABdhPJwCENz8IOoCmiA4RY71VAmqtpV1DcJtfDdt9n4dDbqlZc3LOP8DbeUvmPsIMO5OeR8RWmCYewPG871MVtj84oU=
X-Received: by 2002:a17:906:7e51:: with SMTP id
 z17mr12425320ejr.92.1620420270448; 
 Fri, 07 May 2021 13:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210507144315.1994337-1-philmd@redhat.com>
 <20210507171948.2062076-1-philmd@redhat.com>
In-Reply-To: <20210507171948.2062076-1-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sat, 8 May 2021 00:44:18 +0400
Message-ID: <CAJ+F1CJdbtJtHGAGALUROq0rwE0E9qRaeGoN10xTrffdkj2ODA@mail.gmail.com>
Subject: Re: [PATCH v3 18/17] tests/unit/test-char: Replace g_alloca() by
 buffer on the stack
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009b660a05c1c37e22"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009b660a05c1c37e22
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, May 7, 2021 at 9:22 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> The ALLOCA(3) man-page mentions its "use is discouraged".
>
> Directly reserve the CharBackend on the stack.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/unit/test-char.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tests/unit/test-char.c b/tests/unit/test-char.c
> index 5b3b48ebacd..54ce26226b3 100644
> --- a/tests/unit/test-char.c
> +++ b/tests/unit/test-char.c
> @@ -574,7 +574,7 @@ static void char_udp_test_internal(Chardev *reuse_chr=
,
> int sock)
>      struct sockaddr_in other;
>      SocketIdleData d =3D { 0, };
>      Chardev *chr;
> -    CharBackend *be;
> +    CharBackend tmpbe, *be =3D &tmpbe;
>

Why introduce tmpbe? to avoid some code churn? I would rather update the
code to use be. or &be.

     socklen_t alen =3D sizeof(other);
>      int ret;
>      char buf[10];
> @@ -590,7 +590,6 @@ static void char_udp_test_internal(Chardev *reuse_chr=
,
> int sock)
>          chr =3D qemu_chr_new("client", tmp, NULL);
>          g_assert_nonnull(chr);
>
> -        be =3D g_alloca(sizeof(CharBackend));
>          qemu_chr_fe_init(be, chr, &error_abort);
>      }
>
> --
> 2.26.3
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000009b660a05c1c37e22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 7, 2021 at 9:22 PM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">The ALLOCA(3) man-page mentions its &quot;use is discouraged&quot;.<=
br>
<br>
Directly reserve the CharBackend on the stack.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0tests/unit/test-char.c | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/tests/unit/test-char.c b/tests/unit/test-char.c<br>
index 5b3b48ebacd..54ce26226b3 100644<br>
--- a/tests/unit/test-char.c<br>
+++ b/tests/unit/test-char.c<br>
@@ -574,7 +574,7 @@ static void char_udp_test_internal(Chardev *reuse_chr, =
int sock)<br>
=C2=A0 =C2=A0 =C2=A0struct sockaddr_in other;<br>
=C2=A0 =C2=A0 =C2=A0SocketIdleData d =3D { 0, };<br>
=C2=A0 =C2=A0 =C2=A0Chardev *chr;<br>
-=C2=A0 =C2=A0 CharBackend *be;<br>
+=C2=A0 =C2=A0 CharBackend tmpbe, *be =3D &amp;tmpbe;<br></blockquote><div>=
<br></div><div>Why introduce tmpbe? to avoid some code churn? I would rathe=
r update the code to use be. or &amp;be.<br></div><div> <br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0socklen_t alen =3D sizeof(other);<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
=C2=A0 =C2=A0 =C2=A0char buf[10];<br>
@@ -590,7 +590,6 @@ static void char_udp_test_internal(Chardev *reuse_chr, =
int sock)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chr =3D qemu_chr_new(&quot;client&quot;, =
tmp, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_nonnull(chr);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 be =3D g_alloca(sizeof(CharBackend));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_fe_init(be, chr, &amp;error_abor=
t);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.26.3<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009b660a05c1c37e22--

