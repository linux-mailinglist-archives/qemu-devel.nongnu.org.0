Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D8651BE8B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:53:21 +0200 (CEST)
Received: from localhost ([::1]:54876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nma2q-0001HB-LZ
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmZzI-0006wd-7o; Thu, 05 May 2022 07:49:40 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:41611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmZzD-00017i-12; Thu, 05 May 2022 07:49:37 -0400
Received: by mail-lj1-x235.google.com with SMTP id m23so5246513ljb.8;
 Thu, 05 May 2022 04:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9R8SR7AYbGxaaQarfyWW4PHs/bAcXMBgmpj24nvZ6P8=;
 b=EFvi/62LdSahr21Oze31S2ciC7Vf0EJwzA6Iy7mS698iyZHv/cbAS5nJNWJp8tXJ0D
 B1ez3HxhESEHiDSWvEcipiySw/VYGj8l0nsFFRhmTslLtHXH6puAI3I5YOCqWSmO0eIq
 Dm5kG9Gyl8hxIBP1gAhqM528FPBvNGKUzLKHnXkw+U+Zg1FttUAGhboPyEQh9g36kdK8
 jxgqqIOlzN+Xx+eM4wwjx146j725KkGsi+knndYKb89evXFt6Lu0xfjvZLKPP3mHvA9C
 xLS6eQIYyivLHCOWZtbGB5zKlZvYwoG5qklK3d3SLgnNmT75FsFJNQEsdMf/vt47sSwV
 AnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9R8SR7AYbGxaaQarfyWW4PHs/bAcXMBgmpj24nvZ6P8=;
 b=YlKv09hX+Z2bkb/98cnTazNfmVc4tHvi035JWUL3rdy8lSdH4hcGK2rQ0Nl2oeqtxM
 yoV3PJL76vFw9xRTgxZKPmt7sTxwPGPdvzBV7vzffdEPjXXQS+q4xW5oRBRWfAZCttXX
 xVL94L/i85dbwCGazGPKO2qCCsvMfGkLmOj+gv7XjZK9jnxFF2OF0BUEAyJq2tzP98ba
 vJRmgODRs/vgroomQ0FAxp2f2mWcJ0aNT7cyH9LXJ3k+DpyzeU5ZbDUuH8EM6TnHelCU
 DrlpN1VT59jly0nid7NWBM6sAftXtGGCRg2RxmjyD7+77/qtjZ3frh14uCRBtun9iKaV
 KzZA==
X-Gm-Message-State: AOAM533tBuh/Xve+H9bBEp2+aeEdQvfvZEru0SjIGUBcmABZJNOwboo5
 WlJKAryxfOI4+8ePbyYxXLpdAhkXEFD/HLf3o3g=
X-Google-Smtp-Source: ABdhPJw5ARSFm5iofl/W66Ix5JFUNoK5NSjB0pAptgNAPruCxCuWRhEySs7sR72w4NEixdqb5kzAt84hi1P6HWr8Rqs=
X-Received: by 2002:a2e:bc26:0:b0:24f:528f:fb9f with SMTP id
 b38-20020a2ebc26000000b0024f528ffb9fmr12640398ljf.344.1651751372748; Thu, 05
 May 2022 04:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
 <20220505081431.934739-9-marcandre.lureau@redhat.com>
 <87h764w6lt.fsf@pond.sub.org>
In-Reply-To: <87h764w6lt.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 5 May 2022 15:49:21 +0400
Message-ID: <CAJ+F1CL6pxN6S+aPYctnk5_cv-KyH2JBoxejLTDJTpRaZVcbRA@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] qga: throw an Error in ga_channel_open()
To: Markus Armbruster <armbru@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>, Laurent Vivier <lvivier@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "open list:Block layer core" <qemu-block@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000d47be405de4255de"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x235.google.com
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

--000000000000d47be405de4255de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, May 5, 2022 at 3:41 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Allow for a single point of error reporting, and further refactoring.
>
> This sounds like there is no behavioral change intended.  But it looks
> like there is change; see below.
>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  qga/channel-posix.c | 42 +++++++++++++++++-------------------------
> >  1 file changed, 17 insertions(+), 25 deletions(-)
> >
> > diff --git a/qga/channel-posix.c b/qga/channel-posix.c
> > index a996858e2492..0ce594bc36c2 100644
> > --- a/qga/channel-posix.c
> > +++ b/qga/channel-posix.c
> > @@ -119,8 +119,9 @@ static int ga_channel_client_add(GAChannel *c, int
> fd)
> >  }
> >
> >  static gboolean ga_channel_open(GAChannel *c, const gchar *path,
> > -                                GAChannelMethod method, int fd)
> > +                                GAChannelMethod method, int fd, Error
> **errp)
> >  {
> > +    ERRP_GUARD();
> >      int ret;
> >      c->method =3D method;
> >
> > @@ -133,21 +134,20 @@ static gboolean ga_channel_open(GAChannel *c,
> const gchar *path,
> >  #endif
> >                             );
> >          if (fd =3D=3D -1) {
> > -            g_critical("error opening channel: %s", strerror(errno));
> > +            error_setg_errno(errp, errno, "error opening channel");
> >              return false;
> >          }
> >  #ifdef CONFIG_SOLARIS
> >          ret =3D ioctl(fd, I_SETSIG, S_OUTPUT | S_INPUT | S_HIPRI);
> >          if (ret =3D=3D -1) {
> > -            g_critical("error setting event mask for channel: %s",
> > -                       strerror(errno));
> > +            error_setg_errno(errp, errno, "error setting event mask fo=
r
> channel");
> >              close(fd);
> >              return false;
> >          }
> >  #endif
> >          ret =3D ga_channel_client_add(c, fd);
> >          if (ret) {
> > -            g_critical("error adding channel to main loop");
> > +            error_setg(errp, "error adding channel to main loop");
> >              close(fd);
> >              return false;
> >          }
> > @@ -159,7 +159,7 @@ static gboolean ga_channel_open(GAChannel *c, const
> gchar *path,
> >          assert(fd < 0);
> >          fd =3D qemu_open_old(path, O_RDWR | O_NOCTTY | O_NONBLOCK);
> >          if (fd =3D=3D -1) {
> > -            g_critical("error opening channel: %s", strerror(errno));
> > +            error_setg_errno(errp, errno, "error opening channel");
> >              return false;
> >          }
> >          tcgetattr(fd, &tio);
> > @@ -180,7 +180,7 @@ static gboolean ga_channel_open(GAChannel *c, const
> gchar *path,
> >          tcsetattr(fd, TCSANOW, &tio);
> >          ret =3D ga_channel_client_add(c, fd);
> >          if (ret) {
> > -            g_critical("error adding channel to main loop");
> > +            error_setg(errp, "error adding channel to main loop");
> >              close(fd);
> >              return false;
> >          }
> > @@ -188,12 +188,8 @@ static gboolean ga_channel_open(GAChannel *c, cons=
t
> gchar *path,
> >      }
> >      case GA_CHANNEL_UNIX_LISTEN: {
> >          if (fd < 0) {
> > -            Error *local_err =3D NULL;
> > -
> > -            fd =3D unix_listen(path, &local_err);
> > -            if (local_err !=3D NULL) {
> > -                g_critical("%s", error_get_pretty(local_err));
> > -                error_free(local_err);
> > +            fd =3D unix_listen(path, errp);
> > +            if (fd < 0) {
> >                  return false;
> >              }
> >          }
> > @@ -202,24 +198,19 @@ static gboolean ga_channel_open(GAChannel *c,
> const gchar *path,
> >      }
> >      case GA_CHANNEL_VSOCK_LISTEN: {
> >          if (fd < 0) {
> > -            Error *local_err =3D NULL;
> >              SocketAddress *addr;
> >              char *addr_str;
> >
> >              addr_str =3D g_strdup_printf("vsock:%s", path);
> > -            addr =3D socket_parse(addr_str, &local_err);
> > +            addr =3D socket_parse(addr_str, errp);
> >              g_free(addr_str);
> > -            if (local_err !=3D NULL) {
> > -                g_critical("%s", error_get_pretty(local_err));
> > -                error_free(local_err);
> > +            if (*errp) {
>
> Recommend
>
>                if (!addr) {
>
>
ok


> >                  return false;
> >              }
> >
> > -            fd =3D socket_listen(addr, 1, &local_err);
> > +            fd =3D socket_listen(addr, 1, errp);
> >              qapi_free_SocketAddress(addr);
> > -            if (local_err !=3D NULL) {
> > -                g_critical("%s", error_get_pretty(local_err));
> > -                error_free(local_err);
> > +            if (*errp) {
>
> Recommend
>
>                if (fd < 0) {
>
>
ok


> Do you still need ERRP_GUARD() then?
>

It's more future-proof, but could be dropped then.


>
> >                  return false;
> >              }
> >          }
> > @@ -227,7 +218,7 @@ static gboolean ga_channel_open(GAChannel *c, const
> gchar *path,
> >          break;
> >      }
> >      default:
> > -        g_critical("error binding/listening to specified socket");
> > +        error_setg(errp, "error binding/listening to specified socket"=
);
> >          return false;
> >      }
> >
> > @@ -272,12 +263,13 @@ GIOStatus ga_channel_read(GAChannel *c, gchar
> *buf, gsize size, gsize *count)
> >  GAChannel *ga_channel_new(GAChannelMethod method, const gchar *path,
> >                            int listen_fd, GAChannelCallback cb, gpointe=
r
> opaque)
> >  {
> > +    Error *err =3D NULL;
> >      GAChannel *c =3D g_new0(GAChannel, 1);
> >      c->event_cb =3D cb;
> >      c->user_data =3D opaque;
> >
> > -    if (!ga_channel_open(c, path, method, listen_fd)) {
> > -        g_critical("error opening channel");
> > +    if (!ga_channel_open(c, path, method, listen_fd, &err)) {
> > +        error_report_err(err);
> >          ga_channel_free(c);
> >          return NULL;
> >      }
>
> This changes error reporting from g_critical() (which doesn't count as
> error reporting in my book) to error_report_err().
>
> How does this affect the program's behavior?
>

Hmm, indeed. I thought because qga uses Error it would have integrated
error_report usage, I am wrong!  (so annoying to have both GError and Error=
)

qga logging is done via glib API, which Error will simply print to stderr.
I will change it to g_critical again then.

(tbh, I prefer v1 with g_auto(Error), but I don't want to debate for such
thing..)

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d47be405de4255de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 5, 2022 at 3:41 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a =
href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lur=
eau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Allow for a single point of error reporting, and further refactoring.<=
br>
<br>
This sounds like there is no behavioral change intended.=C2=A0 But it looks=
<br>
like there is change; see below.<br>
<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 qga/channel-posix.c | 42 +++++++++++++++++----------------------=
---<br>
&gt;=C2=A0 1 file changed, 17 insertions(+), 25 deletions(-)<br>
&gt;<br>
&gt; diff --git a/qga/channel-posix.c b/qga/channel-posix.c<br>
&gt; index a996858e2492..0ce594bc36c2 100644<br>
&gt; --- a/qga/channel-posix.c<br>
&gt; +++ b/qga/channel-posix.c<br>
&gt; @@ -119,8 +119,9 @@ static int ga_channel_client_add(GAChannel *c, int=
 fd)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static gboolean ga_channel_open(GAChannel *c, const gchar *path,=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GAChannelMethod method, int fd)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GAChannelMethod method, int fd, =
Error **errp)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 ERRP_GUARD();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 c-&gt;method =3D method;<br>
&gt;=C2=A0 <br>
&gt; @@ -133,21 +134,20 @@ static gboolean ga_channel_open(GAChannel *c, co=
nst gchar *path,<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&quot;error open=
ing channel: %s&quot;, strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errn=
o, &quot;error opening channel&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 #ifdef CONFIG_SOLARIS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(fd, I_SETSIG, S_OUTPUT=
 | S_INPUT | S_HIPRI);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&quot;error sett=
ing event mask for channel: %s&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errn=
o, &quot;error setting event mask for channel&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ga_channel_client_add(c, fd)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&quot;error addi=
ng channel to main loop&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;erro=
r adding channel to main loop&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -159,7 +159,7 @@ static gboolean ga_channel_open(GAChannel *c, cons=
t gchar *path,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(fd &lt; 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D qemu_open_old(path, O_RDWR | =
O_NOCTTY | O_NONBLOCK);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&quot;error open=
ing channel: %s&quot;, strerror(errno));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errn=
o, &quot;error opening channel&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcgetattr(fd, &amp;tio);<br>
&gt; @@ -180,7 +180,7 @@ static gboolean ga_channel_open(GAChannel *c, cons=
t gchar *path,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcsetattr(fd, TCSANOW, &amp;tio);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ga_channel_client_add(c, fd)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&quot;error addi=
ng channel to main loop&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;erro=
r adding channel to main loop&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -188,12 +188,8 @@ static gboolean ga_channel_open(GAChannel *c, con=
st gchar *path,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case GA_CHANNEL_UNIX_LISTEN: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error *local_err =3D NULL;<=
br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D unix_listen(path, &a=
mp;local_err);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err !=3D NULL) {<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&q=
uot;%s&quot;, error_get_pretty(local_err));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(lo=
cal_err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D unix_listen(path, er=
rp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return f=
alse;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -202,24 +198,19 @@ static gboolean ga_channel_open(GAChannel *c, co=
nst gchar *path,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case GA_CHANNEL_VSOCK_LISTEN: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error *local_err =3D NULL;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SocketAddress *addr;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *addr_str;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr_str =3D g_strdup_=
printf(&quot;vsock:%s&quot;, path);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D socket_parse(addr_=
str, &amp;local_err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D socket_parse(addr_=
str, errp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(addr_str);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err !=3D NULL) {<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&q=
uot;%s&quot;, error_get_pretty(local_err));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(lo=
cal_err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
<br>
Recommend<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!addr) {<br>
<br></blockquote><div><br></div><div>ok</div><div>=C2=A0<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return f=
alse;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D socket_listen(addr, =
1, &amp;local_err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D socket_listen(addr, =
1, errp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_free_SocketAddres=
s(addr);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err !=3D NULL) {<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&q=
uot;%s&quot;, error_get_pretty(local_err));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(lo=
cal_err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
<br>
Recommend<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br>
<br></blockquote><div><br></div><div>ok</div><div>=C2=A0<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Do you still need ERRP_GUARD() then?<br></blockquote><div><br></div><div>It=
&#39;s more future-proof, but could be dropped then.</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return f=
alse;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -227,7 +218,7 @@ static gboolean ga_channel_open(GAChannel *c, cons=
t gchar *path,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&quot;error binding/listening =
to specified socket&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;error binding/list=
ening to specified socket&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -272,12 +263,13 @@ GIOStatus ga_channel_read(GAChannel *c, gchar *b=
uf, gsize size, gsize *count)<br>
&gt;=C2=A0 GAChannel *ga_channel_new(GAChannelMethod method, const gchar *p=
ath,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int listen_fd, GAChannelCallback cb, gpointer o=
paque)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 GAChannel *c =3D g_new0(GAChannel, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 c-&gt;event_cb =3D cb;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 c-&gt;user_data =3D opaque;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if (!ga_channel_open(c, path, method, listen_fd)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&quot;error opening channel&qu=
ot;);<br>
&gt; +=C2=A0 =C2=A0 if (!ga_channel_open(c, path, method, listen_fd, &amp;e=
rr)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report_err(err);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ga_channel_free(c);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
This changes error reporting from g_critical() (which doesn&#39;t count as<=
br>
error reporting in my book) to error_report_err().<br>
<br>
How does this affect the program&#39;s behavior?<br></blockquote><div><br><=
/div><div>Hmm, indeed. I thought because qga uses Error it would have integ=
rated error_report usage, I am wrong!=C2=A0 (so annoying to have both GErro=
r and Error)<br></div></div><div><br></div><div>qga logging is done via gli=
b API, which Error will simply print to stderr. I will change it to g_criti=
cal again then.</div><div><br></div><div>(tbh, I prefer v1 with g_auto(Erro=
r), but I don&#39;t want to debate for such thing..)<br></div><br>-- <br><d=
iv dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></=
div>

--000000000000d47be405de4255de--

