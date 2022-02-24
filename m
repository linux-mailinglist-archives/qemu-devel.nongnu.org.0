Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9B74C382F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 22:52:15 +0100 (CET)
Received: from localhost ([::1]:47602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNM21-0003Kk-Vl
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 16:52:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nNLzq-0002FQ-5J
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 16:49:58 -0500
Received: from [2a00:1450:4864:20::42f] (port=42517
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nNLzm-0003e0-HN
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 16:49:56 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d17so1653240wrc.9
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 13:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=njeMfMJfZyTJ3s1nMVeWV34BQ2Vprs/d4ZFCyjc1zcM=;
 b=LNM500VQDpMaemU2QSWUmQqZvmcx/i8PGVYZF8SJaF7b69Bb+v/uZuJyzpSGObCb1P
 dEmI5R4Ch7f9g9ZgQGfKATXwOl09sSzfgqsPSGEZIzArFs4pEw2w9R9wqkpSj/1V0WOI
 XCZCgzGwPlay+mveSRQJKGCHTfuP+AJzxjkuYPgNZ+l0A2AZo7owQTswB+szZfuZH+on
 j4oeZkmaJGZCbINtu3OEcE2ifG0Y4cqiLyt+bVpXJweBntcgXFZLpjg3o5SUGLoKmgay
 hFtmDLIPQupDqUBOfKNOzjCe5cj4YCIJt5YoC34b0K5WkVNG95SbxRqu2m1N9a/T31SX
 SD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=njeMfMJfZyTJ3s1nMVeWV34BQ2Vprs/d4ZFCyjc1zcM=;
 b=zmjEwomDgE4U77trbWS1rzCoO8fIT/gZMt6oZIqVYk/YHePHrJRmW9cYtEFcv910la
 8NTiWKPVxI5QPfbl7ysV6gUn9cJsfQjNbAWKJEnlVeU0bfhD2nst9GsCdaNfCHt2kdHo
 xhxZ03FwinET8CIsynWQdtpqu9l41s0WKAYK1Gs8ECH8UQU5BJ3mzU+eIlpjCcFWxINp
 /KTbuINnvncJ45cfxdvO2IwJBno6TKNdg570TzGoMeUnaDnuwqLpjR8p9IoNFV2YdAP0
 I3kUwJQ7TVamGqqrz/YM1BHLV2PWYaqEsXABzspj/gXtDDWFfugd7HnIb4Qvt22JXzBj
 W7zA==
X-Gm-Message-State: AOAM53129B5odna2mu6nM7h51oTyHvFjtU12QSlMCuHUuxCiPH06uxiV
 eDjk6Jt2fdUqeMQ7AU2BNGsog/OZw9J1Fg2+Zos=
X-Google-Smtp-Source: ABdhPJxBNHqfVHJMFXXRYYcJ036Pwvd3RaqUX1TGNDd2kSNtg95pND/QYPapYU+CHcTkLgAo0bVB3obE+e5sUQSahxo=
X-Received: by 2002:adf:c3cc:0:b0:1ed:b641:6ee2 with SMTP id
 d12-20020adfc3cc000000b001edb6416ee2mr3751830wrg.529.1645739371331; Thu, 24
 Feb 2022 13:49:31 -0800 (PST)
MIME-Version: 1.0
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-6-marcandre.lureau@redhat.com>
 <CAFEAcA9FDt0Y6W4zBLG3ciGe8M7TERimzD_4gX-y7pAv2G+=ag@mail.gmail.com>
 <05804c4b-690c-4fda-aaac-5a1bcb144024@weilnetz.de>
In-Reply-To: <05804c4b-690c-4fda-aaac-5a1bcb144024@weilnetz.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 25 Feb 2022 01:49:19 +0400
Message-ID: <CAJ+F1CJr+Opho0pZbXLa0i7OABSu5LieEfvo4QkQqy7xUTiDyg@mail.gmail.com>
Subject: Re: [PATCH 05/12] compiler.h: drop __printf__ macro MinGW/glib
 workaround
To: Stefan Weil <sw@weilnetz.de>
Content-Type: multipart/alternative; boundary="0000000000009f04b005d8ca8e44"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009f04b005d8ca8e44
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Feb 25, 2022 at 1:41 AM Stefan Weil <sw@weilnetz.de> wrote:

> Am 24.02.22 um 20:12 schrieb Peter Maydell:
>
> > On Thu, 24 Feb 2022 at 18:38, <marcandre.lureau@redhat.com> wrote:
> >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> This workaround was added in commit 95df51a4 ("w32: Always use standar=
d
> >> instead of native format strings"), as it claimed glib was using
> >> __printf__ attribute. This is surprising, since glib has always used
> >> G_GNUC_PRINTF which, as the name implies, uses __gnu_printf__ when
> >> possible.
> > This was not always true: before this commit from 2018
> >
> https://github.com/GNOME/glib/commit/98a0ab929d8c59ee27e5f470f11d077bb6a5=
6749
> > G_GNUC_PRINTF used always used __printf__.
> > I think that change only landed in glib 2.58, so since our current
> > minimum glib version is 2.56 we need to retain this workaround.
> >
> >> Apparently, the workaound is no longer relevant though, I don't see
> >> the warnings.
> > You're probably building with a newer glib, and possibly also
> > a newer mingw.
> >
> > I've cc'd Stefan Weil who might know whether we can drop this
> > workaround as far as the mingw part is concerned.
>
>
> My latest builds of QEMU for Windows still used glib 2.54 because that
> still is the "newest" version which is provided by Cygwin's mingw64:
>
> https://cygwin.com/cgi-bin2/package-grep.cgi?grep=3Dmingw64-.*-glib2.0
>
> So I even had to downgrade the minimum glib version.
>
> A hard requirement of a newer glib would mean that Cygwin mingw64
> packages can no longer be used for building QEMU unless someone updates
> those packages.
>

That sounds doable, I can take a look.

Why not build with msys2 though? It is quite actively maintained and most
people recommended it these days. My understanding is that msys2 is closer
to native Windows (whereas cygwin tries to bring more POSIX compatiblity:
https://www.msys2.org/wiki/How-does-MSYS2-differ-from-Cygwin/)

--=20
Marc-Andr=C3=A9 Lureau

--0000000000009f04b005d8ca8e44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 25, 2022 at 1:41 AM Ste=
fan Weil &lt;<a href=3D"mailto:sw@weilnetz.de">sw@weilnetz.de</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 24.02.22 um=
 20:12 schrieb Peter Maydell:<br>
<br>
&gt; On Thu, 24 Feb 2022 at 18:38, &lt;<a href=3D"mailto:marcandre.lureau@r=
edhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<br>
&gt;&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; This workaround was added in commit 95df51a4 (&quot;w32: Always us=
e standard<br>
&gt;&gt; instead of native format strings&quot;), as it claimed glib was us=
ing<br>
&gt;&gt; __printf__ attribute. This is surprising, since glib has always us=
ed<br>
&gt;&gt; G_GNUC_PRINTF which, as the name implies, uses __gnu_printf__ when=
<br>
&gt;&gt; possible.<br>
&gt; This was not always true: before this commit from 2018<br>
&gt; <a href=3D"https://github.com/GNOME/glib/commit/98a0ab929d8c59ee27e5f4=
70f11d077bb6a56749" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/GNOME/glib/commit/98a0ab929d8c59ee27e5f470f11d077bb6a56749</a><br>
&gt; G_GNUC_PRINTF used always used __printf__.<br>
&gt; I think that change only landed in glib 2.58, so since our current<br>
&gt; minimum glib version is 2.56 we need to retain this workaround.<br>
&gt;<br>
&gt;&gt; Apparently, the workaound is no longer relevant though, I don&#39;=
t see<br>
&gt;&gt; the warnings.<br>
&gt; You&#39;re probably building with a newer glib, and possibly also<br>
&gt; a newer mingw.<br>
&gt;<br>
&gt; I&#39;ve cc&#39;d Stefan Weil who might know whether we can drop this<=
br>
&gt; workaround as far as the mingw part is concerned.<br>
<br>
<br>
My latest builds of QEMU for Windows still used glib 2.54 because that <br>
still is the &quot;newest&quot; version which is provided by Cygwin&#39;s m=
ingw64:<br>
<br>
<a href=3D"https://cygwin.com/cgi-bin2/package-grep.cgi?grep=3Dmingw64-.*-g=
lib2.0" rel=3D"noreferrer" target=3D"_blank">https://cygwin.com/cgi-bin2/pa=
ckage-grep.cgi?grep=3Dmingw64-.*-glib2.0</a><br>
<br>
So I even had to downgrade the minimum glib version.<br>
<br>
A hard requirement of a newer glib would mean that Cygwin mingw64 <br>
packages can no longer be used for building QEMU unless someone updates <br=
>
those packages.<br>
</blockquote></div><div><br></div><div>That sounds doable, I can take a loo=
k.</div><div><br></div><div>Why not build with msys2 though? It is quite ac=
tively maintained and most people recommended it these days. My understandi=
ng is that msys2 is closer to native Windows (whereas cygwin tries to bring=
 more POSIX compatiblity: <a href=3D"https://www.msys2.org/wiki/How-does-MS=
YS2-differ-from-Cygwin/">https://www.msys2.org/wiki/How-does-MSYS2-differ-f=
rom-Cygwin/</a>)<br></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signat=
ure">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009f04b005d8ca8e44--

