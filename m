Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C756FDB06
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:49:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgRf-0005bU-Vq; Wed, 10 May 2023 05:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pwgRe-0005bK-5J
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:49:14 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pwgRc-0008QO-0R
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:49:13 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f13bfe257aso7780848e87.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 02:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683712149; x=1686304149;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RN76Aw6JQDQilgiUVWbCEsRF5aOTKZw1jnUDUSX2JnA=;
 b=Vnj9jDBJ+6hjN+p7HEtKdepo7oRno5dnn998sqhisxh7Omy1nVwN/f69/Y9Rujkkf5
 tuQszXxEOo11jAp0wvRPDCyAoBHijgGGnkLI/o9BMMOtrMPi2dup9YkRxN+PnQ8a9kOH
 UK4q4FKwiHSZJ6pu5sAU/yU+P3GBE+wicjwWMJx4PtMTJYNTxJvuy2j5jeNWeT3903Ro
 /Szopw8kK12fYCgh9xNCWA4vGBt8aMy1Vh8R/fdPiDasVdN6cK/Z8v5FORGzSC+3gIjH
 Mf03X/V3q98xy6WGzzz1WZzgh9h/ZxmYJM1PqVBPbhyt3hx4f2KmWcXh8SbQ9FqvUDoK
 Zkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683712149; x=1686304149;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RN76Aw6JQDQilgiUVWbCEsRF5aOTKZw1jnUDUSX2JnA=;
 b=XyN3iEKD9S4mKKW3NSwxHmFKJmgrcxP2lQQzsC6veyHRmZ7i0PjEwsBv4/OG1Yco6C
 1xSYv+c7p/3yzpiMiIqUTPPx16r3hKdduRct4jcw7K2VCQ9Pn3jmK0LxEF/9pO2GFvWM
 SxSxadg1s+s14b5f/c2EM08qSeRRq7rflp0iUULkfuV+d8nmAxvz5AxvFA63qESEGvUK
 I2fERokFaVjgcS2eMDIE4qmIKt4kuJHfT9KUJWv837pFk3+t1Bwv4XZbKyxi5ziQR8X8
 UgUEZfEG0Htf3vFB7UM/d467JnTaPYmEGayxR0jYmUOmFlSqOX0vZktWrlowI4D+sIZM
 zp+A==
X-Gm-Message-State: AC+VfDy3vhmkGkIoxuZhk3OnMOe7iQvr6CGh44DLSWjsY2HjzzNXs5sV
 jqCWRxGYB1IbEtpha+I6tbMz8UB4sFMoDUk6mKM=
X-Google-Smtp-Source: ACHHUZ43A3slgDXoD+mHrgGyVwn94NZKxhnlfhmtjWv16mBDOiR772iXujWyyn4Z2QQeXtbS2OR0b9DV4xOYL+hSPgg=
X-Received: by 2002:ac2:4156:0:b0:4eb:1294:983d with SMTP id
 c22-20020ac24156000000b004eb1294983dmr1440436lfi.7.1683712149080; Wed, 10 May
 2023 02:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230510072531.3937189-1-marcandre.lureau@redhat.com>
 <877ctg7csj.fsf@pond.sub.org> <ZFtmIDzlZw0/Ygtu@redhat.com>
In-Reply-To: <ZFtmIDzlZw0/Ygtu@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 10 May 2023 13:48:57 +0400
Message-ID: <CAJ+F1CKj1aK8zgSMuK-=jK-_2Xu_HhGUTc+it8j17_VaMrUkkQ@mail.gmail.com>
Subject: Re: [PATCH] chardev: report the handshake error
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008ccf5305fb53c856"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000008ccf5305fb53c856
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 10, 2023 at 1:39=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com>
wrote:

> On Wed, May 10, 2023 at 11:31:40AM +0200, Markus Armbruster wrote:
> > marcandre.lureau@redhat.com writes:
> >
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > This can help to debug connection issues.
> > >
> > > Related to:
> > > https://bugzilla.redhat.com/show_bug.cgi?id=3D2196182
> > >
> > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >  chardev/char-socket.c | 12 ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> > > index 8c58532171..e8e3a743d5 100644
> > > --- a/chardev/char-socket.c
> > > +++ b/chardev/char-socket.c
> > > @@ -742,8 +742,12 @@ static void tcp_chr_websock_handshake(QIOTask
> *task, gpointer user_data)
> > >  {
> > >      Chardev *chr =3D user_data;
> > >      SocketChardev *s =3D user_data;
> > > +    Error *err =3D NULL;
> > >
> > > -    if (qio_task_propagate_error(task, NULL)) {
> > > +    if (qio_task_propagate_error(task, &err)) {
> > > +        error_reportf_err(err,
> > > +                          "websock handshake of character device %s
> failed: ",
> > > +                          chr->label);
> >
> > Code smell: reports an error without failing the function.
> >
> > Should it be a warning instead?
>
> Well it isn't a warning, this is a fatal error wrt continued use
> of the chardev
>
> Not failing the function is expected in this particular code
> pattern. These tcp_chr_(tls,websock)_handshake functions are
> callbacks that are used to handle an async operations progress.
> From the caller's POV, it doesn't matter whether there is an
> error or success. It is upto this function to do whatever is
> required based on the status, hence the call to disconnect
> the chardev on error:
>

I guess it depends on usage, if you have a reconnect=3D option, then it can
be considered non-fatal and a warning is fine.

Should we check if there is a reconnect to decide whether to print an error
or a warning? no strong opinion..


> > >          tcp_chr_disconnect(chr);
> > >      } else {
> > >          if (s->do_telnetopt) {
> > > @@ -778,8 +782,12 @@ static void tcp_chr_tls_handshake(QIOTask *task,
> > >  {
> > >      Chardev *chr =3D user_data;
> > >      SocketChardev *s =3D user_data;
> > > +    Error *err =3D NULL;
> > >
> > > -    if (qio_task_propagate_error(task, NULL)) {
> > > +    if (qio_task_propagate_error(task, &err)) {
> > > +        error_reportf_err(err,
> > > +                          "TLS handshake of character device %s
> failed: ",
> > > +                          chr->label);
> > >          tcp_chr_disconnect(chr);
> > >      } else {
> > >          if (s->is_websock) {
> >
> > Likewise.
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000008ccf5305fb53c856
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 10, 2023 at 1:39=E2=80=
=AFPM Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">be=
rrange@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Wed, May 10, 2023 at 11:31:40AM +0200, Markus Armbruste=
r wrote:<br>
&gt; <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marca=
ndre.lureau@redhat.com</a> writes:<br>
&gt; <br>
&gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lure=
au@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; This can help to debug connection issues.<br>
&gt; &gt;<br>
&gt; &gt; Related to:<br>
&gt; &gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2196182"=
 rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.=
cgi?id=3D2196182</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marca=
ndre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&g=
t;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 chardev/char-socket.c | 12 ++++++++++--<br>
&gt; &gt;=C2=A0 1 file changed, 10 insertions(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/chardev/char-socket.c b/chardev/char-socket.c<br>
&gt; &gt; index 8c58532171..e8e3a743d5 100644<br>
&gt; &gt; --- a/chardev/char-socket.c<br>
&gt; &gt; +++ b/chardev/char-socket.c<br>
&gt; &gt; @@ -742,8 +742,12 @@ static void tcp_chr_websock_handshake(QIOTas=
k *task, gpointer user_data)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Chardev *chr =3D user_data;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 SocketChardev *s =3D user_data;<br>
&gt; &gt; +=C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0 if (qio_task_propagate_error(task, NULL)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 if (qio_task_propagate_error(task, &amp;err)) {<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_reportf_err(err,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;websock handshake of character device %s =
failed: &quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chr-&gt;label);<br>
&gt; <br>
&gt; Code smell: reports an error without failing the function.<br>
&gt; <br>
&gt; Should it be a warning instead?<br>
<br>
Well it isn&#39;t a warning, this is a fatal error wrt continued use<br>
of the chardev<br>
<br>
Not failing the function is expected in this particular code<br>
pattern. These tcp_chr_(tls,websock)_handshake functions are<br>
callbacks that are used to handle an async operations progress.<br>
From the caller&#39;s POV, it doesn&#39;t matter whether there is an<br>
error or success. It is upto this function to do whatever is<br>
required based on the status, hence the call to disconnect<br>
the chardev on error:<br></blockquote><div><br></div><div>I guess it depend=
s on usage, if you have a reconnect=3D option, then it can be considered no=
n-fatal and a warning is fine.</div><div><br></div><div>Should we check if =
there is a reconnect to decide whether to print an error or a warning? no s=
trong opinion..</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcp_chr_disconnect(chr);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;do_telnetopt) {<br>
&gt; &gt; @@ -778,8 +782,12 @@ static void tcp_chr_tls_handshake(QIOTask *t=
ask,<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Chardev *chr =3D user_data;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 SocketChardev *s =3D user_data;<br>
&gt; &gt; +=C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0 if (qio_task_propagate_error(task, NULL)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 if (qio_task_propagate_error(task, &amp;err)) {<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_reportf_err(err,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;TLS handshake of character device %s fail=
ed: &quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chr-&gt;label);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcp_chr_disconnect(chr);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;is_websock) {<br>
&gt; <br>
&gt; Likewise.<br>
&gt; <br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=
=A9 Lureau<br></div></div>

--0000000000008ccf5305fb53c856--

