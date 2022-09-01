Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4005A9511
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 12:50:52 +0200 (CEST)
Received: from localhost ([::1]:57054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oThmd-0001UK-Iw
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 06:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oThjR-0008LK-16
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 06:47:33 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:35814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oThjP-0006GH-9i
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 06:47:32 -0400
Received: by mail-lf1-x133.google.com with SMTP id z25so23824471lfr.2
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 03:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=sAv48mVcwVVUrNMkucQWAxbTcKP1NMuZaQVsG3CwKO0=;
 b=n/XKKGhkdonEBYF+EKvlf73CJsorMz2kOswx7urIvXdxdi0Fs0aHAZW8Bfuefp9rDB
 O1H/uG8MK6IYqNjZngc0qX1wzdWEh9LKva6904W25aBFpO+C/p3FXLQJua6CfLfTNd9w
 ngW+fRcPZ+HtL4yjHO2UFq8RPDOLE+P/FYcmBVGTVJVigORSVOFbVzsI6oc4deMY0iHc
 2VrUNPTQ+w48TOitd1ybqIBdsVw52RjWJkChnJvueDGCRaCbgzIBDIVDNFHY8d2ENDeE
 A68jVK7t6lcttZ7adiX6sb1kR9JCI3tbiIgpc++66qr9EuS+uRrR1M43EhoDZxz1wolv
 2k6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=sAv48mVcwVVUrNMkucQWAxbTcKP1NMuZaQVsG3CwKO0=;
 b=YnDPVGGPfFi+U+M+w6wJ3ondvijFi16n7fUU5jvrZHQ6VElqcWcNqDC8ulJZkIT/cj
 niRTC+Lk01D0Uz9sBLSx3Hh6X/xcDC8o4Qf/5vO7CaMrynE6XpZs5biQPFhzLAHE8vqs
 PdCF90nKyh9Rb/OmwrMiJV02hxo6231hc7nZHFxyhdHmr0Rry9f7UcIQtzIE8HbkCQHg
 uav8u5E9Upxe+01ZPQIaWft2yLshqOgO1NC15uFWmDyOEzmeU55HfN/aWUd7XluEYt8+
 zHi5rYaGz8JddkIp0ZBijTTHZTIXsVqzRL8pUcnBUmQ64W44zN2dOqnRtA5CBLSXFBPL
 t9xw==
X-Gm-Message-State: ACgBeo2KZb7ilPjP5rX8So/laHk9BVBbiLNM3ErZzK5Z9aldIF5HgAqj
 5r9L5P4HKUUGJSsqshnaQRPJDZ5/PNPsG5tmnPA=
X-Google-Smtp-Source: AA6agR6jKLRK37eapyDziCdRR76pS+xoTtOLF6U94pel4JZ88ghpK6imf8K4K8DT7oh/t6lPtWZm0ggnsoiQuQMvi1Q=
X-Received: by 2002:a05:6512:2306:b0:48b:2905:21a8 with SMTP id
 o6-20020a056512230600b0048b290521a8mr11593969lfu.167.1662029249245; Thu, 01
 Sep 2022 03:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220901101120.2741109-1-marcandre.lureau@redhat.com>
 <YxCJ/yh/V/92YZ9O@redhat.com>
In-Reply-To: <YxCJ/yh/V/92YZ9O@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 1 Sep 2022 14:47:17 +0400
Message-ID: <CAJ+F1C+t59uYMPtaaxay1uZfxMu=J47LPKiYO1tnYL4oQBbwxw@mail.gmail.com>
Subject: Re: [PATCH] qio: fix command spawn RDONLY/WRONLY
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000001f7f805e79b5771"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x133.google.com
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

--00000000000001f7f805e79b5771
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Sep 1, 2022 at 2:32 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Thu, Sep 01, 2022 at 02:11:20PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The in/out handling is inverted, although nothing seemed to notice that
> yet.
>
> On the contrary, it is correct, and the unit tests validate this.
>

> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  io/channel-command.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/io/channel-command.c b/io/channel-command.c
> > index 9f2f4a1793..ed17b44f74 100644
> > --- a/io/channel-command.c
> > +++ b/io/channel-command.c
> > @@ -79,10 +79,10 @@ qio_channel_command_new_spawn(const char *const
> argv[],
> >      flags =3D flags & O_ACCMODE;
> >
> >      if (flags =3D=3D O_RDONLY) {
> > -        stdinnull =3D true;
> > +        stdoutnull =3D true;
> >      }
> >      if (flags =3D=3D O_WRONLY) {
> > -        stdoutnull =3D true;
> > +        stdinnull =3D true;
> >      }
>
> This change breaks the unit tests.
>
>
Does it really test it then? we are talking about test-io-channel-command ?
It works before and after for me. Other tests as well.

The confusion is because there are two parties involves. The 'flags'
> variable is from the POV of the parent process, while stdinnull/stdoutnul=
l
> are from the POV of the child process.
>
> IOW, if the parent process is reading from the child (O_RDONLY),
> then the child needs a stdout to write to the parent, but not
> any stdin to read from the parent, hence we set stdin to /dev/null
> in the child.
>

Ok, thanks for the clarification!


--=20
Marc-Andr=C3=A9 Lureau

--00000000000001f7f805e79b5771
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 1, 2022 at 2:32 PM Dani=
el P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Thu, Sep 01, 2022 at 02:11:20PM +0400, <a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrot=
e:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; The in/out handling is inverted, although nothing seemed to notice tha=
t yet.<br>
<br>
On the contrary, it is correct, and the unit tests validate this.<br></bloc=
kquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 io/channel-command.c | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/io/channel-command.c b/io/channel-command.c<br>
&gt; index 9f2f4a1793..ed17b44f74 100644<br>
&gt; --- a/io/channel-command.c<br>
&gt; +++ b/io/channel-command.c<br>
&gt; @@ -79,10 +79,10 @@ qio_channel_command_new_spawn(const char *const ar=
gv[],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 flags =3D flags &amp; O_ACCMODE;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (flags =3D=3D O_RDONLY) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 stdinnull =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 stdoutnull =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (flags =3D=3D O_WRONLY) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 stdoutnull =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 stdinnull =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
This change breaks the unit tests.<br>
<br></blockquote><div><br></div><div>Does it really test it then? we are ta=
lking about test-io-channel-command ? It works before and after for me. Oth=
er tests as well.<br></div><div> <br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
The confusion is because there are two parties involves. The &#39;flags&#39=
;<br>
variable is from the POV of the parent process, while stdinnull/stdoutnull<=
br>
are from the POV of the child process.<br>
<br>
IOW, if the parent process is reading from the child (O_RDONLY),<br>
then the child needs a stdout to write to the parent, but not<br>
any stdin to read from the parent, hence we set stdin to /dev/null<br>
in the child.<br></blockquote><div><br></div><div>Ok, thanks for the clarif=
ication!<br></div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000001f7f805e79b5771--

