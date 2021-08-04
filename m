Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFE13E0005
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 13:13:54 +0200 (CEST)
Received: from localhost ([::1]:39466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBEqP-0007eK-2S
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 07:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mBEon-0005jv-Gu
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:12:13 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mBEol-0001UL-Tv
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:12:13 -0400
Received: by mail-ed1-x529.google.com with SMTP id y7so3003405eda.5
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 04:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lCcd5DpF3QqcKc2vYvWVxa3aGjeDhyBnqjzDWTBcH/U=;
 b=MQeU75qgtus2k9hrXpc4cPxiajn+Wh9ZzTU9dXUKw9io9ofrsNojQYP6mvsPLqGsG7
 J1qiYODBHiVtYAJeGJ4/G2npl7kLKS35nOvicmimO5udcDdIHUYIBELPdVvMZWuVoPWN
 /+wmbGRIXspRPKEzO0RlEDclfQGzOKIcNcBp5aXkk5y0bTxqWetSaibZSs5dQhhHIBB2
 3QYj/WQ7YQJutyKC1YXRyrgEzU8CEc+oK3kUNPNTSZBHDavaz7g7DzxRFHc6x6t+3Eas
 2eVqtQbAsUNLBzci4hXp717pYJuZY/iuESzJGv/qutckWNENCbQ1gznQKnR3NPE/UxQE
 IeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lCcd5DpF3QqcKc2vYvWVxa3aGjeDhyBnqjzDWTBcH/U=;
 b=tcu933/6zV1rNQXz/dVW41IgYEHLo/e4p5Av/7ziRMrNaQcrB2bGDRvMK6oYZLP0d2
 MVmzuAFUucKWZkJnjYKdSwV5BNsn14mO3tTmNAvNRGDuzrw4KmvXjVoD88oeGgn+Y+Ga
 YGz6tiUrTuHFBvFyiNst8944ODW2fHWfFYjFgxa5z/rycG30K0E1CkhJWawG4joRRdNK
 eFsKDXIS3guBII+iKYj5oc3Z5zPc7ZGxjDKMoJhaAJLxOuMf8FYTT7fFxaVxf8YbaMfQ
 mkoFZlex12uWv6I8wuJwCyRHmiEeO/BZvUhb1rEWpuDNGhuWramYnEFS0MOFfUVmPurs
 slzg==
X-Gm-Message-State: AOAM530ROtnFukNgilz1cbb8t3St2eSywgQX9/RlecRKRSuwe9ImKyVR
 bAw+6nfGllGSDCyCobQkz+mm/tG1qPxK4tOF38Q=
X-Google-Smtp-Source: ABdhPJzwKrkxRN6qe/DNb8e0vWNZ1eLeGPRIJjbEkxKEWUnN+3eN5w6SQLufUUYgTIh3t6oe19FKgIl9e0ioJsHCuyM=
X-Received: by 2002:aa7:c6d0:: with SMTP id b16mr3449655eds.257.1628075528703; 
 Wed, 04 Aug 2021 04:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210723102825.1790112-1-marcandre.lureau@redhat.com>
 <20210723102825.1790112-2-marcandre.lureau@redhat.com>
 <YQkBCUCoXpHR8cZ6@redhat.com>
In-Reply-To: <YQkBCUCoXpHR8cZ6@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 4 Aug 2021 15:11:56 +0400
Message-ID: <CAJ+F1CLbOwQvZFY=buRCWd=UtiAhbseg9aRUzWJSV9dv5TZQTQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] chardev: fix qemu_chr_open_fd() being called with
 fd=-1
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008e502805c8b9df9a"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008e502805c8b9df9a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 3, 2021 at 12:41 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Fri, Jul 23, 2021 at 02:28:22PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The "file" chardev may call qemu_chr_open_fd() with fd_in=3D-1. This ma=
y
> > cause invalid system calls, as the QIOChannel is assumed to be properly
> > initialized later on.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  chardev/char-fd.c | 22 +++++++++++++---------
> >  1 file changed, 13 insertions(+), 9 deletions(-)
> >
> > diff --git a/chardev/char-fd.c b/chardev/char-fd.c
> > index 1cd62f2779..ee85a52c06 100644
> > --- a/chardev/char-fd.c
> > +++ b/chardev/char-fd.c
> > @@ -133,15 +133,19 @@ void qemu_chr_open_fd(Chardev *chr,
> >      FDChardev *s =3D FD_CHARDEV(chr);
> >      char *name;
> >
> > -    s->ioc_in =3D QIO_CHANNEL(qio_channel_file_new_fd(fd_in));
> > -    name =3D g_strdup_printf("chardev-file-in-%s", chr->label);
> > -    qio_channel_set_name(QIO_CHANNEL(s->ioc_in), name);
> > -    g_free(name);
> > -    s->ioc_out =3D QIO_CHANNEL(qio_channel_file_new_fd(fd_out));
> > -    name =3D g_strdup_printf("chardev-file-out-%s", chr->label);
> > -    qio_channel_set_name(QIO_CHANNEL(s->ioc_out), name);
> > -    g_free(name);
> > -    qemu_set_nonblock(fd_out);
> > +    if (fd_in >=3D 0) {
> > +        s->ioc_in =3D QIO_CHANNEL(qio_channel_file_new_fd(fd_in));
> > +        name =3D g_strdup_printf("chardev-file-in-%s", chr->label);
> > +        qio_channel_set_name(QIO_CHANNEL(s->ioc_in), name);
> > +        g_free(name);
> > +    }
> > +    if (fd_out >=3D 0) {
> > +        s->ioc_out =3D QIO_CHANNEL(qio_channel_file_new_fd(fd_out));
> > +        name =3D g_strdup_printf("chardev-file-out-%s", chr->label);
> > +        qio_channel_set_name(QIO_CHANNEL(s->ioc_out), name);
> > +        g_free(name);
> > +        qemu_set_nonblock(fd_out);
> > +    }
>
> Other code in this file assumes ioc_out is non-NULL, so this looks
> like an incomplete fix.
>
>
Right, I am adding a patch to correct the source watch creation, and fixing
this one handling !ioc_out condition.

thanks

--=20
Marc-Andr=C3=A9 Lureau

--0000000000008e502805c8b9df9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 12:41 P=
M Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berran=
ge@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Fri, Jul 23, 2021 at 02:28:22PM +0400, <a href=3D"mailto:ma=
rcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a=
> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; The &quot;file&quot; chardev may call qemu_chr_open_fd() with fd_in=3D=
-1. This may<br>
&gt; cause invalid system calls, as the QIOChannel is assumed to be properl=
y<br>
&gt; initialized later on.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 chardev/char-fd.c | 22 +++++++++++++---------<br>
&gt;=C2=A0 1 file changed, 13 insertions(+), 9 deletions(-)<br>
&gt; <br>
&gt; diff --git a/chardev/char-fd.c b/chardev/char-fd.c<br>
&gt; index 1cd62f2779..ee85a52c06 100644<br>
&gt; --- a/chardev/char-fd.c<br>
&gt; +++ b/chardev/char-fd.c<br>
&gt; @@ -133,15 +133,19 @@ void qemu_chr_open_fd(Chardev *chr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 FDChardev *s =3D FD_CHARDEV(chr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 char *name;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 s-&gt;ioc_in =3D QIO_CHANNEL(qio_channel_file_new_fd(fd=
_in));<br>
&gt; -=C2=A0 =C2=A0 name =3D g_strdup_printf(&quot;chardev-file-in-%s&quot;=
, chr-&gt;label);<br>
&gt; -=C2=A0 =C2=A0 qio_channel_set_name(QIO_CHANNEL(s-&gt;ioc_in), name);<=
br>
&gt; -=C2=A0 =C2=A0 g_free(name);<br>
&gt; -=C2=A0 =C2=A0 s-&gt;ioc_out =3D QIO_CHANNEL(qio_channel_file_new_fd(f=
d_out));<br>
&gt; -=C2=A0 =C2=A0 name =3D g_strdup_printf(&quot;chardev-file-out-%s&quot=
;, chr-&gt;label);<br>
&gt; -=C2=A0 =C2=A0 qio_channel_set_name(QIO_CHANNEL(s-&gt;ioc_out), name);=
<br>
&gt; -=C2=A0 =C2=A0 g_free(name);<br>
&gt; -=C2=A0 =C2=A0 qemu_set_nonblock(fd_out);<br>
&gt; +=C2=A0 =C2=A0 if (fd_in &gt;=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;ioc_in =3D QIO_CHANNEL(qio_channel_=
file_new_fd(fd_in));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D g_strdup_printf(&quot;chardev-fi=
le-in-%s&quot;, chr-&gt;label);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_set_name(QIO_CHANNEL(s-&gt;io=
c_in), name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(name);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 if (fd_out &gt;=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;ioc_out =3D QIO_CHANNEL(qio_channel=
_file_new_fd(fd_out));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D g_strdup_printf(&quot;chardev-fi=
le-out-%s&quot;, chr-&gt;label);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_set_name(QIO_CHANNEL(s-&gt;io=
c_out), name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_nonblock(fd_out);<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
Other code in this file assumes ioc_out is non-NULL, so this looks<br>
like an incomplete fix.<br>
<br></blockquote><div><br></div><div>Right, I am adding a patch to correct =
the source watch creation, and fixing this one handling !ioc_out condition.=
<br></div></div><br clear=3D"all"></div><div>thanks</div><div><br></div><di=
v>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<=
br></div></div></div>

--0000000000008e502805c8b9df9a--

