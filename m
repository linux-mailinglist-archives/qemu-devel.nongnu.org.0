Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896C84BA587
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 17:16:40 +0100 (CET)
Received: from localhost ([::1]:44392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKjSR-0005F1-JD
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 11:16:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nKjOi-0003KN-P8
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 11:12:48 -0500
Received: from [2a00:1450:4864:20::32b] (port=40760
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nKjOf-0000Ua-Uv
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 11:12:48 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso6574999wme.5
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 08:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8WTkcRYmgZUVZa4IeKSoK0N+zCa4KDzBPFbFpLIf1bo=;
 b=bAc1RcOIGK22K4PpG+IjXbHpetJiRLMHWSjnihe7/xcA2iYI/Wxg60YT6ZAQi8dGGk
 Qz4OqBPMQE8s/7lbuasN+UAkdtSjOWQCrU6Q42//um6LxXmgaeQAcn023uB4vbcg+Mq7
 9IsVNed/FcXq4yw8GxAwb+xNg+SvXLvHXuAsGtm+sTxvV6LuDWpfM3YUfwtJeNCc4LKU
 WMXL/zzyhYV1njCzHI3d44LYIBspj5ILrOF2Yr3rL6lKMu6cGWS2gdSK1Nj1N6KJJmRl
 rVuIyWNBeF3MvJXIPTrzpcNpBTLI97tKfyz8V4tzS7la7uqJuB8WLfGRmrQZOHa1QfGm
 x2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8WTkcRYmgZUVZa4IeKSoK0N+zCa4KDzBPFbFpLIf1bo=;
 b=OX5lS/9Y9wt2xudoWR0XfLj5h8lDls02GvVd7km3vHdv/aJaPlHy0vEbZTMbFvOPcl
 Kv57nnvquGGIWe8Vr/n/7lDm9+j87Vu4BV6BzbvOgNXFlycnX7fpx6UT3o4T+u1tF5R3
 lp9hqP2xxgcciQPnW2uu17kj8z+LJGhmU+/Rc3QnBfW6h8BaSTBJ4qlfZCa9QNwcq6Eq
 rkY7AY/0KaTs0E8UiECnb3z0PQ6akre2k4ZHY2r4UY2VFTNzIqMSg+7+j+mtO08zHLLF
 hfb/qJZ+sRi4yusHD1gCc/LwF4PIX1Ia2fS80CDFdhdLvJJQrurV2jcDCaGg81lPB9kf
 GEjw==
X-Gm-Message-State: AOAM533txGMN+NwCw2sJoSNO0vdO9aiJEZKCavY1zdEBcMVBXZH2wOXy
 +OMl+a9vb8s+TK8OBEEhrK9V19Ibait7j2Pcclw=
X-Google-Smtp-Source: ABdhPJxNE8ifcTuOop6voecZHGaxmA04L1IDWxZr8Iw/ALlEbpthZESM0iAR6T1jK9KTr+/RM0PcTcIdNqhdR3r3V80=
X-Received: by 2002:a05:600c:4782:b0:37b:f836:78c7 with SMTP id
 k2-20020a05600c478200b0037bf83678c7mr6650473wmo.129.1645114363679; Thu, 17
 Feb 2022 08:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
 <CAMVc7JVOJxkqLpvRu7JLNP48C5Kmu0JRYUSR8xP+dAtGp_n=_A@mail.gmail.com>
In-Reply-To: <CAMVc7JVOJxkqLpvRu7JLNP48C5Kmu0JRYUSR8xP+dAtGp_n=_A@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 17 Feb 2022 20:12:31 +0400
Message-ID: <CAJ+F1CKgvcA97kLdxVodSoAFbk1_kB3_po8vn4kX_gPZgKYxbg@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] GL & D-Bus display related fixes
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004316c005d839095c"
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

--0000000000004316c005d839095c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Feb 17, 2022 at 5:09 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On Thu, Feb 17, 2022 at 8:58 PM <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Hi,
> >
> > In the thread "[PATCH 0/6] ui/dbus: Share one listener for a console",
> Akihiko
> > Odaki reported a number of issues with the GL and D-Bus display. His
> series
> > propose a different design, and reverting some of my previous generic
> console
> > changes to fix those issues.
> >
> > However, as I work through the issue so far, they can be solved by
> reasonable
> > simple fixes while keeping the console changes generic (not specific to
> the
> > D-Bus display backend). I belive a shared infrastructure is more
> beneficial long
> > term than having GL-specific code in the DBus code (in particular, the
> > egl-headless & VNC combination could potentially use it)
> >
> > Thanks a lot Akihiko for reporting the issues proposing a different
> approach!
> > Please test this alternative series and let me know of any further
> issues. My
> > understanding is that you are mainly concerned with the Cocoa backend,
> and I
> > don't have a way to test it, so please check it. If necessary, we may
> well have
> > to revert my earlier changes and go your way, eventually.
> >
> > Marc-Andr=C3=A9 Lureau (12):
> >   ui/console: fix crash when using gl context with non-gl listeners
> >   ui/console: fix texture leak when calling surface_gl_create_texture()
> >   ui: do not create a surface when resizing a GL scanout
> >   ui/console: move check for compatible GL context
> >   ui/console: move dcl compatiblity check to a callback
> >   ui/console: egl-headless is compatible with non-gl listeners
> >   ui/dbus: associate the DBusDisplayConsole listener with the given
> >     console
> >   ui/console: move console compatibility check to dcl_display_console()
> >   ui/shader: fix potential leak of shader on error
> >   ui/shader: free associated programs
> >   ui/console: add a dpy_gfx_switch callback helper
> >   ui/dbus: fix texture sharing
> >
> >  include/ui/console.h |  19 ++++---
> >  ui/dbus.h            |   3 ++
> >  ui/console-gl.c      |   4 ++
> >  ui/console.c         | 119 ++++++++++++++++++++++++++-----------------
> >  ui/dbus-console.c    |  27 +++++-----
> >  ui/dbus-listener.c   |  11 ----
> >  ui/dbus.c            |  33 +++++++++++-
> >  ui/egl-headless.c    |  17 ++++++-
> >  ui/gtk.c             |  18 ++++++-
> >  ui/sdl2.c            |   9 +++-
> >  ui/shader.c          |   9 +++-
> >  ui/spice-display.c   |   9 +++-
> >  12 files changed, 192 insertions(+), 86 deletions(-)
> >
> > --
> > 2.34.1.428.gdcc0cd074f0c
> >
> >
>
> You missed only one thing:
> >- that console_select and register_displaychangelistener may not call
> > dpy_gfx_switch and call dpy_gl_scanout_texture instead. It is
> > incompatible with non-OpenGL displays
>
> displaychangelistener_display_console always has to call
> dpy_gfx_switch for non-OpenGL displays, but it still doesn't.
>

Ok, would that be what you have in mind?

 --- a/ui/console.c
+++ b/ui/console.c
@@ -1122,6 +1122,10 @@ static void
displaychangelistener_display_console(DisplayChangeListener *dcl,
     } else if (con->scanout.kind =3D=3D SCANOUT_SURFACE) {
         dpy_gfx_create_texture(con, con->surface);
         displaychangelistener_gfx_switch(dcl, con->surface);
+    } else {
+        /* use the fallback surface, egl-headless keeps it updated */
+        assert(con->surface);
+        displaychangelistener_gfx_switch(dcl, con->surface);
     }

I wish such egl-headless specific code would be there, but we would need
more refactoring.

I think I would rather have a backend split for GL context, like "-object
egl-context". egl-headless-specific copy code would be handled by
common/util code for anything that wants a pixman surface (VNC, screen
capture, non-GL display etc).

This split would allow sharing the context code, and introduce other system
specific GL initialization, such as WGL etc. Right now, I doubt the EGL
code works on anything but Linux.


> Anything else should be addressed with this patch series. (And it also
> has nice fixes for shader leaks.)
>

thanks


>
> cocoa doesn't have OpenGL output and egl-headless, the cause of many
> pains addressed here, does not work on macOS so you need little
> attention. I have an out-of-tree OpenGL support for cocoa but it is
> out-of-tree anyway and I can fix it anytime.
>

Great!

btw, I suppose you checked your DBus changes against the WIP "qemu-display"
project. What was your experience? I don't think many people have tried it
yet. Do you think this could be made to work on macOS? at least the
non-dmabuf support should work, as long as Gtk4 has good macOS support. I
don't know if dmabuf or similar exist there, any idea?


--=20
Marc-Andr=C3=A9 Lureau

--0000000000004316c005d839095c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 17, 2022 at 5:09 PM Aki=
hiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Thu, Feb 17, 2022 at 8:58 PM &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; In the thread &quot;[PATCH 0/6] ui/dbus: Share one listener for a cons=
ole&quot;, Akihiko<br>
&gt; Odaki reported a number of issues with the GL and D-Bus display. His s=
eries<br>
&gt; propose a different design, and reverting some of my previous generic =
console<br>
&gt; changes to fix those issues.<br>
&gt;<br>
&gt; However, as I work through the issue so far, they can be solved by rea=
sonable<br>
&gt; simple fixes while keeping the console changes generic (not specific t=
o the<br>
&gt; D-Bus display backend). I belive a shared infrastructure is more benef=
icial long<br>
&gt; term than having GL-specific code in the DBus code (in particular, the=
<br>
&gt; egl-headless &amp; VNC combination could potentially use it)<br>
&gt;<br>
&gt; Thanks a lot Akihiko for reporting the issues proposing a different ap=
proach!<br>
&gt; Please test this alternative series and let me know of any further iss=
ues. My<br>
&gt; understanding is that you are mainly concerned with the Cocoa backend,=
 and I<br>
&gt; don&#39;t have a way to test it, so please check it. If necessary, we =
may well have<br>
&gt; to revert my earlier changes and go your way, eventually.<br>
&gt;<br>
&gt; Marc-Andr=C3=A9 Lureau (12):<br>
&gt;=C2=A0 =C2=A0ui/console: fix crash when using gl context with non-gl li=
steners<br>
&gt;=C2=A0 =C2=A0ui/console: fix texture leak when calling surface_gl_creat=
e_texture()<br>
&gt;=C2=A0 =C2=A0ui: do not create a surface when resizing a GL scanout<br>
&gt;=C2=A0 =C2=A0ui/console: move check for compatible GL context<br>
&gt;=C2=A0 =C2=A0ui/console: move dcl compatiblity check to a callback<br>
&gt;=C2=A0 =C2=A0ui/console: egl-headless is compatible with non-gl listene=
rs<br>
&gt;=C2=A0 =C2=A0ui/dbus: associate the DBusDisplayConsole listener with th=
e given<br>
&gt;=C2=A0 =C2=A0 =C2=A0console<br>
&gt;=C2=A0 =C2=A0ui/console: move console compatibility check to dcl_displa=
y_console()<br>
&gt;=C2=A0 =C2=A0ui/shader: fix potential leak of shader on error<br>
&gt;=C2=A0 =C2=A0ui/shader: free associated programs<br>
&gt;=C2=A0 =C2=A0ui/console: add a dpy_gfx_switch callback helper<br>
&gt;=C2=A0 =C2=A0ui/dbus: fix texture sharing<br>
&gt;<br>
&gt;=C2=A0 include/ui/console.h |=C2=A0 19 ++++---<br>
&gt;=C2=A0 ui/dbus.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 ++<br>
&gt;=C2=A0 ui/console-gl.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 ++<br>
&gt;=C2=A0 ui/console.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 119 ++++++++++++=
++++++++++++++-----------------<br>
&gt;=C2=A0 ui/dbus-console.c=C2=A0 =C2=A0 |=C2=A0 27 +++++-----<br>
&gt;=C2=A0 ui/dbus-listener.c=C2=A0 =C2=A0|=C2=A0 11 ----<br>
&gt;=C2=A0 ui/dbus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 33 ++=
+++++++++-<br>
&gt;=C2=A0 ui/egl-headless.c=C2=A0 =C2=A0 |=C2=A0 17 ++++++-<br>
&gt;=C2=A0 ui/gtk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
18 ++++++-<br>
&gt;=C2=A0 ui/sdl2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A09 +++-<br>
&gt;=C2=A0 ui/shader.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 ++=
+-<br>
&gt;=C2=A0 ui/spice-display.c=C2=A0 =C2=A0|=C2=A0 =C2=A09 +++-<br>
&gt;=C2=A0 12 files changed, 192 insertions(+), 86 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.34.1.428.gdcc0cd074f0c<br>
&gt;<br>
&gt;<br>
<br>
You missed only one thing:<br>
&gt;- that console_select and register_displaychangelistener may not call<b=
r>
&gt; dpy_gfx_switch and call dpy_gl_scanout_texture instead. It is<br>
&gt; incompatible with non-OpenGL displays<br>
<br>
displaychangelistener_display_console always has to call<br>
dpy_gfx_switch for non-OpenGL displays, but it still doesn&#39;t.<br></bloc=
kquote><div><br></div><div>Ok, would that be what you have in mind?</div><d=
iv><br></div><div>=C2=A0--- a/ui/console.c<br>+++ b/ui/console.c<br>@@ -112=
2,6 +1122,10 @@ static void displaychangelistener_display_console(DisplayCh=
angeListener *dcl,<br>=C2=A0 =C2=A0 =C2=A0} else if (con-&gt;scanout.kind =
=3D=3D SCANOUT_SURFACE) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpy_gfx_crea=
te_texture(con, con-&gt;surface);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0disp=
laychangelistener_gfx_switch(dcl, con-&gt;surface);<br>+ =C2=A0 =C2=A0} els=
e {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* use the fallback surface, egl-headle=
ss keeps it updated */<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(con-&gt;surfa=
ce);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0displaychangelistener_gfx_switch(dcl, =
con-&gt;surface);<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0</div><div>I wish such =
egl-headless specific code would be there, but we would need more refactori=
ng.</div><div><br></div><div>I think I would rather have a backend split fo=
r GL context, like &quot;-object egl-context&quot;. egl-headless-specific c=
opy code would be handled by common/util code for anything that wants a pix=
man surface (VNC, screen capture, non-GL display etc).</div><div><br></div>=
<div>This split would allow sharing the context code, and introduce other s=
ystem specific GL initialization, such as WGL etc. Right now, I doubt the E=
GL code works on anything but Linux.<br></div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
Anything else should be addressed with this patch series. (And it also<br>
has nice fixes for shader leaks.)<br></blockquote><div><br></div><div>thank=
s</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
cocoa doesn&#39;t have OpenGL output and egl-headless, the cause of many<br=
>
pains addressed here, does not work on macOS so you need little<br>
attention. I have an out-of-tree OpenGL support for cocoa but it is<br>
out-of-tree anyway and I can fix it anytime.<br>
</blockquote><div><br></div><div>Great!</div><div><br></div><div>btw, I sup=
pose you checked your DBus changes against the WIP &quot;qemu-display&quot;=
 project. What was your experience? I don&#39;t think many people have trie=
d it yet. Do you think this could be made to work on macOS? at least the no=
n-dmabuf support should work, as long as Gtk4 has good macOS support. I don=
&#39;t know if dmabuf or similar exist there, any idea?<br></div></div><br =
clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-An=
dr=C3=A9 Lureau<br></div></div>

--0000000000004316c005d839095c--

