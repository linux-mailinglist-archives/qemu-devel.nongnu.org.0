Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6404BA780
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 18:52:45 +0100 (CET)
Received: from localhost ([::1]:54256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKkxQ-0008Bk-Vm
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 12:52:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKkol-0007al-Mn
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:43:47 -0500
Received: from [2607:f8b0:4864:20::c35] (port=37442
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKkoi-0006YX-TP
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:43:47 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 x6-20020a4a4106000000b003193022319cso445807ooa.4
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 09:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vMpNZf2Vzw3v7wbukLZPNIpvWBxCgu4HrQBn3SDfrVQ=;
 b=aj7nRSfWmG6+eWr+bIwEVpgqPAc8f76Ktp0fV7Q2uL2xMLTdLaHDspZ4mSNXrX7LHg
 4nW8ajM6i8w7mrsnW8jzeAWoH2Sou6scFVlhft+FfYbQsT5cYYQmUat0rmNI2I+NE0Ac
 Zn6hM42bCnnrLMHIZIF24qbFzUakUqN9pnFVdUDmi+DzxwbCBcvni0jkZTPaYLmX/HBV
 VCrUYXuiXqVWxH77vuFp7Sbx3Q8ePSeelmFaX9/5fzn3ZanZkdEq703eFun3nc1MeZeX
 yOyoHC+NTxGZTy/6oq+uHKo/jFkMqMUqCweSM3SZTe6a4WnRHZEgJsxW8o4FNwVAD4La
 lrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vMpNZf2Vzw3v7wbukLZPNIpvWBxCgu4HrQBn3SDfrVQ=;
 b=l8n2VCHxico9RowQ6jA3kgT1XF8Dlhrae+/DC1EGKQ2I8b7Wc4n/6XUJ9CQqqB1aqj
 vywTycVavtjuDo4fubSEtkrLzyzUeFrXdhwEcDSBkuZBz6hKaFRE6wwKHGwL1jXXzKkw
 SqL+lt/urUfaY35aOzD2jhgEhSGY0HLV1ftd8K7D4y5PeDwckuFXakKcHSs0NXqWQBI6
 wPdw7BRw4wbN+sy29Ptgo5qNvGFntu5YUBODqon1m5nLF29w19t8prtWmg1lqi+whVaU
 JJEYYgaQbYNS+oCoKDf6hqiy0/3OE5vMZoxHI5JP+PVCsuKStbAJ1NZZ5JRAB9dP5dQ6
 ghtQ==
X-Gm-Message-State: AOAM533lJol1bvcYkP5o0/QFzFhQTKG6AJYIBFGuUC+G6VK2llAGFHaZ
 0a4ZwfqSn1lM1i+M7kaZS/+k03JLc2k4GKSh+jtE4rFr
X-Google-Smtp-Source: ABdhPJzHNgD+FNmKzji8e8WbFo1BnPJByriv401p5udWtQHDcUf0OO3Rov7rh+uW6/Itf8nqUrKnFdY0CGpLOrU6t14=
X-Received: by 2002:a4a:8e59:0:b0:319:4823:e37b with SMTP id
 z25-20020a4a8e59000000b003194823e37bmr1139174ook.46.1645119823280; Thu, 17
 Feb 2022 09:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
 <CAMVc7JVOJxkqLpvRu7JLNP48C5Kmu0JRYUSR8xP+dAtGp_n=_A@mail.gmail.com>
 <CAJ+F1CKgvcA97kLdxVodSoAFbk1_kB3_po8vn4kX_gPZgKYxbg@mail.gmail.com>
 <CAMVc7JU1rfBEHgofiveNopLkyXRLSEG8dA=6cn_qY52BqLB3iw@mail.gmail.com>
 <CAJ+F1CJsrfL-PiPM5W4Ydp4WLMfrZOaYydUp4wrX1LbFCxiSaA@mail.gmail.com>
 <CAMVc7JVADz6A+xA7bcZOCd5Y+=2bAqyPGyxqu-Z1gawKGRtiGw@mail.gmail.com>
 <CAJ+F1CKE3utVzLGLUk8FP9D_3YMprn3fLnuq-k+EJNiSXFBj=g@mail.gmail.com>
In-Reply-To: <CAJ+F1CKE3utVzLGLUk8FP9D_3YMprn3fLnuq-k+EJNiSXFBj=g@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Fri, 18 Feb 2022 02:43:32 +0900
Message-ID: <CAMVc7JWk1Z6ZHjm4hfHRf7YvwOZpJUVrxrxDiBPxzC48182GVg@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] GL & D-Bus display related fixes
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Feb 18, 2022 at 2:36 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Thu, Feb 17, 2022 at 9:25 PM Akihiko Odaki <akihiko.odaki@gmail.com> w=
rote:
>>
>> On Fri, Feb 18, 2022 at 2:07 AM Marc-Andr=C3=A9 Lureau
>> <marcandre.lureau@gmail.com> wrote:
>> >
>> > Hi
>> >
>> > On Thu, Feb 17, 2022 at 8:39 PM Akihiko Odaki <akihiko.odaki@gmail.com=
> wrote:
>> >>
>> >> On Fri, Feb 18, 2022 at 1:12 AM Marc-Andr=C3=A9 Lureau
>> >> <marcandre.lureau@gmail.com> wrote:
>> >> >
>> >> > Hi
>> >> >
>> >> > On Thu, Feb 17, 2022 at 5:09 PM Akihiko Odaki <akihiko.odaki@gmail.=
com> wrote:
>> >> >>
>> >> >> On Thu, Feb 17, 2022 at 8:58 PM <marcandre.lureau@redhat.com> wrot=
e:
>> >> >> >
>> >> >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >> >> >
>> >> >> > Hi,
>> >> >> >
>> >> >> > In the thread "[PATCH 0/6] ui/dbus: Share one listener for a con=
sole", Akihiko
>> >> >> > Odaki reported a number of issues with the GL and D-Bus display.=
 His series
>> >> >> > propose a different design, and reverting some of my previous ge=
neric console
>> >> >> > changes to fix those issues.
>> >> >> >
>> >> >> > However, as I work through the issue so far, they can be solved =
by reasonable
>> >> >> > simple fixes while keeping the console changes generic (not spec=
ific to the
>> >> >> > D-Bus display backend). I belive a shared infrastructure is more=
 beneficial long
>> >> >> > term than having GL-specific code in the DBus code (in particula=
r, the
>> >> >> > egl-headless & VNC combination could potentially use it)
>> >> >> >
>> >> >> > Thanks a lot Akihiko for reporting the issues proposing a differ=
ent approach!
>> >> >> > Please test this alternative series and let me know of any furth=
er issues. My
>> >> >> > understanding is that you are mainly concerned with the Cocoa ba=
ckend, and I
>> >> >> > don't have a way to test it, so please check it. If necessary, w=
e may well have
>> >> >> > to revert my earlier changes and go your way, eventually.
>> >> >> >
>> >> >> > Marc-Andr=C3=A9 Lureau (12):
>> >> >> >   ui/console: fix crash when using gl context with non-gl listen=
ers
>> >> >> >   ui/console: fix texture leak when calling surface_gl_create_te=
xture()
>> >> >> >   ui: do not create a surface when resizing a GL scanout
>> >> >> >   ui/console: move check for compatible GL context
>> >> >> >   ui/console: move dcl compatiblity check to a callback
>> >> >> >   ui/console: egl-headless is compatible with non-gl listeners
>> >> >> >   ui/dbus: associate the DBusDisplayConsole listener with the gi=
ven
>> >> >> >     console
>> >> >> >   ui/console: move console compatibility check to dcl_display_co=
nsole()
>> >> >> >   ui/shader: fix potential leak of shader on error
>> >> >> >   ui/shader: free associated programs
>> >> >> >   ui/console: add a dpy_gfx_switch callback helper
>> >> >> >   ui/dbus: fix texture sharing
>> >> >> >
>> >> >> >  include/ui/console.h |  19 ++++---
>> >> >> >  ui/dbus.h            |   3 ++
>> >> >> >  ui/console-gl.c      |   4 ++
>> >> >> >  ui/console.c         | 119 ++++++++++++++++++++++++++----------=
-------
>> >> >> >  ui/dbus-console.c    |  27 +++++-----
>> >> >> >  ui/dbus-listener.c   |  11 ----
>> >> >> >  ui/dbus.c            |  33 +++++++++++-
>> >> >> >  ui/egl-headless.c    |  17 ++++++-
>> >> >> >  ui/gtk.c             |  18 ++++++-
>> >> >> >  ui/sdl2.c            |   9 +++-
>> >> >> >  ui/shader.c          |   9 +++-
>> >> >> >  ui/spice-display.c   |   9 +++-
>> >> >> >  12 files changed, 192 insertions(+), 86 deletions(-)
>> >> >> >
>> >> >> > --
>> >> >> > 2.34.1.428.gdcc0cd074f0c
>> >> >> >
>> >> >> >
>> >> >>
>> >> >> You missed only one thing:
>> >> >> >- that console_select and register_displaychangelistener may not =
call
>> >> >> > dpy_gfx_switch and call dpy_gl_scanout_texture instead. It is
>> >> >> > incompatible with non-OpenGL displays
>> >> >>
>> >> >> displaychangelistener_display_console always has to call
>> >> >> dpy_gfx_switch for non-OpenGL displays, but it still doesn't.
>> >> >
>> >> >
>> >> > Ok, would that be what you have in mind?
>> >> >
>> >> >  --- a/ui/console.c
>> >> > +++ b/ui/console.c
>> >> > @@ -1122,6 +1122,10 @@ static void displaychangelistener_display_co=
nsole(DisplayChangeListener *dcl,
>> >> >      } else if (con->scanout.kind =3D=3D SCANOUT_SURFACE) {
>> >> >          dpy_gfx_create_texture(con, con->surface);
>> >> >          displaychangelistener_gfx_switch(dcl, con->surface);
>> >> > +    } else {
>> >> > +        /* use the fallback surface, egl-headless keeps it updated=
 */
>> >> > +        assert(con->surface);
>> >> > +        displaychangelistener_gfx_switch(dcl, con->surface);
>> >> >      }
>> >>
>> >> It should call displaychangelistener_gfx_switch even when e.g.
>> >> con->scanout.kind =3D=3D SCANOUT_TEXTURE. egl-headless renders the co=
ntent
>> >> to the last DisplaySurface it received while con->scanout.kind =3D=3D
>> >> SCANOUT_TEXTURE.
>> >
>> >
>> > I see, egl-headless is really not a "listener".
>> >
>> >>
>> >> >
>> >> > I wish such egl-headless specific code would be there, but we would=
 need more refactoring.
>> >> >
>> >> > I think I would rather have a backend split for GL context, like "-=
object egl-context". egl-headless-specific copy code would be handled by co=
mmon/util code for anything that wants a pixman surface (VNC, screen captur=
e, non-GL display etc).
>> >> >
>> >> > This split would allow sharing the context code, and introduce othe=
r system specific GL initialization, such as WGL etc. Right now, I doubt th=
e EGL code works on anything but Linux.
>> >>
>> >> Sharing the context code is unlikely to happen. Usually the toolkit
>> >> (GTK, SDL, or Cocoa in my fork) knows what graphics accelerator shoul=
d
>> >> be used and how the context should be created for a particular window=
.
>> >> The context sharing can be achieved only for headless displays, namel=
y
>> >> dbus, egl-headless and spice. Few people would want to use them in
>> >> combination.
>> >
>> >
>> > Ok for toolkits, they usually have their own context. But ideally, qem=
u should be "headless". And the GL contexts should be working on other syst=
ems than EGL Linux.
>> >
>> > Any of the spice, vnc, dbus display etc may legitimately be fixed to w=
ork with WGL etc. Doing this repeatedly on the various display backends wou=
ld be bad design.
>>
>> We already have ui/egl-context.c to share the code for EGL. We can
>> have ui/headless-context.c or something which creates a context for
>> headless but the implementation can be anything proper there. It
>> doesn't require modifying ui/console.c or adding something like
>> "-object egl-context".
>
>
> Agree, as long as you have only a single context provider per system.  Bu=
t that's not my experience with GL in the past. Maybe this is true today.

It doesn't matter even if a system has multiple context providers.
ui/headless-context.c may just choose the context provider according
to the flag a user provided.

>
>>
>> >
>> > Although my idea is that display servers (spice, vnc, rdp, etc) & vari=
ous UI (gtk, cocoa, sdl, etc) should be outside of qemu. The display would =
use IPC, based on DBus if it fits the job, or something else if necessary. =
Obviously, there is still a lot of work to do to improve surface & texture =
sharing and portability, but that should be possible...
>>
>> Maybe we can rework the present UIs of QEMU to make them compatible
>> with both in-process communication and D-Bus inter-process
>> communication. If the user has a requirement incompatible with IPC
>> (e.g. OpenGL on macOS), the user can opt for in-process communication.
>> D-Bus would be used otherwise. (Of course that would require
>> substantial effort.)
>
>
> That should be possible, as long the IPC is very close to the inner qemu =
API, we could have an IPC-based display code turned into a shared library i=
nstead and run in process.

That is exactly what I'm thinking of.

> Although I think that would limit the kind of UI you can expect (it would=
 be a bare display, like qemu-display today, not something that would bring=
 you a full user-friendly UI, virt-manager/Boxes kind)

I don't think QEMU has to provide anything fancier than the current
UIs. Users can combine QEMU and the external UI implementation like
virt-manager, which allows the UI to evolve in a separate way. The UIs
in QEMU would remain as references.

>
>
>>
>> >
>> >>
>> >>
>> >> >
>> >> >>
>> >> >> Anything else should be addressed with this patch series. (And it =
also
>> >> >> has nice fixes for shader leaks.)
>> >> >
>> >> >
>> >> > thanks
>> >> >
>> >> >>
>> >> >>
>> >> >> cocoa doesn't have OpenGL output and egl-headless, the cause of ma=
ny
>> >> >> pains addressed here, does not work on macOS so you need little
>> >> >> attention. I have an out-of-tree OpenGL support for cocoa but it i=
s
>> >> >> out-of-tree anyway and I can fix it anytime.
>> >> >
>> >> >
>> >> > Great!
>> >> >
>> >> > btw, I suppose you checked your DBus changes against the WIP "qemu-=
display" project. What was your experience? I don't think many people have =
tried it yet. Do you think this could be made to work on macOS? at least th=
e non-dmabuf support should work, as long as Gtk4 has good macOS support. I=
 don't know if dmabuf or similar exist there, any idea?
>> >>
>> >> I tested it on Fedora. I think it would probably work on macOS but
>> >> maybe require some tweaks. IOSurface is a counterpart of DMA-BUF in
>> >> macOS but its situation is bad; it must be delivered via macOS's own
>> >> IPC mechanisms (Mach port and XPC), but they are for server-client
>> >> model and not for P2P. fileport mechanism allows to convert Mach port
>> >> to file descriptor, but it is not documented. (In reality, I think al=
l
>> >> of the major browsers, Chromium, Firefox and Safari use fileport for
>> >> this purpose. Apple should really document it if they use it for thei=
r
>> >> app.) It is also possible to share IOSurface with a global number, bu=
t
>> >> it can be brute-forced and is insecure.
>> >>
>> >
>> > Thanks, the Gtk developers might have some clue. They have been workin=
g on improving macOS support, and it can use opengl now (https://blogs.gnom=
e.org/chergert/2020/12/15/gtk-4-got-a-new-macos-backend-now-with-opengl/).
>>
>> They don't need IPC for passing textures so that is a different story.
>
>
> Yes but they have web-engine and video decoding concerns (beside qemu/dma=
buf gtk display they should be aware of).  I'll try to reach Christian abou=
t it.
>
> thanks
>
>>
>> >
>> >>
>> >> Regards,
>> >> Akihiko Odaki
>> >>
>> >> >
>> >> >
>> >> > --
>> >> > Marc-Andr=C3=A9 Lureau
>> >
>> >
>> >
>> > --
>> > Marc-Andr=C3=A9 Lureau
>
>
>
> --
> Marc-Andr=C3=A9 Lureau

