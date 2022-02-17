Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696B04BA766
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 18:46:23 +0100 (CET)
Received: from localhost ([::1]:42824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKkrG-0008Ma-Gw
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 12:46:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nKki2-0002kt-1j
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:36:50 -0500
Received: from [2a00:1450:4864:20::32b] (port=38653
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nKkhy-0005e9-J9
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:36:49 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 k127-20020a1ca185000000b0037bc4be8713so6765498wme.3
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 09:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NEwOnuSunFhdAQMmZpXgUdim0fC5SVV0It+Fqkan15o=;
 b=WfaIxBxGXq5ZHAJHc3KTwcf5Cxa70DO3RWJkoTzut+paJmnrWsHwcgTiFo82tVSid1
 h+KxRTTJEiUIasqCRMq0LFUhWQlHPc/PgstQ/fvql6ZA2UDQbmSf/gjOQYQnpsnkgJCy
 VeX8SEGQtJPiWYE8Nc6Yx9I6qJBAml8at3lFzzawQ6o+NHp8chb9e2Z5Pc2c1qM4lmDO
 LhvA/kXvrvpVUVk/5NmuM/+M6+KSrXihr7EhgtNmpsqm51LUXKBIyf6jnWoB9XWA0MJm
 /xLCfmLpZ1E7MS5W0+Ut/r3k68uR+cJf1vn2M2XNopAeyKSgrm50hvxzQNaqkH8lO4OG
 4dDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NEwOnuSunFhdAQMmZpXgUdim0fC5SVV0It+Fqkan15o=;
 b=b2+3shi7SQqvyIDx4Pz7ixprVooEht9p/MziNf82il504LiBWZHCtqI2cV7BwOCoiC
 hesziECJsrj1sV8FxUFlfjvLqSJ8iXbHe2yknGP+as4T+jFnt7gw6dcgaa0RtbJXiffy
 T2Ulpzddg/9lebUR16KoR81j3VjnKc8fOzXTOhaftFd78tSfXYXFuquRhdyOGnMHXtqK
 i1DRjuJLVuCYAfgTd/wxVECIW0S6RYGA1yCDwcoBj+lNv3QLbah2aC+GryocpNxPxAtS
 Howcaqy2AzNzLzGndClJw5m9ATtpW2XVrzKD+vGxT7xGgZCjj3Zhim/s/QpLIJnA2ZnK
 zr+A==
X-Gm-Message-State: AOAM532OOWHEnI0hsQQJ5r06Iino2lZjD8jQjun11tBvO+/qIFGCBh57
 5Q/zcSiyC+H4RaIzgEhOV5DTTel3CaL4sY7+Qow=
X-Google-Smtp-Source: ABdhPJyz6sL7+YV/5VrRVA/wVdW+K7QG93I5YskjjIGedywA7IKq33pyZiNM1HFqPDoG6/TsAG3rBeZTk0mq3KdL6ws=
X-Received: by 2002:a05:600c:354e:b0:37c:815f:8a3f with SMTP id
 i14-20020a05600c354e00b0037c815f8a3fmr7062836wmq.15.1645119404760; Thu, 17
 Feb 2022 09:36:44 -0800 (PST)
MIME-Version: 1.0
References: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
 <CAMVc7JVOJxkqLpvRu7JLNP48C5Kmu0JRYUSR8xP+dAtGp_n=_A@mail.gmail.com>
 <CAJ+F1CKgvcA97kLdxVodSoAFbk1_kB3_po8vn4kX_gPZgKYxbg@mail.gmail.com>
 <CAMVc7JU1rfBEHgofiveNopLkyXRLSEG8dA=6cn_qY52BqLB3iw@mail.gmail.com>
 <CAJ+F1CJsrfL-PiPM5W4Ydp4WLMfrZOaYydUp4wrX1LbFCxiSaA@mail.gmail.com>
 <CAMVc7JVADz6A+xA7bcZOCd5Y+=2bAqyPGyxqu-Z1gawKGRtiGw@mail.gmail.com>
In-Reply-To: <CAMVc7JVADz6A+xA7bcZOCd5Y+=2bAqyPGyxqu-Z1gawKGRtiGw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 17 Feb 2022 21:36:32 +0400
Message-ID: <CAJ+F1CKE3utVzLGLUk8FP9D_3YMprn3fLnuq-k+EJNiSXFBj=g@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] GL & D-Bus display related fixes
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000bbe20605d83a3574"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bbe20605d83a3574
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Feb 17, 2022 at 9:25 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On Fri, Feb 18, 2022 at 2:07 AM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Thu, Feb 17, 2022 at 8:39 PM Akihiko Odaki <akihiko.odaki@gmail.com>
> wrote:
> >>
> >> On Fri, Feb 18, 2022 at 1:12 AM Marc-Andr=C3=A9 Lureau
> >> <marcandre.lureau@gmail.com> wrote:
> >> >
> >> > Hi
> >> >
> >> > On Thu, Feb 17, 2022 at 5:09 PM Akihiko Odaki <
> akihiko.odaki@gmail.com> wrote:
> >> >>
> >> >> On Thu, Feb 17, 2022 at 8:58 PM <marcandre.lureau@redhat.com> wrote=
:
> >> >> >
> >> >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> >> >
> >> >> > Hi,
> >> >> >
> >> >> > In the thread "[PATCH 0/6] ui/dbus: Share one listener for a
> console", Akihiko
> >> >> > Odaki reported a number of issues with the GL and D-Bus display.
> His series
> >> >> > propose a different design, and reverting some of my previous
> generic console
> >> >> > changes to fix those issues.
> >> >> >
> >> >> > However, as I work through the issue so far, they can be solved b=
y
> reasonable
> >> >> > simple fixes while keeping the console changes generic (not
> specific to the
> >> >> > D-Bus display backend). I belive a shared infrastructure is more
> beneficial long
> >> >> > term than having GL-specific code in the DBus code (in particular=
,
> the
> >> >> > egl-headless & VNC combination could potentially use it)
> >> >> >
> >> >> > Thanks a lot Akihiko for reporting the issues proposing a
> different approach!
> >> >> > Please test this alternative series and let me know of any furthe=
r
> issues. My
> >> >> > understanding is that you are mainly concerned with the Cocoa
> backend, and I
> >> >> > don't have a way to test it, so please check it. If necessary, we
> may well have
> >> >> > to revert my earlier changes and go your way, eventually.
> >> >> >
> >> >> > Marc-Andr=C3=A9 Lureau (12):
> >> >> >   ui/console: fix crash when using gl context with non-gl listene=
rs
> >> >> >   ui/console: fix texture leak when calling
> surface_gl_create_texture()
> >> >> >   ui: do not create a surface when resizing a GL scanout
> >> >> >   ui/console: move check for compatible GL context
> >> >> >   ui/console: move dcl compatiblity check to a callback
> >> >> >   ui/console: egl-headless is compatible with non-gl listeners
> >> >> >   ui/dbus: associate the DBusDisplayConsole listener with the giv=
en
> >> >> >     console
> >> >> >   ui/console: move console compatibility check to
> dcl_display_console()
> >> >> >   ui/shader: fix potential leak of shader on error
> >> >> >   ui/shader: free associated programs
> >> >> >   ui/console: add a dpy_gfx_switch callback helper
> >> >> >   ui/dbus: fix texture sharing
> >> >> >
> >> >> >  include/ui/console.h |  19 ++++---
> >> >> >  ui/dbus.h            |   3 ++
> >> >> >  ui/console-gl.c      |   4 ++
> >> >> >  ui/console.c         | 119
> ++++++++++++++++++++++++++-----------------
> >> >> >  ui/dbus-console.c    |  27 +++++-----
> >> >> >  ui/dbus-listener.c   |  11 ----
> >> >> >  ui/dbus.c            |  33 +++++++++++-
> >> >> >  ui/egl-headless.c    |  17 ++++++-
> >> >> >  ui/gtk.c             |  18 ++++++-
> >> >> >  ui/sdl2.c            |   9 +++-
> >> >> >  ui/shader.c          |   9 +++-
> >> >> >  ui/spice-display.c   |   9 +++-
> >> >> >  12 files changed, 192 insertions(+), 86 deletions(-)
> >> >> >
> >> >> > --
> >> >> > 2.34.1.428.gdcc0cd074f0c
> >> >> >
> >> >> >
> >> >>
> >> >> You missed only one thing:
> >> >> >- that console_select and register_displaychangelistener may not
> call
> >> >> > dpy_gfx_switch and call dpy_gl_scanout_texture instead. It is
> >> >> > incompatible with non-OpenGL displays
> >> >>
> >> >> displaychangelistener_display_console always has to call
> >> >> dpy_gfx_switch for non-OpenGL displays, but it still doesn't.
> >> >
> >> >
> >> > Ok, would that be what you have in mind?
> >> >
> >> >  --- a/ui/console.c
> >> > +++ b/ui/console.c
> >> > @@ -1122,6 +1122,10 @@ static void
> displaychangelistener_display_console(DisplayChangeListener *dcl,
> >> >      } else if (con->scanout.kind =3D=3D SCANOUT_SURFACE) {
> >> >          dpy_gfx_create_texture(con, con->surface);
> >> >          displaychangelistener_gfx_switch(dcl, con->surface);
> >> > +    } else {
> >> > +        /* use the fallback surface, egl-headless keeps it updated =
*/
> >> > +        assert(con->surface);
> >> > +        displaychangelistener_gfx_switch(dcl, con->surface);
> >> >      }
> >>
> >> It should call displaychangelistener_gfx_switch even when e.g.
> >> con->scanout.kind =3D=3D SCANOUT_TEXTURE. egl-headless renders the con=
tent
> >> to the last DisplaySurface it received while con->scanout.kind =3D=3D
> >> SCANOUT_TEXTURE.
> >
> >
> > I see, egl-headless is really not a "listener".
> >
> >>
> >> >
> >> > I wish such egl-headless specific code would be there, but we would
> need more refactoring.
> >> >
> >> > I think I would rather have a backend split for GL context, like
> "-object egl-context". egl-headless-specific copy code would be handled b=
y
> common/util code for anything that wants a pixman surface (VNC, screen
> capture, non-GL display etc).
> >> >
> >> > This split would allow sharing the context code, and introduce other
> system specific GL initialization, such as WGL etc. Right now, I doubt th=
e
> EGL code works on anything but Linux.
> >>
> >> Sharing the context code is unlikely to happen. Usually the toolkit
> >> (GTK, SDL, or Cocoa in my fork) knows what graphics accelerator should
> >> be used and how the context should be created for a particular window.
> >> The context sharing can be achieved only for headless displays, namely
> >> dbus, egl-headless and spice. Few people would want to use them in
> >> combination.
> >
> >
> > Ok for toolkits, they usually have their own context. But ideally, qemu
> should be "headless". And the GL contexts should be working on other
> systems than EGL Linux.
> >
> > Any of the spice, vnc, dbus display etc may legitimately be fixed to
> work with WGL etc. Doing this repeatedly on the various display backends
> would be bad design.
>
> We already have ui/egl-context.c to share the code for EGL. We can
> have ui/headless-context.c or something which creates a context for
> headless but the implementation can be anything proper there. It
> doesn't require modifying ui/console.c or adding something like
> "-object egl-context".
>

Agree, as long as you have only a single context provider per system.  But
that's not my experience with GL in the past. Maybe this is true today.


> >
> > Although my idea is that display servers (spice, vnc, rdp, etc) &
> various UI (gtk, cocoa, sdl, etc) should be outside of qemu. The display
> would use IPC, based on DBus if it fits the job, or something else if
> necessary. Obviously, there is still a lot of work to do to improve surfa=
ce
> & texture sharing and portability, but that should be possible...
>
> Maybe we can rework the present UIs of QEMU to make them compatible
> with both in-process communication and D-Bus inter-process
> communication. If the user has a requirement incompatible with IPC
> (e.g. OpenGL on macOS), the user can opt for in-process communication.
> D-Bus would be used otherwise. (Of course that would require
> substantial effort.)
>

That should be possible, as long the IPC is very close to the inner qemu
API, we could have an IPC-based display code turned into a shared library
instead and run in process. Although I think that would limit the kind of
UI you can expect (it would be a bare display, like qemu-display today, not
something that would bring you a full user-friendly UI, virt-manager/Boxes
kind)



> >
> >>
> >>
> >> >
> >> >>
> >> >> Anything else should be addressed with this patch series. (And it
> also
> >> >> has nice fixes for shader leaks.)
> >> >
> >> >
> >> > thanks
> >> >
> >> >>
> >> >>
> >> >> cocoa doesn't have OpenGL output and egl-headless, the cause of man=
y
> >> >> pains addressed here, does not work on macOS so you need little
> >> >> attention. I have an out-of-tree OpenGL support for cocoa but it is
> >> >> out-of-tree anyway and I can fix it anytime.
> >> >
> >> >
> >> > Great!
> >> >
> >> > btw, I suppose you checked your DBus changes against the WIP
> "qemu-display" project. What was your experience? I don't think many peop=
le
> have tried it yet. Do you think this could be made to work on macOS? at
> least the non-dmabuf support should work, as long as Gtk4 has good macOS
> support. I don't know if dmabuf or similar exist there, any idea?
> >>
> >> I tested it on Fedora. I think it would probably work on macOS but
> >> maybe require some tweaks. IOSurface is a counterpart of DMA-BUF in
> >> macOS but its situation is bad; it must be delivered via macOS's own
> >> IPC mechanisms (Mach port and XPC), but they are for server-client
> >> model and not for P2P. fileport mechanism allows to convert Mach port
> >> to file descriptor, but it is not documented. (In reality, I think all
> >> of the major browsers, Chromium, Firefox and Safari use fileport for
> >> this purpose. Apple should really document it if they use it for their
> >> app.) It is also possible to share IOSurface with a global number, but
> >> it can be brute-forced and is insecure.
> >>
> >
> > Thanks, the Gtk developers might have some clue. They have been working
> on improving macOS support, and it can use opengl now (
> https://blogs.gnome.org/chergert/2020/12/15/gtk-4-got-a-new-macos-backend=
-now-with-opengl/
> ).
>
> They don't need IPC for passing textures so that is a different story.
>

Yes but they have web-engine and video decoding concerns (beside
qemu/dmabuf gtk display they should be aware of).  I'll try to reach
Christian about it.

thanks


> >
> >>
> >> Regards,
> >> Akihiko Odaki
> >>
> >> >
> >> >
> >> > --
> >> > Marc-Andr=C3=A9 Lureau
> >
> >
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000bbe20605d83a3574
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 17, 2022 at 9:25 PM Aki=
hiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Fri, Feb 18, 2022 at 2:07 AM Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On Thu, Feb 17, 2022 at 8:39 PM Akihiko Odaki &lt;<a href=3D"mailto:ak=
ihiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Feb 18, 2022 at 1:12 AM Marc-Andr=C3=A9 Lureau<br>
&gt;&gt; &lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank=
">marcandre.lureau@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Thu, Feb 17, 2022 at 5:09 PM Akihiko Odaki &lt;<a href=3D"=
mailto:akihiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</=
a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Thu, Feb 17, 2022 at 8:58 PM &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>=
&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:m=
arcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</=
a>&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Hi,<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; In the thread &quot;[PATCH 0/6] ui/dbus: Share one l=
istener for a console&quot;, Akihiko<br>
&gt;&gt; &gt;&gt; &gt; Odaki reported a number of issues with the GL and D-=
Bus display. His series<br>
&gt;&gt; &gt;&gt; &gt; propose a different design, and reverting some of my=
 previous generic console<br>
&gt;&gt; &gt;&gt; &gt; changes to fix those issues.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; However, as I work through the issue so far, they ca=
n be solved by reasonable<br>
&gt;&gt; &gt;&gt; &gt; simple fixes while keeping the console changes gener=
ic (not specific to the<br>
&gt;&gt; &gt;&gt; &gt; D-Bus display backend). I belive a shared infrastruc=
ture is more beneficial long<br>
&gt;&gt; &gt;&gt; &gt; term than having GL-specific code in the DBus code (=
in particular, the<br>
&gt;&gt; &gt;&gt; &gt; egl-headless &amp; VNC combination could potentially=
 use it)<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Thanks a lot Akihiko for reporting the issues propos=
ing a different approach!<br>
&gt;&gt; &gt;&gt; &gt; Please test this alternative series and let me know =
of any further issues. My<br>
&gt;&gt; &gt;&gt; &gt; understanding is that you are mainly concerned with =
the Cocoa backend, and I<br>
&gt;&gt; &gt;&gt; &gt; don&#39;t have a way to test it, so please check it.=
 If necessary, we may well have<br>
&gt;&gt; &gt;&gt; &gt; to revert my earlier changes and go your way, eventu=
ally.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Marc-Andr=C3=A9 Lureau (12):<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0ui/console: fix crash when using gl cont=
ext with non-gl listeners<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0ui/console: fix texture leak when callin=
g surface_gl_create_texture()<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0ui: do not create a surface when resizin=
g a GL scanout<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0ui/console: move check for compatible GL=
 context<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0ui/console: move dcl compatiblity check =
to a callback<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0ui/console: egl-headless is compatible w=
ith non-gl listeners<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0ui/dbus: associate the DBusDisplayConsol=
e listener with the given<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0console<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0ui/console: move console compatibility c=
heck to dcl_display_console()<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0ui/shader: fix potential leak of shader =
on error<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0ui/shader: free associated programs<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0ui/console: add a dpy_gfx_switch callbac=
k helper<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0ui/dbus: fix texture sharing<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 include/ui/console.h |=C2=A0 19 ++++---<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 ui/dbus.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A03 ++<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 ui/console-gl.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A04 ++<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 ui/console.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 119 ++++++++++++++++++++++++++-----------------<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 ui/dbus-console.c=C2=A0 =C2=A0 |=C2=A0 27 ++++=
+-----<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 ui/dbus-listener.c=C2=A0 =C2=A0|=C2=A0 11 ----=
<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 ui/dbus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 33 +++++++++++-<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 ui/egl-headless.c=C2=A0 =C2=A0 |=C2=A0 17 ++++=
++-<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 ui/gtk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 18 ++++++-<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 ui/sdl2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A09 +++-<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 ui/shader.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A09 +++-<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 ui/spice-display.c=C2=A0 =C2=A0|=C2=A0 =C2=A09=
 +++-<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 12 files changed, 192 insertions(+), 86 deleti=
ons(-)<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt; 2.34.1.428.gdcc0cd074f0c<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; You missed only one thing:<br>
&gt;&gt; &gt;&gt; &gt;- that console_select and register_displaychangeliste=
ner may not call<br>
&gt;&gt; &gt;&gt; &gt; dpy_gfx_switch and call dpy_gl_scanout_texture inste=
ad. It is<br>
&gt;&gt; &gt;&gt; &gt; incompatible with non-OpenGL displays<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; displaychangelistener_display_console always has to call<=
br>
&gt;&gt; &gt;&gt; dpy_gfx_switch for non-OpenGL displays, but it still does=
n&#39;t.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Ok, would that be what you have in mind?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 --- a/ui/console.c<br>
&gt;&gt; &gt; +++ b/ui/console.c<br>
&gt;&gt; &gt; @@ -1122,6 +1122,10 @@ static void displaychangelistener_disp=
lay_console(DisplayChangeListener *dcl,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else if (con-&gt;scanout.kind =3D=3D SC=
ANOUT_SURFACE) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dpy_gfx_create_texture(con,=
 con-&gt;surface);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 displaychangelistener_gfx_s=
witch(dcl, con-&gt;surface);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* use the fallback surface, egl=
-headless keeps it updated */<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(con-&gt;surface);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 displaychangelistener_gfx_switch=
(dcl, con-&gt;surface);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; It should call displaychangelistener_gfx_switch even when e.g.<br>
&gt;&gt; con-&gt;scanout.kind =3D=3D SCANOUT_TEXTURE. egl-headless renders =
the content<br>
&gt;&gt; to the last DisplaySurface it received while con-&gt;scanout.kind =
=3D=3D<br>
&gt;&gt; SCANOUT_TEXTURE.<br>
&gt;<br>
&gt;<br>
&gt; I see, egl-headless is really not a &quot;listener&quot;.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I wish such egl-headless specific code would be there, but we=
 would need more refactoring.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I think I would rather have a backend split for GL context, l=
ike &quot;-object egl-context&quot;. egl-headless-specific copy code would =
be handled by common/util code for anything that wants a pixman surface (VN=
C, screen capture, non-GL display etc).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This split would allow sharing the context code, and introduc=
e other system specific GL initialization, such as WGL etc. Right now, I do=
ubt the EGL code works on anything but Linux.<br>
&gt;&gt;<br>
&gt;&gt; Sharing the context code is unlikely to happen. Usually the toolki=
t<br>
&gt;&gt; (GTK, SDL, or Cocoa in my fork) knows what graphics accelerator sh=
ould<br>
&gt;&gt; be used and how the context should be created for a particular win=
dow.<br>
&gt;&gt; The context sharing can be achieved only for headless displays, na=
mely<br>
&gt;&gt; dbus, egl-headless and spice. Few people would want to use them in=
<br>
&gt;&gt; combination.<br>
&gt;<br>
&gt;<br>
&gt; Ok for toolkits, they usually have their own context. But ideally, qem=
u should be &quot;headless&quot;. And the GL contexts should be working on =
other systems than EGL Linux.<br>
&gt;<br>
&gt; Any of the spice, vnc, dbus display etc may legitimately be fixed to w=
ork with WGL etc. Doing this repeatedly on the various display backends wou=
ld be bad design.<br>
<br>
We already have ui/egl-context.c to share the code for EGL. We can<br>
have ui/headless-context.c or something which creates a context for<br>
headless but the implementation can be anything proper there. It<br>
doesn&#39;t require modifying ui/console.c or adding something like<br>
&quot;-object egl-context&quot;.<br></blockquote><div><br></div><div>Agree,=
 as long as you have only a single context provider per system.=C2=A0 But t=
hat&#39;s not my experience with GL in the past. Maybe this is true today.<=
br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Although my idea is that display servers (spice, vnc, rdp, etc) &amp; =
various UI (gtk, cocoa, sdl, etc) should be outside of qemu. The display wo=
uld use IPC, based on DBus if it fits the job, or something else if necessa=
ry. Obviously, there is still a lot of work to do to improve surface &amp; =
texture sharing and portability, but that should be possible...<br>
<br>
Maybe we can rework the present UIs of QEMU to make them compatible<br>
with both in-process communication and D-Bus inter-process<br>
communication. If the user has a requirement incompatible with IPC<br>
(e.g. OpenGL on macOS), the user can opt for in-process communication.<br>
D-Bus would be used otherwise. (Of course that would require<br>
substantial effort.)<br></blockquote><div><br></div><div>That should be pos=
sible, as long the IPC is very close to the inner qemu API, we could have a=
n IPC-based display code turned into a shared library instead and run in pr=
ocess. Although I think that would limit the kind of UI you can expect (it =
would be a bare display, like qemu-display today, not something that would =
bring you a full user-friendly UI, virt-manager/Boxes kind)<br></div><div><=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Anything else should be addressed with this patch series.=
 (And it also<br>
&gt;&gt; &gt;&gt; has nice fixes for shader leaks.)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; thanks<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; cocoa doesn&#39;t have OpenGL output and egl-headless, th=
e cause of many<br>
&gt;&gt; &gt;&gt; pains addressed here, does not work on macOS so you need =
little<br>
&gt;&gt; &gt;&gt; attention. I have an out-of-tree OpenGL support for cocoa=
 but it is<br>
&gt;&gt; &gt;&gt; out-of-tree anyway and I can fix it anytime.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Great!<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; btw, I suppose you checked your DBus changes against the WIP =
&quot;qemu-display&quot; project. What was your experience? I don&#39;t thi=
nk many people have tried it yet. Do you think this could be made to work o=
n macOS? at least the non-dmabuf support should work, as long as Gtk4 has g=
ood macOS support. I don&#39;t know if dmabuf or similar exist there, any i=
dea?<br>
&gt;&gt;<br>
&gt;&gt; I tested it on Fedora. I think it would probably work on macOS but=
<br>
&gt;&gt; maybe require some tweaks. IOSurface is a counterpart of DMA-BUF i=
n<br>
&gt;&gt; macOS but its situation is bad; it must be delivered via macOS&#39=
;s own<br>
&gt;&gt; IPC mechanisms (Mach port and XPC), but they are for server-client=
<br>
&gt;&gt; model and not for P2P. fileport mechanism allows to convert Mach p=
ort<br>
&gt;&gt; to file descriptor, but it is not documented. (In reality, I think=
 all<br>
&gt;&gt; of the major browsers, Chromium, Firefox and Safari use fileport f=
or<br>
&gt;&gt; this purpose. Apple should really document it if they use it for t=
heir<br>
&gt;&gt; app.) It is also possible to share IOSurface with a global number,=
 but<br>
&gt;&gt; it can be brute-forced and is insecure.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Thanks, the Gtk developers might have some clue. They have been workin=
g on improving macOS support, and it can use opengl now (<a href=3D"https:/=
/blogs.gnome.org/chergert/2020/12/15/gtk-4-got-a-new-macos-backend-now-with=
-opengl/" rel=3D"noreferrer" target=3D"_blank">https://blogs.gnome.org/cher=
gert/2020/12/15/gtk-4-got-a-new-macos-backend-now-with-opengl/</a>).<br>
<br>
They don&#39;t need IPC for passing textures so that is a different story.<=
br></blockquote><div><br></div><div>Yes but they have web-engine and video =
decoding concerns (beside qemu/dmabuf gtk display they should be aware of).=
=C2=A0 I&#39;ll try to reach Christian about it.<br></div><div>=C2=A0</div>=
<div>thanks</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Akihiko Odaki<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; Marc-Andr=C3=A9 Lureau<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Marc-Andr=C3=A9 Lureau<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000bbe20605d83a3574--

