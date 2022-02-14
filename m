Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A464B5ACA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 21:00:15 +0100 (CET)
Received: from localhost ([::1]:44776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJhWB-0001ZT-1y
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 15:00:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nJhM4-0006Fy-Je
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:49:48 -0500
Received: from [2a00:1450:4864:20::429] (port=36544
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nJhM1-0006Cp-SF
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 14:49:48 -0500
Received: by mail-wr1-x429.google.com with SMTP id o24so25962923wro.3
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 11:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=slgnHdZGO4E/roCnCLmDOBwUNhF4WQjsfdaSsa27rJQ=;
 b=UdLkJPqcGbySMETLyV0UocWLzmpGrXRJU7fynQuKZRfC1ok78V9uat+6qI36yR5UeX
 HP0hX1idlG157Z9bfiwRnNKxh4UhWqAP0yIigk8FL6e7BKIzbgmn65l5N0DlaXpBePd8
 HdKgVxhBIp2AYN+py7WLYA3iRgdZrO3GV4+Nz7LTxI4wdIgDnCRjE0KFc8nVFv5IINOl
 4l9MpRo/W9I1aC8SrpMteqSPC91p3/kNHPVdOXzuzuz/eBQKJ/5nwsu2LZdmE48iz1oc
 Jlwcn2W2Xwd9nYdMYtCOm9Py+lUJQHIptO5ZJP4PmPZWkW3CcmiPt2VinWgdUXU9coPS
 Z+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=slgnHdZGO4E/roCnCLmDOBwUNhF4WQjsfdaSsa27rJQ=;
 b=rFmRZCG/E6HRKUfQMuBCqC6HoxuaMyPG99FaKgGHtIOW7Yeu+8zI5QM0yqcapYUm6N
 NGmv61YItJZRLDGDpbeHh5/2GLGYPYNvo5mVLg0vrDQtTzAb595yZuQOtMvzF2quMAbP
 iwpNTOZV6rrZIQy0HeOVbenhxdioZQjY7zzJ/PtK3rZvPaZEoJ8hpqKBfP62ofm23uuB
 Y/rvLi7mUqW6vWoIrnGf1GZohJ7a+aYWnoyMtPz0SXliD6gX+RVLyPLQfrFem2G1+Mz4
 nc2I6mTEL5ulaZIJynUxrYV+wAvnFM4IdcG3pxGVABFstfbMZPWkXmtpaJM+yNc70/b0
 WbvQ==
X-Gm-Message-State: AOAM532jaNSxMo/kWVxvlj5VkoX6f+7uRhFwmfBCBttv6pR4Si4ucJ2P
 HMo8/LEx2dO/ol2rPRYif5kDUbiRVAZ56YzxAPQ=
X-Google-Smtp-Source: ABdhPJzH45IB8mPzhlc8+E6vNnWUcjud0acGhyGQiaewtYCyyoC52bV8cn2vLqMML3n+Rei6QIzYPISapRy/kTAzIFY=
X-Received: by 2002:adf:ab16:: with SMTP id q22mr470992wrc.436.1644868183914; 
 Mon, 14 Feb 2022 11:49:43 -0800 (PST)
MIME-Version: 1.0
References: <20220213024222.3548-1-akihiko.odaki@gmail.com>
 <CAJ+F1C+3NyD+8Z8XGLBDLDGMfXh+MG+SOB_OY=ZXyLRHHNDTfg@mail.gmail.com>
 <CAMVc7JXcUNNnD75f3VO5Vy+MyUfKQhBkM-xHqrXMDUGoh4ALKA@mail.gmail.com>
In-Reply-To: <CAMVc7JXcUNNnD75f3VO5Vy+MyUfKQhBkM-xHqrXMDUGoh4ALKA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 14 Feb 2022 23:49:31 +0400
Message-ID: <CAJ+F1CKxwycO56NNFtZV8-anadCEOxYY3vwZ1xx+_v2y-z8XgA@mail.gmail.com>
Subject: Re: [PATCH 0/6] ui/dbus: Share one listener for a console
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000cdfd0605d7ffb793"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cdfd0605d7ffb793
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Feb 14, 2022 at 5:15 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On Mon, Feb 14, 2022 at 9:07 PM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi Akihiko
> >
> > On Sun, Feb 13, 2022 at 6:44 AM Akihiko Odaki <akihiko.odaki@gmail.com>
> wrote:
> >>
> >> ui/dbus required to have multiple DisplayChangeListeners (possibly wit=
h
> OpenGL)
> >> for a console but that caused several problems:
> >> - It broke egl-headless, an unusual display which implements OpenGL
> rendering
> >>   for non-OpenGL displays. The code to support multiple
> DisplayChangeListeners
> >>   does not consider the case where non-OpenGL displays listens OpenGL
> consoles.
> >
> >
> > Can you provide instructions on what broke? Even better write a test,
> please.
>
> The following command segfaults. Adding a test would be nice, but it
> would need a binary which uses OpenGL.
> qemu-system-x86_64 -device virtio-gpu-gl-pci -display egl-headless
> -vnc :0 -m 8G -cdrom Fedora-Workstation-Live-x86_64-34-1.2.iso -accel
> kvm
>

Thanks!

This is clearly a mistake from commit 7cc712e98 ("ui: dispatch GL events to
all listener").

It should have taken into account that some listeners do not have GL
callbacks, and guard the call.

We should wrap the missing ops->dpy_gl_call() with a if (ops->dpy_gl_call)
? I'll send a patch for that.

>
> > "make check-avocado AVOCADO_TESTS=3Dtests/avocado/virtio-gpu.py", which
> covers egl-headless usage, works.
> >
> >>
> >> - Multiple OpenGL DisplayChangeListeners of dbus shares one
> DisplaySurface and
> >>   modifies its texture field, causing OpenGL texture leak and
> use-after-free.
> >
> >
> > Again, please provide instructions. I have regularly run -display dbus
> with multiple clients and qemu compiled with sanitizers. I don't see any
> leak or use after free.
>
> I doubt sanitizers can find this because it is an OpenGL texture. You
> may add a probe around surface_gl_create_texture and
> surface_gl_destroy_texture.
>

Indeed, a surface is created on each frame, because we create a 2d surface
on each qemu_console_resize(), which is called at each virgl scanout. This
is a regression introduced by commit ebced09185 ("console: save current
scanout details"). I can propose an easy fix, please check it.

And the root of the leak is actually surface_gl_create_texutre(), it should
be idempotent, just like destroy().


> >
> >>
> >> - Introduced extra code to check the compatibility of OpenGL context
> providers
> >>   and OpenGL texture renderers where those are often inherently tightl=
y
> coupled
> >>   since they must share the same hardware.
> >
> >
> > So code checks are meant to prevent misusage. They might be too limited
> or broken in some ways, but reverting is likely going to introduce other
> regressions I was trying to fix.
>
> The misuse will not occur because DisplayChangeListeners will be
> merged with OpenGL context providers.
>

Ok, but aren't the checks enough to prevent it already? I have to check the
use cases and differences of design, but you might be right that we don't
need such a split after all.


> >
> >> - Needed extra work to broadcast the same change to multiple dbus
> listeners.
> >>
> >
> > Compared to what?
>
> Compared to sharing one DisplayChangeListener for multiple dbus listeners=
.
>

Well, you just moved the problem to the dbus display, not removed any work.

What we have currently is more generic, you should be able to add/remove
various listeners (in theory, we only really do it for dbus at this point).


>
> >
> >>
> >> This series solve them by implementing the change broadcast in ui/dbus=
,
> which
> >> knows exactly what is needed. Changes for the common code to support
> multiple
> >> OpenGL DisplayChangeListeners were reverted to fix egl-headless and
> reduce
> >> the code size.
> >
> >
> > Thanks a lot for your work, I am going to take a look at your approach.
> But please help us understand better what the problem actually is, by
> giving examples & tests to avoid future regressions and document the
> expected behaviour.
>
> The thing is really complicated and I may miss details so please feel
> free to ask questions or provide suggestions.
>
>
Reverting changes and proposing an alternative implementation requires
detailed explanation and convincing arguments. It may take a while, but we
will try to get through the problems and evaluate the alternative designs.
Thanks again for your help!

Regards,
> Akihiko Odaki
>
>
> >
> >>
> >> Akihiko Odaki (6):
> >>   ui/dbus: Share one listener for a console
> >>   Revert "console: save current scanout details"
> >>   Revert "ui: split the GL context in a different object"
> >>   Revert "ui: dispatch GL events to all listeners"
> >>   Revert "ui: associate GL context outside of display listener
> >>     registration"
> >>   Revert "ui: factor out qemu_console_set_display_gl_ctx()"
> >>
> >>  include/ui/console.h       |  60 +-----
> >>  include/ui/egl-context.h   |   6 +-
> >>  include/ui/gtk.h           |  11 +-
> >>  include/ui/sdl2.h          |   7 +-
> >>  include/ui/spice-display.h |   1 -
> >>  ui/console.c               | 258 +++++++----------------
> >>  ui/dbus-console.c          | 109 ++--------
> >>  ui/dbus-listener.c         | 417 +++++++++++++++++++++++++++---------=
-
> >>  ui/dbus.c                  |  22 --
> >>  ui/dbus.h                  |  36 +++-
> >>  ui/egl-context.c           |   6 +-
> >>  ui/egl-headless.c          |  20 +-
> >>  ui/gtk-egl.c               |  10 +-
> >>  ui/gtk-gl-area.c           |   8 +-
> >>  ui/gtk.c                   |  25 +--
> >>  ui/sdl2-gl.c               |  10 +-
> >>  ui/sdl2.c                  |  14 +-
> >>  ui/spice-display.c         |  19 +-
> >>  18 files changed, 498 insertions(+), 541 deletions(-)
> >>
> >> --
> >> 2.32.0 (Apple Git-132)
> >>
> >>
> >
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000cdfd0605d7ffb793
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 14, 2022 at 5:15 PM Aki=
hiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank"=
>akihiko.odaki@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Mon, Feb 14, 2022 at 9:07 PM Marc-Andr=C3=A9 Lur=
eau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Akihiko<br>
&gt;<br>
&gt; On Sun, Feb 13, 2022 at 6:44 AM Akihiko Odaki &lt;<a href=3D"mailto:ak=
ihiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; ui/dbus required to have multiple DisplayChangeListeners (possibly=
 with OpenGL)<br>
&gt;&gt; for a console but that caused several problems:<br>
&gt;&gt; - It broke egl-headless, an unusual display which implements OpenG=
L rendering<br>
&gt;&gt;=C2=A0 =C2=A0for non-OpenGL displays. The code to support multiple =
DisplayChangeListeners<br>
&gt;&gt;=C2=A0 =C2=A0does not consider the case where non-OpenGL displays l=
istens OpenGL consoles.<br>
&gt;<br>
&gt;<br>
&gt; Can you provide instructions on what broke? Even better write a test, =
please.<br>
<br>
The following command segfaults. Adding a test would be nice, but it<br>
would need a binary which uses OpenGL.<br>
qemu-system-x86_64 -device virtio-gpu-gl-pci -display egl-headless<br>
-vnc :0 -m 8G -cdrom Fedora-Workstation-Live-x86_64-34-1.2.iso -accel<br>
kvm<br></blockquote><div><br></div><div>Thanks!</div><div><br></div><div>Th=
is is clearly a mistake from commit 7cc712e98 (&quot;ui: dispatch GL events=
 to all listener&quot;).</div><div><br></div><div>It should have taken into=
 account that some listeners do not have GL callbacks, and guard the call.<=
/div><div><br></div><div>We should wrap the missing ops-&gt;dpy_gl_call() w=
ith a if (ops-&gt;dpy_gl_call) ? I&#39;ll send a patch for that.<br></div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; &quot;make check-avocado AVOCADO_TESTS=3Dtests/avocado/virtio-gpu.py&q=
uot;, which covers egl-headless usage, works.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; - Multiple OpenGL DisplayChangeListeners of dbus shares one Displa=
ySurface and<br>
&gt;&gt;=C2=A0 =C2=A0modifies its texture field, causing OpenGL texture lea=
k and use-after-free.<br>
&gt;<br>
&gt;<br>
&gt; Again, please provide instructions. I have regularly run -display dbus=
 with multiple clients and qemu compiled with sanitizers. I don&#39;t see a=
ny leak or use after free.<br>
<br>
I doubt sanitizers can find this because it is an OpenGL texture. You<br>
may add a probe around surface_gl_create_texture and<br>
surface_gl_destroy_texture.<br></blockquote><div><br></div><div>Indeed, a s=
urface is created on each frame, because we create a 2d surface on each qem=
u_console_resize(), which is called at each virgl scanout. This is a regres=
sion introduced by commit ebced09185 (&quot;console: save current scanout d=
etails&quot;). I can propose an easy fix, please check it.<br></div><div><b=
r></div><div>And the root of the leak is actually surface_gl_create_texutre=
(), it should be idempotent, just like destroy().</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; - Introduced extra code to check the compatibility of OpenGL conte=
xt providers<br>
&gt;&gt;=C2=A0 =C2=A0and OpenGL texture renderers where those are often inh=
erently tightly coupled<br>
&gt;&gt;=C2=A0 =C2=A0since they must share the same hardware.<br>
&gt;<br>
&gt;<br>
&gt; So code checks are meant to prevent misusage. They might be too limite=
d or broken in some ways, but reverting is likely going to introduce other =
regressions I was trying to fix.<br>
<br>
The misuse will not occur because DisplayChangeListeners will be<br>
merged with OpenGL context providers.<br></blockquote><div><br></div><div>O=
k, but aren&#39;t the checks enough to prevent it already? I have to check =
the use cases and differences of design, but you might be right that we don=
&#39;t need such a split after all.<br></div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt;&gt; - Needed extra work to broadcast the same change to multiple dbus =
listeners.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Compared to what?<br>
<br>
Compared to sharing one DisplayChangeListener for multiple dbus listeners.<=
br></blockquote><div><br></div><div>Well, you just moved the problem to the=
 dbus display, not removed any work.</div><div><br></div><div>What we have =
currently is more generic, you should be able to add/remove various listene=
rs (in theory, we only really do it for dbus at this point).<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; This series solve them by implementing the change broadcast in ui/=
dbus, which<br>
&gt;&gt; knows exactly what is needed. Changes for the common code to suppo=
rt multiple<br>
&gt;&gt; OpenGL DisplayChangeListeners were reverted to fix egl-headless an=
d reduce<br>
&gt;&gt; the code size.<br>
&gt;<br>
&gt;<br>
&gt; Thanks a lot for your work, I am going to take a look at your approach=
. But please help us understand better what the problem actually is, by giv=
ing examples &amp; tests to avoid future regressions and document the expec=
ted behaviour.<br>
<br>
The thing is really complicated and I may miss details so please feel<br>
free to ask questions or provide suggestions.<br>
<br></blockquote><div><br></div><div>Reverting changes and proposing an alt=
ernative implementation requires detailed explanation and convincing argume=
nts. It may take a while, but we will try to get through the problems and e=
valuate the alternative designs. Thanks again for your help!</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
Regards,<br>
Akihiko Odaki<br>
<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Akihiko Odaki (6):<br>
&gt;&gt;=C2=A0 =C2=A0ui/dbus: Share one listener for a console<br>
&gt;&gt;=C2=A0 =C2=A0Revert &quot;console: save current scanout details&quo=
t;<br>
&gt;&gt;=C2=A0 =C2=A0Revert &quot;ui: split the GL context in a different o=
bject&quot;<br>
&gt;&gt;=C2=A0 =C2=A0Revert &quot;ui: dispatch GL events to all listeners&q=
uot;<br>
&gt;&gt;=C2=A0 =C2=A0Revert &quot;ui: associate GL context outside of displ=
ay listener<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0registration&quot;<br>
&gt;&gt;=C2=A0 =C2=A0Revert &quot;ui: factor out qemu_console_set_display_g=
l_ctx()&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 include/ui/console.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 60 +-=
----<br>
&gt;&gt;=C2=A0 include/ui/egl-context.h=C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;&gt;=C2=A0 include/ui/gtk.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 11 +-<br>
&gt;&gt;=C2=A0 include/ui/sdl2.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A07 +-<br>
&gt;&gt;=C2=A0 include/ui/spice-display.h |=C2=A0 =C2=A01 -<br>
&gt;&gt;=C2=A0 ui/console.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 258 +++++++----------------<br>
&gt;&gt;=C2=A0 ui/dbus-console.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 109 ++=
--------<br>
&gt;&gt;=C2=A0 ui/dbus-listener.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 417 ++=
+++++++++++++++++++++++++----------<br>
&gt;&gt;=C2=A0 ui/dbus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 22 --<br>
&gt;&gt;=C2=A0 ui/dbus.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 36 +++-<br>
&gt;&gt;=C2=A0 ui/egl-context.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +-<br>
&gt;&gt;=C2=A0 ui/egl-headless.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
20 +-<br>
&gt;&gt;=C2=A0 ui/gtk-egl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 10 +-<br>
&gt;&gt;=C2=A0 ui/gtk-gl-area.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A08 +-<br>
&gt;&gt;=C2=A0 ui/gtk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 25 +--<br>
&gt;&gt;=C2=A0 ui/sdl2-gl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 10 +-<br>
&gt;&gt;=C2=A0 ui/sdl2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 14 +-<br>
&gt;&gt;=C2=A0 ui/spice-display.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
19 +-<br>
&gt;&gt;=C2=A0 18 files changed, 498 insertions(+), 541 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.32.0 (Apple Git-132)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Marc-Andr=C3=A9 Lureau<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000cdfd0605d7ffb793--

