Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853042DFB8B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 12:34:11 +0100 (CET)
Received: from localhost ([::1]:52062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krJS5-0004Sj-Ul
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 06:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1krJPO-0003EE-Nv
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 06:31:22 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:36783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1krJPM-00062M-P5
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 06:31:22 -0500
Received: by mail-ed1-x530.google.com with SMTP id b2so9270008edm.3
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 03:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Up+RSKWScLpxfShhvBLFgUUAZ7Gygg9fnm7+dxiytB8=;
 b=eIDoKIQon6/XTzKsjRc6VX0rB7bSCYx6QyigicAdikIoEwnlnI/rS+nlc/EFgJ2yn3
 kvQbJIT91s/PUwHdRKwcqQ6Inrv3EXBtAMCOr4YMoe7jSx+astryipH+pkx7QGaqXGkL
 Rdb9xnXU1YvZ5FdfWIjoLjKy+7bY7FnrGY0tmJzgmI12XAtFkFPhHeYAKwodBTE0NBDh
 i85SdMUk48MQhy42rtneDck4aCLiPkhs0uYIShNnNpan426JFjI0S2PHiOu9rX8PS8Ov
 pFXr+pPhv8WWqbQn712yx/PmewQsiVXesjVoG+P6vqq9bglp0LNo3tLn4rJoy9XvOxUC
 Nwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Up+RSKWScLpxfShhvBLFgUUAZ7Gygg9fnm7+dxiytB8=;
 b=JXULpxvxpkR1+FfCE5mULIEmK1u0mwNrt1+tW3EMl4CerekBtJ1aK6u4AE///KAmPB
 H4vnCcNMFLuRcQqR+z5BFHlOI0JBmmyKKw0HDy06vDrMcugjtPu5wr7ynvbQVFYPXcb/
 8cL8d0w4ltSAC5ElPYLVjyC0bK3pG6jJWaNFqrXFDYlFGdlqEcckhnhrUsj+2Bb8Sd55
 /l4ldcuZCPTeehTXSIbxCoYsmF89Kd8RIhGO+zQNlthREkQQI9dNusaRKKeEavgTrh/1
 BFIO5T6qJ/fhxSyg8sBAKIYOLuKRML7nvHptd6yU/6N0KiIzthfMt5HB1mMkgTWfgqCQ
 4j3A==
X-Gm-Message-State: AOAM5304WVkdAyAWV4sYWVkmi/CavSsn94xtuQFuXyH9a76qkZ4HHXA8
 R7cgaAzTfPhHXzJYLvv/SDFrTe7JkAXDHdhDYS4=
X-Google-Smtp-Source: ABdhPJzZA6vKAs6EQrNnyt1eiKB1QEFf8/5T9AAKPkA1w5tcganWZx1kTfjAbfDQLkm8y9myg/fPoUlUdhiiKssMmjE=
X-Received: by 2002:a50:a6de:: with SMTP id f30mr15777703edc.30.1608550278845; 
 Mon, 21 Dec 2020 03:31:18 -0800 (PST)
MIME-Version: 1.0
References: <20201218135712.674094-1-marcandre.lureau@redhat.com>
 <20201218135712.674094-2-marcandre.lureau@redhat.com>
 <f748066c-e5b9-0c35-070e-fd3d2b0ff671@redhat.com>
In-Reply-To: <f748066c-e5b9-0c35-070e-fd3d2b0ff671@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 21 Dec 2020 15:31:07 +0400
Message-ID: <CAJ+F1C+9Ob2z0pbXoxmxZ6ewPgt8_Rv-6nBm=h=A0s_PCNDvPA@mail.gmail.com>
Subject: Re: [PATCH 2/2] win32: make qemu_fd_register() specific to windows
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f95bb005b6f7cb13"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x530.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f95bb005b6f7cb13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sat, Dec 19, 2020 at 4:19 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 18/12/20 14:57, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Move the declaration of the function to a windows-specific header.
> >
> > The only user left now is SLIRP, which needs special treatement since
> > it doesn't provide event objects itself for the socket/fds.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> This patch is not needed to fix the build, right?  (I don't disagree
> with it, but I wanted to understand why _you_ thought it was an
> improvement).
>
>
My point is that this is corenercase-ish and specific to Windows, I don't
really think it's worth it to be in main-loop.h, with stubs to take care of
the non-windows case (and possibly error prone, if you link against it by
mistake).

If we were to be using that call consistently in every part of qemu using
an fd and the main-loop, it would make sense to keep it "generic". But it's
not being used that way.

Paolo
>
> > ---
> >   include/qemu/main-loop.h  | 2 --
> >   include/sysemu/os-win32.h | 2 ++
> >   net/slirp.c               | 2 ++
> >   util/main-loop.c          | 4 ----
> >   4 files changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> > index d6892fd208..bf93fd691d 100644
> > --- a/include/qemu/main-loop.h
> > +++ b/include/qemu/main-loop.h
> > @@ -310,8 +310,6 @@ void qemu_cond_timedwait_iothread(QemuCond *cond,
> int ms);
> >
> >   /* internal interfaces */
> >
> > -void qemu_fd_register(int fd);
> > -
> >   QEMUBH *qemu_bh_new(QEMUBHFunc *cb, void *opaque);
> >   void qemu_bh_schedule_idle(QEMUBH *bh);
> >
> > diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
> > index 5346d51e89..aa462e3ef6 100644
> > --- a/include/sysemu/os-win32.h
> > +++ b/include/sysemu/os-win32.h
> > @@ -117,6 +117,8 @@ static inline void qemu_funlockfile(FILE *f)
> >   {
> >   }
> >
> > +void qemu_fd_register(int fd);
> > +
> >   /* We wrap all the sockets functions so that we can
> >    * set errno based on WSAGetLastError()
> >    */
> > diff --git a/net/slirp.c b/net/slirp.c
> > index 77042e6df7..b54c2882dc 100644
> > --- a/net/slirp.c
> > +++ b/net/slirp.c
> > @@ -196,7 +196,9 @@ static void net_slirp_timer_mod(void *timer, int64_=
t
> expire_timer,
> >
> >   static void net_slirp_register_poll_fd(int fd, void *opaque)
> >   {
> > +#ifdef WIN32
> >       qemu_fd_register(fd);
> > +#endif
> >   }
> >
> >   static void net_slirp_unregister_poll_fd(int fd, void *opaque)
> > diff --git a/util/main-loop.c b/util/main-loop.c
> > index 6470f8eae3..744b42fc54 100644
> > --- a/util/main-loop.c
> > +++ b/util/main-loop.c
> > @@ -179,10 +179,6 @@ static int max_priority;
> >   static int glib_pollfds_idx;
> >   static int glib_n_poll_fds;
> >
> > -void qemu_fd_register(int fd)
> > -{
> > -}
> > -
> >   static void glib_pollfds_fill(int64_t *cur_timeout)
> >   {
> >       GMainContext *context =3D g_main_context_default();
> >
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f95bb005b6f7cb13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 19, 2020 at 4:19 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 18/12/20 14:57, <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_=
blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Move the declaration of the function to a windows-specific header.<br>
&gt; <br>
&gt; The only user left now is SLIRP, which needs special treatement since<=
br>
&gt; it doesn&#39;t provide event objects itself for the socket/fds.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
<br>
This patch is not needed to fix the build, right?=C2=A0 (I don&#39;t disagr=
ee <br>
with it, but I wanted to understand why _you_ thought it was an <br>
improvement).<br>
<br></blockquote><div><br></div><div>My point is that this is corenercase-i=
sh and specific to Windows, I don&#39;t really think it&#39;s worth it to b=
e in main-loop.h, with stubs to take care of the non-windows case (and poss=
ibly error prone, if you link against it by mistake).</div><div><br></div><=
div>If we were to be using that call consistently in every part of qemu usi=
ng an fd and the main-loop, it would make sense to keep it &quot;generic&qu=
ot;. But it&#39;s not being used that way.<br></div><div> <br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
Paolo<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0include/qemu/main-loop.h=C2=A0 | 2 --<br>
&gt;=C2=A0 =C2=A0include/sysemu/os-win32.h | 2 ++<br>
&gt;=C2=A0 =C2=A0net/slirp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 =C2=A0util/main-loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ---=
-<br>
&gt;=C2=A0 =C2=A04 files changed, 4 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h<br>
&gt; index d6892fd208..bf93fd691d 100644<br>
&gt; --- a/include/qemu/main-loop.h<br>
&gt; +++ b/include/qemu/main-loop.h<br>
&gt; @@ -310,8 +310,6 @@ void qemu_cond_timedwait_iothread(QemuCond *cond, =
int ms);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* internal interfaces */<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -void qemu_fd_register(int fd);<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0QEMUBH *qemu_bh_new(QEMUBHFunc *cb, void *opaque);<br>
&gt;=C2=A0 =C2=A0void qemu_bh_schedule_idle(QEMUBH *bh);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h<br>
&gt; index 5346d51e89..aa462e3ef6 100644<br>
&gt; --- a/include/sysemu/os-win32.h<br>
&gt; +++ b/include/sysemu/os-win32.h<br>
&gt; @@ -117,6 +117,8 @@ static inline void qemu_funlockfile(FILE *f)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +void qemu_fd_register(int fd);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/* We wrap all the sockets functions so that we can<br>
&gt;=C2=A0 =C2=A0 * set errno based on WSAGetLastError()<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt; diff --git a/net/slirp.c b/net/slirp.c<br>
&gt; index 77042e6df7..b54c2882dc 100644<br>
&gt; --- a/net/slirp.c<br>
&gt; +++ b/net/slirp.c<br>
&gt; @@ -196,7 +196,9 @@ static void net_slirp_timer_mod(void *timer, int64=
_t expire_timer,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void net_slirp_register_poll_fd(int fd, void *opaqu=
e)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; +#ifdef WIN32<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_fd_register(fd);<br>
&gt; +#endif<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void net_slirp_unregister_poll_fd(int fd, void *opa=
que)<br>
&gt; diff --git a/util/main-loop.c b/util/main-loop.c<br>
&gt; index 6470f8eae3..744b42fc54 100644<br>
&gt; --- a/util/main-loop.c<br>
&gt; +++ b/util/main-loop.c<br>
&gt; @@ -179,10 +179,6 @@ static int max_priority;<br>
&gt;=C2=A0 =C2=A0static int glib_pollfds_idx;<br>
&gt;=C2=A0 =C2=A0static int glib_n_poll_fds;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -void qemu_fd_register(int fd)<br>
&gt; -{<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0static void glib_pollfds_fill(int64_t *cur_timeout)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GMainContext *context =3D g_main_context_def=
ault();<br>
&gt; <br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f95bb005b6f7cb13--

