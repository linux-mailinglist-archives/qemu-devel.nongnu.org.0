Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903E833B135
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:33:42 +0100 (CET)
Received: from localhost ([::1]:48334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlTh-00029g-Kz
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLlRH-0000qG-4x
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:31:11 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:39939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLlRF-0005T3-0y
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:31:10 -0400
Received: by mail-io1-xd2f.google.com with SMTP id m7so13874537iow.7
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 04:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KplRNLPOrthErkeozghWcr1nUF9xbuozpiQdHjSKPKI=;
 b=Q30/NZLpdDu6n/jNDTPFMMtHQcdjcQdjEdK012ywiqV7/fWwqMCyZalC0IARJeoult
 GcJZFTWxhNZVJrAlZyXh/eCkciCDKDA4jyZZ3rISt4bCm1F3tNR0G6LF2qDJUJhPa1zQ
 mB+xCQCRybqSdXaBlmrDBcAY5WJKGlEftc7tEkVzyxxjU0msGNWAMi5pJBVrmCVzK9ra
 QaG5ALhucOlELuCC9+Iwml7aC01KEfIgaXVm29YUW/I+biIeHjaRYq93XTtF5SO6dDGH
 dYeRLB6pynUoBw8s8Qaoktg3MOmPxv4IW4xUP5NgOmt5wFHA039ED7G3ZvbylRB6Fyyq
 QYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KplRNLPOrthErkeozghWcr1nUF9xbuozpiQdHjSKPKI=;
 b=maUxQyMGfvykKWRA5D55wr55zRZp5eabiDJnENjIIoRlJ1CEwsSW61RDPj6uELciT8
 93bKyPz8fZ8HqvEvM5B1z3e5Xio1bOZl7rT3auy94ujXZCuKJ17yfE6169qQWpdWBdKQ
 yUiCeXBp0dql5cvBRh05NN7qySMlWxcnXYazD9tphh6BcdYq2aeaRJX4jx5o1TFLi2X2
 C+SZtIPbDqp05P0e7W/fNHwOamwzZSMRGP+o0NxnuPW3ZoVp56KoVWDU7CQaDGZslXwr
 VJO8PxV2c+W8jdTUvTeXyxWOQIwAaa0CvyDWKRPAwmOQ+14OownVdNiMiV21IS1dL+Ka
 eJUQ==
X-Gm-Message-State: AOAM531Brdox7gD7rIQYdmR0ThW4t9jh4hMKmLOo6nqE/wQlCzd2sSol
 pmdc3rU3okj0IE0jUK2YknEnEAUApjf0LOG0HGY=
X-Google-Smtp-Source: ABdhPJxN/5bodfH4JnbB5HJImV+Q47lbyNfwzIkFBPKyCW4Xt4DyWxw2bQziZvRgMDFLB0Te/zymwhpU0nVc/nELbT4=
X-Received: by 2002:a05:6638:53b:: with SMTP id
 j27mr8298258jar.72.1615807867839; 
 Mon, 15 Mar 2021 04:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210315105814.5188-1-ma.mandourr@gmail.com>
 <20210315105814.5188-3-ma.mandourr@gmail.com>
 <210a44d9-ab4c-5863-1556-d5a7c368adc2@redhat.com>
In-Reply-To: <210a44d9-ab4c-5863-1556-d5a7c368adc2@redhat.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Mon, 15 Mar 2021 13:30:56 +0200
Message-ID: <CAD-LL6g9Aha-PZpBPiNK09JkDavL0dM8cwKzcysj2MUxwQQ6Mg@mail.gmail.com>
Subject: Re: [PATCH 2/2] util/compatfd.c: Replaced a malloc call with g_malloc.
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fce61a05bd919521"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd2f.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fce61a05bd919521
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 1:13 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> Hi Mahmoud,
>
> On 3/15/21 11:58 AM, Mahmoud Mandour wrote:
> > Replaced a call to malloc() and its respective call to free()
> > with g_malloc() and g_free().
> >
> > g_malloc() is preferred more than g_try_* functions, which
> > return NULL on error, when the size of the requested
> > allocation  is small. This is because allocating few
> > bytes should not be a problem in a healthy system.
> > Otherwise, the system is already in a critical state.
> >
> > Subsequently, removed NULL-checking after g_malloc().
> >
> > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > ---
> >  util/compatfd.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/util/compatfd.c b/util/compatfd.c
> > index 174f394533..a8ec525c6c 100644
> > --- a/util/compatfd.c
> > +++ b/util/compatfd.c
> > @@ -72,14 +72,10 @@ static int qemu_signalfd_compat(const sigset_t *mas=
k)
> >      QemuThread thread;
> >      int fds[2];
> >
> > -    info =3D malloc(sizeof(*info));
> > -    if (info =3D=3D NULL) {
> > -        errno =3D ENOMEM;
> > -        return -1;
> > -    }
> > +    info =3D g_malloc(sizeof(*info));
>
> Watch out...
>
> https://developer.gnome.org/glib/stable/glib-Memory-Allocation.html
>
>   If any call to allocate memory using functions g_new(), g_new0(),
>   g_renew(), g_malloc(), g_malloc0(), g_malloc0_n(), g_realloc(),
>   and g_realloc_n() fails, the application is terminated.
>
> So with your change instead of handling ENOMEM the QEMU process is
> simply killed.
>
> Don't you want to use g_try_new(struct sigfd_compat_info, 1) here
> instead?
>
> >
> >      if (pipe(fds) =3D=3D -1) {
> > -        free(info);
> > +        g_free(info);
> >          return -1;
> >      }
> >
> >
>
>
Hello Mr. Philippe,

That's originally what I did and I sent a patch that uses a g_try_*
variant, and was
instructed by Mr. Thomas Huth that it was better to use g_malloc instead
because this is a small allocation and the process is better killed if such
an allocation fails because the system is already in a very critical state
if it does not handle a small allocation well.

You can find Mr. Thomas reply to my previous patch here:
Re: [PATCH 5/8] util/compatfd.c: Replaced a malloc with GLib's variant
(gnu.org)
<https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg05067.html>

You can instruct me on what to do further.

Thanks
Mahmoud

--000000000000fce61a05bd919521
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">On Mon, Mar 15, 2021 at =
1:13 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com=
" target=3D"_blank">philmd@redhat.com</a>&gt; wrote:<br></div><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Mahmoud,=
<br>
<br>
On 3/15/21 11:58 AM, Mahmoud Mandour wrote:<br>
&gt; Replaced a call to malloc() and its respective call to free()<br>
&gt; with g_malloc() and g_free().<br>
&gt; <br>
&gt; g_malloc() is preferred more than g_try_* functions, which<br>
&gt; return NULL on error, when the size of the requested<br>
&gt; allocation=C2=A0 is small. This is because allocating few<br>
&gt; bytes should not be a problem in a healthy system.<br>
&gt; Otherwise, the system is already in a critical state.<br>
&gt; <br>
&gt; Subsequently, removed NULL-checking after g_malloc().<br>
&gt; <br>
&gt; Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail=
.com" target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 util/compatfd.c | 8 ++------<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/util/compatfd.c b/util/compatfd.c<br>
&gt; index 174f394533..a8ec525c6c 100644<br>
&gt; --- a/util/compatfd.c<br>
&gt; +++ b/util/compatfd.c<br>
&gt; @@ -72,14 +72,10 @@ static int qemu_signalfd_compat(const sigset_t *ma=
sk)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QemuThread thread;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int fds[2];<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 info =3D malloc(sizeof(*info));<br>
&gt; -=C2=A0 =C2=A0 if (info =3D=3D NULL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D ENOMEM;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 info =3D g_malloc(sizeof(*info));<br>
<br>
Watch out...<br>
<br>
<a href=3D"https://developer.gnome.org/glib/stable/glib-Memory-Allocation.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://developer.gnome.org/glib/=
stable/glib-Memory-Allocation.html</a><br>
<br>
=C2=A0 If any call to allocate memory using functions g_new(), g_new0(),<br=
>
=C2=A0 g_renew(), g_malloc(), g_malloc0(), g_malloc0_n(), g_realloc(),<br>
=C2=A0 and g_realloc_n() fails, the application is terminated.<br>
<br>
So with your change instead of handling ENOMEM the QEMU process is<br>
simply killed.<br>
<br>
Don&#39;t you want to use g_try_new(struct sigfd_compat_info, 1) here<br>
instead?<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (pipe(fds) =3D=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(info);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(info);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; <br>
<br></blockquote><div><br></div><div>Hello Mr. Philippe,</div><div><br></di=
v><div>That&#39;s originally what I did and I sent a patch that uses a g_tr=
y_* variant, and was</div><div>instructed by Mr. Thomas Huth that it was be=
tter to use g_malloc instead=C2=A0</div><div>because this is a small alloca=
tion and the process is better killed if such=C2=A0</div><div>an allocation=
 fails because the system is already in a very critical state=C2=A0</div><d=
iv>if it does not handle a small allocation well.=C2=A0</div><div><br></div=
><div>You can find Mr. Thomas reply to my previous patch here:=C2=A0</div><=
div><a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg050=
67.html">Re: [PATCH 5/8] util/compatfd.c: Replaced a malloc with GLib&#39;s=
 variant (gnu.org)</a><br></div><div><br></div><div>You can instruct me on =
what to do further.=C2=A0</div><div><br></div><div>Thanks</div><div>Mahmoud=
</div></div></div></div>

--000000000000fce61a05bd919521--

