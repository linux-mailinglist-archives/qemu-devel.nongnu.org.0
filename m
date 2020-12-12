Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008EE2D8999
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 20:13:31 +0100 (CET)
Received: from localhost ([::1]:40762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koAKf-0002hM-2B
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 14:13:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ko9zg-0005t7-TJ
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:51:50 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:38765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ko9zX-0005zo-3M
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:51:47 -0500
Received: by mail-lf1-x143.google.com with SMTP id w13so19943717lfd.5
 for <qemu-devel@nongnu.org>; Sat, 12 Dec 2020 10:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QyqyyItwuoGulxpcnRRggwj6hwYpsDqivibechKudEA=;
 b=NY2jCtCPBqW61qJmTeDozGQMkiOEfS1InkXcWPA7UupHsKywPP95fG2VLVxfRns3fH
 oJ2529UDKMPx9jx4MMAOzxQI/NIiFGJunjCLn5UvvwdM5N2ZXrZ5a9nEnUvVZBbYsHVA
 Tnav6GClZybj13HsCgVFHfsLlwdJWNg2zbeVTKFCZlw8BW5C4zNEdyvJtiHmSPTWJhcO
 idMvs1NRqGCXGiFitKNhMFb9rnVxnr2KBeCd45Gx/i4h/zz/zDlswJI07fK61NTQ5648
 smI1q/IB0yDlOvxtkOk5RZbnnOLj1I8Sk6xiuH0zv8WjDP2DPvcE+VxShAtq6BmXUyPS
 t+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QyqyyItwuoGulxpcnRRggwj6hwYpsDqivibechKudEA=;
 b=hw3mn/2rN3ZV3fzx64oT6dGJA6QxkpZn5VzyKl9YfIOqumnA+ipx9ZK84oBIJH/F5m
 7uYslbEXcJ/vUo5xAI8FI2raJKdkgRh1lWxsztQltmo9ITN51luh4qJnRj5E36Jpmg2z
 wfsLzTqVVDzG/LGgC0TVWybzbto/OBWdfPgAzeFAHEaS/CzX7ImU/SB9TzuPbvm3/gKz
 A7dAW8fouvn0s5vwui7TGUAXy610k6VBLpk8pqb5XU7UsSJaqsPBFZhk0iu4uVMjKgk+
 aE048XZ6ekkURBHDUMmmOvOAq5xyEenfnJGt1ut3OgqT/KEXHuGCF+jBjCi15UkE2MK+
 bZRA==
X-Gm-Message-State: AOAM531OEYN58ardgYAIVlZia6Bb5Z9oGnxs1uZZ8qj40IiH/vL9Lho6
 aRXO85QF7E7DuuaaJ3gOd7AjPw2nnknoqahQBCCPvhUaook=
X-Google-Smtp-Source: ABdhPJyVbZ0AZjx6E7Uw+WQ9G9CbHlJjUaXSjslMCZhXwVcREkjp1D4bMYXW96YCw1p0amnjT1LFcy1UtIUsbpLIRYc=
X-Received: by 2002:a50:a6de:: with SMTP id f30mr17051378edc.30.1607781100511; 
 Sat, 12 Dec 2020 05:51:40 -0800 (PST)
MIME-Version: 1.0
References: <20201211131346.473882-1-philmd@redhat.com>
 <CAFEAcA-xn2QfcJ9pWx6SW=sjh3GeNZ_aOA_SHoycqC=zE-5ozQ@mail.gmail.com>
 <86831153-46c0-3bea-dd24-594ef258c1f4@redhat.com>
In-Reply-To: <86831153-46c0-3bea-dd24-594ef258c1f4@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sat, 12 Dec 2020 17:51:28 +0400
Message-ID: <CAJ+F1CK1LBozmqeEd0C0w=49NuLaT_vgEpJMdfWuSmzhzPs6gg@mail.gmail.com>
Subject: Re: [RFC PATCH v4] compiler.h: remove GCC < 3 __builtin_expect
 fallback
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005f658a05b644b5ba"
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x143.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005f658a05b644b5ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Dec 11, 2020 at 5:41 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> On 12/11/20 2:33 PM, Peter Maydell wrote:
> > On Fri, 11 Dec 2020 at 13:13, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com>
> wrote:
> >>
> >> Since commit efc6c07 ("configure: Add a test for the minimum compiler
> >> version"), QEMU explicitely depends on GCC >=3D 4.8.
> >>
> >> (clang >=3D 3.4 advertizes itself as GCC >=3D 4.2 compatible and suppo=
rts
> >> __builtin_expect too)
> >>
> >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> [PMD: #error if likely/unlikely already defined]
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >> Supersedes: <20201210134752.780923-4-marcandre.lureau@redhat.com>
> >> ---
> >>  include/qemu/compiler.h | 7 ++-----
> >>  1 file changed, 2 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> >> index c76281f3540..ae1aee79c8d 100644
> >> --- a/include/qemu/compiler.h
> >> +++ b/include/qemu/compiler.h
> >> @@ -43,14 +43,11 @@
> >>  #define tostring(s)    #s
> >>  #endif
> >>
> >> -#ifndef likely
> >> -#if __GNUC__ < 3
> >> -#define __builtin_expect(x, n) (x)
> >> +#if defined(likely) || defined(unlikely)
> >> +#error building with likely/unlikely is not supported
> >
> > When exactly will the system headers have 'likely' defined,
> > and when would they define it to something other than the
> > obvious __builtin_expect() definition the way we do?
>
> Since there was a check, I tried to be extra-cautious
> (better safe than sorry).
>
> > likely() and unlikely() in my view fall into a category of
> > macros like "container_of()" which aren't defined by a system
> > header but which do have a standard known set of semantics.
> >
> > I think there are two reasonable approaches:
> >  (1) just define the macro, on the assumption that the
> > system headers won't have done (because these aren't standard
> > macros)
> >  (2) as we do with container_of() currently, wrap our
> > definitions in #ifndef whatever, so that we assume that
> > whatever version we might have got from the system is fine
> >
> > I don't think there's any point in explicitly #error-ing here:
> > in fact, it makes the diagnostic to the user less useful,
> > because instead of the compiler complaining about the macro
> > being defined twice and giving both locations where it was
> > defined, now it won't tell the user where the other definition
> > was...
>
> "diagnostic less useful" is a good reason (to invalidate this
> patch).
>
> > I think my preference would be "just drop the ifdef", but
> > there isn't much in it really.
>
> Yes, let's stick to Marc-Andr=C3=A9 v3.
>
> Thanks for your review!
>

Ok to r-b v3 then?
thanks



--=20
Marc-Andr=C3=A9 Lureau

--0000000000005f658a05b644b5ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 11, 2020 at 5:41 PM Phi=
lippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On 12/11/20 2:33 PM, Peter Maydell wrote:<br>
&gt; On Fri, 11 Dec 2020 at 13:13, Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; Since commit efc6c07 (&quot;configure: Add a test for the minimum =
compiler<br>
&gt;&gt; version&quot;), QEMU explicitely depends on GCC &gt;=3D 4.8.<br>
&gt;&gt;<br>
&gt;&gt; (clang &gt;=3D 3.4 advertizes itself as GCC &gt;=3D 4.2 compatible=
 and supports<br>
&gt;&gt; __builtin_expect too)<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcan=
dre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt=
;<br>
&gt;&gt; [PMD: #error if likely/unlikely already defined]<br>
&gt;&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:p=
hilmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; Supersedes: &lt;<a href=3D"mailto:20201210134752.780923-4-marcandr=
e.lureau@redhat.com" target=3D"_blank">20201210134752.780923-4-marcandre.lu=
reau@redhat.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 include/qemu/compiler.h | 7 ++-----<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 5 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h<br>
&gt;&gt; index c76281f3540..ae1aee79c8d 100644<br>
&gt;&gt; --- a/include/qemu/compiler.h<br>
&gt;&gt; +++ b/include/qemu/compiler.h<br>
&gt;&gt; @@ -43,14 +43,11 @@<br>
&gt;&gt;=C2=A0 #define tostring(s)=C2=A0 =C2=A0 #s<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt;<br>
&gt;&gt; -#ifndef likely<br>
&gt;&gt; -#if __GNUC__ &lt; 3<br>
&gt;&gt; -#define __builtin_expect(x, n) (x)<br>
&gt;&gt; +#if defined(likely) || defined(unlikely)<br>
&gt;&gt; +#error building with likely/unlikely is not supported<br>
&gt; <br>
&gt; When exactly will the system headers have &#39;likely&#39; defined,<br=
>
&gt; and when would they define it to something other than the<br>
&gt; obvious __builtin_expect() definition the way we do?<br>
<br>
Since there was a check, I tried to be extra-cautious<br>
(better safe than sorry).<br>
<br>
&gt; likely() and unlikely() in my view fall into a category of<br>
&gt; macros like &quot;container_of()&quot; which aren&#39;t defined by a s=
ystem<br>
&gt; header but which do have a standard known set of semantics.<br>
&gt; <br>
&gt; I think there are two reasonable approaches:<br>
&gt;=C2=A0 (1) just define the macro, on the assumption that the<br>
&gt; system headers won&#39;t have done (because these aren&#39;t standard<=
br>
&gt; macros)<br>
&gt;=C2=A0 (2) as we do with container_of() currently, wrap our<br>
&gt; definitions in #ifndef whatever, so that we assume that<br>
&gt; whatever version we might have got from the system is fine<br>
&gt; <br>
&gt; I don&#39;t think there&#39;s any point in explicitly #error-ing here:=
<br>
&gt; in fact, it makes the diagnostic to the user less useful,<br>
&gt; because instead of the compiler complaining about the macro<br>
&gt; being defined twice and giving both locations where it was<br>
&gt; defined, now it won&#39;t tell the user where the other definition<br>
&gt; was...<br>
<br>
&quot;diagnostic less useful&quot; is a good reason (to invalidate this<br>
patch).<br>
<br>
&gt; I think my preference would be &quot;just drop the ifdef&quot;, but<br=
>
&gt; there isn&#39;t much in it really.<br>
<br>
Yes, let&#39;s stick to Marc-Andr=C3=A9 v3.<br>
<br>
Thanks for your review!<br></blockquote><div><br></div><div>Ok to r-b v3 th=
en?</div><div>thanks<br> </div><br></div><br clear=3D"all"><br>-- <br><div =
dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div=
>

--0000000000005f658a05b644b5ba--

