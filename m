Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025D64D2A4E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 09:03:50 +0100 (CET)
Received: from localhost ([::1]:34098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRrIS-0001su-K1
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 03:03:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRrHT-0001CF-SU
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:02:47 -0500
Received: from [2a00:1450:4864:20::32d] (port=34435
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRrHR-0006oX-VX
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:02:47 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 k8-20020a05600c1c8800b003899c7ac55dso2197287wms.1
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 00:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sbEJJ0INRFPZAJolmpXIRrpkvHpGqBObnZVULbtzaIA=;
 b=quBbdoV5qMdiuj4kVXPnPQJiH/9yeaaiAPsPaNShyPGi435bCkPrA+ihrhbXyvoJzX
 6+kZ0Rd08lJprFpfY2JAMwL6ul3gepCisJh1PaGTBm/RWnnxi33Zj0E0iaxEo7dRGLWh
 vZ84RUNrm54fLCc4WrQq5+p1iBowMML6Bsaw3fPOokqMKINP/Sce6NmKxfwU92Z71b67
 fsGWDMffomN/mGOUZkhfAMODeSMTCvbI0w3gdzHe+aSPieZ6v91/F1Of6JcKHLazeKrz
 faEzB5qsfYx7WZEhHyBi0nBGZGhPiGsPpvCLHh+p0tRi0YKE84sLg8swn9LX+Y0IZXus
 /0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sbEJJ0INRFPZAJolmpXIRrpkvHpGqBObnZVULbtzaIA=;
 b=BYPzhBxUykVIDlVS3xh1XJw+VQ61XZDOBEGhH6J6DAt/qLfMVypeRrLsUSvsUOtmwb
 DKOZbU1l0+x0KUzXOpbdWxTKW6jtzWJVaXXj5GdeT6H6/VXcmE19TkP/AW5xAR3cbY8V
 Vxukj1VcGlYwpRBv7vOZynhooyHVU+vZ+lUjIdVG4JLBRlzFtAH1xTCWKDLaq3wHQzl9
 nKtWIGGb+v2fspOaSm1An/YELYdDCJHDa6FVKfibGB4yRKZls/CNmjdW/LwKoetATf6v
 wTqOMg6ERagdTnEBVzpHxI7/62AmcHLT4bGSpuFlhz0i4FaRNJyQmOODOF3gXcLilfPj
 /lxQ==
X-Gm-Message-State: AOAM532cEDf9WK9oxOvQE+k02Xy9NnqcRuit+PyAzSrqY7UoRMP2X7MY
 QKlgsJS3aZ5Seqe6wG/VAZl+ab6/G7S2rP60Hy4=
X-Google-Smtp-Source: ABdhPJxT5kkk0mp6+puew35e2MjKV0j0cdL9dIr0lZLhJYqKcFEerCaIeyKGixzXXHlbLCnhncd714tURa0wIx1XaUo=
X-Received: by 2002:a05:600c:1c9f:b0:389:cf43:da64 with SMTP id
 k31-20020a05600c1c9f00b00389cf43da64mr2352988wms.206.1646812964237; Wed, 09
 Mar 2022 00:02:44 -0800 (PST)
MIME-Version: 1.0
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
 <20220307074632.238049-13-marcandre.lureau@redhat.com>
 <c80fde18-bb3e-e780-356c-f935e7390e4d@gmail.com>
 <CAMxuvaw_QT4wEGLZRNJEd1m-58JV-8AOc6CHKkMw4i_yrVNgew@mail.gmail.com>
 <28ef9b06-3225-112f-b664-176e67c824d9@gmail.com>
 <CAMxuvaz3+ySgiOxawVT=P7x4ikDcap0o5Ux78_HdewL0XXa5Kg@mail.gmail.com>
 <d7df9ba7-40db-7b2a-63d7-eacf811da4f2@gmail.com>
 <CAMxuvaxU56M9AvS9XfZWVBNYSORBTqWmZf3yteK8KfVcdh9Ltw@mail.gmail.com>
 <f06f3b30-eb9d-17c7-3bac-ee2a31c158f2@gmail.com>
 <CAMxuvawuMvxWx7xtsf=PbWnu7UypNfVWf+Bufeqbi4J=SjsU9w@mail.gmail.com>
 <1fa142fb-7988-db25-c283-a6b16278f628@gmail.com>
In-Reply-To: <1fa142fb-7988-db25-c283-a6b16278f628@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 9 Mar 2022 12:02:32 +0400
Message-ID: <CAJ+F1CLDm9+myAJdNQdU2y64Fa-2+ew2oGih_cWim1=vO=sLMw@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000beb7ad05d9c485a4"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000beb7ad05d9c485a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Mar 8, 2022 at 6:43 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On 2022/03/08 23:26, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Mon, Mar 7, 2022 at 4:49 PM Akihiko Odaki <akihiko.odaki@gmail.com>
> wrote:
> >>
> >
> > (taking notes, mostly for myself)
> >
> >>> Could you provide a failing test case or a more concrete suggestion o=
n
> >>> what to do instead? I am all ears :)
> >>>
> >>> thanks
> >>>
> >>
> >> Let me describe a more concrete case. Think that egl-headless and vnc
> >> are enabled. The guest devices are serial virtio-gpu-gl. vnc selects
> >> serial at first.
> >
> > (I am not sure how you would select serial first, but let's assume you
> did)
> >
> >>
> >> vnc uses register_displaychangelistener and console_select to switch
> >> consoles.
> >>
> >> displaychangelistener_display_console does the actual switching, and
> >> calls dpy_gfx_switch and dpy_gfx_update if con->scanout.kind is
> >> SCANOUT_SURFACE. It calls dpy_gl_scanout_texture or
> >> dpy_gl_scanout_dmabuf if con->scanout.kind is SCANOUT_TEXTURE or
> >> SCANOUT_DMABUF. It works for a OpenGL display, but it doesn't vnc in
> >> combination with egl-headless.
> >
> > (hmm, what doesn't work? With this patch, the DisplaySurface is always
> > switched, no matter what con->scanout.kind is)
> >
> >>
> >> virtio-gpu-gl starts scanning out texture. It would happen in the
> >> following sequence:
> >> 1. virtio-gpu-gl calls qemu_console_resize. con->scanout.kind will be
> >> SCANOUT_SURFACE.
> >> 2. qemu_console_resize calls dpy_gfx_switch, delivering DisplaySurface
> >> to egl-headless. con->scanout.kind will be SCANOUT_TEXTURE.
> >
> > (qemu_console_resize calls dpy_gfx_replace_surface. con.scanout.kind
> > is still SCANOUT_SURFACE)
> >
> > (It calls displaychangelistener_gfx_switch() which will call
> > egl_gfx_switch() and update the current surface)
> >
> >> 3. virtio-gpu-gl calls dpy_gl_scanout_texture. egl-headless starts
> >> rendering the texture to the DisplaySurface.
> >
> > (now con.scanout.kind becomes SCANOUT_TEXTURE)
> >
> >>
> >> In the end, the DisplaySurface will have the image rendered, and
> >> con->scanout.kind will be SCANOUT_TEXTURE.
> >
> > (so far it works as expected, right?)
> >
> >
> >
> >>
> >> Now vnc switches to virtio-gpu-gl.
> >>
> >> 4. vnc calls console_select
> >> 5. displaychangelistener_display_console finds con->scanout.kind is
> >> SCANOUT_TEXTURE so it tries to scanout texture, but vnc is not an Open=
GL
> >> display. It essentially becomes no-op and the display would be blank.
> >>
> >> This patch will change it to call dpy_gfx_switch but not to call
> >> dpy_gfx_update.
> >
> > Alright, I think I see what you mean. egl-headless is associated with
> > a specific con, and thus is not involved during vnc console switching.
> >
> > However, dpy_gfx_switch on vnc is not a no-op. It updates the surface,
> > resize the client and mark the area dirty. Because the con.surface is
> > kept updated by egl-headless, the client gets the updated content.
> > Iow, it still works.
> >
> > If we always called dpy_gfx_update() during
> > displaychangelistener_display_console(), it would mean for the
> > listener to display the surface content, even when the scanout kind is
> > set for a texture. Or we need to change the behaviour of
> > dpy_gfx_update() to depend on the current scanout kind.
>
> vnc has to display the surface content so dpy_gfx_update should be
> called for vnc, but not for OpenGL displays.
>
>
VNC already marks the whole surface as dirty during vnc_dpy_switch(). This
is like calling dpy_gfx_update().


--=20
Marc-Andr=C3=A9 Lureau

--000000000000beb7ad05d9c485a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 8, 2022 at 6:43 PM Akih=
iko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 2022/03/08 23:26, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Mon, Mar 7, 2022 at 4:49 PM Akihiko Odaki &lt;<a href=3D"mailto:aki=
hiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt; wro=
te:<br>
&gt;&gt;<br>
&gt; <br>
&gt; (taking notes, mostly for myself)<br>
&gt; <br>
&gt;&gt;&gt; Could you provide a failing test case or a more concrete sugge=
stion on<br>
&gt;&gt;&gt; what to do instead? I am all ears :)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; thanks<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Let me describe a more concrete case. Think that egl-headless and =
vnc<br>
&gt;&gt; are enabled. The guest devices are serial virtio-gpu-gl. vnc selec=
ts<br>
&gt;&gt; serial at first.<br>
&gt; <br>
&gt; (I am not sure how you would select serial first, but let&#39;s assume=
 you did)<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; vnc uses register_displaychangelistener and console_select to swit=
ch<br>
&gt;&gt; consoles.<br>
&gt;&gt;<br>
&gt;&gt; displaychangelistener_display_console does the actual switching, a=
nd<br>
&gt;&gt; calls dpy_gfx_switch and dpy_gfx_update if con-&gt;scanout.kind is=
<br>
&gt;&gt; SCANOUT_SURFACE. It calls dpy_gl_scanout_texture or<br>
&gt;&gt; dpy_gl_scanout_dmabuf if con-&gt;scanout.kind is SCANOUT_TEXTURE o=
r<br>
&gt;&gt; SCANOUT_DMABUF. It works for a OpenGL display, but it doesn&#39;t =
vnc in<br>
&gt;&gt; combination with egl-headless.<br>
&gt; <br>
&gt; (hmm, what doesn&#39;t work? With this patch, the DisplaySurface is al=
ways<br>
&gt; switched, no matter what con-&gt;scanout.kind is)<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; virtio-gpu-gl starts scanning out texture. It would happen in the<=
br>
&gt;&gt; following sequence:<br>
&gt;&gt; 1. virtio-gpu-gl calls qemu_console_resize. con-&gt;scanout.kind w=
ill be<br>
&gt;&gt; SCANOUT_SURFACE.<br>
&gt;&gt; 2. qemu_console_resize calls dpy_gfx_switch, delivering DisplaySur=
face<br>
&gt;&gt; to egl-headless. con-&gt;scanout.kind will be SCANOUT_TEXTURE.<br>
&gt; <br>
&gt; (qemu_console_resize calls dpy_gfx_replace_surface. con.scanout.kind<b=
r>
&gt; is still SCANOUT_SURFACE)<br>
&gt; <br>
&gt; (It calls displaychangelistener_gfx_switch() which will call<br>
&gt; egl_gfx_switch() and update the current surface)<br>
&gt; <br>
&gt;&gt; 3. virtio-gpu-gl calls dpy_gl_scanout_texture. egl-headless starts=
<br>
&gt;&gt; rendering the texture to the DisplaySurface.<br>
&gt; <br>
&gt; (now con.scanout.kind becomes SCANOUT_TEXTURE)<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; In the end, the DisplaySurface will have the image rendered, and<b=
r>
&gt;&gt; con-&gt;scanout.kind will be SCANOUT_TEXTURE.<br>
&gt; <br>
&gt; (so far it works as expected, right?)<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Now vnc switches to virtio-gpu-gl.<br>
&gt;&gt;<br>
&gt;&gt; 4. vnc calls console_select<br>
&gt;&gt; 5. displaychangelistener_display_console finds con-&gt;scanout.kin=
d is<br>
&gt;&gt; SCANOUT_TEXTURE so it tries to scanout texture, but vnc is not an =
OpenGL<br>
&gt;&gt; display. It essentially becomes no-op and the display would be bla=
nk.<br>
&gt;&gt;<br>
&gt;&gt; This patch will change it to call dpy_gfx_switch but not to call<b=
r>
&gt;&gt; dpy_gfx_update.<br>
&gt; <br>
&gt; Alright, I think I see what you mean. egl-headless is associated with<=
br>
&gt; a specific con, and thus is not involved during vnc console switching.=
<br>
&gt; <br>
&gt; However, dpy_gfx_switch on vnc is not a no-op. It updates the surface,=
<br>
&gt; resize the client and mark the area dirty. Because the con.surface is<=
br>
&gt; kept updated by egl-headless, the client gets the updated content.<br>
&gt; Iow, it still works.<br>
&gt; <br>
&gt; If we always called dpy_gfx_update() during<br>
&gt; displaychangelistener_display_console(), it would mean for the<br>
&gt; listener to display the surface content, even when the scanout kind is=
<br>
&gt; set for a texture. Or we need to change the behaviour of<br>
&gt; dpy_gfx_update() to depend on the current scanout kind.<br>
<br>
vnc has to display the surface content so dpy_gfx_update should be <br>
called for vnc, but not for OpenGL displays.<br>
<br></blockquote><div><br></div><div>VNC already marks the whole surface as=
 dirty during vnc_dpy_switch(). This is like calling dpy_gfx_update(). <br>=
</div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_si=
gnature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000beb7ad05d9c485a4--

